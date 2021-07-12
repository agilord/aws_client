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

/// With Amazon Data Lifecycle Manager, you can manage the lifecycle of your AWS
/// resources. You create lifecycle policies, which are used to automate
/// operations on the specified resources.
class Dlm {
  final _s.RestJsonProtocol _protocol;
  Dlm({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'dlm',
            signingName: 'dlm',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a policy to manage the lifecycle of the specified AWS resources.
  /// You can create up to 100 lifecycle policies.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [description] :
  /// A description of the lifecycle policy. The characters ^[0-9A-Za-z _-]+$
  /// are supported.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role used to run the operations
  /// specified by the lifecycle policy.
  ///
  /// Parameter [policyDetails] :
  /// The configuration details of the lifecycle policy.
  ///
  /// Parameter [state] :
  /// The desired activation state of the lifecycle policy after creation.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the lifecycle policy during creation.
  Future<CreateLifecyclePolicyResponse> createLifecyclePolicy({
    required String description,
    required String executionRoleArn,
    required PolicyDetails policyDetails,
    required SettablePolicyStateValues state,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      500,
      isRequired: true,
    );
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      0,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyDetails, 'policyDetails');
    ArgumentError.checkNotNull(state, 'state');
    final $payload = <String, dynamic>{
      'Description': description,
      'ExecutionRoleArn': executionRoleArn,
      'PolicyDetails': policyDetails,
      'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policies',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLifecyclePolicyResponse.fromJson(response);
  }

  /// Deletes the specified lifecycle policy and halts the automated operations
  /// that the policy specified.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyId] :
  /// The identifier of the lifecycle policy.
  Future<void> deleteLifecyclePolicy({
    required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/policies/${Uri.encodeComponent(policyId)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets summary information about all or the specified data lifecycle
  /// policies.
  ///
  /// To get complete information about a policy, use <a>GetLifecyclePolicy</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyIds] :
  /// The identifiers of the data lifecycle policies.
  ///
  /// Parameter [resourceTypes] :
  /// The resource type.
  ///
  /// Parameter [state] :
  /// The activation state.
  ///
  /// Parameter [tagsToAdd] :
  /// The tags to add to objects created by the policy.
  ///
  /// Tags are strings in the format <code>key=value</code>.
  ///
  /// These user-defined tags are added in addition to the AWS-added lifecycle
  /// tags.
  ///
  /// Parameter [targetTags] :
  /// The target tag for a policy.
  ///
  /// Tags are strings in the format <code>key=value</code>.
  Future<GetLifecyclePoliciesResponse> getLifecyclePolicies({
    List<String>? policyIds,
    List<ResourceTypeValues>? resourceTypes,
    GettablePolicyStateValues? state,
    List<String>? tagsToAdd,
    List<String>? targetTags,
  }) async {
    final $query = <String, List<String>>{
      if (policyIds != null) 'policyIds': policyIds,
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
      if (state != null) 'state': [state.toValue()],
      if (tagsToAdd != null) 'tagsToAdd': tagsToAdd,
      if (targetTags != null) 'targetTags': targetTags,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLifecyclePoliciesResponse.fromJson(response);
  }

  /// Gets detailed information about the specified lifecycle policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyId] :
  /// The identifier of the lifecycle policy.
  Future<GetLifecyclePolicyResponse> getLifecyclePolicy({
    required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      64,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies/${Uri.encodeComponent(policyId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetLifecyclePolicyResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      2048,
      isRequired: true,
    );
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

  /// Removes the specified tags from the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
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
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      2048,
      isRequired: true,
    );
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

  /// Updates the specified lifecycle policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InternalServerException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyId] :
  /// The identifier of the lifecycle policy.
  ///
  /// Parameter [description] :
  /// A description of the lifecycle policy.
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role used to run the operations
  /// specified by the lifecycle policy.
  ///
  /// Parameter [policyDetails] :
  /// The configuration of the lifecycle policy. You cannot update the policy
  /// type or the resource type.
  ///
  /// Parameter [state] :
  /// The desired activation state of the lifecycle policy after creation.
  Future<void> updateLifecyclePolicy({
    required String policyId,
    String? description,
    String? executionRoleArn,
    PolicyDetails? policyDetails,
    SettablePolicyStateValues? state,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      500,
    );
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      0,
      2048,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (policyDetails != null) 'PolicyDetails': policyDetails,
      if (state != null) 'State': state.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/policies/${Uri.encodeComponent(policyId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Specifies an action for an event-based policy.
class Action {
  /// The rule for copying shared snapshots across Regions.
  final List<CrossRegionCopyAction> crossRegionCopy;

  /// A descriptive name for the action.
  final String name;

  Action({
    required this.crossRegionCopy,
    required this.name,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      crossRegionCopy: (json['CrossRegionCopy'] as List)
          .whereNotNull()
          .map((e) => CrossRegionCopyAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final crossRegionCopy = this.crossRegionCopy;
    final name = this.name;
    return {
      'CrossRegionCopy': crossRegionCopy,
      'Name': name,
    };
  }
}

class CreateLifecyclePolicyResponse {
  /// The identifier of the lifecycle policy.
  final String? policyId;

  CreateLifecyclePolicyResponse({
    this.policyId,
  });

  factory CreateLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateLifecyclePolicyResponse(
      policyId: json['PolicyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyId = this.policyId;
    return {
      if (policyId != null) 'PolicyId': policyId,
    };
  }
}

/// Specifies when to create snapshots of EBS volumes.
///
/// You must specify either a Cron expression or an interval, interval unit, and
/// start time. You cannot specify both.
class CreateRule {
  /// The schedule, as a Cron expression. The schedule interval must be between 1
  /// hour and 1 year. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// expressions</a> in the <i>Amazon CloudWatch User Guide</i>.
  final String? cronExpression;

  /// The interval between snapshots. The supported values are 1, 2, 3, 4, 6, 8,
  /// 12, and 24.
  final int? interval;

  /// The interval unit.
  final IntervalUnitValues? intervalUnit;

  /// Specifies the destination for snapshots created by the policy. To create
  /// snapshots in the same Region as the source resource, specify
  /// <code>CLOUD</code>. To create snapshots on the same Outpost as the source
  /// resource, specify <code>OUTPOST_LOCAL</code>. If you omit this parameter,
  /// <code>CLOUD</code> is used by default.
  ///
  /// If the policy targets resources in an AWS Region, then you must create
  /// snapshots in the same Region as the source resource.
  ///
  /// If the policy targets resources on an Outpost, then you can create snapshots
  /// on the same Outpost as the source resource, or in the Region of that
  /// Outpost.
  final LocationValues? location;

  /// The time, in UTC, to start the operation. The supported format is hh:mm.
  ///
  /// The operation occurs within a one-hour window following the specified time.
  /// If you do not specify a time, Amazon DLM selects a time within the next 24
  /// hours.
  final List<String>? times;

  CreateRule({
    this.cronExpression,
    this.interval,
    this.intervalUnit,
    this.location,
    this.times,
  });

  factory CreateRule.fromJson(Map<String, dynamic> json) {
    return CreateRule(
      cronExpression: json['CronExpression'] as String?,
      interval: json['Interval'] as int?,
      intervalUnit: (json['IntervalUnit'] as String?)?.toIntervalUnitValues(),
      location: (json['Location'] as String?)?.toLocationValues(),
      times: (json['Times'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cronExpression = this.cronExpression;
    final interval = this.interval;
    final intervalUnit = this.intervalUnit;
    final location = this.location;
    final times = this.times;
    return {
      if (cronExpression != null) 'CronExpression': cronExpression,
      if (interval != null) 'Interval': interval,
      if (intervalUnit != null) 'IntervalUnit': intervalUnit.toValue(),
      if (location != null) 'Location': location.toValue(),
      if (times != null) 'Times': times,
    };
  }
}

/// Specifies a rule for copying shared snapshots across Regions.
class CrossRegionCopyAction {
  /// The encryption settings for the copied snapshot.
  final EncryptionConfiguration encryptionConfiguration;

  /// The target Region.
  final String target;
  final CrossRegionCopyRetainRule? retainRule;

  CrossRegionCopyAction({
    required this.encryptionConfiguration,
    required this.target,
    this.retainRule,
  });

  factory CrossRegionCopyAction.fromJson(Map<String, dynamic> json) {
    return CrossRegionCopyAction(
      encryptionConfiguration: EncryptionConfiguration.fromJson(
          json['EncryptionConfiguration'] as Map<String, dynamic>),
      target: json['Target'] as String,
      retainRule: json['RetainRule'] != null
          ? CrossRegionCopyRetainRule.fromJson(
              json['RetainRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    final target = this.target;
    final retainRule = this.retainRule;
    return {
      'EncryptionConfiguration': encryptionConfiguration,
      'Target': target,
      if (retainRule != null) 'RetainRule': retainRule,
    };
  }
}

/// Specifies the retention rule for cross-Region snapshot copies.
class CrossRegionCopyRetainRule {
  /// The amount of time to retain each snapshot. The maximum is 100 years. This
  /// is equivalent to 1200 months, 5200 weeks, or 36500 days.
  final int? interval;

  /// The unit of time for time-based retention.
  final RetentionIntervalUnitValues? intervalUnit;

  CrossRegionCopyRetainRule({
    this.interval,
    this.intervalUnit,
  });

  factory CrossRegionCopyRetainRule.fromJson(Map<String, dynamic> json) {
    return CrossRegionCopyRetainRule(
      interval: json['Interval'] as int?,
      intervalUnit:
          (json['IntervalUnit'] as String?)?.toRetentionIntervalUnitValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final interval = this.interval;
    final intervalUnit = this.intervalUnit;
    return {
      if (interval != null) 'Interval': interval,
      if (intervalUnit != null) 'IntervalUnit': intervalUnit.toValue(),
    };
  }
}

/// Specifies a rule for cross-Region snapshot copies.
class CrossRegionCopyRule {
  /// To encrypt a copy of an unencrypted snapshot if encryption by default is not
  /// enabled, enable encryption using this parameter. Copies of encrypted
  /// snapshots are encrypted, even if this parameter is false or if encryption by
  /// default is not enabled.
  final bool encrypted;

  /// The Amazon Resource Name (ARN) of the AWS KMS customer master key (CMK) to
  /// use for EBS encryption. If this parameter is not specified, your AWS managed
  /// CMK for EBS is used.
  final String? cmkArn;

  /// Copy all user-defined tags from the source snapshot to the copied snapshot.
  final bool? copyTags;

  /// The retention rule.
  final CrossRegionCopyRetainRule? retainRule;

  /// The Amazon Resource Name (ARN) of the target AWS Outpost for the snapshot
  /// copies.
  ///
  /// If you specify an ARN, you must omit <b>TargetRegion</b>. You cannot specify
  /// a target Region and a target Outpost in the same rule.
  final String? target;

  /// The target Region for the snapshot copies.
  ///
  /// If you specify a target Region, you must omit <b>Target</b>. You cannot
  /// specify a target Region and a target Outpost in the same rule.
  final String? targetRegion;

  CrossRegionCopyRule({
    required this.encrypted,
    this.cmkArn,
    this.copyTags,
    this.retainRule,
    this.target,
    this.targetRegion,
  });

  factory CrossRegionCopyRule.fromJson(Map<String, dynamic> json) {
    return CrossRegionCopyRule(
      encrypted: json['Encrypted'] as bool,
      cmkArn: json['CmkArn'] as String?,
      copyTags: json['CopyTags'] as bool?,
      retainRule: json['RetainRule'] != null
          ? CrossRegionCopyRetainRule.fromJson(
              json['RetainRule'] as Map<String, dynamic>)
          : null,
      target: json['Target'] as String?,
      targetRegion: json['TargetRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encrypted = this.encrypted;
    final cmkArn = this.cmkArn;
    final copyTags = this.copyTags;
    final retainRule = this.retainRule;
    final target = this.target;
    final targetRegion = this.targetRegion;
    return {
      'Encrypted': encrypted,
      if (cmkArn != null) 'CmkArn': cmkArn,
      if (copyTags != null) 'CopyTags': copyTags,
      if (retainRule != null) 'RetainRule': retainRule,
      if (target != null) 'Target': target,
      if (targetRegion != null) 'TargetRegion': targetRegion,
    };
  }
}

class DeleteLifecyclePolicyResponse {
  DeleteLifecyclePolicyResponse();

  factory DeleteLifecyclePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLifecyclePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the encryption settings for shared snapshots that are copied
/// across Regions.
class EncryptionConfiguration {
  /// To encrypt a copy of an unencrypted snapshot when encryption by default is
  /// not enabled, enable encryption using this parameter. Copies of encrypted
  /// snapshots are encrypted, even if this parameter is false or when encryption
  /// by default is not enabled.
  final bool encrypted;

  /// The Amazon Resource Name (ARN) of the AWS KMS customer master key (CMK) to
  /// use for EBS encryption. If this parameter is not specified, your AWS managed
  /// CMK for EBS is used.
  final String? cmkArn;

  EncryptionConfiguration({
    required this.encrypted,
    this.cmkArn,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      encrypted: json['Encrypted'] as bool,
      cmkArn: json['CmkArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encrypted = this.encrypted;
    final cmkArn = this.cmkArn;
    return {
      'Encrypted': encrypted,
      if (cmkArn != null) 'CmkArn': cmkArn,
    };
  }
}

/// Specifies an event that triggers an event-based policy.
class EventParameters {
  /// The snapshot description that can trigger the policy. The description
  /// pattern is specified using a regular expression. The policy runs only if a
  /// snapshot with a description that matches the specified pattern is shared
  /// with your account.
  ///
  /// For example, specifying <code>^.*Created for policy:
  /// policy-1234567890abcdef0.*$</code> configures the policy to run only if
  /// snapshots created by policy <code>policy-1234567890abcdef0</code> are shared
  /// with your account.
  final String descriptionRegex;

  /// The type of event. Currently, only snapshot sharing events are supported.
  final EventTypeValues eventType;

  /// The IDs of the AWS accounts that can trigger policy by sharing snapshots
  /// with your account. The policy only runs if one of the specified AWS accounts
  /// shares a snapshot with your account.
  final List<String> snapshotOwner;

  EventParameters({
    required this.descriptionRegex,
    required this.eventType,
    required this.snapshotOwner,
  });

  factory EventParameters.fromJson(Map<String, dynamic> json) {
    return EventParameters(
      descriptionRegex: json['DescriptionRegex'] as String,
      eventType: (json['EventType'] as String).toEventTypeValues(),
      snapshotOwner: (json['SnapshotOwner'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final descriptionRegex = this.descriptionRegex;
    final eventType = this.eventType;
    final snapshotOwner = this.snapshotOwner;
    return {
      'DescriptionRegex': descriptionRegex,
      'EventType': eventType.toValue(),
      'SnapshotOwner': snapshotOwner,
    };
  }
}

/// Specifies an event that triggers an event-based policy.
class EventSource {
  /// The source of the event. Currently only managed AWS CloudWatch Events rules
  /// are supported.
  final EventSourceValues type;

  /// Information about the event.
  final EventParameters? parameters;

  EventSource({
    required this.type,
    this.parameters,
  });

  factory EventSource.fromJson(Map<String, dynamic> json) {
    return EventSource(
      type: (json['Type'] as String).toEventSourceValues(),
      parameters: json['Parameters'] != null
          ? EventParameters.fromJson(json['Parameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final parameters = this.parameters;
    return {
      'Type': type.toValue(),
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

enum EventSourceValues {
  managedCwe,
}

extension on EventSourceValues {
  String toValue() {
    switch (this) {
      case EventSourceValues.managedCwe:
        return 'MANAGED_CWE';
    }
  }
}

extension on String {
  EventSourceValues toEventSourceValues() {
    switch (this) {
      case 'MANAGED_CWE':
        return EventSourceValues.managedCwe;
    }
    throw Exception('$this is not known in enum EventSourceValues');
  }
}

enum EventTypeValues {
  shareSnapshot,
}

extension on EventTypeValues {
  String toValue() {
    switch (this) {
      case EventTypeValues.shareSnapshot:
        return 'shareSnapshot';
    }
  }
}

extension on String {
  EventTypeValues toEventTypeValues() {
    switch (this) {
      case 'shareSnapshot':
        return EventTypeValues.shareSnapshot;
    }
    throw Exception('$this is not known in enum EventTypeValues');
  }
}

/// Specifies a rule for enabling fast snapshot restore. You can enable fast
/// snapshot restore based on either a count or a time interval.
class FastRestoreRule {
  /// The Availability Zones in which to enable fast snapshot restore.
  final List<String> availabilityZones;

  /// The number of snapshots to be enabled with fast snapshot restore.
  final int? count;

  /// The amount of time to enable fast snapshot restore. The maximum is 100
  /// years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.
  final int? interval;

  /// The unit of time for enabling fast snapshot restore.
  final RetentionIntervalUnitValues? intervalUnit;

  FastRestoreRule({
    required this.availabilityZones,
    this.count,
    this.interval,
    this.intervalUnit,
  });

  factory FastRestoreRule.fromJson(Map<String, dynamic> json) {
    return FastRestoreRule(
      availabilityZones: (json['AvailabilityZones'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      count: json['Count'] as int?,
      interval: json['Interval'] as int?,
      intervalUnit:
          (json['IntervalUnit'] as String?)?.toRetentionIntervalUnitValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final count = this.count;
    final interval = this.interval;
    final intervalUnit = this.intervalUnit;
    return {
      'AvailabilityZones': availabilityZones,
      if (count != null) 'Count': count,
      if (interval != null) 'Interval': interval,
      if (intervalUnit != null) 'IntervalUnit': intervalUnit.toValue(),
    };
  }
}

class GetLifecyclePoliciesResponse {
  /// Summary information about the lifecycle policies.
  final List<LifecyclePolicySummary>? policies;

  GetLifecyclePoliciesResponse({
    this.policies,
  });

  factory GetLifecyclePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return GetLifecyclePoliciesResponse(
      policies: (json['Policies'] as List?)
          ?.whereNotNull()
          .map(
              (e) => LifecyclePolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    return {
      if (policies != null) 'Policies': policies,
    };
  }
}

class GetLifecyclePolicyResponse {
  /// Detailed information about the lifecycle policy.
  final LifecyclePolicy? policy;

  GetLifecyclePolicyResponse({
    this.policy,
  });

  factory GetLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetLifecyclePolicyResponse(
      policy: json['Policy'] != null
          ? LifecyclePolicy.fromJson(json['Policy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

enum GettablePolicyStateValues {
  enabled,
  disabled,
  error,
}

extension on GettablePolicyStateValues {
  String toValue() {
    switch (this) {
      case GettablePolicyStateValues.enabled:
        return 'ENABLED';
      case GettablePolicyStateValues.disabled:
        return 'DISABLED';
      case GettablePolicyStateValues.error:
        return 'ERROR';
    }
  }
}

extension on String {
  GettablePolicyStateValues toGettablePolicyStateValues() {
    switch (this) {
      case 'ENABLED':
        return GettablePolicyStateValues.enabled;
      case 'DISABLED':
        return GettablePolicyStateValues.disabled;
      case 'ERROR':
        return GettablePolicyStateValues.error;
    }
    throw Exception('$this is not known in enum GettablePolicyStateValues');
  }
}

enum IntervalUnitValues {
  hours,
}

extension on IntervalUnitValues {
  String toValue() {
    switch (this) {
      case IntervalUnitValues.hours:
        return 'HOURS';
    }
  }
}

extension on String {
  IntervalUnitValues toIntervalUnitValues() {
    switch (this) {
      case 'HOURS':
        return IntervalUnitValues.hours;
    }
    throw Exception('$this is not known in enum IntervalUnitValues');
  }
}

/// Detailed information about a lifecycle policy.
class LifecyclePolicy {
  /// The local date and time when the lifecycle policy was created.
  final DateTime? dateCreated;

  /// The local date and time when the lifecycle policy was last modified.
  final DateTime? dateModified;

  /// The description of the lifecycle policy.
  final String? description;

  /// The Amazon Resource Name (ARN) of the IAM role used to run the operations
  /// specified by the lifecycle policy.
  final String? executionRoleArn;

  /// The Amazon Resource Name (ARN) of the policy.
  final String? policyArn;

  /// The configuration of the lifecycle policy
  final PolicyDetails? policyDetails;

  /// The identifier of the lifecycle policy.
  final String? policyId;

  /// The activation state of the lifecycle policy.
  final GettablePolicyStateValues? state;

  /// The description of the status.
  final String? statusMessage;

  /// The tags.
  final Map<String, String>? tags;

  LifecyclePolicy({
    this.dateCreated,
    this.dateModified,
    this.description,
    this.executionRoleArn,
    this.policyArn,
    this.policyDetails,
    this.policyId,
    this.state,
    this.statusMessage,
    this.tags,
  });

  factory LifecyclePolicy.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicy(
      dateCreated: timeStampFromJson(json['DateCreated']),
      dateModified: timeStampFromJson(json['DateModified']),
      description: json['Description'] as String?,
      executionRoleArn: json['ExecutionRoleArn'] as String?,
      policyArn: json['PolicyArn'] as String?,
      policyDetails: json['PolicyDetails'] != null
          ? PolicyDetails.fromJson(
              json['PolicyDetails'] as Map<String, dynamic>)
          : null,
      policyId: json['PolicyId'] as String?,
      state: (json['State'] as String?)?.toGettablePolicyStateValues(),
      statusMessage: json['StatusMessage'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final dateCreated = this.dateCreated;
    final dateModified = this.dateModified;
    final description = this.description;
    final executionRoleArn = this.executionRoleArn;
    final policyArn = this.policyArn;
    final policyDetails = this.policyDetails;
    final policyId = this.policyId;
    final state = this.state;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      if (dateCreated != null) 'DateCreated': iso8601ToJson(dateCreated),
      if (dateModified != null) 'DateModified': iso8601ToJson(dateModified),
      if (description != null) 'Description': description,
      if (executionRoleArn != null) 'ExecutionRoleArn': executionRoleArn,
      if (policyArn != null) 'PolicyArn': policyArn,
      if (policyDetails != null) 'PolicyDetails': policyDetails,
      if (policyId != null) 'PolicyId': policyId,
      if (state != null) 'State': state.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Summary information about a lifecycle policy.
class LifecyclePolicySummary {
  /// The description of the lifecycle policy.
  final String? description;

  /// The identifier of the lifecycle policy.
  final String? policyId;

  /// The type of policy. <code>EBS_SNAPSHOT_MANAGEMENT</code> indicates that the
  /// policy manages the lifecycle of Amazon EBS snapshots.
  /// <code>IMAGE_MANAGEMENT</code> indicates that the policy manages the
  /// lifecycle of EBS-backed AMIs.
  final PolicyTypeValues? policyType;

  /// The activation state of the lifecycle policy.
  final GettablePolicyStateValues? state;

  /// The tags.
  final Map<String, String>? tags;

  LifecyclePolicySummary({
    this.description,
    this.policyId,
    this.policyType,
    this.state,
    this.tags,
  });

  factory LifecyclePolicySummary.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicySummary(
      description: json['Description'] as String?,
      policyId: json['PolicyId'] as String?,
      policyType: (json['PolicyType'] as String?)?.toPolicyTypeValues(),
      state: (json['State'] as String?)?.toGettablePolicyStateValues(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final policyId = this.policyId;
    final policyType = this.policyType;
    final state = this.state;
    final tags = this.tags;
    return {
      if (description != null) 'Description': description,
      if (policyId != null) 'PolicyId': policyId,
      if (policyType != null) 'PolicyType': policyType.toValue(),
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTagsForResourceResponse {
  /// Information about the tags.
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

enum LocationValues {
  cloud,
  outpostLocal,
}

extension on LocationValues {
  String toValue() {
    switch (this) {
      case LocationValues.cloud:
        return 'CLOUD';
      case LocationValues.outpostLocal:
        return 'OUTPOST_LOCAL';
    }
  }
}

extension on String {
  LocationValues toLocationValues() {
    switch (this) {
      case 'CLOUD':
        return LocationValues.cloud;
      case 'OUTPOST_LOCAL':
        return LocationValues.outpostLocal;
    }
    throw Exception('$this is not known in enum LocationValues');
  }
}

/// Specifies optional parameters to add to a policy. The set of valid
/// parameters depends on the combination of policy type and resource type.
class Parameters {
  /// [EBS Snapshot Management – Instance policies only] Indicates whether to
  /// exclude the root volume from snapshots created using <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateSnapshots.html">CreateSnapshots</a>.
  /// The default is false.
  final bool? excludeBootVolume;

  /// Applies to AMI lifecycle policies only. Indicates whether targeted instances
  /// are rebooted when the lifecycle policy runs. <code>true</code> indicates
  /// that targeted instances are not rebooted when the policy runs.
  /// <code>false</code> indicates that target instances are rebooted when the
  /// policy runs. The default is <code>true</code> (instances are not rebooted).
  final bool? noReboot;

  Parameters({
    this.excludeBootVolume,
    this.noReboot,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      excludeBootVolume: json['ExcludeBootVolume'] as bool?,
      noReboot: json['NoReboot'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final excludeBootVolume = this.excludeBootVolume;
    final noReboot = this.noReboot;
    return {
      if (excludeBootVolume != null) 'ExcludeBootVolume': excludeBootVolume,
      if (noReboot != null) 'NoReboot': noReboot,
    };
  }
}

/// Specifies the configuration of a lifecycle policy.
class PolicyDetails {
  /// The actions to be performed when the event-based policy is triggered. You
  /// can specify only one action per policy.
  ///
  /// This parameter is required for event-based policies only. If you are
  /// creating a snapshot or AMI policy, omit this parameter.
  final List<Action>? actions;

  /// The event that triggers the event-based policy.
  ///
  /// This parameter is required for event-based policies only. If you are
  /// creating a snapshot or AMI policy, omit this parameter.
  final EventSource? eventSource;

  /// A set of optional parameters for snapshot and AMI lifecycle policies.
  ///
  /// This parameter is required for snapshot and AMI policies only. If you are
  /// creating an event-based policy, omit this parameter.
  final Parameters? parameters;

  /// The valid target resource types and actions a policy can manage. Specify
  /// <code>EBS_SNAPSHOT_MANAGEMENT</code> to create a lifecycle policy that
  /// manages the lifecycle of Amazon EBS snapshots. Specify
  /// <code>IMAGE_MANAGEMENT</code> to create a lifecycle policy that manages the
  /// lifecycle of EBS-backed AMIs. Specify <code>EVENT_BASED_POLICY </code> to
  /// create an event-based policy that performs specific actions when a defined
  /// event occurs in your AWS account.
  ///
  /// The default is <code>EBS_SNAPSHOT_MANAGEMENT</code>.
  final PolicyTypeValues? policyType;

  /// The location of the resources to backup. If the source resources are located
  /// in an AWS Region, specify <code>CLOUD</code>. If the source resources are
  /// located on an AWS Outpost in your account, specify <code>OUTPOST</code>.
  ///
  /// If you specify <code>OUTPOST</code>, Amazon Data Lifecycle Manager backs up
  /// all resources of the specified type with matching target tags across all of
  /// the Outposts in your account.
  final List<ResourceLocationValues>? resourceLocations;

  /// The target resource type for snapshot and AMI lifecycle policies. Use
  /// <code>VOLUME </code>to create snapshots of individual volumes or use
  /// <code>INSTANCE</code> to create multi-volume snapshots from the volumes for
  /// an instance.
  ///
  /// This parameter is required for snapshot and AMI policies only. If you are
  /// creating an event-based policy, omit this parameter.
  final List<ResourceTypeValues>? resourceTypes;

  /// The schedules of policy-defined actions for snapshot and AMI lifecycle
  /// policies. A policy can have up to four schedules—one mandatory schedule and
  /// up to three optional schedules.
  ///
  /// This parameter is required for snapshot and AMI policies only. If you are
  /// creating an event-based policy, omit this parameter.
  final List<Schedule>? schedules;

  /// The single tag that identifies targeted resources for this policy.
  ///
  /// This parameter is required for snapshot and AMI policies only. If you are
  /// creating an event-based policy, omit this parameter.
  final List<Tag>? targetTags;

  PolicyDetails({
    this.actions,
    this.eventSource,
    this.parameters,
    this.policyType,
    this.resourceLocations,
    this.resourceTypes,
    this.schedules,
    this.targetTags,
  });

  factory PolicyDetails.fromJson(Map<String, dynamic> json) {
    return PolicyDetails(
      actions: (json['Actions'] as List?)
          ?.whereNotNull()
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      eventSource: json['EventSource'] != null
          ? EventSource.fromJson(json['EventSource'] as Map<String, dynamic>)
          : null,
      parameters: json['Parameters'] != null
          ? Parameters.fromJson(json['Parameters'] as Map<String, dynamic>)
          : null,
      policyType: (json['PolicyType'] as String?)?.toPolicyTypeValues(),
      resourceLocations: (json['ResourceLocations'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toResourceLocationValues())
          .toList(),
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toResourceTypeValues())
          .toList(),
      schedules: (json['Schedules'] as List?)
          ?.whereNotNull()
          .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      targetTags: (json['TargetTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final eventSource = this.eventSource;
    final parameters = this.parameters;
    final policyType = this.policyType;
    final resourceLocations = this.resourceLocations;
    final resourceTypes = this.resourceTypes;
    final schedules = this.schedules;
    final targetTags = this.targetTags;
    return {
      if (actions != null) 'Actions': actions,
      if (eventSource != null) 'EventSource': eventSource,
      if (parameters != null) 'Parameters': parameters,
      if (policyType != null) 'PolicyType': policyType.toValue(),
      if (resourceLocations != null)
        'ResourceLocations': resourceLocations.map((e) => e.toValue()).toList(),
      if (resourceTypes != null)
        'ResourceTypes': resourceTypes.map((e) => e.toValue()).toList(),
      if (schedules != null) 'Schedules': schedules,
      if (targetTags != null) 'TargetTags': targetTags,
    };
  }
}

enum PolicyTypeValues {
  ebsSnapshotManagement,
  imageManagement,
  eventBasedPolicy,
}

extension on PolicyTypeValues {
  String toValue() {
    switch (this) {
      case PolicyTypeValues.ebsSnapshotManagement:
        return 'EBS_SNAPSHOT_MANAGEMENT';
      case PolicyTypeValues.imageManagement:
        return 'IMAGE_MANAGEMENT';
      case PolicyTypeValues.eventBasedPolicy:
        return 'EVENT_BASED_POLICY';
    }
  }
}

extension on String {
  PolicyTypeValues toPolicyTypeValues() {
    switch (this) {
      case 'EBS_SNAPSHOT_MANAGEMENT':
        return PolicyTypeValues.ebsSnapshotManagement;
      case 'IMAGE_MANAGEMENT':
        return PolicyTypeValues.imageManagement;
      case 'EVENT_BASED_POLICY':
        return PolicyTypeValues.eventBasedPolicy;
    }
    throw Exception('$this is not known in enum PolicyTypeValues');
  }
}

enum ResourceLocationValues {
  cloud,
  outpost,
}

extension on ResourceLocationValues {
  String toValue() {
    switch (this) {
      case ResourceLocationValues.cloud:
        return 'CLOUD';
      case ResourceLocationValues.outpost:
        return 'OUTPOST';
    }
  }
}

extension on String {
  ResourceLocationValues toResourceLocationValues() {
    switch (this) {
      case 'CLOUD':
        return ResourceLocationValues.cloud;
      case 'OUTPOST':
        return ResourceLocationValues.outpost;
    }
    throw Exception('$this is not known in enum ResourceLocationValues');
  }
}

enum ResourceTypeValues {
  volume,
  instance,
}

extension on ResourceTypeValues {
  String toValue() {
    switch (this) {
      case ResourceTypeValues.volume:
        return 'VOLUME';
      case ResourceTypeValues.instance:
        return 'INSTANCE';
    }
  }
}

extension on String {
  ResourceTypeValues toResourceTypeValues() {
    switch (this) {
      case 'VOLUME':
        return ResourceTypeValues.volume;
      case 'INSTANCE':
        return ResourceTypeValues.instance;
    }
    throw Exception('$this is not known in enum ResourceTypeValues');
  }
}

/// Specifies the retention rule for a lifecycle policy. You can retain
/// snapshots based on either a count or a time interval.
class RetainRule {
  /// The number of snapshots to retain for each volume, up to a maximum of 1000.
  final int? count;

  /// The amount of time to retain each snapshot. The maximum is 100 years. This
  /// is equivalent to 1200 months, 5200 weeks, or 36500 days.
  final int? interval;

  /// The unit of time for time-based retention.
  final RetentionIntervalUnitValues? intervalUnit;

  RetainRule({
    this.count,
    this.interval,
    this.intervalUnit,
  });

  factory RetainRule.fromJson(Map<String, dynamic> json) {
    return RetainRule(
      count: json['Count'] as int?,
      interval: json['Interval'] as int?,
      intervalUnit:
          (json['IntervalUnit'] as String?)?.toRetentionIntervalUnitValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final interval = this.interval;
    final intervalUnit = this.intervalUnit;
    return {
      if (count != null) 'Count': count,
      if (interval != null) 'Interval': interval,
      if (intervalUnit != null) 'IntervalUnit': intervalUnit.toValue(),
    };
  }
}

enum RetentionIntervalUnitValues {
  days,
  weeks,
  months,
  years,
}

extension on RetentionIntervalUnitValues {
  String toValue() {
    switch (this) {
      case RetentionIntervalUnitValues.days:
        return 'DAYS';
      case RetentionIntervalUnitValues.weeks:
        return 'WEEKS';
      case RetentionIntervalUnitValues.months:
        return 'MONTHS';
      case RetentionIntervalUnitValues.years:
        return 'YEARS';
    }
  }
}

extension on String {
  RetentionIntervalUnitValues toRetentionIntervalUnitValues() {
    switch (this) {
      case 'DAYS':
        return RetentionIntervalUnitValues.days;
      case 'WEEKS':
        return RetentionIntervalUnitValues.weeks;
      case 'MONTHS':
        return RetentionIntervalUnitValues.months;
      case 'YEARS':
        return RetentionIntervalUnitValues.years;
    }
    throw Exception('$this is not known in enum RetentionIntervalUnitValues');
  }
}

/// Specifies a backup schedule for a snapshot or AMI lifecycle policy.
class Schedule {
  /// Copy all user-defined tags on a source volume to snapshots of the volume
  /// created by this policy.
  final bool? copyTags;

  /// The creation rule.
  final CreateRule? createRule;

  /// The rule for cross-Region snapshot copies.
  ///
  /// You can only specify cross-Region copy rules for policies that create
  /// snapshots in a Region. If the policy creates snapshots on an Outpost, then
  /// you cannot copy the snapshots to a Region or to an Outpost. If the policy
  /// creates snapshots in a Region, then snapshots can be copied to up to three
  /// Regions or Outposts.
  final List<CrossRegionCopyRule>? crossRegionCopyRules;

  /// The rule for enabling fast snapshot restore.
  final FastRestoreRule? fastRestoreRule;

  /// The name of the schedule.
  final String? name;

  /// The retention rule.
  final RetainRule? retainRule;

  /// The rule for sharing snapshots with other AWS accounts.
  final List<ShareRule>? shareRules;

  /// The tags to apply to policy-created resources. These user-defined tags are
  /// in addition to the AWS-added lifecycle tags.
  final List<Tag>? tagsToAdd;

  /// A collection of key/value pairs with values determined dynamically when the
  /// policy is executed. Keys may be any valid Amazon EC2 tag key. Values must be
  /// in one of the two following formats: <code>$(instance-id)</code> or
  /// <code>$(timestamp)</code>. Variable tags are only valid for EBS Snapshot
  /// Management – Instance policies.
  final List<Tag>? variableTags;

  Schedule({
    this.copyTags,
    this.createRule,
    this.crossRegionCopyRules,
    this.fastRestoreRule,
    this.name,
    this.retainRule,
    this.shareRules,
    this.tagsToAdd,
    this.variableTags,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      copyTags: json['CopyTags'] as bool?,
      createRule: json['CreateRule'] != null
          ? CreateRule.fromJson(json['CreateRule'] as Map<String, dynamic>)
          : null,
      crossRegionCopyRules: (json['CrossRegionCopyRules'] as List?)
          ?.whereNotNull()
          .map((e) => CrossRegionCopyRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      fastRestoreRule: json['FastRestoreRule'] != null
          ? FastRestoreRule.fromJson(
              json['FastRestoreRule'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      retainRule: json['RetainRule'] != null
          ? RetainRule.fromJson(json['RetainRule'] as Map<String, dynamic>)
          : null,
      shareRules: (json['ShareRules'] as List?)
          ?.whereNotNull()
          .map((e) => ShareRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      tagsToAdd: (json['TagsToAdd'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      variableTags: (json['VariableTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final copyTags = this.copyTags;
    final createRule = this.createRule;
    final crossRegionCopyRules = this.crossRegionCopyRules;
    final fastRestoreRule = this.fastRestoreRule;
    final name = this.name;
    final retainRule = this.retainRule;
    final shareRules = this.shareRules;
    final tagsToAdd = this.tagsToAdd;
    final variableTags = this.variableTags;
    return {
      if (copyTags != null) 'CopyTags': copyTags,
      if (createRule != null) 'CreateRule': createRule,
      if (crossRegionCopyRules != null)
        'CrossRegionCopyRules': crossRegionCopyRules,
      if (fastRestoreRule != null) 'FastRestoreRule': fastRestoreRule,
      if (name != null) 'Name': name,
      if (retainRule != null) 'RetainRule': retainRule,
      if (shareRules != null) 'ShareRules': shareRules,
      if (tagsToAdd != null) 'TagsToAdd': tagsToAdd,
      if (variableTags != null) 'VariableTags': variableTags,
    };
  }
}

enum SettablePolicyStateValues {
  enabled,
  disabled,
}

extension on SettablePolicyStateValues {
  String toValue() {
    switch (this) {
      case SettablePolicyStateValues.enabled:
        return 'ENABLED';
      case SettablePolicyStateValues.disabled:
        return 'DISABLED';
    }
  }
}

extension on String {
  SettablePolicyStateValues toSettablePolicyStateValues() {
    switch (this) {
      case 'ENABLED':
        return SettablePolicyStateValues.enabled;
      case 'DISABLED':
        return SettablePolicyStateValues.disabled;
    }
    throw Exception('$this is not known in enum SettablePolicyStateValues');
  }
}

/// Specifies a rule for sharing snapshots across AWS accounts.
class ShareRule {
  /// The IDs of the AWS accounts with which to share the snapshots.
  final List<String> targetAccounts;

  /// The period after which snapshots that are shared with other AWS accounts are
  /// automatically unshared.
  final int? unshareInterval;

  /// The unit of time for the automatic unsharing interval.
  final RetentionIntervalUnitValues? unshareIntervalUnit;

  ShareRule({
    required this.targetAccounts,
    this.unshareInterval,
    this.unshareIntervalUnit,
  });

  factory ShareRule.fromJson(Map<String, dynamic> json) {
    return ShareRule(
      targetAccounts: (json['TargetAccounts'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      unshareInterval: json['UnshareInterval'] as int?,
      unshareIntervalUnit: (json['UnshareIntervalUnit'] as String?)
          ?.toRetentionIntervalUnitValues(),
    );
  }

  Map<String, dynamic> toJson() {
    final targetAccounts = this.targetAccounts;
    final unshareInterval = this.unshareInterval;
    final unshareIntervalUnit = this.unshareIntervalUnit;
    return {
      'TargetAccounts': targetAccounts,
      if (unshareInterval != null) 'UnshareInterval': unshareInterval,
      if (unshareIntervalUnit != null)
        'UnshareIntervalUnit': unshareIntervalUnit.toValue(),
    };
  }
}

/// Specifies a tag for a resource.
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateLifecyclePolicyResponse {
  UpdateLifecyclePolicyResponse();

  factory UpdateLifecyclePolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLifecyclePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
