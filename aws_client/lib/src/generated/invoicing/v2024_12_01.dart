// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2024_12_01.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// <b>Amazon Web Services Invoice Configuration</b>
///
/// You can use Amazon Web Services Invoice Configuration APIs to
/// programmatically create, update, delete, get, and list invoice units. You
/// can also programmatically fetch the information of the invoice receiver. For
/// example, business legal name, address, and invoicing contacts.
///
/// You can use Amazon Web Services Invoice Configuration to receive separate
/// Amazon Web Services invoices based your organizational needs. By using
/// Amazon Web Services Invoice Configuration, you can configure invoice units
/// that are groups of Amazon Web Services accounts that represent your business
/// entities, and receive separate invoices for each business entity. You can
/// also assign a unique member or payer account as the invoice receiver for
/// each invoice unit. As you create new accounts within your Organizations
/// using Amazon Web Services Invoice Configuration APIs, you can automate the
/// creation of new invoice units and subsequently automate the addition of new
/// accounts to your invoice units.
///
/// <b>Amazon Web Services Procurement Portal Preferences</b>
///
/// You can use Amazon Web Services Procurement Portal Preferences APIs to
/// programmatically create, update, delete, get, and list procurement portal
/// connections and e-invoice delivery settings. You can also programmatically
/// fetch and modify the status of procurement portal configurations. For
/// example, SAP Business Network or Coupa connections, configure e-invoice
/// delivery and purchase order retrieval features.
///
/// You can use Amazon Web Services Procurement Portal Preferences to connect
/// e-invoice delivery to your procurement portals based on your organizational
/// needs. By using Amazon Web Services Procurement Portal Preferences, you can
/// configure connections to SAP Business Network and Coupa procurement portals
/// that retrieve purchase orders and deliver Amazon Web Services invoices on
/// the same day they are generated. You can also set up testing environments to
/// validate invoice delivery without affecting live transactions, and manage
/// contact information for portal setup and support.
///
/// Administrative users should understand that billing read-only policies will
/// show all procurement portal connection details. Review your IAM policies to
/// ensure appropriate access controls are in place for procurement portal
/// preferences.
///
/// <b>Amazon Web Services Invoice Management</b>
///
/// You can use Amazon Web Services Invoice Management APIs to programmatically
/// list invoice summaries and get invoice documents. You can also
/// programmatically fetch invoice documents with S3 pre-signed URLs.
///
/// You can use Amazon Web Services Invoice Management to access invoice
/// information based on your organizational needs. By using Amazon Web Services
/// Invoice Management, you can retrieve paginated lists of invoice summaries
/// that include invoice metadata such as invoice IDs, amounts, and currencies
/// without downloading documents. You can also download invoice documents in
/// PDF format using S3 pre-signed URLs with built-in expiration. As you manage
/// invoices across your organization using Amazon Web Services Invoice
/// Management APIs, you can create invoice retrieval processes and integrate
/// invoice data into your financial systems.
///
/// Service endpoint
///
/// You can use the following endpoints for Amazon Web Services Invoice
/// Configuration, Amazon Web Services Procurement Portal Preferences, and
/// Amazon Web Services Invoice Management:
///
/// <ul>
/// <li>
/// <code>https://invoicing.us-east-1.api.aws</code>
/// </li>
/// </ul>
class Invoicing {
  final _s.JsonProtocol _protocol;
  factory Invoicing({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'invoicing',
    );
    return Invoicing._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Invoicing._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// This gets the invoice profile associated with a set of accounts. The
  /// accounts must be linked accounts under the requester management account
  /// organization.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountIds] :
  /// Retrieves the corresponding invoice profile data for these account IDs.
  Future<BatchGetInvoiceProfileResponse> batchGetInvoiceProfile({
    required List<String> accountIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.BatchGetInvoiceProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AccountIds': accountIds,
      },
    );

    return BatchGetInvoiceProfileResponse.fromJson(jsonResponse.body);
  }

  /// This creates a new invoice unit with the provided definition.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invoiceReceiver] :
  /// The Amazon Web Services account ID chosen to be the receiver of an invoice
  /// unit. All invoices generated for that invoice unit will be sent to this
  /// account ID.
  ///
  /// Parameter [name] :
  /// The unique name of the invoice unit that is shown on the generated
  /// invoice. This can't be changed once it is set. To change this name, you
  /// must delete the invoice unit recreate.
  ///
  /// Parameter [rule] :
  /// The <code>InvoiceUnitRule</code> object used to create invoice units.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// The invoice unit's description. This can be changed at a later time.
  ///
  /// Parameter [resourceTags] :
  /// The tag structure that contains a tag key and value.
  ///
  /// Parameter [taxInheritanceDisabled] :
  /// Whether the invoice unit based tax inheritance is/ should be enabled or
  /// disabled.
  Future<CreateInvoiceUnitResponse> createInvoiceUnit({
    required String invoiceReceiver,
    required String name,
    required InvoiceUnitRule rule,
    String? clientToken,
    String? description,
    List<ResourceTag>? resourceTags,
    bool? taxInheritanceDisabled,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.CreateInvoiceUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InvoiceReceiver': invoiceReceiver,
        'Name': name,
        'Rule': rule,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (resourceTags != null) 'ResourceTags': resourceTags,
        if (taxInheritanceDisabled != null)
          'TaxInheritanceDisabled': taxInheritanceDisabled,
      },
    );

    return CreateInvoiceUnitResponse.fromJson(jsonResponse.body);
  }

  /// <i> <b>This feature API is subject to changing at any time. For more
  /// information, see the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Betas and Previews).</b> </i>
  ///
  /// Creates a procurement portal preference configuration for e-invoice
  /// delivery and purchase order retrieval. This preference defines how
  /// invoices are delivered to a procurement portal and how purchase orders are
  /// retrieved.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buyerDomain] :
  /// The domain identifier for the buyer in the procurement portal.
  ///
  /// Parameter [buyerIdentifier] :
  /// The unique identifier for the buyer in the procurement portal.
  ///
  /// Parameter [contacts] :
  /// List of contact information for portal administrators and technical
  /// contacts responsible for the e-invoice integration.
  ///
  /// Parameter [einvoiceDeliveryEnabled] :
  /// Indicates whether e-invoice delivery is enabled for this procurement
  /// portal preference. Set to true to enable e-invoice delivery, false to
  /// disable.
  ///
  /// Parameter [procurementPortalName] :
  /// The name of the procurement portal.
  ///
  /// Parameter [purchaseOrderRetrievalEnabled] :
  /// Indicates whether purchase order retrieval is enabled for this procurement
  /// portal preference. Set to true to enable PO retrieval, false to disable.
  ///
  /// Parameter [supplierDomain] :
  /// The domain identifier for the supplier in the procurement portal.
  ///
  /// Parameter [supplierIdentifier] :
  /// The unique identifier for the supplier in the procurement portal.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of the request.
  ///
  /// Parameter [einvoiceDeliveryPreference] :
  /// Specifies the e-invoice delivery configuration including document types,
  /// attachment types, and customization settings for the portal.
  ///
  /// Parameter [procurementPortalInstanceEndpoint] :
  /// The endpoint URL where e-invoices will be delivered to the procurement
  /// portal. Must be a valid HTTPS URL.
  ///
  /// Parameter [procurementPortalSharedSecret] :
  /// The shared secret or authentication credential used to establish secure
  /// communication with the procurement portal. This value must be encrypted at
  /// rest.
  ///
  /// Parameter [resourceTags] :
  /// The tags to apply to this procurement portal preference resource. Each tag
  /// consists of a key and an optional value.
  ///
  /// Parameter [testEnvPreference] :
  /// Configuration settings for the test environment of the procurement portal.
  /// Includes test credentials and endpoints that are used for validation
  /// before production deployment.
  Future<CreateProcurementPortalPreferenceResponse>
      createProcurementPortalPreference({
    required BuyerDomain buyerDomain,
    required String buyerIdentifier,
    required List<Contact> contacts,
    required bool einvoiceDeliveryEnabled,
    required ProcurementPortalName procurementPortalName,
    required bool purchaseOrderRetrievalEnabled,
    required SupplierDomain supplierDomain,
    required String supplierIdentifier,
    String? clientToken,
    EinvoiceDeliveryPreference? einvoiceDeliveryPreference,
    String? procurementPortalInstanceEndpoint,
    String? procurementPortalSharedSecret,
    List<ResourceTag>? resourceTags,
    ProcurementPortalPreferenceSelector? selector,
    TestEnvPreferenceInput? testEnvPreference,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.CreateProcurementPortalPreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BuyerDomain': buyerDomain.value,
        'BuyerIdentifier': buyerIdentifier,
        'Contacts': contacts,
        'EinvoiceDeliveryEnabled': einvoiceDeliveryEnabled,
        'ProcurementPortalName': procurementPortalName.value,
        'PurchaseOrderRetrievalEnabled': purchaseOrderRetrievalEnabled,
        'SupplierDomain': supplierDomain.value,
        'SupplierIdentifier': supplierIdentifier,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (einvoiceDeliveryPreference != null)
          'EinvoiceDeliveryPreference': einvoiceDeliveryPreference,
        if (procurementPortalInstanceEndpoint != null)
          'ProcurementPortalInstanceEndpoint':
              procurementPortalInstanceEndpoint,
        if (procurementPortalSharedSecret != null)
          'ProcurementPortalSharedSecret': procurementPortalSharedSecret,
        if (resourceTags != null) 'ResourceTags': resourceTags,
        if (selector != null) 'Selector': selector,
        if (testEnvPreference != null) 'TestEnvPreference': testEnvPreference,
      },
    );

    return CreateProcurementPortalPreferenceResponse.fromJson(
        jsonResponse.body);
  }

  /// This deletes an invoice unit with the provided invoice unit ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invoiceUnitArn] :
  /// The ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of the request.
  Future<DeleteInvoiceUnitResponse> deleteInvoiceUnit({
    required String invoiceUnitArn,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.DeleteInvoiceUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InvoiceUnitArn': invoiceUnitArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteInvoiceUnitResponse.fromJson(jsonResponse.body);
  }

  /// <i> <b>This feature API is subject to changing at any time. For more
  /// information, see the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Betas and Previews).</b> </i>
  ///
  /// Deletes an existing procurement portal preference. This action cannot be
  /// undone. Active e-invoice delivery and PO retrieval configurations will be
  /// terminated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [procurementPortalPreferenceArn] :
  /// The Amazon Resource Name (ARN) of the procurement portal preference to
  /// delete.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of the request.
  Future<DeleteProcurementPortalPreferenceResponse>
      deleteProcurementPortalPreference({
    required String procurementPortalPreferenceArn,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.DeleteProcurementPortalPreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteProcurementPortalPreferenceResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns a URL to download the invoice document and supplemental documents
  /// associated with an invoice. The URLs are pre-signed and have expiration
  /// time. For special cases like Brazil, where Amazon Web Services generated
  /// invoice identifiers and government provided identifiers do not match, use
  /// the Amazon Web Services generated invoice identifier when making API
  /// requests. To grant IAM permission to use this operation, the caller needs
  /// the <code>invoicing:GetInvoicePDF</code> policy action.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invoiceId] :
  /// Your unique invoice ID.
  Future<GetInvoicePDFResponse> getInvoicePDF({
    required String invoiceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.GetInvoicePDF'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InvoiceId': invoiceId,
      },
    );

    return GetInvoicePDFResponse.fromJson(jsonResponse.body);
  }

  /// This retrieves the invoice unit definition.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invoiceUnitArn] :
  /// The ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  ///
  /// Parameter [asOf] :
  /// The state of an invoice unit at a specified time. You can see legacy
  /// invoice units that are currently deleted if the <code>AsOf</code> time is
  /// set to before it was deleted. If an <code>AsOf</code> is not provided, the
  /// default value is the current time.
  Future<GetInvoiceUnitResponse> getInvoiceUnit({
    required String invoiceUnitArn,
    DateTime? asOf,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.GetInvoiceUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InvoiceUnitArn': invoiceUnitArn,
        if (asOf != null) 'AsOf': unixTimestampToJson(asOf),
      },
    );

    return GetInvoiceUnitResponse.fromJson(jsonResponse.body);
  }

  /// <i> <b>This feature API is subject to changing at any time. For more
  /// information, see the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Betas and Previews).</b> </i>
  ///
  /// Retrieves the details of a specific procurement portal preference
  /// configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [procurementPortalPreferenceArn] :
  /// The Amazon Resource Name (ARN) of the procurement portal preference to
  /// retrieve.
  Future<GetProcurementPortalPreferenceResponse>
      getProcurementPortalPreference({
    required String procurementPortalPreferenceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.GetProcurementPortalPreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
      },
    );

    return GetProcurementPortalPreferenceResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves your invoice details programmatically, without line item
  /// details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [selector] :
  /// The option to retrieve details for a specific invoice by providing its
  /// unique ID. Alternatively, access information for all invoices linked to
  /// the account by providing an account ID.
  ///
  /// Parameter [filter] :
  /// Filters you can use to customize your invoice summary.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of invoice summaries a paginated response can contain.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. (You received this token from a
  /// previous call.)
  Future<ListInvoiceSummariesResponse> listInvoiceSummaries({
    required InvoiceSummariesSelector selector,
    InvoiceSummariesFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.ListInvoiceSummaries'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Selector': selector,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListInvoiceSummariesResponse.fromJson(jsonResponse.body);
  }

  /// This fetches a list of all invoice unit definitions for a given account,
  /// as of the provided <code>AsOf</code> date.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [asOf] :
  /// The state of an invoice unit at a specified time. You can see legacy
  /// invoice units that are currently deleted if the <code>AsOf</code> time is
  /// set to before it was deleted. If an <code>AsOf</code> is not provided, the
  /// default value is the current time.
  ///
  /// Parameter [filters] :
  /// An optional input to the list API. If multiple filters are specified, the
  /// returned list will be a configuration that match all of the provided
  /// filters. Supported filter types are <code>InvoiceReceivers</code>,
  /// <code>Names</code>, and <code>Accounts</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of invoice units that can be returned.
  ///
  /// Parameter [nextToken] :
  /// The next token used to indicate where the returned list should start from.
  Future<ListInvoiceUnitsResponse> listInvoiceUnits({
    DateTime? asOf,
    Filters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.ListInvoiceUnits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (asOf != null) 'AsOf': unixTimestampToJson(asOf),
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListInvoiceUnitsResponse.fromJson(jsonResponse.body);
  }

  /// <i> <b>This feature API is subject to changing at any time. For more
  /// information, see the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Betas and Previews).</b> </i>
  ///
  /// Retrieves a list of procurement portal preferences associated with the
  /// Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. To retrieve the
  /// remaining results, make another call with the returned NextToken value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. (You received this token from a
  /// previous call.)
  Future<ListProcurementPortalPreferencesResponse>
      listProcurementPortalPreferences({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.ListProcurementPortalPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListProcurementPortalPreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of tags to list.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// <i> <b>This feature API is subject to changing at any time. For more
  /// information, see the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Betas and Previews).</b> </i>
  ///
  /// Updates an existing procurement portal preference configuration. This
  /// operation can modify settings for e-invoice delivery and purchase order
  /// retrieval.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [contacts] :
  /// Updated list of contact information for portal administrators and
  /// technical contacts.
  ///
  /// Parameter [einvoiceDeliveryEnabled] :
  /// Updated flag indicating whether e-invoice delivery is enabled for this
  /// procurement portal preference.
  ///
  /// Parameter [procurementPortalPreferenceArn] :
  /// The Amazon Resource Name (ARN) of the procurement portal preference to
  /// update.
  ///
  /// Parameter [purchaseOrderRetrievalEnabled] :
  /// Updated flag indicating whether purchase order retrieval is enabled for
  /// this procurement portal preference.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of the request.
  ///
  /// Parameter [einvoiceDeliveryPreference] :
  /// Updated e-invoice delivery configuration including document types,
  /// attachment types, and customization settings for the portal.
  ///
  /// Parameter [procurementPortalInstanceEndpoint] :
  /// The updated endpoint URL where e-invoices will be delivered to the
  /// procurement portal. Must be a valid HTTPS URL.
  ///
  /// Parameter [procurementPortalSharedSecret] :
  /// The updated shared secret or authentication credential for the procurement
  /// portal. This value must be encrypted at rest.
  ///
  /// Parameter [testEnvPreference] :
  /// Updated configuration settings for the test environment of the procurement
  /// portal.
  Future<PutProcurementPortalPreferenceResponse>
      putProcurementPortalPreference({
    required List<Contact> contacts,
    required bool einvoiceDeliveryEnabled,
    required String procurementPortalPreferenceArn,
    required bool purchaseOrderRetrievalEnabled,
    String? clientToken,
    EinvoiceDeliveryPreference? einvoiceDeliveryPreference,
    String? procurementPortalInstanceEndpoint,
    String? procurementPortalSharedSecret,
    ProcurementPortalPreferenceSelector? selector,
    TestEnvPreferenceInput? testEnvPreference,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.PutProcurementPortalPreference'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Contacts': contacts,
        'EinvoiceDeliveryEnabled': einvoiceDeliveryEnabled,
        'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
        'PurchaseOrderRetrievalEnabled': purchaseOrderRetrievalEnabled,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (einvoiceDeliveryPreference != null)
          'EinvoiceDeliveryPreference': einvoiceDeliveryPreference,
        if (procurementPortalInstanceEndpoint != null)
          'ProcurementPortalInstanceEndpoint':
              procurementPortalInstanceEndpoint,
        if (procurementPortalSharedSecret != null)
          'ProcurementPortalSharedSecret': procurementPortalSharedSecret,
        if (selector != null) 'Selector': selector,
        if (testEnvPreference != null) 'TestEnvPreference': testEnvPreference,
      },
    );

    return PutProcurementPortalPreferenceResponse.fromJson(jsonResponse.body);
  }

  /// Adds a tag to a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the tags.
  ///
  /// Parameter [resourceTags] :
  /// Adds a tag to a resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<ResourceTag> resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourceTags': resourceTags,
      },
    );
  }

  /// Removes a tag from a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) to untag.
  ///
  /// Parameter [resourceTagKeys] :
  /// Keys for the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'ResourceTagKeys': resourceTagKeys,
      },
    );
  }

  /// You can update the invoice unit configuration at any time, and Amazon Web
  /// Services will use the latest configuration at the end of the month.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [invoiceUnitArn] :
  /// The ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of the request.
  ///
  /// Parameter [description] :
  /// The assigned description for an invoice unit. This information can't be
  /// modified or deleted.
  ///
  /// Parameter [rule] :
  /// The <code>InvoiceUnitRule</code> object used to update invoice units.
  ///
  /// Parameter [taxInheritanceDisabled] :
  /// Whether the invoice unit based tax inheritance is/ should be enabled or
  /// disabled.
  Future<UpdateInvoiceUnitResponse> updateInvoiceUnit({
    required String invoiceUnitArn,
    String? clientToken,
    String? description,
    InvoiceUnitRule? rule,
    bool? taxInheritanceDisabled,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.UpdateInvoiceUnit'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InvoiceUnitArn': invoiceUnitArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (rule != null) 'Rule': rule,
        if (taxInheritanceDisabled != null)
          'TaxInheritanceDisabled': taxInheritanceDisabled,
      },
    );

    return UpdateInvoiceUnitResponse.fromJson(jsonResponse.body);
  }

  /// <i> <b>This feature API is subject to changing at any time. For more
  /// information, see the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Betas and Previews).</b> </i>
  ///
  /// Updates the status of a procurement portal preference, including the
  /// activation state of e-invoice delivery and purchase order retrieval
  /// features.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [procurementPortalPreferenceArn] :
  /// The Amazon Resource Name (ARN) of the procurement portal preference to
  /// update.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of the request.
  ///
  /// Parameter [einvoiceDeliveryPreferenceStatus] :
  /// The updated status of the e-invoice delivery preference.
  ///
  /// Parameter [einvoiceDeliveryPreferenceStatusReason] :
  /// The reason for the e-invoice delivery preference status update, providing
  /// context for the change.
  ///
  /// Parameter [purchaseOrderRetrievalPreferenceStatus] :
  /// The updated status of the purchase order retrieval preference.
  ///
  /// Parameter [purchaseOrderRetrievalPreferenceStatusReason] :
  /// The reason for the purchase order retrieval preference status update,
  /// providing context for the change.
  Future<UpdateProcurementPortalPreferenceStatusResponse>
      updateProcurementPortalPreferenceStatus({
    required String procurementPortalPreferenceArn,
    String? clientToken,
    ProcurementPortalPreferenceStatus? einvoiceDeliveryPreferenceStatus,
    String? einvoiceDeliveryPreferenceStatusReason,
    ProcurementPortalPreferenceStatus? purchaseOrderRetrievalPreferenceStatus,
    String? purchaseOrderRetrievalPreferenceStatusReason,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'Invoicing.UpdateProcurementPortalPreferenceStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (einvoiceDeliveryPreferenceStatus != null)
          'EinvoiceDeliveryPreferenceStatus':
              einvoiceDeliveryPreferenceStatus.value,
        if (einvoiceDeliveryPreferenceStatusReason != null)
          'EinvoiceDeliveryPreferenceStatusReason':
              einvoiceDeliveryPreferenceStatusReason,
        if (purchaseOrderRetrievalPreferenceStatus != null)
          'PurchaseOrderRetrievalPreferenceStatus':
              purchaseOrderRetrievalPreferenceStatus.value,
        if (purchaseOrderRetrievalPreferenceStatusReason != null)
          'PurchaseOrderRetrievalPreferenceStatusReason':
              purchaseOrderRetrievalPreferenceStatusReason,
      },
    );

    return UpdateProcurementPortalPreferenceStatusResponse.fromJson(
        jsonResponse.body);
  }
}

/// @nodoc
class BatchGetInvoiceProfileResponse {
  /// A list of invoice profiles corresponding to the requested accounts.
  final List<InvoiceProfile>? profiles;

  BatchGetInvoiceProfileResponse({
    this.profiles,
  });

  factory BatchGetInvoiceProfileResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetInvoiceProfileResponse(
      profiles: (json['Profiles'] as List?)
          ?.nonNulls
          .map((e) => InvoiceProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final profiles = this.profiles;
    return {
      if (profiles != null) 'Profiles': profiles,
    };
  }
}

/// @nodoc
class CreateInvoiceUnitResponse {
  /// The ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  final String? invoiceUnitArn;

  CreateInvoiceUnitResponse({
    this.invoiceUnitArn,
  });

  factory CreateInvoiceUnitResponse.fromJson(Map<String, dynamic> json) {
    return CreateInvoiceUnitResponse(
      invoiceUnitArn: json['InvoiceUnitArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invoiceUnitArn = this.invoiceUnitArn;
    return {
      if (invoiceUnitArn != null) 'InvoiceUnitArn': invoiceUnitArn,
    };
  }
}

/// @nodoc
class CreateProcurementPortalPreferenceResponse {
  /// The Amazon Resource Name (ARN) of the created procurement portal preference.
  final String procurementPortalPreferenceArn;

  CreateProcurementPortalPreferenceResponse({
    required this.procurementPortalPreferenceArn,
  });

  factory CreateProcurementPortalPreferenceResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProcurementPortalPreferenceResponse(
      procurementPortalPreferenceArn:
          (json['ProcurementPortalPreferenceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final procurementPortalPreferenceArn = this.procurementPortalPreferenceArn;
    return {
      'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
    };
  }
}

/// @nodoc
class DeleteInvoiceUnitResponse {
  /// The ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  final String? invoiceUnitArn;

  DeleteInvoiceUnitResponse({
    this.invoiceUnitArn,
  });

  factory DeleteInvoiceUnitResponse.fromJson(Map<String, dynamic> json) {
    return DeleteInvoiceUnitResponse(
      invoiceUnitArn: json['InvoiceUnitArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invoiceUnitArn = this.invoiceUnitArn;
    return {
      if (invoiceUnitArn != null) 'InvoiceUnitArn': invoiceUnitArn,
    };
  }
}

/// @nodoc
class DeleteProcurementPortalPreferenceResponse {
  /// The Amazon Resource Name (ARN) of the deleted procurement portal preference.
  final String procurementPortalPreferenceArn;

  DeleteProcurementPortalPreferenceResponse({
    required this.procurementPortalPreferenceArn,
  });

  factory DeleteProcurementPortalPreferenceResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteProcurementPortalPreferenceResponse(
      procurementPortalPreferenceArn:
          (json['ProcurementPortalPreferenceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final procurementPortalPreferenceArn = this.procurementPortalPreferenceArn;
    return {
      'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
    };
  }
}

/// @nodoc
class GetInvoicePDFResponse {
  /// The invoice document and supplemental documents associated with the invoice.
  final InvoicePDF? invoicePDF;

  GetInvoicePDFResponse({
    this.invoicePDF,
  });

  factory GetInvoicePDFResponse.fromJson(Map<String, dynamic> json) {
    return GetInvoicePDFResponse(
      invoicePDF: json['InvoicePDF'] != null
          ? InvoicePDF.fromJson(json['InvoicePDF'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final invoicePDF = this.invoicePDF;
    return {
      if (invoicePDF != null) 'InvoicePDF': invoicePDF,
    };
  }
}

/// @nodoc
class GetInvoiceUnitResponse {
  /// The assigned description for an invoice unit.
  final String? description;

  /// The Amazon Web Services account ID chosen to be the receiver of an invoice
  /// unit. All invoices generated for that invoice unit will be sent to this
  /// account ID.
  final String? invoiceReceiver;

  /// The ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  final String? invoiceUnitArn;

  /// The most recent date the invoice unit response was updated.
  final DateTime? lastModified;

  /// The unique name of the invoice unit that is shown on the generated invoice.
  final String? name;
  final InvoiceUnitRule? rule;

  /// Whether the invoice unit based tax inheritance is/ should be enabled or
  /// disabled.
  final bool? taxInheritanceDisabled;

  GetInvoiceUnitResponse({
    this.description,
    this.invoiceReceiver,
    this.invoiceUnitArn,
    this.lastModified,
    this.name,
    this.rule,
    this.taxInheritanceDisabled,
  });

  factory GetInvoiceUnitResponse.fromJson(Map<String, dynamic> json) {
    return GetInvoiceUnitResponse(
      description: json['Description'] as String?,
      invoiceReceiver: json['InvoiceReceiver'] as String?,
      invoiceUnitArn: json['InvoiceUnitArn'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      name: json['Name'] as String?,
      rule: json['Rule'] != null
          ? InvoiceUnitRule.fromJson(json['Rule'] as Map<String, dynamic>)
          : null,
      taxInheritanceDisabled: json['TaxInheritanceDisabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final invoiceReceiver = this.invoiceReceiver;
    final invoiceUnitArn = this.invoiceUnitArn;
    final lastModified = this.lastModified;
    final name = this.name;
    final rule = this.rule;
    final taxInheritanceDisabled = this.taxInheritanceDisabled;
    return {
      if (description != null) 'Description': description,
      if (invoiceReceiver != null) 'InvoiceReceiver': invoiceReceiver,
      if (invoiceUnitArn != null) 'InvoiceUnitArn': invoiceUnitArn,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (name != null) 'Name': name,
      if (rule != null) 'Rule': rule,
      if (taxInheritanceDisabled != null)
        'TaxInheritanceDisabled': taxInheritanceDisabled,
    };
  }
}

/// @nodoc
class GetProcurementPortalPreferenceResponse {
  /// The detailed configuration of the requested procurement portal preference.
  final ProcurementPortalPreference procurementPortalPreference;

  GetProcurementPortalPreferenceResponse({
    required this.procurementPortalPreference,
  });

  factory GetProcurementPortalPreferenceResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProcurementPortalPreferenceResponse(
      procurementPortalPreference: ProcurementPortalPreference.fromJson(
          (json['ProcurementPortalPreference'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final procurementPortalPreference = this.procurementPortalPreference;
    return {
      'ProcurementPortalPreference': procurementPortalPreference,
    };
  }
}

/// @nodoc
class ListInvoiceSummariesResponse {
  /// List of key (summary level) invoice details without line item details.
  final List<InvoiceSummary> invoiceSummaries;

  /// The token to use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  ListInvoiceSummariesResponse({
    required this.invoiceSummaries,
    this.nextToken,
  });

  factory ListInvoiceSummariesResponse.fromJson(Map<String, dynamic> json) {
    return ListInvoiceSummariesResponse(
      invoiceSummaries: ((json['InvoiceSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => InvoiceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invoiceSummaries = this.invoiceSummaries;
    final nextToken = this.nextToken;
    return {
      'InvoiceSummaries': invoiceSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListInvoiceUnitsResponse {
  /// An invoice unit is a set of mutually exclusive accounts that correspond to
  /// your business entity.
  final List<InvoiceUnit>? invoiceUnits;

  /// The next token used to indicate where the returned list should start from.
  final String? nextToken;

  ListInvoiceUnitsResponse({
    this.invoiceUnits,
    this.nextToken,
  });

  factory ListInvoiceUnitsResponse.fromJson(Map<String, dynamic> json) {
    return ListInvoiceUnitsResponse(
      invoiceUnits: (json['InvoiceUnits'] as List?)
          ?.nonNulls
          .map((e) => InvoiceUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invoiceUnits = this.invoiceUnits;
    final nextToken = this.nextToken;
    return {
      if (invoiceUnits != null) 'InvoiceUnits': invoiceUnits,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListProcurementPortalPreferencesResponse {
  /// The token to use to retrieve the next set of results, or null if there are
  /// no more results.
  final String? nextToken;

  /// The list of procurement portal preferences associated with the Amazon Web
  /// Services account.
  final List<ProcurementPortalPreferenceSummary>? procurementPortalPreferences;

  ListProcurementPortalPreferencesResponse({
    this.nextToken,
    this.procurementPortalPreferences,
  });

  factory ListProcurementPortalPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProcurementPortalPreferencesResponse(
      nextToken: json['NextToken'] as String?,
      procurementPortalPreferences:
          (json['ProcurementPortalPreferences'] as List?)
              ?.nonNulls
              .map((e) => ProcurementPortalPreferenceSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final procurementPortalPreferences = this.procurementPortalPreferences;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (procurementPortalPreferences != null)
        'ProcurementPortalPreferences': procurementPortalPreferences,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Adds a tag to a resource.
  final List<ResourceTag>? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: (json['ResourceTags'] as List?)
          ?.nonNulls
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTags = this.resourceTags;
    return {
      if (resourceTags != null) 'ResourceTags': resourceTags,
    };
  }
}

/// @nodoc
class PutProcurementPortalPreferenceResponse {
  /// The Amazon Resource Name (ARN) of the updated procurement portal preference.
  final String procurementPortalPreferenceArn;

  PutProcurementPortalPreferenceResponse({
    required this.procurementPortalPreferenceArn,
  });

  factory PutProcurementPortalPreferenceResponse.fromJson(
      Map<String, dynamic> json) {
    return PutProcurementPortalPreferenceResponse(
      procurementPortalPreferenceArn:
          (json['ProcurementPortalPreferenceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final procurementPortalPreferenceArn = this.procurementPortalPreferenceArn;
    return {
      'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateInvoiceUnitResponse {
  /// The ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  final String? invoiceUnitArn;

  UpdateInvoiceUnitResponse({
    this.invoiceUnitArn,
  });

  factory UpdateInvoiceUnitResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInvoiceUnitResponse(
      invoiceUnitArn: json['InvoiceUnitArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invoiceUnitArn = this.invoiceUnitArn;
    return {
      if (invoiceUnitArn != null) 'InvoiceUnitArn': invoiceUnitArn,
    };
  }
}

/// @nodoc
class UpdateProcurementPortalPreferenceStatusResponse {
  /// The Amazon Resource Name (ARN) of the procurement portal preference with
  /// updated status.
  final String procurementPortalPreferenceArn;

  UpdateProcurementPortalPreferenceStatusResponse({
    required this.procurementPortalPreferenceArn,
  });

  factory UpdateProcurementPortalPreferenceStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateProcurementPortalPreferenceStatusResponse(
      procurementPortalPreferenceArn:
          (json['ProcurementPortalPreferenceArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final procurementPortalPreferenceArn = this.procurementPortalPreferenceArn;
    return {
      'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
    };
  }
}

/// @nodoc
class ProcurementPortalPreferenceStatus {
  static const pendingVerification =
      ProcurementPortalPreferenceStatus._('PENDING_VERIFICATION');
  static const testInitialized =
      ProcurementPortalPreferenceStatus._('TEST_INITIALIZED');
  static const testInitializationFailed =
      ProcurementPortalPreferenceStatus._('TEST_INITIALIZATION_FAILED');
  static const testFailed = ProcurementPortalPreferenceStatus._('TEST_FAILED');
  static const active = ProcurementPortalPreferenceStatus._('ACTIVE');
  static const suspended = ProcurementPortalPreferenceStatus._('SUSPENDED');

  final String value;

  const ProcurementPortalPreferenceStatus._(this.value);

  static const values = [
    pendingVerification,
    testInitialized,
    testInitializationFailed,
    testFailed,
    active,
    suspended
  ];

  static ProcurementPortalPreferenceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProcurementPortalPreferenceStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProcurementPortalPreferenceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is used to categorize the invoice unit. Values are Amazon Web Services
/// account IDs. Currently, the only supported rule is
/// <code>LINKED_ACCOUNT</code>.
///
/// @nodoc
class InvoiceUnitRule {
  /// A list of Amazon Web Services account IDs that have delegated their billing
  /// responsibility to the receiver account through transfer billing. Unlike
  /// linked accounts, these bill source accounts can be payer accounts from other
  /// organizations that have authorized billing transfer to this account.
  final List<String>? billSourceAccounts;

  /// The list of <code>LINKED_ACCOUNT</code> IDs where charges are included
  /// within the invoice unit.
  final List<String>? linkedAccounts;

  InvoiceUnitRule({
    this.billSourceAccounts,
    this.linkedAccounts,
  });

  factory InvoiceUnitRule.fromJson(Map<String, dynamic> json) {
    return InvoiceUnitRule(
      billSourceAccounts: (json['BillSourceAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      linkedAccounts: (json['LinkedAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final billSourceAccounts = this.billSourceAccounts;
    final linkedAccounts = this.linkedAccounts;
    return {
      if (billSourceAccounts != null) 'BillSourceAccounts': billSourceAccounts,
      if (linkedAccounts != null) 'LinkedAccounts': linkedAccounts,
    };
  }
}

/// The tag structure that contains a tag key and value.
///
/// @nodoc
class ResourceTag {
  /// The object key of your of your resource tag.
  final String key;

  /// The specific value of the resource tag.
  final String value;

  ResourceTag({
    required this.key,
    required this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// Specifies criteria for selecting which invoices should be processed using a
/// particular procurement portal preference.
///
/// @nodoc
class ProcurementPortalPreferenceSelector {
  /// The Amazon Resource Name (ARN) of invoice unit identifiers to which this
  /// preference applies.
  final List<String>? invoiceUnitArns;

  /// The list of seller of record IDs to which this preference applies.
  final List<String>? sellerOfRecords;

  ProcurementPortalPreferenceSelector({
    this.invoiceUnitArns,
    this.sellerOfRecords,
  });

  factory ProcurementPortalPreferenceSelector.fromJson(
      Map<String, dynamic> json) {
    return ProcurementPortalPreferenceSelector(
      invoiceUnitArns: (json['InvoiceUnitArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sellerOfRecords: (json['SellerOfRecords'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invoiceUnitArns = this.invoiceUnitArns;
    final sellerOfRecords = this.sellerOfRecords;
    return {
      if (invoiceUnitArns != null) 'InvoiceUnitArns': invoiceUnitArns,
      if (sellerOfRecords != null) 'SellerOfRecords': sellerOfRecords,
    };
  }
}

/// Input parameters for configuring test environment preferences for a
/// procurement portal.
///
/// @nodoc
class TestEnvPreferenceInput {
  /// The domain identifier to use for the buyer in the test environment.
  final BuyerDomain buyerDomain;

  /// The unique identifier to use for the buyer in the test environment.
  final String buyerIdentifier;

  /// The domain identifier to use for the supplier in the test environment.
  final SupplierDomain supplierDomain;

  /// The unique identifier to use for the supplier in the test environment.
  final String supplierIdentifier;

  /// The endpoint URL where e-invoices will be delivered in the test environment.
  final String? procurementPortalInstanceEndpoint;

  /// The shared secret or authentication credential to use for secure
  /// communication in the test environment.
  final String? procurementPortalSharedSecret;

  TestEnvPreferenceInput({
    required this.buyerDomain,
    required this.buyerIdentifier,
    required this.supplierDomain,
    required this.supplierIdentifier,
    this.procurementPortalInstanceEndpoint,
    this.procurementPortalSharedSecret,
  });

  Map<String, dynamic> toJson() {
    final buyerDomain = this.buyerDomain;
    final buyerIdentifier = this.buyerIdentifier;
    final supplierDomain = this.supplierDomain;
    final supplierIdentifier = this.supplierIdentifier;
    final procurementPortalInstanceEndpoint =
        this.procurementPortalInstanceEndpoint;
    final procurementPortalSharedSecret = this.procurementPortalSharedSecret;
    return {
      'BuyerDomain': buyerDomain.value,
      'BuyerIdentifier': buyerIdentifier,
      'SupplierDomain': supplierDomain.value,
      'SupplierIdentifier': supplierIdentifier,
      if (procurementPortalInstanceEndpoint != null)
        'ProcurementPortalInstanceEndpoint': procurementPortalInstanceEndpoint,
      if (procurementPortalSharedSecret != null)
        'ProcurementPortalSharedSecret': procurementPortalSharedSecret,
    };
  }
}

/// Specifies the preferences for e-invoice delivery, including document types,
/// attachment types, and customization settings.
///
/// @nodoc
class EinvoiceDeliveryPreference {
  /// The method to use for testing the connection to the procurement portal.
  final ConnectionTestingMethod connectionTestingMethod;

  /// The date when e-invoice delivery should be activated for this preference.
  final DateTime einvoiceDeliveryActivationDate;

  /// The types of e-invoice documents to be delivered.
  final List<EinvoiceDeliveryDocumentType> einvoiceDeliveryDocumentTypes;

  /// The communication protocol to use for e-invoice delivery.
  final Protocol protocol;

  /// The sources of purchase order data to use for e-invoice generation and
  /// delivery.
  final List<PurchaseOrderDataSource> purchaseOrderDataSources;

  /// The types of attachments to include with the e-invoice delivery.
  final List<EinvoiceDeliveryAttachmentType>? einvoiceDeliveryAttachmentTypes;

  EinvoiceDeliveryPreference({
    required this.connectionTestingMethod,
    required this.einvoiceDeliveryActivationDate,
    required this.einvoiceDeliveryDocumentTypes,
    required this.protocol,
    required this.purchaseOrderDataSources,
    this.einvoiceDeliveryAttachmentTypes,
  });

  factory EinvoiceDeliveryPreference.fromJson(Map<String, dynamic> json) {
    return EinvoiceDeliveryPreference(
      connectionTestingMethod: ConnectionTestingMethod.fromString(
          (json['ConnectionTestingMethod'] as String?) ?? ''),
      einvoiceDeliveryActivationDate: nonNullableTimeStampFromJson(
          json['EinvoiceDeliveryActivationDate'] ?? 0),
      einvoiceDeliveryDocumentTypes: ((json['EinvoiceDeliveryDocumentTypes']
                  as List?) ??
              const [])
          .nonNulls
          .map((e) => EinvoiceDeliveryDocumentType.fromString((e as String)))
          .toList(),
      protocol: Protocol.fromString((json['Protocol'] as String?) ?? ''),
      purchaseOrderDataSources:
          ((json['PurchaseOrderDataSources'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  PurchaseOrderDataSource.fromJson(e as Map<String, dynamic>))
              .toList(),
      einvoiceDeliveryAttachmentTypes: (json['EinvoiceDeliveryAttachmentTypes']
              as List?)
          ?.nonNulls
          .map((e) => EinvoiceDeliveryAttachmentType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionTestingMethod = this.connectionTestingMethod;
    final einvoiceDeliveryActivationDate = this.einvoiceDeliveryActivationDate;
    final einvoiceDeliveryDocumentTypes = this.einvoiceDeliveryDocumentTypes;
    final protocol = this.protocol;
    final purchaseOrderDataSources = this.purchaseOrderDataSources;
    final einvoiceDeliveryAttachmentTypes =
        this.einvoiceDeliveryAttachmentTypes;
    return {
      'ConnectionTestingMethod': connectionTestingMethod.value,
      'EinvoiceDeliveryActivationDate':
          unixTimestampToJson(einvoiceDeliveryActivationDate),
      'EinvoiceDeliveryDocumentTypes':
          einvoiceDeliveryDocumentTypes.map((e) => e.value).toList(),
      'Protocol': protocol.value,
      'PurchaseOrderDataSources': purchaseOrderDataSources,
      if (einvoiceDeliveryAttachmentTypes != null)
        'EinvoiceDeliveryAttachmentTypes':
            einvoiceDeliveryAttachmentTypes.map((e) => e.value).toList(),
    };
  }
}

/// Represents contact information for a person or role associated with the
/// procurement portal preference.
///
/// @nodoc
class Contact {
  /// The email address of the contact person or role.
  final String? email;

  /// The name of the contact person or role.
  final String? name;

  Contact({
    this.email,
    this.name,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['Email'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final email = this.email;
    final name = this.name;
    return {
      if (email != null) 'Email': email,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class Protocol {
  static const cxml = Protocol._('CXML');

  final String value;

  const Protocol._(this.value);

  static const values = [cxml];

  static Protocol fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Protocol._(value));

  @override
  bool operator ==(other) => other is Protocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConnectionTestingMethod {
  static const prodEnvDollarTest =
      ConnectionTestingMethod._('PROD_ENV_DOLLAR_TEST');
  static const testEnvReplayTest =
      ConnectionTestingMethod._('TEST_ENV_REPLAY_TEST');

  final String value;

  const ConnectionTestingMethod._(this.value);

  static const values = [prodEnvDollarTest, testEnvReplayTest];

  static ConnectionTestingMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectionTestingMethod._(value));

  @override
  bool operator ==(other) =>
      other is ConnectionTestingMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the source configuration for retrieving purchase order data.
///
/// @nodoc
class PurchaseOrderDataSource {
  /// The type of e-invoice document that requires purchase order data.
  final EinvoiceDeliveryDocumentType? einvoiceDeliveryDocumentType;

  /// The type of source for purchase order data.
  final PurchaseOrderDataSourceType? purchaseOrderDataSourceType;

  PurchaseOrderDataSource({
    this.einvoiceDeliveryDocumentType,
    this.purchaseOrderDataSourceType,
  });

  factory PurchaseOrderDataSource.fromJson(Map<String, dynamic> json) {
    return PurchaseOrderDataSource(
      einvoiceDeliveryDocumentType:
          (json['EinvoiceDeliveryDocumentType'] as String?)
              ?.let(EinvoiceDeliveryDocumentType.fromString),
      purchaseOrderDataSourceType:
          (json['PurchaseOrderDataSourceType'] as String?)
              ?.let(PurchaseOrderDataSourceType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final einvoiceDeliveryDocumentType = this.einvoiceDeliveryDocumentType;
    final purchaseOrderDataSourceType = this.purchaseOrderDataSourceType;
    return {
      if (einvoiceDeliveryDocumentType != null)
        'EinvoiceDeliveryDocumentType': einvoiceDeliveryDocumentType.value,
      if (purchaseOrderDataSourceType != null)
        'PurchaseOrderDataSourceType': purchaseOrderDataSourceType.value,
    };
  }
}

/// @nodoc
class EinvoiceDeliveryDocumentType {
  static const awsCloudInvoice =
      EinvoiceDeliveryDocumentType._('AWS_CLOUD_INVOICE');
  static const awsCloudCreditMemo =
      EinvoiceDeliveryDocumentType._('AWS_CLOUD_CREDIT_MEMO');
  static const awsMarketplaceInvoice =
      EinvoiceDeliveryDocumentType._('AWS_MARKETPLACE_INVOICE');
  static const awsMarketplaceCreditMemo =
      EinvoiceDeliveryDocumentType._('AWS_MARKETPLACE_CREDIT_MEMO');
  static const awsRequestForPayment =
      EinvoiceDeliveryDocumentType._('AWS_REQUEST_FOR_PAYMENT');

  final String value;

  const EinvoiceDeliveryDocumentType._(this.value);

  static const values = [
    awsCloudInvoice,
    awsCloudCreditMemo,
    awsMarketplaceInvoice,
    awsMarketplaceCreditMemo,
    awsRequestForPayment
  ];

  static EinvoiceDeliveryDocumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EinvoiceDeliveryDocumentType._(value));

  @override
  bool operator ==(other) =>
      other is EinvoiceDeliveryDocumentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PurchaseOrderDataSourceType {
  static const associatedPurchaseOrderRequired =
      PurchaseOrderDataSourceType._('ASSOCIATED_PURCHASE_ORDER_REQUIRED');
  static const purchaseOrderNotRequired =
      PurchaseOrderDataSourceType._('PURCHASE_ORDER_NOT_REQUIRED');

  final String value;

  const PurchaseOrderDataSourceType._(this.value);

  static const values = [
    associatedPurchaseOrderRequired,
    purchaseOrderNotRequired
  ];

  static PurchaseOrderDataSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PurchaseOrderDataSourceType._(value));

  @override
  bool operator ==(other) =>
      other is PurchaseOrderDataSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EinvoiceDeliveryAttachmentType {
  static const invoicePdf = EinvoiceDeliveryAttachmentType._('INVOICE_PDF');
  static const rfpPdf = EinvoiceDeliveryAttachmentType._('RFP_PDF');

  final String value;

  const EinvoiceDeliveryAttachmentType._(this.value);

  static const values = [invoicePdf, rfpPdf];

  static EinvoiceDeliveryAttachmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EinvoiceDeliveryAttachmentType._(value));

  @override
  bool operator ==(other) =>
      other is EinvoiceDeliveryAttachmentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BuyerDomain {
  static const networkID = BuyerDomain._('NetworkID');

  final String value;

  const BuyerDomain._(this.value);

  static const values = [networkID];

  static BuyerDomain fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BuyerDomain._(value));

  @override
  bool operator ==(other) => other is BuyerDomain && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SupplierDomain {
  static const networkID = SupplierDomain._('NetworkID');

  final String value;

  const SupplierDomain._(this.value);

  static const values = [networkID];

  static SupplierDomain fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupplierDomain._(value));

  @override
  bool operator ==(other) => other is SupplierDomain && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides a summary of a procurement portal preference, including key
/// identifiers and status information.
///
/// @nodoc
class ProcurementPortalPreferenceSummary {
  /// The Amazon Web Services account ID associated with this procurement portal
  /// preference summary.
  final String awsAccountId;

  /// The domain identifier for the buyer in the procurement portal.
  final BuyerDomain buyerDomain;

  /// The unique identifier for the buyer in the procurement portal.
  final String buyerIdentifier;

  /// The date and time when the procurement portal preference was created.
  final DateTime createDate;

  /// Indicates whether e-invoice delivery is enabled for this procurement portal
  /// preference.
  final bool einvoiceDeliveryEnabled;

  /// The date and time when the procurement portal preference was last updated.
  final DateTime lastUpdateDate;

  /// The name of the procurement portal.
  final ProcurementPortalName procurementPortalName;

  /// The Amazon Resource Name (ARN) of the procurement portal preference.
  final String procurementPortalPreferenceArn;

  /// Indicates whether purchase order retrieval is enabled for this procurement
  /// portal preference.
  final bool purchaseOrderRetrievalEnabled;

  /// The domain identifier for the supplier in the procurement portal.
  final SupplierDomain supplierDomain;

  /// The unique identifier for the supplier in the procurement portal.
  final String supplierIdentifier;

  /// The version number of the procurement portal preference configuration in
  /// this summary.
  final int version;

  /// The current status of the e-invoice delivery preference in this summary.
  final ProcurementPortalPreferenceStatus? einvoiceDeliveryPreferenceStatus;

  /// The reason for the current e-invoice delivery preference status in this
  /// summary.
  final String? einvoiceDeliveryPreferenceStatusReason;

  /// The current status of the purchase order retrieval preference in this
  /// summary.
  final ProcurementPortalPreferenceStatus?
      purchaseOrderRetrievalPreferenceStatus;

  /// The reason for the current purchase order retrieval preference status in
  /// this summary.
  final String? purchaseOrderRetrievalPreferenceStatusReason;
  final ProcurementPortalPreferenceSelector? selector;

  ProcurementPortalPreferenceSummary({
    required this.awsAccountId,
    required this.buyerDomain,
    required this.buyerIdentifier,
    required this.createDate,
    required this.einvoiceDeliveryEnabled,
    required this.lastUpdateDate,
    required this.procurementPortalName,
    required this.procurementPortalPreferenceArn,
    required this.purchaseOrderRetrievalEnabled,
    required this.supplierDomain,
    required this.supplierIdentifier,
    required this.version,
    this.einvoiceDeliveryPreferenceStatus,
    this.einvoiceDeliveryPreferenceStatusReason,
    this.purchaseOrderRetrievalPreferenceStatus,
    this.purchaseOrderRetrievalPreferenceStatusReason,
    this.selector,
  });

  factory ProcurementPortalPreferenceSummary.fromJson(
      Map<String, dynamic> json) {
    return ProcurementPortalPreferenceSummary(
      awsAccountId: (json['AwsAccountId'] as String?) ?? '',
      buyerDomain:
          BuyerDomain.fromString((json['BuyerDomain'] as String?) ?? ''),
      buyerIdentifier: (json['BuyerIdentifier'] as String?) ?? '',
      createDate: nonNullableTimeStampFromJson(json['CreateDate'] ?? 0),
      einvoiceDeliveryEnabled:
          (json['EinvoiceDeliveryEnabled'] as bool?) ?? false,
      lastUpdateDate: nonNullableTimeStampFromJson(json['LastUpdateDate'] ?? 0),
      procurementPortalName: ProcurementPortalName.fromString(
          (json['ProcurementPortalName'] as String?) ?? ''),
      procurementPortalPreferenceArn:
          (json['ProcurementPortalPreferenceArn'] as String?) ?? '',
      purchaseOrderRetrievalEnabled:
          (json['PurchaseOrderRetrievalEnabled'] as bool?) ?? false,
      supplierDomain:
          SupplierDomain.fromString((json['SupplierDomain'] as String?) ?? ''),
      supplierIdentifier: (json['SupplierIdentifier'] as String?) ?? '',
      version: (json['Version'] as int?) ?? 0,
      einvoiceDeliveryPreferenceStatus:
          (json['EinvoiceDeliveryPreferenceStatus'] as String?)
              ?.let(ProcurementPortalPreferenceStatus.fromString),
      einvoiceDeliveryPreferenceStatusReason:
          json['EinvoiceDeliveryPreferenceStatusReason'] as String?,
      purchaseOrderRetrievalPreferenceStatus:
          (json['PurchaseOrderRetrievalPreferenceStatus'] as String?)
              ?.let(ProcurementPortalPreferenceStatus.fromString),
      purchaseOrderRetrievalPreferenceStatusReason:
          json['PurchaseOrderRetrievalPreferenceStatusReason'] as String?,
      selector: json['Selector'] != null
          ? ProcurementPortalPreferenceSelector.fromJson(
              json['Selector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final buyerDomain = this.buyerDomain;
    final buyerIdentifier = this.buyerIdentifier;
    final createDate = this.createDate;
    final einvoiceDeliveryEnabled = this.einvoiceDeliveryEnabled;
    final lastUpdateDate = this.lastUpdateDate;
    final procurementPortalName = this.procurementPortalName;
    final procurementPortalPreferenceArn = this.procurementPortalPreferenceArn;
    final purchaseOrderRetrievalEnabled = this.purchaseOrderRetrievalEnabled;
    final supplierDomain = this.supplierDomain;
    final supplierIdentifier = this.supplierIdentifier;
    final version = this.version;
    final einvoiceDeliveryPreferenceStatus =
        this.einvoiceDeliveryPreferenceStatus;
    final einvoiceDeliveryPreferenceStatusReason =
        this.einvoiceDeliveryPreferenceStatusReason;
    final purchaseOrderRetrievalPreferenceStatus =
        this.purchaseOrderRetrievalPreferenceStatus;
    final purchaseOrderRetrievalPreferenceStatusReason =
        this.purchaseOrderRetrievalPreferenceStatusReason;
    final selector = this.selector;
    return {
      'AwsAccountId': awsAccountId,
      'BuyerDomain': buyerDomain.value,
      'BuyerIdentifier': buyerIdentifier,
      'CreateDate': unixTimestampToJson(createDate),
      'EinvoiceDeliveryEnabled': einvoiceDeliveryEnabled,
      'LastUpdateDate': unixTimestampToJson(lastUpdateDate),
      'ProcurementPortalName': procurementPortalName.value,
      'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
      'PurchaseOrderRetrievalEnabled': purchaseOrderRetrievalEnabled,
      'SupplierDomain': supplierDomain.value,
      'SupplierIdentifier': supplierIdentifier,
      'Version': version,
      if (einvoiceDeliveryPreferenceStatus != null)
        'EinvoiceDeliveryPreferenceStatus':
            einvoiceDeliveryPreferenceStatus.value,
      if (einvoiceDeliveryPreferenceStatusReason != null)
        'EinvoiceDeliveryPreferenceStatusReason':
            einvoiceDeliveryPreferenceStatusReason,
      if (purchaseOrderRetrievalPreferenceStatus != null)
        'PurchaseOrderRetrievalPreferenceStatus':
            purchaseOrderRetrievalPreferenceStatus.value,
      if (purchaseOrderRetrievalPreferenceStatusReason != null)
        'PurchaseOrderRetrievalPreferenceStatusReason':
            purchaseOrderRetrievalPreferenceStatusReason,
      if (selector != null) 'Selector': selector,
    };
  }
}

/// @nodoc
class ProcurementPortalName {
  static const sapBusinessNetwork =
      ProcurementPortalName._('SAP_BUSINESS_NETWORK');
  static const coupa = ProcurementPortalName._('COUPA');

  final String value;

  const ProcurementPortalName._(this.value);

  static const values = [sapBusinessNetwork, coupa];

  static ProcurementPortalName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProcurementPortalName._(value));

  @override
  bool operator ==(other) =>
      other is ProcurementPortalName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An invoice unit is a set of mutually exclusive accounts that correspond to
/// your business entity. Invoice units allow you separate Amazon Web Services
/// account costs and configures your invoice for each business entity going
/// forward.
///
/// @nodoc
class InvoiceUnit {
  /// The assigned description for an invoice unit. This information can't be
  /// modified or deleted.
  final String? description;

  /// The account that receives invoices related to the invoice unit.
  final String? invoiceReceiver;

  /// ARN to identify an invoice unit. This information can't be modified or
  /// deleted.
  final String? invoiceUnitArn;

  /// The last time the invoice unit was updated. This is important to determine
  /// the version of invoice unit configuration used to create the invoices. Any
  /// invoice created after this modified time will use this invoice unit
  /// configuration.
  final DateTime? lastModified;

  /// A unique name that is distinctive within your Amazon Web Services.
  final String? name;

  /// An <code>InvoiceUnitRule</code> object used the categorize invoice units.
  final InvoiceUnitRule? rule;

  /// Whether the invoice unit based tax inheritance is/ should be enabled or
  /// disabled.
  final bool? taxInheritanceDisabled;

  InvoiceUnit({
    this.description,
    this.invoiceReceiver,
    this.invoiceUnitArn,
    this.lastModified,
    this.name,
    this.rule,
    this.taxInheritanceDisabled,
  });

  factory InvoiceUnit.fromJson(Map<String, dynamic> json) {
    return InvoiceUnit(
      description: json['Description'] as String?,
      invoiceReceiver: json['InvoiceReceiver'] as String?,
      invoiceUnitArn: json['InvoiceUnitArn'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      name: json['Name'] as String?,
      rule: json['Rule'] != null
          ? InvoiceUnitRule.fromJson(json['Rule'] as Map<String, dynamic>)
          : null,
      taxInheritanceDisabled: json['TaxInheritanceDisabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final invoiceReceiver = this.invoiceReceiver;
    final invoiceUnitArn = this.invoiceUnitArn;
    final lastModified = this.lastModified;
    final name = this.name;
    final rule = this.rule;
    final taxInheritanceDisabled = this.taxInheritanceDisabled;
    return {
      if (description != null) 'Description': description,
      if (invoiceReceiver != null) 'InvoiceReceiver': invoiceReceiver,
      if (invoiceUnitArn != null) 'InvoiceUnitArn': invoiceUnitArn,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (name != null) 'Name': name,
      if (rule != null) 'Rule': rule,
      if (taxInheritanceDisabled != null)
        'TaxInheritanceDisabled': taxInheritanceDisabled,
    };
  }
}

/// An optional input to the list API. If multiple filters are specified, the
/// returned list will be a configuration that match all of the provided
/// filters. Supported filter types are <code>InvoiceReceivers</code>,
/// <code>Names</code>, and <code>Accounts</code>.
///
/// @nodoc
class Filters {
  /// You can specify a list of Amazon Web Services account IDs inside filters to
  /// return invoice units that match only the specified accounts. If multiple
  /// accounts are provided, the result is an <code>OR</code> condition (match
  /// any) of the specified accounts. The specified account IDs are matched with
  /// either the receiver or the linked accounts in the rules.
  final List<String>? accounts;

  /// A list of Amazon Web Services account IDs used to filter invoice units.
  /// These are payer accounts from other Organizations that have delegated their
  /// billing responsibility to the receiver account through the billing transfer
  /// feature.
  final List<String>? billSourceAccounts;

  /// You can specify a list of Amazon Web Services account IDs inside filters to
  /// return invoice units that match only the specified accounts. If multiple
  /// accounts are provided, the result is an <code>OR</code> condition (match
  /// any) of the specified accounts. This filter only matches the specified
  /// accounts on the invoice receivers of the invoice units.
  final List<String>? invoiceReceivers;

  /// An optional input to the list API. You can specify a list of invoice unit
  /// names inside filters to return invoice units that match only the specified
  /// invoice unit names. If multiple names are provided, the result is an
  /// <code>OR</code> condition (match any) of the specified invoice unit names.
  final List<String>? names;

  Filters({
    this.accounts,
    this.billSourceAccounts,
    this.invoiceReceivers,
    this.names,
  });

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final billSourceAccounts = this.billSourceAccounts;
    final invoiceReceivers = this.invoiceReceivers;
    final names = this.names;
    return {
      if (accounts != null) 'Accounts': accounts,
      if (billSourceAccounts != null) 'BillSourceAccounts': billSourceAccounts,
      if (invoiceReceivers != null) 'InvoiceReceivers': invoiceReceivers,
      if (names != null) 'Names': names,
    };
  }
}

/// The invoice that the API retrieved.
///
/// @nodoc
class InvoiceSummary {
  /// The Amazon Web Services account ID.
  final String? accountId;

  /// The summary with the product and service currency.
  final InvoiceCurrencyAmount? baseCurrencyAmount;

  /// The list of Amazon Web Services account IDs that are the bill source of the
  /// invoice. Currently, only a single bill source account is returned.
  final List<String>? billSourceAccounts;

  /// The total number of accounts that are the bill source of the invoice.
  final int? billSourceAccountsTotalCount;

  /// The type of the bill.
  final BillType? billType;

  /// The billing period of the invoice-related document.
  final BillingPeriod? billingPeriod;

  /// The commercial invoice ID. This is only applicable for tax invoices and
  /// identifies the associated commercial invoice.
  final String? commercialInvoiceId;

  /// The invoice due date.
  final DateTime? dueDate;

  /// The e-invoice delivery status.
  final EinvoiceDeliveryStatus? einvoiceDeliveryStatus;

  /// The organization name providing Amazon Web Services services.
  final Entity? entity;

  /// The frequency of the invoice.
  final InvoiceFrequency? invoiceFrequency;

  /// The invoice ID.
  final String? invoiceId;

  /// The type of invoice.
  final InvoiceType? invoiceType;

  /// The issued date of the invoice.
  final DateTime? issuedDate;

  /// The initial or original invoice ID.
  final String? originalInvoiceId;

  /// The summary with the customer configured currency.
  final InvoiceCurrencyAmount? paymentCurrencyAmount;

  /// The purchase order number associated to the invoice.
  final String? purchaseOrderNumber;

  /// The role of the invoice receiver.
  final ReceiverRole? receiverRole;

  /// The current status of an invoice as reported to the tax authority. This
  /// captures scenarios where an invoice may be cancelled after issuance.
  final TaxAuthorityStatus? taxAuthorityStatus;

  /// The summary with the tax currency.
  final InvoiceCurrencyAmount? taxCurrencyAmount;

  InvoiceSummary({
    this.accountId,
    this.baseCurrencyAmount,
    this.billSourceAccounts,
    this.billSourceAccountsTotalCount,
    this.billType,
    this.billingPeriod,
    this.commercialInvoiceId,
    this.dueDate,
    this.einvoiceDeliveryStatus,
    this.entity,
    this.invoiceFrequency,
    this.invoiceId,
    this.invoiceType,
    this.issuedDate,
    this.originalInvoiceId,
    this.paymentCurrencyAmount,
    this.purchaseOrderNumber,
    this.receiverRole,
    this.taxAuthorityStatus,
    this.taxCurrencyAmount,
  });

  factory InvoiceSummary.fromJson(Map<String, dynamic> json) {
    return InvoiceSummary(
      accountId: json['AccountId'] as String?,
      baseCurrencyAmount: json['BaseCurrencyAmount'] != null
          ? InvoiceCurrencyAmount.fromJson(
              json['BaseCurrencyAmount'] as Map<String, dynamic>)
          : null,
      billSourceAccounts: (json['BillSourceAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      billSourceAccountsTotalCount:
          json['BillSourceAccountsTotalCount'] as int?,
      billType: (json['BillType'] as String?)?.let(BillType.fromString),
      billingPeriod: json['BillingPeriod'] != null
          ? BillingPeriod.fromJson(
              json['BillingPeriod'] as Map<String, dynamic>)
          : null,
      commercialInvoiceId: json['CommercialInvoiceId'] as String?,
      dueDate: timeStampFromJson(json['DueDate']),
      einvoiceDeliveryStatus: (json['EinvoiceDeliveryStatus'] as String?)
          ?.let(EinvoiceDeliveryStatus.fromString),
      entity: json['Entity'] != null
          ? Entity.fromJson(json['Entity'] as Map<String, dynamic>)
          : null,
      invoiceFrequency: (json['InvoiceFrequency'] as String?)
          ?.let(InvoiceFrequency.fromString),
      invoiceId: json['InvoiceId'] as String?,
      invoiceType:
          (json['InvoiceType'] as String?)?.let(InvoiceType.fromString),
      issuedDate: timeStampFromJson(json['IssuedDate']),
      originalInvoiceId: json['OriginalInvoiceId'] as String?,
      paymentCurrencyAmount: json['PaymentCurrencyAmount'] != null
          ? InvoiceCurrencyAmount.fromJson(
              json['PaymentCurrencyAmount'] as Map<String, dynamic>)
          : null,
      purchaseOrderNumber: json['PurchaseOrderNumber'] as String?,
      receiverRole:
          (json['ReceiverRole'] as String?)?.let(ReceiverRole.fromString),
      taxAuthorityStatus: (json['TaxAuthorityStatus'] as String?)
          ?.let(TaxAuthorityStatus.fromString),
      taxCurrencyAmount: json['TaxCurrencyAmount'] != null
          ? InvoiceCurrencyAmount.fromJson(
              json['TaxCurrencyAmount'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final baseCurrencyAmount = this.baseCurrencyAmount;
    final billSourceAccounts = this.billSourceAccounts;
    final billSourceAccountsTotalCount = this.billSourceAccountsTotalCount;
    final billType = this.billType;
    final billingPeriod = this.billingPeriod;
    final commercialInvoiceId = this.commercialInvoiceId;
    final dueDate = this.dueDate;
    final einvoiceDeliveryStatus = this.einvoiceDeliveryStatus;
    final entity = this.entity;
    final invoiceFrequency = this.invoiceFrequency;
    final invoiceId = this.invoiceId;
    final invoiceType = this.invoiceType;
    final issuedDate = this.issuedDate;
    final originalInvoiceId = this.originalInvoiceId;
    final paymentCurrencyAmount = this.paymentCurrencyAmount;
    final purchaseOrderNumber = this.purchaseOrderNumber;
    final receiverRole = this.receiverRole;
    final taxAuthorityStatus = this.taxAuthorityStatus;
    final taxCurrencyAmount = this.taxCurrencyAmount;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (baseCurrencyAmount != null) 'BaseCurrencyAmount': baseCurrencyAmount,
      if (billSourceAccounts != null) 'BillSourceAccounts': billSourceAccounts,
      if (billSourceAccountsTotalCount != null)
        'BillSourceAccountsTotalCount': billSourceAccountsTotalCount,
      if (billType != null) 'BillType': billType.value,
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (commercialInvoiceId != null)
        'CommercialInvoiceId': commercialInvoiceId,
      if (dueDate != null) 'DueDate': unixTimestampToJson(dueDate),
      if (einvoiceDeliveryStatus != null)
        'EinvoiceDeliveryStatus': einvoiceDeliveryStatus.value,
      if (entity != null) 'Entity': entity,
      if (invoiceFrequency != null) 'InvoiceFrequency': invoiceFrequency.value,
      if (invoiceId != null) 'InvoiceId': invoiceId,
      if (invoiceType != null) 'InvoiceType': invoiceType.value,
      if (issuedDate != null) 'IssuedDate': unixTimestampToJson(issuedDate),
      if (originalInvoiceId != null) 'OriginalInvoiceId': originalInvoiceId,
      if (paymentCurrencyAmount != null)
        'PaymentCurrencyAmount': paymentCurrencyAmount,
      if (purchaseOrderNumber != null)
        'PurchaseOrderNumber': purchaseOrderNumber,
      if (receiverRole != null) 'ReceiverRole': receiverRole.value,
      if (taxAuthorityStatus != null)
        'TaxAuthorityStatus': taxAuthorityStatus.value,
      if (taxCurrencyAmount != null) 'TaxCurrencyAmount': taxCurrencyAmount,
    };
  }
}

/// @nodoc
class ReceiverRole {
  static const seller = ReceiverRole._('SELLER');
  static const reseller = ReceiverRole._('RESELLER');
  static const buyer = ReceiverRole._('BUYER');

  final String value;

  const ReceiverRole._(this.value);

  static const values = [seller, reseller, buyer];

  static ReceiverRole fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ReceiverRole._(value));

  @override
  bool operator ==(other) => other is ReceiverRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The organization name providing Amazon Web Services services.
///
/// @nodoc
class Entity {
  /// Helps you identify whether your invoices are for Amazon Web Services
  /// Marketplace or for purchases of other Amazon Web Services services.
  final BillingEntity? billingEntity;

  /// The name of the entity that issues the Amazon Web Services invoice.
  final String? invoicingEntity;

  Entity({
    this.billingEntity,
    this.invoicingEntity,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      billingEntity:
          (json['BillingEntity'] as String?)?.let(BillingEntity.fromString),
      invoicingEntity: json['InvoicingEntity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingEntity = this.billingEntity;
    final invoicingEntity = this.invoicingEntity;
    return {
      if (billingEntity != null) 'BillingEntity': billingEntity.value,
      if (invoicingEntity != null) 'InvoicingEntity': invoicingEntity,
    };
  }
}

/// The billing period for which you want to retrieve invoice-related documents.
///
/// @nodoc
class BillingPeriod {
  /// The billing period month.
  final int month;

  /// The billing period year.
  final int year;

  BillingPeriod({
    required this.month,
    required this.year,
  });

  factory BillingPeriod.fromJson(Map<String, dynamic> json) {
    return BillingPeriod(
      month: (json['Month'] as int?) ?? 0,
      year: (json['Year'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final month = this.month;
    final year = this.year;
    return {
      'Month': month,
      'Year': year,
    };
  }
}

/// @nodoc
class InvoiceFrequency {
  static const oneTime = InvoiceFrequency._('ONE_TIME');
  static const recurring = InvoiceFrequency._('RECURRING');

  final String value;

  const InvoiceFrequency._(this.value);

  static const values = [oneTime, recurring];

  static InvoiceFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InvoiceFrequency._(value));

  @override
  bool operator ==(other) => other is InvoiceFrequency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BillType {
  static const anniversary = BillType._('ANNIVERSARY');
  static const purchase = BillType._('PURCHASE');
  static const refund = BillType._('REFUND');

  final String value;

  const BillType._(this.value);

  static const values = [anniversary, purchase, refund];

  static BillType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BillType._(value));

  @override
  bool operator ==(other) => other is BillType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InvoiceType {
  static const invoice = InvoiceType._('INVOICE');
  static const creditMemo = InvoiceType._('CREDIT_MEMO');
  static const paymentReceipt = InvoiceType._('PAYMENT_RECEIPT');

  final String value;

  const InvoiceType._(this.value);

  static const values = [invoice, creditMemo, paymentReceipt];

  static InvoiceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InvoiceType._(value));

  @override
  bool operator ==(other) => other is InvoiceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EinvoiceDeliveryStatus {
  static const delivered = EinvoiceDeliveryStatus._('DELIVERED');
  static const notDelivered = EinvoiceDeliveryStatus._('NOT_DELIVERED');

  final String value;

  const EinvoiceDeliveryStatus._(this.value);

  static const values = [delivered, notDelivered];

  static EinvoiceDeliveryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EinvoiceDeliveryStatus._(value));

  @override
  bool operator ==(other) =>
      other is EinvoiceDeliveryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TaxAuthorityStatus {
  static const issued = TaxAuthorityStatus._('ISSUED');
  static const cancelled = TaxAuthorityStatus._('CANCELLED');

  final String value;

  const TaxAuthorityStatus._(this.value);

  static const values = [issued, cancelled];

  static TaxAuthorityStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TaxAuthorityStatus._(value));

  @override
  bool operator ==(other) =>
      other is TaxAuthorityStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The amount charged after taxes, in the preferred currency.
///
/// @nodoc
class InvoiceCurrencyAmount {
  /// Details about the invoice currency amount.
  final AmountBreakdown? amountBreakdown;

  /// The currency dominion of the invoice document.
  final String? currencyCode;

  /// The details of currency exchange.
  final CurrencyExchangeDetails? currencyExchangeDetails;

  /// The invoice currency amount.
  final String? totalAmount;

  /// Details about the invoice total amount before tax.
  final String? totalAmountBeforeTax;

  InvoiceCurrencyAmount({
    this.amountBreakdown,
    this.currencyCode,
    this.currencyExchangeDetails,
    this.totalAmount,
    this.totalAmountBeforeTax,
  });

  factory InvoiceCurrencyAmount.fromJson(Map<String, dynamic> json) {
    return InvoiceCurrencyAmount(
      amountBreakdown: json['AmountBreakdown'] != null
          ? AmountBreakdown.fromJson(
              json['AmountBreakdown'] as Map<String, dynamic>)
          : null,
      currencyCode: json['CurrencyCode'] as String?,
      currencyExchangeDetails: json['CurrencyExchangeDetails'] != null
          ? CurrencyExchangeDetails.fromJson(
              json['CurrencyExchangeDetails'] as Map<String, dynamic>)
          : null,
      totalAmount: json['TotalAmount'] as String?,
      totalAmountBeforeTax: json['TotalAmountBeforeTax'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amountBreakdown = this.amountBreakdown;
    final currencyCode = this.currencyCode;
    final currencyExchangeDetails = this.currencyExchangeDetails;
    final totalAmount = this.totalAmount;
    final totalAmountBeforeTax = this.totalAmountBeforeTax;
    return {
      if (amountBreakdown != null) 'AmountBreakdown': amountBreakdown,
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (currencyExchangeDetails != null)
        'CurrencyExchangeDetails': currencyExchangeDetails,
      if (totalAmount != null) 'TotalAmount': totalAmount,
      if (totalAmountBeforeTax != null)
        'TotalAmountBeforeTax': totalAmountBeforeTax,
    };
  }
}

/// Details about how the total amount was calculated and categorized.
///
/// @nodoc
class AmountBreakdown {
  /// The discounted amount.
  final DiscountsBreakdown? discounts;

  /// The fee amount.
  final FeesBreakdown? fees;

  /// The total of a set of the breakdown.
  final String? subTotalAmount;

  /// The tax amount.
  final TaxesBreakdown? taxes;

  AmountBreakdown({
    this.discounts,
    this.fees,
    this.subTotalAmount,
    this.taxes,
  });

  factory AmountBreakdown.fromJson(Map<String, dynamic> json) {
    return AmountBreakdown(
      discounts: json['Discounts'] != null
          ? DiscountsBreakdown.fromJson(
              json['Discounts'] as Map<String, dynamic>)
          : null,
      fees: json['Fees'] != null
          ? FeesBreakdown.fromJson(json['Fees'] as Map<String, dynamic>)
          : null,
      subTotalAmount: json['SubTotalAmount'] as String?,
      taxes: json['Taxes'] != null
          ? TaxesBreakdown.fromJson(json['Taxes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final discounts = this.discounts;
    final fees = this.fees;
    final subTotalAmount = this.subTotalAmount;
    final taxes = this.taxes;
    return {
      if (discounts != null) 'Discounts': discounts,
      if (fees != null) 'Fees': fees,
      if (subTotalAmount != null) 'SubTotalAmount': subTotalAmount,
      if (taxes != null) 'Taxes': taxes,
    };
  }
}

/// The details of currency exchange.
///
/// @nodoc
class CurrencyExchangeDetails {
  /// The currency exchange rate.
  final String? rate;

  /// The exchange source currency.
  final String? sourceCurrencyCode;

  /// The exchange target currency.
  final String? targetCurrencyCode;

  CurrencyExchangeDetails({
    this.rate,
    this.sourceCurrencyCode,
    this.targetCurrencyCode,
  });

  factory CurrencyExchangeDetails.fromJson(Map<String, dynamic> json) {
    return CurrencyExchangeDetails(
      rate: json['Rate'] as String?,
      sourceCurrencyCode: json['SourceCurrencyCode'] as String?,
      targetCurrencyCode: json['TargetCurrencyCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rate = this.rate;
    final sourceCurrencyCode = this.sourceCurrencyCode;
    final targetCurrencyCode = this.targetCurrencyCode;
    return {
      if (rate != null) 'Rate': rate,
      if (sourceCurrencyCode != null) 'SourceCurrencyCode': sourceCurrencyCode,
      if (targetCurrencyCode != null) 'TargetCurrencyCode': targetCurrencyCode,
    };
  }
}

/// The discounts details.
///
/// @nodoc
class DiscountsBreakdown {
  /// The list of discounts information.
  final List<DiscountsBreakdownAmount>? breakdown;

  /// The discount's total amount.
  final String? totalAmount;

  DiscountsBreakdown({
    this.breakdown,
    this.totalAmount,
  });

  factory DiscountsBreakdown.fromJson(Map<String, dynamic> json) {
    return DiscountsBreakdown(
      breakdown: (json['Breakdown'] as List?)
          ?.nonNulls
          .map((e) =>
              DiscountsBreakdownAmount.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['TotalAmount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final breakdown = this.breakdown;
    final totalAmount = this.totalAmount;
    return {
      if (breakdown != null) 'Breakdown': breakdown,
      if (totalAmount != null) 'TotalAmount': totalAmount,
    };
  }
}

/// The details of the taxes.
///
/// @nodoc
class TaxesBreakdown {
  /// A list of tax information.
  final List<TaxesBreakdownAmount>? breakdown;

  /// The total amount for your taxes.
  final String? totalAmount;

  TaxesBreakdown({
    this.breakdown,
    this.totalAmount,
  });

  factory TaxesBreakdown.fromJson(Map<String, dynamic> json) {
    return TaxesBreakdown(
      breakdown: (json['Breakdown'] as List?)
          ?.nonNulls
          .map((e) => TaxesBreakdownAmount.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['TotalAmount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final breakdown = this.breakdown;
    final totalAmount = this.totalAmount;
    return {
      if (breakdown != null) 'Breakdown': breakdown,
      if (totalAmount != null) 'TotalAmount': totalAmount,
    };
  }
}

/// The details of fees.
///
/// @nodoc
class FeesBreakdown {
  /// The list of fees information.
  final List<FeesBreakdownAmount>? breakdown;

  /// The total amount of fees.
  final String? totalAmount;

  FeesBreakdown({
    this.breakdown,
    this.totalAmount,
  });

  factory FeesBreakdown.fromJson(Map<String, dynamic> json) {
    return FeesBreakdown(
      breakdown: (json['Breakdown'] as List?)
          ?.nonNulls
          .map((e) => FeesBreakdownAmount.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['TotalAmount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final breakdown = this.breakdown;
    final totalAmount = this.totalAmount;
    return {
      if (breakdown != null) 'Breakdown': breakdown,
      if (totalAmount != null) 'TotalAmount': totalAmount,
    };
  }
}

/// The fee amount.
///
/// @nodoc
class FeesBreakdownAmount {
  /// The fee amount.
  final String? amount;

  /// The list of fees information.
  final String? description;

  /// Details about the rate amount.
  final String? rate;

  FeesBreakdownAmount({
    this.amount,
    this.description,
    this.rate,
  });

  factory FeesBreakdownAmount.fromJson(Map<String, dynamic> json) {
    return FeesBreakdownAmount(
      amount: json['Amount'] as String?,
      description: json['Description'] as String?,
      rate: json['Rate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final description = this.description;
    final rate = this.rate;
    return {
      if (amount != null) 'Amount': amount,
      if (description != null) 'Description': description,
      if (rate != null) 'Rate': rate,
    };
  }
}

/// The tax amount.
///
/// @nodoc
class TaxesBreakdownAmount {
  /// The tax amount.
  final String? amount;

  /// The details of the taxes.
  final String? description;

  /// The details of the tax rate.
  final String? rate;

  TaxesBreakdownAmount({
    this.amount,
    this.description,
    this.rate,
  });

  factory TaxesBreakdownAmount.fromJson(Map<String, dynamic> json) {
    return TaxesBreakdownAmount(
      amount: json['Amount'] as String?,
      description: json['Description'] as String?,
      rate: json['Rate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final description = this.description;
    final rate = this.rate;
    return {
      if (amount != null) 'Amount': amount,
      if (description != null) 'Description': description,
      if (rate != null) 'Rate': rate,
    };
  }
}

/// The discounted amount.
///
/// @nodoc
class DiscountsBreakdownAmount {
  /// The discounted amount.
  final String? amount;

  /// The list of discounts information.
  final String? description;

  /// The details for the discount rate..
  final String? rate;

  DiscountsBreakdownAmount({
    this.amount,
    this.description,
    this.rate,
  });

  factory DiscountsBreakdownAmount.fromJson(Map<String, dynamic> json) {
    return DiscountsBreakdownAmount(
      amount: json['Amount'] as String?,
      description: json['Description'] as String?,
      rate: json['Rate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final description = this.description;
    final rate = this.rate;
    return {
      if (amount != null) 'Amount': amount,
      if (description != null) 'Description': description,
      if (rate != null) 'Rate': rate,
    };
  }
}

/// @nodoc
class BillingEntity {
  static const aws = BillingEntity._('AWS');
  static const awsMarketplace = BillingEntity._('AWS_MARKETPLACE');

  final String value;

  const BillingEntity._(this.value);

  static const values = [aws, awsMarketplace];

  static BillingEntity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingEntity._(value));

  @override
  bool operator ==(other) => other is BillingEntity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the invoice summary.
///
/// @nodoc
class InvoiceSummariesSelector {
  /// The query identifier type (<code>INVOICE_ID</code> or
  /// <code>ACCOUNT_ID</code>).
  final ListInvoiceSummariesResourceType resourceType;

  /// The value of the query identifier.
  final String value;

  InvoiceSummariesSelector({
    required this.resourceType,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final value = this.value;
    return {
      'ResourceType': resourceType.value,
      'Value': value,
    };
  }
}

/// Filters for your invoice summaries.
///
/// @nodoc
class InvoiceSummariesFilter {
  /// The billing period associated with the invoice documents.
  final BillingPeriod? billingPeriod;

  /// The name of the entity that issues the Amazon Web Services invoice.
  final String? invoicingEntity;

  /// The role of the invoice receiver to filter by.
  /// <note>
  /// When <code>ReceiverRole</code> is specified:
  ///
  /// <ul>
  /// <li>
  /// Data is available starting <code>2025-06-01</code>. Queries for periods
  /// before <code>2025-06-01</code> return a validation error.
  /// </li>
  /// <li>
  /// <code>TimeInterval</code> supports a time interval of up to 5 years. Without
  /// <code>ReceiverRole</code>, <code>TimeInterval</code> is limited to one
  /// month.
  /// </li>
  /// </ul> </note>
  final ReceiverRole? receiverRole;

  /// The date range for invoice summary retrieval.
  final DateInterval? timeInterval;

  InvoiceSummariesFilter({
    this.billingPeriod,
    this.invoicingEntity,
    this.receiverRole,
    this.timeInterval,
  });

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final invoicingEntity = this.invoicingEntity;
    final receiverRole = this.receiverRole;
    final timeInterval = this.timeInterval;
    return {
      if (billingPeriod != null) 'BillingPeriod': billingPeriod,
      if (invoicingEntity != null) 'InvoicingEntity': invoicingEntity,
      if (receiverRole != null) 'ReceiverRole': receiverRole.value,
      if (timeInterval != null) 'TimeInterval': timeInterval,
    };
  }
}

/// The time period that you want invoice-related documents for.
///
/// @nodoc
class DateInterval {
  /// The end of the time period that you want invoice-related documents for. The
  /// end date is exclusive. For example, if <code>end</code> is
  /// <code>2019-01-10</code>, Amazon Web Services retrieves invoice-related
  /// documents from the start date up to, but not including,
  /// <code>2018-01-10</code>.
  final DateTime endDate;

  /// The beginning of the time period that you want invoice-related documents
  /// for. The start date is inclusive. For example, if <code>start</code> is
  /// <code>2019-01-01</code>, AWS retrieves invoices starting at
  /// <code>2019-01-01</code> up to the end date.
  final DateTime startDate;

  DateInterval({
    required this.endDate,
    required this.startDate,
  });

  Map<String, dynamic> toJson() {
    final endDate = this.endDate;
    final startDate = this.startDate;
    return {
      'EndDate': unixTimestampToJson(endDate),
      'StartDate': unixTimestampToJson(startDate),
    };
  }
}

/// @nodoc
class ListInvoiceSummariesResourceType {
  static const accountId = ListInvoiceSummariesResourceType._('ACCOUNT_ID');
  static const invoiceId = ListInvoiceSummariesResourceType._('INVOICE_ID');

  final String value;

  const ListInvoiceSummariesResourceType._(this.value);

  static const values = [accountId, invoiceId];

  static ListInvoiceSummariesResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListInvoiceSummariesResourceType._(value));

  @override
  bool operator ==(other) =>
      other is ListInvoiceSummariesResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the full configuration of a procurement portal preference,
/// including settings for e-invoice delivery and purchase order retrieval.
///
/// @nodoc
class ProcurementPortalPreference {
  /// The Amazon Web Services account ID associated with this procurement portal
  /// preference.
  final String awsAccountId;

  /// The domain identifier for the buyer in the procurement portal.
  final BuyerDomain buyerDomain;

  /// The unique identifier for the buyer in the procurement portal.
  final String buyerIdentifier;

  /// The date and time when the procurement portal preference was created.
  final DateTime createDate;

  /// Indicates whether e-invoice delivery is enabled for this procurement portal
  /// preference.
  final bool einvoiceDeliveryEnabled;

  /// The date and time when the procurement portal preference was last updated.
  final DateTime lastUpdateDate;

  /// The name of the procurement portal.
  final ProcurementPortalName procurementPortalName;

  /// The Amazon Resource Name (ARN) of the procurement portal preference.
  final String procurementPortalPreferenceArn;

  /// Indicates whether purchase order retrieval is enabled for this procurement
  /// portal preference.
  final bool purchaseOrderRetrievalEnabled;

  /// The domain identifier for the supplier in the procurement portal.
  final SupplierDomain supplierDomain;

  /// The unique identifier for the supplier in the procurement portal.
  final String supplierIdentifier;

  /// The version number of the procurement portal preference configuration.
  final int version;

  /// List of contact information for portal administrators and technical
  /// contacts.
  final List<Contact>? contacts;

  /// The configuration settings that specify how e-invoices are delivered to the
  /// procurement portal.
  final EinvoiceDeliveryPreference? einvoiceDeliveryPreference;

  /// The current status of the e-invoice delivery preference.
  final ProcurementPortalPreferenceStatus? einvoiceDeliveryPreferenceStatus;

  /// The reason for the current e-invoice delivery preference status.
  final String? einvoiceDeliveryPreferenceStatusReason;

  /// The endpoint URL where e-invoices are delivered to the procurement portal.
  final String? procurementPortalInstanceEndpoint;

  /// The shared secret or authentication credential used for secure communication
  /// with the procurement portal.
  final String? procurementPortalSharedSecret;

  /// The endpoint URL used for retrieving purchase orders from the procurement
  /// portal.
  final String? purchaseOrderRetrievalEndpoint;

  /// The current status of the purchase order retrieval preference.
  final ProcurementPortalPreferenceStatus?
      purchaseOrderRetrievalPreferenceStatus;

  /// The reason for the current purchase order retrieval preference status.
  final String? purchaseOrderRetrievalPreferenceStatusReason;
  final ProcurementPortalPreferenceSelector? selector;

  /// Configuration on settings for the test environment of the procurement
  /// portal.
  final TestEnvPreference? testEnvPreference;

  ProcurementPortalPreference({
    required this.awsAccountId,
    required this.buyerDomain,
    required this.buyerIdentifier,
    required this.createDate,
    required this.einvoiceDeliveryEnabled,
    required this.lastUpdateDate,
    required this.procurementPortalName,
    required this.procurementPortalPreferenceArn,
    required this.purchaseOrderRetrievalEnabled,
    required this.supplierDomain,
    required this.supplierIdentifier,
    required this.version,
    this.contacts,
    this.einvoiceDeliveryPreference,
    this.einvoiceDeliveryPreferenceStatus,
    this.einvoiceDeliveryPreferenceStatusReason,
    this.procurementPortalInstanceEndpoint,
    this.procurementPortalSharedSecret,
    this.purchaseOrderRetrievalEndpoint,
    this.purchaseOrderRetrievalPreferenceStatus,
    this.purchaseOrderRetrievalPreferenceStatusReason,
    this.selector,
    this.testEnvPreference,
  });

  factory ProcurementPortalPreference.fromJson(Map<String, dynamic> json) {
    return ProcurementPortalPreference(
      awsAccountId: (json['AwsAccountId'] as String?) ?? '',
      buyerDomain:
          BuyerDomain.fromString((json['BuyerDomain'] as String?) ?? ''),
      buyerIdentifier: (json['BuyerIdentifier'] as String?) ?? '',
      createDate: nonNullableTimeStampFromJson(json['CreateDate'] ?? 0),
      einvoiceDeliveryEnabled:
          (json['EinvoiceDeliveryEnabled'] as bool?) ?? false,
      lastUpdateDate: nonNullableTimeStampFromJson(json['LastUpdateDate'] ?? 0),
      procurementPortalName: ProcurementPortalName.fromString(
          (json['ProcurementPortalName'] as String?) ?? ''),
      procurementPortalPreferenceArn:
          (json['ProcurementPortalPreferenceArn'] as String?) ?? '',
      purchaseOrderRetrievalEnabled:
          (json['PurchaseOrderRetrievalEnabled'] as bool?) ?? false,
      supplierDomain:
          SupplierDomain.fromString((json['SupplierDomain'] as String?) ?? ''),
      supplierIdentifier: (json['SupplierIdentifier'] as String?) ?? '',
      version: (json['Version'] as int?) ?? 0,
      contacts: (json['Contacts'] as List?)
          ?.nonNulls
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      einvoiceDeliveryPreference: json['EinvoiceDeliveryPreference'] != null
          ? EinvoiceDeliveryPreference.fromJson(
              json['EinvoiceDeliveryPreference'] as Map<String, dynamic>)
          : null,
      einvoiceDeliveryPreferenceStatus:
          (json['EinvoiceDeliveryPreferenceStatus'] as String?)
              ?.let(ProcurementPortalPreferenceStatus.fromString),
      einvoiceDeliveryPreferenceStatusReason:
          json['EinvoiceDeliveryPreferenceStatusReason'] as String?,
      procurementPortalInstanceEndpoint:
          json['ProcurementPortalInstanceEndpoint'] as String?,
      procurementPortalSharedSecret:
          json['ProcurementPortalSharedSecret'] as String?,
      purchaseOrderRetrievalEndpoint:
          json['PurchaseOrderRetrievalEndpoint'] as String?,
      purchaseOrderRetrievalPreferenceStatus:
          (json['PurchaseOrderRetrievalPreferenceStatus'] as String?)
              ?.let(ProcurementPortalPreferenceStatus.fromString),
      purchaseOrderRetrievalPreferenceStatusReason:
          json['PurchaseOrderRetrievalPreferenceStatusReason'] as String?,
      selector: json['Selector'] != null
          ? ProcurementPortalPreferenceSelector.fromJson(
              json['Selector'] as Map<String, dynamic>)
          : null,
      testEnvPreference: json['TestEnvPreference'] != null
          ? TestEnvPreference.fromJson(
              json['TestEnvPreference'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final buyerDomain = this.buyerDomain;
    final buyerIdentifier = this.buyerIdentifier;
    final createDate = this.createDate;
    final einvoiceDeliveryEnabled = this.einvoiceDeliveryEnabled;
    final lastUpdateDate = this.lastUpdateDate;
    final procurementPortalName = this.procurementPortalName;
    final procurementPortalPreferenceArn = this.procurementPortalPreferenceArn;
    final purchaseOrderRetrievalEnabled = this.purchaseOrderRetrievalEnabled;
    final supplierDomain = this.supplierDomain;
    final supplierIdentifier = this.supplierIdentifier;
    final version = this.version;
    final contacts = this.contacts;
    final einvoiceDeliveryPreference = this.einvoiceDeliveryPreference;
    final einvoiceDeliveryPreferenceStatus =
        this.einvoiceDeliveryPreferenceStatus;
    final einvoiceDeliveryPreferenceStatusReason =
        this.einvoiceDeliveryPreferenceStatusReason;
    final procurementPortalInstanceEndpoint =
        this.procurementPortalInstanceEndpoint;
    final procurementPortalSharedSecret = this.procurementPortalSharedSecret;
    final purchaseOrderRetrievalEndpoint = this.purchaseOrderRetrievalEndpoint;
    final purchaseOrderRetrievalPreferenceStatus =
        this.purchaseOrderRetrievalPreferenceStatus;
    final purchaseOrderRetrievalPreferenceStatusReason =
        this.purchaseOrderRetrievalPreferenceStatusReason;
    final selector = this.selector;
    final testEnvPreference = this.testEnvPreference;
    return {
      'AwsAccountId': awsAccountId,
      'BuyerDomain': buyerDomain.value,
      'BuyerIdentifier': buyerIdentifier,
      'CreateDate': unixTimestampToJson(createDate),
      'EinvoiceDeliveryEnabled': einvoiceDeliveryEnabled,
      'LastUpdateDate': unixTimestampToJson(lastUpdateDate),
      'ProcurementPortalName': procurementPortalName.value,
      'ProcurementPortalPreferenceArn': procurementPortalPreferenceArn,
      'PurchaseOrderRetrievalEnabled': purchaseOrderRetrievalEnabled,
      'SupplierDomain': supplierDomain.value,
      'SupplierIdentifier': supplierIdentifier,
      'Version': version,
      if (contacts != null) 'Contacts': contacts,
      if (einvoiceDeliveryPreference != null)
        'EinvoiceDeliveryPreference': einvoiceDeliveryPreference,
      if (einvoiceDeliveryPreferenceStatus != null)
        'EinvoiceDeliveryPreferenceStatus':
            einvoiceDeliveryPreferenceStatus.value,
      if (einvoiceDeliveryPreferenceStatusReason != null)
        'EinvoiceDeliveryPreferenceStatusReason':
            einvoiceDeliveryPreferenceStatusReason,
      if (procurementPortalInstanceEndpoint != null)
        'ProcurementPortalInstanceEndpoint': procurementPortalInstanceEndpoint,
      if (procurementPortalSharedSecret != null)
        'ProcurementPortalSharedSecret': procurementPortalSharedSecret,
      if (purchaseOrderRetrievalEndpoint != null)
        'PurchaseOrderRetrievalEndpoint': purchaseOrderRetrievalEndpoint,
      if (purchaseOrderRetrievalPreferenceStatus != null)
        'PurchaseOrderRetrievalPreferenceStatus':
            purchaseOrderRetrievalPreferenceStatus.value,
      if (purchaseOrderRetrievalPreferenceStatusReason != null)
        'PurchaseOrderRetrievalPreferenceStatusReason':
            purchaseOrderRetrievalPreferenceStatusReason,
      if (selector != null) 'Selector': selector,
      if (testEnvPreference != null) 'TestEnvPreference': testEnvPreference,
    };
  }
}

/// Contains configuration settings for testing the procurement portal
/// integration in a non-production environment.
///
/// @nodoc
class TestEnvPreference {
  /// The domain identifier for the buyer in the test environment of the
  /// procurement portal.
  final BuyerDomain buyerDomain;

  /// The unique identifier for the buyer in the test environment of the
  /// procurement portal.
  final String buyerIdentifier;

  /// The domain identifier for the supplier in the test environment of the
  /// procurement portal.
  final SupplierDomain supplierDomain;

  /// The unique identifier for the supplier in the test environment of the
  /// procurement portal.
  final String supplierIdentifier;

  /// The endpoint URL where e-invoices are delivered in the test environment.
  final String? procurementPortalInstanceEndpoint;

  /// The shared secret or authentication credential used for secure communication
  /// with the test environment.
  final String? procurementPortalSharedSecret;

  /// The endpoint URL used for retrieving purchase orders in the test
  /// environment.
  final String? purchaseOrderRetrievalEndpoint;

  TestEnvPreference({
    required this.buyerDomain,
    required this.buyerIdentifier,
    required this.supplierDomain,
    required this.supplierIdentifier,
    this.procurementPortalInstanceEndpoint,
    this.procurementPortalSharedSecret,
    this.purchaseOrderRetrievalEndpoint,
  });

  factory TestEnvPreference.fromJson(Map<String, dynamic> json) {
    return TestEnvPreference(
      buyerDomain:
          BuyerDomain.fromString((json['BuyerDomain'] as String?) ?? ''),
      buyerIdentifier: (json['BuyerIdentifier'] as String?) ?? '',
      supplierDomain:
          SupplierDomain.fromString((json['SupplierDomain'] as String?) ?? ''),
      supplierIdentifier: (json['SupplierIdentifier'] as String?) ?? '',
      procurementPortalInstanceEndpoint:
          json['ProcurementPortalInstanceEndpoint'] as String?,
      procurementPortalSharedSecret:
          json['ProcurementPortalSharedSecret'] as String?,
      purchaseOrderRetrievalEndpoint:
          json['PurchaseOrderRetrievalEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buyerDomain = this.buyerDomain;
    final buyerIdentifier = this.buyerIdentifier;
    final supplierDomain = this.supplierDomain;
    final supplierIdentifier = this.supplierIdentifier;
    final procurementPortalInstanceEndpoint =
        this.procurementPortalInstanceEndpoint;
    final procurementPortalSharedSecret = this.procurementPortalSharedSecret;
    final purchaseOrderRetrievalEndpoint = this.purchaseOrderRetrievalEndpoint;
    return {
      'BuyerDomain': buyerDomain.value,
      'BuyerIdentifier': buyerIdentifier,
      'SupplierDomain': supplierDomain.value,
      'SupplierIdentifier': supplierIdentifier,
      if (procurementPortalInstanceEndpoint != null)
        'ProcurementPortalInstanceEndpoint': procurementPortalInstanceEndpoint,
      if (procurementPortalSharedSecret != null)
        'ProcurementPortalSharedSecret': procurementPortalSharedSecret,
      if (purchaseOrderRetrievalEndpoint != null)
        'PurchaseOrderRetrievalEndpoint': purchaseOrderRetrievalEndpoint,
    };
  }
}

/// Invoice document data.
///
/// @nodoc
class InvoicePDF {
  /// The pre-signed URL to download the invoice document.
  final String? documentUrl;

  /// The pre-signed URL expiration date of the invoice document.
  final DateTime? documentUrlExpirationDate;

  /// Your unique invoice ID.
  final String? invoiceId;

  /// List of supplemental documents associated with the invoice.
  final List<SupplementalDocument>? supplementalDocuments;

  InvoicePDF({
    this.documentUrl,
    this.documentUrlExpirationDate,
    this.invoiceId,
    this.supplementalDocuments,
  });

  factory InvoicePDF.fromJson(Map<String, dynamic> json) {
    return InvoicePDF(
      documentUrl: json['DocumentUrl'] as String?,
      documentUrlExpirationDate:
          timeStampFromJson(json['DocumentUrlExpirationDate']),
      invoiceId: json['InvoiceId'] as String?,
      supplementalDocuments: (json['SupplementalDocuments'] as List?)
          ?.nonNulls
          .map((e) => SupplementalDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentUrl = this.documentUrl;
    final documentUrlExpirationDate = this.documentUrlExpirationDate;
    final invoiceId = this.invoiceId;
    final supplementalDocuments = this.supplementalDocuments;
    return {
      if (documentUrl != null) 'DocumentUrl': documentUrl,
      if (documentUrlExpirationDate != null)
        'DocumentUrlExpirationDate':
            unixTimestampToJson(documentUrlExpirationDate),
      if (invoiceId != null) 'InvoiceId': invoiceId,
      if (supplementalDocuments != null)
        'SupplementalDocuments': supplementalDocuments,
    };
  }
}

/// Supplemental document associated with the invoice.
///
/// @nodoc
class SupplementalDocument {
  /// The ID of the supplemental document.
  final String? documentId;

  /// The type of supplemental document.
  final SupplementalDocumentType? documentType;

  /// The pre-signed URL to download invoice supplemental document.
  final String? documentUrl;

  /// The pre-signed URL expiration date of invoice supplemental document.
  final DateTime? documentUrlExpirationDate;

  SupplementalDocument({
    this.documentId,
    this.documentType,
    this.documentUrl,
    this.documentUrlExpirationDate,
  });

  factory SupplementalDocument.fromJson(Map<String, dynamic> json) {
    return SupplementalDocument(
      documentId: json['DocumentId'] as String?,
      documentType: (json['DocumentType'] as String?)
          ?.let(SupplementalDocumentType.fromString),
      documentUrl: json['DocumentUrl'] as String?,
      documentUrlExpirationDate:
          timeStampFromJson(json['DocumentUrlExpirationDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    final documentType = this.documentType;
    final documentUrl = this.documentUrl;
    final documentUrlExpirationDate = this.documentUrlExpirationDate;
    return {
      if (documentId != null) 'DocumentId': documentId,
      if (documentType != null) 'DocumentType': documentType.value,
      if (documentUrl != null) 'DocumentUrl': documentUrl,
      if (documentUrlExpirationDate != null)
        'DocumentUrlExpirationDate':
            unixTimestampToJson(documentUrlExpirationDate),
    };
  }
}

/// @nodoc
class SupplementalDocumentType {
  static const governmentInvoice =
      SupplementalDocumentType._('GOVERNMENT_INVOICE');
  static const taxEInvoice = SupplementalDocumentType._('TAX_E_INVOICE');
  static const paymentReceipt = SupplementalDocumentType._('PAYMENT_RECEIPT');
  static const supplement = SupplementalDocumentType._('SUPPLEMENT');

  final String value;

  const SupplementalDocumentType._(this.value);

  static const values = [
    governmentInvoice,
    taxEInvoice,
    paymentReceipt,
    supplement
  ];

  static SupplementalDocumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SupplementalDocumentType._(value));

  @override
  bool operator ==(other) =>
      other is SupplementalDocumentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains high-level information about the invoice receiver.
///
/// @nodoc
class InvoiceProfile {
  /// The account ID the invoice profile is generated for.
  final String? accountId;

  /// This specifies the issuing entity of the invoice.
  final String? issuer;

  /// The address of the receiver that will be printed on the invoice.
  final ReceiverAddress? receiverAddress;

  /// The email address for the invoice profile receiver.
  final String? receiverEmail;

  /// The name of the person receiving the invoice profile.
  final String? receiverName;

  /// Your Tax Registration Number (TRN) information.
  final String? taxRegistrationNumber;

  InvoiceProfile({
    this.accountId,
    this.issuer,
    this.receiverAddress,
    this.receiverEmail,
    this.receiverName,
    this.taxRegistrationNumber,
  });

  factory InvoiceProfile.fromJson(Map<String, dynamic> json) {
    return InvoiceProfile(
      accountId: json['AccountId'] as String?,
      issuer: json['Issuer'] as String?,
      receiverAddress: json['ReceiverAddress'] != null
          ? ReceiverAddress.fromJson(
              json['ReceiverAddress'] as Map<String, dynamic>)
          : null,
      receiverEmail: json['ReceiverEmail'] as String?,
      receiverName: json['ReceiverName'] as String?,
      taxRegistrationNumber: json['TaxRegistrationNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final issuer = this.issuer;
    final receiverAddress = this.receiverAddress;
    final receiverEmail = this.receiverEmail;
    final receiverName = this.receiverName;
    final taxRegistrationNumber = this.taxRegistrationNumber;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (issuer != null) 'Issuer': issuer,
      if (receiverAddress != null) 'ReceiverAddress': receiverAddress,
      if (receiverEmail != null) 'ReceiverEmail': receiverEmail,
      if (receiverName != null) 'ReceiverName': receiverName,
      if (taxRegistrationNumber != null)
        'TaxRegistrationNumber': taxRegistrationNumber,
    };
  }
}

/// The details of the address associated with the receiver.
///
/// @nodoc
class ReceiverAddress {
  /// The first line of the address.
  final String? addressLine1;

  /// The second line of the address, if applicable.
  final String? addressLine2;

  /// The third line of the address, if applicable.
  final String? addressLine3;

  /// The city that the address is in.
  final String? city;

  /// A unique company name.
  final String? companyName;

  /// The country code for the country the address is in.
  final String? countryCode;

  /// The district or country the address is located in.
  final String? districtOrCounty;

  /// The postal code associated with the address.
  final String? postalCode;

  /// The state, region, or province the address is located.
  final String? stateOrRegion;

  ReceiverAddress({
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.city,
    this.companyName,
    this.countryCode,
    this.districtOrCounty,
    this.postalCode,
    this.stateOrRegion,
  });

  factory ReceiverAddress.fromJson(Map<String, dynamic> json) {
    return ReceiverAddress(
      addressLine1: json['AddressLine1'] as String?,
      addressLine2: json['AddressLine2'] as String?,
      addressLine3: json['AddressLine3'] as String?,
      city: json['City'] as String?,
      companyName: json['CompanyName'] as String?,
      countryCode: json['CountryCode'] as String?,
      districtOrCounty: json['DistrictOrCounty'] as String?,
      postalCode: json['PostalCode'] as String?,
      stateOrRegion: json['StateOrRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressLine1 = this.addressLine1;
    final addressLine2 = this.addressLine2;
    final addressLine3 = this.addressLine3;
    final city = this.city;
    final companyName = this.companyName;
    final countryCode = this.countryCode;
    final districtOrCounty = this.districtOrCounty;
    final postalCode = this.postalCode;
    final stateOrRegion = this.stateOrRegion;
    return {
      if (addressLine1 != null) 'AddressLine1': addressLine1,
      if (addressLine2 != null) 'AddressLine2': addressLine2,
      if (addressLine3 != null) 'AddressLine3': addressLine3,
      if (city != null) 'City': city,
      if (companyName != null) 'CompanyName': companyName,
      if (countryCode != null) 'CountryCode': countryCode,
      if (districtOrCounty != null) 'DistrictOrCounty': districtOrCounty,
      if (postalCode != null) 'PostalCode': postalCode,
      if (stateOrRegion != null) 'StateOrRegion': stateOrRegion,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
