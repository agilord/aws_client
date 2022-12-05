// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Savings Plans are a pricing model that offer significant savings on AWS
/// usage (for example, on Amazon EC2 instances). You commit to a consistent
/// amount of usage, in USD per hour, for a term of 1 or 3 years, and receive a
/// lower price for that usage. For more information, see the <a
/// href="https://docs.aws.amazon.com/savingsplans/latest/userguide/">AWS
/// Savings Plans User Guide</a>.
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
  /// The hourly commitment, in USD. This is a value between 0.001 and 1
  /// million. You cannot specify more than three digits after the decimal
  /// point.
  ///
  /// Parameter [savingsPlanOfferingId] :
  /// The ID of the offering.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [purchaseTime] :
  /// The time at which to purchase the Savings Plan, in UTC format
  /// (YYYY-MM-DDTHH:MM:SSZ).
  ///
  /// Parameter [tags] :
  /// One or more tags.
  ///
  /// Parameter [upfrontPaymentAmount] :
  /// The up-front payment amount. This is a whole number between 50 and 99
  /// percent of the total value of the Savings Plan. This parameter is
  /// supported only if the payment option is <code>Partial Upfront</code>.
  Future<CreateSavingsPlanResponse> createSavingsPlan({
    required String commitment,
    required String savingsPlanOfferingId,
    String? clientToken,
    DateTime? purchaseTime,
    Map<String, String>? tags,
    String? upfrontPaymentAmount,
  }) async {
    ArgumentError.checkNotNull(commitment, 'commitment');
    ArgumentError.checkNotNull(savingsPlanOfferingId, 'savingsPlanOfferingId');
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
    ArgumentError.checkNotNull(savingsPlanId, 'savingsPlanId');
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

  /// Describes the specified Savings Plans rates.
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
    ArgumentError.checkNotNull(savingsPlanId, 'savingsPlanId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
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
  /// The states.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (savingsPlanArns != null) 'savingsPlanArns': savingsPlanArns,
      if (savingsPlanIds != null) 'savingsPlanIds': savingsPlanIds,
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSavingsPlans',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSavingsPlansResponse.fromJson(response);
  }

  /// Describes the specified Savings Plans offering rates.
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
  /// The specific AWS operation for the line item in the billing report.
  ///
  /// Parameter [products] :
  /// The AWS products.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (operations != null) 'operations': operations,
      if (products != null)
        'products': products.map((e) => e.toValue()).toList(),
      if (savingsPlanOfferingIds != null)
        'savingsPlanOfferingIds': savingsPlanOfferingIds,
      if (savingsPlanPaymentOptions != null)
        'savingsPlanPaymentOptions':
            savingsPlanPaymentOptions.map((e) => e.toValue()).toList(),
      if (savingsPlanTypes != null)
        'savingsPlanTypes': savingsPlanTypes.map((e) => e.toValue()).toList(),
      if (serviceCodes != null)
        'serviceCodes': serviceCodes.map((e) => e.toValue()).toList(),
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

  /// Describes the specified Savings Plans offerings.
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
  /// The durations, in seconds.
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
  /// The specific AWS operation for the line item in the billing report.
  ///
  /// Parameter [paymentOptions] :
  /// The payment options.
  ///
  /// Parameter [planTypes] :
  /// The plan type.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      if (currencies != null)
        'currencies': currencies.map((e) => e.toValue()).toList(),
      if (descriptions != null) 'descriptions': descriptions,
      if (durations != null) 'durations': durations,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (offeringIds != null) 'offeringIds': offeringIds,
      if (operations != null) 'operations': operations,
      if (paymentOptions != null)
        'paymentOptions': paymentOptions.map((e) => e.toValue()).toList(),
      if (planTypes != null)
        'planTypes': planTypes.map((e) => e.toValue()).toList(),
      if (productType != null) 'productType': productType.toValue(),
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
}

enum CurrencyCode {
  cny,
  usd,
}

extension CurrencyCodeValueExtension on CurrencyCode {
  String toValue() {
    switch (this) {
      case CurrencyCode.cny:
        return 'CNY';
      case CurrencyCode.usd:
        return 'USD';
    }
  }
}

extension CurrencyCodeFromString on String {
  CurrencyCode toCurrencyCode() {
    switch (this) {
      case 'CNY':
        return CurrencyCode.cny;
      case 'USD':
        return CurrencyCode.usd;
    }
    throw Exception('$this is not known in enum CurrencyCode');
  }
}

class DeleteQueuedSavingsPlanResponse {
  DeleteQueuedSavingsPlanResponse();
  factory DeleteQueuedSavingsPlanResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueuedSavingsPlanResponse();
  }
}

class DescribeSavingsPlanRatesResponse {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The ID of the Savings Plan.
  final String? savingsPlanId;

  /// Information about the Savings Plans rates.
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
          ?.whereNotNull()
          .map((e) => SavingsPlanRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.whereNotNull()
          .map((e) =>
              SavingsPlanOfferingRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.whereNotNull()
          .map((e) => SavingsPlanOffering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
          ?.whereNotNull()
          .map((e) => SavingsPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
      currency: (json['currency'] as String?)?.toCurrencyCode(),
      durationSeconds: json['durationSeconds'] as int?,
      offeringId: json['offeringId'] as String?,
      paymentOption:
          (json['paymentOption'] as String?)?.toSavingsPlanPaymentOption(),
      planDescription: json['planDescription'] as String?,
      planType: (json['planType'] as String?)?.toSavingsPlanType(),
    );
  }
}

/// Information about a Savings Plan.
class SavingsPlan {
  /// The hourly commitment, in USD.
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

  /// The AWS Region.
  final String? region;

  /// The Amazon Resource Name (ARN) of the Savings Plan.
  final String? savingsPlanArn;

  /// The ID of the Savings Plan.
  final String? savingsPlanId;

  /// The plan type.
  final SavingsPlanType? savingsPlanType;

  /// The start time.
  final String? start;

  /// The state.
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
      currency: (json['currency'] as String?)?.toCurrencyCode(),
      description: json['description'] as String?,
      ec2InstanceFamily: json['ec2InstanceFamily'] as String?,
      end: json['end'] as String?,
      offeringId: json['offeringId'] as String?,
      paymentOption:
          (json['paymentOption'] as String?)?.toSavingsPlanPaymentOption(),
      productTypes: (json['productTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSavingsPlanProductType())
          .toList(),
      recurringPaymentAmount: json['recurringPaymentAmount'] as String?,
      region: json['region'] as String?,
      savingsPlanArn: json['savingsPlanArn'] as String?,
      savingsPlanId: json['savingsPlanId'] as String?,
      savingsPlanType:
          (json['savingsPlanType'] as String?)?.toSavingsPlanType(),
      start: json['start'] as String?,
      state: (json['state'] as String?)?.toSavingsPlanState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      termDurationInSeconds: json['termDurationInSeconds'] as int?,
      upfrontPaymentAmount: json['upfrontPaymentAmount'] as String?,
    );
  }
}

/// Information about a filter.
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
      if (name != null) 'name': name.toValue(),
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

  /// The specific AWS operation for the line item in the billing report.
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
      currency: (json['currency'] as String?)?.toCurrencyCode(),
      description: json['description'] as String?,
      durationSeconds: json['durationSeconds'] as int?,
      offeringId: json['offeringId'] as String?,
      operation: json['operation'] as String?,
      paymentOption:
          (json['paymentOption'] as String?)?.toSavingsPlanPaymentOption(),
      planType: (json['planType'] as String?)?.toSavingsPlanType(),
      productTypes: (json['productTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSavingsPlanProductType())
          .toList(),
      properties: (json['properties'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SavingsPlanOfferingProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceCode: json['serviceCode'] as String?,
      usageType: json['usageType'] as String?,
    );
  }
}

enum SavingsPlanOfferingFilterAttribute {
  region,
  instanceFamily,
}

extension SavingsPlanOfferingFilterAttributeValueExtension
    on SavingsPlanOfferingFilterAttribute {
  String toValue() {
    switch (this) {
      case SavingsPlanOfferingFilterAttribute.region:
        return 'region';
      case SavingsPlanOfferingFilterAttribute.instanceFamily:
        return 'instanceFamily';
    }
  }
}

extension SavingsPlanOfferingFilterAttributeFromString on String {
  SavingsPlanOfferingFilterAttribute toSavingsPlanOfferingFilterAttribute() {
    switch (this) {
      case 'region':
        return SavingsPlanOfferingFilterAttribute.region;
      case 'instanceFamily':
        return SavingsPlanOfferingFilterAttribute.instanceFamily;
    }
    throw Exception(
        '$this is not known in enum SavingsPlanOfferingFilterAttribute');
  }
}

/// Information about a filter.
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
      if (name != null) 'name': name.toValue(),
      if (values != null) 'values': values,
    };
  }
}

/// Information about a property.
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
      name: (json['name'] as String?)?.toSavingsPlanOfferingPropertyKey(),
      value: json['value'] as String?,
    );
  }
}

enum SavingsPlanOfferingPropertyKey {
  region,
  instanceFamily,
}

extension SavingsPlanOfferingPropertyKeyValueExtension
    on SavingsPlanOfferingPropertyKey {
  String toValue() {
    switch (this) {
      case SavingsPlanOfferingPropertyKey.region:
        return 'region';
      case SavingsPlanOfferingPropertyKey.instanceFamily:
        return 'instanceFamily';
    }
  }
}

extension SavingsPlanOfferingPropertyKeyFromString on String {
  SavingsPlanOfferingPropertyKey toSavingsPlanOfferingPropertyKey() {
    switch (this) {
      case 'region':
        return SavingsPlanOfferingPropertyKey.region;
      case 'instanceFamily':
        return SavingsPlanOfferingPropertyKey.instanceFamily;
    }
    throw Exception(
        '$this is not known in enum SavingsPlanOfferingPropertyKey');
  }
}

/// Information about a Savings Plan offering rate.
class SavingsPlanOfferingRate {
  /// The specific AWS operation for the line item in the billing report.
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
      productType: (json['productType'] as String?)?.toSavingsPlanProductType(),
      properties: (json['properties'] as List?)
          ?.whereNotNull()
          .map((e) => SavingsPlanOfferingRateProperty.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      rate: json['rate'] as String?,
      savingsPlanOffering: json['savingsPlanOffering'] != null
          ? ParentSavingsPlanOffering.fromJson(
              json['savingsPlanOffering'] as Map<String, dynamic>)
          : null,
      serviceCode:
          (json['serviceCode'] as String?)?.toSavingsPlanRateServiceCode(),
      unit: (json['unit'] as String?)?.toSavingsPlanRateUnit(),
      usageType: json['usageType'] as String?,
    );
  }
}

/// Information about a filter.
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
      if (name != null) 'name': name.toValue(),
      if (values != null) 'values': values,
    };
  }
}

/// Information about a property.
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
}

enum SavingsPlanPaymentOption {
  allUpfront,
  partialUpfront,
  noUpfront,
}

extension SavingsPlanPaymentOptionValueExtension on SavingsPlanPaymentOption {
  String toValue() {
    switch (this) {
      case SavingsPlanPaymentOption.allUpfront:
        return 'All Upfront';
      case SavingsPlanPaymentOption.partialUpfront:
        return 'Partial Upfront';
      case SavingsPlanPaymentOption.noUpfront:
        return 'No Upfront';
    }
  }
}

extension SavingsPlanPaymentOptionFromString on String {
  SavingsPlanPaymentOption toSavingsPlanPaymentOption() {
    switch (this) {
      case 'All Upfront':
        return SavingsPlanPaymentOption.allUpfront;
      case 'Partial Upfront':
        return SavingsPlanPaymentOption.partialUpfront;
      case 'No Upfront':
        return SavingsPlanPaymentOption.noUpfront;
    }
    throw Exception('$this is not known in enum SavingsPlanPaymentOption');
  }
}

enum SavingsPlanProductType {
  ec2,
  fargate,
  lambda,
}

extension SavingsPlanProductTypeValueExtension on SavingsPlanProductType {
  String toValue() {
    switch (this) {
      case SavingsPlanProductType.ec2:
        return 'EC2';
      case SavingsPlanProductType.fargate:
        return 'Fargate';
      case SavingsPlanProductType.lambda:
        return 'Lambda';
    }
  }
}

extension SavingsPlanProductTypeFromString on String {
  SavingsPlanProductType toSavingsPlanProductType() {
    switch (this) {
      case 'EC2':
        return SavingsPlanProductType.ec2;
      case 'Fargate':
        return SavingsPlanProductType.fargate;
      case 'Lambda':
        return SavingsPlanProductType.lambda;
    }
    throw Exception('$this is not known in enum SavingsPlanProductType');
  }
}

/// Information about a Savings Plan rate.
class SavingsPlanRate {
  /// The currency.
  final CurrencyCode? currency;

  /// The specific AWS operation for the line item in the billing report.
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
      currency: (json['currency'] as String?)?.toCurrencyCode(),
      operation: json['operation'] as String?,
      productType: (json['productType'] as String?)?.toSavingsPlanProductType(),
      properties: (json['properties'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SavingsPlanRateProperty.fromJson(e as Map<String, dynamic>))
          .toList(),
      rate: json['rate'] as String?,
      serviceCode:
          (json['serviceCode'] as String?)?.toSavingsPlanRateServiceCode(),
      unit: (json['unit'] as String?)?.toSavingsPlanRateUnit(),
      usageType: json['usageType'] as String?,
    );
  }
}

/// Information about a filter.
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
      if (name != null) 'name': name.toValue(),
      if (values != null) 'values': values,
    };
  }
}

enum SavingsPlanRateFilterAttribute {
  region,
  instanceFamily,
  instanceType,
  productDescription,
  tenancy,
  productId,
}

extension SavingsPlanRateFilterAttributeValueExtension
    on SavingsPlanRateFilterAttribute {
  String toValue() {
    switch (this) {
      case SavingsPlanRateFilterAttribute.region:
        return 'region';
      case SavingsPlanRateFilterAttribute.instanceFamily:
        return 'instanceFamily';
      case SavingsPlanRateFilterAttribute.instanceType:
        return 'instanceType';
      case SavingsPlanRateFilterAttribute.productDescription:
        return 'productDescription';
      case SavingsPlanRateFilterAttribute.tenancy:
        return 'tenancy';
      case SavingsPlanRateFilterAttribute.productId:
        return 'productId';
    }
  }
}

extension SavingsPlanRateFilterAttributeFromString on String {
  SavingsPlanRateFilterAttribute toSavingsPlanRateFilterAttribute() {
    switch (this) {
      case 'region':
        return SavingsPlanRateFilterAttribute.region;
      case 'instanceFamily':
        return SavingsPlanRateFilterAttribute.instanceFamily;
      case 'instanceType':
        return SavingsPlanRateFilterAttribute.instanceType;
      case 'productDescription':
        return SavingsPlanRateFilterAttribute.productDescription;
      case 'tenancy':
        return SavingsPlanRateFilterAttribute.tenancy;
      case 'productId':
        return SavingsPlanRateFilterAttribute.productId;
    }
    throw Exception(
        '$this is not known in enum SavingsPlanRateFilterAttribute');
  }
}

enum SavingsPlanRateFilterName {
  region,
  instanceType,
  productDescription,
  tenancy,
  productType,
  serviceCode,
  usageType,
  operation,
}

extension SavingsPlanRateFilterNameValueExtension on SavingsPlanRateFilterName {
  String toValue() {
    switch (this) {
      case SavingsPlanRateFilterName.region:
        return 'region';
      case SavingsPlanRateFilterName.instanceType:
        return 'instanceType';
      case SavingsPlanRateFilterName.productDescription:
        return 'productDescription';
      case SavingsPlanRateFilterName.tenancy:
        return 'tenancy';
      case SavingsPlanRateFilterName.productType:
        return 'productType';
      case SavingsPlanRateFilterName.serviceCode:
        return 'serviceCode';
      case SavingsPlanRateFilterName.usageType:
        return 'usageType';
      case SavingsPlanRateFilterName.operation:
        return 'operation';
    }
  }
}

extension SavingsPlanRateFilterNameFromString on String {
  SavingsPlanRateFilterName toSavingsPlanRateFilterName() {
    switch (this) {
      case 'region':
        return SavingsPlanRateFilterName.region;
      case 'instanceType':
        return SavingsPlanRateFilterName.instanceType;
      case 'productDescription':
        return SavingsPlanRateFilterName.productDescription;
      case 'tenancy':
        return SavingsPlanRateFilterName.tenancy;
      case 'productType':
        return SavingsPlanRateFilterName.productType;
      case 'serviceCode':
        return SavingsPlanRateFilterName.serviceCode;
      case 'usageType':
        return SavingsPlanRateFilterName.usageType;
      case 'operation':
        return SavingsPlanRateFilterName.operation;
    }
    throw Exception('$this is not known in enum SavingsPlanRateFilterName');
  }
}

/// Information about a property.
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
      name: (json['name'] as String?)?.toSavingsPlanRatePropertyKey(),
      value: json['value'] as String?,
    );
  }
}

enum SavingsPlanRatePropertyKey {
  region,
  instanceType,
  instanceFamily,
  productDescription,
  tenancy,
}

extension SavingsPlanRatePropertyKeyValueExtension
    on SavingsPlanRatePropertyKey {
  String toValue() {
    switch (this) {
      case SavingsPlanRatePropertyKey.region:
        return 'region';
      case SavingsPlanRatePropertyKey.instanceType:
        return 'instanceType';
      case SavingsPlanRatePropertyKey.instanceFamily:
        return 'instanceFamily';
      case SavingsPlanRatePropertyKey.productDescription:
        return 'productDescription';
      case SavingsPlanRatePropertyKey.tenancy:
        return 'tenancy';
    }
  }
}

extension SavingsPlanRatePropertyKeyFromString on String {
  SavingsPlanRatePropertyKey toSavingsPlanRatePropertyKey() {
    switch (this) {
      case 'region':
        return SavingsPlanRatePropertyKey.region;
      case 'instanceType':
        return SavingsPlanRatePropertyKey.instanceType;
      case 'instanceFamily':
        return SavingsPlanRatePropertyKey.instanceFamily;
      case 'productDescription':
        return SavingsPlanRatePropertyKey.productDescription;
      case 'tenancy':
        return SavingsPlanRatePropertyKey.tenancy;
    }
    throw Exception('$this is not known in enum SavingsPlanRatePropertyKey');
  }
}

enum SavingsPlanRateServiceCode {
  amazonEC2,
  amazonECS,
  awsLambda,
}

extension SavingsPlanRateServiceCodeValueExtension
    on SavingsPlanRateServiceCode {
  String toValue() {
    switch (this) {
      case SavingsPlanRateServiceCode.amazonEC2:
        return 'AmazonEC2';
      case SavingsPlanRateServiceCode.amazonECS:
        return 'AmazonECS';
      case SavingsPlanRateServiceCode.awsLambda:
        return 'AWSLambda';
    }
  }
}

extension SavingsPlanRateServiceCodeFromString on String {
  SavingsPlanRateServiceCode toSavingsPlanRateServiceCode() {
    switch (this) {
      case 'AmazonEC2':
        return SavingsPlanRateServiceCode.amazonEC2;
      case 'AmazonECS':
        return SavingsPlanRateServiceCode.amazonECS;
      case 'AWSLambda':
        return SavingsPlanRateServiceCode.awsLambda;
    }
    throw Exception('$this is not known in enum SavingsPlanRateServiceCode');
  }
}

enum SavingsPlanRateUnit {
  hrs,
  lambdaGbSecond,
  request,
}

extension SavingsPlanRateUnitValueExtension on SavingsPlanRateUnit {
  String toValue() {
    switch (this) {
      case SavingsPlanRateUnit.hrs:
        return 'Hrs';
      case SavingsPlanRateUnit.lambdaGbSecond:
        return 'Lambda-GB-Second';
      case SavingsPlanRateUnit.request:
        return 'Request';
    }
  }
}

extension SavingsPlanRateUnitFromString on String {
  SavingsPlanRateUnit toSavingsPlanRateUnit() {
    switch (this) {
      case 'Hrs':
        return SavingsPlanRateUnit.hrs;
      case 'Lambda-GB-Second':
        return SavingsPlanRateUnit.lambdaGbSecond;
      case 'Request':
        return SavingsPlanRateUnit.request;
    }
    throw Exception('$this is not known in enum SavingsPlanRateUnit');
  }
}

enum SavingsPlanState {
  paymentPending,
  paymentFailed,
  active,
  retired,
  queued,
  queuedDeleted,
}

extension SavingsPlanStateValueExtension on SavingsPlanState {
  String toValue() {
    switch (this) {
      case SavingsPlanState.paymentPending:
        return 'payment-pending';
      case SavingsPlanState.paymentFailed:
        return 'payment-failed';
      case SavingsPlanState.active:
        return 'active';
      case SavingsPlanState.retired:
        return 'retired';
      case SavingsPlanState.queued:
        return 'queued';
      case SavingsPlanState.queuedDeleted:
        return 'queued-deleted';
    }
  }
}

extension SavingsPlanStateFromString on String {
  SavingsPlanState toSavingsPlanState() {
    switch (this) {
      case 'payment-pending':
        return SavingsPlanState.paymentPending;
      case 'payment-failed':
        return SavingsPlanState.paymentFailed;
      case 'active':
        return SavingsPlanState.active;
      case 'retired':
        return SavingsPlanState.retired;
      case 'queued':
        return SavingsPlanState.queued;
      case 'queued-deleted':
        return SavingsPlanState.queuedDeleted;
    }
    throw Exception('$this is not known in enum SavingsPlanState');
  }
}

enum SavingsPlanType {
  compute,
  eC2Instance,
}

extension SavingsPlanTypeValueExtension on SavingsPlanType {
  String toValue() {
    switch (this) {
      case SavingsPlanType.compute:
        return 'Compute';
      case SavingsPlanType.eC2Instance:
        return 'EC2Instance';
    }
  }
}

extension SavingsPlanTypeFromString on String {
  SavingsPlanType toSavingsPlanType() {
    switch (this) {
      case 'Compute':
        return SavingsPlanType.compute;
      case 'EC2Instance':
        return SavingsPlanType.eC2Instance;
    }
    throw Exception('$this is not known in enum SavingsPlanType');
  }
}

enum SavingsPlansFilterName {
  region,
  ec2InstanceFamily,
  commitment,
  upfront,
  term,
  savingsPlanType,
  paymentOption,
  start,
  end,
}

extension SavingsPlansFilterNameValueExtension on SavingsPlansFilterName {
  String toValue() {
    switch (this) {
      case SavingsPlansFilterName.region:
        return 'region';
      case SavingsPlansFilterName.ec2InstanceFamily:
        return 'ec2-instance-family';
      case SavingsPlansFilterName.commitment:
        return 'commitment';
      case SavingsPlansFilterName.upfront:
        return 'upfront';
      case SavingsPlansFilterName.term:
        return 'term';
      case SavingsPlansFilterName.savingsPlanType:
        return 'savings-plan-type';
      case SavingsPlansFilterName.paymentOption:
        return 'payment-option';
      case SavingsPlansFilterName.start:
        return 'start';
      case SavingsPlansFilterName.end:
        return 'end';
    }
  }
}

extension SavingsPlansFilterNameFromString on String {
  SavingsPlansFilterName toSavingsPlansFilterName() {
    switch (this) {
      case 'region':
        return SavingsPlansFilterName.region;
      case 'ec2-instance-family':
        return SavingsPlansFilterName.ec2InstanceFamily;
      case 'commitment':
        return SavingsPlansFilterName.commitment;
      case 'upfront':
        return SavingsPlansFilterName.upfront;
      case 'term':
        return SavingsPlansFilterName.term;
      case 'savings-plan-type':
        return SavingsPlansFilterName.savingsPlanType;
      case 'payment-option':
        return SavingsPlansFilterName.paymentOption;
      case 'start':
        return SavingsPlansFilterName.start;
      case 'end':
        return SavingsPlansFilterName.end;
    }
    throw Exception('$this is not known in enum SavingsPlansFilterName');
  }
}

class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }
}

class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
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
