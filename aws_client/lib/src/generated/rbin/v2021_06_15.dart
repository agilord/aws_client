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

/// This is the <i>Recycle Bin API Reference</i>. This documentation provides
/// descriptions and syntax for each of the actions and data types in Recycle
/// Bin.
///
/// Recycle Bin is a resource recovery feature that enables you to restore
/// accidentally deleted snapshots and EBS-backed AMIs. When using Recycle Bin,
/// if your resources are deleted, they are retained in the Recycle Bin for a
/// time period that you specify.
///
/// You can restore a resource from the Recycle Bin at any time before its
/// retention period expires. After you restore a resource from the Recycle Bin,
/// the resource is removed from the Recycle Bin, and you can then use it in the
/// same way you use any other resource of that type in your account. If the
/// retention period expires and the resource is not restored, the resource is
/// permanently deleted from the Recycle Bin and is no longer available for
/// recovery. For more information about Recycle Bin, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recycle-bin.html">
/// Recycle Bin</a> in the <i>Amazon Elastic Compute Cloud User Guide</i>.
class RecycleBin {
  final _s.RestJsonProtocol _protocol;
  RecycleBin({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rbin',
            signingName: 'rbin',
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

  /// Creates a Recycle Bin retention rule. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recycle-bin-working-with-rules.html#recycle-bin-create-rule">
  /// Create Recycle Bin retention rules</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceType] :
  /// The resource type to be retained by the retention rule. Currently, only
  /// Amazon EBS snapshots and EBS-backed AMIs are supported. To retain
  /// snapshots, specify <code>EBS_SNAPSHOT</code>. To retain EBS-backed AMIs,
  /// specify <code>EC2_IMAGE</code>.
  ///
  /// Parameter [retentionPeriod] :
  /// Information about the retention period for which the retention rule is to
  /// retain resources.
  ///
  /// Parameter [description] :
  /// The retention rule description.
  ///
  /// Parameter [lockConfiguration] :
  /// Information about the retention rule lock configuration.
  ///
  /// Parameter [resourceTags] :
  /// Specifies the resource tags to use to identify resources that are to be
  /// retained by a tag-level retention rule. For tag-level retention rules,
  /// only deleted resources, of the specified resource type, that have one or
  /// more of the specified tag key and value pairs are retained. If a resource
  /// is deleted, but it does not have any of the specified tag key and value
  /// pairs, it is immediately deleted without being retained by the retention
  /// rule.
  ///
  /// You can add the same tag key and value pair to a maximum or five retention
  /// rules.
  ///
  /// To create a Region-level retention rule, omit this parameter. A
  /// Region-level retention rule does not have any resource tags specified. It
  /// retains all deleted resources of the specified resource type in the Region
  /// in which the rule is created, even if the resources are not tagged.
  ///
  /// Parameter [tags] :
  /// Information about the tags to assign to the retention rule.
  Future<CreateRuleResponse> createRule({
    required ResourceType resourceType,
    required RetentionPeriod retentionPeriod,
    String? description,
    LockConfiguration? lockConfiguration,
    List<ResourceTag>? resourceTags,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceType': resourceType.toValue(),
      'RetentionPeriod': retentionPeriod,
      if (description != null) 'Description': description,
      if (lockConfiguration != null) 'LockConfiguration': lockConfiguration,
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/rules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRuleResponse.fromJson(response);
  }

  /// Deletes a Recycle Bin retention rule. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recycle-bin-working-with-rules.html#recycle-bin-delete-rule">
  /// Delete Recycle Bin retention rules</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [identifier] :
  /// The unique ID of the retention rule.
  Future<void> deleteRule({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/rules/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets information about a Recycle Bin retention rule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [identifier] :
  /// The unique ID of the retention rule.
  Future<GetRuleResponse> getRule({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rules/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRuleResponse.fromJson(response);
  }

  /// Lists the Recycle Bin retention rules in the Region.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceType] :
  /// The resource type retained by the retention rule. Only retention rules
  /// that retain the specified resource type are listed. Currently, only Amazon
  /// EBS snapshots and EBS-backed AMIs are supported. To list retention rules
  /// that retain snapshots, specify <code>EBS_SNAPSHOT</code>. To list
  /// retention rules that retain EBS-backed AMIs, specify
  /// <code>EC2_IMAGE</code>.
  ///
  /// Parameter [lockState] :
  /// The lock state of the retention rules to list. Only retention rules with
  /// the specified lock state are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [resourceTags] :
  /// Information about the resource tags used to identify resources that are
  /// retained by the retention rule.
  Future<ListRulesResponse> listRules({
    required ResourceType resourceType,
    LockState? lockState,
    int? maxResults,
    String? nextToken,
    List<ResourceTag>? resourceTags,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'ResourceType': resourceType.toValue(),
      if (lockState != null) 'LockState': lockState.toValue(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (resourceTags != null) 'ResourceTags': resourceTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-rules',
      exceptionFnMap: _exceptionFns,
    );
    return ListRulesResponse.fromJson(response);
  }

  /// Lists the tags assigned to a retention rule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the retention rule.
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

  /// Locks a retention rule. A locked retention rule can't be modified or
  /// deleted.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [identifier] :
  /// The unique ID of the retention rule.
  ///
  /// Parameter [lockConfiguration] :
  /// Information about the retention rule lock configuration.
  Future<LockRuleResponse> lockRule({
    required String identifier,
    required LockConfiguration lockConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'LockConfiguration': lockConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/rules/${Uri.encodeComponent(identifier)}/lock',
      exceptionFnMap: _exceptionFns,
    );
    return LockRuleResponse.fromJson(response);
  }

  /// Assigns tags to the specified retention rule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the retention rule.
  ///
  /// Parameter [tags] :
  /// Information about the tags to assign to the retention rule.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
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

  /// Unlocks a retention rule. After a retention rule is unlocked, it can be
  /// modified or deleted only after the unlock delay period expires.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [identifier] :
  /// The unique ID of the retention rule.
  Future<UnlockRuleResponse> unlockRule({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri: '/rules/${Uri.encodeComponent(identifier)}/unlock',
      exceptionFnMap: _exceptionFns,
    );
    return UnlockRuleResponse.fromJson(response);
  }

  /// Unassigns a tag from a retention rule.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the retention rule.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys of the tags to unassign. All tags that have the specified tag
  /// key are unassigned.
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

  /// Updates an existing Recycle Bin retention rule. You can update a retention
  /// rule's description, resource tags, and retention period at any time after
  /// creation. You can't update a retention rule's resource type after
  /// creation. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recycle-bin-working-with-rules.html#recycle-bin-update-rule">
  /// Update Recycle Bin retention rules</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [identifier] :
  /// The unique ID of the retention rule.
  ///
  /// Parameter [description] :
  /// The retention rule description.
  ///
  /// Parameter [resourceTags] :
  /// Specifies the resource tags to use to identify resources that are to be
  /// retained by a tag-level retention rule. For tag-level retention rules,
  /// only deleted resources, of the specified resource type, that have one or
  /// more of the specified tag key and value pairs are retained. If a resource
  /// is deleted, but it does not have any of the specified tag key and value
  /// pairs, it is immediately deleted without being retained by the retention
  /// rule.
  ///
  /// You can add the same tag key and value pair to a maximum or five retention
  /// rules.
  ///
  /// To create a Region-level retention rule, omit this parameter. A
  /// Region-level retention rule does not have any resource tags specified. It
  /// retains all deleted resources of the specified resource type in the Region
  /// in which the rule is created, even if the resources are not tagged.
  ///
  /// Parameter [resourceType] :
  /// <note>
  /// This parameter is currently not supported. You can't update a retention
  /// rule's resource type after creation.
  /// </note>
  ///
  /// Parameter [retentionPeriod] :
  /// Information about the retention period for which the retention rule is to
  /// retain resources.
  Future<UpdateRuleResponse> updateRule({
    required String identifier,
    String? description,
    List<ResourceTag>? resourceTags,
    ResourceType? resourceType,
    RetentionPeriod? retentionPeriod,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/rules/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRuleResponse.fromJson(response);
  }
}

class CreateRuleResponse {
  /// The retention rule description.
  final String? description;

  /// The unique ID of the retention rule.
  final String? identifier;

  /// Information about the retention rule lock configuration.
  final LockConfiguration? lockConfiguration;

  /// The lock state for the retention rule.
  ///
  /// <ul>
  /// <li>
  /// <code>locked</code> - The retention rule is locked and can't be modified or
  /// deleted.
  /// </li>
  /// <li>
  /// <code>pending_unlock</code> - The retention rule has been unlocked but it is
  /// still within the unlock delay period. The retention rule can be modified or
  /// deleted only after the unlock delay period has expired.
  /// </li>
  /// <li>
  /// <code>unlocked</code> - The retention rule is unlocked and it can be
  /// modified or deleted by any user with the required permissions.
  /// </li>
  /// <li>
  /// <code>null</code> - The retention rule has never been locked. Once a
  /// retention rule has been locked, it can transition between the
  /// <code>locked</code> and <code>unlocked</code> states only; it can never
  /// transition back to <code>null</code>.
  /// </li>
  /// </ul>
  final LockState? lockState;

  /// Information about the resource tags used to identify resources that are
  /// retained by the retention rule.
  final List<ResourceTag>? resourceTags;

  /// The resource type retained by the retention rule.
  final ResourceType? resourceType;
  final RetentionPeriod? retentionPeriod;

  /// The Amazon Resource Name (ARN) of the retention rule.
  final String? ruleArn;

  /// The state of the retention rule. Only retention rules that are in the
  /// <code>available</code> state retain resources.
  final RuleStatus? status;

  /// Information about the tags assigned to the retention rule.
  final List<Tag>? tags;

  CreateRuleResponse({
    this.description,
    this.identifier,
    this.lockConfiguration,
    this.lockState,
    this.resourceTags,
    this.resourceType,
    this.retentionPeriod,
    this.ruleArn,
    this.status,
    this.tags,
  });

  factory CreateRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateRuleResponse(
      description: json['Description'] as String?,
      identifier: json['Identifier'] as String?,
      lockConfiguration: json['LockConfiguration'] != null
          ? LockConfiguration.fromJson(
              json['LockConfiguration'] as Map<String, dynamic>)
          : null,
      lockState: (json['LockState'] as String?)?.toLockState(),
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
      retentionPeriod: json['RetentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['RetentionPeriod'] as Map<String, dynamic>)
          : null,
      ruleArn: json['RuleArn'] as String?,
      status: (json['Status'] as String?)?.toRuleStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final identifier = this.identifier;
    final lockConfiguration = this.lockConfiguration;
    final lockState = this.lockState;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final retentionPeriod = this.retentionPeriod;
    final ruleArn = this.ruleArn;
    final status = this.status;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (identifier != null) 'Identifier': identifier,
      if (lockConfiguration != null) 'LockConfiguration': lockConfiguration,
      if (lockState != null) 'LockState': lockState.toValue(),
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class DeleteRuleResponse {
  DeleteRuleResponse();

  factory DeleteRuleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRuleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetRuleResponse {
  /// The retention rule description.
  final String? description;

  /// The unique ID of the retention rule.
  final String? identifier;

  /// Information about the retention rule lock configuration.
  final LockConfiguration? lockConfiguration;

  /// The date and time at which the unlock delay is set to expire. Only returned
  /// for retention rules that have been unlocked and that are still within the
  /// unlock delay period.
  final DateTime? lockEndTime;

  /// The lock state for the retention rule.
  ///
  /// <ul>
  /// <li>
  /// <code>locked</code> - The retention rule is locked and can't be modified or
  /// deleted.
  /// </li>
  /// <li>
  /// <code>pending_unlock</code> - The retention rule has been unlocked but it is
  /// still within the unlock delay period. The retention rule can be modified or
  /// deleted only after the unlock delay period has expired.
  /// </li>
  /// <li>
  /// <code>unlocked</code> - The retention rule is unlocked and it can be
  /// modified or deleted by any user with the required permissions.
  /// </li>
  /// <li>
  /// <code>null</code> - The retention rule has never been locked. Once a
  /// retention rule has been locked, it can transition between the
  /// <code>locked</code> and <code>unlocked</code> states only; it can never
  /// transition back to <code>null</code>.
  /// </li>
  /// </ul>
  final LockState? lockState;

  /// Information about the resource tags used to identify resources that are
  /// retained by the retention rule.
  final List<ResourceTag>? resourceTags;

  /// The resource type retained by the retention rule.
  final ResourceType? resourceType;

  /// Information about the retention period for which the retention rule is to
  /// retain resources.
  final RetentionPeriod? retentionPeriod;

  /// The Amazon Resource Name (ARN) of the retention rule.
  final String? ruleArn;

  /// The state of the retention rule. Only retention rules that are in the
  /// <code>available</code> state retain resources.
  final RuleStatus? status;

  GetRuleResponse({
    this.description,
    this.identifier,
    this.lockConfiguration,
    this.lockEndTime,
    this.lockState,
    this.resourceTags,
    this.resourceType,
    this.retentionPeriod,
    this.ruleArn,
    this.status,
  });

  factory GetRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetRuleResponse(
      description: json['Description'] as String?,
      identifier: json['Identifier'] as String?,
      lockConfiguration: json['LockConfiguration'] != null
          ? LockConfiguration.fromJson(
              json['LockConfiguration'] as Map<String, dynamic>)
          : null,
      lockEndTime: timeStampFromJson(json['LockEndTime']),
      lockState: (json['LockState'] as String?)?.toLockState(),
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
      retentionPeriod: json['RetentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['RetentionPeriod'] as Map<String, dynamic>)
          : null,
      ruleArn: json['RuleArn'] as String?,
      status: (json['Status'] as String?)?.toRuleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final identifier = this.identifier;
    final lockConfiguration = this.lockConfiguration;
    final lockEndTime = this.lockEndTime;
    final lockState = this.lockState;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final retentionPeriod = this.retentionPeriod;
    final ruleArn = this.ruleArn;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (identifier != null) 'Identifier': identifier,
      if (lockConfiguration != null) 'LockConfiguration': lockConfiguration,
      if (lockEndTime != null) 'LockEndTime': unixTimestampToJson(lockEndTime),
      if (lockState != null) 'LockState': lockState.toValue(),
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ListRulesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// Information about the retention rules.
  final List<RuleSummary>? rules;

  ListRulesResponse({
    this.nextToken,
    this.rules,
  });

  factory ListRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListRulesResponse(
      nextToken: json['NextToken'] as String?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => RuleSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rules = this.rules;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (rules != null) 'Rules': rules,
    };
  }
}

class ListTagsForResourceResponse {
  /// Information about the tags assigned to the retention rule.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Information about a retention rule lock configuration.
class LockConfiguration {
  /// Information about the retention rule unlock delay.
  final UnlockDelay unlockDelay;

  LockConfiguration({
    required this.unlockDelay,
  });

  factory LockConfiguration.fromJson(Map<String, dynamic> json) {
    return LockConfiguration(
      unlockDelay:
          UnlockDelay.fromJson(json['UnlockDelay'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final unlockDelay = this.unlockDelay;
    return {
      'UnlockDelay': unlockDelay,
    };
  }
}

class LockRuleResponse {
  /// The retention rule description.
  final String? description;

  /// The unique ID of the retention rule.
  final String? identifier;

  /// Information about the retention rule lock configuration.
  final LockConfiguration? lockConfiguration;

  /// The lock state for the retention rule.
  ///
  /// <ul>
  /// <li>
  /// <code>locked</code> - The retention rule is locked and can't be modified or
  /// deleted.
  /// </li>
  /// <li>
  /// <code>pending_unlock</code> - The retention rule has been unlocked but it is
  /// still within the unlock delay period. The retention rule can be modified or
  /// deleted only after the unlock delay period has expired.
  /// </li>
  /// <li>
  /// <code>unlocked</code> - The retention rule is unlocked and it can be
  /// modified or deleted by any user with the required permissions.
  /// </li>
  /// <li>
  /// <code>null</code> - The retention rule has never been locked. Once a
  /// retention rule has been locked, it can transition between the
  /// <code>locked</code> and <code>unlocked</code> states only; it can never
  /// transition back to <code>null</code>.
  /// </li>
  /// </ul>
  final LockState? lockState;

  /// Information about the resource tags used to identify resources that are
  /// retained by the retention rule.
  final List<ResourceTag>? resourceTags;

  /// The resource type retained by the retention rule.
  final ResourceType? resourceType;
  final RetentionPeriod? retentionPeriod;

  /// The Amazon Resource Name (ARN) of the retention rule.
  final String? ruleArn;

  /// The state of the retention rule. Only retention rules that are in the
  /// <code>available</code> state retain resources.
  final RuleStatus? status;

  LockRuleResponse({
    this.description,
    this.identifier,
    this.lockConfiguration,
    this.lockState,
    this.resourceTags,
    this.resourceType,
    this.retentionPeriod,
    this.ruleArn,
    this.status,
  });

  factory LockRuleResponse.fromJson(Map<String, dynamic> json) {
    return LockRuleResponse(
      description: json['Description'] as String?,
      identifier: json['Identifier'] as String?,
      lockConfiguration: json['LockConfiguration'] != null
          ? LockConfiguration.fromJson(
              json['LockConfiguration'] as Map<String, dynamic>)
          : null,
      lockState: (json['LockState'] as String?)?.toLockState(),
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
      retentionPeriod: json['RetentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['RetentionPeriod'] as Map<String, dynamic>)
          : null,
      ruleArn: json['RuleArn'] as String?,
      status: (json['Status'] as String?)?.toRuleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final identifier = this.identifier;
    final lockConfiguration = this.lockConfiguration;
    final lockState = this.lockState;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final retentionPeriod = this.retentionPeriod;
    final ruleArn = this.ruleArn;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (identifier != null) 'Identifier': identifier,
      if (lockConfiguration != null) 'LockConfiguration': lockConfiguration,
      if (lockState != null) 'LockState': lockState.toValue(),
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum LockState {
  locked,
  pendingUnlock,
  unlocked,
}

extension LockStateValueExtension on LockState {
  String toValue() {
    switch (this) {
      case LockState.locked:
        return 'locked';
      case LockState.pendingUnlock:
        return 'pending_unlock';
      case LockState.unlocked:
        return 'unlocked';
    }
  }
}

extension LockStateFromString on String {
  LockState toLockState() {
    switch (this) {
      case 'locked':
        return LockState.locked;
      case 'pending_unlock':
        return LockState.pendingUnlock;
      case 'unlocked':
        return LockState.unlocked;
    }
    throw Exception('$this is not known in enum LockState');
  }
}

/// Information about the resource tags used to identify resources that are
/// retained by the retention rule.
class ResourceTag {
  /// The tag key.
  final String resourceTagKey;

  /// The tag value.
  final String? resourceTagValue;

  ResourceTag({
    required this.resourceTagKey,
    this.resourceTagValue,
  });

  factory ResourceTag.fromJson(Map<String, dynamic> json) {
    return ResourceTag(
      resourceTagKey: json['ResourceTagKey'] as String,
      resourceTagValue: json['ResourceTagValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTagKey = this.resourceTagKey;
    final resourceTagValue = this.resourceTagValue;
    return {
      'ResourceTagKey': resourceTagKey,
      if (resourceTagValue != null) 'ResourceTagValue': resourceTagValue,
    };
  }
}

enum ResourceType {
  ebsSnapshot,
  ec2Image,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.ebsSnapshot:
        return 'EBS_SNAPSHOT';
      case ResourceType.ec2Image:
        return 'EC2_IMAGE';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'EBS_SNAPSHOT':
        return ResourceType.ebsSnapshot;
      case 'EC2_IMAGE':
        return ResourceType.ec2Image;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

/// Information about the retention period for which the retention rule is to
/// retain resources.
class RetentionPeriod {
  /// The unit of time in which the retention period is measured. Currently, only
  /// <code>DAYS</code> is supported.
  final RetentionPeriodUnit retentionPeriodUnit;

  /// The period value for which the retention rule is to retain resources. The
  /// period is measured using the unit specified for <b>RetentionPeriodUnit</b>.
  final int retentionPeriodValue;

  RetentionPeriod({
    required this.retentionPeriodUnit,
    required this.retentionPeriodValue,
  });

  factory RetentionPeriod.fromJson(Map<String, dynamic> json) {
    return RetentionPeriod(
      retentionPeriodUnit:
          (json['RetentionPeriodUnit'] as String).toRetentionPeriodUnit(),
      retentionPeriodValue: json['RetentionPeriodValue'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final retentionPeriodUnit = this.retentionPeriodUnit;
    final retentionPeriodValue = this.retentionPeriodValue;
    return {
      'RetentionPeriodUnit': retentionPeriodUnit.toValue(),
      'RetentionPeriodValue': retentionPeriodValue,
    };
  }
}

enum RetentionPeriodUnit {
  days,
}

extension RetentionPeriodUnitValueExtension on RetentionPeriodUnit {
  String toValue() {
    switch (this) {
      case RetentionPeriodUnit.days:
        return 'DAYS';
    }
  }
}

extension RetentionPeriodUnitFromString on String {
  RetentionPeriodUnit toRetentionPeriodUnit() {
    switch (this) {
      case 'DAYS':
        return RetentionPeriodUnit.days;
    }
    throw Exception('$this is not known in enum RetentionPeriodUnit');
  }
}

enum RuleStatus {
  pending,
  available,
}

extension RuleStatusValueExtension on RuleStatus {
  String toValue() {
    switch (this) {
      case RuleStatus.pending:
        return 'pending';
      case RuleStatus.available:
        return 'available';
    }
  }
}

extension RuleStatusFromString on String {
  RuleStatus toRuleStatus() {
    switch (this) {
      case 'pending':
        return RuleStatus.pending;
      case 'available':
        return RuleStatus.available;
    }
    throw Exception('$this is not known in enum RuleStatus');
  }
}

/// Information about a Recycle Bin retention rule.
class RuleSummary {
  /// The retention rule description.
  final String? description;

  /// The unique ID of the retention rule.
  final String? identifier;

  /// The lock state for the retention rule.
  ///
  /// <ul>
  /// <li>
  /// <code>locked</code> - The retention rule is locked and can't be modified or
  /// deleted.
  /// </li>
  /// <li>
  /// <code>pending_unlock</code> - The retention rule has been unlocked but it is
  /// still within the unlock delay period. The retention rule can be modified or
  /// deleted only after the unlock delay period has expired.
  /// </li>
  /// <li>
  /// <code>unlocked</code> - The retention rule is unlocked and it can be
  /// modified or deleted by any user with the required permissions.
  /// </li>
  /// <li>
  /// <code>null</code> - The retention rule has never been locked. Once a
  /// retention rule has been locked, it can transition between the
  /// <code>locked</code> and <code>unlocked</code> states only; it can never
  /// transition back to <code>null</code>.
  /// </li>
  /// </ul>
  final LockState? lockState;

  /// Information about the retention period for which the retention rule is to
  /// retain resources.
  final RetentionPeriod? retentionPeriod;

  /// The Amazon Resource Name (ARN) of the retention rule.
  final String? ruleArn;

  RuleSummary({
    this.description,
    this.identifier,
    this.lockState,
    this.retentionPeriod,
    this.ruleArn,
  });

  factory RuleSummary.fromJson(Map<String, dynamic> json) {
    return RuleSummary(
      description: json['Description'] as String?,
      identifier: json['Identifier'] as String?,
      lockState: (json['LockState'] as String?)?.toLockState(),
      retentionPeriod: json['RetentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['RetentionPeriod'] as Map<String, dynamic>)
          : null,
      ruleArn: json['RuleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final identifier = this.identifier;
    final lockState = this.lockState;
    final retentionPeriod = this.retentionPeriod;
    final ruleArn = this.ruleArn;
    return {
      if (description != null) 'Description': description,
      if (identifier != null) 'Identifier': identifier,
      if (lockState != null) 'LockState': lockState.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (ruleArn != null) 'RuleArn': ruleArn,
    };
  }
}

/// Information about the tags to assign to the retention rule.
class Tag {
  /// The tag key.
  final String key;

  /// The tag value.
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

/// Information about the retention rule unlock delay. The unlock delay is the
/// period after which a retention rule can be modified or edited after it has
/// been unlocked by a user with the required permissions. The retention rule
/// can't be modified or deleted during the unlock delay.
class UnlockDelay {
  /// The unit of time in which to measure the unlock delay. Currently, the unlock
  /// delay can be measure only in days.
  final UnlockDelayUnit unlockDelayUnit;

  /// The unlock delay period, measured in the unit specified for <b>
  /// UnlockDelayUnit</b>.
  final int unlockDelayValue;

  UnlockDelay({
    required this.unlockDelayUnit,
    required this.unlockDelayValue,
  });

  factory UnlockDelay.fromJson(Map<String, dynamic> json) {
    return UnlockDelay(
      unlockDelayUnit: (json['UnlockDelayUnit'] as String).toUnlockDelayUnit(),
      unlockDelayValue: json['UnlockDelayValue'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final unlockDelayUnit = this.unlockDelayUnit;
    final unlockDelayValue = this.unlockDelayValue;
    return {
      'UnlockDelayUnit': unlockDelayUnit.toValue(),
      'UnlockDelayValue': unlockDelayValue,
    };
  }
}

enum UnlockDelayUnit {
  days,
}

extension UnlockDelayUnitValueExtension on UnlockDelayUnit {
  String toValue() {
    switch (this) {
      case UnlockDelayUnit.days:
        return 'DAYS';
    }
  }
}

extension UnlockDelayUnitFromString on String {
  UnlockDelayUnit toUnlockDelayUnit() {
    switch (this) {
      case 'DAYS':
        return UnlockDelayUnit.days;
    }
    throw Exception('$this is not known in enum UnlockDelayUnit');
  }
}

class UnlockRuleResponse {
  /// The retention rule description.
  final String? description;

  /// The unique ID of the retention rule.
  final String? identifier;

  /// Information about the retention rule lock configuration.
  final LockConfiguration? lockConfiguration;

  /// The date and time at which the unlock delay is set to expire. Only returned
  /// for retention rules that have been unlocked and that are still within the
  /// unlock delay period.
  final DateTime? lockEndTime;

  /// The lock state for the retention rule.
  ///
  /// <ul>
  /// <li>
  /// <code>locked</code> - The retention rule is locked and can't be modified or
  /// deleted.
  /// </li>
  /// <li>
  /// <code>pending_unlock</code> - The retention rule has been unlocked but it is
  /// still within the unlock delay period. The retention rule can be modified or
  /// deleted only after the unlock delay period has expired.
  /// </li>
  /// <li>
  /// <code>unlocked</code> - The retention rule is unlocked and it can be
  /// modified or deleted by any user with the required permissions.
  /// </li>
  /// <li>
  /// <code>null</code> - The retention rule has never been locked. Once a
  /// retention rule has been locked, it can transition between the
  /// <code>locked</code> and <code>unlocked</code> states only; it can never
  /// transition back to <code>null</code>.
  /// </li>
  /// </ul>
  final LockState? lockState;

  /// Information about the resource tags used to identify resources that are
  /// retained by the retention rule.
  final List<ResourceTag>? resourceTags;

  /// The resource type retained by the retention rule.
  final ResourceType? resourceType;
  final RetentionPeriod? retentionPeriod;

  /// The Amazon Resource Name (ARN) of the retention rule.
  final String? ruleArn;

  /// The state of the retention rule. Only retention rules that are in the
  /// <code>available</code> state retain resources.
  final RuleStatus? status;

  UnlockRuleResponse({
    this.description,
    this.identifier,
    this.lockConfiguration,
    this.lockEndTime,
    this.lockState,
    this.resourceTags,
    this.resourceType,
    this.retentionPeriod,
    this.ruleArn,
    this.status,
  });

  factory UnlockRuleResponse.fromJson(Map<String, dynamic> json) {
    return UnlockRuleResponse(
      description: json['Description'] as String?,
      identifier: json['Identifier'] as String?,
      lockConfiguration: json['LockConfiguration'] != null
          ? LockConfiguration.fromJson(
              json['LockConfiguration'] as Map<String, dynamic>)
          : null,
      lockEndTime: timeStampFromJson(json['LockEndTime']),
      lockState: (json['LockState'] as String?)?.toLockState(),
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
      retentionPeriod: json['RetentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['RetentionPeriod'] as Map<String, dynamic>)
          : null,
      ruleArn: json['RuleArn'] as String?,
      status: (json['Status'] as String?)?.toRuleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final identifier = this.identifier;
    final lockConfiguration = this.lockConfiguration;
    final lockEndTime = this.lockEndTime;
    final lockState = this.lockState;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final retentionPeriod = this.retentionPeriod;
    final ruleArn = this.ruleArn;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (identifier != null) 'Identifier': identifier,
      if (lockConfiguration != null) 'LockConfiguration': lockConfiguration,
      if (lockEndTime != null) 'LockEndTime': unixTimestampToJson(lockEndTime),
      if (lockState != null) 'LockState': lockState.toValue(),
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (status != null) 'Status': status.toValue(),
    };
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

class UpdateRuleResponse {
  /// The retention rule description.
  final String? description;

  /// The unique ID of the retention rule.
  final String? identifier;

  /// The date and time at which the unlock delay is set to expire. Only returned
  /// for retention rules that have been unlocked and that are still within the
  /// unlock delay period.
  final DateTime? lockEndTime;

  /// The lock state for the retention rule.
  ///
  /// <ul>
  /// <li>
  /// <code>locked</code> - The retention rule is locked and can't be modified or
  /// deleted.
  /// </li>
  /// <li>
  /// <code>pending_unlock</code> - The retention rule has been unlocked but it is
  /// still within the unlock delay period. The retention rule can be modified or
  /// deleted only after the unlock delay period has expired.
  /// </li>
  /// <li>
  /// <code>unlocked</code> - The retention rule is unlocked and it can be
  /// modified or deleted by any user with the required permissions.
  /// </li>
  /// <li>
  /// <code>null</code> - The retention rule has never been locked. Once a
  /// retention rule has been locked, it can transition between the
  /// <code>locked</code> and <code>unlocked</code> states only; it can never
  /// transition back to <code>null</code>.
  /// </li>
  /// </ul>
  final LockState? lockState;

  /// Information about the resource tags used to identify resources that are
  /// retained by the retention rule.
  final List<ResourceTag>? resourceTags;

  /// The resource type retained by the retention rule.
  final ResourceType? resourceType;
  final RetentionPeriod? retentionPeriod;

  /// The Amazon Resource Name (ARN) of the retention rule.
  final String? ruleArn;

  /// The state of the retention rule. Only retention rules that are in the
  /// <code>available</code> state retain resources.
  final RuleStatus? status;

  UpdateRuleResponse({
    this.description,
    this.identifier,
    this.lockEndTime,
    this.lockState,
    this.resourceTags,
    this.resourceType,
    this.retentionPeriod,
    this.ruleArn,
    this.status,
  });

  factory UpdateRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRuleResponse(
      description: json['Description'] as String?,
      identifier: json['Identifier'] as String?,
      lockEndTime: timeStampFromJson(json['LockEndTime']),
      lockState: (json['LockState'] as String?)?.toLockState(),
      resourceTags: (json['ResourceTags'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
      retentionPeriod: json['RetentionPeriod'] != null
          ? RetentionPeriod.fromJson(
              json['RetentionPeriod'] as Map<String, dynamic>)
          : null,
      ruleArn: json['RuleArn'] as String?,
      status: (json['Status'] as String?)?.toRuleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final identifier = this.identifier;
    final lockEndTime = this.lockEndTime;
    final lockState = this.lockState;
    final resourceTags = this.resourceTags;
    final resourceType = this.resourceType;
    final retentionPeriod = this.retentionPeriod;
    final ruleArn = this.ruleArn;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (identifier != null) 'Identifier': identifier,
      if (lockEndTime != null) 'LockEndTime': unixTimestampToJson(lockEndTime),
      if (lockState != null) 'LockState': lockState.toValue(),
      if (resourceTags != null) 'ResourceTags': resourceTags,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (ruleArn != null) 'RuleArn': ruleArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
