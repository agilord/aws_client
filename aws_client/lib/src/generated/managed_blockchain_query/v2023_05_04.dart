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

/// Amazon Managed Blockchain (AMB) Query provides you with convenient access to
/// multi-blockchain network data, which makes it easier for you to extract
/// contextual data related to blockchain activity. You can use AMB Query to
/// read data from public blockchain networks, such as Bitcoin Mainnet and
/// Ethereum Mainnet. You can also get information such as the current and
/// historical balances of addresses, or you can get a list of blockchain
/// transactions for a given time period. Additionally, you can get details of a
/// given transaction, such as transaction events, which you can further analyze
/// or use in business logic for your applications.
class ManagedBlockchainQuery {
  final _s.RestJsonProtocol _protocol;
  ManagedBlockchainQuery({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'managedblockchain-query',
            signingName: 'managedblockchain-query',
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

  /// Gets the token balance for a batch of tokens by using the
  /// <code>BatchGetTokenBalance</code> action for every token in the request.
  /// <note>
  /// Only the native tokens BTC and ETH, and the ERC-20, ERC-721, and ERC 1155
  /// token standards are supported.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [getTokenBalanceInputs] :
  /// An array of <code>BatchGetTokenBalanceInputItem</code> objects whose
  /// balance is being requested.
  Future<BatchGetTokenBalanceOutput> batchGetTokenBalance({
    List<BatchGetTokenBalanceInputItem>? getTokenBalanceInputs,
  }) async {
    final $payload = <String, dynamic>{
      if (getTokenBalanceInputs != null)
        'getTokenBalanceInputs': getTokenBalanceInputs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/batch-get-token-balance',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetTokenBalanceOutput.fromJson(response);
  }

  /// Gets the information about a specific contract deployed on the blockchain.
  /// <note>
  /// <ul>
  /// <li>
  /// The Bitcoin blockchain networks do not support this operation.
  /// </li>
  /// <li>
  /// Metadata is currently only available for some <code>ERC-20</code>
  /// contracts. Metadata will be available for additional contracts in the
  /// future.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [contractIdentifier] :
  /// Contains the blockchain address and network information about the
  /// contract.
  Future<GetAssetContractOutput> getAssetContract({
    required ContractIdentifier contractIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'contractIdentifier': contractIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-asset-contract',
      exceptionFnMap: _exceptionFns,
    );
    return GetAssetContractOutput.fromJson(response);
  }

  /// Gets the balance of a specific token, including native tokens, for a given
  /// address (wallet or contract) on the blockchain.
  /// <note>
  /// Only the native tokens BTC and ETH, and the ERC-20, ERC-721, and ERC 1155
  /// token standards are supported.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [ownerIdentifier] :
  /// The container for the identifier for the owner.
  ///
  /// Parameter [tokenIdentifier] :
  /// The container for the identifier for the token, including the unique token
  /// ID and its blockchain network.
  ///
  /// Parameter [atBlockchainInstant] :
  /// The time for when the TokenBalance is requested or the current time if a
  /// time is not provided in the request.
  /// <note>
  /// This time will only be recorded up to the second.
  /// </note>
  Future<GetTokenBalanceOutput> getTokenBalance({
    required OwnerIdentifier ownerIdentifier,
    required TokenIdentifier tokenIdentifier,
    BlockchainInstant? atBlockchainInstant,
  }) async {
    final $payload = <String, dynamic>{
      'ownerIdentifier': ownerIdentifier,
      'tokenIdentifier': tokenIdentifier,
      if (atBlockchainInstant != null)
        'atBlockchainInstant': atBlockchainInstant,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-token-balance',
      exceptionFnMap: _exceptionFns,
    );
    return GetTokenBalanceOutput.fromJson(response);
  }

  /// Gets the details of a transaction.
  /// <note>
  /// This action will return transaction details for all transactions that are
  /// <i>confirmed</i> on the blockchain, even if they have not reached <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ambq-dg/key-concepts.html#finality">finality</a>.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [network] :
  /// The blockchain network where the transaction occurred.
  ///
  /// Parameter [transactionHash] :
  /// The hash of a transaction. It is generated when a transaction is created.
  ///
  /// Parameter [transactionId] :
  /// The identifier of a Bitcoin transaction. It is generated when a
  /// transaction is created.
  /// <note>
  /// <code>transactionId</code> is only supported on the Bitcoin networks.
  /// </note>
  Future<GetTransactionOutput> getTransaction({
    required QueryNetwork network,
    String? transactionHash,
    String? transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'network': network.toValue(),
      if (transactionHash != null) 'transactionHash': transactionHash,
      if (transactionId != null) 'transactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-transaction',
      exceptionFnMap: _exceptionFns,
    );
    return GetTransactionOutput.fromJson(response);
  }

  /// Lists all the contracts for a given contract type deployed by an address
  /// (either a contract address or a wallet address).
  ///
  /// The Bitcoin blockchain networks do not support this operation.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [contractFilter] :
  /// Contains the filter parameter for the request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of contracts to list.
  ///
  /// Default: <code>100</code>
  /// <note>
  /// Even if additional results can be retrieved, the request can return less
  /// results than <code>maxResults</code> or an empty array of results.
  ///
  /// To retrieve the next set of results, make another request with the
  /// returned <code>nextToken</code> value. The value of <code>nextToken</code>
  /// is <code>null</code> when there are no more results to return
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<ListAssetContractsOutput> listAssetContracts({
    required ContractFilter contractFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      'contractFilter': contractFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-asset-contracts',
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetContractsOutput.fromJson(response);
  }

  /// Lists all the transaction events for an address on the blockchain.
  /// <note>
  /// This operation is only supported on the Bitcoin networks.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [addressIdentifierFilter] :
  /// This is the unique public address on the blockchain for which the
  /// transaction events are being requested.
  ///
  /// Parameter [network] :
  /// The blockchain network where the transaction occurred.
  ///
  /// Valid Values: <code>BITCOIN_MAINNET</code> | <code>BITCOIN_TESTNET</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of transaction events to list.
  ///
  /// Default: <code>100</code>
  /// <note>
  /// Even if additional results can be retrieved, the request can return less
  /// results than <code>maxResults</code> or an empty array of results.
  ///
  /// To retrieve the next set of results, make another request with the
  /// returned <code>nextToken</code> value. The value of <code>nextToken</code>
  /// is <code>null</code> when there are no more results to return
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [sort] :
  /// The order by which the results will be sorted.
  ///
  /// Parameter [timeFilter] :
  /// This container specifies the time frame for the transaction events
  /// returned in the response.
  ///
  /// Parameter [voutFilter] :
  /// This container specifies filtering attributes related to BITCOIN_VOUT
  /// event types
  Future<ListFilteredTransactionEventsOutput> listFilteredTransactionEvents({
    required AddressIdentifierFilter addressIdentifierFilter,
    required String network,
    ConfirmationStatusFilter? confirmationStatusFilter,
    int? maxResults,
    String? nextToken,
    ListFilteredTransactionEventsSort? sort,
    TimeFilter? timeFilter,
    VoutFilter? voutFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      'addressIdentifierFilter': addressIdentifierFilter,
      'network': network,
      if (confirmationStatusFilter != null)
        'confirmationStatusFilter': confirmationStatusFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sort != null) 'sort': sort,
      if (timeFilter != null) 'timeFilter': timeFilter,
      if (voutFilter != null) 'voutFilter': voutFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-filtered-transaction-events',
      exceptionFnMap: _exceptionFns,
    );
    return ListFilteredTransactionEventsOutput.fromJson(response);
  }

  /// This action returns the following for a given blockchain network:
  ///
  /// <ul>
  /// <li>
  /// Lists all token balances owned by an address (either a contract address or
  /// a wallet address).
  /// </li>
  /// <li>
  /// Lists all token balances for all tokens created by a contract.
  /// </li>
  /// <li>
  /// Lists all token balances for a given token.
  /// </li>
  /// </ul> <note>
  /// You must always specify the network property of the
  /// <code>tokenFilter</code> when using this operation.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [tokenFilter] :
  /// The contract address or a token identifier on the blockchain network by
  /// which to filter the request. You must specify the
  /// <code>contractAddress</code> property of this container when listing
  /// tokens minted by a contract.
  /// <note>
  /// You must always specify the network property of this container when using
  /// this operation.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of token balances to return.
  ///
  /// Default: <code>100</code>
  /// <note>
  /// Even if additional results can be retrieved, the request can return less
  /// results than <code>maxResults</code> or an empty array of results.
  ///
  /// To retrieve the next set of results, make another request with the
  /// returned <code>nextToken</code> value. The value of <code>nextToken</code>
  /// is <code>null</code> when there are no more results to return
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [ownerFilter] :
  /// The contract or wallet address on the blockchain network by which to
  /// filter the request. You must specify the <code>address</code> property of
  /// the <code>ownerFilter</code> when listing balances of tokens owned by the
  /// address.
  Future<ListTokenBalancesOutput> listTokenBalances({
    required TokenFilter tokenFilter,
    int? maxResults,
    String? nextToken,
    OwnerFilter? ownerFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      'tokenFilter': tokenFilter,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (ownerFilter != null) 'ownerFilter': ownerFilter,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-token-balances',
      exceptionFnMap: _exceptionFns,
    );
    return ListTokenBalancesOutput.fromJson(response);
  }

  /// Lists all the transaction events for a transaction
  /// <note>
  /// This action will return transaction details for all transactions that are
  /// <i>confirmed</i> on the blockchain, even if they have not reached <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ambq-dg/key-concepts.html#finality">finality</a>.
  /// </note>
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [network] :
  /// The blockchain network where the transaction events occurred.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of transaction events to list.
  ///
  /// Default: <code>100</code>
  /// <note>
  /// Even if additional results can be retrieved, the request can return less
  /// results than <code>maxResults</code> or an empty array of results.
  ///
  /// To retrieve the next set of results, make another request with the
  /// returned <code>nextToken</code> value. The value of <code>nextToken</code>
  /// is <code>null</code> when there are no more results to return
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [transactionHash] :
  /// The hash of a transaction. It is generated when a transaction is created.
  ///
  /// Parameter [transactionId] :
  /// The identifier of a Bitcoin transaction. It is generated when a
  /// transaction is created.
  /// <note>
  /// <code>transactionId</code> is only supported on the Bitcoin networks.
  /// </note>
  Future<ListTransactionEventsOutput> listTransactionEvents({
    required QueryNetwork network,
    int? maxResults,
    String? nextToken,
    String? transactionHash,
    String? transactionId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      'network': network.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (transactionHash != null) 'transactionHash': transactionHash,
      if (transactionId != null) 'transactionId': transactionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-transaction-events',
      exceptionFnMap: _exceptionFns,
    );
    return ListTransactionEventsOutput.fromJson(response);
  }

  /// Lists all the transaction events for a transaction.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [address] :
  /// The address (either a contract or wallet), whose transactions are being
  /// requested.
  ///
  /// Parameter [network] :
  /// The blockchain network where the transactions occurred.
  ///
  /// Parameter [confirmationStatusFilter] :
  /// This filter is used to include transactions in the response that haven't
  /// reached <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ambq-dg/key-concepts.html#finality">
  /// <i>finality</i> </a>. Transactions that have reached finality are always
  /// part of the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of transactions to list.
  ///
  /// Default: <code>100</code>
  /// <note>
  /// Even if additional results can be retrieved, the request can return less
  /// results than <code>maxResults</code> or an empty array of results.
  ///
  /// To retrieve the next set of results, make another request with the
  /// returned <code>nextToken</code> value. The value of <code>nextToken</code>
  /// is <code>null</code> when there are no more results to return
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  ///
  /// Parameter [sort] :
  /// The order by which the results will be sorted.
  Future<ListTransactionsOutput> listTransactions({
    required String address,
    required QueryNetwork network,
    ConfirmationStatusFilter? confirmationStatusFilter,
    BlockchainInstant? fromBlockchainInstant,
    int? maxResults,
    String? nextToken,
    ListTransactionsSort? sort,
    BlockchainInstant? toBlockchainInstant,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      'address': address,
      'network': network.toValue(),
      if (confirmationStatusFilter != null)
        'confirmationStatusFilter': confirmationStatusFilter,
      if (fromBlockchainInstant != null)
        'fromBlockchainInstant': fromBlockchainInstant,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (sort != null) 'sort': sort,
      if (toBlockchainInstant != null)
        'toBlockchainInstant': toBlockchainInstant,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-transactions',
      exceptionFnMap: _exceptionFns,
    );
    return ListTransactionsOutput.fromJson(response);
  }
}

/// This is the container for the unique public address on the blockchain.
class AddressIdentifierFilter {
  /// The container for the recipient address of the transaction.
  final List<String> transactionEventToAddress;

  AddressIdentifierFilter({
    required this.transactionEventToAddress,
  });

  Map<String, dynamic> toJson() {
    final transactionEventToAddress = this.transactionEventToAddress;
    return {
      'transactionEventToAddress': transactionEventToAddress,
    };
  }
}

/// This container contains information about an contract.
class AssetContract {
  /// The container for the contract identifier containing its blockchain network
  /// and address.
  final ContractIdentifier contractIdentifier;

  /// The address of the contract deployer.
  final String deployerAddress;

  /// The token standard of the contract.
  final QueryTokenStandard tokenStandard;

  AssetContract({
    required this.contractIdentifier,
    required this.deployerAddress,
    required this.tokenStandard,
  });

  factory AssetContract.fromJson(Map<String, dynamic> json) {
    return AssetContract(
      contractIdentifier: ContractIdentifier.fromJson(
          json['contractIdentifier'] as Map<String, dynamic>),
      deployerAddress: json['deployerAddress'] as String,
      tokenStandard: (json['tokenStandard'] as String).toQueryTokenStandard(),
    );
  }

  Map<String, dynamic> toJson() {
    final contractIdentifier = this.contractIdentifier;
    final deployerAddress = this.deployerAddress;
    final tokenStandard = this.tokenStandard;
    return {
      'contractIdentifier': contractIdentifier,
      'deployerAddress': deployerAddress,
      'tokenStandard': tokenStandard.toValue(),
    };
  }
}

/// Error generated from a failed <code>BatchGetTokenBalance</code> request.
class BatchGetTokenBalanceErrorItem {
  /// The error code associated with the error.
  final String errorCode;

  /// The message associated with the error.
  final String errorMessage;

  /// The type of error.
  final ErrorType errorType;
  final BlockchainInstant? atBlockchainInstant;
  final OwnerIdentifier? ownerIdentifier;
  final TokenIdentifier? tokenIdentifier;

  BatchGetTokenBalanceErrorItem({
    required this.errorCode,
    required this.errorMessage,
    required this.errorType,
    this.atBlockchainInstant,
    this.ownerIdentifier,
    this.tokenIdentifier,
  });

  factory BatchGetTokenBalanceErrorItem.fromJson(Map<String, dynamic> json) {
    return BatchGetTokenBalanceErrorItem(
      errorCode: json['errorCode'] as String,
      errorMessage: json['errorMessage'] as String,
      errorType: (json['errorType'] as String).toErrorType(),
      atBlockchainInstant: json['atBlockchainInstant'] != null
          ? BlockchainInstant.fromJson(
              json['atBlockchainInstant'] as Map<String, dynamic>)
          : null,
      ownerIdentifier: json['ownerIdentifier'] != null
          ? OwnerIdentifier.fromJson(
              json['ownerIdentifier'] as Map<String, dynamic>)
          : null,
      tokenIdentifier: json['tokenIdentifier'] != null
          ? TokenIdentifier.fromJson(
              json['tokenIdentifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final errorType = this.errorType;
    final atBlockchainInstant = this.atBlockchainInstant;
    final ownerIdentifier = this.ownerIdentifier;
    final tokenIdentifier = this.tokenIdentifier;
    return {
      'errorCode': errorCode,
      'errorMessage': errorMessage,
      'errorType': errorType.toValue(),
      if (atBlockchainInstant != null)
        'atBlockchainInstant': atBlockchainInstant,
      if (ownerIdentifier != null) 'ownerIdentifier': ownerIdentifier,
      if (tokenIdentifier != null) 'tokenIdentifier': tokenIdentifier,
    };
  }
}

/// The container for the input for getting a token balance.
class BatchGetTokenBalanceInputItem {
  final OwnerIdentifier ownerIdentifier;
  final TokenIdentifier tokenIdentifier;
  final BlockchainInstant? atBlockchainInstant;

  BatchGetTokenBalanceInputItem({
    required this.ownerIdentifier,
    required this.tokenIdentifier,
    this.atBlockchainInstant,
  });

  Map<String, dynamic> toJson() {
    final ownerIdentifier = this.ownerIdentifier;
    final tokenIdentifier = this.tokenIdentifier;
    final atBlockchainInstant = this.atBlockchainInstant;
    return {
      'ownerIdentifier': ownerIdentifier,
      'tokenIdentifier': tokenIdentifier,
      if (atBlockchainInstant != null)
        'atBlockchainInstant': atBlockchainInstant,
    };
  }
}

class BatchGetTokenBalanceOutput {
  /// An array of <code>BatchGetTokenBalanceErrorItem</code> objects returned from
  /// the request.
  final List<BatchGetTokenBalanceErrorItem> errors;

  /// An array of <code>BatchGetTokenBalanceOutputItem</code> objects returned by
  /// the response.
  final List<BatchGetTokenBalanceOutputItem> tokenBalances;

  BatchGetTokenBalanceOutput({
    required this.errors,
    required this.tokenBalances,
  });

  factory BatchGetTokenBalanceOutput.fromJson(Map<String, dynamic> json) {
    return BatchGetTokenBalanceOutput(
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) =>
              BatchGetTokenBalanceErrorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      tokenBalances: (json['tokenBalances'] as List)
          .whereNotNull()
          .map((e) => BatchGetTokenBalanceOutputItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final tokenBalances = this.tokenBalances;
    return {
      'errors': errors,
      'tokenBalances': tokenBalances,
    };
  }
}

/// The container for the properties of a token balance output.
class BatchGetTokenBalanceOutputItem {
  final BlockchainInstant atBlockchainInstant;

  /// The container for the token balance.
  final String balance;
  final BlockchainInstant? lastUpdatedTime;
  final OwnerIdentifier? ownerIdentifier;
  final TokenIdentifier? tokenIdentifier;

  BatchGetTokenBalanceOutputItem({
    required this.atBlockchainInstant,
    required this.balance,
    this.lastUpdatedTime,
    this.ownerIdentifier,
    this.tokenIdentifier,
  });

  factory BatchGetTokenBalanceOutputItem.fromJson(Map<String, dynamic> json) {
    return BatchGetTokenBalanceOutputItem(
      atBlockchainInstant: BlockchainInstant.fromJson(
          json['atBlockchainInstant'] as Map<String, dynamic>),
      balance: json['balance'] as String,
      lastUpdatedTime: json['lastUpdatedTime'] != null
          ? BlockchainInstant.fromJson(
              json['lastUpdatedTime'] as Map<String, dynamic>)
          : null,
      ownerIdentifier: json['ownerIdentifier'] != null
          ? OwnerIdentifier.fromJson(
              json['ownerIdentifier'] as Map<String, dynamic>)
          : null,
      tokenIdentifier: json['tokenIdentifier'] != null
          ? TokenIdentifier.fromJson(
              json['tokenIdentifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final atBlockchainInstant = this.atBlockchainInstant;
    final balance = this.balance;
    final lastUpdatedTime = this.lastUpdatedTime;
    final ownerIdentifier = this.ownerIdentifier;
    final tokenIdentifier = this.tokenIdentifier;
    return {
      'atBlockchainInstant': atBlockchainInstant,
      'balance': balance,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (ownerIdentifier != null) 'ownerIdentifier': ownerIdentifier,
      if (tokenIdentifier != null) 'tokenIdentifier': tokenIdentifier,
    };
  }
}

/// The container for time.
class BlockchainInstant {
  /// The container of the <code>Timestamp</code> of the blockchain instant.
  /// <note>
  /// This <code>timestamp</code> will only be recorded up to the second.
  /// </note>
  final DateTime? time;

  BlockchainInstant({
    this.time,
  });

  factory BlockchainInstant.fromJson(Map<String, dynamic> json) {
    return BlockchainInstant(
      time: timeStampFromJson(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    final time = this.time;
    return {
      if (time != null) 'time': unixTimestampToJson(time),
    };
  }
}

enum ConfirmationStatus {
  $final,
  nonfinal,
}

extension ConfirmationStatusValueExtension on ConfirmationStatus {
  String toValue() {
    switch (this) {
      case ConfirmationStatus.$final:
        return 'FINAL';
      case ConfirmationStatus.nonfinal:
        return 'NONFINAL';
    }
  }
}

extension ConfirmationStatusFromString on String {
  ConfirmationStatus toConfirmationStatus() {
    switch (this) {
      case 'FINAL':
        return ConfirmationStatus.$final;
      case 'NONFINAL':
        return ConfirmationStatus.nonfinal;
    }
    throw Exception('$this is not known in enum ConfirmationStatus');
  }
}

/// The container for the <code>ConfirmationStatusFilter</code> that filters for
/// the <a
/// href="https://docs.aws.amazon.com/managed-blockchain/latest/ambq-dg/key-concepts.html#finality">
/// <i>finality</i> </a> of the results.
class ConfirmationStatusFilter {
  /// The container to determine whether to list results that have only reached <a
  /// href="https://docs.aws.amazon.com/managed-blockchain/latest/ambq-dg/key-concepts.html#finality">
  /// <i>finality</i> </a>. Transactions that have reached finality are always
  /// part of the response.
  final List<ConfirmationStatus> include;

  ConfirmationStatusFilter({
    required this.include,
  });

  Map<String, dynamic> toJson() {
    final include = this.include;
    return {
      'include': include.map((e) => e.toValue()).toList(),
    };
  }
}

/// The contract or wallet address by which to filter the request.
class ContractFilter {
  /// The network address of the deployer.
  final String deployerAddress;

  /// The blockchain network of the contract.
  final QueryNetwork network;

  /// The container for the token standard.
  final QueryTokenStandard tokenStandard;

  ContractFilter({
    required this.deployerAddress,
    required this.network,
    required this.tokenStandard,
  });

  Map<String, dynamic> toJson() {
    final deployerAddress = this.deployerAddress;
    final network = this.network;
    final tokenStandard = this.tokenStandard;
    return {
      'deployerAddress': deployerAddress,
      'network': network.toValue(),
      'tokenStandard': tokenStandard.toValue(),
    };
  }
}

/// Container for the blockchain address and network information about a
/// contract.
class ContractIdentifier {
  /// Container for the blockchain address about a contract.
  final String contractAddress;

  /// The blockchain network of the contract.
  final QueryNetwork network;

  ContractIdentifier({
    required this.contractAddress,
    required this.network,
  });

  factory ContractIdentifier.fromJson(Map<String, dynamic> json) {
    return ContractIdentifier(
      contractAddress: json['contractAddress'] as String,
      network: (json['network'] as String).toQueryNetwork(),
    );
  }

  Map<String, dynamic> toJson() {
    final contractAddress = this.contractAddress;
    final network = this.network;
    return {
      'contractAddress': contractAddress,
      'network': network.toValue(),
    };
  }
}

/// The metadata of the contract.
class ContractMetadata {
  /// The decimals used by the token contract.
  final int? decimals;

  /// The name of the token contract.
  final String? name;

  /// The symbol of the token contract.
  final String? symbol;

  ContractMetadata({
    this.decimals,
    this.name,
    this.symbol,
  });

  factory ContractMetadata.fromJson(Map<String, dynamic> json) {
    return ContractMetadata(
      decimals: json['decimals'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final decimals = this.decimals;
    final name = this.name;
    final symbol = this.symbol;
    return {
      if (decimals != null) 'decimals': decimals,
      if (name != null) 'name': name,
      if (symbol != null) 'symbol': symbol,
    };
  }
}

enum ErrorType {
  validationException,
  resourceNotFoundException,
}

extension ErrorTypeValueExtension on ErrorType {
  String toValue() {
    switch (this) {
      case ErrorType.validationException:
        return 'VALIDATION_EXCEPTION';
      case ErrorType.resourceNotFoundException:
        return 'RESOURCE_NOT_FOUND_EXCEPTION';
    }
  }
}

extension ErrorTypeFromString on String {
  ErrorType toErrorType() {
    switch (this) {
      case 'VALIDATION_EXCEPTION':
        return ErrorType.validationException;
      case 'RESOURCE_NOT_FOUND_EXCEPTION':
        return ErrorType.resourceNotFoundException;
    }
    throw Exception('$this is not known in enum ErrorType');
  }
}

enum ExecutionStatus {
  failed,
  succeeded,
}

extension ExecutionStatusValueExtension on ExecutionStatus {
  String toValue() {
    switch (this) {
      case ExecutionStatus.failed:
        return 'FAILED';
      case ExecutionStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension ExecutionStatusFromString on String {
  ExecutionStatus toExecutionStatus() {
    switch (this) {
      case 'FAILED':
        return ExecutionStatus.failed;
      case 'SUCCEEDED':
        return ExecutionStatus.succeeded;
    }
    throw Exception('$this is not known in enum ExecutionStatus');
  }
}

class GetAssetContractOutput {
  /// Contains the blockchain address and network information about the contract.
  final ContractIdentifier contractIdentifier;

  /// The address of the deployer of contract.
  final String deployerAddress;

  /// The token standard of the contract requested.
  final QueryTokenStandard tokenStandard;
  final ContractMetadata? metadata;

  GetAssetContractOutput({
    required this.contractIdentifier,
    required this.deployerAddress,
    required this.tokenStandard,
    this.metadata,
  });

  factory GetAssetContractOutput.fromJson(Map<String, dynamic> json) {
    return GetAssetContractOutput(
      contractIdentifier: ContractIdentifier.fromJson(
          json['contractIdentifier'] as Map<String, dynamic>),
      deployerAddress: json['deployerAddress'] as String,
      tokenStandard: (json['tokenStandard'] as String).toQueryTokenStandard(),
      metadata: json['metadata'] != null
          ? ContractMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contractIdentifier = this.contractIdentifier;
    final deployerAddress = this.deployerAddress;
    final tokenStandard = this.tokenStandard;
    final metadata = this.metadata;
    return {
      'contractIdentifier': contractIdentifier,
      'deployerAddress': deployerAddress,
      'tokenStandard': tokenStandard.toValue(),
      if (metadata != null) 'metadata': metadata,
    };
  }
}

class GetTokenBalanceOutput {
  final BlockchainInstant atBlockchainInstant;

  /// The container for the token balance.
  final String balance;
  final BlockchainInstant? lastUpdatedTime;
  final OwnerIdentifier? ownerIdentifier;
  final TokenIdentifier? tokenIdentifier;

  GetTokenBalanceOutput({
    required this.atBlockchainInstant,
    required this.balance,
    this.lastUpdatedTime,
    this.ownerIdentifier,
    this.tokenIdentifier,
  });

  factory GetTokenBalanceOutput.fromJson(Map<String, dynamic> json) {
    return GetTokenBalanceOutput(
      atBlockchainInstant: BlockchainInstant.fromJson(
          json['atBlockchainInstant'] as Map<String, dynamic>),
      balance: json['balance'] as String,
      lastUpdatedTime: json['lastUpdatedTime'] != null
          ? BlockchainInstant.fromJson(
              json['lastUpdatedTime'] as Map<String, dynamic>)
          : null,
      ownerIdentifier: json['ownerIdentifier'] != null
          ? OwnerIdentifier.fromJson(
              json['ownerIdentifier'] as Map<String, dynamic>)
          : null,
      tokenIdentifier: json['tokenIdentifier'] != null
          ? TokenIdentifier.fromJson(
              json['tokenIdentifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final atBlockchainInstant = this.atBlockchainInstant;
    final balance = this.balance;
    final lastUpdatedTime = this.lastUpdatedTime;
    final ownerIdentifier = this.ownerIdentifier;
    final tokenIdentifier = this.tokenIdentifier;
    return {
      'atBlockchainInstant': atBlockchainInstant,
      'balance': balance,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (ownerIdentifier != null) 'ownerIdentifier': ownerIdentifier,
      if (tokenIdentifier != null) 'tokenIdentifier': tokenIdentifier,
    };
  }
}

class GetTransactionOutput {
  /// Contains the details of the transaction.
  final Transaction transaction;

  GetTransactionOutput({
    required this.transaction,
  });

  factory GetTransactionOutput.fromJson(Map<String, dynamic> json) {
    return GetTransactionOutput(
      transaction:
          Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final transaction = this.transaction;
    return {
      'transaction': transaction,
    };
  }
}

class ListAssetContractsOutput {
  /// An array of contract objects that contain the properties for each contract.
  final List<AssetContract> contracts;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListAssetContractsOutput({
    required this.contracts,
    this.nextToken,
  });

  factory ListAssetContractsOutput.fromJson(Map<String, dynamic> json) {
    return ListAssetContractsOutput(
      contracts: (json['contracts'] as List)
          .whereNotNull()
          .map((e) => AssetContract.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contracts = this.contracts;
    final nextToken = this.nextToken;
    return {
      'contracts': contracts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFilteredTransactionEventsOutput {
  /// The transaction events returned by the request.
  final List<TransactionEvent> events;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListFilteredTransactionEventsOutput({
    required this.events,
    this.nextToken,
  });

  factory ListFilteredTransactionEventsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListFilteredTransactionEventsOutput(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => TransactionEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Lists all the transaction events for an address on the blockchain.
/// <note>
/// This operation is only supported on the Bitcoin blockchain networks.
/// </note>
class ListFilteredTransactionEventsSort {
  /// Container on how the results will be sorted by?
  final ListFilteredTransactionEventsSortBy? sortBy;

  /// The container for the <i>sort order</i> for
  /// <code>ListFilteredTransactionEvents</code>. The <code>SortOrder</code> field
  /// only accepts the values <code>ASCENDING</code> and <code>DESCENDING</code>.
  /// Not providing <code>SortOrder</code> will default to <code>ASCENDING</code>.
  final SortOrder? sortOrder;

  ListFilteredTransactionEventsSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

enum ListFilteredTransactionEventsSortBy {
  blockchainInstant,
}

extension ListFilteredTransactionEventsSortByValueExtension
    on ListFilteredTransactionEventsSortBy {
  String toValue() {
    switch (this) {
      case ListFilteredTransactionEventsSortBy.blockchainInstant:
        return 'blockchainInstant';
    }
  }
}

extension ListFilteredTransactionEventsSortByFromString on String {
  ListFilteredTransactionEventsSortBy toListFilteredTransactionEventsSortBy() {
    switch (this) {
      case 'blockchainInstant':
        return ListFilteredTransactionEventsSortBy.blockchainInstant;
    }
    throw Exception(
        '$this is not known in enum ListFilteredTransactionEventsSortBy');
  }
}

class ListTokenBalancesOutput {
  /// An array of <code>TokenBalance</code> objects. Each object contains details
  /// about the token balance.
  final List<TokenBalance> tokenBalances;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListTokenBalancesOutput({
    required this.tokenBalances,
    this.nextToken,
  });

  factory ListTokenBalancesOutput.fromJson(Map<String, dynamic> json) {
    return ListTokenBalancesOutput(
      tokenBalances: (json['tokenBalances'] as List)
          .whereNotNull()
          .map((e) => TokenBalance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tokenBalances = this.tokenBalances;
    final nextToken = this.nextToken;
    return {
      'tokenBalances': tokenBalances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTransactionEventsOutput {
  /// An array of <code>TransactionEvent</code> objects. Each object contains
  /// details about the transaction events.
  final List<TransactionEvent> events;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListTransactionEventsOutput({
    required this.events,
    this.nextToken,
  });

  factory ListTransactionEventsOutput.fromJson(Map<String, dynamic> json) {
    return ListTransactionEventsOutput(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => TransactionEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTransactionsOutput {
  /// The array of transactions returned by the request.
  final List<TransactionOutputItem> transactions;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  ListTransactionsOutput({
    required this.transactions,
    this.nextToken,
  });

  factory ListTransactionsOutput.fromJson(Map<String, dynamic> json) {
    return ListTransactionsOutput(
      transactions: (json['transactions'] as List)
          .whereNotNull()
          .map((e) => TransactionOutputItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transactions = this.transactions;
    final nextToken = this.nextToken;
    return {
      'transactions': transactions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The container for determining how the list transaction result will be
/// sorted.
class ListTransactionsSort {
  /// Defaults to the value <code>TRANSACTION_TIMESTAMP</code>.
  final ListTransactionsSortBy? sortBy;

  /// The container for the <i>sort order</i> for <code>ListTransactions</code>.
  /// The <code>SortOrder</code> field only accepts the values
  /// <code>ASCENDING</code> and <code>DESCENDING</code>. Not providing
  /// <code>SortOrder</code> will default to <code>ASCENDING</code>.
  final SortOrder? sortOrder;

  ListTransactionsSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'sortBy': sortBy.toValue(),
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
  }
}

enum ListTransactionsSortBy {
  transactionTimestamp,
}

extension ListTransactionsSortByValueExtension on ListTransactionsSortBy {
  String toValue() {
    switch (this) {
      case ListTransactionsSortBy.transactionTimestamp:
        return 'TRANSACTION_TIMESTAMP';
    }
  }
}

extension ListTransactionsSortByFromString on String {
  ListTransactionsSortBy toListTransactionsSortBy() {
    switch (this) {
      case 'TRANSACTION_TIMESTAMP':
        return ListTransactionsSortBy.transactionTimestamp;
    }
    throw Exception('$this is not known in enum ListTransactionsSortBy');
  }
}

/// The container for the owner information to filter by.
class OwnerFilter {
  /// The contract or wallet address.
  final String address;

  OwnerFilter({
    required this.address,
  });

  Map<String, dynamic> toJson() {
    final address = this.address;
    return {
      'address': address,
    };
  }
}

/// The container for the owner identifier.
class OwnerIdentifier {
  /// The contract or wallet address for the owner.
  final String address;

  OwnerIdentifier({
    required this.address,
  });

  factory OwnerIdentifier.fromJson(Map<String, dynamic> json) {
    return OwnerIdentifier(
      address: json['address'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    return {
      'address': address,
    };
  }
}

enum QueryNetwork {
  ethereumMainnet,
  ethereumSepoliaTestnet,
  bitcoinMainnet,
  bitcoinTestnet,
}

extension QueryNetworkValueExtension on QueryNetwork {
  String toValue() {
    switch (this) {
      case QueryNetwork.ethereumMainnet:
        return 'ETHEREUM_MAINNET';
      case QueryNetwork.ethereumSepoliaTestnet:
        return 'ETHEREUM_SEPOLIA_TESTNET';
      case QueryNetwork.bitcoinMainnet:
        return 'BITCOIN_MAINNET';
      case QueryNetwork.bitcoinTestnet:
        return 'BITCOIN_TESTNET';
    }
  }
}

extension QueryNetworkFromString on String {
  QueryNetwork toQueryNetwork() {
    switch (this) {
      case 'ETHEREUM_MAINNET':
        return QueryNetwork.ethereumMainnet;
      case 'ETHEREUM_SEPOLIA_TESTNET':
        return QueryNetwork.ethereumSepoliaTestnet;
      case 'BITCOIN_MAINNET':
        return QueryNetwork.bitcoinMainnet;
      case 'BITCOIN_TESTNET':
        return QueryNetwork.bitcoinTestnet;
    }
    throw Exception('$this is not known in enum QueryNetwork');
  }
}

enum QueryTokenStandard {
  erc20,
  erc721,
  erc1155,
}

extension QueryTokenStandardValueExtension on QueryTokenStandard {
  String toValue() {
    switch (this) {
      case QueryTokenStandard.erc20:
        return 'ERC20';
      case QueryTokenStandard.erc721:
        return 'ERC721';
      case QueryTokenStandard.erc1155:
        return 'ERC1155';
    }
  }
}

extension QueryTokenStandardFromString on String {
  QueryTokenStandard toQueryTokenStandard() {
    switch (this) {
      case 'ERC20':
        return QueryTokenStandard.erc20;
      case 'ERC721':
        return QueryTokenStandard.erc721;
      case 'ERC1155':
        return QueryTokenStandard.erc1155;
    }
    throw Exception('$this is not known in enum QueryTokenStandard');
  }
}

enum QueryTransactionEventType {
  erc20Transfer,
  erc20Mint,
  erc20Burn,
  erc20Deposit,
  erc20Withdrawal,
  erc721Transfer,
  erc1155Transfer,
  bitcoinVin,
  bitcoinVout,
  internalEthTransfer,
  ethTransfer,
}

extension QueryTransactionEventTypeValueExtension on QueryTransactionEventType {
  String toValue() {
    switch (this) {
      case QueryTransactionEventType.erc20Transfer:
        return 'ERC20_TRANSFER';
      case QueryTransactionEventType.erc20Mint:
        return 'ERC20_MINT';
      case QueryTransactionEventType.erc20Burn:
        return 'ERC20_BURN';
      case QueryTransactionEventType.erc20Deposit:
        return 'ERC20_DEPOSIT';
      case QueryTransactionEventType.erc20Withdrawal:
        return 'ERC20_WITHDRAWAL';
      case QueryTransactionEventType.erc721Transfer:
        return 'ERC721_TRANSFER';
      case QueryTransactionEventType.erc1155Transfer:
        return 'ERC1155_TRANSFER';
      case QueryTransactionEventType.bitcoinVin:
        return 'BITCOIN_VIN';
      case QueryTransactionEventType.bitcoinVout:
        return 'BITCOIN_VOUT';
      case QueryTransactionEventType.internalEthTransfer:
        return 'INTERNAL_ETH_TRANSFER';
      case QueryTransactionEventType.ethTransfer:
        return 'ETH_TRANSFER';
    }
  }
}

extension QueryTransactionEventTypeFromString on String {
  QueryTransactionEventType toQueryTransactionEventType() {
    switch (this) {
      case 'ERC20_TRANSFER':
        return QueryTransactionEventType.erc20Transfer;
      case 'ERC20_MINT':
        return QueryTransactionEventType.erc20Mint;
      case 'ERC20_BURN':
        return QueryTransactionEventType.erc20Burn;
      case 'ERC20_DEPOSIT':
        return QueryTransactionEventType.erc20Deposit;
      case 'ERC20_WITHDRAWAL':
        return QueryTransactionEventType.erc20Withdrawal;
      case 'ERC721_TRANSFER':
        return QueryTransactionEventType.erc721Transfer;
      case 'ERC1155_TRANSFER':
        return QueryTransactionEventType.erc1155Transfer;
      case 'BITCOIN_VIN':
        return QueryTransactionEventType.bitcoinVin;
      case 'BITCOIN_VOUT':
        return QueryTransactionEventType.bitcoinVout;
      case 'INTERNAL_ETH_TRANSFER':
        return QueryTransactionEventType.internalEthTransfer;
      case 'ETH_TRANSFER':
        return QueryTransactionEventType.ethTransfer;
    }
    throw Exception('$this is not known in enum QueryTransactionEventType');
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// This container is used to specify a time frame.
class TimeFilter {
  final BlockchainInstant? from;
  final BlockchainInstant? to;

  TimeFilter({
    this.from,
    this.to,
  });

  Map<String, dynamic> toJson() {
    final from = this.from;
    final to = this.to;
    return {
      if (from != null) 'from': from,
      if (to != null) 'to': to,
    };
  }
}

/// The balance of the token.
class TokenBalance {
  /// The time for when the TokenBalance is requested or the current time if a
  /// time is not provided in the request.
  /// <note>
  /// This time will only be recorded up to the second.
  /// </note>
  final BlockchainInstant atBlockchainInstant;

  /// The container of the token balance.
  final String balance;

  /// The <code>Timestamp</code> of the last transaction at which the balance for
  /// the token in the wallet was updated.
  final BlockchainInstant? lastUpdatedTime;

  /// The container for the identifier of the owner.
  final OwnerIdentifier? ownerIdentifier;

  /// The identifier for the token, including the unique token ID and its
  /// blockchain network.
  final TokenIdentifier? tokenIdentifier;

  TokenBalance({
    required this.atBlockchainInstant,
    required this.balance,
    this.lastUpdatedTime,
    this.ownerIdentifier,
    this.tokenIdentifier,
  });

  factory TokenBalance.fromJson(Map<String, dynamic> json) {
    return TokenBalance(
      atBlockchainInstant: BlockchainInstant.fromJson(
          json['atBlockchainInstant'] as Map<String, dynamic>),
      balance: json['balance'] as String,
      lastUpdatedTime: json['lastUpdatedTime'] != null
          ? BlockchainInstant.fromJson(
              json['lastUpdatedTime'] as Map<String, dynamic>)
          : null,
      ownerIdentifier: json['ownerIdentifier'] != null
          ? OwnerIdentifier.fromJson(
              json['ownerIdentifier'] as Map<String, dynamic>)
          : null,
      tokenIdentifier: json['tokenIdentifier'] != null
          ? TokenIdentifier.fromJson(
              json['tokenIdentifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final atBlockchainInstant = this.atBlockchainInstant;
    final balance = this.balance;
    final lastUpdatedTime = this.lastUpdatedTime;
    final ownerIdentifier = this.ownerIdentifier;
    final tokenIdentifier = this.tokenIdentifier;
    return {
      'atBlockchainInstant': atBlockchainInstant,
      'balance': balance,
      if (lastUpdatedTime != null) 'lastUpdatedTime': lastUpdatedTime,
      if (ownerIdentifier != null) 'ownerIdentifier': ownerIdentifier,
      if (tokenIdentifier != null) 'tokenIdentifier': tokenIdentifier,
    };
  }
}

/// The container of the token filter like the contract address on a given
/// blockchain network or a unique token identifier on a given blockchain
/// network.
/// <note>
/// You must always specify the network property of this container when using
/// this operation.
/// </note>
class TokenFilter {
  /// The blockchain network of the token.
  final QueryNetwork network;

  /// This is the address of the contract.
  final String? contractAddress;

  /// The unique identifier of the token.
  final String? tokenId;

  TokenFilter({
    required this.network,
    this.contractAddress,
    this.tokenId,
  });

  Map<String, dynamic> toJson() {
    final network = this.network;
    final contractAddress = this.contractAddress;
    final tokenId = this.tokenId;
    return {
      'network': network.toValue(),
      if (contractAddress != null) 'contractAddress': contractAddress,
      if (tokenId != null) 'tokenId': tokenId,
    };
  }
}

/// The container for the identifier for the token including the unique token ID
/// and its blockchain network.
/// <note>
/// Only the native tokens BTC and ETH, and the ERC-20, ERC-721, and ERC 1155
/// token standards are supported.
/// </note>
class TokenIdentifier {
  /// The blockchain network of the token.
  final QueryNetwork network;

  /// This is the token's contract address.
  final String? contractAddress;

  /// The unique identifier of the token.
  /// <note>
  /// For native tokens, use the 3 character abbreviation that best matches your
  /// token. For example, btc for Bitcoin, eth for Ether, etc. For all other token
  /// types you must specify the <code>tokenId</code> in the 64 character
  /// hexadecimal <code>tokenid</code> format.
  /// </note>
  final String? tokenId;

  TokenIdentifier({
    required this.network,
    this.contractAddress,
    this.tokenId,
  });

  factory TokenIdentifier.fromJson(Map<String, dynamic> json) {
    return TokenIdentifier(
      network: (json['network'] as String).toQueryNetwork(),
      contractAddress: json['contractAddress'] as String?,
      tokenId: json['tokenId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final network = this.network;
    final contractAddress = this.contractAddress;
    final tokenId = this.tokenId;
    return {
      'network': network.toValue(),
      if (contractAddress != null) 'contractAddress': contractAddress,
      if (tokenId != null) 'tokenId': tokenId,
    };
  }
}

/// There are two possible types of transactions used for this data type:
///
/// <ul>
/// <li>
/// A Bitcoin transaction is a movement of BTC from one address to another.
/// </li>
/// <li>
/// An Ethereum transaction refers to an action initiated by an externally owned
/// account, which is an account managed by a human, not a contract. For
/// example, if Bob sends Alice 1 ETH, Bob's account must be debited and Alice's
/// must be credited. This state-changing action occurs within a transaction.
/// </li>
/// </ul>
class Transaction {
  /// The blockchain network where the transaction occurred.
  final QueryNetwork network;

  /// The number of transactions in the block.
  final int numberOfTransactions;

  /// The identifier of the transaction. It is generated whenever a transaction is
  /// verified and added to the blockchain.
  final String to;

  /// The hash of a transaction. It is generated when a transaction is created.
  final String transactionHash;

  /// The index of the transaction within a blockchain.
  final int transactionIndex;

  /// The <code>Timestamp</code> of the transaction.
  final DateTime transactionTimestamp;

  /// The block hash is a unique identifier for a block. It is a fixed-size string
  /// that is calculated by using the information in the block. The block hash is
  /// used to verify the integrity of the data in the block.
  final String? blockHash;

  /// The block number in which the transaction is recorded.
  final String? blockNumber;

  /// Specifies whether the transaction has reached Finality.
  final ConfirmationStatus? confirmationStatus;

  /// The blockchain address for the contract.
  final String? contractAddress;

  /// The amount of gas used up to the specified point in the block.
  final String? cumulativeGasUsed;

  /// The effective gas price.
  final String? effectiveGasPrice;

  /// Identifies whether the transaction has succeeded or failed.
  final ExecutionStatus? executionStatus;

  /// The initiator of the transaction. It is either in the form a public key or a
  /// contract address.
  final String? from;

  /// The amount of gas used for the transaction.
  final String? gasUsed;

  /// The signature of the transaction. The X coordinate of a point R.
  final String? signatureR;

  /// The signature of the transaction. The Y coordinate of a point S.
  final String? signatureS;

  /// The signature of the transaction. The Z coordinate of a point V.
  final int? signatureV;

  /// The transaction fee.
  final String? transactionFee;

  /// The identifier of a Bitcoin transaction. It is generated when a transaction
  /// is created.
  final String? transactionId;

  Transaction({
    required this.network,
    required this.numberOfTransactions,
    required this.to,
    required this.transactionHash,
    required this.transactionIndex,
    required this.transactionTimestamp,
    this.blockHash,
    this.blockNumber,
    this.confirmationStatus,
    this.contractAddress,
    this.cumulativeGasUsed,
    this.effectiveGasPrice,
    this.executionStatus,
    this.from,
    this.gasUsed,
    this.signatureR,
    this.signatureS,
    this.signatureV,
    this.transactionFee,
    this.transactionId,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      network: (json['network'] as String).toQueryNetwork(),
      numberOfTransactions: json['numberOfTransactions'] as int,
      to: json['to'] as String,
      transactionHash: json['transactionHash'] as String,
      transactionIndex: json['transactionIndex'] as int,
      transactionTimestamp:
          nonNullableTimeStampFromJson(json['transactionTimestamp'] as Object),
      blockHash: json['blockHash'] as String?,
      blockNumber: json['blockNumber'] as String?,
      confirmationStatus:
          (json['confirmationStatus'] as String?)?.toConfirmationStatus(),
      contractAddress: json['contractAddress'] as String?,
      cumulativeGasUsed: json['cumulativeGasUsed'] as String?,
      effectiveGasPrice: json['effectiveGasPrice'] as String?,
      executionStatus:
          (json['executionStatus'] as String?)?.toExecutionStatus(),
      from: json['from'] as String?,
      gasUsed: json['gasUsed'] as String?,
      signatureR: json['signatureR'] as String?,
      signatureS: json['signatureS'] as String?,
      signatureV: json['signatureV'] as int?,
      transactionFee: json['transactionFee'] as String?,
      transactionId: json['transactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final network = this.network;
    final numberOfTransactions = this.numberOfTransactions;
    final to = this.to;
    final transactionHash = this.transactionHash;
    final transactionIndex = this.transactionIndex;
    final transactionTimestamp = this.transactionTimestamp;
    final blockHash = this.blockHash;
    final blockNumber = this.blockNumber;
    final confirmationStatus = this.confirmationStatus;
    final contractAddress = this.contractAddress;
    final cumulativeGasUsed = this.cumulativeGasUsed;
    final effectiveGasPrice = this.effectiveGasPrice;
    final executionStatus = this.executionStatus;
    final from = this.from;
    final gasUsed = this.gasUsed;
    final signatureR = this.signatureR;
    final signatureS = this.signatureS;
    final signatureV = this.signatureV;
    final transactionFee = this.transactionFee;
    final transactionId = this.transactionId;
    return {
      'network': network.toValue(),
      'numberOfTransactions': numberOfTransactions,
      'to': to,
      'transactionHash': transactionHash,
      'transactionIndex': transactionIndex,
      'transactionTimestamp': unixTimestampToJson(transactionTimestamp),
      if (blockHash != null) 'blockHash': blockHash,
      if (blockNumber != null) 'blockNumber': blockNumber,
      if (confirmationStatus != null)
        'confirmationStatus': confirmationStatus.toValue(),
      if (contractAddress != null) 'contractAddress': contractAddress,
      if (cumulativeGasUsed != null) 'cumulativeGasUsed': cumulativeGasUsed,
      if (effectiveGasPrice != null) 'effectiveGasPrice': effectiveGasPrice,
      if (executionStatus != null) 'executionStatus': executionStatus.toValue(),
      if (from != null) 'from': from,
      if (gasUsed != null) 'gasUsed': gasUsed,
      if (signatureR != null) 'signatureR': signatureR,
      if (signatureS != null) 'signatureS': signatureS,
      if (signatureV != null) 'signatureV': signatureV,
      if (transactionFee != null) 'transactionFee': transactionFee,
      if (transactionId != null) 'transactionId': transactionId,
    };
  }
}

/// The container for the properties of a transaction event.
class TransactionEvent {
  /// The type of transaction event.
  final QueryTransactionEventType eventType;

  /// The blockchain network where the transaction occurred.
  final QueryNetwork network;

  /// The hash of a transaction. It is generated when a transaction is created.
  final String transactionHash;
  final BlockchainInstant? blockchainInstant;

  /// This container specifies whether the transaction has reached Finality.
  final ConfirmationStatus? confirmationStatus;

  /// The blockchain address for the contract
  final String? contractAddress;

  /// The wallet address initiating the transaction. It can either be a public key
  /// or a contract.
  final String? from;

  /// The position of the spent transaction output in the output list of the
  /// <i>creating transaction</i>.
  /// <note>
  /// This is only returned for <code>BITCOIN_VIN</code> event types.
  /// </note>
  final int? spentVoutIndex;

  /// The transactionHash that <i>created</i> the spent transaction output.
  /// <note>
  /// This is only returned for <code>BITCOIN_VIN</code> event types.
  /// </note>
  final String? spentVoutTransactionHash;

  /// The transactionId that <i>created</i> the spent transaction output.
  /// <note>
  /// This is only returned for <code>BITCOIN_VIN</code> event types.
  /// </note>
  final String? spentVoutTransactionId;

  /// The wallet address receiving the transaction. It can either be a public key
  /// or a contract.
  final String? to;

  /// The unique identifier for the token involved in the transaction.
  final String? tokenId;

  /// The identifier of a Bitcoin transaction. It is generated when a transaction
  /// is created.
  final String? transactionId;

  /// The value that was transacted.
  final String? value;

  /// The position of the transaction output in the transaction output list.
  final int? voutIndex;

  /// Specifies if the transaction output is spent or unspent. This is only
  /// returned for BITCOIN_VOUT event types.
  /// <note>
  /// This is only returned for <code>BITCOIN_VOUT</code> event types.
  /// </note>
  final bool? voutSpent;

  TransactionEvent({
    required this.eventType,
    required this.network,
    required this.transactionHash,
    this.blockchainInstant,
    this.confirmationStatus,
    this.contractAddress,
    this.from,
    this.spentVoutIndex,
    this.spentVoutTransactionHash,
    this.spentVoutTransactionId,
    this.to,
    this.tokenId,
    this.transactionId,
    this.value,
    this.voutIndex,
    this.voutSpent,
  });

  factory TransactionEvent.fromJson(Map<String, dynamic> json) {
    return TransactionEvent(
      eventType: (json['eventType'] as String).toQueryTransactionEventType(),
      network: (json['network'] as String).toQueryNetwork(),
      transactionHash: json['transactionHash'] as String,
      blockchainInstant: json['blockchainInstant'] != null
          ? BlockchainInstant.fromJson(
              json['blockchainInstant'] as Map<String, dynamic>)
          : null,
      confirmationStatus:
          (json['confirmationStatus'] as String?)?.toConfirmationStatus(),
      contractAddress: json['contractAddress'] as String?,
      from: json['from'] as String?,
      spentVoutIndex: json['spentVoutIndex'] as int?,
      spentVoutTransactionHash: json['spentVoutTransactionHash'] as String?,
      spentVoutTransactionId: json['spentVoutTransactionId'] as String?,
      to: json['to'] as String?,
      tokenId: json['tokenId'] as String?,
      transactionId: json['transactionId'] as String?,
      value: json['value'] as String?,
      voutIndex: json['voutIndex'] as int?,
      voutSpent: json['voutSpent'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final network = this.network;
    final transactionHash = this.transactionHash;
    final blockchainInstant = this.blockchainInstant;
    final confirmationStatus = this.confirmationStatus;
    final contractAddress = this.contractAddress;
    final from = this.from;
    final spentVoutIndex = this.spentVoutIndex;
    final spentVoutTransactionHash = this.spentVoutTransactionHash;
    final spentVoutTransactionId = this.spentVoutTransactionId;
    final to = this.to;
    final tokenId = this.tokenId;
    final transactionId = this.transactionId;
    final value = this.value;
    final voutIndex = this.voutIndex;
    final voutSpent = this.voutSpent;
    return {
      'eventType': eventType.toValue(),
      'network': network.toValue(),
      'transactionHash': transactionHash,
      if (blockchainInstant != null) 'blockchainInstant': blockchainInstant,
      if (confirmationStatus != null)
        'confirmationStatus': confirmationStatus.toValue(),
      if (contractAddress != null) 'contractAddress': contractAddress,
      if (from != null) 'from': from,
      if (spentVoutIndex != null) 'spentVoutIndex': spentVoutIndex,
      if (spentVoutTransactionHash != null)
        'spentVoutTransactionHash': spentVoutTransactionHash,
      if (spentVoutTransactionId != null)
        'spentVoutTransactionId': spentVoutTransactionId,
      if (to != null) 'to': to,
      if (tokenId != null) 'tokenId': tokenId,
      if (transactionId != null) 'transactionId': transactionId,
      if (value != null) 'value': value,
      if (voutIndex != null) 'voutIndex': voutIndex,
      if (voutSpent != null) 'voutSpent': voutSpent,
    };
  }
}

/// The container of the transaction output.
class TransactionOutputItem {
  /// The blockchain network where the transaction occurred.
  final QueryNetwork network;

  /// The hash of a transaction. It is generated when a transaction is created.
  final String transactionHash;

  /// The time when the transaction occurred.
  final DateTime transactionTimestamp;

  /// Specifies whether to list transactions that have not reached Finality.
  final ConfirmationStatus? confirmationStatus;

  /// The identifier of a Bitcoin transaction. It is generated when a transaction
  /// is created.
  final String? transactionId;

  TransactionOutputItem({
    required this.network,
    required this.transactionHash,
    required this.transactionTimestamp,
    this.confirmationStatus,
    this.transactionId,
  });

  factory TransactionOutputItem.fromJson(Map<String, dynamic> json) {
    return TransactionOutputItem(
      network: (json['network'] as String).toQueryNetwork(),
      transactionHash: json['transactionHash'] as String,
      transactionTimestamp:
          nonNullableTimeStampFromJson(json['transactionTimestamp'] as Object),
      confirmationStatus:
          (json['confirmationStatus'] as String?)?.toConfirmationStatus(),
      transactionId: json['transactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final network = this.network;
    final transactionHash = this.transactionHash;
    final transactionTimestamp = this.transactionTimestamp;
    final confirmationStatus = this.confirmationStatus;
    final transactionId = this.transactionId;
    return {
      'network': network.toValue(),
      'transactionHash': transactionHash,
      'transactionTimestamp': unixTimestampToJson(transactionTimestamp),
      if (confirmationStatus != null)
        'confirmationStatus': confirmationStatus.toValue(),
      if (transactionId != null) 'transactionId': transactionId,
    };
  }
}

/// This container specifies filtering attributes related to
/// <code>BITCOIN_VOUT</code> event types
class VoutFilter {
  /// Specifies if the transaction output is spent or unspent.
  final bool voutSpent;

  VoutFilter({
    required this.voutSpent,
  });

  Map<String, dynamic> toJson() {
    final voutSpent = this.voutSpent;
    return {
      'voutSpent': voutSpent,
    };
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
