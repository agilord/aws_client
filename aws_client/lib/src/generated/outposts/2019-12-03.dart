// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Amazon Web Services Outposts is a fully managed service that extends Amazon
/// Web Services infrastructure, APIs, and tools to customer premises. By
/// providing local access to Amazon Web Services managed infrastructure, Amazon
/// Web Services Outposts enables customers to build and run applications on
/// premises using the same programming interfaces as in Amazon Web Services
/// Regions, while using local compute and storage resources for lower latency
/// and local data processing needs.
class Outposts {
  final _s.RestJsonProtocol _protocol;
  Outposts({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'outposts',
            signingName: 'outposts',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Cancels an order for an Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [orderId] :
  /// The ID of the order to cancel.
  Future<void> cancelOrder({
    required String orderId,
  }) async {
    ArgumentError.checkNotNull(orderId, 'orderId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/orders/${Uri.encodeComponent(orderId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an order for an Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [lineItems] :
  /// The line items that make up the order.
  ///
  /// Parameter [outpostIdentifier] :
  /// The ID or the Amazon Resource Name (ARN) of the Outpost.
  ///
  /// Parameter [paymentOption] :
  /// The payment option for the order.
  ///
  /// Parameter [paymentTerm] :
  /// The payment terms for the order.
  Future<CreateOrderOutput> createOrder({
    required List<LineItemRequest> lineItems,
    required String outpostIdentifier,
    required PaymentOption paymentOption,
    PaymentTerm? paymentTerm,
  }) async {
    ArgumentError.checkNotNull(lineItems, 'lineItems');
    ArgumentError.checkNotNull(outpostIdentifier, 'outpostIdentifier');
    ArgumentError.checkNotNull(paymentOption, 'paymentOption');
    final $payload = <String, dynamic>{
      'LineItems': lineItems,
      'OutpostIdentifier': outpostIdentifier,
      'PaymentOption': paymentOption.toValue(),
      if (paymentTerm != null) 'PaymentTerm': paymentTerm.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/orders',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOrderOutput.fromJson(response);
  }

  /// Creates an Outpost.
  ///
  /// You can specify <code>AvailabilityZone</code> or
  /// <code>AvailabilityZoneId</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [siteId] :
  /// The ID or the Amazon Resource Name (ARN) of the site.
  ///
  /// Parameter [supportedHardwareType] :
  /// The type of hardware for this Outpost.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the Outpost.
  Future<CreateOutpostOutput> createOutpost({
    required String name,
    required String siteId,
    String? availabilityZone,
    String? availabilityZoneId,
    String? description,
    SupportedHardwareType? supportedHardwareType,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(siteId, 'siteId');
    final $payload = <String, dynamic>{
      'Name': name,
      'SiteId': siteId,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (description != null) 'Description': description,
      if (supportedHardwareType != null)
        'SupportedHardwareType': supportedHardwareType.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/outposts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOutpostOutput.fromJson(response);
  }

  /// Creates a site for an Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [notes] :
  /// Additional information that you provide about site access requirements,
  /// electrician scheduling, personal protective equipment, or regulation of
  /// equipment materials that could affect your installation process.
  ///
  /// Parameter [operatingAddress] :
  /// The location to install and power on the hardware. This address might be
  /// different from the shipping address.
  ///
  /// Parameter [rackPhysicalProperties] :
  /// Information about the physical and logistical details for the rack at this
  /// site. For more information about hardware requirements for racks, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-requirements.html#checklist">Network
  /// readiness checklist</a> in the Amazon Web Services Outposts User Guide.
  ///
  /// Parameter [shippingAddress] :
  /// The location to ship the hardware. This address might be different from
  /// the operating address.
  ///
  /// Parameter [tags] :
  /// The tags to apply to a site.
  Future<CreateSiteOutput> createSite({
    required String name,
    String? description,
    String? notes,
    Address? operatingAddress,
    RackPhysicalProperties? rackPhysicalProperties,
    Address? shippingAddress,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'Name': name,
      if (description != null) 'Description': description,
      if (notes != null) 'Notes': notes,
      if (operatingAddress != null) 'OperatingAddress': operatingAddress,
      if (rackPhysicalProperties != null)
        'RackPhysicalProperties': rackPhysicalProperties,
      if (shippingAddress != null) 'ShippingAddress': shippingAddress,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sites',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSiteOutput.fromJson(response);
  }

  /// Deletes the Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostId] :
  /// The ID or the Amazon Resource Name (ARN) of the Outpost.
  Future<void> deleteOutpost({
    required String outpostId,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the site.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [siteId] :
  /// The ID or the Amazon Resource Name (ARN) of the site.
  Future<void> deleteSite({
    required String siteId,
  }) async {
    ArgumentError.checkNotNull(siteId, 'siteId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about a catalog item.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [catalogItemId] :
  /// The ID of the catalog item.
  Future<GetCatalogItemOutput> getCatalogItem({
    required String catalogItemId,
  }) async {
    ArgumentError.checkNotNull(catalogItemId, 'catalogItemId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/catalog/item/${Uri.encodeComponent(catalogItemId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCatalogItemOutput.fromJson(response);
  }

  /// Gets an order.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [orderId] :
  /// The ID of the order.
  Future<GetOrderOutput> getOrder({
    required String orderId,
  }) async {
    ArgumentError.checkNotNull(orderId, 'orderId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/orders/${Uri.encodeComponent(orderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOrderOutput.fromJson(response);
  }

  /// Gets information about the specified Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostId] :
  /// The ID or the Amazon Resource Name (ARN) of the Outpost.
  Future<GetOutpostOutput> getOutpost({
    required String outpostId,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOutpostOutput.fromJson(response);
  }

  /// Lists the instance types for the specified Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostId] :
  /// The ID or the Amazon Resource Name (ARN) of the Outpost.
  Future<GetOutpostInstanceTypesOutput> getOutpostInstanceTypes({
    required String outpostId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}/instanceTypes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetOutpostInstanceTypesOutput.fromJson(response);
  }

  /// Gets information about the specified Outpost site.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [siteId] :
  /// The ID or the Amazon Resource Name (ARN) of the site.
  Future<GetSiteOutput> getSite({
    required String siteId,
  }) async {
    ArgumentError.checkNotNull(siteId, 'siteId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSiteOutput.fromJson(response);
  }

  /// Gets the site address.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [addressType] :
  /// The type of the address you request.
  ///
  /// Parameter [siteId] :
  /// The ID or the Amazon Resource Name (ARN) of the site.
  Future<GetSiteAddressOutput> getSiteAddress({
    required AddressType addressType,
    required String siteId,
  }) async {
    ArgumentError.checkNotNull(addressType, 'addressType');
    ArgumentError.checkNotNull(siteId, 'siteId');
    final $query = <String, List<String>>{
      'AddressType': [addressType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}/address',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSiteAddressOutput.fromJson(response);
  }

  /// Use to create a list of every item in the catalog. Add filters to your
  /// request to return a more specific list of results. Use filters to match an
  /// item class, storage option, or EC2 family.
  ///
  /// If you specify multiple filters, the filters are joined with an
  /// <code>AND</code>, and the request returns only results that match all of
  /// the specified filters.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eC2FamilyFilter] :
  /// A filter for EC2 family options for items in the catalog.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [itemClassFilter] :
  /// A filter for the class of items in the catalog.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [supportedStorageFilter] :
  /// A filter for the storage options of items in the catalog.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  Future<ListCatalogItemsOutput> listCatalogItems({
    List<String>? eC2FamilyFilter,
    List<CatalogItemClass>? itemClassFilter,
    int? maxResults,
    String? nextToken,
    List<SupportedStorageEnum>? supportedStorageFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (eC2FamilyFilter != null) 'EC2FamilyFilter': eC2FamilyFilter,
      if (itemClassFilter != null)
        'ItemClassFilter': itemClassFilter.map((e) => e.toValue()).toList(),
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (supportedStorageFilter != null)
        'SupportedStorageFilter':
            supportedStorageFilter.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/catalog/items',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCatalogItemsOutput.fromJson(response);
  }

  /// Create a list of the Outpost orders for your Amazon Web Services account.
  /// You can filter your request by Outpost to return a more specific list of
  /// results.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostIdentifierFilter] :
  /// The ID or the Amazon Resource Name (ARN) of the Outpost.
  Future<ListOrdersOutput> listOrders({
    int? maxResults,
    String? nextToken,
    String? outpostIdentifierFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (outpostIdentifierFilter != null)
        'OutpostIdentifierFilter': [outpostIdentifierFilter],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-orders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOrdersOutput.fromJson(response);
  }

  /// Create a list of the Outposts for your Amazon Web Services account. Add
  /// filters to your request to return a more specific list of results. Use
  /// filters to match an Outpost lifecycle status, Availability Zone
  /// (<code>us-east-1a</code>), and AZ ID (<code>use1-az1</code>).
  ///
  /// If you specify multiple filters, the filters are joined with an
  /// <code>AND</code>, and the request returns only results that match all of
  /// the specified filters.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [availabilityZoneFilter] :
  /// A filter for the Availability Zone (<code>us-east-1a</code>) of the
  /// Outpost.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [availabilityZoneIdFilter] :
  /// A filter for the AZ IDs (<code>use1-az1</code>) of the Outpost.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  ///
  /// Parameter [lifeCycleStatusFilter] :
  /// A filter for the lifecycle status of the Outpost.
  ///
  /// Filter values are case sensitive. If you specify multiple values for a
  /// filter, the values are joined with an <code>OR</code>, and the request
  /// returns all results that match any of the specified values.
  Future<ListOutpostsOutput> listOutposts({
    List<String>? availabilityZoneFilter,
    List<String>? availabilityZoneIdFilter,
    List<String>? lifeCycleStatusFilter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (availabilityZoneFilter != null)
        'AvailabilityZoneFilter': availabilityZoneFilter,
      if (availabilityZoneIdFilter != null)
        'AvailabilityZoneIdFilter': availabilityZoneIdFilter,
      if (lifeCycleStatusFilter != null)
        'LifeCycleStatusFilter': lifeCycleStatusFilter,
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOutpostsOutput.fromJson(response);
  }

  /// Lists the sites for your Amazon Web Services account.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<ListSitesOutput> listSites({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sites',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSitesOutput.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds tags to the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
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
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostId] :
  /// The ID or the Amazon Resource Name (ARN) of the Outpost.
  ///
  /// Parameter [supportedHardwareType] :
  /// The type of hardware for this Outpost.
  Future<UpdateOutpostOutput> updateOutpost({
    required String outpostId,
    String? description,
    String? name,
    SupportedHardwareType? supportedHardwareType,
  }) async {
    ArgumentError.checkNotNull(outpostId, 'outpostId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (supportedHardwareType != null)
        'SupportedHardwareType': supportedHardwareType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOutpostOutput.fromJson(response);
  }

  /// Updates the site.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [siteId] :
  /// The ID or the Amazon Resource Name (ARN) of the site.
  ///
  /// Parameter [notes] :
  /// Notes about a site.
  Future<UpdateSiteOutput> updateSite({
    required String siteId,
    String? description,
    String? name,
    String? notes,
  }) async {
    ArgumentError.checkNotNull(siteId, 'siteId');
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (notes != null) 'Notes': notes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSiteOutput.fromJson(response);
  }

  /// Updates the site address.
  ///
  /// To update a site address with an order <code>IN_PROGRESS</code>, you must
  /// wait for the order to complete or cancel the order.
  ///
  /// You can update the operating address before you place an order at the
  /// site, or after all Outposts that belong to the site have been deactivated.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [address] :
  /// The address for the site.
  ///
  /// Parameter [addressType] :
  /// The type of the address.
  ///
  /// Parameter [siteId] :
  /// The ID or the Amazon Resource Name (ARN) of the site.
  Future<UpdateSiteAddressOutput> updateSiteAddress({
    required Address address,
    required AddressType addressType,
    required String siteId,
  }) async {
    ArgumentError.checkNotNull(address, 'address');
    ArgumentError.checkNotNull(addressType, 'addressType');
    ArgumentError.checkNotNull(siteId, 'siteId');
    final $payload = <String, dynamic>{
      'Address': address,
      'AddressType': addressType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}/address',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSiteAddressOutput.fromJson(response);
  }

  /// Update the physical and logistical details for a rack at a site. For more
  /// information about hardware requirements for racks, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-requirements.html#checklist">Network
  /// readiness checklist</a> in the Amazon Web Services Outposts User Guide.
  ///
  /// To update a rack at a site with an order of <code>IN_PROGRESS</code>, you
  /// must wait for the order to complete or cancel the order.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [siteId] :
  /// The ID or the Amazon Resource Name (ARN) of the site.
  ///
  /// Parameter [fiberOpticCableType] :
  /// Specify the type of fiber that you will use to attach the Outpost to your
  /// network.
  ///
  /// Parameter [maximumSupportedWeightLbs] :
  /// Specify the maximum rack weight that this site can support.
  /// <code>NO_LIMIT</code> is over 2000lbs.
  ///
  /// Parameter [opticalStandard] :
  /// Specify the type of optical standard that you will use to attach the
  /// Outpost to your network. This field is dependent on uplink speed, fiber
  /// type, and distance to the upstream device. For more information about
  /// networking requirements for racks, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-requirements.html#facility-networking">Network</a>
  /// in the Amazon Web Services Outposts User Guide.
  ///
  /// <ul>
  /// <li>
  /// <code>OPTIC_10GBASE_SR</code>: 10GBASE-SR
  /// </li>
  /// <li>
  /// <code>OPTIC_10GBASE_IR</code>: 10GBASE-IR
  /// </li>
  /// <li>
  /// <code>OPTIC_10GBASE_LR</code>: 10GBASE-LR
  /// </li>
  /// <li>
  /// <code>OPTIC_40GBASE_SR</code>: 40GBASE-SR
  /// </li>
  /// <li>
  /// <code>OPTIC_40GBASE_ESR</code>: 40GBASE-ESR
  /// </li>
  /// <li>
  /// <code>OPTIC_40GBASE_IR4_LR4L</code>: 40GBASE-IR (LR4L)
  /// </li>
  /// <li>
  /// <code>OPTIC_40GBASE_LR4</code>: 40GBASE-LR4
  /// </li>
  /// <li>
  /// <code>OPTIC_100GBASE_SR4</code>: 100GBASE-SR4
  /// </li>
  /// <li>
  /// <code>OPTIC_100GBASE_CWDM4</code>: 100GBASE-CWDM4
  /// </li>
  /// <li>
  /// <code>OPTIC_100GBASE_LR4</code>: 100GBASE-LR4
  /// </li>
  /// <li>
  /// <code>OPTIC_100G_PSM4_MSA</code>: 100G PSM4 MSA
  /// </li>
  /// <li>
  /// <code>OPTIC_1000BASE_LX</code>: 1000Base-LX
  /// </li>
  /// <li>
  /// <code>OPTIC_1000BASE_SX</code> : 1000Base-SX
  /// </li>
  /// </ul>
  ///
  /// Parameter [powerConnector] :
  /// Specify the power connector that Amazon Web Services should plan to
  /// provide for connections to the hardware. Note the correlation between
  /// <code>PowerPhase</code> and <code>PowerConnector</code>.
  ///
  /// <ul>
  /// <li>
  /// Single-phase AC feed
  ///
  /// <ul>
  /// <li>
  /// <b>L6-30P</b> – (common in US); 30A; single phase
  /// </li>
  /// <li>
  /// <b>IEC309 (blue)</b> – P+N+E, 6hr; 32 A; single phase
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Three-phase AC feed
  ///
  /// <ul>
  /// <li>
  /// <b>AH530P7W (red)</b> – 3P+N+E, 7hr; 30A; three phase
  /// </li>
  /// <li>
  /// <b>AH532P6W (red)</b> – 3P+N+E, 6hr; 32A; three phase
  /// </li>
  /// </ul> </li>
  /// </ul>
  ///
  /// Parameter [powerDrawKva] :
  /// Specify in kVA the power draw available at the hardware placement position
  /// for the rack.
  ///
  /// Parameter [powerFeedDrop] :
  /// Specify whether the power feed comes above or below the rack.
  ///
  /// Parameter [powerPhase] :
  /// Specify the power option that you can provide for hardware.
  ///
  /// <ul>
  /// <li>
  /// Single-phase AC feed: 200 V to 277 V, 50 Hz or 60 Hz
  /// </li>
  /// <li>
  /// Three-phase AC feed: 346 V to 480 V, 50 Hz or 60 Hz
  /// </li>
  /// </ul>
  ///
  /// Parameter [uplinkCount] :
  /// Racks come with two Outpost network devices. Depending on the supported
  /// uplink speed at the site, the Outpost network devices provide a variable
  /// number of uplinks. Specify the number of uplinks for each Outpost network
  /// device that you intend to use to connect the rack to your network. Note
  /// the correlation between <code>UplinkGbps</code> and
  /// <code>UplinkCount</code>.
  ///
  /// <ul>
  /// <li>
  /// 1Gbps - Uplinks available: 1, 2, 4, 6, 8
  /// </li>
  /// <li>
  /// 10Gbps - Uplinks available: 1, 2, 4, 8, 12, 16
  /// </li>
  /// <li>
  /// 40 and 100 Gbps- Uplinks available: 1, 2, 4
  /// </li>
  /// </ul>
  ///
  /// Parameter [uplinkGbps] :
  /// Specify the uplink speed the rack should support for the connection to the
  /// Region.
  Future<UpdateSiteRackPhysicalPropertiesOutput>
      updateSiteRackPhysicalProperties({
    required String siteId,
    FiberOpticCableType? fiberOpticCableType,
    MaximumSupportedWeightLbs? maximumSupportedWeightLbs,
    OpticalStandard? opticalStandard,
    PowerConnector? powerConnector,
    PowerDrawKva? powerDrawKva,
    PowerFeedDrop? powerFeedDrop,
    PowerPhase? powerPhase,
    UplinkCount? uplinkCount,
    UplinkGbps? uplinkGbps,
  }) async {
    ArgumentError.checkNotNull(siteId, 'siteId');
    final $payload = <String, dynamic>{
      if (fiberOpticCableType != null)
        'FiberOpticCableType': fiberOpticCableType.toValue(),
      if (maximumSupportedWeightLbs != null)
        'MaximumSupportedWeightLbs': maximumSupportedWeightLbs.toValue(),
      if (opticalStandard != null) 'OpticalStandard': opticalStandard.toValue(),
      if (powerConnector != null) 'PowerConnector': powerConnector.toValue(),
      if (powerDrawKva != null) 'PowerDrawKva': powerDrawKva.toValue(),
      if (powerFeedDrop != null) 'PowerFeedDrop': powerFeedDrop.toValue(),
      if (powerPhase != null) 'PowerPhase': powerPhase.toValue(),
      if (uplinkCount != null) 'UplinkCount': uplinkCount.toValue(),
      if (uplinkGbps != null) 'UplinkGbps': uplinkGbps.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/sites/${Uri.encodeComponent(siteId)}/rackPhysicalProperties',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSiteRackPhysicalPropertiesOutput.fromJson(response);
  }
}

/// Information about an address.
class Address {
  /// The first line of the address.
  final String addressLine1;

  /// The city for the address.
  final String city;

  /// The ISO-3166 two-letter country code for the address.
  final String countryCode;

  /// The postal code for the address.
  final String postalCode;

  /// The state for the address.
  final String stateOrRegion;

  /// The second line of the address.
  final String? addressLine2;

  /// The third line of the address.
  final String? addressLine3;

  /// The name of the contact.
  final String? contactName;

  /// The phone number of the contact.
  final String? contactPhoneNumber;

  /// The district or county for the address.
  final String? districtOrCounty;

  /// The municipality for the address.
  final String? municipality;

  Address({
    required this.addressLine1,
    required this.city,
    required this.countryCode,
    required this.postalCode,
    required this.stateOrRegion,
    this.addressLine2,
    this.addressLine3,
    this.contactName,
    this.contactPhoneNumber,
    this.districtOrCounty,
    this.municipality,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressLine1: json['AddressLine1'] as String,
      city: json['City'] as String,
      countryCode: json['CountryCode'] as String,
      postalCode: json['PostalCode'] as String,
      stateOrRegion: json['StateOrRegion'] as String,
      addressLine2: json['AddressLine2'] as String?,
      addressLine3: json['AddressLine3'] as String?,
      contactName: json['ContactName'] as String?,
      contactPhoneNumber: json['ContactPhoneNumber'] as String?,
      districtOrCounty: json['DistrictOrCounty'] as String?,
      municipality: json['Municipality'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addressLine1 = this.addressLine1;
    final city = this.city;
    final countryCode = this.countryCode;
    final postalCode = this.postalCode;
    final stateOrRegion = this.stateOrRegion;
    final addressLine2 = this.addressLine2;
    final addressLine3 = this.addressLine3;
    final contactName = this.contactName;
    final contactPhoneNumber = this.contactPhoneNumber;
    final districtOrCounty = this.districtOrCounty;
    final municipality = this.municipality;
    return {
      'AddressLine1': addressLine1,
      'City': city,
      'CountryCode': countryCode,
      'PostalCode': postalCode,
      'StateOrRegion': stateOrRegion,
      if (addressLine2 != null) 'AddressLine2': addressLine2,
      if (addressLine3 != null) 'AddressLine3': addressLine3,
      if (contactName != null) 'ContactName': contactName,
      if (contactPhoneNumber != null) 'ContactPhoneNumber': contactPhoneNumber,
      if (districtOrCounty != null) 'DistrictOrCounty': districtOrCounty,
      if (municipality != null) 'Municipality': municipality,
    };
  }
}

enum AddressType {
  shippingAddress,
  operatingAddress,
}

extension on AddressType {
  String toValue() {
    switch (this) {
      case AddressType.shippingAddress:
        return 'SHIPPING_ADDRESS';
      case AddressType.operatingAddress:
        return 'OPERATING_ADDRESS';
    }
  }
}

extension on String {
  AddressType toAddressType() {
    switch (this) {
      case 'SHIPPING_ADDRESS':
        return AddressType.shippingAddress;
      case 'OPERATING_ADDRESS':
        return AddressType.operatingAddress;
    }
    throw Exception('$this is not known in enum AddressType');
  }
}

class CancelOrderOutput {
  CancelOrderOutput();

  factory CancelOrderOutput.fromJson(Map<String, dynamic> _) {
    return CancelOrderOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a catalog item.
class CatalogItem {
  /// The ID of the catalog item.
  final String? catalogItemId;

  /// Information about the EC2 capacity of an item.
  final List<EC2Capacity>? eC2Capacities;

  /// The status of a catalog item.
  final CatalogItemStatus? itemStatus;

  /// Information about the power draw of an item.
  final double? powerKva;

  /// The supported storage options for the catalog item.
  final List<SupportedStorageEnum>? supportedStorage;

  /// The uplink speed this catalog item requires for the connection to the
  /// Region.
  final List<int>? supportedUplinkGbps;

  /// The weight of the item in pounds.
  final int? weightLbs;

  CatalogItem({
    this.catalogItemId,
    this.eC2Capacities,
    this.itemStatus,
    this.powerKva,
    this.supportedStorage,
    this.supportedUplinkGbps,
    this.weightLbs,
  });

  factory CatalogItem.fromJson(Map<String, dynamic> json) {
    return CatalogItem(
      catalogItemId: json['CatalogItemId'] as String?,
      eC2Capacities: (json['EC2Capacities'] as List?)
          ?.whereNotNull()
          .map((e) => EC2Capacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemStatus: (json['ItemStatus'] as String?)?.toCatalogItemStatus(),
      powerKva: json['PowerKva'] as double?,
      supportedStorage: (json['SupportedStorage'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSupportedStorageEnum())
          .toList(),
      supportedUplinkGbps: (json['SupportedUplinkGbps'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      weightLbs: json['WeightLbs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogItemId = this.catalogItemId;
    final eC2Capacities = this.eC2Capacities;
    final itemStatus = this.itemStatus;
    final powerKva = this.powerKva;
    final supportedStorage = this.supportedStorage;
    final supportedUplinkGbps = this.supportedUplinkGbps;
    final weightLbs = this.weightLbs;
    return {
      if (catalogItemId != null) 'CatalogItemId': catalogItemId,
      if (eC2Capacities != null) 'EC2Capacities': eC2Capacities,
      if (itemStatus != null) 'ItemStatus': itemStatus.toValue(),
      if (powerKva != null) 'PowerKva': powerKva,
      if (supportedStorage != null)
        'SupportedStorage': supportedStorage.map((e) => e.toValue()).toList(),
      if (supportedUplinkGbps != null)
        'SupportedUplinkGbps': supportedUplinkGbps,
      if (weightLbs != null) 'WeightLbs': weightLbs,
    };
  }
}

enum CatalogItemClass {
  rack,
  server,
}

extension on CatalogItemClass {
  String toValue() {
    switch (this) {
      case CatalogItemClass.rack:
        return 'RACK';
      case CatalogItemClass.server:
        return 'SERVER';
    }
  }
}

extension on String {
  CatalogItemClass toCatalogItemClass() {
    switch (this) {
      case 'RACK':
        return CatalogItemClass.rack;
      case 'SERVER':
        return CatalogItemClass.server;
    }
    throw Exception('$this is not known in enum CatalogItemClass');
  }
}

enum CatalogItemStatus {
  available,
  discontinued,
}

extension on CatalogItemStatus {
  String toValue() {
    switch (this) {
      case CatalogItemStatus.available:
        return 'AVAILABLE';
      case CatalogItemStatus.discontinued:
        return 'DISCONTINUED';
    }
  }
}

extension on String {
  CatalogItemStatus toCatalogItemStatus() {
    switch (this) {
      case 'AVAILABLE':
        return CatalogItemStatus.available;
      case 'DISCONTINUED':
        return CatalogItemStatus.discontinued;
    }
    throw Exception('$this is not known in enum CatalogItemStatus');
  }
}

class CreateOrderOutput {
  /// Information about this order.
  final Order? order;

  CreateOrderOutput({
    this.order,
  });

  factory CreateOrderOutput.fromJson(Map<String, dynamic> json) {
    return CreateOrderOutput(
      order: json['Order'] != null
          ? Order.fromJson(json['Order'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final order = this.order;
    return {
      if (order != null) 'Order': order,
    };
  }
}

class CreateOutpostOutput {
  final Outpost? outpost;

  CreateOutpostOutput({
    this.outpost,
  });

  factory CreateOutpostOutput.fromJson(Map<String, dynamic> json) {
    return CreateOutpostOutput(
      outpost: json['Outpost'] != null
          ? Outpost.fromJson(json['Outpost'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpost = this.outpost;
    return {
      if (outpost != null) 'Outpost': outpost,
    };
  }
}

class CreateSiteOutput {
  final Site? site;

  CreateSiteOutput({
    this.site,
  });

  factory CreateSiteOutput.fromJson(Map<String, dynamic> json) {
    return CreateSiteOutput(
      site: json['Site'] != null
          ? Site.fromJson(json['Site'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final site = this.site;
    return {
      if (site != null) 'Site': site,
    };
  }
}

class DeleteOutpostOutput {
  DeleteOutpostOutput();

  factory DeleteOutpostOutput.fromJson(Map<String, dynamic> _) {
    return DeleteOutpostOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSiteOutput {
  DeleteSiteOutput();

  factory DeleteSiteOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSiteOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about EC2 capacity.
class EC2Capacity {
  /// The family of the EC2 capacity.
  final String? family;

  /// The maximum size of the EC2 capacity.
  final String? maxSize;

  /// The quantity of the EC2 capacity.
  final String? quantity;

  EC2Capacity({
    this.family,
    this.maxSize,
    this.quantity,
  });

  factory EC2Capacity.fromJson(Map<String, dynamic> json) {
    return EC2Capacity(
      family: json['Family'] as String?,
      maxSize: json['MaxSize'] as String?,
      quantity: json['Quantity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final family = this.family;
    final maxSize = this.maxSize;
    final quantity = this.quantity;
    return {
      if (family != null) 'Family': family,
      if (maxSize != null) 'MaxSize': maxSize,
      if (quantity != null) 'Quantity': quantity,
    };
  }
}

enum FiberOpticCableType {
  singleMode,
  multiMode,
}

extension on FiberOpticCableType {
  String toValue() {
    switch (this) {
      case FiberOpticCableType.singleMode:
        return 'SINGLE_MODE';
      case FiberOpticCableType.multiMode:
        return 'MULTI_MODE';
    }
  }
}

extension on String {
  FiberOpticCableType toFiberOpticCableType() {
    switch (this) {
      case 'SINGLE_MODE':
        return FiberOpticCableType.singleMode;
      case 'MULTI_MODE':
        return FiberOpticCableType.multiMode;
    }
    throw Exception('$this is not known in enum FiberOpticCableType');
  }
}

class GetCatalogItemOutput {
  /// Information about this catalog item.
  final CatalogItem? catalogItem;

  GetCatalogItemOutput({
    this.catalogItem,
  });

  factory GetCatalogItemOutput.fromJson(Map<String, dynamic> json) {
    return GetCatalogItemOutput(
      catalogItem: json['CatalogItem'] != null
          ? CatalogItem.fromJson(json['CatalogItem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogItem = this.catalogItem;
    return {
      if (catalogItem != null) 'CatalogItem': catalogItem,
    };
  }
}

class GetOrderOutput {
  final Order? order;

  GetOrderOutput({
    this.order,
  });

  factory GetOrderOutput.fromJson(Map<String, dynamic> json) {
    return GetOrderOutput(
      order: json['Order'] != null
          ? Order.fromJson(json['Order'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final order = this.order;
    return {
      if (order != null) 'Order': order,
    };
  }
}

class GetOutpostInstanceTypesOutput {
  final List<InstanceTypeItem>? instanceTypes;
  final String? nextToken;
  final String? outpostArn;

  /// The ID of the Outpost.
  final String? outpostId;

  GetOutpostInstanceTypesOutput({
    this.instanceTypes,
    this.nextToken,
    this.outpostArn,
    this.outpostId,
  });

  factory GetOutpostInstanceTypesOutput.fromJson(Map<String, dynamic> json) {
    return GetOutpostInstanceTypesOutput(
      instanceTypes: (json['InstanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceTypeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      outpostArn: json['OutpostArn'] as String?,
      outpostId: json['OutpostId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceTypes = this.instanceTypes;
    final nextToken = this.nextToken;
    final outpostArn = this.outpostArn;
    final outpostId = this.outpostId;
    return {
      if (instanceTypes != null) 'InstanceTypes': instanceTypes,
      if (nextToken != null) 'NextToken': nextToken,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (outpostId != null) 'OutpostId': outpostId,
    };
  }
}

class GetOutpostOutput {
  final Outpost? outpost;

  GetOutpostOutput({
    this.outpost,
  });

  factory GetOutpostOutput.fromJson(Map<String, dynamic> json) {
    return GetOutpostOutput(
      outpost: json['Outpost'] != null
          ? Outpost.fromJson(json['Outpost'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpost = this.outpost;
    return {
      if (outpost != null) 'Outpost': outpost,
    };
  }
}

class GetSiteAddressOutput {
  /// Information about the address.
  final Address? address;

  /// The type of the address you receive.
  final AddressType? addressType;
  final String? siteId;

  GetSiteAddressOutput({
    this.address,
    this.addressType,
    this.siteId,
  });

  factory GetSiteAddressOutput.fromJson(Map<String, dynamic> json) {
    return GetSiteAddressOutput(
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressType: (json['AddressType'] as String?)?.toAddressType(),
      siteId: json['SiteId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final addressType = this.addressType;
    final siteId = this.siteId;
    return {
      if (address != null) 'Address': address,
      if (addressType != null) 'AddressType': addressType.toValue(),
      if (siteId != null) 'SiteId': siteId,
    };
  }
}

class GetSiteOutput {
  final Site? site;

  GetSiteOutput({
    this.site,
  });

  factory GetSiteOutput.fromJson(Map<String, dynamic> json) {
    return GetSiteOutput(
      site: json['Site'] != null
          ? Site.fromJson(json['Site'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final site = this.site;
    return {
      if (site != null) 'Site': site,
    };
  }
}

/// Information about an instance type.
class InstanceTypeItem {
  final String? instanceType;

  InstanceTypeItem({
    this.instanceType,
  });

  factory InstanceTypeItem.fromJson(Map<String, dynamic> json) {
    return InstanceTypeItem(
      instanceType: json['InstanceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceType = this.instanceType;
    return {
      if (instanceType != null) 'InstanceType': instanceType,
    };
  }
}

/// Information about a line item.
class LineItem {
  /// The ID of the catalog item.
  final String? catalogItemId;

  /// The ID of the line item.
  final String? lineItemId;

  /// The quantity of the line item.
  final int? quantity;

  /// The status of the line item.
  final LineItemStatus? status;

  LineItem({
    this.catalogItemId,
    this.lineItemId,
    this.quantity,
    this.status,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) {
    return LineItem(
      catalogItemId: json['CatalogItemId'] as String?,
      lineItemId: json['LineItemId'] as String?,
      quantity: json['Quantity'] as int?,
      status: (json['Status'] as String?)?.toLineItemStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final catalogItemId = this.catalogItemId;
    final lineItemId = this.lineItemId;
    final quantity = this.quantity;
    final status = this.status;
    return {
      if (catalogItemId != null) 'CatalogItemId': catalogItemId,
      if (lineItemId != null) 'LineItemId': lineItemId,
      if (quantity != null) 'Quantity': quantity,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Information about a line item request.
class LineItemRequest {
  /// The ID of the catalog item.
  final String? catalogItemId;

  /// The quantity of a line item request.
  final int? quantity;

  LineItemRequest({
    this.catalogItemId,
    this.quantity,
  });

  factory LineItemRequest.fromJson(Map<String, dynamic> json) {
    return LineItemRequest(
      catalogItemId: json['CatalogItemId'] as String?,
      quantity: json['Quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogItemId = this.catalogItemId;
    final quantity = this.quantity;
    return {
      if (catalogItemId != null) 'CatalogItemId': catalogItemId,
      if (quantity != null) 'Quantity': quantity,
    };
  }
}

enum LineItemStatus {
  preparing,
  building,
  shipped,
  delivered,
  installing,
  installed,
  error,
  cancelled,
}

extension on LineItemStatus {
  String toValue() {
    switch (this) {
      case LineItemStatus.preparing:
        return 'PREPARING';
      case LineItemStatus.building:
        return 'BUILDING';
      case LineItemStatus.shipped:
        return 'SHIPPED';
      case LineItemStatus.delivered:
        return 'DELIVERED';
      case LineItemStatus.installing:
        return 'INSTALLING';
      case LineItemStatus.installed:
        return 'INSTALLED';
      case LineItemStatus.error:
        return 'ERROR';
      case LineItemStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension on String {
  LineItemStatus toLineItemStatus() {
    switch (this) {
      case 'PREPARING':
        return LineItemStatus.preparing;
      case 'BUILDING':
        return LineItemStatus.building;
      case 'SHIPPED':
        return LineItemStatus.shipped;
      case 'DELIVERED':
        return LineItemStatus.delivered;
      case 'INSTALLING':
        return LineItemStatus.installing;
      case 'INSTALLED':
        return LineItemStatus.installed;
      case 'ERROR':
        return LineItemStatus.error;
      case 'CANCELLED':
        return LineItemStatus.cancelled;
    }
    throw Exception('$this is not known in enum LineItemStatus');
  }
}

class ListCatalogItemsOutput {
  /// Information about the catalog items.
  final List<CatalogItem>? catalogItems;
  final String? nextToken;

  ListCatalogItemsOutput({
    this.catalogItems,
    this.nextToken,
  });

  factory ListCatalogItemsOutput.fromJson(Map<String, dynamic> json) {
    return ListCatalogItemsOutput(
      catalogItems: (json['CatalogItems'] as List?)
          ?.whereNotNull()
          .map((e) => CatalogItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogItems = this.catalogItems;
    final nextToken = this.nextToken;
    return {
      if (catalogItems != null) 'CatalogItems': catalogItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOrdersOutput {
  final String? nextToken;

  /// Information about the orders.
  final List<OrderSummary>? orders;

  ListOrdersOutput({
    this.nextToken,
    this.orders,
  });

  factory ListOrdersOutput.fromJson(Map<String, dynamic> json) {
    return ListOrdersOutput(
      nextToken: json['NextToken'] as String?,
      orders: (json['Orders'] as List?)
          ?.whereNotNull()
          .map((e) => OrderSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final orders = this.orders;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (orders != null) 'Orders': orders,
    };
  }
}

class ListOutpostsOutput {
  final String? nextToken;
  final List<Outpost>? outposts;

  ListOutpostsOutput({
    this.nextToken,
    this.outposts,
  });

  factory ListOutpostsOutput.fromJson(Map<String, dynamic> json) {
    return ListOutpostsOutput(
      nextToken: json['NextToken'] as String?,
      outposts: (json['Outposts'] as List?)
          ?.whereNotNull()
          .map((e) => Outpost.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final outposts = this.outposts;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (outposts != null) 'Outposts': outposts,
    };
  }
}

class ListSitesOutput {
  final String? nextToken;
  final List<Site>? sites;

  ListSitesOutput({
    this.nextToken,
    this.sites,
  });

  factory ListSitesOutput.fromJson(Map<String, dynamic> json) {
    return ListSitesOutput(
      nextToken: json['NextToken'] as String?,
      sites: (json['Sites'] as List?)
          ?.whereNotNull()
          .map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sites = this.sites;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sites != null) 'Sites': sites,
    };
  }
}

class ListTagsForResourceResponse {
  /// The resource tags.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum MaximumSupportedWeightLbs {
  noLimit,
  max_1400Lbs,
  max_1600Lbs,
  max_1800Lbs,
  max_2000Lbs,
}

extension on MaximumSupportedWeightLbs {
  String toValue() {
    switch (this) {
      case MaximumSupportedWeightLbs.noLimit:
        return 'NO_LIMIT';
      case MaximumSupportedWeightLbs.max_1400Lbs:
        return 'MAX_1400_LBS';
      case MaximumSupportedWeightLbs.max_1600Lbs:
        return 'MAX_1600_LBS';
      case MaximumSupportedWeightLbs.max_1800Lbs:
        return 'MAX_1800_LBS';
      case MaximumSupportedWeightLbs.max_2000Lbs:
        return 'MAX_2000_LBS';
    }
  }
}

extension on String {
  MaximumSupportedWeightLbs toMaximumSupportedWeightLbs() {
    switch (this) {
      case 'NO_LIMIT':
        return MaximumSupportedWeightLbs.noLimit;
      case 'MAX_1400_LBS':
        return MaximumSupportedWeightLbs.max_1400Lbs;
      case 'MAX_1600_LBS':
        return MaximumSupportedWeightLbs.max_1600Lbs;
      case 'MAX_1800_LBS':
        return MaximumSupportedWeightLbs.max_1800Lbs;
      case 'MAX_2000_LBS':
        return MaximumSupportedWeightLbs.max_2000Lbs;
    }
    throw Exception('$this is not known in enum MaximumSupportedWeightLbs');
  }
}

enum OpticalStandard {
  optic_10gbaseSr,
  optic_10gbaseIr,
  optic_10gbaseLr,
  optic_40gbaseSr,
  optic_40gbaseEsr,
  optic_40gbaseIr4Lr4l,
  optic_40gbaseLr4,
  optic_100gbaseSr4,
  optic_100gbaseCwdm4,
  optic_100gbaseLr4,
  optic_100gPsm4Msa,
  optic_1000baseLx,
  optic_1000baseSx,
}

extension on OpticalStandard {
  String toValue() {
    switch (this) {
      case OpticalStandard.optic_10gbaseSr:
        return 'OPTIC_10GBASE_SR';
      case OpticalStandard.optic_10gbaseIr:
        return 'OPTIC_10GBASE_IR';
      case OpticalStandard.optic_10gbaseLr:
        return 'OPTIC_10GBASE_LR';
      case OpticalStandard.optic_40gbaseSr:
        return 'OPTIC_40GBASE_SR';
      case OpticalStandard.optic_40gbaseEsr:
        return 'OPTIC_40GBASE_ESR';
      case OpticalStandard.optic_40gbaseIr4Lr4l:
        return 'OPTIC_40GBASE_IR4_LR4L';
      case OpticalStandard.optic_40gbaseLr4:
        return 'OPTIC_40GBASE_LR4';
      case OpticalStandard.optic_100gbaseSr4:
        return 'OPTIC_100GBASE_SR4';
      case OpticalStandard.optic_100gbaseCwdm4:
        return 'OPTIC_100GBASE_CWDM4';
      case OpticalStandard.optic_100gbaseLr4:
        return 'OPTIC_100GBASE_LR4';
      case OpticalStandard.optic_100gPsm4Msa:
        return 'OPTIC_100G_PSM4_MSA';
      case OpticalStandard.optic_1000baseLx:
        return 'OPTIC_1000BASE_LX';
      case OpticalStandard.optic_1000baseSx:
        return 'OPTIC_1000BASE_SX';
    }
  }
}

extension on String {
  OpticalStandard toOpticalStandard() {
    switch (this) {
      case 'OPTIC_10GBASE_SR':
        return OpticalStandard.optic_10gbaseSr;
      case 'OPTIC_10GBASE_IR':
        return OpticalStandard.optic_10gbaseIr;
      case 'OPTIC_10GBASE_LR':
        return OpticalStandard.optic_10gbaseLr;
      case 'OPTIC_40GBASE_SR':
        return OpticalStandard.optic_40gbaseSr;
      case 'OPTIC_40GBASE_ESR':
        return OpticalStandard.optic_40gbaseEsr;
      case 'OPTIC_40GBASE_IR4_LR4L':
        return OpticalStandard.optic_40gbaseIr4Lr4l;
      case 'OPTIC_40GBASE_LR4':
        return OpticalStandard.optic_40gbaseLr4;
      case 'OPTIC_100GBASE_SR4':
        return OpticalStandard.optic_100gbaseSr4;
      case 'OPTIC_100GBASE_CWDM4':
        return OpticalStandard.optic_100gbaseCwdm4;
      case 'OPTIC_100GBASE_LR4':
        return OpticalStandard.optic_100gbaseLr4;
      case 'OPTIC_100G_PSM4_MSA':
        return OpticalStandard.optic_100gPsm4Msa;
      case 'OPTIC_1000BASE_LX':
        return OpticalStandard.optic_1000baseLx;
      case 'OPTIC_1000BASE_SX':
        return OpticalStandard.optic_1000baseSx;
    }
    throw Exception('$this is not known in enum OpticalStandard');
  }
}

/// Information about an order.
class Order {
  /// The line items for the order
  final List<LineItem>? lineItems;

  /// The fulfillment date of the order.
  final DateTime? orderFulfilledDate;

  /// The ID of the order.
  final String? orderId;

  /// The submission date for the order.
  final DateTime? orderSubmissionDate;

  /// The ID of the Outpost in the order.
  final String? outpostId;

  /// The payment option for the order.
  final PaymentOption? paymentOption;

  /// The status of the order.
  ///
  /// <ul>
  /// <li>
  /// <code>PREPARING</code> - Order is received and being prepared.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - Order is either being built, shipped, or
  /// installed. To get more details, see the <code>LineItem</code> status.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> - Order is complete.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> - Order is cancelled.
  /// </li>
  /// <li>
  /// <code>ERROR</code> - Customer should contact support.
  /// </li>
  /// </ul> <note>
  /// The following status are deprecated: <code>RECEIVED</code>,
  /// <code>PENDING</code>, <code>PROCESSING</code>, <code>INSTALLING</code>, and
  /// <code>FULFILLED</code>.
  /// </note>
  final OrderStatus? status;

  Order({
    this.lineItems,
    this.orderFulfilledDate,
    this.orderId,
    this.orderSubmissionDate,
    this.outpostId,
    this.paymentOption,
    this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      lineItems: (json['LineItems'] as List?)
          ?.whereNotNull()
          .map((e) => LineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderFulfilledDate: timeStampFromJson(json['OrderFulfilledDate']),
      orderId: json['OrderId'] as String?,
      orderSubmissionDate: timeStampFromJson(json['OrderSubmissionDate']),
      outpostId: json['OutpostId'] as String?,
      paymentOption: (json['PaymentOption'] as String?)?.toPaymentOption(),
      status: (json['Status'] as String?)?.toOrderStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lineItems = this.lineItems;
    final orderFulfilledDate = this.orderFulfilledDate;
    final orderId = this.orderId;
    final orderSubmissionDate = this.orderSubmissionDate;
    final outpostId = this.outpostId;
    final paymentOption = this.paymentOption;
    final status = this.status;
    return {
      if (lineItems != null) 'LineItems': lineItems,
      if (orderFulfilledDate != null)
        'OrderFulfilledDate': unixTimestampToJson(orderFulfilledDate),
      if (orderId != null) 'OrderId': orderId,
      if (orderSubmissionDate != null)
        'OrderSubmissionDate': unixTimestampToJson(orderSubmissionDate),
      if (outpostId != null) 'OutpostId': outpostId,
      if (paymentOption != null) 'PaymentOption': paymentOption.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum OrderStatus {
  received,
  pending,
  processing,
  installing,
  fulfilled,
  cancelled,
  preparing,
  inProgress,
  completed,
  error,
}

extension on OrderStatus {
  String toValue() {
    switch (this) {
      case OrderStatus.received:
        return 'RECEIVED';
      case OrderStatus.pending:
        return 'PENDING';
      case OrderStatus.processing:
        return 'PROCESSING';
      case OrderStatus.installing:
        return 'INSTALLING';
      case OrderStatus.fulfilled:
        return 'FULFILLED';
      case OrderStatus.cancelled:
        return 'CANCELLED';
      case OrderStatus.preparing:
        return 'PREPARING';
      case OrderStatus.inProgress:
        return 'IN_PROGRESS';
      case OrderStatus.completed:
        return 'COMPLETED';
      case OrderStatus.error:
        return 'ERROR';
    }
  }
}

extension on String {
  OrderStatus toOrderStatus() {
    switch (this) {
      case 'RECEIVED':
        return OrderStatus.received;
      case 'PENDING':
        return OrderStatus.pending;
      case 'PROCESSING':
        return OrderStatus.processing;
      case 'INSTALLING':
        return OrderStatus.installing;
      case 'FULFILLED':
        return OrderStatus.fulfilled;
      case 'CANCELLED':
        return OrderStatus.cancelled;
      case 'PREPARING':
        return OrderStatus.preparing;
      case 'IN_PROGRESS':
        return OrderStatus.inProgress;
      case 'COMPLETED':
        return OrderStatus.completed;
      case 'ERROR':
        return OrderStatus.error;
    }
    throw Exception('$this is not known in enum OrderStatus');
  }
}

/// A summary of line items in your order.
class OrderSummary {
  /// The status of all line items in the order.
  final Map<LineItemStatus, int>? lineItemCountsByStatus;

  /// Fulfilment date for the order.
  final DateTime? orderFulfilledDate;

  /// The ID of the order.
  final String? orderId;

  /// Submission date for the order.
  final DateTime? orderSubmissionDate;

  /// The type of order.
  final OrderType? orderType;

  /// The ID of the Outpost.
  final String? outpostId;

  /// The status of the order.
  ///
  /// <ul>
  /// <li>
  /// <code>PREPARING</code> - Order is received and is being prepared.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - Order is either being built, shipped, or
  /// installed. For more information, see the <code>LineItem</code> status.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> - Order is complete.
  /// </li>
  /// <li>
  /// <code>CANCELLED</code> - Order is cancelled.
  /// </li>
  /// <li>
  /// <code>ERROR</code> - Customer should contact support.
  /// </li>
  /// </ul> <note>
  /// The following statuses are deprecated: <code>RECEIVED</code>,
  /// <code>PENDING</code>, <code>PROCESSING</code>, <code>INSTALLING</code>, and
  /// <code>FULFILLED</code>.
  /// </note>
  final OrderStatus? status;

  OrderSummary({
    this.lineItemCountsByStatus,
    this.orderFulfilledDate,
    this.orderId,
    this.orderSubmissionDate,
    this.orderType,
    this.outpostId,
    this.status,
  });

  factory OrderSummary.fromJson(Map<String, dynamic> json) {
    return OrderSummary(
      lineItemCountsByStatus:
          (json['LineItemCountsByStatus'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toLineItemStatus(), e as int)),
      orderFulfilledDate: timeStampFromJson(json['OrderFulfilledDate']),
      orderId: json['OrderId'] as String?,
      orderSubmissionDate: timeStampFromJson(json['OrderSubmissionDate']),
      orderType: (json['OrderType'] as String?)?.toOrderType(),
      outpostId: json['OutpostId'] as String?,
      status: (json['Status'] as String?)?.toOrderStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lineItemCountsByStatus = this.lineItemCountsByStatus;
    final orderFulfilledDate = this.orderFulfilledDate;
    final orderId = this.orderId;
    final orderSubmissionDate = this.orderSubmissionDate;
    final orderType = this.orderType;
    final outpostId = this.outpostId;
    final status = this.status;
    return {
      if (lineItemCountsByStatus != null)
        'LineItemCountsByStatus':
            lineItemCountsByStatus.map((k, e) => MapEntry(k.toValue(), e)),
      if (orderFulfilledDate != null)
        'OrderFulfilledDate': unixTimestampToJson(orderFulfilledDate),
      if (orderId != null) 'OrderId': orderId,
      if (orderSubmissionDate != null)
        'OrderSubmissionDate': unixTimestampToJson(orderSubmissionDate),
      if (orderType != null) 'OrderType': orderType.toValue(),
      if (outpostId != null) 'OutpostId': outpostId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum OrderType {
  outpost,
  replacement,
}

extension on OrderType {
  String toValue() {
    switch (this) {
      case OrderType.outpost:
        return 'OUTPOST';
      case OrderType.replacement:
        return 'REPLACEMENT';
    }
  }
}

extension on String {
  OrderType toOrderType() {
    switch (this) {
      case 'OUTPOST':
        return OrderType.outpost;
      case 'REPLACEMENT':
        return OrderType.replacement;
    }
    throw Exception('$this is not known in enum OrderType');
  }
}

/// Information about an Outpost.
class Outpost {
  final String? availabilityZone;
  final String? availabilityZoneId;
  final String? description;
  final String? lifeCycleStatus;
  final String? name;
  final String? outpostArn;

  /// The ID of the Outpost.
  final String? outpostId;
  final String? ownerId;
  final String? siteArn;
  final String? siteId;

  /// The hardware type.
  final SupportedHardwareType? supportedHardwareType;

  /// The Outpost tags.
  final Map<String, String>? tags;

  Outpost({
    this.availabilityZone,
    this.availabilityZoneId,
    this.description,
    this.lifeCycleStatus,
    this.name,
    this.outpostArn,
    this.outpostId,
    this.ownerId,
    this.siteArn,
    this.siteId,
    this.supportedHardwareType,
    this.tags,
  });

  factory Outpost.fromJson(Map<String, dynamic> json) {
    return Outpost(
      availabilityZone: json['AvailabilityZone'] as String?,
      availabilityZoneId: json['AvailabilityZoneId'] as String?,
      description: json['Description'] as String?,
      lifeCycleStatus: json['LifeCycleStatus'] as String?,
      name: json['Name'] as String?,
      outpostArn: json['OutpostArn'] as String?,
      outpostId: json['OutpostId'] as String?,
      ownerId: json['OwnerId'] as String?,
      siteArn: json['SiteArn'] as String?,
      siteId: json['SiteId'] as String?,
      supportedHardwareType:
          (json['SupportedHardwareType'] as String?)?.toSupportedHardwareType(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final availabilityZoneId = this.availabilityZoneId;
    final description = this.description;
    final lifeCycleStatus = this.lifeCycleStatus;
    final name = this.name;
    final outpostArn = this.outpostArn;
    final outpostId = this.outpostId;
    final ownerId = this.ownerId;
    final siteArn = this.siteArn;
    final siteId = this.siteId;
    final supportedHardwareType = this.supportedHardwareType;
    final tags = this.tags;
    return {
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (description != null) 'Description': description,
      if (lifeCycleStatus != null) 'LifeCycleStatus': lifeCycleStatus,
      if (name != null) 'Name': name,
      if (outpostArn != null) 'OutpostArn': outpostArn,
      if (outpostId != null) 'OutpostId': outpostId,
      if (ownerId != null) 'OwnerId': ownerId,
      if (siteArn != null) 'SiteArn': siteArn,
      if (siteId != null) 'SiteId': siteId,
      if (supportedHardwareType != null)
        'SupportedHardwareType': supportedHardwareType.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum PaymentOption {
  allUpfront,
  noUpfront,
  partialUpfront,
}

extension on PaymentOption {
  String toValue() {
    switch (this) {
      case PaymentOption.allUpfront:
        return 'ALL_UPFRONT';
      case PaymentOption.noUpfront:
        return 'NO_UPFRONT';
      case PaymentOption.partialUpfront:
        return 'PARTIAL_UPFRONT';
    }
  }
}

extension on String {
  PaymentOption toPaymentOption() {
    switch (this) {
      case 'ALL_UPFRONT':
        return PaymentOption.allUpfront;
      case 'NO_UPFRONT':
        return PaymentOption.noUpfront;
      case 'PARTIAL_UPFRONT':
        return PaymentOption.partialUpfront;
    }
    throw Exception('$this is not known in enum PaymentOption');
  }
}

enum PaymentTerm {
  threeYears,
}

extension on PaymentTerm {
  String toValue() {
    switch (this) {
      case PaymentTerm.threeYears:
        return 'THREE_YEARS';
    }
  }
}

extension on String {
  PaymentTerm toPaymentTerm() {
    switch (this) {
      case 'THREE_YEARS':
        return PaymentTerm.threeYears;
    }
    throw Exception('$this is not known in enum PaymentTerm');
  }
}

enum PowerConnector {
  l6_30p,
  iec309,
  ah530p7w,
  ah532p6w,
}

extension on PowerConnector {
  String toValue() {
    switch (this) {
      case PowerConnector.l6_30p:
        return 'L6_30P';
      case PowerConnector.iec309:
        return 'IEC309';
      case PowerConnector.ah530p7w:
        return 'AH530P7W';
      case PowerConnector.ah532p6w:
        return 'AH532P6W';
    }
  }
}

extension on String {
  PowerConnector toPowerConnector() {
    switch (this) {
      case 'L6_30P':
        return PowerConnector.l6_30p;
      case 'IEC309':
        return PowerConnector.iec309;
      case 'AH530P7W':
        return PowerConnector.ah530p7w;
      case 'AH532P6W':
        return PowerConnector.ah532p6w;
    }
    throw Exception('$this is not known in enum PowerConnector');
  }
}

enum PowerDrawKva {
  power_5Kva,
  power_10Kva,
  power_15Kva,
}

extension on PowerDrawKva {
  String toValue() {
    switch (this) {
      case PowerDrawKva.power_5Kva:
        return 'POWER_5_KVA';
      case PowerDrawKva.power_10Kva:
        return 'POWER_10_KVA';
      case PowerDrawKva.power_15Kva:
        return 'POWER_15_KVA';
    }
  }
}

extension on String {
  PowerDrawKva toPowerDrawKva() {
    switch (this) {
      case 'POWER_5_KVA':
        return PowerDrawKva.power_5Kva;
      case 'POWER_10_KVA':
        return PowerDrawKva.power_10Kva;
      case 'POWER_15_KVA':
        return PowerDrawKva.power_15Kva;
    }
    throw Exception('$this is not known in enum PowerDrawKva');
  }
}

enum PowerFeedDrop {
  aboveRack,
  belowRack,
}

extension on PowerFeedDrop {
  String toValue() {
    switch (this) {
      case PowerFeedDrop.aboveRack:
        return 'ABOVE_RACK';
      case PowerFeedDrop.belowRack:
        return 'BELOW_RACK';
    }
  }
}

extension on String {
  PowerFeedDrop toPowerFeedDrop() {
    switch (this) {
      case 'ABOVE_RACK':
        return PowerFeedDrop.aboveRack;
      case 'BELOW_RACK':
        return PowerFeedDrop.belowRack;
    }
    throw Exception('$this is not known in enum PowerFeedDrop');
  }
}

enum PowerPhase {
  singlePhase,
  threePhase,
}

extension on PowerPhase {
  String toValue() {
    switch (this) {
      case PowerPhase.singlePhase:
        return 'SINGLE_PHASE';
      case PowerPhase.threePhase:
        return 'THREE_PHASE';
    }
  }
}

extension on String {
  PowerPhase toPowerPhase() {
    switch (this) {
      case 'SINGLE_PHASE':
        return PowerPhase.singlePhase;
      case 'THREE_PHASE':
        return PowerPhase.threePhase;
    }
    throw Exception('$this is not known in enum PowerPhase');
  }
}

/// Information about the physical and logistical details for racks at sites.
/// For more information about hardware requirements for racks, see <a
/// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-requirements.html#checklist">Network
/// readiness checklist</a> in the Amazon Web Services Outposts User Guide.
class RackPhysicalProperties {
  /// The type of fiber used to attach the Outpost to the network.
  final FiberOpticCableType? fiberOpticCableType;

  /// The maximum rack weight that this site can support. <code>NO_LIMIT</code> is
  /// over 2000 lbs (907 kg).
  final MaximumSupportedWeightLbs? maximumSupportedWeightLbs;

  /// The type of optical standard used to attach the Outpost to the network. This
  /// field is dependent on uplink speed, fiber type, and distance to the upstream
  /// device. For more information about networking requirements for racks, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/outposts-requirements.html#facility-networking">Network</a>
  /// in the Amazon Web Services Outposts User Guide.
  final OpticalStandard? opticalStandard;

  /// The power connector for the hardware.
  final PowerConnector? powerConnector;

  /// The power draw available at the hardware placement position for the rack.
  final PowerDrawKva? powerDrawKva;

  /// The position of the power feed.
  final PowerFeedDrop? powerFeedDrop;

  /// The power option that you can provide for hardware.
  final PowerPhase? powerPhase;

  /// The number of uplinks each Outpost network device.
  final UplinkCount? uplinkCount;

  /// The uplink speed the rack supports for the connection to the Region.
  final UplinkGbps? uplinkGbps;

  RackPhysicalProperties({
    this.fiberOpticCableType,
    this.maximumSupportedWeightLbs,
    this.opticalStandard,
    this.powerConnector,
    this.powerDrawKva,
    this.powerFeedDrop,
    this.powerPhase,
    this.uplinkCount,
    this.uplinkGbps,
  });

  factory RackPhysicalProperties.fromJson(Map<String, dynamic> json) {
    return RackPhysicalProperties(
      fiberOpticCableType:
          (json['FiberOpticCableType'] as String?)?.toFiberOpticCableType(),
      maximumSupportedWeightLbs: (json['MaximumSupportedWeightLbs'] as String?)
          ?.toMaximumSupportedWeightLbs(),
      opticalStandard:
          (json['OpticalStandard'] as String?)?.toOpticalStandard(),
      powerConnector: (json['PowerConnector'] as String?)?.toPowerConnector(),
      powerDrawKva: (json['PowerDrawKva'] as String?)?.toPowerDrawKva(),
      powerFeedDrop: (json['PowerFeedDrop'] as String?)?.toPowerFeedDrop(),
      powerPhase: (json['PowerPhase'] as String?)?.toPowerPhase(),
      uplinkCount: (json['UplinkCount'] as String?)?.toUplinkCount(),
      uplinkGbps: (json['UplinkGbps'] as String?)?.toUplinkGbps(),
    );
  }

  Map<String, dynamic> toJson() {
    final fiberOpticCableType = this.fiberOpticCableType;
    final maximumSupportedWeightLbs = this.maximumSupportedWeightLbs;
    final opticalStandard = this.opticalStandard;
    final powerConnector = this.powerConnector;
    final powerDrawKva = this.powerDrawKva;
    final powerFeedDrop = this.powerFeedDrop;
    final powerPhase = this.powerPhase;
    final uplinkCount = this.uplinkCount;
    final uplinkGbps = this.uplinkGbps;
    return {
      if (fiberOpticCableType != null)
        'FiberOpticCableType': fiberOpticCableType.toValue(),
      if (maximumSupportedWeightLbs != null)
        'MaximumSupportedWeightLbs': maximumSupportedWeightLbs.toValue(),
      if (opticalStandard != null) 'OpticalStandard': opticalStandard.toValue(),
      if (powerConnector != null) 'PowerConnector': powerConnector.toValue(),
      if (powerDrawKva != null) 'PowerDrawKva': powerDrawKva.toValue(),
      if (powerFeedDrop != null) 'PowerFeedDrop': powerFeedDrop.toValue(),
      if (powerPhase != null) 'PowerPhase': powerPhase.toValue(),
      if (uplinkCount != null) 'UplinkCount': uplinkCount.toValue(),
      if (uplinkGbps != null) 'UplinkGbps': uplinkGbps.toValue(),
    };
  }
}

/// Information about a site.
class Site {
  final String? accountId;
  final String? description;
  final String? name;

  /// Notes about a site.
  final String? notes;

  /// City where the hardware is installed and powered on.
  final String? operatingAddressCity;

  /// The ISO-3166 two-letter country code where the hardware is installed and
  /// powered on.
  final String? operatingAddressCountryCode;

  /// State or region where the hardware is installed and powered on.
  final String? operatingAddressStateOrRegion;

  /// Information about the physical and logistical details for a rack at the
  /// site.
  final RackPhysicalProperties? rackPhysicalProperties;
  final String? siteArn;
  final String? siteId;

  /// The site tags.
  final Map<String, String>? tags;

  Site({
    this.accountId,
    this.description,
    this.name,
    this.notes,
    this.operatingAddressCity,
    this.operatingAddressCountryCode,
    this.operatingAddressStateOrRegion,
    this.rackPhysicalProperties,
    this.siteArn,
    this.siteId,
    this.tags,
  });

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      accountId: json['AccountId'] as String?,
      description: json['Description'] as String?,
      name: json['Name'] as String?,
      notes: json['Notes'] as String?,
      operatingAddressCity: json['OperatingAddressCity'] as String?,
      operatingAddressCountryCode:
          json['OperatingAddressCountryCode'] as String?,
      operatingAddressStateOrRegion:
          json['OperatingAddressStateOrRegion'] as String?,
      rackPhysicalProperties: json['RackPhysicalProperties'] != null
          ? RackPhysicalProperties.fromJson(
              json['RackPhysicalProperties'] as Map<String, dynamic>)
          : null,
      siteArn: json['SiteArn'] as String?,
      siteId: json['SiteId'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final description = this.description;
    final name = this.name;
    final notes = this.notes;
    final operatingAddressCity = this.operatingAddressCity;
    final operatingAddressCountryCode = this.operatingAddressCountryCode;
    final operatingAddressStateOrRegion = this.operatingAddressStateOrRegion;
    final rackPhysicalProperties = this.rackPhysicalProperties;
    final siteArn = this.siteArn;
    final siteId = this.siteId;
    final tags = this.tags;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (notes != null) 'Notes': notes,
      if (operatingAddressCity != null)
        'OperatingAddressCity': operatingAddressCity,
      if (operatingAddressCountryCode != null)
        'OperatingAddressCountryCode': operatingAddressCountryCode,
      if (operatingAddressStateOrRegion != null)
        'OperatingAddressStateOrRegion': operatingAddressStateOrRegion,
      if (rackPhysicalProperties != null)
        'RackPhysicalProperties': rackPhysicalProperties,
      if (siteArn != null) 'SiteArn': siteArn,
      if (siteId != null) 'SiteId': siteId,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum SupportedHardwareType {
  rack,
  server,
}

extension on SupportedHardwareType {
  String toValue() {
    switch (this) {
      case SupportedHardwareType.rack:
        return 'RACK';
      case SupportedHardwareType.server:
        return 'SERVER';
    }
  }
}

extension on String {
  SupportedHardwareType toSupportedHardwareType() {
    switch (this) {
      case 'RACK':
        return SupportedHardwareType.rack;
      case 'SERVER':
        return SupportedHardwareType.server;
    }
    throw Exception('$this is not known in enum SupportedHardwareType');
  }
}

enum SupportedStorageEnum {
  ebs,
  s3,
}

extension on SupportedStorageEnum {
  String toValue() {
    switch (this) {
      case SupportedStorageEnum.ebs:
        return 'EBS';
      case SupportedStorageEnum.s3:
        return 'S3';
    }
  }
}

extension on String {
  SupportedStorageEnum toSupportedStorageEnum() {
    switch (this) {
      case 'EBS':
        return SupportedStorageEnum.ebs;
      case 'S3':
        return SupportedStorageEnum.s3;
    }
    throw Exception('$this is not known in enum SupportedStorageEnum');
  }
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

class UpdateOutpostOutput {
  final Outpost? outpost;

  UpdateOutpostOutput({
    this.outpost,
  });

  factory UpdateOutpostOutput.fromJson(Map<String, dynamic> json) {
    return UpdateOutpostOutput(
      outpost: json['Outpost'] != null
          ? Outpost.fromJson(json['Outpost'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final outpost = this.outpost;
    return {
      if (outpost != null) 'Outpost': outpost,
    };
  }
}

class UpdateSiteAddressOutput {
  /// Information about an address.
  final Address? address;

  /// The type of the address.
  final AddressType? addressType;

  UpdateSiteAddressOutput({
    this.address,
    this.addressType,
  });

  factory UpdateSiteAddressOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSiteAddressOutput(
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressType: (json['AddressType'] as String?)?.toAddressType(),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final addressType = this.addressType;
    return {
      if (address != null) 'Address': address,
      if (addressType != null) 'AddressType': addressType.toValue(),
    };
  }
}

class UpdateSiteOutput {
  final Site? site;

  UpdateSiteOutput({
    this.site,
  });

  factory UpdateSiteOutput.fromJson(Map<String, dynamic> json) {
    return UpdateSiteOutput(
      site: json['Site'] != null
          ? Site.fromJson(json['Site'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final site = this.site;
    return {
      if (site != null) 'Site': site,
    };
  }
}

class UpdateSiteRackPhysicalPropertiesOutput {
  final Site? site;

  UpdateSiteRackPhysicalPropertiesOutput({
    this.site,
  });

  factory UpdateSiteRackPhysicalPropertiesOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateSiteRackPhysicalPropertiesOutput(
      site: json['Site'] != null
          ? Site.fromJson(json['Site'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final site = this.site;
    return {
      if (site != null) 'Site': site,
    };
  }
}

enum UplinkCount {
  uplinkCount_1,
  uplinkCount_2,
  uplinkCount_3,
  uplinkCount_4,
  uplinkCount_5,
  uplinkCount_6,
  uplinkCount_7,
  uplinkCount_8,
  uplinkCount_12,
  uplinkCount_16,
}

extension on UplinkCount {
  String toValue() {
    switch (this) {
      case UplinkCount.uplinkCount_1:
        return 'UPLINK_COUNT_1';
      case UplinkCount.uplinkCount_2:
        return 'UPLINK_COUNT_2';
      case UplinkCount.uplinkCount_3:
        return 'UPLINK_COUNT_3';
      case UplinkCount.uplinkCount_4:
        return 'UPLINK_COUNT_4';
      case UplinkCount.uplinkCount_5:
        return 'UPLINK_COUNT_5';
      case UplinkCount.uplinkCount_6:
        return 'UPLINK_COUNT_6';
      case UplinkCount.uplinkCount_7:
        return 'UPLINK_COUNT_7';
      case UplinkCount.uplinkCount_8:
        return 'UPLINK_COUNT_8';
      case UplinkCount.uplinkCount_12:
        return 'UPLINK_COUNT_12';
      case UplinkCount.uplinkCount_16:
        return 'UPLINK_COUNT_16';
    }
  }
}

extension on String {
  UplinkCount toUplinkCount() {
    switch (this) {
      case 'UPLINK_COUNT_1':
        return UplinkCount.uplinkCount_1;
      case 'UPLINK_COUNT_2':
        return UplinkCount.uplinkCount_2;
      case 'UPLINK_COUNT_3':
        return UplinkCount.uplinkCount_3;
      case 'UPLINK_COUNT_4':
        return UplinkCount.uplinkCount_4;
      case 'UPLINK_COUNT_5':
        return UplinkCount.uplinkCount_5;
      case 'UPLINK_COUNT_6':
        return UplinkCount.uplinkCount_6;
      case 'UPLINK_COUNT_7':
        return UplinkCount.uplinkCount_7;
      case 'UPLINK_COUNT_8':
        return UplinkCount.uplinkCount_8;
      case 'UPLINK_COUNT_12':
        return UplinkCount.uplinkCount_12;
      case 'UPLINK_COUNT_16':
        return UplinkCount.uplinkCount_16;
    }
    throw Exception('$this is not known in enum UplinkCount');
  }
}

enum UplinkGbps {
  uplink_1g,
  uplink_10g,
  uplink_40g,
  uplink_100g,
}

extension on UplinkGbps {
  String toValue() {
    switch (this) {
      case UplinkGbps.uplink_1g:
        return 'UPLINK_1G';
      case UplinkGbps.uplink_10g:
        return 'UPLINK_10G';
      case UplinkGbps.uplink_40g:
        return 'UPLINK_40G';
      case UplinkGbps.uplink_100g:
        return 'UPLINK_100G';
    }
  }
}

extension on String {
  UplinkGbps toUplinkGbps() {
    switch (this) {
      case 'UPLINK_1G':
        return UplinkGbps.uplink_1g;
      case 'UPLINK_10G':
        return UplinkGbps.uplink_10g;
      case 'UPLINK_40G':
        return UplinkGbps.uplink_40g;
      case 'UPLINK_100G':
        return UplinkGbps.uplink_100g;
    }
    throw Exception('$this is not known in enum UplinkGbps');
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

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
