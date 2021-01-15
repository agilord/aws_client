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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2018-09-17.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'catalog.marketplace',
            signingName: 'aws-marketplace',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String catalog,
    @_s.required String changeSetId,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'catalog',
      catalog,
      r'''^[a-zA-Z]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(changeSetId, 'changeSetId');
    _s.validateStringLength(
      'changeSetId',
      changeSetId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'changeSetId',
      changeSetId,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (catalog != null) 'catalog': [catalog],
      if (changeSetId != null) 'changeSetId': [changeSetId],
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
    @_s.required String catalog,
    @_s.required String changeSetId,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'catalog',
      catalog,
      r'''^[a-zA-Z]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(changeSetId, 'changeSetId');
    _s.validateStringLength(
      'changeSetId',
      changeSetId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'changeSetId',
      changeSetId,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (catalog != null) 'catalog': [catalog],
      if (changeSetId != null) 'changeSetId': [changeSetId],
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
    @_s.required String catalog,
    @_s.required String entityId,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'catalog',
      catalog,
      r'''^[a-zA-Z]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityId, 'entityId');
    _s.validateStringLength(
      'entityId',
      entityId,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'entityId',
      entityId,
      r'''^[\w\-]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (catalog != null) 'catalog': [catalog],
      if (entityId != null) 'entityId': [entityId],
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
    @_s.required String catalog,
    List<Filter> filterList,
    int maxResults,
    String nextToken,
    Sort sort,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'catalog',
      catalog,
      r'''^[a-zA-Z]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w+=.:@\-\/]$''',
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
  /// The type of entities to retrieve.
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
  /// Parameter [sort] :
  /// An object that contains two attributes, <code>SortBy</code> and
  /// <code>SortOrder</code>.
  Future<ListEntitiesResponse> listEntities({
    @_s.required String catalog,
    @_s.required String entityType,
    List<Filter> filterList,
    int maxResults,
    String nextToken,
    Sort sort,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'catalog',
      catalog,
      r'''^[a-zA-Z]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(entityType, 'entityType');
    _s.validateStringLength(
      'entityType',
      entityType,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'entityType',
      entityType,
      r'''^[a-zA-Z]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      20,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w+=.:@\-\/]$''',
    );
    final $payload = <String, dynamic>{
      'Catalog': catalog,
      'EntityType': entityType,
      if (filterList != null) 'FilterList': filterList,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
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

  /// This operation allows you to request changes for your entities. Within a
  /// single ChangeSet, you cannot start the same change type against the same
  /// entity multiple times. Additionally, when a ChangeSet is running, all the
  /// entities targeted by the different changes are locked until the ChangeSet
  /// has completed (either succeeded, cancelled, or failed). If you try to
  /// start a ChangeSet containing a change against an entity that is already
  /// locked, you will receive a <code>ResourceInUseException</code>.
  ///
  /// For example, you cannot start the ChangeSet described in the <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/API_StartChangeSet.html#API_StartChangeSet_Examples">example</a>
  /// below because it contains two changes to execute the same change type
  /// (<code>AddRevisions</code>) against the same entity
  /// (<code>entity-id@1)</code>.
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
  /// Parameter [clientRequestToken] :
  /// A unique token to identify the request to ensure idempotency.
  Future<StartChangeSetResponse> startChangeSet({
    @_s.required String catalog,
    @_s.required List<Change> changeSet,
    String changeSetName,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'catalog',
      catalog,
      r'''^[a-zA-Z]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(changeSet, 'changeSet');
    _s.validateStringLength(
      'changeSetName',
      changeSetName,
      1,
      100,
    );
    _s.validateStringPattern(
      'changeSetName',
      changeSetName,
      r'''^[\w\s+=.:@-]+$''',
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      36,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w\-]+$''',
    );
    final $payload = <String, dynamic>{
      'Catalog': catalog,
      'ChangeSet': changeSet,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartChangeSet',
      exceptionFnMap: _exceptionFns,
    );
    return StartChangeSetResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelChangeSetResponse {
  /// The ARN associated with the change set referenced in this request.
  @_s.JsonKey(name: 'ChangeSetArn')
  final String changeSetArn;

  /// The unique identifier for the change set referenced in this request.
  @_s.JsonKey(name: 'ChangeSetId')
  final String changeSetId;

  CancelChangeSetResponse({
    this.changeSetArn,
    this.changeSetId,
  });
  factory CancelChangeSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelChangeSetResponseFromJson(json);
}

/// An object that contains the <code>ChangeType</code>, <code>Details</code>,
/// and <code>Entity</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Change {
  /// Change types are single string values that describe your intention for the
  /// change. Each change type is unique for each <code>EntityType</code> provided
  /// in the change's scope.
  @_s.JsonKey(name: 'ChangeType')
  final String changeType;

  /// This object contains details specific to the change type of the requested
  /// change.
  @_s.JsonKey(name: 'Details')
  final String details;

  /// The entity to be changed.
  @_s.JsonKey(name: 'Entity')
  final Entity entity;

  Change({
    @_s.required this.changeType,
    @_s.required this.details,
    @_s.required this.entity,
  });
  Map<String, dynamic> toJson() => _$ChangeToJson(this);
}

/// A summary of a change set returned in a list of change sets when the
/// <code>ListChangeSets</code> action is called.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChangeSetSummaryListItem {
  /// The ARN associated with the unique identifier for the change set referenced
  /// in this request.
  @_s.JsonKey(name: 'ChangeSetArn')
  final String changeSetArn;

  /// The unique identifier for a change set.
  @_s.JsonKey(name: 'ChangeSetId')
  final String changeSetId;

  /// The non-unique name for the change set.
  @_s.JsonKey(name: 'ChangeSetName')
  final String changeSetName;

  /// The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was
  /// finished.
  @_s.JsonKey(name: 'EndTime')
  final String endTime;

  /// This object is a list of entity IDs (string) that are a part of a change
  /// set. The entity ID list is a maximum of 20 entities. It must contain at
  /// least one entity.
  @_s.JsonKey(name: 'EntityIdList')
  final List<String> entityIdList;

  /// Returned if the change set is in <code>FAILED</code> status. Can be either
  /// <code>CLIENT_ERROR</code>, which means that there are issues with the
  /// request (see the <code>ErrorDetailList</code> of
  /// <code>DescribeChangeSet</code>), or <code>SERVER_FAULT</code>, which means
  /// that there is a problem in the system, and you should retry your request.
  @_s.JsonKey(name: 'FailureCode')
  final FailureCode failureCode;

  /// The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was
  /// started.
  @_s.JsonKey(name: 'StartTime')
  final String startTime;

  /// The current status of the change set.
  @_s.JsonKey(name: 'Status')
  final ChangeStatus status;

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
  factory ChangeSetSummaryListItem.fromJson(Map<String, dynamic> json) =>
      _$ChangeSetSummaryListItemFromJson(json);
}

enum ChangeStatus {
  @_s.JsonValue('PREPARING')
  preparing,
  @_s.JsonValue('APPLYING')
  applying,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('FAILED')
  failed,
}

/// This object is a container for common summary information about the change.
/// The summary doesn't contain the whole change structure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChangeSummary {
  /// The type of the change.
  @_s.JsonKey(name: 'ChangeType')
  final String changeType;

  /// This object contains details specific to the change type of the requested
  /// change.
  @_s.JsonKey(name: 'Details')
  final String details;

  /// The entity to be changed.
  @_s.JsonKey(name: 'Entity')
  final Entity entity;

  /// An array of <code>ErrorDetail</code> objects associated with the change.
  @_s.JsonKey(name: 'ErrorDetailList')
  final List<ErrorDetail> errorDetailList;

  ChangeSummary({
    this.changeType,
    this.details,
    this.entity,
    this.errorDetailList,
  });
  factory ChangeSummary.fromJson(Map<String, dynamic> json) =>
      _$ChangeSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChangeSetResponse {
  /// An array of <code>ChangeSummary</code> objects.
  @_s.JsonKey(name: 'ChangeSet')
  final List<ChangeSummary> changeSet;

  /// The ARN associated with the unique identifier for the change set referenced
  /// in this request.
  @_s.JsonKey(name: 'ChangeSetArn')
  final String changeSetArn;

  /// Required. The unique identifier for the change set referenced in this
  /// request.
  @_s.JsonKey(name: 'ChangeSetId')
  final String changeSetId;

  /// The optional name provided in the <code>StartChangeSet</code> request. If
  /// you do not provide a name, one is set by default.
  @_s.JsonKey(name: 'ChangeSetName')
  final String changeSetName;

  /// The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request
  /// transitioned to a terminal state. The change cannot transition to a
  /// different state. Null if the request is not in a terminal state.
  @_s.JsonKey(name: 'EndTime')
  final String endTime;

  /// Returned if the change set is in <code>FAILED</code> status. Can be either
  /// <code>CLIENT_ERROR</code>, which means that there are issues with the
  /// request (see the <code>ErrorDetailList</code>), or
  /// <code>SERVER_FAULT</code>, which means that there is a problem in the
  /// system, and you should retry your request.
  @_s.JsonKey(name: 'FailureCode')
  final FailureCode failureCode;

  /// Returned if there is a failure on the change set, but that failure is not
  /// related to any of the changes in the request.
  @_s.JsonKey(name: 'FailureDescription')
  final String failureDescription;

  /// The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request
  /// started.
  @_s.JsonKey(name: 'StartTime')
  final String startTime;

  /// The status of the change request.
  @_s.JsonKey(name: 'Status')
  final ChangeStatus status;

  DescribeChangeSetResponse({
    this.changeSet,
    this.changeSetArn,
    this.changeSetId,
    this.changeSetName,
    this.endTime,
    this.failureCode,
    this.failureDescription,
    this.startTime,
    this.status,
  });
  factory DescribeChangeSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeChangeSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEntityResponse {
  /// This stringified JSON object includes the details of the entity.
  @_s.JsonKey(name: 'Details')
  final String details;

  /// The ARN associated to the unique identifier for the change set referenced in
  /// this request.
  @_s.JsonKey(name: 'EntityArn')
  final String entityArn;

  /// The identifier of the entity, in the format of
  /// <code>EntityId@RevisionId</code>.
  @_s.JsonKey(name: 'EntityIdentifier')
  final String entityIdentifier;

  /// The named type of the entity, in the format of
  /// <code>EntityType@Version</code>.
  @_s.JsonKey(name: 'EntityType')
  final String entityType;

  /// The last modified date of the entity, in ISO 8601 format
  /// (2018-02-27T13:45:22Z).
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  DescribeEntityResponse({
    this.details,
    this.entityArn,
    this.entityIdentifier,
    this.entityType,
    this.lastModifiedDate,
  });
  factory DescribeEntityResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEntityResponseFromJson(json);
}

/// A product entity contains data that describes your product, its supported
/// features, and how it can be used or launched by your customer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Entity {
  /// The type of entity.
  @_s.JsonKey(name: 'Type')
  final String type;

  /// The identifier for the entity.
  @_s.JsonKey(name: 'Identifier')
  final String identifier;

  Entity({
    @_s.required this.type,
    this.identifier,
  });
  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

/// This object is a container for common summary information about the entity.
/// The summary doesn't contain the whole entity structure, but it does contain
/// information common across all entities.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EntitySummary {
  /// The ARN associated with the unique identifier for the entity.
  @_s.JsonKey(name: 'EntityArn')
  final String entityArn;

  /// The unique identifier for the entity.
  @_s.JsonKey(name: 'EntityId')
  final String entityId;

  /// The type of the entity.
  @_s.JsonKey(name: 'EntityType')
  final String entityType;

  /// The last time the entity was published, using ISO 8601 format
  /// (2018-02-27T13:45:22Z).
  @_s.JsonKey(name: 'LastModifiedDate')
  final String lastModifiedDate;

  /// The name for the entity. This value is not unique. It is defined by the
  /// seller.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The visibility status of the entity to buyers. This value can be
  /// <code>Public</code> (everyone can view the entity), <code>Limited</code>
  /// (the entity is visible to limited accounts only), or <code>Restricted</code>
  /// (the entity was published and then unpublished and only existing buyers can
  /// view it).
  @_s.JsonKey(name: 'Visibility')
  final String visibility;

  EntitySummary({
    this.entityArn,
    this.entityId,
    this.entityType,
    this.lastModifiedDate,
    this.name,
    this.visibility,
  });
  factory EntitySummary.fromJson(Map<String, dynamic> json) =>
      _$EntitySummaryFromJson(json);
}

/// Details about the error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorDetail {
  /// The error code that identifies the type of error.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The message for the error.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  ErrorDetail({
    this.errorCode,
    this.errorMessage,
  });
  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);
}

enum FailureCode {
  @_s.JsonValue('CLIENT_ERROR')
  clientError,
  @_s.JsonValue('SERVER_FAULT')
  serverFault,
}

/// A filter object, used to optionally filter results from calls to the
/// <code>ListEntities</code> and <code>ListChangeSets</code> actions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// For <code>ListEntities</code>, the supported value for this is an
  /// <code>EntityId</code>.
  ///
  /// For <code>ListChangeSets</code>, the supported values are as follows:
  @_s.JsonKey(name: 'Name')
  final String name;

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
  @_s.JsonKey(name: 'ValueList')
  final List<String> valueList;

  Filter({
    this.name,
    this.valueList,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChangeSetsResponse {
  /// Array of <code>ChangeSetSummaryListItem</code> objects.
  @_s.JsonKey(name: 'ChangeSetSummaryList')
  final List<ChangeSetSummaryListItem> changeSetSummaryList;

  /// The value of the next token, if it exists. Null if there are no more
  /// results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChangeSetsResponse({
    this.changeSetSummaryList,
    this.nextToken,
  });
  factory ListChangeSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChangeSetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEntitiesResponse {
  /// Array of <code>EntitySummary</code> object.
  @_s.JsonKey(name: 'EntitySummaryList')
  final List<EntitySummary> entitySummaryList;

  /// The value of the next token if it exists. Null if there is no more result.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEntitiesResponse({
    this.entitySummaryList,
    this.nextToken,
  });
  factory ListEntitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEntitiesResponseFromJson(json);
}

/// An object that contains two attributes, <code>SortBy</code> and
/// <code>SortOrder</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Sort {
  /// For <code>ListEntities</code>, supported attributes include
  /// <code>LastModifiedDate</code> (default), <code>Visibility</code>,
  /// <code>EntityId</code>, and <code>Name</code>.
  ///
  /// For <code>ListChangeSets</code>, supported attributes include
  /// <code>StartTime</code> and <code>EndTime</code>.
  @_s.JsonKey(name: 'SortBy')
  final String sortBy;

  /// The sorting order. Can be <code>ASCENDING</code> or <code>DESCENDING</code>.
  /// The default value is <code>DESCENDING</code>.
  @_s.JsonKey(name: 'SortOrder')
  final SortOrder sortOrder;

  Sort({
    this.sortBy,
    this.sortOrder,
  });
  Map<String, dynamic> toJson() => _$SortToJson(this);
}

enum SortOrder {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartChangeSetResponse {
  /// The ARN associated to the unique identifier generated for the request.
  @_s.JsonKey(name: 'ChangeSetArn')
  final String changeSetArn;

  /// Unique identifier generated for the request.
  @_s.JsonKey(name: 'ChangeSetId')
  final String changeSetId;

  StartChangeSetResponse({
    this.changeSetArn,
    this.changeSetId,
  });
  factory StartChangeSetResponse.fromJson(Map<String, dynamic> json) =>
      _$StartChangeSetResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotSupportedException extends _s.GenericAwsException {
  ResourceNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'ResourceNotSupportedException',
            message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
