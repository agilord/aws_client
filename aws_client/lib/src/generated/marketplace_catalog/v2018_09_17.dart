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

/// Catalog API actions allow you to manage your entities through list,
/// describe, and update capabilities. An entity can be a product or an offer on
/// AWS Marketplace.
///
/// You can automate your entity update process by integrating the AWS
/// Marketplace Catalog API with your AWS Marketplace product build or
/// deployment pipelines. You can also create your own applications on top of
/// the Catalog API to manage your products on AWS Marketplace.
class MarketplaceCatalog {
  final _s.RestJsonProtocol _protocol;
  MarketplaceCatalog({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'catalog.marketplace',
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

  /// Returns metadata and content for multiple entities. This is the Batch
  /// version of the <code>DescribeEntity</code> API and uses the same IAM
  /// permission action as <code>DescribeEntity</code> API.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServiceException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [entityRequestList] :
  /// List of entity IDs and the catalogs the entities are present in.
  Future<BatchDescribeEntitiesResponse> batchDescribeEntities({
    required List<EntityRequest> entityRequestList,
  }) async {
    final $payload = <String, dynamic>{
      'EntityRequestList': entityRequestList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchDescribeEntities',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDescribeEntitiesResponse.fromJson(response);
  }

  /// Used to cancel an open change request. Must be sent before the status of
  /// the request changes to <code>APPLYING</code>, the final stage of
  /// completing your change request. You can describe a change during the
  /// 60-day request history retention period for API calls.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [catalog] :
  /// Required. The catalog related to the request. Fixed value:
  /// <code>AWSMarketplace</code>.
  ///
  /// Parameter [changeSetId] :
  /// Required. The unique identifier of the <code>StartChangeSet</code> request
  /// that you want to cancel.
  Future<CancelChangeSetResponse> cancelChangeSet({
    required String catalog,
    required String changeSetId,
  }) async {
    final $query = <String, List<String>>{
      'catalog': [catalog],
      'changeSetId': [changeSetId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri: '/CancelChangeSet',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CancelChangeSetResponse.fromJson(response);
  }

  /// Deletes a resource-based policy on an entity that is identified by its
  /// resource ARN.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the entity resource that is associated
  /// with the resource policy.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteResourcePolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Provides information about a given change set.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [catalog] :
  /// Required. The catalog related to the request. Fixed value:
  /// <code>AWSMarketplace</code>
  ///
  /// Parameter [changeSetId] :
  /// Required. The unique identifier for the <code>StartChangeSet</code>
  /// request that you want to describe the details for.
  Future<DescribeChangeSetResponse> describeChangeSet({
    required String catalog,
    required String changeSetId,
  }) async {
    final $query = <String, List<String>>{
      'catalog': [catalog],
      'changeSetId': [changeSetId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/DescribeChangeSet',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChangeSetResponse.fromJson(response);
  }

  /// Returns the metadata and content of the entity.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotSupportedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [catalog] :
  /// Required. The catalog related to the request. Fixed value:
  /// <code>AWSMarketplace</code>
  ///
  /// Parameter [entityId] :
  /// Required. The unique ID of the entity to describe.
  Future<DescribeEntityResponse> describeEntity({
    required String catalog,
    required String entityId,
  }) async {
    final $query = <String, List<String>>{
      'catalog': [catalog],
      'entityId': [entityId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/DescribeEntity',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEntityResponse.fromJson(response);
  }

  /// Gets a resource-based policy of an entity that is identified by its
  /// resource ARN.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the entity resource that is associated
  /// with the resource policy.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final $query = <String, List<String>>{
      'resourceArn': [resourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetResourcePolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Returns the list of change sets owned by the account being used to make
  /// the call. You can filter this list by providing any combination of
  /// <code>entityId</code>, <code>ChangeSetName</code>, and status. If you
  /// provide more than one filter, the API operation applies a logical AND
  /// between the filters.
  ///
  /// You can describe a change during the 60-day request history retention
  /// period for API calls.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [catalog] :
  /// The catalog related to the request. Fixed value:
  /// <code>AWSMarketplace</code>
  ///
  /// Parameter [filterList] :
  /// An array of filter objects.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by a single call. This value must
  /// be provided in the next call to retrieve the next set of results. By
  /// default, this value is 20.
  ///
  /// Parameter [nextToken] :
  /// The token value retrieved from a previous call to access the next page of
  /// results.
  ///
  /// Parameter [sort] :
  /// An object that contains two attributes, <code>SortBy</code> and
  /// <code>SortOrder</code>.
  Future<ListChangeSetsResponse> listChangeSets({
    required String catalog,
    List<Filter>? filterList,
    int? maxResults,
    String? nextToken,
    Sort? sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    final $payload = <String, dynamic>{
      'Catalog': catalog,
      if (filterList != null) 'FilterList': filterList,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (sort != null) 'Sort': sort,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListChangeSets',
      exceptionFnMap: _exceptionFns,
    );
    return ListChangeSetsResponse.fromJson(response);
  }

  /// Provides the list of entities of a given type.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [catalog] :
  /// The catalog related to the request. Fixed value:
  /// <code>AWSMarketplace</code>
  ///
  /// Parameter [entityType] :
  /// The type of entities to retrieve. Valid values are:
  /// <code>AmiProduct</code>, <code>ContainerProduct</code>,
  /// <code>DataProduct</code>, <code>SaaSProduct</code>,
  /// <code>ProcurementPolicy</code>, <code>Experience</code>,
  /// <code>Audience</code>, <code>BrandingSettings</code>, <code>Offer</code>,
  /// <code>Seller</code>, <code>ResaleAuthorization</code>.
  ///
  /// Parameter [entityTypeFilters] :
  /// A Union object containing filter shapes for all <code>EntityType</code>s.
  /// Each <code>EntityTypeFilter</code> shape will have filters applicable for
  /// that <code>EntityType</code> that can be used to search or filter
  /// entities.
  ///
  /// Parameter [entityTypeSort] :
  /// A Union object containing <code>Sort</code> shapes for all
  /// <code>EntityType</code>s. Each <code>EntityTypeSort</code> shape will have
  /// <code>SortBy</code> and <code>SortOrder</code> applicable for fields on
  /// that <code>EntityType</code>. This can be used to sort the results of the
  /// filter query.
  ///
  /// Parameter [filterList] :
  /// An array of filter objects. Each filter object contains two attributes,
  /// <code>filterName</code> and <code>filterValues</code>.
  ///
  /// Parameter [maxResults] :
  /// Specifies the upper limit of the elements on a single page. If a value
  /// isn't provided, the default value is 20.
  ///
  /// Parameter [nextToken] :
  /// The value of the next token, if it exists. Null if there are no more
  /// results.
  ///
  /// Parameter [ownershipType] :
  /// Filters the returned set of entities based on their owner. The default is
  /// <code>SELF</code>. To list entities shared with you through AWS Resource
  /// Access Manager (AWS RAM), set to <code>SHARED</code>. Entities shared
  /// through the AWS Marketplace Catalog API <code>PutResourcePolicy</code>
  /// operation can't be discovered through the <code>SHARED</code> parameter.
  ///
  /// Parameter [sort] :
  /// An object that contains two attributes, <code>SortBy</code> and
  /// <code>SortOrder</code>.
  Future<ListEntitiesResponse> listEntities({
    required String catalog,
    required String entityType,
    EntityTypeFilters? entityTypeFilters,
    EntityTypeSort? entityTypeSort,
    List<Filter>? filterList,
    int? maxResults,
    String? nextToken,
    OwnershipType? ownershipType,
    Sort? sort,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'Catalog': catalog,
      'EntityType': entityType,
      if (entityTypeFilters != null) 'EntityTypeFilters': entityTypeFilters,
      if (entityTypeSort != null) 'EntityTypeSort': entityTypeSort,
      if (filterList != null) 'FilterList': filterList,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (ownershipType != null) 'OwnershipType': ownershipType.value,
      if (sort != null) 'Sort': sort,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListEntities',
      exceptionFnMap: _exceptionFns,
    );
    return ListEntitiesResponse.fromJson(response);
  }

  /// Lists all tags that have been added to a resource (either an <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#catalog-api-entities">entity</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#working-with-change-sets">change
  /// set</a>).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// Required. The Amazon Resource Name (ARN) associated with the resource you
  /// want to list tags on.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Attaches a resource-based policy to an entity. Examples of an entity
  /// include: <code>AmiProduct</code> and <code>ContainerProduct</code>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [policy] :
  /// The policy document to set; formatted in JSON.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the entity resource you want to
  /// associate with a resource policy.
  Future<void> putResourcePolicy({
    required String policy,
    required String resourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
      'ResourceArn': resourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutResourcePolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Allows you to request changes for your entities. Within a single
  /// <code>ChangeSet</code>, you can't start the same change type against the
  /// same entity multiple times. Additionally, when a <code>ChangeSet</code> is
  /// running, all the entities targeted by the different changes are locked
  /// until the change set has completed (either succeeded, cancelled, or
  /// failed). If you try to start a change set containing a change against an
  /// entity that is already locked, you will receive a
  /// <code>ResourceInUseException</code> error.
  ///
  /// For example, you can't start the <code>ChangeSet</code> described in the
  /// <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_StartChangeSet.html#API_StartChangeSet_Examples">example</a>
  /// later in this topic because it contains two changes to run the same change
  /// type (<code>AddRevisions</code>) against the same entity
  /// (<code>entity-id@1</code>).
  ///
  /// For more information about working with change sets, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#working-with-change-sets">
  /// Working with change sets</a>. For information about change types for
  /// single-AMI products, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/ami-products.html#working-with-single-AMI-products">Working
  /// with single-AMI products</a>. Also, for more information about change
  /// types available for container-based products, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/container-products.html#working-with-container-products">Working
  /// with container products</a>.
  ///
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [catalog] :
  /// The catalog related to the request. Fixed value:
  /// <code>AWSMarketplace</code>
  ///
  /// Parameter [changeSet] :
  /// Array of <code>change</code> object.
  ///
  /// Parameter [changeSetName] :
  /// Optional case sensitive string of up to 100 ASCII characters. The change
  /// set name can be used to filter the list of change sets.
  ///
  /// Parameter [changeSetTags] :
  /// A list of objects specifying each key name and value for the
  /// <code>ChangeSetTags</code> property.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique token to identify the request to ensure idempotency.
  ///
  /// Parameter [intent] :
  /// The intent related to the request. The default is <code>APPLY</code>. To
  /// test your request before applying changes to your entities, use
  /// <code>VALIDATE</code>. This feature is currently available for adding
  /// versions to single-AMI products. For more information, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/ami-products.html#ami-add-version">Add
  /// a new version</a>.
  Future<StartChangeSetResponse> startChangeSet({
    required String catalog,
    required List<Change> changeSet,
    String? changeSetName,
    List<Tag>? changeSetTags,
    String? clientRequestToken,
    Intent? intent,
  }) async {
    final $payload = <String, dynamic>{
      'Catalog': catalog,
      'ChangeSet': changeSet,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (changeSetTags != null) 'ChangeSetTags': changeSetTags,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (intent != null) 'Intent': intent.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartChangeSet',
      exceptionFnMap: _exceptionFns,
    );
    return StartChangeSetResponse.fromJson(response);
  }

  /// Tags a resource (either an <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#catalog-api-entities">entity</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#working-with-change-sets">change
  /// set</a>).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// Required. The Amazon Resource Name (ARN) associated with the resource you
  /// want to tag.
  ///
  /// Parameter [tags] :
  /// Required. A list of objects specifying each key name and value. Number of
  /// objects allowed: 1-50.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag or list of tags from a resource (either an <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#catalog-api-entities">entity</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#working-with-change-sets">change
  /// set</a>).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// Required. The Amazon Resource Name (ARN) associated with the resource you
  /// want to remove the tag from.
  ///
  /// Parameter [tagKeys] :
  /// Required. A list of key names of tags to be removed. Number of strings
  /// allowed: 0-256.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UntagResource',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Object that allows filtering on entity id of an AMI product.
class AmiProductEntityIdFilter {
  /// A string array of unique entity id values to be filtered on.
  final List<String>? valueList;

  AmiProductEntityIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Object containing all the filter fields for AMI products. Client can add
/// only one wildcard filter and a maximum of 8 filters in a single
/// <code>ListEntities</code> request.
class AmiProductFilters {
  /// Unique identifier for the AMI product.
  final AmiProductEntityIdFilter? entityId;

  /// The last date on which the AMI product was modified.
  final AmiProductLastModifiedDateFilter? lastModifiedDate;

  /// The title of the AMI product.
  final AmiProductTitleFilter? productTitle;

  /// The visibility of the AMI product.
  final AmiProductVisibilityFilter? visibility;

  AmiProductFilters({
    this.entityId,
    this.lastModifiedDate,
    this.productTitle,
    this.visibility,
  });

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final lastModifiedDate = this.lastModifiedDate;
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (entityId != null) 'EntityId': entityId,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility,
    };
  }
}

/// Object that allows filtering based on the last modified date of AMI
/// products.
class AmiProductLastModifiedDateFilter {
  /// Dates between which the AMI product was last modified.
  final AmiProductLastModifiedDateFilterDateRange? dateRange;

  AmiProductLastModifiedDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Object that contains date range of the last modified date to be filtered on.
/// You can optionally provide a <code>BeforeValue</code> and/or
/// <code>AfterValue</code>. Both are inclusive.
class AmiProductLastModifiedDateFilterDateRange {
  /// Date after which the AMI product was last modified.
  final String? afterValue;

  /// Date before which the AMI product was last modified.
  final String? beforeValue;

  AmiProductLastModifiedDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Objects that allows sorting on AMI products based on certain fields and
/// sorting order.
class AmiProductSort {
  /// Field to sort the AMI products by.
  final AmiProductSortBy? sortBy;

  /// The sorting order. Can be <code>ASCENDING</code> or <code>DESCENDING</code>.
  /// The default value is <code>DESCENDING</code>.
  final SortOrder? sortOrder;

  AmiProductSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

enum AmiProductSortBy {
  entityId('EntityId'),
  lastModifiedDate('LastModifiedDate'),
  productTitle('ProductTitle'),
  visibility('Visibility'),
  ;

  final String value;

  const AmiProductSortBy(this.value);

  static AmiProductSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AmiProductSortBy'));
}

/// Object that contains summarized information about an AMI product.
class AmiProductSummary {
  /// The title of the AMI product.
  final String? productTitle;

  /// The lifecycle of the AMI product.
  final AmiProductVisibilityString? visibility;

  AmiProductSummary({
    this.productTitle,
    this.visibility,
  });

  factory AmiProductSummary.fromJson(Map<String, dynamic> json) {
    return AmiProductSummary(
      productTitle: json['ProductTitle'] as String?,
      visibility: (json['Visibility'] as String?)
          ?.let(AmiProductVisibilityString.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// Object that allows filtering on product title.
class AmiProductTitleFilter {
  /// A string array of unique product title values to be filtered on.
  final List<String>? valueList;

  /// A string that will be the <code>wildCard</code> input for product tile
  /// filter. It matches the provided value as a substring in the actual value.
  final String? wildCardValue;

  AmiProductTitleFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Object that allows filtering on the visibility of the product in the AWS
/// Marketplace.
class AmiProductVisibilityFilter {
  /// A string array of unique visibility values to be filtered on.
  final List<AmiProductVisibilityString>? valueList;

  AmiProductVisibilityFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null)
        'ValueList': valueList.map((e) => e.value).toList(),
    };
  }
}

enum AmiProductVisibilityString {
  limited('Limited'),
  public('Public'),
  restricted('Restricted'),
  draft('Draft'),
  ;

  final String value;

  const AmiProductVisibilityString(this.value);

  static AmiProductVisibilityString fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum AmiProductVisibilityString'));
}

class BatchDescribeEntitiesResponse {
  /// Details about each entity.
  final Map<String, EntityDetail>? entityDetails;

  /// A map of errors returned, with <code>EntityId</code> as the key and
  /// <code>errorDetail</code> as the value.
  final Map<String, BatchDescribeErrorDetail>? errors;

  BatchDescribeEntitiesResponse({
    this.entityDetails,
    this.errors,
  });

  factory BatchDescribeEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return BatchDescribeEntitiesResponse(
      entityDetails: (json['EntityDetails'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, EntityDetail.fromJson(e as Map<String, dynamic>))),
      errors: (json['Errors'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k, BatchDescribeErrorDetail.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final entityDetails = this.entityDetails;
    final errors = this.errors;
    return {
      if (entityDetails != null) 'EntityDetails': entityDetails,
      if (errors != null) 'Errors': errors,
    };
  }
}

/// An object that contains an error code and error message.
class BatchDescribeErrorDetail {
  /// The error code returned.
  final String? errorCode;

  /// The error message returned.
  final String? errorMessage;

  BatchDescribeErrorDetail({
    this.errorCode,
    this.errorMessage,
  });

  factory BatchDescribeErrorDetail.fromJson(Map<String, dynamic> json) {
    return BatchDescribeErrorDetail(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

class CancelChangeSetResponse {
  /// The ARN associated with the change set referenced in this request.
  final String? changeSetArn;

  /// The unique identifier for the change set referenced in this request.
  final String? changeSetId;

  CancelChangeSetResponse({
    this.changeSetArn,
    this.changeSetId,
  });

  factory CancelChangeSetResponse.fromJson(Map<String, dynamic> json) {
    return CancelChangeSetResponse(
      changeSetArn: json['ChangeSetArn'] as String?,
      changeSetId: json['ChangeSetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeSetArn = this.changeSetArn;
    final changeSetId = this.changeSetId;
    return {
      if (changeSetArn != null) 'ChangeSetArn': changeSetArn,
      if (changeSetId != null) 'ChangeSetId': changeSetId,
    };
  }
}

/// An object that contains the <code>ChangeType</code>, <code>Details</code>,
/// and <code>Entity</code>.
class Change {
  /// Change types are single string values that describe your intention for the
  /// change. Each change type is unique for each <code>EntityType</code> provided
  /// in the change's scope. For more information about change types available for
  /// single-AMI products, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/ami-products.html#working-with-single-AMI-products">Working
  /// with single-AMI products</a>. Also, for more information about change types
  /// available for container-based products, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/container-products.html#working-with-container-products">Working
  /// with container products</a>.
  final String changeType;

  /// The entity to be changed.
  final Entity entity;

  /// Optional name for the change.
  final String? changeName;

  /// This object contains details specific to the change type of the requested
  /// change. For more information about change types available for single-AMI
  /// products, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/ami-products.html#working-with-single-AMI-products">Working
  /// with single-AMI products</a>. Also, for more information about change types
  /// available for container-based products, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/container-products.html#working-with-container-products">Working
  /// with container products</a>.
  final String? details;

  /// Alternative field that accepts a JSON value instead of a string for
  /// <code>ChangeType</code> details. You can use either <code>Details</code> or
  /// <code>DetailsDocument</code>, but not both.
  final JsonDocumentType? detailsDocument;

  /// The tags associated with the change.
  final List<Tag>? entityTags;

  Change({
    required this.changeType,
    required this.entity,
    this.changeName,
    this.details,
    this.detailsDocument,
    this.entityTags,
  });

  Map<String, dynamic> toJson() {
    final changeType = this.changeType;
    final entity = this.entity;
    final changeName = this.changeName;
    final details = this.details;
    final detailsDocument = this.detailsDocument;
    final entityTags = this.entityTags;
    return {
      'ChangeType': changeType,
      'Entity': entity,
      if (changeName != null) 'ChangeName': changeName,
      if (details != null) 'Details': details,
      if (detailsDocument != null) 'DetailsDocument': detailsDocument,
      if (entityTags != null) 'EntityTags': entityTags,
    };
  }
}

/// A summary of a change set returned in a list of change sets when the
/// <code>ListChangeSets</code> action is called.
class ChangeSetSummaryListItem {
  /// The ARN associated with the unique identifier for the change set referenced
  /// in this request.
  final String? changeSetArn;

  /// The unique identifier for a change set.
  final String? changeSetId;

  /// The non-unique name for the change set.
  final String? changeSetName;

  /// The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was
  /// finished.
  final String? endTime;

  /// This object is a list of entity IDs (string) that are a part of a change
  /// set. The entity ID list is a maximum of 20 entities. It must contain at
  /// least one entity.
  final List<String>? entityIdList;

  /// Returned if the change set is in <code>FAILED</code> status. Can be either
  /// <code>CLIENT_ERROR</code>, which means that there are issues with the
  /// request (see the <code>ErrorDetailList</code> of
  /// <code>DescribeChangeSet</code>), or <code>SERVER_FAULT</code>, which means
  /// that there is a problem in the system, and you should retry your request.
  final FailureCode? failureCode;

  /// The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was
  /// started.
  final String? startTime;

  /// The current status of the change set.
  final ChangeStatus? status;

  ChangeSetSummaryListItem({
    this.changeSetArn,
    this.changeSetId,
    this.changeSetName,
    this.endTime,
    this.entityIdList,
    this.failureCode,
    this.startTime,
    this.status,
  });

  factory ChangeSetSummaryListItem.fromJson(Map<String, dynamic> json) {
    return ChangeSetSummaryListItem(
      changeSetArn: json['ChangeSetArn'] as String?,
      changeSetId: json['ChangeSetId'] as String?,
      changeSetName: json['ChangeSetName'] as String?,
      endTime: json['EndTime'] as String?,
      entityIdList: (json['EntityIdList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      failureCode:
          (json['FailureCode'] as String?)?.let(FailureCode.fromString),
      startTime: json['StartTime'] as String?,
      status: (json['Status'] as String?)?.let(ChangeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final changeSetArn = this.changeSetArn;
    final changeSetId = this.changeSetId;
    final changeSetName = this.changeSetName;
    final endTime = this.endTime;
    final entityIdList = this.entityIdList;
    final failureCode = this.failureCode;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (changeSetArn != null) 'ChangeSetArn': changeSetArn,
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (endTime != null) 'EndTime': endTime,
      if (entityIdList != null) 'EntityIdList': entityIdList,
      if (failureCode != null) 'FailureCode': failureCode.value,
      if (startTime != null) 'StartTime': startTime,
      if (status != null) 'Status': status.value,
    };
  }
}

enum ChangeStatus {
  preparing('PREPARING'),
  applying('APPLYING'),
  succeeded('SUCCEEDED'),
  cancelled('CANCELLED'),
  failed('FAILED'),
  ;

  final String value;

  const ChangeStatus(this.value);

  static ChangeStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ChangeStatus'));
}

/// This object is a container for common summary information about the change.
/// The summary doesn't contain the whole change structure.
class ChangeSummary {
  /// Optional name for the change.
  final String? changeName;

  /// The type of the change.
  final String? changeType;

  /// This object contains details specific to the change type of the requested
  /// change.
  final String? details;

  /// The JSON value of the details specific to the change type of the requested
  /// change.
  final JsonDocumentType? detailsDocument;

  /// The entity to be changed.
  final Entity? entity;

  /// An array of <code>ErrorDetail</code> objects associated with the change.
  final List<ErrorDetail>? errorDetailList;

  ChangeSummary({
    this.changeName,
    this.changeType,
    this.details,
    this.detailsDocument,
    this.entity,
    this.errorDetailList,
  });

  factory ChangeSummary.fromJson(Map<String, dynamic> json) {
    return ChangeSummary(
      changeName: json['ChangeName'] as String?,
      changeType: json['ChangeType'] as String?,
      details: json['Details'] as String?,
      detailsDocument: json['DetailsDocument'] != null
          ? JsonDocumentType.fromJson(
              json['DetailsDocument'] as Map<String, dynamic>)
          : null,
      entity: json['Entity'] != null
          ? Entity.fromJson(json['Entity'] as Map<String, dynamic>)
          : null,
      errorDetailList: (json['ErrorDetailList'] as List?)
          ?.nonNulls
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeName = this.changeName;
    final changeType = this.changeType;
    final details = this.details;
    final detailsDocument = this.detailsDocument;
    final entity = this.entity;
    final errorDetailList = this.errorDetailList;
    return {
      if (changeName != null) 'ChangeName': changeName,
      if (changeType != null) 'ChangeType': changeType,
      if (details != null) 'Details': details,
      if (detailsDocument != null) 'DetailsDocument': detailsDocument,
      if (entity != null) 'Entity': entity,
      if (errorDetailList != null) 'ErrorDetailList': errorDetailList,
    };
  }
}

/// Object that allows filtering on entity id of a container product.
class ContainerProductEntityIdFilter {
  /// A string array of unique entity id values to be filtered on.
  final List<String>? valueList;

  ContainerProductEntityIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Object containing all the filter fields for container products. Client can
/// add only one wildcard filter and a maximum of 8 filters in a single
/// <code>ListEntities</code> request.
class ContainerProductFilters {
  /// Unique identifier for the container product.
  final ContainerProductEntityIdFilter? entityId;

  /// The last date on which the container product was modified.
  final ContainerProductLastModifiedDateFilter? lastModifiedDate;

  /// The title of the container product.
  final ContainerProductTitleFilter? productTitle;

  /// The visibility of the container product.
  final ContainerProductVisibilityFilter? visibility;

  ContainerProductFilters({
    this.entityId,
    this.lastModifiedDate,
    this.productTitle,
    this.visibility,
  });

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final lastModifiedDate = this.lastModifiedDate;
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (entityId != null) 'EntityId': entityId,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility,
    };
  }
}

/// Object that allows filtering based on the last modified date of container
/// products.
class ContainerProductLastModifiedDateFilter {
  /// Dates between which the container product was last modified.
  final ContainerProductLastModifiedDateFilterDateRange? dateRange;

  ContainerProductLastModifiedDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Object that contains date range of the last modified date to be filtered on.
/// You can optionally provide a <code>BeforeValue</code> and/or
/// <code>AfterValue</code>. Both are inclusive.
class ContainerProductLastModifiedDateFilterDateRange {
  /// Date after which the container product was last modified.
  final String? afterValue;

  /// Date before which the container product was last modified.
  final String? beforeValue;

  ContainerProductLastModifiedDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Objects that allows sorting on container products based on certain fields
/// and sorting order.
class ContainerProductSort {
  /// Field to sort the container products by.
  final ContainerProductSortBy? sortBy;

  /// The sorting order. Can be <code>ASCENDING</code> or <code>DESCENDING</code>.
  /// The default value is <code>DESCENDING</code>.
  final SortOrder? sortOrder;

  ContainerProductSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

enum ContainerProductSortBy {
  entityId('EntityId'),
  lastModifiedDate('LastModifiedDate'),
  productTitle('ProductTitle'),
  visibility('Visibility'),
  ;

  final String value;

  const ContainerProductSortBy(this.value);

  static ContainerProductSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ContainerProductSortBy'));
}

/// Object that contains summarized information about a container product.
class ContainerProductSummary {
  /// The title of the container product.
  final String? productTitle;

  /// The lifecycle of the product.
  final ContainerProductVisibilityString? visibility;

  ContainerProductSummary({
    this.productTitle,
    this.visibility,
  });

  factory ContainerProductSummary.fromJson(Map<String, dynamic> json) {
    return ContainerProductSummary(
      productTitle: json['ProductTitle'] as String?,
      visibility: (json['Visibility'] as String?)
          ?.let(ContainerProductVisibilityString.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// Object that allows filtering on product title.
class ContainerProductTitleFilter {
  /// A string array of unique product title values to be filtered on.
  final List<String>? valueList;

  /// A string that will be the <code>wildCard</code> input for product tile
  /// filter. It matches the provided value as a substring in the actual value.
  final String? wildCardValue;

  ContainerProductTitleFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Object that allows filtering on the visibility of the product in the AWS
/// Marketplace.
class ContainerProductVisibilityFilter {
  /// A string array of unique visibility values to be filtered on.
  final List<ContainerProductVisibilityString>? valueList;

  ContainerProductVisibilityFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null)
        'ValueList': valueList.map((e) => e.value).toList(),
    };
  }
}

enum ContainerProductVisibilityString {
  limited('Limited'),
  public('Public'),
  restricted('Restricted'),
  draft('Draft'),
  ;

  final String value;

  const ContainerProductVisibilityString(this.value);

  static ContainerProductVisibilityString fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ContainerProductVisibilityString'));
}

/// Object that allows filtering on entity id of a data product.
class DataProductEntityIdFilter {
  /// A string array of unique entity id values to be filtered on.
  final List<String>? valueList;

  DataProductEntityIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Object containing all the filter fields for data products. Client can add
/// only one wildcard filter and a maximum of 8 filters in a single
/// <code>ListEntities</code> request.
class DataProductFilters {
  /// Unique identifier for the data product.
  final DataProductEntityIdFilter? entityId;

  /// The last date on which the data product was modified.
  final DataProductLastModifiedDateFilter? lastModifiedDate;

  /// The title of the data product.
  final DataProductTitleFilter? productTitle;

  /// The visibility of the data product.
  final DataProductVisibilityFilter? visibility;

  DataProductFilters({
    this.entityId,
    this.lastModifiedDate,
    this.productTitle,
    this.visibility,
  });

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final lastModifiedDate = this.lastModifiedDate;
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (entityId != null) 'EntityId': entityId,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility,
    };
  }
}

/// Object that allows filtering based on the last modified date of data
/// products.
class DataProductLastModifiedDateFilter {
  /// Dates between which the data product was last modified.
  final DataProductLastModifiedDateFilterDateRange? dateRange;

  DataProductLastModifiedDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Object that contains date range of the last modified date to be filtered on.
/// You can optionally provide a <code>BeforeValue</code> and/or
/// <code>AfterValue</code>. Both are inclusive.
class DataProductLastModifiedDateFilterDateRange {
  /// Date after which the data product was last modified.
  final String? afterValue;

  /// Date before which the data product was last modified.
  final String? beforeValue;

  DataProductLastModifiedDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Objects that allows sorting on data products based on certain fields and
/// sorting order.
class DataProductSort {
  /// Field to sort the data products by.
  final DataProductSortBy? sortBy;

  /// The sorting order. Can be <code>ASCENDING</code> or <code>DESCENDING</code>.
  /// The default value is <code>DESCENDING</code>.
  final SortOrder? sortOrder;

  DataProductSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

enum DataProductSortBy {
  entityId('EntityId'),
  productTitle('ProductTitle'),
  visibility('Visibility'),
  lastModifiedDate('LastModifiedDate'),
  ;

  final String value;

  const DataProductSortBy(this.value);

  static DataProductSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum DataProductSortBy'));
}

/// Object that contains summarized information about a data product.
class DataProductSummary {
  /// The title of the data product.
  final String? productTitle;

  /// The lifecycle of the data product.
  final DataProductVisibilityString? visibility;

  DataProductSummary({
    this.productTitle,
    this.visibility,
  });

  factory DataProductSummary.fromJson(Map<String, dynamic> json) {
    return DataProductSummary(
      productTitle: json['ProductTitle'] as String?,
      visibility: (json['Visibility'] as String?)
          ?.let(DataProductVisibilityString.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// Object that allows filtering on product title.
class DataProductTitleFilter {
  /// A string array of unique product title values to be filtered on.
  final List<String>? valueList;

  /// A string that will be the <code>wildCard</code> input for product tile
  /// filter. It matches the provided value as a substring in the actual value.
  final String? wildCardValue;

  DataProductTitleFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Object that allows filtering on the visibility of the product in the AWS
/// Marketplace.
class DataProductVisibilityFilter {
  /// A string array of unique visibility values to be filtered on.
  final List<DataProductVisibilityString>? valueList;

  DataProductVisibilityFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null)
        'ValueList': valueList.map((e) => e.value).toList(),
    };
  }
}

enum DataProductVisibilityString {
  limited('Limited'),
  public('Public'),
  restricted('Restricted'),
  unavailable('Unavailable'),
  draft('Draft'),
  ;

  final String value;

  const DataProductVisibilityString(this.value);

  static DataProductVisibilityString fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum DataProductVisibilityString'));
}

class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeChangeSetResponse {
  /// An array of <code>ChangeSummary</code> objects.
  final List<ChangeSummary>? changeSet;

  /// The ARN associated with the unique identifier for the change set referenced
  /// in this request.
  final String? changeSetArn;

  /// Required. The unique identifier for the change set referenced in this
  /// request.
  final String? changeSetId;

  /// The optional name provided in the <code>StartChangeSet</code> request. If
  /// you do not provide a name, one is set by default.
  final String? changeSetName;

  /// The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request
  /// transitioned to a terminal state. The change cannot transition to a
  /// different state. Null if the request is not in a terminal state.
  final String? endTime;

  /// Returned if the change set is in <code>FAILED</code> status. Can be either
  /// <code>CLIENT_ERROR</code>, which means that there are issues with the
  /// request (see the <code>ErrorDetailList</code>), or
  /// <code>SERVER_FAULT</code>, which means that there is a problem in the
  /// system, and you should retry your request.
  final FailureCode? failureCode;

  /// Returned if there is a failure on the change set, but that failure is not
  /// related to any of the changes in the request.
  final String? failureDescription;

  /// The optional intent provided in the <code>StartChangeSet</code> request. If
  /// you do not provide an intent, <code>APPLY</code> is set by default.
  final Intent? intent;

  /// The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request
  /// started.
  final String? startTime;

  /// The status of the change request.
  final ChangeStatus? status;

  DescribeChangeSetResponse({
    this.changeSet,
    this.changeSetArn,
    this.changeSetId,
    this.changeSetName,
    this.endTime,
    this.failureCode,
    this.failureDescription,
    this.intent,
    this.startTime,
    this.status,
  });

  factory DescribeChangeSetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChangeSetResponse(
      changeSet: (json['ChangeSet'] as List?)
          ?.nonNulls
          .map((e) => ChangeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      changeSetArn: json['ChangeSetArn'] as String?,
      changeSetId: json['ChangeSetId'] as String?,
      changeSetName: json['ChangeSetName'] as String?,
      endTime: json['EndTime'] as String?,
      failureCode:
          (json['FailureCode'] as String?)?.let(FailureCode.fromString),
      failureDescription: json['FailureDescription'] as String?,
      intent: (json['Intent'] as String?)?.let(Intent.fromString),
      startTime: json['StartTime'] as String?,
      status: (json['Status'] as String?)?.let(ChangeStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final changeSet = this.changeSet;
    final changeSetArn = this.changeSetArn;
    final changeSetId = this.changeSetId;
    final changeSetName = this.changeSetName;
    final endTime = this.endTime;
    final failureCode = this.failureCode;
    final failureDescription = this.failureDescription;
    final intent = this.intent;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (changeSet != null) 'ChangeSet': changeSet,
      if (changeSetArn != null) 'ChangeSetArn': changeSetArn,
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (endTime != null) 'EndTime': endTime,
      if (failureCode != null) 'FailureCode': failureCode.value,
      if (failureDescription != null) 'FailureDescription': failureDescription,
      if (intent != null) 'Intent': intent.value,
      if (startTime != null) 'StartTime': startTime,
      if (status != null) 'Status': status.value,
    };
  }
}

class DescribeEntityResponse {
  /// This stringified JSON object includes the details of the entity.
  final String? details;

  /// The JSON value of the details specific to the entity.
  final JsonDocumentType? detailsDocument;

  /// The ARN associated to the unique identifier for the entity referenced in
  /// this request.
  final String? entityArn;

  /// The identifier of the entity, in the format of
  /// <code>EntityId@RevisionId</code>.
  final String? entityIdentifier;

  /// The named type of the entity, in the format of
  /// <code>EntityType@Version</code>.
  final String? entityType;

  /// The last modified date of the entity, in ISO 8601 format
  /// (2018-02-27T13:45:22Z).
  final String? lastModifiedDate;

  DescribeEntityResponse({
    this.details,
    this.detailsDocument,
    this.entityArn,
    this.entityIdentifier,
    this.entityType,
    this.lastModifiedDate,
  });

  factory DescribeEntityResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEntityResponse(
      details: json['Details'] as String?,
      detailsDocument: json['DetailsDocument'] != null
          ? JsonDocumentType.fromJson(
              json['DetailsDocument'] as Map<String, dynamic>)
          : null,
      entityArn: json['EntityArn'] as String?,
      entityIdentifier: json['EntityIdentifier'] as String?,
      entityType: json['EntityType'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final detailsDocument = this.detailsDocument;
    final entityArn = this.entityArn;
    final entityIdentifier = this.entityIdentifier;
    final entityType = this.entityType;
    final lastModifiedDate = this.lastModifiedDate;
    return {
      if (details != null) 'Details': details,
      if (detailsDocument != null) 'DetailsDocument': detailsDocument,
      if (entityArn != null) 'EntityArn': entityArn,
      if (entityIdentifier != null) 'EntityIdentifier': entityIdentifier,
      if (entityType != null) 'EntityType': entityType,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
    };
  }
}

/// An entity contains data that describes your product, its supported features,
/// and how it can be used or launched by your customer.
class Entity {
  /// The type of entity.
  final String type;

  /// The identifier for the entity.
  final String? identifier;

  Entity({
    required this.type,
    this.identifier,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      type: json['Type'] as String,
      identifier: json['Identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final identifier = this.identifier;
    return {
      'Type': type,
      if (identifier != null) 'Identifier': identifier,
    };
  }
}

/// An object that contains metadata and details about the entity.
class EntityDetail {
  /// An object that contains all the details of the entity.
  final JsonDocumentType? detailsDocument;

  /// The Amazon Resource Name (ARN) of the entity.
  final String? entityArn;

  /// The ID of the entity, in the format of <code>EntityId@RevisionId</code>.
  final String? entityIdentifier;

  /// The entity type of the entity, in the format of
  /// <code>EntityType@Version</code>.
  final String? entityType;

  /// The last time the entity was modified.
  final String? lastModifiedDate;

  EntityDetail({
    this.detailsDocument,
    this.entityArn,
    this.entityIdentifier,
    this.entityType,
    this.lastModifiedDate,
  });

  factory EntityDetail.fromJson(Map<String, dynamic> json) {
    return EntityDetail(
      detailsDocument: json['DetailsDocument'] != null
          ? JsonDocumentType.fromJson(
              json['DetailsDocument'] as Map<String, dynamic>)
          : null,
      entityArn: json['EntityArn'] as String?,
      entityIdentifier: json['EntityIdentifier'] as String?,
      entityType: json['EntityType'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final detailsDocument = this.detailsDocument;
    final entityArn = this.entityArn;
    final entityIdentifier = this.entityIdentifier;
    final entityType = this.entityType;
    final lastModifiedDate = this.lastModifiedDate;
    return {
      if (detailsDocument != null) 'DetailsDocument': detailsDocument,
      if (entityArn != null) 'EntityArn': entityArn,
      if (entityIdentifier != null) 'EntityIdentifier': entityIdentifier,
      if (entityType != null) 'EntityType': entityType,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
    };
  }
}

/// An object that contains entity ID and the catalog in which the entity is
/// present.
class EntityRequest {
  /// The name of the catalog the entity is present in. The only value at this
  /// time is <code>AWSMarketplace</code>.
  final String catalog;

  /// The ID of the entity.
  final String entityId;

  EntityRequest({
    required this.catalog,
    required this.entityId,
  });

  Map<String, dynamic> toJson() {
    final catalog = this.catalog;
    final entityId = this.entityId;
    return {
      'Catalog': catalog,
      'EntityId': entityId,
    };
  }
}

/// This object is a container for common summary information about the entity.
/// The summary doesn't contain the whole entity structure, but it does contain
/// information common across all entities.
class EntitySummary {
  /// An object that contains summary information about the AMI product.
  final AmiProductSummary? amiProductSummary;

  /// An object that contains summary information about the container product.
  final ContainerProductSummary? containerProductSummary;

  /// An object that contains summary information about the data product.
  final DataProductSummary? dataProductSummary;

  /// The ARN associated with the unique identifier for the entity.
  final String? entityArn;

  /// The unique identifier for the entity.
  final String? entityId;

  /// The type of the entity.
  final String? entityType;

  /// The last time the entity was published, using ISO 8601 format
  /// (2018-02-27T13:45:22Z).
  final String? lastModifiedDate;

  /// The name for the entity. This value is not unique. It is defined by the
  /// seller.
  final String? name;

  /// An object that contains summary information about the offer.
  final OfferSummary? offerSummary;

  /// An object that contains summary information about the Resale Authorization.
  final ResaleAuthorizationSummary? resaleAuthorizationSummary;

  /// An object that contains summary information about the SaaS product.
  final SaaSProductSummary? saaSProductSummary;

  /// The visibility status of the entity to buyers. This value can be
  /// <code>Public</code> (everyone can view the entity), <code>Limited</code>
  /// (the entity is visible to limited accounts only), or <code>Restricted</code>
  /// (the entity was published and then unpublished and only existing buyers can
  /// view it).
  final String? visibility;

  EntitySummary({
    this.amiProductSummary,
    this.containerProductSummary,
    this.dataProductSummary,
    this.entityArn,
    this.entityId,
    this.entityType,
    this.lastModifiedDate,
    this.name,
    this.offerSummary,
    this.resaleAuthorizationSummary,
    this.saaSProductSummary,
    this.visibility,
  });

  factory EntitySummary.fromJson(Map<String, dynamic> json) {
    return EntitySummary(
      amiProductSummary: json['AmiProductSummary'] != null
          ? AmiProductSummary.fromJson(
              json['AmiProductSummary'] as Map<String, dynamic>)
          : null,
      containerProductSummary: json['ContainerProductSummary'] != null
          ? ContainerProductSummary.fromJson(
              json['ContainerProductSummary'] as Map<String, dynamic>)
          : null,
      dataProductSummary: json['DataProductSummary'] != null
          ? DataProductSummary.fromJson(
              json['DataProductSummary'] as Map<String, dynamic>)
          : null,
      entityArn: json['EntityArn'] as String?,
      entityId: json['EntityId'] as String?,
      entityType: json['EntityType'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      name: json['Name'] as String?,
      offerSummary: json['OfferSummary'] != null
          ? OfferSummary.fromJson(json['OfferSummary'] as Map<String, dynamic>)
          : null,
      resaleAuthorizationSummary: json['ResaleAuthorizationSummary'] != null
          ? ResaleAuthorizationSummary.fromJson(
              json['ResaleAuthorizationSummary'] as Map<String, dynamic>)
          : null,
      saaSProductSummary: json['SaaSProductSummary'] != null
          ? SaaSProductSummary.fromJson(
              json['SaaSProductSummary'] as Map<String, dynamic>)
          : null,
      visibility: json['Visibility'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final amiProductSummary = this.amiProductSummary;
    final containerProductSummary = this.containerProductSummary;
    final dataProductSummary = this.dataProductSummary;
    final entityArn = this.entityArn;
    final entityId = this.entityId;
    final entityType = this.entityType;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final offerSummary = this.offerSummary;
    final resaleAuthorizationSummary = this.resaleAuthorizationSummary;
    final saaSProductSummary = this.saaSProductSummary;
    final visibility = this.visibility;
    return {
      if (amiProductSummary != null) 'AmiProductSummary': amiProductSummary,
      if (containerProductSummary != null)
        'ContainerProductSummary': containerProductSummary,
      if (dataProductSummary != null) 'DataProductSummary': dataProductSummary,
      if (entityArn != null) 'EntityArn': entityArn,
      if (entityId != null) 'EntityId': entityId,
      if (entityType != null) 'EntityType': entityType,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (name != null) 'Name': name,
      if (offerSummary != null) 'OfferSummary': offerSummary,
      if (resaleAuthorizationSummary != null)
        'ResaleAuthorizationSummary': resaleAuthorizationSummary,
      if (saaSProductSummary != null) 'SaaSProductSummary': saaSProductSummary,
      if (visibility != null) 'Visibility': visibility,
    };
  }
}

/// Object containing all the filter fields per entity type.
class EntityTypeFilters {
  /// A filter for AMI products.
  final AmiProductFilters? amiProductFilters;

  /// A filter for container products.
  final ContainerProductFilters? containerProductFilters;

  /// A filter for data products.
  final DataProductFilters? dataProductFilters;

  /// A filter for offers.
  final OfferFilters? offerFilters;

  /// A filter for Resale Authorizations.
  final ResaleAuthorizationFilters? resaleAuthorizationFilters;

  /// A filter for SaaS products.
  final SaaSProductFilters? saaSProductFilters;

  EntityTypeFilters({
    this.amiProductFilters,
    this.containerProductFilters,
    this.dataProductFilters,
    this.offerFilters,
    this.resaleAuthorizationFilters,
    this.saaSProductFilters,
  });

  Map<String, dynamic> toJson() {
    final amiProductFilters = this.amiProductFilters;
    final containerProductFilters = this.containerProductFilters;
    final dataProductFilters = this.dataProductFilters;
    final offerFilters = this.offerFilters;
    final resaleAuthorizationFilters = this.resaleAuthorizationFilters;
    final saaSProductFilters = this.saaSProductFilters;
    return {
      if (amiProductFilters != null) 'AmiProductFilters': amiProductFilters,
      if (containerProductFilters != null)
        'ContainerProductFilters': containerProductFilters,
      if (dataProductFilters != null) 'DataProductFilters': dataProductFilters,
      if (offerFilters != null) 'OfferFilters': offerFilters,
      if (resaleAuthorizationFilters != null)
        'ResaleAuthorizationFilters': resaleAuthorizationFilters,
      if (saaSProductFilters != null) 'SaaSProductFilters': saaSProductFilters,
    };
  }
}

/// Object containing all the sort fields per entity type.
class EntityTypeSort {
  /// A sort for AMI products.
  final AmiProductSort? amiProductSort;

  /// A sort for container products.
  final ContainerProductSort? containerProductSort;

  /// A sort for data products.
  final DataProductSort? dataProductSort;

  /// A sort for offers.
  final OfferSort? offerSort;

  /// A sort for Resale Authorizations.
  final ResaleAuthorizationSort? resaleAuthorizationSort;

  /// A sort for SaaS products.
  final SaaSProductSort? saaSProductSort;

  EntityTypeSort({
    this.amiProductSort,
    this.containerProductSort,
    this.dataProductSort,
    this.offerSort,
    this.resaleAuthorizationSort,
    this.saaSProductSort,
  });

  Map<String, dynamic> toJson() {
    final amiProductSort = this.amiProductSort;
    final containerProductSort = this.containerProductSort;
    final dataProductSort = this.dataProductSort;
    final offerSort = this.offerSort;
    final resaleAuthorizationSort = this.resaleAuthorizationSort;
    final saaSProductSort = this.saaSProductSort;
    return {
      if (amiProductSort != null) 'AmiProductSort': amiProductSort,
      if (containerProductSort != null)
        'ContainerProductSort': containerProductSort,
      if (dataProductSort != null) 'DataProductSort': dataProductSort,
      if (offerSort != null) 'OfferSort': offerSort,
      if (resaleAuthorizationSort != null)
        'ResaleAuthorizationSort': resaleAuthorizationSort,
      if (saaSProductSort != null) 'SaaSProductSort': saaSProductSort,
    };
  }
}

/// Details about the error.
class ErrorDetail {
  /// The error code that identifies the type of error.
  final String? errorCode;

  /// The message for the error.
  final String? errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

enum FailureCode {
  clientError('CLIENT_ERROR'),
  serverFault('SERVER_FAULT'),
  ;

  final String value;

  const FailureCode(this.value);

  static FailureCode fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum FailureCode'));
}

/// A filter object, used to optionally filter results from calls to the
/// <code>ListEntities</code> and <code>ListChangeSets</code> actions.
class Filter {
  /// For <code>ListEntities</code>, the supported value for this is an
  /// <code>EntityId</code>.
  ///
  /// For <code>ListChangeSets</code>, the supported values are as follows:
  final String? name;

  /// <code>ListEntities</code> - This is a list of unique <code>EntityId</code>s.
  ///
  /// <code>ListChangeSets</code> - The supported filter names and associated
  /// <code>ValueList</code>s is as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>ChangeSetName</code> - The supported <code>ValueList</code> is a list
  /// of non-unique <code>ChangeSetName</code>s. These are defined when you call
  /// the <code>StartChangeSet</code> action.
  /// </li>
  /// <li>
  /// <code>Status</code> - The supported <code>ValueList</code> is a list of
  /// statuses for all change set requests.
  /// </li>
  /// <li>
  /// <code>EntityId</code> - The supported <code>ValueList</code> is a list of
  /// unique <code>EntityId</code>s.
  /// </li>
  /// <li>
  /// <code>BeforeStartTime</code> - The supported <code>ValueList</code> is a
  /// list of all change sets that started before the filter value.
  /// </li>
  /// <li>
  /// <code>AfterStartTime</code> - The supported <code>ValueList</code> is a list
  /// of all change sets that started after the filter value.
  /// </li>
  /// <li>
  /// <code>BeforeEndTime</code> - The supported <code>ValueList</code> is a list
  /// of all change sets that ended before the filter value.
  /// </li>
  /// <li>
  /// <code>AfterEndTime</code> - The supported <code>ValueList</code> is a list
  /// of all change sets that ended after the filter value.
  /// </li>
  /// </ul>
  final List<String>? valueList;

  Filter({
    this.name,
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final valueList = this.valueList;
    return {
      if (name != null) 'Name': name,
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

class GetResourcePolicyResponse {
  /// The policy document to set; formatted in JSON.
  final String? policy;

  GetResourcePolicyResponse({
    this.policy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

enum Intent {
  validate('VALIDATE'),
  apply('APPLY'),
  ;

  final String value;

  const Intent(this.value);

  static Intent fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Intent'));
}

class JsonDocumentType {
  JsonDocumentType();

  factory JsonDocumentType.fromJson(Map<String, dynamic> _) {
    return JsonDocumentType();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListChangeSetsResponse {
  /// Array of <code>ChangeSetSummaryListItem</code> objects.
  final List<ChangeSetSummaryListItem>? changeSetSummaryList;

  /// The value of the next token, if it exists. Null if there are no more
  /// results.
  final String? nextToken;

  ListChangeSetsResponse({
    this.changeSetSummaryList,
    this.nextToken,
  });

  factory ListChangeSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListChangeSetsResponse(
      changeSetSummaryList: (json['ChangeSetSummaryList'] as List?)
          ?.nonNulls
          .map((e) =>
              ChangeSetSummaryListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeSetSummaryList = this.changeSetSummaryList;
    final nextToken = this.nextToken;
    return {
      if (changeSetSummaryList != null)
        'ChangeSetSummaryList': changeSetSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListEntitiesResponse {
  /// Array of <code>EntitySummary</code> objects.
  final List<EntitySummary>? entitySummaryList;

  /// The value of the next token if it exists. Null if there is no more result.
  final String? nextToken;

  ListEntitiesResponse({
    this.entitySummaryList,
    this.nextToken,
  });

  factory ListEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListEntitiesResponse(
      entitySummaryList: (json['EntitySummaryList'] as List?)
          ?.nonNulls
          .map((e) => EntitySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitySummaryList = this.entitySummaryList;
    final nextToken = this.nextToken;
    return {
      if (entitySummaryList != null) 'EntitySummaryList': entitySummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Required. The ARN associated with the resource you want to list tags on.
  final String? resourceArn;

  /// Required. A list of objects specifying each key name and value. Number of
  /// objects allowed: 1-50.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.resourceArn,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Allows filtering on the <code>AvailabilityEndDate</code> of an offer.
class OfferAvailabilityEndDateFilter {
  /// Allows filtering on the <code>AvailabilityEndDate</code> of an offer with
  /// date range as input.
  final OfferAvailabilityEndDateFilterDateRange? dateRange;

  OfferAvailabilityEndDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Allows filtering on the <code>AvailabilityEndDate</code> of an offer with
/// date range as input.
class OfferAvailabilityEndDateFilterDateRange {
  /// Allows filtering on the <code>AvailabilityEndDate</code> of an offer after a
  /// date.
  final String? afterValue;

  /// Allows filtering on the <code>AvailabilityEndDate</code> of an offer before
  /// a date.
  final String? beforeValue;

  OfferAvailabilityEndDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Allows filtering on the <code>BuyerAccounts</code> of an offer.
class OfferBuyerAccountsFilter {
  /// Allows filtering on the <code>BuyerAccounts</code> of an offer with wild
  /// card input.
  final String? wildCardValue;

  OfferBuyerAccountsFilter({
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final wildCardValue = this.wildCardValue;
    return {
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the entity id of an offer.
class OfferEntityIdFilter {
  /// Allows filtering on entity id of an offer with list input.
  final List<String>? valueList;

  OfferEntityIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Object containing all the filter fields for offers entity. Client can add
/// only one wildcard filter and a maximum of 8 filters in a single
/// <code>ListEntities</code> request.
class OfferFilters {
  /// Allows filtering on the <code>AvailabilityEndDate</code> of an offer.
  final OfferAvailabilityEndDateFilter? availabilityEndDate;

  /// Allows filtering on the <code>BuyerAccounts</code> of an offer.
  final OfferBuyerAccountsFilter? buyerAccounts;

  /// Allows filtering on <code>EntityId</code> of an offer.
  final OfferEntityIdFilter? entityId;

  /// Allows filtering on the <code>LastModifiedDate</code> of an offer.
  final OfferLastModifiedDateFilter? lastModifiedDate;

  /// Allows filtering on the <code>Name</code> of an offer.
  final OfferNameFilter? name;

  /// Allows filtering on the <code>ProductId</code> of an offer.
  final OfferProductIdFilter? productId;

  /// Allows filtering on the <code>ReleaseDate</code> of an offer.
  final OfferReleaseDateFilter? releaseDate;

  /// Allows filtering on the <code>ResaleAuthorizationId</code> of an offer.
  /// <note>
  /// Not all offers have a <code>ResaleAuthorizationId</code>. The response will
  /// only include offers for which you have permissions.
  /// </note>
  final OfferResaleAuthorizationIdFilter? resaleAuthorizationId;

  /// Allows filtering on the <code>State</code> of an offer.
  final OfferStateFilter? state;

  /// Allows filtering on the <code>Targeting</code> of an offer.
  final OfferTargetingFilter? targeting;

  OfferFilters({
    this.availabilityEndDate,
    this.buyerAccounts,
    this.entityId,
    this.lastModifiedDate,
    this.name,
    this.productId,
    this.releaseDate,
    this.resaleAuthorizationId,
    this.state,
    this.targeting,
  });

  Map<String, dynamic> toJson() {
    final availabilityEndDate = this.availabilityEndDate;
    final buyerAccounts = this.buyerAccounts;
    final entityId = this.entityId;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final productId = this.productId;
    final releaseDate = this.releaseDate;
    final resaleAuthorizationId = this.resaleAuthorizationId;
    final state = this.state;
    final targeting = this.targeting;
    return {
      if (availabilityEndDate != null)
        'AvailabilityEndDate': availabilityEndDate,
      if (buyerAccounts != null) 'BuyerAccounts': buyerAccounts,
      if (entityId != null) 'EntityId': entityId,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (name != null) 'Name': name,
      if (productId != null) 'ProductId': productId,
      if (releaseDate != null) 'ReleaseDate': releaseDate,
      if (resaleAuthorizationId != null)
        'ResaleAuthorizationId': resaleAuthorizationId,
      if (state != null) 'State': state,
      if (targeting != null) 'Targeting': targeting,
    };
  }
}

/// Allows filtering on the <code>LastModifiedDate</code> of an offer.
class OfferLastModifiedDateFilter {
  /// Allows filtering on the <code>LastModifiedDate</code> of an offer with date
  /// range as input.
  final OfferLastModifiedDateFilterDateRange? dateRange;

  OfferLastModifiedDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Allows filtering on the <code>LastModifiedDate</code> of an offer with date
/// range as input.
class OfferLastModifiedDateFilterDateRange {
  /// Allows filtering on the <code>LastModifiedDate</code> of an offer after a
  /// date.
  final String? afterValue;

  /// Allows filtering on the <code>LastModifiedDate</code> of an offer before a
  /// date.
  final String? beforeValue;

  OfferLastModifiedDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Allows filtering on the <code>Name</code> of an offer.
class OfferNameFilter {
  /// Allows filtering on the <code>Name</code> of an offer with list input.
  final List<String>? valueList;

  /// Allows filtering on the <code>Name</code> of an offer with wild card input.
  final String? wildCardValue;

  OfferNameFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the <code>ProductId</code> of an offer.
class OfferProductIdFilter {
  /// Allows filtering on the <code>ProductId</code> of an offer with list input.
  final List<String>? valueList;

  OfferProductIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Allows filtering on the <code>ReleaseDate</code> of an offer.
class OfferReleaseDateFilter {
  /// Allows filtering on the <code>ReleaseDate</code> of an offer with date range
  /// as input.
  final OfferReleaseDateFilterDateRange? dateRange;

  OfferReleaseDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Allows filtering on the <code>ReleaseDate</code> of an offer with date range
/// as input.
class OfferReleaseDateFilterDateRange {
  /// Allows filtering on the <code>ReleaseDate</code> of offers after a date.
  final String? afterValue;

  /// Allows filtering on the <code>ReleaseDate</code> of offers before a date.
  final String? beforeValue;

  OfferReleaseDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Allows filtering on the <code>ResaleAuthorizationId</code> of an offer.
/// <note>
/// Not all offers have a <code>ResaleAuthorizationId</code>. The response will
/// only include offers for which you have permissions.
/// </note>
class OfferResaleAuthorizationIdFilter {
  /// Allows filtering on the <code>ResaleAuthorizationId</code> of an offer with
  /// list input.
  final List<String>? valueList;

  OfferResaleAuthorizationIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Allows to sort offers.
class OfferSort {
  /// Allows to sort offers.
  final OfferSortBy? sortBy;

  /// Allows to sort offers.
  final SortOrder? sortOrder;

  OfferSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

enum OfferSortBy {
  entityId('EntityId'),
  name('Name'),
  productId('ProductId'),
  resaleAuthorizationId('ResaleAuthorizationId'),
  releaseDate('ReleaseDate'),
  availabilityEndDate('AvailabilityEndDate'),
  buyerAccounts('BuyerAccounts'),
  state('State'),
  targeting('Targeting'),
  lastModifiedDate('LastModifiedDate'),
  ;

  final String value;

  const OfferSortBy(this.value);

  static OfferSortBy fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum OfferSortBy'));
}

/// Allows filtering on the <code>State</code> of an offer.
class OfferStateFilter {
  /// Allows filtering on the <code>State</code> of an offer with list input.
  final List<OfferStateString>? valueList;

  OfferStateFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null)
        'ValueList': valueList.map((e) => e.value).toList(),
    };
  }
}

enum OfferStateString {
  draft('Draft'),
  released('Released'),
  ;

  final String value;

  const OfferStateString(this.value);

  static OfferStateString fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OfferStateString'));
}

/// Summarized information about an offer.
class OfferSummary {
  /// The availability end date of the offer.
  final String? availabilityEndDate;

  /// The buyer accounts in the offer.
  final List<String>? buyerAccounts;

  /// The name of the offer.
  final String? name;

  /// The product ID of the offer.
  final String? productId;

  /// The release date of the offer.
  final String? releaseDate;

  /// The ResaleAuthorizationId of the offer.
  final String? resaleAuthorizationId;

  /// The status of the offer.
  final OfferStateString? state;

  /// The targeting in the offer.
  final List<OfferTargetingString>? targeting;

  OfferSummary({
    this.availabilityEndDate,
    this.buyerAccounts,
    this.name,
    this.productId,
    this.releaseDate,
    this.resaleAuthorizationId,
    this.state,
    this.targeting,
  });

  factory OfferSummary.fromJson(Map<String, dynamic> json) {
    return OfferSummary(
      availabilityEndDate: json['AvailabilityEndDate'] as String?,
      buyerAccounts: (json['BuyerAccounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      name: json['Name'] as String?,
      productId: json['ProductId'] as String?,
      releaseDate: json['ReleaseDate'] as String?,
      resaleAuthorizationId: json['ResaleAuthorizationId'] as String?,
      state: (json['State'] as String?)?.let(OfferStateString.fromString),
      targeting: (json['Targeting'] as List?)
          ?.nonNulls
          .map((e) => OfferTargetingString.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityEndDate = this.availabilityEndDate;
    final buyerAccounts = this.buyerAccounts;
    final name = this.name;
    final productId = this.productId;
    final releaseDate = this.releaseDate;
    final resaleAuthorizationId = this.resaleAuthorizationId;
    final state = this.state;
    final targeting = this.targeting;
    return {
      if (availabilityEndDate != null)
        'AvailabilityEndDate': availabilityEndDate,
      if (buyerAccounts != null) 'BuyerAccounts': buyerAccounts,
      if (name != null) 'Name': name,
      if (productId != null) 'ProductId': productId,
      if (releaseDate != null) 'ReleaseDate': releaseDate,
      if (resaleAuthorizationId != null)
        'ResaleAuthorizationId': resaleAuthorizationId,
      if (state != null) 'State': state.value,
      if (targeting != null)
        'Targeting': targeting.map((e) => e.value).toList(),
    };
  }
}

/// Allows filtering on the <code>Targeting</code> of an offer.
class OfferTargetingFilter {
  /// Allows filtering on the <code>Targeting</code> of an offer with list input.
  final List<OfferTargetingString>? valueList;

  OfferTargetingFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null)
        'ValueList': valueList.map((e) => e.value).toList(),
    };
  }
}

enum OfferTargetingString {
  buyerAccounts('BuyerAccounts'),
  participatingPrograms('ParticipatingPrograms'),
  countryCodes('CountryCodes'),
  none('None'),
  ;

  final String value;

  const OfferTargetingString(this.value);

  static OfferTargetingString fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum OfferTargetingString'));
}

enum OwnershipType {
  self('SELF'),
  shared('SHARED'),
  ;

  final String value;

  const OwnershipType(this.value);

  static OwnershipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OwnershipType'));
}

class PutResourcePolicyResponse {
  PutResourcePolicyResponse();

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Allows filtering on <code>AvailabilityEndDate</code> of a
/// ResaleAuthorization.
class ResaleAuthorizationAvailabilityEndDateFilter {
  /// Allows filtering on <code>AvailabilityEndDate</code> of a
  /// ResaleAuthorization with date range as input
  final ResaleAuthorizationAvailabilityEndDateFilterDateRange? dateRange;

  /// Allows filtering on <code>AvailabilityEndDate</code> of a
  /// ResaleAuthorization with date value as input.
  final List<String>? valueList;

  ResaleAuthorizationAvailabilityEndDateFilter({
    this.dateRange,
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    final valueList = this.valueList;
    return {
      if (dateRange != null) 'DateRange': dateRange,
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Allows filtering on <code>AvailabilityEndDate</code> of a
/// ResaleAuthorization with date range as input.
class ResaleAuthorizationAvailabilityEndDateFilterDateRange {
  /// Allows filtering on <code>AvailabilityEndDate</code> of a
  /// ResaleAuthorization after a date.
  final String? afterValue;

  /// Allows filtering on <code>AvailabilityEndDate</code> of a
  /// ResaleAuthorization before a date.
  final String? beforeValue;

  ResaleAuthorizationAvailabilityEndDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Allows filtering on <code>CreatedDate</code> of a ResaleAuthorization.
class ResaleAuthorizationCreatedDateFilter {
  /// Allows filtering on <code>CreatedDate</code> of a ResaleAuthorization with
  /// date range as input.
  final ResaleAuthorizationCreatedDateFilterDateRange? dateRange;

  /// Allows filtering on <code>CreatedDate</code> of a ResaleAuthorization with
  /// date value as input.
  final List<String>? valueList;

  ResaleAuthorizationCreatedDateFilter({
    this.dateRange,
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    final valueList = this.valueList;
    return {
      if (dateRange != null) 'DateRange': dateRange,
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Allows filtering on <code>CreatedDate</code> of a ResaleAuthorization with
/// date range as input.
class ResaleAuthorizationCreatedDateFilterDateRange {
  /// Allows filtering on <code>CreatedDate</code> of a ResaleAuthorization after
  /// a date.
  final String? afterValue;

  /// Allows filtering on <code>CreatedDate</code> of a ResaleAuthorization before
  /// a date.
  final String? beforeValue;

  ResaleAuthorizationCreatedDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Allows filtering on <code>EntityId</code> of a ResaleAuthorization.
class ResaleAuthorizationEntityIdFilter {
  /// Allows filtering on <code>EntityId</code> of a ResaleAuthorization with list
  /// input.
  final List<String>? valueList;

  ResaleAuthorizationEntityIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Object containing all the filter fields for resale authorization entity.
/// Client can add only one wildcard filter and a maximum of 8 filters in a
/// single <code>ListEntities</code> request.
class ResaleAuthorizationFilters {
  /// Allows filtering on the <code>AvailabilityEndDate</code> of a
  /// ResaleAuthorization.
  final ResaleAuthorizationAvailabilityEndDateFilter? availabilityEndDate;

  /// Allows filtering on the <code>CreatedDate</code> of a ResaleAuthorization.
  final ResaleAuthorizationCreatedDateFilter? createdDate;

  /// Allows filtering on the <code>EntityId</code> of a ResaleAuthorization.
  final ResaleAuthorizationEntityIdFilter? entityId;

  /// Allows filtering on the <code>LastModifiedDate</code> of a
  /// ResaleAuthorization.
  final ResaleAuthorizationLastModifiedDateFilter? lastModifiedDate;

  /// Allows filtering on the <code>ManufacturerAccountId</code> of a
  /// ResaleAuthorization.
  final ResaleAuthorizationManufacturerAccountIdFilter? manufacturerAccountId;

  /// Allows filtering on the <code>ManufacturerLegalName</code> of a
  /// ResaleAuthorization.
  final ResaleAuthorizationManufacturerLegalNameFilter? manufacturerLegalName;

  /// Allows filtering on the <code>Name</code> of a ResaleAuthorization.
  final ResaleAuthorizationNameFilter? name;

  /// Allows filtering on the <code>OfferExtendedStatus</code> of a
  /// ResaleAuthorization.
  final ResaleAuthorizationOfferExtendedStatusFilter? offerExtendedStatus;

  /// Allows filtering on the <code>ProductId</code> of a ResaleAuthorization.
  final ResaleAuthorizationProductIdFilter? productId;

  /// Allows filtering on the <code>ProductName</code> of a ResaleAuthorization.
  final ResaleAuthorizationProductNameFilter? productName;

  /// Allows filtering on the <code>ResellerAccountID</code> of a
  /// ResaleAuthorization.
  final ResaleAuthorizationResellerAccountIDFilter? resellerAccountID;

  /// Allows filtering on the <code>ResellerLegalName</code> of a
  /// ResaleAuthorization.
  final ResaleAuthorizationResellerLegalNameFilter? resellerLegalName;

  /// Allows filtering on the <code>Status</code> of a ResaleAuthorization.
  final ResaleAuthorizationStatusFilter? status;

  ResaleAuthorizationFilters({
    this.availabilityEndDate,
    this.createdDate,
    this.entityId,
    this.lastModifiedDate,
    this.manufacturerAccountId,
    this.manufacturerLegalName,
    this.name,
    this.offerExtendedStatus,
    this.productId,
    this.productName,
    this.resellerAccountID,
    this.resellerLegalName,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final availabilityEndDate = this.availabilityEndDate;
    final createdDate = this.createdDate;
    final entityId = this.entityId;
    final lastModifiedDate = this.lastModifiedDate;
    final manufacturerAccountId = this.manufacturerAccountId;
    final manufacturerLegalName = this.manufacturerLegalName;
    final name = this.name;
    final offerExtendedStatus = this.offerExtendedStatus;
    final productId = this.productId;
    final productName = this.productName;
    final resellerAccountID = this.resellerAccountID;
    final resellerLegalName = this.resellerLegalName;
    final status = this.status;
    return {
      if (availabilityEndDate != null)
        'AvailabilityEndDate': availabilityEndDate,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (entityId != null) 'EntityId': entityId,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (manufacturerAccountId != null)
        'ManufacturerAccountId': manufacturerAccountId,
      if (manufacturerLegalName != null)
        'ManufacturerLegalName': manufacturerLegalName,
      if (name != null) 'Name': name,
      if (offerExtendedStatus != null)
        'OfferExtendedStatus': offerExtendedStatus,
      if (productId != null) 'ProductId': productId,
      if (productName != null) 'ProductName': productName,
      if (resellerAccountID != null) 'ResellerAccountID': resellerAccountID,
      if (resellerLegalName != null) 'ResellerLegalName': resellerLegalName,
      if (status != null) 'Status': status,
    };
  }
}

/// Allows filtering on the <code>LastModifiedDate</code> of a
/// ResaleAuthorization.
class ResaleAuthorizationLastModifiedDateFilter {
  /// Allows filtering on the <code>LastModifiedDate</code> of a
  /// ResaleAuthorization with date range as input.
  final ResaleAuthorizationLastModifiedDateFilterDateRange? dateRange;

  ResaleAuthorizationLastModifiedDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Allows filtering on the <code>LastModifiedDate</code> of a
/// ResaleAuthorization with date range as input.
class ResaleAuthorizationLastModifiedDateFilterDateRange {
  /// Allows filtering on the <code>LastModifiedDate</code> of a
  /// ResaleAuthorization after a date.
  final String? afterValue;

  /// Allows filtering on the <code>LastModifiedDate</code> of a
  /// ResaleAuthorization before a date.
  final String? beforeValue;

  ResaleAuthorizationLastModifiedDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Allows filtering on the <code>ManufacturerAccountId</code> of a
/// ResaleAuthorization.
class ResaleAuthorizationManufacturerAccountIdFilter {
  /// Allows filtering on the <code>ManufacturerAccountId</code> of a
  /// ResaleAuthorization with list input.
  final List<String>? valueList;

  /// Allows filtering on the <code>ManufacturerAccountId</code> of a
  /// ResaleAuthorization with wild card input.
  final String? wildCardValue;

  ResaleAuthorizationManufacturerAccountIdFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the <code>ManufacturerLegalName</code> of a
/// ResaleAuthorization.
class ResaleAuthorizationManufacturerLegalNameFilter {
  /// Allows filtering on the <code>ManufacturerLegalName</code> of a
  /// ResaleAuthorization with list input.
  final List<String>? valueList;

  /// Allows filtering on the <code>ManufacturerLegalName</code> of a
  /// ResaleAuthorization with wild card input.
  final String? wildCardValue;

  ResaleAuthorizationManufacturerLegalNameFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the <code>Name</code> of a ResaleAuthorization.
class ResaleAuthorizationNameFilter {
  /// Allows filtering on the <code>Name</code> of a ResaleAuthorization with list
  /// input.
  final List<String>? valueList;

  /// Allows filtering on the <code>Name</code> of a ResaleAuthorization with wild
  /// card input.
  final String? wildCardValue;

  ResaleAuthorizationNameFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the <code>OfferExtendedStatus</code> of a
/// ResaleAuthorization.
class ResaleAuthorizationOfferExtendedStatusFilter {
  /// Allows filtering on the <code>OfferExtendedStatus</code> of a
  /// ResaleAuthorization with list input.
  final List<String>? valueList;

  ResaleAuthorizationOfferExtendedStatusFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Allows filtering on the <code>ProductId</code> of a ResaleAuthorization.
class ResaleAuthorizationProductIdFilter {
  /// Allows filtering on the <code>ProductId</code> of a ResaleAuthorization with
  /// list input.
  final List<String>? valueList;

  /// Allows filtering on the <code>ProductId</code> of a ResaleAuthorization with
  /// wild card input.
  final String? wildCardValue;

  ResaleAuthorizationProductIdFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the <code>ProductName</code> of a ResaleAuthorization.
class ResaleAuthorizationProductNameFilter {
  /// Allows filtering on the <code>ProductName</code> of a ResaleAuthorization
  /// with list input.
  final List<String>? valueList;

  /// Allows filtering on the <code>ProductName</code> of a ResaleAuthorization
  /// with wild card input.
  final String? wildCardValue;

  ResaleAuthorizationProductNameFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the <code>ResellerAccountID</code> of a
/// ResaleAuthorization.
class ResaleAuthorizationResellerAccountIDFilter {
  /// Allows filtering on the <code>ResellerAccountID</code> of a
  /// ResaleAuthorization with list input.
  final List<String>? valueList;

  /// Allows filtering on the <code>ResellerAccountID</code> of a
  /// ResaleAuthorization with wild card input.
  final String? wildCardValue;

  ResaleAuthorizationResellerAccountIDFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows filtering on the ResellerLegalName of a ResaleAuthorization.
class ResaleAuthorizationResellerLegalNameFilter {
  /// Allows filtering on the ResellerLegalNameProductName of a
  /// ResaleAuthorization with list input.
  final List<String>? valueList;

  /// Allows filtering on the ResellerLegalName of a ResaleAuthorization with wild
  /// card input.
  final String? wildCardValue;

  ResaleAuthorizationResellerLegalNameFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Allows to sort ResaleAuthorization.
class ResaleAuthorizationSort {
  /// Allows to sort ResaleAuthorization.
  final ResaleAuthorizationSortBy? sortBy;

  /// Allows to sort ResaleAuthorization.
  final SortOrder? sortOrder;

  ResaleAuthorizationSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

enum ResaleAuthorizationSortBy {
  entityId('EntityId'),
  name('Name'),
  productId('ProductId'),
  productName('ProductName'),
  manufacturerAccountId('ManufacturerAccountId'),
  manufacturerLegalName('ManufacturerLegalName'),
  resellerAccountID('ResellerAccountID'),
  resellerLegalName('ResellerLegalName'),
  status('Status'),
  offerExtendedStatus('OfferExtendedStatus'),
  createdDate('CreatedDate'),
  availabilityEndDate('AvailabilityEndDate'),
  lastModifiedDate('LastModifiedDate'),
  ;

  final String value;

  const ResaleAuthorizationSortBy(this.value);

  static ResaleAuthorizationSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ResaleAuthorizationSortBy'));
}

/// Allows filtering on the <code>Status</code> of a ResaleAuthorization.
class ResaleAuthorizationStatusFilter {
  /// Allows filtering on the <code>Status</code> of a ResaleAuthorization with
  /// list input.
  final List<ResaleAuthorizationStatusString>? valueList;

  ResaleAuthorizationStatusFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null)
        'ValueList': valueList.map((e) => e.value).toList(),
    };
  }
}

enum ResaleAuthorizationStatusString {
  draft('Draft'),
  active('Active'),
  restricted('Restricted'),
  ;

  final String value;

  const ResaleAuthorizationStatusString(this.value);

  static ResaleAuthorizationStatusString fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ResaleAuthorizationStatusString'));
}

/// Summarized information about a Resale Authorization.
class ResaleAuthorizationSummary {
  /// The availability end date of the ResaleAuthorization.
  final String? availabilityEndDate;

  /// The created date of the ResaleAuthorization.
  final String? createdDate;

  /// The manufacturer account ID of the ResaleAuthorization.
  final String? manufacturerAccountId;

  /// The manufacturer legal name of the ResaleAuthorization.
  final String? manufacturerLegalName;

  /// The name of the ResaleAuthorization.
  final String? name;

  /// The offer extended status of the ResaleAuthorization
  final String? offerExtendedStatus;

  /// The product ID of the ResaleAuthorization.
  final String? productId;

  /// The product name of the ResaleAuthorization.
  final String? productName;

  /// The reseller account ID of the ResaleAuthorization.
  final String? resellerAccountID;

  /// The reseller legal name of the ResaleAuthorization
  final String? resellerLegalName;

  /// The status of the ResaleAuthorization.
  final ResaleAuthorizationStatusString? status;

  ResaleAuthorizationSummary({
    this.availabilityEndDate,
    this.createdDate,
    this.manufacturerAccountId,
    this.manufacturerLegalName,
    this.name,
    this.offerExtendedStatus,
    this.productId,
    this.productName,
    this.resellerAccountID,
    this.resellerLegalName,
    this.status,
  });

  factory ResaleAuthorizationSummary.fromJson(Map<String, dynamic> json) {
    return ResaleAuthorizationSummary(
      availabilityEndDate: json['AvailabilityEndDate'] as String?,
      createdDate: json['CreatedDate'] as String?,
      manufacturerAccountId: json['ManufacturerAccountId'] as String?,
      manufacturerLegalName: json['ManufacturerLegalName'] as String?,
      name: json['Name'] as String?,
      offerExtendedStatus: json['OfferExtendedStatus'] as String?,
      productId: json['ProductId'] as String?,
      productName: json['ProductName'] as String?,
      resellerAccountID: json['ResellerAccountID'] as String?,
      resellerLegalName: json['ResellerLegalName'] as String?,
      status: (json['Status'] as String?)
          ?.let(ResaleAuthorizationStatusString.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityEndDate = this.availabilityEndDate;
    final createdDate = this.createdDate;
    final manufacturerAccountId = this.manufacturerAccountId;
    final manufacturerLegalName = this.manufacturerLegalName;
    final name = this.name;
    final offerExtendedStatus = this.offerExtendedStatus;
    final productId = this.productId;
    final productName = this.productName;
    final resellerAccountID = this.resellerAccountID;
    final resellerLegalName = this.resellerLegalName;
    final status = this.status;
    return {
      if (availabilityEndDate != null)
        'AvailabilityEndDate': availabilityEndDate,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (manufacturerAccountId != null)
        'ManufacturerAccountId': manufacturerAccountId,
      if (manufacturerLegalName != null)
        'ManufacturerLegalName': manufacturerLegalName,
      if (name != null) 'Name': name,
      if (offerExtendedStatus != null)
        'OfferExtendedStatus': offerExtendedStatus,
      if (productId != null) 'ProductId': productId,
      if (productName != null) 'ProductName': productName,
      if (resellerAccountID != null) 'ResellerAccountID': resellerAccountID,
      if (resellerLegalName != null) 'ResellerLegalName': resellerLegalName,
      if (status != null) 'Status': status.value,
    };
  }
}

/// Object that allows filtering on entity id of a SaaS product.
class SaaSProductEntityIdFilter {
  /// A string array of unique entity id values to be filtered on.
  final List<String>? valueList;

  SaaSProductEntityIdFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null) 'ValueList': valueList,
    };
  }
}

/// Object containing all the filter fields for SaaS products. Client can add
/// only one wildcard filter and a maximum of 8 filters in a single
/// <code>ListEntities</code> request.
class SaaSProductFilters {
  /// Unique identifier for the SaaS product.
  final SaaSProductEntityIdFilter? entityId;

  /// The last date on which the SaaS product was modified.
  final SaaSProductLastModifiedDateFilter? lastModifiedDate;

  /// The title of the SaaS product.
  final SaaSProductTitleFilter? productTitle;

  /// The visibility of the SaaS product.
  final SaaSProductVisibilityFilter? visibility;

  SaaSProductFilters({
    this.entityId,
    this.lastModifiedDate,
    this.productTitle,
    this.visibility,
  });

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final lastModifiedDate = this.lastModifiedDate;
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (entityId != null) 'EntityId': entityId,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility,
    };
  }
}

/// Object that allows filtering based on the last modified date of SaaS
/// products
class SaaSProductLastModifiedDateFilter {
  /// Dates between which the SaaS product was last modified.
  final SaaSProductLastModifiedDateFilterDateRange? dateRange;

  SaaSProductLastModifiedDateFilter({
    this.dateRange,
  });

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    return {
      if (dateRange != null) 'DateRange': dateRange,
    };
  }
}

/// Object that contains date range of the last modified date to be filtered on.
/// You can optionally provide a <code>BeforeValue</code> and/or
/// <code>AfterValue</code>. Both are inclusive.
class SaaSProductLastModifiedDateFilterDateRange {
  /// Date after which the SaaS product was last modified.
  final String? afterValue;

  /// Date before which the SaaS product was last modified.
  final String? beforeValue;

  SaaSProductLastModifiedDateFilterDateRange({
    this.afterValue,
    this.beforeValue,
  });

  Map<String, dynamic> toJson() {
    final afterValue = this.afterValue;
    final beforeValue = this.beforeValue;
    return {
      if (afterValue != null) 'AfterValue': afterValue,
      if (beforeValue != null) 'BeforeValue': beforeValue,
    };
  }
}

/// Objects that allows sorting on SaaS products based on certain fields and
/// sorting order.
class SaaSProductSort {
  /// Field to sort the SaaS products by.
  final SaaSProductSortBy? sortBy;

  /// The sorting order. Can be <code>ASCENDING</code> or <code>DESCENDING</code>.
  /// The default value is <code>DESCENDING</code>.
  final SortOrder? sortOrder;

  SaaSProductSort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy.value,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

enum SaaSProductSortBy {
  entityId('EntityId'),
  productTitle('ProductTitle'),
  visibility('Visibility'),
  lastModifiedDate('LastModifiedDate'),
  ;

  final String value;

  const SaaSProductSortBy(this.value);

  static SaaSProductSortBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SaaSProductSortBy'));
}

/// Object that contains summarized information about a SaaS product.
class SaaSProductSummary {
  /// The title of the SaaS product.
  final String? productTitle;

  /// The lifecycle of the SaaS product.
  final SaaSProductVisibilityString? visibility;

  SaaSProductSummary({
    this.productTitle,
    this.visibility,
  });

  factory SaaSProductSummary.fromJson(Map<String, dynamic> json) {
    return SaaSProductSummary(
      productTitle: json['ProductTitle'] as String?,
      visibility: (json['Visibility'] as String?)
          ?.let(SaaSProductVisibilityString.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final productTitle = this.productTitle;
    final visibility = this.visibility;
    return {
      if (productTitle != null) 'ProductTitle': productTitle,
      if (visibility != null) 'Visibility': visibility.value,
    };
  }
}

/// Object that allows filtering on product title.
class SaaSProductTitleFilter {
  /// A string array of unique product title values to be filtered on.
  final List<String>? valueList;

  /// A string that will be the <code>wildCard</code> input for product tile
  /// filter. It matches the provided value as a substring in the actual value.
  final String? wildCardValue;

  SaaSProductTitleFilter({
    this.valueList,
    this.wildCardValue,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    final wildCardValue = this.wildCardValue;
    return {
      if (valueList != null) 'ValueList': valueList,
      if (wildCardValue != null) 'WildCardValue': wildCardValue,
    };
  }
}

/// Object that allows filtering on the visibility of the product in the AWS
/// Marketplace.
class SaaSProductVisibilityFilter {
  /// A string array of unique visibility values to be filtered on.
  final List<SaaSProductVisibilityString>? valueList;

  SaaSProductVisibilityFilter({
    this.valueList,
  });

  Map<String, dynamic> toJson() {
    final valueList = this.valueList;
    return {
      if (valueList != null)
        'ValueList': valueList.map((e) => e.value).toList(),
    };
  }
}

enum SaaSProductVisibilityString {
  limited('Limited'),
  public('Public'),
  restricted('Restricted'),
  draft('Draft'),
  ;

  final String value;

  const SaaSProductVisibilityString(this.value);

  static SaaSProductVisibilityString fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SaaSProductVisibilityString'));
}

/// An object that contains two attributes, <code>SortBy</code> and
/// <code>SortOrder</code>.
class Sort {
  /// For <code>ListEntities</code>, supported attributes include
  /// <code>LastModifiedDate</code> (default) and <code>EntityId</code>. In
  /// addition to <code>LastModifiedDate</code> and <code>EntityId</code>, each
  /// <code>EntityType</code> might support additional fields.
  ///
  /// For <code>ListChangeSets</code>, supported attributes include
  /// <code>StartTime</code> and <code>EndTime</code>.
  final String? sortBy;

  /// The sorting order. Can be <code>ASCENDING</code> or <code>DESCENDING</code>.
  /// The default value is <code>DESCENDING</code>.
  final SortOrder? sortOrder;

  Sort({
    this.sortBy,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder.value,
    };
  }
}

enum SortOrder {
  ascending('ASCENDING'),
  descending('DESCENDING'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
}

class StartChangeSetResponse {
  /// The ARN associated to the unique identifier generated for the request.
  final String? changeSetArn;

  /// Unique identifier generated for the request.
  final String? changeSetId;

  StartChangeSetResponse({
    this.changeSetArn,
    this.changeSetId,
  });

  factory StartChangeSetResponse.fromJson(Map<String, dynamic> json) {
    return StartChangeSetResponse(
      changeSetArn: json['ChangeSetArn'] as String?,
      changeSetId: json['ChangeSetId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeSetArn = this.changeSetArn;
    final changeSetId = this.changeSetId;
    return {
      if (changeSetArn != null) 'ChangeSetArn': changeSetArn,
      if (changeSetId != null) 'ChangeSetId': changeSetId,
    };
  }
}

/// A list of objects specifying each key name and value.
class Tag {
  /// The key associated with the tag.
  final String key;

  /// The value associated with the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotSupportedException extends _s.GenericAwsException {
  ResourceNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceNotSupportedException',
            message: message);
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
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceNotSupportedException': (type, message) =>
      ResourceNotSupportedException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
