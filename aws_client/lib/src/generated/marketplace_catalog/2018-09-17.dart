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
    required String catalog,
    required String changeSetId,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
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
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
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
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
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
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
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
    required String catalog,
    required String entityType,
    List<Filter>? filterList,
    int? maxResults,
    String? nextToken,
    Sort? sort,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
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
  /// later in this topic, because it contains two changes to execute the same
  /// change type (<code>AddRevisions</code>) against the same entity
  /// (<code>entity-id@1)</code>.
  ///
  /// For more information about working with change sets, see <a
  /// href="https://docs.aws.amazon.com/marketplace-catalog/latest/api-reference/welcome.html#working-with-change-sets">
  /// Working with change sets</a>.
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
    required String catalog,
    required List<Change> changeSet,
    String? changeSetName,
    String? clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(catalog, 'catalog');
    _s.validateStringLength(
      'catalog',
      catalog,
      1,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(changeSet, 'changeSet');
    _s.validateStringLength(
      'changeSetName',
      changeSetName,
      1,
      100,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      36,
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
  /// in the change's scope.
  final String changeType;

  /// This object contains details specific to the change type of the requested
  /// change.
  final String details;

  /// The entity to be changed.
  final Entity entity;

  /// Optional name for the change.
  final String? changeName;

  Change({
    required this.changeType,
    required this.details,
    required this.entity,
    this.changeName,
  });

  factory Change.fromJson(Map<String, dynamic> json) {
    return Change(
      changeType: json['ChangeType'] as String,
      details: json['Details'] as String,
      entity: Entity.fromJson(json['Entity'] as Map<String, dynamic>),
      changeName: json['ChangeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeType = this.changeType;
    final details = this.details;
    final entity = this.entity;
    final changeName = this.changeName;
    return {
      'ChangeType': changeType,
      'Details': details,
      'Entity': entity,
      if (changeName != null) 'ChangeName': changeName,
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      failureCode: (json['FailureCode'] as String?)?.toFailureCode(),
      startTime: json['StartTime'] as String?,
      status: (json['Status'] as String?)?.toChangeStatus(),
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
      if (failureCode != null) 'FailureCode': failureCode.toValue(),
      if (startTime != null) 'StartTime': startTime,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ChangeStatus {
  preparing,
  applying,
  succeeded,
  cancelled,
  failed,
}

extension on ChangeStatus {
  String toValue() {
    switch (this) {
      case ChangeStatus.preparing:
        return 'PREPARING';
      case ChangeStatus.applying:
        return 'APPLYING';
      case ChangeStatus.succeeded:
        return 'SUCCEEDED';
      case ChangeStatus.cancelled:
        return 'CANCELLED';
      case ChangeStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ChangeStatus toChangeStatus() {
    switch (this) {
      case 'PREPARING':
        return ChangeStatus.preparing;
      case 'APPLYING':
        return ChangeStatus.applying;
      case 'SUCCEEDED':
        return ChangeStatus.succeeded;
      case 'CANCELLED':
        return ChangeStatus.cancelled;
      case 'FAILED':
        return ChangeStatus.failed;
    }
    throw Exception('$this is not known in enum ChangeStatus');
  }
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

  /// The entity to be changed.
  final Entity? entity;

  /// An array of <code>ErrorDetail</code> objects associated with the change.
  final List<ErrorDetail>? errorDetailList;

  ChangeSummary({
    this.changeName,
    this.changeType,
    this.details,
    this.entity,
    this.errorDetailList,
  });

  factory ChangeSummary.fromJson(Map<String, dynamic> json) {
    return ChangeSummary(
      changeName: json['ChangeName'] as String?,
      changeType: json['ChangeType'] as String?,
      details: json['Details'] as String?,
      entity: json['Entity'] != null
          ? Entity.fromJson(json['Entity'] as Map<String, dynamic>)
          : null,
      errorDetailList: (json['ErrorDetailList'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeName = this.changeName;
    final changeType = this.changeType;
    final details = this.details;
    final entity = this.entity;
    final errorDetailList = this.errorDetailList;
    return {
      if (changeName != null) 'ChangeName': changeName,
      if (changeType != null) 'ChangeType': changeType,
      if (details != null) 'Details': details,
      if (entity != null) 'Entity': entity,
      if (errorDetailList != null) 'ErrorDetailList': errorDetailList,
    };
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
    this.startTime,
    this.status,
  });

  factory DescribeChangeSetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChangeSetResponse(
      changeSet: (json['ChangeSet'] as List?)
          ?.whereNotNull()
          .map((e) => ChangeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      changeSetArn: json['ChangeSetArn'] as String?,
      changeSetId: json['ChangeSetId'] as String?,
      changeSetName: json['ChangeSetName'] as String?,
      endTime: json['EndTime'] as String?,
      failureCode: (json['FailureCode'] as String?)?.toFailureCode(),
      failureDescription: json['FailureDescription'] as String?,
      startTime: json['StartTime'] as String?,
      status: (json['Status'] as String?)?.toChangeStatus(),
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
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (changeSet != null) 'ChangeSet': changeSet,
      if (changeSetArn != null) 'ChangeSetArn': changeSetArn,
      if (changeSetId != null) 'ChangeSetId': changeSetId,
      if (changeSetName != null) 'ChangeSetName': changeSetName,
      if (endTime != null) 'EndTime': endTime,
      if (failureCode != null) 'FailureCode': failureCode.toValue(),
      if (failureDescription != null) 'FailureDescription': failureDescription,
      if (startTime != null) 'StartTime': startTime,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeEntityResponse {
  /// This stringified JSON object includes the details of the entity.
  final String? details;

  /// The ARN associated to the unique identifier for the change set referenced in
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
    this.entityArn,
    this.entityIdentifier,
    this.entityType,
    this.lastModifiedDate,
  });

  factory DescribeEntityResponse.fromJson(Map<String, dynamic> json) {
    return DescribeEntityResponse(
      details: json['Details'] as String?,
      entityArn: json['EntityArn'] as String?,
      entityIdentifier: json['EntityIdentifier'] as String?,
      entityType: json['EntityType'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final entityArn = this.entityArn;
    final entityIdentifier = this.entityIdentifier;
    final entityType = this.entityType;
    final lastModifiedDate = this.lastModifiedDate;
    return {
      if (details != null) 'Details': details,
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

/// This object is a container for common summary information about the entity.
/// The summary doesn't contain the whole entity structure, but it does contain
/// information common across all entities.
class EntitySummary {
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

  /// The visibility status of the entity to buyers. This value can be
  /// <code>Public</code> (everyone can view the entity), <code>Limited</code>
  /// (the entity is visible to limited accounts only), or <code>Restricted</code>
  /// (the entity was published and then unpublished and only existing buyers can
  /// view it).
  final String? visibility;

  EntitySummary({
    this.entityArn,
    this.entityId,
    this.entityType,
    this.lastModifiedDate,
    this.name,
    this.visibility,
  });

  factory EntitySummary.fromJson(Map<String, dynamic> json) {
    return EntitySummary(
      entityArn: json['EntityArn'] as String?,
      entityId: json['EntityId'] as String?,
      entityType: json['EntityType'] as String?,
      lastModifiedDate: json['LastModifiedDate'] as String?,
      name: json['Name'] as String?,
      visibility: json['Visibility'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityArn = this.entityArn;
    final entityId = this.entityId;
    final entityType = this.entityType;
    final lastModifiedDate = this.lastModifiedDate;
    final name = this.name;
    final visibility = this.visibility;
    return {
      if (entityArn != null) 'EntityArn': entityArn,
      if (entityId != null) 'EntityId': entityId,
      if (entityType != null) 'EntityType': entityType,
      if (lastModifiedDate != null) 'LastModifiedDate': lastModifiedDate,
      if (name != null) 'Name': name,
      if (visibility != null) 'Visibility': visibility,
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
  clientError,
  serverFault,
}

extension on FailureCode {
  String toValue() {
    switch (this) {
      case FailureCode.clientError:
        return 'CLIENT_ERROR';
      case FailureCode.serverFault:
        return 'SERVER_FAULT';
    }
  }
}

extension on String {
  FailureCode toFailureCode() {
    switch (this) {
      case 'CLIENT_ERROR':
        return FailureCode.clientError;
      case 'SERVER_FAULT':
        return FailureCode.serverFault;
    }
    throw Exception('$this is not known in enum FailureCode');
  }
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

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      name: json['Name'] as String?,
      valueList: (json['ValueList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final valueList = this.valueList;
    return {
      if (name != null) 'Name': name,
      if (valueList != null) 'ValueList': valueList,
    };
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
          ?.whereNotNull()
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
  /// Array of <code>EntitySummary</code> object.
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
          ?.whereNotNull()
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

/// An object that contains two attributes, <code>SortBy</code> and
/// <code>SortOrder</code>.
class Sort {
  /// For <code>ListEntities</code>, supported attributes include
  /// <code>LastModifiedDate</code> (default), <code>Visibility</code>,
  /// <code>EntityId</code>, and <code>Name</code>.
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

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      sortBy: json['SortBy'] as String?,
      sortOrder: (json['SortOrder'] as String?)?.toSortOrder(),
    );
  }

  Map<String, dynamic> toJson() {
    final sortBy = this.sortBy;
    final sortOrder = this.sortOrder;
    return {
      if (sortBy != null) 'SortBy': sortBy,
      if (sortOrder != null) 'SortOrder': sortOrder.toValue(),
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension on String {
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
