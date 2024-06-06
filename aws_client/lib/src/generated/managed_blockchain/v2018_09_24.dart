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

/// <p/>
/// Amazon Managed Blockchain is a fully managed service for creating and
/// managing blockchain networks using open-source frameworks. Blockchain allows
/// you to build applications where multiple parties can securely and
/// transparently run transactions and share data without the need for a
/// trusted, central authority.
///
/// Managed Blockchain supports the Hyperledger Fabric and Ethereum open-source
/// frameworks. Because of fundamental differences between the frameworks, some
/// API actions or data types may only apply in the context of one framework and
/// not the other. For example, actions related to Hyperledger Fabric network
/// members such as <code>CreateMember</code> and <code>DeleteMember</code>
/// don't apply to Ethereum.
///
/// The description for each action indicates the framework or frameworks to
/// which it applies. Data types and properties that apply only in the context
/// of a particular framework are similarly indicated.
class ManagedBlockchain {
  final _s.RestJsonProtocol _protocol;
  ManagedBlockchain({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'managedblockchain',
            signingName: 'managedblockchain',
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

  /// Creates a new accessor for use with Amazon Managed Blockchain service that
  /// supports token based access. The accessor contains information required
  /// for token based access.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [accessorType] :
  /// The type of accessor.
  /// <note>
  /// Currently, accessor type is restricted to <code>BILLING_TOKEN</code>.
  /// </note>
  ///
  /// Parameter [clientRequestToken] :
  /// This is a unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than once. This identifier is required only if you make a service request
  /// directly using an HTTP client. It is generated automatically if you use an
  /// Amazon Web Services SDK or the Amazon Web Services CLI.
  ///
  /// Parameter [networkType] :
  /// The blockchain network that the <code>Accessor</code> token is created
  /// for.
  /// <note>
  /// <ul>
  /// <li>
  /// Use the actual <code>networkType</code> value for the blockchain network
  /// that you are creating the <code>Accessor</code> token for.
  /// </li>
  /// <li>
  /// With the shut down of the <i>Ethereum Goerli</i> and <i>Polygon Mumbai
  /// Testnet</i> networks the following <code>networkType</code> values are no
  /// longer available for selection and use.
  ///
  /// <ul>
  /// <li>
  /// <code>ETHEREUM_MAINNET_AND_GOERLI</code>
  /// </li>
  /// <li>
  /// <code>ETHEREUM_GOERLI</code>
  /// </li>
  /// <li>
  /// <code>POLYGON_MUMBAI</code>
  /// </li>
  /// </ul>
  /// However, your existing <code>Accessor</code> tokens with these
  /// <code>networkType</code> values will remain unchanged.
  /// </li>
  /// </ul> </note>
  ///
  /// Parameter [tags] :
  /// Tags to assign to the Accessor.
  ///
  /// Each tag consists of a key and an optional value. You can specify multiple
  /// key-value pairs in a single request with an overall maximum of 50 tags
  /// allowed per resource.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  Future<CreateAccessorOutput> createAccessor({
    required AccessorType accessorType,
    String? clientRequestToken,
    AccessorNetworkType? networkType,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AccessorType': accessorType.toValue(),
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (networkType != null) 'NetworkType': networkType.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accessors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccessorOutput.fromJson(response);
  }

  /// Creates a member within a Managed Blockchain network.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [invitationId] :
  /// The unique identifier of the invitation that is sent to the member to join
  /// the network.
  ///
  /// Parameter [memberConfiguration] :
  /// Member configuration parameters.
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network in which the member is created.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than one time. This identifier is required only if you make a service
  /// request directly using an HTTP client. It is generated automatically if
  /// you use an Amazon Web Services SDK or the CLI.
  Future<CreateMemberOutput> createMember({
    required String invitationId,
    required MemberConfiguration memberConfiguration,
    required String networkId,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'InvitationId': invitationId,
      'MemberConfiguration': memberConfiguration,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/members',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMemberOutput.fromJson(response);
  }

  /// Creates a new blockchain network using Amazon Managed Blockchain.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [framework] :
  /// The blockchain framework that the network uses.
  ///
  /// Parameter [frameworkVersion] :
  /// The version of the blockchain framework that the network uses.
  ///
  /// Parameter [memberConfiguration] :
  /// Configuration properties for the first member within the network.
  ///
  /// Parameter [name] :
  /// The name of the network.
  ///
  /// Parameter [votingPolicy] :
  /// The voting rules used by the network to determine if a proposal is
  /// approved.
  ///
  /// Parameter [clientRequestToken] :
  /// This is a unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than once. This identifier is required only if you make a service request
  /// directly using an HTTP client. It is generated automatically if you use an
  /// Amazon Web Services SDK or the Amazon Web Services CLI.
  ///
  /// Parameter [description] :
  /// An optional description for the network.
  ///
  /// Parameter [frameworkConfiguration] :
  /// Configuration properties of the blockchain framework relevant to the
  /// network configuration.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the network.
  ///
  /// Each tag consists of a key and an optional value. You can specify multiple
  /// key-value pairs in a single request with an overall maximum of 50 tags
  /// allowed per resource.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  Future<CreateNetworkOutput> createNetwork({
    required Framework framework,
    required String frameworkVersion,
    required MemberConfiguration memberConfiguration,
    required String name,
    required VotingPolicy votingPolicy,
    String? clientRequestToken,
    String? description,
    NetworkFrameworkConfiguration? frameworkConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Framework': framework.toValue(),
      'FrameworkVersion': frameworkVersion,
      'MemberConfiguration': memberConfiguration,
      'Name': name,
      'VotingPolicy': votingPolicy,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (frameworkConfiguration != null)
        'FrameworkConfiguration': frameworkConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNetworkOutput.fromJson(response);
  }

  /// Creates a node on the specified blockchain network.
  ///
  /// Applies to Hyperledger Fabric and Ethereum.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network for the node.
  ///
  /// Ethereum public networks have the following <code>NetworkId</code>s:
  ///
  /// <ul>
  /// <li>
  /// <code>n-ethereum-mainnet</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [nodeConfiguration] :
  /// The properties of a node configuration.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than one time. This identifier is required only if you make a service
  /// request directly using an HTTP client. It is generated automatically if
  /// you use an Amazon Web Services SDK or the CLI.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member that owns this node.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the node.
  ///
  /// Each tag consists of a key and an optional value. You can specify multiple
  /// key-value pairs in a single request with an overall maximum of 50 tags
  /// allowed per resource.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  Future<CreateNodeOutput> createNode({
    required String networkId,
    required NodeConfiguration nodeConfiguration,
    String? clientRequestToken,
    String? memberId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'NodeConfiguration': nodeConfiguration,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (memberId != null) 'MemberId': memberId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/nodes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNodeOutput.fromJson(response);
  }

  /// Creates a proposal for a change to the network that other members of the
  /// network can vote on, for example, a proposal to add a new member to the
  /// network. Any member can create a proposal.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [actions] :
  /// The type of actions proposed, such as inviting a member or removing a
  /// member. The types of <code>Actions</code> in a proposal are mutually
  /// exclusive. For example, a proposal with <code>Invitations</code> actions
  /// cannot also contain <code>Removals</code> actions.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member that is creating the proposal. This
  /// identifier is especially useful for identifying the member making the
  /// proposal when multiple members exist in a single Amazon Web Services
  /// account.
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network for which the proposal is made.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than one time. This identifier is required only if you make a service
  /// request directly using an HTTP client. It is generated automatically if
  /// you use an Amazon Web Services SDK or the CLI.
  ///
  /// Parameter [description] :
  /// A description for the proposal that is visible to voting members, for
  /// example, "Proposal to add Example Corp. as member."
  ///
  /// Parameter [tags] :
  /// Tags to assign to the proposal.
  ///
  /// Each tag consists of a key and an optional value. You can specify multiple
  /// key-value pairs in a single request with an overall maximum of 50 tags
  /// allowed per resource.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  Future<CreateProposalOutput> createProposal({
    required ProposalActions actions,
    required String memberId,
    required String networkId,
    String? clientRequestToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Actions': actions,
      'MemberId': memberId,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/proposals',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProposalOutput.fromJson(response);
  }

  /// Deletes an accessor that your Amazon Web Services account owns. An
  /// accessor object is a container that has the information required for token
  /// based access to your Ethereum nodes including, the
  /// <code>BILLING_TOKEN</code>. After an accessor is deleted, the status of
  /// the accessor changes from <code>AVAILABLE</code> to
  /// <code>PENDING_DELETION</code>. An accessor in the
  /// <code>PENDING_DELETION</code> state can’t be used for new WebSocket
  /// requests or HTTP requests. However, WebSocket connections that were
  /// initiated while the accessor was in the <code>AVAILABLE</code> state
  /// remain open until they expire (up to 2 hours).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [accessorId] :
  /// The unique identifier of the accessor.
  Future<void> deleteAccessor({
    required String accessorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/accessors/${Uri.encodeComponent(accessorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a member. Deleting a member removes the member and all associated
  /// resources from the network. <code>DeleteMember</code> can only be called
  /// for a specified <code>MemberId</code> if the principal performing the
  /// action is associated with the Amazon Web Services account that owns the
  /// member. In all other cases, the <code>DeleteMember</code> action is
  /// carried out as the result of an approved proposal to remove a member. If
  /// <code>MemberId</code> is the last member in a network specified by the
  /// last Amazon Web Services account, the network is deleted also.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member to remove.
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network from which the member is removed.
  Future<void> deleteMember({
    required String memberId,
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/members/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a node that your Amazon Web Services account owns. All data on the
  /// node is lost and cannot be recovered.
  ///
  /// Applies to Hyperledger Fabric and Ethereum.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network that the node is on.
  ///
  /// Ethereum public networks have the following <code>NetworkId</code>s:
  ///
  /// <ul>
  /// <li>
  /// <code>n-ethereum-mainnet</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [nodeId] :
  /// The unique identifier of the node.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member that owns this node.
  ///
  /// Applies only to Hyperledger Fabric and is required for Hyperledger Fabric.
  Future<void> deleteNode({
    required String networkId,
    required String nodeId,
    String? memberId,
  }) async {
    final $query = <String, List<String>>{
      if (memberId != null) 'memberId': [memberId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/nodes/${Uri.encodeComponent(nodeId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns detailed information about an accessor. An accessor object is a
  /// container that has the information required for token based access to your
  /// Ethereum nodes.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [accessorId] :
  /// The unique identifier of the accessor.
  Future<GetAccessorOutput> getAccessor({
    required String accessorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accessors/${Uri.encodeComponent(accessorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccessorOutput.fromJson(response);
  }

  /// Returns detailed information about a member.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member.
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network to which the member belongs.
  Future<GetMemberOutput> getMember({
    required String memberId,
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/members/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMemberOutput.fromJson(response);
  }

  /// Returns detailed information about a network.
  ///
  /// Applies to Hyperledger Fabric and Ethereum.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network to get information about.
  Future<GetNetworkOutput> getNetwork({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkOutput.fromJson(response);
  }

  /// Returns detailed information about a node.
  ///
  /// Applies to Hyperledger Fabric and Ethereum.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network that the node is on.
  ///
  /// Parameter [nodeId] :
  /// The unique identifier of the node.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member that owns the node.
  ///
  /// Applies only to Hyperledger Fabric and is required for Hyperledger Fabric.
  Future<GetNodeOutput> getNode({
    required String networkId,
    required String nodeId,
    String? memberId,
  }) async {
    final $query = <String, List<String>>{
      if (memberId != null) 'memberId': [memberId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/nodes/${Uri.encodeComponent(nodeId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetNodeOutput.fromJson(response);
  }

  /// Returns detailed information about a proposal.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network for which the proposal is made.
  ///
  /// Parameter [proposalId] :
  /// The unique identifier of the proposal.
  Future<GetProposalOutput> getProposal({
    required String networkId,
    required String proposalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/proposals/${Uri.encodeComponent(proposalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProposalOutput.fromJson(response);
  }

  /// Returns a list of the accessors and their properties. Accessor objects are
  /// containers that have the information required for token based access to
  /// your Ethereum nodes.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of accessors to list.
  ///
  /// Parameter [networkType] :
  /// The blockchain network that the <code>Accessor</code> token is created
  /// for.
  /// <note>
  /// Use the value <code>ETHEREUM_MAINNET_AND_GOERLI</code> for all existing
  /// <code>Accessors</code> tokens that were created before the
  /// <code>networkType</code> property was introduced.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListAccessorsOutput> listAccessors({
    int? maxResults,
    AccessorNetworkType? networkType,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (networkType != null) 'networkType': [networkType.toValue()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accessors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccessorsOutput.fromJson(response);
  }

  /// Returns a list of all invitations for the current Amazon Web Services
  /// account.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of invitations to return.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListInvitationsOutput> listInvitations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/invitations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInvitationsOutput.fromJson(response);
  }

  /// Returns a list of the members in a network and properties of their
  /// configurations.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network for which to list members.
  ///
  /// Parameter [isOwned] :
  /// An optional Boolean value. If provided, the request is limited either to
  /// members that the current Amazon Web Services account owns
  /// (<code>true</code>) or that other Amazon Web Services accountsn own
  /// (<code>false</code>). If omitted, all members are listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of members to return in the request.
  ///
  /// Parameter [name] :
  /// The optional name of the member to list.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [status] :
  /// An optional status specifier. If provided, only members currently in this
  /// status are listed.
  Future<ListMembersOutput> listMembers({
    required String networkId,
    bool? isOwned,
    int? maxResults,
    String? name,
    String? nextToken,
    MemberStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (isOwned != null) 'isOwned': [isOwned.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMembersOutput.fromJson(response);
  }

  /// Returns information about the networks in which the current Amazon Web
  /// Services account participates.
  ///
  /// Applies to Hyperledger Fabric and Ethereum.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [framework] :
  /// An optional framework specifier. If provided, only networks of this
  /// framework type are listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of networks to list.
  ///
  /// Parameter [name] :
  /// The name of the network.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [status] :
  /// An optional status specifier. If provided, only networks currently in this
  /// status are listed.
  ///
  /// Applies only to Hyperledger Fabric.
  Future<ListNetworksOutput> listNetworks({
    Framework? framework,
    int? maxResults,
    String? name,
    String? nextToken,
    NetworkStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $query = <String, List<String>>{
      if (framework != null) 'framework': [framework.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworksOutput.fromJson(response);
  }

  /// Returns information about the nodes within a network.
  ///
  /// Applies to Hyperledger Fabric and Ethereum.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network for which to list nodes.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of nodes to list.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member who owns the nodes to list.
  ///
  /// Applies only to Hyperledger Fabric and is required for Hyperledger Fabric.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [status] :
  /// An optional status specifier. If provided, only nodes currently in this
  /// status are listed.
  Future<ListNodesOutput> listNodes({
    required String networkId,
    int? maxResults,
    String? memberId,
    String? nextToken,
    NodeStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (memberId != null) 'memberId': [memberId],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/nodes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNodesOutput.fromJson(response);
  }

  /// Returns the list of votes for a specified proposal, including the value of
  /// each vote and the unique identifier of the member that cast the vote.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network.
  ///
  /// Parameter [proposalId] :
  /// The unique identifier of the proposal.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of votes to return.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListProposalVotesOutput> listProposalVotes({
    required String networkId,
    required String proposalId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/proposals/${Uri.encodeComponent(proposalId)}/votes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProposalVotesOutput.fromJson(response);
  }

  /// Returns a list of proposals for the network.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of proposals to return.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListProposalsOutput> listProposals({
    required String networkId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/proposals',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProposalsOutput.fromJson(response);
  }

  /// Returns a list of tags for the specified resource. Each tag consists of a
  /// key and optional value.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
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

  /// Rejects an invitation to join a network. This action can be called by a
  /// principal in an Amazon Web Services account that has received an
  /// invitation to create a member and join a network.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [IllegalActionException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [invitationId] :
  /// The unique identifier of the invitation to reject.
  Future<void> rejectInvitation({
    required String invitationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/invitations/${Uri.encodeComponent(invitationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds or overwrites the specified tags for the specified Amazon Managed
  /// Blockchain resource. Each tag consists of a key and optional value.
  ///
  /// When you specify a tag key that already exists, the tag value is
  /// overwritten with the new value. Use <code>UntagResource</code> to remove
  /// tag keys.
  ///
  /// A resource can have up to 50 tags. If you try to create more than 50 tags
  /// for a resource, your request fails and returns an error.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the specified resource. Tag values can be empty, for
  /// example, <code>"MyTagKey" : ""</code>. You can specify multiple key-value
  /// pairs in a single request, with an overall maximum of 50 tags added to
  /// each resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
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

  /// Removes the specified tags from the Amazon Managed Blockchain resource.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  ///
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
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

  /// Updates a member configuration with new parameters.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member.
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the Managed Blockchain network to which the
  /// member belongs.
  ///
  /// Parameter [logPublishingConfiguration] :
  /// Configuration properties for publishing to Amazon CloudWatch Logs.
  Future<void> updateMember({
    required String memberId,
    required String networkId,
    MemberLogPublishingConfiguration? logPublishingConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (logPublishingConfiguration != null)
        'LogPublishingConfiguration': logPublishingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/members/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a node configuration with new parameters.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network that the node is on.
  ///
  /// Parameter [nodeId] :
  /// The unique identifier of the node.
  ///
  /// Parameter [logPublishingConfiguration] :
  /// Configuration properties for publishing to Amazon CloudWatch Logs.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member that owns the node.
  ///
  /// Applies only to Hyperledger Fabric.
  Future<void> updateNode({
    required String networkId,
    required String nodeId,
    NodeLogPublishingConfiguration? logPublishingConfiguration,
    String? memberId,
  }) async {
    final $payload = <String, dynamic>{
      if (logPublishingConfiguration != null)
        'LogPublishingConfiguration': logPublishingConfiguration,
      if (memberId != null) 'MemberId': memberId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/nodes/${Uri.encodeComponent(nodeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Casts a vote for a specified <code>ProposalId</code> on behalf of a
  /// member. The member to vote as, specified by <code>VoterMemberId</code>,
  /// must be in the same Amazon Web Services account as the principal that
  /// calls the action.
  ///
  /// Applies only to Hyperledger Fabric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [IllegalActionException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network.
  ///
  /// Parameter [proposalId] :
  /// The unique identifier of the proposal.
  ///
  /// Parameter [vote] :
  /// The value of the vote.
  ///
  /// Parameter [voterMemberId] :
  /// The unique identifier of the member casting the vote.
  Future<void> voteOnProposal({
    required String networkId,
    required String proposalId,
    required VoteValue vote,
    required String voterMemberId,
  }) async {
    final $payload = <String, dynamic>{
      'Vote': vote.toValue(),
      'VoterMemberId': voterMemberId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/proposals/${Uri.encodeComponent(proposalId)}/votes',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// The properties of the Accessor.
class Accessor {
  /// The Amazon Resource Name (ARN) of the accessor. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The billing token is a property of the Accessor. Use this token to when
  /// making calls to the blockchain network. The billing token is used to track
  /// your accessor token for billing requests.
  final String? billingToken;

  /// The creation date and time of the accessor.
  final DateTime? creationDate;

  /// The unique identifier of the accessor.
  final String? id;

  /// The blockchain network that the Accessor token is created for.
  final AccessorNetworkType? networkType;

  /// The current status of the accessor.
  final AccessorStatus? status;

  /// The tags assigned to the Accessor.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  final Map<String, String>? tags;

  /// The type of the accessor.
  /// <note>
  /// Currently, accessor type is restricted to <code>BILLING_TOKEN</code>.
  /// </note>
  final AccessorType? type;

  Accessor({
    this.arn,
    this.billingToken,
    this.creationDate,
    this.id,
    this.networkType,
    this.status,
    this.tags,
    this.type,
  });

  factory Accessor.fromJson(Map<String, dynamic> json) {
    return Accessor(
      arn: json['Arn'] as String?,
      billingToken: json['BillingToken'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      id: json['Id'] as String?,
      networkType: (json['NetworkType'] as String?)?.toAccessorNetworkType(),
      status: (json['Status'] as String?)?.toAccessorStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toAccessorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final billingToken = this.billingToken;
    final creationDate = this.creationDate;
    final id = this.id;
    final networkType = this.networkType;
    final status = this.status;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (billingToken != null) 'BillingToken': billingToken,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (id != null) 'Id': id,
      if (networkType != null) 'NetworkType': networkType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AccessorNetworkType {
  ethereumGoerli,
  ethereumMainnet,
  ethereumMainnetAndGoerli,
  polygonMainnet,
  polygonMumbai,
}

extension AccessorNetworkTypeValueExtension on AccessorNetworkType {
  String toValue() {
    switch (this) {
      case AccessorNetworkType.ethereumGoerli:
        return 'ETHEREUM_GOERLI';
      case AccessorNetworkType.ethereumMainnet:
        return 'ETHEREUM_MAINNET';
      case AccessorNetworkType.ethereumMainnetAndGoerli:
        return 'ETHEREUM_MAINNET_AND_GOERLI';
      case AccessorNetworkType.polygonMainnet:
        return 'POLYGON_MAINNET';
      case AccessorNetworkType.polygonMumbai:
        return 'POLYGON_MUMBAI';
    }
  }
}

extension AccessorNetworkTypeFromString on String {
  AccessorNetworkType toAccessorNetworkType() {
    switch (this) {
      case 'ETHEREUM_GOERLI':
        return AccessorNetworkType.ethereumGoerli;
      case 'ETHEREUM_MAINNET':
        return AccessorNetworkType.ethereumMainnet;
      case 'ETHEREUM_MAINNET_AND_GOERLI':
        return AccessorNetworkType.ethereumMainnetAndGoerli;
      case 'POLYGON_MAINNET':
        return AccessorNetworkType.polygonMainnet;
      case 'POLYGON_MUMBAI':
        return AccessorNetworkType.polygonMumbai;
    }
    throw Exception('$this is not known in enum AccessorNetworkType');
  }
}

enum AccessorStatus {
  available,
  pendingDeletion,
  deleted,
}

extension AccessorStatusValueExtension on AccessorStatus {
  String toValue() {
    switch (this) {
      case AccessorStatus.available:
        return 'AVAILABLE';
      case AccessorStatus.pendingDeletion:
        return 'PENDING_DELETION';
      case AccessorStatus.deleted:
        return 'DELETED';
    }
  }
}

extension AccessorStatusFromString on String {
  AccessorStatus toAccessorStatus() {
    switch (this) {
      case 'AVAILABLE':
        return AccessorStatus.available;
      case 'PENDING_DELETION':
        return AccessorStatus.pendingDeletion;
      case 'DELETED':
        return AccessorStatus.deleted;
    }
    throw Exception('$this is not known in enum AccessorStatus');
  }
}

/// A summary of accessor properties.
class AccessorSummary {
  /// The Amazon Resource Name (ARN) of the accessor. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The creation date and time of the accessor.
  final DateTime? creationDate;

  /// The unique identifier of the accessor.
  final String? id;

  /// The blockchain network that the Accessor token is created for.
  final AccessorNetworkType? networkType;

  /// The current status of the accessor.
  final AccessorStatus? status;

  /// The type of the accessor.
  /// <note>
  /// Currently accessor type is restricted to <code>BILLING_TOKEN</code>.
  /// </note>
  final AccessorType? type;

  AccessorSummary({
    this.arn,
    this.creationDate,
    this.id,
    this.networkType,
    this.status,
    this.type,
  });

  factory AccessorSummary.fromJson(Map<String, dynamic> json) {
    return AccessorSummary(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      id: json['Id'] as String?,
      networkType: (json['NetworkType'] as String?)?.toAccessorNetworkType(),
      status: (json['Status'] as String?)?.toAccessorStatus(),
      type: (json['Type'] as String?)?.toAccessorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final id = this.id;
    final networkType = this.networkType;
    final status = this.status;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (id != null) 'Id': id,
      if (networkType != null) 'NetworkType': networkType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AccessorType {
  billingToken,
}

extension AccessorTypeValueExtension on AccessorType {
  String toValue() {
    switch (this) {
      case AccessorType.billingToken:
        return 'BILLING_TOKEN';
    }
  }
}

extension AccessorTypeFromString on String {
  AccessorType toAccessorType() {
    switch (this) {
      case 'BILLING_TOKEN':
        return AccessorType.billingToken;
    }
    throw Exception('$this is not known in enum AccessorType');
  }
}

/// A policy type that defines the voting rules for the network. The rules
/// decide if a proposal is approved. Approval may be based on criteria such as
/// the percentage of <code>YES</code> votes and the duration of the proposal.
/// The policy applies to all proposals and is specified when the network is
/// created.
///
/// Applies only to Hyperledger Fabric.
class ApprovalThresholdPolicy {
  /// The duration from the time that a proposal is created until it expires. If
  /// members cast neither the required number of <code>YES</code> votes to
  /// approve the proposal nor the number of <code>NO</code> votes required to
  /// reject it before the duration expires, the proposal is <code>EXPIRED</code>
  /// and <code>ProposalActions</code> aren't carried out.
  final int? proposalDurationInHours;

  /// Determines whether the vote percentage must be greater than the
  /// <code>ThresholdPercentage</code> or must be greater than or equal to the
  /// <code>ThresholdPercentage</code> to be approved.
  final ThresholdComparator? thresholdComparator;

  /// The percentage of votes among all members that must be <code>YES</code> for
  /// a proposal to be approved. For example, a <code>ThresholdPercentage</code>
  /// value of <code>50</code> indicates 50%. The <code>ThresholdComparator</code>
  /// determines the precise comparison. If a <code>ThresholdPercentage</code>
  /// value of <code>50</code> is specified on a network with 10 members, along
  /// with a <code>ThresholdComparator</code> value of <code>GREATER_THAN</code>,
  /// this indicates that 6 <code>YES</code> votes are required for the proposal
  /// to be approved.
  final int? thresholdPercentage;

  ApprovalThresholdPolicy({
    this.proposalDurationInHours,
    this.thresholdComparator,
    this.thresholdPercentage,
  });

  factory ApprovalThresholdPolicy.fromJson(Map<String, dynamic> json) {
    return ApprovalThresholdPolicy(
      proposalDurationInHours: json['ProposalDurationInHours'] as int?,
      thresholdComparator:
          (json['ThresholdComparator'] as String?)?.toThresholdComparator(),
      thresholdPercentage: json['ThresholdPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final proposalDurationInHours = this.proposalDurationInHours;
    final thresholdComparator = this.thresholdComparator;
    final thresholdPercentage = this.thresholdPercentage;
    return {
      if (proposalDurationInHours != null)
        'ProposalDurationInHours': proposalDurationInHours,
      if (thresholdComparator != null)
        'ThresholdComparator': thresholdComparator.toValue(),
      if (thresholdPercentage != null)
        'ThresholdPercentage': thresholdPercentage,
    };
  }
}

class CreateAccessorOutput {
  /// The unique identifier of the accessor.
  final String? accessorId;

  /// The billing token is a property of the Accessor. Use this token to when
  /// making calls to the blockchain network. The billing token is used to track
  /// your accessor token for billing requests.
  final String? billingToken;

  /// The blockchain network that the accessor token is created for.
  final AccessorNetworkType? networkType;

  CreateAccessorOutput({
    this.accessorId,
    this.billingToken,
    this.networkType,
  });

  factory CreateAccessorOutput.fromJson(Map<String, dynamic> json) {
    return CreateAccessorOutput(
      accessorId: json['AccessorId'] as String?,
      billingToken: json['BillingToken'] as String?,
      networkType: (json['NetworkType'] as String?)?.toAccessorNetworkType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accessorId = this.accessorId;
    final billingToken = this.billingToken;
    final networkType = this.networkType;
    return {
      if (accessorId != null) 'AccessorId': accessorId,
      if (billingToken != null) 'BillingToken': billingToken,
      if (networkType != null) 'NetworkType': networkType.toValue(),
    };
  }
}

class CreateMemberOutput {
  /// The unique identifier of the member.
  final String? memberId;

  CreateMemberOutput({
    this.memberId,
  });

  factory CreateMemberOutput.fromJson(Map<String, dynamic> json) {
    return CreateMemberOutput(
      memberId: json['MemberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberId = this.memberId;
    return {
      if (memberId != null) 'MemberId': memberId,
    };
  }
}

class CreateNetworkOutput {
  /// The unique identifier for the first member within the network.
  final String? memberId;

  /// The unique identifier for the network.
  final String? networkId;

  CreateNetworkOutput({
    this.memberId,
    this.networkId,
  });

  factory CreateNetworkOutput.fromJson(Map<String, dynamic> json) {
    return CreateNetworkOutput(
      memberId: json['MemberId'] as String?,
      networkId: json['NetworkId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberId = this.memberId;
    final networkId = this.networkId;
    return {
      if (memberId != null) 'MemberId': memberId,
      if (networkId != null) 'NetworkId': networkId,
    };
  }
}

class CreateNodeOutput {
  /// The unique identifier of the node.
  final String? nodeId;

  CreateNodeOutput({
    this.nodeId,
  });

  factory CreateNodeOutput.fromJson(Map<String, dynamic> json) {
    return CreateNodeOutput(
      nodeId: json['NodeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nodeId = this.nodeId;
    return {
      if (nodeId != null) 'NodeId': nodeId,
    };
  }
}

class CreateProposalOutput {
  /// The unique identifier of the proposal.
  final String? proposalId;

  CreateProposalOutput({
    this.proposalId,
  });

  factory CreateProposalOutput.fromJson(Map<String, dynamic> json) {
    return CreateProposalOutput(
      proposalId: json['ProposalId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final proposalId = this.proposalId;
    return {
      if (proposalId != null) 'ProposalId': proposalId,
    };
  }
}

class DeleteAccessorOutput {
  DeleteAccessorOutput();

  factory DeleteAccessorOutput.fromJson(Map<String, dynamic> _) {
    return DeleteAccessorOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMemberOutput {
  DeleteMemberOutput();

  factory DeleteMemberOutput.fromJson(Map<String, dynamic> _) {
    return DeleteMemberOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteNodeOutput {
  DeleteNodeOutput();

  factory DeleteNodeOutput.fromJson(Map<String, dynamic> _) {
    return DeleteNodeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum Edition {
  starter,
  standard,
}

extension EditionValueExtension on Edition {
  String toValue() {
    switch (this) {
      case Edition.starter:
        return 'STARTER';
      case Edition.standard:
        return 'STANDARD';
    }
  }
}

extension EditionFromString on String {
  Edition toEdition() {
    switch (this) {
      case 'STARTER':
        return Edition.starter;
      case 'STANDARD':
        return Edition.standard;
    }
    throw Exception('$this is not known in enum Edition');
  }
}

enum Framework {
  hyperledgerFabric,
  ethereum,
}

extension FrameworkValueExtension on Framework {
  String toValue() {
    switch (this) {
      case Framework.hyperledgerFabric:
        return 'HYPERLEDGER_FABRIC';
      case Framework.ethereum:
        return 'ETHEREUM';
    }
  }
}

extension FrameworkFromString on String {
  Framework toFramework() {
    switch (this) {
      case 'HYPERLEDGER_FABRIC':
        return Framework.hyperledgerFabric;
      case 'ETHEREUM':
        return Framework.ethereum;
    }
    throw Exception('$this is not known in enum Framework');
  }
}

class GetAccessorOutput {
  /// The properties of the accessor.
  final Accessor? accessor;

  GetAccessorOutput({
    this.accessor,
  });

  factory GetAccessorOutput.fromJson(Map<String, dynamic> json) {
    return GetAccessorOutput(
      accessor: json['Accessor'] != null
          ? Accessor.fromJson(json['Accessor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessor = this.accessor;
    return {
      if (accessor != null) 'Accessor': accessor,
    };
  }
}

class GetMemberOutput {
  /// The properties of a member.
  final Member? member;

  GetMemberOutput({
    this.member,
  });

  factory GetMemberOutput.fromJson(Map<String, dynamic> json) {
    return GetMemberOutput(
      member: json['Member'] != null
          ? Member.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'Member': member,
    };
  }
}

class GetNetworkOutput {
  /// An object containing network configuration parameters.
  final Network? network;

  GetNetworkOutput({
    this.network,
  });

  factory GetNetworkOutput.fromJson(Map<String, dynamic> json) {
    return GetNetworkOutput(
      network: json['Network'] != null
          ? Network.fromJson(json['Network'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final network = this.network;
    return {
      if (network != null) 'Network': network,
    };
  }
}

class GetNodeOutput {
  /// Properties of the node configuration.
  final Node? node;

  GetNodeOutput({
    this.node,
  });

  factory GetNodeOutput.fromJson(Map<String, dynamic> json) {
    return GetNodeOutput(
      node: json['Node'] != null
          ? Node.fromJson(json['Node'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final node = this.node;
    return {
      if (node != null) 'Node': node,
    };
  }
}

class GetProposalOutput {
  /// Information about a proposal.
  final Proposal? proposal;

  GetProposalOutput({
    this.proposal,
  });

  factory GetProposalOutput.fromJson(Map<String, dynamic> json) {
    return GetProposalOutput(
      proposal: json['Proposal'] != null
          ? Proposal.fromJson(json['Proposal'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proposal = this.proposal;
    return {
      if (proposal != null) 'Proposal': proposal,
    };
  }
}

/// An invitation to an Amazon Web Services account to create a member and join
/// the network.
///
/// Applies only to Hyperledger Fabric.
class Invitation {
  /// The Amazon Resource Name (ARN) of the invitation. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The date and time that the invitation was created.
  final DateTime? creationDate;

  /// The date and time that the invitation expires. This is the
  /// <code>CreationDate</code> plus the <code>ProposalDurationInHours</code> that
  /// is specified in the <code>ProposalThresholdPolicy</code>. After this date
  /// and time, the invitee can no longer create a member and join the network
  /// using this <code>InvitationId</code>.
  final DateTime? expirationDate;

  /// The unique identifier for the invitation.
  final String? invitationId;
  final NetworkSummary? networkSummary;

  /// The status of the invitation:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - The invitee hasn't created a member to join the
  /// network, and the invitation hasn't yet expired.
  /// </li>
  /// <li>
  /// <code>ACCEPTING</code> - The invitee has begun creating a member, and
  /// creation hasn't yet completed.
  /// </li>
  /// <li>
  /// <code>ACCEPTED</code> - The invitee created a member and joined the network
  /// using the <code>InvitationID</code>.
  /// </li>
  /// <li>
  /// <code>REJECTED</code> - The invitee rejected the invitation.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> - The invitee neither created a member nor rejected the
  /// invitation before the <code>ExpirationDate</code>.
  /// </li>
  /// </ul>
  final InvitationStatus? status;

  Invitation({
    this.arn,
    this.creationDate,
    this.expirationDate,
    this.invitationId,
    this.networkSummary,
    this.status,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) {
    return Invitation(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      invitationId: json['InvitationId'] as String?,
      networkSummary: json['NetworkSummary'] != null
          ? NetworkSummary.fromJson(
              json['NetworkSummary'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toInvitationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final expirationDate = this.expirationDate;
    final invitationId = this.invitationId;
    final networkSummary = this.networkSummary;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (expirationDate != null)
        'ExpirationDate': iso8601ToJson(expirationDate),
      if (invitationId != null) 'InvitationId': invitationId,
      if (networkSummary != null) 'NetworkSummary': networkSummary,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum InvitationStatus {
  pending,
  accepted,
  accepting,
  rejected,
  expired,
}

extension InvitationStatusValueExtension on InvitationStatus {
  String toValue() {
    switch (this) {
      case InvitationStatus.pending:
        return 'PENDING';
      case InvitationStatus.accepted:
        return 'ACCEPTED';
      case InvitationStatus.accepting:
        return 'ACCEPTING';
      case InvitationStatus.rejected:
        return 'REJECTED';
      case InvitationStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension InvitationStatusFromString on String {
  InvitationStatus toInvitationStatus() {
    switch (this) {
      case 'PENDING':
        return InvitationStatus.pending;
      case 'ACCEPTED':
        return InvitationStatus.accepted;
      case 'ACCEPTING':
        return InvitationStatus.accepting;
      case 'REJECTED':
        return InvitationStatus.rejected;
      case 'EXPIRED':
        return InvitationStatus.expired;
    }
    throw Exception('$this is not known in enum InvitationStatus');
  }
}

/// An action to invite a specific Amazon Web Services account to create a
/// member and join the network. The <code>InviteAction</code> is carried out
/// when a <code>Proposal</code> is <code>APPROVED</code>.
///
/// Applies only to Hyperledger Fabric.
class InviteAction {
  /// The Amazon Web Services account ID to invite.
  final String principal;

  InviteAction({
    required this.principal,
  });

  factory InviteAction.fromJson(Map<String, dynamic> json) {
    return InviteAction(
      principal: json['Principal'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final principal = this.principal;
    return {
      'Principal': principal,
    };
  }
}

class ListAccessorsOutput {
  /// An array of AccessorSummary objects that contain configuration properties
  /// for each accessor.
  final List<AccessorSummary>? accessors;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListAccessorsOutput({
    this.accessors,
    this.nextToken,
  });

  factory ListAccessorsOutput.fromJson(Map<String, dynamic> json) {
    return ListAccessorsOutput(
      accessors: (json['Accessors'] as List?)
          ?.whereNotNull()
          .map((e) => AccessorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessors = this.accessors;
    final nextToken = this.nextToken;
    return {
      if (accessors != null) 'Accessors': accessors,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListInvitationsOutput {
  /// The invitations for the network.
  final List<Invitation>? invitations;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListInvitationsOutput({
    this.invitations,
    this.nextToken,
  });

  factory ListInvitationsOutput.fromJson(Map<String, dynamic> json) {
    return ListInvitationsOutput(
      invitations: (json['Invitations'] as List?)
          ?.whereNotNull()
          .map((e) => Invitation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invitations = this.invitations;
    final nextToken = this.nextToken;
    return {
      if (invitations != null) 'Invitations': invitations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMembersOutput {
  /// An array of <code>MemberSummary</code> objects. Each object contains details
  /// about a network member.
  final List<MemberSummary>? members;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListMembersOutput({
    this.members,
    this.nextToken,
  });

  factory ListMembersOutput.fromJson(Map<String, dynamic> json) {
    return ListMembersOutput(
      members: (json['Members'] as List?)
          ?.whereNotNull()
          .map((e) => MemberSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      if (members != null) 'Members': members,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListNetworksOutput {
  /// An array of <code>NetworkSummary</code> objects that contain configuration
  /// properties for each network.
  final List<NetworkSummary>? networks;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListNetworksOutput({
    this.networks,
    this.nextToken,
  });

  factory ListNetworksOutput.fromJson(Map<String, dynamic> json) {
    return ListNetworksOutput(
      networks: (json['Networks'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networks = this.networks;
    final nextToken = this.nextToken;
    return {
      if (networks != null) 'Networks': networks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListNodesOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  /// An array of <code>NodeSummary</code> objects that contain configuration
  /// properties for each node.
  final List<NodeSummary>? nodes;

  ListNodesOutput({
    this.nextToken,
    this.nodes,
  });

  factory ListNodesOutput.fromJson(Map<String, dynamic> json) {
    return ListNodesOutput(
      nextToken: json['NextToken'] as String?,
      nodes: (json['Nodes'] as List?)
          ?.whereNotNull()
          .map((e) => NodeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final nodes = this.nodes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (nodes != null) 'Nodes': nodes,
    };
  }
}

class ListProposalVotesOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  /// The list of votes.
  final List<VoteSummary>? proposalVotes;

  ListProposalVotesOutput({
    this.nextToken,
    this.proposalVotes,
  });

  factory ListProposalVotesOutput.fromJson(Map<String, dynamic> json) {
    return ListProposalVotesOutput(
      nextToken: json['NextToken'] as String?,
      proposalVotes: (json['ProposalVotes'] as List?)
          ?.whereNotNull()
          .map((e) => VoteSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final proposalVotes = this.proposalVotes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (proposalVotes != null) 'ProposalVotes': proposalVotes,
    };
  }
}

class ListProposalsOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  /// The summary of each proposal made on the network.
  final List<ProposalSummary>? proposals;

  ListProposalsOutput({
    this.nextToken,
    this.proposals,
  });

  factory ListProposalsOutput.fromJson(Map<String, dynamic> json) {
    return ListProposalsOutput(
      nextToken: json['NextToken'] as String?,
      proposals: (json['Proposals'] as List?)
          ?.whereNotNull()
          .map((e) => ProposalSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final proposals = this.proposals;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (proposals != null) 'Proposals': proposals,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags assigned to the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A configuration for logging events.
class LogConfiguration {
  /// Indicates whether logging is enabled.
  final bool? enabled;

  LogConfiguration({
    this.enabled,
  });

  factory LogConfiguration.fromJson(Map<String, dynamic> json) {
    return LogConfiguration(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// A collection of log configurations.
class LogConfigurations {
  /// Parameters for publishing logs to Amazon CloudWatch Logs.
  final LogConfiguration? cloudwatch;

  LogConfigurations({
    this.cloudwatch,
  });

  factory LogConfigurations.fromJson(Map<String, dynamic> json) {
    return LogConfigurations(
      cloudwatch: json['Cloudwatch'] != null
          ? LogConfiguration.fromJson(
              json['Cloudwatch'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudwatch = this.cloudwatch;
    return {
      if (cloudwatch != null) 'Cloudwatch': cloudwatch,
    };
  }
}

/// Member configuration properties.
///
/// Applies only to Hyperledger Fabric.
class Member {
  /// The Amazon Resource Name (ARN) of the member. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The date and time that the member was created.
  final DateTime? creationDate;

  /// An optional description for the member.
  final String? description;

  /// Attributes relevant to a member for the blockchain framework that the
  /// Managed Blockchain network uses.
  final MemberFrameworkAttributes? frameworkAttributes;

  /// The unique identifier of the member.
  final String? id;

  /// The Amazon Resource Name (ARN) of the customer managed key in Key Management
  /// Service (KMS) that the member uses for encryption at rest. If the value of
  /// this parameter is <code>"AWS Owned KMS Key"</code>, the member uses an
  /// Amazon Web Services owned KMS key for encryption. This parameter is
  /// inherited by the nodes that this member owns.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/managed-blockchain-encryption-at-rest.html">Encryption
  /// at Rest</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric Developer
  /// Guide</i>.
  final String? kmsKeyArn;

  /// Configuration properties for logging events associated with a member.
  final MemberLogPublishingConfiguration? logPublishingConfiguration;

  /// The name of the member.
  final String? name;

  /// The unique identifier of the network to which the member belongs.
  final String? networkId;

  /// The status of a member.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The Amazon Web Services account is in the process of
  /// creating a member.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The member has been created and can participate in
  /// the network.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> - The Amazon Web Services account attempted to
  /// create a member and creation failed.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The member is in the process of being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The member and all associated resources are in the
  /// process of being deleted. Either the Amazon Web Services account that owns
  /// the member deleted it, or the member is being deleted as the result of an
  /// <code>APPROVED</code> <code>PROPOSAL</code> to remove the member.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - The member can no longer participate on the network
  /// and all associated resources are deleted. Either the Amazon Web Services
  /// account that owns the member deleted it, or the member is being deleted as
  /// the result of an <code>APPROVED</code> <code>PROPOSAL</code> to remove the
  /// member.
  /// </li>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_KEY</code> - The member is impaired and might
  /// not function as expected because it cannot access the specified customer
  /// managed key in KMS for encryption at rest. Either the KMS key was disabled
  /// or deleted, or the grants on the key were revoked.
  ///
  /// The effect of disabling or deleting a key or of revoking a grant isn't
  /// immediate. It might take some time for the member resource to discover that
  /// the key is inaccessible. When a resource is in this state, we recommend
  /// deleting and recreating the resource.
  /// </li>
  /// </ul>
  final MemberStatus? status;

  /// Tags assigned to the member. Tags consist of a key and optional value.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  final Map<String, String>? tags;

  Member({
    this.arn,
    this.creationDate,
    this.description,
    this.frameworkAttributes,
    this.id,
    this.kmsKeyArn,
    this.logPublishingConfiguration,
    this.name,
    this.networkId,
    this.status,
    this.tags,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      frameworkAttributes: json['FrameworkAttributes'] != null
          ? MemberFrameworkAttributes.fromJson(
              json['FrameworkAttributes'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      logPublishingConfiguration: json['LogPublishingConfiguration'] != null
          ? MemberLogPublishingConfiguration.fromJson(
              json['LogPublishingConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      networkId: json['NetworkId'] as String?,
      status: (json['Status'] as String?)?.toMemberStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final frameworkAttributes = this.frameworkAttributes;
    final id = this.id;
    final kmsKeyArn = this.kmsKeyArn;
    final logPublishingConfiguration = this.logPublishingConfiguration;
    final name = this.name;
    final networkId = this.networkId;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (description != null) 'Description': description,
      if (frameworkAttributes != null)
        'FrameworkAttributes': frameworkAttributes,
      if (id != null) 'Id': id,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (logPublishingConfiguration != null)
        'LogPublishingConfiguration': logPublishingConfiguration,
      if (name != null) 'Name': name,
      if (networkId != null) 'NetworkId': networkId,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Configuration properties of the member.
///
/// Applies only to Hyperledger Fabric.
class MemberConfiguration {
  /// Configuration properties of the blockchain framework relevant to the member.
  final MemberFrameworkConfiguration frameworkConfiguration;

  /// The name of the member.
  final String name;

  /// An optional description of the member.
  final String? description;

  /// The Amazon Resource Name (ARN) of the customer managed key in Key Management
  /// Service (KMS) to use for encryption at rest in the member. This parameter is
  /// inherited by any nodes that this member creates. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/managed-blockchain-encryption-at-rest.html">Encryption
  /// at Rest</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric Developer
  /// Guide</i>.
  ///
  /// Use one of the following options to specify this parameter:
  ///
  /// <ul>
  /// <li>
  /// <b>Undefined or empty string</b> - By default, use an KMS key that is owned
  /// and managed by Amazon Web Services on your behalf.
  /// </li>
  /// <li>
  /// <b>A valid symmetric customer managed KMS key</b> - Use the specified KMS
  /// key in your account that you create, own, and manage.
  ///
  /// Amazon Managed Blockchain doesn't support asymmetric keys. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html">Using
  /// symmetric and asymmetric keys</a> in the <i>Key Management Service Developer
  /// Guide</i>.
  ///
  /// The following is an example of a KMS key ARN:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// </ul>
  final String? kmsKeyArn;

  /// Configuration properties for logging events associated with a member of a
  /// Managed Blockchain network.
  final MemberLogPublishingConfiguration? logPublishingConfiguration;

  /// Tags assigned to the member. Tags consist of a key and optional value.
  ///
  /// When specifying tags during creation, you can specify multiple key-value
  /// pairs in a single request, with an overall maximum of 50 tags added to each
  /// resource.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  final Map<String, String>? tags;

  MemberConfiguration({
    required this.frameworkConfiguration,
    required this.name,
    this.description,
    this.kmsKeyArn,
    this.logPublishingConfiguration,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final frameworkConfiguration = this.frameworkConfiguration;
    final name = this.name;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final logPublishingConfiguration = this.logPublishingConfiguration;
    final tags = this.tags;
    return {
      'FrameworkConfiguration': frameworkConfiguration,
      'Name': name,
      if (description != null) 'Description': description,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (logPublishingConfiguration != null)
        'LogPublishingConfiguration': logPublishingConfiguration,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Attributes of Hyperledger Fabric for a member in a Managed Blockchain
/// network using the Hyperledger Fabric framework.
class MemberFabricAttributes {
  /// The user name for the initial administrator user for the member.
  final String? adminUsername;

  /// The endpoint used to access the member's certificate authority.
  final String? caEndpoint;

  MemberFabricAttributes({
    this.adminUsername,
    this.caEndpoint,
  });

  factory MemberFabricAttributes.fromJson(Map<String, dynamic> json) {
    return MemberFabricAttributes(
      adminUsername: json['AdminUsername'] as String?,
      caEndpoint: json['CaEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adminUsername = this.adminUsername;
    final caEndpoint = this.caEndpoint;
    return {
      if (adminUsername != null) 'AdminUsername': adminUsername,
      if (caEndpoint != null) 'CaEndpoint': caEndpoint,
    };
  }
}

/// Configuration properties for Hyperledger Fabric for a member in a Managed
/// Blockchain network that is using the Hyperledger Fabric framework.
class MemberFabricConfiguration {
  /// The password for the member's initial administrative user. The
  /// <code>AdminPassword</code> must be at least 8 characters long and no more
  /// than 32 characters. It must contain at least one uppercase letter, one
  /// lowercase letter, and one digit. It cannot have a single quotation mark (‘),
  /// a double quotation marks (“), a forward slash(/), a backward slash(\), @, or
  /// a space.
  final String adminPassword;

  /// The user name for the member's initial administrative user.
  final String adminUsername;

  MemberFabricConfiguration({
    required this.adminPassword,
    required this.adminUsername,
  });

  Map<String, dynamic> toJson() {
    final adminPassword = this.adminPassword;
    final adminUsername = this.adminUsername;
    return {
      'AdminPassword': adminPassword,
      'AdminUsername': adminUsername,
    };
  }
}

/// Configuration properties for logging events associated with a member of a
/// Managed Blockchain network using the Hyperledger Fabric framework.
class MemberFabricLogPublishingConfiguration {
  /// Configuration properties for logging events associated with a member's
  /// Certificate Authority (CA). CA logs help you determine when a member in your
  /// account joins the network, or when new peers register with a member CA.
  final LogConfigurations? caLogs;

  MemberFabricLogPublishingConfiguration({
    this.caLogs,
  });

  factory MemberFabricLogPublishingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MemberFabricLogPublishingConfiguration(
      caLogs: json['CaLogs'] != null
          ? LogConfigurations.fromJson(json['CaLogs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final caLogs = this.caLogs;
    return {
      if (caLogs != null) 'CaLogs': caLogs,
    };
  }
}

/// Attributes relevant to a member for the blockchain framework that the
/// Managed Blockchain network uses.
class MemberFrameworkAttributes {
  /// Attributes of Hyperledger Fabric relevant to a member on a Managed
  /// Blockchain network that uses Hyperledger Fabric.
  final MemberFabricAttributes? fabric;

  MemberFrameworkAttributes({
    this.fabric,
  });

  factory MemberFrameworkAttributes.fromJson(Map<String, dynamic> json) {
    return MemberFrameworkAttributes(
      fabric: json['Fabric'] != null
          ? MemberFabricAttributes.fromJson(
              json['Fabric'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fabric = this.fabric;
    return {
      if (fabric != null) 'Fabric': fabric,
    };
  }
}

/// Configuration properties relevant to a member for the blockchain framework
/// that the Managed Blockchain network uses.
class MemberFrameworkConfiguration {
  /// Attributes of Hyperledger Fabric for a member on a Managed Blockchain
  /// network that uses Hyperledger Fabric.
  final MemberFabricConfiguration? fabric;

  MemberFrameworkConfiguration({
    this.fabric,
  });

  Map<String, dynamic> toJson() {
    final fabric = this.fabric;
    return {
      if (fabric != null) 'Fabric': fabric,
    };
  }
}

/// Configuration properties for logging events associated with a member of a
/// Managed Blockchain network.
class MemberLogPublishingConfiguration {
  /// Configuration properties for logging events associated with a member of a
  /// Managed Blockchain network using the Hyperledger Fabric framework.
  final MemberFabricLogPublishingConfiguration? fabric;

  MemberLogPublishingConfiguration({
    this.fabric,
  });

  factory MemberLogPublishingConfiguration.fromJson(Map<String, dynamic> json) {
    return MemberLogPublishingConfiguration(
      fabric: json['Fabric'] != null
          ? MemberFabricLogPublishingConfiguration.fromJson(
              json['Fabric'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fabric = this.fabric;
    return {
      if (fabric != null) 'Fabric': fabric,
    };
  }
}

enum MemberStatus {
  creating,
  available,
  createFailed,
  updating,
  deleting,
  deleted,
  inaccessibleEncryptionKey,
}

extension MemberStatusValueExtension on MemberStatus {
  String toValue() {
    switch (this) {
      case MemberStatus.creating:
        return 'CREATING';
      case MemberStatus.available:
        return 'AVAILABLE';
      case MemberStatus.createFailed:
        return 'CREATE_FAILED';
      case MemberStatus.updating:
        return 'UPDATING';
      case MemberStatus.deleting:
        return 'DELETING';
      case MemberStatus.deleted:
        return 'DELETED';
      case MemberStatus.inaccessibleEncryptionKey:
        return 'INACCESSIBLE_ENCRYPTION_KEY';
    }
  }
}

extension MemberStatusFromString on String {
  MemberStatus toMemberStatus() {
    switch (this) {
      case 'CREATING':
        return MemberStatus.creating;
      case 'AVAILABLE':
        return MemberStatus.available;
      case 'CREATE_FAILED':
        return MemberStatus.createFailed;
      case 'UPDATING':
        return MemberStatus.updating;
      case 'DELETING':
        return MemberStatus.deleting;
      case 'DELETED':
        return MemberStatus.deleted;
      case 'INACCESSIBLE_ENCRYPTION_KEY':
        return MemberStatus.inaccessibleEncryptionKey;
    }
    throw Exception('$this is not known in enum MemberStatus');
  }
}

/// A summary of configuration properties for a member.
///
/// Applies only to Hyperledger Fabric.
class MemberSummary {
  /// The Amazon Resource Name (ARN) of the member. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The date and time that the member was created.
  final DateTime? creationDate;

  /// An optional description of the member.
  final String? description;

  /// The unique identifier of the member.
  final String? id;

  /// An indicator of whether the member is owned by your Amazon Web Services
  /// account or a different Amazon Web Services account.
  final bool? isOwned;

  /// The name of the member.
  final String? name;

  /// The status of the member.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The Amazon Web Services account is in the process of
  /// creating a member.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The member has been created and can participate in
  /// the network.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> - The Amazon Web Services account attempted to
  /// create a member and creation failed.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The member is in the process of being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The member and all associated resources are in the
  /// process of being deleted. Either the Amazon Web Services account that owns
  /// the member deleted it, or the member is being deleted as the result of an
  /// <code>APPROVED</code> <code>PROPOSAL</code> to remove the member.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - The member can no longer participate on the network
  /// and all associated resources are deleted. Either the Amazon Web Services
  /// account that owns the member deleted it, or the member is being deleted as
  /// the result of an <code>APPROVED</code> <code>PROPOSAL</code> to remove the
  /// member.
  /// </li>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_KEY</code> - The member is impaired and might
  /// not function as expected because it cannot access the specified customer
  /// managed key in Key Management Service (KMS) for encryption at rest. Either
  /// the KMS key was disabled or deleted, or the grants on the key were revoked.
  ///
  /// The effect of disabling or deleting a key or of revoking a grant isn't
  /// immediate. It might take some time for the member resource to discover that
  /// the key is inaccessible. When a resource is in this state, we recommend
  /// deleting and recreating the resource.
  /// </li>
  /// </ul>
  final MemberStatus? status;

  MemberSummary({
    this.arn,
    this.creationDate,
    this.description,
    this.id,
    this.isOwned,
    this.name,
    this.status,
  });

  factory MemberSummary.fromJson(Map<String, dynamic> json) {
    return MemberSummary(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      isOwned: json['IsOwned'] as bool?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toMemberStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final id = this.id;
    final isOwned = this.isOwned;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (isOwned != null) 'IsOwned': isOwned,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Network configuration properties.
class Network {
  /// The Amazon Resource Name (ARN) of the network. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The date and time that the network was created.
  final DateTime? creationDate;

  /// Attributes of the blockchain framework for the network.
  final String? description;

  /// The blockchain framework that the network uses.
  final Framework? framework;

  /// Attributes of the blockchain framework that the network uses.
  final NetworkFrameworkAttributes? frameworkAttributes;

  /// The version of the blockchain framework that the network uses.
  final String? frameworkVersion;

  /// The unique identifier of the network.
  final String? id;

  /// The name of the network.
  final String? name;

  /// The current status of the network.
  final NetworkStatus? status;

  /// Tags assigned to the network. Each tag consists of a key and optional value.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  final Map<String, String>? tags;

  /// The voting rules that the network uses to decide if a proposal is accepted.
  final VotingPolicy? votingPolicy;

  /// The VPC endpoint service name of the VPC endpoint service of the network.
  /// Members use the VPC endpoint service name to create a VPC endpoint to access
  /// network resources.
  final String? vpcEndpointServiceName;

  Network({
    this.arn,
    this.creationDate,
    this.description,
    this.framework,
    this.frameworkAttributes,
    this.frameworkVersion,
    this.id,
    this.name,
    this.status,
    this.tags,
    this.votingPolicy,
    this.vpcEndpointServiceName,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      framework: (json['Framework'] as String?)?.toFramework(),
      frameworkAttributes: json['FrameworkAttributes'] != null
          ? NetworkFrameworkAttributes.fromJson(
              json['FrameworkAttributes'] as Map<String, dynamic>)
          : null,
      frameworkVersion: json['FrameworkVersion'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toNetworkStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      votingPolicy: json['VotingPolicy'] != null
          ? VotingPolicy.fromJson(json['VotingPolicy'] as Map<String, dynamic>)
          : null,
      vpcEndpointServiceName: json['VpcEndpointServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final framework = this.framework;
    final frameworkAttributes = this.frameworkAttributes;
    final frameworkVersion = this.frameworkVersion;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    final votingPolicy = this.votingPolicy;
    final vpcEndpointServiceName = this.vpcEndpointServiceName;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (description != null) 'Description': description,
      if (framework != null) 'Framework': framework.toValue(),
      if (frameworkAttributes != null)
        'FrameworkAttributes': frameworkAttributes,
      if (frameworkVersion != null) 'FrameworkVersion': frameworkVersion,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (votingPolicy != null) 'VotingPolicy': votingPolicy,
      if (vpcEndpointServiceName != null)
        'VpcEndpointServiceName': vpcEndpointServiceName,
    };
  }
}

/// Attributes of Ethereum for a network.
class NetworkEthereumAttributes {
  /// The Ethereum <code>CHAIN_ID</code> associated with the Ethereum network.
  /// Chain IDs are as follows:
  ///
  /// <ul>
  /// <li>
  /// mainnet = <code>1</code>
  /// </li>
  /// </ul>
  final String? chainId;

  NetworkEthereumAttributes({
    this.chainId,
  });

  factory NetworkEthereumAttributes.fromJson(Map<String, dynamic> json) {
    return NetworkEthereumAttributes(
      chainId: json['ChainId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chainId = this.chainId;
    return {
      if (chainId != null) 'ChainId': chainId,
    };
  }
}

/// Attributes of Hyperledger Fabric for a network.
class NetworkFabricAttributes {
  /// The edition of Amazon Managed Blockchain that Hyperledger Fabric uses. For
  /// more information, see <a
  /// href="http://aws.amazon.com/managed-blockchain/pricing/">Amazon Managed
  /// Blockchain Pricing</a>.
  final Edition? edition;

  /// The endpoint of the ordering service for the network.
  final String? orderingServiceEndpoint;

  NetworkFabricAttributes({
    this.edition,
    this.orderingServiceEndpoint,
  });

  factory NetworkFabricAttributes.fromJson(Map<String, dynamic> json) {
    return NetworkFabricAttributes(
      edition: (json['Edition'] as String?)?.toEdition(),
      orderingServiceEndpoint: json['OrderingServiceEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final edition = this.edition;
    final orderingServiceEndpoint = this.orderingServiceEndpoint;
    return {
      if (edition != null) 'Edition': edition.toValue(),
      if (orderingServiceEndpoint != null)
        'OrderingServiceEndpoint': orderingServiceEndpoint,
    };
  }
}

/// Hyperledger Fabric configuration properties for the network.
class NetworkFabricConfiguration {
  /// The edition of Amazon Managed Blockchain that the network uses. For more
  /// information, see <a
  /// href="http://aws.amazon.com/managed-blockchain/pricing/">Amazon Managed
  /// Blockchain Pricing</a>.
  final Edition edition;

  NetworkFabricConfiguration({
    required this.edition,
  });

  Map<String, dynamic> toJson() {
    final edition = this.edition;
    return {
      'Edition': edition.toValue(),
    };
  }
}

/// Attributes relevant to the network for the blockchain framework that the
/// network uses.
class NetworkFrameworkAttributes {
  /// Attributes of an Ethereum network for Managed Blockchain resources
  /// participating in an Ethereum network.
  final NetworkEthereumAttributes? ethereum;

  /// Attributes of Hyperledger Fabric for a Managed Blockchain network that uses
  /// Hyperledger Fabric.
  final NetworkFabricAttributes? fabric;

  NetworkFrameworkAttributes({
    this.ethereum,
    this.fabric,
  });

  factory NetworkFrameworkAttributes.fromJson(Map<String, dynamic> json) {
    return NetworkFrameworkAttributes(
      ethereum: json['Ethereum'] != null
          ? NetworkEthereumAttributes.fromJson(
              json['Ethereum'] as Map<String, dynamic>)
          : null,
      fabric: json['Fabric'] != null
          ? NetworkFabricAttributes.fromJson(
              json['Fabric'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ethereum = this.ethereum;
    final fabric = this.fabric;
    return {
      if (ethereum != null) 'Ethereum': ethereum,
      if (fabric != null) 'Fabric': fabric,
    };
  }
}

/// Configuration properties relevant to the network for the blockchain
/// framework that the network uses.
class NetworkFrameworkConfiguration {
  /// Hyperledger Fabric configuration properties for a Managed Blockchain network
  /// that uses Hyperledger Fabric.
  final NetworkFabricConfiguration? fabric;

  NetworkFrameworkConfiguration({
    this.fabric,
  });

  Map<String, dynamic> toJson() {
    final fabric = this.fabric;
    return {
      if (fabric != null) 'Fabric': fabric,
    };
  }
}

enum NetworkStatus {
  creating,
  available,
  createFailed,
  deleting,
  deleted,
}

extension NetworkStatusValueExtension on NetworkStatus {
  String toValue() {
    switch (this) {
      case NetworkStatus.creating:
        return 'CREATING';
      case NetworkStatus.available:
        return 'AVAILABLE';
      case NetworkStatus.createFailed:
        return 'CREATE_FAILED';
      case NetworkStatus.deleting:
        return 'DELETING';
      case NetworkStatus.deleted:
        return 'DELETED';
    }
  }
}

extension NetworkStatusFromString on String {
  NetworkStatus toNetworkStatus() {
    switch (this) {
      case 'CREATING':
        return NetworkStatus.creating;
      case 'AVAILABLE':
        return NetworkStatus.available;
      case 'CREATE_FAILED':
        return NetworkStatus.createFailed;
      case 'DELETING':
        return NetworkStatus.deleting;
      case 'DELETED':
        return NetworkStatus.deleted;
    }
    throw Exception('$this is not known in enum NetworkStatus');
  }
}

/// A summary of network configuration properties.
class NetworkSummary {
  /// The Amazon Resource Name (ARN) of the network. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The date and time that the network was created.
  final DateTime? creationDate;

  /// An optional description of the network.
  final String? description;

  /// The blockchain framework that the network uses.
  final Framework? framework;

  /// The version of the blockchain framework that the network uses.
  final String? frameworkVersion;

  /// The unique identifier of the network.
  final String? id;

  /// The name of the network.
  final String? name;

  /// The current status of the network.
  final NetworkStatus? status;

  NetworkSummary({
    this.arn,
    this.creationDate,
    this.description,
    this.framework,
    this.frameworkVersion,
    this.id,
    this.name,
    this.status,
  });

  factory NetworkSummary.fromJson(Map<String, dynamic> json) {
    return NetworkSummary(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      framework: (json['Framework'] as String?)?.toFramework(),
      frameworkVersion: json['FrameworkVersion'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toNetworkStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final framework = this.framework;
    final frameworkVersion = this.frameworkVersion;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (description != null) 'Description': description,
      if (framework != null) 'Framework': framework.toValue(),
      if (frameworkVersion != null) 'FrameworkVersion': frameworkVersion,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Configuration properties of a node.
class Node {
  /// The Amazon Resource Name (ARN) of the node. For more information about ARNs
  /// and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The Availability Zone in which the node exists. Required for Ethereum nodes.
  final String? availabilityZone;

  /// The date and time that the node was created.
  final DateTime? creationDate;

  /// Attributes of the blockchain framework being used.
  final NodeFrameworkAttributes? frameworkAttributes;

  /// The unique identifier of the node.
  final String? id;

  /// The instance type of the node.
  final String? instanceType;

  /// The Amazon Resource Name (ARN) of the customer managed key in Key Management
  /// Service (KMS) that the node uses for encryption at rest. If the value of
  /// this parameter is <code>"AWS Owned KMS Key"</code>, the node uses an Amazon
  /// Web Services owned KMS key for encryption. The node inherits this parameter
  /// from the member that it belongs to.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/managed-blockchain-encryption-at-rest.html">Encryption
  /// at Rest</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric Developer
  /// Guide</i>.
  ///
  /// Applies only to Hyperledger Fabric.
  final String? kmsKeyArn;

  /// Configuration properties for logging events associated with a peer node on a
  /// Hyperledger Fabric network on Managed Blockchain.
  final NodeLogPublishingConfiguration? logPublishingConfiguration;

  /// The unique identifier of the member to which the node belongs.
  ///
  /// Applies only to Hyperledger Fabric.
  final String? memberId;

  /// The unique identifier of the network that the node is on.
  final String? networkId;

  /// The state database that the node uses. Values are <code>LevelDB</code> or
  /// <code>CouchDB</code>.
  ///
  /// Applies only to Hyperledger Fabric.
  final StateDBType? stateDB;

  /// The status of the node.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The Amazon Web Services account is in the process of
  /// creating a node.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The node has been created and can participate in
  /// the network.
  /// </li>
  /// <li>
  /// <code>UNHEALTHY</code> - The node is impaired and might not function as
  /// expected. Amazon Managed Blockchain automatically finds nodes in this state
  /// and tries to recover them. If a node is recoverable, it returns to
  /// <code>AVAILABLE</code>. Otherwise, it moves to <code>FAILED</code> status.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> - The Amazon Web Services account attempted to
  /// create a node and creation failed.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The node is in the process of being updated.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The node is in the process of being deleted.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - The node can no longer participate on the network.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The node is no longer functional, cannot be recovered,
  /// and must be deleted.
  /// </li>
  /// <li>
  /// <code>INACCESSIBLE_ENCRYPTION_KEY</code> - The node is impaired and might
  /// not function as expected because it cannot access the specified customer
  /// managed key in KMS for encryption at rest. Either the KMS key was disabled
  /// or deleted, or the grants on the key were revoked.
  ///
  /// The effect of disabling or deleting a key or of revoking a grant isn't
  /// immediate. It might take some time for the node resource to discover that
  /// the key is inaccessible. When a resource is in this state, we recommend
  /// deleting and recreating the resource.
  /// </li>
  /// </ul>
  final NodeStatus? status;

  /// Tags assigned to the node. Each tag consists of a key and optional value.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  final Map<String, String>? tags;

  Node({
    this.arn,
    this.availabilityZone,
    this.creationDate,
    this.frameworkAttributes,
    this.id,
    this.instanceType,
    this.kmsKeyArn,
    this.logPublishingConfiguration,
    this.memberId,
    this.networkId,
    this.stateDB,
    this.status,
    this.tags,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      arn: json['Arn'] as String?,
      availabilityZone: json['AvailabilityZone'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      frameworkAttributes: json['FrameworkAttributes'] != null
          ? NodeFrameworkAttributes.fromJson(
              json['FrameworkAttributes'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      instanceType: json['InstanceType'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      logPublishingConfiguration: json['LogPublishingConfiguration'] != null
          ? NodeLogPublishingConfiguration.fromJson(
              json['LogPublishingConfiguration'] as Map<String, dynamic>)
          : null,
      memberId: json['MemberId'] as String?,
      networkId: json['NetworkId'] as String?,
      stateDB: (json['StateDB'] as String?)?.toStateDBType(),
      status: (json['Status'] as String?)?.toNodeStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final creationDate = this.creationDate;
    final frameworkAttributes = this.frameworkAttributes;
    final id = this.id;
    final instanceType = this.instanceType;
    final kmsKeyArn = this.kmsKeyArn;
    final logPublishingConfiguration = this.logPublishingConfiguration;
    final memberId = this.memberId;
    final networkId = this.networkId;
    final stateDB = this.stateDB;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (frameworkAttributes != null)
        'FrameworkAttributes': frameworkAttributes,
      if (id != null) 'Id': id,
      if (instanceType != null) 'InstanceType': instanceType,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (logPublishingConfiguration != null)
        'LogPublishingConfiguration': logPublishingConfiguration,
      if (memberId != null) 'MemberId': memberId,
      if (networkId != null) 'NetworkId': networkId,
      if (stateDB != null) 'StateDB': stateDB.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Configuration properties of a node.
class NodeConfiguration {
  /// The Amazon Managed Blockchain instance type for the node.
  final String instanceType;

  /// The Availability Zone in which the node exists. Required for Ethereum nodes.
  final String? availabilityZone;

  /// Configuration properties for logging events associated with a peer node on a
  /// Hyperledger Fabric network on Managed Blockchain.
  final NodeLogPublishingConfiguration? logPublishingConfiguration;

  /// The state database that the node uses. Values are <code>LevelDB</code> or
  /// <code>CouchDB</code>. When using an Amazon Managed Blockchain network with
  /// Hyperledger Fabric version 1.4 or later, the default is
  /// <code>CouchDB</code>.
  ///
  /// Applies only to Hyperledger Fabric.
  final StateDBType? stateDB;

  NodeConfiguration({
    required this.instanceType,
    this.availabilityZone,
    this.logPublishingConfiguration,
    this.stateDB,
  });

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    final availabilityZone = this.availabilityZone;
    final logPublishingConfiguration = this.logPublishingConfiguration;
    final stateDB = this.stateDB;
    return {
      'InstanceType': instanceType,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (logPublishingConfiguration != null)
        'LogPublishingConfiguration': logPublishingConfiguration,
      if (stateDB != null) 'StateDB': stateDB.toValue(),
    };
  }
}

/// Attributes of an Ethereum node.
class NodeEthereumAttributes {
  /// The endpoint on which the Ethereum node listens to run Ethereum API methods
  /// over HTTP connections from a client. Use this endpoint in client code for
  /// smart contracts when using an HTTP connection. Connections to this endpoint
  /// are authenticated using <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  final String? httpEndpoint;

  /// The endpoint on which the Ethereum node listens to run Ethereum JSON-RPC
  /// methods over WebSocket connections from a client. Use this endpoint in
  /// client code for smart contracts when using a WebSocket connection.
  /// Connections to this endpoint are authenticated using <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  final String? webSocketEndpoint;

  NodeEthereumAttributes({
    this.httpEndpoint,
    this.webSocketEndpoint,
  });

  factory NodeEthereumAttributes.fromJson(Map<String, dynamic> json) {
    return NodeEthereumAttributes(
      httpEndpoint: json['HttpEndpoint'] as String?,
      webSocketEndpoint: json['WebSocketEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final httpEndpoint = this.httpEndpoint;
    final webSocketEndpoint = this.webSocketEndpoint;
    return {
      if (httpEndpoint != null) 'HttpEndpoint': httpEndpoint,
      if (webSocketEndpoint != null) 'WebSocketEndpoint': webSocketEndpoint,
    };
  }
}

/// Attributes of Hyperledger Fabric for a peer node on a Hyperledger Fabric
/// network on Managed Blockchain.
class NodeFabricAttributes {
  /// The endpoint that identifies the peer node for all services except peer
  /// channel-based event services.
  final String? peerEndpoint;

  /// The endpoint that identifies the peer node for peer channel-based event
  /// services.
  final String? peerEventEndpoint;

  NodeFabricAttributes({
    this.peerEndpoint,
    this.peerEventEndpoint,
  });

  factory NodeFabricAttributes.fromJson(Map<String, dynamic> json) {
    return NodeFabricAttributes(
      peerEndpoint: json['PeerEndpoint'] as String?,
      peerEventEndpoint: json['PeerEventEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final peerEndpoint = this.peerEndpoint;
    final peerEventEndpoint = this.peerEventEndpoint;
    return {
      if (peerEndpoint != null) 'PeerEndpoint': peerEndpoint,
      if (peerEventEndpoint != null) 'PeerEventEndpoint': peerEventEndpoint,
    };
  }
}

/// Configuration properties for logging events associated with a peer node
/// owned by a member in a Managed Blockchain network.
class NodeFabricLogPublishingConfiguration {
  /// Configuration properties for logging events associated with chaincode
  /// execution on a peer node. Chaincode logs contain the results of
  /// instantiating, invoking, and querying the chaincode. A peer can run multiple
  /// instances of chaincode. When enabled, a log stream is created for all
  /// chaincodes, with an individual log stream for each chaincode.
  final LogConfigurations? chaincodeLogs;

  /// Configuration properties for a peer node log. Peer node logs contain
  /// messages generated when your client submits transaction proposals to peer
  /// nodes, requests to join channels, enrolls an admin peer, and lists the
  /// chaincode instances on a peer node.
  final LogConfigurations? peerLogs;

  NodeFabricLogPublishingConfiguration({
    this.chaincodeLogs,
    this.peerLogs,
  });

  factory NodeFabricLogPublishingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return NodeFabricLogPublishingConfiguration(
      chaincodeLogs: json['ChaincodeLogs'] != null
          ? LogConfigurations.fromJson(
              json['ChaincodeLogs'] as Map<String, dynamic>)
          : null,
      peerLogs: json['PeerLogs'] != null
          ? LogConfigurations.fromJson(json['PeerLogs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final chaincodeLogs = this.chaincodeLogs;
    final peerLogs = this.peerLogs;
    return {
      if (chaincodeLogs != null) 'ChaincodeLogs': chaincodeLogs,
      if (peerLogs != null) 'PeerLogs': peerLogs,
    };
  }
}

/// Attributes relevant to a node on a Managed Blockchain network for the
/// blockchain framework that the network uses.
class NodeFrameworkAttributes {
  /// Attributes of Ethereum for a node on a Managed Blockchain network that uses
  /// Ethereum.
  final NodeEthereumAttributes? ethereum;

  /// Attributes of Hyperledger Fabric for a peer node on a Managed Blockchain
  /// network that uses Hyperledger Fabric.
  final NodeFabricAttributes? fabric;

  NodeFrameworkAttributes({
    this.ethereum,
    this.fabric,
  });

  factory NodeFrameworkAttributes.fromJson(Map<String, dynamic> json) {
    return NodeFrameworkAttributes(
      ethereum: json['Ethereum'] != null
          ? NodeEthereumAttributes.fromJson(
              json['Ethereum'] as Map<String, dynamic>)
          : null,
      fabric: json['Fabric'] != null
          ? NodeFabricAttributes.fromJson(
              json['Fabric'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ethereum = this.ethereum;
    final fabric = this.fabric;
    return {
      if (ethereum != null) 'Ethereum': ethereum,
      if (fabric != null) 'Fabric': fabric,
    };
  }
}

/// Configuration properties for logging events associated with a peer node on a
/// Hyperledger Fabric network on Managed Blockchain.
class NodeLogPublishingConfiguration {
  /// Configuration properties for logging events associated with a node that is
  /// owned by a member of a Managed Blockchain network using the Hyperledger
  /// Fabric framework.
  final NodeFabricLogPublishingConfiguration? fabric;

  NodeLogPublishingConfiguration({
    this.fabric,
  });

  factory NodeLogPublishingConfiguration.fromJson(Map<String, dynamic> json) {
    return NodeLogPublishingConfiguration(
      fabric: json['Fabric'] != null
          ? NodeFabricLogPublishingConfiguration.fromJson(
              json['Fabric'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fabric = this.fabric;
    return {
      if (fabric != null) 'Fabric': fabric,
    };
  }
}

enum NodeStatus {
  creating,
  available,
  unhealthy,
  createFailed,
  updating,
  deleting,
  deleted,
  failed,
  inaccessibleEncryptionKey,
}

extension NodeStatusValueExtension on NodeStatus {
  String toValue() {
    switch (this) {
      case NodeStatus.creating:
        return 'CREATING';
      case NodeStatus.available:
        return 'AVAILABLE';
      case NodeStatus.unhealthy:
        return 'UNHEALTHY';
      case NodeStatus.createFailed:
        return 'CREATE_FAILED';
      case NodeStatus.updating:
        return 'UPDATING';
      case NodeStatus.deleting:
        return 'DELETING';
      case NodeStatus.deleted:
        return 'DELETED';
      case NodeStatus.failed:
        return 'FAILED';
      case NodeStatus.inaccessibleEncryptionKey:
        return 'INACCESSIBLE_ENCRYPTION_KEY';
    }
  }
}

extension NodeStatusFromString on String {
  NodeStatus toNodeStatus() {
    switch (this) {
      case 'CREATING':
        return NodeStatus.creating;
      case 'AVAILABLE':
        return NodeStatus.available;
      case 'UNHEALTHY':
        return NodeStatus.unhealthy;
      case 'CREATE_FAILED':
        return NodeStatus.createFailed;
      case 'UPDATING':
        return NodeStatus.updating;
      case 'DELETING':
        return NodeStatus.deleting;
      case 'DELETED':
        return NodeStatus.deleted;
      case 'FAILED':
        return NodeStatus.failed;
      case 'INACCESSIBLE_ENCRYPTION_KEY':
        return NodeStatus.inaccessibleEncryptionKey;
    }
    throw Exception('$this is not known in enum NodeStatus');
  }
}

/// A summary of configuration properties for a node.
class NodeSummary {
  /// The Amazon Resource Name (ARN) of the node. For more information about ARNs
  /// and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The Availability Zone in which the node exists.
  final String? availabilityZone;

  /// The date and time that the node was created.
  final DateTime? creationDate;

  /// The unique identifier of the node.
  final String? id;

  /// The EC2 instance type for the node.
  final String? instanceType;

  /// The status of the node.
  final NodeStatus? status;

  NodeSummary({
    this.arn,
    this.availabilityZone,
    this.creationDate,
    this.id,
    this.instanceType,
    this.status,
  });

  factory NodeSummary.fromJson(Map<String, dynamic> json) {
    return NodeSummary(
      arn: json['Arn'] as String?,
      availabilityZone: json['AvailabilityZone'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      id: json['Id'] as String?,
      instanceType: json['InstanceType'] as String?,
      status: (json['Status'] as String?)?.toNodeStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZone = this.availabilityZone;
    final creationDate = this.creationDate;
    final id = this.id;
    final instanceType = this.instanceType;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (id != null) 'Id': id,
      if (instanceType != null) 'InstanceType': instanceType,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Properties of a proposal on a Managed Blockchain network.
///
/// Applies only to Hyperledger Fabric.
class Proposal {
  /// The actions to perform on the network if the proposal is
  /// <code>APPROVED</code>.
  final ProposalActions? actions;

  /// The Amazon Resource Name (ARN) of the proposal. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The date and time that the proposal was created.
  final DateTime? creationDate;

  /// The description of the proposal.
  final String? description;

  /// The date and time that the proposal expires. This is the
  /// <code>CreationDate</code> plus the <code>ProposalDurationInHours</code> that
  /// is specified in the <code>ProposalThresholdPolicy</code>. After this date
  /// and time, if members haven't cast enough votes to determine the outcome
  /// according to the voting policy, the proposal is <code>EXPIRED</code> and
  /// <code>Actions</code> aren't carried out.
  final DateTime? expirationDate;

  /// The unique identifier of the network for which the proposal is made.
  final String? networkId;

  /// The current total of <code>NO</code> votes cast on the proposal by members.
  final int? noVoteCount;

  /// The number of votes remaining to be cast on the proposal by members. In
  /// other words, the number of members minus the sum of <code>YES</code> votes
  /// and <code>NO</code> votes.
  final int? outstandingVoteCount;

  /// The unique identifier of the proposal.
  final String? proposalId;

  /// The unique identifier of the member that created the proposal.
  final String? proposedByMemberId;

  /// The name of the member that created the proposal.
  final String? proposedByMemberName;

  /// The status of the proposal. Values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code> - The proposal is active and open for member
  /// voting.
  /// </li>
  /// <li>
  /// <code>APPROVED</code> - The proposal was approved with sufficient
  /// <code>YES</code> votes among members according to the
  /// <code>VotingPolicy</code> specified for the <code>Network</code>. The
  /// specified proposal actions are carried out.
  /// </li>
  /// <li>
  /// <code>REJECTED</code> - The proposal was rejected with insufficient
  /// <code>YES</code> votes among members according to the
  /// <code>VotingPolicy</code> specified for the <code>Network</code>. The
  /// specified <code>ProposalActions</code> aren't carried out.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> - Members didn't cast the number of votes required to
  /// determine the proposal outcome before the proposal expired. The specified
  /// <code>ProposalActions</code> aren't carried out.
  /// </li>
  /// <li>
  /// <code>ACTION_FAILED</code> - One or more of the specified
  /// <code>ProposalActions</code> in a proposal that was approved couldn't be
  /// completed because of an error. The <code>ACTION_FAILED</code> status occurs
  /// even if only one ProposalAction fails and other actions are successful.
  /// </li>
  /// </ul>
  final ProposalStatus? status;

  /// Tags assigned to the proposal. Each tag consists of a key and optional
  /// value.
  ///
  /// For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ethereum-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Ethereum Developer
  /// Guide</i>, or <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/hyperledger-fabric-dev/tagging-resources.html">Tagging
  /// Resources</a> in the <i>Amazon Managed Blockchain Hyperledger Fabric
  /// Developer Guide</i>.
  final Map<String, String>? tags;

  /// The current total of <code>YES</code> votes cast on the proposal by members.
  final int? yesVoteCount;

  Proposal({
    this.actions,
    this.arn,
    this.creationDate,
    this.description,
    this.expirationDate,
    this.networkId,
    this.noVoteCount,
    this.outstandingVoteCount,
    this.proposalId,
    this.proposedByMemberId,
    this.proposedByMemberName,
    this.status,
    this.tags,
    this.yesVoteCount,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      actions: json['Actions'] != null
          ? ProposalActions.fromJson(json['Actions'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      networkId: json['NetworkId'] as String?,
      noVoteCount: json['NoVoteCount'] as int?,
      outstandingVoteCount: json['OutstandingVoteCount'] as int?,
      proposalId: json['ProposalId'] as String?,
      proposedByMemberId: json['ProposedByMemberId'] as String?,
      proposedByMemberName: json['ProposedByMemberName'] as String?,
      status: (json['Status'] as String?)?.toProposalStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      yesVoteCount: json['YesVoteCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final expirationDate = this.expirationDate;
    final networkId = this.networkId;
    final noVoteCount = this.noVoteCount;
    final outstandingVoteCount = this.outstandingVoteCount;
    final proposalId = this.proposalId;
    final proposedByMemberId = this.proposedByMemberId;
    final proposedByMemberName = this.proposedByMemberName;
    final status = this.status;
    final tags = this.tags;
    final yesVoteCount = this.yesVoteCount;
    return {
      if (actions != null) 'Actions': actions,
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (description != null) 'Description': description,
      if (expirationDate != null)
        'ExpirationDate': iso8601ToJson(expirationDate),
      if (networkId != null) 'NetworkId': networkId,
      if (noVoteCount != null) 'NoVoteCount': noVoteCount,
      if (outstandingVoteCount != null)
        'OutstandingVoteCount': outstandingVoteCount,
      if (proposalId != null) 'ProposalId': proposalId,
      if (proposedByMemberId != null) 'ProposedByMemberId': proposedByMemberId,
      if (proposedByMemberName != null)
        'ProposedByMemberName': proposedByMemberName,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (yesVoteCount != null) 'YesVoteCount': yesVoteCount,
    };
  }
}

/// The actions to carry out if a proposal is <code>APPROVED</code>.
///
/// Applies only to Hyperledger Fabric.
class ProposalActions {
  /// The actions to perform for an <code>APPROVED</code> proposal to invite an
  /// Amazon Web Services account to create a member and join the network.
  final List<InviteAction>? invitations;

  /// The actions to perform for an <code>APPROVED</code> proposal to remove a
  /// member from the network, which deletes the member and all associated member
  /// resources from the network.
  final List<RemoveAction>? removals;

  ProposalActions({
    this.invitations,
    this.removals,
  });

  factory ProposalActions.fromJson(Map<String, dynamic> json) {
    return ProposalActions(
      invitations: (json['Invitations'] as List?)
          ?.whereNotNull()
          .map((e) => InviteAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      removals: (json['Removals'] as List?)
          ?.whereNotNull()
          .map((e) => RemoveAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invitations = this.invitations;
    final removals = this.removals;
    return {
      if (invitations != null) 'Invitations': invitations,
      if (removals != null) 'Removals': removals,
    };
  }
}

enum ProposalStatus {
  inProgress,
  approved,
  rejected,
  expired,
  actionFailed,
}

extension ProposalStatusValueExtension on ProposalStatus {
  String toValue() {
    switch (this) {
      case ProposalStatus.inProgress:
        return 'IN_PROGRESS';
      case ProposalStatus.approved:
        return 'APPROVED';
      case ProposalStatus.rejected:
        return 'REJECTED';
      case ProposalStatus.expired:
        return 'EXPIRED';
      case ProposalStatus.actionFailed:
        return 'ACTION_FAILED';
    }
  }
}

extension ProposalStatusFromString on String {
  ProposalStatus toProposalStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ProposalStatus.inProgress;
      case 'APPROVED':
        return ProposalStatus.approved;
      case 'REJECTED':
        return ProposalStatus.rejected;
      case 'EXPIRED':
        return ProposalStatus.expired;
      case 'ACTION_FAILED':
        return ProposalStatus.actionFailed;
    }
    throw Exception('$this is not known in enum ProposalStatus');
  }
}

/// Properties of a proposal.
///
/// Applies only to Hyperledger Fabric.
class ProposalSummary {
  /// The Amazon Resource Name (ARN) of the proposal. For more information about
  /// ARNs and their format, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final String? arn;

  /// The date and time that the proposal was created.
  final DateTime? creationDate;

  /// The description of the proposal.
  final String? description;

  /// The date and time that the proposal expires. This is the
  /// <code>CreationDate</code> plus the <code>ProposalDurationInHours</code> that
  /// is specified in the <code>ProposalThresholdPolicy</code>. After this date
  /// and time, if members haven't cast enough votes to determine the outcome
  /// according to the voting policy, the proposal is <code>EXPIRED</code> and
  /// <code>Actions</code> aren't carried out.
  final DateTime? expirationDate;

  /// The unique identifier of the proposal.
  final String? proposalId;

  /// The unique identifier of the member that created the proposal.
  final String? proposedByMemberId;

  /// The name of the member that created the proposal.
  final String? proposedByMemberName;

  /// The status of the proposal. Values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code> - The proposal is active and open for member
  /// voting.
  /// </li>
  /// <li>
  /// <code>APPROVED</code> - The proposal was approved with sufficient
  /// <code>YES</code> votes among members according to the
  /// <code>VotingPolicy</code> specified for the <code>Network</code>. The
  /// specified proposal actions are carried out.
  /// </li>
  /// <li>
  /// <code>REJECTED</code> - The proposal was rejected with insufficient
  /// <code>YES</code> votes among members according to the
  /// <code>VotingPolicy</code> specified for the <code>Network</code>. The
  /// specified <code>ProposalActions</code> aren't carried out.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> - Members didn't cast the number of votes required to
  /// determine the proposal outcome before the proposal expired. The specified
  /// <code>ProposalActions</code> aren't carried out.
  /// </li>
  /// <li>
  /// <code>ACTION_FAILED</code> - One or more of the specified
  /// <code>ProposalActions</code> in a proposal that was approved couldn't be
  /// completed because of an error.
  /// </li>
  /// </ul>
  final ProposalStatus? status;

  ProposalSummary({
    this.arn,
    this.creationDate,
    this.description,
    this.expirationDate,
    this.proposalId,
    this.proposedByMemberId,
    this.proposedByMemberName,
    this.status,
  });

  factory ProposalSummary.fromJson(Map<String, dynamic> json) {
    return ProposalSummary(
      arn: json['Arn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      proposalId: json['ProposalId'] as String?,
      proposedByMemberId: json['ProposedByMemberId'] as String?,
      proposedByMemberName: json['ProposedByMemberName'] as String?,
      status: (json['Status'] as String?)?.toProposalStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDate = this.creationDate;
    final description = this.description;
    final expirationDate = this.expirationDate;
    final proposalId = this.proposalId;
    final proposedByMemberId = this.proposedByMemberId;
    final proposedByMemberName = this.proposedByMemberName;
    final status = this.status;
    return {
      if (arn != null) 'Arn': arn,
      if (creationDate != null) 'CreationDate': iso8601ToJson(creationDate),
      if (description != null) 'Description': description,
      if (expirationDate != null)
        'ExpirationDate': iso8601ToJson(expirationDate),
      if (proposalId != null) 'ProposalId': proposalId,
      if (proposedByMemberId != null) 'ProposedByMemberId': proposedByMemberId,
      if (proposedByMemberName != null)
        'ProposedByMemberName': proposedByMemberName,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class RejectInvitationOutput {
  RejectInvitationOutput();

  factory RejectInvitationOutput.fromJson(Map<String, dynamic> _) {
    return RejectInvitationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An action to remove a member from a Managed Blockchain network as the result
/// of a removal proposal that is <code>APPROVED</code>. The member and all
/// associated resources are deleted from the network.
///
/// Applies only to Hyperledger Fabric.
class RemoveAction {
  /// The unique identifier of the member to remove.
  final String memberId;

  RemoveAction({
    required this.memberId,
  });

  factory RemoveAction.fromJson(Map<String, dynamic> json) {
    return RemoveAction(
      memberId: json['MemberId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final memberId = this.memberId;
    return {
      'MemberId': memberId,
    };
  }
}

enum StateDBType {
  levelDB,
  couchDB,
}

extension StateDBTypeValueExtension on StateDBType {
  String toValue() {
    switch (this) {
      case StateDBType.levelDB:
        return 'LevelDB';
      case StateDBType.couchDB:
        return 'CouchDB';
    }
  }
}

extension StateDBTypeFromString on String {
  StateDBType toStateDBType() {
    switch (this) {
      case 'LevelDB':
        return StateDBType.levelDB;
      case 'CouchDB':
        return StateDBType.couchDB;
    }
    throw Exception('$this is not known in enum StateDBType');
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

enum ThresholdComparator {
  greaterThan,
  greaterThanOrEqualTo,
}

extension ThresholdComparatorValueExtension on ThresholdComparator {
  String toValue() {
    switch (this) {
      case ThresholdComparator.greaterThan:
        return 'GREATER_THAN';
      case ThresholdComparator.greaterThanOrEqualTo:
        return 'GREATER_THAN_OR_EQUAL_TO';
    }
  }
}

extension ThresholdComparatorFromString on String {
  ThresholdComparator toThresholdComparator() {
    switch (this) {
      case 'GREATER_THAN':
        return ThresholdComparator.greaterThan;
      case 'GREATER_THAN_OR_EQUAL_TO':
        return ThresholdComparator.greaterThanOrEqualTo;
    }
    throw Exception('$this is not known in enum ThresholdComparator');
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

class UpdateMemberOutput {
  UpdateMemberOutput();

  factory UpdateMemberOutput.fromJson(Map<String, dynamic> _) {
    return UpdateMemberOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateNodeOutput {
  UpdateNodeOutput();

  factory UpdateNodeOutput.fromJson(Map<String, dynamic> _) {
    return UpdateNodeOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class VoteOnProposalOutput {
  VoteOnProposalOutput();

  factory VoteOnProposalOutput.fromJson(Map<String, dynamic> _) {
    return VoteOnProposalOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Properties of an individual vote that a member cast for a proposal.
///
/// Applies only to Hyperledger Fabric.
class VoteSummary {
  /// The unique identifier of the member that cast the vote.
  final String? memberId;

  /// The name of the member that cast the vote.
  final String? memberName;

  /// The vote value, either <code>YES</code> or <code>NO</code>.
  final VoteValue? vote;

  VoteSummary({
    this.memberId,
    this.memberName,
    this.vote,
  });

  factory VoteSummary.fromJson(Map<String, dynamic> json) {
    return VoteSummary(
      memberId: json['MemberId'] as String?,
      memberName: json['MemberName'] as String?,
      vote: (json['Vote'] as String?)?.toVoteValue(),
    );
  }

  Map<String, dynamic> toJson() {
    final memberId = this.memberId;
    final memberName = this.memberName;
    final vote = this.vote;
    return {
      if (memberId != null) 'MemberId': memberId,
      if (memberName != null) 'MemberName': memberName,
      if (vote != null) 'Vote': vote.toValue(),
    };
  }
}

enum VoteValue {
  yes,
  no,
}

extension VoteValueValueExtension on VoteValue {
  String toValue() {
    switch (this) {
      case VoteValue.yes:
        return 'YES';
      case VoteValue.no:
        return 'NO';
    }
  }
}

extension VoteValueFromString on String {
  VoteValue toVoteValue() {
    switch (this) {
      case 'YES':
        return VoteValue.yes;
      case 'NO':
        return VoteValue.no;
    }
    throw Exception('$this is not known in enum VoteValue');
  }
}

/// The voting rules for the network to decide if a proposal is accepted
///
/// Applies only to Hyperledger Fabric.
class VotingPolicy {
  /// Defines the rules for the network for voting on proposals, such as the
  /// percentage of <code>YES</code> votes required for the proposal to be
  /// approved and the duration of the proposal. The policy applies to all
  /// proposals and is specified when the network is created.
  final ApprovalThresholdPolicy? approvalThresholdPolicy;

  VotingPolicy({
    this.approvalThresholdPolicy,
  });

  factory VotingPolicy.fromJson(Map<String, dynamic> json) {
    return VotingPolicy(
      approvalThresholdPolicy: json['ApprovalThresholdPolicy'] != null
          ? ApprovalThresholdPolicy.fromJson(
              json['ApprovalThresholdPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final approvalThresholdPolicy = this.approvalThresholdPolicy;
    return {
      if (approvalThresholdPolicy != null)
        'ApprovalThresholdPolicy': approvalThresholdPolicy,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class IllegalActionException extends _s.GenericAwsException {
  IllegalActionException({String? type, String? message})
      : super(type: type, code: 'IllegalActionException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String? type, String? message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'IllegalActionException': (type, message) =>
      IllegalActionException(type: type, message: message),
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceNotReadyException': (type, message) =>
      ResourceNotReadyException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
