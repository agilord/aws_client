// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// With Amazon Data Lifecycle Manager, you can manage the lifecycle of your
/// Amazon Web Services resources. You create lifecycle policies, which are used
/// to automate operations on the specified resources.
class DLM {
  final _s.RestJsonProtocol _protocol;
  DLM({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Creates a policy to manage the lifecycle of the specified Amazon Web
  /// Services resources. You can create up to 100 lifecycle policies.
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
  /// For more information about deleting a policy, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/view-modify-delete.html#delete">Delete
  /// lifecycle policies</a>.
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
  /// These user-defined tags are added in addition to the Amazon Web
  /// Services-added lifecycle tags.
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
  /// For more information about updating a policy, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/view-modify-delete.html#modify">Modify
  /// lifecycle policies</a>.
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

/// <b>[Event-based policies only]</b> Specifies an action for an event-based
/// policy.
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

/// <b>[Snapshot policies only]</b> Specifies information about the archive
/// storage tier retention period.
class ArchiveRetainRule {
  /// Information about retention period in the Amazon EBS Snapshots Archive. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/snapshot-archive.html">Archive
  /// Amazon EBS snapshots</a>.
  final RetentionArchiveTier retentionArchiveTier;

  ArchiveRetainRule({
    required this.retentionArchiveTier,
  });

  factory ArchiveRetainRule.fromJson(Map<String, dynamic> json) {
    return ArchiveRetainRule(
      retentionArchiveTier: RetentionArchiveTier.fromJson(
          json['RetentionArchiveTier'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final retentionArchiveTier = this.retentionArchiveTier;
    return {
      'RetentionArchiveTier': retentionArchiveTier,
    };
  }
}

/// <b>[Snapshot policies only]</b> Specifies a snapshot archiving rule for a
/// schedule.
class ArchiveRule {
  /// Information about the retention period for the snapshot archiving rule.
  final ArchiveRetainRule retainRule;

  ArchiveRule({
    required this.retainRule,
  });

  factory ArchiveRule.fromJson(Map<String, dynamic> json) {
    return ArchiveRule(
      retainRule: ArchiveRetainRule.fromJson(
          json['RetainRule'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final retainRule = this.retainRule;
    return {
      'RetainRule': retainRule,
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
}

/// <b>[Snapshot and AMI policies only]</b> Specifies when the policy should
/// create snapshots or AMIs.
/// <note>
/// <ul>
/// <li>
/// You must specify either <b>CronExpression</b>, or <b>Interval</b>,
/// <b>IntervalUnit</b>, and <b>Times</b>.
/// </li>
/// <li>
/// If you need to specify an <a>ArchiveRule</a> for the schedule, then you must
/// specify a creation frequency of at least 28 days.
/// </li>
/// </ul> </note>
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

  /// <b>[Snapshot policies only]</b> Specifies the destination for snapshots
  /// created by the policy. To create snapshots in the same Region as the source
  /// resource, specify <code>CLOUD</code>. To create snapshots on the same
  /// Outpost as the source resource, specify <code>OUTPOST_LOCAL</code>. If you
  /// omit this parameter, <code>CLOUD</code> is used by default.
  ///
  /// If the policy targets resources in an Amazon Web Services Region, then you
  /// must create snapshots in the same Region as the source resource. If the
  /// policy targets resources on an Outpost, then you can create snapshots on the
  /// same Outpost as the source resource, or in the Region of that Outpost.
  final LocationValues? location;

  /// The time, in UTC, to start the operation. The supported format is hh:mm.
  ///
  /// The operation occurs within a one-hour window following the specified time.
  /// If you do not specify a time, Amazon Data Lifecycle Manager selects a time
  /// within the next 24 hours.
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

/// <b>[Event-based policies only]</b> Specifies a cross-Region copy action for
/// event-based policies.
/// <note>
/// To specify a cross-Region copy rule for snapshot and AMI policies, use
/// <a>CrossRegionCopyRule</a>.
/// </note>
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

/// <b>[AMI policies only]</b> Specifies an AMI deprecation rule for
/// cross-Region AMI copies created by an AMI policy.
class CrossRegionCopyDeprecateRule {
  /// The period after which to deprecate the cross-Region AMI copies. The period
  /// must be less than or equal to the cross-Region AMI copy retention period,
  /// and it can't be greater than 10 years. This is equivalent to 120 months, 520
  /// weeks, or 3650 days.
  final int? interval;

  /// The unit of time in which to measure the <b>Interval</b>. For example, to
  /// deprecate a cross-Region AMI copy after 3 months, specify
  /// <code>Interval=3</code> and <code>IntervalUnit=MONTHS</code>.
  final RetentionIntervalUnitValues? intervalUnit;

  CrossRegionCopyDeprecateRule({
    this.interval,
    this.intervalUnit,
  });

  factory CrossRegionCopyDeprecateRule.fromJson(Map<String, dynamic> json) {
    return CrossRegionCopyDeprecateRule(
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

/// Specifies a retention rule for cross-Region snapshot copies created by
/// snapshot or event-based policies, or cross-Region AMI copies created by AMI
/// policies. After the retention period expires, the cross-Region copy is
/// deleted.
class CrossRegionCopyRetainRule {
  /// The amount of time to retain a cross-Region snapshot or AMI copy. The
  /// maximum is 100 years. This is equivalent to 1200 months, 5200 weeks, or
  /// 36500 days.
  final int? interval;

  /// The unit of time for time-based retention. For example, to retain a
  /// cross-Region copy for 3 months, specify <code>Interval=3</code> and
  /// <code>IntervalUnit=MONTHS</code>.
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

/// <b>[Snapshot and AMI policies only]</b> Specifies a cross-Region copy rule
/// for snapshot and AMI policies.
/// <note>
/// To specify a cross-Region copy action for event-based polices, use
/// <a>CrossRegionCopyAction</a>.
/// </note>
class CrossRegionCopyRule {
  /// To encrypt a copy of an unencrypted snapshot if encryption by default is not
  /// enabled, enable encryption using this parameter. Copies of encrypted
  /// snapshots are encrypted, even if this parameter is false or if encryption by
  /// default is not enabled.
  final bool encrypted;

  /// The Amazon Resource Name (ARN) of the KMS key to use for EBS encryption. If
  /// this parameter is not specified, the default KMS key for the account is
  /// used.
  final String? cmkArn;

  /// Indicates whether to copy all user-defined tags from the source snapshot or
  /// AMI to the cross-Region copy.
  final bool? copyTags;

  /// <b>[AMI policies only]</b> The AMI deprecation rule for cross-Region AMI
  /// copies created by the rule.
  final CrossRegionCopyDeprecateRule? deprecateRule;

  /// The retention rule that indicates how long the cross-Region snapshot or AMI
  /// copies are to be retained in the destination Region.
  final CrossRegionCopyRetainRule? retainRule;

  /// The target Region or the Amazon Resource Name (ARN) of the target Outpost
  /// for the snapshot copies.
  ///
  /// Use this parameter instead of <b>TargetRegion</b>. Do not specify both.
  final String? target;

  /// <note>
  /// Avoid using this parameter when creating new policies. Instead, use
  /// <b>Target</b> to specify a target Region or a target Outpost for snapshot
  /// copies.
  ///
  /// For policies created before the <b>Target</b> parameter was introduced, this
  /// parameter indicates the target Region for snapshot copies.
  /// </note>
  final String? targetRegion;

  CrossRegionCopyRule({
    required this.encrypted,
    this.cmkArn,
    this.copyTags,
    this.deprecateRule,
    this.retainRule,
    this.target,
    this.targetRegion,
  });

  factory CrossRegionCopyRule.fromJson(Map<String, dynamic> json) {
    return CrossRegionCopyRule(
      encrypted: json['Encrypted'] as bool,
      cmkArn: json['CmkArn'] as String?,
      copyTags: json['CopyTags'] as bool?,
      deprecateRule: json['DeprecateRule'] != null
          ? CrossRegionCopyDeprecateRule.fromJson(
              json['DeprecateRule'] as Map<String, dynamic>)
          : null,
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
    final deprecateRule = this.deprecateRule;
    final retainRule = this.retainRule;
    final target = this.target;
    final targetRegion = this.targetRegion;
    return {
      'Encrypted': encrypted,
      if (cmkArn != null) 'CmkArn': cmkArn,
      if (copyTags != null) 'CopyTags': copyTags,
      if (deprecateRule != null) 'DeprecateRule': deprecateRule,
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
}

/// <b>[AMI policies only]</b> Specifies an AMI deprecation rule for AMIs
/// created by an AMI lifecycle policy.
///
/// For age-based schedules, you must specify <b>Interval</b> and
/// <b>IntervalUnit</b>. For count-based schedules, you must specify
/// <b>Count</b>.
class DeprecateRule {
  /// If the schedule has a count-based retention rule, this parameter specifies
  /// the number of oldest AMIs to deprecate. The count must be less than or equal
  /// to the schedule's retention count, and it can't be greater than 1000.
  final int? count;

  /// If the schedule has an age-based retention rule, this parameter specifies
  /// the period after which to deprecate AMIs created by the schedule. The period
  /// must be less than or equal to the schedule's retention period, and it can't
  /// be greater than 10 years. This is equivalent to 120 months, 520 weeks, or
  /// 3650 days.
  final int? interval;

  /// The unit of time in which to measure the <b>Interval</b>.
  final RetentionIntervalUnitValues? intervalUnit;

  DeprecateRule({
    this.count,
    this.interval,
    this.intervalUnit,
  });

  factory DeprecateRule.fromJson(Map<String, dynamic> json) {
    return DeprecateRule(
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

/// <b>[Event-based policies only]</b> Specifies the encryption settings for
/// cross-Region snapshot copies created by event-based policies.
class EncryptionConfiguration {
  /// To encrypt a copy of an unencrypted snapshot when encryption by default is
  /// not enabled, enable encryption using this parameter. Copies of encrypted
  /// snapshots are encrypted, even if this parameter is false or when encryption
  /// by default is not enabled.
  final bool encrypted;

  /// The Amazon Resource Name (ARN) of the KMS key to use for EBS encryption. If
  /// this parameter is not specified, the default KMS key for the account is
  /// used.
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

/// <b>[Event-based policies only]</b> Specifies an event that activates an
/// event-based policy.
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

  /// The IDs of the Amazon Web Services accounts that can trigger policy by
  /// sharing snapshots with your account. The policy only runs if one of the
  /// specified Amazon Web Services accounts shares a snapshot with your account.
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

/// <b>[Event-based policies only]</b> Specifies an event that activates an
/// event-based policy.
class EventSource {
  /// The source of the event. Currently only managed CloudWatch Events rules are
  /// supported.
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

extension EventSourceValuesValueExtension on EventSourceValues {
  String toValue() {
    switch (this) {
      case EventSourceValues.managedCwe:
        return 'MANAGED_CWE';
    }
  }
}

extension EventSourceValuesFromString on String {
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

extension EventTypeValuesValueExtension on EventTypeValues {
  String toValue() {
    switch (this) {
      case EventTypeValues.shareSnapshot:
        return 'shareSnapshot';
    }
  }
}

extension EventTypeValuesFromString on String {
  EventTypeValues toEventTypeValues() {
    switch (this) {
      case 'shareSnapshot':
        return EventTypeValues.shareSnapshot;
    }
    throw Exception('$this is not known in enum EventTypeValues');
  }
}

/// <b>[Snapshot policies only]</b> Specifies a rule for enabling fast snapshot
/// restore for snapshots created by snapshot policies. You can enable fast
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
}

enum GettablePolicyStateValues {
  enabled,
  disabled,
  error,
}

extension GettablePolicyStateValuesValueExtension on GettablePolicyStateValues {
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

extension GettablePolicyStateValuesFromString on String {
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

extension IntervalUnitValuesValueExtension on IntervalUnitValues {
  String toValue() {
    switch (this) {
      case IntervalUnitValues.hours:
        return 'HOURS';
    }
  }
}

extension IntervalUnitValuesFromString on String {
  IntervalUnitValues toIntervalUnitValues() {
    switch (this) {
      case 'HOURS':
        return IntervalUnitValues.hours;
    }
    throw Exception('$this is not known in enum IntervalUnitValues');
  }
}

/// <b>[All policy types]</b> Detailed information about a snapshot, AMI, or
/// event-based lifecycle policy.
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
  /// lifecycle of EBS-backed AMIs. <code>EVENT_BASED_POLICY</code> indicates that
  /// the policy automates cross-account snapshot copies for snapshots that are
  /// shared with your account.
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
}

enum LocationValues {
  cloud,
  outpostLocal,
}

extension LocationValuesValueExtension on LocationValues {
  String toValue() {
    switch (this) {
      case LocationValues.cloud:
        return 'CLOUD';
      case LocationValues.outpostLocal:
        return 'OUTPOST_LOCAL';
    }
  }
}

extension LocationValuesFromString on String {
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

/// <b>[Snapshot and AMI policies only]</b> Specifies optional parameters for
/// snapshot and AMI policies. The set of valid parameters depends on the
/// combination of policy type and target resource type.
///
/// If you choose to exclude boot volumes and you specify tags that consequently
/// exclude all of the additional data volumes attached to an instance, then
/// Amazon Data Lifecycle Manager will not create any snapshots for the affected
/// instance, and it will emit a <code>SnapshotsCreateFailed</code> Amazon
/// CloudWatch metric. For more information, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitor-dlm-cw-metrics.html">Monitor
/// your policies using Amazon CloudWatch</a>.
class Parameters {
  /// <b>[Snapshot policies that target instances only]</b> Indicates whether to
  /// exclude the root volume from multi-volume snapshot sets. The default is
  /// <code>false</code>. If you specify <code>true</code>, then the root volumes
  /// attached to targeted instances will be excluded from the multi-volume
  /// snapshot sets created by the policy.
  final bool? excludeBootVolume;

  /// <b>[Snapshot policies that target instances only]</b> The tags used to
  /// identify data (non-root) volumes to exclude from multi-volume snapshot sets.
  ///
  /// If you create a snapshot lifecycle policy that targets instances and you
  /// specify tags for this parameter, then data volumes with the specified tags
  /// that are attached to targeted instances will be excluded from the
  /// multi-volume snapshot sets created by the policy.
  final List<Tag>? excludeDataVolumeTags;

  /// <b>[AMI policies only]</b> Indicates whether targeted instances are rebooted
  /// when the lifecycle policy runs. <code>true</code> indicates that targeted
  /// instances are not rebooted when the policy runs. <code>false</code>
  /// indicates that target instances are rebooted when the policy runs. The
  /// default is <code>true</code> (instances are not rebooted).
  final bool? noReboot;

  Parameters({
    this.excludeBootVolume,
    this.excludeDataVolumeTags,
    this.noReboot,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      excludeBootVolume: json['ExcludeBootVolume'] as bool?,
      excludeDataVolumeTags: (json['ExcludeDataVolumeTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      noReboot: json['NoReboot'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final excludeBootVolume = this.excludeBootVolume;
    final excludeDataVolumeTags = this.excludeDataVolumeTags;
    final noReboot = this.noReboot;
    return {
      if (excludeBootVolume != null) 'ExcludeBootVolume': excludeBootVolume,
      if (excludeDataVolumeTags != null)
        'ExcludeDataVolumeTags': excludeDataVolumeTags,
      if (noReboot != null) 'NoReboot': noReboot,
    };
  }
}

/// <b>[All policy types]</b> Specifies the configuration of a lifecycle policy.
class PolicyDetails {
  /// <b>[Event-based policies only]</b> The actions to be performed when the
  /// event-based policy is activated. You can specify only one action per policy.
  final List<Action>? actions;

  /// <b>[Event-based policies only]</b> The event that activates the event-based
  /// policy.
  final EventSource? eventSource;

  /// <b>[Snapshot and AMI policies only]</b> A set of optional parameters for
  /// snapshot and AMI lifecycle policies.
  /// <note>
  /// If you are modifying a policy that was created or previously modified using
  /// the Amazon Data Lifecycle Manager console, then you must include this
  /// parameter and specify either the default values or the new values that you
  /// require. You can't omit this parameter or set its values to null.
  /// </note>
  final Parameters? parameters;

  /// <b>[All policy types]</b> The valid target resource types and actions a
  /// policy can manage. Specify <code>EBS_SNAPSHOT_MANAGEMENT</code> to create a
  /// lifecycle policy that manages the lifecycle of Amazon EBS snapshots. Specify
  /// <code>IMAGE_MANAGEMENT</code> to create a lifecycle policy that manages the
  /// lifecycle of EBS-backed AMIs. Specify <code>EVENT_BASED_POLICY </code> to
  /// create an event-based policy that performs specific actions when a defined
  /// event occurs in your Amazon Web Services account.
  ///
  /// The default is <code>EBS_SNAPSHOT_MANAGEMENT</code>.
  final PolicyTypeValues? policyType;

  /// <b>[Snapshot and AMI policies only]</b> The location of the resources to
  /// backup. If the source resources are located in an Amazon Web Services
  /// Region, specify <code>CLOUD</code>. If the source resources are located on
  /// an Outpost in your account, specify <code>OUTPOST</code>.
  ///
  /// If you specify <code>OUTPOST</code>, Amazon Data Lifecycle Manager backs up
  /// all resources of the specified type with matching target tags across all of
  /// the Outposts in your account.
  final List<ResourceLocationValues>? resourceLocations;

  /// <b>[Snapshot policies only]</b> The target resource type for snapshot and
  /// AMI lifecycle policies. Use <code>VOLUME </code>to create snapshots of
  /// individual volumes or use <code>INSTANCE</code> to create multi-volume
  /// snapshots from the volumes for an instance.
  final List<ResourceTypeValues>? resourceTypes;

  /// <b>[Snapshot and AMI policies only]</b> The schedules of policy-defined
  /// actions for snapshot and AMI lifecycle policies. A policy can have up to
  /// four schedules—one mandatory schedule and up to three optional schedules.
  final List<Schedule>? schedules;

  /// <b>[Snapshot and AMI policies only]</b> The single tag that identifies
  /// targeted resources for this policy.
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

extension PolicyTypeValuesValueExtension on PolicyTypeValues {
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

extension PolicyTypeValuesFromString on String {
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

extension ResourceLocationValuesValueExtension on ResourceLocationValues {
  String toValue() {
    switch (this) {
      case ResourceLocationValues.cloud:
        return 'CLOUD';
      case ResourceLocationValues.outpost:
        return 'OUTPOST';
    }
  }
}

extension ResourceLocationValuesFromString on String {
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

extension ResourceTypeValuesValueExtension on ResourceTypeValues {
  String toValue() {
    switch (this) {
      case ResourceTypeValues.volume:
        return 'VOLUME';
      case ResourceTypeValues.instance:
        return 'INSTANCE';
    }
  }
}

extension ResourceTypeValuesFromString on String {
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

/// <b>[Snapshot and AMI policies only]</b> Specifies a retention rule for
/// snapshots created by snapshot policies, or for AMIs created by AMI policies.
/// <note>
/// For snapshot policies that have an <a>ArchiveRule</a>, this retention rule
/// applies to standard tier retention. When the retention threshold is met,
/// snapshots are moved from the standard to the archive tier.
///
/// For snapshot policies that do not have an <b>ArchiveRule</b>, snapshots are
/// permanently deleted when this retention threshold is met.
/// </note>
/// You can retain snapshots based on either a count or a time interval.
///
/// <ul>
/// <li>
/// <b>Count-based retention</b>
///
/// You must specify <b>Count</b>. If you specify an <a>ArchiveRule</a> for the
/// schedule, then you can specify a retention count of <code>0</code> to
/// archive snapshots immediately after creation. If you specify a
/// <a>FastRestoreRule</a>, <a>ShareRule</a>, or a <a>CrossRegionCopyRule</a>,
/// then you must specify a retention count of <code>1</code> or more.
/// </li>
/// <li>
/// <b>Age-based retention</b>
///
/// You must specify <b>Interval</b> and <b>IntervalUnit</b>. If you specify an
/// <a>ArchiveRule</a> for the schedule, then you can specify a retention
/// interval of <code>0</code> days to archive snapshots immediately after
/// creation. If you specify a <a>FastRestoreRule</a>, <a>ShareRule</a>, or a
/// <a>CrossRegionCopyRule</a>, then you must specify a retention interval of
/// <code>1</code> day or more.
/// </li>
/// </ul>
class RetainRule {
  /// The number of snapshots to retain for each volume, up to a maximum of 1000.
  /// For example if you want to retain a maximum of three snapshots, specify
  /// <code>3</code>. When the fourth snapshot is created, the oldest retained
  /// snapshot is deleted, or it is moved to the archive tier if you have
  /// specified an <a>ArchiveRule</a>.
  final int? count;

  /// The amount of time to retain each snapshot. The maximum is 100 years. This
  /// is equivalent to 1200 months, 5200 weeks, or 36500 days.
  final int? interval;

  /// The unit of time for time-based retention. For example, to retain snapshots
  /// for 3 months, specify <code>Interval=3</code> and
  /// <code>IntervalUnit=MONTHS</code>. Once the snapshot has been retained for 3
  /// months, it is deleted, or it is moved to the archive tier if you have
  /// specified an <a>ArchiveRule</a>.
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

/// <b>[Snapshot policies only]</b> Describes the retention rule for archived
/// snapshots. Once the archive retention threshold is met, the snapshots are
/// permanently deleted from the archive tier.
/// <note>
/// The archive retention rule must retain snapshots in the archive tier for a
/// minimum of 90 days.
/// </note>
/// For <b>count-based schedules</b>, you must specify <b>Count</b>. For
/// <b>age-based schedules</b>, you must specify <b>Interval</b> and <b>
/// IntervalUnit</b>.
///
/// For more information about using snapshot archiving, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-ami-policy.html#dlm-archive">Considerations
/// for snapshot lifecycle policies</a>.
class RetentionArchiveTier {
  /// The maximum number of snapshots to retain in the archive storage tier for
  /// each volume. The count must ensure that each snapshot remains in the archive
  /// tier for at least 90 days. For example, if the schedule creates snapshots
  /// every 30 days, you must specify a count of 3 or more to ensure that each
  /// snapshot is archived for at least 90 days.
  final int? count;

  /// Specifies the period of time to retain snapshots in the archive tier. After
  /// this period expires, the snapshot is permanently deleted.
  final int? interval;

  /// The unit of time in which to measure the <b>Interval</b>. For example, to
  /// retain a snapshots in the archive tier for 6 months, specify
  /// <code>Interval=6</code> and <code>IntervalUnit=MONTHS</code>.
  final RetentionIntervalUnitValues? intervalUnit;

  RetentionArchiveTier({
    this.count,
    this.interval,
    this.intervalUnit,
  });

  factory RetentionArchiveTier.fromJson(Map<String, dynamic> json) {
    return RetentionArchiveTier(
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

extension RetentionIntervalUnitValuesValueExtension
    on RetentionIntervalUnitValues {
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

extension RetentionIntervalUnitValuesFromString on String {
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

/// <b>[Snapshot and AMI policies only]</b> Specifies a schedule for a snapshot
/// or AMI lifecycle policy.
class Schedule {
  /// <b>[Snapshot policies that target volumes only]</b> The snapshot archiving
  /// rule for the schedule. When you specify an archiving rule, snapshots are
  /// automatically moved from the standard tier to the archive tier once the
  /// schedule's retention threshold is met. Snapshots are then retained in the
  /// archive tier for the archive retention period that you specify.
  ///
  /// For more information about using snapshot archiving, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/snapshot-ami-policy.html#dlm-archive">Considerations
  /// for snapshot lifecycle policies</a>.
  final ArchiveRule? archiveRule;

  /// Copy all user-defined tags on a source volume to snapshots of the volume
  /// created by this policy.
  final bool? copyTags;

  /// The creation rule.
  final CreateRule? createRule;

  /// Specifies a rule for copying snapshots or AMIs across regions.
  /// <note>
  /// You can't specify cross-Region copy rules for policies that create snapshots
  /// on an Outpost. If the policy creates snapshots in a Region, then snapshots
  /// can be copied to up to three Regions or Outposts.
  /// </note>
  final List<CrossRegionCopyRule>? crossRegionCopyRules;

  /// <b>[AMI policies only]</b> The AMI deprecation rule for the schedule.
  final DeprecateRule? deprecateRule;

  /// <b>[Snapshot policies only]</b> The rule for enabling fast snapshot restore.
  final FastRestoreRule? fastRestoreRule;

  /// The name of the schedule.
  final String? name;

  /// The retention rule for snapshots or AMIs created by the policy.
  final RetainRule? retainRule;

  /// <b>[Snapshot policies only]</b> The rule for sharing snapshots with other
  /// Amazon Web Services accounts.
  final List<ShareRule>? shareRules;

  /// The tags to apply to policy-created resources. These user-defined tags are
  /// in addition to the Amazon Web Services-added lifecycle tags.
  final List<Tag>? tagsToAdd;

  /// <b>[AMI policies and snapshot policies that target instances only]</b> A
  /// collection of key/value pairs with values determined dynamically when the
  /// policy is executed. Keys may be any valid Amazon EC2 tag key. Values must be
  /// in one of the two following formats: <code>$(instance-id)</code> or
  /// <code>$(timestamp)</code>. Variable tags are only valid for EBS Snapshot
  /// Management – Instance policies.
  final List<Tag>? variableTags;

  Schedule({
    this.archiveRule,
    this.copyTags,
    this.createRule,
    this.crossRegionCopyRules,
    this.deprecateRule,
    this.fastRestoreRule,
    this.name,
    this.retainRule,
    this.shareRules,
    this.tagsToAdd,
    this.variableTags,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      archiveRule: json['ArchiveRule'] != null
          ? ArchiveRule.fromJson(json['ArchiveRule'] as Map<String, dynamic>)
          : null,
      copyTags: json['CopyTags'] as bool?,
      createRule: json['CreateRule'] != null
          ? CreateRule.fromJson(json['CreateRule'] as Map<String, dynamic>)
          : null,
      crossRegionCopyRules: (json['CrossRegionCopyRules'] as List?)
          ?.whereNotNull()
          .map((e) => CrossRegionCopyRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      deprecateRule: json['DeprecateRule'] != null
          ? DeprecateRule.fromJson(
              json['DeprecateRule'] as Map<String, dynamic>)
          : null,
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
    final archiveRule = this.archiveRule;
    final copyTags = this.copyTags;
    final createRule = this.createRule;
    final crossRegionCopyRules = this.crossRegionCopyRules;
    final deprecateRule = this.deprecateRule;
    final fastRestoreRule = this.fastRestoreRule;
    final name = this.name;
    final retainRule = this.retainRule;
    final shareRules = this.shareRules;
    final tagsToAdd = this.tagsToAdd;
    final variableTags = this.variableTags;
    return {
      if (archiveRule != null) 'ArchiveRule': archiveRule,
      if (copyTags != null) 'CopyTags': copyTags,
      if (createRule != null) 'CreateRule': createRule,
      if (crossRegionCopyRules != null)
        'CrossRegionCopyRules': crossRegionCopyRules,
      if (deprecateRule != null) 'DeprecateRule': deprecateRule,
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

extension SettablePolicyStateValuesValueExtension on SettablePolicyStateValues {
  String toValue() {
    switch (this) {
      case SettablePolicyStateValues.enabled:
        return 'ENABLED';
      case SettablePolicyStateValues.disabled:
        return 'DISABLED';
    }
  }
}

extension SettablePolicyStateValuesFromString on String {
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

/// <b>[Snapshot policies only]</b> Specifies a rule for sharing snapshots
/// across Amazon Web Services accounts.
class ShareRule {
  /// The IDs of the Amazon Web Services accounts with which to share the
  /// snapshots.
  final List<String> targetAccounts;

  /// The period after which snapshots that are shared with other Amazon Web
  /// Services accounts are automatically unshared.
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
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }
}

class UpdateLifecyclePolicyResponse {
  UpdateLifecyclePolicyResponse();

  factory UpdateLifecyclePolicyResponse.fromJson(Map<String, dynamic> _) {
    return UpdateLifecyclePolicyResponse();
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
