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

/// Savings Plans are a pricing model that offer significant savings on Amazon
/// Web Services usage (for example, on Amazon EC2 instances). You commit to a
/// consistent amount of usage per hour, in the specified currency, for a term
/// of one or three years, and receive a lower price for that usage. For more
/// information, see the <a
/// href="https://docs.aws.amazon.com/savingsplans/latest/userguide/">Amazon Web
/// Services Savings Plans User Guide</a>.
class SavingsPlans {
  final _s.RestJsonProtocol _protocol;
  SavingsPlans({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'savingsplans',
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

  /// Creates a Savings Plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
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

  /// Describes the rates for the specified Savings Plan.
  ///
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

  /// Describes the offering rates for the specified Savings Plans.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

enum CurrencyCode {
  cny('CNY'),
  usd('USD'),
  ;

  final String value;

  const CurrencyCode(this.value);

  static CurrencyCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CurrencyCode'));
}

class DeleteQueuedSavingsPlanResponse {
  DeleteQueuedSavingsPlanResponse();

  factory DeleteQueuedSavingsPlanResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueuedSavingsPlanResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

/// Information about a Savings Plan offering.
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

/// Information about a Savings Plan.
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
  /// Savings Plan is not returnable, the field reflects the Savings Plan start
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

/// Information about a Savings Plan filter.
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

/// Information about a Savings Plan offering.
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

enum SavingsPlanOfferingFilterAttribute {
  region('region'),
  instanceFamily('instanceFamily'),
  ;

  final String value;

  const SavingsPlanOfferingFilterAttribute(this.value);

  static SavingsPlanOfferingFilterAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanOfferingFilterAttribute'));
}

/// Information about a Savings Plan offering filter.
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

/// Information about a Savings Plan offering property.
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

enum SavingsPlanOfferingPropertyKey {
  region('region'),
  instanceFamily('instanceFamily'),
  ;

  final String value;

  const SavingsPlanOfferingPropertyKey(this.value);

  static SavingsPlanOfferingPropertyKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanOfferingPropertyKey'));
}

/// Information about a Savings Plan offering rate.
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

/// Information about a Savings Plan offering rate filter.
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

/// Information about a Savings Plan offering rate property.
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

enum SavingsPlanPaymentOption {
  allUpfront('All Upfront'),
  partialUpfront('Partial Upfront'),
  noUpfront('No Upfront'),
  ;

  final String value;

  const SavingsPlanPaymentOption(this.value);

  static SavingsPlanPaymentOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanPaymentOption'));
}

enum SavingsPlanProductType {
  ec2('EC2'),
  fargate('Fargate'),
  lambda('Lambda'),
  sageMaker('SageMaker'),
  ;

  final String value;

  const SavingsPlanProductType(this.value);

  static SavingsPlanProductType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanProductType'));
}

/// Information about a Savings Plan rate.
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

/// Information about a Savings Plan rate filter.
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

enum SavingsPlanRateFilterAttribute {
  region('region'),
  instanceFamily('instanceFamily'),
  instanceType('instanceType'),
  productDescription('productDescription'),
  tenancy('tenancy'),
  productId('productId'),
  ;

  final String value;

  const SavingsPlanRateFilterAttribute(this.value);

  static SavingsPlanRateFilterAttribute fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanRateFilterAttribute'));
}

enum SavingsPlanRateFilterName {
  region('region'),
  instanceType('instanceType'),
  productDescription('productDescription'),
  tenancy('tenancy'),
  productType('productType'),
  serviceCode('serviceCode'),
  usageType('usageType'),
  operation('operation'),
  ;

  final String value;

  const SavingsPlanRateFilterName(this.value);

  static SavingsPlanRateFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanRateFilterName'));
}

/// Information about a Savings Plan rate property.
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

enum SavingsPlanRatePropertyKey {
  region('region'),
  instanceType('instanceType'),
  instanceFamily('instanceFamily'),
  productDescription('productDescription'),
  tenancy('tenancy'),
  ;

  final String value;

  const SavingsPlanRatePropertyKey(this.value);

  static SavingsPlanRatePropertyKey fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanRatePropertyKey'));
}

enum SavingsPlanRateServiceCode {
  amazonEC2('AmazonEC2'),
  amazonECS('AmazonECS'),
  amazonEKS('AmazonEKS'),
  awsLambda('AWSLambda'),
  amazonSageMaker('AmazonSageMaker'),
  ;

  final String value;

  const SavingsPlanRateServiceCode(this.value);

  static SavingsPlanRateServiceCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlanRateServiceCode'));
}

enum SavingsPlanRateUnit {
  hrs('Hrs'),
  lambdaGbSecond('Lambda-GB-Second'),
  request('Request'),
  ;

  final String value;

  const SavingsPlanRateUnit(this.value);

  static SavingsPlanRateUnit fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SavingsPlanRateUnit'));
}

enum SavingsPlanState {
  paymentPending('payment-pending'),
  paymentFailed('payment-failed'),
  active('active'),
  retired('retired'),
  queued('queued'),
  queuedDeleted('queued-deleted'),
  pendingReturn('pending-return'),
  returned('returned'),
  ;

  final String value;

  const SavingsPlanState(this.value);

  static SavingsPlanState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SavingsPlanState'));
}

enum SavingsPlanType {
  compute('Compute'),
  eC2Instance('EC2Instance'),
  sageMaker('SageMaker'),
  ;

  final String value;

  const SavingsPlanType(this.value);

  static SavingsPlanType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SavingsPlanType'));
}

enum SavingsPlansFilterName {
  region('region'),
  ec2InstanceFamily('ec2-instance-family'),
  commitment('commitment'),
  upfront('upfront'),
  term('term'),
  savingsPlanType('savings-plan-type'),
  paymentOption('payment-option'),
  start('start'),
  end('end'),
  ;

  final String value;

  const SavingsPlansFilterName(this.value);

  static SavingsPlansFilterName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SavingsPlansFilterName'));
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
