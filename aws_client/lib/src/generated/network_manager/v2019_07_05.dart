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

/// Amazon Web Services enables you to centrally manage your Amazon Web Services
/// Cloud WAN core network and your Transit Gateway network across Amazon Web
/// Services accounts, Regions, and on-premises locations.
class NetworkManager {
  final _s.RestJsonProtocol _protocol;
  NetworkManager({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Accepts a core network attachment request.
  ///
  /// Once the attachment request is accepted by a core network owner, the
  /// attachment is created and connected to a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment.
  Future<AcceptAttachmentResponse> acceptAttachment({
    required String attachmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/attachments/${Uri.encodeComponent(attachmentId)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptAttachmentResponse.fromJson(response);
  }

  /// Associates a core network Connect peer with a device and optionally, with
  /// a link.
  ///
  /// If you specify a link, it must be associated with the specified device.
  /// You can only associate core network Connect peers that have been created
  /// on a core network Connect attachment on a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectPeerId] :
  /// The ID of the Connect peer.
  ///
  /// Parameter [deviceId] :
  /// The ID of the device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of your global network.
  ///
  /// Parameter [linkId] :
  /// The ID of the link.
  Future<AssociateConnectPeerResponse> associateConnectPeer({
    required String connectPeerId,
    required String deviceId,
    required String globalNetworkId,
    String? linkId,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectPeerId': connectPeerId,
      'DeviceId': deviceId,
      if (linkId != null) 'LinkId': linkId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connect-peer-associations',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateConnectPeerResponse.fromJson(response);
  }

  /// Associates a customer gateway with a device and optionally, with a link.
  /// If you specify a link, it must be associated with the specified device.
  ///
  /// You can only associate customer gateways that are connected to a VPN
  /// attachment on a transit gateway or core network registered in your global
  /// network. When you register a transit gateway or core network, customer
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
  /// The Amazon Resource Name (ARN) of the customer gateway.
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

  /// Creates a core network Connect attachment from a specified core network
  /// attachment.
  ///
  /// A core network Connect attachment is a GRE-based tunnel attachment that
  /// you can use to establish a connection between a core network and an
  /// appliance. A core network Connect attachment uses an existing VPC
  /// attachment as the underlying transport mechanism.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network where you want to create the attachment.
  ///
  /// Parameter [edgeLocation] :
  /// The Region where the edge is located.
  ///
  /// Parameter [options] :
  /// Options for creating an attachment.
  ///
  /// Parameter [transportAttachmentId] :
  /// The ID of the attachment between the two connections.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [tags] :
  /// The list of key-value tags associated with the request.
  Future<CreateConnectAttachmentResponse> createConnectAttachment({
    required String coreNetworkId,
    required String edgeLocation,
    required ConnectAttachmentOptions options,
    required String transportAttachmentId,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CoreNetworkId': coreNetworkId,
      'EdgeLocation': edgeLocation,
      'Options': options,
      'TransportAttachmentId': transportAttachmentId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/connect-attachments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectAttachmentResponse.fromJson(response);
  }

  /// Creates a core network Connect peer for a specified core network connect
  /// attachment between a core network and an appliance. The peer address and
  /// transit gateway address must be the same IP address family (IPv4 or IPv6).
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectAttachmentId] :
  /// The ID of the connection attachment.
  ///
  /// Parameter [peerAddress] :
  /// The Connect peer address.
  ///
  /// Parameter [bgpOptions] :
  /// The Connect peer BGP options.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [coreNetworkAddress] :
  /// A Connect peer core network address.
  ///
  /// Parameter [insideCidrBlocks] :
  /// The inside IP addresses used for BGP peering.
  ///
  /// Parameter [subnetArn] :
  /// The subnet ARN for the Connect peer.
  ///
  /// Parameter [tags] :
  /// The tags associated with the peer request.
  Future<CreateConnectPeerResponse> createConnectPeer({
    required String connectAttachmentId,
    required String peerAddress,
    BgpOptions? bgpOptions,
    String? clientToken,
    String? coreNetworkAddress,
    List<String>? insideCidrBlocks,
    String? subnetArn,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ConnectAttachmentId': connectAttachmentId,
      'PeerAddress': peerAddress,
      if (bgpOptions != null) 'BgpOptions': bgpOptions,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (coreNetworkAddress != null) 'CoreNetworkAddress': coreNetworkAddress,
      if (insideCidrBlocks != null) 'InsideCidrBlocks': insideCidrBlocks,
      if (subnetArn != null) 'SubnetArn': subnetArn,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/connect-peers',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConnectPeerResponse.fromJson(response);
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

  /// Creates a core network as part of your global network, and optionally,
  /// with a core network policy.
  ///
  /// May throw [CoreNetworkPolicyException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network that a core network will be a part of.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with a core network request.
  ///
  /// Parameter [description] :
  /// The description of a core network.
  ///
  /// Parameter [policyDocument] :
  /// The policy document for creating a core network.
  ///
  /// Parameter [tags] :
  /// Key-value tags associated with a core network request.
  Future<CreateCoreNetworkResponse> createCoreNetwork({
    required String globalNetworkId,
    String? clientToken,
    String? description,
    String? policyDocument,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'GlobalNetworkId': globalNetworkId,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (policyDocument != null) 'PolicyDocument': policyDocument,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/core-networks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCoreNetworkResponse.fromJson(response);
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
  /// The Amazon Web Services location of the device, if applicable. For an
  /// on-premises device, you can omit this parameter.
  ///
  /// Parameter [description] :
  /// A description of the device.
  ///
  /// Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [location] :
  /// The location of the device.
  ///
  /// Parameter [model] :
  /// The model of the device.
  ///
  /// Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [serialNumber] :
  /// The serial number of the device.
  ///
  /// Constraints: Maximum length of 128 characters.
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
  /// Constraints: Maximum length of 128 characters.
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
  /// Constraints: Maximum length of 256 characters.
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
  /// Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [provider] :
  /// The provider of the link.
  ///
  /// Constraints: Maximum length of 128 characters. Cannot include the
  /// following characters: | \ ^
  ///
  /// Parameter [tags] :
  /// The tags to apply to the resource during creation.
  ///
  /// Parameter [type] :
  /// The type of the link.
  ///
  /// Constraints: Maximum length of 128 characters. Cannot include the
  /// following characters: | \ ^
  Future<CreateLinkResponse> createLink({
    required Bandwidth bandwidth,
    required String globalNetworkId,
    required String siteId,
    String? description,
    String? provider,
    List<Tag>? tags,
    String? type,
  }) async {
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
  /// Constraints: Maximum length of 256 characters.
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

  /// Creates an Amazon Web Services site-to-site VPN attachment on an edge
  /// location of a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network where you're creating a site-to-site VPN
  /// attachment.
  ///
  /// Parameter [vpnConnectionArn] :
  /// The ARN identifying the VPN attachment.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [tags] :
  /// The tags associated with the request.
  Future<CreateSiteToSiteVpnAttachmentResponse> createSiteToSiteVpnAttachment({
    required String coreNetworkId,
    required String vpnConnectionArn,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CoreNetworkId': coreNetworkId,
      'VpnConnectionArn': vpnConnectionArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/site-to-site-vpn-attachments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSiteToSiteVpnAttachmentResponse.fromJson(response);
  }

  /// Creates a transit gateway peering connection.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [transitGatewayArn] :
  /// The ARN of the transit gateway for the peering request.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [tags] :
  /// The list of key-value tags associated with the request.
  Future<CreateTransitGatewayPeeringResponse> createTransitGatewayPeering({
    required String coreNetworkId,
    required String transitGatewayArn,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CoreNetworkId': coreNetworkId,
      'TransitGatewayArn': transitGatewayArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/transit-gateway-peerings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTransitGatewayPeeringResponse.fromJson(response);
  }

  /// Creates a transit gateway route table attachment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [peeringId] :
  /// The ID of the peer for the
  ///
  /// Parameter [transitGatewayRouteTableArn] :
  /// The ARN of the transit gateway route table for the attachment request. For
  /// example, <code>"TransitGatewayRouteTableArn":
  /// "arn:aws:ec2:us-west-2:123456789012:transit-gateway-route-table/tgw-rtb-9876543210123456"</code>.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [tags] :
  /// The list of key-value tags associated with the request.
  Future<CreateTransitGatewayRouteTableAttachmentResponse>
      createTransitGatewayRouteTableAttachment({
    required String peeringId,
    required String transitGatewayRouteTableArn,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'PeeringId': peeringId,
      'TransitGatewayRouteTableArn': transitGatewayRouteTableArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/transit-gateway-route-table-attachments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTransitGatewayRouteTableAttachmentResponse.fromJson(response);
  }

  /// Creates a VPC attachment on an edge location of a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network for the VPC attachment.
  ///
  /// Parameter [subnetArns] :
  /// The subnet ARN of the VPC attachment.
  ///
  /// Parameter [vpcArn] :
  /// The ARN of the VPC.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [options] :
  /// Options for the VPC attachment.
  ///
  /// Parameter [tags] :
  /// The key-value tags associated with the request.
  Future<CreateVpcAttachmentResponse> createVpcAttachment({
    required String coreNetworkId,
    required List<String> subnetArns,
    required String vpcArn,
    String? clientToken,
    VpcOptions? options,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'CoreNetworkId': coreNetworkId,
      'SubnetArns': subnetArns,
      'VpcArn': vpcArn,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (options != null) 'Options': options,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/vpc-attachments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVpcAttachmentResponse.fromJson(response);
  }

  /// Deletes an attachment. Supports all attachment types.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment to delete.
  Future<DeleteAttachmentResponse> deleteAttachment({
    required String attachmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/attachments/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAttachmentResponse.fromJson(response);
  }

  /// Deletes a Connect peer.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectPeerId] :
  /// The ID of the deleted Connect peer.
  Future<DeleteConnectPeerResponse> deleteConnectPeer({
    required String connectPeerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/connect-peers/${Uri.encodeComponent(connectPeerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConnectPeerResponse.fromJson(response);
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConnectionResponse.fromJson(response);
  }

  /// Deletes a core network along with all core network policies. This can only
  /// be done if there are no attachments on a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The network ID of the deleted core network.
  Future<DeleteCoreNetworkResponse> deleteCoreNetwork({
    required String coreNetworkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/core-networks/${Uri.encodeComponent(coreNetworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCoreNetworkResponse.fromJson(response);
  }

  /// Deletes a policy version from a core network. You can't delete the current
  /// LIVE policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network for the deleted policy.
  ///
  /// Parameter [policyVersionId] :
  /// The version ID of the deleted policy.
  Future<DeleteCoreNetworkPolicyVersionResponse>
      deleteCoreNetworkPolicyVersion({
    required String coreNetworkId,
    required int policyVersionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-policy-versions/${Uri.encodeComponent(policyVersionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCoreNetworkPolicyVersionResponse.fromJson(response);
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
  /// network objects (devices, links, and sites), deregister all transit
  /// gateways, and delete any core networks.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/links/${Uri.encodeComponent(linkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLinkResponse.fromJson(response);
  }

  /// Deletes an existing peering connection.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [peeringId] :
  /// The ID of the peering connection to delete.
  Future<DeletePeeringResponse> deletePeering({
    required String peeringId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/peerings/${Uri.encodeComponent(peeringId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePeeringResponse.fromJson(response);
  }

  /// Deletes a resource policy for the specified resource. This revokes the
  /// access of the principals specified in the resource policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the policy to delete.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/resource-policy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
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

  /// Disassociates a core network Connect peer from a device and a link.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectPeerId] :
  /// The ID of the Connect peer to disassociate from a device.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  Future<DisassociateConnectPeerResponse> disassociateConnectPeer({
    required String connectPeerId,
    required String globalNetworkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connect-peer-associations/${Uri.encodeComponent(connectPeerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateConnectPeerResponse.fromJson(response);
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
  /// The Amazon Resource Name (ARN) of the customer gateway.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  Future<DisassociateCustomerGatewayResponse> disassociateCustomerGateway({
    required String customerGatewayArn,
    required String globalNetworkId,
  }) async {
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/transit-gateway-connect-peer-associations/${Uri.encodeComponent(transitGatewayConnectPeerArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateTransitGatewayConnectPeerResponse.fromJson(response);
  }

  /// Executes a change set on your core network. Deploys changes globally based
  /// on the policy submitted..
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [policyVersionId] :
  /// The ID of the policy version.
  Future<void> executeCoreNetworkChangeSet({
    required String coreNetworkId,
    required int policyVersionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-change-sets/${Uri.encodeComponent(policyVersionId.toString())}/execute',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a core network Connect attachment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment.
  Future<GetConnectAttachmentResponse> getConnectAttachment({
    required String attachmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connect-attachments/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectAttachmentResponse.fromJson(response);
  }

  /// Returns information about a core network Connect peer.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectPeerId] :
  /// The ID of the Connect peer.
  Future<GetConnectPeerResponse> getConnectPeer({
    required String connectPeerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connect-peers/${Uri.encodeComponent(connectPeerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectPeerResponse.fromJson(response);
  }

  /// Returns information about a core network Connect peer associations.
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
  /// Parameter [connectPeerIds] :
  /// The IDs of the Connect peers.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<GetConnectPeerAssociationsResponse> getConnectPeerAssociations({
    required String globalNetworkId,
    List<String>? connectPeerIds,
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
      if (connectPeerIds != null) 'connectPeerIds': connectPeerIds,
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/connect-peer-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectPeerAssociationsResponse.fromJson(response);
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

  /// Returns information about the LIVE policy for a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  Future<GetCoreNetworkResponse> getCoreNetwork({
    required String coreNetworkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/core-networks/${Uri.encodeComponent(coreNetworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreNetworkResponse.fromJson(response);
  }

  /// Returns information about a core network change event.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [policyVersionId] :
  /// The ID of the policy version.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<GetCoreNetworkChangeEventsResponse> getCoreNetworkChangeEvents({
    required String coreNetworkId,
    required int policyVersionId,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-change-events/${Uri.encodeComponent(policyVersionId.toString())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreNetworkChangeEventsResponse.fromJson(response);
  }

  /// Returns a change set between the LIVE core network policy and a submitted
  /// policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [policyVersionId] :
  /// The ID of the policy version.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<GetCoreNetworkChangeSetResponse> getCoreNetworkChangeSet({
    required String coreNetworkId,
    required int policyVersionId,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-change-sets/${Uri.encodeComponent(policyVersionId.toString())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreNetworkChangeSetResponse.fromJson(response);
  }

  /// Returns details about a core network policy. You can get details about
  /// your current live policy or any previous policy version.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [alias] :
  /// The alias of a core network policy
  ///
  /// Parameter [policyVersionId] :
  /// The ID of a core network policy version.
  Future<GetCoreNetworkPolicyResponse> getCoreNetworkPolicy({
    required String coreNetworkId,
    CoreNetworkPolicyAlias? alias,
    int? policyVersionId,
  }) async {
    final $query = <String, List<String>>{
      if (alias != null) 'alias': [alias.toValue()],
      if (policyVersionId != null)
        'policyVersionId': [policyVersionId.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetCoreNetworkPolicyResponse.fromJson(response);
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
  /// One or more customer gateway Amazon Resource Names (ARNs). The maximum is
  /// 10.
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

  /// Gets the count of network resources, by resource type, for the specified
  /// global network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
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
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// The following are the supported resource types for Direct Connect:
  ///
  /// <ul>
  /// <li>
  /// <code>dxcon</code>
  /// </li>
  /// <li>
  /// <code>dx-gateway</code>
  /// </li>
  /// <li>
  /// <code>dx-vif</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Network Manager:
  ///
  /// <ul>
  /// <li>
  /// <code>connection</code>
  /// </li>
  /// <li>
  /// <code>device</code>
  /// </li>
  /// <li>
  /// <code>link</code>
  /// </li>
  /// <li>
  /// <code>site</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Amazon VPC:
  ///
  /// <ul>
  /// <li>
  /// <code>customer-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-attachment</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-connect-peer</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-route-table</code>
  /// </li>
  /// <li>
  /// <code>vpn-connection</code>
  /// </li>
  /// </ul>
  Future<GetNetworkResourceCountsResponse> getNetworkResourceCounts({
    required String globalNetworkId,
    int? maxResults,
    String? nextToken,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceType != null) 'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/network-resource-count',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkResourceCountsResponse.fromJson(response);
  }

  /// Gets the network resource relationships for the specified global network.
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
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID.
  ///
  /// Parameter [awsRegion] :
  /// The Amazon Web Services Region.
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [registeredGatewayArn] :
  /// The ARN of the registered gateway.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the gateway.
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// The following are the supported resource types for Direct Connect:
  ///
  /// <ul>
  /// <li>
  /// <code>dxcon</code>
  /// </li>
  /// <li>
  /// <code>dx-gateway</code>
  /// </li>
  /// <li>
  /// <code>dx-vif</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Network Manager:
  ///
  /// <ul>
  /// <li>
  /// <code>connection</code>
  /// </li>
  /// <li>
  /// <code>device</code>
  /// </li>
  /// <li>
  /// <code>link</code>
  /// </li>
  /// <li>
  /// <code>site</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Amazon VPC:
  ///
  /// <ul>
  /// <li>
  /// <code>customer-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-attachment</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-connect-peer</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-route-table</code>
  /// </li>
  /// <li>
  /// <code>vpn-connection</code>
  /// </li>
  /// </ul>
  Future<GetNetworkResourceRelationshipsResponse>
      getNetworkResourceRelationships({
    required String globalNetworkId,
    String? accountId,
    String? awsRegion,
    String? coreNetworkId,
    int? maxResults,
    String? nextToken,
    String? registeredGatewayArn,
    String? resourceArn,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'accountId': [accountId],
      if (awsRegion != null) 'awsRegion': [awsRegion],
      if (coreNetworkId != null) 'coreNetworkId': [coreNetworkId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (registeredGatewayArn != null)
        'registeredGatewayArn': [registeredGatewayArn],
      if (resourceArn != null) 'resourceArn': [resourceArn],
      if (resourceType != null) 'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/network-resource-relationships',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkResourceRelationshipsResponse.fromJson(response);
  }

  /// Describes the network resources for the specified global network.
  ///
  /// The results include information from the corresponding Describe call for
  /// the resource, minus any sensitive information such as pre-shared keys.
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
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID.
  ///
  /// Parameter [awsRegion] :
  /// The Amazon Web Services Region.
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [registeredGatewayArn] :
  /// The ARN of the gateway.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// The following are the supported resource types for Direct Connect:
  ///
  /// <ul>
  /// <li>
  /// <code>dxcon</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_Connection.html">Connection</a>.
  /// </li>
  /// <li>
  /// <code>dx-gateway</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_DirectConnectGateway.html">DirectConnectGateway</a>.
  /// </li>
  /// <li>
  /// <code>dx-vif</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_VirtualInterface.html">VirtualInterface</a>.
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Network Manager:
  ///
  /// <ul>
  /// <li>
  /// <code>connection</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/networkmanager/latest/APIReference/API_Connection.html">Connection</a>.
  /// </li>
  /// <li>
  /// <code>device</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/networkmanager/latest/APIReference/API_Device.html">Device</a>.
  /// </li>
  /// <li>
  /// <code>link</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/networkmanager/latest/APIReference/API_Link.html">Link</a>.
  /// </li>
  /// <li>
  /// <code>site</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/networkmanager/latest/APIReference/API_Site.html">Site</a>.
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Amazon VPC:
  ///
  /// <ul>
  /// <li>
  /// <code>customer-gateway</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CustomerGateway.html">CustomerGateway</a>.
  /// </li>
  /// <li>
  /// <code>transit-gateway</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_TransitGateway.html">TransitGateway</a>.
  /// </li>
  /// <li>
  /// <code>transit-gateway-attachment</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_TransitGatewayAttachment.html">TransitGatewayAttachment</a>.
  /// </li>
  /// <li>
  /// <code>transit-gateway-connect-peer</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_TransitGatewayConnectPeer.html">TransitGatewayConnectPeer</a>.
  /// </li>
  /// <li>
  /// <code>transit-gateway-route-table</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_TransitGatewayRouteTable.html">TransitGatewayRouteTable</a>.
  /// </li>
  /// <li>
  /// <code>vpn-connection</code> - The definition model is <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_VpnConnection.html">VpnConnection</a>.
  /// </li>
  /// </ul>
  Future<GetNetworkResourcesResponse> getNetworkResources({
    required String globalNetworkId,
    String? accountId,
    String? awsRegion,
    String? coreNetworkId,
    int? maxResults,
    String? nextToken,
    String? registeredGatewayArn,
    String? resourceArn,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'accountId': [accountId],
      if (awsRegion != null) 'awsRegion': [awsRegion],
      if (coreNetworkId != null) 'coreNetworkId': [coreNetworkId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (registeredGatewayArn != null)
        'registeredGatewayArn': [registeredGatewayArn],
      if (resourceArn != null) 'resourceArn': [resourceArn],
      if (resourceType != null) 'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/network-resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkResourcesResponse.fromJson(response);
  }

  /// Gets the network routes of the specified global network.
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
  /// Parameter [routeTableIdentifier] :
  /// The ID of the route table.
  ///
  /// Parameter [destinationFilters] :
  /// Filter by route table destination. Possible Values:
  /// TRANSIT_GATEWAY_ATTACHMENT_ID, RESOURCE_ID, or RESOURCE_TYPE.
  ///
  /// Parameter [exactCidrMatches] :
  /// An exact CIDR block.
  ///
  /// Parameter [longestPrefixMatches] :
  /// The most specific route that matches the traffic (longest prefix match).
  ///
  /// Parameter [prefixListIds] :
  /// The IDs of the prefix lists.
  ///
  /// Parameter [states] :
  /// The route states.
  ///
  /// Parameter [subnetOfMatches] :
  /// The routes with a subnet that match the specified CIDR filter.
  ///
  /// Parameter [supernetOfMatches] :
  /// The routes with a CIDR that encompasses the CIDR filter. Example: If you
  /// specify 10.0.1.0/30, then the result returns 10.0.1.0/29.
  ///
  /// Parameter [types] :
  /// The route types.
  Future<GetNetworkRoutesResponse> getNetworkRoutes({
    required String globalNetworkId,
    required RouteTableIdentifier routeTableIdentifier,
    Map<String, List<String>>? destinationFilters,
    List<String>? exactCidrMatches,
    List<String>? longestPrefixMatches,
    List<String>? prefixListIds,
    List<RouteState>? states,
    List<String>? subnetOfMatches,
    List<String>? supernetOfMatches,
    List<RouteType>? types,
  }) async {
    final $payload = <String, dynamic>{
      'RouteTableIdentifier': routeTableIdentifier,
      if (destinationFilters != null) 'DestinationFilters': destinationFilters,
      if (exactCidrMatches != null) 'ExactCidrMatches': exactCidrMatches,
      if (longestPrefixMatches != null)
        'LongestPrefixMatches': longestPrefixMatches,
      if (prefixListIds != null) 'PrefixListIds': prefixListIds,
      if (states != null) 'States': states.map((e) => e.toValue()).toList(),
      if (subnetOfMatches != null) 'SubnetOfMatches': subnetOfMatches,
      if (supernetOfMatches != null) 'SupernetOfMatches': supernetOfMatches,
      if (types != null) 'Types': types.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/network-routes',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkRoutesResponse.fromJson(response);
  }

  /// Gets the network telemetry of the specified global network.
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
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID.
  ///
  /// Parameter [awsRegion] :
  /// The Amazon Web Services Region.
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [registeredGatewayArn] :
  /// The ARN of the gateway.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// The following are the supported resource types for Direct Connect:
  ///
  /// <ul>
  /// <li>
  /// <code>dxcon</code>
  /// </li>
  /// <li>
  /// <code>dx-gateway</code>
  /// </li>
  /// <li>
  /// <code>dx-vif</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Network Manager:
  ///
  /// <ul>
  /// <li>
  /// <code>connection</code>
  /// </li>
  /// <li>
  /// <code>device</code>
  /// </li>
  /// <li>
  /// <code>link</code>
  /// </li>
  /// <li>
  /// <code>site</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Amazon VPC:
  ///
  /// <ul>
  /// <li>
  /// <code>customer-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-attachment</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-connect-peer</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-route-table</code>
  /// </li>
  /// <li>
  /// <code>vpn-connection</code>
  /// </li>
  /// </ul>
  Future<GetNetworkTelemetryResponse> getNetworkTelemetry({
    required String globalNetworkId,
    String? accountId,
    String? awsRegion,
    String? coreNetworkId,
    int? maxResults,
    String? nextToken,
    String? registeredGatewayArn,
    String? resourceArn,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'accountId': [accountId],
      if (awsRegion != null) 'awsRegion': [awsRegion],
      if (coreNetworkId != null) 'coreNetworkId': [coreNetworkId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (registeredGatewayArn != null)
        'registeredGatewayArn': [registeredGatewayArn],
      if (resourceArn != null) 'resourceArn': [resourceArn],
      if (resourceType != null) 'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/network-telemetry',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkTelemetryResponse.fromJson(response);
  }

  /// Returns information about a resource policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resource-policy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Gets information about the specified route analysis.
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
  /// Parameter [routeAnalysisId] :
  /// The ID of the route analysis.
  Future<GetRouteAnalysisResponse> getRouteAnalysis({
    required String globalNetworkId,
    required String routeAnalysisId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/route-analyses/${Uri.encodeComponent(routeAnalysisId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRouteAnalysisResponse.fromJson(response);
  }

  /// Returns information about a site-to-site VPN attachment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment.
  Future<GetSiteToSiteVpnAttachmentResponse> getSiteToSiteVpnAttachment({
    required String attachmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/site-to-site-vpn-attachments/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSiteToSiteVpnAttachmentResponse.fromJson(response);
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

  /// Returns information about a transit gateway peer.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [peeringId] :
  /// The ID of the peering request.
  Future<GetTransitGatewayPeeringResponse> getTransitGatewayPeering({
    required String peeringId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/transit-gateway-peerings/${Uri.encodeComponent(peeringId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTransitGatewayPeeringResponse.fromJson(response);
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

  /// Returns information about a transit gateway route table attachment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the transit gateway route table attachment.
  Future<GetTransitGatewayRouteTableAttachmentResponse>
      getTransitGatewayRouteTableAttachment({
    required String attachmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/transit-gateway-route-table-attachments/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTransitGatewayRouteTableAttachmentResponse.fromJson(response);
  }

  /// Returns information about a VPC attachment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment.
  Future<GetVpcAttachmentResponse> getVpcAttachment({
    required String attachmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/vpc-attachments/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVpcAttachmentResponse.fromJson(response);
  }

  /// Returns a list of core network attachments.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentType] :
  /// The type of attachment.
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [edgeLocation] :
  /// The Region where the edge is located.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [state] :
  /// The state of the attachment.
  Future<ListAttachmentsResponse> listAttachments({
    AttachmentType? attachmentType,
    String? coreNetworkId,
    String? edgeLocation,
    int? maxResults,
    String? nextToken,
    AttachmentState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (attachmentType != null) 'attachmentType': [attachmentType.toValue()],
      if (coreNetworkId != null) 'coreNetworkId': [coreNetworkId],
      if (edgeLocation != null) 'edgeLocation': [edgeLocation],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (state != null) 'state': [state.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/attachments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttachmentsResponse.fromJson(response);
  }

  /// Returns a list of core network Connect peers.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectAttachmentId] :
  /// The ID of the attachment.
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListConnectPeersResponse> listConnectPeers({
    String? connectAttachmentId,
    String? coreNetworkId,
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
      if (connectAttachmentId != null)
        'connectAttachmentId': [connectAttachmentId],
      if (coreNetworkId != null) 'coreNetworkId': [coreNetworkId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connect-peers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectPeersResponse.fromJson(response);
  }

  /// Returns a list of core network policy versions.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListCoreNetworkPolicyVersionsResponse> listCoreNetworkPolicyVersions({
    required String coreNetworkId,
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-policy-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCoreNetworkPolicyVersionsResponse.fromJson(response);
  }

  /// Returns a list of owned and shared core networks.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListCoreNetworksResponse> listCoreNetworks({
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/core-networks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCoreNetworksResponse.fromJson(response);
  }

  /// Gets the status of the Service Linked Role (SLR) deployment for the
  /// accounts in a given Amazon Web Services Organization.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListOrganizationServiceAccessStatusResponse>
      listOrganizationServiceAccessStatus({
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
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/organizations/service-access',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrganizationServiceAccessStatusResponse.fromJson(response);
  }

  /// Lists the peerings for a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [edgeLocation] :
  /// Returns a list edge locations for the
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [peeringType] :
  /// Returns a list of a peering requests.
  ///
  /// Parameter [state] :
  /// Returns a list of the peering request states.
  Future<ListPeeringsResponse> listPeerings({
    String? coreNetworkId,
    String? edgeLocation,
    int? maxResults,
    String? nextToken,
    PeeringType? peeringType,
    PeeringState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (coreNetworkId != null) 'coreNetworkId': [coreNetworkId],
      if (edgeLocation != null) 'edgeLocation': [edgeLocation],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (peeringType != null) 'peeringType': [peeringType.toValue()],
      if (state != null) 'state': [state.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/peerings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPeeringsResponse.fromJson(response);
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Creates a new, immutable version of a core network policy. A subsequent
  /// change set is created showing the differences between the LIVE policy and
  /// the submitted policy.
  ///
  /// May throw [CoreNetworkPolicyException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [policyDocument] :
  /// The policy document.
  ///
  /// Parameter [clientToken] :
  /// The client token associated with the request.
  ///
  /// Parameter [description] :
  /// a core network policy description.
  ///
  /// Parameter [latestVersionId] :
  /// The ID of a core network policy.
  Future<PutCoreNetworkPolicyResponse> putCoreNetworkPolicy({
    required String coreNetworkId,
    required Object policyDocument,
    String? clientToken,
    String? description,
    int? latestVersionId,
  }) async {
    final $payload = <String, dynamic>{
      'PolicyDocument': jsonEncode(policyDocument),
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (latestVersionId != null) 'LatestVersionId': latestVersionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutCoreNetworkPolicyResponse.fromJson(response);
  }

  /// Creates or updates a resource policy.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON resource policy document.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource policy.
  Future<void> putResourcePolicy({
    required Object policyDocument,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'PolicyDocument': jsonEncode(policyDocument),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resource-policy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Registers a transit gateway in your global network. Not all Regions
  /// support transit gateways for global networks. For a list of the supported
  /// Regions, see <a
  /// href="https://docs.aws.amazon.com/network-manager/latest/tgwnm/what-are-global-networks.html#nm-available-regions">Region
  /// Availability</a> in the <i>Amazon Web Services Transit Gateways for Global
  /// Networks User Guide</i>. The transit gateway can be in any of the
  /// supported Amazon Web Services Regions, but it must be owned by the same
  /// Amazon Web Services account that owns the global network. You cannot
  /// register a transit gateway in more than one global network.
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
  Future<RegisterTransitGatewayResponse> registerTransitGateway({
    required String globalNetworkId,
    required String transitGatewayArn,
  }) async {
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

  /// Rejects a core network attachment request.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment.
  Future<RejectAttachmentResponse> rejectAttachment({
    required String attachmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/attachments/${Uri.encodeComponent(attachmentId)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectAttachmentResponse.fromJson(response);
  }

  /// Restores a previous policy version as a new, immutable version of a core
  /// network policy. A subsequent change set is created showing the differences
  /// between the LIVE policy and restored policy.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [policyVersionId] :
  /// The ID of the policy version to restore.
  Future<RestoreCoreNetworkPolicyVersionResponse>
      restoreCoreNetworkPolicyVersion({
    required String coreNetworkId,
    required int policyVersionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/core-networks/${Uri.encodeComponent(coreNetworkId)}/core-network-policy-versions/${Uri.encodeComponent(policyVersionId.toString())}/restore',
      exceptionFnMap: _exceptionFns,
    );
    return RestoreCoreNetworkPolicyVersionResponse.fromJson(response);
  }

  /// Enables the Network Manager service for an Amazon Web Services
  /// Organization. This can only be called by a management account within the
  /// organization.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [action] :
  /// The action to take for the update request. This can be either
  /// <code>ENABLE</code> or <code>DISABLE</code>.
  Future<StartOrganizationServiceAccessUpdateResponse>
      startOrganizationServiceAccessUpdate({
    required String action,
  }) async {
    final $payload = <String, dynamic>{
      'Action': action,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/organizations/service-access',
      exceptionFnMap: _exceptionFns,
    );
    return StartOrganizationServiceAccessUpdateResponse.fromJson(response);
  }

  /// Starts analyzing the routing path between the specified source and
  /// destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/tgw/route-analyzer.html">Route
  /// Analyzer</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [destination] :
  /// The destination.
  ///
  /// Parameter [globalNetworkId] :
  /// The ID of the global network.
  ///
  /// Parameter [source] :
  /// The source from which traffic originates.
  ///
  /// Parameter [includeReturnPath] :
  /// Indicates whether to analyze the return path. The default is
  /// <code>false</code>.
  ///
  /// Parameter [useMiddleboxes] :
  /// Indicates whether to include the location of middlebox appliances in the
  /// route analysis. The default is <code>false</code>.
  Future<StartRouteAnalysisResponse> startRouteAnalysis({
    required RouteAnalysisEndpointOptionsSpecification destination,
    required String globalNetworkId,
    required RouteAnalysisEndpointOptionsSpecification source,
    bool? includeReturnPath,
    bool? useMiddleboxes,
  }) async {
    final $payload = <String, dynamic>{
      'Destination': destination,
      'Source': source,
      if (includeReturnPath != null) 'IncludeReturnPath': includeReturnPath,
      if (useMiddleboxes != null) 'UseMiddleboxes': useMiddleboxes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/route-analyses',
      exceptionFnMap: _exceptionFns,
    );
    return StartRouteAnalysisResponse.fromJson(response);
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

  /// Updates the description of a core network.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [coreNetworkId] :
  /// The ID of a core network.
  ///
  /// Parameter [description] :
  /// The description of the update.
  Future<UpdateCoreNetworkResponse> updateCoreNetwork({
    required String coreNetworkId,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/core-networks/${Uri.encodeComponent(coreNetworkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCoreNetworkResponse.fromJson(response);
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
  /// The Amazon Web Services location of the device, if applicable. For an
  /// on-premises device, you can omit this parameter.
  ///
  /// Parameter [description] :
  /// A description of the device.
  ///
  /// Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [model] :
  /// The model of the device.
  ///
  /// Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [serialNumber] :
  /// The serial number of the device.
  ///
  /// Constraints: Maximum length of 128 characters.
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
  /// Constraints: Maximum length of 128 characters.
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
  /// Constraints: Maximum length of 256 characters.
  Future<UpdateGlobalNetworkResponse> updateGlobalNetwork({
    required String globalNetworkId,
    String? description,
  }) async {
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
  /// Constraints: Maximum length of 256 characters.
  ///
  /// Parameter [provider] :
  /// The provider of the link.
  ///
  /// Constraints: Maximum length of 128 characters.
  ///
  /// Parameter [type] :
  /// The type of the link.
  ///
  /// Constraints: Maximum length of 128 characters.
  Future<UpdateLinkResponse> updateLink({
    required String globalNetworkId,
    required String linkId,
    Bandwidth? bandwidth,
    String? description,
    String? provider,
    String? type,
  }) async {
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

  /// Updates the resource metadata for the specified global network.
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
  /// Parameter [metadata] :
  /// The resource metadata.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  Future<UpdateNetworkResourceMetadataResponse> updateNetworkResourceMetadata({
    required String globalNetworkId,
    required Map<String, String> metadata,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'Metadata': metadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/global-networks/${Uri.encodeComponent(globalNetworkId)}/network-resources/${Uri.encodeComponent(resourceArn)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNetworkResourceMetadataResponse.fromJson(response);
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
  /// Constraints: Maximum length of 256 characters.
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

  /// Updates a VPC attachment.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [attachmentId] :
  /// The ID of the attachment.
  ///
  /// Parameter [addSubnetArns] :
  /// Adds a subnet ARN to the VPC attachment.
  ///
  /// Parameter [options] :
  /// Additional options for updating the VPC attachment.
  ///
  /// Parameter [removeSubnetArns] :
  /// Removes a subnet ARN from the attachment.
  Future<UpdateVpcAttachmentResponse> updateVpcAttachment({
    required String attachmentId,
    List<String>? addSubnetArns,
    VpcOptions? options,
    List<String>? removeSubnetArns,
  }) async {
    final $payload = <String, dynamic>{
      if (addSubnetArns != null) 'AddSubnetArns': addSubnetArns,
      if (options != null) 'Options': options,
      if (removeSubnetArns != null) 'RemoveSubnetArns': removeSubnetArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/vpc-attachments/${Uri.encodeComponent(attachmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVpcAttachmentResponse.fromJson(response);
  }
}

/// Specifies a location in Amazon Web Services.
class AWSLocation {
  /// The Amazon Resource Name (ARN) of the subnet that the device is located in.
  final String? subnetArn;

  /// The Zone that the device is located in. Specify the ID of an Availability
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

class AcceptAttachmentResponse {
  /// The response to the attachment request.
  final Attachment? attachment;

  AcceptAttachmentResponse({
    this.attachment,
  });

  factory AcceptAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return AcceptAttachmentResponse(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    return {
      if (attachment != null) 'Attachment': attachment,
    };
  }
}

/// Describes the current status of an account within an Amazon Web Services
/// Organization, including service-linked roles (SLRs).
class AccountStatus {
  /// The ID of an account within the Amazon Web Services Organization.
  final String? accountId;

  /// The status of SLR deployment for the account.
  final String? sLRDeploymentStatus;

  AccountStatus({
    this.accountId,
    this.sLRDeploymentStatus,
  });

  factory AccountStatus.fromJson(Map<String, dynamic> json) {
    return AccountStatus(
      accountId: json['AccountId'] as String?,
      sLRDeploymentStatus: json['SLRDeploymentStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final sLRDeploymentStatus = this.sLRDeploymentStatus;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (sLRDeploymentStatus != null)
        'SLRDeploymentStatus': sLRDeploymentStatus,
    };
  }
}

class AssociateConnectPeerResponse {
  /// The response to the Connect peer request.
  final ConnectPeerAssociation? connectPeerAssociation;

  AssociateConnectPeerResponse({
    this.connectPeerAssociation,
  });

  factory AssociateConnectPeerResponse.fromJson(Map<String, dynamic> json) {
    return AssociateConnectPeerResponse(
      connectPeerAssociation: json['ConnectPeerAssociation'] != null
          ? ConnectPeerAssociation.fromJson(
              json['ConnectPeerAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeerAssociation = this.connectPeerAssociation;
    return {
      if (connectPeerAssociation != null)
        'ConnectPeerAssociation': connectPeerAssociation,
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

/// Describes a core network attachment.
class Attachment {
  /// The ID of the attachment.
  final String? attachmentId;

  /// The policy rule number associated with the attachment.
  final int? attachmentPolicyRuleNumber;

  /// The type of attachment.
  final AttachmentType? attachmentType;

  /// The ARN of a core network.
  final String? coreNetworkArn;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The timestamp when the attachment was created.
  final DateTime? createdAt;

  /// The Region where the edge is located.
  final String? edgeLocation;

  /// The ID of the attachment account owner.
  final String? ownerAccountId;

  /// The attachment to move from one segment to another.
  final ProposedSegmentChange? proposedSegmentChange;

  /// The attachment resource ARN.
  final String? resourceArn;

  /// The name of the segment attachment.
  final String? segmentName;

  /// The state of the attachment.
  final AttachmentState? state;

  /// The tags associated with the attachment.
  final List<Tag>? tags;

  /// The timestamp when the attachment was last updated.
  final DateTime? updatedAt;

  Attachment({
    this.attachmentId,
    this.attachmentPolicyRuleNumber,
    this.attachmentType,
    this.coreNetworkArn,
    this.coreNetworkId,
    this.createdAt,
    this.edgeLocation,
    this.ownerAccountId,
    this.proposedSegmentChange,
    this.resourceArn,
    this.segmentName,
    this.state,
    this.tags,
    this.updatedAt,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      attachmentId: json['AttachmentId'] as String?,
      attachmentPolicyRuleNumber: json['AttachmentPolicyRuleNumber'] as int?,
      attachmentType: (json['AttachmentType'] as String?)?.toAttachmentType(),
      coreNetworkArn: json['CoreNetworkArn'] as String?,
      coreNetworkId: json['CoreNetworkId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      edgeLocation: json['EdgeLocation'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      proposedSegmentChange: json['ProposedSegmentChange'] != null
          ? ProposedSegmentChange.fromJson(
              json['ProposedSegmentChange'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      segmentName: json['SegmentName'] as String?,
      state: (json['State'] as String?)?.toAttachmentState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final attachmentPolicyRuleNumber = this.attachmentPolicyRuleNumber;
    final attachmentType = this.attachmentType;
    final coreNetworkArn = this.coreNetworkArn;
    final coreNetworkId = this.coreNetworkId;
    final createdAt = this.createdAt;
    final edgeLocation = this.edgeLocation;
    final ownerAccountId = this.ownerAccountId;
    final proposedSegmentChange = this.proposedSegmentChange;
    final resourceArn = this.resourceArn;
    final segmentName = this.segmentName;
    final state = this.state;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (attachmentId != null) 'AttachmentId': attachmentId,
      if (attachmentPolicyRuleNumber != null)
        'AttachmentPolicyRuleNumber': attachmentPolicyRuleNumber,
      if (attachmentType != null) 'AttachmentType': attachmentType.toValue(),
      if (coreNetworkArn != null) 'CoreNetworkArn': coreNetworkArn,
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (proposedSegmentChange != null)
        'ProposedSegmentChange': proposedSegmentChange,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (segmentName != null) 'SegmentName': segmentName,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum AttachmentState {
  rejected,
  pendingAttachmentAcceptance,
  creating,
  failed,
  available,
  updating,
  pendingNetworkUpdate,
  pendingTagAcceptance,
  deleting,
}

extension AttachmentStateValueExtension on AttachmentState {
  String toValue() {
    switch (this) {
      case AttachmentState.rejected:
        return 'REJECTED';
      case AttachmentState.pendingAttachmentAcceptance:
        return 'PENDING_ATTACHMENT_ACCEPTANCE';
      case AttachmentState.creating:
        return 'CREATING';
      case AttachmentState.failed:
        return 'FAILED';
      case AttachmentState.available:
        return 'AVAILABLE';
      case AttachmentState.updating:
        return 'UPDATING';
      case AttachmentState.pendingNetworkUpdate:
        return 'PENDING_NETWORK_UPDATE';
      case AttachmentState.pendingTagAcceptance:
        return 'PENDING_TAG_ACCEPTANCE';
      case AttachmentState.deleting:
        return 'DELETING';
    }
  }
}

extension AttachmentStateFromString on String {
  AttachmentState toAttachmentState() {
    switch (this) {
      case 'REJECTED':
        return AttachmentState.rejected;
      case 'PENDING_ATTACHMENT_ACCEPTANCE':
        return AttachmentState.pendingAttachmentAcceptance;
      case 'CREATING':
        return AttachmentState.creating;
      case 'FAILED':
        return AttachmentState.failed;
      case 'AVAILABLE':
        return AttachmentState.available;
      case 'UPDATING':
        return AttachmentState.updating;
      case 'PENDING_NETWORK_UPDATE':
        return AttachmentState.pendingNetworkUpdate;
      case 'PENDING_TAG_ACCEPTANCE':
        return AttachmentState.pendingTagAcceptance;
      case 'DELETING':
        return AttachmentState.deleting;
    }
    throw Exception('$this is not known in enum AttachmentState');
  }
}

enum AttachmentType {
  connect,
  siteToSiteVpn,
  vpc,
  transitGatewayRouteTable,
}

extension AttachmentTypeValueExtension on AttachmentType {
  String toValue() {
    switch (this) {
      case AttachmentType.connect:
        return 'CONNECT';
      case AttachmentType.siteToSiteVpn:
        return 'SITE_TO_SITE_VPN';
      case AttachmentType.vpc:
        return 'VPC';
      case AttachmentType.transitGatewayRouteTable:
        return 'TRANSIT_GATEWAY_ROUTE_TABLE';
    }
  }
}

extension AttachmentTypeFromString on String {
  AttachmentType toAttachmentType() {
    switch (this) {
      case 'CONNECT':
        return AttachmentType.connect;
      case 'SITE_TO_SITE_VPN':
        return AttachmentType.siteToSiteVpn;
      case 'VPC':
        return AttachmentType.vpc;
      case 'TRANSIT_GATEWAY_ROUTE_TABLE':
        return AttachmentType.transitGatewayRouteTable;
    }
    throw Exception('$this is not known in enum AttachmentType');
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

/// Describes the BGP options.
class BgpOptions {
  /// The Peer ASN of the BGP.
  final int? peerAsn;

  BgpOptions({
    this.peerAsn,
  });

  Map<String, dynamic> toJson() {
    final peerAsn = this.peerAsn;
    return {
      if (peerAsn != null) 'PeerAsn': peerAsn,
    };
  }
}

enum ChangeAction {
  add,
  modify,
  remove,
}

extension ChangeActionValueExtension on ChangeAction {
  String toValue() {
    switch (this) {
      case ChangeAction.add:
        return 'ADD';
      case ChangeAction.modify:
        return 'MODIFY';
      case ChangeAction.remove:
        return 'REMOVE';
    }
  }
}

extension ChangeActionFromString on String {
  ChangeAction toChangeAction() {
    switch (this) {
      case 'ADD':
        return ChangeAction.add;
      case 'MODIFY':
        return ChangeAction.modify;
      case 'REMOVE':
        return ChangeAction.remove;
    }
    throw Exception('$this is not known in enum ChangeAction');
  }
}

enum ChangeSetState {
  pendingGeneration,
  failedGeneration,
  readyToExecute,
  executing,
  executionSucceeded,
  outOfDate,
}

extension ChangeSetStateValueExtension on ChangeSetState {
  String toValue() {
    switch (this) {
      case ChangeSetState.pendingGeneration:
        return 'PENDING_GENERATION';
      case ChangeSetState.failedGeneration:
        return 'FAILED_GENERATION';
      case ChangeSetState.readyToExecute:
        return 'READY_TO_EXECUTE';
      case ChangeSetState.executing:
        return 'EXECUTING';
      case ChangeSetState.executionSucceeded:
        return 'EXECUTION_SUCCEEDED';
      case ChangeSetState.outOfDate:
        return 'OUT_OF_DATE';
    }
  }
}

extension ChangeSetStateFromString on String {
  ChangeSetState toChangeSetState() {
    switch (this) {
      case 'PENDING_GENERATION':
        return ChangeSetState.pendingGeneration;
      case 'FAILED_GENERATION':
        return ChangeSetState.failedGeneration;
      case 'READY_TO_EXECUTE':
        return ChangeSetState.readyToExecute;
      case 'EXECUTING':
        return ChangeSetState.executing;
      case 'EXECUTION_SUCCEEDED':
        return ChangeSetState.executionSucceeded;
      case 'OUT_OF_DATE':
        return ChangeSetState.outOfDate;
    }
    throw Exception('$this is not known in enum ChangeSetState');
  }
}

enum ChangeStatus {
  notStarted,
  inProgress,
  complete,
  failed,
}

extension ChangeStatusValueExtension on ChangeStatus {
  String toValue() {
    switch (this) {
      case ChangeStatus.notStarted:
        return 'NOT_STARTED';
      case ChangeStatus.inProgress:
        return 'IN_PROGRESS';
      case ChangeStatus.complete:
        return 'COMPLETE';
      case ChangeStatus.failed:
        return 'FAILED';
    }
  }
}

extension ChangeStatusFromString on String {
  ChangeStatus toChangeStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ChangeStatus.notStarted;
      case 'IN_PROGRESS':
        return ChangeStatus.inProgress;
      case 'COMPLETE':
        return ChangeStatus.complete;
      case 'FAILED':
        return ChangeStatus.failed;
    }
    throw Exception('$this is not known in enum ChangeStatus');
  }
}

enum ChangeType {
  coreNetworkSegment,
  coreNetworkEdge,
  attachmentMapping,
  attachmentRoutePropagation,
  attachmentRouteStatic,
  coreNetworkConfiguration,
  segmentsConfiguration,
  segmentActionsConfiguration,
  attachmentPoliciesConfiguration,
}

extension ChangeTypeValueExtension on ChangeType {
  String toValue() {
    switch (this) {
      case ChangeType.coreNetworkSegment:
        return 'CORE_NETWORK_SEGMENT';
      case ChangeType.coreNetworkEdge:
        return 'CORE_NETWORK_EDGE';
      case ChangeType.attachmentMapping:
        return 'ATTACHMENT_MAPPING';
      case ChangeType.attachmentRoutePropagation:
        return 'ATTACHMENT_ROUTE_PROPAGATION';
      case ChangeType.attachmentRouteStatic:
        return 'ATTACHMENT_ROUTE_STATIC';
      case ChangeType.coreNetworkConfiguration:
        return 'CORE_NETWORK_CONFIGURATION';
      case ChangeType.segmentsConfiguration:
        return 'SEGMENTS_CONFIGURATION';
      case ChangeType.segmentActionsConfiguration:
        return 'SEGMENT_ACTIONS_CONFIGURATION';
      case ChangeType.attachmentPoliciesConfiguration:
        return 'ATTACHMENT_POLICIES_CONFIGURATION';
    }
  }
}

extension ChangeTypeFromString on String {
  ChangeType toChangeType() {
    switch (this) {
      case 'CORE_NETWORK_SEGMENT':
        return ChangeType.coreNetworkSegment;
      case 'CORE_NETWORK_EDGE':
        return ChangeType.coreNetworkEdge;
      case 'ATTACHMENT_MAPPING':
        return ChangeType.attachmentMapping;
      case 'ATTACHMENT_ROUTE_PROPAGATION':
        return ChangeType.attachmentRoutePropagation;
      case 'ATTACHMENT_ROUTE_STATIC':
        return ChangeType.attachmentRouteStatic;
      case 'CORE_NETWORK_CONFIGURATION':
        return ChangeType.coreNetworkConfiguration;
      case 'SEGMENTS_CONFIGURATION':
        return ChangeType.segmentsConfiguration;
      case 'SEGMENT_ACTIONS_CONFIGURATION':
        return ChangeType.segmentActionsConfiguration;
      case 'ATTACHMENT_POLICIES_CONFIGURATION':
        return ChangeType.attachmentPoliciesConfiguration;
    }
    throw Exception('$this is not known in enum ChangeType');
  }
}

/// Describes a core network Connect attachment.
class ConnectAttachment {
  /// The attachment details.
  final Attachment? attachment;

  /// Options for connecting an attachment.
  final ConnectAttachmentOptions? options;

  /// The ID of the transport attachment.
  final String? transportAttachmentId;

  ConnectAttachment({
    this.attachment,
    this.options,
    this.transportAttachmentId,
  });

  factory ConnectAttachment.fromJson(Map<String, dynamic> json) {
    return ConnectAttachment(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
      options: json['Options'] != null
          ? ConnectAttachmentOptions.fromJson(
              json['Options'] as Map<String, dynamic>)
          : null,
      transportAttachmentId: json['TransportAttachmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final options = this.options;
    final transportAttachmentId = this.transportAttachmentId;
    return {
      if (attachment != null) 'Attachment': attachment,
      if (options != null) 'Options': options,
      if (transportAttachmentId != null)
        'TransportAttachmentId': transportAttachmentId,
    };
  }
}

/// Describes a core network Connect attachment options.
class ConnectAttachmentOptions {
  /// The protocol used for the attachment connection.
  final TunnelProtocol? protocol;

  ConnectAttachmentOptions({
    this.protocol,
  });

  factory ConnectAttachmentOptions.fromJson(Map<String, dynamic> json) {
    return ConnectAttachmentOptions(
      protocol: (json['Protocol'] as String?)?.toTunnelProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final protocol = this.protocol;
    return {
      if (protocol != null) 'Protocol': protocol.toValue(),
    };
  }
}

/// Describes a core network Connect peer.
class ConnectPeer {
  /// The configuration of the Connect peer.
  final ConnectPeerConfiguration? configuration;

  /// The ID of the attachment to connect.
  final String? connectAttachmentId;

  /// The ID of the Connect peer.
  final String? connectPeerId;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The timestamp when the Connect peer was created.
  final DateTime? createdAt;

  /// The Connect peer Regions where edges are located.
  final String? edgeLocation;

  /// The state of the Connect peer.
  final ConnectPeerState? state;

  /// The subnet ARN for the Connect peer.
  final String? subnetArn;

  /// The list of key-value tags associated with the Connect peer.
  final List<Tag>? tags;

  ConnectPeer({
    this.configuration,
    this.connectAttachmentId,
    this.connectPeerId,
    this.coreNetworkId,
    this.createdAt,
    this.edgeLocation,
    this.state,
    this.subnetArn,
    this.tags,
  });

  factory ConnectPeer.fromJson(Map<String, dynamic> json) {
    return ConnectPeer(
      configuration: json['Configuration'] != null
          ? ConnectPeerConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      connectAttachmentId: json['ConnectAttachmentId'] as String?,
      connectPeerId: json['ConnectPeerId'] as String?,
      coreNetworkId: json['CoreNetworkId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      edgeLocation: json['EdgeLocation'] as String?,
      state: (json['State'] as String?)?.toConnectPeerState(),
      subnetArn: json['SubnetArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final connectAttachmentId = this.connectAttachmentId;
    final connectPeerId = this.connectPeerId;
    final coreNetworkId = this.coreNetworkId;
    final createdAt = this.createdAt;
    final edgeLocation = this.edgeLocation;
    final state = this.state;
    final subnetArn = this.subnetArn;
    final tags = this.tags;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (connectAttachmentId != null)
        'ConnectAttachmentId': connectAttachmentId,
      if (connectPeerId != null) 'ConnectPeerId': connectPeerId,
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (state != null) 'State': state.toValue(),
      if (subnetArn != null) 'SubnetArn': subnetArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Describes a core network Connect peer association.
class ConnectPeerAssociation {
  /// The ID of the Connect peer.
  final String? connectPeerId;

  /// The ID of the device to connect to.
  final String? deviceId;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// The ID of the link.
  final String? linkId;

  /// The state of the Connect peer association.
  final ConnectPeerAssociationState? state;

  ConnectPeerAssociation({
    this.connectPeerId,
    this.deviceId,
    this.globalNetworkId,
    this.linkId,
    this.state,
  });

  factory ConnectPeerAssociation.fromJson(Map<String, dynamic> json) {
    return ConnectPeerAssociation(
      connectPeerId: json['ConnectPeerId'] as String?,
      deviceId: json['DeviceId'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      linkId: json['LinkId'] as String?,
      state: (json['State'] as String?)?.toConnectPeerAssociationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeerId = this.connectPeerId;
    final deviceId = this.deviceId;
    final globalNetworkId = this.globalNetworkId;
    final linkId = this.linkId;
    final state = this.state;
    return {
      if (connectPeerId != null) 'ConnectPeerId': connectPeerId,
      if (deviceId != null) 'DeviceId': deviceId,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (linkId != null) 'LinkId': linkId,
      if (state != null) 'State': state.toValue(),
    };
  }
}

enum ConnectPeerAssociationState {
  pending,
  available,
  deleting,
  deleted,
}

extension ConnectPeerAssociationStateValueExtension
    on ConnectPeerAssociationState {
  String toValue() {
    switch (this) {
      case ConnectPeerAssociationState.pending:
        return 'PENDING';
      case ConnectPeerAssociationState.available:
        return 'AVAILABLE';
      case ConnectPeerAssociationState.deleting:
        return 'DELETING';
      case ConnectPeerAssociationState.deleted:
        return 'DELETED';
    }
  }
}

extension ConnectPeerAssociationStateFromString on String {
  ConnectPeerAssociationState toConnectPeerAssociationState() {
    switch (this) {
      case 'PENDING':
        return ConnectPeerAssociationState.pending;
      case 'AVAILABLE':
        return ConnectPeerAssociationState.available;
      case 'DELETING':
        return ConnectPeerAssociationState.deleting;
      case 'DELETED':
        return ConnectPeerAssociationState.deleted;
    }
    throw Exception('$this is not known in enum ConnectPeerAssociationState');
  }
}

/// Describes a core network BGP configuration.
class ConnectPeerBgpConfiguration {
  /// The address of a core network.
  final String? coreNetworkAddress;

  /// The ASN of the Coret Network.
  final int? coreNetworkAsn;

  /// The address of a core network Connect peer.
  final String? peerAddress;

  /// The ASN of the Connect peer.
  final int? peerAsn;

  ConnectPeerBgpConfiguration({
    this.coreNetworkAddress,
    this.coreNetworkAsn,
    this.peerAddress,
    this.peerAsn,
  });

  factory ConnectPeerBgpConfiguration.fromJson(Map<String, dynamic> json) {
    return ConnectPeerBgpConfiguration(
      coreNetworkAddress: json['CoreNetworkAddress'] as String?,
      coreNetworkAsn: json['CoreNetworkAsn'] as int?,
      peerAddress: json['PeerAddress'] as String?,
      peerAsn: json['PeerAsn'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkAddress = this.coreNetworkAddress;
    final coreNetworkAsn = this.coreNetworkAsn;
    final peerAddress = this.peerAddress;
    final peerAsn = this.peerAsn;
    return {
      if (coreNetworkAddress != null) 'CoreNetworkAddress': coreNetworkAddress,
      if (coreNetworkAsn != null) 'CoreNetworkAsn': coreNetworkAsn,
      if (peerAddress != null) 'PeerAddress': peerAddress,
      if (peerAsn != null) 'PeerAsn': peerAsn,
    };
  }
}

/// Describes a core network Connect peer configuration.
class ConnectPeerConfiguration {
  /// The Connect peer BGP configurations.
  final List<ConnectPeerBgpConfiguration>? bgpConfigurations;

  /// The IP address of a core network.
  final String? coreNetworkAddress;

  /// The inside IP addresses used for a Connect peer configuration.
  final List<String>? insideCidrBlocks;

  /// The IP address of the Connect peer.
  final String? peerAddress;

  /// The protocol used for a Connect peer configuration.
  final TunnelProtocol? protocol;

  ConnectPeerConfiguration({
    this.bgpConfigurations,
    this.coreNetworkAddress,
    this.insideCidrBlocks,
    this.peerAddress,
    this.protocol,
  });

  factory ConnectPeerConfiguration.fromJson(Map<String, dynamic> json) {
    return ConnectPeerConfiguration(
      bgpConfigurations: (json['BgpConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConnectPeerBgpConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      coreNetworkAddress: json['CoreNetworkAddress'] as String?,
      insideCidrBlocks: (json['InsideCidrBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      peerAddress: json['PeerAddress'] as String?,
      protocol: (json['Protocol'] as String?)?.toTunnelProtocol(),
    );
  }

  Map<String, dynamic> toJson() {
    final bgpConfigurations = this.bgpConfigurations;
    final coreNetworkAddress = this.coreNetworkAddress;
    final insideCidrBlocks = this.insideCidrBlocks;
    final peerAddress = this.peerAddress;
    final protocol = this.protocol;
    return {
      if (bgpConfigurations != null) 'BgpConfigurations': bgpConfigurations,
      if (coreNetworkAddress != null) 'CoreNetworkAddress': coreNetworkAddress,
      if (insideCidrBlocks != null) 'InsideCidrBlocks': insideCidrBlocks,
      if (peerAddress != null) 'PeerAddress': peerAddress,
      if (protocol != null) 'Protocol': protocol.toValue(),
    };
  }
}

enum ConnectPeerState {
  creating,
  failed,
  available,
  deleting,
}

extension ConnectPeerStateValueExtension on ConnectPeerState {
  String toValue() {
    switch (this) {
      case ConnectPeerState.creating:
        return 'CREATING';
      case ConnectPeerState.failed:
        return 'FAILED';
      case ConnectPeerState.available:
        return 'AVAILABLE';
      case ConnectPeerState.deleting:
        return 'DELETING';
    }
  }
}

extension ConnectPeerStateFromString on String {
  ConnectPeerState toConnectPeerState() {
    switch (this) {
      case 'CREATING':
        return ConnectPeerState.creating;
      case 'FAILED':
        return ConnectPeerState.failed;
      case 'AVAILABLE':
        return ConnectPeerState.available;
      case 'DELETING':
        return ConnectPeerState.deleting;
    }
    throw Exception('$this is not known in enum ConnectPeerState');
  }
}

/// Summary description of a Connect peer.
class ConnectPeerSummary {
  /// The ID of a Connect peer attachment.
  final String? connectAttachmentId;

  /// The ID of a Connect peer.
  final String? connectPeerId;

  /// The state of a Connect peer.
  final ConnectPeerState? connectPeerState;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The timestamp when a Connect peer was created.
  final DateTime? createdAt;

  /// The Region where the edge is located.
  final String? edgeLocation;

  /// The subnet ARN for the Connect peer summary.
  final String? subnetArn;

  /// The list of key-value tags associated with the Connect peer summary.
  final List<Tag>? tags;

  ConnectPeerSummary({
    this.connectAttachmentId,
    this.connectPeerId,
    this.connectPeerState,
    this.coreNetworkId,
    this.createdAt,
    this.edgeLocation,
    this.subnetArn,
    this.tags,
  });

  factory ConnectPeerSummary.fromJson(Map<String, dynamic> json) {
    return ConnectPeerSummary(
      connectAttachmentId: json['ConnectAttachmentId'] as String?,
      connectPeerId: json['ConnectPeerId'] as String?,
      connectPeerState:
          (json['ConnectPeerState'] as String?)?.toConnectPeerState(),
      coreNetworkId: json['CoreNetworkId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      edgeLocation: json['EdgeLocation'] as String?,
      subnetArn: json['SubnetArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectAttachmentId = this.connectAttachmentId;
    final connectPeerId = this.connectPeerId;
    final connectPeerState = this.connectPeerState;
    final coreNetworkId = this.coreNetworkId;
    final createdAt = this.createdAt;
    final edgeLocation = this.edgeLocation;
    final subnetArn = this.subnetArn;
    final tags = this.tags;
    return {
      if (connectAttachmentId != null)
        'ConnectAttachmentId': connectAttachmentId,
      if (connectPeerId != null) 'ConnectPeerId': connectPeerId,
      if (connectPeerState != null)
        'ConnectPeerState': connectPeerState.toValue(),
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (subnetArn != null) 'SubnetArn': subnetArn,
      if (tags != null) 'Tags': tags,
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

/// Describes connection health.
class ConnectionHealth {
  /// The connection status.
  final ConnectionStatus? status;

  /// The time the status was last updated.
  final DateTime? timestamp;

  /// The connection type.
  final ConnectionType? type;

  ConnectionHealth({
    this.status,
    this.timestamp,
    this.type,
  });

  factory ConnectionHealth.fromJson(Map<String, dynamic> json) {
    return ConnectionHealth(
      status: (json['Status'] as String?)?.toConnectionStatus(),
      timestamp: timeStampFromJson(json['Timestamp']),
      type: (json['Type'] as String?)?.toConnectionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final timestamp = this.timestamp;
    final type = this.type;
    return {
      if (status != null) 'Status': status.toValue(),
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ConnectionState {
  pending,
  available,
  deleting,
  updating,
}

extension ConnectionStateValueExtension on ConnectionState {
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

extension ConnectionStateFromString on String {
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

enum ConnectionStatus {
  up,
  down,
}

extension ConnectionStatusValueExtension on ConnectionStatus {
  String toValue() {
    switch (this) {
      case ConnectionStatus.up:
        return 'UP';
      case ConnectionStatus.down:
        return 'DOWN';
    }
  }
}

extension ConnectionStatusFromString on String {
  ConnectionStatus toConnectionStatus() {
    switch (this) {
      case 'UP':
        return ConnectionStatus.up;
      case 'DOWN':
        return ConnectionStatus.down;
    }
    throw Exception('$this is not known in enum ConnectionStatus');
  }
}

enum ConnectionType {
  bgp,
  ipsec,
}

extension ConnectionTypeValueExtension on ConnectionType {
  String toValue() {
    switch (this) {
      case ConnectionType.bgp:
        return 'BGP';
      case ConnectionType.ipsec:
        return 'IPSEC';
    }
  }
}

extension ConnectionTypeFromString on String {
  ConnectionType toConnectionType() {
    switch (this) {
      case 'BGP':
        return ConnectionType.bgp;
      case 'IPSEC':
        return ConnectionType.ipsec;
    }
    throw Exception('$this is not known in enum ConnectionType');
  }
}

/// Describes a core network.
class CoreNetwork {
  /// The ARN of a core network.
  final String? coreNetworkArn;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The timestamp when a core network was created.
  final DateTime? createdAt;

  /// The description of a core network.
  final String? description;

  /// The edges within a core network.
  final List<CoreNetworkEdge>? edges;

  /// The ID of the global network that your core network is a part of.
  final String? globalNetworkId;

  /// The segments within a core network.
  final List<CoreNetworkSegment>? segments;

  /// The current state of a core network.
  final CoreNetworkState? state;

  /// The list of key-value tags associated with a core network.
  final List<Tag>? tags;

  CoreNetwork({
    this.coreNetworkArn,
    this.coreNetworkId,
    this.createdAt,
    this.description,
    this.edges,
    this.globalNetworkId,
    this.segments,
    this.state,
    this.tags,
  });

  factory CoreNetwork.fromJson(Map<String, dynamic> json) {
    return CoreNetwork(
      coreNetworkArn: json['CoreNetworkArn'] as String?,
      coreNetworkId: json['CoreNetworkId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      edges: (json['Edges'] as List?)
          ?.whereNotNull()
          .map((e) => CoreNetworkEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
      globalNetworkId: json['GlobalNetworkId'] as String?,
      segments: (json['Segments'] as List?)
          ?.whereNotNull()
          .map((e) => CoreNetworkSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['State'] as String?)?.toCoreNetworkState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkArn = this.coreNetworkArn;
    final coreNetworkId = this.coreNetworkId;
    final createdAt = this.createdAt;
    final description = this.description;
    final edges = this.edges;
    final globalNetworkId = this.globalNetworkId;
    final segments = this.segments;
    final state = this.state;
    final tags = this.tags;
    return {
      if (coreNetworkArn != null) 'CoreNetworkArn': coreNetworkArn,
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (edges != null) 'Edges': edges,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (segments != null) 'Segments': segments,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Details describing a core network change.
class CoreNetworkChange {
  /// The action to take for a core network.
  final ChangeAction? action;

  /// The resource identifier.
  final String? identifier;

  /// Uniquely identifies the path for a change within the changeset. For example,
  /// the <code>IdentifierPath</code> for a core network segment change might be
  /// <code>"CORE_NETWORK_SEGMENT/us-east-1/devsegment"</code>.
  final String? identifierPath;

  /// The new value for a core network
  final CoreNetworkChangeValues? newValues;

  /// The previous values for a core network.
  final CoreNetworkChangeValues? previousValues;

  /// The type of change.
  final ChangeType? type;

  CoreNetworkChange({
    this.action,
    this.identifier,
    this.identifierPath,
    this.newValues,
    this.previousValues,
    this.type,
  });

  factory CoreNetworkChange.fromJson(Map<String, dynamic> json) {
    return CoreNetworkChange(
      action: (json['Action'] as String?)?.toChangeAction(),
      identifier: json['Identifier'] as String?,
      identifierPath: json['IdentifierPath'] as String?,
      newValues: json['NewValues'] != null
          ? CoreNetworkChangeValues.fromJson(
              json['NewValues'] as Map<String, dynamic>)
          : null,
      previousValues: json['PreviousValues'] != null
          ? CoreNetworkChangeValues.fromJson(
              json['PreviousValues'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toChangeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final identifier = this.identifier;
    final identifierPath = this.identifierPath;
    final newValues = this.newValues;
    final previousValues = this.previousValues;
    final type = this.type;
    return {
      if (action != null) 'Action': action.toValue(),
      if (identifier != null) 'Identifier': identifier,
      if (identifierPath != null) 'IdentifierPath': identifierPath,
      if (newValues != null) 'NewValues': newValues,
      if (previousValues != null) 'PreviousValues': previousValues,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Describes a core network change event. This can be a change to a segment,
/// attachment, route, etc.
class CoreNetworkChangeEvent {
  /// The action taken for the change event.
  final ChangeAction? action;

  /// The timestamp for an event change in status.
  final DateTime? eventTime;

  /// Uniquely identifies the path for a change within the changeset. For example,
  /// the <code>IdentifierPath</code> for a core network segment change might be
  /// <code>"CORE_NETWORK_SEGMENT/us-east-1/devsegment"</code>.
  final String? identifierPath;

  /// The status of the core network change event.
  final ChangeStatus? status;

  /// Describes the type of change event.
  final ChangeType? type;

  /// Details of the change event.
  final CoreNetworkChangeEventValues? values;

  CoreNetworkChangeEvent({
    this.action,
    this.eventTime,
    this.identifierPath,
    this.status,
    this.type,
    this.values,
  });

  factory CoreNetworkChangeEvent.fromJson(Map<String, dynamic> json) {
    return CoreNetworkChangeEvent(
      action: (json['Action'] as String?)?.toChangeAction(),
      eventTime: timeStampFromJson(json['EventTime']),
      identifierPath: json['IdentifierPath'] as String?,
      status: (json['Status'] as String?)?.toChangeStatus(),
      type: (json['Type'] as String?)?.toChangeType(),
      values: json['Values'] != null
          ? CoreNetworkChangeEventValues.fromJson(
              json['Values'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final eventTime = this.eventTime;
    final identifierPath = this.identifierPath;
    final status = this.status;
    final type = this.type;
    final values = this.values;
    return {
      if (action != null) 'Action': action.toValue(),
      if (eventTime != null) 'EventTime': unixTimestampToJson(eventTime),
      if (identifierPath != null) 'IdentifierPath': identifierPath,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

/// Describes a core network change event.
class CoreNetworkChangeEventValues {
  /// The ID of the attachment if the change event is associated with an
  /// attachment.
  final String? attachmentId;

  /// For a <code>STATIC_ROUTE</code> event, this is the IP address.
  final String? cidr;

  /// The edge location for the core network change event.
  final String? edgeLocation;

  /// The segment name if the change event is associated with a segment.
  final String? segmentName;

  CoreNetworkChangeEventValues({
    this.attachmentId,
    this.cidr,
    this.edgeLocation,
    this.segmentName,
  });

  factory CoreNetworkChangeEventValues.fromJson(Map<String, dynamic> json) {
    return CoreNetworkChangeEventValues(
      attachmentId: json['AttachmentId'] as String?,
      cidr: json['Cidr'] as String?,
      edgeLocation: json['EdgeLocation'] as String?,
      segmentName: json['SegmentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentId = this.attachmentId;
    final cidr = this.cidr;
    final edgeLocation = this.edgeLocation;
    final segmentName = this.segmentName;
    return {
      if (attachmentId != null) 'AttachmentId': attachmentId,
      if (cidr != null) 'Cidr': cidr,
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (segmentName != null) 'SegmentName': segmentName,
    };
  }
}

/// Describes a core network change.
class CoreNetworkChangeValues {
  /// The ASN of a core network.
  final int? asn;

  /// The IP addresses used for a core network.
  final String? cidr;

  /// The ID of the destination.
  final String? destinationIdentifier;

  /// The Regions where edges are located in a core network.
  final List<String>? edgeLocations;

  /// The inside IP addresses used for core network change values.
  final List<String>? insideCidrBlocks;

  /// The names of the segments in a core network.
  final String? segmentName;

  /// The shared segments for a core network change value.
  final List<String>? sharedSegments;

  CoreNetworkChangeValues({
    this.asn,
    this.cidr,
    this.destinationIdentifier,
    this.edgeLocations,
    this.insideCidrBlocks,
    this.segmentName,
    this.sharedSegments,
  });

  factory CoreNetworkChangeValues.fromJson(Map<String, dynamic> json) {
    return CoreNetworkChangeValues(
      asn: json['Asn'] as int?,
      cidr: json['Cidr'] as String?,
      destinationIdentifier: json['DestinationIdentifier'] as String?,
      edgeLocations: (json['EdgeLocations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      insideCidrBlocks: (json['InsideCidrBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      segmentName: json['SegmentName'] as String?,
      sharedSegments: (json['SharedSegments'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final cidr = this.cidr;
    final destinationIdentifier = this.destinationIdentifier;
    final edgeLocations = this.edgeLocations;
    final insideCidrBlocks = this.insideCidrBlocks;
    final segmentName = this.segmentName;
    final sharedSegments = this.sharedSegments;
    return {
      if (asn != null) 'Asn': asn,
      if (cidr != null) 'Cidr': cidr,
      if (destinationIdentifier != null)
        'DestinationIdentifier': destinationIdentifier,
      if (edgeLocations != null) 'EdgeLocations': edgeLocations,
      if (insideCidrBlocks != null) 'InsideCidrBlocks': insideCidrBlocks,
      if (segmentName != null) 'SegmentName': segmentName,
      if (sharedSegments != null) 'SharedSegments': sharedSegments,
    };
  }
}

/// Describes a core network edge.
class CoreNetworkEdge {
  /// The ASN of a core network edge.
  final int? asn;

  /// The Region where a core network edge is located.
  final String? edgeLocation;

  /// The inside IP addresses used for core network edges.
  final List<String>? insideCidrBlocks;

  CoreNetworkEdge({
    this.asn,
    this.edgeLocation,
    this.insideCidrBlocks,
  });

  factory CoreNetworkEdge.fromJson(Map<String, dynamic> json) {
    return CoreNetworkEdge(
      asn: json['Asn'] as int?,
      edgeLocation: json['EdgeLocation'] as String?,
      insideCidrBlocks: (json['InsideCidrBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final edgeLocation = this.edgeLocation;
    final insideCidrBlocks = this.insideCidrBlocks;
    return {
      if (asn != null) 'Asn': asn,
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (insideCidrBlocks != null) 'InsideCidrBlocks': insideCidrBlocks,
    };
  }
}

/// Describes a core network policy. You can have only one LIVE Core Policy.
class CoreNetworkPolicy {
  /// Whether a core network policy is the current LIVE policy or the most
  /// recently submitted policy.
  final CoreNetworkPolicyAlias? alias;

  /// The state of a core network policy.
  final ChangeSetState? changeSetState;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The timestamp when a core network policy was created.
  final DateTime? createdAt;

  /// The description of a core network policy.
  final String? description;

  /// Describes a core network policy.
  final Object? policyDocument;

  /// Describes any errors in a core network policy.
  final List<CoreNetworkPolicyError>? policyErrors;

  /// The ID of the policy version.
  final int? policyVersionId;

  CoreNetworkPolicy({
    this.alias,
    this.changeSetState,
    this.coreNetworkId,
    this.createdAt,
    this.description,
    this.policyDocument,
    this.policyErrors,
    this.policyVersionId,
  });

  factory CoreNetworkPolicy.fromJson(Map<String, dynamic> json) {
    return CoreNetworkPolicy(
      alias: (json['Alias'] as String?)?.toCoreNetworkPolicyAlias(),
      changeSetState: (json['ChangeSetState'] as String?)?.toChangeSetState(),
      coreNetworkId: json['CoreNetworkId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      policyDocument: json['PolicyDocument'] == null
          ? null
          : jsonDecode(json['PolicyDocument'] as String),
      policyErrors: (json['PolicyErrors'] as List?)
          ?.whereNotNull()
          .map(
              (e) => CoreNetworkPolicyError.fromJson(e as Map<String, dynamic>))
          .toList(),
      policyVersionId: json['PolicyVersionId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final changeSetState = this.changeSetState;
    final coreNetworkId = this.coreNetworkId;
    final createdAt = this.createdAt;
    final description = this.description;
    final policyDocument = this.policyDocument;
    final policyErrors = this.policyErrors;
    final policyVersionId = this.policyVersionId;
    return {
      if (alias != null) 'Alias': alias.toValue(),
      if (changeSetState != null) 'ChangeSetState': changeSetState.toValue(),
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (policyDocument != null) 'PolicyDocument': jsonEncode(policyDocument),
      if (policyErrors != null) 'PolicyErrors': policyErrors,
      if (policyVersionId != null) 'PolicyVersionId': policyVersionId,
    };
  }
}

enum CoreNetworkPolicyAlias {
  live,
  latest,
}

extension CoreNetworkPolicyAliasValueExtension on CoreNetworkPolicyAlias {
  String toValue() {
    switch (this) {
      case CoreNetworkPolicyAlias.live:
        return 'LIVE';
      case CoreNetworkPolicyAlias.latest:
        return 'LATEST';
    }
  }
}

extension CoreNetworkPolicyAliasFromString on String {
  CoreNetworkPolicyAlias toCoreNetworkPolicyAlias() {
    switch (this) {
      case 'LIVE':
        return CoreNetworkPolicyAlias.live;
      case 'LATEST':
        return CoreNetworkPolicyAlias.latest;
    }
    throw Exception('$this is not known in enum CoreNetworkPolicyAlias');
  }
}

/// Provides details about an error in a core network policy.
class CoreNetworkPolicyError {
  /// The error code associated with a core network policy error.
  final String errorCode;

  /// The message associated with a core network policy error code.
  final String message;

  /// The JSON path where the error was discovered in the policy document.
  final String? path;

  CoreNetworkPolicyError({
    required this.errorCode,
    required this.message,
    this.path,
  });

  factory CoreNetworkPolicyError.fromJson(Map<String, dynamic> json) {
    return CoreNetworkPolicyError(
      errorCode: json['ErrorCode'] as String,
      message: json['Message'] as String,
      path: json['Path'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    final path = this.path;
    return {
      'ErrorCode': errorCode,
      'Message': message,
      if (path != null) 'Path': path,
    };
  }
}

/// Describes a core network policy version.
class CoreNetworkPolicyVersion {
  /// Whether a core network policy is the current policy or the most recently
  /// submitted policy.
  final CoreNetworkPolicyAlias? alias;

  /// The status of the policy version change set.
  final ChangeSetState? changeSetState;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The timestamp when a core network policy version was created.
  final DateTime? createdAt;

  /// The description of a core network policy version.
  final String? description;

  /// The ID of the policy version.
  final int? policyVersionId;

  CoreNetworkPolicyVersion({
    this.alias,
    this.changeSetState,
    this.coreNetworkId,
    this.createdAt,
    this.description,
    this.policyVersionId,
  });

  factory CoreNetworkPolicyVersion.fromJson(Map<String, dynamic> json) {
    return CoreNetworkPolicyVersion(
      alias: (json['Alias'] as String?)?.toCoreNetworkPolicyAlias(),
      changeSetState: (json['ChangeSetState'] as String?)?.toChangeSetState(),
      coreNetworkId: json['CoreNetworkId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      policyVersionId: json['PolicyVersionId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alias = this.alias;
    final changeSetState = this.changeSetState;
    final coreNetworkId = this.coreNetworkId;
    final createdAt = this.createdAt;
    final description = this.description;
    final policyVersionId = this.policyVersionId;
    return {
      if (alias != null) 'Alias': alias.toValue(),
      if (changeSetState != null) 'ChangeSetState': changeSetState.toValue(),
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (policyVersionId != null) 'PolicyVersionId': policyVersionId,
    };
  }
}

/// Describes a core network segment, which are dedicated routes. Only
/// attachments within this segment can communicate with each other.
class CoreNetworkSegment {
  /// The Regions where the edges are located.
  final List<String>? edgeLocations;

  /// The name of a core network segment.
  final String? name;

  /// The shared segments of a core network.
  final List<String>? sharedSegments;

  CoreNetworkSegment({
    this.edgeLocations,
    this.name,
    this.sharedSegments,
  });

  factory CoreNetworkSegment.fromJson(Map<String, dynamic> json) {
    return CoreNetworkSegment(
      edgeLocations: (json['EdgeLocations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      sharedSegments: (json['SharedSegments'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final edgeLocations = this.edgeLocations;
    final name = this.name;
    final sharedSegments = this.sharedSegments;
    return {
      if (edgeLocations != null) 'EdgeLocations': edgeLocations,
      if (name != null) 'Name': name,
      if (sharedSegments != null) 'SharedSegments': sharedSegments,
    };
  }
}

/// Returns details about a core network edge.
class CoreNetworkSegmentEdgeIdentifier {
  /// The ID of a core network.
  final String? coreNetworkId;

  /// The Region where the segment edge is located.
  final String? edgeLocation;

  /// The name of the segment edge.
  final String? segmentName;

  CoreNetworkSegmentEdgeIdentifier({
    this.coreNetworkId,
    this.edgeLocation,
    this.segmentName,
  });

  factory CoreNetworkSegmentEdgeIdentifier.fromJson(Map<String, dynamic> json) {
    return CoreNetworkSegmentEdgeIdentifier(
      coreNetworkId: json['CoreNetworkId'] as String?,
      edgeLocation: json['EdgeLocation'] as String?,
      segmentName: json['SegmentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkId = this.coreNetworkId;
    final edgeLocation = this.edgeLocation;
    final segmentName = this.segmentName;
    return {
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (segmentName != null) 'SegmentName': segmentName,
    };
  }
}

enum CoreNetworkState {
  creating,
  updating,
  available,
  deleting,
}

extension CoreNetworkStateValueExtension on CoreNetworkState {
  String toValue() {
    switch (this) {
      case CoreNetworkState.creating:
        return 'CREATING';
      case CoreNetworkState.updating:
        return 'UPDATING';
      case CoreNetworkState.available:
        return 'AVAILABLE';
      case CoreNetworkState.deleting:
        return 'DELETING';
    }
  }
}

extension CoreNetworkStateFromString on String {
  CoreNetworkState toCoreNetworkState() {
    switch (this) {
      case 'CREATING':
        return CoreNetworkState.creating;
      case 'UPDATING':
        return CoreNetworkState.updating;
      case 'AVAILABLE':
        return CoreNetworkState.available;
      case 'DELETING':
        return CoreNetworkState.deleting;
    }
    throw Exception('$this is not known in enum CoreNetworkState');
  }
}

/// Returns summary information about a core network.
class CoreNetworkSummary {
  /// a core network ARN.
  final String? coreNetworkArn;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The description of a core network.
  final String? description;

  /// The global network ID.
  final String? globalNetworkId;

  /// The ID of the account owner.
  final String? ownerAccountId;

  /// The state of a core network.
  final CoreNetworkState? state;

  /// The key-value tags associated with a core network summary.
  final List<Tag>? tags;

  CoreNetworkSummary({
    this.coreNetworkArn,
    this.coreNetworkId,
    this.description,
    this.globalNetworkId,
    this.ownerAccountId,
    this.state,
    this.tags,
  });

  factory CoreNetworkSummary.fromJson(Map<String, dynamic> json) {
    return CoreNetworkSummary(
      coreNetworkArn: json['CoreNetworkArn'] as String?,
      coreNetworkId: json['CoreNetworkId'] as String?,
      description: json['Description'] as String?,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      state: (json['State'] as String?)?.toCoreNetworkState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkArn = this.coreNetworkArn;
    final coreNetworkId = this.coreNetworkId;
    final description = this.description;
    final globalNetworkId = this.globalNetworkId;
    final ownerAccountId = this.ownerAccountId;
    final state = this.state;
    final tags = this.tags;
    return {
      if (coreNetworkArn != null) 'CoreNetworkArn': coreNetworkArn,
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (description != null) 'Description': description,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateConnectAttachmentResponse {
  /// The response to a Connect attachment request.
  final ConnectAttachment? connectAttachment;

  CreateConnectAttachmentResponse({
    this.connectAttachment,
  });

  factory CreateConnectAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectAttachmentResponse(
      connectAttachment: json['ConnectAttachment'] != null
          ? ConnectAttachment.fromJson(
              json['ConnectAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectAttachment = this.connectAttachment;
    return {
      if (connectAttachment != null) 'ConnectAttachment': connectAttachment,
    };
  }
}

class CreateConnectPeerResponse {
  /// The response to the request.
  final ConnectPeer? connectPeer;

  CreateConnectPeerResponse({
    this.connectPeer,
  });

  factory CreateConnectPeerResponse.fromJson(Map<String, dynamic> json) {
    return CreateConnectPeerResponse(
      connectPeer: json['ConnectPeer'] != null
          ? ConnectPeer.fromJson(json['ConnectPeer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeer = this.connectPeer;
    return {
      if (connectPeer != null) 'ConnectPeer': connectPeer,
    };
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

class CreateCoreNetworkResponse {
  /// Returns details about a core network.
  final CoreNetwork? coreNetwork;

  CreateCoreNetworkResponse({
    this.coreNetwork,
  });

  factory CreateCoreNetworkResponse.fromJson(Map<String, dynamic> json) {
    return CreateCoreNetworkResponse(
      coreNetwork: json['CoreNetwork'] != null
          ? CoreNetwork.fromJson(json['CoreNetwork'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetwork = this.coreNetwork;
    return {
      if (coreNetwork != null) 'CoreNetwork': coreNetwork,
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

class CreateSiteToSiteVpnAttachmentResponse {
  /// Details about a site-to-site VPN attachment.
  final SiteToSiteVpnAttachment? siteToSiteVpnAttachment;

  CreateSiteToSiteVpnAttachmentResponse({
    this.siteToSiteVpnAttachment,
  });

  factory CreateSiteToSiteVpnAttachmentResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSiteToSiteVpnAttachmentResponse(
      siteToSiteVpnAttachment: json['SiteToSiteVpnAttachment'] != null
          ? SiteToSiteVpnAttachment.fromJson(
              json['SiteToSiteVpnAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final siteToSiteVpnAttachment = this.siteToSiteVpnAttachment;
    return {
      if (siteToSiteVpnAttachment != null)
        'SiteToSiteVpnAttachment': siteToSiteVpnAttachment,
    };
  }
}

class CreateTransitGatewayPeeringResponse {
  /// Returns information about the transit gateway peering connection request.
  final TransitGatewayPeering? transitGatewayPeering;

  CreateTransitGatewayPeeringResponse({
    this.transitGatewayPeering,
  });

  factory CreateTransitGatewayPeeringResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateTransitGatewayPeeringResponse(
      transitGatewayPeering: json['TransitGatewayPeering'] != null
          ? TransitGatewayPeering.fromJson(
              json['TransitGatewayPeering'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayPeering = this.transitGatewayPeering;
    return {
      if (transitGatewayPeering != null)
        'TransitGatewayPeering': transitGatewayPeering,
    };
  }
}

class CreateTransitGatewayRouteTableAttachmentResponse {
  /// The route table associated with the create transit gateway route table
  /// attachment request.
  final TransitGatewayRouteTableAttachment? transitGatewayRouteTableAttachment;

  CreateTransitGatewayRouteTableAttachmentResponse({
    this.transitGatewayRouteTableAttachment,
  });

  factory CreateTransitGatewayRouteTableAttachmentResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateTransitGatewayRouteTableAttachmentResponse(
      transitGatewayRouteTableAttachment:
          json['TransitGatewayRouteTableAttachment'] != null
              ? TransitGatewayRouteTableAttachment.fromJson(
                  json['TransitGatewayRouteTableAttachment']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayRouteTableAttachment =
        this.transitGatewayRouteTableAttachment;
    return {
      if (transitGatewayRouteTableAttachment != null)
        'TransitGatewayRouteTableAttachment':
            transitGatewayRouteTableAttachment,
    };
  }
}

class CreateVpcAttachmentResponse {
  /// Provides details about the VPC attachment.
  final VpcAttachment? vpcAttachment;

  CreateVpcAttachmentResponse({
    this.vpcAttachment,
  });

  factory CreateVpcAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateVpcAttachmentResponse(
      vpcAttachment: json['VpcAttachment'] != null
          ? VpcAttachment.fromJson(
              json['VpcAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcAttachment = this.vpcAttachment;
    return {
      if (vpcAttachment != null) 'VpcAttachment': vpcAttachment,
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

extension CustomerGatewayAssociationStateValueExtension
    on CustomerGatewayAssociationState {
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

extension CustomerGatewayAssociationStateFromString on String {
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

class DeleteAttachmentResponse {
  /// Information about the deleted attachment.
  final Attachment? attachment;

  DeleteAttachmentResponse({
    this.attachment,
  });

  factory DeleteAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAttachmentResponse(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    return {
      if (attachment != null) 'Attachment': attachment,
    };
  }
}

class DeleteConnectPeerResponse {
  /// Information about the deleted Connect peer.
  final ConnectPeer? connectPeer;

  DeleteConnectPeerResponse({
    this.connectPeer,
  });

  factory DeleteConnectPeerResponse.fromJson(Map<String, dynamic> json) {
    return DeleteConnectPeerResponse(
      connectPeer: json['ConnectPeer'] != null
          ? ConnectPeer.fromJson(json['ConnectPeer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeer = this.connectPeer;
    return {
      if (connectPeer != null) 'ConnectPeer': connectPeer,
    };
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

class DeleteCoreNetworkPolicyVersionResponse {
  /// Returns information about the deleted policy version.
  final CoreNetworkPolicy? coreNetworkPolicy;

  DeleteCoreNetworkPolicyVersionResponse({
    this.coreNetworkPolicy,
  });

  factory DeleteCoreNetworkPolicyVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteCoreNetworkPolicyVersionResponse(
      coreNetworkPolicy: json['CoreNetworkPolicy'] != null
          ? CoreNetworkPolicy.fromJson(
              json['CoreNetworkPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkPolicy = this.coreNetworkPolicy;
    return {
      if (coreNetworkPolicy != null) 'CoreNetworkPolicy': coreNetworkPolicy,
    };
  }
}

class DeleteCoreNetworkResponse {
  /// Information about the deleted core network.
  final CoreNetwork? coreNetwork;

  DeleteCoreNetworkResponse({
    this.coreNetwork,
  });

  factory DeleteCoreNetworkResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCoreNetworkResponse(
      coreNetwork: json['CoreNetwork'] != null
          ? CoreNetwork.fromJson(json['CoreNetwork'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetwork = this.coreNetwork;
    return {
      if (coreNetwork != null) 'CoreNetwork': coreNetwork,
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

class DeletePeeringResponse {
  /// Information about a deleted peering connection.
  final Peering? peering;

  DeletePeeringResponse({
    this.peering,
  });

  factory DeletePeeringResponse.fromJson(Map<String, dynamic> json) {
    return DeletePeeringResponse(
      peering: json['Peering'] != null
          ? Peering.fromJson(json['Peering'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final peering = this.peering;
    return {
      if (peering != null) 'Peering': peering,
    };
  }
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
  /// The Amazon Web Services location of the device.
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

extension DeviceStateValueExtension on DeviceState {
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

extension DeviceStateFromString on String {
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

class DisassociateConnectPeerResponse {
  /// Describes the Connect peer association.
  final ConnectPeerAssociation? connectPeerAssociation;

  DisassociateConnectPeerResponse({
    this.connectPeerAssociation,
  });

  factory DisassociateConnectPeerResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateConnectPeerResponse(
      connectPeerAssociation: json['ConnectPeerAssociation'] != null
          ? ConnectPeerAssociation.fromJson(
              json['ConnectPeerAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeerAssociation = this.connectPeerAssociation;
    return {
      if (connectPeerAssociation != null)
        'ConnectPeerAssociation': connectPeerAssociation,
    };
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

class ExecuteCoreNetworkChangeSetResponse {
  ExecuteCoreNetworkChangeSetResponse();

  factory ExecuteCoreNetworkChangeSetResponse.fromJson(Map<String, dynamic> _) {
    return ExecuteCoreNetworkChangeSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetConnectAttachmentResponse {
  /// Details about the Connect attachment.
  final ConnectAttachment? connectAttachment;

  GetConnectAttachmentResponse({
    this.connectAttachment,
  });

  factory GetConnectAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectAttachmentResponse(
      connectAttachment: json['ConnectAttachment'] != null
          ? ConnectAttachment.fromJson(
              json['ConnectAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectAttachment = this.connectAttachment;
    return {
      if (connectAttachment != null) 'ConnectAttachment': connectAttachment,
    };
  }
}

class GetConnectPeerAssociationsResponse {
  /// Displays a list of Connect peer associations.
  final List<ConnectPeerAssociation>? connectPeerAssociations;

  /// The token for the next page of results.
  final String? nextToken;

  GetConnectPeerAssociationsResponse({
    this.connectPeerAssociations,
    this.nextToken,
  });

  factory GetConnectPeerAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConnectPeerAssociationsResponse(
      connectPeerAssociations: (json['ConnectPeerAssociations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ConnectPeerAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeerAssociations = this.connectPeerAssociations;
    final nextToken = this.nextToken;
    return {
      if (connectPeerAssociations != null)
        'ConnectPeerAssociations': connectPeerAssociations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetConnectPeerResponse {
  /// Returns information about a core network Connect peer.
  final ConnectPeer? connectPeer;

  GetConnectPeerResponse({
    this.connectPeer,
  });

  factory GetConnectPeerResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectPeerResponse(
      connectPeer: json['ConnectPeer'] != null
          ? ConnectPeer.fromJson(json['ConnectPeer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeer = this.connectPeer;
    return {
      if (connectPeer != null) 'ConnectPeer': connectPeer,
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

class GetCoreNetworkChangeEventsResponse {
  /// The response to <code>GetCoreNetworkChangeEventsRequest</code>.
  final List<CoreNetworkChangeEvent>? coreNetworkChangeEvents;

  /// The token for the next page of results.
  final String? nextToken;

  GetCoreNetworkChangeEventsResponse({
    this.coreNetworkChangeEvents,
    this.nextToken,
  });

  factory GetCoreNetworkChangeEventsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCoreNetworkChangeEventsResponse(
      coreNetworkChangeEvents: (json['CoreNetworkChangeEvents'] as List?)
          ?.whereNotNull()
          .map(
              (e) => CoreNetworkChangeEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkChangeEvents = this.coreNetworkChangeEvents;
    final nextToken = this.nextToken;
    return {
      if (coreNetworkChangeEvents != null)
        'CoreNetworkChangeEvents': coreNetworkChangeEvents,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetCoreNetworkChangeSetResponse {
  /// Describes a core network changes.
  final List<CoreNetworkChange>? coreNetworkChanges;

  /// The token for the next page of results.
  final String? nextToken;

  GetCoreNetworkChangeSetResponse({
    this.coreNetworkChanges,
    this.nextToken,
  });

  factory GetCoreNetworkChangeSetResponse.fromJson(Map<String, dynamic> json) {
    return GetCoreNetworkChangeSetResponse(
      coreNetworkChanges: (json['CoreNetworkChanges'] as List?)
          ?.whereNotNull()
          .map((e) => CoreNetworkChange.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkChanges = this.coreNetworkChanges;
    final nextToken = this.nextToken;
    return {
      if (coreNetworkChanges != null) 'CoreNetworkChanges': coreNetworkChanges,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetCoreNetworkPolicyResponse {
  /// The details about a core network policy.
  final CoreNetworkPolicy? coreNetworkPolicy;

  GetCoreNetworkPolicyResponse({
    this.coreNetworkPolicy,
  });

  factory GetCoreNetworkPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetCoreNetworkPolicyResponse(
      coreNetworkPolicy: json['CoreNetworkPolicy'] != null
          ? CoreNetworkPolicy.fromJson(
              json['CoreNetworkPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkPolicy = this.coreNetworkPolicy;
    return {
      if (coreNetworkPolicy != null) 'CoreNetworkPolicy': coreNetworkPolicy,
    };
  }
}

class GetCoreNetworkResponse {
  /// Details about a core network.
  final CoreNetwork? coreNetwork;

  GetCoreNetworkResponse({
    this.coreNetwork,
  });

  factory GetCoreNetworkResponse.fromJson(Map<String, dynamic> json) {
    return GetCoreNetworkResponse(
      coreNetwork: json['CoreNetwork'] != null
          ? CoreNetwork.fromJson(json['CoreNetwork'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetwork = this.coreNetwork;
    return {
      if (coreNetwork != null) 'CoreNetwork': coreNetwork,
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

class GetNetworkResourceCountsResponse {
  /// The count of resources.
  final List<NetworkResourceCount>? networkResourceCounts;

  /// The token for the next page of results.
  final String? nextToken;

  GetNetworkResourceCountsResponse({
    this.networkResourceCounts,
    this.nextToken,
  });

  factory GetNetworkResourceCountsResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkResourceCountsResponse(
      networkResourceCounts: (json['NetworkResourceCounts'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkResourceCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkResourceCounts = this.networkResourceCounts;
    final nextToken = this.nextToken;
    return {
      if (networkResourceCounts != null)
        'NetworkResourceCounts': networkResourceCounts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetNetworkResourceRelationshipsResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// The resource relationships.
  final List<Relationship>? relationships;

  GetNetworkResourceRelationshipsResponse({
    this.nextToken,
    this.relationships,
  });

  factory GetNetworkResourceRelationshipsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNetworkResourceRelationshipsResponse(
      nextToken: json['NextToken'] as String?,
      relationships: (json['Relationships'] as List?)
          ?.whereNotNull()
          .map((e) => Relationship.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final relationships = this.relationships;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (relationships != null) 'Relationships': relationships,
    };
  }
}

class GetNetworkResourcesResponse {
  /// The network resources.
  final List<NetworkResource>? networkResources;

  /// The token for the next page of results.
  final String? nextToken;

  GetNetworkResourcesResponse({
    this.networkResources,
    this.nextToken,
  });

  factory GetNetworkResourcesResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkResourcesResponse(
      networkResources: (json['NetworkResources'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkResources = this.networkResources;
    final nextToken = this.nextToken;
    return {
      if (networkResources != null) 'NetworkResources': networkResources,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetNetworkRoutesResponse {
  /// Describes a core network segment edge.
  final CoreNetworkSegmentEdgeIdentifier? coreNetworkSegmentEdge;

  /// The network routes.
  final List<NetworkRoute>? networkRoutes;

  /// The ARN of the route table.
  final String? routeTableArn;

  /// The route table creation time.
  final DateTime? routeTableTimestamp;

  /// The route table type.
  final RouteTableType? routeTableType;

  GetNetworkRoutesResponse({
    this.coreNetworkSegmentEdge,
    this.networkRoutes,
    this.routeTableArn,
    this.routeTableTimestamp,
    this.routeTableType,
  });

  factory GetNetworkRoutesResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkRoutesResponse(
      coreNetworkSegmentEdge: json['CoreNetworkSegmentEdge'] != null
          ? CoreNetworkSegmentEdgeIdentifier.fromJson(
              json['CoreNetworkSegmentEdge'] as Map<String, dynamic>)
          : null,
      networkRoutes: (json['NetworkRoutes'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeTableArn: json['RouteTableArn'] as String?,
      routeTableTimestamp: timeStampFromJson(json['RouteTableTimestamp']),
      routeTableType: (json['RouteTableType'] as String?)?.toRouteTableType(),
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkSegmentEdge = this.coreNetworkSegmentEdge;
    final networkRoutes = this.networkRoutes;
    final routeTableArn = this.routeTableArn;
    final routeTableTimestamp = this.routeTableTimestamp;
    final routeTableType = this.routeTableType;
    return {
      if (coreNetworkSegmentEdge != null)
        'CoreNetworkSegmentEdge': coreNetworkSegmentEdge,
      if (networkRoutes != null) 'NetworkRoutes': networkRoutes,
      if (routeTableArn != null) 'RouteTableArn': routeTableArn,
      if (routeTableTimestamp != null)
        'RouteTableTimestamp': unixTimestampToJson(routeTableTimestamp),
      if (routeTableType != null) 'RouteTableType': routeTableType.toValue(),
    };
  }
}

class GetNetworkTelemetryResponse {
  /// The network telemetry.
  final List<NetworkTelemetry>? networkTelemetry;

  /// The token for the next page of results.
  final String? nextToken;

  GetNetworkTelemetryResponse({
    this.networkTelemetry,
    this.nextToken,
  });

  factory GetNetworkTelemetryResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkTelemetryResponse(
      networkTelemetry: (json['NetworkTelemetry'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkTelemetry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkTelemetry = this.networkTelemetry;
    final nextToken = this.nextToken;
    return {
      if (networkTelemetry != null) 'NetworkTelemetry': networkTelemetry,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetResourcePolicyResponse {
  /// The resource policy document.
  final Object? policyDocument;

  GetResourcePolicyResponse({
    this.policyDocument,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policyDocument: json['PolicyDocument'] == null
          ? null
          : jsonDecode(json['PolicyDocument'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    return {
      if (policyDocument != null) 'PolicyDocument': jsonEncode(policyDocument),
    };
  }
}

class GetRouteAnalysisResponse {
  /// The route analysis.
  final RouteAnalysis? routeAnalysis;

  GetRouteAnalysisResponse({
    this.routeAnalysis,
  });

  factory GetRouteAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return GetRouteAnalysisResponse(
      routeAnalysis: json['RouteAnalysis'] != null
          ? RouteAnalysis.fromJson(
              json['RouteAnalysis'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routeAnalysis = this.routeAnalysis;
    return {
      if (routeAnalysis != null) 'RouteAnalysis': routeAnalysis,
    };
  }
}

class GetSiteToSiteVpnAttachmentResponse {
  /// Describes the site-to-site attachment.
  final SiteToSiteVpnAttachment? siteToSiteVpnAttachment;

  GetSiteToSiteVpnAttachmentResponse({
    this.siteToSiteVpnAttachment,
  });

  factory GetSiteToSiteVpnAttachmentResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSiteToSiteVpnAttachmentResponse(
      siteToSiteVpnAttachment: json['SiteToSiteVpnAttachment'] != null
          ? SiteToSiteVpnAttachment.fromJson(
              json['SiteToSiteVpnAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final siteToSiteVpnAttachment = this.siteToSiteVpnAttachment;
    return {
      if (siteToSiteVpnAttachment != null)
        'SiteToSiteVpnAttachment': siteToSiteVpnAttachment,
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

class GetTransitGatewayPeeringResponse {
  /// Returns information about a transit gateway peering.
  final TransitGatewayPeering? transitGatewayPeering;

  GetTransitGatewayPeeringResponse({
    this.transitGatewayPeering,
  });

  factory GetTransitGatewayPeeringResponse.fromJson(Map<String, dynamic> json) {
    return GetTransitGatewayPeeringResponse(
      transitGatewayPeering: json['TransitGatewayPeering'] != null
          ? TransitGatewayPeering.fromJson(
              json['TransitGatewayPeering'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayPeering = this.transitGatewayPeering;
    return {
      if (transitGatewayPeering != null)
        'TransitGatewayPeering': transitGatewayPeering,
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

class GetTransitGatewayRouteTableAttachmentResponse {
  /// Returns information about the transit gateway route table attachment.
  final TransitGatewayRouteTableAttachment? transitGatewayRouteTableAttachment;

  GetTransitGatewayRouteTableAttachmentResponse({
    this.transitGatewayRouteTableAttachment,
  });

  factory GetTransitGatewayRouteTableAttachmentResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTransitGatewayRouteTableAttachmentResponse(
      transitGatewayRouteTableAttachment:
          json['TransitGatewayRouteTableAttachment'] != null
              ? TransitGatewayRouteTableAttachment.fromJson(
                  json['TransitGatewayRouteTableAttachment']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transitGatewayRouteTableAttachment =
        this.transitGatewayRouteTableAttachment;
    return {
      if (transitGatewayRouteTableAttachment != null)
        'TransitGatewayRouteTableAttachment':
            transitGatewayRouteTableAttachment,
    };
  }
}

class GetVpcAttachmentResponse {
  /// Returns details about a VPC attachment.
  final VpcAttachment? vpcAttachment;

  GetVpcAttachmentResponse({
    this.vpcAttachment,
  });

  factory GetVpcAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return GetVpcAttachmentResponse(
      vpcAttachment: json['VpcAttachment'] != null
          ? VpcAttachment.fromJson(
              json['VpcAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcAttachment = this.vpcAttachment;
    return {
      if (vpcAttachment != null) 'VpcAttachment': vpcAttachment,
    };
  }
}

/// Describes a global network. This is a single private network acting as a
/// high-level container for your network objects, including an Amazon Web
/// Services-managed Core Network.
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

extension GlobalNetworkStateValueExtension on GlobalNetworkState {
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

extension GlobalNetworkStateFromString on String {
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

extension LinkAssociationStateValueExtension on LinkAssociationState {
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

extension LinkAssociationStateFromString on String {
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

extension LinkStateValueExtension on LinkState {
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

extension LinkStateFromString on String {
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

class ListAttachmentsResponse {
  /// Describes the list of attachments.
  final List<Attachment>? attachments;

  /// The token for the next page of results.
  final String? nextToken;

  ListAttachmentsResponse({
    this.attachments,
    this.nextToken,
  });

  factory ListAttachmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAttachmentsResponse(
      attachments: (json['Attachments'] as List?)
          ?.whereNotNull()
          .map((e) => Attachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachments = this.attachments;
    final nextToken = this.nextToken;
    return {
      if (attachments != null) 'Attachments': attachments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListConnectPeersResponse {
  /// Describes the Connect peers.
  final List<ConnectPeerSummary>? connectPeers;

  /// The token for the next page of results.
  final String? nextToken;

  ListConnectPeersResponse({
    this.connectPeers,
    this.nextToken,
  });

  factory ListConnectPeersResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectPeersResponse(
      connectPeers: (json['ConnectPeers'] as List?)
          ?.whereNotNull()
          .map((e) => ConnectPeerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectPeers = this.connectPeers;
    final nextToken = this.nextToken;
    return {
      if (connectPeers != null) 'ConnectPeers': connectPeers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCoreNetworkPolicyVersionsResponse {
  /// Describes core network policy versions.
  final List<CoreNetworkPolicyVersion>? coreNetworkPolicyVersions;

  /// The token for the next page of results.
  final String? nextToken;

  ListCoreNetworkPolicyVersionsResponse({
    this.coreNetworkPolicyVersions,
    this.nextToken,
  });

  factory ListCoreNetworkPolicyVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCoreNetworkPolicyVersionsResponse(
      coreNetworkPolicyVersions: (json['CoreNetworkPolicyVersions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CoreNetworkPolicyVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkPolicyVersions = this.coreNetworkPolicyVersions;
    final nextToken = this.nextToken;
    return {
      if (coreNetworkPolicyVersions != null)
        'CoreNetworkPolicyVersions': coreNetworkPolicyVersions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCoreNetworksResponse {
  /// Describes the list of core networks.
  final List<CoreNetworkSummary>? coreNetworks;

  /// The token for the next page of results.
  final String? nextToken;

  ListCoreNetworksResponse({
    this.coreNetworks,
    this.nextToken,
  });

  factory ListCoreNetworksResponse.fromJson(Map<String, dynamic> json) {
    return ListCoreNetworksResponse(
      coreNetworks: (json['CoreNetworks'] as List?)
          ?.whereNotNull()
          .map((e) => CoreNetworkSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworks = this.coreNetworks;
    final nextToken = this.nextToken;
    return {
      if (coreNetworks != null) 'CoreNetworks': coreNetworks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOrganizationServiceAccessStatusResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// Displays the status of an Amazon Web Services Organization.
  final OrganizationStatus? organizationStatus;

  ListOrganizationServiceAccessStatusResponse({
    this.nextToken,
    this.organizationStatus,
  });

  factory ListOrganizationServiceAccessStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return ListOrganizationServiceAccessStatusResponse(
      nextToken: json['NextToken'] as String?,
      organizationStatus: json['OrganizationStatus'] != null
          ? OrganizationStatus.fromJson(
              json['OrganizationStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final organizationStatus = this.organizationStatus;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (organizationStatus != null) 'OrganizationStatus': organizationStatus,
    };
  }
}

class ListPeeringsResponse {
  /// The token for the next page of results.
  final String? nextToken;

  /// Lists the transit gateway peerings for the <code>ListPeerings</code>
  /// request.
  final List<Peering>? peerings;

  ListPeeringsResponse({
    this.nextToken,
    this.peerings,
  });

  factory ListPeeringsResponse.fromJson(Map<String, dynamic> json) {
    return ListPeeringsResponse(
      nextToken: json['NextToken'] as String?,
      peerings: (json['Peerings'] as List?)
          ?.whereNotNull()
          .map((e) => Peering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final peerings = this.peerings;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (peerings != null) 'Peerings': peerings,
    };
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

/// Describes a network resource.
class NetworkResource {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The Amazon Web Services Region.
  final String? awsRegion;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// Information about the resource, in JSON format. Network Manager gets this
  /// information by describing the resource using its Describe API call.
  final String? definition;

  /// The time that the resource definition was retrieved.
  final DateTime? definitionTimestamp;

  /// The resource metadata.
  final Map<String, String>? metadata;

  /// The ARN of the gateway.
  final String? registeredGatewayArn;

  /// The ARN of the resource.
  final String? resourceArn;

  /// The ID of the resource.
  final String? resourceId;

  /// The resource type.
  ///
  /// The following are the supported resource types for Direct Connect:
  ///
  /// <ul>
  /// <li>
  /// <code>dxcon</code>
  /// </li>
  /// <li>
  /// <code>dx-gateway</code>
  /// </li>
  /// <li>
  /// <code>dx-vif</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Network Manager:
  ///
  /// <ul>
  /// <li>
  /// <code>connection</code>
  /// </li>
  /// <li>
  /// <code>device</code>
  /// </li>
  /// <li>
  /// <code>link</code>
  /// </li>
  /// <li>
  /// <code>site</code>
  /// </li>
  /// </ul>
  /// The following are the supported resource types for Amazon VPC:
  ///
  /// <ul>
  /// <li>
  /// <code>customer-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-attachment</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-connect-peer</code>
  /// </li>
  /// <li>
  /// <code>transit-gateway-route-table</code>
  /// </li>
  /// <li>
  /// <code>vpn-connection</code>
  /// </li>
  /// </ul>
  final String? resourceType;

  /// The tags.
  final List<Tag>? tags;

  NetworkResource({
    this.accountId,
    this.awsRegion,
    this.coreNetworkId,
    this.definition,
    this.definitionTimestamp,
    this.metadata,
    this.registeredGatewayArn,
    this.resourceArn,
    this.resourceId,
    this.resourceType,
    this.tags,
  });

  factory NetworkResource.fromJson(Map<String, dynamic> json) {
    return NetworkResource(
      accountId: json['AccountId'] as String?,
      awsRegion: json['AwsRegion'] as String?,
      coreNetworkId: json['CoreNetworkId'] as String?,
      definition: json['Definition'] as String?,
      definitionTimestamp: timeStampFromJson(json['DefinitionTimestamp']),
      metadata: (json['Metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      registeredGatewayArn: json['RegisteredGatewayArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsRegion = this.awsRegion;
    final coreNetworkId = this.coreNetworkId;
    final definition = this.definition;
    final definitionTimestamp = this.definitionTimestamp;
    final metadata = this.metadata;
    final registeredGatewayArn = this.registeredGatewayArn;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final tags = this.tags;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (definition != null) 'Definition': definition,
      if (definitionTimestamp != null)
        'DefinitionTimestamp': unixTimestampToJson(definitionTimestamp),
      if (metadata != null) 'Metadata': metadata,
      if (registeredGatewayArn != null)
        'RegisteredGatewayArn': registeredGatewayArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Describes a resource count.
class NetworkResourceCount {
  /// The resource count.
  final int? count;

  /// The resource type.
  final String? resourceType;

  NetworkResourceCount({
    this.count,
    this.resourceType,
  });

  factory NetworkResourceCount.fromJson(Map<String, dynamic> json) {
    return NetworkResourceCount(
      count: json['Count'] as int?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final resourceType = this.resourceType;
    return {
      if (count != null) 'Count': count,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// Describes a network resource.
class NetworkResourceSummary {
  /// Information about the resource, in JSON format. Network Manager gets this
  /// information by describing the resource using its Describe API call.
  final String? definition;

  /// Indicates whether this is a middlebox appliance.
  final bool? isMiddlebox;

  /// The value for the Name tag.
  final String? nameTag;

  /// The ARN of the gateway.
  final String? registeredGatewayArn;

  /// The ARN of the resource.
  final String? resourceArn;

  /// The resource type.
  final String? resourceType;

  NetworkResourceSummary({
    this.definition,
    this.isMiddlebox,
    this.nameTag,
    this.registeredGatewayArn,
    this.resourceArn,
    this.resourceType,
  });

  factory NetworkResourceSummary.fromJson(Map<String, dynamic> json) {
    return NetworkResourceSummary(
      definition: json['Definition'] as String?,
      isMiddlebox: json['IsMiddlebox'] as bool?,
      nameTag: json['NameTag'] as String?,
      registeredGatewayArn: json['RegisteredGatewayArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final isMiddlebox = this.isMiddlebox;
    final nameTag = this.nameTag;
    final registeredGatewayArn = this.registeredGatewayArn;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    return {
      if (definition != null) 'Definition': definition,
      if (isMiddlebox != null) 'IsMiddlebox': isMiddlebox,
      if (nameTag != null) 'NameTag': nameTag,
      if (registeredGatewayArn != null)
        'RegisteredGatewayArn': registeredGatewayArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// Describes a network route.
class NetworkRoute {
  /// A unique identifier for the route, such as a CIDR block.
  final String? destinationCidrBlock;

  /// The destinations.
  final List<NetworkRouteDestination>? destinations;

  /// The ID of the prefix list.
  final String? prefixListId;

  /// The route state. The possible values are <code>active</code> and
  /// <code>blackhole</code>.
  final RouteState? state;

  /// The route type. The possible values are <code>propagated</code> and
  /// <code>static</code>.
  final RouteType? type;

  NetworkRoute({
    this.destinationCidrBlock,
    this.destinations,
    this.prefixListId,
    this.state,
    this.type,
  });

  factory NetworkRoute.fromJson(Map<String, dynamic> json) {
    return NetworkRoute(
      destinationCidrBlock: json['DestinationCidrBlock'] as String?,
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              NetworkRouteDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      prefixListId: json['PrefixListId'] as String?,
      state: (json['State'] as String?)?.toRouteState(),
      type: (json['Type'] as String?)?.toRouteType(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationCidrBlock = this.destinationCidrBlock;
    final destinations = this.destinations;
    final prefixListId = this.prefixListId;
    final state = this.state;
    final type = this.type;
    return {
      if (destinationCidrBlock != null)
        'DestinationCidrBlock': destinationCidrBlock,
      if (destinations != null) 'Destinations': destinations,
      if (prefixListId != null) 'PrefixListId': prefixListId,
      if (state != null) 'State': state.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Describes the destination of a network route.
class NetworkRouteDestination {
  /// The ID of a core network attachment.
  final String? coreNetworkAttachmentId;

  /// The edge location for the network destination.
  final String? edgeLocation;

  /// The ID of the resource.
  final String? resourceId;

  /// The resource type.
  final String? resourceType;

  /// The name of the segment.
  final String? segmentName;

  /// The ID of the transit gateway attachment.
  final String? transitGatewayAttachmentId;

  NetworkRouteDestination({
    this.coreNetworkAttachmentId,
    this.edgeLocation,
    this.resourceId,
    this.resourceType,
    this.segmentName,
    this.transitGatewayAttachmentId,
  });

  factory NetworkRouteDestination.fromJson(Map<String, dynamic> json) {
    return NetworkRouteDestination(
      coreNetworkAttachmentId: json['CoreNetworkAttachmentId'] as String?,
      edgeLocation: json['EdgeLocation'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
      segmentName: json['SegmentName'] as String?,
      transitGatewayAttachmentId: json['TransitGatewayAttachmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkAttachmentId = this.coreNetworkAttachmentId;
    final edgeLocation = this.edgeLocation;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final segmentName = this.segmentName;
    final transitGatewayAttachmentId = this.transitGatewayAttachmentId;
    return {
      if (coreNetworkAttachmentId != null)
        'CoreNetworkAttachmentId': coreNetworkAttachmentId,
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
      if (segmentName != null) 'SegmentName': segmentName,
      if (transitGatewayAttachmentId != null)
        'TransitGatewayAttachmentId': transitGatewayAttachmentId,
    };
  }
}

/// Describes the telemetry information for a resource.
class NetworkTelemetry {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The address.
  final String? address;

  /// The Amazon Web Services Region.
  final String? awsRegion;

  /// The ID of a core network.
  final String? coreNetworkId;

  /// The connection health.
  final ConnectionHealth? health;

  /// The ARN of the gateway.
  final String? registeredGatewayArn;

  /// The ARN of the resource.
  final String? resourceArn;

  /// The ID of the resource.
  final String? resourceId;

  /// The resource type.
  final String? resourceType;

  NetworkTelemetry({
    this.accountId,
    this.address,
    this.awsRegion,
    this.coreNetworkId,
    this.health,
    this.registeredGatewayArn,
    this.resourceArn,
    this.resourceId,
    this.resourceType,
  });

  factory NetworkTelemetry.fromJson(Map<String, dynamic> json) {
    return NetworkTelemetry(
      accountId: json['AccountId'] as String?,
      address: json['Address'] as String?,
      awsRegion: json['AwsRegion'] as String?,
      coreNetworkId: json['CoreNetworkId'] as String?,
      health: json['Health'] != null
          ? ConnectionHealth.fromJson(json['Health'] as Map<String, dynamic>)
          : null,
      registeredGatewayArn: json['RegisteredGatewayArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final address = this.address;
    final awsRegion = this.awsRegion;
    final coreNetworkId = this.coreNetworkId;
    final health = this.health;
    final registeredGatewayArn = this.registeredGatewayArn;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (address != null) 'Address': address,
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (health != null) 'Health': health,
      if (registeredGatewayArn != null)
        'RegisteredGatewayArn': registeredGatewayArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// The status of an Amazon Web Services Organization and the accounts within
/// that organization.
class OrganizationStatus {
  /// The current service-linked role (SLR) deployment status for an Amazon Web
  /// Services Organization's accounts. This will be either <code>SUCCEEDED</code>
  /// or <code>IN_PROGRESS</code>.
  final List<AccountStatus>? accountStatusList;

  /// The status of the organization's AWS service access. This will be
  /// <code>ENABLED</code> or <code>DISABLED</code>.
  final String? organizationAwsServiceAccessStatus;

  /// The ID of an Amazon Web Services Organization.
  final String? organizationId;

  /// The status of the SLR deployment for the account. This will be either
  /// <code>SUCCEEDED</code> or <code>IN_PROGRESS</code>.
  final String? sLRDeploymentStatus;

  OrganizationStatus({
    this.accountStatusList,
    this.organizationAwsServiceAccessStatus,
    this.organizationId,
    this.sLRDeploymentStatus,
  });

  factory OrganizationStatus.fromJson(Map<String, dynamic> json) {
    return OrganizationStatus(
      accountStatusList: (json['AccountStatusList'] as List?)
          ?.whereNotNull()
          .map((e) => AccountStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      organizationAwsServiceAccessStatus:
          json['OrganizationAwsServiceAccessStatus'] as String?,
      organizationId: json['OrganizationId'] as String?,
      sLRDeploymentStatus: json['SLRDeploymentStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountStatusList = this.accountStatusList;
    final organizationAwsServiceAccessStatus =
        this.organizationAwsServiceAccessStatus;
    final organizationId = this.organizationId;
    final sLRDeploymentStatus = this.sLRDeploymentStatus;
    return {
      if (accountStatusList != null) 'AccountStatusList': accountStatusList,
      if (organizationAwsServiceAccessStatus != null)
        'OrganizationAwsServiceAccessStatus':
            organizationAwsServiceAccessStatus,
      if (organizationId != null) 'OrganizationId': organizationId,
      if (sLRDeploymentStatus != null)
        'SLRDeploymentStatus': sLRDeploymentStatus,
    };
  }
}

/// Describes a path component.
class PathComponent {
  /// The destination CIDR block in the route table.
  final String? destinationCidrBlock;

  /// The resource.
  final NetworkResourceSummary? resource;

  /// The sequence number in the path. The destination is 0.
  final int? sequence;

  PathComponent({
    this.destinationCidrBlock,
    this.resource,
    this.sequence,
  });

  factory PathComponent.fromJson(Map<String, dynamic> json) {
    return PathComponent(
      destinationCidrBlock: json['DestinationCidrBlock'] as String?,
      resource: json['Resource'] != null
          ? NetworkResourceSummary.fromJson(
              json['Resource'] as Map<String, dynamic>)
          : null,
      sequence: json['Sequence'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationCidrBlock = this.destinationCidrBlock;
    final resource = this.resource;
    final sequence = this.sequence;
    return {
      if (destinationCidrBlock != null)
        'DestinationCidrBlock': destinationCidrBlock,
      if (resource != null) 'Resource': resource,
      if (sequence != null) 'Sequence': sequence,
    };
  }
}

/// Describes a peering connection.
class Peering {
  /// The ARN of a core network.
  final String? coreNetworkArn;

  /// The ID of the core network for the peering request.
  final String? coreNetworkId;

  /// The timestamp when the attachment peer was created.
  final DateTime? createdAt;

  /// The edge location for the peer.
  final String? edgeLocation;

  /// The ID of the account owner.
  final String? ownerAccountId;

  /// The ID of the peering attachment.
  final String? peeringId;

  /// The type of peering. This will be <code>TRANSIT_GATEWAY</code>.
  final PeeringType? peeringType;

  /// The resource ARN of the peer.
  final String? resourceArn;

  /// The current state of the peering connection.
  final PeeringState? state;

  /// The list of key-value tags associated with the peering.
  final List<Tag>? tags;

  Peering({
    this.coreNetworkArn,
    this.coreNetworkId,
    this.createdAt,
    this.edgeLocation,
    this.ownerAccountId,
    this.peeringId,
    this.peeringType,
    this.resourceArn,
    this.state,
    this.tags,
  });

  factory Peering.fromJson(Map<String, dynamic> json) {
    return Peering(
      coreNetworkArn: json['CoreNetworkArn'] as String?,
      coreNetworkId: json['CoreNetworkId'] as String?,
      createdAt: timeStampFromJson(json['CreatedAt']),
      edgeLocation: json['EdgeLocation'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      peeringId: json['PeeringId'] as String?,
      peeringType: (json['PeeringType'] as String?)?.toPeeringType(),
      resourceArn: json['ResourceArn'] as String?,
      state: (json['State'] as String?)?.toPeeringState(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkArn = this.coreNetworkArn;
    final coreNetworkId = this.coreNetworkId;
    final createdAt = this.createdAt;
    final edgeLocation = this.edgeLocation;
    final ownerAccountId = this.ownerAccountId;
    final peeringId = this.peeringId;
    final peeringType = this.peeringType;
    final resourceArn = this.resourceArn;
    final state = this.state;
    final tags = this.tags;
    return {
      if (coreNetworkArn != null) 'CoreNetworkArn': coreNetworkArn,
      if (coreNetworkId != null) 'CoreNetworkId': coreNetworkId,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (edgeLocation != null) 'EdgeLocation': edgeLocation,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (peeringId != null) 'PeeringId': peeringId,
      if (peeringType != null) 'PeeringType': peeringType.toValue(),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum PeeringState {
  creating,
  failed,
  available,
  deleting,
}

extension PeeringStateValueExtension on PeeringState {
  String toValue() {
    switch (this) {
      case PeeringState.creating:
        return 'CREATING';
      case PeeringState.failed:
        return 'FAILED';
      case PeeringState.available:
        return 'AVAILABLE';
      case PeeringState.deleting:
        return 'DELETING';
    }
  }
}

extension PeeringStateFromString on String {
  PeeringState toPeeringState() {
    switch (this) {
      case 'CREATING':
        return PeeringState.creating;
      case 'FAILED':
        return PeeringState.failed;
      case 'AVAILABLE':
        return PeeringState.available;
      case 'DELETING':
        return PeeringState.deleting;
    }
    throw Exception('$this is not known in enum PeeringState');
  }
}

enum PeeringType {
  transitGateway,
}

extension PeeringTypeValueExtension on PeeringType {
  String toValue() {
    switch (this) {
      case PeeringType.transitGateway:
        return 'TRANSIT_GATEWAY';
    }
  }
}

extension PeeringTypeFromString on String {
  PeeringType toPeeringType() {
    switch (this) {
      case 'TRANSIT_GATEWAY':
        return PeeringType.transitGateway;
    }
    throw Exception('$this is not known in enum PeeringType');
  }
}

/// Describes a proposed segment change. In some cases, the segment change must
/// first be evaluated and accepted.
class ProposedSegmentChange {
  /// The rule number in the policy document that applies to this change.
  final int? attachmentPolicyRuleNumber;

  /// The name of the segment to change.
  final String? segmentName;

  /// The list of key-value tags that changed for the segment.
  final List<Tag>? tags;

  ProposedSegmentChange({
    this.attachmentPolicyRuleNumber,
    this.segmentName,
    this.tags,
  });

  factory ProposedSegmentChange.fromJson(Map<String, dynamic> json) {
    return ProposedSegmentChange(
      attachmentPolicyRuleNumber: json['AttachmentPolicyRuleNumber'] as int?,
      segmentName: json['SegmentName'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentPolicyRuleNumber = this.attachmentPolicyRuleNumber;
    final segmentName = this.segmentName;
    final tags = this.tags;
    return {
      if (attachmentPolicyRuleNumber != null)
        'AttachmentPolicyRuleNumber': attachmentPolicyRuleNumber,
      if (segmentName != null) 'SegmentName': segmentName,
      if (tags != null) 'Tags': tags,
    };
  }
}

class PutCoreNetworkPolicyResponse {
  /// Describes the changed core network policy.
  final CoreNetworkPolicy? coreNetworkPolicy;

  PutCoreNetworkPolicyResponse({
    this.coreNetworkPolicy,
  });

  factory PutCoreNetworkPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutCoreNetworkPolicyResponse(
      coreNetworkPolicy: json['CoreNetworkPolicy'] != null
          ? CoreNetworkPolicy.fromJson(
              json['CoreNetworkPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkPolicy = this.coreNetworkPolicy;
    return {
      if (coreNetworkPolicy != null) 'CoreNetworkPolicy': coreNetworkPolicy,
    };
  }
}

class PutResourcePolicyResponse {
  PutResourcePolicyResponse();

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class RejectAttachmentResponse {
  /// Describes the rejected attachment request.
  final Attachment? attachment;

  RejectAttachmentResponse({
    this.attachment,
  });

  factory RejectAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return RejectAttachmentResponse(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    return {
      if (attachment != null) 'Attachment': attachment,
    };
  }
}

/// Describes a resource relationship.
class Relationship {
  /// The ARN of the resource.
  final String? from;

  /// The ARN of the resource.
  final String? to;

  Relationship({
    this.from,
    this.to,
  });

  factory Relationship.fromJson(Map<String, dynamic> json) {
    return Relationship(
      from: json['From'] as String?,
      to: json['To'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      if (from != null) 'From': from,
      if (to != null) 'To': to,
    };
  }
}

class RestoreCoreNetworkPolicyVersionResponse {
  /// Describes the restored core network policy.
  final CoreNetworkPolicy? coreNetworkPolicy;

  RestoreCoreNetworkPolicyVersionResponse({
    this.coreNetworkPolicy,
  });

  factory RestoreCoreNetworkPolicyVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return RestoreCoreNetworkPolicyVersionResponse(
      coreNetworkPolicy: json['CoreNetworkPolicy'] != null
          ? CoreNetworkPolicy.fromJson(
              json['CoreNetworkPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetworkPolicy = this.coreNetworkPolicy;
    return {
      if (coreNetworkPolicy != null) 'CoreNetworkPolicy': coreNetworkPolicy,
    };
  }
}

/// Describes a route analysis.
class RouteAnalysis {
  /// The destination.
  final RouteAnalysisEndpointOptions? destination;

  /// The forward path.
  final RouteAnalysisPath? forwardPath;

  /// The ID of the global network.
  final String? globalNetworkId;

  /// Indicates whether to analyze the return path. The return path is not
  /// analyzed if the forward path analysis does not succeed.
  final bool? includeReturnPath;

  /// The ID of the AWS account that created the route analysis.
  final String? ownerAccountId;

  /// The return path.
  final RouteAnalysisPath? returnPath;

  /// The ID of the route analysis.
  final String? routeAnalysisId;

  /// The source.
  final RouteAnalysisEndpointOptions? source;

  /// The time that the analysis started.
  final DateTime? startTimestamp;

  /// The status of the route analysis.
  final RouteAnalysisStatus? status;

  /// Indicates whether to include the location of middlebox appliances in the
  /// route analysis.
  final bool? useMiddleboxes;

  RouteAnalysis({
    this.destination,
    this.forwardPath,
    this.globalNetworkId,
    this.includeReturnPath,
    this.ownerAccountId,
    this.returnPath,
    this.routeAnalysisId,
    this.source,
    this.startTimestamp,
    this.status,
    this.useMiddleboxes,
  });

  factory RouteAnalysis.fromJson(Map<String, dynamic> json) {
    return RouteAnalysis(
      destination: json['Destination'] != null
          ? RouteAnalysisEndpointOptions.fromJson(
              json['Destination'] as Map<String, dynamic>)
          : null,
      forwardPath: json['ForwardPath'] != null
          ? RouteAnalysisPath.fromJson(
              json['ForwardPath'] as Map<String, dynamic>)
          : null,
      globalNetworkId: json['GlobalNetworkId'] as String?,
      includeReturnPath: json['IncludeReturnPath'] as bool?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      returnPath: json['ReturnPath'] != null
          ? RouteAnalysisPath.fromJson(
              json['ReturnPath'] as Map<String, dynamic>)
          : null,
      routeAnalysisId: json['RouteAnalysisId'] as String?,
      source: json['Source'] != null
          ? RouteAnalysisEndpointOptions.fromJson(
              json['Source'] as Map<String, dynamic>)
          : null,
      startTimestamp: timeStampFromJson(json['StartTimestamp']),
      status: (json['Status'] as String?)?.toRouteAnalysisStatus(),
      useMiddleboxes: json['UseMiddleboxes'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final forwardPath = this.forwardPath;
    final globalNetworkId = this.globalNetworkId;
    final includeReturnPath = this.includeReturnPath;
    final ownerAccountId = this.ownerAccountId;
    final returnPath = this.returnPath;
    final routeAnalysisId = this.routeAnalysisId;
    final source = this.source;
    final startTimestamp = this.startTimestamp;
    final status = this.status;
    final useMiddleboxes = this.useMiddleboxes;
    return {
      if (destination != null) 'Destination': destination,
      if (forwardPath != null) 'ForwardPath': forwardPath,
      if (globalNetworkId != null) 'GlobalNetworkId': globalNetworkId,
      if (includeReturnPath != null) 'IncludeReturnPath': includeReturnPath,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (returnPath != null) 'ReturnPath': returnPath,
      if (routeAnalysisId != null) 'RouteAnalysisId': routeAnalysisId,
      if (source != null) 'Source': source,
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
      if (status != null) 'Status': status.toValue(),
      if (useMiddleboxes != null) 'UseMiddleboxes': useMiddleboxes,
    };
  }
}

/// Describes the status of an analysis at completion.
class RouteAnalysisCompletion {
  /// The reason code. Available only if a connection is not found.
  ///
  /// <ul>
  /// <li>
  /// <code>BLACKHOLE_ROUTE_FOR_DESTINATION_FOUND</code> - Found a black hole
  /// route with the destination CIDR block.
  /// </li>
  /// <li>
  /// <code>CYCLIC_PATH_DETECTED</code> - Found the same resource multiple times
  /// while traversing the path.
  /// </li>
  /// <li>
  /// <code>INACTIVE_ROUTE_FOR_DESTINATION_FOUND</code> - Found an inactive route
  /// with the destination CIDR block.
  /// </li>
  /// <li>
  /// <code>MAX_HOPS_EXCEEDED</code> - Analysis exceeded 64 hops without finding
  /// the destination.
  /// </li>
  /// <li>
  /// <code>ROUTE_NOT_FOUND</code> - Cannot find a route table with the
  /// destination CIDR block.
  /// </li>
  /// <li>
  /// <code>TGW_ATTACH_ARN_NO_MATCH</code> - Found an attachment, but not with the
  /// correct destination ARN.
  /// </li>
  /// <li>
  /// <code>TGW_ATTACH_NOT_FOUND</code> - Cannot find an attachment.
  /// </li>
  /// <li>
  /// <code>TGW_ATTACH_NOT_IN_TGW</code> - Found an attachment, but not to the
  /// correct transit gateway.
  /// </li>
  /// <li>
  /// <code>TGW_ATTACH_STABLE_ROUTE_TABLE_NOT_FOUND</code> - The state of the
  /// route table association is not associated.
  /// </li>
  /// </ul>
  final RouteAnalysisCompletionReasonCode? reasonCode;

  /// Additional information about the path. Available only if a connection is not
  /// found.
  final Map<String, String>? reasonContext;

  /// The result of the analysis. If the status is <code>NOT_CONNECTED</code>,
  /// check the reason code.
  final RouteAnalysisCompletionResultCode? resultCode;

  RouteAnalysisCompletion({
    this.reasonCode,
    this.reasonContext,
    this.resultCode,
  });

  factory RouteAnalysisCompletion.fromJson(Map<String, dynamic> json) {
    return RouteAnalysisCompletion(
      reasonCode: (json['ReasonCode'] as String?)
          ?.toRouteAnalysisCompletionReasonCode(),
      reasonContext: (json['ReasonContext'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resultCode: (json['ResultCode'] as String?)
          ?.toRouteAnalysisCompletionResultCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final reasonCode = this.reasonCode;
    final reasonContext = this.reasonContext;
    final resultCode = this.resultCode;
    return {
      if (reasonCode != null) 'ReasonCode': reasonCode.toValue(),
      if (reasonContext != null) 'ReasonContext': reasonContext,
      if (resultCode != null) 'ResultCode': resultCode.toValue(),
    };
  }
}

enum RouteAnalysisCompletionReasonCode {
  transitGatewayAttachmentNotFound,
  transitGatewayAttachmentNotInTransitGateway,
  cyclicPathDetected,
  transitGatewayAttachmentStableRouteTableNotFound,
  routeNotFound,
  blackholeRouteForDestinationFound,
  inactiveRouteForDestinationFound,
  transitGatewayAttachmentAttachArnNoMatch,
  maxHopsExceeded,
  possibleMiddlebox,
  noDestinationArnProvided,
}

extension RouteAnalysisCompletionReasonCodeValueExtension
    on RouteAnalysisCompletionReasonCode {
  String toValue() {
    switch (this) {
      case RouteAnalysisCompletionReasonCode.transitGatewayAttachmentNotFound:
        return 'TRANSIT_GATEWAY_ATTACHMENT_NOT_FOUND';
      case RouteAnalysisCompletionReasonCode
            .transitGatewayAttachmentNotInTransitGateway:
        return 'TRANSIT_GATEWAY_ATTACHMENT_NOT_IN_TRANSIT_GATEWAY';
      case RouteAnalysisCompletionReasonCode.cyclicPathDetected:
        return 'CYCLIC_PATH_DETECTED';
      case RouteAnalysisCompletionReasonCode
            .transitGatewayAttachmentStableRouteTableNotFound:
        return 'TRANSIT_GATEWAY_ATTACHMENT_STABLE_ROUTE_TABLE_NOT_FOUND';
      case RouteAnalysisCompletionReasonCode.routeNotFound:
        return 'ROUTE_NOT_FOUND';
      case RouteAnalysisCompletionReasonCode.blackholeRouteForDestinationFound:
        return 'BLACKHOLE_ROUTE_FOR_DESTINATION_FOUND';
      case RouteAnalysisCompletionReasonCode.inactiveRouteForDestinationFound:
        return 'INACTIVE_ROUTE_FOR_DESTINATION_FOUND';
      case RouteAnalysisCompletionReasonCode
            .transitGatewayAttachmentAttachArnNoMatch:
        return 'TRANSIT_GATEWAY_ATTACHMENT_ATTACH_ARN_NO_MATCH';
      case RouteAnalysisCompletionReasonCode.maxHopsExceeded:
        return 'MAX_HOPS_EXCEEDED';
      case RouteAnalysisCompletionReasonCode.possibleMiddlebox:
        return 'POSSIBLE_MIDDLEBOX';
      case RouteAnalysisCompletionReasonCode.noDestinationArnProvided:
        return 'NO_DESTINATION_ARN_PROVIDED';
    }
  }
}

extension RouteAnalysisCompletionReasonCodeFromString on String {
  RouteAnalysisCompletionReasonCode toRouteAnalysisCompletionReasonCode() {
    switch (this) {
      case 'TRANSIT_GATEWAY_ATTACHMENT_NOT_FOUND':
        return RouteAnalysisCompletionReasonCode
            .transitGatewayAttachmentNotFound;
      case 'TRANSIT_GATEWAY_ATTACHMENT_NOT_IN_TRANSIT_GATEWAY':
        return RouteAnalysisCompletionReasonCode
            .transitGatewayAttachmentNotInTransitGateway;
      case 'CYCLIC_PATH_DETECTED':
        return RouteAnalysisCompletionReasonCode.cyclicPathDetected;
      case 'TRANSIT_GATEWAY_ATTACHMENT_STABLE_ROUTE_TABLE_NOT_FOUND':
        return RouteAnalysisCompletionReasonCode
            .transitGatewayAttachmentStableRouteTableNotFound;
      case 'ROUTE_NOT_FOUND':
        return RouteAnalysisCompletionReasonCode.routeNotFound;
      case 'BLACKHOLE_ROUTE_FOR_DESTINATION_FOUND':
        return RouteAnalysisCompletionReasonCode
            .blackholeRouteForDestinationFound;
      case 'INACTIVE_ROUTE_FOR_DESTINATION_FOUND':
        return RouteAnalysisCompletionReasonCode
            .inactiveRouteForDestinationFound;
      case 'TRANSIT_GATEWAY_ATTACHMENT_ATTACH_ARN_NO_MATCH':
        return RouteAnalysisCompletionReasonCode
            .transitGatewayAttachmentAttachArnNoMatch;
      case 'MAX_HOPS_EXCEEDED':
        return RouteAnalysisCompletionReasonCode.maxHopsExceeded;
      case 'POSSIBLE_MIDDLEBOX':
        return RouteAnalysisCompletionReasonCode.possibleMiddlebox;
      case 'NO_DESTINATION_ARN_PROVIDED':
        return RouteAnalysisCompletionReasonCode.noDestinationArnProvided;
    }
    throw Exception(
        '$this is not known in enum RouteAnalysisCompletionReasonCode');
  }
}

enum RouteAnalysisCompletionResultCode {
  connected,
  notConnected,
}

extension RouteAnalysisCompletionResultCodeValueExtension
    on RouteAnalysisCompletionResultCode {
  String toValue() {
    switch (this) {
      case RouteAnalysisCompletionResultCode.connected:
        return 'CONNECTED';
      case RouteAnalysisCompletionResultCode.notConnected:
        return 'NOT_CONNECTED';
    }
  }
}

extension RouteAnalysisCompletionResultCodeFromString on String {
  RouteAnalysisCompletionResultCode toRouteAnalysisCompletionResultCode() {
    switch (this) {
      case 'CONNECTED':
        return RouteAnalysisCompletionResultCode.connected;
      case 'NOT_CONNECTED':
        return RouteAnalysisCompletionResultCode.notConnected;
    }
    throw Exception(
        '$this is not known in enum RouteAnalysisCompletionResultCode');
  }
}

/// Describes a source or a destination.
class RouteAnalysisEndpointOptions {
  /// The IP address.
  final String? ipAddress;

  /// The ARN of the transit gateway.
  final String? transitGatewayArn;

  /// The ARN of the transit gateway attachment.
  final String? transitGatewayAttachmentArn;

  RouteAnalysisEndpointOptions({
    this.ipAddress,
    this.transitGatewayArn,
    this.transitGatewayAttachmentArn,
  });

  factory RouteAnalysisEndpointOptions.fromJson(Map<String, dynamic> json) {
    return RouteAnalysisEndpointOptions(
      ipAddress: json['IpAddress'] as String?,
      transitGatewayArn: json['TransitGatewayArn'] as String?,
      transitGatewayAttachmentArn:
          json['TransitGatewayAttachmentArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    final transitGatewayArn = this.transitGatewayArn;
    final transitGatewayAttachmentArn = this.transitGatewayAttachmentArn;
    return {
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (transitGatewayArn != null) 'TransitGatewayArn': transitGatewayArn,
      if (transitGatewayAttachmentArn != null)
        'TransitGatewayAttachmentArn': transitGatewayAttachmentArn,
    };
  }
}

/// Describes a source or a destination.
class RouteAnalysisEndpointOptionsSpecification {
  /// The IP address.
  final String? ipAddress;

  /// The ARN of the transit gateway attachment.
  final String? transitGatewayAttachmentArn;

  RouteAnalysisEndpointOptionsSpecification({
    this.ipAddress,
    this.transitGatewayAttachmentArn,
  });

  Map<String, dynamic> toJson() {
    final ipAddress = this.ipAddress;
    final transitGatewayAttachmentArn = this.transitGatewayAttachmentArn;
    return {
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (transitGatewayAttachmentArn != null)
        'TransitGatewayAttachmentArn': transitGatewayAttachmentArn,
    };
  }
}

/// Describes a route analysis path.
class RouteAnalysisPath {
  /// The status of the analysis at completion.
  final RouteAnalysisCompletion? completionStatus;

  /// The route analysis path.
  final List<PathComponent>? path;

  RouteAnalysisPath({
    this.completionStatus,
    this.path,
  });

  factory RouteAnalysisPath.fromJson(Map<String, dynamic> json) {
    return RouteAnalysisPath(
      completionStatus: json['CompletionStatus'] != null
          ? RouteAnalysisCompletion.fromJson(
              json['CompletionStatus'] as Map<String, dynamic>)
          : null,
      path: (json['Path'] as List?)
          ?.whereNotNull()
          .map((e) => PathComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final completionStatus = this.completionStatus;
    final path = this.path;
    return {
      if (completionStatus != null) 'CompletionStatus': completionStatus,
      if (path != null) 'Path': path,
    };
  }
}

enum RouteAnalysisStatus {
  running,
  completed,
  failed,
}

extension RouteAnalysisStatusValueExtension on RouteAnalysisStatus {
  String toValue() {
    switch (this) {
      case RouteAnalysisStatus.running:
        return 'RUNNING';
      case RouteAnalysisStatus.completed:
        return 'COMPLETED';
      case RouteAnalysisStatus.failed:
        return 'FAILED';
    }
  }
}

extension RouteAnalysisStatusFromString on String {
  RouteAnalysisStatus toRouteAnalysisStatus() {
    switch (this) {
      case 'RUNNING':
        return RouteAnalysisStatus.running;
      case 'COMPLETED':
        return RouteAnalysisStatus.completed;
      case 'FAILED':
        return RouteAnalysisStatus.failed;
    }
    throw Exception('$this is not known in enum RouteAnalysisStatus');
  }
}

enum RouteState {
  active,
  blackhole,
}

extension RouteStateValueExtension on RouteState {
  String toValue() {
    switch (this) {
      case RouteState.active:
        return 'ACTIVE';
      case RouteState.blackhole:
        return 'BLACKHOLE';
    }
  }
}

extension RouteStateFromString on String {
  RouteState toRouteState() {
    switch (this) {
      case 'ACTIVE':
        return RouteState.active;
      case 'BLACKHOLE':
        return RouteState.blackhole;
    }
    throw Exception('$this is not known in enum RouteState');
  }
}

/// Describes a route table.
class RouteTableIdentifier {
  /// The segment edge in a core network.
  final CoreNetworkSegmentEdgeIdentifier? coreNetworkSegmentEdge;

  /// The ARN of the transit gateway route table for the attachment request. For
  /// example, <code>"TransitGatewayRouteTableArn":
  /// "arn:aws:ec2:us-west-2:123456789012:transit-gateway-route-table/tgw-rtb-9876543210123456"</code>.
  final String? transitGatewayRouteTableArn;

  RouteTableIdentifier({
    this.coreNetworkSegmentEdge,
    this.transitGatewayRouteTableArn,
  });

  Map<String, dynamic> toJson() {
    final coreNetworkSegmentEdge = this.coreNetworkSegmentEdge;
    final transitGatewayRouteTableArn = this.transitGatewayRouteTableArn;
    return {
      if (coreNetworkSegmentEdge != null)
        'CoreNetworkSegmentEdge': coreNetworkSegmentEdge,
      if (transitGatewayRouteTableArn != null)
        'TransitGatewayRouteTableArn': transitGatewayRouteTableArn,
    };
  }
}

enum RouteTableType {
  transitGatewayRouteTable,
  coreNetworkSegment,
}

extension RouteTableTypeValueExtension on RouteTableType {
  String toValue() {
    switch (this) {
      case RouteTableType.transitGatewayRouteTable:
        return 'TRANSIT_GATEWAY_ROUTE_TABLE';
      case RouteTableType.coreNetworkSegment:
        return 'CORE_NETWORK_SEGMENT';
    }
  }
}

extension RouteTableTypeFromString on String {
  RouteTableType toRouteTableType() {
    switch (this) {
      case 'TRANSIT_GATEWAY_ROUTE_TABLE':
        return RouteTableType.transitGatewayRouteTable;
      case 'CORE_NETWORK_SEGMENT':
        return RouteTableType.coreNetworkSegment;
    }
    throw Exception('$this is not known in enum RouteTableType');
  }
}

enum RouteType {
  propagated,
  static,
}

extension RouteTypeValueExtension on RouteType {
  String toValue() {
    switch (this) {
      case RouteType.propagated:
        return 'PROPAGATED';
      case RouteType.static:
        return 'STATIC';
    }
  }
}

extension RouteTypeFromString on String {
  RouteType toRouteType() {
    switch (this) {
      case 'PROPAGATED':
        return RouteType.propagated;
      case 'STATIC':
        return RouteType.static;
    }
    throw Exception('$this is not known in enum RouteType');
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

extension SiteStateValueExtension on SiteState {
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

extension SiteStateFromString on String {
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

/// Creates a site-to-site VPN attachment.
class SiteToSiteVpnAttachment {
  /// Provides details about a site-to-site VPN attachment.
  final Attachment? attachment;

  /// The ARN of the site-to-site VPN attachment.
  final String? vpnConnectionArn;

  SiteToSiteVpnAttachment({
    this.attachment,
    this.vpnConnectionArn,
  });

  factory SiteToSiteVpnAttachment.fromJson(Map<String, dynamic> json) {
    return SiteToSiteVpnAttachment(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
      vpnConnectionArn: json['VpnConnectionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final vpnConnectionArn = this.vpnConnectionArn;
    return {
      if (attachment != null) 'Attachment': attachment,
      if (vpnConnectionArn != null) 'VpnConnectionArn': vpnConnectionArn,
    };
  }
}

class StartOrganizationServiceAccessUpdateResponse {
  /// The status of the service access update request for an Amazon Web Services
  /// Organization.
  final OrganizationStatus? organizationStatus;

  StartOrganizationServiceAccessUpdateResponse({
    this.organizationStatus,
  });

  factory StartOrganizationServiceAccessUpdateResponse.fromJson(
      Map<String, dynamic> json) {
    return StartOrganizationServiceAccessUpdateResponse(
      organizationStatus: json['OrganizationStatus'] != null
          ? OrganizationStatus.fromJson(
              json['OrganizationStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationStatus = this.organizationStatus;
    return {
      if (organizationStatus != null) 'OrganizationStatus': organizationStatus,
    };
  }
}

class StartRouteAnalysisResponse {
  /// The route analysis.
  final RouteAnalysis? routeAnalysis;

  StartRouteAnalysisResponse({
    this.routeAnalysis,
  });

  factory StartRouteAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return StartRouteAnalysisResponse(
      routeAnalysis: json['RouteAnalysis'] != null
          ? RouteAnalysis.fromJson(
              json['RouteAnalysis'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final routeAnalysis = this.routeAnalysis;
    return {
      if (routeAnalysis != null) 'RouteAnalysis': routeAnalysis,
    };
  }
}

/// Describes a tag.
class Tag {
  /// The tag key.
  ///
  /// Constraints: Maximum length of 128 characters.
  final String? key;

  /// The tag value.
  ///
  /// Constraints: Maximum length of 256 characters.
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

extension TransitGatewayConnectPeerAssociationStateValueExtension
    on TransitGatewayConnectPeerAssociationState {
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

extension TransitGatewayConnectPeerAssociationStateFromString on String {
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

/// Describes a transit gateway peering attachment.
class TransitGatewayPeering {
  /// Describes a transit gateway peer connection.
  final Peering? peering;

  /// The ARN of the transit gateway.
  final String? transitGatewayArn;

  /// The ID of the transit gateway peering attachment.
  final String? transitGatewayPeeringAttachmentId;

  TransitGatewayPeering({
    this.peering,
    this.transitGatewayArn,
    this.transitGatewayPeeringAttachmentId,
  });

  factory TransitGatewayPeering.fromJson(Map<String, dynamic> json) {
    return TransitGatewayPeering(
      peering: json['Peering'] != null
          ? Peering.fromJson(json['Peering'] as Map<String, dynamic>)
          : null,
      transitGatewayArn: json['TransitGatewayArn'] as String?,
      transitGatewayPeeringAttachmentId:
          json['TransitGatewayPeeringAttachmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final peering = this.peering;
    final transitGatewayArn = this.transitGatewayArn;
    final transitGatewayPeeringAttachmentId =
        this.transitGatewayPeeringAttachmentId;
    return {
      if (peering != null) 'Peering': peering,
      if (transitGatewayArn != null) 'TransitGatewayArn': transitGatewayArn,
      if (transitGatewayPeeringAttachmentId != null)
        'TransitGatewayPeeringAttachmentId': transitGatewayPeeringAttachmentId,
    };
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

extension TransitGatewayRegistrationStateValueExtension
    on TransitGatewayRegistrationState {
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

extension TransitGatewayRegistrationStateFromString on String {
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

/// Describes a transit gateway route table attachment.
class TransitGatewayRouteTableAttachment {
  final Attachment? attachment;

  /// The ID of the peering attachment.
  final String? peeringId;

  /// The ARN of the transit gateway attachment route table. For example,
  /// <code>"TransitGatewayRouteTableArn":
  /// "arn:aws:ec2:us-west-2:123456789012:transit-gateway-route-table/tgw-rtb-9876543210123456"</code>.
  final String? transitGatewayRouteTableArn;

  TransitGatewayRouteTableAttachment({
    this.attachment,
    this.peeringId,
    this.transitGatewayRouteTableArn,
  });

  factory TransitGatewayRouteTableAttachment.fromJson(
      Map<String, dynamic> json) {
    return TransitGatewayRouteTableAttachment(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
      peeringId: json['PeeringId'] as String?,
      transitGatewayRouteTableArn:
          json['TransitGatewayRouteTableArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final peeringId = this.peeringId;
    final transitGatewayRouteTableArn = this.transitGatewayRouteTableArn;
    return {
      if (attachment != null) 'Attachment': attachment,
      if (peeringId != null) 'PeeringId': peeringId,
      if (transitGatewayRouteTableArn != null)
        'TransitGatewayRouteTableArn': transitGatewayRouteTableArn,
    };
  }
}

enum TunnelProtocol {
  gre,
  noEncap,
}

extension TunnelProtocolValueExtension on TunnelProtocol {
  String toValue() {
    switch (this) {
      case TunnelProtocol.gre:
        return 'GRE';
      case TunnelProtocol.noEncap:
        return 'NO_ENCAP';
    }
  }
}

extension TunnelProtocolFromString on String {
  TunnelProtocol toTunnelProtocol() {
    switch (this) {
      case 'GRE':
        return TunnelProtocol.gre;
      case 'NO_ENCAP':
        return TunnelProtocol.noEncap;
    }
    throw Exception('$this is not known in enum TunnelProtocol');
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

class UpdateCoreNetworkResponse {
  /// Returns information about a core network update.
  final CoreNetwork? coreNetwork;

  UpdateCoreNetworkResponse({
    this.coreNetwork,
  });

  factory UpdateCoreNetworkResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCoreNetworkResponse(
      coreNetwork: json['CoreNetwork'] != null
          ? CoreNetwork.fromJson(json['CoreNetwork'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final coreNetwork = this.coreNetwork;
    return {
      if (coreNetwork != null) 'CoreNetwork': coreNetwork,
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

class UpdateNetworkResourceMetadataResponse {
  /// The updated resource metadata.
  final Map<String, String>? metadata;

  /// The ARN of the resource.
  final String? resourceArn;

  UpdateNetworkResourceMetadataResponse({
    this.metadata,
    this.resourceArn,
  });

  factory UpdateNetworkResourceMetadataResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateNetworkResourceMetadataResponse(
      metadata: (json['Metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceArn: json['ResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final resourceArn = this.resourceArn;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (resourceArn != null) 'ResourceArn': resourceArn,
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

class UpdateVpcAttachmentResponse {
  /// Describes the updated VPC attachment.
  final VpcAttachment? vpcAttachment;

  UpdateVpcAttachmentResponse({
    this.vpcAttachment,
  });

  factory UpdateVpcAttachmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVpcAttachmentResponse(
      vpcAttachment: json['VpcAttachment'] != null
          ? VpcAttachment.fromJson(
              json['VpcAttachment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vpcAttachment = this.vpcAttachment;
    return {
      if (vpcAttachment != null) 'VpcAttachment': vpcAttachment,
    };
  }
}

/// Describes a VPC attachment.
class VpcAttachment {
  /// Provides details about the VPC attachment.
  final Attachment? attachment;

  /// Provides details about the VPC attachment.
  final VpcOptions? options;

  /// The subnet ARNs.
  final List<String>? subnetArns;

  VpcAttachment({
    this.attachment,
    this.options,
    this.subnetArns,
  });

  factory VpcAttachment.fromJson(Map<String, dynamic> json) {
    return VpcAttachment(
      attachment: json['Attachment'] != null
          ? Attachment.fromJson(json['Attachment'] as Map<String, dynamic>)
          : null,
      options: json['Options'] != null
          ? VpcOptions.fromJson(json['Options'] as Map<String, dynamic>)
          : null,
      subnetArns: (json['SubnetArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attachment = this.attachment;
    final options = this.options;
    final subnetArns = this.subnetArns;
    return {
      if (attachment != null) 'Attachment': attachment,
      if (options != null) 'Options': options,
      if (subnetArns != null) 'SubnetArns': subnetArns,
    };
  }
}

/// Describes the VPC options.
class VpcOptions {
  /// Indicates whether appliance mode is supported. If enabled, traffic flow
  /// between a source and destination use the same Availability Zone for the VPC
  /// attachment for the lifetime of that flow. The default value is
  /// <code>false</code>.
  final bool? applianceModeSupport;

  /// Indicates whether IPv6 is supported.
  final bool? ipv6Support;

  VpcOptions({
    this.applianceModeSupport,
    this.ipv6Support,
  });

  factory VpcOptions.fromJson(Map<String, dynamic> json) {
    return VpcOptions(
      applianceModeSupport: json['ApplianceModeSupport'] as bool?,
      ipv6Support: json['Ipv6Support'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final applianceModeSupport = this.applianceModeSupport;
    final ipv6Support = this.ipv6Support;
    return {
      if (applianceModeSupport != null)
        'ApplianceModeSupport': applianceModeSupport,
      if (ipv6Support != null) 'Ipv6Support': ipv6Support,
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

class CoreNetworkPolicyException extends _s.GenericAwsException {
  CoreNetworkPolicyException({String? type, String? message})
      : super(type: type, code: 'CoreNetworkPolicyException', message: message);
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
  'CoreNetworkPolicyException': (type, message) =>
      CoreNetworkPolicyException(type: type, message: message),
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
