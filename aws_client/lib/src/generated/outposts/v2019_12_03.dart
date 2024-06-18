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
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Cancels the capacity task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [capacityTaskId] :
  /// ID of the capacity task that you want to cancel.
  ///
  /// Parameter [outpostIdentifier] :
  /// ID or ARN of the Outpost associated with the capacity task that you want
  /// to cancel.
  Future<void> cancelCapacityTask({
    required String capacityTaskId,
    required String outpostIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/outposts/${Uri.encodeComponent(outpostIdentifier)}/capacity/${Uri.encodeComponent(capacityTaskId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels the specified order for an Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [orderId] :
  /// The ID of the order.
  Future<void> cancelOrder({
    required String orderId,
  }) async {
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
  /// The payment option.
  ///
  /// Parameter [paymentTerm] :
  /// The payment terms.
  Future<CreateOrderOutput> createOrder({
    required List<LineItemRequest> lineItems,
    required String outpostIdentifier,
    required PaymentOption paymentOption,
    PaymentTerm? paymentTerm,
  }) async {
    final $payload = <String, dynamic>{
      'LineItems': lineItems,
      'OutpostIdentifier': outpostIdentifier,
      'PaymentOption': paymentOption.value,
      if (paymentTerm != null) 'PaymentTerm': paymentTerm.value,
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
  /// You can specify either an Availability one or an AZ ID.
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
    final $payload = <String, dynamic>{
      'Name': name,
      'SiteId': siteId,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (availabilityZoneId != null) 'AvailabilityZoneId': availabilityZoneId,
      if (description != null) 'Description': description,
      if (supportedHardwareType != null)
        'SupportedHardwareType': supportedHardwareType.value,
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

  /// Deletes the specified Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostId] :
  /// The ID or ARN of the Outpost.
  Future<void> deleteOutpost({
    required String outpostId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified site.
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets details of the specified capacity task.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [capacityTaskId] :
  /// ID of the capacity task.
  ///
  /// Parameter [outpostIdentifier] :
  /// ID or ARN of the Outpost associated with the specified capacity task.
  Future<GetCapacityTaskOutput> getCapacityTask({
    required String capacityTaskId,
    required String outpostIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/outposts/${Uri.encodeComponent(outpostIdentifier)}/capacity/${Uri.encodeComponent(capacityTaskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCapacityTaskOutput.fromJson(response);
  }

  /// Gets information about the specified catalog item.
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/catalog/item/${Uri.encodeComponent(catalogItemId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCatalogItemOutput.fromJson(response);
  }

  /// <note>
  /// Amazon Web Services uses this action to install Outpost servers.
  /// </note>
  /// Gets information about the specified connection.
  ///
  /// Use CloudTrail to monitor this action or Amazon Web Services managed
  /// policy for Amazon Web Services Outposts to secure it. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/security-iam-awsmanpol.html">
  /// Amazon Web Services managed policies for Amazon Web Services Outposts</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/logging-using-cloudtrail.html">
  /// Logging Amazon Web Services Outposts API calls with Amazon Web Services
  /// CloudTrail</a> in the <i>Amazon Web Services Outposts User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [connectionId] :
  /// The ID of the connection.
  Future<GetConnectionResponse> getConnection({
    required String connectionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/connections/${Uri.encodeComponent(connectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetConnectionResponse.fromJson(response);
  }

  /// Gets information about the specified order.
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
  /// The ID or ARN of the Outpost.
  Future<GetOutpostOutput> getOutpost({
    required String outpostId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOutpostOutput.fromJson(response);
  }

  /// Gets the instance types for the specified Outpost.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostId] :
  /// The ID or ARN of the Outpost.
  Future<GetOutpostInstanceTypesOutput> getOutpostInstanceTypes({
    required String outpostId,
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
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}/instanceTypes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetOutpostInstanceTypesOutput.fromJson(response);
  }

  /// Gets the instance types that an Outpost can support in
  /// <code>InstanceTypeCapacity</code>. This will generally include instance
  /// types that are not currently configured and therefore cannot be launched
  /// with the current Outpost capacity configuration.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [orderId] :
  /// The ID for the Amazon Web Services Outposts order.
  ///
  /// Parameter [outpostIdentifier] :
  /// The ID or ARN of the Outpost.
  Future<GetOutpostSupportedInstanceTypesOutput>
      getOutpostSupportedInstanceTypes({
    required String orderId,
    required String outpostIdentifier,
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
      'OrderId': [orderId],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/outposts/${Uri.encodeComponent(outpostIdentifier)}/supportedInstanceTypes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetOutpostSupportedInstanceTypesOutput.fromJson(response);
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sites/${Uri.encodeComponent(siteId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSiteOutput.fromJson(response);
  }

  /// Gets the site address of the specified site.
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
    final $query = <String, List<String>>{
      'AddressType': [addressType.value],
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

  /// Lists the hardware assets for the specified Outpost.
  ///
  /// Use filters to return specific results. If you specify multiple filters,
  /// the results include only the resources that match all of the specified
  /// filters. For a filter where you can specify multiple values, the results
  /// include items that match any of the values that you specify for the
  /// filter.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [outpostIdentifier] :
  /// The ID or the Amazon Resource Name (ARN) of the Outpost.
  ///
  /// Parameter [hostIdFilter] :
  /// Filters the results by the host ID of a Dedicated Host.
  ///
  /// Parameter [statusFilter] :
  /// Filters the results by state.
  Future<ListAssetsOutput> listAssets({
    required String outpostIdentifier,
    List<String>? hostIdFilter,
    int? maxResults,
    String? nextToken,
    List<AssetState>? statusFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (hostIdFilter != null) 'HostIdFilter': hostIdFilter,
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (statusFilter != null)
        'StatusFilter': statusFilter.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/outposts/${Uri.encodeComponent(outpostIdentifier)}/assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAssetsOutput.fromJson(response);
  }

  /// Lists the capacity tasks for your Amazon Web Services account.
  ///
  /// Use filters to return specific results. If you specify multiple filters,
  /// the results include only the resources that match all of the specified
  /// filters. For a filter where you can specify multiple values, the results
  /// include items that match any of the values that you specify for the
  /// filter.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [capacityTaskStatusFilter] :
  /// A list of statuses. For example, <code>REQUESTED</code> or
  /// <code>WAITING_FOR_EVACUATION</code>.
  ///
  /// Parameter [outpostIdentifierFilter] :
  /// Filters the results by an Outpost ID or an Outpost ARN.
  Future<ListCapacityTasksOutput> listCapacityTasks({
    List<CapacityTaskStatus>? capacityTaskStatusFilter,
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
      if (capacityTaskStatusFilter != null)
        'CapacityTaskStatusFilter':
            capacityTaskStatusFilter.map((e) => e.value).toList(),
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (outpostIdentifierFilter != null)
        'OutpostIdentifierFilter': [outpostIdentifierFilter],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/capacity/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCapacityTasksOutput.fromJson(response);
  }

  /// Lists the items in the catalog.
  ///
  /// Use filters to return specific results. If you specify multiple filters,
  /// the results include only the resources that match all of the specified
  /// filters. For a filter where you can specify multiple values, the results
  /// include items that match any of the values that you specify for the
  /// filter.
  ///
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [eC2FamilyFilter] :
  /// Filters the results by EC2 family (for example, M5).
  ///
  /// Parameter [itemClassFilter] :
  /// Filters the results by item class.
  ///
  /// Parameter [supportedStorageFilter] :
  /// Filters the results by storage option.
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
        'ItemClassFilter': itemClassFilter.map((e) => e.value).toList(),
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (supportedStorageFilter != null)
        'SupportedStorageFilter':
            supportedStorageFilter.map((e) => e.value).toList(),
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

  /// Lists the Outpost orders for your Amazon Web Services account.
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

  /// Lists the Outposts for your Amazon Web Services account.
  ///
  /// Use filters to return specific results. If you specify multiple filters,
  /// the results include only the resources that match all of the specified
  /// filters. For a filter where you can specify multiple values, the results
  /// include items that match any of the values that you specify for the
  /// filter.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [availabilityZoneFilter] :
  /// Filters the results by Availability Zone (for example,
  /// <code>us-east-1a</code>).
  ///
  /// Parameter [availabilityZoneIdFilter] :
  /// Filters the results by AZ ID (for example, <code>use1-az1</code>).
  ///
  /// Parameter [lifeCycleStatusFilter] :
  /// Filters the results by the lifecycle status.
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

  /// Lists the Outpost sites for your Amazon Web Services account. Use filters
  /// to return specific results.
  ///
  /// Use filters to return specific results. If you specify multiple filters,
  /// the results include only the resources that match all of the specified
  /// filters. For a filter where you can specify multiple values, the results
  /// include items that match any of the values that you specify for the
  /// filter.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [operatingAddressCityFilter] :
  /// Filters the results by city.
  ///
  /// Parameter [operatingAddressCountryCodeFilter] :
  /// Filters the results by country code.
  ///
  /// Parameter [operatingAddressStateOrRegionFilter] :
  /// Filters the results by state or region.
  Future<ListSitesOutput> listSites({
    int? maxResults,
    String? nextToken,
    List<String>? operatingAddressCityFilter,
    List<String>? operatingAddressCountryCodeFilter,
    List<String>? operatingAddressStateOrRegionFilter,
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
      if (operatingAddressCityFilter != null)
        'OperatingAddressCityFilter': operatingAddressCityFilter,
      if (operatingAddressCountryCodeFilter != null)
        'OperatingAddressCountryCodeFilter': operatingAddressCountryCodeFilter,
      if (operatingAddressStateOrRegionFilter != null)
        'OperatingAddressStateOrRegionFilter':
            operatingAddressStateOrRegionFilter,
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts the specified capacity task. You can have one active capacity task
  /// for an order.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [instancePools] :
  /// The instance pools specified in the capacity task.
  ///
  /// Parameter [orderId] :
  /// The ID of the Amazon Web Services Outposts order associated with the
  /// specified capacity task.
  ///
  /// Parameter [outpostIdentifier] :
  /// The ID or ARN of the Outposts associated with the specified capacity task.
  ///
  /// Parameter [dryRun] :
  /// You can request a dry run to determine if the instance type and instance
  /// size changes is above or below available instance capacity. Requesting a
  /// dry run does not make any changes to your plan.
  Future<StartCapacityTaskOutput> startCapacityTask({
    required List<InstanceTypeCapacity> instancePools,
    required String orderId,
    required String outpostIdentifier,
    bool? dryRun,
  }) async {
    final $payload = <String, dynamic>{
      'InstancePools': instancePools,
      'OrderId': orderId,
      if (dryRun != null) 'DryRun': dryRun,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/outposts/${Uri.encodeComponent(outpostIdentifier)}/capacity',
      exceptionFnMap: _exceptionFns,
    );
    return StartCapacityTaskOutput.fromJson(response);
  }

  /// <note>
  /// Amazon Web Services uses this action to install Outpost servers.
  /// </note>
  /// Starts the connection required for Outpost server installation.
  ///
  /// Use CloudTrail to monitor this action or Amazon Web Services managed
  /// policy for Amazon Web Services Outposts to secure it. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/security-iam-awsmanpol.html">
  /// Amazon Web Services managed policies for Amazon Web Services Outposts</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/outposts/latest/userguide/logging-using-cloudtrail.html">
  /// Logging Amazon Web Services Outposts API calls with Amazon Web Services
  /// CloudTrail</a> in the <i>Amazon Web Services Outposts User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [NotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [assetId] :
  /// The ID of the Outpost server.
  ///
  /// Parameter [clientPublicKey] :
  /// The public key of the client.
  ///
  /// Parameter [networkInterfaceDeviceIndex] :
  /// The device index of the network interface on the Outpost server.
  ///
  /// Parameter [deviceSerialNumber] :
  /// The serial number of the dongle.
  Future<StartConnectionResponse> startConnection({
    required String assetId,
    required String clientPublicKey,
    required int networkInterfaceDeviceIndex,
    String? deviceSerialNumber,
  }) async {
    _s.validateNumRange(
      'networkInterfaceDeviceIndex',
      networkInterfaceDeviceIndex,
      0,
      1,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'AssetId': assetId,
      'ClientPublicKey': clientPublicKey,
      'NetworkInterfaceDeviceIndex': networkInterfaceDeviceIndex,
      if (deviceSerialNumber != null) 'DeviceSerialNumber': deviceSerialNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/connections',
      exceptionFnMap: _exceptionFns,
    );
    return StartConnectionResponse.fromJson(response);
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
  /// The ID or ARN of the Outpost.
  ///
  /// Parameter [supportedHardwareType] :
  /// The type of hardware for this Outpost.
  Future<UpdateOutpostOutput> updateOutpost({
    required String outpostId,
    String? description,
    String? name,
    SupportedHardwareType? supportedHardwareType,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (name != null) 'Name': name,
      if (supportedHardwareType != null)
        'SupportedHardwareType': supportedHardwareType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/outposts/${Uri.encodeComponent(outpostId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateOutpostOutput.fromJson(response);
  }

  /// Updates the specified site.
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

  /// Updates the address of the specified site.
  ///
  /// You can't update a site address if there is an order in progress. You must
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
    final $payload = <String, dynamic>{
      'Address': address,
      'AddressType': addressType.value,
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
  /// The type of fiber that you will use to attach the Outpost to your network.
  ///
  /// Parameter [maximumSupportedWeightLbs] :
  /// The maximum rack weight that this site can support. <code>NO_LIMIT</code>
  /// is over 2000lbs.
  ///
  /// Parameter [opticalStandard] :
  /// The type of optical standard that you will use to attach the Outpost to
  /// your network. This field is dependent on uplink speed, fiber type, and
  /// distance to the upstream device. For more information about networking
  /// requirements for racks, see <a
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
  /// The power connector that Amazon Web Services should plan to provide for
  /// connections to the hardware. Note the correlation between
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
  /// The power draw, in kVA, available at the hardware placement position for
  /// the rack.
  ///
  /// Parameter [powerFeedDrop] :
  /// Indicates whether the power feed comes above or below the rack.
  ///
  /// Parameter [powerPhase] :
  /// The power option that you can provide for hardware.
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
  /// The uplink speed the rack should support for the connection to the Region.
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
    final $payload = <String, dynamic>{
      if (fiberOpticCableType != null)
        'FiberOpticCableType': fiberOpticCableType.value,
      if (maximumSupportedWeightLbs != null)
        'MaximumSupportedWeightLbs': maximumSupportedWeightLbs.value,
      if (opticalStandard != null) 'OpticalStandard': opticalStandard.value,
      if (powerConnector != null) 'PowerConnector': powerConnector.value,
      if (powerDrawKva != null) 'PowerDrawKva': powerDrawKva.value,
      if (powerFeedDrop != null) 'PowerFeedDrop': powerFeedDrop.value,
      if (powerPhase != null) 'PowerPhase': powerPhase.value,
      if (uplinkCount != null) 'UplinkCount': uplinkCount.value,
      if (uplinkGbps != null) 'UplinkGbps': uplinkGbps.value,
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
  shippingAddress('SHIPPING_ADDRESS'),
  operatingAddress('OPERATING_ADDRESS'),
  ;

  final String value;

  const AddressType(this.value);

  static AddressType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AddressType'));
}

/// Information about hardware assets.
class AssetInfo {
  /// The ID of the asset.
  final String? assetId;

  /// The position of an asset in a rack.
  final AssetLocation? assetLocation;

  /// The type of the asset.
  final AssetType? assetType;

  /// Information about compute hardware assets.
  final ComputeAttributes? computeAttributes;

  /// The rack ID of the asset.
  final String? rackId;

  AssetInfo({
    this.assetId,
    this.assetLocation,
    this.assetType,
    this.computeAttributes,
    this.rackId,
  });

  factory AssetInfo.fromJson(Map<String, dynamic> json) {
    return AssetInfo(
      assetId: json['AssetId'] as String?,
      assetLocation: json['AssetLocation'] != null
          ? AssetLocation.fromJson(
              json['AssetLocation'] as Map<String, dynamic>)
          : null,
      assetType: (json['AssetType'] as String?)?.let(AssetType.fromString),
      computeAttributes: json['ComputeAttributes'] != null
          ? ComputeAttributes.fromJson(
              json['ComputeAttributes'] as Map<String, dynamic>)
          : null,
      rackId: json['RackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final assetLocation = this.assetLocation;
    final assetType = this.assetType;
    final computeAttributes = this.computeAttributes;
    final rackId = this.rackId;
    return {
      if (assetId != null) 'AssetId': assetId,
      if (assetLocation != null) 'AssetLocation': assetLocation,
      if (assetType != null) 'AssetType': assetType.value,
      if (computeAttributes != null) 'ComputeAttributes': computeAttributes,
      if (rackId != null) 'RackId': rackId,
    };
  }
}

/// Information about the position of the asset in a rack.
class AssetLocation {
  /// The position of an asset in a rack measured in rack units.
  final double? rackElevation;

  AssetLocation({
    this.rackElevation,
  });

  factory AssetLocation.fromJson(Map<String, dynamic> json) {
    return AssetLocation(
      rackElevation: json['RackElevation'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final rackElevation = this.rackElevation;
    return {
      if (rackElevation != null) 'RackElevation': rackElevation,
    };
  }
}

enum AssetState {
  active('ACTIVE'),
  retiring('RETIRING'),
  isolated('ISOLATED'),
  ;

  final String value;

  const AssetState(this.value);

  static AssetState fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AssetState'));
}

enum AssetType {
  compute('COMPUTE'),
  ;

  final String value;

  const AssetType(this.value);

  static AssetType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum AssetType'));
}

class CancelCapacityTaskOutput {
  CancelCapacityTaskOutput();

  factory CancelCapacityTaskOutput.fromJson(Map<String, dynamic> _) {
    return CancelCapacityTaskOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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

/// The capacity tasks that failed.
class CapacityTaskFailure {
  /// The reason that the specified capacity task failed.
  final String reason;

  /// The type of failure.
  final CapacityTaskFailureType? type;

  CapacityTaskFailure({
    required this.reason,
    this.type,
  });

  factory CapacityTaskFailure.fromJson(Map<String, dynamic> json) {
    return CapacityTaskFailure(
      reason: json['Reason'] as String,
      type: (json['Type'] as String?)?.let(CapacityTaskFailureType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final type = this.type;
    return {
      'Reason': reason,
      if (type != null) 'Type': type.value,
    };
  }
}

enum CapacityTaskFailureType {
  unsupportedCapacityConfiguration('UNSUPPORTED_CAPACITY_CONFIGURATION'),
  ;

  final String value;

  const CapacityTaskFailureType(this.value);

  static CapacityTaskFailureType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum CapacityTaskFailureType'));
}

enum CapacityTaskStatus {
  requested('REQUESTED'),
  inProgress('IN_PROGRESS'),
  failed('FAILED'),
  completed('COMPLETED'),
  cancelled('CANCELLED'),
  ;

  final String value;

  const CapacityTaskStatus(this.value);

  static CapacityTaskStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CapacityTaskStatus'));
}

/// The summary of the capacity task.
class CapacityTaskSummary {
  /// The ID of the specified capacity task.
  final String? capacityTaskId;

  /// The status of the capacity task.
  final CapacityTaskStatus? capacityTaskStatus;

  /// The date that the specified capacity task successfully ran.
  final DateTime? completionDate;

  /// The date that the specified capacity task was created.
  final DateTime? creationDate;

  /// The date that the specified capacity was last modified.
  final DateTime? lastModifiedDate;

  /// The ID of the Amazon Web Services Outposts order of the host associated with
  /// the capacity task.
  final String? orderId;

  /// The ID of the Outpost associated with the specified capacity task.
  final String? outpostId;

  CapacityTaskSummary({
    this.capacityTaskId,
    this.capacityTaskStatus,
    this.completionDate,
    this.creationDate,
    this.lastModifiedDate,
    this.orderId,
    this.outpostId,
  });

  factory CapacityTaskSummary.fromJson(Map<String, dynamic> json) {
    return CapacityTaskSummary(
      capacityTaskId: json['CapacityTaskId'] as String?,
      capacityTaskStatus: (json['CapacityTaskStatus'] as String?)
          ?.let(CapacityTaskStatus.fromString),
      completionDate: timeStampFromJson(json['CompletionDate']),
      creationDate: timeStampFromJson(json['CreationDate']),
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      orderId: json['OrderId'] as String?,
      outpostId: json['OutpostId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityTaskId = this.capacityTaskId;
    final capacityTaskStatus = this.capacityTaskStatus;
    final completionDate = this.completionDate;
    final creationDate = this.creationDate;
    final lastModifiedDate = this.lastModifiedDate;
    final orderId = this.orderId;
    final outpostId = this.outpostId;
    return {
      if (capacityTaskId != null) 'CapacityTaskId': capacityTaskId,
      if (capacityTaskStatus != null)
        'CapacityTaskStatus': capacityTaskStatus.value,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (orderId != null) 'OrderId': orderId,
      if (outpostId != null) 'OutpostId': outpostId,
    };
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
          ?.nonNulls
          .map((e) => EC2Capacity.fromJson(e as Map<String, dynamic>))
          .toList(),
      itemStatus:
          (json['ItemStatus'] as String?)?.let(CatalogItemStatus.fromString),
      powerKva: json['PowerKva'] as double?,
      supportedStorage: (json['SupportedStorage'] as List?)
          ?.nonNulls
          .map((e) => SupportedStorageEnum.fromString((e as String)))
          .toList(),
      supportedUplinkGbps: (json['SupportedUplinkGbps'] as List?)
          ?.nonNulls
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
      if (itemStatus != null) 'ItemStatus': itemStatus.value,
      if (powerKva != null) 'PowerKva': powerKva,
      if (supportedStorage != null)
        'SupportedStorage': supportedStorage.map((e) => e.value).toList(),
      if (supportedUplinkGbps != null)
        'SupportedUplinkGbps': supportedUplinkGbps,
      if (weightLbs != null) 'WeightLbs': weightLbs,
    };
  }
}

enum CatalogItemClass {
  rack('RACK'),
  server('SERVER'),
  ;

  final String value;

  const CatalogItemClass(this.value);

  static CatalogItemClass fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CatalogItemClass'));
}

enum CatalogItemStatus {
  available('AVAILABLE'),
  discontinued('DISCONTINUED'),
  ;

  final String value;

  const CatalogItemStatus(this.value);

  static CatalogItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CatalogItemStatus'));
}

enum ComputeAssetState {
  active('ACTIVE'),
  isolated('ISOLATED'),
  retiring('RETIRING'),
  ;

  final String value;

  const ComputeAssetState(this.value);

  static ComputeAssetState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ComputeAssetState'));
}

/// Information about compute hardware assets.
class ComputeAttributes {
  /// The host ID of the Dedicated Host on the asset.
  final String? hostId;

  /// A list of the names of instance families that are currently associated with
  /// a given asset.
  final List<String>? instanceFamilies;

  /// The state.
  ///
  /// <ul>
  /// <li>
  /// ACTIVE - The asset is available and can provide capacity for new compute
  /// resources.
  /// </li>
  /// <li>
  /// ISOLATED - The asset is undergoing maintenance and can't provide capacity
  /// for new compute resources. Existing compute resources on the asset are not
  /// affected.
  /// </li>
  /// <li>
  /// RETIRING - The underlying hardware for the asset is degraded. Capacity for
  /// new compute resources is reduced. Amazon Web Services sends notifications
  /// for resources that must be stopped before the asset can be replaced.
  /// </li>
  /// </ul>
  final ComputeAssetState? state;

  ComputeAttributes({
    this.hostId,
    this.instanceFamilies,
    this.state,
  });

  factory ComputeAttributes.fromJson(Map<String, dynamic> json) {
    return ComputeAttributes(
      hostId: json['HostId'] as String?,
      instanceFamilies: (json['InstanceFamilies'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      state: (json['State'] as String?)?.let(ComputeAssetState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final hostId = this.hostId;
    final instanceFamilies = this.instanceFamilies;
    final state = this.state;
    return {
      if (hostId != null) 'HostId': hostId,
      if (instanceFamilies != null) 'InstanceFamilies': instanceFamilies,
      if (state != null) 'State': state.value,
    };
  }
}

/// Information about a connection.
class ConnectionDetails {
  /// The allowed IP addresses.
  final List<String>? allowedIps;

  /// The public key of the client.
  final String? clientPublicKey;

  /// The client tunnel address.
  final String? clientTunnelAddress;

  /// The endpoint for the server.
  final String? serverEndpoint;

  /// The public key of the server.
  final String? serverPublicKey;

  /// The server tunnel address.
  final String? serverTunnelAddress;

  ConnectionDetails({
    this.allowedIps,
    this.clientPublicKey,
    this.clientTunnelAddress,
    this.serverEndpoint,
    this.serverPublicKey,
    this.serverTunnelAddress,
  });

  factory ConnectionDetails.fromJson(Map<String, dynamic> json) {
    return ConnectionDetails(
      allowedIps: (json['AllowedIps'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      clientPublicKey: json['ClientPublicKey'] as String?,
      clientTunnelAddress: json['ClientTunnelAddress'] as String?,
      serverEndpoint: json['ServerEndpoint'] as String?,
      serverPublicKey: json['ServerPublicKey'] as String?,
      serverTunnelAddress: json['ServerTunnelAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedIps = this.allowedIps;
    final clientPublicKey = this.clientPublicKey;
    final clientTunnelAddress = this.clientTunnelAddress;
    final serverEndpoint = this.serverEndpoint;
    final serverPublicKey = this.serverPublicKey;
    final serverTunnelAddress = this.serverTunnelAddress;
    return {
      if (allowedIps != null) 'AllowedIps': allowedIps,
      if (clientPublicKey != null) 'ClientPublicKey': clientPublicKey,
      if (clientTunnelAddress != null)
        'ClientTunnelAddress': clientTunnelAddress,
      if (serverEndpoint != null) 'ServerEndpoint': serverEndpoint,
      if (serverPublicKey != null) 'ServerPublicKey': serverPublicKey,
      if (serverTunnelAddress != null)
        'ServerTunnelAddress': serverTunnelAddress,
    };
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
  singleMode('SINGLE_MODE'),
  multiMode('MULTI_MODE'),
  ;

  final String value;

  const FiberOpticCableType(this.value);

  static FiberOpticCableType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum FiberOpticCableType'));
}

class GetCapacityTaskOutput {
  /// ID of the capacity task.
  final String? capacityTaskId;

  /// Status of the capacity task.
  ///
  /// A capacity task can have one of the following statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>REQUESTED</code> - The capacity task was created and is awaiting the
  /// next step by Amazon Web Services Outposts.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - The capacity task is running and cannot be
  /// cancelled.
  /// </li>
  /// <li>
  /// <code>WAITING_FOR_EVACUATION</code> - The capacity task requires capacity to
  /// run. You must stop the recommended EC2 running instances to free up capacity
  /// for the task to run.
  /// </li>
  /// </ul>
  final CapacityTaskStatus? capacityTaskStatus;

  /// The date the capacity task ran successfully.
  final DateTime? completionDate;

  /// The date the capacity task was created.
  final DateTime? creationDate;

  /// Performs a dry run to determine if you are above or below instance capacity.
  final bool? dryRun;

  /// Reason why the capacity task failed.
  final CapacityTaskFailure? failed;

  /// The date the capacity task was last modified.
  final DateTime? lastModifiedDate;

  /// ID of the Amazon Web Services Outposts order associated with the specified
  /// capacity task.
  final String? orderId;

  /// ID of the Outpost associated with the specified capacity task.
  final String? outpostId;

  /// List of instance pools requested in the capacity task.
  final List<InstanceTypeCapacity>? requestedInstancePools;

  GetCapacityTaskOutput({
    this.capacityTaskId,
    this.capacityTaskStatus,
    this.completionDate,
    this.creationDate,
    this.dryRun,
    this.failed,
    this.lastModifiedDate,
    this.orderId,
    this.outpostId,
    this.requestedInstancePools,
  });

  factory GetCapacityTaskOutput.fromJson(Map<String, dynamic> json) {
    return GetCapacityTaskOutput(
      capacityTaskId: json['CapacityTaskId'] as String?,
      capacityTaskStatus: (json['CapacityTaskStatus'] as String?)
          ?.let(CapacityTaskStatus.fromString),
      completionDate: timeStampFromJson(json['CompletionDate']),
      creationDate: timeStampFromJson(json['CreationDate']),
      dryRun: json['DryRun'] as bool?,
      failed: json['Failed'] != null
          ? CapacityTaskFailure.fromJson(json['Failed'] as Map<String, dynamic>)
          : null,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      orderId: json['OrderId'] as String?,
      outpostId: json['OutpostId'] as String?,
      requestedInstancePools: (json['RequestedInstancePools'] as List?)
          ?.nonNulls
          .map((e) => InstanceTypeCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityTaskId = this.capacityTaskId;
    final capacityTaskStatus = this.capacityTaskStatus;
    final completionDate = this.completionDate;
    final creationDate = this.creationDate;
    final dryRun = this.dryRun;
    final failed = this.failed;
    final lastModifiedDate = this.lastModifiedDate;
    final orderId = this.orderId;
    final outpostId = this.outpostId;
    final requestedInstancePools = this.requestedInstancePools;
    return {
      if (capacityTaskId != null) 'CapacityTaskId': capacityTaskId,
      if (capacityTaskStatus != null)
        'CapacityTaskStatus': capacityTaskStatus.value,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (dryRun != null) 'DryRun': dryRun,
      if (failed != null) 'Failed': failed,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (orderId != null) 'OrderId': orderId,
      if (outpostId != null) 'OutpostId': outpostId,
      if (requestedInstancePools != null)
        'RequestedInstancePools': requestedInstancePools,
    };
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

class GetConnectionResponse {
  /// Information about the connection.
  final ConnectionDetails? connectionDetails;

  /// The ID of the connection.
  final String? connectionId;

  GetConnectionResponse({
    this.connectionDetails,
    this.connectionId,
  });

  factory GetConnectionResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectionResponse(
      connectionDetails: json['ConnectionDetails'] != null
          ? ConnectionDetails.fromJson(
              json['ConnectionDetails'] as Map<String, dynamic>)
          : null,
      connectionId: json['ConnectionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionDetails = this.connectionDetails;
    final connectionId = this.connectionId;
    return {
      if (connectionDetails != null) 'ConnectionDetails': connectionDetails,
      if (connectionId != null) 'ConnectionId': connectionId,
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
          ?.nonNulls
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

class GetOutpostSupportedInstanceTypesOutput {
  final List<InstanceTypeItem>? instanceTypes;
  final String? nextToken;

  GetOutpostSupportedInstanceTypesOutput({
    this.instanceTypes,
    this.nextToken,
  });

  factory GetOutpostSupportedInstanceTypesOutput.fromJson(
      Map<String, dynamic> json) {
    return GetOutpostSupportedInstanceTypesOutput(
      instanceTypes: (json['InstanceTypes'] as List?)
          ?.nonNulls
          .map((e) => InstanceTypeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceTypes = this.instanceTypes;
    final nextToken = this.nextToken;
    return {
      if (instanceTypes != null) 'InstanceTypes': instanceTypes,
      if (nextToken != null) 'NextToken': nextToken,
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
      addressType:
          (json['AddressType'] as String?)?.let(AddressType.fromString),
      siteId: json['SiteId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final addressType = this.addressType;
    final siteId = this.siteId;
    return {
      if (address != null) 'Address': address,
      if (addressType != null) 'AddressType': addressType.value,
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

/// The instance type that you specify determines the combination of CPU,
/// memory, storage, and networking capacity.
class InstanceTypeCapacity {
  /// The number of instances for the specified instance type.
  final int count;

  /// The instance type of the hosts.
  final String instanceType;

  InstanceTypeCapacity({
    required this.count,
    required this.instanceType,
  });

  factory InstanceTypeCapacity.fromJson(Map<String, dynamic> json) {
    return InstanceTypeCapacity(
      count: json['Count'] as int,
      instanceType: json['InstanceType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final instanceType = this.instanceType;
    return {
      'Count': count,
      'InstanceType': instanceType,
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
  /// Information about assets.
  final List<LineItemAssetInformation>? assetInformationList;

  /// The ID of the catalog item.
  final String? catalogItemId;

  /// The ID of the line item.
  final String? lineItemId;

  /// The ID of the previous line item.
  final String? previousLineItemId;

  /// The ID of the previous order.
  final String? previousOrderId;

  /// The quantity of the line item.
  final int? quantity;

  /// Information about a line item shipment.
  final ShipmentInformation? shipmentInformation;

  /// The status of the line item.
  final LineItemStatus? status;

  LineItem({
    this.assetInformationList,
    this.catalogItemId,
    this.lineItemId,
    this.previousLineItemId,
    this.previousOrderId,
    this.quantity,
    this.shipmentInformation,
    this.status,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) {
    return LineItem(
      assetInformationList: (json['AssetInformationList'] as List?)
          ?.nonNulls
          .map((e) =>
              LineItemAssetInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      catalogItemId: json['CatalogItemId'] as String?,
      lineItemId: json['LineItemId'] as String?,
      previousLineItemId: json['PreviousLineItemId'] as String?,
      previousOrderId: json['PreviousOrderId'] as String?,
      quantity: json['Quantity'] as int?,
      shipmentInformation: json['ShipmentInformation'] != null
          ? ShipmentInformation.fromJson(
              json['ShipmentInformation'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(LineItemStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final assetInformationList = this.assetInformationList;
    final catalogItemId = this.catalogItemId;
    final lineItemId = this.lineItemId;
    final previousLineItemId = this.previousLineItemId;
    final previousOrderId = this.previousOrderId;
    final quantity = this.quantity;
    final shipmentInformation = this.shipmentInformation;
    final status = this.status;
    return {
      if (assetInformationList != null)
        'AssetInformationList': assetInformationList,
      if (catalogItemId != null) 'CatalogItemId': catalogItemId,
      if (lineItemId != null) 'LineItemId': lineItemId,
      if (previousLineItemId != null) 'PreviousLineItemId': previousLineItemId,
      if (previousOrderId != null) 'PreviousOrderId': previousOrderId,
      if (quantity != null) 'Quantity': quantity,
      if (shipmentInformation != null)
        'ShipmentInformation': shipmentInformation,
      if (status != null) 'Status': status.value,
    };
  }
}

/// Information about a line item asset.
class LineItemAssetInformation {
  /// The ID of the asset.
  final String? assetId;

  /// The MAC addresses of the asset.
  final List<String>? macAddressList;

  LineItemAssetInformation({
    this.assetId,
    this.macAddressList,
  });

  factory LineItemAssetInformation.fromJson(Map<String, dynamic> json) {
    return LineItemAssetInformation(
      assetId: json['AssetId'] as String?,
      macAddressList: (json['MacAddressList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final assetId = this.assetId;
    final macAddressList = this.macAddressList;
    return {
      if (assetId != null) 'AssetId': assetId,
      if (macAddressList != null) 'MacAddressList': macAddressList,
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
  preparing('PREPARING'),
  building('BUILDING'),
  shipped('SHIPPED'),
  delivered('DELIVERED'),
  installing('INSTALLING'),
  installed('INSTALLED'),
  error('ERROR'),
  cancelled('CANCELLED'),
  replaced('REPLACED'),
  ;

  final String value;

  const LineItemStatus(this.value);

  static LineItemStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LineItemStatus'));
}

class ListAssetsOutput {
  /// Information about the hardware assets.
  final List<AssetInfo>? assets;
  final String? nextToken;

  ListAssetsOutput({
    this.assets,
    this.nextToken,
  });

  factory ListAssetsOutput.fromJson(Map<String, dynamic> json) {
    return ListAssetsOutput(
      assets: (json['Assets'] as List?)
          ?.nonNulls
          .map((e) => AssetInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assets = this.assets;
    final nextToken = this.nextToken;
    return {
      if (assets != null) 'Assets': assets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCapacityTasksOutput {
  /// Lists all the capacity tasks.
  final List<CapacityTaskSummary>? capacityTasks;
  final String? nextToken;

  ListCapacityTasksOutput({
    this.capacityTasks,
    this.nextToken,
  });

  factory ListCapacityTasksOutput.fromJson(Map<String, dynamic> json) {
    return ListCapacityTasksOutput(
      capacityTasks: (json['CapacityTasks'] as List?)
          ?.nonNulls
          .map((e) => CapacityTaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capacityTasks = this.capacityTasks;
    final nextToken = this.nextToken;
    return {
      if (capacityTasks != null) 'CapacityTasks': capacityTasks,
      if (nextToken != null) 'NextToken': nextToken,
    };
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
  noLimit('NO_LIMIT'),
  max_1400Lbs('MAX_1400_LBS'),
  max_1600Lbs('MAX_1600_LBS'),
  max_1800Lbs('MAX_1800_LBS'),
  max_2000Lbs('MAX_2000_LBS'),
  ;

  final String value;

  const MaximumSupportedWeightLbs(this.value);

  static MaximumSupportedWeightLbs fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum MaximumSupportedWeightLbs'));
}

enum OpticalStandard {
  optic_10gbaseSr('OPTIC_10GBASE_SR'),
  optic_10gbaseIr('OPTIC_10GBASE_IR'),
  optic_10gbaseLr('OPTIC_10GBASE_LR'),
  optic_40gbaseSr('OPTIC_40GBASE_SR'),
  optic_40gbaseEsr('OPTIC_40GBASE_ESR'),
  optic_40gbaseIr4Lr4l('OPTIC_40GBASE_IR4_LR4L'),
  optic_40gbaseLr4('OPTIC_40GBASE_LR4'),
  optic_100gbaseSr4('OPTIC_100GBASE_SR4'),
  optic_100gbaseCwdm4('OPTIC_100GBASE_CWDM4'),
  optic_100gbaseLr4('OPTIC_100GBASE_LR4'),
  optic_100gPsm4Msa('OPTIC_100G_PSM4_MSA'),
  optic_1000baseLx('OPTIC_1000BASE_LX'),
  optic_1000baseSx('OPTIC_1000BASE_SX'),
  ;

  final String value;

  const OpticalStandard(this.value);

  static OpticalStandard fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OpticalStandard'));
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

  /// The type of order.
  final OrderType? orderType;

  /// The ID of the Outpost in the order.
  final String? outpostId;

  /// The payment option for the order.
  final PaymentOption? paymentOption;

  /// The payment term.
  final PaymentTerm? paymentTerm;

  /// The status of the order.
  ///
  /// <ul>
  /// <li>
  /// <code>PREPARING</code> - Order is received and being prepared.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - Order is either being built, shipped, or
  /// installed. To get more details, see the line item status.
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
    this.orderType,
    this.outpostId,
    this.paymentOption,
    this.paymentTerm,
    this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      lineItems: (json['LineItems'] as List?)
          ?.nonNulls
          .map((e) => LineItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderFulfilledDate: timeStampFromJson(json['OrderFulfilledDate']),
      orderId: json['OrderId'] as String?,
      orderSubmissionDate: timeStampFromJson(json['OrderSubmissionDate']),
      orderType: (json['OrderType'] as String?)?.let(OrderType.fromString),
      outpostId: json['OutpostId'] as String?,
      paymentOption:
          (json['PaymentOption'] as String?)?.let(PaymentOption.fromString),
      paymentTerm:
          (json['PaymentTerm'] as String?)?.let(PaymentTerm.fromString),
      status: (json['Status'] as String?)?.let(OrderStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final lineItems = this.lineItems;
    final orderFulfilledDate = this.orderFulfilledDate;
    final orderId = this.orderId;
    final orderSubmissionDate = this.orderSubmissionDate;
    final orderType = this.orderType;
    final outpostId = this.outpostId;
    final paymentOption = this.paymentOption;
    final paymentTerm = this.paymentTerm;
    final status = this.status;
    return {
      if (lineItems != null) 'LineItems': lineItems,
      if (orderFulfilledDate != null)
        'OrderFulfilledDate': unixTimestampToJson(orderFulfilledDate),
      if (orderId != null) 'OrderId': orderId,
      if (orderSubmissionDate != null)
        'OrderSubmissionDate': unixTimestampToJson(orderSubmissionDate),
      if (orderType != null) 'OrderType': orderType.value,
      if (outpostId != null) 'OutpostId': outpostId,
      if (paymentOption != null) 'PaymentOption': paymentOption.value,
      if (paymentTerm != null) 'PaymentTerm': paymentTerm.value,
      if (status != null) 'Status': status.value,
    };
  }
}

enum OrderStatus {
  received('RECEIVED'),
  pending('PENDING'),
  processing('PROCESSING'),
  installing('INSTALLING'),
  fulfilled('FULFILLED'),
  cancelled('CANCELLED'),
  preparing('PREPARING'),
  inProgress('IN_PROGRESS'),
  completed('COMPLETED'),
  error('ERROR'),
  ;

  final String value;

  const OrderStatus(this.value);

  static OrderStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum OrderStatus'));
}

/// A summary of line items in your order.
class OrderSummary {
  /// The status of all line items in the order.
  final Map<LineItemStatus, int>? lineItemCountsByStatus;

  /// The fulfilment date for the order.
  final DateTime? orderFulfilledDate;

  /// The ID of the order.
  final String? orderId;

  /// The submission date for the order.
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
              ?.map((k, e) => MapEntry(LineItemStatus.fromString(k), e as int)),
      orderFulfilledDate: timeStampFromJson(json['OrderFulfilledDate']),
      orderId: json['OrderId'] as String?,
      orderSubmissionDate: timeStampFromJson(json['OrderSubmissionDate']),
      orderType: (json['OrderType'] as String?)?.let(OrderType.fromString),
      outpostId: json['OutpostId'] as String?,
      status: (json['Status'] as String?)?.let(OrderStatus.fromString),
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
            lineItemCountsByStatus.map((k, e) => MapEntry(k.value, e)),
      if (orderFulfilledDate != null)
        'OrderFulfilledDate': unixTimestampToJson(orderFulfilledDate),
      if (orderId != null) 'OrderId': orderId,
      if (orderSubmissionDate != null)
        'OrderSubmissionDate': unixTimestampToJson(orderSubmissionDate),
      if (orderType != null) 'OrderType': orderType.value,
      if (outpostId != null) 'OutpostId': outpostId,
      if (status != null) 'Status': status.value,
    };
  }
}

enum OrderType {
  outpost('OUTPOST'),
  replacement('REPLACEMENT'),
  ;

  final String value;

  const OrderType(this.value);

  static OrderType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum OrderType'));
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
      supportedHardwareType: (json['SupportedHardwareType'] as String?)
          ?.let(SupportedHardwareType.fromString),
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
        'SupportedHardwareType': supportedHardwareType.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum PaymentOption {
  allUpfront('ALL_UPFRONT'),
  noUpfront('NO_UPFRONT'),
  partialUpfront('PARTIAL_UPFRONT'),
  ;

  final String value;

  const PaymentOption(this.value);

  static PaymentOption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PaymentOption'));
}

enum PaymentTerm {
  threeYears('THREE_YEARS'),
  oneYear('ONE_YEAR'),
  ;

  final String value;

  const PaymentTerm(this.value);

  static PaymentTerm fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PaymentTerm'));
}

enum PowerConnector {
  l6_30p('L6_30P'),
  iec309('IEC309'),
  ah530p7w('AH530P7W'),
  ah532p6w('AH532P6W'),
  ;

  final String value;

  const PowerConnector(this.value);

  static PowerConnector fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PowerConnector'));
}

enum PowerDrawKva {
  power_5Kva('POWER_5_KVA'),
  power_10Kva('POWER_10_KVA'),
  power_15Kva('POWER_15_KVA'),
  power_30Kva('POWER_30_KVA'),
  ;

  final String value;

  const PowerDrawKva(this.value);

  static PowerDrawKva fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PowerDrawKva'));
}

enum PowerFeedDrop {
  aboveRack('ABOVE_RACK'),
  belowRack('BELOW_RACK'),
  ;

  final String value;

  const PowerFeedDrop(this.value);

  static PowerFeedDrop fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum PowerFeedDrop'));
}

enum PowerPhase {
  singlePhase('SINGLE_PHASE'),
  threePhase('THREE_PHASE'),
  ;

  final String value;

  const PowerPhase(this.value);

  static PowerPhase fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum PowerPhase'));
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
      fiberOpticCableType: (json['FiberOpticCableType'] as String?)
          ?.let(FiberOpticCableType.fromString),
      maximumSupportedWeightLbs: (json['MaximumSupportedWeightLbs'] as String?)
          ?.let(MaximumSupportedWeightLbs.fromString),
      opticalStandard:
          (json['OpticalStandard'] as String?)?.let(OpticalStandard.fromString),
      powerConnector:
          (json['PowerConnector'] as String?)?.let(PowerConnector.fromString),
      powerDrawKva:
          (json['PowerDrawKva'] as String?)?.let(PowerDrawKva.fromString),
      powerFeedDrop:
          (json['PowerFeedDrop'] as String?)?.let(PowerFeedDrop.fromString),
      powerPhase: (json['PowerPhase'] as String?)?.let(PowerPhase.fromString),
      uplinkCount:
          (json['UplinkCount'] as String?)?.let(UplinkCount.fromString),
      uplinkGbps: (json['UplinkGbps'] as String?)?.let(UplinkGbps.fromString),
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
        'FiberOpticCableType': fiberOpticCableType.value,
      if (maximumSupportedWeightLbs != null)
        'MaximumSupportedWeightLbs': maximumSupportedWeightLbs.value,
      if (opticalStandard != null) 'OpticalStandard': opticalStandard.value,
      if (powerConnector != null) 'PowerConnector': powerConnector.value,
      if (powerDrawKva != null) 'PowerDrawKva': powerDrawKva.value,
      if (powerFeedDrop != null) 'PowerFeedDrop': powerFeedDrop.value,
      if (powerPhase != null) 'PowerPhase': powerPhase.value,
      if (uplinkCount != null) 'UplinkCount': uplinkCount.value,
      if (uplinkGbps != null) 'UplinkGbps': uplinkGbps.value,
    };
  }
}

enum ShipmentCarrier {
  dhl('DHL'),
  dbs('DBS'),
  fedex('FEDEX'),
  ups('UPS'),
  expeditors('EXPEDITORS'),
  ;

  final String value;

  const ShipmentCarrier(this.value);

  static ShipmentCarrier fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ShipmentCarrier'));
}

/// Information about a line item shipment.
class ShipmentInformation {
  /// The carrier of the shipment.
  final ShipmentCarrier? shipmentCarrier;

  /// The tracking number of the shipment.
  final String? shipmentTrackingNumber;

  ShipmentInformation({
    this.shipmentCarrier,
    this.shipmentTrackingNumber,
  });

  factory ShipmentInformation.fromJson(Map<String, dynamic> json) {
    return ShipmentInformation(
      shipmentCarrier:
          (json['ShipmentCarrier'] as String?)?.let(ShipmentCarrier.fromString),
      shipmentTrackingNumber: json['ShipmentTrackingNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shipmentCarrier = this.shipmentCarrier;
    final shipmentTrackingNumber = this.shipmentTrackingNumber;
    return {
      if (shipmentCarrier != null) 'ShipmentCarrier': shipmentCarrier.value,
      if (shipmentTrackingNumber != null)
        'ShipmentTrackingNumber': shipmentTrackingNumber,
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

class StartCapacityTaskOutput {
  /// ID of the capacity task that you want to start.
  final String? capacityTaskId;

  /// Status of the specified capacity task.
  final CapacityTaskStatus? capacityTaskStatus;

  /// Date that the specified capacity task ran successfully.
  final DateTime? completionDate;

  /// Date that the specified capacity task was created.
  final DateTime? creationDate;

  /// Results of the dry run showing if the specified capacity task is above or
  /// below the available instance capacity.
  final bool? dryRun;

  /// Reason that the specified capacity task failed.
  final CapacityTaskFailure? failed;

  /// Date that the specified capacity task was last modified.
  final DateTime? lastModifiedDate;

  /// ID of the Amazon Web Services Outposts order of the host associated with the
  /// capacity task.
  final String? orderId;

  /// ID of the Outpost associated with the capacity task.
  final String? outpostId;

  /// List of the instance pools requested in the specified capacity task.
  final List<InstanceTypeCapacity>? requestedInstancePools;

  StartCapacityTaskOutput({
    this.capacityTaskId,
    this.capacityTaskStatus,
    this.completionDate,
    this.creationDate,
    this.dryRun,
    this.failed,
    this.lastModifiedDate,
    this.orderId,
    this.outpostId,
    this.requestedInstancePools,
  });

  factory StartCapacityTaskOutput.fromJson(Map<String, dynamic> json) {
    return StartCapacityTaskOutput(
      capacityTaskId: json['CapacityTaskId'] as String?,
      capacityTaskStatus: (json['CapacityTaskStatus'] as String?)
          ?.let(CapacityTaskStatus.fromString),
      completionDate: timeStampFromJson(json['CompletionDate']),
      creationDate: timeStampFromJson(json['CreationDate']),
      dryRun: json['DryRun'] as bool?,
      failed: json['Failed'] != null
          ? CapacityTaskFailure.fromJson(json['Failed'] as Map<String, dynamic>)
          : null,
      lastModifiedDate: timeStampFromJson(json['LastModifiedDate']),
      orderId: json['OrderId'] as String?,
      outpostId: json['OutpostId'] as String?,
      requestedInstancePools: (json['RequestedInstancePools'] as List?)
          ?.nonNulls
          .map((e) => InstanceTypeCapacity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityTaskId = this.capacityTaskId;
    final capacityTaskStatus = this.capacityTaskStatus;
    final completionDate = this.completionDate;
    final creationDate = this.creationDate;
    final dryRun = this.dryRun;
    final failed = this.failed;
    final lastModifiedDate = this.lastModifiedDate;
    final orderId = this.orderId;
    final outpostId = this.outpostId;
    final requestedInstancePools = this.requestedInstancePools;
    return {
      if (capacityTaskId != null) 'CapacityTaskId': capacityTaskId,
      if (capacityTaskStatus != null)
        'CapacityTaskStatus': capacityTaskStatus.value,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (dryRun != null) 'DryRun': dryRun,
      if (failed != null) 'Failed': failed,
      if (lastModifiedDate != null)
        'LastModifiedDate': unixTimestampToJson(lastModifiedDate),
      if (orderId != null) 'OrderId': orderId,
      if (outpostId != null) 'OutpostId': outpostId,
      if (requestedInstancePools != null)
        'RequestedInstancePools': requestedInstancePools,
    };
  }
}

class StartConnectionResponse {
  /// The ID of the connection.
  final String? connectionId;

  /// The underlay IP address.
  final String? underlayIpAddress;

  StartConnectionResponse({
    this.connectionId,
    this.underlayIpAddress,
  });

  factory StartConnectionResponse.fromJson(Map<String, dynamic> json) {
    return StartConnectionResponse(
      connectionId: json['ConnectionId'] as String?,
      underlayIpAddress: json['UnderlayIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionId = this.connectionId;
    final underlayIpAddress = this.underlayIpAddress;
    return {
      if (connectionId != null) 'ConnectionId': connectionId,
      if (underlayIpAddress != null) 'UnderlayIpAddress': underlayIpAddress,
    };
  }
}

enum SupportedHardwareType {
  rack('RACK'),
  server('SERVER'),
  ;

  final String value;

  const SupportedHardwareType(this.value);

  static SupportedHardwareType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SupportedHardwareType'));
}

enum SupportedStorageEnum {
  ebs('EBS'),
  s3('S3'),
  ;

  final String value;

  const SupportedStorageEnum(this.value);

  static SupportedStorageEnum fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SupportedStorageEnum'));
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
      addressType:
          (json['AddressType'] as String?)?.let(AddressType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final addressType = this.addressType;
    return {
      if (address != null) 'Address': address,
      if (addressType != null) 'AddressType': addressType.value,
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
  uplinkCount_1('UPLINK_COUNT_1'),
  uplinkCount_2('UPLINK_COUNT_2'),
  uplinkCount_3('UPLINK_COUNT_3'),
  uplinkCount_4('UPLINK_COUNT_4'),
  uplinkCount_5('UPLINK_COUNT_5'),
  uplinkCount_6('UPLINK_COUNT_6'),
  uplinkCount_7('UPLINK_COUNT_7'),
  uplinkCount_8('UPLINK_COUNT_8'),
  uplinkCount_12('UPLINK_COUNT_12'),
  uplinkCount_16('UPLINK_COUNT_16'),
  ;

  final String value;

  const UplinkCount(this.value);

  static UplinkCount fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum UplinkCount'));
}

enum UplinkGbps {
  uplink_1g('UPLINK_1G'),
  uplink_10g('UPLINK_10G'),
  uplink_40g('UPLINK_40G'),
  uplink_100g('UPLINK_100G'),
  ;

  final String value;

  const UplinkGbps(this.value);

  static UplinkGbps fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum UplinkGbps'));
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
