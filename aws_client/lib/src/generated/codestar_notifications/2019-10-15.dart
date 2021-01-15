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

part '2019-10-15.g.dart';

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
/// <a>DeleteTarget</a>, which removes a notification rule target (SNS topic)
/// from a notification rule.
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
/// For information about how to use AWS CodeStar Notifications, see link in the
/// CodeStarNotifications User Guide.
class CodeStarNotifications {
  final _s.RestJsonProtocol _protocol;
  CodeStarNotifications({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codestar-notifications',
            signingName: 'codestar-notifications',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a notification rule for a resource. The rule specifies the events
  /// you want notifications about and the targets (such as SNS topics) where
  /// you want to receive them.
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
  /// BASIC will include only the contents of the event as it would appear in
  /// AWS CloudWatch. FULL will include any supplemental information provided by
  /// AWS CodeStar Notifications and/or the service for the resource for which
  /// the notification is created.
  ///
  /// Parameter [eventTypeIds] :
  /// A list of event types associated with this notification rule. For a list
  /// of allowed events, see <a>EventTypeSummary</a>.
  ///
  /// Parameter [name] :
  /// The name for the notification rule. Notifictaion rule names must be unique
  /// in your AWS account.
  ///
  /// Parameter [resource] :
  /// The Amazon Resource Name (ARN) of the resource to associate with the
  /// notification rule. Supported resources include pipelines in AWS
  /// CodePipeline, repositories in AWS CodeCommit, and build projects in AWS
  /// CodeBuild.
  ///
  /// Parameter [targets] :
  /// A list of Amazon Resource Names (ARNs) of SNS topics to associate with the
  /// notification rule.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, client-generated idempotency token that, when provided in a
  /// request, ensures the request cannot be repeated with a changed parameter.
  /// If a request with the same parameters is received and a token is included,
  /// the request returns information about the initial request that used that
  /// token.
  /// <note>
  /// The AWS SDKs prepopulate client request tokens. If you are using an AWS
  /// SDK, an idempotency token is created for you.
  /// </note>
  ///
  /// Parameter [status] :
  /// The status of the notification rule. The default value is ENABLED. If the
  /// status is set to DISABLED, notifications aren't sent for the notification
  /// rule.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to this notification rule. Key names cannot start
  /// with "aws".
  Future<CreateNotificationRuleResult> createNotificationRule({
    @_s.required DetailType detailType,
    @_s.required List<String> eventTypeIds,
    @_s.required String name,
    @_s.required String resource,
    @_s.required List<Target> targets,
    String clientRequestToken,
    NotificationRuleStatus status,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(detailType, 'detailType');
    ArgumentError.checkNotNull(eventTypeIds, 'eventTypeIds');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[A-Za-z0-9\-_ ]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringPattern(
      'resource',
      resource,
      r'''^arn:aws[^:\s]*:[^:\s]*:[^:\s]*:[0-9]{12}:[^\s]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targets, 'targets');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      256,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w:/-]+$''',
    );
    final $payload = <String, dynamic>{
      'DetailType': detailType?.toValue() ?? '',
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
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
  /// The Amazon Resource Name (ARN) of the SNS topic to delete.
  ///
  /// Parameter [forceUnsubscribeAll] :
  /// A Boolean value that can be used to delete all associations with this SNS
  /// topic. The default value is FALSE. If set to TRUE, all associations
  /// between that target and every notification rule in your AWS account are
  /// deleted.
  Future<void> deleteTarget({
    @_s.required String targetAddress,
    bool forceUnsubscribeAll,
  }) async {
    ArgumentError.checkNotNull(targetAddress, 'targetAddress');
    _s.validateStringLength(
      'targetAddress',
      targetAddress,
      1,
      320,
      isRequired: true,
    );
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
    return DeleteTargetResult.fromJson(response);
  }

  /// Returns information about a specified notification rule.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule.
  Future<DescribeNotificationRuleResult> describeNotificationRule({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
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
    List<ListEventTypesFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
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

  /// Returns a list of the notification rules for an AWS account.
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
    List<ListNotificationRulesFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
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
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
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

  /// Returns a list of the notification rule targets for an AWS account.
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
    List<ListTargetsFilter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w/+=]+$''',
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

  /// Creates an association between a notification rule and an SNS topic so
  /// that the associated target can receive notifications when the events
  /// described in the rule are triggered.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule for which you want
  /// to create the association.
  ///
  /// Parameter [clientRequestToken] :
  /// An enumeration token that, when provided in a request, returns the next
  /// batch of the results.
  Future<SubscribeResult> subscribe({
    @_s.required String arn,
    @_s.required Target target,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(target, 'target');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      256,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[\w:/-]+$''',
    );
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
  /// May throw [ValidationException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule to tag.
  ///
  /// Parameter [tags] :
  /// The list of tags to associate with the resource. Tag key names cannot
  /// start with "aws".
  Future<TagResourceResult> tagResource({
    @_s.required String arn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Removes an association between a notification rule and an Amazon SNS topic
  /// so that subscribers to that topic stop receiving notifications when the
  /// events described in the rule are triggered.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule.
  ///
  /// Parameter [targetAddress] :
  /// The ARN of the SNS topic to unsubscribe from the notification rule.
  Future<UnsubscribeResult> unsubscribe({
    @_s.required String arn,
    @_s.required String targetAddress,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetAddress, 'targetAddress');
    _s.validateStringLength(
      'targetAddress',
      targetAddress,
      1,
      320,
      isRequired: true,
    );
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
    @_s.required String arn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'Arn': arn,
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untagResource',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResult.fromJson(response);
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
  ///
  /// Parameter [arn] :
  /// The Amazon Resource Name (ARN) of the notification rule.
  ///
  /// Parameter [detailType] :
  /// The level of detail to include in the notifications for this resource.
  /// BASIC will include only the contents of the event as it would appear in
  /// AWS CloudWatch. FULL will include any supplemental information provided by
  /// AWS CodeStar Notifications and/or the service for the resource for which
  /// the notification is created.
  ///
  /// Parameter [eventTypeIds] :
  /// A list of event types associated with this notification rule.
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
    @_s.required String arn,
    DetailType detailType,
    List<String> eventTypeIds,
    String name,
    NotificationRuleStatus status,
    List<Target> targets,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws[^:\s]*:codestar-notifications:[^:\s]+:\d{12}:notificationrule\/(.*\S)?$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      64,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[A-Za-z0-9\-_ ]+$''',
    );
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
    return UpdateNotificationRuleResult.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNotificationRuleResult {
  /// The Amazon Resource Name (ARN) of the notification rule.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  CreateNotificationRuleResult({
    this.arn,
  });
  factory CreateNotificationRuleResult.fromJson(Map<String, dynamic> json) =>
      _$CreateNotificationRuleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteNotificationRuleResult {
  /// The Amazon Resource Name (ARN) of the deleted notification rule.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  DeleteNotificationRuleResult({
    this.arn,
  });
  factory DeleteNotificationRuleResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteNotificationRuleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTargetResult {
  DeleteTargetResult();
  factory DeleteTargetResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteTargetResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNotificationRuleResult {
  /// The Amazon Resource Name (ARN) of the notification rule.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name or email alias of the person who created the notification rule.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The date and time the notification rule was created, in timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The level of detail included in the notifications for this resource. BASIC
  /// will include only the contents of the event as it would appear in AWS
  /// CloudWatch. FULL will include any supplemental information provided by AWS
  /// CodeStar Notifications and/or the service for the resource for which the
  /// notification is created.
  @_s.JsonKey(name: 'DetailType')
  final DetailType detailType;

  /// A list of the event types associated with the notification rule.
  @_s.JsonKey(name: 'EventTypes')
  final List<EventTypeSummary> eventTypes;

  /// The date and time the notification rule was most recently updated, in
  /// timestamp format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModifiedTimestamp')
  final DateTime lastModifiedTimestamp;

  /// The name of the notification rule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the resource associated with the
  /// notification rule.
  @_s.JsonKey(name: 'Resource')
  final String resource;

  /// The status of the notification rule. Valid statuses are on (sending
  /// notifications) or off (not sending notifications).
  @_s.JsonKey(name: 'Status')
  final NotificationRuleStatus status;

  /// The tags associated with the notification rule.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// A list of the SNS topics associated with the notification rule.
  @_s.JsonKey(name: 'Targets')
  final List<TargetSummary> targets;

  DescribeNotificationRuleResult({
    @_s.required this.arn,
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
  factory DescribeNotificationRuleResult.fromJson(Map<String, dynamic> json) =>
      _$DescribeNotificationRuleResultFromJson(json);
}

enum DetailType {
  @_s.JsonValue('BASIC')
  basic,
  @_s.JsonValue('FULL')
  full,
}

extension on DetailType {
  String toValue() {
    switch (this) {
      case DetailType.basic:
        return 'BASIC';
      case DetailType.full:
        return 'FULL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns information about an event that has triggered a notification rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventTypeSummary {
  /// The system-generated ID of the event.
  @_s.JsonKey(name: 'EventTypeId')
  final String eventTypeId;

  /// The name of the event.
  @_s.JsonKey(name: 'EventTypeName')
  final String eventTypeName;

  /// The resource type of the event.
  @_s.JsonKey(name: 'ResourceType')
  final String resourceType;

  /// The name of the service for which the event applies.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  EventTypeSummary({
    this.eventTypeId,
    this.eventTypeName,
    this.resourceType,
    this.serviceName,
  });
  factory EventTypeSummary.fromJson(Map<String, dynamic> json) =>
      _$EventTypeSummaryFromJson(json);
}

/// Information about a filter to apply to the list of returned event types. You
/// can filter by resource type or service name.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListEventTypesFilter {
  /// The system-generated name of the filter type you want to filter by.
  @_s.JsonKey(name: 'Name')
  final ListEventTypesFilterName name;

  /// The name of the resource type (for example, pipeline) or service name (for
  /// example, CodePipeline) that you want to filter by.
  @_s.JsonKey(name: 'Value')
  final String value;

  ListEventTypesFilter({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$ListEventTypesFilterToJson(this);
}

enum ListEventTypesFilterName {
  @_s.JsonValue('RESOURCE_TYPE')
  resourceType,
  @_s.JsonValue('SERVICE_NAME')
  serviceName,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventTypesResult {
  /// Information about each event, including service name, resource type, event
  /// ID, and event name.
  @_s.JsonKey(name: 'EventTypes')
  final List<EventTypeSummary> eventTypes;

  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEventTypesResult({
    this.eventTypes,
    this.nextToken,
  });
  factory ListEventTypesResult.fromJson(Map<String, dynamic> json) =>
      _$ListEventTypesResultFromJson(json);
}

/// Information about a filter to apply to the list of returned notification
/// rules. You can filter by event type, owner, resource, or target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListNotificationRulesFilter {
  /// The name of the attribute you want to use to filter the returned
  /// notification rules.
  @_s.JsonKey(name: 'Name')
  final ListNotificationRulesFilterName name;

  /// The value of the attribute you want to use to filter the returned
  /// notification rules. For example, if you specify filtering by <i>RESOURCE</i>
  /// in Name, you might specify the ARN of a pipeline in AWS CodePipeline for the
  /// value.
  @_s.JsonKey(name: 'Value')
  final String value;

  ListNotificationRulesFilter({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$ListNotificationRulesFilterToJson(this);
}

enum ListNotificationRulesFilterName {
  @_s.JsonValue('EVENT_TYPE_ID')
  eventTypeId,
  @_s.JsonValue('CREATED_BY')
  createdBy,
  @_s.JsonValue('RESOURCE')
  resource,
  @_s.JsonValue('TARGET_ADDRESS')
  targetAddress,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNotificationRulesResult {
  /// An enumeration token that can be used in a request to return the next batch
  /// of the results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of notification rules for the AWS account, by Amazon Resource Name
  /// (ARN) and ID.
  @_s.JsonKey(name: 'NotificationRules')
  final List<NotificationRuleSummary> notificationRules;

  ListNotificationRulesResult({
    this.nextToken,
    this.notificationRules,
  });
  factory ListNotificationRulesResult.fromJson(Map<String, dynamic> json) =>
      _$ListNotificationRulesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResult {
  /// The tags associated with the notification rule.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResult({
    this.tags,
  });
  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResultFromJson(json);
}

/// Information about a filter to apply to the list of returned targets. You can
/// filter by target type, address, or status. For example, to filter results to
/// notification rules that have active Amazon SNS topics as targets, you could
/// specify a ListTargetsFilter Name as TargetType and a Value of SNS, and a
/// Name of TARGET_STATUS and a Value of ACTIVE.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTargetsFilter {
  /// The name of the attribute you want to use to filter the returned targets.
  @_s.JsonKey(name: 'Name')
  final ListTargetsFilterName name;

  /// The value of the attribute you want to use to filter the returned targets.
  /// For example, if you specify <i>SNS</i> for the Target type, you could
  /// specify an Amazon Resource Name (ARN) for a topic as the value.
  @_s.JsonKey(name: 'Value')
  final String value;

  ListTargetsFilter({
    @_s.required this.name,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$ListTargetsFilterToJson(this);
}

enum ListTargetsFilterName {
  @_s.JsonValue('TARGET_TYPE')
  targetType,
  @_s.JsonValue('TARGET_ADDRESS')
  targetAddress,
  @_s.JsonValue('TARGET_STATUS')
  targetStatus,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTargetsResult {
  /// An enumeration token that can be used in a request to return the next batch
  /// of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of notification rule targets.
  @_s.JsonKey(name: 'Targets')
  final List<TargetSummary> targets;

  ListTargetsResult({
    this.nextToken,
    this.targets,
  });
  factory ListTargetsResult.fromJson(Map<String, dynamic> json) =>
      _$ListTargetsResultFromJson(json);
}

enum NotificationRuleStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on NotificationRuleStatus {
  String toValue() {
    switch (this) {
      case NotificationRuleStatus.enabled:
        return 'ENABLED';
      case NotificationRuleStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about a specified notification rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotificationRuleSummary {
  /// The Amazon Resource Name (ARN) of the notification rule.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The unique ID of the notification rule.
  @_s.JsonKey(name: 'Id')
  final String id;

  NotificationRuleSummary({
    this.arn,
    this.id,
  });
  factory NotificationRuleSummary.fromJson(Map<String, dynamic> json) =>
      _$NotificationRuleSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubscribeResult {
  /// The Amazon Resource Name (ARN) of the notification rule for which you have
  /// created assocations.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  SubscribeResult({
    this.arn,
  });
  factory SubscribeResult.fromJson(Map<String, dynamic> json) =>
      _$SubscribeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResult {
  /// The list of tags associated with the resource.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  TagResourceResult({
    this.tags,
  });
  factory TagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResultFromJson(json);
}

/// Information about the SNS topics associated with a notification rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Target {
  /// The Amazon Resource Name (ARN) of the SNS topic.
  @_s.JsonKey(name: 'TargetAddress')
  final String targetAddress;

  /// The target type. Can be an Amazon SNS topic.
  @_s.JsonKey(name: 'TargetType')
  final String targetType;

  Target({
    this.targetAddress,
    this.targetType,
  });
  Map<String, dynamic> toJson() => _$TargetToJson(this);
}

enum TargetStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UNREACHABLE')
  unreachable,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('DEACTIVATED')
  deactivated,
}

/// Information about the targets specified for a notification rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TargetSummary {
  /// The Amazon Resource Name (ARN) of the SNS topic.
  @_s.JsonKey(name: 'TargetAddress')
  final String targetAddress;

  /// The status of the target.
  @_s.JsonKey(name: 'TargetStatus')
  final TargetStatus targetStatus;

  /// The type of the target (for example, SNS).
  @_s.JsonKey(name: 'TargetType')
  final String targetType;

  TargetSummary({
    this.targetAddress,
    this.targetStatus,
    this.targetType,
  });
  factory TargetSummary.fromJson(Map<String, dynamic> json) =>
      _$TargetSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnsubscribeResult {
  /// The Amazon Resource Name (ARN) of the the notification rule from which you
  /// have removed a subscription.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  UnsubscribeResult({
    @_s.required this.arn,
  });
  factory UnsubscribeResult.fromJson(Map<String, dynamic> json) =>
      _$UnsubscribeResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResult {
  UntagResourceResult();
  factory UntagResourceResult.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNotificationRuleResult {
  UpdateNotificationRuleResult();
  factory UpdateNotificationRuleResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateNotificationRuleResultFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class ConfigurationException extends _s.GenericAwsException {
  ConfigurationException({String type, String message})
      : super(type: type, code: 'ConfigurationException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
