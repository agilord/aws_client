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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'dlm-2018-01-12.g.dart';

/// With Amazon Data Lifecycle Manager, you can manage the lifecycle of your AWS
/// resources. You create lifecycle policies, which are used to automate
/// operations on the specified resources.
class DLM {
  final _s.RestJsonProtocol _protocol;
  DLM({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String description,
    @_s.required String executionRoleArn,
    @_s.required PolicyDetails policyDetails,
    @_s.required SettablePolicyStateValues state,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      0,
      500,
      isRequired: true,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[0-9A-Za-z _-]+''',
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
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''arn:aws(-[a-z]{1,3}){0,2}:iam::\d+:role/.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyDetails, 'policyDetails');
    ArgumentError.checkNotNull(state, 'state');
    final $payload = <String, dynamic>{
      'Description': description,
      'ExecutionRoleArn': executionRoleArn,
      'PolicyDetails': policyDetails,
      'State': state?.toValue() ?? '',
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
    @_s.required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''policy-[A-Za-z0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/policies/${Uri.encodeComponent(policyId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLifecyclePolicyResponse.fromJson(response);
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
    List<String> policyIds,
    List<ResourceTypeValues> resourceTypes,
    GettablePolicyStateValues state,
    List<String> tagsToAdd,
    List<String> targetTags,
  }) async {
    final $query = <String, List<String>>{
      if (policyIds != null) 'policyIds': policyIds,
      if (resourceTypes != null)
        'resourceTypes': resourceTypes.map((e) => e?.toValue() ?? '').toList(),
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
    @_s.required String policyId,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''policy-[A-Za-z0-9]+''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(-[a-z]{1,3}){0,2}:dlm:[A-Za-z0-9_/.-]{0,63}:\d+:policy/[0-9A-Za-z_-]{1,128}$''',
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(-[a-z]{1,3}){0,2}:dlm:[A-Za-z0-9_/.-]{0,63}:\d+:policy/[0-9A-Za-z_-]{1,128}$''',
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws(-[a-z]{1,3}){0,2}:dlm:[A-Za-z0-9_/.-]{0,63}:\d+:policy/[0-9A-Za-z_-]{1,128}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String policyId,
    String description,
    String executionRoleArn,
    PolicyDetails policyDetails,
    SettablePolicyStateValues state,
  }) async {
    ArgumentError.checkNotNull(policyId, 'policyId');
    _s.validateStringLength(
      'policyId',
      policyId,
      0,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyId',
      policyId,
      r'''policy-[A-Za-z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      500,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[0-9A-Za-z _-]+''',
    );
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      0,
      2048,
    );
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''arn:aws(-[a-z]{1,3}){0,2}:iam::\d+:role/.*''',
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
    return UpdateLifecyclePolicyResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLifecyclePolicyResponse {
  /// The identifier of the lifecycle policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  CreateLifecyclePolicyResponse({
    this.policyId,
  });
  factory CreateLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLifecyclePolicyResponseFromJson(json);
}

/// Specifies when to create snapshots of EBS volumes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CreateRule {
  /// The interval between snapshots. The supported values are 2, 3, 4, 6, 8, 12,
  /// and 24.
  @_s.JsonKey(name: 'Interval')
  final int interval;

  /// The interval unit.
  @_s.JsonKey(name: 'IntervalUnit')
  final IntervalUnitValues intervalUnit;

  /// The time, in UTC, to start the operation. The supported format is hh:mm.
  ///
  /// The operation occurs within a one-hour window following the specified time.
  @_s.JsonKey(name: 'Times')
  final List<String> times;

  CreateRule({
    @_s.required this.interval,
    @_s.required this.intervalUnit,
    this.times,
  });
  factory CreateRule.fromJson(Map<String, dynamic> json) =>
      _$CreateRuleFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRuleToJson(this);
}

/// Specifies the retention rule for cross-Region snapshot copies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CrossRegionCopyRetainRule {
  /// The amount of time to retain each snapshot. The maximum is 100 years. This
  /// is equivalent to 1200 months, 5200 weeks, or 36500 days.
  @_s.JsonKey(name: 'Interval')
  final int interval;

  /// The unit of time for time-based retention.
  @_s.JsonKey(name: 'IntervalUnit')
  final RetentionIntervalUnitValues intervalUnit;

  CrossRegionCopyRetainRule({
    this.interval,
    this.intervalUnit,
  });
  factory CrossRegionCopyRetainRule.fromJson(Map<String, dynamic> json) =>
      _$CrossRegionCopyRetainRuleFromJson(json);

  Map<String, dynamic> toJson() => _$CrossRegionCopyRetainRuleToJson(this);
}

/// Specifies a rule for cross-Region snapshot copies.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CrossRegionCopyRule {
  /// To encrypt a copy of an unencrypted snapshot if encryption by default is not
  /// enabled, enable encryption using this parameter. Copies of encrypted
  /// snapshots are encrypted, even if this parameter is false or if encryption by
  /// default is not enabled.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  /// The target Region.
  @_s.JsonKey(name: 'TargetRegion')
  final String targetRegion;

  /// The Amazon Resource Name (ARN) of the AWS KMS customer master key (CMK) to
  /// use for EBS encryption. If this parameter is not specified, your AWS managed
  /// CMK for EBS is used.
  @_s.JsonKey(name: 'CmkArn')
  final String cmkArn;

  /// Copy all user-defined tags from the source snapshot to the copied snapshot.
  @_s.JsonKey(name: 'CopyTags')
  final bool copyTags;

  /// The retention rule.
  @_s.JsonKey(name: 'RetainRule')
  final CrossRegionCopyRetainRule retainRule;

  CrossRegionCopyRule({
    @_s.required this.encrypted,
    @_s.required this.targetRegion,
    this.cmkArn,
    this.copyTags,
    this.retainRule,
  });
  factory CrossRegionCopyRule.fromJson(Map<String, dynamic> json) =>
      _$CrossRegionCopyRuleFromJson(json);

  Map<String, dynamic> toJson() => _$CrossRegionCopyRuleToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLifecyclePolicyResponse {
  DeleteLifecyclePolicyResponse();
  factory DeleteLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLifecyclePolicyResponseFromJson(json);
}

/// Specifies a rule for enabling fast snapshot restore. You can enable fast
/// snapshot restore based on either a count or a time interval.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FastRestoreRule {
  /// The Availability Zones in which to enable fast snapshot restore.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<String> availabilityZones;

  /// The number of snapshots to be enabled with fast snapshot restore.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The amount of time to enable fast snapshot restore. The maximum is 100
  /// years. This is equivalent to 1200 months, 5200 weeks, or 36500 days.
  @_s.JsonKey(name: 'Interval')
  final int interval;

  /// The unit of time for enabling fast snapshot restore.
  @_s.JsonKey(name: 'IntervalUnit')
  final RetentionIntervalUnitValues intervalUnit;

  FastRestoreRule({
    @_s.required this.availabilityZones,
    this.count,
    this.interval,
    this.intervalUnit,
  });
  factory FastRestoreRule.fromJson(Map<String, dynamic> json) =>
      _$FastRestoreRuleFromJson(json);

  Map<String, dynamic> toJson() => _$FastRestoreRuleToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLifecyclePoliciesResponse {
  /// Summary information about the lifecycle policies.
  @_s.JsonKey(name: 'Policies')
  final List<LifecyclePolicySummary> policies;

  GetLifecyclePoliciesResponse({
    this.policies,
  });
  factory GetLifecyclePoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLifecyclePoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLifecyclePolicyResponse {
  /// Detailed information about the lifecycle policy.
  @_s.JsonKey(name: 'Policy')
  final LifecyclePolicy policy;

  GetLifecyclePolicyResponse({
    this.policy,
  });
  factory GetLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLifecyclePolicyResponseFromJson(json);
}

enum GettablePolicyStateValues {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ERROR')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum IntervalUnitValues {
  @_s.JsonValue('HOURS')
  hours,
}

/// Detailed information about a lifecycle policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LifecyclePolicy {
  /// The local date and time when the lifecycle policy was created.
  @_s.JsonKey(
      name: 'DateCreated', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime dateCreated;

  /// The local date and time when the lifecycle policy was last modified.
  @_s.JsonKey(
      name: 'DateModified', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime dateModified;

  /// The description of the lifecycle policy.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Resource Name (ARN) of the IAM role used to run the operations
  /// specified by the lifecycle policy.
  @_s.JsonKey(name: 'ExecutionRoleArn')
  final String executionRoleArn;

  /// The Amazon Resource Name (ARN) of the policy.
  @_s.JsonKey(name: 'PolicyArn')
  final String policyArn;

  /// The configuration of the lifecycle policy
  @_s.JsonKey(name: 'PolicyDetails')
  final PolicyDetails policyDetails;

  /// The identifier of the lifecycle policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The activation state of the lifecycle policy.
  @_s.JsonKey(name: 'State')
  final GettablePolicyStateValues state;

  /// The description of the status.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// The tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

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
  factory LifecyclePolicy.fromJson(Map<String, dynamic> json) =>
      _$LifecyclePolicyFromJson(json);
}

/// Summary information about a lifecycle policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LifecyclePolicySummary {
  /// The description of the lifecycle policy.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The identifier of the lifecycle policy.
  @_s.JsonKey(name: 'PolicyId')
  final String policyId;

  /// The activation state of the lifecycle policy.
  @_s.JsonKey(name: 'State')
  final GettablePolicyStateValues state;

  /// The tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  LifecyclePolicySummary({
    this.description,
    this.policyId,
    this.state,
    this.tags,
  });
  factory LifecyclePolicySummary.fromJson(Map<String, dynamic> json) =>
      _$LifecyclePolicySummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// Information about the tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Specifies optional parameters to add to a policy. The set of valid
/// parameters depends on the combination of policy type and resource type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Parameters {
  /// [EBS Snapshot Management – Instance policies only] Indicates whether to
  /// exclude the root volume from snapshots created using <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateSnapshots.html">CreateSnapshots</a>.
  /// The default is false.
  @_s.JsonKey(name: 'ExcludeBootVolume')
  final bool excludeBootVolume;

  Parameters({
    this.excludeBootVolume,
  });
  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}

/// Specifies the configuration of a lifecycle policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PolicyDetails {
  /// A set of optional parameters for the policy.
  @_s.JsonKey(name: 'Parameters')
  final Parameters parameters;

  /// The valid target resource types and actions a policy can manage. The default
  /// is EBS_SNAPSHOT_MANAGEMENT.
  @_s.JsonKey(name: 'PolicyType')
  final PolicyTypeValues policyType;

  /// The resource type.
  @_s.JsonKey(name: 'ResourceTypes')
  final List<ResourceTypeValues> resourceTypes;

  /// The schedule of policy-defined actions.
  @_s.JsonKey(name: 'Schedules')
  final List<Schedule> schedules;

  /// The single tag that identifies targeted resources for this policy.
  @_s.JsonKey(name: 'TargetTags')
  final List<Tag> targetTags;

  PolicyDetails({
    this.parameters,
    this.policyType,
    this.resourceTypes,
    this.schedules,
    this.targetTags,
  });
  factory PolicyDetails.fromJson(Map<String, dynamic> json) =>
      _$PolicyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyDetailsToJson(this);
}

enum PolicyTypeValues {
  @_s.JsonValue('EBS_SNAPSHOT_MANAGEMENT')
  ebsSnapshotManagement,
}

enum ResourceTypeValues {
  @_s.JsonValue('VOLUME')
  volume,
  @_s.JsonValue('INSTANCE')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the retention rule for a lifecycle policy. You can retain
/// snapshots based on either a count or a time interval.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RetainRule {
  /// The number of snapshots to retain for each volume, up to a maximum of 1000.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The amount of time to retain each snapshot. The maximum is 100 years. This
  /// is equivalent to 1200 months, 5200 weeks, or 36500 days.
  @_s.JsonKey(name: 'Interval')
  final int interval;

  /// The unit of time for time-based retention.
  @_s.JsonKey(name: 'IntervalUnit')
  final RetentionIntervalUnitValues intervalUnit;

  RetainRule({
    this.count,
    this.interval,
    this.intervalUnit,
  });
  factory RetainRule.fromJson(Map<String, dynamic> json) =>
      _$RetainRuleFromJson(json);

  Map<String, dynamic> toJson() => _$RetainRuleToJson(this);
}

enum RetentionIntervalUnitValues {
  @_s.JsonValue('DAYS')
  days,
  @_s.JsonValue('WEEKS')
  weeks,
  @_s.JsonValue('MONTHS')
  months,
  @_s.JsonValue('YEARS')
  years,
}

/// Specifies a backup schedule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Schedule {
  /// Copy all user-defined tags on a source volume to snapshots of the volume
  /// created by this policy.
  @_s.JsonKey(name: 'CopyTags')
  final bool copyTags;

  /// The creation rule.
  @_s.JsonKey(name: 'CreateRule')
  final CreateRule createRule;

  /// The rule for cross-Region snapshot copies.
  @_s.JsonKey(name: 'CrossRegionCopyRules')
  final List<CrossRegionCopyRule> crossRegionCopyRules;

  /// The rule for enabling fast snapshot restore.
  @_s.JsonKey(name: 'FastRestoreRule')
  final FastRestoreRule fastRestoreRule;

  /// The name of the schedule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The retention rule.
  @_s.JsonKey(name: 'RetainRule')
  final RetainRule retainRule;

  /// The tags to apply to policy-created resources. These user-defined tags are
  /// in addition to the AWS-added lifecycle tags.
  @_s.JsonKey(name: 'TagsToAdd')
  final List<Tag> tagsToAdd;

  /// A collection of key/value pairs with values determined dynamically when the
  /// policy is executed. Keys may be any valid Amazon EC2 tag key. Values must be
  /// in one of the two following formats: <code>$(instance-id)</code> or
  /// <code>$(timestamp)</code>. Variable tags are only valid for EBS Snapshot
  /// Management – Instance policies.
  @_s.JsonKey(name: 'VariableTags')
  final List<Tag> variableTags;

  Schedule({
    this.copyTags,
    this.createRule,
    this.crossRegionCopyRules,
    this.fastRestoreRule,
    this.name,
    this.retainRule,
    this.tagsToAdd,
    this.variableTags,
  });
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

enum SettablePolicyStateValues {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies a tag for a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateLifecyclePolicyResponse {
  UpdateLifecyclePolicyResponse();
  factory UpdateLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLifecyclePolicyResponseFromJson(json);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
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
