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

part '2018-09-24.g.dart';

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
/// members such as <code>CreateMember</code> and <code>DeleteMember</code> do
/// not apply to Ethereum.
///
/// The description for each action indicates the framework or frameworks to
/// which it applies. Data types and properties that apply only in the context
/// of a particular framework are similarly indicated.
class ManagedBlockchain {
  final _s.RestJsonProtocol _protocol;
  ManagedBlockchain({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'managedblockchain',
            signingName: 'managedblockchain',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than one time. This identifier is required only if you make a service
  /// request directly using an HTTP client. It is generated automatically if
  /// you use an AWS SDK or the AWS CLI.
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
  Future<CreateMemberOutput> createMember({
    @_s.required String clientRequestToken,
    @_s.required String invitationId,
    @_s.required MemberConfiguration memberConfiguration,
    @_s.required String networkId,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    _s.validateStringLength(
      'invitationId',
      invitationId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberConfiguration, 'memberConfiguration');
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'InvitationId': invitationId,
      'MemberConfiguration': memberConfiguration,
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
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than one time. This identifier is required only if you make a service
  /// request directly using an HTTP client. It is generated automatically if
  /// you use an AWS SDK or the AWS CLI.
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
  /// Parameter [description] :
  /// An optional description for the network.
  ///
  /// Parameter [frameworkConfiguration] :
  /// Configuration properties of the blockchain framework relevant to the
  /// network configuration.
  Future<CreateNetworkOutput> createNetwork({
    @_s.required String clientRequestToken,
    @_s.required Framework framework,
    @_s.required String frameworkVersion,
    @_s.required MemberConfiguration memberConfiguration,
    @_s.required String name,
    @_s.required VotingPolicy votingPolicy,
    String description,
    NetworkFrameworkConfiguration frameworkConfiguration,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(framework, 'framework');
    ArgumentError.checkNotNull(frameworkVersion, 'frameworkVersion');
    _s.validateStringLength(
      'frameworkVersion',
      frameworkVersion,
      1,
      8,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberConfiguration, 'memberConfiguration');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(votingPolicy, 'votingPolicy');
    _s.validateStringLength(
      'description',
      description,
      0,
      128,
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'Framework': framework?.toValue() ?? '',
      'FrameworkVersion': frameworkVersion,
      'MemberConfiguration': memberConfiguration,
      'Name': name,
      'VotingPolicy': votingPolicy,
      if (description != null) 'Description': description,
      if (frameworkConfiguration != null)
        'FrameworkConfiguration': frameworkConfiguration,
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
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than one time. This identifier is required only if you make a service
  /// request directly using an HTTP client. It is generated automatically if
  /// you use an AWS SDK or the AWS CLI.
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
  /// <li>
  /// <code>n-ethereum-rinkeby</code>
  /// </li>
  /// <li>
  /// <code>n-ethereum-ropsten</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [nodeConfiguration] :
  /// The properties of a node configuration.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member that owns this node.
  ///
  /// Applies only to Hyperledger Fabric.
  Future<CreateNodeOutput> createNode({
    @_s.required String clientRequestToken,
    @_s.required String networkId,
    @_s.required NodeConfiguration nodeConfiguration,
    String memberId,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(nodeConfiguration, 'nodeConfiguration');
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'NodeConfiguration': nodeConfiguration,
      if (memberId != null) 'MemberId': memberId,
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
  ///
  /// Parameter [actions] :
  /// The type of actions proposed, such as inviting a member or removing a
  /// member. The types of <code>Actions</code> in a proposal are mutually
  /// exclusive. For example, a proposal with <code>Invitations</code> actions
  /// cannot also contain <code>Removals</code> actions.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the operation. An idempotent operation completes no more
  /// than one time. This identifier is required only if you make a service
  /// request directly using an HTTP client. It is generated automatically if
  /// you use an AWS SDK or the AWS CLI.
  ///
  /// Parameter [memberId] :
  /// The unique identifier of the member that is creating the proposal. This
  /// identifier is especially useful for identifying the member making the
  /// proposal when multiple members exist in a single AWS account.
  ///
  /// Parameter [networkId] :
  /// The unique identifier of the network for which the proposal is made.
  ///
  /// Parameter [description] :
  /// A description for the proposal that is visible to voting members, for
  /// example, "Proposal to add Example Corp. as member."
  Future<CreateProposalOutput> createProposal({
    @_s.required ProposalActions actions,
    @_s.required String clientRequestToken,
    @_s.required String memberId,
    @_s.required String networkId,
    String description,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      128,
    );
    final $payload = <String, dynamic>{
      'Actions': actions,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'MemberId': memberId,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/proposals',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProposalOutput.fromJson(response);
  }

  /// Deletes a member. Deleting a member removes the member and all associated
  /// resources from the network. <code>DeleteMember</code> can only be called
  /// for a specified <code>MemberId</code> if the principal performing the
  /// action is associated with the AWS account that owns the member. In all
  /// other cases, the <code>DeleteMember</code> action is carried out as the
  /// result of an approved proposal to remove a member. If
  /// <code>MemberId</code> is the last member in a network specified by the
  /// last AWS account, the network is deleted also.
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
    @_s.required String memberId,
    @_s.required String networkId,
  }) async {
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/members/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMemberOutput.fromJson(response);
  }

  /// Deletes a node that your AWS account owns. All data on the node is lost
  /// and cannot be recovered.
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
  /// <li>
  /// <code>n-ethereum-rinkeby</code>
  /// </li>
  /// <li>
  /// <code>n-ethereum-ropsten</code>
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
    @_s.required String networkId,
    @_s.required String nodeId,
    String memberId,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(nodeId, 'nodeId');
    _s.validateStringLength(
      'nodeId',
      nodeId,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
    );
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
    return DeleteNodeOutput.fromJson(response);
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
    @_s.required String memberId,
    @_s.required String networkId,
  }) async {
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
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
    @_s.required String networkId,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
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
    @_s.required String networkId,
    @_s.required String nodeId,
    String memberId,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(nodeId, 'nodeId');
    _s.validateStringLength(
      'nodeId',
      nodeId,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
    );
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
    @_s.required String networkId,
    @_s.required String proposalId,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(proposalId, 'proposalId');
    _s.validateStringLength(
      'proposalId',
      proposalId,
      1,
      32,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/proposals/${Uri.encodeComponent(proposalId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProposalOutput.fromJson(response);
  }

  /// Returns a list of all invitations for the current AWS account.
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      128,
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
  /// members that the current AWS account owns (<code>true</code>) or that
  /// other AWS accounts own (<code>false</code>). If omitted, all members are
  /// listed.
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
    @_s.required String networkId,
    bool isOwned,
    int maxResults,
    String name,
    String nextToken,
    MemberStatus status,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      128,
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

  /// Returns information about the networks in which the current AWS account
  /// participates.
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
    Framework framework,
    int maxResults,
    String name,
    String nextToken,
    NetworkStatus status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      128,
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
    @_s.required String networkId,
    int maxResults,
    String memberId,
    String nextToken,
    NodeStatus status,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      128,
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
    @_s.required String networkId,
    @_s.required String proposalId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(proposalId, 'proposalId');
    _s.validateStringLength(
      'proposalId',
      proposalId,
      1,
      32,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      128,
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
    @_s.required String networkId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      128,
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

  /// Rejects an invitation to join a network. This action can be called by a
  /// principal in an AWS account that has received an invitation to create a
  /// member and join a network.
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
    @_s.required String invitationId,
  }) async {
    ArgumentError.checkNotNull(invitationId, 'invitationId');
    _s.validateStringLength(
      'invitationId',
      invitationId,
      1,
      32,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/invitations/${Uri.encodeComponent(invitationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RejectInvitationOutput.fromJson(response);
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
    @_s.required String memberId,
    @_s.required String networkId,
    MemberLogPublishingConfiguration logPublishingConfiguration,
  }) async {
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
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
    return UpdateMemberOutput.fromJson(response);
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
    @_s.required String networkId,
    @_s.required String nodeId,
    NodeLogPublishingConfiguration logPublishingConfiguration,
    String memberId,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(nodeId, 'nodeId');
    _s.validateStringLength(
      'nodeId',
      nodeId,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringLength(
      'memberId',
      memberId,
      1,
      32,
    );
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
    return UpdateNodeOutput.fromJson(response);
  }

  /// Casts a vote for a specified <code>ProposalId</code> on behalf of a
  /// member. The member to vote as, specified by <code>VoterMemberId</code>,
  /// must be in the same AWS account as the principal that calls the action.
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
    @_s.required String networkId,
    @_s.required String proposalId,
    @_s.required VoteValue vote,
    @_s.required String voterMemberId,
  }) async {
    ArgumentError.checkNotNull(networkId, 'networkId');
    _s.validateStringLength(
      'networkId',
      networkId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(proposalId, 'proposalId');
    _s.validateStringLength(
      'proposalId',
      proposalId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(vote, 'vote');
    ArgumentError.checkNotNull(voterMemberId, 'voterMemberId');
    _s.validateStringLength(
      'voterMemberId',
      voterMemberId,
      1,
      32,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Vote': vote?.toValue() ?? '',
      'VoterMemberId': voterMemberId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/proposals/${Uri.encodeComponent(proposalId)}/votes',
      exceptionFnMap: _exceptionFns,
    );
    return VoteOnProposalOutput.fromJson(response);
  }
}

/// A policy type that defines the voting rules for the network. The rules
/// decide if a proposal is approved. Approval may be based on criteria such as
/// the percentage of <code>YES</code> votes and the duration of the proposal.
/// The policy applies to all proposals and is specified when the network is
/// created.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ApprovalThresholdPolicy {
  /// The duration from the time that a proposal is created until it expires. If
  /// members cast neither the required number of <code>YES</code> votes to
  /// approve the proposal nor the number of <code>NO</code> votes required to
  /// reject it before the duration expires, the proposal is <code>EXPIRED</code>
  /// and <code>ProposalActions</code> are not carried out.
  @_s.JsonKey(name: 'ProposalDurationInHours')
  final int proposalDurationInHours;

  /// Determines whether the vote percentage must be greater than the
  /// <code>ThresholdPercentage</code> or must be greater than or equal to the
  /// <code>ThreholdPercentage</code> to be approved.
  @_s.JsonKey(name: 'ThresholdComparator')
  final ThresholdComparator thresholdComparator;

  /// The percentage of votes among all members that must be <code>YES</code> for
  /// a proposal to be approved. For example, a <code>ThresholdPercentage</code>
  /// value of <code>50</code> indicates 50%. The <code>ThresholdComparator</code>
  /// determines the precise comparison. If a <code>ThresholdPercentage</code>
  /// value of <code>50</code> is specified on a network with 10 members, along
  /// with a <code>ThresholdComparator</code> value of <code>GREATER_THAN</code>,
  /// this indicates that 6 <code>YES</code> votes are required for the proposal
  /// to be approved.
  @_s.JsonKey(name: 'ThresholdPercentage')
  final int thresholdPercentage;

  ApprovalThresholdPolicy({
    this.proposalDurationInHours,
    this.thresholdComparator,
    this.thresholdPercentage,
  });
  factory ApprovalThresholdPolicy.fromJson(Map<String, dynamic> json) =>
      _$ApprovalThresholdPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$ApprovalThresholdPolicyToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMemberOutput {
  /// The unique identifier of the member.
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  CreateMemberOutput({
    this.memberId,
  });
  factory CreateMemberOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateMemberOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNetworkOutput {
  /// The unique identifier for the first member within the network.
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  /// The unique identifier for the network.
  @_s.JsonKey(name: 'NetworkId')
  final String networkId;

  CreateNetworkOutput({
    this.memberId,
    this.networkId,
  });
  factory CreateNetworkOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateNetworkOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNodeOutput {
  /// The unique identifier of the node.
  @_s.JsonKey(name: 'NodeId')
  final String nodeId;

  CreateNodeOutput({
    this.nodeId,
  });
  factory CreateNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateNodeOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProposalOutput {
  /// The unique identifier of the proposal.
  @_s.JsonKey(name: 'ProposalId')
  final String proposalId;

  CreateProposalOutput({
    this.proposalId,
  });
  factory CreateProposalOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateProposalOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMemberOutput {
  DeleteMemberOutput();
  factory DeleteMemberOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteMemberOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNodeOutput {
  DeleteNodeOutput();
  factory DeleteNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteNodeOutputFromJson(json);
}

enum Edition {
  @_s.JsonValue('STARTER')
  starter,
  @_s.JsonValue('STANDARD')
  standard,
}

enum Framework {
  @_s.JsonValue('HYPERLEDGER_FABRIC')
  hyperledgerFabric,
  @_s.JsonValue('ETHEREUM')
  ethereum,
}

extension on Framework {
  String toValue() {
    switch (this) {
      case Framework.hyperledgerFabric:
        return 'HYPERLEDGER_FABRIC';
      case Framework.ethereum:
        return 'ETHEREUM';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMemberOutput {
  /// The properties of a member.
  @_s.JsonKey(name: 'Member')
  final Member member;

  GetMemberOutput({
    this.member,
  });
  factory GetMemberOutput.fromJson(Map<String, dynamic> json) =>
      _$GetMemberOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNetworkOutput {
  /// An object containing network configuration parameters.
  @_s.JsonKey(name: 'Network')
  final Network network;

  GetNetworkOutput({
    this.network,
  });
  factory GetNetworkOutput.fromJson(Map<String, dynamic> json) =>
      _$GetNetworkOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNodeOutput {
  /// Properties of the node configuration.
  @_s.JsonKey(name: 'Node')
  final Node node;

  GetNodeOutput({
    this.node,
  });
  factory GetNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$GetNodeOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProposalOutput {
  /// Information about a proposal.
  @_s.JsonKey(name: 'Proposal')
  final Proposal proposal;

  GetProposalOutput({
    this.proposal,
  });
  factory GetProposalOutput.fromJson(Map<String, dynamic> json) =>
      _$GetProposalOutputFromJson(json);
}

/// An invitation to an AWS account to create a member and join the network.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Invitation {
  /// The date and time that the invitation was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The date and time that the invitation expires. This is the
  /// <code>CreationDate</code> plus the <code>ProposalDurationInHours</code> that
  /// is specified in the <code>ProposalThresholdPolicy</code>. After this date
  /// and time, the invitee can no longer create a member and join the network
  /// using this <code>InvitationId</code>.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationDate')
  final DateTime expirationDate;

  /// The unique identifier for the invitation.
  @_s.JsonKey(name: 'InvitationId')
  final String invitationId;
  @_s.JsonKey(name: 'NetworkSummary')
  final NetworkSummary networkSummary;

  /// The status of the invitation:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - The invitee has not created a member to join the
  /// network, and the invitation has not yet expired.
  /// </li>
  /// <li>
  /// <code>ACCEPTING</code> - The invitee has begun creating a member, and
  /// creation has not yet completed.
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
  @_s.JsonKey(name: 'Status')
  final InvitationStatus status;

  Invitation({
    this.creationDate,
    this.expirationDate,
    this.invitationId,
    this.networkSummary,
    this.status,
  });
  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}

enum InvitationStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ACCEPTED')
  accepted,
  @_s.JsonValue('ACCEPTING')
  accepting,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// An action to invite a specific AWS account to create a member and join the
/// network. The <code>InviteAction</code> is carried out when a
/// <code>Proposal</code> is <code>APPROVED</code>.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InviteAction {
  /// The AWS account ID to invite.
  @_s.JsonKey(name: 'Principal')
  final String principal;

  InviteAction({
    @_s.required this.principal,
  });
  factory InviteAction.fromJson(Map<String, dynamic> json) =>
      _$InviteActionFromJson(json);

  Map<String, dynamic> toJson() => _$InviteActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInvitationsOutput {
  /// The invitations for the network.
  @_s.JsonKey(name: 'Invitations')
  final List<Invitation> invitations;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListInvitationsOutput({
    this.invitations,
    this.nextToken,
  });
  factory ListInvitationsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListInvitationsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMembersOutput {
  /// An array of <code>MemberSummary</code> objects. Each object contains details
  /// about a network member.
  @_s.JsonKey(name: 'Members')
  final List<MemberSummary> members;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMembersOutput({
    this.members,
    this.nextToken,
  });
  factory ListMembersOutput.fromJson(Map<String, dynamic> json) =>
      _$ListMembersOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNetworksOutput {
  /// An array of <code>NetworkSummary</code> objects that contain configuration
  /// properties for each network.
  @_s.JsonKey(name: 'Networks')
  final List<NetworkSummary> networks;

  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListNetworksOutput({
    this.networks,
    this.nextToken,
  });
  factory ListNetworksOutput.fromJson(Map<String, dynamic> json) =>
      _$ListNetworksOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNodesOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>NodeSummary</code> objects that contain configuration
  /// properties for each node.
  @_s.JsonKey(name: 'Nodes')
  final List<NodeSummary> nodes;

  ListNodesOutput({
    this.nextToken,
    this.nodes,
  });
  factory ListNodesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListNodesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProposalVotesOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of votes.
  @_s.JsonKey(name: 'ProposalVotes')
  final List<VoteSummary> proposalVotes;

  ListProposalVotesOutput({
    this.nextToken,
    this.proposalVotes,
  });
  factory ListProposalVotesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListProposalVotesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProposalsOutput {
  /// The pagination token that indicates the next set of results to retrieve.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The summary of each proposal made on the network.
  @_s.JsonKey(name: 'Proposals')
  final List<ProposalSummary> proposals;

  ListProposalsOutput({
    this.nextToken,
    this.proposals,
  });
  factory ListProposalsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListProposalsOutputFromJson(json);
}

/// A configuration for logging events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogConfiguration {
  /// Indicates whether logging is enabled.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  LogConfiguration({
    this.enabled,
  });
  factory LogConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LogConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$LogConfigurationToJson(this);
}

/// A collection of log configurations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogConfigurations {
  /// Parameters for publishing logs to Amazon CloudWatch Logs.
  @_s.JsonKey(name: 'Cloudwatch')
  final LogConfiguration cloudwatch;

  LogConfigurations({
    this.cloudwatch,
  });
  factory LogConfigurations.fromJson(Map<String, dynamic> json) =>
      _$LogConfigurationsFromJson(json);

  Map<String, dynamic> toJson() => _$LogConfigurationsToJson(this);
}

/// Member configuration properties.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Member {
  /// The date and time that the member was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// An optional description for the member.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Attributes relevant to a member for the blockchain framework that the
  /// Managed Blockchain network uses.
  @_s.JsonKey(name: 'FrameworkAttributes')
  final MemberFrameworkAttributes frameworkAttributes;

  /// The unique identifier of the member.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Configuration properties for logging events associated with a member.
  @_s.JsonKey(name: 'LogPublishingConfiguration')
  final MemberLogPublishingConfiguration logPublishingConfiguration;

  /// The name of the member.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The unique identifier of the network to which the member belongs.
  @_s.JsonKey(name: 'NetworkId')
  final String networkId;

  /// The status of a member.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The AWS account is in the process of creating a
  /// member.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The member has been created and can participate in
  /// the network.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> - The AWS account attempted to create a member
  /// and creation failed.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The member and all associated resources are in the
  /// process of being deleted. Either the AWS account that owns the member
  /// deleted it, or the member is being deleted as the result of an
  /// <code>APPROVED</code> <code>PROPOSAL</code> to remove the member.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - The member can no longer participate on the network
  /// and all associated resources are deleted. Either the AWS account that owns
  /// the member deleted it, or the member is being deleted as the result of an
  /// <code>APPROVED</code> <code>PROPOSAL</code> to remove the member.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final MemberStatus status;

  Member({
    this.creationDate,
    this.description,
    this.frameworkAttributes,
    this.id,
    this.logPublishingConfiguration,
    this.name,
    this.networkId,
    this.status,
  });
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

/// Configuration properties of the member.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MemberConfiguration {
  /// Configuration properties of the blockchain framework relevant to the member.
  @_s.JsonKey(name: 'FrameworkConfiguration')
  final MemberFrameworkConfiguration frameworkConfiguration;

  /// The name of the member.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An optional description of the member.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Configuration properties for logging events associated with a member of a
  /// Managed Blockchain network.
  @_s.JsonKey(name: 'LogPublishingConfiguration')
  final MemberLogPublishingConfiguration logPublishingConfiguration;

  MemberConfiguration({
    @_s.required this.frameworkConfiguration,
    @_s.required this.name,
    this.description,
    this.logPublishingConfiguration,
  });
  Map<String, dynamic> toJson() => _$MemberConfigurationToJson(this);
}

/// Attributes of Hyperledger Fabric for a member in a Managed Blockchain
/// network using the Hyperledger Fabric framework.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemberFabricAttributes {
  /// The user name for the initial administrator user for the member.
  @_s.JsonKey(name: 'AdminUsername')
  final String adminUsername;

  /// The endpoint used to access the member's certificate authority.
  @_s.JsonKey(name: 'CaEndpoint')
  final String caEndpoint;

  MemberFabricAttributes({
    this.adminUsername,
    this.caEndpoint,
  });
  factory MemberFabricAttributes.fromJson(Map<String, dynamic> json) =>
      _$MemberFabricAttributesFromJson(json);
}

/// Configuration properties for Hyperledger Fabric for a member in a Managed
/// Blockchain network using the Hyperledger Fabric framework.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MemberFabricConfiguration {
  /// The password for the member's initial administrative user. The
  /// <code>AdminPassword</code> must be at least eight characters long and no
  /// more than 32 characters. It must contain at least one uppercase letter, one
  /// lowercase letter, and one digit. It cannot have a single quotation mark (‘),
  /// a double quotation marks (“), a forward slash(/), a backward slash(\), @, or
  /// a space.
  @_s.JsonKey(name: 'AdminPassword')
  final String adminPassword;

  /// The user name for the member's initial administrative user.
  @_s.JsonKey(name: 'AdminUsername')
  final String adminUsername;

  MemberFabricConfiguration({
    @_s.required this.adminPassword,
    @_s.required this.adminUsername,
  });
  Map<String, dynamic> toJson() => _$MemberFabricConfigurationToJson(this);
}

/// Configuration properties for logging events associated with a member of a
/// Managed Blockchain network using the Hyperledger Fabric framework.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MemberFabricLogPublishingConfiguration {
  /// Configuration properties for logging events associated with a member's
  /// Certificate Authority (CA). CA logs help you determine when a member in your
  /// account joins the network, or when new peers register with a member CA.
  @_s.JsonKey(name: 'CaLogs')
  final LogConfigurations caLogs;

  MemberFabricLogPublishingConfiguration({
    this.caLogs,
  });
  factory MemberFabricLogPublishingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$MemberFabricLogPublishingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MemberFabricLogPublishingConfigurationToJson(this);
}

/// Attributes relevant to a member for the blockchain framework that the
/// Managed Blockchain network uses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemberFrameworkAttributes {
  /// Attributes of Hyperledger Fabric relevant to a member on a Managed
  /// Blockchain network that uses Hyperledger Fabric.
  @_s.JsonKey(name: 'Fabric')
  final MemberFabricAttributes fabric;

  MemberFrameworkAttributes({
    this.fabric,
  });
  factory MemberFrameworkAttributes.fromJson(Map<String, dynamic> json) =>
      _$MemberFrameworkAttributesFromJson(json);
}

/// Configuration properties relevant to a member for the blockchain framework
/// that the Managed Blockchain network uses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MemberFrameworkConfiguration {
  /// Attributes of Hyperledger Fabric for a member on a Managed Blockchain
  /// network that uses Hyperledger Fabric.
  @_s.JsonKey(name: 'Fabric')
  final MemberFabricConfiguration fabric;

  MemberFrameworkConfiguration({
    this.fabric,
  });
  Map<String, dynamic> toJson() => _$MemberFrameworkConfigurationToJson(this);
}

/// Configuration properties for logging events associated with a member of a
/// Managed Blockchain network.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MemberLogPublishingConfiguration {
  /// Configuration properties for logging events associated with a member of a
  /// Managed Blockchain network using the Hyperledger Fabric framework.
  @_s.JsonKey(name: 'Fabric')
  final MemberFabricLogPublishingConfiguration fabric;

  MemberLogPublishingConfiguration({
    this.fabric,
  });
  factory MemberLogPublishingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$MemberLogPublishingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MemberLogPublishingConfigurationToJson(this);
}

enum MemberStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

extension on MemberStatus {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A summary of configuration properties for a member.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemberSummary {
  /// The date and time that the member was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// An optional description of the member.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The unique identifier of the member.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// An indicator of whether the member is owned by your AWS account or a
  /// different AWS account.
  @_s.JsonKey(name: 'IsOwned')
  final bool isOwned;

  /// The name of the member.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of the member.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The AWS account is in the process of creating a
  /// member.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The member has been created and can participate in
  /// the network.
  /// </li>
  /// <li>
  /// <code>CREATE_FAILED</code> - The AWS account attempted to create a member
  /// and creation failed.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The member and all associated resources are in the
  /// process of being deleted. Either the AWS account that owns the member
  /// deleted it, or the member is being deleted as the result of an
  /// <code>APPROVED</code> <code>PROPOSAL</code> to remove the member.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - The member can no longer participate on the network
  /// and all associated resources are deleted. Either the AWS account that owns
  /// the member deleted it, or the member is being deleted as the result of an
  /// <code>APPROVED</code> <code>PROPOSAL</code> to remove the member.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final MemberStatus status;

  MemberSummary({
    this.creationDate,
    this.description,
    this.id,
    this.isOwned,
    this.name,
    this.status,
  });
  factory MemberSummary.fromJson(Map<String, dynamic> json) =>
      _$MemberSummaryFromJson(json);
}

/// Network configuration properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Network {
  /// The date and time that the network was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// Attributes of the blockchain framework for the network.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The blockchain framework that the network uses.
  @_s.JsonKey(name: 'Framework')
  final Framework framework;

  /// Attributes of the blockchain framework that the network uses.
  @_s.JsonKey(name: 'FrameworkAttributes')
  final NetworkFrameworkAttributes frameworkAttributes;

  /// The version of the blockchain framework that the network uses.
  @_s.JsonKey(name: 'FrameworkVersion')
  final String frameworkVersion;

  /// The unique identifier of the network.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the network.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the network.
  @_s.JsonKey(name: 'Status')
  final NetworkStatus status;

  /// The voting rules for the network to decide if a proposal is accepted.
  @_s.JsonKey(name: 'VotingPolicy')
  final VotingPolicy votingPolicy;

  /// The VPC endpoint service name of the VPC endpoint service of the network.
  /// Members use the VPC endpoint service name to create a VPC endpoint to access
  /// network resources.
  @_s.JsonKey(name: 'VpcEndpointServiceName')
  final String vpcEndpointServiceName;

  Network({
    this.creationDate,
    this.description,
    this.framework,
    this.frameworkAttributes,
    this.frameworkVersion,
    this.id,
    this.name,
    this.status,
    this.votingPolicy,
    this.vpcEndpointServiceName,
  });
  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
}

/// Attributes of Ethereum for a network.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkEthereumAttributes {
  /// The Ethereum <code>CHAIN_ID</code> associated with the Ethereum network.
  /// Chain IDs are as follows:
  ///
  /// <ul>
  /// <li>
  /// mainnet = <code>1</code>
  /// </li>
  /// <li>
  /// rinkeby = <code>4</code>
  /// </li>
  /// <li>
  /// ropsten = <code>3</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ChainId')
  final String chainId;

  NetworkEthereumAttributes({
    this.chainId,
  });
  factory NetworkEthereumAttributes.fromJson(Map<String, dynamic> json) =>
      _$NetworkEthereumAttributesFromJson(json);
}

/// Attributes of Hyperledger Fabric for a network.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkFabricAttributes {
  /// The edition of Amazon Managed Blockchain that Hyperledger Fabric uses. For
  /// more information, see <a
  /// href="http://aws.amazon.com/managed-blockchain/pricing/">Amazon Managed
  /// Blockchain Pricing</a>.
  @_s.JsonKey(name: 'Edition')
  final Edition edition;

  /// The endpoint of the ordering service for the network.
  @_s.JsonKey(name: 'OrderingServiceEndpoint')
  final String orderingServiceEndpoint;

  NetworkFabricAttributes({
    this.edition,
    this.orderingServiceEndpoint,
  });
  factory NetworkFabricAttributes.fromJson(Map<String, dynamic> json) =>
      _$NetworkFabricAttributesFromJson(json);
}

/// Hyperledger Fabric configuration properties for the network.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NetworkFabricConfiguration {
  /// The edition of Amazon Managed Blockchain that the network uses. For more
  /// information, see <a
  /// href="http://aws.amazon.com/managed-blockchain/pricing/">Amazon Managed
  /// Blockchain Pricing</a>.
  @_s.JsonKey(name: 'Edition')
  final Edition edition;

  NetworkFabricConfiguration({
    @_s.required this.edition,
  });
  Map<String, dynamic> toJson() => _$NetworkFabricConfigurationToJson(this);
}

/// Attributes relevant to the network for the blockchain framework that the
/// network uses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkFrameworkAttributes {
  /// Attributes of an Ethereum network for Managed Blockchain resources
  /// participating in an Ethereum network.
  @_s.JsonKey(name: 'Ethereum')
  final NetworkEthereumAttributes ethereum;

  /// Attributes of Hyperledger Fabric for a Managed Blockchain network that uses
  /// Hyperledger Fabric.
  @_s.JsonKey(name: 'Fabric')
  final NetworkFabricAttributes fabric;

  NetworkFrameworkAttributes({
    this.ethereum,
    this.fabric,
  });
  factory NetworkFrameworkAttributes.fromJson(Map<String, dynamic> json) =>
      _$NetworkFrameworkAttributesFromJson(json);
}

/// Configuration properties relevant to the network for the blockchain
/// framework that the network uses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NetworkFrameworkConfiguration {
  /// Hyperledger Fabric configuration properties for a Managed Blockchain network
  /// that uses Hyperledger Fabric.
  @_s.JsonKey(name: 'Fabric')
  final NetworkFabricConfiguration fabric;

  NetworkFrameworkConfiguration({
    this.fabric,
  });
  Map<String, dynamic> toJson() => _$NetworkFrameworkConfigurationToJson(this);
}

enum NetworkStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

extension on NetworkStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

/// A summary of network configuration properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkSummary {
  /// The date and time that the network was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// An optional description of the network.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The blockchain framework that the network uses.
  @_s.JsonKey(name: 'Framework')
  final Framework framework;

  /// The version of the blockchain framework that the network uses.
  @_s.JsonKey(name: 'FrameworkVersion')
  final String frameworkVersion;

  /// The unique identifier of the network.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the network.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the network.
  @_s.JsonKey(name: 'Status')
  final NetworkStatus status;

  NetworkSummary({
    this.creationDate,
    this.description,
    this.framework,
    this.frameworkVersion,
    this.id,
    this.name,
    this.status,
  });
  factory NetworkSummary.fromJson(Map<String, dynamic> json) =>
      _$NetworkSummaryFromJson(json);
}

/// Configuration properties of a node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Node {
  /// The Availability Zone in which the node exists.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The date and time that the node was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// Attributes of the blockchain framework being used.
  @_s.JsonKey(name: 'FrameworkAttributes')
  final NodeFrameworkAttributes frameworkAttributes;

  /// The unique identifier of the node.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The instance type of the node.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// Configuration properties for logging events associated with a peer node on a
  /// Hyperledger Fabric network on Managed Blockchain.
  @_s.JsonKey(name: 'LogPublishingConfiguration')
  final NodeLogPublishingConfiguration logPublishingConfiguration;

  /// The unique identifier of the member to which the node belongs.
  ///
  /// Applies only to Hyperledger Fabric.
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  /// The unique identifier of the network that the node is on.
  @_s.JsonKey(name: 'NetworkId')
  final String networkId;

  /// The state database that the node uses. Values are <code>LevelDB</code> or
  /// <code>CouchDB</code>.
  ///
  /// Applies only to Hyperledger Fabric.
  @_s.JsonKey(name: 'StateDB')
  final StateDBType stateDB;

  /// The status of the node.
  @_s.JsonKey(name: 'Status')
  final NodeStatus status;

  Node({
    this.availabilityZone,
    this.creationDate,
    this.frameworkAttributes,
    this.id,
    this.instanceType,
    this.logPublishingConfiguration,
    this.memberId,
    this.networkId,
    this.stateDB,
    this.status,
  });
  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}

/// Configuration properties of a node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NodeConfiguration {
  /// The Amazon Managed Blockchain instance type for the node.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The Availability Zone in which the node exists.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// Configuration properties for logging events associated with a peer node on a
  /// Hyperledger Fabric network on Managed Blockchain.
  @_s.JsonKey(name: 'LogPublishingConfiguration')
  final NodeLogPublishingConfiguration logPublishingConfiguration;

  /// The state database that the node uses. Values are <code>LevelDB</code> or
  /// <code>CouchDB</code>. When using an Amazon Managed Blockchain network with
  /// Hyperledger Fabric version 1.4 or later, the default is
  /// <code>CouchDB</code>.
  ///
  /// Applies only to Hyperledger Fabric.
  @_s.JsonKey(name: 'StateDB')
  final StateDBType stateDB;

  NodeConfiguration({
    @_s.required this.instanceType,
    this.availabilityZone,
    this.logPublishingConfiguration,
    this.stateDB,
  });
  Map<String, dynamic> toJson() => _$NodeConfigurationToJson(this);
}

/// Attributes of an Ethereum node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeEthereumAttributes {
  /// The endpoint on which the Ethereum node listens to run Ethereum JSON-RPC
  /// methods over HTTP connections from a client. Use this endpoint in client
  /// code for smart contracts when using an HTTP connection. Connections to this
  /// endpoint are authenticated using <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  @_s.JsonKey(name: 'HttpEndpoint')
  final String httpEndpoint;

  /// The endpoint on which the Ethereum node listens to run Ethereum JSON-RPC
  /// methods over WebSockets connections from a client. Use this endpoint in
  /// client code for smart contracts when using a WebSockets connection.
  /// Connections to this endpoint are authenticated using <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4</a>.
  @_s.JsonKey(name: 'WebSocketEndpoint')
  final String webSocketEndpoint;

  NodeEthereumAttributes({
    this.httpEndpoint,
    this.webSocketEndpoint,
  });
  factory NodeEthereumAttributes.fromJson(Map<String, dynamic> json) =>
      _$NodeEthereumAttributesFromJson(json);
}

/// Attributes of Hyperledger Fabric for a peer node on a Hyperledger Fabric
/// network on Managed Blockchain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeFabricAttributes {
  /// The endpoint that identifies the peer node for all services except peer
  /// channel-based event services.
  @_s.JsonKey(name: 'PeerEndpoint')
  final String peerEndpoint;

  /// The endpoint that identifies the peer node for peer channel-based event
  /// services.
  @_s.JsonKey(name: 'PeerEventEndpoint')
  final String peerEventEndpoint;

  NodeFabricAttributes({
    this.peerEndpoint,
    this.peerEventEndpoint,
  });
  factory NodeFabricAttributes.fromJson(Map<String, dynamic> json) =>
      _$NodeFabricAttributesFromJson(json);
}

/// Configuration properties for logging events associated with a peer node
/// owned by a member in a Managed Blockchain network.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NodeFabricLogPublishingConfiguration {
  /// Configuration properties for logging events associated with chaincode
  /// execution on a peer node. Chaincode logs contain the results of
  /// instantiating, invoking, and querying the chaincode. A peer can run multiple
  /// instances of chaincode. When enabled, a log stream is created for all
  /// chaincodes, with an individual log stream for each chaincode.
  @_s.JsonKey(name: 'ChaincodeLogs')
  final LogConfigurations chaincodeLogs;

  /// Configuration properties for a peer node log. Peer node logs contain
  /// messages generated when your client submits transaction proposals to peer
  /// nodes, requests to join channels, enrolls an admin peer, and lists the
  /// chaincode instances on a peer node.
  @_s.JsonKey(name: 'PeerLogs')
  final LogConfigurations peerLogs;

  NodeFabricLogPublishingConfiguration({
    this.chaincodeLogs,
    this.peerLogs,
  });
  factory NodeFabricLogPublishingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$NodeFabricLogPublishingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NodeFabricLogPublishingConfigurationToJson(this);
}

/// Attributes relevant to a node on a Managed Blockchain network for the
/// blockchain framework that the network uses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeFrameworkAttributes {
  /// Attributes of Ethereum for a node on a Managed Blockchain network that uses
  /// Ethereum.
  @_s.JsonKey(name: 'Ethereum')
  final NodeEthereumAttributes ethereum;

  /// Attributes of Hyperledger Fabric for a peer node on a Managed Blockchain
  /// network that uses Hyperledger Fabric.
  @_s.JsonKey(name: 'Fabric')
  final NodeFabricAttributes fabric;

  NodeFrameworkAttributes({
    this.ethereum,
    this.fabric,
  });
  factory NodeFrameworkAttributes.fromJson(Map<String, dynamic> json) =>
      _$NodeFrameworkAttributesFromJson(json);
}

/// Configuration properties for logging events associated with a peer node on a
/// Hyperledger Fabric network on Managed Blockchain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NodeLogPublishingConfiguration {
  /// Configuration properties for logging events associated with a node that is
  /// owned by a member of a Managed Blockchain network using the Hyperledger
  /// Fabric framework.
  @_s.JsonKey(name: 'Fabric')
  final NodeFabricLogPublishingConfiguration fabric;

  NodeLogPublishingConfiguration({
    this.fabric,
  });
  factory NodeLogPublishingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NodeLogPublishingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$NodeLogPublishingConfigurationToJson(this);
}

enum NodeStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('FAILED')
  failed,
}

extension on NodeStatus {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A summary of configuration properties for a node.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NodeSummary {
  /// The Availability Zone in which the node exists.
  @_s.JsonKey(name: 'AvailabilityZone')
  final String availabilityZone;

  /// The date and time that the node was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The unique identifier of the node.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The EC2 instance type for the node.
  @_s.JsonKey(name: 'InstanceType')
  final String instanceType;

  /// The status of the node.
  @_s.JsonKey(name: 'Status')
  final NodeStatus status;

  NodeSummary({
    this.availabilityZone,
    this.creationDate,
    this.id,
    this.instanceType,
    this.status,
  });
  factory NodeSummary.fromJson(Map<String, dynamic> json) =>
      _$NodeSummaryFromJson(json);
}

/// Properties of a proposal on a Managed Blockchain network.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Proposal {
  /// The actions to perform on the network if the proposal is
  /// <code>APPROVED</code>.
  @_s.JsonKey(name: 'Actions')
  final ProposalActions actions;

  /// The date and time that the proposal was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The description of the proposal.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date and time that the proposal expires. This is the
  /// <code>CreationDate</code> plus the <code>ProposalDurationInHours</code> that
  /// is specified in the <code>ProposalThresholdPolicy</code>. After this date
  /// and time, if members have not cast enough votes to determine the outcome
  /// according to the voting policy, the proposal is <code>EXPIRED</code> and
  /// <code>Actions</code> are not carried out.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationDate')
  final DateTime expirationDate;

  /// The unique identifier of the network for which the proposal is made.
  @_s.JsonKey(name: 'NetworkId')
  final String networkId;

  /// The current total of <code>NO</code> votes cast on the proposal by members.
  @_s.JsonKey(name: 'NoVoteCount')
  final int noVoteCount;

  /// The number of votes remaining to be cast on the proposal by members. In
  /// other words, the number of members minus the sum of <code>YES</code> votes
  /// and <code>NO</code> votes.
  @_s.JsonKey(name: 'OutstandingVoteCount')
  final int outstandingVoteCount;

  /// The unique identifier of the proposal.
  @_s.JsonKey(name: 'ProposalId')
  final String proposalId;

  /// The unique identifier of the member that created the proposal.
  @_s.JsonKey(name: 'ProposedByMemberId')
  final String proposedByMemberId;

  /// The name of the member that created the proposal.
  @_s.JsonKey(name: 'ProposedByMemberName')
  final String proposedByMemberName;

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
  /// specified <code>ProposalActions</code> are not carried out.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> - Members did not cast the number of votes required to
  /// determine the proposal outcome before the proposal expired. The specified
  /// <code>ProposalActions</code> are not carried out.
  /// </li>
  /// <li>
  /// <code>ACTION_FAILED</code> - One or more of the specified
  /// <code>ProposalActions</code> in a proposal that was approved could not be
  /// completed because of an error. The <code>ACTION_FAILED</code> status occurs
  /// even if only one ProposalAction fails and other actions are successful.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final ProposalStatus status;

  /// The current total of <code>YES</code> votes cast on the proposal by members.
  @_s.JsonKey(name: 'YesVoteCount')
  final int yesVoteCount;

  Proposal({
    this.actions,
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
    this.yesVoteCount,
  });
  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);
}

/// The actions to carry out if a proposal is <code>APPROVED</code>.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProposalActions {
  /// The actions to perform for an <code>APPROVED</code> proposal to invite an
  /// AWS account to create a member and join the network.
  @_s.JsonKey(name: 'Invitations')
  final List<InviteAction> invitations;

  /// The actions to perform for an <code>APPROVED</code> proposal to remove a
  /// member from the network, which deletes the member and all associated member
  /// resources from the network.
  @_s.JsonKey(name: 'Removals')
  final List<RemoveAction> removals;

  ProposalActions({
    this.invitations,
    this.removals,
  });
  factory ProposalActions.fromJson(Map<String, dynamic> json) =>
      _$ProposalActionsFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalActionsToJson(this);
}

enum ProposalStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('APPROVED')
  approved,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('ACTION_FAILED')
  actionFailed,
}

/// Properties of a proposal.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProposalSummary {
  /// The date and time that the proposal was created.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreationDate')
  final DateTime creationDate;

  /// The description of the proposal.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The date and time that the proposal expires. This is the
  /// <code>CreationDate</code> plus the <code>ProposalDurationInHours</code> that
  /// is specified in the <code>ProposalThresholdPolicy</code>. After this date
  /// and time, if members have not cast enough votes to determine the outcome
  /// according to the voting policy, the proposal is <code>EXPIRED</code> and
  /// <code>Actions</code> are not carried out.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationDate')
  final DateTime expirationDate;

  /// The unique identifier of the proposal.
  @_s.JsonKey(name: 'ProposalId')
  final String proposalId;

  /// The unique identifier of the member that created the proposal.
  @_s.JsonKey(name: 'ProposedByMemberId')
  final String proposedByMemberId;

  /// The name of the member that created the proposal.
  @_s.JsonKey(name: 'ProposedByMemberName')
  final String proposedByMemberName;

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
  /// specified <code>ProposalActions</code> are not carried out.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> - Members did not cast the number of votes required to
  /// determine the proposal outcome before the proposal expired. The specified
  /// <code>ProposalActions</code> are not carried out.
  /// </li>
  /// <li>
  /// <code>ACTION_FAILED</code> - One or more of the specified
  /// <code>ProposalActions</code> in a proposal that was approved could not be
  /// completed because of an error.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final ProposalStatus status;

  ProposalSummary({
    this.creationDate,
    this.description,
    this.expirationDate,
    this.proposalId,
    this.proposedByMemberId,
    this.proposedByMemberName,
    this.status,
  });
  factory ProposalSummary.fromJson(Map<String, dynamic> json) =>
      _$ProposalSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectInvitationOutput {
  RejectInvitationOutput();
  factory RejectInvitationOutput.fromJson(Map<String, dynamic> json) =>
      _$RejectInvitationOutputFromJson(json);
}

/// An action to remove a member from a Managed Blockchain network as the result
/// of a removal proposal that is <code>APPROVED</code>. The member and all
/// associated resources are deleted from the network.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemoveAction {
  /// The unique identifier of the member to remove.
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  RemoveAction({
    @_s.required this.memberId,
  });
  factory RemoveAction.fromJson(Map<String, dynamic> json) =>
      _$RemoveActionFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveActionToJson(this);
}

enum StateDBType {
  @_s.JsonValue('LevelDB')
  levelDB,
  @_s.JsonValue('CouchDB')
  couchDB,
}

enum ThresholdComparator {
  @_s.JsonValue('GREATER_THAN')
  greaterThan,
  @_s.JsonValue('GREATER_THAN_OR_EQUAL_TO')
  greaterThanOrEqualTo,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMemberOutput {
  UpdateMemberOutput();
  factory UpdateMemberOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateMemberOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNodeOutput {
  UpdateNodeOutput();
  factory UpdateNodeOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateNodeOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VoteOnProposalOutput {
  VoteOnProposalOutput();
  factory VoteOnProposalOutput.fromJson(Map<String, dynamic> json) =>
      _$VoteOnProposalOutputFromJson(json);
}

/// Properties of an individual vote that a member cast for a proposal.
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VoteSummary {
  /// The unique identifier of the member that cast the vote.
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  /// The name of the member that cast the vote.
  @_s.JsonKey(name: 'MemberName')
  final String memberName;

  /// The vote value, either <code>YES</code> or <code>NO</code>.
  @_s.JsonKey(name: 'Vote')
  final VoteValue vote;

  VoteSummary({
    this.memberId,
    this.memberName,
    this.vote,
  });
  factory VoteSummary.fromJson(Map<String, dynamic> json) =>
      _$VoteSummaryFromJson(json);
}

enum VoteValue {
  @_s.JsonValue('YES')
  yes,
  @_s.JsonValue('NO')
  no,
}

extension on VoteValue {
  String toValue() {
    switch (this) {
      case VoteValue.yes:
        return 'YES';
      case VoteValue.no:
        return 'NO';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The voting rules for the network to decide if a proposal is accepted
///
/// Applies only to Hyperledger Fabric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VotingPolicy {
  /// Defines the rules for the network for voting on proposals, such as the
  /// percentage of <code>YES</code> votes required for the proposal to be
  /// approved and the duration of the proposal. The policy applies to all
  /// proposals and is specified when the network is created.
  @_s.JsonKey(name: 'ApprovalThresholdPolicy')
  final ApprovalThresholdPolicy approvalThresholdPolicy;

  VotingPolicy({
    this.approvalThresholdPolicy,
  });
  factory VotingPolicy.fromJson(Map<String, dynamic> json) =>
      _$VotingPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$VotingPolicyToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class IllegalActionException extends _s.GenericAwsException {
  IllegalActionException({String type, String message})
      : super(type: type, code: 'IllegalActionException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String type, String message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String type, String message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
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
};
