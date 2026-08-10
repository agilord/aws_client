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

import 'v2023_09_07.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// You can use the Billing API to programatically list the billing views
/// available to you for a given time period. A billing view represents a set of
/// billing data.
///
/// The Billing API provides the following endpoint:
///
/// <code>https://billing.us-east-1.api.aws</code>
class Billing {
  final _s.JsonProtocol _protocol;
  factory Billing({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'billing',
    );
    return Billing._(
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
  Billing._({
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

  /// Associates one or more source billing views with an existing billing view.
  /// This allows creating aggregate billing views that combine data from
  /// multiple sources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing view to associate source
  /// views with.
  ///
  /// Parameter [sourceViews] :
  /// A list of ARNs of the source billing views to associate.
  Future<AssociateSourceViewsResponse> associateSourceViews({
    required String arn,
    required List<String> sourceViews,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.AssociateSourceViews'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'sourceViews': sourceViews,
      },
    );

    return AssociateSourceViewsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a billing view with the specified billing view attributes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the billing view.
  ///
  /// Parameter [sourceViews] :
  /// A list of billing views used as the data source for the custom billing
  /// view.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier you specify to ensure idempotency of
  /// the request. Idempotency ensures that an API request completes no more
  /// than one time. If the original request completes successfully, any
  /// subsequent retries complete successfully without performing any further
  /// actions with an idempotent request.
  ///
  /// Parameter [dataFilterExpression] :
  /// See <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
  /// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
  /// and <code>CostCategories</code>.
  ///
  /// Parameter [description] :
  /// The description of the billing view.
  ///
  /// Parameter [resourceTags] :
  /// A list of key value map specifying tags associated to the billing view
  /// being created.
  Future<CreateBillingViewResponse> createBillingView({
    required String name,
    required List<String> sourceViews,
    String? clientToken,
    Expression? dataFilterExpression,
    String? description,
    List<ResourceTag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.CreateBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'sourceViews': sourceViews,
        'clientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (dataFilterExpression != null)
          'dataFilterExpression': dataFilterExpression,
        if (description != null) 'description': description,
        if (resourceTags != null) 'resourceTags': resourceTags,
      },
    );

    return CreateBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified billing view.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [force] :
  /// If set to true, forces deletion of the billing view even if it has derived
  /// resources (e.g. other billing views or budgets). Use with caution as this
  /// may break dependent resources.
  Future<DeleteBillingViewResponse> deleteBillingView({
    required String arn,
    bool? force,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.DeleteBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (force != null) 'force': force,
      },
    );

    return DeleteBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Removes the association between one or more source billing views and an
  /// existing billing view. This allows modifying the composition of aggregate
  /// billing views.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the billing view to disassociate source
  /// views from.
  ///
  /// Parameter [sourceViews] :
  /// A list of ARNs of the source billing views to disassociate.
  Future<DisassociateSourceViewsResponse> disassociateSourceViews({
    required String arn,
    required List<String> sourceViews,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.DisassociateSourceViews'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        'sourceViews': sourceViews,
      },
    );

    return DisassociateSourceViewsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves billing preferences for the specified feature. Each feature
  /// controls a distinct billing capability: which accounts can share Reserved
  /// Instances or credits, whether billing alerts are enabled, the historical
  /// record of sharing changes, and per-credit options.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [features] :
  /// The feature to retrieve. Specify exactly one value. Valid values:
  /// <code>BILLING_ALERTS</code>, <code>RI_SHARING</code>,
  /// <code>RI_SHARING_HISTORY</code>, <code>CREDIT_SHARING</code>,
  /// <code>CREDIT_SHARING_HISTORY</code>, <code>CREDIT_LEVEL_SHARING</code>,
  /// <code>CREDIT_PREFERENCE_OPTIONS</code>.
  ///
  /// Parameter [filters] :
  /// Filters to narrow results. Specify exactly one filter when supplied. The
  /// supported filter name is <code>PREFERENCE_KEY</code>, which accepts 1 to
  /// 10 values to match preference keys.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to return per page. Range: 1 to 50. Default:
  /// 50.
  ///
  /// Parameter [nextToken] :
  /// Pagination token from a previous response. Pass the value returned in
  /// <code>nextToken</code> to retrieve the next page of results.
  Future<GetBillingPreferencesResponse> getBillingPreferences({
    required List<BillingFeature> features,
    List<BillingFeatureFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetBillingPreferences'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'features': features.map((e) => e.value).toList(),
        if (filters != null) 'filters': filters,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetBillingPreferencesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the metadata associated to the specified billing view ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  Future<GetBillingViewResponse> getBillingView({
    required String arn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
      },
    );

    return GetBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Returns the per-billing-month allocation history for credits applied to an
  /// Amazon Web Services account's bills. Traverses the consolidated billing
  /// family to capture cross-account credit applications. Supports pagination
  /// and optional filtering to a single credit.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID whose allocation history to retrieve.
  /// Must be a 12-digit numeric string.
  ///
  /// Parameter [endDate] :
  /// Inclusive end date as Unix epoch seconds.
  ///
  /// Parameter [startDate] :
  /// Inclusive start date as Unix epoch seconds. Must be on or before
  /// <code>endDate</code>. The range from <code>startDate</code> to
  /// <code>endDate</code> cannot exceed 24 billing months.
  ///
  /// Parameter [creditId] :
  /// Filters the result to a single credit. When omitted, returns allocation
  /// entries for all credits.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to return per page. Range: 1 to 1000.
  /// Default: 100.
  ///
  /// Parameter [nextToken] :
  /// Pagination token from a previous response. Pass the value returned in
  /// <code>nextToken</code> to retrieve the next page of results.
  Future<GetCreditAllocationHistoryResponse> getCreditAllocationHistory({
    required String accountId,
    required DateTime endDate,
    required DateTime startDate,
    int? creditId,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetCreditAllocationHistory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accountId': accountId,
        'endDate': unixTimestampToJson(endDate),
        'startDate': unixTimestampToJson(startDate),
        if (creditId != null) 'creditId': creditId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetCreditAllocationHistoryResponse.fromJson(jsonResponse.body);
  }

  /// Returns the list of Amazon Web Services account credits for the specified
  /// account. Each credit includes its identifier, type, monetary amounts,
  /// applicable products, expiration, sharing configuration, and current
  /// enabled status.
  ///
  /// When the caller is the management account of a consolidated billing family
  /// and <code>payerAccountFlag</code> is <code>true</code>, the response
  /// aggregates credits across the entire family. Otherwise, the response
  /// includes only credits owned by the account specified in
  /// <code>accountId</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Web Services account ID. Must be a 12-digit numeric string.
  ///
  /// Parameter [startDate] :
  /// The start date for the credit period as Unix epoch seconds. Must be a past
  /// date that is not more than one year before the current date.
  ///
  /// Parameter [endDate] :
  /// The end date for the credit period as Unix epoch seconds. Must not be a
  /// future date and must be on or after <code>startDate</code>. Defaults to
  /// the current date when omitted.
  ///
  /// Parameter [payerAccountFlag] :
  /// When <code>true</code> and the caller is the management account, the
  /// response aggregates credits across the entire consolidated billing family.
  /// When <code>false</code> or omitted, returns only credits for the specified
  /// <code>accountId</code>.
  Future<GetCreditsResponse> getCredits({
    required String accountId,
    required DateTime startDate,
    DateTime? endDate,
    bool? payerAccountFlag,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetCredits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'accountId': accountId,
        'startDate': unixTimestampToJson(startDate),
        if (endDate != null) 'endDate': unixTimestampToJson(endDate),
        if (payerAccountFlag != null) 'payerAccountFlag': payerAccountFlag,
      },
    );

    return GetCreditsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a summary of Enterprise Support data aggregated across all
  /// accounts in the Enterprise Support profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [billingMonth] :
  /// The billing month in YYYY-MM format. This must be a month in the past.
  Future<GetEnterpriseSupportChargeSummaryResponse>
      getEnterpriseSupportChargeSummary({
    required String billingMonth,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetEnterpriseSupportChargeSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billingMonth': billingMonth,
      },
    );

    return GetEnterpriseSupportChargeSummaryResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns Enterprise Support contract details.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [billingMonth] :
  /// The billing month in YYYY-MM format. This must be a month in the past.
  Future<GetEnterpriseSupportContractDetailsResponse>
      getEnterpriseSupportContractDetails({
    required String billingMonth,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetEnterpriseSupportContractDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billingMonth': billingMonth,
      },
    );

    return GetEnterpriseSupportContractDetailsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the resource-based policy document attached to the resource in
  /// <code>JSON</code> format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the billing view resource to which the
  /// policy is attached to.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.GetResourcePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return GetResourcePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Lists the billing views available for a given time period.
  ///
  /// Every Amazon Web Services account has a unique <code>PRIMARY</code>
  /// billing view that represents the billing data available by default.
  /// Accounts that use Billing Conductor also have <code>BILLING_GROUP</code>
  /// billing views representing pro forma costs associated with each created
  /// billing group.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [activeTimeRange] :
  /// The time range for the billing views listed. <code>PRIMARY</code> billing
  /// view is always listed. <code>BILLING_GROUP</code> billing views are listed
  /// for time ranges when the associated billing group resource in Billing
  /// Conductor is active. The time range must be within one calendar month.
  ///
  /// Parameter [arns] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [billingViewTypes] :
  /// The type of billing view.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of billing views to retrieve. Default is 100.
  ///
  /// Parameter [names] :
  /// Filters the list of billing views by name. You can specify search criteria
  /// to match billing view names based on the search option provided.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that is used on subsequent calls to list billing
  /// views.
  ///
  /// Parameter [ownerAccountId] :
  /// The list of owners of the billing view.
  ///
  /// Parameter [sourceAccountId] :
  /// Filters the results to include only billing views that use the specified
  /// account as a source.
  Future<ListBillingViewsResponse> listBillingViews({
    ActiveTimeRange? activeTimeRange,
    List<String>? arns,
    List<BillingViewType>? billingViewTypes,
    int? maxResults,
    List<StringSearch>? names,
    String? nextToken,
    String? ownerAccountId,
    String? sourceAccountId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.ListBillingViews'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (activeTimeRange != null) 'activeTimeRange': activeTimeRange,
        if (arns != null) 'arns': arns,
        if (billingViewTypes != null)
          'billingViewTypes': billingViewTypes.map((e) => e.value).toList(),
        if (maxResults != null) 'maxResults': maxResults,
        if (names != null) 'names': names,
        if (nextToken != null) 'nextToken': nextToken,
        if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
        if (sourceAccountId != null) 'sourceAccountId': sourceAccountId,
      },
    );

    return ListBillingViewsResponse.fromJson(jsonResponse.body);
  }

  /// Returns Support-eligible spend broken down at linked account level.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [billingMonth] :
  /// The billing month in YYYY-MM format. This must be a month in the past.
  ///
  /// Parameter [accountId] :
  /// An optional linked account ID to filter results to a specific account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per page.
  ///
  /// Parameter [nextToken] :
  /// The pagination token for the next page of results.
  Future<ListEnterpriseSupportLinkedAccountChargesResponse>
      listEnterpriseSupportLinkedAccountCharges({
    required String billingMonth,
    String? accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.ListEnterpriseSupportLinkedAccountCharges'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billingMonth': billingMonth,
        if (accountId != null) 'accountId': accountId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListEnterpriseSupportLinkedAccountChargesResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists the source views (managed Amazon Web Services billing views)
  /// associated with the billing view.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [maxResults] :
  /// The number of entries a paginated response contains.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that is used on subsequent calls to list billing
  /// views.
  Future<ListSourceViewsForBillingViewResponse> listSourceViewsForBillingView({
    required String arn,
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
      'X-Amz-Target': 'AWSBilling.ListSourceViewsForBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListSourceViewsForBillingViewResponse.fromJson(jsonResponse.body);
  }

  /// Lists tags associated with the billing view resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Redeems an Amazon Web Services promotional credit code on behalf of the
  /// calling account. On success, a new credit is added to the account's credit
  /// ledger with the amount, validity period, and applicable products defined
  /// by the promotion. The credit is then automatically applied to subsequent
  /// bills according to the standard credit application order.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [promoCode] :
  /// The promotional credit code to redeem.
  Future<void> redeemCredits({
    required String promoCode,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.RedeemCredits'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'promoCode': promoCode,
      },
    );
  }

  /// An API operation for adding one or more tags (key-value pairs) to a
  /// resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [resourceTags] :
  /// A list of tag key value pairs that are associated with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<ResourceTag> resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'resourceTags': resourceTags,
      },
    );
  }

  /// Removes one or more tags from a resource. Specify only tag keys in your
  /// request. Don't specify the value.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [resourceTagKeys] :
  /// A list of tag key value pairs that are associated with the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> resourceTagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'resourceTagKeys': resourceTagKeys,
      },
    );
  }

  /// Updates billing preferences for the specified feature. Each feature
  /// targets a distinct billing capability and has its own set of supported
  /// keys. The action sets the value for each provided key; keys not present in
  /// the request are unchanged.
  ///
  /// Sharing keys (<code>RI_SHARING</code>, <code>CREDIT_SHARING</code>,
  /// <code>CREDIT_LEVEL_SHARING</code>, and sharing keys under
  /// <code>CREDIT_PREFERENCE_OPTIONS</code>) may only be set by the management
  /// account of a consolidated billing family. The
  /// <code>credit/{creditId}/status</code> key may be set by member accounts
  /// for credits they own, or by the management account for any credit in the
  /// family.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [billingPreferencesPerKey] :
  /// Key/value pairs to apply. All keys in a single request must be valid for
  /// the specified <code>feature</code> and must not be duplicated. For
  /// <code>CREDIT_PREFERENCE_OPTIONS</code>, all keys must reference the same
  /// <code>creditId</code>.
  ///
  /// Parameter [feature] :
  /// The feature to update. Valid values: <code>BILLING_ALERTS</code>,
  /// <code>RI_SHARING</code>, <code>CREDIT_SHARING</code>,
  /// <code>CREDIT_LEVEL_SHARING</code>, <code>CREDIT_PREFERENCE_OPTIONS</code>.
  /// The history features (<code>RI_SHARING_HISTORY</code> and
  /// <code>CREDIT_SHARING_HISTORY</code>) are read-only and cannot be updated.
  Future<void> updateBillingPreferences({
    required List<BillingPreferenceForKey> billingPreferencesPerKey,
    required BillingFeature feature,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.UpdateBillingPreferences'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'billingPreferencesPerKey': billingPreferencesPerKey,
        'feature': feature.value,
      },
    );
  }

  /// An API to update the attributes of the billing view.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BillingViewHealthStatusException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  ///
  /// Parameter [dataFilterExpression] :
  /// See <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
  /// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
  /// and <code>CostCategories</code>.
  ///
  /// Parameter [description] :
  /// The description of the billing view.
  ///
  /// Parameter [name] :
  /// The name of the billing view.
  Future<UpdateBillingViewResponse> updateBillingView({
    required String arn,
    Expression? dataFilterExpression,
    String? description,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSBilling.UpdateBillingView'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'arn': arn,
        if (dataFilterExpression != null)
          'dataFilterExpression': dataFilterExpression,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
      },
    );

    return UpdateBillingViewResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class AssociateSourceViewsResponse {
  /// The ARN of the billing view that the source views were associated with.
  final String arn;

  AssociateSourceViewsResponse({
    required this.arn,
  });

  factory AssociateSourceViewsResponse.fromJson(Map<String, dynamic> json) {
    return AssociateSourceViewsResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class CreateBillingViewResponse {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String arn;

  /// The time when the billing view was created.
  final DateTime? createdAt;

  CreateBillingViewResponse({
    required this.arn,
    this.createdAt,
  });

  factory CreateBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return CreateBillingViewResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    return {
      'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
    };
  }
}

/// @nodoc
class DeleteBillingViewResponse {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String arn;

  DeleteBillingViewResponse({
    required this.arn,
  });

  factory DeleteBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBillingViewResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class DisassociateSourceViewsResponse {
  /// The ARN of the billing view that the source views were disassociated from.
  final String arn;

  DisassociateSourceViewsResponse({
    required this.arn,
  });

  factory DisassociateSourceViewsResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateSourceViewsResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

/// @nodoc
class GetBillingPreferencesResponse {
  /// The list of preference entries matching the request.
  final List<BillingPreferenceSummary> billingPreferences;

  /// Pagination token. Present when more pages are available; <code>null</code>
  /// when there are no more results.
  final String? nextToken;

  GetBillingPreferencesResponse({
    required this.billingPreferences,
    this.nextToken,
  });

  factory GetBillingPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return GetBillingPreferencesResponse(
      billingPreferences: ((json['billingPreferences'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BillingPreferenceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingPreferences = this.billingPreferences;
    final nextToken = this.nextToken;
    return {
      'billingPreferences': billingPreferences,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetBillingViewResponse {
  /// The billing view element associated with the specified ARN.
  final BillingViewElement billingView;

  GetBillingViewResponse({
    required this.billingView,
  });

  factory GetBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return GetBillingViewResponse(
      billingView: BillingViewElement.fromJson(
          (json['billingView'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final billingView = this.billingView;
    return {
      'billingView': billingView,
    };
  }
}

/// @nodoc
class GetCreditAllocationHistoryResponse {
  /// <code>true</code> when data could not be retrieved for one or more billing
  /// months. The <code>failedMonths</code> field lists which months are missing.
  final bool partialResults;

  /// Allocation entries sorted by <code>billingMonth</code> in descending order.
  final List<CreditAllocationHistoryEntry>? creditAllocationHistoryList;

  /// Billing months in <code>YYYY-MM</code> format that failed to return data.
  /// Non-empty only when <code>partialResults</code> is <code>true</code>.
  final List<String>? failedMonths;

  /// Pagination token. Present when more pages are available; <code>null</code>
  /// when there are no more results.
  final String? nextToken;

  GetCreditAllocationHistoryResponse({
    required this.partialResults,
    this.creditAllocationHistoryList,
    this.failedMonths,
    this.nextToken,
  });

  factory GetCreditAllocationHistoryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCreditAllocationHistoryResponse(
      partialResults: (json['partialResults'] as bool?) ?? false,
      creditAllocationHistoryList: (json['creditAllocationHistoryList']
              as List?)
          ?.nonNulls
          .map((e) =>
              CreditAllocationHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedMonths: (json['failedMonths'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final partialResults = this.partialResults;
    final creditAllocationHistoryList = this.creditAllocationHistoryList;
    final failedMonths = this.failedMonths;
    final nextToken = this.nextToken;
    return {
      'partialResults': partialResults,
      if (creditAllocationHistoryList != null)
        'creditAllocationHistoryList': creditAllocationHistoryList,
      if (failedMonths != null) 'failedMonths': failedMonths,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetCreditsResponse {
  /// The list of credits matching the request. Returns an empty list when no
  /// credits exist.
  final List<CreditData>? credits;

  GetCreditsResponse({
    this.credits,
  });

  factory GetCreditsResponse.fromJson(Map<String, dynamic> json) {
    return GetCreditsResponse(
      credits: (json['credits'] as List?)
          ?.nonNulls
          .map((e) => CreditData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final credits = this.credits;
    return {
      if (credits != null) 'credits': credits,
    };
  }
}

/// The response structure for GetEnterpriseSupportChargeSummary.
///
/// @nodoc
class GetEnterpriseSupportChargeSummaryResponse {
  /// The date the bill was generated.
  final DateTime billDate;

  /// The billing month in YYYY-MM format. This must be a month in the past.
  final String billingMonth;

  /// The end date of the billing period.
  final DateTime billingPeriodEndDate;

  /// The start date of the billing period.
  final DateTime billingPeriodStartDate;

  /// When true, the Support charge amount is estimated. When false, the Support
  /// charge amount is finalized.
  final bool isEstimated;

  /// The payer account ID that is authorized to view Enterprise Support data for
  /// all accounts in its Support profile.
  final String payerAccountId;

  /// The Support charge amount for the account.
  final String supportCharge;

  /// The percentage applied to the total Support-eligible spend to calculate the
  /// total Support charge across all accounts in the Support profile.
  final String supportChargePercentage;

  /// The support discount amount.
  final String supportDiscount;

  /// The effective pricing plan used for the support charge calculation.
  final PricingPlan supportEffectivePricingPlan;

  /// The total Support charge amount for all accounts in the Support profile.
  final String totalSupportCharge;

  /// The total Support-eligible Reserved Instance spend from all accounts in the
  /// Support profile.
  final String totalSupportEligibleReservedInstanceSpend;

  /// The total Support-eligible Savings Plan spend from all accounts in the
  /// Support profile.
  final String totalSupportEligibleSavingsPlanSpend;

  /// The total Support-eligible Spend from all accounts in the Support profile.
  /// This includes eligible spend from usage of Amazon Web Services, Reserved
  /// Instances, and Savings Plans.
  final String totalSupportEligibleSpend;

  /// The total Support-eligible spend from usage of Amazon Web Services from all
  /// accounts in the Support profile.
  final String totalSupportEligibleUsageSpend;

  GetEnterpriseSupportChargeSummaryResponse({
    required this.billDate,
    required this.billingMonth,
    required this.billingPeriodEndDate,
    required this.billingPeriodStartDate,
    required this.isEstimated,
    required this.payerAccountId,
    required this.supportCharge,
    required this.supportChargePercentage,
    required this.supportDiscount,
    required this.supportEffectivePricingPlan,
    required this.totalSupportCharge,
    required this.totalSupportEligibleReservedInstanceSpend,
    required this.totalSupportEligibleSavingsPlanSpend,
    required this.totalSupportEligibleSpend,
    required this.totalSupportEligibleUsageSpend,
  });

  factory GetEnterpriseSupportChargeSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEnterpriseSupportChargeSummaryResponse(
      billDate: nonNullableTimeStampFromJson(json['billDate'] ?? 0),
      billingMonth: (json['billingMonth'] as String?) ?? '',
      billingPeriodEndDate:
          nonNullableTimeStampFromJson(json['billingPeriodEndDate'] ?? 0),
      billingPeriodStartDate:
          nonNullableTimeStampFromJson(json['billingPeriodStartDate'] ?? 0),
      isEstimated: (json['isEstimated'] as bool?) ?? false,
      payerAccountId: (json['payerAccountId'] as String?) ?? '',
      supportCharge: (json['supportCharge'] as String?) ?? '',
      supportChargePercentage:
          (json['supportChargePercentage'] as String?) ?? '',
      supportDiscount: (json['supportDiscount'] as String?) ?? '',
      supportEffectivePricingPlan: PricingPlan.fromJson(
          (json['supportEffectivePricingPlan'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      totalSupportCharge: (json['totalSupportCharge'] as String?) ?? '',
      totalSupportEligibleReservedInstanceSpend:
          (json['totalSupportEligibleReservedInstanceSpend'] as String?) ?? '',
      totalSupportEligibleSavingsPlanSpend:
          (json['totalSupportEligibleSavingsPlanSpend'] as String?) ?? '',
      totalSupportEligibleSpend:
          (json['totalSupportEligibleSpend'] as String?) ?? '',
      totalSupportEligibleUsageSpend:
          (json['totalSupportEligibleUsageSpend'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final billDate = this.billDate;
    final billingMonth = this.billingMonth;
    final billingPeriodEndDate = this.billingPeriodEndDate;
    final billingPeriodStartDate = this.billingPeriodStartDate;
    final isEstimated = this.isEstimated;
    final payerAccountId = this.payerAccountId;
    final supportCharge = this.supportCharge;
    final supportChargePercentage = this.supportChargePercentage;
    final supportDiscount = this.supportDiscount;
    final supportEffectivePricingPlan = this.supportEffectivePricingPlan;
    final totalSupportCharge = this.totalSupportCharge;
    final totalSupportEligibleReservedInstanceSpend =
        this.totalSupportEligibleReservedInstanceSpend;
    final totalSupportEligibleSavingsPlanSpend =
        this.totalSupportEligibleSavingsPlanSpend;
    final totalSupportEligibleSpend = this.totalSupportEligibleSpend;
    final totalSupportEligibleUsageSpend = this.totalSupportEligibleUsageSpend;
    return {
      'billDate': unixTimestampToJson(billDate),
      'billingMonth': billingMonth,
      'billingPeriodEndDate': unixTimestampToJson(billingPeriodEndDate),
      'billingPeriodStartDate': unixTimestampToJson(billingPeriodStartDate),
      'isEstimated': isEstimated,
      'payerAccountId': payerAccountId,
      'supportCharge': supportCharge,
      'supportChargePercentage': supportChargePercentage,
      'supportDiscount': supportDiscount,
      'supportEffectivePricingPlan': supportEffectivePricingPlan,
      'totalSupportCharge': totalSupportCharge,
      'totalSupportEligibleReservedInstanceSpend':
          totalSupportEligibleReservedInstanceSpend,
      'totalSupportEligibleSavingsPlanSpend':
          totalSupportEligibleSavingsPlanSpend,
      'totalSupportEligibleSpend': totalSupportEligibleSpend,
      'totalSupportEligibleUsageSpend': totalSupportEligibleUsageSpend,
    };
  }
}

/// The response structure for GetEnterpriseSupportContractDetails.
///
/// @nodoc
class GetEnterpriseSupportContractDetailsResponse {
  /// The list of payer accounts and their charge allocation percentages.
  final List<ChargeAccount> chargedPayerAccountIds;

  /// The list of accounts covered by the Enterprise Support contract.
  final List<ContractAccount> contractPayerAccountIds;

  /// The pricing plans associated with this Enterprise Support contract.
  final List<PricingPlan> pricingPlans;

  /// The method used to distribute the total Support charge amount across each
  /// account in the Support profile. Valid values: Proportional,
  /// Fixed_Percentage. Proportional means support charges are distributed to each
  /// account in proportion to its eligible Spend. Fixed_Percentage means support
  /// charges are distributed across accounts according to pre-configured
  /// percentages from the contract.
  final String supportAllocationMethod;

  /// Any Additional support charges applied to the contract.
  final List<AdditionalCharge>? additionalSupportCharge;

  /// Any Additional support-eligible usage spend charges.
  final List<AdditionalCharge>? additionalSupportEligibleUsageSpend;

  /// When true, the Enterprise Support contract is active. When false, the
  /// Enterprise Support Contract is inactive.
  final bool? isContractActive;

  /// The start date for accounts subscribed or unsubscribed to Support billing
  /// during the billing month.
  final DateTime? supportProrateStartDate;

  /// When supportReservedInstanceTreatmentMethod = AmortizedCustom, only
  /// amortized fees for Reserved Instances purchased on or after this date are
  /// included in the calculation. This field is Null for all other treatment
  /// methods.
  final DateTime? supportReservedInstanceAmortizationStartDate;

  /// The method used to include Reserved Instance (RI) fees in the Enterprise
  /// Support charge calculation. Valid values: None (RI fees excluded from
  /// Support-eligible spend), Upfront (full upfront RI fees included in month of
  /// purchase), Amortized (RI fees spread over commitment term for RIs purchased
  /// on or after Support subscription start date), AmortizedCustom (same as
  /// Amortized but only for RIs purchased on or after a specified custom start
  /// date), AmortizedAll (RI fees amortized for all active RIs including those
  /// purchased before Support subscription started).
  final String? supportReservedInstanceTreatmentMethod;

  /// This is applicable when supportSavingsPlansTreatmentMethod = Amortized and
  /// is Null for all other methods. It shows the start date from which Savings
  /// Plan fees are included in Support Eligible Spend.
  final DateTime? supportSavingsPlansAmortizationStartDate;

  /// The method used to include Savings Plans fees in Enterprise Support charge
  /// calculations. Valid values: None (Savings Plan fees excluded from
  /// Support-eligible spend), Upfront (full upfront Savings Plan fees included in
  /// month of purchase), Amortized (Savings Plan fees spread over commitment term
  /// for Savings Plans purchased on or after Support subscription start date),
  /// AmortizedCustom (same as Amortized but only for Savings Plans purchased on
  /// or after a specified custom start date), AmortizedAll (Savings Plan fees
  /// amortized for all active Savings Plans including those purchased before
  /// Support subscription started).
  final String? supportSavingsPlansTreatmentMethod;

  GetEnterpriseSupportContractDetailsResponse({
    required this.chargedPayerAccountIds,
    required this.contractPayerAccountIds,
    required this.pricingPlans,
    required this.supportAllocationMethod,
    this.additionalSupportCharge,
    this.additionalSupportEligibleUsageSpend,
    this.isContractActive,
    this.supportProrateStartDate,
    this.supportReservedInstanceAmortizationStartDate,
    this.supportReservedInstanceTreatmentMethod,
    this.supportSavingsPlansAmortizationStartDate,
    this.supportSavingsPlansTreatmentMethod,
  });

  factory GetEnterpriseSupportContractDetailsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEnterpriseSupportContractDetailsResponse(
      chargedPayerAccountIds:
          ((json['chargedPayerAccountIds'] as List?) ?? const [])
              .nonNulls
              .map((e) => ChargeAccount.fromJson(e as Map<String, dynamic>))
              .toList(),
      contractPayerAccountIds:
          ((json['contractPayerAccountIds'] as List?) ?? const [])
              .nonNulls
              .map((e) => ContractAccount.fromJson(e as Map<String, dynamic>))
              .toList(),
      pricingPlans: ((json['pricingPlans'] as List?) ?? const [])
          .nonNulls
          .map((e) => PricingPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportAllocationMethod:
          (json['supportAllocationMethod'] as String?) ?? '',
      additionalSupportCharge: (json['additionalSupportCharge'] as List?)
          ?.nonNulls
          .map((e) => AdditionalCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      additionalSupportEligibleUsageSpend:
          (json['additionalSupportEligibleUsageSpend'] as List?)
              ?.nonNulls
              .map((e) => AdditionalCharge.fromJson(e as Map<String, dynamic>))
              .toList(),
      isContractActive: json['isContractActive'] as bool?,
      supportProrateStartDate:
          timeStampFromJson(json['supportProrateStartDate']),
      supportReservedInstanceAmortizationStartDate: timeStampFromJson(
          json['supportReservedInstanceAmortizationStartDate']),
      supportReservedInstanceTreatmentMethod:
          json['supportReservedInstanceTreatmentMethod'] as String?,
      supportSavingsPlansAmortizationStartDate:
          timeStampFromJson(json['supportSavingsPlansAmortizationStartDate']),
      supportSavingsPlansTreatmentMethod:
          json['supportSavingsPlansTreatmentMethod'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final chargedPayerAccountIds = this.chargedPayerAccountIds;
    final contractPayerAccountIds = this.contractPayerAccountIds;
    final pricingPlans = this.pricingPlans;
    final supportAllocationMethod = this.supportAllocationMethod;
    final additionalSupportCharge = this.additionalSupportCharge;
    final additionalSupportEligibleUsageSpend =
        this.additionalSupportEligibleUsageSpend;
    final isContractActive = this.isContractActive;
    final supportProrateStartDate = this.supportProrateStartDate;
    final supportReservedInstanceAmortizationStartDate =
        this.supportReservedInstanceAmortizationStartDate;
    final supportReservedInstanceTreatmentMethod =
        this.supportReservedInstanceTreatmentMethod;
    final supportSavingsPlansAmortizationStartDate =
        this.supportSavingsPlansAmortizationStartDate;
    final supportSavingsPlansTreatmentMethod =
        this.supportSavingsPlansTreatmentMethod;
    return {
      'chargedPayerAccountIds': chargedPayerAccountIds,
      'contractPayerAccountIds': contractPayerAccountIds,
      'pricingPlans': pricingPlans,
      'supportAllocationMethod': supportAllocationMethod,
      if (additionalSupportCharge != null)
        'additionalSupportCharge': additionalSupportCharge,
      if (additionalSupportEligibleUsageSpend != null)
        'additionalSupportEligibleUsageSpend':
            additionalSupportEligibleUsageSpend,
      if (isContractActive != null) 'isContractActive': isContractActive,
      if (supportProrateStartDate != null)
        'supportProrateStartDate': unixTimestampToJson(supportProrateStartDate),
      if (supportReservedInstanceAmortizationStartDate != null)
        'supportReservedInstanceAmortizationStartDate':
            unixTimestampToJson(supportReservedInstanceAmortizationStartDate),
      if (supportReservedInstanceTreatmentMethod != null)
        'supportReservedInstanceTreatmentMethod':
            supportReservedInstanceTreatmentMethod,
      if (supportSavingsPlansAmortizationStartDate != null)
        'supportSavingsPlansAmortizationStartDate':
            unixTimestampToJson(supportSavingsPlansAmortizationStartDate),
      if (supportSavingsPlansTreatmentMethod != null)
        'supportSavingsPlansTreatmentMethod':
            supportSavingsPlansTreatmentMethod,
    };
  }
}

/// @nodoc
class GetResourcePolicyResponse {
  /// The Amazon Resource Name (ARN) of the billing view resource to which the
  /// policy is attached to.
  final String resourceArn;

  /// The resource-based policy document attached to the resource in
  /// <code>JSON</code> format.
  final String? policy;

  GetResourcePolicyResponse({
    required this.resourceArn,
    this.policy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      resourceArn: (json['resourceArn'] as String?) ?? '',
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final policy = this.policy;
    return {
      'resourceArn': resourceArn,
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class ListBillingViewsResponse {
  /// A list of <code>BillingViewListElement</code> retrieved.
  final List<BillingViewListElement> billingViews;

  /// The pagination token to use on subsequent calls to list billing views.
  final String? nextToken;

  ListBillingViewsResponse({
    required this.billingViews,
    this.nextToken,
  });

  factory ListBillingViewsResponse.fromJson(Map<String, dynamic> json) {
    return ListBillingViewsResponse(
      billingViews: ((json['billingViews'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => BillingViewListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingViews = this.billingViews;
    final nextToken = this.nextToken;
    return {
      'billingViews': billingViews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The response structure for ListEnterpriseSupportLinkedAccountCharges.
///
/// @nodoc
class ListEnterpriseSupportLinkedAccountChargesResponse {
  /// The list of Enterprise Support charges per linked account.
  final List<LinkedAccountCharge> linkedAccount;

  /// The pagination token for the next page of results.
  final String? nextToken;

  ListEnterpriseSupportLinkedAccountChargesResponse({
    required this.linkedAccount,
    this.nextToken,
  });

  factory ListEnterpriseSupportLinkedAccountChargesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEnterpriseSupportLinkedAccountChargesResponse(
      linkedAccount: ((json['linkedAccount'] as List?) ?? const [])
          .nonNulls
          .map((e) => LinkedAccountCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final linkedAccount = this.linkedAccount;
    final nextToken = this.nextToken;
    return {
      'linkedAccount': linkedAccount,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSourceViewsForBillingViewResponse {
  /// A list of billing views used as the data source for the custom billing view.
  final List<String> sourceViews;

  /// The pagination token that is used on subsequent calls to list billing views.
  final String? nextToken;

  ListSourceViewsForBillingViewResponse({
    required this.sourceViews,
    this.nextToken,
  });

  factory ListSourceViewsForBillingViewResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSourceViewsForBillingViewResponse(
      sourceViews: ((json['sourceViews'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceViews = this.sourceViews;
    final nextToken = this.nextToken;
    return {
      'sourceViews': sourceViews,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// A list of tag key value pairs that are associated with the resource.
  final List<ResourceTag>? resourceTags;

  ListTagsForResourceResponse({
    this.resourceTags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
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

/// @nodoc
class RedeemCreditsResponse {
  RedeemCreditsResponse();

  factory RedeemCreditsResponse.fromJson(Map<String, dynamic> _) {
    return RedeemCreditsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
class UpdateBillingPreferencesResponse {
  UpdateBillingPreferencesResponse();

  factory UpdateBillingPreferencesResponse.fromJson(Map<String, dynamic> _) {
    return UpdateBillingPreferencesResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateBillingViewResponse {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String arn;

  /// The time when the billing view was last updated.
  final DateTime? updatedAt;

  UpdateBillingViewResponse({
    required this.arn,
    this.updatedAt,
  });

  factory UpdateBillingViewResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBillingViewResponse(
      arn: (json['arn'] as String?) ?? '',
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final updatedAt = this.updatedAt;
    return {
      'arn': arn,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// See <a
/// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
/// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
/// and <code>CostCategories</code>.
///
/// @nodoc
class Expression {
  /// The filter that's based on <code>CostCategory</code> values.
  final CostCategoryValues? costCategories;

  /// The specific <code>Dimension</code> to use for <code>Expression</code>.
  final DimensionValues? dimensions;

  /// The specific <code>Tag</code> to use for <code>Expression</code>.
  final TagValues? tags;

  /// Specifies a time range filter for the billing view data.
  final TimeRange? timeRange;

  Expression({
    this.costCategories,
    this.dimensions,
    this.tags,
    this.timeRange,
  });

  factory Expression.fromJson(Map<String, dynamic> json) {
    return Expression(
      costCategories: json['costCategories'] != null
          ? CostCategoryValues.fromJson(
              json['costCategories'] as Map<String, dynamic>)
          : null,
      dimensions: json['dimensions'] != null
          ? DimensionValues.fromJson(json['dimensions'] as Map<String, dynamic>)
          : null,
      tags: json['tags'] != null
          ? TagValues.fromJson(json['tags'] as Map<String, dynamic>)
          : null,
      timeRange: json['timeRange'] != null
          ? TimeRange.fromJson(json['timeRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final costCategories = this.costCategories;
    final dimensions = this.dimensions;
    final tags = this.tags;
    final timeRange = this.timeRange;
    return {
      if (costCategories != null) 'costCategories': costCategories,
      if (dimensions != null) 'dimensions': dimensions,
      if (tags != null) 'tags': tags,
      if (timeRange != null) 'timeRange': timeRange,
    };
  }
}

/// The metadata that you can use to filter and group your results.
///
/// @nodoc
class DimensionValues {
  /// The names of the metadata types that you can use to filter and group your
  /// results.
  final Dimension key;

  /// The metadata values that you can use to filter and group your results.
  final List<String> values;

  DimensionValues({
    required this.key,
    required this.values,
  });

  factory DimensionValues.fromJson(Map<String, dynamic> json) {
    return DimensionValues(
      key: Dimension.fromString((json['key'] as String?) ?? ''),
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key.value,
      'values': values,
    };
  }
}

/// The values that are available for a tag.
///
/// @nodoc
class TagValues {
  /// The key for the tag.
  final String key;

  /// The specific value of the tag.
  final List<String> values;

  TagValues({
    required this.key,
    required this.values,
  });

  factory TagValues.fromJson(Map<String, dynamic> json) {
    return TagValues(
      key: (json['key'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key,
      'values': values,
    };
  }
}

/// The Cost Categories values used for filtering the costs.
///
/// @nodoc
class CostCategoryValues {
  /// The unique name of the Cost Category.
  final String key;

  /// The specific value of the Cost Category.
  final List<String> values;

  CostCategoryValues({
    required this.key,
    required this.values,
  });

  factory CostCategoryValues.fromJson(Map<String, dynamic> json) {
    return CostCategoryValues(
      key: (json['key'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final values = this.values;
    return {
      'key': key,
      'values': values,
    };
  }
}

/// Specifies a time range with inclusive begin and end dates.
///
/// @nodoc
class TimeRange {
  /// The inclusive start date of the time range.
  final DateTime? beginDateInclusive;

  /// The inclusive end date of the time range.
  final DateTime? endDateInclusive;

  TimeRange({
    this.beginDateInclusive,
    this.endDateInclusive,
  });

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      beginDateInclusive: timeStampFromJson(json['beginDateInclusive']),
      endDateInclusive: timeStampFromJson(json['endDateInclusive']),
    );
  }

  Map<String, dynamic> toJson() {
    final beginDateInclusive = this.beginDateInclusive;
    final endDateInclusive = this.endDateInclusive;
    return {
      if (beginDateInclusive != null)
        'beginDateInclusive': unixTimestampToJson(beginDateInclusive),
      if (endDateInclusive != null)
        'endDateInclusive': unixTimestampToJson(endDateInclusive),
    };
  }
}

/// @nodoc
class Dimension {
  static const linkedAccount = Dimension._('LINKED_ACCOUNT');

  final String value;

  const Dimension._(this.value);

  static const values = [linkedAccount];

  static Dimension fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Dimension._(value));

  @override
  bool operator ==(other) => other is Dimension && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BillingFeature {
  static const riSharing = BillingFeature._('RI_SHARING');
  static const riSharingHistory = BillingFeature._('RI_SHARING_HISTORY');
  static const creditSharing = BillingFeature._('CREDIT_SHARING');
  static const creditSharingHistory =
      BillingFeature._('CREDIT_SHARING_HISTORY');
  static const creditLevelSharing = BillingFeature._('CREDIT_LEVEL_SHARING');
  static const billingAlerts = BillingFeature._('BILLING_ALERTS');
  static const creditPreferenceOptions =
      BillingFeature._('CREDIT_PREFERENCE_OPTIONS');

  final String value;

  const BillingFeature._(this.value);

  static const values = [
    riSharing,
    riSharingHistory,
    creditSharing,
    creditSharingHistory,
    creditLevelSharing,
    billingAlerts,
    creditPreferenceOptions
  ];

  static BillingFeature fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingFeature._(value));

  @override
  bool operator ==(other) => other is BillingFeature && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single key/value entry used to update a billing preference.
///
/// @nodoc
class BillingPreferenceForKey {
  /// The preference key. Format depends on the feature being updated.
  final String key;

  /// The preference value. Valid values: <code>ENABLED</code> or
  /// <code>DISABLED</code>.
  final PreferenceValue value;

  BillingPreferenceForKey({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value.value,
    };
  }
}

/// @nodoc
class PreferenceValue {
  static const enabled = PreferenceValue._('ENABLED');
  static const disabled = PreferenceValue._('DISABLED');

  final String value;

  const PreferenceValue._(this.value);

  static const values = [enabled, disabled];

  static PreferenceValue fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PreferenceValue._(value));

  @override
  bool operator ==(other) => other is PreferenceValue && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tag structure that contains a tag key and value.
///
/// @nodoc
class ResourceTag {
  /// The key that's associated with the tag.
  final String key;

  /// The value that's associated with the tag.
  final String? value;

  ResourceTag({
    required this.key,
    this.value,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      key: (json['key'] as String?) ?? '',
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

/// Enterprise Support charges for a linked account.
///
/// @nodoc
class LinkedAccountCharge {
  /// The linked account ID.
  final String accountId;

  /// The number of billable seconds in the billing period based on when the
  /// account was subscribed to Enterprise Support.
  final int billableSeconds;

  /// The payer account ID that is authorized to view Enterprise Support data for
  /// all accounts in its Support profile.
  final String payerAccountId;

  /// The prorated total support-eligible spend based on when the account was
  /// subscribed to Enterprise Support.
  final String proratedTotalSupportEligibleSpend;

  /// The total number of seconds in the billing period.
  final int totalSeconds;

  /// The total support-eligible spend for this account.
  final String totalSupportEligibleSpend;

  /// The type of account.
  final String? accountType;

  /// The time periods during which this account was linked.
  final List<EnterpriseSupportTimePeriod>? linkedTimePeriods;

  /// The subscription time periods for this account.
  final List<EnterpriseSupportTimePeriod>? subscriptionTimePeriods;

  /// The support-eligible spend broken down by service.
  final List<ServiceLevelAccountUsage>? supportEligibleSpendByService;

  /// The total support-eligible Reserved Instance spend for this account.
  final String? totalSupportEligibleReservedInstanceSpend;

  /// The total support-eligible Savings Plan spend for this account.
  final String? totalSupportEligibleSavingsPlanSpend;

  LinkedAccountCharge({
    required this.accountId,
    required this.billableSeconds,
    required this.payerAccountId,
    required this.proratedTotalSupportEligibleSpend,
    required this.totalSeconds,
    required this.totalSupportEligibleSpend,
    this.accountType,
    this.linkedTimePeriods,
    this.subscriptionTimePeriods,
    this.supportEligibleSpendByService,
    this.totalSupportEligibleReservedInstanceSpend,
    this.totalSupportEligibleSavingsPlanSpend,
  });

  factory LinkedAccountCharge.fromJson(Map<String, dynamic> json) {
    return LinkedAccountCharge(
      accountId: (json['accountId'] as String?) ?? '',
      billableSeconds: (json['billableSeconds'] as int?) ?? 0,
      payerAccountId: (json['payerAccountId'] as String?) ?? '',
      proratedTotalSupportEligibleSpend:
          (json['proratedTotalSupportEligibleSpend'] as String?) ?? '',
      totalSeconds: (json['totalSeconds'] as int?) ?? 0,
      totalSupportEligibleSpend:
          (json['totalSupportEligibleSpend'] as String?) ?? '',
      accountType: json['accountType'] as String?,
      linkedTimePeriods: (json['linkedTimePeriods'] as List?)
          ?.nonNulls
          .map((e) =>
              EnterpriseSupportTimePeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscriptionTimePeriods: (json['subscriptionTimePeriods'] as List?)
          ?.nonNulls
          .map((e) =>
              EnterpriseSupportTimePeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportEligibleSpendByService:
          (json['supportEligibleSpendByService'] as List?)
              ?.nonNulls
              .map((e) =>
                  ServiceLevelAccountUsage.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalSupportEligibleReservedInstanceSpend:
          json['totalSupportEligibleReservedInstanceSpend'] as String?,
      totalSupportEligibleSavingsPlanSpend:
          json['totalSupportEligibleSavingsPlanSpend'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final billableSeconds = this.billableSeconds;
    final payerAccountId = this.payerAccountId;
    final proratedTotalSupportEligibleSpend =
        this.proratedTotalSupportEligibleSpend;
    final totalSeconds = this.totalSeconds;
    final totalSupportEligibleSpend = this.totalSupportEligibleSpend;
    final accountType = this.accountType;
    final linkedTimePeriods = this.linkedTimePeriods;
    final subscriptionTimePeriods = this.subscriptionTimePeriods;
    final supportEligibleSpendByService = this.supportEligibleSpendByService;
    final totalSupportEligibleReservedInstanceSpend =
        this.totalSupportEligibleReservedInstanceSpend;
    final totalSupportEligibleSavingsPlanSpend =
        this.totalSupportEligibleSavingsPlanSpend;
    return {
      'accountId': accountId,
      'billableSeconds': billableSeconds,
      'payerAccountId': payerAccountId,
      'proratedTotalSupportEligibleSpend': proratedTotalSupportEligibleSpend,
      'totalSeconds': totalSeconds,
      'totalSupportEligibleSpend': totalSupportEligibleSpend,
      if (accountType != null) 'accountType': accountType,
      if (linkedTimePeriods != null) 'linkedTimePeriods': linkedTimePeriods,
      if (subscriptionTimePeriods != null)
        'subscriptionTimePeriods': subscriptionTimePeriods,
      if (supportEligibleSpendByService != null)
        'supportEligibleSpendByService': supportEligibleSpendByService,
      if (totalSupportEligibleReservedInstanceSpend != null)
        'totalSupportEligibleReservedInstanceSpend':
            totalSupportEligibleReservedInstanceSpend,
      if (totalSupportEligibleSavingsPlanSpend != null)
        'totalSupportEligibleSavingsPlanSpend':
            totalSupportEligibleSavingsPlanSpend,
    };
  }
}

/// Service-level usage details by account.
///
/// @nodoc
class ServiceLevelAccountUsage {
  /// The service code for which to return Support-eligible spend data.
  final String? serviceCode;

  /// The total support-eligible spend for the service.
  final String? totalSupportEligibleSpend;

  ServiceLevelAccountUsage({
    this.serviceCode,
    this.totalSupportEligibleSpend,
  });

  factory ServiceLevelAccountUsage.fromJson(Map<String, dynamic> json) {
    return ServiceLevelAccountUsage(
      serviceCode: json['serviceCode'] as String?,
      totalSupportEligibleSpend: json['totalSupportEligibleSpend'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceCode = this.serviceCode;
    final totalSupportEligibleSpend = this.totalSupportEligibleSpend;
    return {
      if (serviceCode != null) 'serviceCode': serviceCode,
      if (totalSupportEligibleSpend != null)
        'totalSupportEligibleSpend': totalSupportEligibleSpend,
    };
  }
}

/// A time period for Enterprise Support billing.
///
/// @nodoc
class EnterpriseSupportTimePeriod {
  /// The begin date of the time period.
  final DateTime beginDate;

  /// The end date of the time period.
  final DateTime? endDate;

  EnterpriseSupportTimePeriod({
    required this.beginDate,
    this.endDate,
  });

  factory EnterpriseSupportTimePeriod.fromJson(Map<String, dynamic> json) {
    return EnterpriseSupportTimePeriod(
      beginDate: nonNullableTimeStampFromJson(json['beginDate'] ?? 0),
      endDate: timeStampFromJson(json['endDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final beginDate = this.beginDate;
    final endDate = this.endDate;
    return {
      'beginDate': unixTimestampToJson(beginDate),
      if (endDate != null) 'endDate': unixTimestampToJson(endDate),
    };
  }
}

/// A representation of a billing view.
///
/// @nodoc
class BillingViewListElement {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String? arn;

  /// The type of billing view.
  final BillingViewType? billingViewType;

  /// The description of the billing view.
  final String? description;

  /// The current health status of the billing view.
  final BillingViewHealthStatus? healthStatus;

  /// A list of names of the Billing view.
  final String? name;

  /// The list of owners of the Billing view.
  final String? ownerAccountId;

  /// The Amazon Web Services account ID that owns the source billing view, if
  /// this is a derived billing view.
  final String? sourceAccountId;

  BillingViewListElement({
    this.arn,
    this.billingViewType,
    this.description,
    this.healthStatus,
    this.name,
    this.ownerAccountId,
    this.sourceAccountId,
  });

  factory BillingViewListElement.fromJson(Map<String, dynamic> json) {
    return BillingViewListElement(
      arn: json['arn'] as String?,
      billingViewType:
          (json['billingViewType'] as String?)?.let(BillingViewType.fromString),
      description: json['description'] as String?,
      healthStatus: json['healthStatus'] != null
          ? BillingViewHealthStatus.fromJson(
              json['healthStatus'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      ownerAccountId: json['ownerAccountId'] as String?,
      sourceAccountId: json['sourceAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final billingViewType = this.billingViewType;
    final description = this.description;
    final healthStatus = this.healthStatus;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final sourceAccountId = this.sourceAccountId;
    return {
      if (arn != null) 'arn': arn,
      if (billingViewType != null) 'billingViewType': billingViewType.value,
      if (description != null) 'description': description,
      if (healthStatus != null) 'healthStatus': healthStatus,
      if (name != null) 'name': name,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
      if (sourceAccountId != null) 'sourceAccountId': sourceAccountId,
    };
  }
}

/// @nodoc
class BillingViewType {
  static const primary = BillingViewType._('PRIMARY');
  static const billingGroup = BillingViewType._('BILLING_GROUP');
  static const custom = BillingViewType._('CUSTOM');
  static const billingTransfer = BillingViewType._('BILLING_TRANSFER');
  static const billingTransferShowback =
      BillingViewType._('BILLING_TRANSFER_SHOWBACK');

  final String value;

  const BillingViewType._(this.value);

  static const values = [
    primary,
    billingGroup,
    custom,
    billingTransfer,
    billingTransferShowback
  ];

  static BillingViewType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingViewType._(value));

  @override
  bool operator ==(other) => other is BillingViewType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the health status of a billing view, including a status code and
/// optional reasons for the status.
///
/// @nodoc
class BillingViewHealthStatus {
  /// The current health status code of the billing view.
  final BillingViewStatus? statusCode;

  /// A list of reasons explaining the current health status, if applicable.
  final List<BillingViewStatusReason>? statusReasons;

  BillingViewHealthStatus({
    this.statusCode,
    this.statusReasons,
  });

  factory BillingViewHealthStatus.fromJson(Map<String, dynamic> json) {
    return BillingViewHealthStatus(
      statusCode:
          (json['statusCode'] as String?)?.let(BillingViewStatus.fromString),
      statusReasons: (json['statusReasons'] as List?)
          ?.nonNulls
          .map((e) => BillingViewStatusReason.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statusCode = this.statusCode;
    final statusReasons = this.statusReasons;
    return {
      if (statusCode != null) 'statusCode': statusCode.value,
      if (statusReasons != null)
        'statusReasons': statusReasons.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class BillingViewStatus {
  static const healthy = BillingViewStatus._('HEALTHY');
  static const unhealthy = BillingViewStatus._('UNHEALTHY');
  static const creating = BillingViewStatus._('CREATING');
  static const updating = BillingViewStatus._('UPDATING');

  final String value;

  const BillingViewStatus._(this.value);

  static const values = [healthy, unhealthy, creating, updating];

  static BillingViewStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingViewStatus._(value));

  @override
  bool operator ==(other) => other is BillingViewStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BillingViewStatusReason {
  static const sourceViewUnhealthy =
      BillingViewStatusReason._('SOURCE_VIEW_UNHEALTHY');
  static const sourceViewUpdating =
      BillingViewStatusReason._('SOURCE_VIEW_UPDATING');
  static const sourceViewAccessDenied =
      BillingViewStatusReason._('SOURCE_VIEW_ACCESS_DENIED');
  static const sourceViewNotFound =
      BillingViewStatusReason._('SOURCE_VIEW_NOT_FOUND');
  static const cyclicDependency =
      BillingViewStatusReason._('CYCLIC_DEPENDENCY');
  static const sourceViewDepthExceeded =
      BillingViewStatusReason._('SOURCE_VIEW_DEPTH_EXCEEDED');
  static const aggregateSource = BillingViewStatusReason._('AGGREGATE_SOURCE');
  static const viewOwnerNotManagementAccount =
      BillingViewStatusReason._('VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT');

  final String value;

  const BillingViewStatusReason._(this.value);

  static const values = [
    sourceViewUnhealthy,
    sourceViewUpdating,
    sourceViewAccessDenied,
    sourceViewNotFound,
    cyclicDependency,
    sourceViewDepthExceeded,
    aggregateSource,
    viewOwnerNotManagementAccount
  ];

  static BillingViewStatusReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingViewStatusReason._(value));

  @override
  bool operator ==(other) =>
      other is BillingViewStatusReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A time range with a start and end time.
///
/// @nodoc
class ActiveTimeRange {
  /// The inclusive time range start date.
  final DateTime activeAfterInclusive;

  /// The inclusive time range end date.
  final DateTime activeBeforeInclusive;

  ActiveTimeRange({
    required this.activeAfterInclusive,
    required this.activeBeforeInclusive,
  });

  Map<String, dynamic> toJson() {
    final activeAfterInclusive = this.activeAfterInclusive;
    final activeBeforeInclusive = this.activeBeforeInclusive;
    return {
      'activeAfterInclusive': unixTimestampToJson(activeAfterInclusive),
      'activeBeforeInclusive': unixTimestampToJson(activeBeforeInclusive),
    };
  }
}

/// A structure that defines how to search for string values. You can specify a
/// search option and the value to search for.
///
/// @nodoc
class StringSearch {
  /// The type of search operation to perform on the string value. Determines how
  /// the search value is matched against the target field.
  final SearchOption searchOption;

  /// The string value to use in the search operation. This value is compared
  /// against the target field using the specified search option.
  final String searchValue;

  StringSearch({
    required this.searchOption,
    required this.searchValue,
  });

  Map<String, dynamic> toJson() {
    final searchOption = this.searchOption;
    final searchValue = this.searchValue;
    return {
      'searchOption': searchOption.value,
      'searchValue': searchValue,
    };
  }
}

/// @nodoc
class SearchOption {
  static const startsWith = SearchOption._('STARTS_WITH');

  final String value;

  const SearchOption._(this.value);

  static const values = [startsWith];

  static SearchOption fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SearchOption._(value));

  @override
  bool operator ==(other) => other is SearchOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A pricing plan for Enterprise Support billing.
///
/// @nodoc
class PricingPlan {
  /// The pricing tiers within this plan.
  final List<PricingPlanTier> tiers;

  /// A description of the pricing plan.
  final String? description;

  /// Whether the discount applies to the minimum Support charge.
  final bool? discountAppliesToMinimumCharge;

  /// The end date of the pricing plan.
  final DateTime? endDate;

  /// The minimum Support charge amount for this pricing plan.
  final String? minimumCharge;

  /// The name of the pricing plan.
  final String? name;

  /// The discount percentage applied by this pricing plan.
  final String? planDiscountPercent;

  /// The unique identifier for the pricing plan.
  final String? pricingPlanId;

  /// The start date of the pricing plan.
  final DateTime? startDate;

  /// Whether the pricing plan uses tiered pricing.
  final String? tiered;

  PricingPlan({
    required this.tiers,
    this.description,
    this.discountAppliesToMinimumCharge,
    this.endDate,
    this.minimumCharge,
    this.name,
    this.planDiscountPercent,
    this.pricingPlanId,
    this.startDate,
    this.tiered,
  });

  factory PricingPlan.fromJson(Map<String, dynamic> json) {
    return PricingPlan(
      tiers: ((json['tiers'] as List?) ?? const [])
          .nonNulls
          .map((e) => PricingPlanTier.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      discountAppliesToMinimumCharge:
          json['discountAppliesToMinimumCharge'] as bool?,
      endDate: timeStampFromJson(json['endDate']),
      minimumCharge: json['minimumCharge'] as String?,
      name: json['name'] as String?,
      planDiscountPercent: json['planDiscountPercent'] as String?,
      pricingPlanId: json['pricingPlanId'] as String?,
      startDate: timeStampFromJson(json['startDate']),
      tiered: json['tiered'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tiers = this.tiers;
    final description = this.description;
    final discountAppliesToMinimumCharge = this.discountAppliesToMinimumCharge;
    final endDate = this.endDate;
    final minimumCharge = this.minimumCharge;
    final name = this.name;
    final planDiscountPercent = this.planDiscountPercent;
    final pricingPlanId = this.pricingPlanId;
    final startDate = this.startDate;
    final tiered = this.tiered;
    return {
      'tiers': tiers,
      if (description != null) 'description': description,
      if (discountAppliesToMinimumCharge != null)
        'discountAppliesToMinimumCharge': discountAppliesToMinimumCharge,
      if (endDate != null) 'endDate': unixTimestampToJson(endDate),
      if (minimumCharge != null) 'minimumCharge': minimumCharge,
      if (name != null) 'name': name,
      if (planDiscountPercent != null)
        'planDiscountPercent': planDiscountPercent,
      if (pricingPlanId != null) 'pricingPlanId': pricingPlanId,
      if (startDate != null) 'startDate': unixTimestampToJson(startDate),
      if (tiered != null) 'tiered': tiered,
    };
  }
}

/// A tier within an Enterprise Support pricing plan.
///
/// @nodoc
class PricingPlanTier {
  /// The additional percentage applied to aggregate charges in this tier.
  final String additionalPercentageOfAggregateCharges;

  /// The adjustment applied to aggregate charges.
  final String aggregateChargesAdjustment;

  /// The base charge for this tier.
  final String baseCharge;

  /// Whether the tier charges are calculated incrementally.
  final bool incremental;

  /// The minimum spend threshold for this tier.
  final String tierMinimum;

  /// The increment amount for incremental tier calculations.
  final String? increment;

  /// The charge per increment.
  final String? incrementCharge;

  /// The maximum spend threshold for this tier.
  final String? tierMaximum;

  PricingPlanTier({
    required this.additionalPercentageOfAggregateCharges,
    required this.aggregateChargesAdjustment,
    required this.baseCharge,
    required this.incremental,
    required this.tierMinimum,
    this.increment,
    this.incrementCharge,
    this.tierMaximum,
  });

  factory PricingPlanTier.fromJson(Map<String, dynamic> json) {
    return PricingPlanTier(
      additionalPercentageOfAggregateCharges:
          (json['additionalPercentageOfAggregateCharges'] as String?) ?? '',
      aggregateChargesAdjustment:
          (json['aggregateChargesAdjustment'] as String?) ?? '',
      baseCharge: (json['baseCharge'] as String?) ?? '',
      incremental: (json['incremental'] as bool?) ?? false,
      tierMinimum: (json['tierMinimum'] as String?) ?? '',
      increment: json['increment'] as String?,
      incrementCharge: json['incrementCharge'] as String?,
      tierMaximum: json['tierMaximum'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalPercentageOfAggregateCharges =
        this.additionalPercentageOfAggregateCharges;
    final aggregateChargesAdjustment = this.aggregateChargesAdjustment;
    final baseCharge = this.baseCharge;
    final incremental = this.incremental;
    final tierMinimum = this.tierMinimum;
    final increment = this.increment;
    final incrementCharge = this.incrementCharge;
    final tierMaximum = this.tierMaximum;
    return {
      'additionalPercentageOfAggregateCharges':
          additionalPercentageOfAggregateCharges,
      'aggregateChargesAdjustment': aggregateChargesAdjustment,
      'baseCharge': baseCharge,
      'incremental': incremental,
      'tierMinimum': tierMinimum,
      if (increment != null) 'increment': increment,
      if (incrementCharge != null) 'incrementCharge': incrementCharge,
      if (tierMaximum != null) 'tierMaximum': tierMaximum,
    };
  }
}

/// An additional charge applied to an Enterprise Support contract.
///
/// @nodoc
class AdditionalCharge {
  /// A description of the additional charge.
  final String description;

  /// The charge amount.
  final String? amount;

  /// The type of additional charge.
  final String? chargeType;

  AdditionalCharge({
    required this.description,
    this.amount,
    this.chargeType,
  });

  factory AdditionalCharge.fromJson(Map<String, dynamic> json) {
    return AdditionalCharge(
      description: (json['description'] as String?) ?? '',
      amount: json['amount'] as String?,
      chargeType: json['chargeType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final amount = this.amount;
    final chargeType = this.chargeType;
    return {
      'description': description,
      if (amount != null) 'amount': amount,
      if (chargeType != null) 'chargeType': chargeType,
    };
  }
}

/// An account that is charged all or a portion of the total Support charge and
/// the percentage of the charge allocated to it.
///
/// @nodoc
class ChargeAccount {
  /// The account ID.
  final String accountId;

  /// The percentage of the total Support charge allocated to this account. This
  /// is 0.0 when supportAllocationMethod = Proportional.
  final String chargePercentage;

  ChargeAccount({
    required this.accountId,
    required this.chargePercentage,
  });

  factory ChargeAccount.fromJson(Map<String, dynamic> json) {
    return ChargeAccount(
      accountId: (json['accountId'] as String?) ?? '',
      chargePercentage: (json['chargePercentage'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final chargePercentage = this.chargePercentage;
    return {
      'accountId': accountId,
      'chargePercentage': chargePercentage,
    };
  }
}

/// An account that is covered by the Enterprise Support contract.
///
/// @nodoc
class ContractAccount {
  /// The account ID.
  final String accountId;

  /// When true, Support charges are calculated on charges before private
  /// discounts. When false, they are calculated after private discounts.
  final bool isGdn;

  ContractAccount({
    required this.accountId,
    required this.isGdn,
  });

  factory ContractAccount.fromJson(Map<String, dynamic> json) {
    return ContractAccount(
      accountId: (json['accountId'] as String?) ?? '',
      isGdn: (json['isGdn'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final isGdn = this.isGdn;
    return {
      'accountId': accountId,
      'isGdn': isGdn,
    };
  }
}

/// Detailed information about an Amazon Web Services credit, including its
/// identifier, type, monetary amounts, applicable products, sharing
/// configuration, and current enabled status.
///
/// @nodoc
class CreditData {
  /// The Amazon Web Services account ID that owns the credit.
  final String accountId;

  /// The unique identifier for the credit.
  final String creditId;

  /// The type of credit. Examples: <code>Promotion</code>, <code>Refund</code>,
  /// <code>TrueUp</code>.
  final String creditType;

  /// A human-readable description of the credit.
  final String description;

  /// The initial amount of the credit when it was issued.
  final Amount initialAmount;

  /// The unused balance of the credit.
  final Amount remainingAmount;

  /// The date the credit becomes valid, as Unix epoch seconds.
  final DateTime startDate;

  /// Whether the owning account has account-level credit sharing turned on.
  final bool? accountHasCreditSharingEnabled;

  /// The names of Amazon Web Services services this credit applies to.
  final List<String>? applicableProductNames;

  /// When the credit is applied during bill computation. Valid values:
  /// <code>BEFORE_CROSS_SERVICE_DISCOUNTS</code>, <code>AFTER_DISCOUNTS</code>.
  final ApplicationType? applicationType;

  /// The Amazon Resource Name (ARN) of the Cost Category controlling the credit's
  /// sharing scope. Present only when <code>creditSharingType</code> is
  /// <code>COST_CATEGORY_RULE</code>.
  final String? costCategoryArn;

  /// The display configuration for the credit in the Amazon Web Services Billing
  /// console.
  final String? creditConsoleVisibility;

  /// The sharing configuration for the credit. Valid values:
  /// <code>DEFAULT</code>, <code>DISABLED</code>, <code>CUSTOM</code>,
  /// <code>COST_CATEGORY_RULE</code>.
  final CreditSharingType? creditSharingType;

  /// Whether the credit participates in billing runs. Valid values:
  /// <code>ENABLED</code>, <code>DISABLED</code>.
  final CreditStatus? creditStatus;

  /// The date the credit expires, as Unix epoch seconds.
  final DateTime? endDate;

  /// The estimated remaining balance, including in-flight (open) bills that have
  /// not yet been finalized.
  final Amount? estimatedAmount;

  /// The date the credit balance reached zero, as Unix epoch seconds.
  final DateTime? exhaustDate;

  /// Restricts which purchase types this credit applies to. When
  /// <code>null</code> or omitted, the credit applies to all purchase types.
  final List<String>? purchaseTypeApplications;

  /// The rule name within the Cost Category. Present only when
  /// <code>creditSharingType</code> is <code>COST_CATEGORY_RULE</code>.
  final String? ruleName;

  /// The Amazon Web Services account IDs entitled to apply this credit.
  final List<String>? shareableAccounts;

  CreditData({
    required this.accountId,
    required this.creditId,
    required this.creditType,
    required this.description,
    required this.initialAmount,
    required this.remainingAmount,
    required this.startDate,
    this.accountHasCreditSharingEnabled,
    this.applicableProductNames,
    this.applicationType,
    this.costCategoryArn,
    this.creditConsoleVisibility,
    this.creditSharingType,
    this.creditStatus,
    this.endDate,
    this.estimatedAmount,
    this.exhaustDate,
    this.purchaseTypeApplications,
    this.ruleName,
    this.shareableAccounts,
  });

  factory CreditData.fromJson(Map<String, dynamic> json) {
    return CreditData(
      accountId: (json['accountId'] as String?) ?? '',
      creditId: (json['creditId'] as String?) ?? '',
      creditType: (json['creditType'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      initialAmount: Amount.fromJson(
          (json['initialAmount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      remainingAmount: Amount.fromJson(
          (json['remainingAmount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      startDate: nonNullableTimeStampFromJson(json['startDate'] ?? 0),
      accountHasCreditSharingEnabled:
          json['accountHasCreditSharingEnabled'] as bool?,
      applicableProductNames: (json['applicableProductNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      applicationType:
          (json['applicationType'] as String?)?.let(ApplicationType.fromString),
      costCategoryArn: json['costCategoryArn'] as String?,
      creditConsoleVisibility: json['creditConsoleVisibility'] as String?,
      creditSharingType: (json['creditSharingType'] as String?)
          ?.let(CreditSharingType.fromString),
      creditStatus:
          (json['creditStatus'] as String?)?.let(CreditStatus.fromString),
      endDate: timeStampFromJson(json['endDate']),
      estimatedAmount: json['estimatedAmount'] != null
          ? Amount.fromJson(json['estimatedAmount'] as Map<String, dynamic>)
          : null,
      exhaustDate: timeStampFromJson(json['exhaustDate']),
      purchaseTypeApplications: (json['purchaseTypeApplications'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ruleName: json['ruleName'] as String?,
      shareableAccounts: (json['shareableAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final creditId = this.creditId;
    final creditType = this.creditType;
    final description = this.description;
    final initialAmount = this.initialAmount;
    final remainingAmount = this.remainingAmount;
    final startDate = this.startDate;
    final accountHasCreditSharingEnabled = this.accountHasCreditSharingEnabled;
    final applicableProductNames = this.applicableProductNames;
    final applicationType = this.applicationType;
    final costCategoryArn = this.costCategoryArn;
    final creditConsoleVisibility = this.creditConsoleVisibility;
    final creditSharingType = this.creditSharingType;
    final creditStatus = this.creditStatus;
    final endDate = this.endDate;
    final estimatedAmount = this.estimatedAmount;
    final exhaustDate = this.exhaustDate;
    final purchaseTypeApplications = this.purchaseTypeApplications;
    final ruleName = this.ruleName;
    final shareableAccounts = this.shareableAccounts;
    return {
      'accountId': accountId,
      'creditId': creditId,
      'creditType': creditType,
      'description': description,
      'initialAmount': initialAmount,
      'remainingAmount': remainingAmount,
      'startDate': unixTimestampToJson(startDate),
      if (accountHasCreditSharingEnabled != null)
        'accountHasCreditSharingEnabled': accountHasCreditSharingEnabled,
      if (applicableProductNames != null)
        'applicableProductNames': applicableProductNames,
      if (applicationType != null) 'applicationType': applicationType.value,
      if (costCategoryArn != null) 'costCategoryArn': costCategoryArn,
      if (creditConsoleVisibility != null)
        'creditConsoleVisibility': creditConsoleVisibility,
      if (creditSharingType != null)
        'creditSharingType': creditSharingType.value,
      if (creditStatus != null) 'creditStatus': creditStatus.value,
      if (endDate != null) 'endDate': unixTimestampToJson(endDate),
      if (estimatedAmount != null) 'estimatedAmount': estimatedAmount,
      if (exhaustDate != null) 'exhaustDate': unixTimestampToJson(exhaustDate),
      if (purchaseTypeApplications != null)
        'purchaseTypeApplications': purchaseTypeApplications,
      if (ruleName != null) 'ruleName': ruleName,
      if (shareableAccounts != null) 'shareableAccounts': shareableAccounts,
    };
  }
}

/// A monetary amount with a currency code. Used throughout the Billing API to
/// represent credit balances, allocations, and adjustments.
///
/// @nodoc
class Amount {
  /// The amount as a decimal string (for example, <code>"743.21"</code>).
  /// Negative values represent credits that reduce a bill.
  final String currencyAmount;

  /// The ISO 4217 currency code for the amount (for example, <code>USD</code>).
  final String currencyCode;

  Amount({
    required this.currencyAmount,
    required this.currencyCode,
  });

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      currencyAmount: (json['currencyAmount'] as String?) ?? '',
      currencyCode: (json['currencyCode'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final currencyAmount = this.currencyAmount;
    final currencyCode = this.currencyCode;
    return {
      'currencyAmount': currencyAmount,
      'currencyCode': currencyCode,
    };
  }
}

/// @nodoc
class ApplicationType {
  static const beforeCrossServiceDiscounts =
      ApplicationType._('BEFORE_CROSS_SERVICE_DISCOUNTS');
  static const afterDiscounts = ApplicationType._('AFTER_DISCOUNTS');

  final String value;

  const ApplicationType._(this.value);

  static const values = [beforeCrossServiceDiscounts, afterDiscounts];

  static ApplicationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationType._(value));

  @override
  bool operator ==(other) => other is ApplicationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CreditSharingType {
  static const $default = CreditSharingType._('DEFAULT');
  static const disabled = CreditSharingType._('DISABLED');
  static const custom = CreditSharingType._('CUSTOM');
  static const costCategoryRule = CreditSharingType._('COST_CATEGORY_RULE');

  final String value;

  const CreditSharingType._(this.value);

  static const values = [$default, disabled, custom, costCategoryRule];

  static CreditSharingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CreditSharingType._(value));

  @override
  bool operator ==(other) => other is CreditSharingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CreditStatus {
  static const enabled = CreditStatus._('ENABLED');
  static const disabled = CreditStatus._('DISABLED');

  final String value;

  const CreditStatus._(this.value);

  static const values = [enabled, disabled];

  static CreditStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CreditStatus._(value));

  @override
  bool operator ==(other) => other is CreditStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A single entry in the credit allocation history, representing how a credit
/// was applied to a specific service during a billing month.
///
/// @nodoc
class CreditAllocationHistoryEntry {
  /// The Amazon Web Services account the credit was applied to.
  final String accountId;

  /// The Amazon Web Services service the credit was applied to.
  final String appliedServiceName;

  /// The billing month of the application in <code>YYYY-MM</code> format.
  final String billingMonth;

  /// The amount of credit applied. Negative values represent credits that reduced
  /// the bill.
  final Amount creditAmount;

  /// The identifier of the credit that was applied.
  final String creditId;

  /// <code>true</code> when the entry was applied to an in-flight bill that has
  /// not yet been finalized.
  final bool isEstimatedBill;

  /// A human-readable description of the credit allocation.
  final String? description;

  CreditAllocationHistoryEntry({
    required this.accountId,
    required this.appliedServiceName,
    required this.billingMonth,
    required this.creditAmount,
    required this.creditId,
    required this.isEstimatedBill,
    this.description,
  });

  factory CreditAllocationHistoryEntry.fromJson(Map<String, dynamic> json) {
    return CreditAllocationHistoryEntry(
      accountId: (json['accountId'] as String?) ?? '',
      appliedServiceName: (json['appliedServiceName'] as String?) ?? '',
      billingMonth: (json['billingMonth'] as String?) ?? '',
      creditAmount: Amount.fromJson(
          (json['creditAmount'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creditId: (json['creditId'] as String?) ?? '',
      isEstimatedBill: (json['isEstimatedBill'] as bool?) ?? false,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final appliedServiceName = this.appliedServiceName;
    final billingMonth = this.billingMonth;
    final creditAmount = this.creditAmount;
    final creditId = this.creditId;
    final isEstimatedBill = this.isEstimatedBill;
    final description = this.description;
    return {
      'accountId': accountId,
      'appliedServiceName': appliedServiceName,
      'billingMonth': billingMonth,
      'creditAmount': creditAmount,
      'creditId': creditId,
      'isEstimatedBill': isEstimatedBill,
      if (description != null) 'description': description,
    };
  }
}

/// The metadata associated to the billing view.
///
/// @nodoc
class BillingViewElement {
  /// The Amazon Resource Name (ARN) that can be used to uniquely identify the
  /// billing view.
  final String? arn;

  /// The type of billing group.
  final BillingViewType? billingViewType;

  /// The time when the billing view was created.
  final DateTime? createdAt;

  /// See <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html">Expression</a>.
  /// Billing view only supports <code>LINKED_ACCOUNT</code>, <code>Tags</code>,
  /// and <code>CostCategories</code>.
  final Expression? dataFilterExpression;

  /// The number of billing views that use this billing view as a source.
  final int? derivedViewCount;

  /// The description of the billing view.
  final String? description;

  /// The current health status of the billing view.
  final BillingViewHealthStatus? healthStatus;

  /// The account name of the billing view.
  final String? name;

  /// The account owner of the billing view.
  final String? ownerAccountId;

  /// The Amazon Web Services account ID that owns the source billing view, if
  /// this is a derived billing view.
  final String? sourceAccountId;

  /// The number of source views associated with this billing view.
  final int? sourceViewCount;

  /// The time when the billing view was last updated.
  final DateTime? updatedAt;

  /// The timestamp of when the billing view definition was last updated.
  final DateTime? viewDefinitionLastUpdatedAt;

  BillingViewElement({
    this.arn,
    this.billingViewType,
    this.createdAt,
    this.dataFilterExpression,
    this.derivedViewCount,
    this.description,
    this.healthStatus,
    this.name,
    this.ownerAccountId,
    this.sourceAccountId,
    this.sourceViewCount,
    this.updatedAt,
    this.viewDefinitionLastUpdatedAt,
  });

  factory BillingViewElement.fromJson(Map<String, dynamic> json) {
    return BillingViewElement(
      arn: json['arn'] as String?,
      billingViewType:
          (json['billingViewType'] as String?)?.let(BillingViewType.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      dataFilterExpression: json['dataFilterExpression'] != null
          ? Expression.fromJson(
              json['dataFilterExpression'] as Map<String, dynamic>)
          : null,
      derivedViewCount: json['derivedViewCount'] as int?,
      description: json['description'] as String?,
      healthStatus: json['healthStatus'] != null
          ? BillingViewHealthStatus.fromJson(
              json['healthStatus'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      ownerAccountId: json['ownerAccountId'] as String?,
      sourceAccountId: json['sourceAccountId'] as String?,
      sourceViewCount: json['sourceViewCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      viewDefinitionLastUpdatedAt:
          timeStampFromJson(json['viewDefinitionLastUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final billingViewType = this.billingViewType;
    final createdAt = this.createdAt;
    final dataFilterExpression = this.dataFilterExpression;
    final derivedViewCount = this.derivedViewCount;
    final description = this.description;
    final healthStatus = this.healthStatus;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final sourceAccountId = this.sourceAccountId;
    final sourceViewCount = this.sourceViewCount;
    final updatedAt = this.updatedAt;
    final viewDefinitionLastUpdatedAt = this.viewDefinitionLastUpdatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (billingViewType != null) 'billingViewType': billingViewType.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (dataFilterExpression != null)
        'dataFilterExpression': dataFilterExpression,
      if (derivedViewCount != null) 'derivedViewCount': derivedViewCount,
      if (description != null) 'description': description,
      if (healthStatus != null) 'healthStatus': healthStatus,
      if (name != null) 'name': name,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
      if (sourceAccountId != null) 'sourceAccountId': sourceAccountId,
      if (sourceViewCount != null) 'sourceViewCount': sourceViewCount,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (viewDefinitionLastUpdatedAt != null)
        'viewDefinitionLastUpdatedAt':
            unixTimestampToJson(viewDefinitionLastUpdatedAt),
    };
  }
}

/// A single billing preference entry returned by
/// <code>GetBillingPreferences</code>.
///
/// @nodoc
class BillingPreferenceSummary {
  /// The feature this preference belongs to.
  final BillingFeature feature;

  /// The preference key. Format depends on the feature.
  final String key;

  /// The preference value. Valid values: <code>ENABLED</code> or
  /// <code>DISABLED</code>.
  final PreferenceValue value;

  /// The associated Amazon Web Services account ID. Populated for account-list
  /// keys; <code>null</code> otherwise.
  final String? accountId;

  /// The display name of the account. Populated together with
  /// <code>accountId</code>; <code>null</code> otherwise.
  final String? accountName;

  /// The billing period associated with the preference change. Populated only for
  /// the history features <code>RI_SHARING_HISTORY</code> and
  /// <code>CREDIT_SHARING_HISTORY</code>.
  final BillingPeriod? billingPeriod;

  BillingPreferenceSummary({
    required this.feature,
    required this.key,
    required this.value,
    this.accountId,
    this.accountName,
    this.billingPeriod,
  });

  factory BillingPreferenceSummary.fromJson(Map<String, dynamic> json) {
    return BillingPreferenceSummary(
      feature: BillingFeature.fromString((json['feature'] as String?) ?? ''),
      key: (json['key'] as String?) ?? '',
      value: PreferenceValue.fromString((json['value'] as String?) ?? ''),
      accountId: json['accountId'] as String?,
      accountName: json['accountName'] as String?,
      billingPeriod: json['billingPeriod'] != null
          ? BillingPeriod.fromJson(
              json['billingPeriod'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    final key = this.key;
    final value = this.value;
    final accountId = this.accountId;
    final accountName = this.accountName;
    final billingPeriod = this.billingPeriod;
    return {
      'feature': feature.value,
      'key': key,
      'value': value.value,
      if (accountId != null) 'accountId': accountId,
      if (accountName != null) 'accountName': accountName,
      if (billingPeriod != null) 'billingPeriod': billingPeriod,
    };
  }
}

/// A specific billing period identified by year and month.
///
/// @nodoc
class BillingPeriod {
  /// The month of the billing period as an integer between 1 and 12.
  final int month;

  /// The four-digit year of the billing period.
  final int year;

  BillingPeriod({
    required this.month,
    required this.year,
  });

  factory BillingPeriod.fromJson(Map<String, dynamic> json) {
    return BillingPeriod(
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

/// A filter that narrows the set of preferences returned by
/// <code>GetBillingPreferences</code>.
///
/// @nodoc
class BillingFeatureFilter {
  /// The filter name. Currently the only supported value is
  /// <code>PREFERENCE_KEY</code>.
  final BillingFeatureFilterName? name;

  /// The filter values to match. For <code>PREFERENCE_KEY</code>, supply 1 to 10
  /// preference key values to match.
  final List<String>? value;

  BillingFeatureFilter({
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name.value,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class BillingFeatureFilterName {
  static const preferenceKey = BillingFeatureFilterName._('PREFERENCE_KEY');

  final String value;

  const BillingFeatureFilterName._(this.value);

  static const values = [preferenceKey];

  static BillingFeatureFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingFeatureFilterName._(value));

  @override
  bool operator ==(other) =>
      other is BillingFeatureFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class BillingViewHealthStatusException extends _s.GenericAwsException {
  BillingViewHealthStatusException({String? type, String? message})
      : super(
            type: type,
            code: 'BillingViewHealthStatusException',
            message: message);
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
  'BillingViewHealthStatusException': (type, message) =>
      BillingViewHealthStatusException(type: type, message: message),
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
