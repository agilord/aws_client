// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// AWS Marketplace is a curated digital catalog that customers can use to find,
/// buy, deploy, and manage third-party software, data, and services to build
/// solutions and run their businesses. The AWS Marketplace Agreement Service
/// provides an API interface that helps AWS Marketplace sellers and buyers
/// manage their product-related agreements, including listing, searching,
/// creating, and filtering agreements.
class MarketplaceAgreement {
  final _s.JsonProtocol _protocol;
  MarketplaceAgreement({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'agreement-marketplace',
            signingName: 'aws-marketplace',
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

  /// Allows buyers (acceptors) to accept a cancellation request that is in
  /// <code>PENDING_APPROVAL</code> status. Once accepted, the cancellation
  /// request transitions to <code>APPROVED</code> status and the agreement
  /// cancellation will be processed.
  /// <note>
  /// Only cancellation requests in <code>PENDING_APPROVAL</code> status can be
  /// accepted. A <code>ConflictException</code> is thrown if the cancellation
  /// request is in any other status.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementCancellationRequestId] :
  /// The unique identifier of the cancellation request to accept.
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the cancellation
  /// request.
  Future<AcceptAgreementCancellationRequestOutput>
      acceptAgreementCancellationRequest({
    required String agreementCancellationRequestId,
    required String agreementId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.AcceptAgreementCancellationRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementCancellationRequestId': agreementCancellationRequestId,
        'agreementId': agreementId,
      },
    );

    return AcceptAgreementCancellationRequestOutput.fromJson(jsonResponse.body);
  }

  /// Allows buyers (acceptors) to accept a payment request that is in
  /// <code>PENDING_APPROVAL</code> status. Once accepted, the payment request
  /// transitions to <code>APPROVED</code> status and the charge will be
  /// processed. Buyers can optionally provide a purchase order reference for
  /// their internal tracking.
  /// <note>
  /// Only payment requests in <code>PENDING_APPROVAL</code> status can be
  /// accepted. A <code>ConflictException</code> is thrown if the payment
  /// request is in any other status.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the payment
  /// request.
  ///
  /// Parameter [paymentRequestId] :
  /// The unique identifier of the payment request to accept.
  ///
  /// Parameter [purchaseOrderReference] :
  /// An optional purchase order reference that buyers can provide to associate
  /// the payment request with their internal purchase order system.
  Future<AcceptAgreementPaymentRequestOutput> acceptAgreementPaymentRequest({
    required String agreementId,
    required String paymentRequestId,
    String? purchaseOrderReference,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.AcceptAgreementPaymentRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'paymentRequestId': paymentRequestId,
        if (purchaseOrderReference != null)
          'purchaseOrderReference': purchaseOrderReference,
      },
    );

    return AcceptAgreementPaymentRequestOutput.fromJson(jsonResponse.body);
  }

  /// Accepts an agreement request to finalize the agreement. The acceptor can
  /// optionally provide purchase orders to associate with the agreement
  /// charges.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementRequestId] :
  /// The unique identifier of the agreement request.
  ///
  /// Parameter [purchaseOrders] :
  /// A list of purchase orders associated with accepting a marketplace
  /// agreement request.
  Future<AcceptAgreementRequestOutput> acceptAgreementRequest({
    required String agreementRequestId,
    List<PurchaseOrder>? purchaseOrders,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.AcceptAgreementRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementRequestId': agreementRequestId,
        if (purchaseOrders != null) 'purchaseOrders': purchaseOrders,
      },
    );

    return AcceptAgreementRequestOutput.fromJson(jsonResponse.body);
  }

  /// Allows sellers (proposers) to submit billing adjustment requests for one
  /// or more invoices within an agreement. Each entry in the batch specifies an
  /// invoice and the adjustment amount. The operation returns successfully
  /// created adjustment request IDs and any errors for entries that failed to
  /// process.
  /// <note>
  /// Each entry requires a unique <code>clientToken</code> for idempotency.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [billingAdjustmentRequestEntries] :
  /// A list of billing adjustment request entries. Each entry specifies the
  /// invoice and adjustment details.
  Future<BatchCreateBillingAdjustmentRequestOutput>
      batchCreateBillingAdjustmentRequest({
    required List<BatchCreateBillingAdjustmentRequestEntry>
        billingAdjustmentRequestEntries,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.BatchCreateBillingAdjustmentRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billingAdjustmentRequestEntries': billingAdjustmentRequestEntries,
      },
    );

    return BatchCreateBillingAdjustmentRequestOutput.fromJson(
        jsonResponse.body);
  }

  /// Allows an acceptor to cancel an active agreement. Not all agreements are
  /// eligible for cancellation. Use the error response to determine why a
  /// cancellation request was rejected.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  Future<void> cancelAgreement({
    required String agreementId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.CancelAgreement'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
      },
    );
  }

  /// Allows sellers (proposers) to withdraw an existing agreement cancellation
  /// request that is in a pending state. Once cancelled, the cancellation
  /// request transitions to <code>CANCELLED</code> status and can no longer be
  /// approved or rejected by the buyer.
  /// <note>
  /// Only cancellation requests in <code>PENDING_APPROVAL</code> status can be
  /// cancelled. A <code>ConflictException</code> is thrown if the cancellation
  /// request is in any other status.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementCancellationRequestId] :
  /// The unique identifier of the cancellation request to cancel.
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the cancellation
  /// request.
  ///
  /// Parameter [cancellationReason] :
  /// A required message explaining why the cancellation request is being
  /// withdrawn (1-2000 characters).
  Future<CancelAgreementCancellationRequestOutput>
      cancelAgreementCancellationRequest({
    required String agreementCancellationRequestId,
    required String agreementId,
    required String cancellationReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.CancelAgreementCancellationRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementCancellationRequestId': agreementCancellationRequestId,
        'agreementId': agreementId,
        'cancellationReason': cancellationReason,
      },
    );

    return CancelAgreementCancellationRequestOutput.fromJson(jsonResponse.body);
  }

  /// Allows sellers (proposers) to cancel a payment request that is in
  /// <code>PENDING_APPROVAL</code> status. Once cancelled, the payment request
  /// transitions to <code>CANCELLED</code> status and can no longer be accepted
  /// or rejected by the buyer.
  /// <note>
  /// Only payment requests in <code>PENDING_APPROVAL</code> status can be
  /// cancelled. A <code>ConflictException</code> is thrown if the payment
  /// request is in any other status.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the payment
  /// request.
  ///
  /// Parameter [paymentRequestId] :
  /// The unique identifier of the payment request to cancel.
  Future<CancelAgreementPaymentRequestOutput> cancelAgreementPaymentRequest({
    required String agreementId,
    required String paymentRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.CancelAgreementPaymentRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'paymentRequestId': paymentRequestId,
      },
    );

    return CancelAgreementPaymentRequestOutput.fromJson(jsonResponse.body);
  }

  /// Creates an agreement request that acts as a quote for the terms you want
  /// to accept. The agreement request captures the requested terms, calculates
  /// charges, and returns a summary. Use <code>AcceptAgreementRequest</code>
  /// with the returned <code>agreementRequestId</code> to finalize the
  /// agreement.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [intent] :
  /// The purpose and desired outcome of the agreement request. This is a
  /// required parameter that determines how the agreement request is processed.
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> – Creates a new agreement for terms in the request.
  /// </li>
  /// <li>
  /// <code>AMEND</code> – Modifies an existing agreement with terms that are
  /// accepted in the request.
  /// </li>
  /// <li>
  /// <code>REPLACE</code> – Creates a new agreement with accepted terms and
  /// replaces the existing agreement.
  /// </li>
  /// </ul>
  ///
  /// Parameter [requestedTerms] :
  /// A list of terms that define what is being accepted as part of the
  /// agreement. Some terms require configuration.
  ///
  /// Parameter [agreementProposalIdentifier] :
  /// The agreement proposal signed by the proposer. The proposal includes the
  /// requested resources and the terms that outline an agreement outcome.
  /// <important>
  /// This parameter is required if the intent is not <code>AMEND</code>.
  /// </important>
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [sourceAgreementIdentifier] :
  /// The agreement's identifier that the request acts upon.
  /// <important>
  /// This parameter is required for all non-<code>NEW</code> intents (i.e.,
  /// <code>AMEND</code> or <code>REPLACE</code>). Don't provide this parameter
  /// if the intent is <code>NEW</code>.
  /// </important>
  ///
  /// Parameter [taxConfiguration] :
  /// Configuration for tax estimation in the agreement request response.
  Future<CreateAgreementRequestOutput> createAgreementRequest({
    required Intent intent,
    required List<RequestedTerm> requestedTerms,
    String? agreementProposalIdentifier,
    String? clientToken,
    String? sourceAgreementIdentifier,
    TaxConfiguration? taxConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.CreateAgreementRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'intent': intent.value,
        'requestedTerms': requestedTerms,
        if (agreementProposalIdentifier != null)
          'agreementProposalIdentifier': agreementProposalIdentifier,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (sourceAgreementIdentifier != null)
          'sourceAgreementIdentifier': sourceAgreementIdentifier,
        if (taxConfiguration != null) 'taxConfiguration': taxConfiguration,
      },
    );

    return CreateAgreementRequestOutput.fromJson(jsonResponse.body);
  }

  /// Provides details about an agreement, such as the proposer, acceptor, start
  /// date, and end date.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  Future<DescribeAgreementOutput> describeAgreement({
    required String agreementId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.DescribeAgreement'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
      },
    );

    return DescribeAgreementOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific agreement cancellation
  /// request. Both sellers (proposers) and buyers (acceptors) can use this
  /// operation to view cancellation requests associated with their agreements.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementCancellationRequestId] :
  /// The unique identifier of the cancellation request.
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the cancellation
  /// request.
  Future<GetAgreementCancellationRequestOutput>
      getAgreementCancellationRequest({
    required String agreementCancellationRequestId,
    required String agreementId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.GetAgreementCancellationRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementCancellationRequestId': agreementCancellationRequestId,
        'agreementId': agreementId,
      },
    );

    return GetAgreementCancellationRequestOutput.fromJson(jsonResponse.body);
  }

  /// Obtains details about the entitlements of an agreement.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of agreement entitlements to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  Future<GetAgreementEntitlementsOutput> getAgreementEntitlements({
    required String agreementId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.GetAgreementEntitlements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetAgreementEntitlementsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific payment request. Both
  /// sellers (proposers) and buyers (acceptors) can use this operation to view
  /// payment requests associated with their agreements. The response includes
  /// the current status, charge details, timestamps, and the charge ID if the
  /// request has been approved.
  /// <note>
  /// The calling identity must be either the acceptor or proposer of the
  /// payment request. A <code>ResourceNotFoundException</code> is returned if
  /// the payment request does not exist.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the payment
  /// request.
  ///
  /// Parameter [paymentRequestId] :
  /// The identifier of the payment request.
  Future<GetAgreementPaymentRequestOutput> getAgreementPaymentRequest({
    required String agreementId,
    required String paymentRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.GetAgreementPaymentRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'paymentRequestId': paymentRequestId,
      },
    );

    return GetAgreementPaymentRequestOutput.fromJson(jsonResponse.body);
  }

  /// Obtains details about the terms in an agreement that you participated in
  /// as proposer or acceptor.
  ///
  /// The details include:
  ///
  /// <ul>
  /// <li>
  /// <code>TermType</code> – The type of term, such as <code>LegalTerm</code>,
  /// <code>RenewalTerm</code>, or <code>ConfigurableUpfrontPricingTerm</code>.
  /// </li>
  /// <li>
  /// <code>TermID</code> – The ID of the particular term, which is common
  /// between offer and agreement.
  /// </li>
  /// <li>
  /// <code>TermPayload</code> – The key information contained in the term, such
  /// as the EULA for <code>LegalTerm</code> or pricing and dimensions for
  /// various pricing terms, such as <code>ConfigurableUpfrontPricingTerm</code>
  /// or <code>UsageBasedPricingTerm</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>Configuration</code> – The buyer/acceptor's selection at the time of
  /// agreement creation, such as the number of units purchased for a dimension
  /// or setting the <code>EnableAutoRenew</code> flag.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of agreements to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  Future<GetAgreementTermsOutput> getAgreementTerms({
    required String agreementId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.GetAgreementTerms'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetAgreementTermsOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves detailed information about a specific billing adjustment
  /// request. Sellers (proposers) can use this operation to view the status and
  /// details of a billing adjustment request they submitted.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the billing
  /// adjustment request.
  ///
  /// Parameter [billingAdjustmentRequestId] :
  /// The unique identifier of the billing adjustment request.
  Future<GetBillingAdjustmentRequestOutput> getBillingAdjustmentRequest({
    required String agreementId,
    required String billingAdjustmentRequestId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.GetBillingAdjustmentRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'billingAdjustmentRequestId': billingAdjustmentRequestId,
      },
    );

    return GetBillingAdjustmentRequestOutput.fromJson(jsonResponse.body);
  }

  /// Lists agreement cancellation requests available to you as a seller or
  /// buyer. Both sellers (proposers) and buyers (acceptors) can use this
  /// operation to find cancellation requests by specifying their party type and
  /// applying optional filters.
  /// <note>
  /// <code>PartyType</code> is a required parameter. A
  /// <code>ValidationException</code> is returned if <code>PartyType</code> is
  /// not provided.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [partyType] :
  /// The party type for the cancellation requests. Required parameter. Use
  /// <code>Proposer</code> to list cancellation requests where you are the
  /// seller, or <code>Acceptor</code> to list cancellation requests where you
  /// are the buyer.
  ///
  /// Parameter [agreementId] :
  /// An optional parameter to filter cancellation requests for a specific
  /// agreement.
  ///
  /// Parameter [agreementType] :
  /// An optional parameter to filter cancellation requests by agreement type
  /// (e.g., <code>PurchaseAgreement</code>).
  ///
  /// Parameter [catalog] :
  /// An optional parameter to filter cancellation requests by catalog (e.g.,
  /// <code>AWSMarketplace</code>).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of cancellation requests to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  ///
  /// Parameter [status] :
  /// An optional parameter to filter cancellation requests by status.
  Future<ListAgreementCancellationRequestsOutput>
      listAgreementCancellationRequests({
    required String partyType,
    String? agreementId,
    String? agreementType,
    String? catalog,
    int? maxResults,
    String? nextToken,
    AgreementCancellationRequestStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.ListAgreementCancellationRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'partyType': partyType,
        if (agreementId != null) 'agreementId': agreementId,
        if (agreementType != null) 'agreementType': agreementType,
        if (catalog != null) 'catalog': catalog,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status.value,
      },
    );

    return ListAgreementCancellationRequestsOutput.fromJson(jsonResponse.body);
  }

  /// Allows acceptors to view charges and purchase orders that are associated
  /// with an agreement. The response includes details about all charges
  /// regardless of whether a purchase order is linked to each charge.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  ///
  /// Parameter [agreementType] :
  /// Filter to retrieve charges of a specific agreement type (for example,
  /// <code>PurchaseAgreement</code>).
  ///
  /// Parameter [catalog] :
  /// The catalog in which the charges were created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of charges to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  Future<ListAgreementChargesOutput> listAgreementCharges({
    String? agreementId,
    String? agreementType,
    String? catalog,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.ListAgreementCharges'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (agreementId != null) 'agreementId': agreementId,
        if (agreementType != null) 'agreementType': agreementType,
        if (catalog != null) 'catalog': catalog,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAgreementChargesOutput.fromJson(jsonResponse.body);
  }

  /// Allows sellers (proposers) to retrieve aggregated billing data from AWS
  /// Marketplace agreements using flexible grouping. Supports invoice-level
  /// aggregation with filtering by billing period, invoice type, and issued
  /// date.
  /// <note>
  /// The <code>groupBy</code> parameter is required and supports only
  /// <code>INVOICE_ID</code> as a value. The <code>agreementId</code> parameter
  /// is required.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  ///
  /// Parameter [groupBy] :
  /// Specifies a grouping strategy for line items. Currently supports
  /// <code>INVOICE_ID</code>.
  ///
  /// Parameter [afterIssuedTime] :
  /// An optional filter for invoices issued after the specified timestamp.
  ///
  /// Parameter [beforeIssuedTime] :
  /// An optional filter for invoices issued before the specified timestamp.
  ///
  /// Parameter [invoiceBillingPeriod] :
  /// An optional filter for the billing period associated with the invoice.
  ///
  /// Parameter [invoiceId] :
  /// An optional filter to retrieve invoice information for a specific invoice.
  ///
  /// Parameter [invoiceType] :
  /// An optional filter for the type of invoice. Valid values are
  /// <code>INVOICE</code> and <code>CREDIT_MEMO</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  Future<ListAgreementInvoiceLineItemsOutput> listAgreementInvoiceLineItems({
    required String agreementId,
    required LineItemGroupBy groupBy,
    DateTime? afterIssuedTime,
    DateTime? beforeIssuedTime,
    InvoiceBillingPeriod? invoiceBillingPeriod,
    String? invoiceId,
    InvoiceType? invoiceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.ListAgreementInvoiceLineItems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'groupBy': groupBy.value,
        if (afterIssuedTime != null)
          'afterIssuedTime': unixTimestampToJson(afterIssuedTime),
        if (beforeIssuedTime != null)
          'beforeIssuedTime': unixTimestampToJson(beforeIssuedTime),
        if (invoiceBillingPeriod != null)
          'invoiceBillingPeriod': invoiceBillingPeriod,
        if (invoiceId != null) 'invoiceId': invoiceId,
        if (invoiceType != null) 'invoiceType': invoiceType.value,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAgreementInvoiceLineItemsOutput.fromJson(jsonResponse.body);
  }

  /// Lists payment requests available to you as a seller or buyer. Both sellers
  /// (proposers) and buyers (acceptors) can use this operation to find payment
  /// requests by specifying their party type and applying optional parameters.
  /// <note>
  /// <code>PartyType</code> is a required parameter. A
  /// <code>ValidationException</code> is returned if <code>PartyType</code> is
  /// not provided. Pagination is supported through <code>maxResults</code>
  /// (1-50, default 50) and <code>nextToken</code> parameters.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [partyType] :
  /// The party type for the payment requests. Required parameter. Use
  /// <code>Proposer</code> to list payment requests where you are the seller,
  /// or <code>Acceptor</code> to list payment requests where you are the buyer.
  ///
  /// Parameter [agreementId] :
  /// An optional parameter to list payment requests for a specific agreement.
  ///
  /// Parameter [agreementType] :
  /// An optional parameter to list payment requests by agreement type (e.g.,
  /// <code>PurchaseAgreement</code>).
  ///
  /// Parameter [catalog] :
  /// An optional parameter to list payment requests by catalog (e.g.,
  /// <code>AWSMarketplace</code>).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of payment requests to return in a single response
  /// (1-50). Default is 50.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  ///
  /// Parameter [status] :
  /// An optional parameter to list payment requests by status. Valid values
  /// include <code>VALIDATING</code>, <code>VALIDATION_FAILED</code>,
  /// <code>PENDING_APPROVAL</code>, <code>APPROVED</code>,
  /// <code>REJECTED</code>, and <code>CANCELLED</code>.
  Future<ListAgreementPaymentRequestsOutput> listAgreementPaymentRequests({
    required String partyType,
    String? agreementId,
    String? agreementType,
    String? catalog,
    int? maxResults,
    String? nextToken,
    PaymentRequestStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.ListAgreementPaymentRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'partyType': partyType,
        if (agreementId != null) 'agreementId': agreementId,
        if (agreementType != null) 'agreementType': agreementType,
        if (catalog != null) 'catalog': catalog,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status.value,
      },
    );

    return ListAgreementPaymentRequestsOutput.fromJson(jsonResponse.body);
  }

  /// Lists billing adjustment requests for a specific agreement. Sellers
  /// (proposers) can use this operation to view all billing adjustment requests
  /// associated with an agreement.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement to list billing adjustment requests
  /// for.
  ///
  /// Parameter [agreementType] :
  /// An optional filter to return billing adjustment requests by agreement type
  /// (e.g., <code>PurchaseAgreement</code>).
  ///
  /// Parameter [catalog] :
  /// An optional filter to return billing adjustment requests by catalog (e.g.,
  /// <code>AWSMarketplace</code>).
  ///
  /// Parameter [createdAfter] :
  /// An optional filter to return billing adjustment requests created after the
  /// specified timestamp.
  ///
  /// Parameter [createdBefore] :
  /// An optional filter to return billing adjustment requests created before
  /// the specified timestamp.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of billing adjustment requests to return in the
  /// response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  ///
  /// Parameter [status] :
  /// An optional filter to return billing adjustment requests with the
  /// specified status.
  Future<ListBillingAdjustmentRequestsOutput> listBillingAdjustmentRequests({
    String? agreementId,
    String? agreementType,
    String? catalog,
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? nextToken,
    BillingAdjustmentStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.ListBillingAdjustmentRequests'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (agreementId != null) 'agreementId': agreementId,
        if (agreementType != null) 'agreementType': agreementType,
        if (catalog != null) 'catalog': catalog,
        if (createdAfter != null)
          'createdAfter': unixTimestampToJson(createdAfter),
        if (createdBefore != null)
          'createdBefore': unixTimestampToJson(createdBefore),
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (status != null) 'status': status.value,
      },
    );

    return ListBillingAdjustmentRequestsOutput.fromJson(jsonResponse.body);
  }

  /// Allows buyers (acceptors) to reject a cancellation request that is in
  /// <code>PENDING_APPROVAL</code> status. Once rejected, the cancellation
  /// request transitions to <code>REJECTED</code> status and the agreement
  /// remains active. Buyers must provide a reason for the rejection.
  /// <note>
  /// Only cancellation requests in <code>PENDING_APPROVAL</code> status can be
  /// rejected. A <code>ConflictException</code> is thrown if the cancellation
  /// request is in any other status.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementCancellationRequestId] :
  /// The unique identifier of the cancellation request to reject.
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the cancellation
  /// request.
  ///
  /// Parameter [rejectionReason] :
  /// The reason for rejecting the cancellation request (1-2000 characters).
  /// This message is visible to the seller.
  Future<RejectAgreementCancellationRequestOutput>
      rejectAgreementCancellationRequest({
    required String agreementCancellationRequestId,
    required String agreementId,
    required String rejectionReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.RejectAgreementCancellationRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementCancellationRequestId': agreementCancellationRequestId,
        'agreementId': agreementId,
        'rejectionReason': rejectionReason,
      },
    );

    return RejectAgreementCancellationRequestOutput.fromJson(jsonResponse.body);
  }

  /// Allows buyers (acceptors) to reject a payment request that is in
  /// <code>PENDING_APPROVAL</code> status. Once rejected, the payment request
  /// transitions to <code>REJECTED</code> status and cannot be accepted. Buyers
  /// can optionally provide a reason for the rejection.
  /// <note>
  /// Only payment requests in <code>PENDING_APPROVAL</code> status can be
  /// rejected. A <code>ConflictException</code> is thrown if the payment
  /// request is in any other status.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement associated with the payment
  /// request.
  ///
  /// Parameter [paymentRequestId] :
  /// The unique identifier of the payment request to reject.
  ///
  /// Parameter [rejectionReason] :
  /// An optional reason for rejecting the payment request (1-250 characters).
  /// This message is visible to the seller.
  Future<RejectAgreementPaymentRequestOutput> rejectAgreementPaymentRequest({
    required String agreementId,
    required String paymentRequestId,
    String? rejectionReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.RejectAgreementPaymentRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'paymentRequestId': paymentRequestId,
        if (rejectionReason != null) 'rejectionReason': rejectionReason,
      },
    );

    return RejectAgreementPaymentRequestOutput.fromJson(jsonResponse.body);
  }

  /// Searches across all agreements that a proposer or an acceptor has in AWS
  /// Marketplace. The search returns a list of agreements with basic agreement
  /// information.
  ///
  /// The following filter combinations are supported when the
  /// <code>PartyType</code> is <code>Proposer</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>AgreementType</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceType</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceType</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceType</code> +
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceType</code> +
  /// <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code> +
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code> +
  /// <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>OfferId</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>OfferId</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>OfferId</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>OfferId</code> + <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceIdentifier</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceIdentifier</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceIdentifier</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceIdentifier</code> + <code>Status</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceType</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceType</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceType</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceType</code> + <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code> + <code>Status</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code> + <code>Status</code>
  /// + <code>EndTime</code>
  /// </li>
  /// </ul> <note>
  /// To filter by <code>EndTime</code>, you can use <code>BeforeEndTime</code>
  /// and/or <code>AfterEndTime</code>. Only <code>EndTime</code> is supported
  /// for sorting.
  /// </note>
  /// The following filter combinations are supported when the
  /// <code>PartyType</code> is <code>Acceptor</code>:
  ///
  /// <ul>
  /// <li>
  /// <code>AgreementType</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code> +
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code> +
  /// <code>Status</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceType</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>ResourceType</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code> + <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferId</code> + <code>Status</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code> +
  /// <code>EndTime</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>AgreementType</code> + <code>OfferSetId</code> + <code>Status</code>
  /// + <code>EndTime</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [catalog] :
  /// The catalog in which the agreement was created.
  ///
  /// Parameter [filters] :
  /// The filter name and value pair used to return a specific list of results.
  ///
  /// The following filters are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>ResourceIdentifier</code> – The unique identifier of the resource.
  /// </li>
  /// <li>
  /// <code>ResourceType</code> – Type of the resource, which is the product
  /// (<code>AmiProduct</code>, <code>ContainerProduct</code>,
  /// <code>SaaSProduct</code>, <code>ProfessionalServicesProduct</code>, or
  /// <code>MachineLearningProduct</code>).
  /// </li>
  /// <li>
  /// <code>PartyType</code> – The party type of the caller. Use
  /// <code>Proposer</code> or <code>Acceptor</code>.
  /// </li>
  /// <li>
  /// <code>AcceptorAccountId</code> – The AWS account ID of the party accepting
  /// the agreement terms.
  /// </li>
  /// <li>
  /// <code>OfferId</code> – The unique identifier of the offer in which the
  /// terms are registered in the agreement token.
  /// </li>
  /// <li>
  /// <code>Status</code> – The current status of the agreement. Values include
  /// <code>ACTIVE</code>, <code>ARCHIVED</code>, <code>CANCELLED</code>,
  /// <code>EXPIRED</code>, <code>RENEWED</code>, <code>REPLACED</code>, and
  /// <code>TERMINATED</code>.
  /// </li>
  /// <li>
  /// <code>BeforeEndTime</code> – A date used to filter agreements with a date
  /// before the <code>endTime</code> of an agreement.
  /// </li>
  /// <li>
  /// <code>AfterEndTime</code> – A date used to filter agreements with a date
  /// after the <code>endTime</code> of an agreement.
  /// </li>
  /// <li>
  /// <code>AgreementType</code> – The type of agreement. Supported value
  /// includes <code>PurchaseAgreement</code>.
  /// </li>
  /// <li>
  /// <code>OfferSetId</code> – A unique identifier for the offer set containing
  /// this offer. All agreements created from offers in this set include this
  /// identifier as context.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of agreements to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination.
  ///
  /// Parameter [sort] :
  /// An object that contains the <code>SortBy</code> and <code>SortOrder</code>
  /// attributes. Only <code>EndTime</code> is supported for
  /// <code>SearchAgreements</code>. The default sort is <code>EndTime</code>
  /// descending.
  Future<SearchAgreementsOutput> searchAgreements({
    String? catalog,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    Sort? sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.SearchAgreements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (catalog != null) 'catalog': catalog,
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (sort != null) 'sort': sort,
      },
    );

    return SearchAgreementsOutput.fromJson(jsonResponse.body);
  }

  /// Allows sellers (proposers) to submit a cancellation request for an active
  /// agreement. The cancellation request is created in
  /// <code>PENDING_APPROVAL</code> status, at which point the buyer can review
  /// it.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement for which the cancellation request
  /// is being submitted.
  ///
  /// Parameter [reasonCode] :
  /// The reason code for the cancellation request.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// An optional detailed description of the cancellation reason (1-2000
  /// characters).
  Future<SendAgreementCancellationRequestOutput>
      sendAgreementCancellationRequest({
    required String agreementId,
    required AgreementCancellationRequestReasonCode reasonCode,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.SendAgreementCancellationRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'reasonCode': reasonCode.value,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return SendAgreementCancellationRequestOutput.fromJson(jsonResponse.body);
  }

  /// Allows sellers (proposers) to submit a payment request to buyers
  /// (acceptors) for a specific charge amount for an agreement that includes a
  /// <code>VariablePaymentTerm</code>. The payment request is created in
  /// <code>PENDING_APPROVAL</code> status, at which point the buyer can accept
  /// or reject it.
  /// <note>
  /// The agreement must be active and have a <code>VariablePaymentTerm</code>
  /// to support payment requests. The <code>chargeAmount</code> must not exceed
  /// the remaining available balance under the <code>VariablePaymentTerm</code>
  /// <code>maxTotalChargeAmount</code>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement for which the payment request is
  /// being submitted. Use <code>GetAgreementTerms</code> to retrieve agreement
  /// term details.
  ///
  /// Parameter [chargeAmount] :
  /// The amount requested to be charged to the buyer, positive decimal value in
  /// the currency of the accepted term.
  /// <note>
  /// A <code>ValidationException</code> is returned if the
  /// <code>chargeAmount</code> exceeds the available balance, if the agreement
  /// doesn't have an active <code>VariablePaymentTerm</code>, or if the
  /// <code>termId</code> is invalid.
  /// </note>
  ///
  /// Parameter [name] :
  /// A descriptive name for the payment request (5-64 characters).
  ///
  /// Parameter [termId] :
  /// The unique identifier of the <code>VariablePaymentTerm</code> for the
  /// agreement that the payment request is being sent for.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [description] :
  /// An optional detailed description of the payment request (1-2000
  /// characters).
  Future<SendAgreementPaymentRequestOutput> sendAgreementPaymentRequest({
    required String agreementId,
    required String chargeAmount,
    required String name,
    required String termId,
    String? clientToken,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target':
          'AWSMPCommerceService_v20200301.SendAgreementPaymentRequest'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'agreementId': agreementId,
        'chargeAmount': chargeAmount,
        'name': name,
        'termId': termId,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'description': description,
      },
    );

    return SendAgreementPaymentRequestOutput.fromJson(jsonResponse.body);
  }

  /// Allows acceptors to associate purchase orders with agreement charges after
  /// an agreement is created.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [purchaseOrders] :
  /// Contains information about purchase order associations.
  Future<void> updatePurchaseOrders({
    required List<PurchaseOrder> purchaseOrders,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSMPCommerceService_v20200301.UpdatePurchaseOrders'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'purchaseOrders': purchaseOrders,
      },
    );
  }
}

class AcceptAgreementCancellationRequestOutput {
  /// The unique identifier of the accepted cancellation request.
  final String? agreementCancellationRequestId;

  /// The unique identifier of the agreement associated with this cancellation
  /// request.
  final String? agreementId;

  /// The date and time when the cancellation request was originally created.
  final DateTime? createdAt;

  /// The detailed description of the cancellation reason, if provided.
  final String? description;

  /// The original reason code provided when the cancellation request was created.
  final AgreementCancellationRequestReasonCode? reasonCode;

  /// The updated status of the cancellation request, which is
  /// <code>APPROVED</code>.
  final AgreementCancellationRequestStatus? status;

  /// The date and time when the cancellation request was accepted.
  final DateTime? updatedAt;

  AcceptAgreementCancellationRequestOutput({
    this.agreementCancellationRequestId,
    this.agreementId,
    this.createdAt,
    this.description,
    this.reasonCode,
    this.status,
    this.updatedAt,
  });

  factory AcceptAgreementCancellationRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return AcceptAgreementCancellationRequestOutput(
      agreementCancellationRequestId:
          json['agreementCancellationRequestId'] as String?,
      agreementId: json['agreementId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      reasonCode: (json['reasonCode'] as String?)
          ?.let(AgreementCancellationRequestReasonCode.fromString),
      status: (json['status'] as String?)
          ?.let(AgreementCancellationRequestStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementCancellationRequestId = this.agreementCancellationRequestId;
    final agreementId = this.agreementId;
    final createdAt = this.createdAt;
    final description = this.description;
    final reasonCode = this.reasonCode;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (agreementCancellationRequestId != null)
        'agreementCancellationRequestId': agreementCancellationRequestId,
      if (agreementId != null) 'agreementId': agreementId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (reasonCode != null) 'reasonCode': reasonCode.value,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class AcceptAgreementPaymentRequestOutput {
  /// The unique identifier of the agreement associated with this payment request.
  final String? agreementId;

  /// The amount that was approved to be charged.
  final String? chargeAmount;

  /// The date and time when the payment request was originally created.
  final DateTime? createdAt;

  /// The currency code for the charge amount.
  final String? currencyCode;

  /// The detailed description of the payment request, if provided.
  final String? description;

  /// The descriptive name of the payment request.
  final String? name;

  /// The unique identifier of the accepted payment request.
  final String? paymentRequestId;

  /// The updated status of the payment request, which is <code>APPROVED</code>.
  final PaymentRequestStatus? status;

  /// The date and time when the payment request was accepted.
  final DateTime? updatedAt;

  AcceptAgreementPaymentRequestOutput({
    this.agreementId,
    this.chargeAmount,
    this.createdAt,
    this.currencyCode,
    this.description,
    this.name,
    this.paymentRequestId,
    this.status,
    this.updatedAt,
  });

  factory AcceptAgreementPaymentRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return AcceptAgreementPaymentRequestOutput(
      agreementId: json['agreementId'] as String?,
      chargeAmount: json['chargeAmount'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currencyCode: json['currencyCode'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      paymentRequestId: json['paymentRequestId'] as String?,
      status: (json['status'] as String?)?.let(PaymentRequestStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final chargeAmount = this.chargeAmount;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final description = this.description;
    final name = this.name;
    final paymentRequestId = this.paymentRequestId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (chargeAmount != null) 'chargeAmount': chargeAmount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (paymentRequestId != null) 'paymentRequestId': paymentRequestId,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class AcceptAgreementRequestOutput {
  /// The unique identifier of the agreement created or modified by accepting the
  /// agreement request.
  final String? agreementId;

  AcceptAgreementRequestOutput({
    this.agreementId,
  });

  factory AcceptAgreementRequestOutput.fromJson(Map<String, dynamic> json) {
    return AcceptAgreementRequestOutput(
      agreementId: json['agreementId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    return {
      if (agreementId != null) 'agreementId': agreementId,
    };
  }
}

class BatchCreateBillingAdjustmentRequestOutput {
  /// A list of errors for entries that failed validation, each containing the
  /// <code>clientToken</code>, error <code>code</code>, and <code>message</code>.
  final List<BatchCreateBillingAdjustmentError> errors;

  /// A list of successfully created billing adjustment items, each containing the
  /// <code>billingAdjustmentRequestId</code> and <code>clientToken</code>.
  final List<BatchCreateBillingAdjustmentItem> items;

  BatchCreateBillingAdjustmentRequestOutput({
    required this.errors,
    required this.items,
  });

  factory BatchCreateBillingAdjustmentRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillingAdjustmentRequestOutput(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchCreateBillingAdjustmentError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchCreateBillingAdjustmentItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final items = this.items;
    return {
      'errors': errors,
      'items': items,
    };
  }
}

class CancelAgreementOutput {
  CancelAgreementOutput();

  factory CancelAgreementOutput.fromJson(Map<String, dynamic> _) {
    return CancelAgreementOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelAgreementCancellationRequestOutput {
  /// The unique identifier of the cancelled cancellation request.
  final String? agreementCancellationRequestId;

  /// The unique identifier of the agreement associated with this cancellation
  /// request.
  final String? agreementId;

  /// The date and time when the cancellation request was originally created.
  final DateTime? createdAt;

  /// The detailed description of the original cancellation reason, if provided.
  final String? description;

  /// The original reason code provided when the cancellation request was created.
  final AgreementCancellationRequestReasonCode? reasonCode;

  /// The updated status of the cancellation request, which is
  /// <code>CANCELLED</code>.
  final AgreementCancellationRequestStatus? status;

  /// A message providing additional context about the cancellation request
  /// status.
  final String? statusMessage;

  /// The date and time when the cancellation request was cancelled.
  final DateTime? updatedAt;

  CancelAgreementCancellationRequestOutput({
    this.agreementCancellationRequestId,
    this.agreementId,
    this.createdAt,
    this.description,
    this.reasonCode,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });

  factory CancelAgreementCancellationRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return CancelAgreementCancellationRequestOutput(
      agreementCancellationRequestId:
          json['agreementCancellationRequestId'] as String?,
      agreementId: json['agreementId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      reasonCode: (json['reasonCode'] as String?)
          ?.let(AgreementCancellationRequestReasonCode.fromString),
      status: (json['status'] as String?)
          ?.let(AgreementCancellationRequestStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementCancellationRequestId = this.agreementCancellationRequestId;
    final agreementId = this.agreementId;
    final createdAt = this.createdAt;
    final description = this.description;
    final reasonCode = this.reasonCode;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (agreementCancellationRequestId != null)
        'agreementCancellationRequestId': agreementCancellationRequestId,
      if (agreementId != null) 'agreementId': agreementId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (reasonCode != null) 'reasonCode': reasonCode.value,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class CancelAgreementPaymentRequestOutput {
  /// The unique identifier of the agreement associated with this payment request.
  final String? agreementId;

  /// The amount that was requested to be charged.
  final String? chargeAmount;

  /// The date and time when the payment request was originally created.
  final DateTime? createdAt;

  /// The currency code for the charge amount.
  final String? currencyCode;

  /// The detailed description of the payment request, if provided.
  final String? description;

  /// The descriptive name of the payment request.
  final String? name;

  /// The unique identifier of the cancelled payment request.
  final String? paymentRequestId;

  /// The updated status of the payment request, which is <code>CANCELLED</code>.
  final PaymentRequestStatus? status;

  /// The date and time when the payment request was cancelled.
  final DateTime? updatedAt;

  CancelAgreementPaymentRequestOutput({
    this.agreementId,
    this.chargeAmount,
    this.createdAt,
    this.currencyCode,
    this.description,
    this.name,
    this.paymentRequestId,
    this.status,
    this.updatedAt,
  });

  factory CancelAgreementPaymentRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return CancelAgreementPaymentRequestOutput(
      agreementId: json['agreementId'] as String?,
      chargeAmount: json['chargeAmount'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currencyCode: json['currencyCode'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      paymentRequestId: json['paymentRequestId'] as String?,
      status: (json['status'] as String?)?.let(PaymentRequestStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final chargeAmount = this.chargeAmount;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final description = this.description;
    final name = this.name;
    final paymentRequestId = this.paymentRequestId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (chargeAmount != null) 'chargeAmount': chargeAmount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (paymentRequestId != null) 'paymentRequestId': paymentRequestId,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class CreateAgreementRequestOutput {
  /// The unique identifier of the agreement request created. Use this identifier
  /// with <code>AcceptAgreementRequest</code> to accept the agreement.
  final String? agreementRequestId;

  /// Provides details of the charges associated with the agreement request. This
  /// is only applicable when a request is created for
  /// <code>PurchaseAgreement</code>.
  final ChargeSummary? chargeSummary;

  CreateAgreementRequestOutput({
    this.agreementRequestId,
    this.chargeSummary,
  });

  factory CreateAgreementRequestOutput.fromJson(Map<String, dynamic> json) {
    return CreateAgreementRequestOutput(
      agreementRequestId: json['agreementRequestId'] as String?,
      chargeSummary: json['chargeSummary'] != null
          ? ChargeSummary.fromJson(
              json['chargeSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementRequestId = this.agreementRequestId;
    final chargeSummary = this.chargeSummary;
    return {
      if (agreementRequestId != null) 'agreementRequestId': agreementRequestId,
      if (chargeSummary != null) 'chargeSummary': chargeSummary,
    };
  }
}

class DescribeAgreementOutput {
  /// The date and time the offer was accepted or the agreement was created.
  /// <note>
  /// <code>AcceptanceTime</code> and <code>StartTime</code> can differ for future
  /// dated agreements (FDAs).
  /// </note>
  final DateTime? acceptanceTime;

  /// The details of the party accepting the agreement terms. This is commonly the
  /// buyer for <code>PurchaseAgreement</code>.
  final Acceptor? acceptor;

  /// The unique identifier of the agreement.
  final String? agreementId;

  /// The type of agreement. Values are <code>PurchaseAgreement</code> or
  /// <code>VendorInsightsAgreement</code>.
  final String? agreementType;

  /// The date and time when the agreement ends. The field is <code>null</code>
  /// for pay-as-you-go agreements, which don’t have end dates.
  final DateTime? endTime;

  /// The estimated cost of the agreement.
  final EstimatedCharges? estimatedCharges;

  /// A summary of the proposal received from the proposer.
  final ProposalSummary? proposalSummary;

  /// The details of the party proposing the agreement terms. This is commonly the
  /// seller for <code>PurchaseAgreement</code>.
  final Proposer? proposer;

  /// The date and time when the agreement starts.
  final DateTime? startTime;

  /// The current status of the agreement.
  ///
  /// Statuses include:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> – The terms of the agreement are active.
  /// </li>
  /// <li>
  /// <code>ARCHIVED</code> – The agreement ended without a specified reason.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – The acceptor ended the agreement before the defined
  /// end date.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> – The agreement ended on the defined end date.
  /// </li>
  /// <li>
  /// <code>RENEWED</code> – The agreement was renewed into a new agreement (for
  /// example, an auto-renewal).
  /// </li>
  /// <li>
  /// <code>REPLACED</code> – The agreement was replaced using an agreement
  /// replacement offer.
  /// </li>
  /// <li>
  /// <code>TERMINATED</code> – The agreement ended before the defined end date
  /// because of an AWS termination (for example, a payment failure).
  /// </li>
  /// </ul>
  final AgreementStatus? status;

  DescribeAgreementOutput({
    this.acceptanceTime,
    this.acceptor,
    this.agreementId,
    this.agreementType,
    this.endTime,
    this.estimatedCharges,
    this.proposalSummary,
    this.proposer,
    this.startTime,
    this.status,
  });

  factory DescribeAgreementOutput.fromJson(Map<String, dynamic> json) {
    return DescribeAgreementOutput(
      acceptanceTime: timeStampFromJson(json['acceptanceTime']),
      acceptor: json['acceptor'] != null
          ? Acceptor.fromJson(json['acceptor'] as Map<String, dynamic>)
          : null,
      agreementId: json['agreementId'] as String?,
      agreementType: json['agreementType'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      estimatedCharges: json['estimatedCharges'] != null
          ? EstimatedCharges.fromJson(
              json['estimatedCharges'] as Map<String, dynamic>)
          : null,
      proposalSummary: json['proposalSummary'] != null
          ? ProposalSummary.fromJson(
              json['proposalSummary'] as Map<String, dynamic>)
          : null,
      proposer: json['proposer'] != null
          ? Proposer.fromJson(json['proposer'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(AgreementStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceTime = this.acceptanceTime;
    final acceptor = this.acceptor;
    final agreementId = this.agreementId;
    final agreementType = this.agreementType;
    final endTime = this.endTime;
    final estimatedCharges = this.estimatedCharges;
    final proposalSummary = this.proposalSummary;
    final proposer = this.proposer;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (acceptanceTime != null)
        'acceptanceTime': unixTimestampToJson(acceptanceTime),
      if (acceptor != null) 'acceptor': acceptor,
      if (agreementId != null) 'agreementId': agreementId,
      if (agreementType != null) 'agreementType': agreementType,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (estimatedCharges != null) 'estimatedCharges': estimatedCharges,
      if (proposalSummary != null) 'proposalSummary': proposalSummary,
      if (proposer != null) 'proposer': proposer,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
    };
  }
}

class GetAgreementCancellationRequestOutput {
  /// The unique identifier of the cancellation request.
  final String? agreementCancellationRequestId;

  /// The unique identifier of the agreement associated with this cancellation
  /// request. Use <code>DescribeAgreement</code> to retrieve full agreement
  /// details.
  final String? agreementId;

  /// The date and time when the cancellation request was created.
  final DateTime? createdAt;

  /// The detailed description of the cancellation reason, if provided.
  final String? description;

  /// The reason code provided for the cancellation.
  final AgreementCancellationRequestReasonCode? reasonCode;

  /// The current status of the cancellation request.
  final AgreementCancellationRequestStatus? status;

  /// A message providing additional context about the cancellation request
  /// status.
  final String? statusMessage;

  /// The date and time when the cancellation request was last updated.
  final DateTime? updatedAt;

  GetAgreementCancellationRequestOutput({
    this.agreementCancellationRequestId,
    this.agreementId,
    this.createdAt,
    this.description,
    this.reasonCode,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });

  factory GetAgreementCancellationRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return GetAgreementCancellationRequestOutput(
      agreementCancellationRequestId:
          json['agreementCancellationRequestId'] as String?,
      agreementId: json['agreementId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      reasonCode: (json['reasonCode'] as String?)
          ?.let(AgreementCancellationRequestReasonCode.fromString),
      status: (json['status'] as String?)
          ?.let(AgreementCancellationRequestStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementCancellationRequestId = this.agreementCancellationRequestId;
    final agreementId = this.agreementId;
    final createdAt = this.createdAt;
    final description = this.description;
    final reasonCode = this.reasonCode;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (agreementCancellationRequestId != null)
        'agreementCancellationRequestId': agreementCancellationRequestId,
      if (agreementId != null) 'agreementId': agreementId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (reasonCode != null) 'reasonCode': reasonCode.value,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class GetAgreementEntitlementsOutput {
  /// A list of agreement entitlements which are part of the latest agreement.
  final List<AgreementEntitlement>? agreementEntitlements;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  GetAgreementEntitlementsOutput({
    this.agreementEntitlements,
    this.nextToken,
  });

  factory GetAgreementEntitlementsOutput.fromJson(Map<String, dynamic> json) {
    return GetAgreementEntitlementsOutput(
      agreementEntitlements: (json['agreementEntitlements'] as List?)
          ?.nonNulls
          .map((e) => AgreementEntitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementEntitlements = this.agreementEntitlements;
    final nextToken = this.nextToken;
    return {
      if (agreementEntitlements != null)
        'agreementEntitlements': agreementEntitlements,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetAgreementPaymentRequestOutput {
  /// The unique identifier of the agreement associated with this payment request.
  /// Use <code>DescribeAgreement</code> to retrieve full agreement details.
  final String? agreementId;

  /// The amount charged or to be charged to the buyer.
  final String? chargeAmount;

  /// The unique identifier of the charge created after the payment request is
  /// approved. This field is only present for approved payment requests and
  /// follows the pattern <code>ch-[a-zA-Z0-9]+</code>.
  final String? chargeId;

  /// The date and time when the payment request was created.
  final DateTime? createdAt;

  /// The currency code for the charge amount.
  final String? currencyCode;

  /// The detailed description of the payment request, if provided.
  final String? description;

  /// The descriptive name of the payment request.
  final String? name;

  /// The unique identifier of the payment request.
  final String? paymentRequestId;

  /// The current status of the payment request. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>VALIDATING</code> – The payment request is being validated against
  /// agreement terms.
  /// </li>
  /// <li>
  /// <code>VALIDATION_FAILED</code> – The payment request failed validation.
  /// </li>
  /// <li>
  /// <code>PENDING_APPROVAL</code> – The payment request is awaiting buyer
  /// action.
  /// </li>
  /// <li>
  /// <code>APPROVED</code> – The buyer has approved the payment request.
  /// </li>
  /// <li>
  /// <code>REJECTED</code> – The buyer has rejected the payment request.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> – The seller has cancelled the payment request.
  /// </li>
  /// </ul>
  final PaymentRequestStatus? status;

  /// An optional message providing additional context about the payment request
  /// status, such as a rejection reason or validation failure details.
  final String? statusMessage;

  /// The date and time when the payment request was last updated.
  final DateTime? updatedAt;

  GetAgreementPaymentRequestOutput({
    this.agreementId,
    this.chargeAmount,
    this.chargeId,
    this.createdAt,
    this.currencyCode,
    this.description,
    this.name,
    this.paymentRequestId,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });

  factory GetAgreementPaymentRequestOutput.fromJson(Map<String, dynamic> json) {
    return GetAgreementPaymentRequestOutput(
      agreementId: json['agreementId'] as String?,
      chargeAmount: json['chargeAmount'] as String?,
      chargeId: json['chargeId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currencyCode: json['currencyCode'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      paymentRequestId: json['paymentRequestId'] as String?,
      status: (json['status'] as String?)?.let(PaymentRequestStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final chargeAmount = this.chargeAmount;
    final chargeId = this.chargeId;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final description = this.description;
    final name = this.name;
    final paymentRequestId = this.paymentRequestId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (chargeAmount != null) 'chargeAmount': chargeAmount,
      if (chargeId != null) 'chargeId': chargeId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (paymentRequestId != null) 'paymentRequestId': paymentRequestId,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class GetAgreementTermsOutput {
  /// A subset of terms proposed by the proposer that have been accepted by the
  /// acceptor as part of the agreement creation.
  final List<AcceptedTerm>? acceptedTerms;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  GetAgreementTermsOutput({
    this.acceptedTerms,
    this.nextToken,
  });

  factory GetAgreementTermsOutput.fromJson(Map<String, dynamic> json) {
    return GetAgreementTermsOutput(
      acceptedTerms: (json['acceptedTerms'] as List?)
          ?.nonNulls
          .map((e) => AcceptedTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final acceptedTerms = this.acceptedTerms;
    final nextToken = this.nextToken;
    return {
      if (acceptedTerms != null) 'acceptedTerms': acceptedTerms,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetBillingAdjustmentRequestOutput {
  /// The adjustment amount as a string representation of a decimal number.
  final String adjustmentAmount;

  /// The reason code for the billing adjustment.
  final BillingAdjustmentReasonCode adjustmentReasonCode;

  /// The unique identifier of the agreement associated with this billing
  /// adjustment request.
  final String agreementId;

  /// The unique identifier of the billing adjustment request.
  final String billingAdjustmentRequestId;

  /// The date and time when the billing adjustment request was created.
  final DateTime createdAt;

  /// The currency code for the adjustment amount (e.g., <code>USD</code>).
  final String currencyCode;

  /// The identifier of the original invoice being adjusted.
  final String originalInvoiceId;

  /// The current status of the billing adjustment request.
  final BillingAdjustmentStatus status;

  /// The date and time when the billing adjustment request was last updated.
  final DateTime updatedAt;

  /// The detailed description of the billing adjustment reason, if provided.
  final String? description;

  /// A message providing additional context about the billing adjustment request
  /// status. This field is populated only when the status is
  /// <code>VALIDATION_FAILED</code>.
  final String? statusMessage;

  GetBillingAdjustmentRequestOutput({
    required this.adjustmentAmount,
    required this.adjustmentReasonCode,
    required this.agreementId,
    required this.billingAdjustmentRequestId,
    required this.createdAt,
    required this.currencyCode,
    required this.originalInvoiceId,
    required this.status,
    required this.updatedAt,
    this.description,
    this.statusMessage,
  });

  factory GetBillingAdjustmentRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return GetBillingAdjustmentRequestOutput(
      adjustmentAmount: (json['adjustmentAmount'] as String?) ?? '',
      adjustmentReasonCode: BillingAdjustmentReasonCode.fromString(
          (json['adjustmentReasonCode'] as String?) ?? ''),
      agreementId: (json['agreementId'] as String?) ?? '',
      billingAdjustmentRequestId:
          (json['billingAdjustmentRequestId'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      currencyCode: (json['currencyCode'] as String?) ?? '',
      originalInvoiceId: (json['originalInvoiceId'] as String?) ?? '',
      status:
          BillingAdjustmentStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      description: json['description'] as String?,
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adjustmentAmount = this.adjustmentAmount;
    final adjustmentReasonCode = this.adjustmentReasonCode;
    final agreementId = this.agreementId;
    final billingAdjustmentRequestId = this.billingAdjustmentRequestId;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final originalInvoiceId = this.originalInvoiceId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final description = this.description;
    final statusMessage = this.statusMessage;
    return {
      'adjustmentAmount': adjustmentAmount,
      'adjustmentReasonCode': adjustmentReasonCode.value,
      'agreementId': agreementId,
      'billingAdjustmentRequestId': billingAdjustmentRequestId,
      'createdAt': unixTimestampToJson(createdAt),
      'currencyCode': currencyCode,
      'originalInvoiceId': originalInvoiceId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (description != null) 'description': description,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class ListAgreementCancellationRequestsOutput {
  /// An array of <code>AgreementCancellationRequestSummary</code> objects
  /// containing summary information about each cancellation request.
  final List<AgreementCancellationRequestSummary>? items;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  ListAgreementCancellationRequestsOutput({
    this.items,
    this.nextToken,
  });

  factory ListAgreementCancellationRequestsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListAgreementCancellationRequestsOutput(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => AgreementCancellationRequestSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAgreementChargesOutput {
  /// A list of agreement charges.
  final List<Charge>? items;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  ListAgreementChargesOutput({
    this.items,
    this.nextToken,
  });

  factory ListAgreementChargesOutput.fromJson(Map<String, dynamic> json) {
    return ListAgreementChargesOutput(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => Charge.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAgreementInvoiceLineItemsOutput {
  /// A list of grouped billing data objects.
  final List<AgreementInvoiceLineItemGroupSummary>?
      agreementInvoiceLineItemGroupSummaries;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  ListAgreementInvoiceLineItemsOutput({
    this.agreementInvoiceLineItemGroupSummaries,
    this.nextToken,
  });

  factory ListAgreementInvoiceLineItemsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListAgreementInvoiceLineItemsOutput(
      agreementInvoiceLineItemGroupSummaries:
          (json['agreementInvoiceLineItemGroupSummaries'] as List?)
              ?.nonNulls
              .map((e) => AgreementInvoiceLineItemGroupSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementInvoiceLineItemGroupSummaries =
        this.agreementInvoiceLineItemGroupSummaries;
    final nextToken = this.nextToken;
    return {
      if (agreementInvoiceLineItemGroupSummaries != null)
        'agreementInvoiceLineItemGroupSummaries':
            agreementInvoiceLineItemGroupSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAgreementPaymentRequestsOutput {
  /// An array of <code>PaymentRequestSummary</code> objects containing summary
  /// information about each payment request.
  final List<PaymentRequestSummary> items;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  ListAgreementPaymentRequestsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListAgreementPaymentRequestsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListAgreementPaymentRequestsOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => PaymentRequestSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBillingAdjustmentRequestsOutput {
  /// An array of <code>BillingAdjustmentSummary</code> objects containing summary
  /// information about each billing adjustment request.
  final List<BillingAdjustmentSummary> items;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  ListBillingAdjustmentRequestsOutput({
    required this.items,
    this.nextToken,
  });

  factory ListBillingAdjustmentRequestsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListBillingAdjustmentRequestsOutput(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BillingAdjustmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class RejectAgreementCancellationRequestOutput {
  /// The unique identifier of the rejected cancellation request.
  final String? agreementCancellationRequestId;

  /// The unique identifier of the agreement associated with this cancellation
  /// request.
  final String? agreementId;

  /// The date and time when the cancellation request was originally created.
  final DateTime? createdAt;

  /// The detailed description of the cancellation reason, if provided.
  final String? description;

  /// The original reason code provided when the cancellation request was created.
  final AgreementCancellationRequestReasonCode? reasonCode;

  /// The updated status of the cancellation request, which is
  /// <code>REJECTED</code>.
  final AgreementCancellationRequestStatus? status;

  /// The rejection reason provided by the buyer.
  final String? statusMessage;

  /// The date and time when the cancellation request was rejected.
  final DateTime? updatedAt;

  RejectAgreementCancellationRequestOutput({
    this.agreementCancellationRequestId,
    this.agreementId,
    this.createdAt,
    this.description,
    this.reasonCode,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });

  factory RejectAgreementCancellationRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return RejectAgreementCancellationRequestOutput(
      agreementCancellationRequestId:
          json['agreementCancellationRequestId'] as String?,
      agreementId: json['agreementId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      reasonCode: (json['reasonCode'] as String?)
          ?.let(AgreementCancellationRequestReasonCode.fromString),
      status: (json['status'] as String?)
          ?.let(AgreementCancellationRequestStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementCancellationRequestId = this.agreementCancellationRequestId;
    final agreementId = this.agreementId;
    final createdAt = this.createdAt;
    final description = this.description;
    final reasonCode = this.reasonCode;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (agreementCancellationRequestId != null)
        'agreementCancellationRequestId': agreementCancellationRequestId,
      if (agreementId != null) 'agreementId': agreementId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (reasonCode != null) 'reasonCode': reasonCode.value,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class RejectAgreementPaymentRequestOutput {
  /// The unique identifier of the agreement associated with this payment request.
  final String? agreementId;

  /// The amount that was requested to be charged.
  final String? chargeAmount;

  /// The date and time when the payment request was originally created.
  final DateTime? createdAt;

  /// The currency code for the charge amount.
  final String? currencyCode;

  /// The detailed description of the payment request, if provided.
  final String? description;

  /// The descriptive name of the payment request.
  final String? name;

  /// The unique identifier of the rejected payment request.
  final String? paymentRequestId;

  /// The updated status of the payment request, which is <code>REJECTED</code>.
  final PaymentRequestStatus? status;

  /// The rejection reason provided by the buyer, if any.
  final String? statusMessage;

  /// The date and time when the payment request was rejected.
  final DateTime? updatedAt;

  RejectAgreementPaymentRequestOutput({
    this.agreementId,
    this.chargeAmount,
    this.createdAt,
    this.currencyCode,
    this.description,
    this.name,
    this.paymentRequestId,
    this.status,
    this.statusMessage,
    this.updatedAt,
  });

  factory RejectAgreementPaymentRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return RejectAgreementPaymentRequestOutput(
      agreementId: json['agreementId'] as String?,
      chargeAmount: json['chargeAmount'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currencyCode: json['currencyCode'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      paymentRequestId: json['paymentRequestId'] as String?,
      status: (json['status'] as String?)?.let(PaymentRequestStatus.fromString),
      statusMessage: json['statusMessage'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final chargeAmount = this.chargeAmount;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final description = this.description;
    final name = this.name;
    final paymentRequestId = this.paymentRequestId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final updatedAt = this.updatedAt;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (chargeAmount != null) 'chargeAmount': chargeAmount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (paymentRequestId != null) 'paymentRequestId': paymentRequestId,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class SearchAgreementsOutput {
  /// A summary of the agreement, including top-level attributes (for example, the
  /// agreement ID, proposer, and acceptor).
  final List<AgreementViewSummary>? agreementViewSummaries;

  /// The token used for pagination. The field is <code>null</code> if there are
  /// no more results.
  final String? nextToken;

  SearchAgreementsOutput({
    this.agreementViewSummaries,
    this.nextToken,
  });

  factory SearchAgreementsOutput.fromJson(Map<String, dynamic> json) {
    return SearchAgreementsOutput(
      agreementViewSummaries: (json['agreementViewSummaries'] as List?)
          ?.nonNulls
          .map((e) => AgreementViewSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementViewSummaries = this.agreementViewSummaries;
    final nextToken = this.nextToken;
    return {
      if (agreementViewSummaries != null)
        'agreementViewSummaries': agreementViewSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class SendAgreementCancellationRequestOutput {
  /// The unique identifier for the created cancellation request.
  final String? agreementCancellationRequestId;

  /// The unique identifier of the agreement.
  final String? agreementId;

  /// The time when the cancellation request was created.
  final DateTime? createdAt;

  /// The detailed description of the cancellation reason, if provided.
  final String? description;

  /// The reason code provided for the cancellation.
  final AgreementCancellationRequestReasonCode? reasonCode;

  /// The current status of the cancellation request. The initial status is
  /// <code>PENDING_APPROVAL</code>.
  final AgreementCancellationRequestStatus? status;

  /// The time when the cancellation request was last updated.
  final DateTime? updatedAt;

  SendAgreementCancellationRequestOutput({
    this.agreementCancellationRequestId,
    this.agreementId,
    this.createdAt,
    this.description,
    this.reasonCode,
    this.status,
    this.updatedAt,
  });

  factory SendAgreementCancellationRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return SendAgreementCancellationRequestOutput(
      agreementCancellationRequestId:
          json['agreementCancellationRequestId'] as String?,
      agreementId: json['agreementId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      reasonCode: (json['reasonCode'] as String?)
          ?.let(AgreementCancellationRequestReasonCode.fromString),
      status: (json['status'] as String?)
          ?.let(AgreementCancellationRequestStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementCancellationRequestId = this.agreementCancellationRequestId;
    final agreementId = this.agreementId;
    final createdAt = this.createdAt;
    final description = this.description;
    final reasonCode = this.reasonCode;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (agreementCancellationRequestId != null)
        'agreementCancellationRequestId': agreementCancellationRequestId,
      if (agreementId != null) 'agreementId': agreementId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (reasonCode != null) 'reasonCode': reasonCode.value,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class SendAgreementPaymentRequestOutput {
  /// The agreement identifier for this payment request.
  final String? agreementId;

  /// The amount being charged to the buyer.
  final String? chargeAmount;

  /// The time when the payment request was created.
  final DateTime? createdAt;

  /// The currency code for the charge amount (e.g., <code>USD</code>).
  final String? currencyCode;

  /// The detailed description of the payment request, if provided.
  final String? description;

  /// The descriptive name of the payment request.
  final String? name;

  /// The unique identifier for the sent payment request.
  final String? paymentRequestId;

  /// The current status of the payment request. The initial status is
  /// <code>PENDING_APPROVAL</code>.
  final PaymentRequestStatus? status;

  SendAgreementPaymentRequestOutput({
    this.agreementId,
    this.chargeAmount,
    this.createdAt,
    this.currencyCode,
    this.description,
    this.name,
    this.paymentRequestId,
    this.status,
  });

  factory SendAgreementPaymentRequestOutput.fromJson(
      Map<String, dynamic> json) {
    return SendAgreementPaymentRequestOutput(
      agreementId: json['agreementId'] as String?,
      chargeAmount: json['chargeAmount'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currencyCode: json['currencyCode'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      paymentRequestId: json['paymentRequestId'] as String?,
      status: (json['status'] as String?)?.let(PaymentRequestStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final chargeAmount = this.chargeAmount;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final description = this.description;
    final name = this.name;
    final paymentRequestId = this.paymentRequestId;
    final status = this.status;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (chargeAmount != null) 'chargeAmount': chargeAmount,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (paymentRequestId != null) 'paymentRequestId': paymentRequestId,
      if (status != null) 'status': status.value,
    };
  }
}

class UpdatePurchaseOrdersOutput {
  UpdatePurchaseOrdersOutput();

  factory UpdatePurchaseOrdersOutput.fromJson(Map<String, dynamic> _) {
    return UpdatePurchaseOrdersOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about a purchase order association to a charge within
/// an agreement.
class PurchaseOrder {
  /// The unique identifier of the charge to associate the purchase order with.
  final String chargeId;

  /// The unique identifier of the agreement associated with this charge.
  final String? agreementId;

  /// The revision of the charge.
  final int? chargeRevision;

  /// The purchase order reference to associate with the charge.
  final String? purchaseOrderReference;

  PurchaseOrder({
    required this.chargeId,
    this.agreementId,
    this.chargeRevision,
    this.purchaseOrderReference,
  });

  Map<String, dynamic> toJson() {
    final chargeId = this.chargeId;
    final agreementId = this.agreementId;
    final chargeRevision = this.chargeRevision;
    final purchaseOrderReference = this.purchaseOrderReference;
    return {
      'chargeId': chargeId,
      if (agreementId != null) 'agreementId': agreementId,
      if (chargeRevision != null) 'chargeRevision': chargeRevision,
      if (purchaseOrderReference != null)
        'purchaseOrderReference': purchaseOrderReference,
    };
  }
}

class PaymentRequestStatus {
  static const validating = PaymentRequestStatus._('VALIDATING');
  static const validationFailed = PaymentRequestStatus._('VALIDATION_FAILED');
  static const pendingApproval = PaymentRequestStatus._('PENDING_APPROVAL');
  static const approved = PaymentRequestStatus._('APPROVED');
  static const rejected = PaymentRequestStatus._('REJECTED');
  static const cancelled = PaymentRequestStatus._('CANCELLED');

  final String value;

  const PaymentRequestStatus._(this.value);

  static const values = [
    validating,
    validationFailed,
    pendingApproval,
    approved,
    rejected,
    cancelled
  ];

  static PaymentRequestStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentRequestStatus._(value));

  @override
  bool operator ==(other) =>
      other is PaymentRequestStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AgreementCancellationRequestStatus {
  static const pendingApproval =
      AgreementCancellationRequestStatus._('PENDING_APPROVAL');
  static const approved = AgreementCancellationRequestStatus._('APPROVED');
  static const rejected = AgreementCancellationRequestStatus._('REJECTED');
  static const cancelled = AgreementCancellationRequestStatus._('CANCELLED');
  static const validationFailed =
      AgreementCancellationRequestStatus._('VALIDATION_FAILED');

  final String value;

  const AgreementCancellationRequestStatus._(this.value);

  static const values = [
    pendingApproval,
    approved,
    rejected,
    cancelled,
    validationFailed
  ];

  static AgreementCancellationRequestStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementCancellationRequestStatus._(value));

  @override
  bool operator ==(other) =>
      other is AgreementCancellationRequestStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AgreementCancellationRequestReasonCode {
  static const incorrectTermsAccepted =
      AgreementCancellationRequestReasonCode._('INCORRECT_TERMS_ACCEPTED');
  static const replacingAgreement =
      AgreementCancellationRequestReasonCode._('REPLACING_AGREEMENT');
  static const testAgreement =
      AgreementCancellationRequestReasonCode._('TEST_AGREEMENT');
  static const alternativeProcurementChannel =
      AgreementCancellationRequestReasonCode._(
          'ALTERNATIVE_PROCUREMENT_CHANNEL');
  static const productDiscontinued =
      AgreementCancellationRequestReasonCode._('PRODUCT_DISCONTINUED');
  static const unintendedRenewal =
      AgreementCancellationRequestReasonCode._('UNINTENDED_RENEWAL');
  static const buyerDissatisfaction =
      AgreementCancellationRequestReasonCode._('BUYER_DISSATISFACTION');
  static const other = AgreementCancellationRequestReasonCode._('OTHER');

  final String value;

  const AgreementCancellationRequestReasonCode._(this.value);

  static const values = [
    incorrectTermsAccepted,
    replacingAgreement,
    testAgreement,
    alternativeProcurementChannel,
    productDiscontinued,
    unintendedRenewal,
    buyerDissatisfaction,
    other
  ];

  static AgreementCancellationRequestReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementCancellationRequestReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is AgreementCancellationRequestReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of the agreement, including top-level attributes (for example, the
/// agreement ID, proposer, and acceptor).
class AgreementViewSummary {
  /// The date and time that the agreement was accepted.
  final DateTime? acceptanceTime;

  /// Details of the party accepting the agreement terms. This is commonly the
  /// buyer for <code>PurchaseAgreement.</code>
  final Acceptor? acceptor;

  /// The unique identifier of the agreement.
  final String? agreementId;

  /// The type of agreement.
  final String? agreementType;

  /// The date and time when the agreement ends. The field is <code>null</code>
  /// for pay-as-you-go agreements, which don’t have end dates.
  final DateTime? endTime;

  /// A list of entitlements associated with the agreement.
  final List<Entitlement>? entitlements;

  /// A summary of the proposal
  final ProposalSummary? proposalSummary;

  /// Details of the party proposing the agreement terms, most commonly the seller
  /// for <code>PurchaseAgreement</code>.
  final Proposer? proposer;

  /// The date and time when the agreement starts.
  final DateTime? startTime;

  /// The current status of the agreement.
  final AgreementStatus? status;

  AgreementViewSummary({
    this.acceptanceTime,
    this.acceptor,
    this.agreementId,
    this.agreementType,
    this.endTime,
    this.entitlements,
    this.proposalSummary,
    this.proposer,
    this.startTime,
    this.status,
  });

  factory AgreementViewSummary.fromJson(Map<String, dynamic> json) {
    return AgreementViewSummary(
      acceptanceTime: timeStampFromJson(json['acceptanceTime']),
      acceptor: json['acceptor'] != null
          ? Acceptor.fromJson(json['acceptor'] as Map<String, dynamic>)
          : null,
      agreementId: json['agreementId'] as String?,
      agreementType: json['agreementType'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      entitlements: (json['entitlements'] as List?)
          ?.nonNulls
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      proposalSummary: json['proposalSummary'] != null
          ? ProposalSummary.fromJson(
              json['proposalSummary'] as Map<String, dynamic>)
          : null,
      proposer: json['proposer'] != null
          ? Proposer.fromJson(json['proposer'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.let(AgreementStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceTime = this.acceptanceTime;
    final acceptor = this.acceptor;
    final agreementId = this.agreementId;
    final agreementType = this.agreementType;
    final endTime = this.endTime;
    final entitlements = this.entitlements;
    final proposalSummary = this.proposalSummary;
    final proposer = this.proposer;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (acceptanceTime != null)
        'acceptanceTime': unixTimestampToJson(acceptanceTime),
      if (acceptor != null) 'acceptor': acceptor,
      if (agreementId != null) 'agreementId': agreementId,
      if (agreementType != null) 'agreementType': agreementType,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (entitlements != null) 'entitlements': entitlements,
      if (proposalSummary != null) 'proposalSummary': proposalSummary,
      if (proposer != null) 'proposer': proposer,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.value,
    };
  }
}

/// The details of the party accepting the agreement terms. This is commonly the
/// buyer for <code>PurchaseAgreement</code>.
class Acceptor {
  /// The AWS account ID of the acceptor.
  final String? accountId;

  Acceptor({
    this.accountId,
  });

  factory Acceptor.fromJson(Map<String, dynamic> json) {
    return Acceptor(
      accountId: json['accountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      if (accountId != null) 'accountId': accountId,
    };
  }
}

/// Details of the party proposing the agreement terms,. This is commonly the
/// seller for <code>PurchaseAgreement</code>.
class Proposer {
  /// The AWS account ID of the proposer.
  final String? accountId;

  Proposer({
    this.accountId,
  });

  factory Proposer.fromJson(Map<String, dynamic> json) {
    return Proposer(
      accountId: json['accountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      if (accountId != null) 'accountId': accountId,
    };
  }
}

/// A summary of the proposal received from the proposer.
class ProposalSummary {
  /// The unique identifier of the offer in AWS Marketplace.
  final String? offerId;

  /// A unique identifier for the offer set containing this offer. All agreements
  /// created from offers in this set include this identifier as context.
  final String? offerSetId;

  /// The list of resources involved in the agreement.
  final List<Resource>? resources;

  ProposalSummary({
    this.offerId,
    this.offerSetId,
    this.resources,
  });

  factory ProposalSummary.fromJson(Map<String, dynamic> json) {
    return ProposalSummary(
      offerId: json['offerId'] as String?,
      offerSetId: json['offerSetId'] as String?,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final offerId = this.offerId;
    final offerSetId = this.offerSetId;
    final resources = this.resources;
    return {
      if (offerId != null) 'offerId': offerId,
      if (offerSetId != null) 'offerSetId': offerSetId,
      if (resources != null) 'resources': resources,
    };
  }
}

class AgreementStatus {
  static const active = AgreementStatus._('ACTIVE');
  static const archived = AgreementStatus._('ARCHIVED');
  static const cancelled = AgreementStatus._('CANCELLED');
  static const expired = AgreementStatus._('EXPIRED');
  static const renewed = AgreementStatus._('RENEWED');
  static const replaced = AgreementStatus._('REPLACED');
  static const rolledBack = AgreementStatus._('ROLLED_BACK');
  static const superseded = AgreementStatus._('SUPERSEDED');
  static const terminated = AgreementStatus._('TERMINATED');

  final String value;

  const AgreementStatus._(this.value);

  static const values = [
    active,
    archived,
    cancelled,
    expired,
    renewed,
    replaced,
    rolledBack,
    superseded,
    terminated
  ];

  static AgreementStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementStatus._(value));

  @override
  bool operator ==(other) => other is AgreementStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents an entitlement associated with an agreement.
class Entitlement {
  /// The Amazon Resource Name (ARN) of the AWS License Manager license associated
  /// with the entitlement.
  final String? licenseArn;

  Entitlement({
    this.licenseArn,
  });

  factory Entitlement.fromJson(Map<String, dynamic> json) {
    return Entitlement(
      licenseArn: json['licenseArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseArn = this.licenseArn;
    return {
      if (licenseArn != null) 'licenseArn': licenseArn,
    };
  }
}

/// The list of resources involved in the agreement.
class Resource {
  /// The unique identifier of the resource.
  /// <note>
  /// We mention the term resource, which is most commonly a product, so a
  /// <code>resourceId</code> is also a <code>productId</code>.
  /// </note>
  final String? id;

  /// Type of the resource, which is the product (for example,
  /// <code>SaaSProduct</code>, <code>AmiProduct</code>,
  /// <code>ContainerProduct</code>).
  final String? type;

  Resource({
    this.id,
    this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    };
  }
}

/// An object that contains the <code>SortBy</code> and <code>SortOrder</code>
/// attributes.
class Sort {
  /// The attribute on which the data is grouped, which can be by
  /// <code>StartTime</code> and <code>EndTime</code>. The default value is
  /// <code>EndTime</code>.
  final String? sortBy;

  /// The sorting order, which can be <code>ASCENDING</code> or
  /// <code>DESCENDING</code>. The default value is <code>DESCENDING</code>.
  final SortOrder? sortOrder;

  Sort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'sortBy': sortBy,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
  }
}

class SortOrder {
  static const ascending = SortOrder._('ASCENDING');
  static const descending = SortOrder._('DESCENDING');

  final String value;

  const SortOrder._(this.value);

  static const values = [ascending, descending];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filter name and value pair that is used to return a more specific list
/// of results. Filters can be used to match a set of resources by various
/// criteria, such as <code>offerId</code> or <code>productId</code>.
class Filter {
  /// The name of the filter.
  final String? name;

  /// The filter value.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

/// Summary view of a billing adjustment request.
class BillingAdjustmentSummary {
  /// The adjustment amount as a string representation of a decimal number.
  final String adjustmentAmount;

  /// The unique identifier of the agreement associated with this billing
  /// adjustment request.
  final String agreementId;

  /// The type of agreement.
  final String agreementType;

  /// The unique identifier of the billing adjustment request.
  final String billingAdjustmentRequestId;

  /// The catalog in which the agreement was created.
  final String catalog;

  /// The date and time when the billing adjustment request was created.
  final DateTime createdAt;

  /// The currency code for the adjustment amount.
  final String currencyCode;

  /// The identifier of the original invoice being adjusted.
  final String originalInvoiceId;

  /// The current status of the billing adjustment request.
  final BillingAdjustmentStatus status;

  /// The date and time when the billing adjustment request was last updated.
  final DateTime updatedAt;

  BillingAdjustmentSummary({
    required this.adjustmentAmount,
    required this.agreementId,
    required this.agreementType,
    required this.billingAdjustmentRequestId,
    required this.catalog,
    required this.createdAt,
    required this.currencyCode,
    required this.originalInvoiceId,
    required this.status,
    required this.updatedAt,
  });

  factory BillingAdjustmentSummary.fromJson(Map<String, dynamic> json) {
    return BillingAdjustmentSummary(
      adjustmentAmount: (json['adjustmentAmount'] as String?) ?? '',
      agreementId: (json['agreementId'] as String?) ?? '',
      agreementType: (json['agreementType'] as String?) ?? '',
      billingAdjustmentRequestId:
          (json['billingAdjustmentRequestId'] as String?) ?? '',
      catalog: (json['catalog'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      currencyCode: (json['currencyCode'] as String?) ?? '',
      originalInvoiceId: (json['originalInvoiceId'] as String?) ?? '',
      status:
          BillingAdjustmentStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final adjustmentAmount = this.adjustmentAmount;
    final agreementId = this.agreementId;
    final agreementType = this.agreementType;
    final billingAdjustmentRequestId = this.billingAdjustmentRequestId;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final originalInvoiceId = this.originalInvoiceId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'adjustmentAmount': adjustmentAmount,
      'agreementId': agreementId,
      'agreementType': agreementType,
      'billingAdjustmentRequestId': billingAdjustmentRequestId,
      'catalog': catalog,
      'createdAt': unixTimestampToJson(createdAt),
      'currencyCode': currencyCode,
      'originalInvoiceId': originalInvoiceId,
      'status': status.value,
      'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class BillingAdjustmentStatus {
  static const pending = BillingAdjustmentStatus._('PENDING');
  static const validationFailed =
      BillingAdjustmentStatus._('VALIDATION_FAILED');
  static const completed = BillingAdjustmentStatus._('COMPLETED');

  final String value;

  const BillingAdjustmentStatus._(this.value);

  static const values = [pending, validationFailed, completed];

  static BillingAdjustmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingAdjustmentStatus._(value));

  @override
  bool operator ==(other) =>
      other is BillingAdjustmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary view of a payment request.
class PaymentRequestSummary {
  /// The unique identifier of the agreement associated with this payment request.
  final String? agreementId;

  /// The amount charged or to be charged to the buyer.
  final String? chargeAmount;

  /// The unique identifier of the charge created after the payment request is
  /// approved. This field is only present for approved payment requests.
  final String? chargeId;

  /// The date and time when the payment request was created.
  final DateTime? createdAt;

  /// The currency code for the charge amount.
  final String? currencyCode;

  /// The descriptive name of the payment request.
  final String? name;

  /// The unique identifier of the payment request.
  final String? paymentRequestId;

  /// The current status of the payment request. Possible values include
  /// <code>VALIDATING</code>, <code>VALIDATION_FAILED</code>,
  /// <code>PENDING_APPROVAL</code>, <code>APPROVED</code>, <code>REJECTED</code>,
  /// and <code>CANCELLED</code>.
  final PaymentRequestStatus? status;

  /// The date and time when the payment request was last updated.
  final DateTime? updatedAt;

  PaymentRequestSummary({
    this.agreementId,
    this.chargeAmount,
    this.chargeId,
    this.createdAt,
    this.currencyCode,
    this.name,
    this.paymentRequestId,
    this.status,
    this.updatedAt,
  });

  factory PaymentRequestSummary.fromJson(Map<String, dynamic> json) {
    return PaymentRequestSummary(
      agreementId: json['agreementId'] as String?,
      chargeAmount: json['chargeAmount'] as String?,
      chargeId: json['chargeId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      currencyCode: json['currencyCode'] as String?,
      name: json['name'] as String?,
      paymentRequestId: json['paymentRequestId'] as String?,
      status: (json['status'] as String?)?.let(PaymentRequestStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final chargeAmount = this.chargeAmount;
    final chargeId = this.chargeId;
    final createdAt = this.createdAt;
    final currencyCode = this.currencyCode;
    final name = this.name;
    final paymentRequestId = this.paymentRequestId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (chargeAmount != null) 'chargeAmount': chargeAmount,
      if (chargeId != null) 'chargeId': chargeId,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (name != null) 'name': name,
      if (paymentRequestId != null) 'paymentRequestId': paymentRequestId,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A summary of grouped billing data for an agreement invoice line item.
class AgreementInvoiceLineItemGroupSummary {
  /// The unique identifier of the agreement.
  final String? agreementId;

  /// The billing period associated with this group.
  final InvoiceBillingPeriod? invoiceBillingPeriod;

  /// The identifier of the invoice for this group.
  final String? invoiceId;

  /// The type of invoice. Valid values are <code>INVOICE</code> and
  /// <code>CREDIT_MEMO</code>.
  final InvoiceType? invoiceType;

  /// The entity that issues the invoice.
  final InvoicingEntity? invoicingEntity;

  /// The timestamp when the invoice containing this group was created.
  final DateTime? issuedTime;

  /// Monetary amounts for this invoice group.
  final PricingCurrencyAmount? pricingCurrencyAmount;

  AgreementInvoiceLineItemGroupSummary({
    this.agreementId,
    this.invoiceBillingPeriod,
    this.invoiceId,
    this.invoiceType,
    this.invoicingEntity,
    this.issuedTime,
    this.pricingCurrencyAmount,
  });

  factory AgreementInvoiceLineItemGroupSummary.fromJson(
      Map<String, dynamic> json) {
    return AgreementInvoiceLineItemGroupSummary(
      agreementId: json['agreementId'] as String?,
      invoiceBillingPeriod: json['invoiceBillingPeriod'] != null
          ? InvoiceBillingPeriod.fromJson(
              json['invoiceBillingPeriod'] as Map<String, dynamic>)
          : null,
      invoiceId: json['invoiceId'] as String?,
      invoiceType:
          (json['invoiceType'] as String?)?.let(InvoiceType.fromString),
      invoicingEntity: json['invoicingEntity'] != null
          ? InvoicingEntity.fromJson(
              json['invoicingEntity'] as Map<String, dynamic>)
          : null,
      issuedTime: timeStampFromJson(json['issuedTime']),
      pricingCurrencyAmount: json['pricingCurrencyAmount'] != null
          ? PricingCurrencyAmount.fromJson(
              json['pricingCurrencyAmount'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final invoiceBillingPeriod = this.invoiceBillingPeriod;
    final invoiceId = this.invoiceId;
    final invoiceType = this.invoiceType;
    final invoicingEntity = this.invoicingEntity;
    final issuedTime = this.issuedTime;
    final pricingCurrencyAmount = this.pricingCurrencyAmount;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (invoiceBillingPeriod != null)
        'invoiceBillingPeriod': invoiceBillingPeriod,
      if (invoiceId != null) 'invoiceId': invoiceId,
      if (invoiceType != null) 'invoiceType': invoiceType.value,
      if (invoicingEntity != null) 'invoicingEntity': invoicingEntity,
      if (issuedTime != null) 'issuedTime': unixTimestampToJson(issuedTime),
      if (pricingCurrencyAmount != null)
        'pricingCurrencyAmount': pricingCurrencyAmount,
    };
  }
}

/// Monetary amounts associated with an invoice line item group.
class PricingCurrencyAmount {
  /// The monetary amount before tax.
  final String? amount;

  /// The 3-letter ISO 4217 currency code (e.g., <code>USD</code>,
  /// <code>EUR</code>, <code>JPY</code>).
  final String? currencyCode;

  /// The maximum refundable amount as a string representation of a decimal
  /// number.
  final String? maxAdjustmentAmount;

  PricingCurrencyAmount({
    this.amount,
    this.currencyCode,
    this.maxAdjustmentAmount,
  });

  factory PricingCurrencyAmount.fromJson(Map<String, dynamic> json) {
    return PricingCurrencyAmount(
      amount: json['amount'] as String?,
      currencyCode: json['currencyCode'] as String?,
      maxAdjustmentAmount: json['maxAdjustmentAmount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final currencyCode = this.currencyCode;
    final maxAdjustmentAmount = this.maxAdjustmentAmount;
    return {
      if (amount != null) 'amount': amount,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (maxAdjustmentAmount != null)
        'maxAdjustmentAmount': maxAdjustmentAmount,
    };
  }
}

/// The billing period for an invoice, specified by month and year.
class InvoiceBillingPeriod {
  /// The billing period month. Valid range: 1-12.
  final int month;

  /// The billing period year.
  final int year;

  InvoiceBillingPeriod({
    required this.month,
    required this.year,
  });

  factory InvoiceBillingPeriod.fromJson(Map<String, dynamic> json) {
    return InvoiceBillingPeriod(
      month: (json['month'] as int?) ?? 0,
      year: (json['year'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final month = this.month;
    final year = this.year;
    return {
      'month': month,
      'year': year,
    };
  }
}

class InvoiceType {
  static const invoice = InvoiceType._('INVOICE');
  static const creditMemo = InvoiceType._('CREDIT_MEMO');

  final String value;

  const InvoiceType._(this.value);

  static const values = [invoice, creditMemo];

  static InvoiceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InvoiceType._(value));

  @override
  bool operator ==(other) => other is InvoiceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The entity responsible for issuing the invoice.
class InvoicingEntity {
  /// The branch where the issuing entity is operating from.
  final String? branchName;

  /// Legal name of the entity issuing the invoice.
  final String? legalName;

  InvoicingEntity({
    this.branchName,
    this.legalName,
  });

  factory InvoicingEntity.fromJson(Map<String, dynamic> json) {
    return InvoicingEntity(
      branchName: json['branchName'] as String?,
      legalName: json['legalName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final branchName = this.branchName;
    final legalName = this.legalName;
    return {
      if (branchName != null) 'branchName': branchName,
      if (legalName != null) 'legalName': legalName,
    };
  }
}

class LineItemGroupBy {
  static const invoiceId = LineItemGroupBy._('INVOICE_ID');

  final String value;

  const LineItemGroupBy._(this.value);

  static const values = [invoiceId];

  static LineItemGroupBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LineItemGroupBy._(value));

  @override
  bool operator ==(other) => other is LineItemGroupBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a charge associated with an agreement, including amount, timing,
/// and purchase order details.
class Charge {
  /// The unique identifier of the agreement that resulted in this charge.
  final String? agreementId;

  /// The type of agreement that resulted in this charge (for example,
  /// <code>PurchaseAgreement</code>).
  final String? agreementType;

  /// The amount of the charge.
  final String? amount;

  /// The currency code for the charge amount.
  final String? currencyCode;

  /// The unique identifier of the charge.
  final String? id;

  /// The purchase order reference associated with the charge, if any.
  final String? purchaseOrderReference;

  /// The revision number of the charge.
  final int? revision;

  /// The date and time when the charge will be incurred. This is available only
  /// when the charge date is known.
  final DateTime? time;

  Charge({
    this.agreementId,
    this.agreementType,
    this.amount,
    this.currencyCode,
    this.id,
    this.purchaseOrderReference,
    this.revision,
    this.time,
  });

  factory Charge.fromJson(Map<String, dynamic> json) {
    return Charge(
      agreementId: json['agreementId'] as String?,
      agreementType: json['agreementType'] as String?,
      amount: json['amount'] as String?,
      currencyCode: json['currencyCode'] as String?,
      id: json['id'] as String?,
      purchaseOrderReference: json['purchaseOrderReference'] as String?,
      revision: json['revision'] as int?,
      time: timeStampFromJson(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementId = this.agreementId;
    final agreementType = this.agreementType;
    final amount = this.amount;
    final currencyCode = this.currencyCode;
    final id = this.id;
    final purchaseOrderReference = this.purchaseOrderReference;
    final revision = this.revision;
    final time = this.time;
    return {
      if (agreementId != null) 'agreementId': agreementId,
      if (agreementType != null) 'agreementType': agreementType,
      if (amount != null) 'amount': amount,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (id != null) 'id': id,
      if (purchaseOrderReference != null)
        'purchaseOrderReference': purchaseOrderReference,
      if (revision != null) 'revision': revision,
      if (time != null) 'time': unixTimestampToJson(time),
    };
  }
}

/// Summary view of an agreement cancellation request.
class AgreementCancellationRequestSummary {
  /// The unique identifier of the cancellation request.
  final String? agreementCancellationRequestId;

  /// The unique identifier of the agreement associated with this cancellation
  /// request.
  final String? agreementId;

  /// The type of agreement.
  final String? agreementType;

  /// The catalog in which the agreement was created.
  final String? catalog;

  /// The date and time when the cancellation request was created.
  final DateTime? createdAt;

  /// The reason code provided for the cancellation.
  final AgreementCancellationRequestReasonCode? reasonCode;

  /// The current status of the cancellation request. Possible values include
  /// <code>PENDING_APPROVAL</code>, <code>APPROVED</code>, <code>REJECTED</code>,
  /// <code>CANCELLED</code>, and <code>VALIDATION_FAILED</code>.
  final AgreementCancellationRequestStatus? status;

  /// The date and time when the cancellation request was last updated.
  final DateTime? updatedAt;

  AgreementCancellationRequestSummary({
    this.agreementCancellationRequestId,
    this.agreementId,
    this.agreementType,
    this.catalog,
    this.createdAt,
    this.reasonCode,
    this.status,
    this.updatedAt,
  });

  factory AgreementCancellationRequestSummary.fromJson(
      Map<String, dynamic> json) {
    return AgreementCancellationRequestSummary(
      agreementCancellationRequestId:
          json['agreementCancellationRequestId'] as String?,
      agreementId: json['agreementId'] as String?,
      agreementType: json['agreementType'] as String?,
      catalog: json['catalog'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      reasonCode: (json['reasonCode'] as String?)
          ?.let(AgreementCancellationRequestReasonCode.fromString),
      status: (json['status'] as String?)
          ?.let(AgreementCancellationRequestStatus.fromString),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementCancellationRequestId = this.agreementCancellationRequestId;
    final agreementId = this.agreementId;
    final agreementType = this.agreementType;
    final catalog = this.catalog;
    final createdAt = this.createdAt;
    final reasonCode = this.reasonCode;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (agreementCancellationRequestId != null)
        'agreementCancellationRequestId': agreementCancellationRequestId,
      if (agreementId != null) 'agreementId': agreementId,
      if (agreementType != null) 'agreementType': agreementType,
      if (catalog != null) 'catalog': catalog,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (reasonCode != null) 'reasonCode': reasonCode.value,
      if (status != null) 'status': status.value,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class BillingAdjustmentReasonCode {
  static const incorrectTermsAccepted =
      BillingAdjustmentReasonCode._('INCORRECT_TERMS_ACCEPTED');
  static const incorrectMetering =
      BillingAdjustmentReasonCode._('INCORRECT_METERING');
  static const testEnvironmentCharges =
      BillingAdjustmentReasonCode._('TEST_ENVIRONMENT_CHARGES');
  static const alternativeProcurementChannel =
      BillingAdjustmentReasonCode._('ALTERNATIVE_PROCUREMENT_CHANNEL');
  static const unintendedRenewal =
      BillingAdjustmentReasonCode._('UNINTENDED_RENEWAL');
  static const buyerDissatisfaction =
      BillingAdjustmentReasonCode._('BUYER_DISSATISFACTION');
  static const other = BillingAdjustmentReasonCode._('OTHER');

  final String value;

  const BillingAdjustmentReasonCode._(this.value);

  static const values = [
    incorrectTermsAccepted,
    incorrectMetering,
    testEnvironmentCharges,
    alternativeProcurementChannel,
    unintendedRenewal,
    buyerDissatisfaction,
    other
  ];

  static BillingAdjustmentReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingAdjustmentReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is BillingAdjustmentReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A subset of terms proposed by the proposer, which have been accepted by the
/// acceptor as part of agreement creation.
class AcceptedTerm {
  /// Enables you and your customers to move your existing agreements to AWS
  /// Marketplace. The customer won't be charged for product usage in AWS
  /// Marketplace because they already paid for the product outside of AWS
  /// Marketplace.
  final ByolPricingTerm? byolPricingTerm;

  /// Defines a prepaid payment model that allows buyers to configure the
  /// entitlements they want to purchase and the duration.
  final ConfigurableUpfrontPricingTerm? configurableUpfrontPricingTerm;

  /// Defines a pre-paid pricing model where the customers are charged a fixed
  /// upfront amount.
  final FixedUpfrontPricingTerm? fixedUpfrontPricingTerm;

  /// Defines a short-term free pricing model where the buyers aren’t charged
  /// anything within a specified limit.
  final FreeTrialPricingTerm? freeTrialPricingTerm;

  /// Defines the list of text agreements proposed to the acceptors. An example is
  /// the end user license agreement (EULA).
  final LegalTerm? legalTerm;

  /// Defines an installment-based pricing model where customers are charged a
  /// fixed price on different dates during the agreement validity period. This is
  /// used most commonly for flexible payment schedule pricing.
  final PaymentScheduleTerm? paymentScheduleTerm;

  /// Defines a pricing model where customers are charged a fixed recurring price
  /// at the end of each billing period.
  final RecurringPaymentTerm? recurringPaymentTerm;

  /// Defines that on graceful expiration of the agreement (when the agreement
  /// ends on its pre-defined end date), a new agreement will be created using the
  /// accepted terms on the existing agreement. In other words, the agreement will
  /// be renewed. Presence of <code>RenewalTerm</code> in the offer document means
  /// that auto-renewal is allowed. Buyers will have the option to accept or
  /// decline auto-renewal at the offer acceptance/agreement creation. Buyers can
  /// also change this flag from <code>True</code> to <code>False</code> or
  /// <code>False</code> to <code>True</code> at anytime during the agreement's
  /// lifecycle.
  final RenewalTerm? renewalTerm;

  /// Defines the customer support available for the acceptors when they purchase
  /// the software.
  final SupportTerm? supportTerm;

  /// Defines a usage-based pricing model (typically, pay-as-you-go pricing),
  /// where the customers are charged based on product usage.
  final UsageBasedPricingTerm? usageBasedPricingTerm;

  /// Defines the conditions that will keep an agreement created from this offer
  /// valid.
  final ValidityTerm? validityTerm;

  /// Defines a payment model where sellers can submit variable payment requests
  /// up to a maximum charge amount, with configurable approval strategies and
  /// expiration timelines.
  final VariablePaymentTerm? variablePaymentTerm;

  AcceptedTerm({
    this.byolPricingTerm,
    this.configurableUpfrontPricingTerm,
    this.fixedUpfrontPricingTerm,
    this.freeTrialPricingTerm,
    this.legalTerm,
    this.paymentScheduleTerm,
    this.recurringPaymentTerm,
    this.renewalTerm,
    this.supportTerm,
    this.usageBasedPricingTerm,
    this.validityTerm,
    this.variablePaymentTerm,
  });

  factory AcceptedTerm.fromJson(Map<String, dynamic> json) {
    return AcceptedTerm(
      byolPricingTerm: json['byolPricingTerm'] != null
          ? ByolPricingTerm.fromJson(
              json['byolPricingTerm'] as Map<String, dynamic>)
          : null,
      configurableUpfrontPricingTerm: json['configurableUpfrontPricingTerm'] !=
              null
          ? ConfigurableUpfrontPricingTerm.fromJson(
              json['configurableUpfrontPricingTerm'] as Map<String, dynamic>)
          : null,
      fixedUpfrontPricingTerm: json['fixedUpfrontPricingTerm'] != null
          ? FixedUpfrontPricingTerm.fromJson(
              json['fixedUpfrontPricingTerm'] as Map<String, dynamic>)
          : null,
      freeTrialPricingTerm: json['freeTrialPricingTerm'] != null
          ? FreeTrialPricingTerm.fromJson(
              json['freeTrialPricingTerm'] as Map<String, dynamic>)
          : null,
      legalTerm: json['legalTerm'] != null
          ? LegalTerm.fromJson(json['legalTerm'] as Map<String, dynamic>)
          : null,
      paymentScheduleTerm: json['paymentScheduleTerm'] != null
          ? PaymentScheduleTerm.fromJson(
              json['paymentScheduleTerm'] as Map<String, dynamic>)
          : null,
      recurringPaymentTerm: json['recurringPaymentTerm'] != null
          ? RecurringPaymentTerm.fromJson(
              json['recurringPaymentTerm'] as Map<String, dynamic>)
          : null,
      renewalTerm: json['renewalTerm'] != null
          ? RenewalTerm.fromJson(json['renewalTerm'] as Map<String, dynamic>)
          : null,
      supportTerm: json['supportTerm'] != null
          ? SupportTerm.fromJson(json['supportTerm'] as Map<String, dynamic>)
          : null,
      usageBasedPricingTerm: json['usageBasedPricingTerm'] != null
          ? UsageBasedPricingTerm.fromJson(
              json['usageBasedPricingTerm'] as Map<String, dynamic>)
          : null,
      validityTerm: json['validityTerm'] != null
          ? ValidityTerm.fromJson(json['validityTerm'] as Map<String, dynamic>)
          : null,
      variablePaymentTerm: json['variablePaymentTerm'] != null
          ? VariablePaymentTerm.fromJson(
              json['variablePaymentTerm'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final byolPricingTerm = this.byolPricingTerm;
    final configurableUpfrontPricingTerm = this.configurableUpfrontPricingTerm;
    final fixedUpfrontPricingTerm = this.fixedUpfrontPricingTerm;
    final freeTrialPricingTerm = this.freeTrialPricingTerm;
    final legalTerm = this.legalTerm;
    final paymentScheduleTerm = this.paymentScheduleTerm;
    final recurringPaymentTerm = this.recurringPaymentTerm;
    final renewalTerm = this.renewalTerm;
    final supportTerm = this.supportTerm;
    final usageBasedPricingTerm = this.usageBasedPricingTerm;
    final validityTerm = this.validityTerm;
    final variablePaymentTerm = this.variablePaymentTerm;
    return {
      if (byolPricingTerm != null) 'byolPricingTerm': byolPricingTerm,
      if (configurableUpfrontPricingTerm != null)
        'configurableUpfrontPricingTerm': configurableUpfrontPricingTerm,
      if (fixedUpfrontPricingTerm != null)
        'fixedUpfrontPricingTerm': fixedUpfrontPricingTerm,
      if (freeTrialPricingTerm != null)
        'freeTrialPricingTerm': freeTrialPricingTerm,
      if (legalTerm != null) 'legalTerm': legalTerm,
      if (paymentScheduleTerm != null)
        'paymentScheduleTerm': paymentScheduleTerm,
      if (recurringPaymentTerm != null)
        'recurringPaymentTerm': recurringPaymentTerm,
      if (renewalTerm != null) 'renewalTerm': renewalTerm,
      if (supportTerm != null) 'supportTerm': supportTerm,
      if (usageBasedPricingTerm != null)
        'usageBasedPricingTerm': usageBasedPricingTerm,
      if (validityTerm != null) 'validityTerm': validityTerm,
      if (variablePaymentTerm != null)
        'variablePaymentTerm': variablePaymentTerm,
    };
  }
}

/// Defines the list of text agreements proposed to the acceptors. An example is
/// the end user license agreement (EULA).
class LegalTerm {
  /// List of references to legal resources proposed to the buyers. An example is
  /// the EULA.
  final List<DocumentItem>? documents;

  /// The unique identifer for the term.
  final String? id;

  /// Category of the term being updated.
  final String? type;

  LegalTerm({
    this.documents,
    this.id,
    this.type,
  });

  factory LegalTerm.fromJson(Map<String, dynamic> json) {
    return LegalTerm(
      documents: (json['documents'] as List?)
          ?.nonNulls
          .map((e) => DocumentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final id = this.id;
    final type = this.type;
    return {
      if (documents != null) 'documents': documents,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    };
  }
}

/// Defines the customer support available for the acceptors when they purchase
/// the software.
class SupportTerm {
  /// The unique identifier for the term.
  final String? id;

  /// Free-text field about the refund policy description that will be shown to
  /// customers as is on the website and console.
  final String? refundPolicy;

  /// Category of the term being updated.
  final String? type;

  SupportTerm({
    this.id,
    this.refundPolicy,
    this.type,
  });

  factory SupportTerm.fromJson(Map<String, dynamic> json) {
    return SupportTerm(
      id: json['id'] as String?,
      refundPolicy: json['refundPolicy'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final refundPolicy = this.refundPolicy;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (refundPolicy != null) 'refundPolicy': refundPolicy,
      if (type != null) 'type': type,
    };
  }
}

/// Defines that on graceful expiration of the agreement (when the agreement
/// ends on its pre-defined end date), a new agreement will be created using the
/// accepted terms on the existing agreement. In other words, the agreement will
/// be renewed. The presence of <code>RenewalTerm</code> in the offer document
/// means that auto-renewal is allowed. Buyers will have the option to accept or
/// decline auto-renewal at the offer acceptance/agreement creation. Buyers can
/// also change this flag from <code>True</code> to <code>False</code> or
/// <code>False</code> to <code>True</code> at anytime during the agreement's
/// lifecycle.
class RenewalTerm {
  /// Additional parameters specified by the acceptor while accepting the term.
  final RenewalTermConfiguration? configuration;

  /// The unique identifier for the term.
  final String? id;

  /// Category of the term being updated.
  final String? type;

  RenewalTerm({
    this.configuration,
    this.id,
    this.type,
  });

  factory RenewalTerm.fromJson(Map<String, dynamic> json) {
    return RenewalTerm(
      configuration: json['configuration'] != null
          ? RenewalTermConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final id = this.id;
    final type = this.type;
    return {
      if (configuration != null) 'configuration': configuration,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    };
  }
}

/// Defines a usage-based pricing model (typically, pay-as-you-go pricing),
/// where the customers are charged based on product usage.
class UsageBasedPricingTerm {
  /// Defines the currency for the prices mentioned in the term.
  final String? currencyCode;

  /// The unique identifier for the term.
  final String? id;

  /// List of rate cards.
  final List<UsageBasedRateCardItem>? rateCards;

  /// Category of the term.
  final String? type;

  UsageBasedPricingTerm({
    this.currencyCode,
    this.id,
    this.rateCards,
    this.type,
  });

  factory UsageBasedPricingTerm.fromJson(Map<String, dynamic> json) {
    return UsageBasedPricingTerm(
      currencyCode: json['currencyCode'] as String?,
      id: json['id'] as String?,
      rateCards: (json['rateCards'] as List?)
          ?.nonNulls
          .map(
              (e) => UsageBasedRateCardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final id = this.id;
    final rateCards = this.rateCards;
    final type = this.type;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (id != null) 'id': id,
      if (rateCards != null) 'rateCards': rateCards,
      if (type != null) 'type': type,
    };
  }
}

/// Defines a prepaid payment model that allows buyers to configure the
/// entitlements they want to purchase and the duration.
class ConfigurableUpfrontPricingTerm {
  /// Additional parameters specified by the acceptor while accepting the term.
  final ConfigurableUpfrontPricingTermConfiguration? configuration;

  /// Defines the currency for the prices mentioned in the term.
  final String? currencyCode;

  /// The unique identifier of the term.
  final String? id;

  /// A rate card defines the per unit rates for product dimensions.
  final List<ConfigurableUpfrontRateCardItem>? rateCards;

  /// Category of selector.
  final String? type;

  ConfigurableUpfrontPricingTerm({
    this.configuration,
    this.currencyCode,
    this.id,
    this.rateCards,
    this.type,
  });

  factory ConfigurableUpfrontPricingTerm.fromJson(Map<String, dynamic> json) {
    return ConfigurableUpfrontPricingTerm(
      configuration: json['configuration'] != null
          ? ConfigurableUpfrontPricingTermConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      currencyCode: json['currencyCode'] as String?,
      id: json['id'] as String?,
      rateCards: (json['rateCards'] as List?)
          ?.nonNulls
          .map((e) => ConfigurableUpfrontRateCardItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final currencyCode = this.currencyCode;
    final id = this.id;
    final rateCards = this.rateCards;
    final type = this.type;
    return {
      if (configuration != null) 'configuration': configuration,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (id != null) 'id': id,
      if (rateCards != null) 'rateCards': rateCards,
      if (type != null) 'type': type,
    };
  }
}

/// Enables you and your customers to move your existing agreements to AWS
/// Marketplace. The customer won't be charged for product usage in AWS
/// Marketplace because they already paid for the product outside of AWS
/// Marketplace.
class ByolPricingTerm {
  /// The unique identifier for the term.
  final String? id;

  /// Type of the term being updated.
  final String? type;

  ByolPricingTerm({
    this.id,
    this.type,
  });

  factory ByolPricingTerm.fromJson(Map<String, dynamic> json) {
    return ByolPricingTerm(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    };
  }
}

/// Defines a pricing model where customers are charged a fixed recurring price
/// at the end of each billing period.
class RecurringPaymentTerm {
  /// Defines the recurrence at which buyers are charged.
  final String? billingPeriod;

  /// Defines the currency for the prices mentioned in this term.
  final String? currencyCode;

  /// The unique identifier for the term.
  final String? id;

  /// Amount charged to the buyer every billing period.
  final String? price;

  /// Type of the term being updated.
  final String? type;

  RecurringPaymentTerm({
    this.billingPeriod,
    this.currencyCode,
    this.id,
    this.price,
    this.type,
  });

  factory RecurringPaymentTerm.fromJson(Map<String, dynamic> json) {
    return RecurringPaymentTerm(
      billingPeriod: json['billingPeriod'] as String?,
      currencyCode: json['currencyCode'] as String?,
      id: json['id'] as String?,
      price: json['price'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final currencyCode = this.currencyCode;
    final id = this.id;
    final price = this.price;
    final type = this.type;
    return {
      if (billingPeriod != null) 'billingPeriod': billingPeriod,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (type != null) 'type': type,
    };
  }
}

/// Defines the conditions that will keep an agreement created from this offer
/// valid.
class ValidityTerm {
  /// Defines the duration that the agreement remains active. If
  /// <code>AgreementStartDate</code> isn’t provided, the agreement duration is
  /// relative to the agreement signature time. The duration is represented in the
  /// ISO_8601 format.
  final String? agreementDuration;

  /// Defines the date when the agreement ends. The agreement ends at 23:59:59.999
  /// UTC on the date provided. If <code>AgreementEndDate</code> isn’t provided,
  /// the agreement end date is determined by the validity of individual terms.
  final DateTime? agreementEndDate;

  /// Defines the date when agreement starts. The agreement starts at 00:00:00.000
  /// UTC on the date provided. If <code>AgreementStartDate</code> isn’t provided,
  /// the agreement start date is determined based on agreement signature time.
  final DateTime? agreementStartDate;

  /// The unique identifier for the term.
  final String? id;

  /// Category of the term being updated.
  final String? type;

  ValidityTerm({
    this.agreementDuration,
    this.agreementEndDate,
    this.agreementStartDate,
    this.id,
    this.type,
  });

  factory ValidityTerm.fromJson(Map<String, dynamic> json) {
    return ValidityTerm(
      agreementDuration: json['agreementDuration'] as String?,
      agreementEndDate: timeStampFromJson(json['agreementEndDate']),
      agreementStartDate: timeStampFromJson(json['agreementStartDate']),
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementDuration = this.agreementDuration;
    final agreementEndDate = this.agreementEndDate;
    final agreementStartDate = this.agreementStartDate;
    final id = this.id;
    final type = this.type;
    return {
      if (agreementDuration != null) 'agreementDuration': agreementDuration,
      if (agreementEndDate != null)
        'agreementEndDate': unixTimestampToJson(agreementEndDate),
      if (agreementStartDate != null)
        'agreementStartDate': unixTimestampToJson(agreementStartDate),
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    };
  }
}

/// Defines an installment-based pricing model where customers are charged a
/// fixed price on different dates during the agreement validity period. This is
/// used most commonly for flexible payment schedule pricing.
class PaymentScheduleTerm {
  /// Defines the currency for the prices mentioned in the term.
  final String? currencyCode;

  /// The unique identifier for the term.
  final String? id;

  /// List of the payment schedule where each element defines one installment of
  /// payment. It contains the information necessary for calculating the price.
  final List<ScheduleItem>? schedule;

  /// Type of the term.
  final String? type;

  PaymentScheduleTerm({
    this.currencyCode,
    this.id,
    this.schedule,
    this.type,
  });

  factory PaymentScheduleTerm.fromJson(Map<String, dynamic> json) {
    return PaymentScheduleTerm(
      currencyCode: json['currencyCode'] as String?,
      id: json['id'] as String?,
      schedule: (json['schedule'] as List?)
          ?.nonNulls
          .map((e) => ScheduleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final id = this.id;
    final schedule = this.schedule;
    final type = this.type;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (id != null) 'id': id,
      if (schedule != null) 'schedule': schedule,
      if (type != null) 'type': type,
    };
  }
}

/// Defines a short-term free pricing model where the buyers aren’t charged
/// anything within a specified limit.
class FreeTrialPricingTerm {
  /// Duration of the free trial period (5–31 days).
  final String? duration;

  /// Entitlements granted to the acceptor of a free trial as part of an agreement
  /// execution.
  final List<GrantItem>? grants;

  /// The unique identifier for the terms.
  final String? id;

  /// Category of the term.
  final String? type;

  FreeTrialPricingTerm({
    this.duration,
    this.grants,
    this.id,
    this.type,
  });

  factory FreeTrialPricingTerm.fromJson(Map<String, dynamic> json) {
    return FreeTrialPricingTerm(
      duration: json['duration'] as String?,
      grants: (json['grants'] as List?)
          ?.nonNulls
          .map((e) => GrantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final grants = this.grants;
    final id = this.id;
    final type = this.type;
    return {
      if (duration != null) 'duration': duration,
      if (grants != null) 'grants': grants,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    };
  }
}

/// Defines a prepaid pricing model where the customers are charged a fixed
/// upfront amount.
class FixedUpfrontPricingTerm {
  /// Defines the currency for the prices mentioned in this term.
  final String? currencyCode;

  /// Contract duration for the terms.
  final String? duration;

  /// Entitlements granted to the acceptor of fixed upfront as part of agreement
  /// execution.
  final List<GrantItem>? grants;

  /// The unique identifier for the term.
  final String? id;

  /// Fixed amount to be charged to the customer when this term is accepted.
  final String? price;

  /// Category of the term being updated.
  final String? type;

  FixedUpfrontPricingTerm({
    this.currencyCode,
    this.duration,
    this.grants,
    this.id,
    this.price,
    this.type,
  });

  factory FixedUpfrontPricingTerm.fromJson(Map<String, dynamic> json) {
    return FixedUpfrontPricingTerm(
      currencyCode: json['currencyCode'] as String?,
      duration: json['duration'] as String?,
      grants: (json['grants'] as List?)
          ?.nonNulls
          .map((e) => GrantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      price: json['price'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final grants = this.grants;
    final id = this.id;
    final price = this.price;
    final type = this.type;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (duration != null) 'duration': duration,
      if (grants != null) 'grants': grants,
      if (id != null) 'id': id,
      if (price != null) 'price': price,
      if (type != null) 'type': type,
    };
  }
}

/// Defines a payment model where sellers can submit variable payment requests
/// up to a maximum charge amount, with configurable approval strategies and
/// expiration timelines.
class VariablePaymentTerm {
  /// Additional parameters specified by the acceptor while accepting the term.
  final VariablePaymentTermConfiguration? configuration;

  /// Defines the currency for the prices mentioned in the term.
  final String? currencyCode;

  /// The unique identifier for the term.
  final String? id;

  /// The maximum total amount that can be charged to the customer through
  /// variable payment requests under this term.
  final String? maxTotalChargeAmount;

  /// Type of the term.
  final String? type;

  VariablePaymentTerm({
    this.configuration,
    this.currencyCode,
    this.id,
    this.maxTotalChargeAmount,
    this.type,
  });

  factory VariablePaymentTerm.fromJson(Map<String, dynamic> json) {
    return VariablePaymentTerm(
      configuration: json['configuration'] != null
          ? VariablePaymentTermConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      currencyCode: json['currencyCode'] as String?,
      id: json['id'] as String?,
      maxTotalChargeAmount: json['maxTotalChargeAmount'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final currencyCode = this.currencyCode;
    final id = this.id;
    final maxTotalChargeAmount = this.maxTotalChargeAmount;
    final type = this.type;
    return {
      if (configuration != null) 'configuration': configuration,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (id != null) 'id': id,
      if (maxTotalChargeAmount != null)
        'maxTotalChargeAmount': maxTotalChargeAmount,
      if (type != null) 'type': type,
    };
  }
}

/// Additional parameters specified by the acceptor while accepting the variable
/// payment term.
class VariablePaymentTermConfiguration {
  /// Defines the strategy for approving payment requests. Values include
  /// <code>AUTO_APPROVE_ON_EXPIRATION</code> and <code>WAIT_FOR_APPROVAL</code>
  final PaymentRequestApprovalStrategy paymentRequestApprovalStrategy;

  /// Defines the duration after which a payment request is automatically approved
  /// if no further action is taken. This only applies when the payment request
  /// approval strategy is set to <code>AUTO_APPROVE_ON_EXPIRATION</code>. The
  /// duration is represented in the ISO_8601 format (e.g., P10D for 10 days).
  final String? expirationDuration;

  VariablePaymentTermConfiguration({
    required this.paymentRequestApprovalStrategy,
    this.expirationDuration,
  });

  factory VariablePaymentTermConfiguration.fromJson(Map<String, dynamic> json) {
    return VariablePaymentTermConfiguration(
      paymentRequestApprovalStrategy: PaymentRequestApprovalStrategy.fromString(
          (json['paymentRequestApprovalStrategy'] as String?) ?? ''),
      expirationDuration: json['expirationDuration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final paymentRequestApprovalStrategy = this.paymentRequestApprovalStrategy;
    final expirationDuration = this.expirationDuration;
    return {
      'paymentRequestApprovalStrategy': paymentRequestApprovalStrategy.value,
      if (expirationDuration != null) 'expirationDuration': expirationDuration,
    };
  }
}

class PaymentRequestApprovalStrategy {
  static const autoApproveOnExpiration =
      PaymentRequestApprovalStrategy._('AUTO_APPROVE_ON_EXPIRATION');
  static const waitForApproval =
      PaymentRequestApprovalStrategy._('WAIT_FOR_APPROVAL');

  final String value;

  const PaymentRequestApprovalStrategy._(this.value);

  static const values = [autoApproveOnExpiration, waitForApproval];

  static PaymentRequestApprovalStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PaymentRequestApprovalStrategy._(value));

  @override
  bool operator ==(other) =>
      other is PaymentRequestApprovalStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Entitlements granted to the acceptor of fixed upfront as part of agreement
/// execution.
class GrantItem {
  /// Unique dimension key defined in the product document. Dimensions represent
  /// categories of capacity in a product and are specified when the product is
  /// listed in AWS Marketplace.
  final String? dimensionKey;

  /// Maximum amount of capacity that the buyer can be entitled to the given
  /// dimension of the product. If <code>MaxQuantity</code> is not provided, the
  /// buyer will be able to use an unlimited amount of the given dimension.
  final int? maxQuantity;

  GrantItem({
    this.dimensionKey,
    this.maxQuantity,
  });

  factory GrantItem.fromJson(Map<String, dynamic> json) {
    return GrantItem(
      dimensionKey: json['dimensionKey'] as String?,
      maxQuantity: json['maxQuantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionKey = this.dimensionKey;
    final maxQuantity = this.maxQuantity;
    return {
      if (dimensionKey != null) 'dimensionKey': dimensionKey,
      if (maxQuantity != null) 'maxQuantity': maxQuantity,
    };
  }
}

/// An individual installment of the payment that includes the date and amount
/// of the charge.
class ScheduleItem {
  /// The price that the customer would pay on the scheduled date (chargeDate).
  final String? chargeAmount;

  /// The date that the customer would pay the price defined in this payment
  /// schedule term. Invoices are generated on the date provided.
  final DateTime? chargeDate;

  ScheduleItem({
    this.chargeAmount,
    this.chargeDate,
  });

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      chargeAmount: json['chargeAmount'] as String?,
      chargeDate: timeStampFromJson(json['chargeDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final chargeAmount = this.chargeAmount;
    final chargeDate = this.chargeDate;
    return {
      if (chargeAmount != null) 'chargeAmount': chargeAmount,
      if (chargeDate != null) 'chargeDate': unixTimestampToJson(chargeDate),
    };
  }
}

/// Defines a prepaid payment model that allows buyers to configure the
/// entitlements they want to purchase and the duration.
class ConfigurableUpfrontPricingTermConfiguration {
  /// Defines the dimensions that the acceptor has purchased from the overall set
  /// of dimensions presented in the rate card.
  final List<Dimension> dimensions;

  /// Defines the length of time for which the particular pricing/dimension is
  /// being purchased by the acceptor.
  final String selectorValue;

  ConfigurableUpfrontPricingTermConfiguration({
    required this.dimensions,
    required this.selectorValue,
  });

  factory ConfigurableUpfrontPricingTermConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ConfigurableUpfrontPricingTermConfiguration(
      dimensions: ((json['dimensions'] as List?) ?? const [])
          .nonNulls
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectorValue: (json['selectorValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final selectorValue = this.selectorValue;
    return {
      'dimensions': dimensions,
      'selectorValue': selectorValue,
    };
  }
}

/// Defines the dimensions that the acceptor has purchased from the overall set
/// of dimensions presented in the rate card.
class Dimension {
  /// The name of key value of the dimension.
  final String dimensionKey;

  /// The number of units of the dimension the acceptor has purchased.
  /// <note>
  /// For Agreements with <code>ConfigurableUpfrontPricingTerm</code>, the
  /// <code>RateCard</code> section will define the prices and dimensions defined
  /// by the seller (proposer), whereas the <code>Configuration</code> section
  /// will define the actual dimensions, prices, and units the buyer has chosen to
  /// accept.
  /// </note>
  final int dimensionValue;

  Dimension({
    required this.dimensionKey,
    required this.dimensionValue,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      dimensionKey: (json['dimensionKey'] as String?) ?? '',
      dimensionValue: (json['dimensionValue'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionKey = this.dimensionKey;
    final dimensionValue = this.dimensionValue;
    return {
      'dimensionKey': dimensionKey,
      'dimensionValue': dimensionValue,
    };
  }
}

/// Within the prepaid payment model defined under
/// <code>ConfigurableUpfrontPricingTerm</code>, the <code>RateCardItem</code>
/// defines all the various rate cards (including pricing and dimensions) that
/// have been proposed.
class ConfigurableUpfrontRateCardItem {
  /// Defines limits on how the term can be configured by acceptors.
  final Constraints? constraints;

  /// Defines the per unit rates for product dimensions.
  final List<RateCardItem>? rateCard;

  /// Differentiates between the mutually exclusive rate cards in the same pricing
  /// term to be selected by the buyer.
  final Selector? selector;

  ConfigurableUpfrontRateCardItem({
    this.constraints,
    this.rateCard,
    this.selector,
  });

  factory ConfigurableUpfrontRateCardItem.fromJson(Map<String, dynamic> json) {
    return ConfigurableUpfrontRateCardItem(
      constraints: json['constraints'] != null
          ? Constraints.fromJson(json['constraints'] as Map<String, dynamic>)
          : null,
      rateCard: (json['rateCard'] as List?)
          ?.nonNulls
          .map((e) => RateCardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      selector: json['selector'] != null
          ? Selector.fromJson(json['selector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final constraints = this.constraints;
    final rateCard = this.rateCard;
    final selector = this.selector;
    return {
      if (constraints != null) 'constraints': constraints,
      if (rateCard != null) 'rateCard': rateCard,
      if (selector != null) 'selector': selector,
    };
  }
}

/// Differentiates between the mutually exclusive rate cards in the same pricing
/// term to be selected by the buyer.
class Selector {
  /// Category of selector.
  final String? type;

  /// Contract duration. This field supports the ISO 8601 format.
  final String? value;

  Selector({
    this.type,
    this.value,
  });

  factory Selector.fromJson(Map<String, dynamic> json) {
    return Selector(
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      if (type != null) 'type': type,
      if (value != null) 'value': value,
    };
  }
}

/// Defines limits on how the term can be configured by acceptors.
class Constraints {
  /// Determines if buyers are allowed to select multiple dimensions in the rate
  /// card. The possible values are <code>Allowed</code> and
  /// <code>Disallowed</code>. The default value is <code>Allowed</code>.
  final String? multipleDimensionSelection;

  /// Determines if acceptors are allowed to configure quantity for each dimension
  /// in rate card. The possible values are <code>Allowed</code> and
  /// <code>Disallowed</code>. The default value is <code>Allowed</code>.
  final String? quantityConfiguration;

  Constraints({
    this.multipleDimensionSelection,
    this.quantityConfiguration,
  });

  factory Constraints.fromJson(Map<String, dynamic> json) {
    return Constraints(
      multipleDimensionSelection: json['multipleDimensionSelection'] as String?,
      quantityConfiguration: json['quantityConfiguration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multipleDimensionSelection = this.multipleDimensionSelection;
    final quantityConfiguration = this.quantityConfiguration;
    return {
      if (multipleDimensionSelection != null)
        'multipleDimensionSelection': multipleDimensionSelection,
      if (quantityConfiguration != null)
        'quantityConfiguration': quantityConfiguration,
    };
  }
}

/// Defines the per unit rates for each individual product dimension.
class RateCardItem {
  /// Dimension for which the given entitlement applies. Dimensions represent
  /// categories of capacity in a product and are specified when the product is
  /// listed in AWS Marketplace.
  final String? dimensionKey;

  /// Per unit price for the product dimension that’s used for calculating the
  /// amount to be charged.
  final String? price;

  RateCardItem({
    this.dimensionKey,
    this.price,
  });

  factory RateCardItem.fromJson(Map<String, dynamic> json) {
    return RateCardItem(
      dimensionKey: json['dimensionKey'] as String?,
      price: json['price'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionKey = this.dimensionKey;
    final price = this.price;
    return {
      if (dimensionKey != null) 'dimensionKey': dimensionKey,
      if (price != null) 'price': price,
    };
  }
}

/// Within the pay-as-you-go model defined under
/// <code>UsageBasedPricingTerm</code>, the <code>UsageBasedRateCardItem</code>
/// defines an individual rate for a product dimension.
class UsageBasedRateCardItem {
  /// Defines the per unit rates for product dimensions.
  final List<RateCardItem>? rateCard;

  UsageBasedRateCardItem({
    this.rateCard,
  });

  factory UsageBasedRateCardItem.fromJson(Map<String, dynamic> json) {
    return UsageBasedRateCardItem(
      rateCard: (json['rateCard'] as List?)
          ?.nonNulls
          .map((e) => RateCardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rateCard = this.rateCard;
    return {
      if (rateCard != null) 'rateCard': rateCard,
    };
  }
}

/// Additional parameters specified by the acceptor while accepting the term.
class RenewalTermConfiguration {
  /// Defines whether the acceptor has chosen to auto-renew the agreement at the
  /// end of its lifecycle. Can be set to <code>True</code> or <code>False</code>.
  final bool enableAutoRenew;

  RenewalTermConfiguration({
    required this.enableAutoRenew,
  });

  factory RenewalTermConfiguration.fromJson(Map<String, dynamic> json) {
    return RenewalTermConfiguration(
      enableAutoRenew: (json['enableAutoRenew'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final enableAutoRenew = this.enableAutoRenew;
    return {
      'enableAutoRenew': enableAutoRenew,
    };
  }
}

/// Includes the list of references to legal resources proposed by the proposer
/// to the acceptor. Each <code>DocumentItem</code> refers to an individual
/// reference.
class DocumentItem {
  /// Category of the document. Document types include:
  ///
  /// <ul>
  /// <li>
  /// <code>CustomEula</code> – A custom EULA provided by you as seller. A URL for
  /// a EULA stored in an accessible Amazon S3 bucket is required for this
  /// document type.
  /// </li>
  /// <li>
  /// <code>CustomDsa</code> – A custom Data Subscription Agreement (DSA) provided
  /// by you as seller. A URL for a DSA stored in an accessible Amazon S3 bucket
  /// is required for this document type.
  /// </li>
  /// <li>
  /// <code>StandardEula</code> – The Standard Contract for AWS Marketplace
  /// (SCMP). For more information about SCMP, see the AWS Marketplace Seller
  /// Guide. You don’t provide a URL for this type because it’s managed by AWS
  /// Marketplace.
  /// </li>
  /// <li>
  /// <code>StandardDsa</code> – DSA for AWS Marketplace. For more information
  /// about the DSA, see the AWS Data Exchange User Guide. You don’t provide a URL
  /// for this type because it’s managed by AWS Marketplace.
  /// </li>
  /// </ul>
  final String? type;

  /// A URL to the legal document for buyers to read. Required when
  /// <code>Type</code> is <code>CustomEula</code>.
  final String? url;

  /// Version of standard contracts provided by AWS Marketplace. Required when
  /// Type is <code>StandardEula</code> or <code>StandardDsa</code>.
  final String? version;

  DocumentItem({
    this.type,
    this.url,
    this.version,
  });

  factory DocumentItem.fromJson(Map<String, dynamic> json) {
    return DocumentItem(
      type: json['type'] as String?,
      url: json['url'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final url = this.url;
    final version = this.version;
    return {
      if (type != null) 'type': type,
      if (url != null) 'url': url,
      if (version != null) 'version': version,
    };
  }
}

/// Represents an entitlement associated with an agreement, including the
/// provisioning status, resource, and type.
class AgreementEntitlement {
  /// The Amazon Resource Name (ARN) of the AWS License Manager license associated
  /// with the entitlement.
  final String? licenseArn;

  /// A short-lived token required by acceptors to register their account with the
  /// product provider. The token is only valid for 30 minutes after creation and
  /// is only applicable for purchase agreements.
  final String? registrationToken;

  /// The resource that the entitlement is provisioned to, such as a product.
  final Resource? resource;

  /// The current state of an entitlement.
  final AgreementEntitlementStatus? status;

  /// Provides more information about the status of an entitlement.
  final AgreementEntitlementStatusReasonCode? statusReasonCode;

  /// The type of entitlement.
  final String? type;

  AgreementEntitlement({
    this.licenseArn,
    this.registrationToken,
    this.resource,
    this.status,
    this.statusReasonCode,
    this.type,
  });

  factory AgreementEntitlement.fromJson(Map<String, dynamic> json) {
    return AgreementEntitlement(
      licenseArn: json['licenseArn'] as String?,
      registrationToken: json['registrationToken'] as String?,
      resource: json['resource'] != null
          ? Resource.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)
          ?.let(AgreementEntitlementStatus.fromString),
      statusReasonCode: (json['statusReasonCode'] as String?)
          ?.let(AgreementEntitlementStatusReasonCode.fromString),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseArn = this.licenseArn;
    final registrationToken = this.registrationToken;
    final resource = this.resource;
    final status = this.status;
    final statusReasonCode = this.statusReasonCode;
    final type = this.type;
    return {
      if (licenseArn != null) 'licenseArn': licenseArn,
      if (registrationToken != null) 'registrationToken': registrationToken,
      if (resource != null) 'resource': resource,
      if (status != null) 'status': status.value,
      if (statusReasonCode != null) 'statusReasonCode': statusReasonCode.value,
      if (type != null) 'type': type,
    };
  }
}

class AgreementEntitlementStatus {
  static const provisioned = AgreementEntitlementStatus._('PROVISIONED');
  static const scheduled = AgreementEntitlementStatus._('SCHEDULED');
  static const pending = AgreementEntitlementStatus._('PENDING');
  static const failed = AgreementEntitlementStatus._('FAILED');
  static const deprovisioned = AgreementEntitlementStatus._('DEPROVISIONED');

  final String value;

  const AgreementEntitlementStatus._(this.value);

  static const values = [
    provisioned,
    scheduled,
    pending,
    failed,
    deprovisioned
  ];

  static AgreementEntitlementStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementEntitlementStatus._(value));

  @override
  bool operator ==(other) =>
      other is AgreementEntitlementStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AgreementEntitlementStatusReasonCode {
  static const provisioningInProgress =
      AgreementEntitlementStatusReasonCode._('PROVISIONING_IN_PROGRESS');
  static const futureStartDate =
      AgreementEntitlementStatusReasonCode._('FUTURE_START_DATE');
  static const invalidPaymentInstrument =
      AgreementEntitlementStatusReasonCode._('INVALID_PAYMENT_INSTRUMENT');
  static const incompatibleCurrency =
      AgreementEntitlementStatusReasonCode._('INCOMPATIBLE_CURRENCY');
  static const accountSuspended =
      AgreementEntitlementStatusReasonCode._('ACCOUNT_SUSPENDED');
  static const unsupportedOperation =
      AgreementEntitlementStatusReasonCode._('UNSUPPORTED_OPERATION');
  static const agreementInactive =
      AgreementEntitlementStatusReasonCode._('AGREEMENT_INACTIVE');
  static const agreementActive =
      AgreementEntitlementStatusReasonCode._('AGREEMENT_ACTIVE');
  static const productRestricted =
      AgreementEntitlementStatusReasonCode._('PRODUCT_RESTRICTED');

  final String value;

  const AgreementEntitlementStatusReasonCode._(this.value);

  static const values = [
    provisioningInProgress,
    futureStartDate,
    invalidPaymentInstrument,
    incompatibleCurrency,
    accountSuspended,
    unsupportedOperation,
    agreementInactive,
    agreementActive,
    productRestricted
  ];

  static AgreementEntitlementStatusReasonCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementEntitlementStatusReasonCode._(value));

  @override
  bool operator ==(other) =>
      other is AgreementEntitlementStatusReasonCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Estimated cost of the agreement.
class EstimatedCharges {
  /// The total known amount customer has to pay across the lifecycle of the
  /// agreement.
  /// <note>
  /// This is the total contract value if accepted terms contain
  /// <code>ConfigurableUpfrontPricingTerm</code> or
  /// <code>FixedUpfrontPricingTerm</code>. In the case of pure contract pricing,
  /// this will be the total value of the contract. In the case of contracts with
  /// consumption pricing, this will only include the committed value and not
  /// include any overages that occur.
  ///
  /// If the accepted terms contain <code>PaymentScheduleTerm</code>, it will be
  /// the total payment schedule amount. This occurs when flexible payment
  /// schedule is used, and is the sum of all invoice charges in the payment
  /// schedule.
  ///
  /// In case a customer has amended an agreement, by purchasing more units of any
  /// dimension, this will include both the original cost as well as the added
  /// cost incurred due to addition of new units.
  ///
  /// This is <code>0</code> if the accepted terms contain
  /// <code>UsageBasedPricingTerm</code> without
  /// <code>ConfigurableUpfrontPricingTerm</code> or
  /// <code>RecurringPaymentTerm</code>. This occurs for usage-based pricing (such
  /// as SaaS metered or AMI/container hourly or monthly), because the exact usage
  /// is not known upfront.
  /// </note>
  final String? agreementValue;

  /// Defines the currency code for the charge.
  final String? currencyCode;

  EstimatedCharges({
    this.agreementValue,
    this.currencyCode,
  });

  factory EstimatedCharges.fromJson(Map<String, dynamic> json) {
    return EstimatedCharges(
      agreementValue: json['agreementValue'] as String?,
      currencyCode: json['currencyCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementValue = this.agreementValue;
    final currencyCode = this.currencyCode;
    return {
      if (agreementValue != null) 'agreementValue': agreementValue,
      if (currencyCode != null) 'currencyCode': currencyCode,
    };
  }
}

/// The <code>ChargeSummary</code> provides a detailed breakdown of charges that
/// are associated with an agreement request. This is applicable only when a
/// request is created for a <code>PurchaseAgreement</code>.
/// <note>
/// Tax and invoicing fields (such as <code>estimatedTaxes</code>,
/// <code>amountAfterTax</code>, <code>newAgreementValueAfterTax</code>, and
/// <code>invoicingEntity</code>) are returned on a best-effort basis and do not
/// cause the request to fail if unavailable.
///
/// A <code>null</code> tax amount can have two meanings:
///
/// <ul>
/// <li>
/// Tax estimation was unavailable at the time of the request.
/// </li>
/// <li>
/// The charge timing is <code>BILLING_PERIOD</code>, so the charge amount is
/// not determined at request time. In this case, the tax breakdown may still
/// include the tax <code>rate</code> and <code>type</code>.
/// </li>
/// </ul> </note>
class ChargeSummary {
  /// The three-letter currency code for all charges (e.g., USD).
  final String? currencyCode;

  /// Provides an aggregated view of estimated tax information for the agreement.
  final EstimatedTaxes? estimatedTaxes;

  /// A list of expected charges for the agreement request.
  final List<ExpectedCharge>? expectedCharges;

  /// The entity responsible for issuing the invoice.
  final InvoicingEntity? invoicingEntity;

  /// An itemized list of charges for the agreement request.
  final List<ItemizedCharge>? itemizedCharges;

  /// The total value of the agreement, which includes any amendments.
  final String? newAgreementValue;

  /// Expected new agreement value after estimated taxes are applied.
  final String? newAgreementValueAfterTax;

  ChargeSummary({
    this.currencyCode,
    this.estimatedTaxes,
    this.expectedCharges,
    this.invoicingEntity,
    this.itemizedCharges,
    this.newAgreementValue,
    this.newAgreementValueAfterTax,
  });

  factory ChargeSummary.fromJson(Map<String, dynamic> json) {
    return ChargeSummary(
      currencyCode: json['currencyCode'] as String?,
      estimatedTaxes: json['estimatedTaxes'] != null
          ? EstimatedTaxes.fromJson(
              json['estimatedTaxes'] as Map<String, dynamic>)
          : null,
      expectedCharges: (json['expectedCharges'] as List?)
          ?.nonNulls
          .map((e) => ExpectedCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      invoicingEntity: json['invoicingEntity'] != null
          ? InvoicingEntity.fromJson(
              json['invoicingEntity'] as Map<String, dynamic>)
          : null,
      itemizedCharges: (json['itemizedCharges'] as List?)
          ?.nonNulls
          .map((e) => ItemizedCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      newAgreementValue: json['newAgreementValue'] as String?,
      newAgreementValueAfterTax: json['newAgreementValueAfterTax'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final estimatedTaxes = this.estimatedTaxes;
    final expectedCharges = this.expectedCharges;
    final invoicingEntity = this.invoicingEntity;
    final itemizedCharges = this.itemizedCharges;
    final newAgreementValue = this.newAgreementValue;
    final newAgreementValueAfterTax = this.newAgreementValueAfterTax;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (estimatedTaxes != null) 'estimatedTaxes': estimatedTaxes,
      if (expectedCharges != null) 'expectedCharges': expectedCharges,
      if (invoicingEntity != null) 'invoicingEntity': invoicingEntity,
      if (itemizedCharges != null) 'itemizedCharges': itemizedCharges,
      if (newAgreementValue != null) 'newAgreementValue': newAgreementValue,
      if (newAgreementValueAfterTax != null)
        'newAgreementValueAfterTax': newAgreementValueAfterTax,
    };
  }
}

/// Provides an aggregated view of estimated tax information.
class EstimatedTaxes {
  /// A list of tax breakdown information.
  final List<TaxBreakdownItem>? breakdown;

  /// The total amount of tax aggregated from the tax breakdown.
  final String? totalAmount;

  EstimatedTaxes({
    this.breakdown,
    this.totalAmount,
  });

  factory EstimatedTaxes.fromJson(Map<String, dynamic> json) {
    return EstimatedTaxes(
      breakdown: (json['breakdown'] as List?)
          ?.nonNulls
          .map((e) => TaxBreakdownItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['totalAmount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final breakdown = this.breakdown;
    final totalAmount = this.totalAmount;
    return {
      if (breakdown != null) 'breakdown': breakdown,
      if (totalAmount != null) 'totalAmount': totalAmount,
    };
  }
}

/// A breakdown of individual charges or line items within a billing or pricing
/// context.
class ItemizedCharge {
  /// The identifier of the expected charge that this itemized charge contributes
  /// to.
  final String? chargeReference;

  /// The dimension key as specified in the accepted term.
  final String? dimensionKey;

  /// The total incremental charge amount for this dimension.
  final String? incrementalChargeAmount;

  /// The requested quantity for this dimension.
  final int? newQuantity;

  /// The existing quantity for this dimension from the source agreement. This
  /// value is <code>0</code> for NEW intent.
  final int? oldQuantity;

  ItemizedCharge({
    this.chargeReference,
    this.dimensionKey,
    this.incrementalChargeAmount,
    this.newQuantity,
    this.oldQuantity,
  });

  factory ItemizedCharge.fromJson(Map<String, dynamic> json) {
    return ItemizedCharge(
      chargeReference: json['chargeReference'] as String?,
      dimensionKey: json['dimensionKey'] as String?,
      incrementalChargeAmount: json['incrementalChargeAmount'] as String?,
      newQuantity: json['newQuantity'] as int?,
      oldQuantity: json['oldQuantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final chargeReference = this.chargeReference;
    final dimensionKey = this.dimensionKey;
    final incrementalChargeAmount = this.incrementalChargeAmount;
    final newQuantity = this.newQuantity;
    final oldQuantity = this.oldQuantity;
    return {
      if (chargeReference != null) 'chargeReference': chargeReference,
      if (dimensionKey != null) 'dimensionKey': dimensionKey,
      if (incrementalChargeAmount != null)
        'incrementalChargeAmount': incrementalChargeAmount,
      if (newQuantity != null) 'newQuantity': newQuantity,
      if (oldQuantity != null) 'oldQuantity': oldQuantity,
    };
  }
}

/// Represents a single tax breakdown entry with amount, rate, and type.
class TaxBreakdownItem {
  /// The estimated tax amount.
  final String? amount;

  /// The tax rate, in decimals.
  final String? rate;

  /// The type of tax (for example, VAT, ST, or GST).
  final String? type;

  TaxBreakdownItem({
    this.amount,
    this.rate,
    this.type,
  });

  factory TaxBreakdownItem.fromJson(Map<String, dynamic> json) {
    return TaxBreakdownItem(
      amount: json['amount'] as String?,
      rate: json['rate'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final rate = this.rate;
    final type = this.type;
    return {
      if (amount != null) 'amount': amount,
      if (rate != null) 'rate': rate,
      if (type != null) 'type': type,
    };
  }
}

/// Estimated charge for the request.
class ExpectedCharge {
  /// The tax-exclusive amount of the charge. Only available when the charge
  /// amount is known.
  final String? amount;

  /// The tax-inclusive amount the acceptor has to pay. The amount is only present
  /// for fixed charges.
  final String? amountAfterTax;

  /// Provides an aggregated view of estimated tax information for this specific
  /// charge.
  final EstimatedTaxes? estimatedTaxes;

  /// Unique identifier of the charge for a given agreement.
  final String? id;

  /// The date and time when the charge is due to be invoiced. This is available
  /// only when the charge date is known.
  final DateTime? time;

  /// Indicates when the charge amount will be incurred. Values include
  /// <code>ON_ACCEPTANCE</code> (charged immediately when the agreement request
  /// is accepted), <code>BILLING_PERIOD</code> (charged on each billing period),
  /// and <code>SCHEDULED</code> (charged at a predetermined future date).
  final Timing? timing;

  ExpectedCharge({
    this.amount,
    this.amountAfterTax,
    this.estimatedTaxes,
    this.id,
    this.time,
    this.timing,
  });

  factory ExpectedCharge.fromJson(Map<String, dynamic> json) {
    return ExpectedCharge(
      amount: json['amount'] as String?,
      amountAfterTax: json['amountAfterTax'] as String?,
      estimatedTaxes: json['estimatedTaxes'] != null
          ? EstimatedTaxes.fromJson(
              json['estimatedTaxes'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      time: timeStampFromJson(json['time']),
      timing: (json['timing'] as String?)?.let(Timing.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final amountAfterTax = this.amountAfterTax;
    final estimatedTaxes = this.estimatedTaxes;
    final id = this.id;
    final time = this.time;
    final timing = this.timing;
    return {
      if (amount != null) 'amount': amount,
      if (amountAfterTax != null) 'amountAfterTax': amountAfterTax,
      if (estimatedTaxes != null) 'estimatedTaxes': estimatedTaxes,
      if (id != null) 'id': id,
      if (time != null) 'time': unixTimestampToJson(time),
      if (timing != null) 'timing': timing.value,
    };
  }
}

class Timing {
  static const onAcceptance = Timing._('ON_ACCEPTANCE');
  static const scheduled = Timing._('SCHEDULED');
  static const billingPeriod = Timing._('BILLING_PERIOD');

  final String value;

  const Timing._(this.value);

  static const values = [onAcceptance, scheduled, billingPeriod];

  static Timing fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Timing._(value));

  @override
  bool operator ==(other) => other is Timing && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Intent {
  static const $new = Intent._('NEW');
  static const amend = Intent._('AMEND');
  static const replace = Intent._('REPLACE');

  final String value;

  const Intent._(this.value);

  static const values = [$new, amend, replace];

  static Intent fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Intent._(value));

  @override
  bool operator ==(other) => other is Intent && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration controls for tax estimation in the agreement request.
class TaxConfiguration {
  /// Toggle to estimate tax as part of the response. Values include
  /// <code>ENABLED</code> and <code>DISABLED</code>. Default is
  /// <code>DISABLED</code>.
  final TaxEstimation? taxEstimation;

  TaxConfiguration({
    this.taxEstimation,
  });

  Map<String, dynamic> toJson() {
    final taxEstimation = this.taxEstimation;
    return {
      if (taxEstimation != null) 'taxEstimation': taxEstimation.value,
    };
  }
}

class TaxEstimation {
  static const disabled = TaxEstimation._('DISABLED');
  static const enabled = TaxEstimation._('ENABLED');

  final String value;

  const TaxEstimation._(this.value);

  static const values = [disabled, enabled];

  static TaxEstimation fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaxEstimation._(value));

  @override
  bool operator ==(other) => other is TaxEstimation && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines what is being accepted as part of the agreement creation or update
/// request, and it includes their configurations.
class RequestedTerm {
  /// The unique identifier of the term in the agreement proposal.
  final String id;

  /// Additional configuration for the requested terms. This configuration is
  /// applicable only to the terms that accept a customer-provided configuration,
  /// such as <code>ConfigurableUpfrontPricingTerm</code>.
  final RequestedTermConfiguration? configuration;

  RequestedTerm({
    required this.id,
    this.configuration,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final configuration = this.configuration;
    return {
      'id': id,
      if (configuration != null) 'configuration': configuration,
    };
  }
}

/// A tagged union that represents the term configuration provided by the
/// acceptor. Only one configuration is accepted per term.
class RequestedTermConfiguration {
  final ConfigurableUpfrontPricingTermConfiguration?
      configurableUpfrontPricingTermConfiguration;
  final RenewalTermConfiguration? renewalTermConfiguration;
  final VariablePaymentTermConfiguration? variablePaymentTermConfiguration;

  RequestedTermConfiguration({
    this.configurableUpfrontPricingTermConfiguration,
    this.renewalTermConfiguration,
    this.variablePaymentTermConfiguration,
  });

  Map<String, dynamic> toJson() {
    final configurableUpfrontPricingTermConfiguration =
        this.configurableUpfrontPricingTermConfiguration;
    final renewalTermConfiguration = this.renewalTermConfiguration;
    final variablePaymentTermConfiguration =
        this.variablePaymentTermConfiguration;
    return {
      if (configurableUpfrontPricingTermConfiguration != null)
        'configurableUpfrontPricingTermConfiguration':
            configurableUpfrontPricingTermConfiguration,
      if (renewalTermConfiguration != null)
        'renewalTermConfiguration': renewalTermConfiguration,
      if (variablePaymentTermConfiguration != null)
        'variablePaymentTermConfiguration': variablePaymentTermConfiguration,
    };
  }
}

/// An error for a billing adjustment request entry that failed validation.
class BatchCreateBillingAdjustmentError {
  /// The client token of the request entry that failed.
  final String clientToken;

  /// The error code indicating the reason for failure.
  final BillingAdjustmentErrorCode code;

  /// A human-readable message describing the error.
  final String message;

  BatchCreateBillingAdjustmentError({
    required this.clientToken,
    required this.code,
    required this.message,
  });

  factory BatchCreateBillingAdjustmentError.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateBillingAdjustmentError(
      clientToken: (json['clientToken'] as String?) ?? '',
      code: BillingAdjustmentErrorCode.fromString(
          (json['code'] as String?) ?? ''),
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final code = this.code;
    final message = this.message;
    return {
      'clientToken': clientToken,
      'code': code.value,
      'message': message,
    };
  }
}

class BillingAdjustmentErrorCode {
  static const conflictException =
      BillingAdjustmentErrorCode._('CONFLICT_EXCEPTION');
  static const validationException =
      BillingAdjustmentErrorCode._('VALIDATION_EXCEPTION');
  static const resourceNotFoundException =
      BillingAdjustmentErrorCode._('RESOURCE_NOT_FOUND_EXCEPTION');
  static const internalFailure =
      BillingAdjustmentErrorCode._('INTERNAL_FAILURE');

  final String value;

  const BillingAdjustmentErrorCode._(this.value);

  static const values = [
    conflictException,
    validationException,
    resourceNotFoundException,
    internalFailure
  ];

  static BillingAdjustmentErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingAdjustmentErrorCode._(value));

  @override
  bool operator ==(other) =>
      other is BillingAdjustmentErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A successfully created billing adjustment request item.
class BatchCreateBillingAdjustmentItem {
  /// The unique identifier of the created billing adjustment request.
  final String billingAdjustmentRequestId;

  /// The client token provided in the corresponding request entry.
  final String clientToken;

  BatchCreateBillingAdjustmentItem({
    required this.billingAdjustmentRequestId,
    required this.clientToken,
  });

  factory BatchCreateBillingAdjustmentItem.fromJson(Map<String, dynamic> json) {
    return BatchCreateBillingAdjustmentItem(
      billingAdjustmentRequestId:
          (json['billingAdjustmentRequestId'] as String?) ?? '',
      clientToken: (json['clientToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final billingAdjustmentRequestId = this.billingAdjustmentRequestId;
    final clientToken = this.clientToken;
    return {
      'billingAdjustmentRequestId': billingAdjustmentRequestId,
      'clientToken': clientToken,
    };
  }
}

/// An individual entry in a batch billing adjustment request, specifying the
/// invoice and adjustment details.
class BatchCreateBillingAdjustmentRequestEntry {
  /// The adjustment amount as a string representation of a decimal number in the
  /// currency of the invoice.
  final String adjustmentAmount;

  /// The reason code for the billing adjustment.
  final BillingAdjustmentReasonCode adjustmentReasonCode;

  /// The unique identifier of the agreement associated with the invoice.
  final String agreementId;

  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String clientToken;

  /// The 3-letter ISO 4217 currency code for the adjustment amount. Must match
  /// the currency code of the offer associated with the agreement (e.g.,
  /// <code>USD</code>).
  final String currencyCode;

  /// The identifier of the original invoice to adjust.
  final String originalInvoiceId;

  /// An optional detailed description of the adjustment reason.
  final String? description;

  BatchCreateBillingAdjustmentRequestEntry({
    required this.adjustmentAmount,
    required this.adjustmentReasonCode,
    required this.agreementId,
    required this.clientToken,
    required this.currencyCode,
    required this.originalInvoiceId,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final adjustmentAmount = this.adjustmentAmount;
    final adjustmentReasonCode = this.adjustmentReasonCode;
    final agreementId = this.agreementId;
    final clientToken = this.clientToken;
    final currencyCode = this.currencyCode;
    final originalInvoiceId = this.originalInvoiceId;
    final description = this.description;
    return {
      'adjustmentAmount': adjustmentAmount,
      'adjustmentReasonCode': adjustmentReasonCode.value,
      'agreementId': agreementId,
      'clientToken': clientToken,
      'currencyCode': currencyCode,
      'originalInvoiceId': originalInvoiceId,
      if (description != null) 'description': description,
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
