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

/// AWS Marketplace is a curated digital catalog that customers can use to find,
/// buy, deploy, and manage third-party software, data, and services to build
/// solutions and run their businesses. The AWS Marketplace Agreement Service
/// provides an API interface that helps AWS Marketplace sellers manage their
/// product-related agreements, including listing, searching, and filtering
/// agreements.
///
/// To manage agreements in AWS Marketplace, you must ensure that your AWS
/// Identity and Access Management (IAM) policies and roles are set up. The user
/// must have the required policies/permissions that allow them to carry out the
/// actions in AWS:
///
/// <ul>
/// <li>
/// <code>DescribeAgreement</code> – Grants permission to users to obtain
/// detailed meta data about any of their agreements.
/// </li>
/// <li>
/// <code>GetAgreementTerms</code> – Grants permission to users to obtain
/// details about the terms of an agreement.
/// </li>
/// <li>
/// <code>SearchAgreements</code> – Grants permission to users to search through
/// all their agreements.
/// </li>
/// </ul>
class Agreement {
  final _s.JsonProtocol _protocol;
  Agreement({
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

  /// Provides details about an agreement, such as the proposer, acceptor, start
  /// date, and end date.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [agreementId] :
  /// The unique identifier of the agreement.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of agreements to return in the response.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start pagination
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

  /// Searches across all agreements that a proposer or an acceptor has in AWS
  /// Marketplace. The search returns a list of agreements with basic agreement
  /// information.
  ///
  /// The following filter combinations are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>OfferId</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>ResourceIdentifier</code> +
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>OfferId</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>ResourceType</code> +
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceType</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>OfferId</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>OfferId</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceIdentifier</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceIdentifier</code> + <code>Status</code>
  /// </li>
  /// <li>
  /// <code>PartyType</code> as <code>Proposer</code> +
  /// <code>AgreementType</code> + <code>AcceptorAccountId</code> +
  /// <code>ResourceType</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// (<code>AmiProduct</code>, <code>ContainerProduct</code>, or
  /// <code>SaaSProduct</code>).
  /// </li>
  /// <li>
  /// <code>PartyType</code> – The party type (either <code>Acceptor</code> or
  /// <code>Proposer</code>) of the caller. For agreements where the caller is
  /// the proposer, use the <code>Proposer</code> filter. For agreements where
  /// the caller is the acceptor, use the <code>Acceptor</code> filter.
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
  /// <code>AgreementType</code> – The type of agreement. Values include
  /// <code>PurchaseAgreement</code> or <code>VendorInsightsAgreement</code>.
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
  /// attributes.
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

enum AgreementStatus {
  active,
  archived,
  cancelled,
  expired,
  renewed,
  replaced,
  rolledBack,
  superseded,
  terminated,
}

extension AgreementStatusValueExtension on AgreementStatus {
  String toValue() {
    switch (this) {
      case AgreementStatus.active:
        return 'ACTIVE';
      case AgreementStatus.archived:
        return 'ARCHIVED';
      case AgreementStatus.cancelled:
        return 'CANCELLED';
      case AgreementStatus.expired:
        return 'EXPIRED';
      case AgreementStatus.renewed:
        return 'RENEWED';
      case AgreementStatus.replaced:
        return 'REPLACED';
      case AgreementStatus.rolledBack:
        return 'ROLLED_BACK';
      case AgreementStatus.superseded:
        return 'SUPERSEDED';
      case AgreementStatus.terminated:
        return 'TERMINATED';
    }
  }
}

extension AgreementStatusFromString on String {
  AgreementStatus toAgreementStatus() {
    switch (this) {
      case 'ACTIVE':
        return AgreementStatus.active;
      case 'ARCHIVED':
        return AgreementStatus.archived;
      case 'CANCELLED':
        return AgreementStatus.cancelled;
      case 'EXPIRED':
        return AgreementStatus.expired;
      case 'RENEWED':
        return AgreementStatus.renewed;
      case 'REPLACED':
        return AgreementStatus.replaced;
      case 'ROLLED_BACK':
        return AgreementStatus.rolledBack;
      case 'SUPERSEDED':
        return AgreementStatus.superseded;
      case 'TERMINATED':
        return AgreementStatus.terminated;
    }
    throw Exception('$this is not known in enum AgreementStatus');
  }
}

/// A summary of the agreement, including top-level attributes (for example, the
/// agreement ID, version, proposer, and acceptor).
class AgreementViewSummary {
  /// The date and time that the agreement was accepted.
  final DateTime? acceptanceTime;

  /// Details of the party accepting the agreement terms. This is commonly the
  /// buyer for <code>PurchaseAgreement.</code>
  final Acceptor? acceptor;

  /// The unique identifier of the agreement.
  final String? agreementId;

  /// The type of agreement. Values are <code>PurchaseAgreement</code> or
  /// <code>VendorInsightsAgreement</code>.
  final String? agreementType;

  /// The date and time when the agreement ends. The field is <code>null</code>
  /// for pay-as-you-go agreements, which don’t have end dates.
  final DateTime? endTime;

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
      proposalSummary: json['proposalSummary'] != null
          ? ProposalSummary.fromJson(
              json['proposalSummary'] as Map<String, dynamic>)
          : null,
      proposer: json['proposer'] != null
          ? Proposer.fromJson(json['proposer'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      status: (json['status'] as String?)?.toAgreementStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final acceptanceTime = this.acceptanceTime;
    final acceptor = this.acceptor;
    final agreementId = this.agreementId;
    final agreementType = this.agreementType;
    final endTime = this.endTime;
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
      if (proposalSummary != null) 'proposalSummary': proposalSummary,
      if (proposer != null) 'proposer': proposer,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Enables you and your customers to move your existing agreements to AWS
/// Marketplace. The customer won't be charged for product usage in AWS
/// Marketplace because they already paid for the product outside of AWS
/// Marketplace.
class ByolPricingTerm {
  /// Type of the term being updated.
  final String? type;

  ByolPricingTerm({
    this.type,
  });

  factory ByolPricingTerm.fromJson(Map<String, dynamic> json) {
    return ByolPricingTerm(
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
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

  /// A rate card defines the per unit rates for product dimensions.
  final List<ConfigurableUpfrontRateCardItem>? rateCards;

  /// Category of selector.
  final String? type;

  ConfigurableUpfrontPricingTerm({
    this.configuration,
    this.currencyCode,
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
      rateCards: (json['rateCards'] as List?)
          ?.whereNotNull()
          .map((e) => ConfigurableUpfrontRateCardItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final currencyCode = this.currencyCode;
    final rateCards = this.rateCards;
    final type = this.type;
    return {
      if (configuration != null) 'configuration': configuration,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (rateCards != null) 'rateCards': rateCards,
      if (type != null) 'type': type,
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
      dimensions: (json['dimensions'] as List)
          .whereNotNull()
          .map((e) => Dimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectorValue: json['selectorValue'] as String,
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
          ?.whereNotNull()
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
  /// <code>ROLLED_BACK</code> (Only applicable to inactive agreement revisions) –
  /// The agreement revision has been rolled back because of an error. An earlier
  /// revision is now active.
  /// </li>
  /// <li>
  /// <code>SUPERCEDED</code> (Only applicable to inactive agreement revisions) –
  /// The agreement revision is no longer active and another agreement revision is
  /// now active.
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
      status: (json['status'] as String?)?.toAgreementStatus(),
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
      if (status != null) 'status': status.toValue(),
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
      dimensionKey: json['dimensionKey'] as String,
      dimensionValue: json['dimensionValue'] as int,
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

  /// Fixed amount to be charged to the customer when this term is accepted.
  final String? price;

  /// Category of the term being updated.
  final String? type;

  FixedUpfrontPricingTerm({
    this.currencyCode,
    this.duration,
    this.grants,
    this.price,
    this.type,
  });

  factory FixedUpfrontPricingTerm.fromJson(Map<String, dynamic> json) {
    return FixedUpfrontPricingTerm(
      currencyCode: json['currencyCode'] as String?,
      duration: json['duration'] as String?,
      grants: (json['grants'] as List?)
          ?.whereNotNull()
          .map((e) => GrantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final grants = this.grants;
    final price = this.price;
    final type = this.type;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (duration != null) 'duration': duration,
      if (grants != null) 'grants': grants,
      if (price != null) 'price': price,
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

  /// Category of the term.
  final String? type;

  FreeTrialPricingTerm({
    this.duration,
    this.grants,
    this.type,
  });

  factory FreeTrialPricingTerm.fromJson(Map<String, dynamic> json) {
    return FreeTrialPricingTerm(
      duration: json['duration'] as String?,
      grants: (json['grants'] as List?)
          ?.whereNotNull()
          .map((e) => GrantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final grants = this.grants;
    final type = this.type;
    return {
      if (duration != null) 'duration': duration,
      if (grants != null) 'grants': grants,
      if (type != null) 'type': type,
    };
  }
}

class GetAgreementTermsOutput {
  /// A subset of terms proposed by the proposer that have been accepted by the
  /// acceptor as part of the agreement creation.
  final List<AcceptedTerm>? acceptedTerms;

  /// A token to specify where to start pagination
  final String? nextToken;

  GetAgreementTermsOutput({
    this.acceptedTerms,
    this.nextToken,
  });

  factory GetAgreementTermsOutput.fromJson(Map<String, dynamic> json) {
    return GetAgreementTermsOutput(
      acceptedTerms: (json['acceptedTerms'] as List?)
          ?.whereNotNull()
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

/// Defines the list of text agreements proposed to the acceptors. An example is
/// the end user license agreement (EULA).
class LegalTerm {
  /// List of references to legal resources proposed to the buyers. An example is
  /// the EULA.
  final List<DocumentItem>? documents;

  /// Category of the term being updated.
  final String? type;

  LegalTerm({
    this.documents,
    this.type,
  });

  factory LegalTerm.fromJson(Map<String, dynamic> json) {
    return LegalTerm(
      documents: (json['documents'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final type = this.type;
    return {
      if (documents != null) 'documents': documents,
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

  /// List of the payment schedule where each element defines one installment of
  /// payment. It contains the information necessary for calculating the price.
  final List<ScheduleItem>? schedule;

  /// Type of the term.
  final String? type;

  PaymentScheduleTerm({
    this.currencyCode,
    this.schedule,
    this.type,
  });

  factory PaymentScheduleTerm.fromJson(Map<String, dynamic> json) {
    return PaymentScheduleTerm(
      currencyCode: json['currencyCode'] as String?,
      schedule: (json['schedule'] as List?)
          ?.whereNotNull()
          .map((e) => ScheduleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final schedule = this.schedule;
    final type = this.type;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (schedule != null) 'schedule': schedule,
      if (type != null) 'type': type,
    };
  }
}

/// A summary of the proposal received from the proposer.
class ProposalSummary {
  /// The unique identifier of the offer in AWS Marketplace.
  final String? offerId;

  /// The list of resources involved in the agreement.
  final List<Resource>? resources;

  ProposalSummary({
    this.offerId,
    this.resources,
  });

  factory ProposalSummary.fromJson(Map<String, dynamic> json) {
    return ProposalSummary(
      offerId: json['offerId'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final offerId = this.offerId;
    final resources = this.resources;
    return {
      if (offerId != null) 'offerId': offerId,
      if (resources != null) 'resources': resources,
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

/// Defines a pricing model where customers are charged a fixed recurring price
/// at the end of each billing period.
class RecurringPaymentTerm {
  /// Defines the recurrence at which buyers are charged.
  final String? billingPeriod;

  /// Defines the currency for the prices mentioned in this term.
  final String? currencyCode;

  /// Amount charged to the buyer every billing period.
  final String? price;

  /// Type of the term being updated.
  final String? type;

  RecurringPaymentTerm({
    this.billingPeriod,
    this.currencyCode,
    this.price,
    this.type,
  });

  factory RecurringPaymentTerm.fromJson(Map<String, dynamic> json) {
    return RecurringPaymentTerm(
      billingPeriod: json['billingPeriod'] as String?,
      currencyCode: json['currencyCode'] as String?,
      price: json['price'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final currencyCode = this.currencyCode;
    final price = this.price;
    final type = this.type;
    return {
      if (billingPeriod != null) 'billingPeriod': billingPeriod,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (price != null) 'price': price,
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

  /// Category of the term being updated.
  final String? type;

  RenewalTerm({
    this.configuration,
    this.type,
  });

  factory RenewalTerm.fromJson(Map<String, dynamic> json) {
    return RenewalTerm(
      configuration: json['configuration'] != null
          ? RenewalTermConfiguration.fromJson(
              json['configuration'] as Map<String, dynamic>)
          : null,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final type = this.type;
    return {
      if (configuration != null) 'configuration': configuration,
      if (type != null) 'type': type,
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
      enableAutoRenew: json['enableAutoRenew'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enableAutoRenew = this.enableAutoRenew;
    return {
      'enableAutoRenew': enableAutoRenew,
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

  /// Type of the resource, which is the product. Values include
  /// <code>SaaSProduct</code> or <code>AmiProduct</code>.
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

class SearchAgreementsOutput {
  /// A summary of the agreement, including top-level attributes (for example, the
  /// agreement ID, version, proposer, and acceptor).
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
          ?.whereNotNull()
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
      if (sortOrder != null) 'sortOrder': sortOrder.toValue(),
    };
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

/// Defines the customer support available for the acceptors when they purchase
/// the software.
class SupportTerm {
  /// Free-text field about the refund policy description that will be shown to
  /// customers as is on the website and console.
  final String? refundPolicy;

  /// Category of the term being updated.
  final String? type;

  SupportTerm({
    this.refundPolicy,
    this.type,
  });

  factory SupportTerm.fromJson(Map<String, dynamic> json) {
    return SupportTerm(
      refundPolicy: json['refundPolicy'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final refundPolicy = this.refundPolicy;
    final type = this.type;
    return {
      if (refundPolicy != null) 'refundPolicy': refundPolicy,
      if (type != null) 'type': type,
    };
  }
}

/// Defines a usage-based pricing model (typically, pay-as-you-go pricing),
/// where the customers are charged based on product usage.
class UsageBasedPricingTerm {
  /// Defines the currency for the prices mentioned in the term.
  final String? currencyCode;

  /// List of rate cards.
  final List<UsageBasedRateCardItem>? rateCards;

  /// Category of the term.
  final String? type;

  UsageBasedPricingTerm({
    this.currencyCode,
    this.rateCards,
    this.type,
  });

  factory UsageBasedPricingTerm.fromJson(Map<String, dynamic> json) {
    return UsageBasedPricingTerm(
      currencyCode: json['currencyCode'] as String?,
      rateCards: (json['rateCards'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UsageBasedRateCardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final rateCards = this.rateCards;
    final type = this.type;
    return {
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (rateCards != null) 'rateCards': rateCards,
      if (type != null) 'type': type,
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
          ?.whereNotNull()
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

  /// Category of the term being updated.
  final String? type;

  ValidityTerm({
    this.agreementDuration,
    this.agreementEndDate,
    this.agreementStartDate,
    this.type,
  });

  factory ValidityTerm.fromJson(Map<String, dynamic> json) {
    return ValidityTerm(
      agreementDuration: json['agreementDuration'] as String?,
      agreementEndDate: timeStampFromJson(json['agreementEndDate']),
      agreementStartDate: timeStampFromJson(json['agreementStartDate']),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementDuration = this.agreementDuration;
    final agreementEndDate = this.agreementEndDate;
    final agreementStartDate = this.agreementStartDate;
    final type = this.type;
    return {
      if (agreementDuration != null) 'agreementDuration': agreementDuration,
      if (agreementEndDate != null)
        'agreementEndDate': unixTimestampToJson(agreementEndDate),
      if (agreementStartDate != null)
        'agreementStartDate': unixTimestampToJson(agreementStartDate),
      if (type != null) 'type': type,
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
