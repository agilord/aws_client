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

/// Direct Connect links your internal network to an Direct Connect location
/// over a standard Ethernet fiber-optic cable. One end of the cable is
/// connected to your router, the other to an Direct Connect router. With this
/// connection in place, you can create virtual interfaces directly to the
/// Amazon Web Services Cloud (for example, to Amazon EC2 and Amazon S3) and to
/// Amazon VPC, bypassing Internet service providers in your network path. A
/// connection provides access to all Amazon Web Services Regions except the
/// China (Beijing) and (China) Ningxia Regions. Amazon Web Services resources
/// in the China Regions can only be accessed through locations associated with
/// those Regions.
class DirectConnect {
  final _s.JsonProtocol _protocol;
  DirectConnect({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'directconnect',
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

  /// Accepts a proposal request to attach a virtual private gateway or transit
  /// gateway to a Direct Connect gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [associatedGatewayOwnerAccount] :
  /// The ID of the Amazon Web Services account that owns the virtual private
  /// gateway or transit gateway.
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
  /// Prefixes</a> in the <i>Direct Connect User Guide</i>.
  Future<AcceptDirectConnectGatewayAssociationProposalResult>
      acceptDirectConnectGatewayAssociationProposal({
    required String associatedGatewayOwnerAccount,
    required String directConnectGatewayId,
    required String proposalId,
    List<RouteFilterPrefix>? overrideAllowedPrefixesToDirectConnectGateway,
  }) async {
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
  /// Intended for use by Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [bandwidth] :
  /// The bandwidth of the connection. The possible values are 50Mbps, 100Mbps,
  /// 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, and 10Gbps. Note
  /// that only those Direct Connect Partners who have met specific requirements
  /// are allowed to create a 1Gbps, 2Gbps, 5Gbps or 10Gbps hosted connection.
  ///
  /// Parameter [connectionName] :
  /// The name of the provisioned connection.
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect on which the connection will be provisioned.
  ///
  /// Parameter [ownerAccount] :
  /// The ID of the Amazon Web Services account of the customer for whom the
  /// connection will be provisioned.
  ///
  /// Parameter [vlan] :
  /// The dedicated VLAN provisioned to the connection.
  @Deprecated('Deprecated')
  Future<Connection> allocateConnectionOnInterconnect({
    required String bandwidth,
    required String connectionName,
    required String interconnectId,
    required String ownerAccount,
    required int vlan,
  }) async {
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
  /// interconnects. Amazon Web Services polices the hosted connection for the
  /// specified capacity and the Direct Connect Partner must also police the
  /// hosted connection for the specified capacity.
  /// <note>
  /// Intended for use by Direct Connect Partners only.
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
  /// that only those Direct Connect Partners who have met specific requirements
  /// are allowed to create a 1Gbps, 2Gbps, 5Gbps or 10Gbps hosted connection.
  ///
  /// Parameter [connectionId] :
  /// The ID of the interconnect or LAG.
  ///
  /// Parameter [connectionName] :
  /// The name of the hosted connection.
  ///
  /// Parameter [ownerAccount] :
  /// The ID of the Amazon Web Services account ID of the customer for the
  /// connection.
  ///
  /// Parameter [vlan] :
  /// The dedicated VLAN provisioned to the hosted connection.
  ///
  /// Parameter [tags] :
  /// The tags associated with the connection.
  Future<Connection> allocateHostedConnection({
    required String bandwidth,
    required String connectionId,
    required String connectionName,
    required String ownerAccount,
    required int vlan,
    List<Tag>? tags,
  }) async {
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

  /// Provisions a private virtual interface to be owned by the specified Amazon
  /// Web Services account.
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
  /// The ID of the Amazon Web Services account that owns the virtual private
  /// interface.
  Future<VirtualInterface> allocatePrivateVirtualInterface({
    required String connectionId,
    required NewPrivateVirtualInterfaceAllocation
        newPrivateVirtualInterfaceAllocation,
    required String ownerAccount,
  }) async {
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

  /// Provisions a public virtual interface to be owned by the specified Amazon
  /// Web Services account.
  ///
  /// The owner of a connection calls this function to provision a public
  /// virtual interface to be owned by the specified Amazon Web Services
  /// account.
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
  /// The ID of the Amazon Web Services account that owns the public virtual
  /// interface.
  Future<VirtualInterface> allocatePublicVirtualInterface({
    required String connectionId,
    required NewPublicVirtualInterfaceAllocation
        newPublicVirtualInterfaceAllocation,
    required String ownerAccount,
  }) async {
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

  /// Provisions a transit virtual interface to be owned by the specified Amazon
  /// Web Services account. Use this type of interface to connect a transit
  /// gateway to your Direct Connect gateway.
  ///
  /// The owner of a connection provisions a transit virtual interface to be
  /// owned by the specified Amazon Web Services account.
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
  /// The ID of the Amazon Web Services account that owns the transit virtual
  /// interface.
  Future<AllocateTransitVirtualInterfaceResult>
      allocateTransitVirtualInterface({
    required String connectionId,
    required NewTransitVirtualInterfaceAllocation
        newTransitVirtualInterfaceAllocation,
    required String ownerAccount,
  }) async {
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
  /// (connectivity to Amazon Web Services is interrupted). The connection must
  /// be hosted on the same Direct Connect endpoint as the LAG, and its
  /// bandwidth must match the bandwidth for the LAG. You can re-associate a
  /// connection that's currently associated with a different LAG; however, if
  /// removing the connection would cause the original LAG to fall below its
  /// setting for minimum number of operational connections, the request fails.
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
    required String connectionId,
    required String lagId,
  }) async {
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
  /// hosted connection's connectivity to Amazon Web Services as it is being
  /// migrated.
  /// <note>
  /// Intended for use by Direct Connect Partners only.
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
    required String connectionId,
    required String parentConnectionId,
  }) async {
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

  /// Associates a MAC Security (MACsec) Connection Key Name (CKN)/ Connectivity
  /// Association Key (CAK) pair with an Direct Connect dedicated connection.
  ///
  /// You must supply either the <code>secretARN,</code> or the CKN/CAK
  /// (<code>ckn</code> and <code>cak</code>) pair in the request.
  ///
  /// For information about MAC Security (MACsec) key considerations, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-mac-sec-getting-started.html#mac-sec-key-consideration">MACsec
  /// pre-shared CKN/CAK key considerations </a> in the <i>Direct Connect User
  /// Guide</i>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the dedicated connection (dxcon-xxxx), or the ID of the LAG
  /// (dxlag-xxxx).
  ///
  /// You can use <a>DescribeConnections</a> or <a>DescribeLags</a> to retrieve
  /// connection ID.
  ///
  /// Parameter [cak] :
  /// The MAC Security (MACsec) CAK to associate with the dedicated connection.
  ///
  /// You can create the CKN/CAK pair using an industry standard tool.
  ///
  /// The valid values are 64 hexadecimal characters (0-9, A-E).
  ///
  /// If you use this request parameter, you must use the <code>ckn</code>
  /// request parameter and not use the <code>secretARN</code> request
  /// parameter.
  ///
  /// Parameter [ckn] :
  /// The MAC Security (MACsec) CKN to associate with the dedicated connection.
  ///
  /// You can create the CKN/CAK pair using an industry standard tool.
  ///
  /// The valid values are 64 hexadecimal characters (0-9, A-E).
  ///
  /// If you use this request parameter, you must use the <code>cak</code>
  /// request parameter and not use the <code>secretARN</code> request
  /// parameter.
  ///
  /// Parameter [secretARN] :
  /// The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key to
  /// associate with the dedicated connection.
  ///
  /// You can use <a>DescribeConnections</a> or <a>DescribeLags</a> to retrieve
  /// the MAC Security (MACsec) secret key.
  ///
  /// If you use this request parameter, you do not use the <code>ckn</code> and
  /// <code>cak</code> request parameters.
  Future<AssociateMacSecKeyResponse> associateMacSecKey({
    required String connectionId,
    String? cak,
    String? ckn,
    String? secretARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.AssociateMacSecKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        if (cak != null) 'cak': cak,
        if (ckn != null) 'ckn': ckn,
        if (secretARN != null) 'secretARN': secretARN,
      },
    );

    return AssociateMacSecKeyResponse.fromJson(jsonResponse.body);
  }

  /// Associates a virtual interface with a specified link aggregation group
  /// (LAG) or connection. Connectivity to Amazon Web Services is temporarily
  /// interrupted as the virtual interface is being migrated. If the target
  /// connection or LAG has an associated virtual interface with a conflicting
  /// VLAN number or a conflicting IP address, the operation fails.
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
    required String connectionId,
    required String virtualInterfaceId,
  }) async {
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
    required String connectionId,
  }) async {
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

  /// The confirmation of the terms of agreement when creating the
  /// connection/link aggregation group (LAG).
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [agreementName] :
  /// The name of the customer agreement.
  Future<ConfirmCustomerAgreementResponse> confirmCustomerAgreement({
    String? agreementName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.ConfirmCustomerAgreement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (agreementName != null) 'agreementName': agreementName,
      },
    );

    return ConfirmCustomerAgreementResponse.fromJson(jsonResponse.body);
  }

  /// Accepts ownership of a private virtual interface created by another Amazon
  /// Web Services account.
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
    required String virtualInterfaceId,
    String? directConnectGatewayId,
    String? virtualGatewayId,
  }) async {
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

  /// Accepts ownership of a public virtual interface created by another Amazon
  /// Web Services account.
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
    required String virtualInterfaceId,
  }) async {
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

  /// Accepts ownership of a transit virtual interface created by another Amazon
  /// Web Services account.
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
    required String directConnectGatewayId,
    required String virtualInterfaceId,
  }) async {
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
  /// (IPv4/IPv6) in order to access Amazon Web Services resources that also use
  /// that address family.
  ///
  /// If logical redundancy is not supported by the connection, interconnect, or
  /// LAG, the BGP peer cannot be in the same address family as an existing BGP
  /// peer on the virtual interface.
  ///
  /// When creating a IPv6 BGP peer, omit the Amazon address and customer
  /// address. IPv6 addresses are automatically assigned from the Amazon pool of
  /// IPv6 addresses; you cannot specify custom IPv6 addresses.
  /// <important>
  /// If you let Amazon Web Services auto-assign IPv4 addresses, a /30 CIDR will
  /// be allocated from 169.254.0.0/16. Amazon Web Services does not recommend
  /// this option if you intend to use the customer router peer IP address as
  /// the source and destination for traffic. Instead you should use RFC 1918 or
  /// other addressing, and specify the address yourself. For more information
  /// about RFC 1918 see <a
  /// href="https://datatracker.ietf.org/doc/html/rfc1918"> Address Allocation
  /// for Private Internets</a>.
  /// </important>
  /// For a public virtual interface, the Autonomous System Number (ASN) must be
  /// private or already on the allow list for the virtual interface.
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
    NewBGPPeer? newBGPPeer,
    String? virtualInterfaceId,
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

  /// Creates a connection between a customer network and a specific Direct
  /// Connect location.
  ///
  /// A connection links your internal network to an Direct Connect location
  /// over a standard Ethernet fiber-optic cable. One end of the cable is
  /// connected to your router, the other to an Direct Connect router.
  ///
  /// To find the locations for your Region, use <a>DescribeLocations</a>.
  ///
  /// You can automatically add the new connection to a link aggregation group
  /// (LAG) by specifying a LAG ID in the request. This ensures that the new
  /// connection is allocated on the same Direct Connect endpoint that hosts the
  /// specified LAG. If there are no available ports on the endpoint, the
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
  /// Parameter [requestMACSec] :
  /// Indicates whether you want the connection to support MAC Security
  /// (MACsec).
  ///
  /// MAC Security (MACsec) is only available on dedicated connections. For
  /// information about MAC Security (MACsec) prerequisties, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-mac-sec-getting-started.html#mac-sec-prerequisites">MACsec
  /// prerequisties</a> in the <i>Direct Connect User Guide</i>.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the lag.
  Future<Connection> createConnection({
    required String bandwidth,
    required String connectionName,
    required String location,
    String? lagId,
    String? providerName,
    bool? requestMACSec,
    List<Tag>? tags,
  }) async {
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
        if (requestMACSec != null) 'requestMACSec': requestMACSec,
        if (tags != null) 'tags': tags,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Creates a Direct Connect gateway, which is an intermediate object that
  /// enables you to connect a set of virtual interfaces and virtual private
  /// gateways. A Direct Connect gateway is global and visible in any Amazon Web
  /// Services Region after it is created. The virtual interfaces and virtual
  /// private gateways that are connected through a Direct Connect gateway can
  /// be in different Amazon Web Services Regions. This enables you to connect
  /// to a VPC in any Region, regardless of the Region in which the virtual
  /// interfaces are located, and pass traffic between them.
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
    required String directConnectGatewayName,
    int? amazonSideAsn,
  }) async {
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
  /// Prefixes</a> in the <i>Direct Connect User Guide</i>.
  ///
  /// Parameter [gatewayId] :
  /// The ID of the virtual private gateway or transit gateway.
  ///
  /// Parameter [virtualGatewayId] :
  /// The ID of the virtual private gateway.
  Future<CreateDirectConnectGatewayAssociationResult>
      createDirectConnectGatewayAssociation({
    required String directConnectGatewayId,
    List<RouteFilterPrefix>? addAllowedPrefixesToDirectConnectGateway,
    String? gatewayId,
    String? virtualGatewayId,
  }) async {
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
  /// transit gateway that is owned by any Amazon Web Services account.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway.
  ///
  /// Parameter [directConnectGatewayOwnerAccount] :
  /// The ID of the Amazon Web Services account that owns the Direct Connect
  /// gateway.
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
    required String directConnectGatewayId,
    required String directConnectGatewayOwnerAccount,
    required String gatewayId,
    List<RouteFilterPrefix>? addAllowedPrefixesToDirectConnectGateway,
    List<RouteFilterPrefix>? removeAllowedPrefixesToDirectConnectGateway,
  }) async {
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

  /// Creates an interconnect between an Direct Connect Partner's network and a
  /// specific Direct Connect location.
  ///
  /// An interconnect is a connection that is capable of hosting other
  /// connections. The Direct Connect Partner can use an interconnect to provide
  /// Direct Connect hosted connections to customers through their own network
  /// services. Like a standard connection, an interconnect links the partner's
  /// network to an Direct Connect location over a standard Ethernet fiber-optic
  /// cable. One end is connected to the partner's router, the other to an
  /// Direct Connect router.
  ///
  /// You can automatically add the new interconnect to a link aggregation group
  /// (LAG) by specifying a LAG ID in the request. This ensures that the new
  /// interconnect is allocated on the same Direct Connect endpoint that hosts
  /// the specified LAG. If there are no available ports on the endpoint, the
  /// request fails and no interconnect is created.
  ///
  /// For each end customer, the Direct Connect Partner provisions a connection
  /// on their interconnect by calling <a>AllocateHostedConnection</a>. The end
  /// customer can then connect to Amazon Web Services resources by creating a
  /// virtual interface on their connection, using the VLAN assigned to them by
  /// the Direct Connect Partner.
  /// <note>
  /// Intended for use by Direct Connect Partners only.
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
    required String bandwidth,
    required String interconnectName,
    required String location,
    String? lagId,
    String? providerName,
    List<Tag>? tags,
  }) async {
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
  /// specific Direct Connect location. A LAG is a logical interface that uses
  /// the Link Aggregation Control Protocol (LACP) to aggregate multiple
  /// interfaces, enabling you to treat them as a single interface.
  ///
  /// All connections in a LAG must use the same bandwidth (either 1Gbps or
  /// 10Gbps) and must terminate at the same Direct Connect endpoint.
  ///
  /// You can have up to 10 dedicated connections per LAG. Regardless of this
  /// limit, if you request more connections for the LAG than Direct Connect can
  /// allocate on a single endpoint, no LAG is created.
  ///
  /// You can specify an existing physical dedicated connection or interconnect
  /// to include in the LAG (which counts towards the total number of
  /// connections). Doing so interrupts the current physical dedicated
  /// connection, and re-establishes them as a member of the LAG. The LAG will
  /// be created on the same Direct Connect endpoint to which the dedicated
  /// connection terminates. Any virtual interfaces associated with the
  /// dedicated connection are automatically disassociated and re-associated
  /// with the LAG. The connection ID does not change.
  ///
  /// If the Amazon Web Services account used to create a LAG is a registered
  /// Direct Connect Partner, the LAG is automatically enabled to host
  /// sub-connections. For a LAG owned by a partner, any associated virtual
  /// interfaces cannot be directly configured.
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
  /// bundled by the LAG. You can have a maximum of four connections when the
  /// port speed is 1G or 10G, or two when the port speed is 100G.
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
  /// Parameter [requestMACSec] :
  /// Indicates whether the connection will support MAC Security (MACsec).
  /// <note>
  /// All connections in the LAG must be capable of supporting MAC Security
  /// (MACsec). For information about MAC Security (MACsec) prerequisties, see
  /// <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/direct-connect-mac-sec-getting-started.html#mac-sec-prerequisites">MACsec
  /// prerequisties</a> in the <i>Direct Connect User Guide</i>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags to associate with the LAG.
  Future<Lag> createLag({
    required String connectionsBandwidth,
    required String lagName,
    required String location,
    required int numberOfConnections,
    List<Tag>? childConnectionTags,
    String? connectionId,
    String? providerName,
    bool? requestMACSec,
    List<Tag>? tags,
  }) async {
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
        if (requestMACSec != null) 'requestMACSec': requestMACSec,
        if (tags != null) 'tags': tags,
      },
    );

    return Lag.fromJson(jsonResponse.body);
  }

  /// Creates a private virtual interface. A virtual interface is the VLAN that
  /// transports Direct Connect traffic. A private virtual interface can be
  /// connected to either a Direct Connect gateway or a Virtual Private Gateway
  /// (VGW). Connecting the private virtual interface to a Direct Connect
  /// gateway enables the possibility for connecting to multiple VPCs, including
  /// VPCs in different Amazon Web Services Regions. Connecting the private
  /// virtual interface to a VGW only provides access to a single VPC within the
  /// same Region.
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
    required String connectionId,
    required NewPrivateVirtualInterface newPrivateVirtualInterface,
  }) async {
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
  /// transports Direct Connect traffic. A public virtual interface supports
  /// sending traffic to public services of Amazon Web Services such as Amazon
  /// S3.
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
    required String connectionId,
    required NewPublicVirtualInterface newPublicVirtualInterface,
  }) async {
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
  /// A jumbo MTU value must be either 1500 or 8500. No other values will be
  /// accepted. Setting the MTU of a virtual interface to 8500 (jumbo frames)
  /// can cause an update to the underlying physical connection if it wasn't
  /// updated to support jumbo frames. Updating the connection disrupts network
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
    required String connectionId,
    required NewTransitVirtualInterface newTransitVirtualInterface,
  }) async {
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
    int? asn,
    String? bgpPeerId,
    String? customerAddress,
    String? virtualInterfaceId,
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
  /// Deleting a connection only stops the Direct Connect port hour and data
  /// transfer charges. If you are partnering with any third parties to connect
  /// with the Direct Connect location, you must cancel your service with them
  /// separately.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  Future<Connection> deleteConnection({
    required String connectionId,
  }) async {
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
    required String directConnectGatewayId,
  }) async {
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
    String? associationId,
    String? directConnectGatewayId,
    String? virtualGatewayId,
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
    required String proposalId,
  }) async {
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
  /// Intended for use by Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect.
  Future<DeleteInterconnectResponse> deleteInterconnect({
    required String interconnectId,
  }) async {
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
    required String lagId,
  }) async {
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
    required String virtualInterfaceId,
  }) async {
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
  /// establishing your cross connect to Amazon Web Services at the colocation
  /// facility. For more information, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting
  /// Cross Connects at Direct Connect Locations</a> in the <i>Direct Connect
  /// User Guide</i>.
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
    required String connectionId,
    LoaContentType? loaContentType,
    String? providerName,
  }) async {
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
    String? connectionId,
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
  /// Intended for use by Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect.
  @Deprecated('Deprecated')
  Future<Connections> describeConnectionsOnInterconnect({
    required String interconnectId,
  }) async {
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

  /// Get and view a list of customer agreements, along with their signed status
  /// and whether the customer is an NNIPartner, NNIPartnerV2, or a nonPartner.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  Future<DescribeCustomerMetadataResponse> describeCustomerMetadata() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeCustomerMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeCustomerMetadataResponse.fromJson(jsonResponse.body);
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
    String? associatedGatewayId,
    String? directConnectGatewayId,
    int? maxResults,
    String? nextToken,
    String? proposalId,
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
  /// private gateways and transit gateways. You must specify one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// A Direct Connect gateway
  ///
  /// The response contains all virtual private gateways and transit gateways
  /// associated with the Direct Connect gateway.
  /// </li>
  /// <li>
  /// A virtual private gateway
  ///
  /// The response contains the Direct Connect gateway.
  /// </li>
  /// <li>
  /// A transit gateway
  ///
  /// The response contains the Direct Connect gateway.
  /// </li>
  /// <li>
  /// A Direct Connect gateway and a virtual private gateway
  ///
  /// The response contains the association between the Direct Connect gateway
  /// and virtual private gateway.
  /// </li>
  /// <li>
  /// A Direct Connect gateway and a transit gateway
  ///
  /// The response contains the association between the Direct Connect gateway
  /// and transit gateway.
  /// </li>
  /// </ul>
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
  /// The ID of the virtual private gateway or transit gateway.
  Future<DescribeDirectConnectGatewayAssociationsResult>
      describeDirectConnectGatewayAssociations({
    String? associatedGatewayId,
    String? associationId,
    String? directConnectGatewayId,
    int? maxResults,
    String? nextToken,
    String? virtualGatewayId,
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
    String? directConnectGatewayId,
    int? maxResults,
    String? nextToken,
    String? virtualInterfaceId,
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
    String? directConnectGatewayId,
    int? maxResults,
    String? nextToken,
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
  /// Intended for use by Direct Connect Partners only.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the interconnect or LAG.
  Future<Connections> describeHostedConnections({
    required String connectionId,
  }) async {
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
  /// a document that is used when establishing your cross connect to Amazon Web
  /// Services at the colocation facility. For more information, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting
  /// Cross Connects at Direct Connect Locations</a> in the <i>Direct Connect
  /// User Guide</i>.
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
    required String interconnectId,
    LoaContentType? loaContentType,
    String? providerName,
  }) async {
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

  /// Lists the interconnects owned by the Amazon Web Services account or only
  /// the specified interconnect.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [interconnectId] :
  /// The ID of the interconnect.
  Future<Interconnects> describeInterconnects({
    String? interconnectId,
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
    String? lagId,
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
  /// a document that is used when establishing your cross connect to Amazon Web
  /// Services at the colocation facility. For more information, see <a
  /// href="https://docs.aws.amazon.com/directconnect/latest/UserGuide/Colocation.html">Requesting
  /// Cross Connects at Direct Connect Locations</a> in the <i>Direct Connect
  /// User Guide</i>.
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
    required String connectionId,
    LoaContentType? loaContentType,
    String? providerName,
  }) async {
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

  /// Lists the Direct Connect locations in the current Amazon Web Services
  /// Region. These are the locations that can be selected when calling
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

  /// Details about the router.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual interface.
  ///
  /// Parameter [routerTypeIdentifier] :
  /// Identifies the router by a combination of vendor, platform, and software
  /// version. For example,
  /// <code>CiscoSystemsInc-2900SeriesRouters-IOS124</code>.
  Future<DescribeRouterConfigurationResponse> describeRouterConfiguration({
    required String virtualInterfaceId,
    String? routerTypeIdentifier,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DescribeRouterConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'virtualInterfaceId': virtualInterfaceId,
        if (routerTypeIdentifier != null)
          'routerTypeIdentifier': routerTypeIdentifier,
      },
    );

    return DescribeRouterConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Describes the tags associated with the specified Direct Connect resources.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARNs) of the resources.
  Future<DescribeTagsResponse> describeTags({
    required List<String> resourceArns,
  }) async {
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

  /// Lists the virtual private gateways owned by the Amazon Web Services
  /// account.
  ///
  /// You can create one or more Direct Connect private virtual interfaces
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

  /// Displays all virtual interfaces for an Amazon Web Services account.
  /// Virtual interfaces deleted fewer than 15 minutes before you make the
  /// request are also returned. If you specify a connection ID, only the
  /// virtual interfaces associated with the connection are returned. If you
  /// specify a virtual interface ID, then only a single virtual interface is
  /// returned.
  ///
  /// A virtual interface (VLAN) transmits the traffic between the Direct
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
    String? connectionId,
    String? virtualInterfaceId,
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
  /// disassociated connection owned by an Direct Connect Partner is
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
    required String connectionId,
    required String lagId,
  }) async {
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

  /// Removes the association between a MAC Security (MACsec) security key and
  /// an Direct Connect dedicated connection.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the dedicated connection (dxcon-xxxx), or the ID of the LAG
  /// (dxlag-xxxx).
  ///
  /// You can use <a>DescribeConnections</a> or <a>DescribeLags</a> to retrieve
  /// connection ID.
  ///
  /// Parameter [secretARN] :
  /// The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.
  ///
  /// You can use <a>DescribeConnections</a> to retrieve the ARN of the MAC
  /// Security (MACsec) secret key.
  Future<DisassociateMacSecKeyResponse> disassociateMacSecKey({
    required String connectionId,
    required String secretARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.DisassociateMacSecKey'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        'secretARN': secretARN,
      },
    );

    return DisassociateMacSecKeyResponse.fromJson(jsonResponse.body);
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
    List<String>? bgpPeers,
    int? maxResults,
    String? nextToken,
    String? status,
    String? testId,
    String? virtualInterfaceId,
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
  /// Maximum value: 4,320 minutes (72 hours).
  ///
  /// Default: 180 minutes (3 hours).
  Future<StartBgpFailoverTestResponse> startBgpFailoverTest({
    required String virtualInterfaceId,
    List<String>? bgpPeers,
    int? testDurationInMinutes,
  }) async {
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
    required String virtualInterfaceId,
  }) async {
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

  /// Adds the specified tags to the specified Direct Connect resource. Each
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
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.TagResource'
    };
    await _protocol.send(
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
  }

  /// Removes one or more tags from the specified Direct Connect resource.
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.UntagResource'
    };
    await _protocol.send(
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
  }

  /// Updates the Direct Connect dedicated connection configuration.
  ///
  /// You can update the following parameters for a connection:
  ///
  /// <ul>
  /// <li>
  /// The connection name
  /// </li>
  /// <li>
  /// The connection's MAC Security (MACsec) encryption mode.
  /// </li>
  /// </ul>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the dedicated connection.
  ///
  /// You can use <a>DescribeConnections</a> to retrieve the connection ID.
  ///
  /// Parameter [connectionName] :
  /// The name of the connection.
  ///
  /// Parameter [encryptionMode] :
  /// The connection MAC Security (MACsec) encryption mode.
  ///
  /// The valid values are <code>no_encrypt</code>, <code>should_encrypt</code>,
  /// and <code>must_encrypt</code>.
  Future<Connection> updateConnection({
    required String connectionId,
    String? connectionName,
    String? encryptionMode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.UpdateConnection'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectionId': connectionId,
        if (connectionName != null) 'connectionName': connectionName,
        if (encryptionMode != null) 'encryptionMode': encryptionMode,
      },
    );

    return Connection.fromJson(jsonResponse.body);
  }

  /// Updates the name of a current Direct Connect gateway.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [directConnectGatewayId] :
  /// The ID of the Direct Connect gateway to update.
  ///
  /// Parameter [newDirectConnectGatewayName] :
  /// The new name for the Direct Connect gateway.
  Future<UpdateDirectConnectGatewayResponse> updateDirectConnectGateway({
    required String directConnectGatewayId,
    required String newDirectConnectGatewayName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'OvertureService.UpdateDirectConnectGateway'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'directConnectGatewayId': directConnectGatewayId,
        'newDirectConnectGatewayName': newDirectConnectGatewayName,
      },
    );

    return UpdateDirectConnectGatewayResponse.fromJson(jsonResponse.body);
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
    List<RouteFilterPrefix>? addAllowedPrefixesToDirectConnectGateway,
    String? associationId,
    List<RouteFilterPrefix>? removeAllowedPrefixesToDirectConnectGateway,
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
  /// You can update the following LAG attributes:
  ///
  /// <ul>
  /// <li>
  /// The name of the LAG.
  /// </li>
  /// <li>
  /// The value for the minimum number of connections that must be operational
  /// for the LAG itself to be operational.
  /// </li>
  /// <li>
  /// The LAG's MACsec encryption mode.
  ///
  /// Amazon Web Services assigns this value to each connection which is part of
  /// the LAG.
  /// </li>
  /// <li>
  /// The tags
  /// </li>
  /// </ul> <note>
  /// If you adjust the threshold value for the minimum number of operational
  /// connections, ensure that the new value does not cause the LAG to fall
  /// below the threshold and become non-operational.
  /// </note>
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [lagId] :
  /// The ID of the LAG.
  ///
  /// Parameter [encryptionMode] :
  /// The LAG MAC Security (MACsec) encryption mode.
  ///
  /// Amazon Web Services applies the value to all connections which are part of
  /// the LAG.
  ///
  /// Parameter [lagName] :
  /// The name of the LAG.
  ///
  /// Parameter [minimumLinks] :
  /// The minimum number of physical connections that must be operational for
  /// the LAG itself to be operational.
  Future<Lag> updateLag({
    required String lagId,
    String? encryptionMode,
    String? lagName,
    int? minimumLinks,
  }) async {
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
        if (encryptionMode != null) 'encryptionMode': encryptionMode,
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
  /// call <a>DescribeConnections</a>. To check whether your virtual interface
  /// supports jumbo frames, call <a>DescribeVirtualInterfaces</a>.
  ///
  /// May throw [DirectConnectServerException].
  /// May throw [DirectConnectClientException].
  ///
  /// Parameter [virtualInterfaceId] :
  /// The ID of the virtual private interface.
  ///
  /// Parameter [enableSiteLink] :
  /// Indicates whether to enable or disable SiteLink.
  ///
  /// Parameter [mtu] :
  /// The maximum transmission unit (MTU), in bytes. The supported values are
  /// 1500 and 9001. The default value is 1500.
  ///
  /// Parameter [virtualInterfaceName] :
  /// The name of the virtual private interface.
  Future<VirtualInterface> updateVirtualInterfaceAttributes({
    required String virtualInterfaceId,
    bool? enableSiteLink,
    int? mtu,
    String? virtualInterfaceName,
  }) async {
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
        if (enableSiteLink != null) 'enableSiteLink': enableSiteLink,
        if (mtu != null) 'mtu': mtu,
        if (virtualInterfaceName != null)
          'virtualInterfaceName': virtualInterfaceName,
      },
    );

    return VirtualInterface.fromJson(jsonResponse.body);
  }
}

class AcceptDirectConnectGatewayAssociationProposalResult {
  final DirectConnectGatewayAssociation? directConnectGatewayAssociation;

  AcceptDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociation,
  });

  factory AcceptDirectConnectGatewayAssociationProposalResult.fromJson(
      Map<String, dynamic> json) {
    return AcceptDirectConnectGatewayAssociationProposalResult(
      directConnectGatewayAssociation:
          json['directConnectGatewayAssociation'] != null
              ? DirectConnectGatewayAssociation.fromJson(
                  json['directConnectGatewayAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociation =
        this.directConnectGatewayAssociation;
    return {
      if (directConnectGatewayAssociation != null)
        'directConnectGatewayAssociation': directConnectGatewayAssociation,
    };
  }
}

enum AddressFamily {
  ipv4,
  ipv6,
}

extension AddressFamilyValueExtension on AddressFamily {
  String toValue() {
    switch (this) {
      case AddressFamily.ipv4:
        return 'ipv4';
      case AddressFamily.ipv6:
        return 'ipv6';
    }
  }
}

extension AddressFamilyFromString on String {
  AddressFamily toAddressFamily() {
    switch (this) {
      case 'ipv4':
        return AddressFamily.ipv4;
      case 'ipv6':
        return AddressFamily.ipv6;
    }
    throw Exception('$this is not known in enum AddressFamily');
  }
}

class AllocateTransitVirtualInterfaceResult {
  final VirtualInterface? virtualInterface;

  AllocateTransitVirtualInterfaceResult({
    this.virtualInterface,
  });

  factory AllocateTransitVirtualInterfaceResult.fromJson(
      Map<String, dynamic> json) {
    return AllocateTransitVirtualInterfaceResult(
      virtualInterface: json['virtualInterface'] != null
          ? VirtualInterface.fromJson(
              json['virtualInterface'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterface = this.virtualInterface;
    return {
      if (virtualInterface != null) 'virtualInterface': virtualInterface,
    };
  }
}

class AssociateMacSecKeyResponse {
  /// The ID of the dedicated connection (dxcon-xxxx), or the ID of the LAG
  /// (dxlag-xxxx).
  final String? connectionId;

  /// The MAC Security (MACsec) security keys associated with the dedicated
  /// connection.
  final List<MacSecKey>? macSecKeys;

  AssociateMacSecKeyResponse({
    this.connectionId,
    this.macSecKeys,
  });

  factory AssociateMacSecKeyResponse.fromJson(Map<String, dynamic> json) {
    return AssociateMacSecKeyResponse(
      connectionId: json['connectionId'] as String?,
      macSecKeys: (json['macSecKeys'] as List?)
          ?.whereNotNull()
          .map((e) => MacSecKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionId = this.connectionId;
    final macSecKeys = this.macSecKeys;
    return {
      if (connectionId != null) 'connectionId': connectionId,
      if (macSecKeys != null) 'macSecKeys': macSecKeys,
    };
  }
}

/// Information about the associated gateway.
class AssociatedGateway {
  /// The ID of the associated gateway.
  final String? id;

  /// The ID of the Amazon Web Services account that owns the associated virtual
  /// private gateway or transit gateway.
  final String? ownerAccount;

  /// The Region where the associated gateway is located.
  final String? region;

  /// The type of associated gateway.
  final GatewayType? type;

  AssociatedGateway({
    this.id,
    this.ownerAccount,
    this.region,
    this.type,
  });

  factory AssociatedGateway.fromJson(Map<String, dynamic> json) {
    return AssociatedGateway(
      id: json['id'] as String?,
      ownerAccount: json['ownerAccount'] as String?,
      region: json['region'] as String?,
      type: (json['type'] as String?)?.toGatewayType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final ownerAccount = this.ownerAccount;
    final region = this.region;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (region != null) 'region': region,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Information about a BGP peer.
class BGPPeer {
  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int? asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The Direct Connect endpoint that terminates the BGP peer.
  final String? awsDeviceV2;

  /// The Direct Connect endpoint that terminates the logical connection. This
  /// device might be different than the device that terminates the physical
  /// connection.
  final String? awsLogicalDeviceId;

  /// The ID of the BGP peer.
  final String? bgpPeerId;

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
  final BGPPeerState? bgpPeerState;

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
  final BGPStatus? bgpStatus;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  BGPPeer({
    this.addressFamily,
    this.amazonAddress,
    this.asn,
    this.authKey,
    this.awsDeviceV2,
    this.awsLogicalDeviceId,
    this.bgpPeerId,
    this.bgpPeerState,
    this.bgpStatus,
    this.customerAddress,
  });

  factory BGPPeer.fromJson(Map<String, dynamic> json) {
    return BGPPeer(
      addressFamily: (json['addressFamily'] as String?)?.toAddressFamily(),
      amazonAddress: json['amazonAddress'] as String?,
      asn: json['asn'] as int?,
      authKey: json['authKey'] as String?,
      awsDeviceV2: json['awsDeviceV2'] as String?,
      awsLogicalDeviceId: json['awsLogicalDeviceId'] as String?,
      bgpPeerId: json['bgpPeerId'] as String?,
      bgpPeerState: (json['bgpPeerState'] as String?)?.toBGPPeerState(),
      bgpStatus: (json['bgpStatus'] as String?)?.toBGPStatus(),
      customerAddress: json['customerAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final asn = this.asn;
    final authKey = this.authKey;
    final awsDeviceV2 = this.awsDeviceV2;
    final awsLogicalDeviceId = this.awsLogicalDeviceId;
    final bgpPeerId = this.bgpPeerId;
    final bgpPeerState = this.bgpPeerState;
    final bgpStatus = this.bgpStatus;
    final customerAddress = this.customerAddress;
    return {
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (asn != null) 'asn': asn,
      if (authKey != null) 'authKey': authKey,
      if (awsDeviceV2 != null) 'awsDeviceV2': awsDeviceV2,
      if (awsLogicalDeviceId != null) 'awsLogicalDeviceId': awsLogicalDeviceId,
      if (bgpPeerId != null) 'bgpPeerId': bgpPeerId,
      if (bgpPeerState != null) 'bgpPeerState': bgpPeerState.toValue(),
      if (bgpStatus != null) 'bgpStatus': bgpStatus.toValue(),
      if (customerAddress != null) 'customerAddress': customerAddress,
    };
  }
}

enum BGPPeerState {
  verifying,
  pending,
  available,
  deleting,
  deleted,
}

extension BGPPeerStateValueExtension on BGPPeerState {
  String toValue() {
    switch (this) {
      case BGPPeerState.verifying:
        return 'verifying';
      case BGPPeerState.pending:
        return 'pending';
      case BGPPeerState.available:
        return 'available';
      case BGPPeerState.deleting:
        return 'deleting';
      case BGPPeerState.deleted:
        return 'deleted';
    }
  }
}

extension BGPPeerStateFromString on String {
  BGPPeerState toBGPPeerState() {
    switch (this) {
      case 'verifying':
        return BGPPeerState.verifying;
      case 'pending':
        return BGPPeerState.pending;
      case 'available':
        return BGPPeerState.available;
      case 'deleting':
        return BGPPeerState.deleting;
      case 'deleted':
        return BGPPeerState.deleted;
    }
    throw Exception('$this is not known in enum BGPPeerState');
  }
}

enum BGPStatus {
  up,
  down,
  unknown,
}

extension BGPStatusValueExtension on BGPStatus {
  String toValue() {
    switch (this) {
      case BGPStatus.up:
        return 'up';
      case BGPStatus.down:
        return 'down';
      case BGPStatus.unknown:
        return 'unknown';
    }
  }
}

extension BGPStatusFromString on String {
  BGPStatus toBGPStatus() {
    switch (this) {
      case 'up':
        return BGPStatus.up;
      case 'down':
        return BGPStatus.down;
      case 'unknown':
        return BGPStatus.unknown;
    }
    throw Exception('$this is not known in enum BGPStatus');
  }
}

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
  final ConnectionState? connectionState;

  ConfirmConnectionResponse({
    this.connectionState,
  });

  factory ConfirmConnectionResponse.fromJson(Map<String, dynamic> json) {
    return ConfirmConnectionResponse(
      connectionState:
          (json['connectionState'] as String?)?.toConnectionState(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionState = this.connectionState;
    return {
      if (connectionState != null) 'connectionState': connectionState.toValue(),
    };
  }
}

class ConfirmCustomerAgreementResponse {
  /// The status of the customer agreement when the connection was created. This
  /// will be either <code>signed</code> or <code>unsigned</code>.
  final String? status;

  ConfirmCustomerAgreementResponse({
    this.status,
  });

  factory ConfirmCustomerAgreementResponse.fromJson(Map<String, dynamic> json) {
    return ConfirmCustomerAgreementResponse(
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
  final VirtualInterfaceState? virtualInterfaceState;

  ConfirmPrivateVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });

  factory ConfirmPrivateVirtualInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return ConfirmPrivateVirtualInterfaceResponse(
      virtualInterfaceState:
          (json['virtualInterfaceState'] as String?)?.toVirtualInterfaceState(),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterfaceState = this.virtualInterfaceState;
    return {
      if (virtualInterfaceState != null)
        'virtualInterfaceState': virtualInterfaceState.toValue(),
    };
  }
}

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
  final VirtualInterfaceState? virtualInterfaceState;

  ConfirmPublicVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });

  factory ConfirmPublicVirtualInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return ConfirmPublicVirtualInterfaceResponse(
      virtualInterfaceState:
          (json['virtualInterfaceState'] as String?)?.toVirtualInterfaceState(),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterfaceState = this.virtualInterfaceState;
    return {
      if (virtualInterfaceState != null)
        'virtualInterfaceState': virtualInterfaceState.toValue(),
    };
  }
}

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
  final VirtualInterfaceState? virtualInterfaceState;

  ConfirmTransitVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });

  factory ConfirmTransitVirtualInterfaceResponse.fromJson(
      Map<String, dynamic> json) {
    return ConfirmTransitVirtualInterfaceResponse(
      virtualInterfaceState:
          (json['virtualInterfaceState'] as String?)?.toVirtualInterfaceState(),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterfaceState = this.virtualInterfaceState;
    return {
      if (virtualInterfaceState != null)
        'virtualInterfaceState': virtualInterfaceState.toValue(),
    };
  }
}

/// Information about an Direct Connect connection.
class Connection {
  /// The Direct Connect endpoint on which the physical connection terminates.
  final String? awsDevice;

  /// The Direct Connect endpoint that terminates the physical connection.
  final String? awsDeviceV2;

  /// The Direct Connect endpoint that terminates the logical connection. This
  /// device might be different than the device that terminates the physical
  /// connection.
  final String? awsLogicalDeviceId;

  /// The bandwidth of the connection.
  final String? bandwidth;

  /// The ID of the connection.
  final String? connectionId;

  /// The name of the connection.
  final String? connectionName;

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
  final ConnectionState? connectionState;

  /// The MAC Security (MACsec) connection encryption mode.
  ///
  /// The valid values are <code>no_encrypt</code>, <code>should_encrypt</code>,
  /// and <code>must_encrypt</code>.
  final String? encryptionMode;

  /// Indicates whether the connection supports a secondary BGP peer in the same
  /// address family (IPv4/IPv6).
  final HasLogicalRedundancy? hasLogicalRedundancy;

  /// Indicates whether jumbo frames are supported.
  final bool? jumboFrameCapable;

  /// The ID of the LAG.
  final String? lagId;

  /// The time of the most recent call to <a>DescribeLoa</a> for this connection.
  final DateTime? loaIssueTime;

  /// The location of the connection.
  final String? location;

  /// Indicates whether the connection supports MAC Security (MACsec).
  final bool? macSecCapable;

  /// The MAC Security (MACsec) security keys associated with the connection.
  final List<MacSecKey>? macSecKeys;

  /// The ID of the Amazon Web Services account that owns the connection.
  final String? ownerAccount;

  /// The name of the Direct Connect service provider associated with the
  /// connection.
  final String? partnerName;

  /// The MAC Security (MACsec) port link status of the connection.
  ///
  /// The valid values are <code>Encryption Up</code>, which means that there is
  /// an active Connection Key Name, or <code>Encryption Down</code>.
  final String? portEncryptionStatus;

  /// The name of the service provider associated with the connection.
  final String? providerName;

  /// The Amazon Web Services Region where the connection is located.
  final String? region;

  /// The tags associated with the connection.
  final List<Tag>? tags;

  /// The ID of the VLAN.
  final int? vlan;

  Connection({
    this.awsDevice,
    this.awsDeviceV2,
    this.awsLogicalDeviceId,
    this.bandwidth,
    this.connectionId,
    this.connectionName,
    this.connectionState,
    this.encryptionMode,
    this.hasLogicalRedundancy,
    this.jumboFrameCapable,
    this.lagId,
    this.loaIssueTime,
    this.location,
    this.macSecCapable,
    this.macSecKeys,
    this.ownerAccount,
    this.partnerName,
    this.portEncryptionStatus,
    this.providerName,
    this.region,
    this.tags,
    this.vlan,
  });

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      awsDevice: json['awsDevice'] as String?,
      awsDeviceV2: json['awsDeviceV2'] as String?,
      awsLogicalDeviceId: json['awsLogicalDeviceId'] as String?,
      bandwidth: json['bandwidth'] as String?,
      connectionId: json['connectionId'] as String?,
      connectionName: json['connectionName'] as String?,
      connectionState:
          (json['connectionState'] as String?)?.toConnectionState(),
      encryptionMode: json['encryptionMode'] as String?,
      hasLogicalRedundancy:
          (json['hasLogicalRedundancy'] as String?)?.toHasLogicalRedundancy(),
      jumboFrameCapable: json['jumboFrameCapable'] as bool?,
      lagId: json['lagId'] as String?,
      loaIssueTime: timeStampFromJson(json['loaIssueTime']),
      location: json['location'] as String?,
      macSecCapable: json['macSecCapable'] as bool?,
      macSecKeys: (json['macSecKeys'] as List?)
          ?.whereNotNull()
          .map((e) => MacSecKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownerAccount: json['ownerAccount'] as String?,
      partnerName: json['partnerName'] as String?,
      portEncryptionStatus: json['portEncryptionStatus'] as String?,
      providerName: json['providerName'] as String?,
      region: json['region'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vlan: json['vlan'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsDevice = this.awsDevice;
    final awsDeviceV2 = this.awsDeviceV2;
    final awsLogicalDeviceId = this.awsLogicalDeviceId;
    final bandwidth = this.bandwidth;
    final connectionId = this.connectionId;
    final connectionName = this.connectionName;
    final connectionState = this.connectionState;
    final encryptionMode = this.encryptionMode;
    final hasLogicalRedundancy = this.hasLogicalRedundancy;
    final jumboFrameCapable = this.jumboFrameCapable;
    final lagId = this.lagId;
    final loaIssueTime = this.loaIssueTime;
    final location = this.location;
    final macSecCapable = this.macSecCapable;
    final macSecKeys = this.macSecKeys;
    final ownerAccount = this.ownerAccount;
    final partnerName = this.partnerName;
    final portEncryptionStatus = this.portEncryptionStatus;
    final providerName = this.providerName;
    final region = this.region;
    final tags = this.tags;
    final vlan = this.vlan;
    return {
      if (awsDevice != null) 'awsDevice': awsDevice,
      if (awsDeviceV2 != null) 'awsDeviceV2': awsDeviceV2,
      if (awsLogicalDeviceId != null) 'awsLogicalDeviceId': awsLogicalDeviceId,
      if (bandwidth != null) 'bandwidth': bandwidth,
      if (connectionId != null) 'connectionId': connectionId,
      if (connectionName != null) 'connectionName': connectionName,
      if (connectionState != null) 'connectionState': connectionState.toValue(),
      if (encryptionMode != null) 'encryptionMode': encryptionMode,
      if (hasLogicalRedundancy != null)
        'hasLogicalRedundancy': hasLogicalRedundancy.toValue(),
      if (jumboFrameCapable != null) 'jumboFrameCapable': jumboFrameCapable,
      if (lagId != null) 'lagId': lagId,
      if (loaIssueTime != null)
        'loaIssueTime': unixTimestampToJson(loaIssueTime),
      if (location != null) 'location': location,
      if (macSecCapable != null) 'macSecCapable': macSecCapable,
      if (macSecKeys != null) 'macSecKeys': macSecKeys,
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (partnerName != null) 'partnerName': partnerName,
      if (portEncryptionStatus != null)
        'portEncryptionStatus': portEncryptionStatus,
      if (providerName != null) 'providerName': providerName,
      if (region != null) 'region': region,
      if (tags != null) 'tags': tags,
      if (vlan != null) 'vlan': vlan,
    };
  }
}

enum ConnectionState {
  ordering,
  requested,
  pending,
  available,
  down,
  deleting,
  deleted,
  rejected,
  unknown,
}

extension ConnectionStateValueExtension on ConnectionState {
  String toValue() {
    switch (this) {
      case ConnectionState.ordering:
        return 'ordering';
      case ConnectionState.requested:
        return 'requested';
      case ConnectionState.pending:
        return 'pending';
      case ConnectionState.available:
        return 'available';
      case ConnectionState.down:
        return 'down';
      case ConnectionState.deleting:
        return 'deleting';
      case ConnectionState.deleted:
        return 'deleted';
      case ConnectionState.rejected:
        return 'rejected';
      case ConnectionState.unknown:
        return 'unknown';
    }
  }
}

extension ConnectionStateFromString on String {
  ConnectionState toConnectionState() {
    switch (this) {
      case 'ordering':
        return ConnectionState.ordering;
      case 'requested':
        return ConnectionState.requested;
      case 'pending':
        return ConnectionState.pending;
      case 'available':
        return ConnectionState.available;
      case 'down':
        return ConnectionState.down;
      case 'deleting':
        return ConnectionState.deleting;
      case 'deleted':
        return ConnectionState.deleted;
      case 'rejected':
        return ConnectionState.rejected;
      case 'unknown':
        return ConnectionState.unknown;
    }
    throw Exception('$this is not known in enum ConnectionState');
  }
}

class Connections {
  /// The connections.
  final List<Connection>? connections;

  Connections({
    this.connections,
  });

  factory Connections.fromJson(Map<String, dynamic> json) {
    return Connections(
      connections: (json['connections'] as List?)
          ?.whereNotNull()
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connections = this.connections;
    return {
      if (connections != null) 'connections': connections,
    };
  }
}

class CreateBGPPeerResponse {
  /// The virtual interface.
  final VirtualInterface? virtualInterface;

  CreateBGPPeerResponse({
    this.virtualInterface,
  });

  factory CreateBGPPeerResponse.fromJson(Map<String, dynamic> json) {
    return CreateBGPPeerResponse(
      virtualInterface: json['virtualInterface'] != null
          ? VirtualInterface.fromJson(
              json['virtualInterface'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterface = this.virtualInterface;
    return {
      if (virtualInterface != null) 'virtualInterface': virtualInterface,
    };
  }
}

class CreateDirectConnectGatewayAssociationProposalResult {
  /// Information about the Direct Connect gateway proposal.
  final DirectConnectGatewayAssociationProposal?
      directConnectGatewayAssociationProposal;

  CreateDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociationProposal,
  });

  factory CreateDirectConnectGatewayAssociationProposalResult.fromJson(
      Map<String, dynamic> json) {
    return CreateDirectConnectGatewayAssociationProposalResult(
      directConnectGatewayAssociationProposal:
          json['directConnectGatewayAssociationProposal'] != null
              ? DirectConnectGatewayAssociationProposal.fromJson(
                  json['directConnectGatewayAssociationProposal']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociationProposal =
        this.directConnectGatewayAssociationProposal;
    return {
      if (directConnectGatewayAssociationProposal != null)
        'directConnectGatewayAssociationProposal':
            directConnectGatewayAssociationProposal,
    };
  }
}

class CreateDirectConnectGatewayAssociationResult {
  /// The association to be created.
  final DirectConnectGatewayAssociation? directConnectGatewayAssociation;

  CreateDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });

  factory CreateDirectConnectGatewayAssociationResult.fromJson(
      Map<String, dynamic> json) {
    return CreateDirectConnectGatewayAssociationResult(
      directConnectGatewayAssociation:
          json['directConnectGatewayAssociation'] != null
              ? DirectConnectGatewayAssociation.fromJson(
                  json['directConnectGatewayAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociation =
        this.directConnectGatewayAssociation;
    return {
      if (directConnectGatewayAssociation != null)
        'directConnectGatewayAssociation': directConnectGatewayAssociation,
    };
  }
}

class CreateDirectConnectGatewayResult {
  /// The Direct Connect gateway.
  final DirectConnectGateway? directConnectGateway;

  CreateDirectConnectGatewayResult({
    this.directConnectGateway,
  });

  factory CreateDirectConnectGatewayResult.fromJson(Map<String, dynamic> json) {
    return CreateDirectConnectGatewayResult(
      directConnectGateway: json['directConnectGateway'] != null
          ? DirectConnectGateway.fromJson(
              json['directConnectGateway'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGateway = this.directConnectGateway;
    return {
      if (directConnectGateway != null)
        'directConnectGateway': directConnectGateway,
    };
  }
}

class CreateTransitVirtualInterfaceResult {
  final VirtualInterface? virtualInterface;

  CreateTransitVirtualInterfaceResult({
    this.virtualInterface,
  });

  factory CreateTransitVirtualInterfaceResult.fromJson(
      Map<String, dynamic> json) {
    return CreateTransitVirtualInterfaceResult(
      virtualInterface: json['virtualInterface'] != null
          ? VirtualInterface.fromJson(
              json['virtualInterface'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterface = this.virtualInterface;
    return {
      if (virtualInterface != null) 'virtualInterface': virtualInterface,
    };
  }
}

/// The name and status of a customer agreement.
class CustomerAgreement {
  /// The name of the agreement.
  final String? agreementName;

  /// The status of the customer agreement. This will be either
  /// <code>signed</code> or <code>unsigned</code>
  final String? status;

  CustomerAgreement({
    this.agreementName,
    this.status,
  });

  factory CustomerAgreement.fromJson(Map<String, dynamic> json) {
    return CustomerAgreement(
      agreementName: json['agreementName'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementName = this.agreementName;
    final status = this.status;
    return {
      if (agreementName != null) 'agreementName': agreementName,
      if (status != null) 'status': status,
    };
  }
}

class DeleteBGPPeerResponse {
  /// The virtual interface.
  final VirtualInterface? virtualInterface;

  DeleteBGPPeerResponse({
    this.virtualInterface,
  });

  factory DeleteBGPPeerResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBGPPeerResponse(
      virtualInterface: json['virtualInterface'] != null
          ? VirtualInterface.fromJson(
              json['virtualInterface'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterface = this.virtualInterface;
    return {
      if (virtualInterface != null) 'virtualInterface': virtualInterface,
    };
  }
}

class DeleteDirectConnectGatewayAssociationProposalResult {
  /// The ID of the associated gateway.
  final DirectConnectGatewayAssociationProposal?
      directConnectGatewayAssociationProposal;

  DeleteDirectConnectGatewayAssociationProposalResult({
    this.directConnectGatewayAssociationProposal,
  });

  factory DeleteDirectConnectGatewayAssociationProposalResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteDirectConnectGatewayAssociationProposalResult(
      directConnectGatewayAssociationProposal:
          json['directConnectGatewayAssociationProposal'] != null
              ? DirectConnectGatewayAssociationProposal.fromJson(
                  json['directConnectGatewayAssociationProposal']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociationProposal =
        this.directConnectGatewayAssociationProposal;
    return {
      if (directConnectGatewayAssociationProposal != null)
        'directConnectGatewayAssociationProposal':
            directConnectGatewayAssociationProposal,
    };
  }
}

class DeleteDirectConnectGatewayAssociationResult {
  /// Information about the deleted association.
  final DirectConnectGatewayAssociation? directConnectGatewayAssociation;

  DeleteDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });

  factory DeleteDirectConnectGatewayAssociationResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteDirectConnectGatewayAssociationResult(
      directConnectGatewayAssociation:
          json['directConnectGatewayAssociation'] != null
              ? DirectConnectGatewayAssociation.fromJson(
                  json['directConnectGatewayAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociation =
        this.directConnectGatewayAssociation;
    return {
      if (directConnectGatewayAssociation != null)
        'directConnectGatewayAssociation': directConnectGatewayAssociation,
    };
  }
}

class DeleteDirectConnectGatewayResult {
  /// The Direct Connect gateway.
  final DirectConnectGateway? directConnectGateway;

  DeleteDirectConnectGatewayResult({
    this.directConnectGateway,
  });

  factory DeleteDirectConnectGatewayResult.fromJson(Map<String, dynamic> json) {
    return DeleteDirectConnectGatewayResult(
      directConnectGateway: json['directConnectGateway'] != null
          ? DirectConnectGateway.fromJson(
              json['directConnectGateway'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGateway = this.directConnectGateway;
    return {
      if (directConnectGateway != null)
        'directConnectGateway': directConnectGateway,
    };
  }
}

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
  final InterconnectState? interconnectState;

  DeleteInterconnectResponse({
    this.interconnectState,
  });

  factory DeleteInterconnectResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInterconnectResponse(
      interconnectState:
          (json['interconnectState'] as String?)?.toInterconnectState(),
    );
  }

  Map<String, dynamic> toJson() {
    final interconnectState = this.interconnectState;
    return {
      if (interconnectState != null)
        'interconnectState': interconnectState.toValue(),
    };
  }
}

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
  final VirtualInterfaceState? virtualInterfaceState;

  DeleteVirtualInterfaceResponse({
    this.virtualInterfaceState,
  });

  factory DeleteVirtualInterfaceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVirtualInterfaceResponse(
      virtualInterfaceState:
          (json['virtualInterfaceState'] as String?)?.toVirtualInterfaceState(),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterfaceState = this.virtualInterfaceState;
    return {
      if (virtualInterfaceState != null)
        'virtualInterfaceState': virtualInterfaceState.toValue(),
    };
  }
}

class DescribeConnectionLoaResponse {
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).
  final Loa? loa;

  DescribeConnectionLoaResponse({
    this.loa,
  });

  factory DescribeConnectionLoaResponse.fromJson(Map<String, dynamic> json) {
    return DescribeConnectionLoaResponse(
      loa: json['loa'] != null
          ? Loa.fromJson(json['loa'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loa = this.loa;
    return {
      if (loa != null) 'loa': loa,
    };
  }
}

class DescribeCustomerMetadataResponse {
  /// The list of customer agreements.
  final List<CustomerAgreement>? agreements;

  /// The type of network-to-network interface (NNI) partner. The partner type
  /// will be one of the following:
  ///
  /// <ul>
  /// <li>
  /// V1: This partner can only allocate 50Mbps, 100Mbps, 200Mbps, 300Mbps,
  /// 400Mbps, or 500Mbps subgigabit connections.
  /// </li>
  /// <li>
  /// V2: This partner can only allocate 1GB, 2GB, 5GB, or 10GB hosted
  /// connections.
  /// </li>
  /// <li>
  /// nonPartner: The customer is not a partner.
  /// </li>
  /// </ul>
  final NniPartnerType? nniPartnerType;

  DescribeCustomerMetadataResponse({
    this.agreements,
    this.nniPartnerType,
  });

  factory DescribeCustomerMetadataResponse.fromJson(Map<String, dynamic> json) {
    return DescribeCustomerMetadataResponse(
      agreements: (json['agreements'] as List?)
          ?.whereNotNull()
          .map((e) => CustomerAgreement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nniPartnerType: (json['nniPartnerType'] as String?)?.toNniPartnerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final agreements = this.agreements;
    final nniPartnerType = this.nniPartnerType;
    return {
      if (agreements != null) 'agreements': agreements,
      if (nniPartnerType != null) 'nniPartnerType': nniPartnerType.toValue(),
    };
  }
}

class DescribeDirectConnectGatewayAssociationProposalsResult {
  /// Describes the Direct Connect gateway association proposals.
  final List<DirectConnectGatewayAssociationProposal>?
      directConnectGatewayAssociationProposals;

  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  DescribeDirectConnectGatewayAssociationProposalsResult({
    this.directConnectGatewayAssociationProposals,
    this.nextToken,
  });

  factory DescribeDirectConnectGatewayAssociationProposalsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeDirectConnectGatewayAssociationProposalsResult(
      directConnectGatewayAssociationProposals:
          (json['directConnectGatewayAssociationProposals'] as List?)
              ?.whereNotNull()
              .map((e) => DirectConnectGatewayAssociationProposal.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociationProposals =
        this.directConnectGatewayAssociationProposals;
    final nextToken = this.nextToken;
    return {
      if (directConnectGatewayAssociationProposals != null)
        'directConnectGatewayAssociationProposals':
            directConnectGatewayAssociationProposals,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeDirectConnectGatewayAssociationsResult {
  /// Information about the associations.
  final List<DirectConnectGatewayAssociation>? directConnectGatewayAssociations;

  /// The token to retrieve the next page.
  final String? nextToken;

  DescribeDirectConnectGatewayAssociationsResult({
    this.directConnectGatewayAssociations,
    this.nextToken,
  });

  factory DescribeDirectConnectGatewayAssociationsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeDirectConnectGatewayAssociationsResult(
      directConnectGatewayAssociations:
          (json['directConnectGatewayAssociations'] as List?)
              ?.whereNotNull()
              .map((e) => DirectConnectGatewayAssociation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociations =
        this.directConnectGatewayAssociations;
    final nextToken = this.nextToken;
    return {
      if (directConnectGatewayAssociations != null)
        'directConnectGatewayAssociations': directConnectGatewayAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeDirectConnectGatewayAttachmentsResult {
  /// The attachments.
  final List<DirectConnectGatewayAttachment>? directConnectGatewayAttachments;

  /// The token to retrieve the next page.
  final String? nextToken;

  DescribeDirectConnectGatewayAttachmentsResult({
    this.directConnectGatewayAttachments,
    this.nextToken,
  });

  factory DescribeDirectConnectGatewayAttachmentsResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeDirectConnectGatewayAttachmentsResult(
      directConnectGatewayAttachments:
          (json['directConnectGatewayAttachments'] as List?)
              ?.whereNotNull()
              .map((e) => DirectConnectGatewayAttachment.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAttachments =
        this.directConnectGatewayAttachments;
    final nextToken = this.nextToken;
    return {
      if (directConnectGatewayAttachments != null)
        'directConnectGatewayAttachments': directConnectGatewayAttachments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeDirectConnectGatewaysResult {
  /// The Direct Connect gateways.
  final List<DirectConnectGateway>? directConnectGateways;

  /// The token to retrieve the next page.
  final String? nextToken;

  DescribeDirectConnectGatewaysResult({
    this.directConnectGateways,
    this.nextToken,
  });

  factory DescribeDirectConnectGatewaysResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeDirectConnectGatewaysResult(
      directConnectGateways: (json['directConnectGateways'] as List?)
          ?.whereNotNull()
          .map((e) => DirectConnectGateway.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGateways = this.directConnectGateways;
    final nextToken = this.nextToken;
    return {
      if (directConnectGateways != null)
        'directConnectGateways': directConnectGateways,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeInterconnectLoaResponse {
  /// The Letter of Authorization - Connecting Facility Assignment (LOA-CFA).
  final Loa? loa;

  DescribeInterconnectLoaResponse({
    this.loa,
  });

  factory DescribeInterconnectLoaResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInterconnectLoaResponse(
      loa: json['loa'] != null
          ? Loa.fromJson(json['loa'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loa = this.loa;
    return {
      if (loa != null) 'loa': loa,
    };
  }
}

class DescribeRouterConfigurationResponse {
  /// The customer router configuration.
  final String? customerRouterConfig;

  /// The details about the router.
  final RouterType? router;

  /// The ID assigned to the virtual interface.
  final String? virtualInterfaceId;

  /// Provides the details about a virtual interface's router.
  final String? virtualInterfaceName;

  DescribeRouterConfigurationResponse({
    this.customerRouterConfig,
    this.router,
    this.virtualInterfaceId,
    this.virtualInterfaceName,
  });

  factory DescribeRouterConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRouterConfigurationResponse(
      customerRouterConfig: json['customerRouterConfig'] as String?,
      router: json['router'] != null
          ? RouterType.fromJson(json['router'] as Map<String, dynamic>)
          : null,
      virtualInterfaceId: json['virtualInterfaceId'] as String?,
      virtualInterfaceName: json['virtualInterfaceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customerRouterConfig = this.customerRouterConfig;
    final router = this.router;
    final virtualInterfaceId = this.virtualInterfaceId;
    final virtualInterfaceName = this.virtualInterfaceName;
    return {
      if (customerRouterConfig != null)
        'customerRouterConfig': customerRouterConfig,
      if (router != null) 'router': router,
      if (virtualInterfaceId != null) 'virtualInterfaceId': virtualInterfaceId,
      if (virtualInterfaceName != null)
        'virtualInterfaceName': virtualInterfaceName,
    };
  }
}

class DescribeTagsResponse {
  /// Information about the tags.
  final List<ResourceTag>? resourceTags;

  DescribeTagsResponse({
    this.resourceTags,
  });

  factory DescribeTagsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTagsResponse(
      resourceTags: (json['resourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTags = this.resourceTags;
    return {
      if (resourceTags != null) 'resourceTags': resourceTags,
    };
  }
}

/// Information about a Direct Connect gateway, which enables you to connect
/// virtual interfaces and virtual private gateway or transit gateways.
class DirectConnectGateway {
  /// The autonomous system number (ASN) for the Amazon side of the connection.
  final int? amazonSideAsn;

  /// The ID of the Direct Connect gateway.
  final String? directConnectGatewayId;

  /// The name of the Direct Connect gateway.
  final String? directConnectGatewayName;

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
  final DirectConnectGatewayState? directConnectGatewayState;

  /// The ID of the Amazon Web Services account that owns the Direct Connect
  /// gateway.
  final String? ownerAccount;

  /// The error message if the state of an object failed to advance.
  final String? stateChangeError;

  DirectConnectGateway({
    this.amazonSideAsn,
    this.directConnectGatewayId,
    this.directConnectGatewayName,
    this.directConnectGatewayState,
    this.ownerAccount,
    this.stateChangeError,
  });

  factory DirectConnectGateway.fromJson(Map<String, dynamic> json) {
    return DirectConnectGateway(
      amazonSideAsn: json['amazonSideAsn'] as int?,
      directConnectGatewayId: json['directConnectGatewayId'] as String?,
      directConnectGatewayName: json['directConnectGatewayName'] as String?,
      directConnectGatewayState: (json['directConnectGatewayState'] as String?)
          ?.toDirectConnectGatewayState(),
      ownerAccount: json['ownerAccount'] as String?,
      stateChangeError: json['stateChangeError'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonSideAsn = this.amazonSideAsn;
    final directConnectGatewayId = this.directConnectGatewayId;
    final directConnectGatewayName = this.directConnectGatewayName;
    final directConnectGatewayState = this.directConnectGatewayState;
    final ownerAccount = this.ownerAccount;
    final stateChangeError = this.stateChangeError;
    return {
      if (amazonSideAsn != null) 'amazonSideAsn': amazonSideAsn,
      if (directConnectGatewayId != null)
        'directConnectGatewayId': directConnectGatewayId,
      if (directConnectGatewayName != null)
        'directConnectGatewayName': directConnectGatewayName,
      if (directConnectGatewayState != null)
        'directConnectGatewayState': directConnectGatewayState.toValue(),
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (stateChangeError != null) 'stateChangeError': stateChangeError,
    };
  }
}

/// Information about an association between a Direct Connect gateway and a
/// virtual private gateway or transit gateway.
class DirectConnectGatewayAssociation {
  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  final List<RouteFilterPrefix>? allowedPrefixesToDirectConnectGateway;

  /// Information about the associated gateway.
  final AssociatedGateway? associatedGateway;

  /// The ID of the Direct Connect gateway association.
  final String? associationId;

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
  /// <li>
  /// <code>updating</code>: The CIDR blocks for the virtual private gateway or
  /// transit gateway are currently being updated. This could be new CIDR blocks
  /// added or current CIDR blocks removed.
  /// </li>
  /// </ul>
  final DirectConnectGatewayAssociationState? associationState;

  /// The ID of the Direct Connect gateway.
  final String? directConnectGatewayId;

  /// The ID of the Amazon Web Services account that owns the associated gateway.
  final String? directConnectGatewayOwnerAccount;

  /// The error message if the state of an object failed to advance.
  final String? stateChangeError;

  /// The ID of the virtual private gateway. Applies only to private virtual
  /// interfaces.
  final String? virtualGatewayId;

  /// The ID of the Amazon Web Services account that owns the virtual private
  /// gateway.
  final String? virtualGatewayOwnerAccount;

  /// The Amazon Web Services Region where the virtual private gateway is located.
  final String? virtualGatewayRegion;

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

  factory DirectConnectGatewayAssociation.fromJson(Map<String, dynamic> json) {
    return DirectConnectGatewayAssociation(
      allowedPrefixesToDirectConnectGateway:
          (json['allowedPrefixesToDirectConnectGateway'] as List?)
              ?.whereNotNull()
              .map((e) => RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
              .toList(),
      associatedGateway: json['associatedGateway'] != null
          ? AssociatedGateway.fromJson(
              json['associatedGateway'] as Map<String, dynamic>)
          : null,
      associationId: json['associationId'] as String?,
      associationState: (json['associationState'] as String?)
          ?.toDirectConnectGatewayAssociationState(),
      directConnectGatewayId: json['directConnectGatewayId'] as String?,
      directConnectGatewayOwnerAccount:
          json['directConnectGatewayOwnerAccount'] as String?,
      stateChangeError: json['stateChangeError'] as String?,
      virtualGatewayId: json['virtualGatewayId'] as String?,
      virtualGatewayOwnerAccount: json['virtualGatewayOwnerAccount'] as String?,
      virtualGatewayRegion: json['virtualGatewayRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedPrefixesToDirectConnectGateway =
        this.allowedPrefixesToDirectConnectGateway;
    final associatedGateway = this.associatedGateway;
    final associationId = this.associationId;
    final associationState = this.associationState;
    final directConnectGatewayId = this.directConnectGatewayId;
    final directConnectGatewayOwnerAccount =
        this.directConnectGatewayOwnerAccount;
    final stateChangeError = this.stateChangeError;
    final virtualGatewayId = this.virtualGatewayId;
    final virtualGatewayOwnerAccount = this.virtualGatewayOwnerAccount;
    final virtualGatewayRegion = this.virtualGatewayRegion;
    return {
      if (allowedPrefixesToDirectConnectGateway != null)
        'allowedPrefixesToDirectConnectGateway':
            allowedPrefixesToDirectConnectGateway,
      if (associatedGateway != null) 'associatedGateway': associatedGateway,
      if (associationId != null) 'associationId': associationId,
      if (associationState != null)
        'associationState': associationState.toValue(),
      if (directConnectGatewayId != null)
        'directConnectGatewayId': directConnectGatewayId,
      if (directConnectGatewayOwnerAccount != null)
        'directConnectGatewayOwnerAccount': directConnectGatewayOwnerAccount,
      if (stateChangeError != null) 'stateChangeError': stateChangeError,
      if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
      if (virtualGatewayOwnerAccount != null)
        'virtualGatewayOwnerAccount': virtualGatewayOwnerAccount,
      if (virtualGatewayRegion != null)
        'virtualGatewayRegion': virtualGatewayRegion,
    };
  }
}

/// Information about the proposal request to attach a virtual private gateway
/// to a Direct Connect gateway.
class DirectConnectGatewayAssociationProposal {
  /// Information about the associated gateway.
  final AssociatedGateway? associatedGateway;

  /// The ID of the Direct Connect gateway.
  final String? directConnectGatewayId;

  /// The ID of the Amazon Web Services account that owns the Direct Connect
  /// gateway.
  final String? directConnectGatewayOwnerAccount;

  /// The existing Amazon VPC prefixes advertised to the Direct Connect gateway.
  final List<RouteFilterPrefix>? existingAllowedPrefixesToDirectConnectGateway;

  /// The ID of the association proposal.
  final String? proposalId;

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
  final DirectConnectGatewayAssociationProposalState? proposalState;

  /// The Amazon VPC prefixes to advertise to the Direct Connect gateway.
  final List<RouteFilterPrefix>? requestedAllowedPrefixesToDirectConnectGateway;

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
      Map<String, dynamic> json) {
    return DirectConnectGatewayAssociationProposal(
      associatedGateway: json['associatedGateway'] != null
          ? AssociatedGateway.fromJson(
              json['associatedGateway'] as Map<String, dynamic>)
          : null,
      directConnectGatewayId: json['directConnectGatewayId'] as String?,
      directConnectGatewayOwnerAccount:
          json['directConnectGatewayOwnerAccount'] as String?,
      existingAllowedPrefixesToDirectConnectGateway:
          (json['existingAllowedPrefixesToDirectConnectGateway'] as List?)
              ?.whereNotNull()
              .map((e) => RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
              .toList(),
      proposalId: json['proposalId'] as String?,
      proposalState: (json['proposalState'] as String?)
          ?.toDirectConnectGatewayAssociationProposalState(),
      requestedAllowedPrefixesToDirectConnectGateway:
          (json['requestedAllowedPrefixesToDirectConnectGateway'] as List?)
              ?.whereNotNull()
              .map((e) => RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedGateway = this.associatedGateway;
    final directConnectGatewayId = this.directConnectGatewayId;
    final directConnectGatewayOwnerAccount =
        this.directConnectGatewayOwnerAccount;
    final existingAllowedPrefixesToDirectConnectGateway =
        this.existingAllowedPrefixesToDirectConnectGateway;
    final proposalId = this.proposalId;
    final proposalState = this.proposalState;
    final requestedAllowedPrefixesToDirectConnectGateway =
        this.requestedAllowedPrefixesToDirectConnectGateway;
    return {
      if (associatedGateway != null) 'associatedGateway': associatedGateway,
      if (directConnectGatewayId != null)
        'directConnectGatewayId': directConnectGatewayId,
      if (directConnectGatewayOwnerAccount != null)
        'directConnectGatewayOwnerAccount': directConnectGatewayOwnerAccount,
      if (existingAllowedPrefixesToDirectConnectGateway != null)
        'existingAllowedPrefixesToDirectConnectGateway':
            existingAllowedPrefixesToDirectConnectGateway,
      if (proposalId != null) 'proposalId': proposalId,
      if (proposalState != null) 'proposalState': proposalState.toValue(),
      if (requestedAllowedPrefixesToDirectConnectGateway != null)
        'requestedAllowedPrefixesToDirectConnectGateway':
            requestedAllowedPrefixesToDirectConnectGateway,
    };
  }
}

enum DirectConnectGatewayAssociationProposalState {
  requested,
  accepted,
  deleted,
}

extension DirectConnectGatewayAssociationProposalStateValueExtension
    on DirectConnectGatewayAssociationProposalState {
  String toValue() {
    switch (this) {
      case DirectConnectGatewayAssociationProposalState.requested:
        return 'requested';
      case DirectConnectGatewayAssociationProposalState.accepted:
        return 'accepted';
      case DirectConnectGatewayAssociationProposalState.deleted:
        return 'deleted';
    }
  }
}

extension DirectConnectGatewayAssociationProposalStateFromString on String {
  DirectConnectGatewayAssociationProposalState
      toDirectConnectGatewayAssociationProposalState() {
    switch (this) {
      case 'requested':
        return DirectConnectGatewayAssociationProposalState.requested;
      case 'accepted':
        return DirectConnectGatewayAssociationProposalState.accepted;
      case 'deleted':
        return DirectConnectGatewayAssociationProposalState.deleted;
    }
    throw Exception(
        '$this is not known in enum DirectConnectGatewayAssociationProposalState');
  }
}

enum DirectConnectGatewayAssociationState {
  associating,
  associated,
  disassociating,
  disassociated,
  updating,
}

extension DirectConnectGatewayAssociationStateValueExtension
    on DirectConnectGatewayAssociationState {
  String toValue() {
    switch (this) {
      case DirectConnectGatewayAssociationState.associating:
        return 'associating';
      case DirectConnectGatewayAssociationState.associated:
        return 'associated';
      case DirectConnectGatewayAssociationState.disassociating:
        return 'disassociating';
      case DirectConnectGatewayAssociationState.disassociated:
        return 'disassociated';
      case DirectConnectGatewayAssociationState.updating:
        return 'updating';
    }
  }
}

extension DirectConnectGatewayAssociationStateFromString on String {
  DirectConnectGatewayAssociationState
      toDirectConnectGatewayAssociationState() {
    switch (this) {
      case 'associating':
        return DirectConnectGatewayAssociationState.associating;
      case 'associated':
        return DirectConnectGatewayAssociationState.associated;
      case 'disassociating':
        return DirectConnectGatewayAssociationState.disassociating;
      case 'disassociated':
        return DirectConnectGatewayAssociationState.disassociated;
      case 'updating':
        return DirectConnectGatewayAssociationState.updating;
    }
    throw Exception(
        '$this is not known in enum DirectConnectGatewayAssociationState');
  }
}

/// Information about an attachment between a Direct Connect gateway and a
/// virtual interface.
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
  final DirectConnectGatewayAttachmentState? attachmentState;

  /// The type of attachment.
  final DirectConnectGatewayAttachmentType? attachmentType;

  /// The ID of the Direct Connect gateway.
  final String? directConnectGatewayId;

  /// The error message if the state of an object failed to advance.
  final String? stateChangeError;

  /// The ID of the virtual interface.
  final String? virtualInterfaceId;

  /// The ID of the Amazon Web Services account that owns the virtual interface.
  final String? virtualInterfaceOwnerAccount;

  /// The Amazon Web Services Region where the virtual interface is located.
  final String? virtualInterfaceRegion;

  DirectConnectGatewayAttachment({
    this.attachmentState,
    this.attachmentType,
    this.directConnectGatewayId,
    this.stateChangeError,
    this.virtualInterfaceId,
    this.virtualInterfaceOwnerAccount,
    this.virtualInterfaceRegion,
  });

  factory DirectConnectGatewayAttachment.fromJson(Map<String, dynamic> json) {
    return DirectConnectGatewayAttachment(
      attachmentState: (json['attachmentState'] as String?)
          ?.toDirectConnectGatewayAttachmentState(),
      attachmentType: (json['attachmentType'] as String?)
          ?.toDirectConnectGatewayAttachmentType(),
      directConnectGatewayId: json['directConnectGatewayId'] as String?,
      stateChangeError: json['stateChangeError'] as String?,
      virtualInterfaceId: json['virtualInterfaceId'] as String?,
      virtualInterfaceOwnerAccount:
          json['virtualInterfaceOwnerAccount'] as String?,
      virtualInterfaceRegion: json['virtualInterfaceRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentState = this.attachmentState;
    final attachmentType = this.attachmentType;
    final directConnectGatewayId = this.directConnectGatewayId;
    final stateChangeError = this.stateChangeError;
    final virtualInterfaceId = this.virtualInterfaceId;
    final virtualInterfaceOwnerAccount = this.virtualInterfaceOwnerAccount;
    final virtualInterfaceRegion = this.virtualInterfaceRegion;
    return {
      if (attachmentState != null) 'attachmentState': attachmentState.toValue(),
      if (attachmentType != null) 'attachmentType': attachmentType.toValue(),
      if (directConnectGatewayId != null)
        'directConnectGatewayId': directConnectGatewayId,
      if (stateChangeError != null) 'stateChangeError': stateChangeError,
      if (virtualInterfaceId != null) 'virtualInterfaceId': virtualInterfaceId,
      if (virtualInterfaceOwnerAccount != null)
        'virtualInterfaceOwnerAccount': virtualInterfaceOwnerAccount,
      if (virtualInterfaceRegion != null)
        'virtualInterfaceRegion': virtualInterfaceRegion,
    };
  }
}

enum DirectConnectGatewayAttachmentState {
  attaching,
  attached,
  detaching,
  detached,
}

extension DirectConnectGatewayAttachmentStateValueExtension
    on DirectConnectGatewayAttachmentState {
  String toValue() {
    switch (this) {
      case DirectConnectGatewayAttachmentState.attaching:
        return 'attaching';
      case DirectConnectGatewayAttachmentState.attached:
        return 'attached';
      case DirectConnectGatewayAttachmentState.detaching:
        return 'detaching';
      case DirectConnectGatewayAttachmentState.detached:
        return 'detached';
    }
  }
}

extension DirectConnectGatewayAttachmentStateFromString on String {
  DirectConnectGatewayAttachmentState toDirectConnectGatewayAttachmentState() {
    switch (this) {
      case 'attaching':
        return DirectConnectGatewayAttachmentState.attaching;
      case 'attached':
        return DirectConnectGatewayAttachmentState.attached;
      case 'detaching':
        return DirectConnectGatewayAttachmentState.detaching;
      case 'detached':
        return DirectConnectGatewayAttachmentState.detached;
    }
    throw Exception(
        '$this is not known in enum DirectConnectGatewayAttachmentState');
  }
}

enum DirectConnectGatewayAttachmentType {
  transitVirtualInterface,
  privateVirtualInterface,
}

extension DirectConnectGatewayAttachmentTypeValueExtension
    on DirectConnectGatewayAttachmentType {
  String toValue() {
    switch (this) {
      case DirectConnectGatewayAttachmentType.transitVirtualInterface:
        return 'TransitVirtualInterface';
      case DirectConnectGatewayAttachmentType.privateVirtualInterface:
        return 'PrivateVirtualInterface';
    }
  }
}

extension DirectConnectGatewayAttachmentTypeFromString on String {
  DirectConnectGatewayAttachmentType toDirectConnectGatewayAttachmentType() {
    switch (this) {
      case 'TransitVirtualInterface':
        return DirectConnectGatewayAttachmentType.transitVirtualInterface;
      case 'PrivateVirtualInterface':
        return DirectConnectGatewayAttachmentType.privateVirtualInterface;
    }
    throw Exception(
        '$this is not known in enum DirectConnectGatewayAttachmentType');
  }
}

enum DirectConnectGatewayState {
  pending,
  available,
  deleting,
  deleted,
}

extension DirectConnectGatewayStateValueExtension on DirectConnectGatewayState {
  String toValue() {
    switch (this) {
      case DirectConnectGatewayState.pending:
        return 'pending';
      case DirectConnectGatewayState.available:
        return 'available';
      case DirectConnectGatewayState.deleting:
        return 'deleting';
      case DirectConnectGatewayState.deleted:
        return 'deleted';
    }
  }
}

extension DirectConnectGatewayStateFromString on String {
  DirectConnectGatewayState toDirectConnectGatewayState() {
    switch (this) {
      case 'pending':
        return DirectConnectGatewayState.pending;
      case 'available':
        return DirectConnectGatewayState.available;
      case 'deleting':
        return DirectConnectGatewayState.deleting;
      case 'deleted':
        return DirectConnectGatewayState.deleted;
    }
    throw Exception('$this is not known in enum DirectConnectGatewayState');
  }
}

class DisassociateMacSecKeyResponse {
  /// The ID of the dedicated connection (dxcon-xxxx), or the ID of the LAG
  /// (dxlag-xxxx).
  final String? connectionId;

  /// The MAC Security (MACsec) security keys no longer associated with the
  /// dedicated connection.
  final List<MacSecKey>? macSecKeys;

  DisassociateMacSecKeyResponse({
    this.connectionId,
    this.macSecKeys,
  });

  factory DisassociateMacSecKeyResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateMacSecKeyResponse(
      connectionId: json['connectionId'] as String?,
      macSecKeys: (json['macSecKeys'] as List?)
          ?.whereNotNull()
          .map((e) => MacSecKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionId = this.connectionId;
    final macSecKeys = this.macSecKeys;
    return {
      if (connectionId != null) 'connectionId': connectionId,
      if (macSecKeys != null) 'macSecKeys': macSecKeys,
    };
  }
}

enum GatewayType {
  virtualPrivateGateway,
  transitGateway,
}

extension GatewayTypeValueExtension on GatewayType {
  String toValue() {
    switch (this) {
      case GatewayType.virtualPrivateGateway:
        return 'virtualPrivateGateway';
      case GatewayType.transitGateway:
        return 'transitGateway';
    }
  }
}

extension GatewayTypeFromString on String {
  GatewayType toGatewayType() {
    switch (this) {
      case 'virtualPrivateGateway':
        return GatewayType.virtualPrivateGateway;
      case 'transitGateway':
        return GatewayType.transitGateway;
    }
    throw Exception('$this is not known in enum GatewayType');
  }
}

enum HasLogicalRedundancy {
  unknown,
  yes,
  no,
}

extension HasLogicalRedundancyValueExtension on HasLogicalRedundancy {
  String toValue() {
    switch (this) {
      case HasLogicalRedundancy.unknown:
        return 'unknown';
      case HasLogicalRedundancy.yes:
        return 'yes';
      case HasLogicalRedundancy.no:
        return 'no';
    }
  }
}

extension HasLogicalRedundancyFromString on String {
  HasLogicalRedundancy toHasLogicalRedundancy() {
    switch (this) {
      case 'unknown':
        return HasLogicalRedundancy.unknown;
      case 'yes':
        return HasLogicalRedundancy.yes;
      case 'no':
        return HasLogicalRedundancy.no;
    }
    throw Exception('$this is not known in enum HasLogicalRedundancy');
  }
}

/// Information about an interconnect.
class Interconnect {
  /// The Direct Connect endpoint on which the physical connection terminates.
  final String? awsDevice;

  /// The Direct Connect endpoint that terminates the physical connection.
  final String? awsDeviceV2;

  /// The Direct Connect endpoint that terminates the logical connection. This
  /// device might be different than the device that terminates the physical
  /// connection.
  final String? awsLogicalDeviceId;

  /// The bandwidth of the connection.
  final String? bandwidth;

  /// Indicates whether the interconnect supports a secondary BGP in the same
  /// address family (IPv4/IPv6).
  final HasLogicalRedundancy? hasLogicalRedundancy;

  /// The ID of the interconnect.
  final String? interconnectId;

  /// The name of the interconnect.
  final String? interconnectName;

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
  final InterconnectState? interconnectState;

  /// Indicates whether jumbo frames are supported.
  final bool? jumboFrameCapable;

  /// The ID of the LAG.
  final String? lagId;

  /// The time of the most recent call to <a>DescribeLoa</a> for this connection.
  final DateTime? loaIssueTime;

  /// The location of the connection.
  final String? location;

  /// The name of the service provider associated with the interconnect.
  final String? providerName;

  /// The Amazon Web Services Region where the connection is located.
  final String? region;

  /// The tags associated with the interconnect.
  final List<Tag>? tags;

  Interconnect({
    this.awsDevice,
    this.awsDeviceV2,
    this.awsLogicalDeviceId,
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

  factory Interconnect.fromJson(Map<String, dynamic> json) {
    return Interconnect(
      awsDevice: json['awsDevice'] as String?,
      awsDeviceV2: json['awsDeviceV2'] as String?,
      awsLogicalDeviceId: json['awsLogicalDeviceId'] as String?,
      bandwidth: json['bandwidth'] as String?,
      hasLogicalRedundancy:
          (json['hasLogicalRedundancy'] as String?)?.toHasLogicalRedundancy(),
      interconnectId: json['interconnectId'] as String?,
      interconnectName: json['interconnectName'] as String?,
      interconnectState:
          (json['interconnectState'] as String?)?.toInterconnectState(),
      jumboFrameCapable: json['jumboFrameCapable'] as bool?,
      lagId: json['lagId'] as String?,
      loaIssueTime: timeStampFromJson(json['loaIssueTime']),
      location: json['location'] as String?,
      providerName: json['providerName'] as String?,
      region: json['region'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final awsDevice = this.awsDevice;
    final awsDeviceV2 = this.awsDeviceV2;
    final awsLogicalDeviceId = this.awsLogicalDeviceId;
    final bandwidth = this.bandwidth;
    final hasLogicalRedundancy = this.hasLogicalRedundancy;
    final interconnectId = this.interconnectId;
    final interconnectName = this.interconnectName;
    final interconnectState = this.interconnectState;
    final jumboFrameCapable = this.jumboFrameCapable;
    final lagId = this.lagId;
    final loaIssueTime = this.loaIssueTime;
    final location = this.location;
    final providerName = this.providerName;
    final region = this.region;
    final tags = this.tags;
    return {
      if (awsDevice != null) 'awsDevice': awsDevice,
      if (awsDeviceV2 != null) 'awsDeviceV2': awsDeviceV2,
      if (awsLogicalDeviceId != null) 'awsLogicalDeviceId': awsLogicalDeviceId,
      if (bandwidth != null) 'bandwidth': bandwidth,
      if (hasLogicalRedundancy != null)
        'hasLogicalRedundancy': hasLogicalRedundancy.toValue(),
      if (interconnectId != null) 'interconnectId': interconnectId,
      if (interconnectName != null) 'interconnectName': interconnectName,
      if (interconnectState != null)
        'interconnectState': interconnectState.toValue(),
      if (jumboFrameCapable != null) 'jumboFrameCapable': jumboFrameCapable,
      if (lagId != null) 'lagId': lagId,
      if (loaIssueTime != null)
        'loaIssueTime': unixTimestampToJson(loaIssueTime),
      if (location != null) 'location': location,
      if (providerName != null) 'providerName': providerName,
      if (region != null) 'region': region,
      if (tags != null) 'tags': tags,
    };
  }
}

enum InterconnectState {
  requested,
  pending,
  available,
  down,
  deleting,
  deleted,
  unknown,
}

extension InterconnectStateValueExtension on InterconnectState {
  String toValue() {
    switch (this) {
      case InterconnectState.requested:
        return 'requested';
      case InterconnectState.pending:
        return 'pending';
      case InterconnectState.available:
        return 'available';
      case InterconnectState.down:
        return 'down';
      case InterconnectState.deleting:
        return 'deleting';
      case InterconnectState.deleted:
        return 'deleted';
      case InterconnectState.unknown:
        return 'unknown';
    }
  }
}

extension InterconnectStateFromString on String {
  InterconnectState toInterconnectState() {
    switch (this) {
      case 'requested':
        return InterconnectState.requested;
      case 'pending':
        return InterconnectState.pending;
      case 'available':
        return InterconnectState.available;
      case 'down':
        return InterconnectState.down;
      case 'deleting':
        return InterconnectState.deleting;
      case 'deleted':
        return InterconnectState.deleted;
      case 'unknown':
        return InterconnectState.unknown;
    }
    throw Exception('$this is not known in enum InterconnectState');
  }
}

class Interconnects {
  /// The interconnects.
  final List<Interconnect>? interconnects;

  Interconnects({
    this.interconnects,
  });

  factory Interconnects.fromJson(Map<String, dynamic> json) {
    return Interconnects(
      interconnects: (json['interconnects'] as List?)
          ?.whereNotNull()
          .map((e) => Interconnect.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final interconnects = this.interconnects;
    return {
      if (interconnects != null) 'interconnects': interconnects,
    };
  }
}

/// Information about a link aggregation group (LAG).
class Lag {
  /// Indicates whether the LAG can host other connections.
  final bool? allowsHostedConnections;

  /// The Direct Connect endpoint that hosts the LAG.
  final String? awsDevice;

  /// The Direct Connect endpoint that hosts the LAG.
  final String? awsDeviceV2;

  /// The Direct Connect endpoint that terminates the logical connection. This
  /// device might be different than the device that terminates the physical
  /// connection.
  final String? awsLogicalDeviceId;

  /// The connections bundled by the LAG.
  final List<Connection>? connections;

  /// The individual bandwidth of the physical connections bundled by the LAG. The
  /// possible values are 1Gbps and 10Gbps.
  final String? connectionsBandwidth;

  /// The LAG MAC Security (MACsec) encryption mode.
  ///
  /// The valid values are <code>no_encrypt</code>, <code>should_encrypt</code>,
  /// and <code>must_encrypt</code>.
  final String? encryptionMode;

  /// Indicates whether the LAG supports a secondary BGP peer in the same address
  /// family (IPv4/IPv6).
  final HasLogicalRedundancy? hasLogicalRedundancy;

  /// Indicates whether jumbo frames are supported.
  final bool? jumboFrameCapable;

  /// The ID of the LAG.
  final String? lagId;

  /// The name of the LAG.
  final String? lagName;

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
  final LagState? lagState;

  /// The location of the LAG.
  final String? location;

  /// Indicates whether the LAG supports MAC Security (MACsec).
  final bool? macSecCapable;

  /// The MAC Security (MACsec) security keys associated with the LAG.
  final List<MacSecKey>? macSecKeys;

  /// The minimum number of physical dedicated connections that must be
  /// operational for the LAG itself to be operational.
  final int? minimumLinks;

  /// The number of physical dedicated connections bundled by the LAG, up to a
  /// maximum of 10.
  final int? numberOfConnections;

  /// The ID of the Amazon Web Services account that owns the LAG.
  final String? ownerAccount;

  /// The name of the service provider associated with the LAG.
  final String? providerName;

  /// The Amazon Web Services Region where the connection is located.
  final String? region;

  /// The tags associated with the LAG.
  final List<Tag>? tags;

  Lag({
    this.allowsHostedConnections,
    this.awsDevice,
    this.awsDeviceV2,
    this.awsLogicalDeviceId,
    this.connections,
    this.connectionsBandwidth,
    this.encryptionMode,
    this.hasLogicalRedundancy,
    this.jumboFrameCapable,
    this.lagId,
    this.lagName,
    this.lagState,
    this.location,
    this.macSecCapable,
    this.macSecKeys,
    this.minimumLinks,
    this.numberOfConnections,
    this.ownerAccount,
    this.providerName,
    this.region,
    this.tags,
  });

  factory Lag.fromJson(Map<String, dynamic> json) {
    return Lag(
      allowsHostedConnections: json['allowsHostedConnections'] as bool?,
      awsDevice: json['awsDevice'] as String?,
      awsDeviceV2: json['awsDeviceV2'] as String?,
      awsLogicalDeviceId: json['awsLogicalDeviceId'] as String?,
      connections: (json['connections'] as List?)
          ?.whereNotNull()
          .map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectionsBandwidth: json['connectionsBandwidth'] as String?,
      encryptionMode: json['encryptionMode'] as String?,
      hasLogicalRedundancy:
          (json['hasLogicalRedundancy'] as String?)?.toHasLogicalRedundancy(),
      jumboFrameCapable: json['jumboFrameCapable'] as bool?,
      lagId: json['lagId'] as String?,
      lagName: json['lagName'] as String?,
      lagState: (json['lagState'] as String?)?.toLagState(),
      location: json['location'] as String?,
      macSecCapable: json['macSecCapable'] as bool?,
      macSecKeys: (json['macSecKeys'] as List?)
          ?.whereNotNull()
          .map((e) => MacSecKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      minimumLinks: json['minimumLinks'] as int?,
      numberOfConnections: json['numberOfConnections'] as int?,
      ownerAccount: json['ownerAccount'] as String?,
      providerName: json['providerName'] as String?,
      region: json['region'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowsHostedConnections = this.allowsHostedConnections;
    final awsDevice = this.awsDevice;
    final awsDeviceV2 = this.awsDeviceV2;
    final awsLogicalDeviceId = this.awsLogicalDeviceId;
    final connections = this.connections;
    final connectionsBandwidth = this.connectionsBandwidth;
    final encryptionMode = this.encryptionMode;
    final hasLogicalRedundancy = this.hasLogicalRedundancy;
    final jumboFrameCapable = this.jumboFrameCapable;
    final lagId = this.lagId;
    final lagName = this.lagName;
    final lagState = this.lagState;
    final location = this.location;
    final macSecCapable = this.macSecCapable;
    final macSecKeys = this.macSecKeys;
    final minimumLinks = this.minimumLinks;
    final numberOfConnections = this.numberOfConnections;
    final ownerAccount = this.ownerAccount;
    final providerName = this.providerName;
    final region = this.region;
    final tags = this.tags;
    return {
      if (allowsHostedConnections != null)
        'allowsHostedConnections': allowsHostedConnections,
      if (awsDevice != null) 'awsDevice': awsDevice,
      if (awsDeviceV2 != null) 'awsDeviceV2': awsDeviceV2,
      if (awsLogicalDeviceId != null) 'awsLogicalDeviceId': awsLogicalDeviceId,
      if (connections != null) 'connections': connections,
      if (connectionsBandwidth != null)
        'connectionsBandwidth': connectionsBandwidth,
      if (encryptionMode != null) 'encryptionMode': encryptionMode,
      if (hasLogicalRedundancy != null)
        'hasLogicalRedundancy': hasLogicalRedundancy.toValue(),
      if (jumboFrameCapable != null) 'jumboFrameCapable': jumboFrameCapable,
      if (lagId != null) 'lagId': lagId,
      if (lagName != null) 'lagName': lagName,
      if (lagState != null) 'lagState': lagState.toValue(),
      if (location != null) 'location': location,
      if (macSecCapable != null) 'macSecCapable': macSecCapable,
      if (macSecKeys != null) 'macSecKeys': macSecKeys,
      if (minimumLinks != null) 'minimumLinks': minimumLinks,
      if (numberOfConnections != null)
        'numberOfConnections': numberOfConnections,
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (providerName != null) 'providerName': providerName,
      if (region != null) 'region': region,
      if (tags != null) 'tags': tags,
    };
  }
}

enum LagState {
  requested,
  pending,
  available,
  down,
  deleting,
  deleted,
  unknown,
}

extension LagStateValueExtension on LagState {
  String toValue() {
    switch (this) {
      case LagState.requested:
        return 'requested';
      case LagState.pending:
        return 'pending';
      case LagState.available:
        return 'available';
      case LagState.down:
        return 'down';
      case LagState.deleting:
        return 'deleting';
      case LagState.deleted:
        return 'deleted';
      case LagState.unknown:
        return 'unknown';
    }
  }
}

extension LagStateFromString on String {
  LagState toLagState() {
    switch (this) {
      case 'requested':
        return LagState.requested;
      case 'pending':
        return LagState.pending;
      case 'available':
        return LagState.available;
      case 'down':
        return LagState.down;
      case 'deleting':
        return LagState.deleting;
      case 'deleted':
        return LagState.deleted;
      case 'unknown':
        return LagState.unknown;
    }
    throw Exception('$this is not known in enum LagState');
  }
}

class Lags {
  /// The LAGs.
  final List<Lag>? lags;

  Lags({
    this.lags,
  });

  factory Lags.fromJson(Map<String, dynamic> json) {
    return Lags(
      lags: (json['lags'] as List?)
          ?.whereNotNull()
          .map((e) => Lag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lags = this.lags;
    return {
      if (lags != null) 'lags': lags,
    };
  }
}

class ListVirtualInterfaceTestHistoryResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The ID of the tested virtual interface.
  final List<VirtualInterfaceTestHistory>? virtualInterfaceTestHistory;

  ListVirtualInterfaceTestHistoryResponse({
    this.nextToken,
    this.virtualInterfaceTestHistory,
  });

  factory ListVirtualInterfaceTestHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return ListVirtualInterfaceTestHistoryResponse(
      nextToken: json['nextToken'] as String?,
      virtualInterfaceTestHistory: (json['virtualInterfaceTestHistory']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              VirtualInterfaceTestHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final virtualInterfaceTestHistory = this.virtualInterfaceTestHistory;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (virtualInterfaceTestHistory != null)
        'virtualInterfaceTestHistory': virtualInterfaceTestHistory,
    };
  }
}

/// Information about a Letter of Authorization - Connecting Facility Assignment
/// (LOA-CFA) for a connection.
class Loa {
  /// The binary contents of the LOA-CFA document.
  final Uint8List? loaContent;

  /// The standard media type for the LOA-CFA document. The only supported value
  /// is application/pdf.
  final LoaContentType? loaContentType;

  Loa({
    this.loaContent,
    this.loaContentType,
  });

  factory Loa.fromJson(Map<String, dynamic> json) {
    return Loa(
      loaContent: _s.decodeNullableUint8List(json['loaContent'] as String?),
      loaContentType: (json['loaContentType'] as String?)?.toLoaContentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final loaContent = this.loaContent;
    final loaContentType = this.loaContentType;
    return {
      if (loaContent != null) 'loaContent': base64Encode(loaContent),
      if (loaContentType != null) 'loaContentType': loaContentType.toValue(),
    };
  }
}

enum LoaContentType {
  applicationPdf,
}

extension LoaContentTypeValueExtension on LoaContentType {
  String toValue() {
    switch (this) {
      case LoaContentType.applicationPdf:
        return 'application/pdf';
    }
  }
}

extension LoaContentTypeFromString on String {
  LoaContentType toLoaContentType() {
    switch (this) {
      case 'application/pdf':
        return LoaContentType.applicationPdf;
    }
    throw Exception('$this is not known in enum LoaContentType');
  }
}

/// Information about an Direct Connect location.
class Location {
  /// The available MAC Security (MACsec) port speeds for the location.
  final List<String>? availableMacSecPortSpeeds;

  /// The available port speeds for the location.
  final List<String>? availablePortSpeeds;

  /// The name of the service provider for the location.
  final List<String>? availableProviders;

  /// The code for the location.
  final String? locationCode;

  /// The name of the location. This includes the name of the colocation partner
  /// and the physical site of the building.
  final String? locationName;

  /// The Amazon Web Services Region for the location.
  final String? region;

  Location({
    this.availableMacSecPortSpeeds,
    this.availablePortSpeeds,
    this.availableProviders,
    this.locationCode,
    this.locationName,
    this.region,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      availableMacSecPortSpeeds: (json['availableMacSecPortSpeeds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      availablePortSpeeds: (json['availablePortSpeeds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      availableProviders: (json['availableProviders'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      locationCode: json['locationCode'] as String?,
      locationName: json['locationName'] as String?,
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availableMacSecPortSpeeds = this.availableMacSecPortSpeeds;
    final availablePortSpeeds = this.availablePortSpeeds;
    final availableProviders = this.availableProviders;
    final locationCode = this.locationCode;
    final locationName = this.locationName;
    final region = this.region;
    return {
      if (availableMacSecPortSpeeds != null)
        'availableMacSecPortSpeeds': availableMacSecPortSpeeds,
      if (availablePortSpeeds != null)
        'availablePortSpeeds': availablePortSpeeds,
      if (availableProviders != null) 'availableProviders': availableProviders,
      if (locationCode != null) 'locationCode': locationCode,
      if (locationName != null) 'locationName': locationName,
      if (region != null) 'region': region,
    };
  }
}

class Locations {
  /// The locations.
  final List<Location>? locations;

  Locations({
    this.locations,
  });

  factory Locations.fromJson(Map<String, dynamic> json) {
    return Locations(
      locations: (json['locations'] as List?)
          ?.whereNotNull()
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final locations = this.locations;
    return {
      if (locations != null) 'locations': locations,
    };
  }
}

/// Information about the MAC Security (MACsec) secret key.
class MacSecKey {
  /// The Connection Key Name (CKN) for the MAC Security secret key.
  final String? ckn;

  /// The Amazon Resource Name (ARN) of the MAC Security (MACsec) secret key.
  final String? secretARN;

  /// The date that the MAC Security (MACsec) secret key takes effect. The value
  /// is displayed in UTC format.
  final String? startOn;

  /// The state of the MAC Security (MACsec) secret key.
  ///
  /// The possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>associating</code>: The MAC Security (MACsec) secret key is being
  /// validated and not yet associated with the connection or LAG.
  /// </li>
  /// <li>
  /// <code>associated</code>: The MAC Security (MACsec) secret key is validated
  /// and associated with the connection or LAG.
  /// </li>
  /// <li>
  /// <code>disassociating</code>: The MAC Security (MACsec) secret key is being
  /// disassociated from the connection or LAG
  /// </li>
  /// <li>
  /// <code>disassociated</code>: The MAC Security (MACsec) secret key is no
  /// longer associated with the connection or LAG.
  /// </li>
  /// </ul>
  final String? state;

  MacSecKey({
    this.ckn,
    this.secretARN,
    this.startOn,
    this.state,
  });

  factory MacSecKey.fromJson(Map<String, dynamic> json) {
    return MacSecKey(
      ckn: json['ckn'] as String?,
      secretARN: json['secretARN'] as String?,
      startOn: json['startOn'] as String?,
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ckn = this.ckn;
    final secretARN = this.secretARN;
    final startOn = this.startOn;
    final state = this.state;
    return {
      if (ckn != null) 'ckn': ckn,
      if (secretARN != null) 'secretARN': secretARN,
      if (startOn != null) 'startOn': startOn,
      if (state != null) 'state': state,
    };
  }
}

/// Information about a new BGP peer.
class NewBGPPeer {
  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  final int? asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  NewBGPPeer({
    this.addressFamily,
    this.amazonAddress,
    this.asn,
    this.authKey,
    this.customerAddress,
  });

  Map<String, dynamic> toJson() {
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final asn = this.asn;
    final authKey = this.authKey;
    final customerAddress = this.customerAddress;
    return {
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (asn != null) 'asn': asn,
      if (authKey != null) 'authKey': authKey,
      if (customerAddress != null) 'customerAddress': customerAddress,
    };
  }
}

/// Information about a private virtual interface.
class NewPrivateVirtualInterface {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  /// The ID of the Direct Connect gateway.
  final String? directConnectGatewayId;

  /// Indicates whether to enable or disable SiteLink.
  final bool? enableSiteLink;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 9001. The default value is 1500.
  final int? mtu;

  /// The tags associated with the private virtual interface.
  final List<Tag>? tags;

  /// The ID of the virtual private gateway.
  final String? virtualGatewayId;

  NewPrivateVirtualInterface({
    required this.asn,
    required this.virtualInterfaceName,
    required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.directConnectGatewayId,
    this.enableSiteLink,
    this.mtu,
    this.tags,
    this.virtualGatewayId,
  });

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final virtualInterfaceName = this.virtualInterfaceName;
    final vlan = this.vlan;
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final authKey = this.authKey;
    final customerAddress = this.customerAddress;
    final directConnectGatewayId = this.directConnectGatewayId;
    final enableSiteLink = this.enableSiteLink;
    final mtu = this.mtu;
    final tags = this.tags;
    final virtualGatewayId = this.virtualGatewayId;
    return {
      'asn': asn,
      'virtualInterfaceName': virtualInterfaceName,
      'vlan': vlan,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (authKey != null) 'authKey': authKey,
      if (customerAddress != null) 'customerAddress': customerAddress,
      if (directConnectGatewayId != null)
        'directConnectGatewayId': directConnectGatewayId,
      if (enableSiteLink != null) 'enableSiteLink': enableSiteLink,
      if (mtu != null) 'mtu': mtu,
      if (tags != null) 'tags': tags,
      if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
    };
  }
}

/// Information about a private virtual interface to be provisioned on a
/// connection.
class NewPrivateVirtualInterfaceAllocation {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 9001. The default value is 1500.
  final int? mtu;

  /// The tags associated with the private virtual interface.
  final List<Tag>? tags;

  NewPrivateVirtualInterfaceAllocation({
    required this.asn,
    required this.virtualInterfaceName,
    required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.mtu,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final virtualInterfaceName = this.virtualInterfaceName;
    final vlan = this.vlan;
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final authKey = this.authKey;
    final customerAddress = this.customerAddress;
    final mtu = this.mtu;
    final tags = this.tags;
    return {
      'asn': asn,
      'virtualInterfaceName': virtualInterfaceName,
      'vlan': vlan,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (authKey != null) 'authKey': authKey,
      if (customerAddress != null) 'customerAddress': customerAddress,
      if (mtu != null) 'mtu': mtu,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about a public virtual interface.
class NewPublicVirtualInterface {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  /// The routes to be advertised to the Amazon Web Services network in this
  /// Region. Applies to public virtual interfaces.
  final List<RouteFilterPrefix>? routeFilterPrefixes;

  /// The tags associated with the public virtual interface.
  final List<Tag>? tags;

  NewPublicVirtualInterface({
    required this.asn,
    required this.virtualInterfaceName,
    required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.routeFilterPrefixes,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final virtualInterfaceName = this.virtualInterfaceName;
    final vlan = this.vlan;
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final authKey = this.authKey;
    final customerAddress = this.customerAddress;
    final routeFilterPrefixes = this.routeFilterPrefixes;
    final tags = this.tags;
    return {
      'asn': asn,
      'virtualInterfaceName': virtualInterfaceName,
      'vlan': vlan,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (authKey != null) 'authKey': authKey,
      if (customerAddress != null) 'customerAddress': customerAddress,
      if (routeFilterPrefixes != null)
        'routeFilterPrefixes': routeFilterPrefixes,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about a public virtual interface to be provisioned on a
/// connection.
class NewPublicVirtualInterfaceAllocation {
  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  final int asn;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  final String virtualInterfaceName;

  /// The ID of the VLAN.
  final int vlan;

  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  /// The routes to be advertised to the Amazon Web Services network in this
  /// Region. Applies to public virtual interfaces.
  final List<RouteFilterPrefix>? routeFilterPrefixes;

  /// The tags associated with the public virtual interface.
  final List<Tag>? tags;

  NewPublicVirtualInterfaceAllocation({
    required this.asn,
    required this.virtualInterfaceName,
    required this.vlan,
    this.addressFamily,
    this.amazonAddress,
    this.authKey,
    this.customerAddress,
    this.routeFilterPrefixes,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final asn = this.asn;
    final virtualInterfaceName = this.virtualInterfaceName;
    final vlan = this.vlan;
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final authKey = this.authKey;
    final customerAddress = this.customerAddress;
    final routeFilterPrefixes = this.routeFilterPrefixes;
    final tags = this.tags;
    return {
      'asn': asn,
      'virtualInterfaceName': virtualInterfaceName,
      'vlan': vlan,
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (authKey != null) 'authKey': authKey,
      if (customerAddress != null) 'customerAddress': customerAddress,
      if (routeFilterPrefixes != null)
        'routeFilterPrefixes': routeFilterPrefixes,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about a transit virtual interface.
class NewTransitVirtualInterface {
  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  final int? asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  /// The ID of the Direct Connect gateway.
  final String? directConnectGatewayId;

  /// Indicates whether to enable or disable SiteLink.
  final bool? enableSiteLink;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 8500. The default value is 1500.
  final int? mtu;

  /// The tags associated with the transitive virtual interface.
  final List<Tag>? tags;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  final String? virtualInterfaceName;

  /// The ID of the VLAN.
  final int? vlan;

  NewTransitVirtualInterface({
    this.addressFamily,
    this.amazonAddress,
    this.asn,
    this.authKey,
    this.customerAddress,
    this.directConnectGatewayId,
    this.enableSiteLink,
    this.mtu,
    this.tags,
    this.virtualInterfaceName,
    this.vlan,
  });

  Map<String, dynamic> toJson() {
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final asn = this.asn;
    final authKey = this.authKey;
    final customerAddress = this.customerAddress;
    final directConnectGatewayId = this.directConnectGatewayId;
    final enableSiteLink = this.enableSiteLink;
    final mtu = this.mtu;
    final tags = this.tags;
    final virtualInterfaceName = this.virtualInterfaceName;
    final vlan = this.vlan;
    return {
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (asn != null) 'asn': asn,
      if (authKey != null) 'authKey': authKey,
      if (customerAddress != null) 'customerAddress': customerAddress,
      if (directConnectGatewayId != null)
        'directConnectGatewayId': directConnectGatewayId,
      if (enableSiteLink != null) 'enableSiteLink': enableSiteLink,
      if (mtu != null) 'mtu': mtu,
      if (tags != null) 'tags': tags,
      if (virtualInterfaceName != null)
        'virtualInterfaceName': virtualInterfaceName,
      if (vlan != null) 'vlan': vlan,
    };
  }
}

/// Information about a transit virtual interface to be provisioned on a
/// connection.
class NewTransitVirtualInterfaceAllocation {
  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  final int? asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 8500. The default value is 1500
  final int? mtu;

  /// The tags associated with the transitive virtual interface.
  final List<Tag>? tags;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  final String? virtualInterfaceName;

  /// The ID of the VLAN.
  final int? vlan;

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

  Map<String, dynamic> toJson() {
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final asn = this.asn;
    final authKey = this.authKey;
    final customerAddress = this.customerAddress;
    final mtu = this.mtu;
    final tags = this.tags;
    final virtualInterfaceName = this.virtualInterfaceName;
    final vlan = this.vlan;
    return {
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (asn != null) 'asn': asn,
      if (authKey != null) 'authKey': authKey,
      if (customerAddress != null) 'customerAddress': customerAddress,
      if (mtu != null) 'mtu': mtu,
      if (tags != null) 'tags': tags,
      if (virtualInterfaceName != null)
        'virtualInterfaceName': virtualInterfaceName,
      if (vlan != null) 'vlan': vlan,
    };
  }
}

enum NniPartnerType {
  v1,
  v2,
  nonPartner,
}

extension NniPartnerTypeValueExtension on NniPartnerType {
  String toValue() {
    switch (this) {
      case NniPartnerType.v1:
        return 'v1';
      case NniPartnerType.v2:
        return 'v2';
      case NniPartnerType.nonPartner:
        return 'nonPartner';
    }
  }
}

extension NniPartnerTypeFromString on String {
  NniPartnerType toNniPartnerType() {
    switch (this) {
      case 'v1':
        return NniPartnerType.v1;
      case 'v2':
        return NniPartnerType.v2;
      case 'nonPartner':
        return NniPartnerType.nonPartner;
    }
    throw Exception('$this is not known in enum NniPartnerType');
  }
}

/// Information about a tag associated with an Direct Connect resource.
class ResourceTag {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? resourceArn;

  /// The tags.
  final List<Tag>? tags;

  ResourceTag({
    this.resourceArn,
    this.tags,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      resourceArn: json['resourceArn'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about a route filter prefix that a customer can advertise
/// through Border Gateway Protocol (BGP) over a public virtual interface.
class RouteFilterPrefix {
  /// The CIDR block for the advertised route. Separate multiple routes using
  /// commas. An IPv6 CIDR must use /64 or shorter.
  final String? cidr;

  RouteFilterPrefix({
    this.cidr,
  });

  factory RouteFilterPrefix.fromJson(Map<String, dynamic> json) {
    return RouteFilterPrefix(
      cidr: json['cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidr = this.cidr;
    return {
      if (cidr != null) 'cidr': cidr,
    };
  }
}

/// Information about the virtual router.
class RouterType {
  /// The virtual interface router platform.
  final String? platform;

  /// Identifies the router by a combination of vendor, platform, and software
  /// version. For example, <code>CiscoSystemsInc-2900SeriesRouters-IOS124</code>.
  final String? routerTypeIdentifier;

  /// The router software.
  final String? software;

  /// The vendor for the virtual interface's router.
  final String? vendor;

  /// The template for the virtual interface's router.
  final String? xsltTemplateName;

  /// The MAC Security (MACsec) template for the virtual interface's router.
  final String? xsltTemplateNameForMacSec;

  RouterType({
    this.platform,
    this.routerTypeIdentifier,
    this.software,
    this.vendor,
    this.xsltTemplateName,
    this.xsltTemplateNameForMacSec,
  });

  factory RouterType.fromJson(Map<String, dynamic> json) {
    return RouterType(
      platform: json['platform'] as String?,
      routerTypeIdentifier: json['routerTypeIdentifier'] as String?,
      software: json['software'] as String?,
      vendor: json['vendor'] as String?,
      xsltTemplateName: json['xsltTemplateName'] as String?,
      xsltTemplateNameForMacSec: json['xsltTemplateNameForMacSec'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final platform = this.platform;
    final routerTypeIdentifier = this.routerTypeIdentifier;
    final software = this.software;
    final vendor = this.vendor;
    final xsltTemplateName = this.xsltTemplateName;
    final xsltTemplateNameForMacSec = this.xsltTemplateNameForMacSec;
    return {
      if (platform != null) 'platform': platform,
      if (routerTypeIdentifier != null)
        'routerTypeIdentifier': routerTypeIdentifier,
      if (software != null) 'software': software,
      if (vendor != null) 'vendor': vendor,
      if (xsltTemplateName != null) 'xsltTemplateName': xsltTemplateName,
      if (xsltTemplateNameForMacSec != null)
        'xsltTemplateNameForMacSec': xsltTemplateNameForMacSec,
    };
  }
}

class StartBgpFailoverTestResponse {
  /// Information about the virtual interface failover test.
  final VirtualInterfaceTestHistory? virtualInterfaceTest;

  StartBgpFailoverTestResponse({
    this.virtualInterfaceTest,
  });

  factory StartBgpFailoverTestResponse.fromJson(Map<String, dynamic> json) {
    return StartBgpFailoverTestResponse(
      virtualInterfaceTest: json['virtualInterfaceTest'] != null
          ? VirtualInterfaceTestHistory.fromJson(
              json['virtualInterfaceTest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterfaceTest = this.virtualInterfaceTest;
    return {
      if (virtualInterfaceTest != null)
        'virtualInterfaceTest': virtualInterfaceTest,
    };
  }
}

class StopBgpFailoverTestResponse {
  /// Information about the virtual interface failover test.
  final VirtualInterfaceTestHistory? virtualInterfaceTest;

  StopBgpFailoverTestResponse({
    this.virtualInterfaceTest,
  });

  factory StopBgpFailoverTestResponse.fromJson(Map<String, dynamic> json) {
    return StopBgpFailoverTestResponse(
      virtualInterfaceTest: json['virtualInterfaceTest'] != null
          ? VirtualInterfaceTestHistory.fromJson(
              json['virtualInterfaceTest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterfaceTest = this.virtualInterfaceTest;
    return {
      if (virtualInterfaceTest != null)
        'virtualInterfaceTest': virtualInterfaceTest,
    };
  }
}

/// Information about a tag.
class Tag {
  /// The key.
  final String key;

  /// The value.
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      if (value != null) 'value': value,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDirectConnectGatewayAssociationResult {
  final DirectConnectGatewayAssociation? directConnectGatewayAssociation;

  UpdateDirectConnectGatewayAssociationResult({
    this.directConnectGatewayAssociation,
  });

  factory UpdateDirectConnectGatewayAssociationResult.fromJson(
      Map<String, dynamic> json) {
    return UpdateDirectConnectGatewayAssociationResult(
      directConnectGatewayAssociation:
          json['directConnectGatewayAssociation'] != null
              ? DirectConnectGatewayAssociation.fromJson(
                  json['directConnectGatewayAssociation']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGatewayAssociation =
        this.directConnectGatewayAssociation;
    return {
      if (directConnectGatewayAssociation != null)
        'directConnectGatewayAssociation': directConnectGatewayAssociation,
    };
  }
}

class UpdateDirectConnectGatewayResponse {
  final DirectConnectGateway? directConnectGateway;

  UpdateDirectConnectGatewayResponse({
    this.directConnectGateway,
  });

  factory UpdateDirectConnectGatewayResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDirectConnectGatewayResponse(
      directConnectGateway: json['directConnectGateway'] != null
          ? DirectConnectGateway.fromJson(
              json['directConnectGateway'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final directConnectGateway = this.directConnectGateway;
    return {
      if (directConnectGateway != null)
        'directConnectGateway': directConnectGateway,
    };
  }
}

/// Information about a virtual private gateway for a private virtual interface.
class VirtualGateway {
  /// The ID of the virtual private gateway.
  final String? virtualGatewayId;

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
  final String? virtualGatewayState;

  VirtualGateway({
    this.virtualGatewayId,
    this.virtualGatewayState,
  });

  factory VirtualGateway.fromJson(Map<String, dynamic> json) {
    return VirtualGateway(
      virtualGatewayId: json['virtualGatewayId'] as String?,
      virtualGatewayState: json['virtualGatewayState'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final virtualGatewayId = this.virtualGatewayId;
    final virtualGatewayState = this.virtualGatewayState;
    return {
      if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
      if (virtualGatewayState != null)
        'virtualGatewayState': virtualGatewayState,
    };
  }
}

class VirtualGateways {
  /// The virtual private gateways.
  final List<VirtualGateway>? virtualGateways;

  VirtualGateways({
    this.virtualGateways,
  });

  factory VirtualGateways.fromJson(Map<String, dynamic> json) {
    return VirtualGateways(
      virtualGateways: (json['virtualGateways'] as List?)
          ?.whereNotNull()
          .map((e) => VirtualGateway.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualGateways = this.virtualGateways;
    return {
      if (virtualGateways != null) 'virtualGateways': virtualGateways,
    };
  }
}

/// Information about a virtual interface.
class VirtualInterface {
  /// The address family for the BGP peer.
  final AddressFamily? addressFamily;

  /// The IP address assigned to the Amazon interface.
  final String? amazonAddress;

  /// The autonomous system number (ASN) for the Amazon side of the connection.
  final int? amazonSideAsn;

  /// The autonomous system (AS) number for Border Gateway Protocol (BGP)
  /// configuration.
  ///
  /// The valid values are 1-2147483647.
  final int? asn;

  /// The authentication key for BGP configuration. This string has a minimum
  /// length of 6 characters and and a maximun lenth of 80 characters.
  final String? authKey;

  /// The Direct Connect endpoint that terminates the physical connection.
  final String? awsDeviceV2;

  /// The Direct Connect endpoint that terminates the logical connection. This
  /// device might be different than the device that terminates the physical
  /// connection.
  final String? awsLogicalDeviceId;

  /// The BGP peers configured on this virtual interface.
  final List<BGPPeer>? bgpPeers;

  /// The ID of the connection.
  final String? connectionId;

  /// The IP address assigned to the customer interface.
  final String? customerAddress;

  /// The customer router configuration.
  final String? customerRouterConfig;

  /// The ID of the Direct Connect gateway.
  final String? directConnectGatewayId;

  /// Indicates whether jumbo frames are supported.
  final bool? jumboFrameCapable;

  /// The location of the connection.
  final String? location;

  /// The maximum transmission unit (MTU), in bytes. The supported values are 1500
  /// and 8500. The default value is 1500
  final int? mtu;

  /// The ID of the Amazon Web Services account that owns the virtual interface.
  final String? ownerAccount;

  /// The Amazon Web Services Region where the virtual interface is located.
  final String? region;

  /// The routes to be advertised to the Amazon Web Services network in this
  /// Region. Applies to public virtual interfaces.
  final List<RouteFilterPrefix>? routeFilterPrefixes;

  /// Indicates whether SiteLink is enabled.
  final bool? siteLinkEnabled;

  /// The tags associated with the virtual interface.
  final List<Tag>? tags;

  /// The ID of the virtual private gateway. Applies only to private virtual
  /// interfaces.
  final String? virtualGatewayId;

  /// The ID of the virtual interface.
  final String? virtualInterfaceId;

  /// The name of the virtual interface assigned by the customer network. The name
  /// has a maximum of 100 characters. The following are valid characters: a-z,
  /// 0-9 and a hyphen (-).
  final String? virtualInterfaceName;

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
  final VirtualInterfaceState? virtualInterfaceState;

  /// The type of virtual interface. The possible values are <code>private</code>
  /// and <code>public</code>.
  final String? virtualInterfaceType;

  /// The ID of the VLAN.
  final int? vlan;

  VirtualInterface({
    this.addressFamily,
    this.amazonAddress,
    this.amazonSideAsn,
    this.asn,
    this.authKey,
    this.awsDeviceV2,
    this.awsLogicalDeviceId,
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
    this.siteLinkEnabled,
    this.tags,
    this.virtualGatewayId,
    this.virtualInterfaceId,
    this.virtualInterfaceName,
    this.virtualInterfaceState,
    this.virtualInterfaceType,
    this.vlan,
  });

  factory VirtualInterface.fromJson(Map<String, dynamic> json) {
    return VirtualInterface(
      addressFamily: (json['addressFamily'] as String?)?.toAddressFamily(),
      amazonAddress: json['amazonAddress'] as String?,
      amazonSideAsn: json['amazonSideAsn'] as int?,
      asn: json['asn'] as int?,
      authKey: json['authKey'] as String?,
      awsDeviceV2: json['awsDeviceV2'] as String?,
      awsLogicalDeviceId: json['awsLogicalDeviceId'] as String?,
      bgpPeers: (json['bgpPeers'] as List?)
          ?.whereNotNull()
          .map((e) => BGPPeer.fromJson(e as Map<String, dynamic>))
          .toList(),
      connectionId: json['connectionId'] as String?,
      customerAddress: json['customerAddress'] as String?,
      customerRouterConfig: json['customerRouterConfig'] as String?,
      directConnectGatewayId: json['directConnectGatewayId'] as String?,
      jumboFrameCapable: json['jumboFrameCapable'] as bool?,
      location: json['location'] as String?,
      mtu: json['mtu'] as int?,
      ownerAccount: json['ownerAccount'] as String?,
      region: json['region'] as String?,
      routeFilterPrefixes: (json['routeFilterPrefixes'] as List?)
          ?.whereNotNull()
          .map((e) => RouteFilterPrefix.fromJson(e as Map<String, dynamic>))
          .toList(),
      siteLinkEnabled: json['siteLinkEnabled'] as bool?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      virtualGatewayId: json['virtualGatewayId'] as String?,
      virtualInterfaceId: json['virtualInterfaceId'] as String?,
      virtualInterfaceName: json['virtualInterfaceName'] as String?,
      virtualInterfaceState:
          (json['virtualInterfaceState'] as String?)?.toVirtualInterfaceState(),
      virtualInterfaceType: json['virtualInterfaceType'] as String?,
      vlan: json['vlan'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressFamily = this.addressFamily;
    final amazonAddress = this.amazonAddress;
    final amazonSideAsn = this.amazonSideAsn;
    final asn = this.asn;
    final authKey = this.authKey;
    final awsDeviceV2 = this.awsDeviceV2;
    final awsLogicalDeviceId = this.awsLogicalDeviceId;
    final bgpPeers = this.bgpPeers;
    final connectionId = this.connectionId;
    final customerAddress = this.customerAddress;
    final customerRouterConfig = this.customerRouterConfig;
    final directConnectGatewayId = this.directConnectGatewayId;
    final jumboFrameCapable = this.jumboFrameCapable;
    final location = this.location;
    final mtu = this.mtu;
    final ownerAccount = this.ownerAccount;
    final region = this.region;
    final routeFilterPrefixes = this.routeFilterPrefixes;
    final siteLinkEnabled = this.siteLinkEnabled;
    final tags = this.tags;
    final virtualGatewayId = this.virtualGatewayId;
    final virtualInterfaceId = this.virtualInterfaceId;
    final virtualInterfaceName = this.virtualInterfaceName;
    final virtualInterfaceState = this.virtualInterfaceState;
    final virtualInterfaceType = this.virtualInterfaceType;
    final vlan = this.vlan;
    return {
      if (addressFamily != null) 'addressFamily': addressFamily.toValue(),
      if (amazonAddress != null) 'amazonAddress': amazonAddress,
      if (amazonSideAsn != null) 'amazonSideAsn': amazonSideAsn,
      if (asn != null) 'asn': asn,
      if (authKey != null) 'authKey': authKey,
      if (awsDeviceV2 != null) 'awsDeviceV2': awsDeviceV2,
      if (awsLogicalDeviceId != null) 'awsLogicalDeviceId': awsLogicalDeviceId,
      if (bgpPeers != null) 'bgpPeers': bgpPeers,
      if (connectionId != null) 'connectionId': connectionId,
      if (customerAddress != null) 'customerAddress': customerAddress,
      if (customerRouterConfig != null)
        'customerRouterConfig': customerRouterConfig,
      if (directConnectGatewayId != null)
        'directConnectGatewayId': directConnectGatewayId,
      if (jumboFrameCapable != null) 'jumboFrameCapable': jumboFrameCapable,
      if (location != null) 'location': location,
      if (mtu != null) 'mtu': mtu,
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (region != null) 'region': region,
      if (routeFilterPrefixes != null)
        'routeFilterPrefixes': routeFilterPrefixes,
      if (siteLinkEnabled != null) 'siteLinkEnabled': siteLinkEnabled,
      if (tags != null) 'tags': tags,
      if (virtualGatewayId != null) 'virtualGatewayId': virtualGatewayId,
      if (virtualInterfaceId != null) 'virtualInterfaceId': virtualInterfaceId,
      if (virtualInterfaceName != null)
        'virtualInterfaceName': virtualInterfaceName,
      if (virtualInterfaceState != null)
        'virtualInterfaceState': virtualInterfaceState.toValue(),
      if (virtualInterfaceType != null)
        'virtualInterfaceType': virtualInterfaceType,
      if (vlan != null) 'vlan': vlan,
    };
  }
}

enum VirtualInterfaceState {
  confirming,
  verifying,
  pending,
  available,
  down,
  deleting,
  deleted,
  rejected,
  unknown,
}

extension VirtualInterfaceStateValueExtension on VirtualInterfaceState {
  String toValue() {
    switch (this) {
      case VirtualInterfaceState.confirming:
        return 'confirming';
      case VirtualInterfaceState.verifying:
        return 'verifying';
      case VirtualInterfaceState.pending:
        return 'pending';
      case VirtualInterfaceState.available:
        return 'available';
      case VirtualInterfaceState.down:
        return 'down';
      case VirtualInterfaceState.deleting:
        return 'deleting';
      case VirtualInterfaceState.deleted:
        return 'deleted';
      case VirtualInterfaceState.rejected:
        return 'rejected';
      case VirtualInterfaceState.unknown:
        return 'unknown';
    }
  }
}

extension VirtualInterfaceStateFromString on String {
  VirtualInterfaceState toVirtualInterfaceState() {
    switch (this) {
      case 'confirming':
        return VirtualInterfaceState.confirming;
      case 'verifying':
        return VirtualInterfaceState.verifying;
      case 'pending':
        return VirtualInterfaceState.pending;
      case 'available':
        return VirtualInterfaceState.available;
      case 'down':
        return VirtualInterfaceState.down;
      case 'deleting':
        return VirtualInterfaceState.deleting;
      case 'deleted':
        return VirtualInterfaceState.deleted;
      case 'rejected':
        return VirtualInterfaceState.rejected;
      case 'unknown':
        return VirtualInterfaceState.unknown;
    }
    throw Exception('$this is not known in enum VirtualInterfaceState');
  }
}

/// Information about the virtual interface failover test.
class VirtualInterfaceTestHistory {
  /// The BGP peers that were put in the DOWN state as part of the virtual
  /// interface failover test.
  final List<String>? bgpPeers;

  /// The time that the virtual interface moves out of the DOWN state.
  final DateTime? endTime;

  /// The owner ID of the tested virtual interface.
  final String? ownerAccount;

  /// The time that the virtual interface moves to the DOWN state.
  final DateTime? startTime;

  /// The status of the virtual interface failover test.
  final String? status;

  /// The time that the virtual interface failover test ran in minutes.
  final int? testDurationInMinutes;

  /// The ID of the virtual interface failover test.
  final String? testId;

  /// The ID of the tested virtual interface.
  final String? virtualInterfaceId;

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

  factory VirtualInterfaceTestHistory.fromJson(Map<String, dynamic> json) {
    return VirtualInterfaceTestHistory(
      bgpPeers: (json['bgpPeers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      endTime: timeStampFromJson(json['endTime']),
      ownerAccount: json['ownerAccount'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      status: json['status'] as String?,
      testDurationInMinutes: json['testDurationInMinutes'] as int?,
      testId: json['testId'] as String?,
      virtualInterfaceId: json['virtualInterfaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bgpPeers = this.bgpPeers;
    final endTime = this.endTime;
    final ownerAccount = this.ownerAccount;
    final startTime = this.startTime;
    final status = this.status;
    final testDurationInMinutes = this.testDurationInMinutes;
    final testId = this.testId;
    final virtualInterfaceId = this.virtualInterfaceId;
    return {
      if (bgpPeers != null) 'bgpPeers': bgpPeers,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (ownerAccount != null) 'ownerAccount': ownerAccount,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status,
      if (testDurationInMinutes != null)
        'testDurationInMinutes': testDurationInMinutes,
      if (testId != null) 'testId': testId,
      if (virtualInterfaceId != null) 'virtualInterfaceId': virtualInterfaceId,
    };
  }
}

class VirtualInterfaces {
  /// The virtual interfaces
  final List<VirtualInterface>? virtualInterfaces;

  VirtualInterfaces({
    this.virtualInterfaces,
  });

  factory VirtualInterfaces.fromJson(Map<String, dynamic> json) {
    return VirtualInterfaces(
      virtualInterfaces: (json['virtualInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => VirtualInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final virtualInterfaces = this.virtualInterfaces;
    return {
      if (virtualInterfaces != null) 'virtualInterfaces': virtualInterfaces,
    };
  }
}

class DirectConnectClientException extends _s.GenericAwsException {
  DirectConnectClientException({String? type, String? message})
      : super(
            type: type, code: 'DirectConnectClientException', message: message);
}

class DirectConnectServerException extends _s.GenericAwsException {
  DirectConnectServerException({String? type, String? message})
      : super(
            type: type, code: 'DirectConnectServerException', message: message);
}

class DuplicateTagKeysException extends _s.GenericAwsException {
  DuplicateTagKeysException({String? type, String? message})
      : super(type: type, code: 'DuplicateTagKeysException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
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
