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

/// This AWS CodeStar Notifications API Reference provides descriptions and
/// usage examples of the operations and data types for the AWS CodeStar
/// Notifications API. You can use the AWS CodeStar Notifications API to work
/// with the following objects:
///
/// Notification rules, by calling the following:
///
/// <ul>
/// <li>
/// <a>CreateNotificationRule</a>, which creates a notification rule for a
/// resource in your account.
/// </li>
/// <li>
/// <a>DeleteNotificationRule</a>, which deletes a notification rule.
/// </li>
/// <li>
/// <a>DescribeNotificationRule</a>, which provides information about a
/// notification rule.
/// </li>
/// <li>
/// <a>ListNotificationRules</a>, which lists the notification rules associated
/// with your account.
/// </li>
/// <li>
/// <a>UpdateNotificationRule</a>, which changes the name, events, or targets
/// associated with a notification rule.
/// </li>
/// <li>
/// <a>Subscribe</a>, which subscribes a target to a notification rule.
/// </li>
/// <li>
/// <a>Unsubscribe</a>, which removes a target from a notification rule.
/// </li>
/// </ul>
/// Targets, by calling the following:
///
/// <ul>
/// <li>
/// <a>DeleteTarget</a>, which removes a notification rule target from a
/// notification rule.
/// </li>
/// <li>
/// <a>ListTargets</a>, which lists the targets associated with a notification
/// rule.
/// </li>
/// </ul>
/// Events, by calling the following:
///
/// <ul>
/// <li>
/// <a>ListEventTypes</a>, which lists the event types you can include in a
/// notification rule.
/// </li>
/// </ul>
/// Tags, by calling the following:
///
/// <ul>
/// <li>
/// <a>ListTagsForResource</a>, which lists the tags already associated with a
/// notification rule in your account.
/// </li>
/// <li>
/// <a>TagResource</a>, which associates a tag you provide with a notification
/// rule in your account.
/// </li>
/// <li>
/// <a>UntagResource</a>, which removes a tag from a notification rule in your
/// account.
/// </li>
/// </ul>
/// For information about how to use AWS CodeStar Notifications, see the <a
/// href="https://docs.aws.amazon.com/dtconsole/latest/userguide/what-is-dtconsole.html">Amazon
/// Web Services Developer Tools Console User Guide</a>.
class CodeStarNotifications {
  final _s.RestJsonProtocol _protocol;
  CodeStarNotifications({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codestar-notifications',
            signingName: 'codestar-notifications',
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

  /// Creates a notification rule for a resource. The rule specifies the events
  /// you want notifications about and the targets (such as Chatbot topics or
  /// Chatbot clients configured for Slack) where you want to receive them.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConfigurationException].
  /// May throw [ConcurrentModificationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [detailType] :
  /// The level of detail to include in the notifications for this resource.
  /// <code>BASIC</code> will include only the contents of the event as it would
  /// appear in Amazon CloudWatch. <code>FULL</code> will include any
  /// supplemental information provided by AWS CodeStar Notifications and/or the
  /// service for the resource for which the notification is created.
  ///
  /// Parameter [eventTypeIds] :
  /// A list of event types associated with this notification rule. For a list
  /// of allowed events, see <a>EventTypeSummary</a>.
  ///
  /// Parameter [name] :
  /// The name for the notification rule. Notification rule names must be unique
  /// in your Amazon Web Services account.
  ///
  /// Parameter [resource] :
  /// The Amazon Resource Name (ARN) of the resource to associate with the
  /// notification rule. Supported resources include pipelines in CodePipeline,
  /// repositories in CodeCommit, and build projects in CodeBuild.
  ///
  /// Parameter [targets] :
  /// A list of Amazon Resource Names (ARNs) of Amazon Simple Notification
  /// Service topics and Chatbot clients to associate with the notification
  /// rule.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request with the same parameters is received and a token is included,
  /// the request returns information about the initial request that used that
  /// token.
  /// <note>
  /// The Amazon Web Services SDKs prepopulate client request tokens. If you are
  /// using an Amazon Web Services SDK, an idempotency token is created for you.
  /// </note>
  ///
  /// Parameter [status] :
  /// The status of the notification rule. The default value is
  /// <code>ENABLED</code>. If the status is set to <code>DISABLED</code>,
  /// notifications aren't sent for the notification rule.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to this notification rule. Key names cannot start
  /// with "<code>aws</code>".
  Future<CreateNotificationRuleResult> createNotificationRule({
    required DetailType detailType,
    required List<String> eventTypeIds,
    required String name,
    required String resource,
    required List<Target> targets,
    String? clientRequestToken,
    NotificationRuleStatus? status,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'DetailType': detailType.toValue(),
      'EventTypeIds': eventTypeIds,
      'Name': name,
      'Resource': resource,
      'Targets': targets,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createNotificationRule',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNotificationRuleResult.fromJson(response);
  }

  /// Deletes a notification rule for a resource.
  ///
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule you want to
  /// delete.
  Future<DeleteNotificationRuleResult> deleteNotificationRule({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteNotificationRule',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNotificationRuleResult.fromJson(response);
  }

  /// Deletes a specified target for notifications.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [targetAddress] :
  /// The Amazon Resource Name (ARN) of the Chatbot topic or Chatbot client to
  /// delete.
  ///
  /// Parameter [forceUnsubscribeAll] :
  /// A Boolean value that can be used to delete all associations with this
  /// Chatbot topic. The default value is FALSE. If set to TRUE, all
  /// associations between that target and every notification rule in your
  /// Amazon Web Services account are deleted.
  Future<void> deleteTarget({
    required String targetAddress,
    bool? forceUnsubscribeAll,
  }) async {
    final $payload = <String, dynamic>{
      'TargetAddress': targetAddress,
      if (forceUnsubscribeAll != null)
        'ForceUnsubscribeAll': forceUnsubscribeAll,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteTarget',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns information about a specified notification rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule.
  Future<DescribeNotificationRuleResult> describeNotificationRule({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeNotificationRule',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNotificationRuleResult.fromJson(response);
  }

  /// Returns information about the event types available for configuring
  /// notifications.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters to use to return information by service or resource type.
  ///
  /// Parameter [maxResults] :
  /// A non-negative integer used to limit the number of returned results. The
  /// default number is 50. The maximum number of results that can be returned
  /// is 100.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListEventTypesResult> listEventTypes({
    List<ListEventTypesFilter>? filters,
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
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listEventTypes',
      exceptionFnMap: _exceptionFns,
    );
    return ListEventTypesResult.fromJson(response);
  }

  /// Returns a list of the notification rules for an Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters to use to return information by service or resource type. For
  /// valid values, see <a>ListNotificationRulesFilter</a>.
  /// <note>
  /// A filter with the same name can appear more than once when used with OR
  /// statements. Filters with different names should be applied with AND
  /// statements.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// A non-negative integer used to limit the number of returned results. The
  /// maximum number of results that can be returned is 100.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListNotificationRulesResult> listNotificationRules({
    List<ListNotificationRulesFilter>? filters,
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
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listNotificationRules',
      exceptionFnMap: _exceptionFns,
    );
    return ListNotificationRulesResult.fromJson(response);
  }

  /// Returns a list of the tags associated with a notification rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) for the notification rule.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResult.fromJson(response);
  }

  /// Returns a list of the notification rule targets for an Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// The filters to use to return information by service or resource type.
  /// Valid filters include target type, target address, and target status.
  /// <note>
  /// A filter with the same name can appear more than once when used with OR
  /// statements. Filters with different names should be applied with AND
  /// statements.
  /// </note>
  ///
  /// Parameter [maxResults] :
  /// A non-negative integer used to limit the number of returned results. The
  /// maximum number of results that can be returned is 100.
  ///
  /// Parameter [nextToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<ListTargetsResult> listTargets({
    List<ListTargetsFilter>? filters,
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
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listTargets',
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetsResult.fromJson(response);
  }

  /// Creates an association between a notification rule and an Chatbot topic or
  /// Chatbot client so that the associated target can receive notifications
  /// when the events described in the rule are triggered.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConfigurationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule for which you want
  /// to create the association.
  ///
  /// Parameter [clientRequestToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<SubscribeResult> subscribe({
    required String arn,
    required Target target,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'Target': target,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/subscribe',
      exceptionFnMap: _exceptionFns,
    );
    return SubscribeResult.fromJson(response);
  }

  /// Associates a set of provided tags with a notification rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule to tag.
  ///
  /// Parameter [tags] :
  /// The list of tags to associate with the resource. Tag key names cannot
  /// start with "<code>aws</code>".
  Future<TagResourceResult> tagResource({
    required String arn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tagResource',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResult.fromJson(response);
  }

  /// Removes an association between a notification rule and an Chatbot topic so
  /// that subscribers to that topic stop receiving notifications when the
  /// events described in the rule are triggered.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule.
  ///
  /// Parameter [targetAddress] :
  /// The ARN of the Chatbot topic to unsubscribe from the notification rule.
  Future<UnsubscribeResult> unsubscribe({
    required String arn,
    required String targetAddress,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      'TargetAddress': targetAddress,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/unsubscribe',
      exceptionFnMap: _exceptionFns,
    );
    return UnsubscribeResult.fromJson(response);
  }

  /// Removes the association between one or more provided tags and a
  /// notification rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ValidationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule from which to
  /// remove the tags.
  ///
  /// Parameter [tagKeys] :
  /// The key names of the tags to remove.
  Future<void> untagResource({
    required String arn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/untagResource/${Uri.encodeComponent(arn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a notification rule for a resource. You can change the events that
  /// trigger the notification rule, the status of the rule, and the targets
  /// that receive the notifications.
  /// <note>
  /// To add or remove tags for a notification rule, you must use
  /// <a>TagResource</a> and <a>UntagResource</a>.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConfigurationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule.
  ///
  /// Parameter [detailType] :
  /// The level of detail to include in the notifications for this resource.
  /// BASIC will include only the contents of the event as it would appear in
  /// Amazon CloudWatch. FULL will include any supplemental information provided
  /// by AWS CodeStar Notifications and/or the service for the resource for
  /// which the notification is created.
  ///
  /// Parameter [eventTypeIds] :
  /// A list of event types associated with this notification rule. For a
  /// complete list of event types and IDs, see <a
  /// href="https://docs.aws.amazon.com/codestar-notifications/latest/userguide/concepts.html#concepts-api">Notification
  /// concepts</a> in the <i>Developer Tools Console User Guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the notification rule.
  ///
  /// Parameter [status] :
  /// The status of the notification rule. Valid statuses include enabled
  /// (sending notifications) or disabled (not sending notifications).
  ///
  /// Parameter [targets] :
  /// The address and type of the targets to receive notifications from this
  /// notification rule.
  Future<void> updateNotificationRule({
    required String arn,
    DetailType? detailType,
    List<String>? eventTypeIds,
    String? name,
    NotificationRuleStatus? status,
    List<Target>? targets,
  }) async {
    final $payload = <String, dynamic>{
      'Arn': arn,
      if (detailType != null) 'DetailType': detailType.toValue(),
      if (eventTypeIds != null) 'EventTypeIds': eventTypeIds,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (targets != null) 'Targets': targets,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateNotificationRule',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class CreateNotificationRuleResult {
  /// The Amazon Resource Name (ARN) of the notification rule.
  final String? arn;

  CreateNotificationRuleResult({
    this.arn,
  });

  factory CreateNotificationRuleResult.fromJson(Map<String, dynamic> json) {
    return CreateNotificationRuleResult(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DeleteNotificationRuleResult {
  /// The Amazon Resource Name (ARN) of the deleted notification rule.
  final String? arn;

  DeleteNotificationRuleResult({
    this.arn,
  });

  factory DeleteNotificationRuleResult.fromJson(Map<String, dynamic> json) {
    return DeleteNotificationRuleResult(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class DeleteTargetResult {
  DeleteTargetResult();

  factory DeleteTargetResult.fromJson(Map<String, dynamic> _) {
    return DeleteTargetResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeNotificationRuleResult {
  /// The Amazon Resource Name (ARN) of the notification rule.
  final String arn;

  /// The name or email alias of the person who created the notification rule.
  final String? createdBy;

  /// The date and time the notification rule was created, in timestamp format.
  final DateTime? createdTimestamp;

  /// The level of detail included in the notifications for this resource. BASIC
  /// will include only the contents of the event as it would appear in Amazon
  /// CloudWatch. FULL will include any supplemental information provided by AWS
  /// CodeStar Notifications and/or the service for the resource for which the
  /// notification is created.
  final DetailType? detailType;

  /// A list of the event types associated with the notification rule.
  final List<EventTypeSummary>? eventTypes;

  /// The date and time the notification rule was most recently updated, in
  /// timestamp format.
  final DateTime? lastModifiedTimestamp;

  /// The name of the notification rule.
  final String? name;

  /// The Amazon Resource Name (ARN) of the resource associated with the
  /// notification rule.
  final String? resource;

  /// The status of the notification rule. Valid statuses are on (sending
  /// notifications) or off (not sending notifications).
  final NotificationRuleStatus? status;

  /// The tags associated with the notification rule.
  final Map<String, String>? tags;

  /// A list of the Chatbot topics and Chatbot clients associated with the
  /// notification rule.
  final List<TargetSummary>? targets;

  DescribeNotificationRuleResult({
    required this.arn,
    this.createdBy,
    this.createdTimestamp,
    this.detailType,
    this.eventTypes,
    this.lastModifiedTimestamp,
    this.name,
    this.resource,
    this.status,
    this.tags,
    this.targets,
  });

  factory DescribeNotificationRuleResult.fromJson(Map<String, dynamic> json) {
    return DescribeNotificationRuleResult(
      arn: json['Arn'] as String,
      createdBy: json['CreatedBy'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      detailType: (json['DetailType'] as String?)?.toDetailType(),
      eventTypes: (json['EventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => EventTypeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTimestamp: timeStampFromJson(json['LastModifiedTimestamp']),
      name: json['Name'] as String?,
      resource: json['Resource'] as String?,
      status: (json['Status'] as String?)?.toNotificationRuleStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targets: (json['Targets'] as List?)
          ?.whereNotNull()
          .map((e) => TargetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdBy = this.createdBy;
    final createdTimestamp = this.createdTimestamp;
    final detailType = this.detailType;
    final eventTypes = this.eventTypes;
    final lastModifiedTimestamp = this.lastModifiedTimestamp;
    final name = this.name;
    final resource = this.resource;
    final status = this.status;
    final tags = this.tags;
    final targets = this.targets;
    return {
      'Arn': arn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (detailType != null) 'DetailType': detailType.toValue(),
      if (eventTypes != null) 'EventTypes': eventTypes,
      if (lastModifiedTimestamp != null)
        'LastModifiedTimestamp': unixTimestampToJson(lastModifiedTimestamp),
      if (name != null) 'Name': name,
      if (resource != null) 'Resource': resource,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (targets != null) 'Targets': targets,
    };
  }
}

enum DetailType {
  basic,
  full,
}

extension DetailTypeValueExtension on DetailType {
  String toValue() {
    switch (this) {
      case DetailType.basic:
        return 'BASIC';
      case DetailType.full:
        return 'FULL';
    }
  }
}

extension DetailTypeFromString on String {
  DetailType toDetailType() {
    switch (this) {
      case 'BASIC':
        return DetailType.basic;
      case 'FULL':
        return DetailType.full;
    }
    throw Exception('$this is not known in enum DetailType');
  }
}

/// Returns information about an event that has triggered a notification rule.
class EventTypeSummary {
  /// The system-generated ID of the event. For a complete list of event types and
  /// IDs, see <a
  /// href="https://docs.aws.amazon.com/codestar-notifications/latest/userguide/concepts.html#concepts-api">Notification
  /// concepts</a> in the <i>Developer Tools Console User Guide</i>.
  final String? eventTypeId;

  /// The name of the event.
  final String? eventTypeName;

  /// The resource type of the event.
  final String? resourceType;

  /// The name of the service for which the event applies.
  final String? serviceName;

  EventTypeSummary({
    this.eventTypeId,
    this.eventTypeName,
    this.resourceType,
    this.serviceName,
  });

  factory EventTypeSummary.fromJson(Map<String, dynamic> json) {
    return EventTypeSummary(
      eventTypeId: json['EventTypeId'] as String?,
      eventTypeName: json['EventTypeName'] as String?,
      resourceType: json['ResourceType'] as String?,
      serviceName: json['ServiceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTypeId = this.eventTypeId;
    final eventTypeName = this.eventTypeName;
    final resourceType = this.resourceType;
    final serviceName = this.serviceName;
    return {
      if (eventTypeId != null) 'EventTypeId': eventTypeId,
      if (eventTypeName != null) 'EventTypeName': eventTypeName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (serviceName != null) 'ServiceName': serviceName,
    };
  }
}

/// Information about a filter to apply to the list of returned event types. You
/// can filter by resource type or service name.
class ListEventTypesFilter {
  /// The system-generated name of the filter type you want to filter by.
  final ListEventTypesFilterName name;

  /// The name of the resource type (for example, pipeline) or service name (for
  /// example, CodePipeline) that you want to filter by.
  final String value;

  ListEventTypesFilter({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name.toValue(),
      'Value': value,
    };
  }
}

enum ListEventTypesFilterName {
  resourceType,
  serviceName,
}

extension ListEventTypesFilterNameValueExtension on ListEventTypesFilterName {
  String toValue() {
    switch (this) {
      case ListEventTypesFilterName.resourceType:
        return 'RESOURCE_TYPE';
      case ListEventTypesFilterName.serviceName:
        return 'SERVICE_NAME';
    }
  }
}

extension ListEventTypesFilterNameFromString on String {
  ListEventTypesFilterName toListEventTypesFilterName() {
    switch (this) {
      case 'RESOURCE_TYPE':
        return ListEventTypesFilterName.resourceType;
      case 'SERVICE_NAME':
        return ListEventTypesFilterName.serviceName;
    }
    throw Exception('$this is not known in enum ListEventTypesFilterName');
  }
}

class ListEventTypesResult {
  /// Information about each event, including service name, resource type, event
  /// ID, and event name.
  final List<EventTypeSummary>? eventTypes;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  ListEventTypesResult({
    this.eventTypes,
    this.nextToken,
  });

  factory ListEventTypesResult.fromJson(Map<String, dynamic> json) {
    return ListEventTypesResult(
      eventTypes: (json['EventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => EventTypeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTypes = this.eventTypes;
    final nextToken = this.nextToken;
    return {
      if (eventTypes != null) 'EventTypes': eventTypes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Information about a filter to apply to the list of returned notification
/// rules. You can filter by event type, owner, resource, or target.
class ListNotificationRulesFilter {
  /// The name of the attribute you want to use to filter the returned
  /// notification rules.
  final ListNotificationRulesFilterName name;

  /// The value of the attribute you want to use to filter the returned
  /// notification rules. For example, if you specify filtering by <i>RESOURCE</i>
  /// in Name, you might specify the ARN of a pipeline in CodePipeline for the
  /// value.
  final String value;

  ListNotificationRulesFilter({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name.toValue(),
      'Value': value,
    };
  }
}

enum ListNotificationRulesFilterName {
  eventTypeId,
  createdBy,
  resource,
  targetAddress,
}

extension ListNotificationRulesFilterNameValueExtension
    on ListNotificationRulesFilterName {
  String toValue() {
    switch (this) {
      case ListNotificationRulesFilterName.eventTypeId:
        return 'EVENT_TYPE_ID';
      case ListNotificationRulesFilterName.createdBy:
        return 'CREATED_BY';
      case ListNotificationRulesFilterName.resource:
        return 'RESOURCE';
      case ListNotificationRulesFilterName.targetAddress:
        return 'TARGET_ADDRESS';
    }
  }
}

extension ListNotificationRulesFilterNameFromString on String {
  ListNotificationRulesFilterName toListNotificationRulesFilterName() {
    switch (this) {
      case 'EVENT_TYPE_ID':
        return ListNotificationRulesFilterName.eventTypeId;
      case 'CREATED_BY':
        return ListNotificationRulesFilterName.createdBy;
      case 'RESOURCE':
        return ListNotificationRulesFilterName.resource;
      case 'TARGET_ADDRESS':
        return ListNotificationRulesFilterName.targetAddress;
    }
    throw Exception(
        '$this is not known in enum ListNotificationRulesFilterName');
  }
}

class ListNotificationRulesResult {
  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  final String? nextToken;

  /// The list of notification rules for the Amazon Web Services account, by
  /// Amazon Resource Name (ARN) and ID.
  final List<NotificationRuleSummary>? notificationRules;

  ListNotificationRulesResult({
    this.nextToken,
    this.notificationRules,
  });

  factory ListNotificationRulesResult.fromJson(Map<String, dynamic> json) {
    return ListNotificationRulesResult(
      nextToken: json['NextToken'] as String?,
      notificationRules: (json['NotificationRules'] as List?)
          ?.whereNotNull()
          .map((e) =>
              NotificationRuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final notificationRules = this.notificationRules;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (notificationRules != null) 'NotificationRules': notificationRules,
    };
  }
}

class ListTagsForResourceResult {
  /// The tags associated with the notification rule.
  final Map<String, String>? tags;

  ListTagsForResourceResult({
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
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

/// Information about a filter to apply to the list of returned targets. You can
/// filter by target type, address, or status. For example, to filter results to
/// notification rules that have active Chatbot topics as targets, you could
/// specify a ListTargetsFilter Name as <code>TargetType</code> and a Value of
/// <code>SNS</code>, and a Name of <code>TARGET_STATUS</code> and a Value of
/// <code>ACTIVE</code>.
class ListTargetsFilter {
  /// The name of the attribute you want to use to filter the returned targets.
  final ListTargetsFilterName name;

  /// The value of the attribute you want to use to filter the returned targets.
  /// For example, if you specify <code>SNS</code> for the Target type, you could
  /// specify an Amazon Resource Name (ARN) for a topic as the value.
  final String value;

  ListTargetsFilter({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name.toValue(),
      'Value': value,
    };
  }
}

enum ListTargetsFilterName {
  targetType,
  targetAddress,
  targetStatus,
}

extension ListTargetsFilterNameValueExtension on ListTargetsFilterName {
  String toValue() {
    switch (this) {
      case ListTargetsFilterName.targetType:
        return 'TARGET_TYPE';
      case ListTargetsFilterName.targetAddress:
        return 'TARGET_ADDRESS';
      case ListTargetsFilterName.targetStatus:
        return 'TARGET_STATUS';
    }
  }
}

extension ListTargetsFilterNameFromString on String {
  ListTargetsFilterName toListTargetsFilterName() {
    switch (this) {
      case 'TARGET_TYPE':
        return ListTargetsFilterName.targetType;
      case 'TARGET_ADDRESS':
        return ListTargetsFilterName.targetAddress;
      case 'TARGET_STATUS':
        return ListTargetsFilterName.targetStatus;
    }
    throw Exception('$this is not known in enum ListTargetsFilterName');
  }
}

class ListTargetsResult {
  /// An enumeration token that can be used in a request to return the next batch
  /// of results.
  final String? nextToken;

  /// The list of notification rule targets.
  final List<TargetSummary>? targets;

  ListTargetsResult({
    this.nextToken,
    this.targets,
  });

  factory ListTargetsResult.fromJson(Map<String, dynamic> json) {
    return ListTargetsResult(
      nextToken: json['NextToken'] as String?,
      targets: (json['Targets'] as List?)
          ?.whereNotNull()
          .map((e) => TargetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final targets = this.targets;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (targets != null) 'Targets': targets,
    };
  }
}

enum NotificationRuleStatus {
  enabled,
  disabled,
}

extension NotificationRuleStatusValueExtension on NotificationRuleStatus {
  String toValue() {
    switch (this) {
      case NotificationRuleStatus.enabled:
        return 'ENABLED';
      case NotificationRuleStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension NotificationRuleStatusFromString on String {
  NotificationRuleStatus toNotificationRuleStatus() {
    switch (this) {
      case 'ENABLED':
        return NotificationRuleStatus.enabled;
      case 'DISABLED':
        return NotificationRuleStatus.disabled;
    }
    throw Exception('$this is not known in enum NotificationRuleStatus');
  }
}

/// Information about a specified notification rule.
class NotificationRuleSummary {
  /// The Amazon Resource Name (ARN) of the notification rule.
  final String? arn;

  /// The unique ID of the notification rule.
  final String? id;

  NotificationRuleSummary({
    this.arn,
    this.id,
  });

  factory NotificationRuleSummary.fromJson(Map<String, dynamic> json) {
    return NotificationRuleSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
    };
  }
}

class SubscribeResult {
  /// The Amazon Resource Name (ARN) of the notification rule for which you have
  /// created assocations.
  final String? arn;

  SubscribeResult({
    this.arn,
  });

  factory SubscribeResult.fromJson(Map<String, dynamic> json) {
    return SubscribeResult(
      arn: json['Arn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'Arn': arn,
    };
  }
}

class TagResourceResult {
  /// The list of tags associated with the resource.
  final Map<String, String>? tags;

  TagResourceResult({
    this.tags,
  });

  factory TagResourceResult.fromJson(Map<String, dynamic> json) {
    return TagResourceResult(
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

/// Information about the Chatbot topics or Chatbot clients associated with a
/// notification rule.
class Target {
  /// The Amazon Resource Name (ARN) of the Chatbot topic or Chatbot client.
  final String? targetAddress;

  /// The target type. Can be an Chatbot topic or Chatbot client.
  ///
  /// <ul>
  /// <li>
  /// Chatbot topics are specified as <code>SNS</code>.
  /// </li>
  /// <li>
  /// Chatbot clients are specified as <code>AWSChatbotSlack</code>.
  /// </li>
  /// </ul>
  final String? targetType;

  Target({
    this.targetAddress,
    this.targetType,
  });

  Map<String, dynamic> toJson() {
    final targetAddress = this.targetAddress;
    final targetType = this.targetType;
    return {
      if (targetAddress != null) 'TargetAddress': targetAddress,
      if (targetType != null) 'TargetType': targetType,
    };
  }
}

enum TargetStatus {
  pending,
  active,
  unreachable,
  inactive,
  deactivated,
}

extension TargetStatusValueExtension on TargetStatus {
  String toValue() {
    switch (this) {
      case TargetStatus.pending:
        return 'PENDING';
      case TargetStatus.active:
        return 'ACTIVE';
      case TargetStatus.unreachable:
        return 'UNREACHABLE';
      case TargetStatus.inactive:
        return 'INACTIVE';
      case TargetStatus.deactivated:
        return 'DEACTIVATED';
    }
  }
}

extension TargetStatusFromString on String {
  TargetStatus toTargetStatus() {
    switch (this) {
      case 'PENDING':
        return TargetStatus.pending;
      case 'ACTIVE':
        return TargetStatus.active;
      case 'UNREACHABLE':
        return TargetStatus.unreachable;
      case 'INACTIVE':
        return TargetStatus.inactive;
      case 'DEACTIVATED':
        return TargetStatus.deactivated;
    }
    throw Exception('$this is not known in enum TargetStatus');
  }
}

/// Information about the targets specified for a notification rule.
class TargetSummary {
  /// The Amazon Resource Name (ARN) of the Chatbot topic or Chatbot client.
  final String? targetAddress;

  /// The status of the target.
  final TargetStatus? targetStatus;

  /// The type of the target (for example, <code>SNS</code>).
  ///
  /// <ul>
  /// <li>
  /// Chatbot topics are specified as <code>SNS</code>.
  /// </li>
  /// <li>
  /// Chatbot clients are specified as <code>AWSChatbotSlack</code>.
  /// </li>
  /// </ul>
  final String? targetType;

  TargetSummary({
    this.targetAddress,
    this.targetStatus,
    this.targetType,
  });

  factory TargetSummary.fromJson(Map<String, dynamic> json) {
    return TargetSummary(
      targetAddress: json['TargetAddress'] as String?,
      targetStatus: (json['TargetStatus'] as String?)?.toTargetStatus(),
      targetType: json['TargetType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetAddress = this.targetAddress;
    final targetStatus = this.targetStatus;
    final targetType = this.targetType;
    return {
      if (targetAddress != null) 'TargetAddress': targetAddress,
      if (targetStatus != null) 'TargetStatus': targetStatus.toValue(),
      if (targetType != null) 'TargetType': targetType,
    };
  }
}

class UnsubscribeResult {
  /// The Amazon Resource Name (ARN) of the the notification rule from which you
  /// have removed a subscription.
  final String arn;

  UnsubscribeResult({
    required this.arn,
  });

  factory UnsubscribeResult.fromJson(Map<String, dynamic> json) {
    return UnsubscribeResult(
      arn: json['Arn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'Arn': arn,
    };
  }
}

class UntagResourceResult {
  UntagResourceResult();

  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateNotificationRuleResult {
  UpdateNotificationRuleResult();

  factory UpdateNotificationRuleResult.fromJson(Map<String, dynamic> _) {
    return UpdateNotificationRuleResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConfigurationException extends _s.GenericAwsException {
  ConfigurationException({String? type, String? message})
      : super(type: type, code: 'ConfigurationException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'ConfigurationException': (type, message) =>
      ConfigurationException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
