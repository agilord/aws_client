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

import 'v2026_02_05.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// The AWS Marketplace Discovery API provides programmatic access to the AWS
/// Marketplace catalog, including searching and browsing listings, retrieving
/// product details and fulfillment options, and accessing public and private
/// offer pricing and terms.
class MarketplaceDiscovery {
  final _s.RestJsonProtocol _protocol;
  factory MarketplaceDiscovery({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'discovery-marketplace',
      signingName: 'aws-marketplace',
    );
    return MarketplaceDiscovery._(
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
  MarketplaceDiscovery._({
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

  /// Provides details about a listing, such as descriptions, badges,
  /// categories, pricing model summaries, reviews, and associated products and
  /// offers.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [listingId] :
  /// The unique identifier of the listing to retrieve.
  Future<GetListingOutput> getListing({
    required String listingId,
  }) async {
    final $payload = <String, dynamic>{
      'listingId': listingId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/getListing',
      exceptionFnMap: _exceptionFns,
    );
    return GetListingOutput.fromJson(response);
  }

  /// Provides details about an offer, such as the pricing model, seller of
  /// record, availability dates, badges, and associated products.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [offerId] :
  /// The unique identifier of the offer to retrieve.
  Future<GetOfferOutput> getOffer({
    required String offerId,
  }) async {
    final $payload = <String, dynamic>{
      'offerId': offerId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/getOffer',
      exceptionFnMap: _exceptionFns,
    );
    return GetOfferOutput.fromJson(response);
  }

  /// Provides details about an offer set, which is a bundle of offers across
  /// multiple products. Includes the seller, availability dates, buyer notes,
  /// and associated product-offer pairs.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [offerSetId] :
  /// The unique identifier of the offer set to retrieve.
  Future<GetOfferSetOutput> getOfferSet({
    required String offerSetId,
  }) async {
    final $payload = <String, dynamic>{
      'offerSetId': offerSetId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/getOfferSet',
      exceptionFnMap: _exceptionFns,
    );
    return GetOfferSetOutput.fromJson(response);
  }

  /// Returns the terms attached to an offer, such as pricing terms
  /// (usage-based, contract, BYOL, free trial), legal terms, payment schedules,
  /// validity terms, support terms, and renewal terms.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [offerId] :
  /// The unique identifier of the offer whose terms to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to get more results.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  Future<GetOfferTermsOutput> getOfferTerms({
    required String offerId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'offerId': offerId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/getOfferTerms',
      exceptionFnMap: _exceptionFns,
    );
    return GetOfferTermsOutput.fromJson(response);
  }

  /// Provides details about a product, such as descriptions, highlights,
  /// categories, fulfillment option summaries, promotional media, and seller
  /// engagement options.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [productId] :
  /// The unique identifier of the product to retrieve.
  Future<GetProductOutput> getProduct({
    required String productId,
  }) async {
    final $payload = <String, dynamic>{
      'productId': productId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/getProduct',
      exceptionFnMap: _exceptionFns,
    );
    return GetProductOutput.fromJson(response);
  }

  /// Returns the fulfillment options available for a product, including
  /// deployment details such as version information, operating systems, usage
  /// instructions, and release notes.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [productId] :
  /// The unique identifier of the product for which to list fulfillment
  /// options.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to get more results.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  Future<ListFulfillmentOptionsOutput> listFulfillmentOptions({
    required String productId,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'productId': productId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/listFulfillmentOptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListFulfillmentOptionsOutput.fromJson(response);
  }

  /// Returns the purchase options (offers and offer sets) available to the
  /// buyer. You can filter results by product, seller, purchase option type,
  /// visibility scope, and availability status.
  /// <note>
  /// You must include at least one of the following filters in the request: a
  /// <code>PRODUCT_ID</code> filter to specify the product for which to
  /// retrieve purchase options, or a <code>VISIBILITY_SCOPE</code> filter to
  /// retrieve purchase options by visibility.
  /// </note>
  ///
  /// Parameter [filters] :
  /// Filters to narrow the results. Multiple filters are combined with AND
  /// logic. Multiple values within the same filter are combined with OR logic.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to get more results.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  Future<ListPurchaseOptionsOutput> listPurchaseOptions({
    List<PurchaseOptionFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/listPurchaseOptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListPurchaseOptionsOutput.fromJson(response);
  }

  /// Returns available facet values for filtering listings, such as categories,
  /// pricing models, fulfillment option types, publishers, and customer
  /// ratings. Each facet value includes a count of matching listings.
  ///
  /// Parameter [facetTypes] :
  /// A list of specific facet types to retrieve. If empty or null, all
  /// available facets are returned.
  ///
  /// Parameter [filters] :
  /// Filters to apply before retrieving facets. Multiple filters are combined
  /// with AND logic. Multiple values within the same filter are combined with
  /// OR logic.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  ///
  /// Parameter [searchText] :
  /// The search query text to filter listings before retrieving facets.
  Future<SearchFacetsOutput> searchFacets({
    List<SearchFacetType>? facetTypes,
    List<SearchFilter>? filters,
    String? nextToken,
    String? searchText,
  }) async {
    final $payload = <String, dynamic>{
      if (facetTypes != null)
        'facetTypes': facetTypes.map((e) => e.value).toList(),
      if (filters != null) 'filters': filters,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchText != null) 'searchText': searchText,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/searchFacets',
      exceptionFnMap: _exceptionFns,
    );
    return SearchFacetsOutput.fromJson(response);
  }

  /// Returns a list of product listings based on search criteria and filters.
  /// You can search by keyword, filter by category, pricing model, fulfillment
  /// type, and other attributes, and sort results by relevance or customer
  /// rating.
  ///
  /// Parameter [filters] :
  /// Filters to narrow search results. Multiple filters are combined with AND
  /// logic. Multiple values within the same filter are combined with OR logic.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that are returned per call. You can use
  /// <code>nextToken</code> to get more results.
  ///
  /// Parameter [nextToken] :
  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  ///
  /// Parameter [searchText] :
  /// The search query text to find relevant listings.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. Valid values are <code>RELEVANCE</code> and
  /// <code>AVERAGE_CUSTOMER_RATING</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort direction. Valid values are <code>DESCENDING</code> and
  /// <code>ASCENDING</code>.
  Future<SearchListingsOutput> searchListings({
    List<SearchFilter>? filters,
    int? maxResults,
    String? nextToken,
    String? searchText,
    SearchListingsSortBy? sortBy,
    SearchListingsSortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (searchText != null) 'searchText': searchText,
      if (sortBy != null) 'sortBy': sortBy.value,
      if (sortOrder != null) 'sortOrder': sortOrder.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2026-02-05/searchListings',
      exceptionFnMap: _exceptionFns,
    );
    return SearchListingsOutput.fromJson(response);
  }
}

/// @nodoc
class GetListingOutput {
  /// The products and offers associated with this listing. Each entity contains
  /// product and offer information.
  final List<ListingAssociatedEntity> associatedEntities;

  /// Badges indicating special attributes of the listing, such as free tier
  /// eligibility, free trial availability, or Quick Launch support.
  final List<ListingBadge> badges;

  /// The name of the catalog that the listing belongs to.
  final String catalog;

  /// The categories used to classify this listing into logical groups.
  final List<Category> categories;

  /// A summary of fulfillment options available for deploying or accessing the
  /// listing, such as AMI, SaaS, or Container.
  final List<FulfillmentOptionSummary> fulfillmentOptionSummaries;

  /// A list of key features that the listing offers to customers.
  final List<String> highlights;

  /// The unique identifier of the listing.
  final String listingId;

  /// The human-readable display name of the listing.
  final String listingName;

  /// The URL of the logo thumbnail image for the listing.
  final String logoThumbnailUrl;

  /// A detailed description of what the listing offers, in paragraph format.
  final String longDescription;

  /// The pricing models for offers associated with this listing, such as
  /// usage-based, contract, BYOL, or free.
  final List<PricingModel> pricingModels;

  /// The pricing units that define the billing dimensions for offers associated
  /// with this listing, such as users, hosts, or data.
  final List<PricingUnit> pricingUnits;

  /// Embedded promotional media provided by the creator of the product, such as
  /// images and videos.
  final List<PromotionalMedia> promotionalMedia;

  /// The entity who created and published the listing.
  final SellerInformation publisher;

  /// Resources that provide further information about using the product or
  /// requesting support, such as documentation links, support contacts, and usage
  /// instructions.
  final List<Resource> resources;

  /// Engagement options available to potential buyers, such as requesting a
  /// private offer or requesting a demo.
  final List<SellerEngagement> sellerEngagements;

  /// A 1–3 sentence summary describing the key aspects of the listing.
  final String shortDescription;

  /// Use cases associated with the listing, describing scenarios where the
  /// product can be applied.
  final List<UseCaseEntry> useCases;

  /// Optional guidance explaining how to use data in this listing. Primarily
  /// defines how to integrate with a multi-product listing.
  final String? integrationGuide;

  /// A summary of customer reviews available for the listing, including average
  /// rating and total review count by source.
  final ReviewSummary? reviewSummary;

  GetListingOutput({
    required this.associatedEntities,
    required this.badges,
    required this.catalog,
    required this.categories,
    required this.fulfillmentOptionSummaries,
    required this.highlights,
    required this.listingId,
    required this.listingName,
    required this.logoThumbnailUrl,
    required this.longDescription,
    required this.pricingModels,
    required this.pricingUnits,
    required this.promotionalMedia,
    required this.publisher,
    required this.resources,
    required this.sellerEngagements,
    required this.shortDescription,
    required this.useCases,
    this.integrationGuide,
    this.reviewSummary,
  });

  factory GetListingOutput.fromJson(Map<String, dynamic> json) {
    return GetListingOutput(
      associatedEntities: ((json['associatedEntities'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ListingAssociatedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      badges: ((json['badges'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListingBadge.fromJson(e as Map<String, dynamic>))
          .toList(),
      catalog: (json['catalog'] as String?) ?? '',
      categories: ((json['categories'] as List?) ?? const [])
          .nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionSummaries:
          ((json['fulfillmentOptionSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  FulfillmentOptionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      highlights: ((json['highlights'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      listingId: (json['listingId'] as String?) ?? '',
      listingName: (json['listingName'] as String?) ?? '',
      logoThumbnailUrl: (json['logoThumbnailUrl'] as String?) ?? '',
      longDescription: (json['longDescription'] as String?) ?? '',
      pricingModels: ((json['pricingModels'] as List?) ?? const [])
          .nonNulls
          .map((e) => PricingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingUnits: ((json['pricingUnits'] as List?) ?? const [])
          .nonNulls
          .map((e) => PricingUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      promotionalMedia: ((json['promotionalMedia'] as List?) ?? const [])
          .nonNulls
          .map((e) => PromotionalMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      publisher: SellerInformation.fromJson(
          (json['publisher'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      resources: ((json['resources'] as List?) ?? const [])
          .nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellerEngagements: ((json['sellerEngagements'] as List?) ?? const [])
          .nonNulls
          .map((e) => SellerEngagement.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortDescription: (json['shortDescription'] as String?) ?? '',
      useCases: ((json['useCases'] as List?) ?? const [])
          .nonNulls
          .map((e) => UseCaseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      integrationGuide: json['integrationGuide'] as String?,
      reviewSummary: json['reviewSummary'] != null
          ? ReviewSummary.fromJson(
              json['reviewSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedEntities = this.associatedEntities;
    final badges = this.badges;
    final catalog = this.catalog;
    final categories = this.categories;
    final fulfillmentOptionSummaries = this.fulfillmentOptionSummaries;
    final highlights = this.highlights;
    final listingId = this.listingId;
    final listingName = this.listingName;
    final logoThumbnailUrl = this.logoThumbnailUrl;
    final longDescription = this.longDescription;
    final pricingModels = this.pricingModels;
    final pricingUnits = this.pricingUnits;
    final promotionalMedia = this.promotionalMedia;
    final publisher = this.publisher;
    final resources = this.resources;
    final sellerEngagements = this.sellerEngagements;
    final shortDescription = this.shortDescription;
    final useCases = this.useCases;
    final integrationGuide = this.integrationGuide;
    final reviewSummary = this.reviewSummary;
    return {
      'associatedEntities': associatedEntities,
      'badges': badges,
      'catalog': catalog,
      'categories': categories,
      'fulfillmentOptionSummaries': fulfillmentOptionSummaries,
      'highlights': highlights,
      'listingId': listingId,
      'listingName': listingName,
      'logoThumbnailUrl': logoThumbnailUrl,
      'longDescription': longDescription,
      'pricingModels': pricingModels,
      'pricingUnits': pricingUnits,
      'promotionalMedia': promotionalMedia,
      'publisher': publisher,
      'resources': resources,
      'sellerEngagements': sellerEngagements,
      'shortDescription': shortDescription,
      'useCases': useCases,
      if (integrationGuide != null) 'integrationGuide': integrationGuide,
      if (reviewSummary != null) 'reviewSummary': reviewSummary,
    };
  }
}

/// @nodoc
class GetOfferOutput {
  /// An encoded string to be passed by the acceptor of the terms when creating an
  /// agreement.
  final String agreementProposalId;

  /// The products and offer sets associated with this offer.
  final List<OfferAssociatedEntity> associatedEntities;

  /// Badges indicating special attributes of the offer, such as private pricing,
  /// future dated, or replacement offer.
  final List<PurchaseOptionBadge> badges;

  /// The name of the catalog that the offer belongs to.
  final String catalog;

  /// The unique identifier of the offer.
  final String offerId;

  /// The pricing model that determines how buyers are charged, such as
  /// usage-based, contract, BYOL, or free.
  final PricingModel pricingModel;

  /// The entity responsible for selling the product under this offer.
  final SellerInformation sellerOfRecord;

  /// The date and time when the offer became available to the buyer.
  final DateTime? availableFromTime;

  /// The date and time until when the offer can be procured. This value is null
  /// for offers that never expire.
  final DateTime? expirationTime;

  /// The display name of the offer. This is free-form text provided by the
  /// seller.
  final String? offerName;

  /// The identifier of the existing agreement that this offer would replace.
  /// Enables agreement-based offer functionality.
  final String? replacementAgreementId;

  GetOfferOutput({
    required this.agreementProposalId,
    required this.associatedEntities,
    required this.badges,
    required this.catalog,
    required this.offerId,
    required this.pricingModel,
    required this.sellerOfRecord,
    this.availableFromTime,
    this.expirationTime,
    this.offerName,
    this.replacementAgreementId,
  });

  factory GetOfferOutput.fromJson(Map<String, dynamic> json) {
    return GetOfferOutput(
      agreementProposalId: (json['agreementProposalId'] as String?) ?? '',
      associatedEntities: ((json['associatedEntities'] as List?) ?? const [])
          .nonNulls
          .map((e) => OfferAssociatedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      badges: ((json['badges'] as List?) ?? const [])
          .nonNulls
          .map((e) => PurchaseOptionBadge.fromJson(e as Map<String, dynamic>))
          .toList(),
      catalog: (json['catalog'] as String?) ?? '',
      offerId: (json['offerId'] as String?) ?? '',
      pricingModel: PricingModel.fromJson(
          (json['pricingModel'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sellerOfRecord: SellerInformation.fromJson(
          (json['sellerOfRecord'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      availableFromTime: timeStampFromJson(json['availableFromTime']),
      expirationTime: timeStampFromJson(json['expirationTime']),
      offerName: json['offerName'] as String?,
      replacementAgreementId: json['replacementAgreementId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementProposalId = this.agreementProposalId;
    final associatedEntities = this.associatedEntities;
    final badges = this.badges;
    final catalog = this.catalog;
    final offerId = this.offerId;
    final pricingModel = this.pricingModel;
    final sellerOfRecord = this.sellerOfRecord;
    final availableFromTime = this.availableFromTime;
    final expirationTime = this.expirationTime;
    final offerName = this.offerName;
    final replacementAgreementId = this.replacementAgreementId;
    return {
      'agreementProposalId': agreementProposalId,
      'associatedEntities': associatedEntities,
      'badges': badges,
      'catalog': catalog,
      'offerId': offerId,
      'pricingModel': pricingModel,
      'sellerOfRecord': sellerOfRecord,
      if (availableFromTime != null)
        'availableFromTime': unixTimestampToJson(availableFromTime),
      if (expirationTime != null)
        'expirationTime': unixTimestampToJson(expirationTime),
      if (offerName != null) 'offerName': offerName,
      if (replacementAgreementId != null)
        'replacementAgreementId': replacementAgreementId,
    };
  }
}

/// @nodoc
class GetOfferSetOutput {
  /// The products and offers included in this offer set.
  final List<OfferSetAssociatedEntity> associatedEntities;

  /// Badges indicating special attributes of the offer set, such as private
  /// pricing or future dated.
  final List<PurchaseOptionBadge> badges;

  /// The name of the catalog that the offer set belongs to.
  final String catalog;

  /// The unique identifier of the offer set.
  final String offerSetId;

  /// The entity responsible for selling the products under this offer set.
  final SellerInformation sellerOfRecord;

  /// The date and time when the offer set became available to the buyer.
  final DateTime? availableFromTime;

  /// Detailed information about the offer set that helps buyers understand its
  /// purpose and contents.
  final String? buyerNotes;

  /// The date and time when the offer set expires and is no longer available for
  /// procurement.
  final DateTime? expirationTime;

  /// The display name of the offer set.
  final String? offerSetName;

  GetOfferSetOutput({
    required this.associatedEntities,
    required this.badges,
    required this.catalog,
    required this.offerSetId,
    required this.sellerOfRecord,
    this.availableFromTime,
    this.buyerNotes,
    this.expirationTime,
    this.offerSetName,
  });

  factory GetOfferSetOutput.fromJson(Map<String, dynamic> json) {
    return GetOfferSetOutput(
      associatedEntities: ((json['associatedEntities'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              OfferSetAssociatedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      badges: ((json['badges'] as List?) ?? const [])
          .nonNulls
          .map((e) => PurchaseOptionBadge.fromJson(e as Map<String, dynamic>))
          .toList(),
      catalog: (json['catalog'] as String?) ?? '',
      offerSetId: (json['offerSetId'] as String?) ?? '',
      sellerOfRecord: SellerInformation.fromJson(
          (json['sellerOfRecord'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      availableFromTime: timeStampFromJson(json['availableFromTime']),
      buyerNotes: json['buyerNotes'] as String?,
      expirationTime: timeStampFromJson(json['expirationTime']),
      offerSetName: json['offerSetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedEntities = this.associatedEntities;
    final badges = this.badges;
    final catalog = this.catalog;
    final offerSetId = this.offerSetId;
    final sellerOfRecord = this.sellerOfRecord;
    final availableFromTime = this.availableFromTime;
    final buyerNotes = this.buyerNotes;
    final expirationTime = this.expirationTime;
    final offerSetName = this.offerSetName;
    return {
      'associatedEntities': associatedEntities,
      'badges': badges,
      'catalog': catalog,
      'offerSetId': offerSetId,
      'sellerOfRecord': sellerOfRecord,
      if (availableFromTime != null)
        'availableFromTime': unixTimestampToJson(availableFromTime),
      if (buyerNotes != null) 'buyerNotes': buyerNotes,
      if (expirationTime != null)
        'expirationTime': unixTimestampToJson(expirationTime),
      if (offerSetName != null) 'offerSetName': offerSetName,
    };
  }
}

/// @nodoc
class GetOfferTermsOutput {
  /// The terms attached to the offer. Each element contains exactly one term
  /// type.
  final List<OfferTerm> offerTerms;

  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  GetOfferTermsOutput({
    required this.offerTerms,
    this.nextToken,
  });

  factory GetOfferTermsOutput.fromJson(Map<String, dynamic> json) {
    return GetOfferTermsOutput(
      offerTerms: ((json['offerTerms'] as List?) ?? const [])
          .nonNulls
          .map((e) => OfferTerm.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final offerTerms = this.offerTerms;
    final nextToken = this.nextToken;
    return {
      'offerTerms': offerTerms,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class GetProductOutput {
  /// The name of the catalog that the product belongs to.
  final String catalog;

  /// The categories used to classify this product into logical groups.
  final List<Category> categories;

  /// Indicates whether the product is deployed on AWS infrastructure.
  final DeployedOnAwsStatus deployedOnAws;

  /// A summary of fulfillment options available for deploying or accessing the
  /// product, such as AMI, SaaS, or Container.
  final List<FulfillmentOptionSummary> fulfillmentOptionSummaries;

  /// A list of key features that the product offers to customers.
  final List<String> highlights;

  /// The URL of the logo thumbnail image for the product.
  final String logoThumbnailUrl;

  /// A detailed description of what the product does, in paragraph format.
  final String longDescription;

  /// The entity who manufactured the product.
  final SellerInformation manufacturer;

  /// The unique identifier of the product.
  final String productId;

  /// The human-readable display name of the product.
  final String productName;

  /// Embedded promotional media provided by the creator of the product, such as
  /// images and videos.
  final List<PromotionalMedia> promotionalMedia;

  /// Resources that provide further information about using the product or
  /// requesting support, such as documentation links, support contacts, and usage
  /// instructions.
  final List<Resource> resources;

  /// Engagement options available to potential buyers, such as requesting a
  /// private offer or requesting a demo.
  final List<SellerEngagement> sellerEngagements;

  /// A 1–3 sentence summary describing the key aspects of the product.
  final String shortDescription;

  GetProductOutput({
    required this.catalog,
    required this.categories,
    required this.deployedOnAws,
    required this.fulfillmentOptionSummaries,
    required this.highlights,
    required this.logoThumbnailUrl,
    required this.longDescription,
    required this.manufacturer,
    required this.productId,
    required this.productName,
    required this.promotionalMedia,
    required this.resources,
    required this.sellerEngagements,
    required this.shortDescription,
  });

  factory GetProductOutput.fromJson(Map<String, dynamic> json) {
    return GetProductOutput(
      catalog: (json['catalog'] as String?) ?? '',
      categories: ((json['categories'] as List?) ?? const [])
          .nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      deployedOnAws: DeployedOnAwsStatus.fromString(
          (json['deployedOnAws'] as String?) ?? ''),
      fulfillmentOptionSummaries:
          ((json['fulfillmentOptionSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  FulfillmentOptionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      highlights: ((json['highlights'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      logoThumbnailUrl: (json['logoThumbnailUrl'] as String?) ?? '',
      longDescription: (json['longDescription'] as String?) ?? '',
      manufacturer: SellerInformation.fromJson(
          (json['manufacturer'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      productId: (json['productId'] as String?) ?? '',
      productName: (json['productName'] as String?) ?? '',
      promotionalMedia: ((json['promotionalMedia'] as List?) ?? const [])
          .nonNulls
          .map((e) => PromotionalMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      resources: ((json['resources'] as List?) ?? const [])
          .nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      sellerEngagements: ((json['sellerEngagements'] as List?) ?? const [])
          .nonNulls
          .map((e) => SellerEngagement.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortDescription: (json['shortDescription'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final categories = this.categories;
    final deployedOnAws = this.deployedOnAws;
    final fulfillmentOptionSummaries = this.fulfillmentOptionSummaries;
    final highlights = this.highlights;
    final logoThumbnailUrl = this.logoThumbnailUrl;
    final longDescription = this.longDescription;
    final manufacturer = this.manufacturer;
    final productId = this.productId;
    final productName = this.productName;
    final promotionalMedia = this.promotionalMedia;
    final resources = this.resources;
    final sellerEngagements = this.sellerEngagements;
    final shortDescription = this.shortDescription;
    return {
      'catalog': catalog,
      'categories': categories,
      'deployedOnAws': deployedOnAws.value,
      'fulfillmentOptionSummaries': fulfillmentOptionSummaries,
      'highlights': highlights,
      'logoThumbnailUrl': logoThumbnailUrl,
      'longDescription': longDescription,
      'manufacturer': manufacturer,
      'productId': productId,
      'productName': productName,
      'promotionalMedia': promotionalMedia,
      'resources': resources,
      'sellerEngagements': sellerEngagements,
      'shortDescription': shortDescription,
    };
  }
}

/// @nodoc
class ListFulfillmentOptionsOutput {
  /// The fulfillment options available for the product. Each option describes how
  /// the buyer can deploy or access the product.
  final List<FulfillmentOption> fulfillmentOptions;

  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  ListFulfillmentOptionsOutput({
    required this.fulfillmentOptions,
    this.nextToken,
  });

  factory ListFulfillmentOptionsOutput.fromJson(Map<String, dynamic> json) {
    return ListFulfillmentOptionsOutput(
      fulfillmentOptions: ((json['fulfillmentOptions'] as List?) ?? const [])
          .nonNulls
          .map((e) => FulfillmentOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptions = this.fulfillmentOptions;
    final nextToken = this.nextToken;
    return {
      'fulfillmentOptions': fulfillmentOptions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPurchaseOptionsOutput {
  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  /// The purchase options available to the buyer. Each option is either an offer
  /// for a single product or an offer set spanning multiple products.
  final List<PurchaseOptionSummary>? purchaseOptions;

  ListPurchaseOptionsOutput({
    this.nextToken,
    this.purchaseOptions,
  });

  factory ListPurchaseOptionsOutput.fromJson(Map<String, dynamic> json) {
    return ListPurchaseOptionsOutput(
      nextToken: json['nextToken'] as String?,
      purchaseOptions: (json['purchaseOptions'] as List?)
          ?.nonNulls
          .map((e) => PurchaseOptionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final purchaseOptions = this.purchaseOptions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (purchaseOptions != null) 'purchaseOptions': purchaseOptions,
    };
  }
}

/// @nodoc
class SearchFacetsOutput {
  /// A map of facet types to their corresponding facet values. Each facet value
  /// includes a display name, internal value, and count of matching listings.
  final Map<SearchFacetType, List<ListingFacet>> listingFacets;

  /// The total number of listings matching the search criteria.
  final int totalResults;

  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  SearchFacetsOutput({
    required this.listingFacets,
    required this.totalResults,
    this.nextToken,
  });

  factory SearchFacetsOutput.fromJson(Map<String, dynamic> json) {
    return SearchFacetsOutput(
      listingFacets: ((json['listingFacets'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              SearchFacetType.fromString(k),
              (e as List)
                  .nonNulls
                  .map((e) => ListingFacet.fromJson(e as Map<String, dynamic>))
                  .toList())),
      totalResults: (json['totalResults'] as int?) ?? 0,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final listingFacets = this.listingFacets;
    final totalResults = this.totalResults;
    final nextToken = this.nextToken;
    return {
      'listingFacets': listingFacets.map((k, e) => MapEntry(k.value, e)),
      'totalResults': totalResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class SearchListingsOutput {
  /// The listing summaries matching the search criteria. Each summary includes
  /// the listing name, description, badges, categories, pricing models, reviews,
  /// and associated products.
  final List<ListingSummary> listingSummaries;

  /// The total number of listings matching the search criteria.
  final int totalResults;

  /// If <code>nextToken</code> is returned, there are more results available.
  /// Make the call again using the returned token to retrieve the next page.
  final String? nextToken;

  SearchListingsOutput({
    required this.listingSummaries,
    required this.totalResults,
    this.nextToken,
  });

  factory SearchListingsOutput.fromJson(Map<String, dynamic> json) {
    return SearchListingsOutput(
      listingSummaries: ((json['listingSummaries'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListingSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: (json['totalResults'] as int?) ?? 0,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final listingSummaries = this.listingSummaries;
    final totalResults = this.totalResults;
    final nextToken = this.nextToken;
    return {
      'listingSummaries': listingSummaries,
      'totalResults': totalResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Summary information about a listing returned by search operations, including
/// the listing name, description, badges, categories, pricing models, reviews,
/// and associated products.
///
/// @nodoc
class ListingSummary {
  /// The products associated with this listing.
  final List<ListingSummaryAssociatedEntity> associatedEntities;

  /// Badges indicating special attributes of the listing.
  final List<ListingBadge> badges;

  /// The name of the catalog that the listing belongs to.
  final String catalog;

  /// The categories used to classify this listing into logical groups.
  final List<Category> categories;

  /// A summary of fulfillment options available for the listing.
  final List<FulfillmentOptionSummary> fulfillmentOptionSummaries;

  /// The unique identifier of the listing.
  final String listingId;

  /// The human-readable display name of the listing.
  final String listingName;

  /// The URL of the logo thumbnail image for the listing.
  final String logoThumbnailUrl;

  /// The pricing models for offers associated with this listing.
  final List<PricingModel> pricingModels;

  /// The pricing units that define the billing dimensions for offers associated
  /// with this listing.
  final List<PricingUnit> pricingUnits;

  /// The entity who created and published the listing.
  final SellerInformation publisher;

  /// A summary of customer reviews for the listing.
  final ReviewSummary reviewSummary;

  /// A 1–3 sentence summary describing the key aspects of the listing.
  final String shortDescription;

  ListingSummary({
    required this.associatedEntities,
    required this.badges,
    required this.catalog,
    required this.categories,
    required this.fulfillmentOptionSummaries,
    required this.listingId,
    required this.listingName,
    required this.logoThumbnailUrl,
    required this.pricingModels,
    required this.pricingUnits,
    required this.publisher,
    required this.reviewSummary,
    required this.shortDescription,
  });

  factory ListingSummary.fromJson(Map<String, dynamic> json) {
    return ListingSummary(
      associatedEntities: ((json['associatedEntities'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListingSummaryAssociatedEntity.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      badges: ((json['badges'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListingBadge.fromJson(e as Map<String, dynamic>))
          .toList(),
      catalog: (json['catalog'] as String?) ?? '',
      categories: ((json['categories'] as List?) ?? const [])
          .nonNulls
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionSummaries:
          ((json['fulfillmentOptionSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  FulfillmentOptionSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      listingId: (json['listingId'] as String?) ?? '',
      listingName: (json['listingName'] as String?) ?? '',
      logoThumbnailUrl: (json['logoThumbnailUrl'] as String?) ?? '',
      pricingModels: ((json['pricingModels'] as List?) ?? const [])
          .nonNulls
          .map((e) => PricingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pricingUnits: ((json['pricingUnits'] as List?) ?? const [])
          .nonNulls
          .map((e) => PricingUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      publisher: SellerInformation.fromJson(
          (json['publisher'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      reviewSummary: ReviewSummary.fromJson(
          (json['reviewSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      shortDescription: (json['shortDescription'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final associatedEntities = this.associatedEntities;
    final badges = this.badges;
    final catalog = this.catalog;
    final categories = this.categories;
    final fulfillmentOptionSummaries = this.fulfillmentOptionSummaries;
    final listingId = this.listingId;
    final listingName = this.listingName;
    final logoThumbnailUrl = this.logoThumbnailUrl;
    final pricingModels = this.pricingModels;
    final pricingUnits = this.pricingUnits;
    final publisher = this.publisher;
    final reviewSummary = this.reviewSummary;
    final shortDescription = this.shortDescription;
    return {
      'associatedEntities': associatedEntities,
      'badges': badges,
      'catalog': catalog,
      'categories': categories,
      'fulfillmentOptionSummaries': fulfillmentOptionSummaries,
      'listingId': listingId,
      'listingName': listingName,
      'logoThumbnailUrl': logoThumbnailUrl,
      'pricingModels': pricingModels,
      'pricingUnits': pricingUnits,
      'publisher': publisher,
      'reviewSummary': reviewSummary,
      'shortDescription': shortDescription,
    };
  }
}

/// Information about a seller, including the profile identifier and display
/// name.
///
/// @nodoc
class SellerInformation {
  /// The human-readable name of the seller.
  final String displayName;

  /// The unique identifier of the seller profile.
  final String sellerProfileId;

  SellerInformation({
    required this.displayName,
    required this.sellerProfileId,
  });

  factory SellerInformation.fromJson(Map<String, dynamic> json) {
    return SellerInformation(
      displayName: (json['displayName'] as String?) ?? '',
      sellerProfileId: (json['sellerProfileId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final sellerProfileId = this.sellerProfileId;
    return {
      'displayName': displayName,
      'sellerProfileId': sellerProfileId,
    };
  }
}

/// A summary of customer reviews available for a listing, aggregated by review
/// source.
///
/// @nodoc
class ReviewSummary {
  /// Review summaries from different sources, such as AWS Marketplace.
  final List<ReviewSourceSummary> reviewSourceSummaries;

  ReviewSummary({
    required this.reviewSourceSummaries,
  });

  factory ReviewSummary.fromJson(Map<String, dynamic> json) {
    return ReviewSummary(
      reviewSourceSummaries: ((json['reviewSourceSummaries'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ReviewSourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reviewSourceSummaries = this.reviewSourceSummaries;
    return {
      'reviewSourceSummaries': reviewSourceSummaries,
    };
  }
}

/// A product associated with a listing summary.
///
/// @nodoc
class ListingSummaryAssociatedEntity {
  /// Information about the associated product.
  final ProductInformation? product;

  ListingSummaryAssociatedEntity({
    this.product,
  });

  factory ListingSummaryAssociatedEntity.fromJson(Map<String, dynamic> json) {
    return ListingSummaryAssociatedEntity(
      product: json['product'] != null
          ? ProductInformation.fromJson(json['product'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final product = this.product;
    return {
      if (product != null) 'product': product,
    };
  }
}

/// Summary information about a product, including the identifier, name, and
/// manufacturer.
///
/// @nodoc
class ProductInformation {
  /// The entity who manufactured the product.
  final SellerInformation manufacturer;

  /// The unique identifier of the product.
  final String productId;

  /// The human-readable display name of the product.
  final String productName;

  ProductInformation({
    required this.manufacturer,
    required this.productId,
    required this.productName,
  });

  factory ProductInformation.fromJson(Map<String, dynamic> json) {
    return ProductInformation(
      manufacturer: SellerInformation.fromJson(
          (json['manufacturer'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      productId: (json['productId'] as String?) ?? '',
      productName: (json['productName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final manufacturer = this.manufacturer;
    final productId = this.productId;
    final productName = this.productName;
    return {
      'manufacturer': manufacturer,
      'productId': productId,
      'productName': productName,
    };
  }
}

/// A pricing unit that defines the billing dimension for a listing, such as
/// users, hosts, bandwidth, or data.
///
/// @nodoc
class PricingUnit {
  /// The human-readable name of the pricing unit.
  final String displayName;

  /// The machine-readable type of the pricing unit.
  final PricingUnitType pricingUnitType;

  PricingUnit({
    required this.displayName,
    required this.pricingUnitType,
  });

  factory PricingUnit.fromJson(Map<String, dynamic> json) {
    return PricingUnit(
      displayName: (json['displayName'] as String?) ?? '',
      pricingUnitType: PricingUnitType.fromString(
          (json['pricingUnitType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final pricingUnitType = this.pricingUnitType;
    return {
      'displayName': displayName,
      'pricingUnitType': pricingUnitType.value,
    };
  }
}

/// @nodoc
class PricingUnitType {
  static const users = PricingUnitType._('USERS');
  static const hosts = PricingUnitType._('HOSTS');
  static const bandwidth = PricingUnitType._('BANDWIDTH');
  static const data = PricingUnitType._('DATA');
  static const tiers = PricingUnitType._('TIERS');
  static const requests = PricingUnitType._('REQUESTS');
  static const units = PricingUnitType._('UNITS');

  final String value;

  const PricingUnitType._(this.value);

  static const values = [users, hosts, bandwidth, data, tiers, requests, units];

  static PricingUnitType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PricingUnitType._(value));

  @override
  bool operator ==(other) => other is PricingUnitType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A pricing model that determines how buyers are charged for a listing, such
/// as usage-based, contract, BYOL, or free.
///
/// @nodoc
class PricingModel {
  /// The human-readable name of the pricing model.
  final String displayName;

  /// The machine-readable type of the pricing model.
  final PricingModelType pricingModelType;

  PricingModel({
    required this.displayName,
    required this.pricingModelType,
  });

  factory PricingModel.fromJson(Map<String, dynamic> json) {
    return PricingModel(
      displayName: (json['displayName'] as String?) ?? '',
      pricingModelType: PricingModelType.fromString(
          (json['pricingModelType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final pricingModelType = this.pricingModelType;
    return {
      'displayName': displayName,
      'pricingModelType': pricingModelType.value,
    };
  }
}

/// @nodoc
class PricingModelType {
  static const usage = PricingModelType._('USAGE');
  static const contract = PricingModelType._('CONTRACT');
  static const byol = PricingModelType._('BYOL');
  static const free = PricingModelType._('FREE');

  final String value;

  const PricingModelType._(this.value);

  static const values = [usage, contract, byol, free];

  static PricingModelType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PricingModelType._(value));

  @override
  bool operator ==(other) => other is PricingModelType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A review summary from a specific source, including the average rating and
/// total review count.
///
/// @nodoc
class ReviewSourceSummary {
  /// The average rating across all reviews from this source.
  final String averageRating;

  /// The machine-readable identifier of the review source.
  final ReviewSourceId sourceId;

  /// The name of the review source, such as AWS Marketplace.
  final String sourceName;

  /// The total number of reviews available from this source.
  final int totalReviews;

  /// The URL where the reviews can be accessed at the source.
  final String? sourceUrl;

  ReviewSourceSummary({
    required this.averageRating,
    required this.sourceId,
    required this.sourceName,
    required this.totalReviews,
    this.sourceUrl,
  });

  factory ReviewSourceSummary.fromJson(Map<String, dynamic> json) {
    return ReviewSourceSummary(
      averageRating: (json['averageRating'] as String?) ?? '',
      sourceId: ReviewSourceId.fromString((json['sourceId'] as String?) ?? ''),
      sourceName: (json['sourceName'] as String?) ?? '',
      totalReviews: (json['totalReviews'] as int?) ?? 0,
      sourceUrl: json['sourceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final averageRating = this.averageRating;
    final sourceId = this.sourceId;
    final sourceName = this.sourceName;
    final totalReviews = this.totalReviews;
    final sourceUrl = this.sourceUrl;
    return {
      'averageRating': averageRating,
      'sourceId': sourceId.value,
      'sourceName': sourceName,
      'totalReviews': totalReviews,
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
    };
  }
}

/// @nodoc
class ReviewSourceId {
  static const awsMarketplace = ReviewSourceId._('AWS_MARKETPLACE');

  final String value;

  const ReviewSourceId._(this.value);

  static const values = [awsMarketplace];

  static ReviewSourceId fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReviewSourceId._(value));

  @override
  bool operator ==(other) => other is ReviewSourceId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A badge indicating a special attribute of a listing, such as free tier
/// eligibility or Quick Launch support.
///
/// @nodoc
class ListingBadge {
  /// The machine-readable type of the badge.
  final ListingBadgeType badgeType;

  /// The human-readable name of the badge.
  final String displayName;

  ListingBadge({
    required this.badgeType,
    required this.displayName,
  });

  factory ListingBadge.fromJson(Map<String, dynamic> json) {
    return ListingBadge(
      badgeType:
          ListingBadgeType.fromString((json['badgeType'] as String?) ?? ''),
      displayName: (json['displayName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final badgeType = this.badgeType;
    final displayName = this.displayName;
    return {
      'badgeType': badgeType.value,
      'displayName': displayName,
    };
  }
}

/// @nodoc
class ListingBadgeType {
  static const awsFreeTier = ListingBadgeType._('AWS_FREE_TIER');
  static const freeTrial = ListingBadgeType._('FREE_TRIAL');
  static const deployedOnAws = ListingBadgeType._('DEPLOYED_ON_AWS');
  static const quickLaunch = ListingBadgeType._('QUICK_LAUNCH');
  static const multiProduct = ListingBadgeType._('MULTI_PRODUCT');

  final String value;

  const ListingBadgeType._(this.value);

  static const values = [
    awsFreeTier,
    freeTrial,
    deployedOnAws,
    quickLaunch,
    multiProduct
  ];

  static ListingBadgeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListingBadgeType._(value));

  @override
  bool operator ==(other) => other is ListingBadgeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of a fulfillment option available for deploying or accessing a
/// listing or product.
///
/// @nodoc
class FulfillmentOptionSummary {
  /// The human-readable name of the fulfillment option type.
  final String displayName;

  /// The machine-readable type of the fulfillment option, such as
  /// <code>SAAS</code> or <code>AMAZON_MACHINE_IMAGE</code>.
  final FulfillmentOptionType fulfillmentOptionType;

  FulfillmentOptionSummary({
    required this.displayName,
    required this.fulfillmentOptionType,
  });

  factory FulfillmentOptionSummary.fromJson(Map<String, dynamic> json) {
    return FulfillmentOptionSummary(
      displayName: (json['displayName'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    return {
      'displayName': displayName,
      'fulfillmentOptionType': fulfillmentOptionType.value,
    };
  }
}

/// @nodoc
class FulfillmentOptionType {
  static const amazonMachineImage =
      FulfillmentOptionType._('AMAZON_MACHINE_IMAGE');
  static const api = FulfillmentOptionType._('API');
  static const cloudformationTemplate =
      FulfillmentOptionType._('CLOUDFORMATION_TEMPLATE');
  static const container = FulfillmentOptionType._('CONTAINER');
  static const helm = FulfillmentOptionType._('HELM');
  static const eksAddOn = FulfillmentOptionType._('EKS_ADD_ON');
  static const ec2ImageBuilderComponent =
      FulfillmentOptionType._('EC2_IMAGE_BUILDER_COMPONENT');
  static const dataExchange = FulfillmentOptionType._('DATA_EXCHANGE');
  static const professionalServices =
      FulfillmentOptionType._('PROFESSIONAL_SERVICES');
  static const saas = FulfillmentOptionType._('SAAS');
  static const sagemakerAlgorithm =
      FulfillmentOptionType._('SAGEMAKER_ALGORITHM');
  static const sagemakerModel = FulfillmentOptionType._('SAGEMAKER_MODEL');

  final String value;

  const FulfillmentOptionType._(this.value);

  static const values = [
    amazonMachineImage,
    api,
    cloudformationTemplate,
    container,
    helm,
    eksAddOn,
    ec2ImageBuilderComponent,
    dataExchange,
    professionalServices,
    saas,
    sagemakerAlgorithm,
    sagemakerModel
  ];

  static FulfillmentOptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FulfillmentOptionType._(value));

  @override
  bool operator ==(other) =>
      other is FulfillmentOptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A category used to classify a listing or product into a logical group.
///
/// @nodoc
class Category {
  /// The machine-readable identifier of the category.
  final String categoryId;

  /// The human-readable name of the category.
  final String displayName;

  Category({
    required this.categoryId,
    required this.displayName,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: (json['categoryId'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final categoryId = this.categoryId;
    final displayName = this.displayName;
    return {
      'categoryId': categoryId,
      'displayName': displayName,
    };
  }
}

/// @nodoc
class SearchListingsSortBy {
  static const relevance = SearchListingsSortBy._('RELEVANCE');
  static const averageCustomerRating =
      SearchListingsSortBy._('AVERAGE_CUSTOMER_RATING');

  final String value;

  const SearchListingsSortBy._(this.value);

  static const values = [relevance, averageCustomerRating];

  static SearchListingsSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchListingsSortBy._(value));

  @override
  bool operator ==(other) =>
      other is SearchListingsSortBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SearchListingsSortOrder {
  static const descending = SearchListingsSortOrder._('DESCENDING');
  static const ascending = SearchListingsSortOrder._('ASCENDING');

  final String value;

  const SearchListingsSortOrder._(this.value);

  static const values = [descending, ascending];

  static SearchListingsSortOrder fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchListingsSortOrder._(value));

  @override
  bool operator ==(other) =>
      other is SearchListingsSortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter used to narrow search results by attribute, such as category,
/// pricing model, or fulfillment type.
///
/// @nodoc
class SearchFilter {
  /// The type of filter to apply.
  final SearchFilterType filterType;

  /// The values to filter by. Term filters accept multiple values (OR logic).
  /// Range filters (MIN/MAX_AVERAGE_CUSTOMER_RATING) accept a single value
  /// between 0.0 and 5.0.
  final List<String> filterValues;

  SearchFilter({
    required this.filterType,
    required this.filterValues,
  });

  Map<String, dynamic> toJson() {
    final filterType = this.filterType;
    final filterValues = this.filterValues;
    return {
      'filterType': filterType.value,
      'filterValues': filterValues,
    };
  }
}

/// @nodoc
class SearchFilterType {
  static const minAverageCustomerRating =
      SearchFilterType._('MIN_AVERAGE_CUSTOMER_RATING');
  static const maxAverageCustomerRating =
      SearchFilterType._('MAX_AVERAGE_CUSTOMER_RATING');
  static const category = SearchFilterType._('CATEGORY');
  static const publisher = SearchFilterType._('PUBLISHER');
  static const fulfillmentOptionType =
      SearchFilterType._('FULFILLMENT_OPTION_TYPE');
  static const pricingModel = SearchFilterType._('PRICING_MODEL');
  static const pricingUnit = SearchFilterType._('PRICING_UNIT');
  static const deployedOnAws = SearchFilterType._('DEPLOYED_ON_AWS');
  static const numberOfProducts = SearchFilterType._('NUMBER_OF_PRODUCTS');

  final String value;

  const SearchFilterType._(this.value);

  static const values = [
    minAverageCustomerRating,
    maxAverageCustomerRating,
    category,
    publisher,
    fulfillmentOptionType,
    pricingModel,
    pricingUnit,
    deployedOnAws,
    numberOfProducts
  ];

  static SearchFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchFilterType._(value));

  @override
  bool operator ==(other) => other is SearchFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SearchFacetType {
  static const averageCustomerRating =
      SearchFacetType._('AVERAGE_CUSTOMER_RATING');
  static const category = SearchFacetType._('CATEGORY');
  static const publisher = SearchFacetType._('PUBLISHER');
  static const fulfillmentOptionType =
      SearchFacetType._('FULFILLMENT_OPTION_TYPE');
  static const pricingModel = SearchFacetType._('PRICING_MODEL');
  static const pricingUnit = SearchFacetType._('PRICING_UNIT');
  static const deployedOnAws = SearchFacetType._('DEPLOYED_ON_AWS');
  static const numberOfProducts = SearchFacetType._('NUMBER_OF_PRODUCTS');

  final String value;

  const SearchFacetType._(this.value);

  static const values = [
    averageCustomerRating,
    category,
    publisher,
    fulfillmentOptionType,
    pricingModel,
    pricingUnit,
    deployedOnAws,
    numberOfProducts
  ];

  static SearchFacetType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SearchFacetType._(value));

  @override
  bool operator ==(other) => other is SearchFacetType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A facet value with display information and a count of matching listings.
/// Used to build filter and browse experiences.
///
/// @nodoc
class ListingFacet {
  /// The number of listings matching this facet value.
  final int count;

  /// The human-readable name of the facet value, suitable for display in a user
  /// interface.
  final String displayName;

  /// The internal value used for filtering when passed back in a search filter.
  final String value;

  /// The parent facet value for hierarchical facets, such as subcategories.
  final String? parent;

  ListingFacet({
    required this.count,
    required this.displayName,
    required this.value,
    this.parent,
  });

  factory ListingFacet.fromJson(Map<String, dynamic> json) {
    return ListingFacet(
      count: (json['count'] as int?) ?? 0,
      displayName: (json['displayName'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
      parent: json['parent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final displayName = this.displayName;
    final value = this.value;
    final parent = this.parent;
    return {
      'count': count,
      'displayName': displayName,
      'value': value,
      if (parent != null) 'parent': parent,
    };
  }
}

/// Summary information about a purchase option (offer or offer set) available
/// to the buyer, including the seller, badges, and associated products.
///
/// @nodoc
class PurchaseOptionSummary {
  /// The products, offers, and offer sets associated with this purchase option.
  final List<PurchaseOptionAssociatedEntity> associatedEntities;

  /// The name of the catalog that the purchase option belongs to.
  final String catalog;

  /// The unique identifier of the purchase option.
  final String purchaseOptionId;

  /// The type of purchase option. Values are <code>OFFER</code> for a
  /// single-product offer or <code>OFFERSET</code> for a bundled offer set.
  final PurchaseOptionType purchaseOptionType;

  /// The entity responsible for selling the product under this purchase option.
  final SellerInformation sellerOfRecord;

  /// The date and time when the purchase option became available to the buyer.
  final DateTime? availableFromTime;

  /// Badges indicating special attributes of the purchase option, such as private
  /// pricing or future dated.
  final List<PurchaseOptionBadge>? badges;

  /// The date and time when the purchase option expires and is no longer
  /// available for procurement.
  final DateTime? expirationTime;

  /// The display name of the purchase option.
  final String? purchaseOptionName;

  PurchaseOptionSummary({
    required this.associatedEntities,
    required this.catalog,
    required this.purchaseOptionId,
    required this.purchaseOptionType,
    required this.sellerOfRecord,
    this.availableFromTime,
    this.badges,
    this.expirationTime,
    this.purchaseOptionName,
  });

  factory PurchaseOptionSummary.fromJson(Map<String, dynamic> json) {
    return PurchaseOptionSummary(
      associatedEntities: ((json['associatedEntities'] as List?) ?? const [])
          .nonNulls
          .map((e) => PurchaseOptionAssociatedEntity.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      catalog: (json['catalog'] as String?) ?? '',
      purchaseOptionId: (json['purchaseOptionId'] as String?) ?? '',
      purchaseOptionType: PurchaseOptionType.fromString(
          (json['purchaseOptionType'] as String?) ?? ''),
      sellerOfRecord: SellerInformation.fromJson(
          (json['sellerOfRecord'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      availableFromTime: timeStampFromJson(json['availableFromTime']),
      badges: (json['badges'] as List?)
          ?.nonNulls
          .map((e) => PurchaseOptionBadge.fromJson(e as Map<String, dynamic>))
          .toList(),
      expirationTime: timeStampFromJson(json['expirationTime']),
      purchaseOptionName: json['purchaseOptionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedEntities = this.associatedEntities;
    final catalog = this.catalog;
    final purchaseOptionId = this.purchaseOptionId;
    final purchaseOptionType = this.purchaseOptionType;
    final sellerOfRecord = this.sellerOfRecord;
    final availableFromTime = this.availableFromTime;
    final badges = this.badges;
    final expirationTime = this.expirationTime;
    final purchaseOptionName = this.purchaseOptionName;
    return {
      'associatedEntities': associatedEntities,
      'catalog': catalog,
      'purchaseOptionId': purchaseOptionId,
      'purchaseOptionType': purchaseOptionType.value,
      'sellerOfRecord': sellerOfRecord,
      if (availableFromTime != null)
        'availableFromTime': unixTimestampToJson(availableFromTime),
      if (badges != null) 'badges': badges,
      if (expirationTime != null)
        'expirationTime': unixTimestampToJson(expirationTime),
      if (purchaseOptionName != null) 'purchaseOptionName': purchaseOptionName,
    };
  }
}

/// @nodoc
class PurchaseOptionType {
  static const offer = PurchaseOptionType._('OFFER');
  static const offerset = PurchaseOptionType._('OFFERSET');

  final String value;

  const PurchaseOptionType._(this.value);

  static const values = [offer, offerset];

  static PurchaseOptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PurchaseOptionType._(value));

  @override
  bool operator ==(other) =>
      other is PurchaseOptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A product, offer, and optional offer set associated with a purchase option.
///
/// @nodoc
class PurchaseOptionAssociatedEntity {
  /// Information about the offer associated with the purchase option.
  final OfferInformation offer;

  /// Information about the product associated with the purchase option.
  final ProductInformation product;

  /// Information about the offer set, if the purchase option is part of a bundled
  /// offer set.
  final OfferSetInformation? offerSet;

  PurchaseOptionAssociatedEntity({
    required this.offer,
    required this.product,
    this.offerSet,
  });

  factory PurchaseOptionAssociatedEntity.fromJson(Map<String, dynamic> json) {
    return PurchaseOptionAssociatedEntity(
      offer: OfferInformation.fromJson(
          (json['offer'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      product: ProductInformation.fromJson(
          (json['product'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      offerSet: json['offerSet'] != null
          ? OfferSetInformation.fromJson(
              json['offerSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final offer = this.offer;
    final product = this.product;
    final offerSet = this.offerSet;
    return {
      'offer': offer,
      'product': product,
      if (offerSet != null) 'offerSet': offerSet,
    };
  }
}

/// Summary information about an offer, including the offer identifier, name,
/// and seller of record.
///
/// @nodoc
class OfferInformation {
  /// The unique identifier of the offer.
  final String offerId;

  /// The entity responsible for selling the product under this offer.
  final SellerInformation sellerOfRecord;

  /// The display name of the offer.
  final String? offerName;

  OfferInformation({
    required this.offerId,
    required this.sellerOfRecord,
    this.offerName,
  });

  factory OfferInformation.fromJson(Map<String, dynamic> json) {
    return OfferInformation(
      offerId: (json['offerId'] as String?) ?? '',
      sellerOfRecord: SellerInformation.fromJson(
          (json['sellerOfRecord'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      offerName: json['offerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final offerId = this.offerId;
    final sellerOfRecord = this.sellerOfRecord;
    final offerName = this.offerName;
    return {
      'offerId': offerId,
      'sellerOfRecord': sellerOfRecord,
      if (offerName != null) 'offerName': offerName,
    };
  }
}

/// Summary information about an offer set, including the identifier and seller
/// of record.
///
/// @nodoc
class OfferSetInformation {
  /// The unique identifier of the offer set.
  final String offerSetId;

  /// The entity responsible for selling the products under this offer set.
  final SellerInformation sellerOfRecord;

  OfferSetInformation({
    required this.offerSetId,
    required this.sellerOfRecord,
  });

  factory OfferSetInformation.fromJson(Map<String, dynamic> json) {
    return OfferSetInformation(
      offerSetId: (json['offerSetId'] as String?) ?? '',
      sellerOfRecord: SellerInformation.fromJson(
          (json['sellerOfRecord'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final offerSetId = this.offerSetId;
    final sellerOfRecord = this.sellerOfRecord;
    return {
      'offerSetId': offerSetId,
      'sellerOfRecord': sellerOfRecord,
    };
  }
}

/// A badge indicating a special attribute of a purchase option, such as private
/// pricing or future dated.
///
/// @nodoc
class PurchaseOptionBadge {
  /// The machine-readable type of the badge.
  final PurchaseOptionBadgeType badgeType;

  /// The human-readable name of the badge.
  final String displayName;

  PurchaseOptionBadge({
    required this.badgeType,
    required this.displayName,
  });

  factory PurchaseOptionBadge.fromJson(Map<String, dynamic> json) {
    return PurchaseOptionBadge(
      badgeType: PurchaseOptionBadgeType.fromString(
          (json['badgeType'] as String?) ?? ''),
      displayName: (json['displayName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final badgeType = this.badgeType;
    final displayName = this.displayName;
    return {
      'badgeType': badgeType.value,
      'displayName': displayName,
    };
  }
}

/// @nodoc
class PurchaseOptionBadgeType {
  static const privatePricing = PurchaseOptionBadgeType._('PRIVATE_PRICING');
  static const futureDated = PurchaseOptionBadgeType._('FUTURE_DATED');
  static const replacementOffer =
      PurchaseOptionBadgeType._('REPLACEMENT_OFFER');

  final String value;

  const PurchaseOptionBadgeType._(this.value);

  static const values = [privatePricing, futureDated, replacementOffer];

  static PurchaseOptionBadgeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PurchaseOptionBadgeType._(value));

  @override
  bool operator ==(other) =>
      other is PurchaseOptionBadgeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter used to narrow purchase option results by product, seller, type,
/// visibility, or availability.
///
/// @nodoc
class PurchaseOptionFilter {
  /// The type of filter to apply, such as <code>PRODUCT_ID</code>,
  /// <code>VISIBILITY_SCOPE</code>, or <code>PURCHASE_OPTION_TYPE</code>.
  final PurchaseOptionFilterType filterType;

  /// The values to filter by. Multiple values within the same filter are combined
  /// with OR logic.
  final List<String> filterValues;

  PurchaseOptionFilter({
    required this.filterType,
    required this.filterValues,
  });

  Map<String, dynamic> toJson() {
    final filterType = this.filterType;
    final filterValues = this.filterValues;
    return {
      'filterType': filterType.value,
      'filterValues': filterValues,
    };
  }
}

/// @nodoc
class PurchaseOptionFilterType {
  static const productId = PurchaseOptionFilterType._('PRODUCT_ID');
  static const sellerOfRecordProfileId =
      PurchaseOptionFilterType._('SELLER_OF_RECORD_PROFILE_ID');
  static const purchaseOptionType =
      PurchaseOptionFilterType._('PURCHASE_OPTION_TYPE');
  static const visibilityScope = PurchaseOptionFilterType._('VISIBILITY_SCOPE');
  static const availabilityStatus =
      PurchaseOptionFilterType._('AVAILABILITY_STATUS');

  final String value;

  const PurchaseOptionFilterType._(this.value);

  static const values = [
    productId,
    sellerOfRecordProfileId,
    purchaseOptionType,
    visibilityScope,
    availabilityStatus
  ];

  static PurchaseOptionFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PurchaseOptionFilterType._(value));

  @override
  bool operator ==(other) =>
      other is PurchaseOptionFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes a fulfillment option for a product. Each element contains exactly
/// one fulfillment option type.
///
/// @nodoc
class FulfillmentOption {
  /// An Amazon Machine Image (AMI) fulfillment option for EC2 deployment.
  final AmazonMachineImageFulfillmentOption?
      amazonMachineImageFulfillmentOption;

  /// An API-based fulfillment option for programmatic integration.
  final ApiFulfillmentOption? apiFulfillmentOption;

  /// An AWS CloudFormation template fulfillment option for infrastructure
  /// deployment.
  final CloudFormationFulfillmentOption? cloudFormationFulfillmentOption;

  /// A container image fulfillment option for container-based deployment.
  final ContainerFulfillmentOption? containerFulfillmentOption;

  /// An AWS Data Exchange fulfillment option for data set delivery.
  final DataExchangeFulfillmentOption? dataExchangeFulfillmentOption;

  /// An EC2 Image Builder component fulfillment option.
  final Ec2ImageBuilderComponentFulfillmentOption?
      ec2ImageBuilderComponentFulfillmentOption;

  /// An Amazon EKS add-on fulfillment option.
  final EksAddOnFulfillmentOption? eksAddOnFulfillmentOption;

  /// A Helm chart fulfillment option for Kubernetes deployment.
  final HelmFulfillmentOption? helmFulfillmentOption;

  /// A professional services fulfillment option.
  final ProfessionalServicesFulfillmentOption?
      professionalServicesFulfillmentOption;

  /// A Software as a Service (SaaS) fulfillment option.
  final SaasFulfillmentOption? saasFulfillmentOption;

  /// An Amazon SageMaker algorithm fulfillment option.
  final SageMakerAlgorithmFulfillmentOption?
      sageMakerAlgorithmFulfillmentOption;

  /// An Amazon SageMaker model fulfillment option.
  final SageMakerModelFulfillmentOption? sageMakerModelFulfillmentOption;

  FulfillmentOption({
    this.amazonMachineImageFulfillmentOption,
    this.apiFulfillmentOption,
    this.cloudFormationFulfillmentOption,
    this.containerFulfillmentOption,
    this.dataExchangeFulfillmentOption,
    this.ec2ImageBuilderComponentFulfillmentOption,
    this.eksAddOnFulfillmentOption,
    this.helmFulfillmentOption,
    this.professionalServicesFulfillmentOption,
    this.saasFulfillmentOption,
    this.sageMakerAlgorithmFulfillmentOption,
    this.sageMakerModelFulfillmentOption,
  });

  factory FulfillmentOption.fromJson(Map<String, dynamic> json) {
    return FulfillmentOption(
      amazonMachineImageFulfillmentOption:
          json['amazonMachineImageFulfillmentOption'] != null
              ? AmazonMachineImageFulfillmentOption.fromJson(
                  json['amazonMachineImageFulfillmentOption']
                      as Map<String, dynamic>)
              : null,
      apiFulfillmentOption: json['apiFulfillmentOption'] != null
          ? ApiFulfillmentOption.fromJson(
              json['apiFulfillmentOption'] as Map<String, dynamic>)
          : null,
      cloudFormationFulfillmentOption:
          json['cloudFormationFulfillmentOption'] != null
              ? CloudFormationFulfillmentOption.fromJson(
                  json['cloudFormationFulfillmentOption']
                      as Map<String, dynamic>)
              : null,
      containerFulfillmentOption: json['containerFulfillmentOption'] != null
          ? ContainerFulfillmentOption.fromJson(
              json['containerFulfillmentOption'] as Map<String, dynamic>)
          : null,
      dataExchangeFulfillmentOption:
          json['dataExchangeFulfillmentOption'] != null
              ? DataExchangeFulfillmentOption.fromJson(
                  json['dataExchangeFulfillmentOption'] as Map<String, dynamic>)
              : null,
      ec2ImageBuilderComponentFulfillmentOption:
          json['ec2ImageBuilderComponentFulfillmentOption'] != null
              ? Ec2ImageBuilderComponentFulfillmentOption.fromJson(
                  json['ec2ImageBuilderComponentFulfillmentOption']
                      as Map<String, dynamic>)
              : null,
      eksAddOnFulfillmentOption: json['eksAddOnFulfillmentOption'] != null
          ? EksAddOnFulfillmentOption.fromJson(
              json['eksAddOnFulfillmentOption'] as Map<String, dynamic>)
          : null,
      helmFulfillmentOption: json['helmFulfillmentOption'] != null
          ? HelmFulfillmentOption.fromJson(
              json['helmFulfillmentOption'] as Map<String, dynamic>)
          : null,
      professionalServicesFulfillmentOption:
          json['professionalServicesFulfillmentOption'] != null
              ? ProfessionalServicesFulfillmentOption.fromJson(
                  json['professionalServicesFulfillmentOption']
                      as Map<String, dynamic>)
              : null,
      saasFulfillmentOption: json['saasFulfillmentOption'] != null
          ? SaasFulfillmentOption.fromJson(
              json['saasFulfillmentOption'] as Map<String, dynamic>)
          : null,
      sageMakerAlgorithmFulfillmentOption:
          json['sageMakerAlgorithmFulfillmentOption'] != null
              ? SageMakerAlgorithmFulfillmentOption.fromJson(
                  json['sageMakerAlgorithmFulfillmentOption']
                      as Map<String, dynamic>)
              : null,
      sageMakerModelFulfillmentOption:
          json['sageMakerModelFulfillmentOption'] != null
              ? SageMakerModelFulfillmentOption.fromJson(
                  json['sageMakerModelFulfillmentOption']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final amazonMachineImageFulfillmentOption =
        this.amazonMachineImageFulfillmentOption;
    final apiFulfillmentOption = this.apiFulfillmentOption;
    final cloudFormationFulfillmentOption =
        this.cloudFormationFulfillmentOption;
    final containerFulfillmentOption = this.containerFulfillmentOption;
    final dataExchangeFulfillmentOption = this.dataExchangeFulfillmentOption;
    final ec2ImageBuilderComponentFulfillmentOption =
        this.ec2ImageBuilderComponentFulfillmentOption;
    final eksAddOnFulfillmentOption = this.eksAddOnFulfillmentOption;
    final helmFulfillmentOption = this.helmFulfillmentOption;
    final professionalServicesFulfillmentOption =
        this.professionalServicesFulfillmentOption;
    final saasFulfillmentOption = this.saasFulfillmentOption;
    final sageMakerAlgorithmFulfillmentOption =
        this.sageMakerAlgorithmFulfillmentOption;
    final sageMakerModelFulfillmentOption =
        this.sageMakerModelFulfillmentOption;
    return {
      if (amazonMachineImageFulfillmentOption != null)
        'amazonMachineImageFulfillmentOption':
            amazonMachineImageFulfillmentOption,
      if (apiFulfillmentOption != null)
        'apiFulfillmentOption': apiFulfillmentOption,
      if (cloudFormationFulfillmentOption != null)
        'cloudFormationFulfillmentOption': cloudFormationFulfillmentOption,
      if (containerFulfillmentOption != null)
        'containerFulfillmentOption': containerFulfillmentOption,
      if (dataExchangeFulfillmentOption != null)
        'dataExchangeFulfillmentOption': dataExchangeFulfillmentOption,
      if (ec2ImageBuilderComponentFulfillmentOption != null)
        'ec2ImageBuilderComponentFulfillmentOption':
            ec2ImageBuilderComponentFulfillmentOption,
      if (eksAddOnFulfillmentOption != null)
        'eksAddOnFulfillmentOption': eksAddOnFulfillmentOption,
      if (helmFulfillmentOption != null)
        'helmFulfillmentOption': helmFulfillmentOption,
      if (professionalServicesFulfillmentOption != null)
        'professionalServicesFulfillmentOption':
            professionalServicesFulfillmentOption,
      if (saasFulfillmentOption != null)
        'saasFulfillmentOption': saasFulfillmentOption,
      if (sageMakerAlgorithmFulfillmentOption != null)
        'sageMakerAlgorithmFulfillmentOption':
            sageMakerAlgorithmFulfillmentOption,
      if (sageMakerModelFulfillmentOption != null)
        'sageMakerModelFulfillmentOption': sageMakerModelFulfillmentOption,
    };
  }
}

/// Describes an Amazon Machine Image (AMI) fulfillment option, including
/// version details, supported operating systems, and recommended instance
/// types.
///
/// @nodoc
class AmazonMachineImageFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The display name of the fulfillment option version.
  final String fulfillmentOptionName;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The operating systems supported by this AMI.
  final List<AmazonMachineImageOperatingSystem> operatingSystems;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// Recommended instance types for running this AMI.
  final AmazonMachineImageRecommendation? recommendation;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to deploy and use this fulfillment option.
  final String? usageInstructions;

  AmazonMachineImageFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionName,
    required this.fulfillmentOptionType,
    required this.operatingSystems,
    this.fulfillmentOptionVersion,
    this.recommendation,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory AmazonMachineImageFulfillmentOption.fromJson(
      Map<String, dynamic> json) {
    return AmazonMachineImageFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionName: (json['fulfillmentOptionName'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      operatingSystems: ((json['operatingSystems'] as List?) ?? const [])
          .nonNulls
          .map((e) => AmazonMachineImageOperatingSystem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      recommendation: json['recommendation'] != null
          ? AmazonMachineImageRecommendation.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionName = this.fulfillmentOptionName;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final operatingSystems = this.operatingSystems;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final recommendation = this.recommendation;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionName': fulfillmentOptionName,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      'operatingSystems': operatingSystems,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (recommendation != null) 'recommendation': recommendation,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes an API-based fulfillment option, where the product is accessed
/// through an API integration.
///
/// @nodoc
class ApiFulfillmentOption {
  /// The AWS services supported by this API integration.
  final List<AwsSupportedService> awsSupportedServices;

  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// Instructions on how to integrate with and use this API.
  final String? usageInstructions;

  ApiFulfillmentOption({
    required this.awsSupportedServices,
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionType,
    this.usageInstructions,
  });

  factory ApiFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return ApiFulfillmentOption(
      awsSupportedServices: ((json['awsSupportedServices'] as List?) ??
              const [])
          .nonNulls
          .map((e) => AwsSupportedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsSupportedServices = this.awsSupportedServices;
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final usageInstructions = this.usageInstructions;
    return {
      'awsSupportedServices': awsSupportedServices,
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes an AWS CloudFormation template fulfillment option for
/// infrastructure deployment.
///
/// @nodoc
class CloudFormationFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The display name of the fulfillment option version.
  final String fulfillmentOptionName;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to deploy and use this CloudFormation template.
  final String? usageInstructions;

  CloudFormationFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionName,
    required this.fulfillmentOptionType,
    this.fulfillmentOptionVersion,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory CloudFormationFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return CloudFormationFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionName: (json['fulfillmentOptionName'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionName = this.fulfillmentOptionName;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionName': fulfillmentOptionName,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes a container image fulfillment option for container-based
/// deployment.
///
/// @nodoc
class ContainerFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The display name of the fulfillment option version.
  final String fulfillmentOptionName;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The AWS services supported by this container deployment.
  final List<AwsSupportedService>? awsSupportedServices;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// The operating systems supported by this container image.
  final List<ContainerOperatingSystem>? operatingSystems;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to deploy and use this container image.
  final String? usageInstructions;

  ContainerFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionName,
    required this.fulfillmentOptionType,
    this.awsSupportedServices,
    this.fulfillmentOptionVersion,
    this.operatingSystems,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory ContainerFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return ContainerFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionName: (json['fulfillmentOptionName'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      awsSupportedServices: (json['awsSupportedServices'] as List?)
          ?.nonNulls
          .map((e) => AwsSupportedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      operatingSystems: (json['operatingSystems'] as List?)
          ?.nonNulls
          .map((e) =>
              ContainerOperatingSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionName = this.fulfillmentOptionName;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final awsSupportedServices = this.awsSupportedServices;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final operatingSystems = this.operatingSystems;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionName': fulfillmentOptionName,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (awsSupportedServices != null)
        'awsSupportedServices': awsSupportedServices,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (operatingSystems != null) 'operatingSystems': operatingSystems,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes a Helm chart fulfillment option for Kubernetes deployment.
///
/// @nodoc
class HelmFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The display name of the fulfillment option version.
  final String fulfillmentOptionName;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The AWS services supported by this Helm chart deployment.
  final List<AwsSupportedService>? awsSupportedServices;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// The operating systems supported by this Helm chart.
  final List<HelmOperatingSystem>? operatingSystems;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to deploy and use this Helm chart.
  final String? usageInstructions;

  HelmFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionName,
    required this.fulfillmentOptionType,
    this.awsSupportedServices,
    this.fulfillmentOptionVersion,
    this.operatingSystems,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory HelmFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return HelmFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionName: (json['fulfillmentOptionName'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      awsSupportedServices: (json['awsSupportedServices'] as List?)
          ?.nonNulls
          .map((e) => AwsSupportedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      operatingSystems: (json['operatingSystems'] as List?)
          ?.nonNulls
          .map((e) => HelmOperatingSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionName = this.fulfillmentOptionName;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final awsSupportedServices = this.awsSupportedServices;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final operatingSystems = this.operatingSystems;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionName': fulfillmentOptionName,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (awsSupportedServices != null)
        'awsSupportedServices': awsSupportedServices,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (operatingSystems != null) 'operatingSystems': operatingSystems,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes an Amazon EKS add-on fulfillment option.
///
/// @nodoc
class EksAddOnFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The display name of the fulfillment option version.
  final String fulfillmentOptionName;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The AWS services supported by this EKS add-on.
  final List<AwsSupportedService>? awsSupportedServices;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// The operating systems supported by this EKS add-on.
  final List<EksAddOnOperatingSystem>? operatingSystems;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to deploy and use this EKS add-on.
  final String? usageInstructions;

  EksAddOnFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionName,
    required this.fulfillmentOptionType,
    this.awsSupportedServices,
    this.fulfillmentOptionVersion,
    this.operatingSystems,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory EksAddOnFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return EksAddOnFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionName: (json['fulfillmentOptionName'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      awsSupportedServices: (json['awsSupportedServices'] as List?)
          ?.nonNulls
          .map((e) => AwsSupportedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      operatingSystems: (json['operatingSystems'] as List?)
          ?.nonNulls
          .map((e) =>
              EksAddOnOperatingSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionName = this.fulfillmentOptionName;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final awsSupportedServices = this.awsSupportedServices;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final operatingSystems = this.operatingSystems;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionName': fulfillmentOptionName,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (awsSupportedServices != null)
        'awsSupportedServices': awsSupportedServices,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (operatingSystems != null) 'operatingSystems': operatingSystems,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes an EC2 Image Builder component fulfillment option.
///
/// @nodoc
class Ec2ImageBuilderComponentFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The display name of the fulfillment option version.
  final String fulfillmentOptionName;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The AWS services supported by this EC2 Image Builder component.
  final List<AwsSupportedService>? awsSupportedServices;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// The operating systems supported by this EC2 Image Builder component.
  final List<ContainerOperatingSystem>? operatingSystems;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to deploy and use this EC2 Image Builder component.
  final String? usageInstructions;

  Ec2ImageBuilderComponentFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionName,
    required this.fulfillmentOptionType,
    this.awsSupportedServices,
    this.fulfillmentOptionVersion,
    this.operatingSystems,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory Ec2ImageBuilderComponentFulfillmentOption.fromJson(
      Map<String, dynamic> json) {
    return Ec2ImageBuilderComponentFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionName: (json['fulfillmentOptionName'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      awsSupportedServices: (json['awsSupportedServices'] as List?)
          ?.nonNulls
          .map((e) => AwsSupportedService.fromJson(e as Map<String, dynamic>))
          .toList(),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      operatingSystems: (json['operatingSystems'] as List?)
          ?.nonNulls
          .map((e) =>
              ContainerOperatingSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionName = this.fulfillmentOptionName;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final awsSupportedServices = this.awsSupportedServices;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final operatingSystems = this.operatingSystems;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionName': fulfillmentOptionName,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (awsSupportedServices != null)
        'awsSupportedServices': awsSupportedServices,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (operatingSystems != null) 'operatingSystems': operatingSystems,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes an AWS Data Exchange fulfillment option for data set delivery.
///
/// @nodoc
class DataExchangeFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The data artifacts included in this Data Exchange fulfillment option.
  final List<DataArtifact>? dataArtifacts;

  DataExchangeFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionType,
    this.dataArtifacts,
  });

  factory DataExchangeFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return DataExchangeFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      dataArtifacts: (json['dataArtifacts'] as List?)
          ?.nonNulls
          .map((e) => DataArtifact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final dataArtifacts = this.dataArtifacts;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (dataArtifacts != null) 'dataArtifacts': dataArtifacts,
    };
  }
}

/// Describes a professional services fulfillment option.
///
/// @nodoc
class ProfessionalServicesFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  ProfessionalServicesFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionType,
  });

  factory ProfessionalServicesFulfillmentOption.fromJson(
      Map<String, dynamic> json) {
    return ProfessionalServicesFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionType': fulfillmentOptionType.value,
    };
  }
}

/// Describes a Software as a Service (SaaS) fulfillment option.
///
/// @nodoc
class SaasFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The URL of the seller's software registration landing page.
  final String? fulfillmentUrl;

  /// Instructions on how to access and use this SaaS product.
  final String? usageInstructions;

  SaasFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionType,
    this.fulfillmentUrl,
    this.usageInstructions,
  });

  factory SaasFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return SaasFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      fulfillmentUrl: json['fulfillmentUrl'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final fulfillmentUrl = this.fulfillmentUrl;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (fulfillmentUrl != null) 'fulfillmentUrl': fulfillmentUrl,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes an Amazon SageMaker algorithm fulfillment option, including
/// version details and recommended instance types.
///
/// @nodoc
class SageMakerAlgorithmFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// Recommended instance types for training and inference with this algorithm.
  final SageMakerAlgorithmRecommendation? recommendation;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to use this SageMaker algorithm.
  final String? usageInstructions;

  SageMakerAlgorithmFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionType,
    this.fulfillmentOptionVersion,
    this.recommendation,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory SageMakerAlgorithmFulfillmentOption.fromJson(
      Map<String, dynamic> json) {
    return SageMakerAlgorithmFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      recommendation: json['recommendation'] != null
          ? SageMakerAlgorithmRecommendation.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final recommendation = this.recommendation;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (recommendation != null) 'recommendation': recommendation,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Describes an Amazon SageMaker model fulfillment option, including version
/// details and recommended instance types.
///
/// @nodoc
class SageMakerModelFulfillmentOption {
  /// A human-readable name for the fulfillment option type.
  final String fulfillmentOptionDisplayName;

  /// The unique identifier of the fulfillment option.
  final String fulfillmentOptionId;

  /// The category of the fulfillment option.
  final FulfillmentOptionType fulfillmentOptionType;

  /// The version identifier of the fulfillment option.
  final String? fulfillmentOptionVersion;

  /// Recommended instance types for inference with this model.
  final SageMakerModelRecommendation? recommendation;

  /// Release notes describing changes in this version of the fulfillment option.
  final String? releaseNotes;

  /// Instructions on how to use this SageMaker model.
  final String? usageInstructions;

  SageMakerModelFulfillmentOption({
    required this.fulfillmentOptionDisplayName,
    required this.fulfillmentOptionId,
    required this.fulfillmentOptionType,
    this.fulfillmentOptionVersion,
    this.recommendation,
    this.releaseNotes,
    this.usageInstructions,
  });

  factory SageMakerModelFulfillmentOption.fromJson(Map<String, dynamic> json) {
    return SageMakerModelFulfillmentOption(
      fulfillmentOptionDisplayName:
          (json['fulfillmentOptionDisplayName'] as String?) ?? '',
      fulfillmentOptionId: (json['fulfillmentOptionId'] as String?) ?? '',
      fulfillmentOptionType: FulfillmentOptionType.fromString(
          (json['fulfillmentOptionType'] as String?) ?? ''),
      fulfillmentOptionVersion: json['fulfillmentOptionVersion'] as String?,
      recommendation: json['recommendation'] != null
          ? SageMakerModelRecommendation.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
      releaseNotes: json['releaseNotes'] as String?,
      usageInstructions: json['usageInstructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fulfillmentOptionDisplayName = this.fulfillmentOptionDisplayName;
    final fulfillmentOptionId = this.fulfillmentOptionId;
    final fulfillmentOptionType = this.fulfillmentOptionType;
    final fulfillmentOptionVersion = this.fulfillmentOptionVersion;
    final recommendation = this.recommendation;
    final releaseNotes = this.releaseNotes;
    final usageInstructions = this.usageInstructions;
    return {
      'fulfillmentOptionDisplayName': fulfillmentOptionDisplayName,
      'fulfillmentOptionId': fulfillmentOptionId,
      'fulfillmentOptionType': fulfillmentOptionType.value,
      if (fulfillmentOptionVersion != null)
        'fulfillmentOptionVersion': fulfillmentOptionVersion,
      if (recommendation != null) 'recommendation': recommendation,
      if (releaseNotes != null) 'releaseNotes': releaseNotes,
      if (usageInstructions != null) 'usageInstructions': usageInstructions,
    };
  }
}

/// Recommended instance types for inference with a SageMaker model.
///
/// @nodoc
class SageMakerModelRecommendation {
  /// The recommended instance type for batch inference.
  final String recommendedBatchTransformInstanceType;

  /// The recommended instance type for real-time inference.
  final String? recommendedRealtimeInferenceInstanceType;

  SageMakerModelRecommendation({
    required this.recommendedBatchTransformInstanceType,
    this.recommendedRealtimeInferenceInstanceType,
  });

  factory SageMakerModelRecommendation.fromJson(Map<String, dynamic> json) {
    return SageMakerModelRecommendation(
      recommendedBatchTransformInstanceType:
          (json['recommendedBatchTransformInstanceType'] as String?) ?? '',
      recommendedRealtimeInferenceInstanceType:
          json['recommendedRealtimeInferenceInstanceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendedBatchTransformInstanceType =
        this.recommendedBatchTransformInstanceType;
    final recommendedRealtimeInferenceInstanceType =
        this.recommendedRealtimeInferenceInstanceType;
    return {
      'recommendedBatchTransformInstanceType':
          recommendedBatchTransformInstanceType,
      if (recommendedRealtimeInferenceInstanceType != null)
        'recommendedRealtimeInferenceInstanceType':
            recommendedRealtimeInferenceInstanceType,
    };
  }
}

/// Recommended instance types for training and inference with a SageMaker
/// algorithm.
///
/// @nodoc
class SageMakerAlgorithmRecommendation {
  /// The recommended instance type for batch inference.
  final String recommendedBatchTransformInstanceType;

  /// The recommended instance type for training.
  final String recommendedTrainingInstanceType;

  /// The recommended instance type for real-time inference.
  final String? recommendedRealtimeInferenceInstanceType;

  SageMakerAlgorithmRecommendation({
    required this.recommendedBatchTransformInstanceType,
    required this.recommendedTrainingInstanceType,
    this.recommendedRealtimeInferenceInstanceType,
  });

  factory SageMakerAlgorithmRecommendation.fromJson(Map<String, dynamic> json) {
    return SageMakerAlgorithmRecommendation(
      recommendedBatchTransformInstanceType:
          (json['recommendedBatchTransformInstanceType'] as String?) ?? '',
      recommendedTrainingInstanceType:
          (json['recommendedTrainingInstanceType'] as String?) ?? '',
      recommendedRealtimeInferenceInstanceType:
          json['recommendedRealtimeInferenceInstanceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendedBatchTransformInstanceType =
        this.recommendedBatchTransformInstanceType;
    final recommendedTrainingInstanceType =
        this.recommendedTrainingInstanceType;
    final recommendedRealtimeInferenceInstanceType =
        this.recommendedRealtimeInferenceInstanceType;
    return {
      'recommendedBatchTransformInstanceType':
          recommendedBatchTransformInstanceType,
      'recommendedTrainingInstanceType': recommendedTrainingInstanceType,
      if (recommendedRealtimeInferenceInstanceType != null)
        'recommendedRealtimeInferenceInstanceType':
            recommendedRealtimeInferenceInstanceType,
    };
  }
}

/// Describes a data artifact within a Data Exchange fulfillment option.
///
/// @nodoc
class DataArtifact {
  /// The classification of sensitive data contained in the dataset.
  final String dataClassification;

  /// The type of the data artifact resource.
  final String resourceType;

  /// A description of the data artifact.
  final String? description;

  /// The Amazon Resource Name (ARN) of the data artifact.
  final String? resourceArn;

  DataArtifact({
    required this.dataClassification,
    required this.resourceType,
    this.description,
    this.resourceArn,
  });

  factory DataArtifact.fromJson(Map<String, dynamic> json) {
    return DataArtifact(
      dataClassification: (json['dataClassification'] as String?) ?? '',
      resourceType: (json['resourceType'] as String?) ?? '',
      description: json['description'] as String?,
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataClassification = this.dataClassification;
    final resourceType = this.resourceType;
    final description = this.description;
    final resourceArn = this.resourceArn;
    return {
      'dataClassification': dataClassification,
      'resourceType': resourceType,
      if (description != null) 'description': description,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

/// Describes an AWS service supported by a fulfillment option.
///
/// @nodoc
class AwsSupportedService {
  /// A description of the supported service.
  final String description;

  /// The human-readable name of the supported service.
  final String displayName;

  /// The machine-readable identifier of the supported service.
  final String supportedServiceType;

  AwsSupportedService({
    required this.description,
    required this.displayName,
    required this.supportedServiceType,
  });

  factory AwsSupportedService.fromJson(Map<String, dynamic> json) {
    return AwsSupportedService(
      description: (json['description'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      supportedServiceType: (json['supportedServiceType'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final supportedServiceType = this.supportedServiceType;
    return {
      'description': description,
      'displayName': displayName,
      'supportedServiceType': supportedServiceType,
    };
  }
}

/// Describes an operating system supported by a container fulfillment option.
///
/// @nodoc
class ContainerOperatingSystem {
  /// The operating system family, such as Linux.
  final String operatingSystemFamilyName;

  /// The specific operating system name.
  final String operatingSystemName;

  ContainerOperatingSystem({
    required this.operatingSystemFamilyName,
    required this.operatingSystemName,
  });

  factory ContainerOperatingSystem.fromJson(Map<String, dynamic> json) {
    return ContainerOperatingSystem(
      operatingSystemFamilyName:
          (json['operatingSystemFamilyName'] as String?) ?? '',
      operatingSystemName: (json['operatingSystemName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final operatingSystemFamilyName = this.operatingSystemFamilyName;
    final operatingSystemName = this.operatingSystemName;
    return {
      'operatingSystemFamilyName': operatingSystemFamilyName,
      'operatingSystemName': operatingSystemName,
    };
  }
}

/// Describes an operating system supported by an EKS add-on fulfillment option.
///
/// @nodoc
class EksAddOnOperatingSystem {
  /// The operating system family, such as Linux.
  final String operatingSystemFamilyName;

  /// The specific operating system name.
  final String operatingSystemName;

  EksAddOnOperatingSystem({
    required this.operatingSystemFamilyName,
    required this.operatingSystemName,
  });

  factory EksAddOnOperatingSystem.fromJson(Map<String, dynamic> json) {
    return EksAddOnOperatingSystem(
      operatingSystemFamilyName:
          (json['operatingSystemFamilyName'] as String?) ?? '',
      operatingSystemName: (json['operatingSystemName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final operatingSystemFamilyName = this.operatingSystemFamilyName;
    final operatingSystemName = this.operatingSystemName;
    return {
      'operatingSystemFamilyName': operatingSystemFamilyName,
      'operatingSystemName': operatingSystemName,
    };
  }
}

/// Describes an operating system supported by a Helm chart fulfillment option.
///
/// @nodoc
class HelmOperatingSystem {
  /// The operating system family, such as Linux.
  final String operatingSystemFamilyName;

  /// The specific operating system name.
  final String operatingSystemName;

  HelmOperatingSystem({
    required this.operatingSystemFamilyName,
    required this.operatingSystemName,
  });

  factory HelmOperatingSystem.fromJson(Map<String, dynamic> json) {
    return HelmOperatingSystem(
      operatingSystemFamilyName:
          (json['operatingSystemFamilyName'] as String?) ?? '',
      operatingSystemName: (json['operatingSystemName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final operatingSystemFamilyName = this.operatingSystemFamilyName;
    final operatingSystemName = this.operatingSystemName;
    return {
      'operatingSystemFamilyName': operatingSystemFamilyName,
      'operatingSystemName': operatingSystemName,
    };
  }
}

/// Recommended instance types for running an AMI fulfillment option.
///
/// @nodoc
class AmazonMachineImageRecommendation {
  /// The recommended EC2 instance type for this AMI.
  final String instanceType;

  AmazonMachineImageRecommendation({
    required this.instanceType,
  });

  factory AmazonMachineImageRecommendation.fromJson(Map<String, dynamic> json) {
    return AmazonMachineImageRecommendation(
      instanceType: (json['instanceType'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    return {
      'instanceType': instanceType,
    };
  }
}

/// Describes an operating system supported by an AMI fulfillment option.
///
/// @nodoc
class AmazonMachineImageOperatingSystem {
  /// The operating system family, such as Linux or Windows.
  final String operatingSystemFamilyName;

  /// The specific operating system name, such as Amazon Linux 2 or Windows Server
  /// 2022.
  final String operatingSystemName;

  /// The version of the operating system.
  final String? operatingSystemVersion;

  AmazonMachineImageOperatingSystem({
    required this.operatingSystemFamilyName,
    required this.operatingSystemName,
    this.operatingSystemVersion,
  });

  factory AmazonMachineImageOperatingSystem.fromJson(
      Map<String, dynamic> json) {
    return AmazonMachineImageOperatingSystem(
      operatingSystemFamilyName:
          (json['operatingSystemFamilyName'] as String?) ?? '',
      operatingSystemName: (json['operatingSystemName'] as String?) ?? '',
      operatingSystemVersion: json['operatingSystemVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operatingSystemFamilyName = this.operatingSystemFamilyName;
    final operatingSystemName = this.operatingSystemName;
    final operatingSystemVersion = this.operatingSystemVersion;
    return {
      'operatingSystemFamilyName': operatingSystemFamilyName,
      'operatingSystemName': operatingSystemName,
      if (operatingSystemVersion != null)
        'operatingSystemVersion': operatingSystemVersion,
    };
  }
}

/// @nodoc
class DeployedOnAwsStatus {
  static const deployed = DeployedOnAwsStatus._('DEPLOYED');
  static const notDeployed = DeployedOnAwsStatus._('NOT_DEPLOYED');
  static const notApplicable = DeployedOnAwsStatus._('NOT_APPLICABLE');

  final String value;

  const DeployedOnAwsStatus._(this.value);

  static const values = [deployed, notDeployed, notApplicable];

  static DeployedOnAwsStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeployedOnAwsStatus._(value));

  @override
  bool operator ==(other) =>
      other is DeployedOnAwsStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An engagement option available to potential buyers of a product, such as
/// requesting a private offer or a demo.
///
/// @nodoc
class SellerEngagement {
  /// The format of the engagement value, such as a URL.
  final SellerEngagementContentType contentType;

  /// The type of engagement, such as <code>REQUEST_FOR_PRIVATE_OFFER</code> or
  /// <code>REQUEST_FOR_DEMO</code>.
  final SellerEngagementType engagementType;

  /// The engagement value, such as a URL to the engagement form.
  final String value;

  SellerEngagement({
    required this.contentType,
    required this.engagementType,
    required this.value,
  });

  factory SellerEngagement.fromJson(Map<String, dynamic> json) {
    return SellerEngagement(
      contentType: SellerEngagementContentType.fromString(
          (json['contentType'] as String?) ?? ''),
      engagementType: SellerEngagementType.fromString(
          (json['engagementType'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final engagementType = this.engagementType;
    final value = this.value;
    return {
      'contentType': contentType.value,
      'engagementType': engagementType.value,
      'value': value,
    };
  }
}

/// @nodoc
class SellerEngagementType {
  static const requestForPrivateOffer =
      SellerEngagementType._('REQUEST_FOR_PRIVATE_OFFER');
  static const requestForDemo = SellerEngagementType._('REQUEST_FOR_DEMO');

  final String value;

  const SellerEngagementType._(this.value);

  static const values = [requestForPrivateOffer, requestForDemo];

  static SellerEngagementType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SellerEngagementType._(value));

  @override
  bool operator ==(other) =>
      other is SellerEngagementType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SellerEngagementContentType {
  static const link = SellerEngagementContentType._('LINK');

  final String value;

  const SellerEngagementContentType._(this.value);

  static const values = [link];

  static SellerEngagementContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SellerEngagementContentType._(value));

  @override
  bool operator ==(other) =>
      other is SellerEngagementContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A resource that provides supplementary information about a product, such as
/// documentation links, support contacts, or usage instructions.
///
/// @nodoc
class Resource {
  /// The format of the resource content, such as a URL, email address, or text.
  final ResourceContentType contentType;

  /// The category of the resource, such as manufacturer support or usage
  /// instructions.
  final ResourceType resourceType;

  /// The resource content. Interpretation depends on the content type.
  final String value;

  /// An optional human-readable label for the resource.
  final String? displayName;

  Resource({
    required this.contentType,
    required this.resourceType,
    required this.value,
    this.displayName,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      contentType: ResourceContentType.fromString(
          (json['contentType'] as String?) ?? ''),
      resourceType:
          ResourceType.fromString((json['resourceType'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final resourceType = this.resourceType;
    final value = this.value;
    final displayName = this.displayName;
    return {
      'contentType': contentType.value,
      'resourceType': resourceType.value,
      'value': value,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// @nodoc
class ResourceType {
  static const manufacturerSupport = ResourceType._('MANUFACTURER_SUPPORT');
  static const manufacturerInstructions =
      ResourceType._('MANUFACTURER_INSTRUCTIONS');

  final String value;

  const ResourceType._(this.value);

  static const values = [manufacturerSupport, manufacturerInstructions];

  static ResourceType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ResourceType._(value));

  @override
  bool operator ==(other) => other is ResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceContentType {
  static const email = ResourceContentType._('EMAIL');
  static const phoneNumber = ResourceContentType._('PHONE_NUMBER');
  static const link = ResourceContentType._('LINK');
  static const other = ResourceContentType._('OTHER');

  final String value;

  const ResourceContentType._(this.value);

  static const values = [email, phoneNumber, link, other];

  static ResourceContentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ResourceContentType._(value));

  @override
  bool operator ==(other) =>
      other is ResourceContentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Embedded promotional media for a product, such as images or videos. Each
/// element contains exactly one media type.
///
/// @nodoc
class PromotionalMedia {
  final PromotionalEmbeddedImage? embeddedImage;
  final PromotionalEmbeddedVideo? embeddedVideo;

  PromotionalMedia({
    this.embeddedImage,
    this.embeddedVideo,
  });

  factory PromotionalMedia.fromJson(Map<String, dynamic> json) {
    return PromotionalMedia(
      embeddedImage: json['embeddedImage'] != null
          ? PromotionalEmbeddedImage.fromJson(
              json['embeddedImage'] as Map<String, dynamic>)
          : null,
      embeddedVideo: json['embeddedVideo'] != null
          ? PromotionalEmbeddedVideo.fromJson(
              json['embeddedVideo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final embeddedImage = this.embeddedImage;
    final embeddedVideo = this.embeddedVideo;
    return {
      if (embeddedImage != null) 'embeddedImage': embeddedImage,
      if (embeddedVideo != null) 'embeddedVideo': embeddedVideo,
    };
  }
}

/// An embedded promotional image for a product.
///
/// @nodoc
class PromotionalEmbeddedImage {
  /// The title displayed when hovering over the image.
  final String title;

  /// The URL of the image file.
  final String url;

  /// An optional description of the image.
  final String? description;

  PromotionalEmbeddedImage({
    required this.title,
    required this.url,
    this.description,
  });

  factory PromotionalEmbeddedImage.fromJson(Map<String, dynamic> json) {
    return PromotionalEmbeddedImage(
      title: (json['title'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final title = this.title;
    final url = this.url;
    final description = this.description;
    return {
      'title': title,
      'url': url,
      if (description != null) 'description': description,
    };
  }
}

/// An embedded promotional video for a product.
///
/// @nodoc
class PromotionalEmbeddedVideo {
  /// The URL of the high-resolution preview image for the video.
  final String preview;

  /// The URL of the thumbnail image for the video.
  final String thumbnail;

  /// The title displayed when hovering over the video.
  final String title;

  /// The URL of the video file.
  final String url;

  /// An optional description of the video.
  final String? description;

  PromotionalEmbeddedVideo({
    required this.preview,
    required this.thumbnail,
    required this.title,
    required this.url,
    this.description,
  });

  factory PromotionalEmbeddedVideo.fromJson(Map<String, dynamic> json) {
    return PromotionalEmbeddedVideo(
      preview: (json['preview'] as String?) ?? '',
      thumbnail: (json['thumbnail'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final preview = this.preview;
    final thumbnail = this.thumbnail;
    final title = this.title;
    final url = this.url;
    final description = this.description;
    return {
      'preview': preview,
      'thumbnail': thumbnail,
      'title': title,
      'url': url,
      if (description != null) 'description': description,
    };
  }
}

/// A term attached to an offer. Each element contains exactly one term type,
/// such as a pricing term, legal term, or payment schedule term.
///
/// @nodoc
class OfferTerm {
  final ByolPricingTerm? byolPricingTerm;
  final ConfigurableUpfrontPricingTerm? configurableUpfrontPricingTerm;
  final FixedUpfrontPricingTerm? fixedUpfrontPricingTerm;
  final FreeTrialPricingTerm? freeTrialPricingTerm;
  final LegalTerm? legalTerm;
  final PaymentScheduleTerm? paymentScheduleTerm;
  final RecurringPaymentTerm? recurringPaymentTerm;
  final RenewalTerm? renewalTerm;
  final SupportTerm? supportTerm;
  final UsageBasedPricingTerm? usageBasedPricingTerm;
  final ValidityTerm? validityTerm;
  final VariablePaymentTerm? variablePaymentTerm;

  OfferTerm({
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

  factory OfferTerm.fromJson(Map<String, dynamic> json) {
    return OfferTerm(
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

/// Defines a Bring Your Own License (BYOL) pricing term, where buyers use their
/// existing license for the product.
///
/// @nodoc
class ByolPricingTerm {
  /// The unique identifier of the term.
  final String id;

  /// The category of the term.
  final TermType type;

  ByolPricingTerm({
    required this.id,
    required this.type,
  });

  factory ByolPricingTerm.fromJson(Map<String, dynamic> json) {
    return ByolPricingTerm(
      id: (json['id'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'id': id,
      'type': type.value,
    };
  }
}

/// Defines a configurable upfront pricing term with selectable rate cards,
/// where buyers choose from predefined pricing configurations.
///
/// @nodoc
class ConfigurableUpfrontPricingTerm {
  /// Defines the currency for the prices in this term.
  final String currencyCode;

  /// The unique identifier of the term.
  final String id;

  /// The category of the term.
  final TermType type;

  /// The rate cards available for selection, each with a selector, constraints,
  /// and per-unit rates.
  final List<ConfigurableUpfrontRateCardItem>? rateCards;

  ConfigurableUpfrontPricingTerm({
    required this.currencyCode,
    required this.id,
    required this.type,
    this.rateCards,
  });

  factory ConfigurableUpfrontPricingTerm.fromJson(Map<String, dynamic> json) {
    return ConfigurableUpfrontPricingTerm(
      currencyCode: (json['currencyCode'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
      rateCards: (json['rateCards'] as List?)
          ?.nonNulls
          .map((e) => ConfigurableUpfrontRateCardItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final id = this.id;
    final type = this.type;
    final rateCards = this.rateCards;
    return {
      'currencyCode': currencyCode,
      'id': id,
      'type': type.value,
      if (rateCards != null) 'rateCards': rateCards,
    };
  }
}

/// Defines a fixed upfront pricing term with a pre-paid amount and granted
/// entitlements.
///
/// @nodoc
class FixedUpfrontPricingTerm {
  /// Defines the currency for the prices in this term.
  final String currencyCode;

  /// The entitlements granted to the buyer as part of this term.
  final List<GrantItem> grants;

  /// The unique identifier of the term.
  final String id;

  /// The price charged upfront for this term.
  final String price;

  /// The category of the term.
  final TermType type;

  /// The duration of the fixed pricing term, in ISO 8601 format.
  final String? duration;

  FixedUpfrontPricingTerm({
    required this.currencyCode,
    required this.grants,
    required this.id,
    required this.price,
    required this.type,
    this.duration,
  });

  factory FixedUpfrontPricingTerm.fromJson(Map<String, dynamic> json) {
    return FixedUpfrontPricingTerm(
      currencyCode: (json['currencyCode'] as String?) ?? '',
      grants: ((json['grants'] as List?) ?? const [])
          .nonNulls
          .map((e) => GrantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as String?) ?? '',
      price: (json['price'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
      duration: json['duration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final grants = this.grants;
    final id = this.id;
    final price = this.price;
    final type = this.type;
    final duration = this.duration;
    return {
      'currencyCode': currencyCode,
      'grants': grants,
      'id': id,
      'price': price,
      'type': type.value,
      if (duration != null) 'duration': duration,
    };
  }
}

/// Defines a free trial pricing term that enables customers to try the product
/// before purchasing.
///
/// @nodoc
class FreeTrialPricingTerm {
  /// The entitlements granted to the buyer during the free trial.
  final List<GrantItem> grants;

  /// The unique identifier of the term.
  final String id;

  /// The category of the term.
  final TermType type;

  /// The duration of the free trial period.
  final String? duration;

  FreeTrialPricingTerm({
    required this.grants,
    required this.id,
    required this.type,
    this.duration,
  });

  factory FreeTrialPricingTerm.fromJson(Map<String, dynamic> json) {
    return FreeTrialPricingTerm(
      grants: ((json['grants'] as List?) ?? const [])
          .nonNulls
          .map((e) => GrantItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
      duration: json['duration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final grants = this.grants;
    final id = this.id;
    final type = this.type;
    final duration = this.duration;
    return {
      'grants': grants,
      'id': id,
      'type': type.value,
      if (duration != null) 'duration': duration,
    };
  }
}

/// Defines a legal term containing documents proposed to buyers, such as EULAs
/// and data subscription agreements.
///
/// @nodoc
class LegalTerm {
  /// The legal documents proposed to the buyer as part of this term.
  final List<DocumentItem> documents;

  /// The unique identifier of the term.
  final String id;

  /// The category of the term.
  final TermType type;

  LegalTerm({
    required this.documents,
    required this.id,
    required this.type,
  });

  factory LegalTerm.fromJson(Map<String, dynamic> json) {
    return LegalTerm(
      documents: ((json['documents'] as List?) ?? const [])
          .nonNulls
          .map((e) => DocumentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final id = this.id;
    final type = this.type;
    return {
      'documents': documents,
      'id': id,
      'type': type.value,
    };
  }
}

/// Defines a payment schedule term with installment payments at specified
/// dates.
///
/// @nodoc
class PaymentScheduleTerm {
  /// Defines the currency for the prices in this term.
  final String currencyCode;

  /// The unique identifier of the term.
  final String id;

  /// The payment schedule installments, each with a charge date and amount.
  final List<ScheduleItem> schedule;

  /// The category of the term.
  final TermType type;

  PaymentScheduleTerm({
    required this.currencyCode,
    required this.id,
    required this.schedule,
    required this.type,
  });

  factory PaymentScheduleTerm.fromJson(Map<String, dynamic> json) {
    return PaymentScheduleTerm(
      currencyCode: (json['currencyCode'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      schedule: ((json['schedule'] as List?) ?? const [])
          .nonNulls
          .map((e) => ScheduleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final id = this.id;
    final schedule = this.schedule;
    final type = this.type;
    return {
      'currencyCode': currencyCode,
      'id': id,
      'schedule': schedule,
      'type': type.value,
    };
  }
}

/// Defines a recurring payment term with fixed charges at regular billing
/// intervals.
///
/// @nodoc
class RecurringPaymentTerm {
  /// The billing period frequency, such as <code>Monthly</code>.
  final BillingPeriodType billingPeriod;

  /// Defines the currency for the prices in this term.
  final String currencyCode;

  /// The unique identifier of the term.
  final String id;

  /// The amount charged each billing period.
  final String price;

  /// The category of the term.
  final TermType type;

  RecurringPaymentTerm({
    required this.billingPeriod,
    required this.currencyCode,
    required this.id,
    required this.price,
    required this.type,
  });

  factory RecurringPaymentTerm.fromJson(Map<String, dynamic> json) {
    return RecurringPaymentTerm(
      billingPeriod: BillingPeriodType.fromString(
          (json['billingPeriod'] as String?) ?? ''),
      currencyCode: (json['currencyCode'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      price: (json['price'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final currencyCode = this.currencyCode;
    final id = this.id;
    final price = this.price;
    final type = this.type;
    return {
      'billingPeriod': billingPeriod.value,
      'currencyCode': currencyCode,
      'id': id,
      'price': price,
      'type': type.value,
    };
  }
}

/// Defines a renewal term that enables automatic agreement renewal.
///
/// @nodoc
class RenewalTerm {
  /// The unique identifier of the term.
  final String id;

  /// The category of the term.
  final TermType type;

  RenewalTerm({
    required this.id,
    required this.type,
  });

  factory RenewalTerm.fromJson(Map<String, dynamic> json) {
    return RenewalTerm(
      id: (json['id'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    return {
      'id': id,
      'type': type.value,
    };
  }
}

/// Defines a support term that includes the refund policy for the offer.
///
/// @nodoc
class SupportTerm {
  /// The unique identifier of the term.
  final String id;

  /// The refund policy description for the offer.
  final String refundPolicy;

  /// The category of the term.
  final TermType type;

  SupportTerm({
    required this.id,
    required this.refundPolicy,
    required this.type,
  });

  factory SupportTerm.fromJson(Map<String, dynamic> json) {
    return SupportTerm(
      id: (json['id'] as String?) ?? '',
      refundPolicy: (json['refundPolicy'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final refundPolicy = this.refundPolicy;
    final type = this.type;
    return {
      'id': id,
      'refundPolicy': refundPolicy,
      'type': type.value,
    };
  }
}

/// Defines a usage-based pricing term (typically pay-as-you-go), where buyers
/// are charged based on product usage.
///
/// @nodoc
class UsageBasedPricingTerm {
  /// Defines the currency for the prices in this term.
  final String currencyCode;

  /// The unique identifier of the term.
  final String id;

  /// The rate cards containing per-unit rates for usage-based pricing.
  final List<UsageBasedRateCardItem> rateCards;

  /// The category of the term.
  final TermType type;

  UsageBasedPricingTerm({
    required this.currencyCode,
    required this.id,
    required this.rateCards,
    required this.type,
  });

  factory UsageBasedPricingTerm.fromJson(Map<String, dynamic> json) {
    return UsageBasedPricingTerm(
      currencyCode: (json['currencyCode'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      rateCards: ((json['rateCards'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => UsageBasedRateCardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final id = this.id;
    final rateCards = this.rateCards;
    final type = this.type;
    return {
      'currencyCode': currencyCode,
      'id': id,
      'rateCards': rateCards,
      'type': type.value,
    };
  }
}

/// Defines a validity term that specifies the duration or date range of an
/// agreement.
///
/// @nodoc
class ValidityTerm {
  /// The unique identifier of the term.
  final String id;

  /// The category of the term.
  final TermType type;

  /// The duration of the agreement, in ISO 8601 format.
  final String? agreementDuration;

  /// The date when the agreement ends.
  final DateTime? agreementEndDate;

  /// The date when the agreement starts.
  final DateTime? agreementStartDate;

  ValidityTerm({
    required this.id,
    required this.type,
    this.agreementDuration,
    this.agreementEndDate,
    this.agreementStartDate,
  });

  factory ValidityTerm.fromJson(Map<String, dynamic> json) {
    return ValidityTerm(
      id: (json['id'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
      agreementDuration: json['agreementDuration'] as String?,
      agreementEndDate: timeStampFromJson(json['agreementEndDate']),
      agreementStartDate: timeStampFromJson(json['agreementStartDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final type = this.type;
    final agreementDuration = this.agreementDuration;
    final agreementEndDate = this.agreementEndDate;
    final agreementStartDate = this.agreementStartDate;
    return {
      'id': id,
      'type': type.value,
      if (agreementDuration != null) 'agreementDuration': agreementDuration,
      if (agreementEndDate != null)
        'agreementEndDate': unixTimestampToJson(agreementEndDate),
      if (agreementStartDate != null)
        'agreementStartDate': unixTimestampToJson(agreementStartDate),
    };
  }
}

/// Defines a variable payment term with a maximum total charge amount.
///
/// @nodoc
class VariablePaymentTerm {
  /// Defines the currency for the prices in this term.
  final String currencyCode;

  /// The unique identifier of the term.
  final String id;

  /// The maximum total amount that can be charged under this term.
  final String maxTotalChargeAmount;

  /// The category of the term.
  final TermType type;

  VariablePaymentTerm({
    required this.currencyCode,
    required this.id,
    required this.maxTotalChargeAmount,
    required this.type,
  });

  factory VariablePaymentTerm.fromJson(Map<String, dynamic> json) {
    return VariablePaymentTerm(
      currencyCode: (json['currencyCode'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      maxTotalChargeAmount: (json['maxTotalChargeAmount'] as String?) ?? '',
      type: TermType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final id = this.id;
    final maxTotalChargeAmount = this.maxTotalChargeAmount;
    final type = this.type;
    return {
      'currencyCode': currencyCode,
      'id': id,
      'maxTotalChargeAmount': maxTotalChargeAmount,
      'type': type.value,
    };
  }
}

/// @nodoc
class TermType {
  static const byolPricingTerm = TermType._('ByolPricingTerm');
  static const configurableUpfrontPricingTerm =
      TermType._('ConfigurableUpfrontPricingTerm');
  static const fixedUpfrontPricingTerm = TermType._('FixedUpfrontPricingTerm');
  static const usageBasedPricingTerm = TermType._('UsageBasedPricingTerm');
  static const freeTrialPricingTerm = TermType._('FreeTrialPricingTerm');
  static const legalTerm = TermType._('LegalTerm');
  static const paymentScheduleTerm = TermType._('PaymentScheduleTerm');
  static const recurringPaymentTerm = TermType._('RecurringPaymentTerm');
  static const renewalTerm = TermType._('RenewalTerm');
  static const supportTerm = TermType._('SupportTerm');
  static const validityTerm = TermType._('ValidityTerm');
  static const variablePaymentTerm = TermType._('VariablePaymentTerm');

  final String value;

  const TermType._(this.value);

  static const values = [
    byolPricingTerm,
    configurableUpfrontPricingTerm,
    fixedUpfrontPricingTerm,
    usageBasedPricingTerm,
    freeTrialPricingTerm,
    legalTerm,
    paymentScheduleTerm,
    recurringPaymentTerm,
    renewalTerm,
    supportTerm,
    validityTerm,
    variablePaymentTerm
  ];

  static TermType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TermType._(value));

  @override
  bool operator ==(other) => other is TermType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A rate card within a usage-based pricing term, containing per-unit rates.
///
/// @nodoc
class UsageBasedRateCardItem {
  /// The per-unit rates for this usage-based rate card.
  final List<RateCardItem> rateCard;

  UsageBasedRateCardItem({
    required this.rateCard,
  });

  factory UsageBasedRateCardItem.fromJson(Map<String, dynamic> json) {
    return UsageBasedRateCardItem(
      rateCard: ((json['rateCard'] as List?) ?? const [])
          .nonNulls
          .map((e) => RateCardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rateCard = this.rateCard;
    return {
      'rateCard': rateCard,
    };
  }
}

/// A per-unit rate within a rate card, defining the price for a specific
/// dimension.
///
/// @nodoc
class RateCardItem {
  /// The machine-readable key identifying the dimension being priced.
  final String dimensionKey;

  /// The human-readable name of the dimension.
  final String displayName;

  /// The price per unit for the dimension.
  final String price;

  /// The unit of measurement for the dimension.
  final String unit;

  /// A description of the dimension being priced.
  final String? description;

  /// Labels used to categorize this dimension, such as by region.
  final List<DimensionLabel>? dimensionLabels;

  RateCardItem({
    required this.dimensionKey,
    required this.displayName,
    required this.price,
    required this.unit,
    this.description,
    this.dimensionLabels,
  });

  factory RateCardItem.fromJson(Map<String, dynamic> json) {
    return RateCardItem(
      dimensionKey: (json['dimensionKey'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      price: (json['price'] as String?) ?? '',
      unit: (json['unit'] as String?) ?? '',
      description: json['description'] as String?,
      dimensionLabels: (json['dimensionLabels'] as List?)
          ?.nonNulls
          .map((e) => DimensionLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionKey = this.dimensionKey;
    final displayName = this.displayName;
    final price = this.price;
    final unit = this.unit;
    final description = this.description;
    final dimensionLabels = this.dimensionLabels;
    return {
      'dimensionKey': dimensionKey,
      'displayName': displayName,
      'price': price,
      'unit': unit,
      if (description != null) 'description': description,
      if (dimensionLabels != null) 'dimensionLabels': dimensionLabels,
    };
  }
}

/// A label used to group or categorize pricing dimensions, such as by region or
/// SageMaker option.
///
/// @nodoc
class DimensionLabel {
  /// The type of the dimension label, such as <code>Region</code> or
  /// <code>SagemakerOption</code>.
  final DimensionLabelType labelType;

  /// The value used to group dimensions together.
  final String labelValue;

  /// The human-readable display name of the label.
  final String? displayName;

  DimensionLabel({
    required this.labelType,
    required this.labelValue,
    this.displayName,
  });

  factory DimensionLabel.fromJson(Map<String, dynamic> json) {
    return DimensionLabel(
      labelType:
          DimensionLabelType.fromString((json['labelType'] as String?) ?? ''),
      labelValue: (json['labelValue'] as String?) ?? '',
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final labelType = this.labelType;
    final labelValue = this.labelValue;
    final displayName = this.displayName;
    return {
      'labelType': labelType.value,
      'labelValue': labelValue,
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// @nodoc
class DimensionLabelType {
  static const region = DimensionLabelType._('Region');
  static const sagemakerOption = DimensionLabelType._('SagemakerOption');

  final String value;

  const DimensionLabelType._(this.value);

  static const values = [region, sagemakerOption];

  static DimensionLabelType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DimensionLabelType._(value));

  @override
  bool operator ==(other) =>
      other is DimensionLabelType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BillingPeriodType {
  static const monthly = BillingPeriodType._('Monthly');

  final String value;

  const BillingPeriodType._(this.value);

  static const values = [monthly];

  static BillingPeriodType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BillingPeriodType._(value));

  @override
  bool operator ==(other) => other is BillingPeriodType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A payment installment within a payment schedule term.
///
/// @nodoc
class ScheduleItem {
  /// The amount to be charged on the charge date.
  final String chargeAmount;

  /// The date when the payment is due.
  final DateTime chargeDate;

  ScheduleItem({
    required this.chargeAmount,
    required this.chargeDate,
  });

  factory ScheduleItem.fromJson(Map<String, dynamic> json) {
    return ScheduleItem(
      chargeAmount: (json['chargeAmount'] as String?) ?? '',
      chargeDate: nonNullableTimeStampFromJson(json['chargeDate'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final chargeAmount = this.chargeAmount;
    final chargeDate = this.chargeDate;
    return {
      'chargeAmount': chargeAmount,
      'chargeDate': unixTimestampToJson(chargeDate),
    };
  }
}

/// A legal document associated with a legal term, such as a EULA or data
/// subscription agreement.
///
/// @nodoc
class DocumentItem {
  /// The category of the legal document, such as <code>StandardEula</code> or
  /// <code>CustomEula</code>.
  final LegalDocumentType type;

  /// The URL where the legal document can be accessed.
  final String url;

  /// The version of the standard contract, if applicable.
  final String? version;

  DocumentItem({
    required this.type,
    required this.url,
    this.version,
  });

  factory DocumentItem.fromJson(Map<String, dynamic> json) {
    return DocumentItem(
      type: LegalDocumentType.fromString((json['type'] as String?) ?? ''),
      url: (json['url'] as String?) ?? '',
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final url = this.url;
    final version = this.version;
    return {
      'type': type.value,
      'url': url,
      if (version != null) 'version': version,
    };
  }
}

/// @nodoc
class LegalDocumentType {
  static const customEula = LegalDocumentType._('CustomEula');
  static const customDsa = LegalDocumentType._('CustomDsa');
  static const enterpriseEula = LegalDocumentType._('EnterpriseEula');
  static const standardEula = LegalDocumentType._('StandardEula');
  static const standardDsa = LegalDocumentType._('StandardDsa');

  final String value;

  const LegalDocumentType._(this.value);

  static const values = [
    customEula,
    customDsa,
    enterpriseEula,
    standardEula,
    standardDsa
  ];

  static LegalDocumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LegalDocumentType._(value));

  @override
  bool operator ==(other) => other is LegalDocumentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An entitlement granted to the buyer as part of a pricing term.
///
/// @nodoc
class GrantItem {
  /// The machine-readable key identifying the entitlement dimension.
  final String dimensionKey;

  /// The human-readable name of the entitlement dimension.
  final String displayName;

  /// The unit of measurement for the entitlement.
  final String unit;

  /// A description of the entitlement.
  final String? description;

  /// Labels used to categorize this entitlement, such as by region.
  final List<DimensionLabel>? dimensionLabels;

  /// The maximum quantity of the entitlement that can be granted.
  final int? maxQuantity;

  GrantItem({
    required this.dimensionKey,
    required this.displayName,
    required this.unit,
    this.description,
    this.dimensionLabels,
    this.maxQuantity,
  });

  factory GrantItem.fromJson(Map<String, dynamic> json) {
    return GrantItem(
      dimensionKey: (json['dimensionKey'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      unit: (json['unit'] as String?) ?? '',
      description: json['description'] as String?,
      dimensionLabels: (json['dimensionLabels'] as List?)
          ?.nonNulls
          .map((e) => DimensionLabel.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxQuantity: json['maxQuantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionKey = this.dimensionKey;
    final displayName = this.displayName;
    final unit = this.unit;
    final description = this.description;
    final dimensionLabels = this.dimensionLabels;
    final maxQuantity = this.maxQuantity;
    return {
      'dimensionKey': dimensionKey,
      'displayName': displayName,
      'unit': unit,
      if (description != null) 'description': description,
      if (dimensionLabels != null) 'dimensionLabels': dimensionLabels,
      if (maxQuantity != null) 'maxQuantity': maxQuantity,
    };
  }
}

/// A rate card item within a configurable upfront pricing term, including a
/// selector for choosing the configuration and per-unit rates.
///
/// @nodoc
class ConfigurableUpfrontRateCardItem {
  /// Constraints on how the buyer can configure this rate card, such as whether
  /// multiple dimensions can be selected.
  final Constraints constraints;

  /// The per-unit rates for this configuration.
  final List<RateCardItem> rateCard;

  /// The selector criteria for this rate card, such as duration.
  final Selector selector;

  ConfigurableUpfrontRateCardItem({
    required this.constraints,
    required this.rateCard,
    required this.selector,
  });

  factory ConfigurableUpfrontRateCardItem.fromJson(Map<String, dynamic> json) {
    return ConfigurableUpfrontRateCardItem(
      constraints: Constraints.fromJson(
          (json['constraints'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      rateCard: ((json['rateCard'] as List?) ?? const [])
          .nonNulls
          .map((e) => RateCardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      selector: Selector.fromJson((json['selector'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final constraints = this.constraints;
    final rateCard = this.rateCard;
    final selector = this.selector;
    return {
      'constraints': constraints,
      'rateCard': rateCard,
      'selector': selector,
    };
  }
}

/// A selector used to choose a specific configuration within a configurable
/// upfront rate card.
///
/// @nodoc
class Selector {
  /// The category of the selector, such as <code>Duration</code>.
  final SelectorType type;

  /// The value of the selector.
  final String value;

  Selector({
    required this.type,
    required this.value,
  });

  factory Selector.fromJson(Map<String, dynamic> json) {
    return Selector(
      type: SelectorType.fromString((json['type'] as String?) ?? ''),
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'type': type.value,
      'value': value,
    };
  }
}

/// Constraints that control how a buyer can configure a rate card.
///
/// @nodoc
class Constraints {
  /// Whether the buyer can select multiple dimensions. Values are
  /// <code>Allowed</code> or <code>Disallowed</code>.
  final RateCardConstraintType multipleDimensionSelection;

  /// Whether the buyer can configure quantities. Values are <code>Allowed</code>
  /// or <code>Disallowed</code>.
  final RateCardConstraintType quantityConfiguration;

  Constraints({
    required this.multipleDimensionSelection,
    required this.quantityConfiguration,
  });

  factory Constraints.fromJson(Map<String, dynamic> json) {
    return Constraints(
      multipleDimensionSelection: RateCardConstraintType.fromString(
          (json['multipleDimensionSelection'] as String?) ?? ''),
      quantityConfiguration: RateCardConstraintType.fromString(
          (json['quantityConfiguration'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final multipleDimensionSelection = this.multipleDimensionSelection;
    final quantityConfiguration = this.quantityConfiguration;
    return {
      'multipleDimensionSelection': multipleDimensionSelection.value,
      'quantityConfiguration': quantityConfiguration.value,
    };
  }
}

/// @nodoc
class RateCardConstraintType {
  static const allowed = RateCardConstraintType._('Allowed');
  static const disallowed = RateCardConstraintType._('Disallowed');

  final String value;

  const RateCardConstraintType._(this.value);

  static const values = [allowed, disallowed];

  static RateCardConstraintType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RateCardConstraintType._(value));

  @override
  bool operator ==(other) =>
      other is RateCardConstraintType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SelectorType {
  static const duration = SelectorType._('Duration');

  final String value;

  const SelectorType._(this.value);

  static const values = [duration];

  static SelectorType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SelectorType._(value));

  @override
  bool operator ==(other) => other is SelectorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A product and offer associated with an offer set.
///
/// @nodoc
class OfferSetAssociatedEntity {
  /// Information about the offer associated with the offer set.
  final OfferInformation offer;

  /// Information about the product associated with the offer set.
  final ProductInformation product;

  OfferSetAssociatedEntity({
    required this.offer,
    required this.product,
  });

  factory OfferSetAssociatedEntity.fromJson(Map<String, dynamic> json) {
    return OfferSetAssociatedEntity(
      offer: OfferInformation.fromJson(
          (json['offer'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      product: ProductInformation.fromJson(
          (json['product'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final offer = this.offer;
    final product = this.product;
    return {
      'offer': offer,
      'product': product,
    };
  }
}

/// A product and optional offer set associated with an offer.
///
/// @nodoc
class OfferAssociatedEntity {
  /// Information about the product associated with the offer.
  final ProductInformation product;

  /// Information about the offer set, if the offer is part of a bundled offer
  /// set.
  final OfferSetInformation? offerSet;

  OfferAssociatedEntity({
    required this.product,
    this.offerSet,
  });

  factory OfferAssociatedEntity.fromJson(Map<String, dynamic> json) {
    return OfferAssociatedEntity(
      product: ProductInformation.fromJson(
          (json['product'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      offerSet: json['offerSet'] != null
          ? OfferSetInformation.fromJson(
              json['offerSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final product = this.product;
    final offerSet = this.offerSet;
    return {
      'product': product,
      if (offerSet != null) 'offerSet': offerSet,
    };
  }
}

/// An entry in the list of use cases for a listing.
///
/// @nodoc
class UseCaseEntry {
  /// The use case details.
  final UseCase useCase;

  UseCaseEntry({
    required this.useCase,
  });

  factory UseCaseEntry.fromJson(Map<String, dynamic> json) {
    return UseCaseEntry(
      useCase: UseCase.fromJson((json['useCase'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final useCase = this.useCase;
    return {
      'useCase': useCase,
    };
  }
}

/// A use case describing a scenario where the product can be applied.
///
/// @nodoc
class UseCase {
  /// A description of the use case.
  final String description;

  /// The human-readable name of the use case.
  final String displayName;

  /// The machine-readable identifier of the use case.
  final String value;

  UseCase({
    required this.description,
    required this.displayName,
    required this.value,
  });

  factory UseCase.fromJson(Map<String, dynamic> json) {
    return UseCase(
      description: (json['description'] as String?) ?? '',
      displayName: (json['displayName'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final displayName = this.displayName;
    final value = this.value;
    return {
      'description': description,
      'displayName': displayName,
      'value': value,
    };
  }
}

/// A product and offer associated with a listing.
///
/// @nodoc
class ListingAssociatedEntity {
  /// Information about the default offer associated with the listing.
  final OfferInformation? offer;

  /// Information about the product associated with the listing.
  final ProductInformation? product;

  ListingAssociatedEntity({
    this.offer,
    this.product,
  });

  factory ListingAssociatedEntity.fromJson(Map<String, dynamic> json) {
    return ListingAssociatedEntity(
      offer: json['offer'] != null
          ? OfferInformation.fromJson(json['offer'] as Map<String, dynamic>)
          : null,
      product: json['product'] != null
          ? ProductInformation.fromJson(json['product'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final offer = this.offer;
    final product = this.product;
    return {
      if (offer != null) 'offer': offer,
      if (product != null) 'product': product,
    };
  }
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
