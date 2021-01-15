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

part '2012-10-25.g.dart';

/// AWS Direct Connect links your internal network to an AWS Direct Connect
/// location over a standard Ethernet fiber-optic cable. One end of the cable is
/// connected to your router, the other to an AWS Direct Connect router. With
/// this connection in place, you can create virtual interfaces directly to the
/// AWS cloud (for example, to Amazon EC2 and Amazon S3) and to Amazon VPC,
/// bypassing Internet service providers in your network path. A connection
/// provides access to all AWS Regions except the China (Beijing) and (China)
/// Ningxia Regions. AWS resources in the China Regions can only be accessed
/// through locations associated with those Regions.
class DirectConnect {
  final _s.JsonProtocol _protocol;
  DirectConnect({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'directconnect',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts a proposal request to attach a virtual private gateway or transit
  /// gateway to a Direct Connect gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [associatedGatewayOwnerAccount] :
  /// The ID of the AWS account that owns the virtual private gateway or transit
  /// gateway.
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [proposalId] :
  /// The ID of the request proposal.
  ///
  /// Parameter [overrideAllowedPrefixesToDirectConnectGateway] :
  /// Overrides the Amazon VPC prefixes advertised to the Direct Connect
  /// gateway.
  ///
  /// For information about how to set the prefixes, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes">Allowed
  /// Prefixes</a> in the <i>AWS Direct Connect User Guide</i>.
  Future<AcceptDirectConnectGatewayAssociationProposalResult>
      acceptDirectConnectGatewayAssociationProposal({
    @_s.required String associatedGatewayOwnerAccount,
    @_s.required String directConnectGatewayId,
    @_s.required String proposalId,
    List<RouteFilterPrefix> overrideAllowedPrefixesToDirectConnectGateway,
  }) async {
    ArgumentError.checkNotNull(
        associatedGatewayOwnerAccount, 'associatedGatewayOwnerAccount');
    ArgumentError.checkNotNull(
        directConnectGatewayId, 'directConnectGatewayId');
    ArgumentError.checkNotNull(proposalId, 'proposalId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'OvertureService.AcceptDirectConnectGatewayAssociationProposal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'associatedGatewayOwnerAccount': associatedGatewayOwnerAccount,
        'directConnectGatewayId': directConnectGatewayId,
        'proposalId': proposalId,
        if (overrideAllowedPrefixesToDirectConnectGateway != null)
          'overrideAllowedPrefixesToDirectConnectGateway':
              overrideAllowedPrefixesToDirectConnectGateway,
      },
    );

    return AcceptDirectConnectGatewayAssociationProposalResult.fromJson(
        jsonResponse.body);
  }

  /// Deprecated. Use <a>AllocateHostedConnection</a> instead.
  ///
  /// Creates a hosted connection on an interconnect.
  ///
  /// Allocates a VLAN number and a specified amount of bandwidth for use by a
  /// hosted connection on the specified interconnect.
  /// <note>
  /// Intended for use by AWS Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [bandwidth] :
  /// The bandwidth of the connection. The possible values are 50Mbps, 100Mbps,
  /// 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. Note
  /// that only those AWS Direct Connect Partners who have met specific
  /// requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps or 10Gbps hosted
  /// connection.
  ///
  /// Parameter [connectionName] :
  /// The name of the provisioned connection.
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect on which the connection will be provisioned.
  ///
  /// Parameter [ownerAccount] :
  /// The ID of the AWS account of the customer for whom the connection will be
  /// provisioned.
  ///
  /// Parameter [vlan] :
  /// The dedicated VLAN provisioned to the connection.
  @Deprecated('Deprecated')
  Future<Connection> allocateConnectionOnInterconnect({
    @_s.required String bandwidth,
    @_s.required String connectionName,
    @_s.required String interconnectId,
    @_s.required String ownerAccount,
    @_s.required int vlan,
  }) async {
    ArgumentError.checkNotNull(bandwidth, 'bandwidth');
    ArgumentError.checkNotNull(connectionName, 'connectionName');
    ArgumentError.checkNotNull(interconnectId, 'interconnectId');
    ArgumentError.checkNotNull(ownerAccount, 'ownerAccount');
    ArgumentError.checkNotNull(vlan, 'vlan');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AllocateConnectionOnInterconnect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bandwidth': bandwidth,
        'connectionName': connectionName,
        'interconnectId': interconnectId,
        'ownerAccount': ownerAccount,
        'vlan': vlan,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Creates a hosted connection on the specified interconnect or a link
  /// aggregation group (LAG) of interconnects.
  ///
  /// Allocates a VLAN number and a specified amount of capacity (bandwidth) for
  /// use by a hosted connection on the specified interconnect or LAG of
  /// interconnects. AWS polices the hosted connection for the specified
  /// capacity and the AWS Direct Connect Partner must also police the hosted
  /// connection for the specified capacity.
  /// <note>
  /// Intended for use by AWS Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [bandwidth] :
  /// The bandwidth of the connection. The possible values are 50Mbps, 100Mbps,
  /// 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. Note
  /// that only those AWS Direct Connect Partners who have met specific
  /// requirements are allowed to create a 1Gbps, 2Gbps, 5Gbps or 10Gbps hosted
  /// connection.
  ///
  /// Parameter [connectionId] :
  /// The ID of the interconnect or LAG.
  ///
  /// Parameter [connectionName] :
  /// The name of the hosted connection.
  ///
  /// Parameter [ownerAccount] :
  /// The ID of the AWS account ID of the customer for the connection.
  ///
  /// Parameter [vlan] :
  /// The dedicated VLAN provisioned to the hosted connection.
  ///
  /// Parameter [tags] :
  /// The tags associated with the connection.
  Future<Connection> allocateHostedConnection({
    @_s.required String bandwidth,
    @_s.required String connectionId,
    @_s.required String connectionName,
    @_s.required String ownerAccount,
    @_s.required int vlan,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(bandwidth, 'bandwidth');
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(connectionName, 'connectionName');
    ArgumentError.checkNotNull(ownerAccount, 'ownerAccount');
    ArgumentError.checkNotNull(vlan, 'vlan');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AllocateHostedConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bandwidth': bandwidth,
        'connectionId': connectionId,
        'connectionName': connectionName,
        'ownerAccount': ownerAccount,
        'vlan': vlan,
        if (tags != null) 'tags': tags,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Provisions a private virtual interface to be owned by the specified AWS
  /// account.
  ///
  /// Virtual interfaces created using this action must be confirmed by the
  /// owner using <a>ConfirmPrivateVirtualInterface</a>. Until then, the virtual
  /// interface is in the <code>Confirming</code> state and is not available to
  /// handle traffic.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection on which the private virtual interface is
  /// provisioned.
  ///
  /// Parameter [newPrivateVirtualInterfaceAllocation] :
  /// Information about the private virtual interface.
  ///
  /// Parameter [ownerAccount] :
  /// The ID of the AWS account that owns the virtual private interface.
  Future<VirtualInterface> allocatePrivateVirtualInterface({
    @_s.required String connectionId,
    @_s.required
        NewPrivateVirtualInterfaceAllocation
            newPrivateVirtualInterfaceAllocation,
    @_s.required String ownerAccount,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(newPrivateVirtualInterfaceAllocation,
        'newPrivateVirtualInterfaceAllocation');
    ArgumentError.checkNotNull(ownerAccount, 'ownerAccount');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AllocatePrivateVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'newPrivateVirtualInterfaceAllocation':
            newPrivateVirtualInterfaceAllocation,
        'ownerAccount': ownerAccount,
      },
    );

    return VirtualInterface.fromJson(jsonResponse.body);
  }

  /// Provisions a public virtual interface to be owned by the specified AWS
  /// account.
  ///
  /// The owner of a connection calls this function to provision a public
  /// virtual interface to be owned by the specified AWS account.
  ///
  /// Virtual interfaces created using this function must be confirmed by the
  /// owner using <a>ConfirmPublicVirtualInterface</a>. Until this step has been
  /// completed, the virtual interface is in the <code>confirming</code> state
  /// and is not available to handle traffic.
  ///
  /// When creating an IPv6 public virtual interface, omit the Amazon address
  /// and customer address. IPv6 addresses are automatically assigned from the
  /// Amazon pool of IPv6 addresses; you cannot specify custom IPv6 addresses.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection on which the public virtual interface is
  /// provisioned.
  ///
  /// Parameter [newPublicVirtualInterfaceAllocation] :
  /// Information about the public virtual interface.
  ///
  /// Parameter [ownerAccount] :
  /// The ID of the AWS account that owns the public virtual interface.
  Future<VirtualInterface> allocatePublicVirtualInterface({
    @_s.required String connectionId,
    @_s.required
        NewPublicVirtualInterfaceAllocation newPublicVirtualInterfaceAllocation,
    @_s.required String ownerAccount,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(newPublicVirtualInterfaceAllocation,
        'newPublicVirtualInterfaceAllocation');
    ArgumentError.checkNotNull(ownerAccount, 'ownerAccount');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AllocatePublicVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'newPublicVirtualInterfaceAllocation':
            newPublicVirtualInterfaceAllocation,
        'ownerAccount': ownerAccount,
      },
    );

    return VirtualInterface.fromJson(jsonResponse.body);
  }

  /// Provisions a transit virtual interface to be owned by the specified AWS
  /// account. Use this type of interface to connect a transit gateway to your
  /// Direct Connect gateway.
  ///
  /// The owner of a connection provisions a transit virtual interface to be
  /// owned by the specified AWS account.
  ///
  /// After you create a transit virtual interface, it must be confirmed by the
  /// owner using <a>ConfirmTransitVirtualInterface</a>. Until this step has
  /// been completed, the transit virtual interface is in the
  /// <code>requested</code> state and is not available to handle traffic.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection on which the transit virtual interface is
  /// provisioned.
  ///
  /// Parameter [newTransitVirtualInterfaceAllocation] :
  /// Information about the transit virtual interface.
  ///
  /// Parameter [ownerAccount] :
  /// The ID of the AWS account that owns the transit virtual interface.
  Future<AllocateTransitVirtualInterfaceResult>
      allocateTransitVirtualInterface({
    @_s.required String connectionId,
    @_s.required
        NewTransitVirtualInterfaceAllocation
            newTransitVirtualInterfaceAllocation,
    @_s.required String ownerAccount,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(newTransitVirtualInterfaceAllocation,
        'newTransitVirtualInterfaceAllocation');
    ArgumentError.checkNotNull(ownerAccount, 'ownerAccount');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AllocateTransitVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'newTransitVirtualInterfaceAllocation':
            newTransitVirtualInterfaceAllocation,
        'ownerAccount': ownerAccount,
      },
    );

    return AllocateTransitVirtualInterfaceResult.fromJson(jsonResponse.body);
  }

  /// Associates an existing connection with a link aggregation group (LAG). The
  /// connection is interrupted and re-established as a member of the LAG
  /// (connectivity to AWS is interrupted). The connection must be hosted on the
  /// same AWS Direct Connect endpoint as the LAG, and its bandwidth must match
  /// the bandwidth for the LAG. You can re-associate a connection that's
  /// currently associated with a different LAG; however, if removing the
  /// connection would cause the original LAG to fall below its setting for
  /// minimum number of operational connections, the request fails.
  ///
  /// Any virtual interfaces that are directly associated with the connection
  /// are automatically re-associated with the LAG. If the connection was
  /// originally associated with a different LAG, the virtual interfaces remain
  /// associated with the original LAG.
  ///
  /// For interconnects, any hosted connections are automatically re-associated
  /// with the LAG. If the interconnect was originally associated with a
  /// different LAG, the hosted connections remain associated with the original
  /// LAG.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG with which to associate the connection.
  Future<Connection> associateConnectionWithLag({
    @_s.required String connectionId,
    @_s.required String lagId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(lagId, 'lagId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AssociateConnectionWithLag'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'lagId': lagId,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Associates a hosted connection and its virtual interfaces with a link
  /// aggregation group (LAG) or interconnect. If the target interconnect or LAG
  /// has an existing hosted connection with a conflicting VLAN number or IP
  /// address, the operation fails. This action temporarily interrupts the
  /// hosted connection's connectivity to AWS as it is being migrated.
  /// <note>
  /// Intended for use by AWS Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the hosted connection.
  ///
  /// Parameter [parentConnectionId] :
  /// The ID of the interconnect or the LAG.
  Future<Connection> associateHostedConnection({
    @_s.required String connectionId,
    @_s.required String parentConnectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(parentConnectionId, 'parentConnectionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AssociateHostedConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'parentConnectionId': parentConnectionId,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Associates a virtual interface with a specified link aggregation group
  /// (LAG) or connection. Connectivity to AWS is temporarily interrupted as the
  /// virtual interface is being migrated. If the target connection or LAG has
  /// an associated virtual interface with a conflicting VLAN number or a
  /// conflicting IP address, the operation fails.
  ///
  /// Virtual interfaces associated with a hosted connection cannot be
  /// associated with a LAG; hosted connections must be migrated along with
  /// their virtual interfaces using <a>AssociateHostedConnection</a>.
  ///
  /// To reassociate a virtual interface to a new connection or LAG, the
  /// requester must own either the virtual interface itself or the connection
  /// to which the virtual interface is currently associated. Additionally, the
  /// requester must own the connection or LAG for the association.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the LAG or connection.
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<VirtualInterface> associateVirtualInterface({
    @_s.required String connectionId,
    @_s.required String virtualInterfaceId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AssociateVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return VirtualInterface.fromJson(jsonResponse.body);
  }

  /// Confirms the creation of the specified hosted connection on an
  /// interconnect.
  ///
  /// Upon creation, the hosted connection is initially in the
  /// <code>Ordering</code> state, and remains in this state until the owner
  /// confirms creation of the hosted connection.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the hosted connection.
  Future<ConfirmConnectionResponse> confirmConnection({
    @_s.required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.ConfirmConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
      },
    );

    return ConfirmConnectionResponse.fromJson(jsonResponse.body);
  }

  /// Accepts ownership of a private virtual interface created by another AWS
  /// account.
  ///
  /// After the virtual interface owner makes this call, the virtual interface
  /// is created and attached to the specified virtual private gateway or Direct
  /// Connect gateway, and is made available to handle traffic.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [virtualGatewayId] :
  /// The ID of the virtual private gateway.
  Future<ConfirmPrivateVirtualInterfaceResponse>
      confirmPrivateVirtualInterface({
    @_s.required String virtualInterfaceId,
    String directConnectGatewayId,
    String virtualGatewayId,
  }) async {
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.ConfirmPrivateVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'virtualInterfaceId': virtualInterfaceId,
        if (directConnectGatewayId != null)
          'directConnectGatewayId': directConnectGatewayId,
        if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
      },
    );

    return ConfirmPrivateVirtualInterfaceResponse.fromJson(jsonResponse.body);
  }

  /// Accepts ownership of a public virtual interface created by another AWS
  /// account.
  ///
  /// After the virtual interface owner makes this call, the specified virtual
  /// interface is created and made available to handle traffic.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<ConfirmPublicVirtualInterfaceResponse> confirmPublicVirtualInterface({
    @_s.required String virtualInterfaceId,
  }) async {
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.ConfirmPublicVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return ConfirmPublicVirtualInterfaceResponse.fromJson(jsonResponse.body);
  }

  /// Accepts ownership of a transit virtual interface created by another AWS
  /// account.
  ///
  /// After the owner of the transit virtual interface makes this call, the
  /// specified transit virtual interface is created and made available to
  /// handle traffic.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<ConfirmTransitVirtualInterfaceResponse>
      confirmTransitVirtualInterface({
    @_s.required String directConnectGatewayId,
    @_s.required String virtualInterfaceId,
  }) async {
    ArgumentError.checkNotNull(
        directConnectGatewayId, 'directConnectGatewayId');
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.ConfirmTransitVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'directConnectGatewayId': directConnectGatewayId,
        'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return ConfirmTransitVirtualInterfaceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a BGP peer on the specified virtual interface.
  ///
  /// You must create a BGP peer for the corresponding address family
  /// (IPv4/IPv6) in order to access AWS resources that also use that address
  /// family.
  ///
  /// If logical redundancy is not supported by the connection, interconnect, or
  /// LAG, the BGP peer cannot be in the same address family as an existing BGP
  /// peer on the virtual interface.
  ///
  /// When creating a IPv6 BGP peer, omit the Amazon address and customer
  /// address. IPv6 addresses are automatically assigned from the Amazon pool of
  /// IPv6 addresses; you cannot specify custom IPv6 addresses.
  ///
  /// For a public virtual interface, the Autonomous System Number (ASN) must be
  /// private or already whitelisted for the virtual interface.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [newBGPPeer] :
  /// Information about the BGP peer.
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<CreateBGPPeerResponse> createBGPPeer({
    NewBGPPeer newBGPPeer,
    String virtualInterfaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreateBGPPeer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (newBGPPeer != null) 'newBGPPeer': newBGPPeer,
        if (virtualInterfaceId != null)
          'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return CreateBGPPeerResponse.fromJson(jsonResponse.body);
  }

  /// Creates a connection between a customer network and a specific AWS Direct
  /// Connect location.
  ///
  /// A connection links your internal network to an AWS Direct Connect location
  /// over a standard Ethernet fiber-optic cable. One end of the cable is
  /// connected to your router, the other to an AWS Direct Connect router.
  ///
  /// To find the locations for your Region, use <a>DescribeLocations</a>.
  ///
  /// You can automatically add the new connection to a link aggregation group
  /// (LAG) by specifying a LAG ID in the request. This ensures that the new
  /// connection is allocated on the same AWS Direct Connect endpoint that hosts
  /// the specified LAG. If there are no available ports on the endpoint, the
  /// request fails and no connection is created.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [bandwidth] :
  /// The bandwidth of the connection.
  ///
  /// Parameter [connectionName] :
  /// The name of the connection.
  ///
  /// Parameter [location] :
  /// The location of the connection.
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG.
  ///
  /// Parameter [providerName] :
  /// The name of the service provider associated with the requested connection.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the lag.
  Future<Connection> createConnection({
    @_s.required String bandwidth,
    @_s.required String connectionName,
    @_s.required String location,
    String lagId,
    String providerName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(bandwidth, 'bandwidth');
    ArgumentError.checkNotNull(connectionName, 'connectionName');
    ArgumentError.checkNotNull(location, 'location');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bandwidth': bandwidth,
        'connectionName': connectionName,
        'location': location,
        if (lagId != null) 'lagId': lagId,
        if (providerName != null) 'providerName': providerName,
        if (tags != null) 'tags': tags,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Creates a Direct Connect gateway, which is an intermediate object that
  /// enables you to connect a set of virtual interfaces and virtual private
  /// gateways. A Direct Connect gateway is global and visible in any AWS Region
  /// after it is created. The virtual interfaces and virtual private gateways
  /// that are connected through a Direct Connect gateway can be in different
  /// AWS Regions. This enables you to connect to a VPC in any Region,
  /// regardless of the Region in which the virtual interfaces are located, and
  /// pass traffic between them.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayName] :
  /// The name of the Direct Connect gateway.
  ///
  /// Parameter [amazonSideAsn] :
  /// The autonomous system number (ASN) for Border Gateway Protocol (BGP) to be
  /// configured on the Amazon side of the connection. The ASN must be in the
  /// private range of 64,512 to 65,534 or 4,200,000,000 to 4,294,967,294. The
  /// default is 64512.
  Future<CreateDirectConnectGatewayResult> createDirectConnectGateway({
    @_s.required String directConnectGatewayName,
    int amazonSideAsn,
  }) async {
    ArgumentError.checkNotNull(
        directConnectGatewayName, 'directConnectGatewayName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreateDirectConnectGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'directConnectGatewayName': directConnectGatewayName,
        if (amazonSideAsn != null) 'amazonSideAsn': amazonSideAsn,
      },
    );

    return CreateDirectConnectGatewayResult.fromJson(jsonResponse.body);
  }

  /// Creates an association between a Direct Connect gateway and a virtual
  /// private gateway. The virtual private gateway must be attached to a VPC and
  /// must not be associated with another Direct Connect gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [addAllowedPrefixesToDirectConnectGateway] :
  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway
  ///
  /// This parameter is required when you create an association to a transit
  /// gateway.
  ///
  /// For information about how to set the prefixes, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/multi-account-associate-vgw.html#allowed-prefixes">Allowed
  /// Prefixes</a> in the <i>AWS Direct Connect User Guide</i>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the virtual private gateway or transit gateway.
  ///
  /// Parameter [virtualGatewayId] :
  /// The ID of the virtual private gateway.
  Future<CreateDirectConnectGatewayAssociationResult>
      createDirectConnectGatewayAssociation({
    @_s.required String directConnectGatewayId,
    List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
    String gatewayId,
    String virtualGatewayId,
  }) async {
    ArgumentError.checkNotNull(
        directConnectGatewayId, 'directConnectGatewayId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreateDirectConnectGatewayAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'directConnectGatewayId': directConnectGatewayId,
        if (addAllowedPrefixesToDirectConnectGateway != null)
          'addAllowedPrefixesToDirectConnectGateway':
              addAllowedPrefixesToDirectConnectGateway,
        if (gatewayId != null) 'gatewayId': gatewayId,
        if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
      },
    );

    return CreateDirectConnectGatewayAssociationResult.fromJson(
        jsonResponse.body);
  }

  /// Creates a proposal to associate the specified virtual private gateway or
  /// transit gateway with the specified Direct Connect gateway.
  ///
  /// You can associate a Direct Connect gateway and virtual private gateway or
  /// transit gateway that is owned by any AWS account.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [directConnectGatewayOwnerAccount] :
  /// The ID of the AWS account that owns the Direct Connect gateway.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the virtual private gateway or transit gateway.
  ///
  /// Parameter [addAllowedPrefixesToDirectConnectGateway] :
  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  ///
  /// Parameter [removeAllowedPrefixesToDirectConnectGateway] :
  /// The Amazon VPC prefixes to no longer advertise to the Direct Connect
  /// gateway.
  Future<CreateDirectConnectGatewayAssociationProposalResult>
      createDirectConnectGatewayAssociationProposal({
    @_s.required String directConnectGatewayId,
    @_s.required String directConnectGatewayOwnerAccount,
    @_s.required String gatewayId,
    List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
    List<RouteFilterPrefix> removeAllowedPrefixesToDirectConnectGateway,
  }) async {
    ArgumentError.checkNotNull(
        directConnectGatewayId, 'directConnectGatewayId');
    ArgumentError.checkNotNull(
        directConnectGatewayOwnerAccount, 'directConnectGatewayOwnerAccount');
    ArgumentError.checkNotNull(gatewayId, 'gatewayId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'OvertureService.CreateDirectConnectGatewayAssociationProposal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'directConnectGatewayId': directConnectGatewayId,
        'directConnectGatewayOwnerAccount': directConnectGatewayOwnerAccount,
        'gatewayId': gatewayId,
        if (addAllowedPrefixesToDirectConnectGateway != null)
          'addAllowedPrefixesToDirectConnectGateway':
              addAllowedPrefixesToDirectConnectGateway,
        if (removeAllowedPrefixesToDirectConnectGateway != null)
          'removeAllowedPrefixesToDirectConnectGateway':
              removeAllowedPrefixesToDirectConnectGateway,
      },
    );

    return CreateDirectConnectGatewayAssociationProposalResult.fromJson(
        jsonResponse.body);
  }

  /// Creates an interconnect between an AWS Direct Connect Partner's network
  /// and a specific AWS Direct Connect location.
  ///
  /// An interconnect is a connection that is capable of hosting other
  /// connections. The AWS Direct Connect partner can use an interconnect to
  /// provide AWS Direct Connect hosted connections to customers through their
  /// own network services. Like a standard connection, an interconnect links
  /// the partner's network to an AWS Direct Connect location over a standard
  /// Ethernet fiber-optic cable. One end is connected to the partner's router,
  /// the other to an AWS Direct Connect router.
  ///
  /// You can automatically add the new interconnect to a link aggregation group
  /// (LAG) by specifying a LAG ID in the request. This ensures that the new
  /// interconnect is allocated on the same AWS Direct Connect endpoint that
  /// hosts the specified LAG. If there are no available ports on the endpoint,
  /// the request fails and no interconnect is created.
  ///
  /// For each end customer, the AWS Direct Connect Partner provisions a
  /// connection on their interconnect by calling
  /// <a>AllocateHostedConnection</a>. The end customer can then connect to AWS
  /// resources by creating a virtual interface on their connection, using the
  /// VLAN assigned to them by the AWS Direct Connect Partner.
  /// <note>
  /// Intended for use by AWS Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [bandwidth] :
  /// The port bandwidth, in Gbps. The possible values are 1 and 10.
  ///
  /// Parameter [interconnectName] :
  /// The name of the interconnect.
  ///
  /// Parameter [location] :
  /// The location of the interconnect.
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG.
  ///
  /// Parameter [providerName] :
  /// The name of the service provider associated with the interconnect.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the interconnect.
  Future<Interconnect> createInterconnect({
    @_s.required String bandwidth,
    @_s.required String interconnectName,
    @_s.required String location,
    String lagId,
    String providerName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(bandwidth, 'bandwidth');
    ArgumentError.checkNotNull(interconnectName, 'interconnectName');
    ArgumentError.checkNotNull(location, 'location');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreateInterconnect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'bandwidth': bandwidth,
        'interconnectName': interconnectName,
        'location': location,
        if (lagId != null) 'lagId': lagId,
        if (providerName != null) 'providerName': providerName,
        if (tags != null) 'tags': tags,
      },
    );

    return Interconnect.fromJson(jsonResponse.body);
  }

  /// Creates a link aggregation group (LAG) with the specified number of
  /// bundled physical dedicated connections between the customer network and a
  /// specific AWS Direct Connect location. A LAG is a logical interface that
  /// uses the Link Aggregation Control Protocol (LACP) to aggregate multiple
  /// interfaces, enabling you to treat them as a single interface.
  ///
  /// All connections in a LAG must use the same bandwidth (either 1Gbps or
  /// 10Gbps) and must terminate at the same AWS Direct Connect endpoint.
  ///
  /// You can have up to 10 dedicated connections per LAG. Regardless of this
  /// limit, if you request more connections for the LAG than AWS Direct Connect
  /// can allocate on a single endpoint, no LAG is created.
  ///
  /// You can specify an existing physical dedicated connection or interconnect
  /// to include in the LAG (which counts towards the total number of
  /// connections). Doing so interrupts the current physical dedicated
  /// connection, and re-establishes them as a member of the LAG. The LAG will
  /// be created on the same AWS Direct Connect endpoint to which the dedicated
  /// connection terminates. Any virtual interfaces associated with the
  /// dedicated connection are automatically disassociated and re-associated
  /// with the LAG. The connection ID does not change.
  ///
  /// If the AWS account used to create a LAG is a registered AWS Direct Connect
  /// Partner, the LAG is automatically enabled to host sub-connections. For a
  /// LAG owned by a partner, any associated virtual interfaces cannot be
  /// directly configured.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionsBandwidth] :
  /// The bandwidth of the individual physical dedicated connections bundled by
  /// the LAG. The possible values are 1Gbps and 10Gbps.
  ///
  /// Parameter [lagName] :
  /// The name of the LAG.
  ///
  /// Parameter [location] :
  /// The location for the LAG.
  ///
  /// Parameter [numberOfConnections] :
  /// The number of physical dedicated connections initially provisioned and
  /// bundled by the LAG.
  ///
  /// Parameter [childConnectionTags] :
  /// The tags to associate with the automtically created LAGs.
  ///
  /// Parameter [connectionId] :
  /// The ID of an existing dedicated connection to migrate to the LAG.
  ///
  /// Parameter [providerName] :
  /// The name of the service provider associated with the LAG.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the LAG.
  Future<Lag> createLag({
    @_s.required String connectionsBandwidth,
    @_s.required String lagName,
    @_s.required String location,
    @_s.required int numberOfConnections,
    List<Tag> childConnectionTags,
    String connectionId,
    String providerName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(connectionsBandwidth, 'connectionsBandwidth');
    ArgumentError.checkNotNull(lagName, 'lagName');
    ArgumentError.checkNotNull(location, 'location');
    ArgumentError.checkNotNull(numberOfConnections, 'numberOfConnections');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreateLag'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionsBandwidth': connectionsBandwidth,
        'lagName': lagName,
        'location': location,
        'numberOfConnections': numberOfConnections,
        if (childConnectionTags != null)
          'childConnectionTags': childConnectionTags,
        if (connectionId != null) 'connectionId': connectionId,
        if (providerName != null) 'providerName': providerName,
        if (tags != null) 'tags': tags,
      },
    );

    return Lag.fromJson(jsonResponse.body);
  }

  /// Creates a private virtual interface. A virtual interface is the VLAN that
  /// transports AWS Direct Connect traffic. A private virtual interface can be
  /// connected to either a Direct Connect gateway or a Virtual Private Gateway
  /// (VGW). Connecting the private virtual interface to a Direct Connect
  /// gateway enables the possibility for connecting to multiple VPCs, including
  /// VPCs in different AWS Regions. Connecting the private virtual interface to
  /// a VGW only provides access to a single VPC within the same Region.
  ///
  /// Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an
  /// update to the underlying physical connection if it wasn't updated to
  /// support jumbo frames. Updating the connection disrupts network
  /// connectivity for all virtual interfaces associated with the connection for
  /// up to 30 seconds. To check whether your connection supports jumbo frames,
  /// call <a>DescribeConnections</a>. To check whether your virtual interface
  /// supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [newPrivateVirtualInterface] :
  /// Information about the private virtual interface.
  Future<VirtualInterface> createPrivateVirtualInterface({
    @_s.required String connectionId,
    @_s.required NewPrivateVirtualInterface newPrivateVirtualInterface,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(
        newPrivateVirtualInterface, 'newPrivateVirtualInterface');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreatePrivateVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'newPrivateVirtualInterface': newPrivateVirtualInterface,
      },
    );

    return VirtualInterface.fromJson(jsonResponse.body);
  }

  /// Creates a public virtual interface. A virtual interface is the VLAN that
  /// transports AWS Direct Connect traffic. A public virtual interface supports
  /// sending traffic to public services of AWS such as Amazon S3.
  ///
  /// When creating an IPv6 public virtual interface (<code>addressFamily</code>
  /// is <code>ipv6</code>), leave the <code>customer</code> and
  /// <code>amazon</code> address fields blank to use auto-assigned IPv6 space.
  /// Custom IPv6 addresses are not supported.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [newPublicVirtualInterface] :
  /// Information about the public virtual interface.
  Future<VirtualInterface> createPublicVirtualInterface({
    @_s.required String connectionId,
    @_s.required NewPublicVirtualInterface newPublicVirtualInterface,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(
        newPublicVirtualInterface, 'newPublicVirtualInterface');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreatePublicVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'newPublicVirtualInterface': newPublicVirtualInterface,
      },
    );

    return VirtualInterface.fromJson(jsonResponse.body);
  }

  /// Creates a transit virtual interface. A transit virtual interface should be
  /// used to access one or more transit gateways associated with Direct Connect
  /// gateways. A transit virtual interface enables the connection of multiple
  /// VPCs attached to a transit gateway to a Direct Connect gateway.
  /// <important>
  /// If you associate your transit gateway with one or more Direct Connect
  /// gateways, the Autonomous System Number (ASN) used by the transit gateway
  /// and the Direct Connect gateway must be different. For example, if you use
  /// the default ASN 64512 for both your the transit gateway and Direct Connect
  /// gateway, the association request fails.
  /// </important>
  /// Setting the MTU of a virtual interface to 8500 (jumbo frames) can cause an
  /// update to the underlying physical connection if it wasn't updated to
  /// support jumbo frames. Updating the connection disrupts network
  /// connectivity for all virtual interfaces associated with the connection for
  /// up to 30 seconds. To check whether your connection supports jumbo frames,
  /// call <a>DescribeConnections</a>. To check whether your virtual interface
  /// supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [newTransitVirtualInterface] :
  /// Information about the transit virtual interface.
  Future<CreateTransitVirtualInterfaceResult> createTransitVirtualInterface({
    @_s.required String connectionId,
    @_s.required NewTransitVirtualInterface newTransitVirtualInterface,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(
        newTransitVirtualInterface, 'newTransitVirtualInterface');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.CreateTransitVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'newTransitVirtualInterface': newTransitVirtualInterface,
      },
    );

    return CreateTransitVirtualInterfaceResult.fromJson(jsonResponse.body);
  }

  /// Deletes the specified BGP peer on the specified virtual interface with the
  /// specified customer address and ASN.
  ///
  /// You cannot delete the last BGP peer from a virtual interface.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [asn] :
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// Parameter [bgpPeerId] :
  /// The ID of the BGP peer.
  ///
  /// Parameter [customerAddress] :
  /// The IP address assigned to the customer interface.
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<DeleteBGPPeerResponse> deleteBGPPeer({
    int asn,
    String bgpPeerId,
    String customerAddress,
    String virtualInterfaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DeleteBGPPeer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (asn != null) 'asn': asn,
        if (bgpPeerId != null) 'bgpPeerId': bgpPeerId,
        if (customerAddress != null) 'customerAddress': customerAddress,
        if (virtualInterfaceId != null)
          'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return DeleteBGPPeerResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified connection.
  ///
  /// Deleting a connection only stops the AWS Direct Connect port hour and data
  /// transfer charges. If you are partnering with any third parties to connect
  /// with the AWS Direct Connect location, you must cancel your service with
  /// them separately.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  Future<Connection> deleteConnection({
    @_s.required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DeleteConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Deletes the specified Direct Connect gateway. You must first delete all
  /// virtual interfaces that are attached to the Direct Connect gateway and
  /// disassociate all virtual private gateways associated with the Direct
  /// Connect gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  Future<DeleteDirectConnectGatewayResult> deleteDirectConnectGateway({
    @_s.required String directConnectGatewayId,
  }) async {
    ArgumentError.checkNotNull(
        directConnectGatewayId, 'directConnectGatewayId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DeleteDirectConnectGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'directConnectGatewayId': directConnectGatewayId,
      },
    );

    return DeleteDirectConnectGatewayResult.fromJson(jsonResponse.body);
  }

  /// Deletes the association between the specified Direct Connect gateway and
  /// virtual private gateway.
  ///
  /// We recommend that you specify the <code>associationID</code> to delete the
  /// association. Alternatively, if you own virtual gateway and a Direct
  /// Connect gateway association, you can specify the
  /// <code>virtualGatewayId</code> and <code>directConnectGatewayId</code> to
  /// delete an association.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [associationId] :
  /// The ID of the Direct Connect gateway association.
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [virtualGatewayId] :
  /// The ID of the virtual private gateway.
  Future<DeleteDirectConnectGatewayAssociationResult>
      deleteDirectConnectGatewayAssociation({
    String associationId,
    String directConnectGatewayId,
    String virtualGatewayId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DeleteDirectConnectGatewayAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (associationId != null) 'associationId': associationId,
        if (directConnectGatewayId != null)
          'directConnectGatewayId': directConnectGatewayId,
        if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
      },
    );

    return DeleteDirectConnectGatewayAssociationResult.fromJson(
        jsonResponse.body);
  }

  /// Deletes the association proposal request between the specified Direct
  /// Connect gateway and virtual private gateway or transit gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [proposalId] :
  /// The ID of the proposal.
  Future<DeleteDirectConnectGatewayAssociationProposalResult>
      deleteDirectConnectGatewayAssociationProposal({
    @_s.required String proposalId,
  }) async {
    ArgumentError.checkNotNull(proposalId, 'proposalId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'OvertureService.DeleteDirectConnectGatewayAssociationProposal'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'proposalId': proposalId,
      },
    );

    return DeleteDirectConnectGatewayAssociationProposalResult.fromJson(
        jsonResponse.body);
  }

  /// Deletes the specified interconnect.
  /// <note>
  /// Intended for use by AWS Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect.
  Future<DeleteInterconnectResponse> deleteInterconnect({
    @_s.required String interconnectId,
  }) async {
    ArgumentError.checkNotNull(interconnectId, 'interconnectId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DeleteInterconnect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'interconnectId': interconnectId,
      },
    );

    return DeleteInterconnectResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified link aggregation group (LAG). You cannot delete a
  /// LAG if it has active virtual interfaces or hosted connections.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG.
  Future<Lag> deleteLag({
    @_s.required String lagId,
  }) async {
    ArgumentError.checkNotNull(lagId, 'lagId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DeleteLag'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'lagId': lagId,
      },
    );

    return Lag.fromJson(jsonResponse.body);
  }

  /// Deletes a virtual interface.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<DeleteVirtualInterfaceResponse> deleteVirtualInterface({
    @_s.required String virtualInterfaceId,
  }) async {
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DeleteVirtualInterface'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return DeleteVirtualInterfaceResponse.fromJson(jsonResponse.body);
  }

  /// Deprecated. Use <a>DescribeLoa</a> instead.
  ///
  /// Gets the LOA-CFA for a connection.
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that your APN partner or service provider uses when
  /// establishing your cross connect to AWS at the colocation facility. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting
  /// Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct
  /// Connect User Guide</i>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [loaContentType] :
  /// The standard media type for the LOA-CFA document. The only supported value
  /// is application/pdf.
  ///
  /// Parameter [providerName] :
  /// The name of the APN partner or service provider who establishes
  /// connectivity on your behalf. If you specify this parameter, the LOA-CFA
  /// lists the provider name alongside your company name as the requester of
  /// the cross connect.
  @Deprecated('Deprecated')
  Future<DescribeConnectionLoaResponse> describeConnectionLoa({
    @_s.required String connectionId,
    LoaContentType loaContentType,
    String providerName,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeConnectionLoa'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        if (loaContentType != null) 'loaContentType': loaContentType.toValue(),
        if (providerName != null) 'providerName': providerName,
      },
    );

    return DescribeConnectionLoaResponse.fromJson(jsonResponse.body);
  }

  /// Displays the specified connection or all connections in this Region.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  Future<Connections> describeConnections({
    String connectionId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (connectionId != null) 'connectionId': connectionId,
      },
    );

    return Connections.fromJson(jsonResponse.body);
  }

  /// Deprecated. Use <a>DescribeHostedConnections</a> instead.
  ///
  /// Lists the connections that have been provisioned on the specified
  /// interconnect.
  /// <note>
  /// Intended for use by AWS Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect.
  @Deprecated('Deprecated')
  Future<Connections> describeConnectionsOnInterconnect({
    @_s.required String interconnectId,
  }) async {
    ArgumentError.checkNotNull(interconnectId, 'interconnectId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeConnectionsOnInterconnect'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'interconnectId': interconnectId,
      },
    );

    return Connections.fromJson(jsonResponse.body);
  }

  /// Describes one or more association proposals for connection between a
  /// virtual private gateway or transit gateway and a Direct Connect gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [associatedGatewayId] :
  /// The ID of the associated gateway.
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// If <code>MaxResults</code> is given a value larger than 100, only 100
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [proposalId] :
  /// The ID of the proposal.
  Future<DescribeDirectConnectGatewayAssociationProposalsResult>
      describeDirectConnectGatewayAssociationProposals({
    String associatedGatewayId,
    String directConnectGatewayId,
    int maxResults,
    String nextToken,
    String proposalId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'OvertureService.DescribeDirectConnectGatewayAssociationProposals'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (associatedGatewayId != null)
          'associatedGatewayId': associatedGatewayId,
        if (directConnectGatewayId != null)
          'directConnectGatewayId': directConnectGatewayId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (proposalId != null) 'proposalId': proposalId,
      },
    );

    return DescribeDirectConnectGatewayAssociationProposalsResult.fromJson(
        jsonResponse.body);
  }

  /// Lists the associations between your Direct Connect gateways and virtual
  /// private gateways. You must specify a Direct Connect gateway, a virtual
  /// private gateway, or both. If you specify a Direct Connect gateway, the
  /// response contains all virtual private gateways associated with the Direct
  /// Connect gateway. If you specify a virtual private gateway, the response
  /// contains all Direct Connect gateways associated with the virtual private
  /// gateway. If you specify both, the response contains the association
  /// between the Direct Connect gateway and the virtual private gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [associatedGatewayId] :
  /// The ID of the associated gateway.
  ///
  /// Parameter [associationId] :
  /// The ID of the Direct Connect gateway association.
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// If <code>MaxResults</code> is given a value larger than 100, only 100
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// The token provided in the previous call to retrieve the next page.
  ///
  /// Parameter [virtualGatewayId] :
  /// The ID of the virtual private gateway.
  Future<DescribeDirectConnectGatewayAssociationsResult>
      describeDirectConnectGatewayAssociations({
    String associatedGatewayId,
    String associationId,
    String directConnectGatewayId,
    int maxResults,
    String nextToken,
    String virtualGatewayId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeDirectConnectGatewayAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (associatedGatewayId != null)
          'associatedGatewayId': associatedGatewayId,
        if (associationId != null) 'associationId': associationId,
        if (directConnectGatewayId != null)
          'directConnectGatewayId': directConnectGatewayId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
      },
    );

    return DescribeDirectConnectGatewayAssociationsResult.fromJson(
        jsonResponse.body);
  }

  /// Lists the attachments between your Direct Connect gateways and virtual
  /// interfaces. You must specify a Direct Connect gateway, a virtual
  /// interface, or both. If you specify a Direct Connect gateway, the response
  /// contains all virtual interfaces attached to the Direct Connect gateway. If
  /// you specify a virtual interface, the response contains all Direct Connect
  /// gateways attached to the virtual interface. If you specify both, the
  /// response contains the attachment between the Direct Connect gateway and
  /// the virtual interface.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// If <code>MaxResults</code> is given a value larger than 100, only 100
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// The token provided in the previous call to retrieve the next page.
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<DescribeDirectConnectGatewayAttachmentsResult>
      describeDirectConnectGatewayAttachments({
    String directConnectGatewayId,
    int maxResults,
    String nextToken,
    String virtualInterfaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeDirectConnectGatewayAttachments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directConnectGatewayId != null)
          'directConnectGatewayId': directConnectGatewayId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (virtualInterfaceId != null)
          'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return DescribeDirectConnectGatewayAttachmentsResult.fromJson(
        jsonResponse.body);
  }

  /// Lists all your Direct Connect gateways or only the specified Direct
  /// Connect gateway. Deleted Direct Connect gateways are not returned.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// If <code>MaxResults</code> is given a value larger than 100, only 100
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// The token provided in the previous call to retrieve the next page.
  Future<DescribeDirectConnectGatewaysResult> describeDirectConnectGateways({
    String directConnectGatewayId,
    int maxResults,
    String nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeDirectConnectGateways'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (directConnectGatewayId != null)
          'directConnectGatewayId': directConnectGatewayId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return DescribeDirectConnectGatewaysResult.fromJson(jsonResponse.body);
  }

  /// Lists the hosted connections that have been provisioned on the specified
  /// interconnect or link aggregation group (LAG).
  /// <note>
  /// Intended for use by AWS Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the interconnect or LAG.
  Future<Connections> describeHostedConnections({
    @_s.required String connectionId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeHostedConnections'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
      },
    );

    return Connections.fromJson(jsonResponse.body);
  }

  /// Deprecated. Use <a>DescribeLoa</a> instead.
  ///
  /// Gets the LOA-CFA for the specified interconnect.
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that is used when establishing your cross connect to AWS at the
  /// colocation facility. For more information, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting
  /// Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct
  /// Connect User Guide</i>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect.
  ///
  /// Parameter [loaContentType] :
  /// The standard media type for the LOA-CFA document. The only supported value
  /// is application/pdf.
  ///
  /// Parameter [providerName] :
  /// The name of the service provider who establishes connectivity on your
  /// behalf. If you supply this parameter, the LOA-CFA lists the provider name
  /// alongside your company name as the requester of the cross connect.
  @Deprecated('Deprecated')
  Future<DescribeInterconnectLoaResponse> describeInterconnectLoa({
    @_s.required String interconnectId,
    LoaContentType loaContentType,
    String providerName,
  }) async {
    ArgumentError.checkNotNull(interconnectId, 'interconnectId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeInterconnectLoa'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'interconnectId': interconnectId,
        if (loaContentType != null) 'loaContentType': loaContentType.toValue(),
        if (providerName != null) 'providerName': providerName,
      },
    );

    return DescribeInterconnectLoaResponse.fromJson(jsonResponse.body);
  }

  /// Lists the interconnects owned by the AWS account or only the specified
  /// interconnect.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect.
  Future<Interconnects> describeInterconnects({
    String interconnectId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeInterconnects'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (interconnectId != null) 'interconnectId': interconnectId,
      },
    );

    return Interconnects.fromJson(jsonResponse.body);
  }

  /// Describes all your link aggregation groups (LAG) or the specified LAG.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG.
  Future<Lags> describeLags({
    String lagId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeLags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (lagId != null) 'lagId': lagId,
      },
    );

    return Lags.fromJson(jsonResponse.body);
  }

  /// Gets the LOA-CFA for a connection, interconnect, or link aggregation group
  /// (LAG).
  ///
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA) is
  /// a document that is used when establishing your cross connect to AWS at the
  /// colocation facility. For more information, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting
  /// Cross Connects at AWS Direct Connect Locations</a> in the <i>AWS Direct
  /// Connect User Guide</i>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of a connection, LAG, or interconnect.
  ///
  /// Parameter [loaContentType] :
  /// The standard media type for the LOA-CFA document. The only supported value
  /// is application/pdf.
  ///
  /// Parameter [providerName] :
  /// The name of the service provider who establishes connectivity on your
  /// behalf. If you specify this parameter, the LOA-CFA lists the provider name
  /// alongside your company name as the requester of the cross connect.
  Future<Loa> describeLoa({
    @_s.required String connectionId,
    LoaContentType loaContentType,
    String providerName,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeLoa'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        if (loaContentType != null) 'loaContentType': loaContentType.toValue(),
        if (providerName != null) 'providerName': providerName,
      },
    );

    return Loa.fromJson(jsonResponse.body);
  }

  /// Lists the AWS Direct Connect locations in the current AWS Region. These
  /// are the locations that can be selected when calling
  /// <a>CreateConnection</a> or <a>CreateInterconnect</a>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  Future<Locations> describeLocations() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeLocations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return Locations.fromJson(jsonResponse.body);
  }

  /// Describes the tags associated with the specified AWS Direct Connect
  /// resources.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARNs) of the resources.
  Future<DescribeTagsResponse> describeTags({
    @_s.required List<String> resourceArns,
  }) async {
    ArgumentError.checkNotNull(resourceArns, 'resourceArns');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArns': resourceArns,
      },
    );

    return DescribeTagsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the virtual private gateways owned by the AWS account.
  ///
  /// You can create one or more AWS Direct Connect private virtual interfaces
  /// linked to a virtual private gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  Future<VirtualGateways> describeVirtualGateways() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeVirtualGateways'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return VirtualGateways.fromJson(jsonResponse.body);
  }

  /// Displays all virtual interfaces for an AWS account. Virtual interfaces
  /// deleted fewer than 15 minutes before you make the request are also
  /// returned. If you specify a connection ID, only the virtual interfaces
  /// associated with the connection are returned. If you specify a virtual
  /// interface ID, then only a single virtual interface is returned.
  ///
  /// A virtual interface (VLAN) transmits the traffic between the AWS Direct
  /// Connect location and the customer network.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  Future<VirtualInterfaces> describeVirtualInterfaces({
    String connectionId,
    String virtualInterfaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeVirtualInterfaces'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (connectionId != null) 'connectionId': connectionId,
        if (virtualInterfaceId != null)
          'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return VirtualInterfaces.fromJson(jsonResponse.body);
  }

  /// Disassociates a connection from a link aggregation group (LAG). The
  /// connection is interrupted and re-established as a standalone connection
  /// (the connection is not deleted; to delete the connection, use the
  /// <a>DeleteConnection</a> request). If the LAG has associated virtual
  /// interfaces or hosted connections, they remain associated with the LAG. A
  /// disassociated connection owned by an AWS Direct Connect Partner is
  /// automatically converted to an interconnect.
  ///
  /// If disassociating the connection would cause the LAG to fall below its
  /// setting for minimum number of operational connections, the request fails,
  /// except when it's the last member of the LAG. If all connections are
  /// disassociated, the LAG continues to exist as an empty LAG with no physical
  /// connections.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG.
  Future<Connection> disassociateConnectionFromLag({
    @_s.required String connectionId,
    @_s.required String lagId,
  }) async {
    ArgumentError.checkNotNull(connectionId, 'connectionId');
    ArgumentError.checkNotNull(lagId, 'lagId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DisassociateConnectionFromLag'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'lagId': lagId,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Lists the virtual interface failover test history.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [bgpPeers] :
  /// The BGP peers that were placed in the DOWN state during the virtual
  /// interface failover test.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// If <code>MaxResults</code> is given a value larger than 100, only 100
  /// results are returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [status] :
  /// The status of the virtual interface failover test.
  ///
  /// Parameter [testId] :
  /// The ID of the virtual interface failover test.
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface that was tested.
  Future<ListVirtualInterfaceTestHistoryResponse>
      listVirtualInterfaceTestHistory({
    List<String> bgpPeers,
    int maxResults,
    String nextToken,
    String status,
    String testId,
    String virtualInterfaceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.ListVirtualInterfaceTestHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (bgpPeers != null) 'bgpPeers': bgpPeers,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status,
        if (testId != null) 'testId': testId,
        if (virtualInterfaceId != null)
          'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return ListVirtualInterfaceTestHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Starts the virtual interface failover test that verifies your
  /// configuration meets your resiliency requirements by placing the BGP
  /// peering session in the DOWN state. You can then send traffic to verify
  /// that there are no outages.
  ///
  /// You can run the test on public, private, transit, and hosted virtual
  /// interfaces.
  ///
  /// You can use <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_ListVirtualInterfaceTestHistory.html">ListVirtualInterfaceTestHistory</a>
  /// to view the virtual interface test history.
  ///
  /// If you need to stop the test before the test interval completes, use <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/APIReference/API_StopBgpFailoverTest.html">StopBgpFailoverTest</a>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface you want to test.
  ///
  /// Parameter [bgpPeers] :
  /// The BGP peers to place in the DOWN state.
  ///
  /// Parameter [testDurationInMinutes] :
  /// The time in minutes that the virtual interface failover test will last.
  ///
  /// Maximum value: 180 minutes (3 hours).
  ///
  /// Default: 180 minutes (3 hours).
  Future<StartBgpFailoverTestResponse> startBgpFailoverTest({
    @_s.required String virtualInterfaceId,
    List<String> bgpPeers,
    int testDurationInMinutes,
  }) async {
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.StartBgpFailoverTest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'virtualInterfaceId': virtualInterfaceId,
        if (bgpPeers != null) 'bgpPeers': bgpPeers,
        if (testDurationInMinutes != null)
          'testDurationInMinutes': testDurationInMinutes,
      },
    );

    return StartBgpFailoverTestResponse.fromJson(jsonResponse.body);
  }

  /// Stops the virtual interface failover test.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface you no longer want to test.
  Future<StopBgpFailoverTestResponse> stopBgpFailoverTest({
    @_s.required String virtualInterfaceId,
  }) async {
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.StopBgpFailoverTest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'virtualInterfaceId': virtualInterfaceId,
      },
    );

    return StopBgpFailoverTestResponse.fromJson(jsonResponse.body);
  }

  /// Adds the specified tags to the specified AWS Direct Connect resource. Each
  /// resource can have a maximum of 50 tags.
  ///
  /// Each tag consists of a key and an optional value. If a tag with the same
  /// key is already associated with the resource, this action updates its
  /// value.
  ///
  /// May throw [DuplicateTagKeysException].
  /// May throw [TooManyTagsException].
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to add.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more tags from the specified AWS Direct Connect resource.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys of the tags to remove.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified attributes of the Direct Connect gateway
  /// association.
  ///
  /// Add or remove prefixes from the association.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [addAllowedPrefixesToDirectConnectGateway] :
  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  ///
  /// Parameter [associationId] :
  /// The ID of the Direct Connect gateway association.
  ///
  /// Parameter [removeAllowedPrefixesToDirectConnectGateway] :
  /// The Amazon VPC prefixes to no longer advertise to the Direct Connect
  /// gateway.
  Future<UpdateDirectConnectGatewayAssociationResult>
      updateDirectConnectGatewayAssociation({
    List<RouteFilterPrefix> addAllowedPrefixesToDirectConnectGateway,
    String associationId,
    List<RouteFilterPrefix> removeAllowedPrefixesToDirectConnectGateway,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.UpdateDirectConnectGatewayAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (addAllowedPrefixesToDirectConnectGateway != null)
          'addAllowedPrefixesToDirectConnectGateway':
              addAllowedPrefixesToDirectConnectGateway,
        if (associationId != null) 'associationId': associationId,
        if (removeAllowedPrefixesToDirectConnectGateway != null)
          'removeAllowedPrefixesToDirectConnectGateway':
              removeAllowedPrefixesToDirectConnectGateway,
      },
    );

    return UpdateDirectConnectGatewayAssociationResult.fromJson(
        jsonResponse.body);
  }

  /// Updates the attributes of the specified link aggregation group (LAG).
  ///
  /// You can update the following attributes:
  ///
  /// <ul>
  /// <li>
  /// The name of the LAG.
  /// </li>
  /// <li>
  /// The value for the minimum number of connections that must be operational
  /// for the LAG itself to be operational.
  /// </li>
  /// </ul>
  /// When you create a LAG, the default value for the minimum number of
  /// operational connections is zero (0). If you update this value and the
  /// number of operational connections falls below the specified value, the LAG
  /// automatically goes down to avoid over-utilization of the remaining
  /// connections. Adjust this value with care, as it could force the LAG down
  /// if it is set higher than the current number of operational connections.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG.
  ///
  /// Parameter [lagName] :
  /// The name of the LAG.
  ///
  /// Parameter [minimumLinks] :
  /// The minimum number of physical connections that must be operational for
  /// the LAG itself to be operational.
  Future<Lag> updateLag({
    @_s.required String lagId,
    String lagName,
    int minimumLinks,
  }) async {
    ArgumentError.checkNotNull(lagId, 'lagId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.UpdateLag'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'lagId': lagId,
        if (lagName != null) 'lagName': lagName,
        if (minimumLinks != null) 'minimumLinks': minimumLinks,
      },
    );

    return Lag.fromJson(jsonResponse.body);
  }

  /// Updates the specified attributes of the specified virtual private
  /// interface.
  ///
  /// Setting the MTU of a virtual interface to 9001 (jumbo frames) can cause an
  /// update to the underlying physical connection if it wasn't updated to
  /// support jumbo frames. Updating the connection disrupts network
  /// connectivity for all virtual interfaces associated with the connection for
  /// up to 30 seconds. To check whether your connection supports jumbo frames,
  /// call <a>DescribeConnections</a>. To check whether your virtual q interface
  /// supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual private interface.
  ///
  /// Parameter [mtu] :
  /// The maximum transmission unit (MTU), in bytes. The supported values are
  /// 1500 and 9001. The default value is 1500.
  Future<VirtualInterface> updateVirtualInterfaceAttributes({
    @_s.required String virtualInterfaceId,
    int mtu,
  }) async {
    ArgumentError.checkNotNull(virtualInterfaceId, 'virtualInterfaceId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.UpdateVirtualInterfaceAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'virtualInterfaceId': virtualInterfaceId,
        if (mtu != null) 'mtu': mtu,
      },
    );

    return VirtualInterface.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptDirectConnectGatewayAssociationProposalResult {
  @_s.JsonKey(name: 'directConnectGatewayAssociation')
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  AcceptDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociation,
  });
  factory AcceptDirectConnectGatewayAssociationProposalResult.fromJson(
          Map<String, dynamic> json) =>
      _$AcceptDirectConnectGatewayAssociationProposalResultFromJson(json);
}

enum AddressFamily {
  @_s.JsonValue('ipv4')
  ipv4,
  @_s.JsonValue('ipv6')
  ipv6,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AllocateTransitVirtualInterfaceResult {
  @_s.JsonKey(name: 'virtualInterface')
  final VirtualInterface virtualInterface;

  AllocateTransitVirtualInterfaceResult({
    this.virtualInterface,
  });
  factory AllocateTransitVirtualInterfaceResult.fromJson(
          Map<String, dynamic> json) =>
      _$AllocateTransitVirtualInterfaceResultFromJson(json);
}

/// Information about the associated gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociatedGateway {
  /// The ID of the associated gateway.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The ID of the AWS account that owns the associated virtual private gateway
  /// or transit gateway.
  @_s.JsonKey(name: 'ownerAccount')
  final String ownerAccount;

  /// The Region where the associated gateway is located.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The type of associated gateway.
  @_s.JsonKey(name: 'type')
  final GatewayType type;

  AssociatedGateway({
    this.id,
    this.ownerAccount,
    this.region,
    this.type,
  });
  factory AssociatedGateway.fromJson(Map<String, dynamic> json) =>
      _$AssociatedGatewayFromJson(json);
}

/// Information about a BGP peer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BGPPeer {
  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The Direct Connect endpoint on which the BGP peer terminates.
  @_s.JsonKey(name: 'awsDeviceV2')
  final String awsDeviceV2;

  /// The ID of the BGP peer.
  @_s.JsonKey(name: 'bgpPeerId')
  final String bgpPeerId;

  /// The state of the BGP peer. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>verifying</code>: The BGP peering addresses or ASN require validation
  /// before the BGP peer can be created. This state applies only to public
  /// virtual interfaces.
  /// </li>
  /// <li>
  /// <code>pending</code>: The BGP peer is created, and remains in this state
  /// until it is ready to be established.
  /// </li>
  /// <li>
  /// <code>available</code>: The BGP peer is ready to be established.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The BGP peer is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The BGP peer is deleted and cannot be established.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'bgpPeerState')
  final BGPPeerState bgpPeerState;

  /// The status of the BGP peer. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>up</code>: The BGP peer is established. This state does not indicate
  /// the state of the routing function. Ensure that you are receiving routes over
  /// the BGP session.
  /// </li>
  /// <li>
  /// <code>down</code>: The BGP peer is down.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The BGP peer status is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'bgpStatus')
  final BGPStatus bgpStatus;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  BGPPeer({
    this.addressFamily,
    this.amazonAddress,
    this.asn,
    this.authKey,
    this.awsDeviceV2,
    this.bgpPeerId,
    this.bgpPeerState,
    this.bgpStatus,
    this.customerAddress,
  });
  factory BGPPeer.fromJson(Map<String, dynamic> json) =>
      _$BGPPeerFromJson(json);
}

enum BGPPeerState {
  @_s.JsonValue('verifying')
  verifying,
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('deleted')
  deleted,
}

enum BGPStatus {
  @_s.JsonValue('up')
  up,
  @_s.JsonValue('down')
  down,
  @_s.JsonValue('unknown')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmConnectionResponse {
  /// The state of the connection. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>ordering</code>: The initial state of a hosted connection provisioned
  /// on an interconnect. The connection stays in the ordering state until the
  /// owner of the hosted connection confirms or declines the connection order.
  /// </li>
  /// <li>
  /// <code>requested</code>: The initial state of a standard connection. The
  /// connection stays in the requested state until the Letter of Authorization
  /// (LOA) is sent to the customer.
  /// </li>
  /// <li>
  /// <code>pending</code>: The connection has been approved and is being
  /// initialized.
  /// </li>
  /// <li>
  /// <code>available</code>: The network link is up and the connection is ready
  /// for use.
  /// </li>
  /// <li>
  /// <code>down</code>: The network link is down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The connection is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The connection has been deleted.
  /// </li>
  /// <li>
  /// <code>rejected</code>: A hosted connection in the <code>ordering</code>
  /// state enters the <code>rejected</code> state if it is deleted by the
  /// customer.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the connection is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'connectionState')
  final ConnectionState connectionState;

  ConfirmConnectionResponse({
    this.connectionState,
  });
  factory ConfirmConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmConnectionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmPrivateVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>confirming</code>: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  /// </li>
  /// <li>
  /// <code>verifying</code>: This state only applies to public virtual
  /// interfaces. Each public virtual interface needs validation before the
  /// virtual interface can be created.
  /// </li>
  /// <li>
  /// <code>pending</code>: A virtual interface is in this state from the time
  /// that it is created until the virtual interface is ready to forward traffic.
  /// </li>
  /// <li>
  /// <code>available</code>: A virtual interface that is able to forward traffic.
  /// </li>
  /// <li>
  /// <code>down</code>: A virtual interface that is BGP down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: A virtual interface is in this state immediately
  /// after calling <a>DeleteVirtualInterface</a> until it can no longer forward
  /// traffic.
  /// </li>
  /// <li>
  /// <code>deleted</code>: A virtual interface that cannot forward traffic.
  /// </li>
  /// <li>
  /// <code>rejected</code>: The virtual interface owner has declined creation of
  /// the virtual interface. If a virtual interface in the <code>Confirming</code>
  /// state is deleted by the virtual interface owner, the virtual interface
  /// enters the <code>Rejected</code> state.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the virtual interface is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'virtualInterfaceState')
  final VirtualInterfaceState virtualInterfaceState;

  ConfirmPrivateVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  factory ConfirmPrivateVirtualInterfaceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ConfirmPrivateVirtualInterfaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmPublicVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>confirming</code>: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  /// </li>
  /// <li>
  /// <code>verifying</code>: This state only applies to public virtual
  /// interfaces. Each public virtual interface needs validation before the
  /// virtual interface can be created.
  /// </li>
  /// <li>
  /// <code>pending</code>: A virtual interface is in this state from the time
  /// that it is created until the virtual interface is ready to forward traffic.
  /// </li>
  /// <li>
  /// <code>available</code>: A virtual interface that is able to forward traffic.
  /// </li>
  /// <li>
  /// <code>down</code>: A virtual interface that is BGP down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: A virtual interface is in this state immediately
  /// after calling <a>DeleteVirtualInterface</a> until it can no longer forward
  /// traffic.
  /// </li>
  /// <li>
  /// <code>deleted</code>: A virtual interface that cannot forward traffic.
  /// </li>
  /// <li>
  /// <code>rejected</code>: The virtual interface owner has declined creation of
  /// the virtual interface. If a virtual interface in the <code>Confirming</code>
  /// state is deleted by the virtual interface owner, the virtual interface
  /// enters the <code>Rejected</code> state.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the virtual interface is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'virtualInterfaceState')
  final VirtualInterfaceState virtualInterfaceState;

  ConfirmPublicVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  factory ConfirmPublicVirtualInterfaceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ConfirmPublicVirtualInterfaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmTransitVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>confirming</code>: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  /// </li>
  /// <li>
  /// <code>verifying</code>: This state only applies to public virtual
  /// interfaces. Each public virtual interface needs validation before the
  /// virtual interface can be created.
  /// </li>
  /// <li>
  /// <code>pending</code>: A virtual interface is in this state from the time
  /// that it is created until the virtual interface is ready to forward traffic.
  /// </li>
  /// <li>
  /// <code>available</code>: A virtual interface that is able to forward traffic.
  /// </li>
  /// <li>
  /// <code>down</code>: A virtual interface that is BGP down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: A virtual interface is in this state immediately
  /// after calling <a>DeleteVirtualInterface</a> until it can no longer forward
  /// traffic.
  /// </li>
  /// <li>
  /// <code>deleted</code>: A virtual interface that cannot forward traffic.
  /// </li>
  /// <li>
  /// <code>rejected</code>: The virtual interface owner has declined creation of
  /// the virtual interface. If a virtual interface in the <code>Confirming</code>
  /// state is deleted by the virtual interface owner, the virtual interface
  /// enters the <code>Rejected</code> state.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the virtual interface is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'virtualInterfaceState')
  final VirtualInterfaceState virtualInterfaceState;

  ConfirmTransitVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  factory ConfirmTransitVirtualInterfaceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ConfirmTransitVirtualInterfaceResponseFromJson(json);
}

/// Information about an AWS Direct Connect connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Connection {
  /// The Direct Connect endpoint on which the physical connection terminates.
  @_s.JsonKey(name: 'awsDevice')
  final String awsDevice;

  /// The Direct Connect endpoint on which the physical connection terminates.
  @_s.JsonKey(name: 'awsDeviceV2')
  final String awsDeviceV2;

  /// The bandwidth of the connection.
  @_s.JsonKey(name: 'bandwidth')
  final String bandwidth;

  /// The ID of the connection.
  @_s.JsonKey(name: 'connectionId')
  final String connectionId;

  /// The name of the connection.
  @_s.JsonKey(name: 'connectionName')
  final String connectionName;

  /// The state of the connection. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>ordering</code>: The initial state of a hosted connection provisioned
  /// on an interconnect. The connection stays in the ordering state until the
  /// owner of the hosted connection confirms or declines the connection order.
  /// </li>
  /// <li>
  /// <code>requested</code>: The initial state of a standard connection. The
  /// connection stays in the requested state until the Letter of Authorization
  /// (LOA) is sent to the customer.
  /// </li>
  /// <li>
  /// <code>pending</code>: The connection has been approved and is being
  /// initialized.
  /// </li>
  /// <li>
  /// <code>available</code>: The network link is up and the connection is ready
  /// for use.
  /// </li>
  /// <li>
  /// <code>down</code>: The network link is down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The connection is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The connection has been deleted.
  /// </li>
  /// <li>
  /// <code>rejected</code>: A hosted connection in the <code>ordering</code>
  /// state enters the <code>rejected</code> state if it is deleted by the
  /// customer.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the connection is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'connectionState')
  final ConnectionState connectionState;

  /// Indicates whether the connection supports a secondary BGP peer in the same
  /// address family (IPv4/IPv6).
  @_s.JsonKey(name: 'hasLogicalRedundancy')
  final HasLogicalRedundancy hasLogicalRedundancy;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  @_s.JsonKey(name: 'jumboFrameCapable')
  final bool jumboFrameCapable;

  /// The ID of the LAG.
  @_s.JsonKey(name: 'lagId')
  final String lagId;

  /// The time of the most recent call to <a>DescribeLoa</a> for this connection.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'loaIssueTime')
  final DateTime loaIssueTime;

  /// The location of the connection.
  @_s.JsonKey(name: 'location')
  final String location;

  /// The ID of the AWS account that owns the connection.
  @_s.JsonKey(name: 'ownerAccount')
  final String ownerAccount;

  /// The name of the AWS Direct Connect service provider associated with the
  /// connection.
  @_s.JsonKey(name: 'partnerName')
  final String partnerName;

  /// The name of the service provider associated with the connection.
  @_s.JsonKey(name: 'providerName')
  final String providerName;

  /// The AWS Region where the connection is located.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The tags associated with the connection.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  Connection({
    this.awsDevice,
    this.awsDeviceV2,
    this.bandwidth,
    this.connectionId,
    this.connectionName,
    this.connectionState,
    this.hasLogicalRedundancy,
    this.jumboFrameCapable,
    this.lagId,
    this.loaIssueTime,
    this.location,
    this.ownerAccount,
    this.partnerName,
    this.providerName,
    this.region,
    this.tags,
    this.vlan,
  });
  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}

enum ConnectionState {
  @_s.JsonValue('ordering')
  ordering,
  @_s.JsonValue('requested')
  requested,
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('down')
  down,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('deleted')
  deleted,
  @_s.JsonValue('rejected')
  rejected,
  @_s.JsonValue('unknown')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Connections {
  /// The connections.
  @_s.JsonKey(name: 'connections')
  final List<Connection> connections;

  Connections({
    this.connections,
  });
  factory Connections.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBGPPeerResponse {
  /// The virtual interface.
  @_s.JsonKey(name: 'virtualInterface')
  final VirtualInterface virtualInterface;

  CreateBGPPeerResponse({
    this.virtualInterface,
  });
  factory CreateBGPPeerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBGPPeerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDirectConnectGatewayAssociationProposalResult {
  /// Information about the Direct Connect gateway proposal.
  @_s.JsonKey(name: 'directConnectGatewayAssociationProposal')
  final DirectConnectGatewayAssociationProposal
      directConnectGatewayAssociationProposal;

  CreateDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociationProposal,
  });
  factory CreateDirectConnectGatewayAssociationProposalResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDirectConnectGatewayAssociationProposalResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDirectConnectGatewayAssociationResult {
  /// The association to be created.
  @_s.JsonKey(name: 'directConnectGatewayAssociation')
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  CreateDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });
  factory CreateDirectConnectGatewayAssociationResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDirectConnectGatewayAssociationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDirectConnectGatewayResult {
  /// The Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGateway')
  final DirectConnectGateway directConnectGateway;

  CreateDirectConnectGatewayResult({
    this.directConnectGateway,
  });
  factory CreateDirectConnectGatewayResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDirectConnectGatewayResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTransitVirtualInterfaceResult {
  @_s.JsonKey(name: 'virtualInterface')
  final VirtualInterface virtualInterface;

  CreateTransitVirtualInterfaceResult({
    this.virtualInterface,
  });
  factory CreateTransitVirtualInterfaceResult.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTransitVirtualInterfaceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBGPPeerResponse {
  /// The virtual interface.
  @_s.JsonKey(name: 'virtualInterface')
  final VirtualInterface virtualInterface;

  DeleteBGPPeerResponse({
    this.virtualInterface,
  });
  factory DeleteBGPPeerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBGPPeerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDirectConnectGatewayAssociationProposalResult {
  /// The ID of the associated gateway.
  @_s.JsonKey(name: 'directConnectGatewayAssociationProposal')
  final DirectConnectGatewayAssociationProposal
      directConnectGatewayAssociationProposal;

  DeleteDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociationProposal,
  });
  factory DeleteDirectConnectGatewayAssociationProposalResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteDirectConnectGatewayAssociationProposalResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDirectConnectGatewayAssociationResult {
  /// Information about the deleted association.
  @_s.JsonKey(name: 'directConnectGatewayAssociation')
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  DeleteDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });
  factory DeleteDirectConnectGatewayAssociationResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteDirectConnectGatewayAssociationResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDirectConnectGatewayResult {
  /// The Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGateway')
  final DirectConnectGateway directConnectGateway;

  DeleteDirectConnectGatewayResult({
    this.directConnectGateway,
  });
  factory DeleteDirectConnectGatewayResult.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteDirectConnectGatewayResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInterconnectResponse {
  /// The state of the interconnect. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>requested</code>: The initial state of an interconnect. The
  /// interconnect stays in the requested state until the Letter of Authorization
  /// (LOA) is sent to the customer.
  /// </li>
  /// <li>
  /// <code>pending</code>: The interconnect is approved, and is being
  /// initialized.
  /// </li>
  /// <li>
  /// <code>available</code>: The network link is up, and the interconnect is
  /// ready for use.
  /// </li>
  /// <li>
  /// <code>down</code>: The network link is down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The interconnect is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The interconnect is deleted.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the interconnect is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'interconnectState')
  final InterconnectState interconnectState;

  DeleteInterconnectResponse({
    this.interconnectState,
  });
  factory DeleteInterconnectResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInterconnectResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteVirtualInterfaceResponse {
  /// The state of the virtual interface. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>confirming</code>: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  /// </li>
  /// <li>
  /// <code>verifying</code>: This state only applies to public virtual
  /// interfaces. Each public virtual interface needs validation before the
  /// virtual interface can be created.
  /// </li>
  /// <li>
  /// <code>pending</code>: A virtual interface is in this state from the time
  /// that it is created until the virtual interface is ready to forward traffic.
  /// </li>
  /// <li>
  /// <code>available</code>: A virtual interface that is able to forward traffic.
  /// </li>
  /// <li>
  /// <code>down</code>: A virtual interface that is BGP down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: A virtual interface is in this state immediately
  /// after calling <a>DeleteVirtualInterface</a> until it can no longer forward
  /// traffic.
  /// </li>
  /// <li>
  /// <code>deleted</code>: A virtual interface that cannot forward traffic.
  /// </li>
  /// <li>
  /// <code>rejected</code>: The virtual interface owner has declined creation of
  /// the virtual interface. If a virtual interface in the <code>Confirming</code>
  /// state is deleted by the virtual interface owner, the virtual interface
  /// enters the <code>Rejected</code> state.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the virtual interface is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'virtualInterfaceState')
  final VirtualInterfaceState virtualInterfaceState;

  DeleteVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });
  factory DeleteVirtualInterfaceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteVirtualInterfaceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeConnectionLoaResponse {
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).
  @_s.JsonKey(name: 'loa')
  final Loa loa;

  DescribeConnectionLoaResponse({
    this.loa,
  });
  factory DescribeConnectionLoaResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeConnectionLoaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDirectConnectGatewayAssociationProposalsResult {
  /// Describes the Direct Connect gateway association proposals.
  @_s.JsonKey(name: 'directConnectGatewayAssociationProposals')
  final List<DirectConnectGatewayAssociationProposal>
      directConnectGatewayAssociationProposals;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeDirectConnectGatewayAssociationProposalsResult({
    this.directConnectGatewayAssociationProposals,
    this.nextToken,
  });
  factory DescribeDirectConnectGatewayAssociationProposalsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDirectConnectGatewayAssociationProposalsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDirectConnectGatewayAssociationsResult {
  /// Information about the associations.
  @_s.JsonKey(name: 'directConnectGatewayAssociations')
  final List<DirectConnectGatewayAssociation> directConnectGatewayAssociations;

  /// The token to retrieve the next page.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeDirectConnectGatewayAssociationsResult({
    this.directConnectGatewayAssociations,
    this.nextToken,
  });
  factory DescribeDirectConnectGatewayAssociationsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDirectConnectGatewayAssociationsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDirectConnectGatewayAttachmentsResult {
  /// The attachments.
  @_s.JsonKey(name: 'directConnectGatewayAttachments')
  final List<DirectConnectGatewayAttachment> directConnectGatewayAttachments;

  /// The token to retrieve the next page.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeDirectConnectGatewayAttachmentsResult({
    this.directConnectGatewayAttachments,
    this.nextToken,
  });
  factory DescribeDirectConnectGatewayAttachmentsResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDirectConnectGatewayAttachmentsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDirectConnectGatewaysResult {
  /// The Direct Connect gateways.
  @_s.JsonKey(name: 'directConnectGateways')
  final List<DirectConnectGateway> directConnectGateways;

  /// The token to retrieve the next page.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeDirectConnectGatewaysResult({
    this.directConnectGateways,
    this.nextToken,
  });
  factory DescribeDirectConnectGatewaysResult.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDirectConnectGatewaysResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInterconnectLoaResponse {
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).
  @_s.JsonKey(name: 'loa')
  final Loa loa;

  DescribeInterconnectLoaResponse({
    this.loa,
  });
  factory DescribeInterconnectLoaResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeInterconnectLoaResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTagsResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'resourceTags')
  final List<ResourceTag> resourceTags;

  DescribeTagsResponse({
    this.resourceTags,
  });
  factory DescribeTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTagsResponseFromJson(json);
}

/// Information about a Direct Connect gateway, which enables you to connect
/// virtual interfaces and virtual private gateway or transit gateways.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectConnectGateway {
  /// The autonomous system number (ASN) for the Amazon side of the connection.
  @_s.JsonKey(name: 'amazonSideAsn')
  final int amazonSideAsn;

  /// The ID of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayId')
  final String directConnectGatewayId;

  /// The name of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayName')
  final String directConnectGatewayName;

  /// The state of the Direct Connect gateway. The following are the possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>pending</code>: The initial state after calling
  /// <a>CreateDirectConnectGateway</a>.
  /// </li>
  /// <li>
  /// <code>available</code>: The Direct Connect gateway is ready for use.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The initial state after calling
  /// <a>DeleteDirectConnectGateway</a>.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The Direct Connect gateway is deleted and cannot pass
  /// traffic.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'directConnectGatewayState')
  final DirectConnectGatewayState directConnectGatewayState;

  /// The ID of the AWS account that owns the Direct Connect gateway.
  @_s.JsonKey(name: 'ownerAccount')
  final String ownerAccount;

  /// The error message if the state of an object failed to advance.
  @_s.JsonKey(name: 'stateChangeError')
  final String stateChangeError;

  DirectConnectGateway({
    this.amazonSideAsn,
    this.directConnectGatewayId,
    this.directConnectGatewayName,
    this.directConnectGatewayState,
    this.ownerAccount,
    this.stateChangeError,
  });
  factory DirectConnectGateway.fromJson(Map<String, dynamic> json) =>
      _$DirectConnectGatewayFromJson(json);
}

/// Information about an association between a Direct Connect gateway and a
/// virtual private gateway or transit gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectConnectGatewayAssociation {
  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  @_s.JsonKey(name: 'allowedPrefixesToDirectConnectGateway')
  final List<RouteFilterPrefix> allowedPrefixesToDirectConnectGateway;

  /// Information about the associated gateway.
  @_s.JsonKey(name: 'associatedGateway')
  final AssociatedGateway associatedGateway;

  /// The ID of the Direct Connect gateway association.
  @_s.JsonKey(name: 'associationId')
  final String associationId;

  /// The state of the association. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>associating</code>: The initial state after calling
  /// <a>CreateDirectConnectGatewayAssociation</a>.
  /// </li>
  /// <li>
  /// <code>associated</code>: The Direct Connect gateway and virtual private
  /// gateway or transit gateway are successfully associated and ready to pass
  /// traffic.
  /// </li>
  /// <li>
  /// <code>disassociating</code>: The initial state after calling
  /// <a>DeleteDirectConnectGatewayAssociation</a>.
  /// </li>
  /// <li>
  /// <code>disassociated</code>: The virtual private gateway or transit gateway
  /// is disassociated from the Direct Connect gateway. Traffic flow between the
  /// Direct Connect gateway and virtual private gateway or transit gateway is
  /// stopped.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'associationState')
  final DirectConnectGatewayAssociationState associationState;

  /// The ID of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayId')
  final String directConnectGatewayId;

  /// The ID of the AWS account that owns the associated gateway.
  @_s.JsonKey(name: 'directConnectGatewayOwnerAccount')
  final String directConnectGatewayOwnerAccount;

  /// The error message if the state of an object failed to advance.
  @_s.JsonKey(name: 'stateChangeError')
  final String stateChangeError;

  /// The ID of the virtual private gateway. Applies only to private virtual
  /// interfaces.
  @_s.JsonKey(name: 'virtualGatewayId')
  final String virtualGatewayId;

  /// The ID of the AWS account that owns the virtual private gateway.
  @_s.JsonKey(name: 'virtualGatewayOwnerAccount')
  final String virtualGatewayOwnerAccount;

  /// The AWS Region where the virtual private gateway is located.
  @_s.JsonKey(name: 'virtualGatewayRegion')
  final String virtualGatewayRegion;

  DirectConnectGatewayAssociation({
    this.allowedPrefixesToDirectConnectGateway,
    this.associatedGateway,
    this.associationId,
    this.associationState,
    this.directConnectGatewayId,
    this.directConnectGatewayOwnerAccount,
    this.stateChangeError,
    this.virtualGatewayId,
    this.virtualGatewayOwnerAccount,
    this.virtualGatewayRegion,
  });
  factory DirectConnectGatewayAssociation.fromJson(Map<String, dynamic> json) =>
      _$DirectConnectGatewayAssociationFromJson(json);
}

/// Information about the proposal request to attach a virtual private gateway
/// to a Direct Connect gateway.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectConnectGatewayAssociationProposal {
  /// Information about the associated gateway.
  @_s.JsonKey(name: 'associatedGateway')
  final AssociatedGateway associatedGateway;

  /// The ID of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayId')
  final String directConnectGatewayId;

  /// The ID of the AWS account that owns the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayOwnerAccount')
  final String directConnectGatewayOwnerAccount;

  /// The existing Amazon VPC prefixes advertised to the Direct Connect gateway.
  @_s.JsonKey(name: 'existingAllowedPrefixesToDirectConnectGateway')
  final List<RouteFilterPrefix> existingAllowedPrefixesToDirectConnectGateway;

  /// The ID of the association proposal.
  @_s.JsonKey(name: 'proposalId')
  final String proposalId;

  /// The state of the proposal. The following are possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>accepted</code>: The proposal has been accepted. The Direct Connect
  /// gateway association is available to use in this state.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The proposal has been deleted by the owner that made
  /// the proposal. The Direct Connect gateway association cannot be used in this
  /// state.
  /// </li>
  /// <li>
  /// <code>requested</code>: The proposal has been requested. The Direct Connect
  /// gateway association cannot be used in this state.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'proposalState')
  final DirectConnectGatewayAssociationProposalState proposalState;

  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  @_s.JsonKey(name: 'requestedAllowedPrefixesToDirectConnectGateway')
  final List<RouteFilterPrefix> requestedAllowedPrefixesToDirectConnectGateway;

  DirectConnectGatewayAssociationProposal({
    this.associatedGateway,
    this.directConnectGatewayId,
    this.directConnectGatewayOwnerAccount,
    this.existingAllowedPrefixesToDirectConnectGateway,
    this.proposalId,
    this.proposalState,
    this.requestedAllowedPrefixesToDirectConnectGateway,
  });
  factory DirectConnectGatewayAssociationProposal.fromJson(
          Map<String, dynamic> json) =>
      _$DirectConnectGatewayAssociationProposalFromJson(json);
}

enum DirectConnectGatewayAssociationProposalState {
  @_s.JsonValue('requested')
  requested,
  @_s.JsonValue('accepted')
  accepted,
  @_s.JsonValue('deleted')
  deleted,
}

enum DirectConnectGatewayAssociationState {
  @_s.JsonValue('associating')
  associating,
  @_s.JsonValue('associated')
  associated,
  @_s.JsonValue('disassociating')
  disassociating,
  @_s.JsonValue('disassociated')
  disassociated,
  @_s.JsonValue('updating')
  updating,
}

/// Information about an attachment between a Direct Connect gateway and a
/// virtual interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DirectConnectGatewayAttachment {
  /// The state of the attachment. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>attaching</code>: The initial state after a virtual interface is
  /// created using the Direct Connect gateway.
  /// </li>
  /// <li>
  /// <code>attached</code>: The Direct Connect gateway and virtual interface are
  /// attached and ready to pass traffic.
  /// </li>
  /// <li>
  /// <code>detaching</code>: The initial state after calling
  /// <a>DeleteVirtualInterface</a>.
  /// </li>
  /// <li>
  /// <code>detached</code>: The virtual interface is detached from the Direct
  /// Connect gateway. Traffic flow between the Direct Connect gateway and virtual
  /// interface is stopped.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'attachmentState')
  final DirectConnectGatewayAttachmentState attachmentState;

  /// The type of attachment.
  @_s.JsonKey(name: 'attachmentType')
  final DirectConnectGatewayAttachmentType attachmentType;

  /// The ID of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayId')
  final String directConnectGatewayId;

  /// The error message if the state of an object failed to advance.
  @_s.JsonKey(name: 'stateChangeError')
  final String stateChangeError;

  /// The ID of the virtual interface.
  @_s.JsonKey(name: 'virtualInterfaceId')
  final String virtualInterfaceId;

  /// The ID of the AWS account that owns the virtual interface.
  @_s.JsonKey(name: 'virtualInterfaceOwnerAccount')
  final String virtualInterfaceOwnerAccount;

  /// The AWS Region where the virtual interface is located.
  @_s.JsonKey(name: 'virtualInterfaceRegion')
  final String virtualInterfaceRegion;

  DirectConnectGatewayAttachment({
    this.attachmentState,
    this.attachmentType,
    this.directConnectGatewayId,
    this.stateChangeError,
    this.virtualInterfaceId,
    this.virtualInterfaceOwnerAccount,
    this.virtualInterfaceRegion,
  });
  factory DirectConnectGatewayAttachment.fromJson(Map<String, dynamic> json) =>
      _$DirectConnectGatewayAttachmentFromJson(json);
}

enum DirectConnectGatewayAttachmentState {
  @_s.JsonValue('attaching')
  attaching,
  @_s.JsonValue('attached')
  attached,
  @_s.JsonValue('detaching')
  detaching,
  @_s.JsonValue('detached')
  detached,
}

enum DirectConnectGatewayAttachmentType {
  @_s.JsonValue('TransitVirtualInterface')
  transitVirtualInterface,
  @_s.JsonValue('PrivateVirtualInterface')
  privateVirtualInterface,
}

enum DirectConnectGatewayState {
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('deleted')
  deleted,
}

enum GatewayType {
  @_s.JsonValue('virtualPrivateGateway')
  virtualPrivateGateway,
  @_s.JsonValue('transitGateway')
  transitGateway,
}

enum HasLogicalRedundancy {
  @_s.JsonValue('unknown')
  unknown,
  @_s.JsonValue('yes')
  yes,
  @_s.JsonValue('no')
  no,
}

/// Information about an interconnect.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Interconnect {
  /// The Direct Connect endpoint on which the physical connection terminates.
  @_s.JsonKey(name: 'awsDevice')
  final String awsDevice;

  /// The Direct Connect endpoint on which the physical connection terminates.
  @_s.JsonKey(name: 'awsDeviceV2')
  final String awsDeviceV2;

  /// The bandwidth of the connection.
  @_s.JsonKey(name: 'bandwidth')
  final String bandwidth;

  /// Indicates whether the interconnect supports a secondary BGP in the same
  /// address family (IPv4/IPv6).
  @_s.JsonKey(name: 'hasLogicalRedundancy')
  final HasLogicalRedundancy hasLogicalRedundancy;

  /// The ID of the interconnect.
  @_s.JsonKey(name: 'interconnectId')
  final String interconnectId;

  /// The name of the interconnect.
  @_s.JsonKey(name: 'interconnectName')
  final String interconnectName;

  /// The state of the interconnect. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>requested</code>: The initial state of an interconnect. The
  /// interconnect stays in the requested state until the Letter of Authorization
  /// (LOA) is sent to the customer.
  /// </li>
  /// <li>
  /// <code>pending</code>: The interconnect is approved, and is being
  /// initialized.
  /// </li>
  /// <li>
  /// <code>available</code>: The network link is up, and the interconnect is
  /// ready for use.
  /// </li>
  /// <li>
  /// <code>down</code>: The network link is down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The interconnect is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The interconnect is deleted.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the interconnect is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'interconnectState')
  final InterconnectState interconnectState;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  @_s.JsonKey(name: 'jumboFrameCapable')
  final bool jumboFrameCapable;

  /// The ID of the LAG.
  @_s.JsonKey(name: 'lagId')
  final String lagId;

  /// The time of the most recent call to <a>DescribeLoa</a> for this connection.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'loaIssueTime')
  final DateTime loaIssueTime;

  /// The location of the connection.
  @_s.JsonKey(name: 'location')
  final String location;

  /// The name of the service provider associated with the interconnect.
  @_s.JsonKey(name: 'providerName')
  final String providerName;

  /// The AWS Region where the connection is located.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The tags associated with the interconnect.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  Interconnect({
    this.awsDevice,
    this.awsDeviceV2,
    this.bandwidth,
    this.hasLogicalRedundancy,
    this.interconnectId,
    this.interconnectName,
    this.interconnectState,
    this.jumboFrameCapable,
    this.lagId,
    this.loaIssueTime,
    this.location,
    this.providerName,
    this.region,
    this.tags,
  });
  factory Interconnect.fromJson(Map<String, dynamic> json) =>
      _$InterconnectFromJson(json);
}

enum InterconnectState {
  @_s.JsonValue('requested')
  requested,
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('down')
  down,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('deleted')
  deleted,
  @_s.JsonValue('unknown')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Interconnects {
  /// The interconnects.
  @_s.JsonKey(name: 'interconnects')
  final List<Interconnect> interconnects;

  Interconnects({
    this.interconnects,
  });
  factory Interconnects.fromJson(Map<String, dynamic> json) =>
      _$InterconnectsFromJson(json);
}

/// Information about a link aggregation group (LAG).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Lag {
  /// Indicates whether the LAG can host other connections.
  @_s.JsonKey(name: 'allowsHostedConnections')
  final bool allowsHostedConnections;

  /// The AWS Direct Connect endpoint that hosts the LAG.
  @_s.JsonKey(name: 'awsDevice')
  final String awsDevice;

  /// The AWS Direct Connect endpoint that hosts the LAG.
  @_s.JsonKey(name: 'awsDeviceV2')
  final String awsDeviceV2;

  /// The connections bundled by the LAG.
  @_s.JsonKey(name: 'connections')
  final List<Connection> connections;

  /// The individual bandwidth of the physical connections bundled by the LAG. The
  /// possible values are 1Gbps and 10Gbps.
  @_s.JsonKey(name: 'connectionsBandwidth')
  final String connectionsBandwidth;

  /// Indicates whether the LAG supports a secondary BGP peer in the same address
  /// family (IPv4/IPv6).
  @_s.JsonKey(name: 'hasLogicalRedundancy')
  final HasLogicalRedundancy hasLogicalRedundancy;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  @_s.JsonKey(name: 'jumboFrameCapable')
  final bool jumboFrameCapable;

  /// The ID of the LAG.
  @_s.JsonKey(name: 'lagId')
  final String lagId;

  /// The name of the LAG.
  @_s.JsonKey(name: 'lagName')
  final String lagName;

  /// The state of the LAG. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>requested</code>: The initial state of a LAG. The LAG stays in the
  /// requested state until the Letter of Authorization (LOA) is available.
  /// </li>
  /// <li>
  /// <code>pending</code>: The LAG has been approved and is being initialized.
  /// </li>
  /// <li>
  /// <code>available</code>: The network link is established and the LAG is ready
  /// for use.
  /// </li>
  /// <li>
  /// <code>down</code>: The network link is down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: The LAG is being deleted.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The LAG is deleted.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the LAG is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'lagState')
  final LagState lagState;

  /// The location of the LAG.
  @_s.JsonKey(name: 'location')
  final String location;

  /// The minimum number of physical dedicated connections that must be
  /// operational for the LAG itself to be operational.
  @_s.JsonKey(name: 'minimumLinks')
  final int minimumLinks;

  /// The number of physical dedicated connections bundled by the LAG, up to a
  /// maximum of 10.
  @_s.JsonKey(name: 'numberOfConnections')
  final int numberOfConnections;

  /// The ID of the AWS account that owns the LAG.
  @_s.JsonKey(name: 'ownerAccount')
  final String ownerAccount;

  /// The name of the service provider associated with the LAG.
  @_s.JsonKey(name: 'providerName')
  final String providerName;

  /// The AWS Region where the connection is located.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The tags associated with the LAG.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  Lag({
    this.allowsHostedConnections,
    this.awsDevice,
    this.awsDeviceV2,
    this.connections,
    this.connectionsBandwidth,
    this.hasLogicalRedundancy,
    this.jumboFrameCapable,
    this.lagId,
    this.lagName,
    this.lagState,
    this.location,
    this.minimumLinks,
    this.numberOfConnections,
    this.ownerAccount,
    this.providerName,
    this.region,
    this.tags,
  });
  factory Lag.fromJson(Map<String, dynamic> json) => _$LagFromJson(json);
}

enum LagState {
  @_s.JsonValue('requested')
  requested,
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('down')
  down,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('deleted')
  deleted,
  @_s.JsonValue('unknown')
  unknown,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Lags {
  /// The LAGs.
  @_s.JsonKey(name: 'lags')
  final List<Lag> lags;

  Lags({
    this.lags,
  });
  factory Lags.fromJson(Map<String, dynamic> json) => _$LagsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVirtualInterfaceTestHistoryResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The ID of the tested virtual interface.
  @_s.JsonKey(name: 'virtualInterfaceTestHistory')
  final List<VirtualInterfaceTestHistory> virtualInterfaceTestHistory;

  ListVirtualInterfaceTestHistoryResponse({
    this.nextToken,
    this.virtualInterfaceTestHistory,
  });
  factory ListVirtualInterfaceTestHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListVirtualInterfaceTestHistoryResponseFromJson(json);
}

/// Information about a Letter of Authorization - Connecting Facility Assignment
/// (LOA-CFA) for a connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Loa {
  /// The binary contents of the LOA-CFA document.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'loaContent')
  final Uint8List loaContent;

  /// The standard media type for the LOA-CFA document. The only supported value
  /// is application/pdf.
  @_s.JsonKey(name: 'loaContentType')
  final LoaContentType loaContentType;

  Loa({
    this.loaContent,
    this.loaContentType,
  });
  factory Loa.fromJson(Map<String, dynamic> json) => _$LoaFromJson(json);
}

enum LoaContentType {
  @_s.JsonValue('application/pdf')
  applicationPdf,
}

extension on LoaContentType {
  String toValue() {
    switch (this) {
      case LoaContentType.applicationPdf:
        return 'application/pdf';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an AWS Direct Connect location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Location {
  /// The available port speeds for the location.
  @_s.JsonKey(name: 'availablePortSpeeds')
  final List<String> availablePortSpeeds;

  /// The name of the service provider for the location.
  @_s.JsonKey(name: 'availableProviders')
  final List<String> availableProviders;

  /// The code for the location.
  @_s.JsonKey(name: 'locationCode')
  final String locationCode;

  /// The name of the location. This includes the name of the colocation partner
  /// and the physical site of the building.
  @_s.JsonKey(name: 'locationName')
  final String locationName;

  /// The AWS Region for the location.
  @_s.JsonKey(name: 'region')
  final String region;

  Location({
    this.availablePortSpeeds,
    this.availableProviders,
    this.locationCode,
    this.locationName,
    this.region,
  });
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Locations {
  /// The locations.
  @_s.JsonKey(name: 'locations')
  final List<Location> locations;

  Locations({
    this.locations,
  });
  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
}

/// Information about a new BGP peer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NewBGPPeer {
  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  NewBGPPeer({
    this.addressFamily,
    this.amazonAddress,
    this.asn,
    this.authKey,
    this.customerAddress,
  });
  Map<String, dynamic> toJson() => _$NewBGPPeerToJson(this);
}

/// Information about a private virtual interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NewPrivateVirtualInterface {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  @_s.JsonKey(name: 'virtualInterfaceName')
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  /// The ID of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayId')
  final String directConnectGatewayId;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 9001. The default value is 1500.
  @_s.JsonKey(name: 'mtu')
  final int mtu;

  /// The tags associated with the private virtual interface.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The ID of the virtual private gateway.
  @_s.JsonKey(name: 'virtualGatewayId')
  final String virtualGatewayId;

  NewPrivateVirtualInterface({
    @_s.required this.asn,
    @_s.required this.virtualInterfaceName,
    @_s.required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.directConnectGatewayId,
    this.mtu,
    this.tags,
    this.virtualGatewayId,
  });
  Map<String, dynamic> toJson() => _$NewPrivateVirtualInterfaceToJson(this);
}

/// Information about a private virtual interface to be provisioned on a
/// connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NewPrivateVirtualInterfaceAllocation {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  @_s.JsonKey(name: 'virtualInterfaceName')
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 9001. The default value is 1500.
  @_s.JsonKey(name: 'mtu')
  final int mtu;

  /// The tags associated with the private virtual interface.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  NewPrivateVirtualInterfaceAllocation({
    @_s.required this.asn,
    @_s.required this.virtualInterfaceName,
    @_s.required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.mtu,
    this.tags,
  });
  Map<String, dynamic> toJson() =>
      _$NewPrivateVirtualInterfaceAllocationToJson(this);
}

/// Information about a public virtual interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NewPublicVirtualInterface {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  @_s.JsonKey(name: 'virtualInterfaceName')
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  /// The routes to be advertised to the AWS network in this Region. Applies to
  /// public virtual interfaces.
  @_s.JsonKey(name: 'routeFilterPrefixes')
  final List<RouteFilterPrefix> routeFilterPrefixes;

  /// The tags associated with the public virtual interface.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  NewPublicVirtualInterface({
    @_s.required this.asn,
    @_s.required this.virtualInterfaceName,
    @_s.required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.routeFilterPrefixes,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$NewPublicVirtualInterfaceToJson(this);
}

/// Information about a public virtual interface to be provisioned on a
/// connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NewPublicVirtualInterfaceAllocation {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  @_s.JsonKey(name: 'virtualInterfaceName')
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  /// The routes to be advertised to the AWS network in this Region. Applies to
  /// public virtual interfaces.
  @_s.JsonKey(name: 'routeFilterPrefixes')
  final List<RouteFilterPrefix> routeFilterPrefixes;

  /// The tags associated with the public virtual interface.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  NewPublicVirtualInterfaceAllocation({
    @_s.required this.asn,
    @_s.required this.virtualInterfaceName,
    @_s.required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.routeFilterPrefixes,
    this.tags,
  });
  Map<String, dynamic> toJson() =>
      _$NewPublicVirtualInterfaceAllocationToJson(this);
}

/// Information about a transit virtual interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NewTransitVirtualInterface {
  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  /// The ID of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayId')
  final String directConnectGatewayId;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 9001. The default value is 1500.
  @_s.JsonKey(name: 'mtu')
  final int mtu;

  /// The tags associated with the transitive virtual interface.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  @_s.JsonKey(name: 'virtualInterfaceName')
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  NewTransitVirtualInterface({
    this.addressFamily,
    this.amazonAddress,
    this.asn,
    this.authKey,
    this.customerAddress,
    this.directConnectGatewayId,
    this.mtu,
    this.tags,
    this.virtualInterfaceName,
    this.vlan,
  });
  Map<String, dynamic> toJson() => _$NewTransitVirtualInterfaceToJson(this);
}

/// Information about a transit virtual interface to be provisioned on a
/// connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NewTransitVirtualInterfaceAllocation {
  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 9001. The default value is 1500.
  @_s.JsonKey(name: 'mtu')
  final int mtu;

  /// The tags associated with the transitive virtual interface.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  @_s.JsonKey(name: 'virtualInterfaceName')
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  NewTransitVirtualInterfaceAllocation({
    this.addressFamily,
    this.amazonAddress,
    this.asn,
    this.authKey,
    this.customerAddress,
    this.mtu,
    this.tags,
    this.virtualInterfaceName,
    this.vlan,
  });
  Map<String, dynamic> toJson() =>
      _$NewTransitVirtualInterfaceAllocationToJson(this);
}

/// Information about a tag associated with an AWS Direct Connect resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceTag {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'resourceArn')
  final String resourceArn;

  /// The tags.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ResourceTag({
    this.resourceArn,
    this.tags,
  });
  factory ResourceTag.fromJson(Map<String, dynamic> json) =>
      _$ResourceTagFromJson(json);
}

/// Information about a route filter prefix that a customer can advertise
/// through Border Gateway Protocol (BGP) over a public virtual interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RouteFilterPrefix {
  /// The CIDR block for the advertised route. Separate multiple routes using
  /// commas. An IPv6 CIDR must use /64 or shorter.
  @_s.JsonKey(name: 'cidr')
  final String cidr;

  RouteFilterPrefix({
    this.cidr,
  });
  factory RouteFilterPrefix.fromJson(Map<String, dynamic> json) =>
      _$RouteFilterPrefixFromJson(json);

  Map<String, dynamic> toJson() => _$RouteFilterPrefixToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartBgpFailoverTestResponse {
  /// Information about the virtual interface failover test.
  @_s.JsonKey(name: 'virtualInterfaceTest')
  final VirtualInterfaceTestHistory virtualInterfaceTest;

  StartBgpFailoverTestResponse({
    this.virtualInterfaceTest,
  });
  factory StartBgpFailoverTestResponse.fromJson(Map<String, dynamic> json) =>
      _$StartBgpFailoverTestResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopBgpFailoverTestResponse {
  /// Information about the virtual interface failover test.
  @_s.JsonKey(name: 'virtualInterfaceTest')
  final VirtualInterfaceTestHistory virtualInterfaceTest;

  StopBgpFailoverTestResponse({
    this.virtualInterfaceTest,
  });
  factory StopBgpFailoverTestResponse.fromJson(Map<String, dynamic> json) =>
      _$StopBgpFailoverTestResponseFromJson(json);
}

/// Information about a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    @_s.required this.key,
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
class UpdateDirectConnectGatewayAssociationResult {
  @_s.JsonKey(name: 'directConnectGatewayAssociation')
  final DirectConnectGatewayAssociation directConnectGatewayAssociation;

  UpdateDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });
  factory UpdateDirectConnectGatewayAssociationResult.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDirectConnectGatewayAssociationResultFromJson(json);
}

/// Information about a virtual private gateway for a private virtual interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualGateway {
  /// The ID of the virtual private gateway.
  @_s.JsonKey(name: 'virtualGatewayId')
  final String virtualGatewayId;

  /// The state of the virtual private gateway. The following are the possible
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>pending</code>: Initial state after creating the virtual private
  /// gateway.
  /// </li>
  /// <li>
  /// <code>available</code>: Ready for use by a private virtual interface.
  /// </li>
  /// <li>
  /// <code>deleting</code>: Initial state after deleting the virtual private
  /// gateway.
  /// </li>
  /// <li>
  /// <code>deleted</code>: The virtual private gateway is deleted. The private
  /// virtual interface is unable to send traffic over this gateway.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'virtualGatewayState')
  final String virtualGatewayState;

  VirtualGateway({
    this.virtualGatewayId,
    this.virtualGatewayState,
  });
  factory VirtualGateway.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewayFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualGateways {
  /// The virtual private gateways.
  @_s.JsonKey(name: 'virtualGateways')
  final List<VirtualGateway> virtualGateways;

  VirtualGateways({
    this.virtualGateways,
  });
  factory VirtualGateways.fromJson(Map<String, dynamic> json) =>
      _$VirtualGatewaysFromJson(json);
}

/// Information about a virtual interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualInterface {
  /// The address family for the BGP peer.
  @_s.JsonKey(name: 'addressFamily')
  final AddressFamily addressFamily;

  /// The IP address assigned to the Amazon interface.
  @_s.JsonKey(name: 'amazonAddress')
  final String amazonAddress;

  /// The autonomous system number (ASN) for the Amazon side of the connection.
  @_s.JsonKey(name: 'amazonSideAsn')
  final int amazonSideAsn;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  @_s.JsonKey(name: 'asn')
  final int asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  @_s.JsonKey(name: 'authKey')
  final String authKey;

  /// The Direct Connect endpoint on which the virtual interface terminates.
  @_s.JsonKey(name: 'awsDeviceV2')
  final String awsDeviceV2;

  /// The BGP peers configured on this virtual interface.
  @_s.JsonKey(name: 'bgpPeers')
  final List<BGPPeer> bgpPeers;

  /// The ID of the connection.
  @_s.JsonKey(name: 'connectionId')
  final String connectionId;

  /// The IP address assigned to the customer interface.
  @_s.JsonKey(name: 'customerAddress')
  final String customerAddress;

  /// The customer router configuration.
  @_s.JsonKey(name: 'customerRouterConfig')
  final String customerRouterConfig;

  /// The ID of the Direct Connect gateway.
  @_s.JsonKey(name: 'directConnectGatewayId')
  final String directConnectGatewayId;

  /// Indicates whether jumbo frames (9001 MTU) are supported.
  @_s.JsonKey(name: 'jumboFrameCapable')
  final bool jumboFrameCapable;

  /// The location of the connection.
  @_s.JsonKey(name: 'location')
  final String location;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 9001. The default value is 1500.
  @_s.JsonKey(name: 'mtu')
  final int mtu;

  /// The ID of the AWS account that owns the virtual interface.
  @_s.JsonKey(name: 'ownerAccount')
  final String ownerAccount;

  /// The AWS Region where the virtual interface is located.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The routes to be advertised to the AWS network in this Region. Applies to
  /// public virtual interfaces.
  @_s.JsonKey(name: 'routeFilterPrefixes')
  final List<RouteFilterPrefix> routeFilterPrefixes;

  /// The tags associated with the virtual interface.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// The ID of the virtual private gateway. Applies only to private virtual
  /// interfaces.
  @_s.JsonKey(name: 'virtualGatewayId')
  final String virtualGatewayId;

  /// The ID of the virtual interface.
  @_s.JsonKey(name: 'virtualInterfaceId')
  final String virtualInterfaceId;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  @_s.JsonKey(name: 'virtualInterfaceName')
  final String virtualInterfaceName;

  /// The state of the virtual interface. The following are the possible values:
  ///
  /// <ul>
  /// <li>
  /// <code>confirming</code>: The creation of the virtual interface is pending
  /// confirmation from the virtual interface owner. If the owner of the virtual
  /// interface is different from the owner of the connection on which it is
  /// provisioned, then the virtual interface will remain in this state until it
  /// is confirmed by the virtual interface owner.
  /// </li>
  /// <li>
  /// <code>verifying</code>: This state only applies to public virtual
  /// interfaces. Each public virtual interface needs validation before the
  /// virtual interface can be created.
  /// </li>
  /// <li>
  /// <code>pending</code>: A virtual interface is in this state from the time
  /// that it is created until the virtual interface is ready to forward traffic.
  /// </li>
  /// <li>
  /// <code>available</code>: A virtual interface that is able to forward traffic.
  /// </li>
  /// <li>
  /// <code>down</code>: A virtual interface that is BGP down.
  /// </li>
  /// <li>
  /// <code>deleting</code>: A virtual interface is in this state immediately
  /// after calling <a>DeleteVirtualInterface</a> until it can no longer forward
  /// traffic.
  /// </li>
  /// <li>
  /// <code>deleted</code>: A virtual interface that cannot forward traffic.
  /// </li>
  /// <li>
  /// <code>rejected</code>: The virtual interface owner has declined creation of
  /// the virtual interface. If a virtual interface in the <code>Confirming</code>
  /// state is deleted by the virtual interface owner, the virtual interface
  /// enters the <code>Rejected</code> state.
  /// </li>
  /// <li>
  /// <code>unknown</code>: The state of the virtual interface is not available.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'virtualInterfaceState')
  final VirtualInterfaceState virtualInterfaceState;

  /// The type of virtual interface. The possible values are <code>private</code>
  /// and <code>public</code>.
  @_s.JsonKey(name: 'virtualInterfaceType')
  final String virtualInterfaceType;

  /// The ID of the VLAN.
  @_s.JsonKey(name: 'vlan')
  final int vlan;

  VirtualInterface({
    this.addressFamily,
    this.amazonAddress,
    this.amazonSideAsn,
    this.asn,
    this.authKey,
    this.awsDeviceV2,
    this.bgpPeers,
    this.connectionId,
    this.customerAddress,
    this.customerRouterConfig,
    this.directConnectGatewayId,
    this.jumboFrameCapable,
    this.location,
    this.mtu,
    this.ownerAccount,
    this.region,
    this.routeFilterPrefixes,
    this.tags,
    this.virtualGatewayId,
    this.virtualInterfaceId,
    this.virtualInterfaceName,
    this.virtualInterfaceState,
    this.virtualInterfaceType,
    this.vlan,
  });
  factory VirtualInterface.fromJson(Map<String, dynamic> json) =>
      _$VirtualInterfaceFromJson(json);
}

enum VirtualInterfaceState {
  @_s.JsonValue('confirming')
  confirming,
  @_s.JsonValue('verifying')
  verifying,
  @_s.JsonValue('pending')
  pending,
  @_s.JsonValue('available')
  available,
  @_s.JsonValue('down')
  down,
  @_s.JsonValue('deleting')
  deleting,
  @_s.JsonValue('deleted')
  deleted,
  @_s.JsonValue('rejected')
  rejected,
  @_s.JsonValue('unknown')
  unknown,
}

/// Information about the virtual interface failover test.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualInterfaceTestHistory {
  /// The BGP peers that were put in the DOWN state as part of the virtual
  /// interface failover test.
  @_s.JsonKey(name: 'bgpPeers')
  final List<String> bgpPeers;

  /// The time that the virtual interface moves out of the DOWN state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The owner ID of the tested virtual interface.
  @_s.JsonKey(name: 'ownerAccount')
  final String ownerAccount;

  /// The time that the virtual interface moves to the DOWN state.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The status of the virtual interface failover test.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The time that the virtual interface failover test ran in minutes.
  @_s.JsonKey(name: 'testDurationInMinutes')
  final int testDurationInMinutes;

  /// The ID of the virtual interface failover test.
  @_s.JsonKey(name: 'testId')
  final String testId;

  /// The ID of the tested virtual interface.
  @_s.JsonKey(name: 'virtualInterfaceId')
  final String virtualInterfaceId;

  VirtualInterfaceTestHistory({
    this.bgpPeers,
    this.endTime,
    this.ownerAccount,
    this.startTime,
    this.status,
    this.testDurationInMinutes,
    this.testId,
    this.virtualInterfaceId,
  });
  factory VirtualInterfaceTestHistory.fromJson(Map<String, dynamic> json) =>
      _$VirtualInterfaceTestHistoryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VirtualInterfaces {
  /// The virtual interfaces
  @_s.JsonKey(name: 'virtualInterfaces')
  final List<VirtualInterface> virtualInterfaces;

  VirtualInterfaces({
    this.virtualInterfaces,
  });
  factory VirtualInterfaces.fromJson(Map<String, dynamic> json) =>
      _$VirtualInterfacesFromJson(json);
}

class DirectConnectClientException extends _s.GenericAwsException {
  DirectConnectClientException({String type, String message})
      : super(
            type: type, code: 'DirectConnectClientException', message: message);
}

class DirectConnectServerException extends _s.GenericAwsException {
  DirectConnectServerException({String type, String message})
      : super(
            type: type, code: 'DirectConnectServerException', message: message);
}

class DuplicateTagKeysException extends _s.GenericAwsException {
  DuplicateTagKeysException({String type, String message})
      : super(type: type, code: 'DuplicateTagKeysException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DirectConnectClientException': (type, message) =>
      DirectConnectClientException(type: type, message: message),
  'DirectConnectServerException': (type, message) =>
      DirectConnectServerException(type: type, message: message),
  'DuplicateTagKeysException': (type, message) =>
      DuplicateTagKeysException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
