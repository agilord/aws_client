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

import 'v2019_06_28.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Savings Plans are a pricing model that offer significant savings on Amazon
/// Web Services usage (for example, on Amazon EC2 instances). You commit to a
/// consistent amount of usage per hour, in the specified currency, for a term
/// of one or three years, and receive a lower price for that usage. For more
/// information, see the <a
/// href="https://docs.aws.amazon.com/savingsplans/latest/userguide/">Amazon Web
/// Services Savings Plans User Guide</a>.
class Savingsplans {
  final _s.RestJsonProtocol _protocol;
  factory Savingsplans({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'savingsplans',
    );
    return Savingsplans._(
      protocol: _s.RestJsonProtocol(
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
  Savingsplans._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a Savings Plan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [commitment] :
  /// The hourly commitment, in the same currency of the
  /// <code>savingsPlanOfferingId</code>. This is a value between 0.001 and 1
  /// million. You cannot specify more than five digits after the decimal point.
  ///
  /// Parameter [savingsPlanOfferingId] :
  /// The ID of the offering.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [purchaseTime] :
  /// The purchase time of the Savings Plan in UTC format
  /// (YYYY-MM-DDTHH:MM:SSZ).
  ///
  /// Parameter [tags] :
  /// One or more tags.
  ///
  /// Parameter [upfrontPaymentAmount] :
  /// The up-front payment amount. This is a whole number between 50 and 99
  /// percent of the total value of the Savings Plan. This parameter is only
  /// supported if the payment option is <code>Partial Upfront</code>.
  Future<CreateSavingsPlanResponse> createSavingsPlan({
    required String commitment,
    required String savingsPlanOfferingId,
    String? clientToken,
    DateTime? purchaseTime,
    Map<String, String>? tags,
    String? upfrontPaymentAmount,
  }) async {
    final $payload = <String, dynamic>{
      'commitment': commitment,
      'savingsPlanOfferingId': savingsPlanOfferingId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (purchaseTime != null)
        'purchaseTime': unixTimestampToJson(purchaseTime),
      if (tags != null) 'tags': tags,
      if (upfrontPaymentAmount != null)
        'upfrontPaymentAmount': upfrontPaymentAmount,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateSavingsPlan',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSavingsPlanResponse.fromJson(response);
  }

  /// Deletes the queued purchase for the specified Savings Plan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [savingsPlanId] :
  /// The ID of the Savings Plan.
  Future<void> deleteQueuedSavingsPlan({
    required String savingsPlanId,
  }) async {
    final $payload = <String, dynamic>{
      'savingsPlanId': savingsPlanId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteQueuedSavingsPlan',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the rates for a specific, existing Savings Plan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [savingsPlanId] :
  /// The ID of the Savings Plan.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<DescribeSavingsPlanRatesResponse> describeSavingsPlanRates({
    required String savingsPlanId,
    List<SavingsPlanRateFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'savingsPlanId': savingsPlanId,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlanRates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlanRatesResponse.fromJson(response);
  }

  /// Describes the specified Savings Plans.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [savingsPlanArns] :
  /// The Amazon Resource Names (ARN) of the Savings Plans.
  ///
  /// Parameter [savingsPlanIds] :
  /// The IDs of the Savings Plans.
  ///
  /// Parameter [states] :
  /// The current states of the Savings Plans.
  Future<DescribeSavingsPlansResponse> describeSavingsPlans({
    List<SavingsPlanFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? savingsPlanArns,
    List<String>? savingsPlanIds,
    List<SavingsPlanState>? states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (savingsPlanArns != null) 'savingsPlanArns': savingsPlanArns,
      if (savingsPlanIds != null) 'savingsPlanIds': savingsPlanIds,
      if (states != null) 'states': states.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlans',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlansResponse.fromJson(response);
  }

  /// Describes the offering rates for Savings Plans you might want to purchase.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [operations] :
  /// The specific Amazon Web Services operation for the line item in the
  /// billing report.
  ///
  /// Parameter [products] :
  /// The Amazon Web Services products.
  ///
  /// Parameter [savingsPlanOfferingIds] :
  /// The IDs of the offerings.
  ///
  /// Parameter [savingsPlanPaymentOptions] :
  /// The payment options.
  ///
  /// Parameter [savingsPlanTypes] :
  /// The plan types.
  ///
  /// Parameter [serviceCodes] :
  /// The services.
  ///
  /// Parameter [usageTypes] :
  /// The usage details of the line item in the billing report.
  Future<DescribeSavingsPlansOfferingRatesResponse>
      describeSavingsPlansOfferingRates({
    List<SavingsPlanOfferingRateFilterElement>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? operations,
    List<SavingsPlanProductType>? products,
    List<String>? savingsPlanOfferingIds,
    List<SavingsPlanPaymentOption>? savingsPlanPaymentOptions,
    List<SavingsPlanType>? savingsPlanTypes,
    List<SavingsPlanRateServiceCode>? serviceCodes,
    List<String>? usageTypes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (operations != null) 'operations': operations,
      if (products != null) 'products': products.map((e) => e.value).toList(),
      if (savingsPlanOfferingIds != null)
        'savingsPlanOfferingIds': savingsPlanOfferingIds,
      if (savingsPlanPaymentOptions != null)
        'savingsPlanPaymentOptions':
            savingsPlanPaymentOptions.map((e) => e.value).toList(),
      if (savingsPlanTypes != null)
        'savingsPlanTypes': savingsPlanTypes.map((e) => e.value).toList(),
      if (serviceCodes != null)
        'serviceCodes': serviceCodes.map((e) => e.value).toList(),
      if (usageTypes != null) 'usageTypes': usageTypes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlansOfferingRates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlansOfferingRatesResponse.fromJson(response);
  }

  /// Describes the offerings for the specified Savings Plans.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [currencies] :
  /// The currencies.
  ///
  /// Parameter [descriptions] :
  /// The descriptions.
  ///
  /// Parameter [durations] :
  /// The duration, in seconds.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// additional results, make another call with the returned token value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [offeringIds] :
  /// The IDs of the offerings.
  ///
  /// Parameter [operations] :
  /// The specific Amazon Web Services operation for the line item in the
  /// billing report.
  ///
  /// Parameter [paymentOptions] :
  /// The payment options.
  ///
  /// Parameter [planTypes] :
  /// The plan types.
  ///
  /// Parameter [productType] :
  /// The product type.
  ///
  /// Parameter [serviceCodes] :
  /// The services.
  ///
  /// Parameter [usageTypes] :
  /// The usage details of the line item in the billing report.
  Future<DescribeSavingsPlansOfferingsResponse> describeSavingsPlansOfferings({
    List<CurrencyCode>? currencies,
    List<String>? descriptions,
    List<int>? durations,
    List<SavingsPlanOfferingFilterElement>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? offeringIds,
    List<String>? operations,
    List<SavingsPlanPaymentOption>? paymentOptions,
    List<SavingsPlanType>? planTypes,
    SavingsPlanProductType? productType,
    List<String>? serviceCodes,
    List<String>? usageTypes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      1000,
    );
    final $payload = <String, dynamic>{
      if (currencies != null)
        'currencies': currencies.map((e) => e.value).toList(),
      if (descriptions != null) 'descriptions': descriptions,
      if (durations != null) 'durations': durations,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (offeringIds != null) 'offeringIds': offeringIds,
      if (operations != null) 'operations': operations,
      if (paymentOptions != null)
        'paymentOptions': paymentOptions.map((e) => e.value).toList(),
      if (planTypes != null)
        'planTypes': planTypes.map((e) => e.value).toList(),
      if (productType != null) 'productType': productType.value,
      if (serviceCodes != null) 'serviceCodes': serviceCodes,
      if (usageTypes != null) 'usageTypes': usageTypes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlansOfferings',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlansOfferingsResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Returns the specified Savings Plan.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [savingsPlanId] :
  /// The ID of the Savings Plan.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<ReturnSavingsPlanResponse> returnSavingsPlan({
    required String savingsPlanId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'savingsPlanId': savingsPlanId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ReturnSavingsPlan',
      exceptionFnMap: _exceptionFns,
    );
    return ReturnSavingsPlanResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags. For example, { "tags": {"key1":"value1",
  /// "key2":"value2"} }.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UntagResource',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class CreateSavingsPlanResponse {
  /// The ID of the Savings Plan.
  final String? savingsPlanId;

  CreateSavingsPlanResponse({
    this.savingsPlanId,
  });

  factory CreateSavingsPlanResponse.fromJson(Map<String, dynamic> json) {
    return CreateSavingsPlanResponse(
      savingsPlanId: json['savingsPlanId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final savingsPlanId = this.savingsPlanId;
    return {
      if (savingsPlanId != null) 'savingsPlanId': savingsPlanId,
    };
  }
}

/// @nodoc
class DeleteQueuedSavingsPlanResponse {
  DeleteQueuedSavingsPlanResponse();

  factory DeleteQueuedSavingsPlanResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueuedSavingsPlanResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DescribeSavingsPlanRatesResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The ID of the Savings Plan.
  final String? savingsPlanId;

  /// Information about the Savings Plan rates.
  final List<SavingsPlanRate>? searchResults;

  DescribeSavingsPlanRatesResponse({
    this.nextToken,
    this.savingsPlanId,
    this.searchResults,
  });

  factory DescribeSavingsPlanRatesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSavingsPlanRatesResponse(
      nextToken: json['nextToken'] as String?,
      savingsPlanId: json['savingsPlanId'] as String?,
      searchResults: (json['searchResults'] as List?)
          ?.nonNulls
          .map((e) => SavingsPlanRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final savingsPlanId = this.savingsPlanId;
    final searchResults = this.searchResults;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (savingsPlanId != null) 'savingsPlanId': savingsPlanId,
      if (searchResults != null) 'searchResults': searchResults,
    };
  }
}

/// @nodoc
class DescribeSavingsPlansResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the Savings Plans.
  final List<SavingsPlan>? savingsPlans;

  DescribeSavingsPlansResponse({
    this.nextToken,
    this.savingsPlans,
  });

  factory DescribeSavingsPlansResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSavingsPlansResponse(
      nextToken: json['nextToken'] as String?,
      savingsPlans: (json['savingsPlans'] as List?)
          ?.nonNulls
          .map((e) => SavingsPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final savingsPlans = this.savingsPlans;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (savingsPlans != null) 'savingsPlans': savingsPlans,
    };
  }
}

/// @nodoc
class DescribeSavingsPlansOfferingRatesResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the Savings Plans offering rates.
  final List<SavingsPlanOfferingRate>? searchResults;

  DescribeSavingsPlansOfferingRatesResponse({
    this.nextToken,
    this.searchResults,
  });

  factory DescribeSavingsPlansOfferingRatesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSavingsPlansOfferingRatesResponse(
      nextToken: json['nextToken'] as String?,
      searchResults: (json['searchResults'] as List?)
          ?.nonNulls
          .map((e) =>
              SavingsPlanOfferingRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final searchResults = this.searchResults;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (searchResults != null) 'searchResults': searchResults,
    };
  }
}

/// @nodoc
class DescribeSavingsPlansOfferingsResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the Savings Plans offerings.
  final List<SavingsPlanOffering>? searchResults;

  DescribeSavingsPlansOfferingsResponse({
    this.nextToken,
    this.searchResults,
  });

  factory DescribeSavingsPlansOfferingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSavingsPlansOfferingsResponse(
      nextToken: json['nextToken'] as String?,
      searchResults: (json['searchResults'] as List?)
          ?.nonNulls
          .map((e) => SavingsPlanOffering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final searchResults = this.searchResults;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (searchResults != null) 'searchResults': searchResults,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Information about the tags.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class ReturnSavingsPlanResponse {
  /// The ID of the Savings Plan.
  final String? savingsPlanId;

  ReturnSavingsPlanResponse({
    this.savingsPlanId,
  });

  factory ReturnSavingsPlanResponse.fromJson(Map<String, dynamic> json) {
    return ReturnSavingsPlanResponse(
      savingsPlanId: json['savingsPlanId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final savingsPlanId = this.savingsPlanId;
    return {
      if (savingsPlanId != null) 'savingsPlanId': savingsPlanId,
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

/// Information about a Savings Plan offering.
///
/// @nodoc
class SavingsPlanOffering {
  /// The currency.
  final CurrencyCode? currency;

  /// The description.
  final String? description;

  /// The duration, in seconds.
  final int? durationSeconds;

  /// The ID of the offering.
  final String? offeringId;

  /// The specific Amazon Web Services operation for the line item in the billing
  /// report.
  final String? operation;

  /// The payment option.
  final SavingsPlanPaymentOption? paymentOption;

  /// The plan type.
  final SavingsPlanType? planType;

  /// The product type.
  final List<SavingsPlanProductType>? productTypes;

  /// The properties.
  final List<SavingsPlanOfferingProperty>? properties;

  /// The service.
  final String? serviceCode;

  /// The usage details of the line item in the billing report.
  final String? usageType;

  SavingsPlanOffering({
    this.currency,
    this.description,
    this.durationSeconds,
    this.offeringId,
    this.operation,
    this.paymentOption,
    this.planType,
    this.productTypes,
    this.properties,
    this.serviceCode,
    this.usageType,
  });

  factory SavingsPlanOffering.fromJson(Map<String, dynamic> json) {
    return SavingsPlanOffering(
      currency: (json['currency'] as String?)?.let(CurrencyCode.fromString),
      description: json['description'] as String?,
      durationSeconds: json['durationSeconds'] as int?,
      offeringId: json['offeringId'] as String?,
      operation: json['operation'] as String?,
      paymentOption: (json['paymentOption'] as String?)
          ?.let(SavingsPlanPaymentOption.fromString),
      planType: (json['planType'] as String?)?.let(SavingsPlanType.fromString),
      productTypes: (json['productTypes'] as List?)
          ?.nonNulls
          .map((e) => SavingsPlanProductType.fromString((e as String)))
          .toList(),
      properties: (json['properties'] as List?)
          ?.nonNulls
          .map((e) =>
              SavingsPlanOfferingProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceCode: json['serviceCode'] as String?,
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final description = this.description;
    final durationSeconds = this.durationSeconds;
    final offeringId = this.offeringId;
    final operation = this.operation;
    final paymentOption = this.paymentOption;
    final planType = this.planType;
    final productTypes = this.productTypes;
    final properties = this.properties;
    final serviceCode = this.serviceCode;
    final usageType = this.usageType;
    return {
      if (currency != null) 'currency': currency.value,
      if (description != null) 'description': description,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (offeringId != null) 'offeringId': offeringId,
      if (operation != null) 'operation': operation,
      if (paymentOption != null) 'paymentOption': paymentOption.value,
      if (planType != null) 'planType': planType.value,
      if (productTypes != null)
        'productTypes': productTypes.map((e) => e.value).toList(),
      if (properties != null) 'properties': properties,
      if (serviceCode != null) 'serviceCode': serviceCode,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

/// @nodoc
class SavingsPlanType {
  static const compute = SavingsPlanType._('Compute');
  static const eC2Instance = SavingsPlanType._('EC2Instance');
  static const sageMaker = SavingsPlanType._('SageMaker');
  static const database = SavingsPlanType._('Database');

  final String value;

  const SavingsPlanType._(this.value);

  static const values = [compute, eC2Instance, sageMaker, database];

  static SavingsPlanType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanType._(value));

  @override
  bool operator ==(other) => other is SavingsPlanType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SavingsPlanPaymentOption {
  static const allUpfront = SavingsPlanPaymentOption._('All Upfront');
  static const partialUpfront = SavingsPlanPaymentOption._('Partial Upfront');
  static const noUpfront = SavingsPlanPaymentOption._('No Upfront');

  final String value;

  const SavingsPlanPaymentOption._(this.value);

  static const values = [allUpfront, partialUpfront, noUpfront];

  static SavingsPlanPaymentOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanPaymentOption._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanPaymentOption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CurrencyCode {
  static const cny = CurrencyCode._('CNY');
  static const usd = CurrencyCode._('USD');
  static const eur = CurrencyCode._('EUR');

  final String value;

  const CurrencyCode._(this.value);

  static const values = [cny, usd, eur];

  static CurrencyCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CurrencyCode._(value));

  @override
  bool operator ==(other) => other is CurrencyCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan offering property.
///
/// @nodoc
class SavingsPlanOfferingProperty {
  /// The property name.
  final SavingsPlanOfferingPropertyKey? name;

  /// The property value.
  final String? value;

  SavingsPlanOfferingProperty({
    this.name,
    this.value,
  });

  factory SavingsPlanOfferingProperty.fromJson(Map<String, dynamic> json) {
    return SavingsPlanOfferingProperty(
      name: (json['name'] as String?)
          ?.let(SavingsPlanOfferingPropertyKey.fromString),
      value: json['value'] as String?,
    );
  }

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
class SavingsPlanOfferingPropertyKey {
  static const region = SavingsPlanOfferingPropertyKey._('region');
  static const instanceFamily =
      SavingsPlanOfferingPropertyKey._('instanceFamily');

  final String value;

  const SavingsPlanOfferingPropertyKey._(this.value);

  static const values = [region, instanceFamily];

  static SavingsPlanOfferingPropertyKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanOfferingPropertyKey._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanOfferingPropertyKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SavingsPlanProductType {
  static const ec2 = SavingsPlanProductType._('EC2');
  static const fargate = SavingsPlanProductType._('Fargate');
  static const lambda = SavingsPlanProductType._('Lambda');
  static const sageMaker = SavingsPlanProductType._('SageMaker');
  static const rds = SavingsPlanProductType._('RDS');
  static const dsql = SavingsPlanProductType._('DSQL');
  static const dynamoDB = SavingsPlanProductType._('DynamoDB');
  static const elastiCache = SavingsPlanProductType._('ElastiCache');
  static const docDB = SavingsPlanProductType._('DocDB');
  static const neptune = SavingsPlanProductType._('Neptune');
  static const timestream = SavingsPlanProductType._('Timestream');
  static const keyspaces = SavingsPlanProductType._('Keyspaces');
  static const dms = SavingsPlanProductType._('DMS');
  static const openSearch = SavingsPlanProductType._('OpenSearch');

  final String value;

  const SavingsPlanProductType._(this.value);

  static const values = [
    ec2,
    fargate,
    lambda,
    sageMaker,
    rds,
    dsql,
    dynamoDB,
    elastiCache,
    docDB,
    neptune,
    timestream,
    keyspaces,
    dms,
    openSearch
  ];

  static SavingsPlanProductType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanProductType._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanProductType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan offering filter.
///
/// @nodoc
class SavingsPlanOfferingFilterElement {
  /// The filter name.
  final SavingsPlanOfferingFilterAttribute? name;

  /// The filter values.
  final List<String>? values;

  SavingsPlanOfferingFilterElement({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class SavingsPlanOfferingFilterAttribute {
  static const region = SavingsPlanOfferingFilterAttribute._('region');
  static const instanceFamily =
      SavingsPlanOfferingFilterAttribute._('instanceFamily');

  final String value;

  const SavingsPlanOfferingFilterAttribute._(this.value);

  static const values = [region, instanceFamily];

  static SavingsPlanOfferingFilterAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanOfferingFilterAttribute._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanOfferingFilterAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan offering rate.
///
/// @nodoc
class SavingsPlanOfferingRate {
  /// The specific Amazon Web Services operation for the line item in the billing
  /// report.
  final String? operation;

  /// The product type.
  final SavingsPlanProductType? productType;

  /// The properties.
  final List<SavingsPlanOfferingRateProperty>? properties;

  /// The Savings Plan rate.
  final String? rate;

  /// The Savings Plan offering.
  final ParentSavingsPlanOffering? savingsPlanOffering;

  /// The service.
  final SavingsPlanRateServiceCode? serviceCode;

  /// The unit.
  final SavingsPlanRateUnit? unit;

  /// The usage details of the line item in the billing report.
  final String? usageType;

  SavingsPlanOfferingRate({
    this.operation,
    this.productType,
    this.properties,
    this.rate,
    this.savingsPlanOffering,
    this.serviceCode,
    this.unit,
    this.usageType,
  });

  factory SavingsPlanOfferingRate.fromJson(Map<String, dynamic> json) {
    return SavingsPlanOfferingRate(
      operation: json['operation'] as String?,
      productType: (json['productType'] as String?)
          ?.let(SavingsPlanProductType.fromString),
      properties: (json['properties'] as List?)
          ?.nonNulls
          .map((e) => SavingsPlanOfferingRateProperty.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      rate: json['rate'] as String?,
      savingsPlanOffering: json['savingsPlanOffering'] != null
          ? ParentSavingsPlanOffering.fromJson(
              json['savingsPlanOffering'] as Map<String, dynamic>)
          : null,
      serviceCode: (json['serviceCode'] as String?)
          ?.let(SavingsPlanRateServiceCode.fromString),
      unit: (json['unit'] as String?)?.let(SavingsPlanRateUnit.fromString),
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    final productType = this.productType;
    final properties = this.properties;
    final rate = this.rate;
    final savingsPlanOffering = this.savingsPlanOffering;
    final serviceCode = this.serviceCode;
    final unit = this.unit;
    final usageType = this.usageType;
    return {
      if (operation != null) 'operation': operation,
      if (productType != null) 'productType': productType.value,
      if (properties != null) 'properties': properties,
      if (rate != null) 'rate': rate,
      if (savingsPlanOffering != null)
        'savingsPlanOffering': savingsPlanOffering,
      if (serviceCode != null) 'serviceCode': serviceCode.value,
      if (unit != null) 'unit': unit.value,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

/// Information about a Savings Plan offering.
///
/// @nodoc
class ParentSavingsPlanOffering {
  /// The currency.
  final CurrencyCode? currency;

  /// The duration, in seconds.
  final int? durationSeconds;

  /// The ID of the offering.
  final String? offeringId;

  /// The payment option.
  final SavingsPlanPaymentOption? paymentOption;

  /// The description.
  final String? planDescription;

  /// The plan type.
  final SavingsPlanType? planType;

  ParentSavingsPlanOffering({
    this.currency,
    this.durationSeconds,
    this.offeringId,
    this.paymentOption,
    this.planDescription,
    this.planType,
  });

  factory ParentSavingsPlanOffering.fromJson(Map<String, dynamic> json) {
    return ParentSavingsPlanOffering(
      currency: (json['currency'] as String?)?.let(CurrencyCode.fromString),
      durationSeconds: json['durationSeconds'] as int?,
      offeringId: json['offeringId'] as String?,
      paymentOption: (json['paymentOption'] as String?)
          ?.let(SavingsPlanPaymentOption.fromString),
      planDescription: json['planDescription'] as String?,
      planType: (json['planType'] as String?)?.let(SavingsPlanType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final durationSeconds = this.durationSeconds;
    final offeringId = this.offeringId;
    final paymentOption = this.paymentOption;
    final planDescription = this.planDescription;
    final planType = this.planType;
    return {
      if (currency != null) 'currency': currency.value,
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (offeringId != null) 'offeringId': offeringId,
      if (paymentOption != null) 'paymentOption': paymentOption.value,
      if (planDescription != null) 'planDescription': planDescription,
      if (planType != null) 'planType': planType.value,
    };
  }
}

/// @nodoc
class SavingsPlanRateUnit {
  static const hrs = SavingsPlanRateUnit._('Hrs');
  static const lambdaGbSecond = SavingsPlanRateUnit._('Lambda-GB-Second');
  static const request = SavingsPlanRateUnit._('Request');
  static const acuHr = SavingsPlanRateUnit._('ACU-Hr');
  static const readRequestUnits = SavingsPlanRateUnit._('ReadRequestUnits');
  static const writeRequestUnits = SavingsPlanRateUnit._('WriteRequestUnits');
  static const readCapacityUnitHrs =
      SavingsPlanRateUnit._('ReadCapacityUnit-Hrs');
  static const writeCapacityUnitHrs =
      SavingsPlanRateUnit._('WriteCapacityUnit-Hrs');
  static const replicatedWriteRequestUnits =
      SavingsPlanRateUnit._('ReplicatedWriteRequestUnits');
  static const replicatedWriteCapacityUnitHrs =
      SavingsPlanRateUnit._('ReplicatedWriteCapacityUnit-Hrs');
  static const gbHours = SavingsPlanRateUnit._('GB-Hours');
  static const dpu = SavingsPlanRateUnit._('DPU');
  static const elastiCacheProcessingUnit =
      SavingsPlanRateUnit._('ElastiCacheProcessingUnit');
  static const dcuHr = SavingsPlanRateUnit._('DCU-Hr');
  static const ncuHr = SavingsPlanRateUnit._('NCU-hr');
  static const ocuHours = SavingsPlanRateUnit._('OCU-hours');
  static const jobs = SavingsPlanRateUnit._('Jobs');

  final String value;

  const SavingsPlanRateUnit._(this.value);

  static const values = [
    hrs,
    lambdaGbSecond,
    request,
    acuHr,
    readRequestUnits,
    writeRequestUnits,
    readCapacityUnitHrs,
    writeCapacityUnitHrs,
    replicatedWriteRequestUnits,
    replicatedWriteCapacityUnitHrs,
    gbHours,
    dpu,
    elastiCacheProcessingUnit,
    dcuHr,
    ncuHr,
    ocuHours,
    jobs
  ];

  static SavingsPlanRateUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanRateUnit._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanRateUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SavingsPlanRateServiceCode {
  static const amazonEC2 = SavingsPlanRateServiceCode._('AmazonEC2');
  static const amazonECS = SavingsPlanRateServiceCode._('AmazonECS');
  static const amazonEKS = SavingsPlanRateServiceCode._('AmazonEKS');
  static const awsLambda = SavingsPlanRateServiceCode._('AWSLambda');
  static const amazonSageMaker =
      SavingsPlanRateServiceCode._('AmazonSageMaker');
  static const amazonRDS = SavingsPlanRateServiceCode._('AmazonRDS');
  static const auroraDSQL = SavingsPlanRateServiceCode._('AuroraDSQL');
  static const amazonDynamoDB = SavingsPlanRateServiceCode._('AmazonDynamoDB');
  static const amazonElastiCache =
      SavingsPlanRateServiceCode._('AmazonElastiCache');
  static const amazonDocDB = SavingsPlanRateServiceCode._('AmazonDocDB');
  static const amazonNeptune = SavingsPlanRateServiceCode._('AmazonNeptune');
  static const amazonTimestream =
      SavingsPlanRateServiceCode._('AmazonTimestream');
  static const amazonMCS = SavingsPlanRateServiceCode._('AmazonMCS');
  static const awsDatabaseMigrationSvc =
      SavingsPlanRateServiceCode._('AWSDatabaseMigrationSvc');
  static const amazonES = SavingsPlanRateServiceCode._('AmazonES');

  final String value;

  const SavingsPlanRateServiceCode._(this.value);

  static const values = [
    amazonEC2,
    amazonECS,
    amazonEKS,
    awsLambda,
    amazonSageMaker,
    amazonRDS,
    auroraDSQL,
    amazonDynamoDB,
    amazonElastiCache,
    amazonDocDB,
    amazonNeptune,
    amazonTimestream,
    amazonMCS,
    awsDatabaseMigrationSvc,
    amazonES
  ];

  static SavingsPlanRateServiceCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanRateServiceCode._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanRateServiceCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan offering rate property.
///
/// @nodoc
class SavingsPlanOfferingRateProperty {
  /// The property name.
  final String? name;

  /// The property value.
  final String? value;

  SavingsPlanOfferingRateProperty({
    this.name,
    this.value,
  });

  factory SavingsPlanOfferingRateProperty.fromJson(Map<String, dynamic> json) {
    return SavingsPlanOfferingRateProperty(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// Information about a Savings Plan offering rate filter.
///
/// @nodoc
class SavingsPlanOfferingRateFilterElement {
  /// The filter name.
  final SavingsPlanRateFilterAttribute? name;

  /// The filter values.
  final List<String>? values;

  SavingsPlanOfferingRateFilterElement({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class SavingsPlanRateFilterAttribute {
  static const region = SavingsPlanRateFilterAttribute._('region');
  static const instanceFamily =
      SavingsPlanRateFilterAttribute._('instanceFamily');
  static const instanceType = SavingsPlanRateFilterAttribute._('instanceType');
  static const productDescription =
      SavingsPlanRateFilterAttribute._('productDescription');
  static const tenancy = SavingsPlanRateFilterAttribute._('tenancy');
  static const productId = SavingsPlanRateFilterAttribute._('productId');

  final String value;

  const SavingsPlanRateFilterAttribute._(this.value);

  static const values = [
    region,
    instanceFamily,
    instanceType,
    productDescription,
    tenancy,
    productId
  ];

  static SavingsPlanRateFilterAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanRateFilterAttribute._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanRateFilterAttribute && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan.
///
/// @nodoc
class SavingsPlan {
  /// The hourly commitment amount in the specified currency.
  final String? commitment;

  /// The currency.
  final CurrencyCode? currency;

  /// The description.
  final String? description;

  /// The EC2 instance family.
  final String? ec2InstanceFamily;

  /// The end time.
  final String? end;

  /// The ID of the offering.
  final String? offeringId;

  /// The payment option.
  final SavingsPlanPaymentOption? paymentOption;

  /// The product types.
  final List<SavingsPlanProductType>? productTypes;

  /// The recurring payment amount.
  final String? recurringPaymentAmount;

  /// The Amazon Web Services Region.
  final String? region;

  /// The time until when a return for the Savings Plan can be requested. If the
  /// Savings Plan is not returnable, the field reflects the Savings Plans start
  /// time.
  final String? returnableUntil;

  /// The Amazon Resource Name (ARN) of the Savings Plan.
  final String? savingsPlanArn;

  /// The ID of the Savings Plan.
  final String? savingsPlanId;

  /// The plan type.
  final SavingsPlanType? savingsPlanType;

  /// The start time.
  final String? start;

  /// The current state.
  final SavingsPlanState? state;

  /// One or more tags.
  final Map<String, String>? tags;

  /// The duration of the term, in seconds.
  final int? termDurationInSeconds;

  /// The up-front payment amount.
  final String? upfrontPaymentAmount;

  SavingsPlan({
    this.commitment,
    this.currency,
    this.description,
    this.ec2InstanceFamily,
    this.end,
    this.offeringId,
    this.paymentOption,
    this.productTypes,
    this.recurringPaymentAmount,
    this.region,
    this.returnableUntil,
    this.savingsPlanArn,
    this.savingsPlanId,
    this.savingsPlanType,
    this.start,
    this.state,
    this.tags,
    this.termDurationInSeconds,
    this.upfrontPaymentAmount,
  });

  factory SavingsPlan.fromJson(Map<String, dynamic> json) {
    return SavingsPlan(
      commitment: json['commitment'] as String?,
      currency: (json['currency'] as String?)?.let(CurrencyCode.fromString),
      description: json['description'] as String?,
      ec2InstanceFamily: json['ec2InstanceFamily'] as String?,
      end: json['end'] as String?,
      offeringId: json['offeringId'] as String?,
      paymentOption: (json['paymentOption'] as String?)
          ?.let(SavingsPlanPaymentOption.fromString),
      productTypes: (json['productTypes'] as List?)
          ?.nonNulls
          .map((e) => SavingsPlanProductType.fromString((e as String)))
          .toList(),
      recurringPaymentAmount: json['recurringPaymentAmount'] as String?,
      region: json['region'] as String?,
      returnableUntil: json['returnableUntil'] as String?,
      savingsPlanArn: json['savingsPlanArn'] as String?,
      savingsPlanId: json['savingsPlanId'] as String?,
      savingsPlanType:
          (json['savingsPlanType'] as String?)?.let(SavingsPlanType.fromString),
      start: json['start'] as String?,
      state: (json['state'] as String?)?.let(SavingsPlanState.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      termDurationInSeconds: json['termDurationInSeconds'] as int?,
      upfrontPaymentAmount: json['upfrontPaymentAmount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final commitment = this.commitment;
    final currency = this.currency;
    final description = this.description;
    final ec2InstanceFamily = this.ec2InstanceFamily;
    final end = this.end;
    final offeringId = this.offeringId;
    final paymentOption = this.paymentOption;
    final productTypes = this.productTypes;
    final recurringPaymentAmount = this.recurringPaymentAmount;
    final region = this.region;
    final returnableUntil = this.returnableUntil;
    final savingsPlanArn = this.savingsPlanArn;
    final savingsPlanId = this.savingsPlanId;
    final savingsPlanType = this.savingsPlanType;
    final start = this.start;
    final state = this.state;
    final tags = this.tags;
    final termDurationInSeconds = this.termDurationInSeconds;
    final upfrontPaymentAmount = this.upfrontPaymentAmount;
    return {
      if (commitment != null) 'commitment': commitment,
      if (currency != null) 'currency': currency.value,
      if (description != null) 'description': description,
      if (ec2InstanceFamily != null) 'ec2InstanceFamily': ec2InstanceFamily,
      if (end != null) 'end': end,
      if (offeringId != null) 'offeringId': offeringId,
      if (paymentOption != null) 'paymentOption': paymentOption.value,
      if (productTypes != null)
        'productTypes': productTypes.map((e) => e.value).toList(),
      if (recurringPaymentAmount != null)
        'recurringPaymentAmount': recurringPaymentAmount,
      if (region != null) 'region': region,
      if (returnableUntil != null) 'returnableUntil': returnableUntil,
      if (savingsPlanArn != null) 'savingsPlanArn': savingsPlanArn,
      if (savingsPlanId != null) 'savingsPlanId': savingsPlanId,
      if (savingsPlanType != null) 'savingsPlanType': savingsPlanType.value,
      if (start != null) 'start': start,
      if (state != null) 'state': state.value,
      if (tags != null) 'tags': tags,
      if (termDurationInSeconds != null)
        'termDurationInSeconds': termDurationInSeconds,
      if (upfrontPaymentAmount != null)
        'upfrontPaymentAmount': upfrontPaymentAmount,
    };
  }
}

/// @nodoc
class SavingsPlanState {
  static const paymentPending = SavingsPlanState._('payment-pending');
  static const paymentFailed = SavingsPlanState._('payment-failed');
  static const active = SavingsPlanState._('active');
  static const retired = SavingsPlanState._('retired');
  static const queued = SavingsPlanState._('queued');
  static const queuedDeleted = SavingsPlanState._('queued-deleted');
  static const pendingReturn = SavingsPlanState._('pending-return');
  static const returned = SavingsPlanState._('returned');

  final String value;

  const SavingsPlanState._(this.value);

  static const values = [
    paymentPending,
    paymentFailed,
    active,
    retired,
    queued,
    queuedDeleted,
    pendingReturn,
    returned
  ];

  static SavingsPlanState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanState._(value));

  @override
  bool operator ==(other) => other is SavingsPlanState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan filter.
///
/// @nodoc
class SavingsPlanFilter {
  /// The filter name.
  final SavingsPlansFilterName? name;

  /// The filter value.
  final List<String>? values;

  SavingsPlanFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class SavingsPlansFilterName {
  static const region = SavingsPlansFilterName._('region');
  static const ec2InstanceFamily =
      SavingsPlansFilterName._('ec2-instance-family');
  static const commitment = SavingsPlansFilterName._('commitment');
  static const upfront = SavingsPlansFilterName._('upfront');
  static const term = SavingsPlansFilterName._('term');
  static const savingsPlanType = SavingsPlansFilterName._('savings-plan-type');
  static const paymentOption = SavingsPlansFilterName._('payment-option');
  static const start = SavingsPlansFilterName._('start');
  static const end = SavingsPlansFilterName._('end');
  static const instanceFamily = SavingsPlansFilterName._('instance-family');

  final String value;

  const SavingsPlansFilterName._(this.value);

  static const values = [
    region,
    ec2InstanceFamily,
    commitment,
    upfront,
    term,
    savingsPlanType,
    paymentOption,
    start,
    end,
    instanceFamily
  ];

  static SavingsPlansFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlansFilterName._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlansFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan rate.
///
/// @nodoc
class SavingsPlanRate {
  /// The currency.
  final CurrencyCode? currency;

  /// The specific Amazon Web Services operation for the line item in the billing
  /// report.
  final String? operation;

  /// The product type.
  final SavingsPlanProductType? productType;

  /// The properties.
  final List<SavingsPlanRateProperty>? properties;

  /// The rate.
  final String? rate;

  /// The service.
  final SavingsPlanRateServiceCode? serviceCode;

  /// The unit.
  final SavingsPlanRateUnit? unit;

  /// The usage details of the line item in the billing report.
  final String? usageType;

  SavingsPlanRate({
    this.currency,
    this.operation,
    this.productType,
    this.properties,
    this.rate,
    this.serviceCode,
    this.unit,
    this.usageType,
  });

  factory SavingsPlanRate.fromJson(Map<String, dynamic> json) {
    return SavingsPlanRate(
      currency: (json['currency'] as String?)?.let(CurrencyCode.fromString),
      operation: json['operation'] as String?,
      productType: (json['productType'] as String?)
          ?.let(SavingsPlanProductType.fromString),
      properties: (json['properties'] as List?)
          ?.nonNulls
          .map((e) =>
              SavingsPlanRateProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      rate: json['rate'] as String?,
      serviceCode: (json['serviceCode'] as String?)
          ?.let(SavingsPlanRateServiceCode.fromString),
      unit: (json['unit'] as String?)?.let(SavingsPlanRateUnit.fromString),
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currency = this.currency;
    final operation = this.operation;
    final productType = this.productType;
    final properties = this.properties;
    final rate = this.rate;
    final serviceCode = this.serviceCode;
    final unit = this.unit;
    final usageType = this.usageType;
    return {
      if (currency != null) 'currency': currency.value,
      if (operation != null) 'operation': operation,
      if (productType != null) 'productType': productType.value,
      if (properties != null) 'properties': properties,
      if (rate != null) 'rate': rate,
      if (serviceCode != null) 'serviceCode': serviceCode.value,
      if (unit != null) 'unit': unit.value,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

/// Information about a Savings Plan rate property.
///
/// @nodoc
class SavingsPlanRateProperty {
  /// The property name.
  final SavingsPlanRatePropertyKey? name;

  /// The property value.
  final String? value;

  SavingsPlanRateProperty({
    this.name,
    this.value,
  });

  factory SavingsPlanRateProperty.fromJson(Map<String, dynamic> json) {
    return SavingsPlanRateProperty(
      name:
          (json['name'] as String?)?.let(SavingsPlanRatePropertyKey.fromString),
      value: json['value'] as String?,
    );
  }

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
class SavingsPlanRatePropertyKey {
  static const region = SavingsPlanRatePropertyKey._('region');
  static const instanceType = SavingsPlanRatePropertyKey._('instanceType');
  static const instanceFamily = SavingsPlanRatePropertyKey._('instanceFamily');
  static const productDescription =
      SavingsPlanRatePropertyKey._('productDescription');
  static const tenancy = SavingsPlanRatePropertyKey._('tenancy');

  final String value;

  const SavingsPlanRatePropertyKey._(this.value);

  static const values = [
    region,
    instanceType,
    instanceFamily,
    productDescription,
    tenancy
  ];

  static SavingsPlanRatePropertyKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanRatePropertyKey._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanRatePropertyKey && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Savings Plan rate filter.
///
/// @nodoc
class SavingsPlanRateFilter {
  /// The filter name.
  final SavingsPlanRateFilterName? name;

  /// The filter values.
  final List<String>? values;

  SavingsPlanRateFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name.value,
      if (values != null) 'values': values,
    };
  }
}

/// @nodoc
class SavingsPlanRateFilterName {
  static const region = SavingsPlanRateFilterName._('region');
  static const instanceType = SavingsPlanRateFilterName._('instanceType');
  static const productDescription =
      SavingsPlanRateFilterName._('productDescription');
  static const tenancy = SavingsPlanRateFilterName._('tenancy');
  static const productType = SavingsPlanRateFilterName._('productType');
  static const serviceCode = SavingsPlanRateFilterName._('serviceCode');
  static const usageType = SavingsPlanRateFilterName._('usageType');
  static const operation = SavingsPlanRateFilterName._('operation');

  final String value;

  const SavingsPlanRateFilterName._(this.value);

  static const values = [
    region,
    instanceType,
    productDescription,
    tenancy,
    productType,
    serviceCode,
    usageType,
    operation
  ];

  static SavingsPlanRateFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SavingsPlanRateFilterName._(value));

  @override
  bool operator ==(other) =>
      other is SavingsPlanRateFilterName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
