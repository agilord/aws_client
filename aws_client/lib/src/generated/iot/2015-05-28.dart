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

part '2015-05-28.g.dart';

/// AWS IoT provides secure, bi-directional communication between
/// Internet-connected devices (such as sensors, actuators, embedded devices, or
/// smart appliances) and the AWS cloud. You can discover your custom IoT-Data
/// endpoint to communicate with, configure rules for data processing and
/// integration with other services, organize resources associated with each
/// device (Registry), configure logging, and create and manage policies and
/// credentials to authenticate devices.
class IoT {
  final _s.RestJsonProtocol _protocol;
  IoT({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'iot',
            signingName: 'execute-api',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts a pending certificate transfer. The default state of the
  /// certificate is INACTIVE.
  ///
  /// To check for pending certificate transfers, call <a>ListCertificates</a>
  /// to enumerate your certificates.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransferAlreadyCompletedException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [setAsActive] :
  /// Specifies whether the certificate is active.
  Future<void> acceptCertificateTransfer({
    @_s.required String certificateId,
    bool setAsActive,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/accept-certificate-transfer/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a thing to a billing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupArn] :
  /// The ARN of the billing group.
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to be added to the billing group.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to be added to the billing group.
  Future<void> addThingToBillingGroup({
    String billingGroupArn,
    String billingGroupName,
    String thingArn,
    String thingName,
  }) async {
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (billingGroupArn != null) 'billingGroupArn': billingGroupArn,
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (thingArn != null) 'thingArn': thingArn,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/billing-groups/addThingToBillingGroup',
      exceptionFnMap: _exceptionFns,
    );
    return AddThingToBillingGroupResponse.fromJson(response);
  }

  /// Adds a thing to a thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [overrideDynamicGroups] :
  /// Override dynamic thing groups with static thing groups when 10-group limit
  /// is reached. If a thing belongs to 10 thing groups, and one or more of
  /// those groups are dynamic thing groups, adding a thing to a static group
  /// removes the thing from the last dynamic group.
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to add to a group.
  ///
  /// Parameter [thingGroupArn] :
  /// The ARN of the group to which you are adding a thing.
  ///
  /// Parameter [thingGroupName] :
  /// The name of the group to which you are adding a thing.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to add to a group.
  Future<void> addThingToThingGroup({
    bool overrideDynamicGroups,
    String thingArn,
    String thingGroupArn,
    String thingGroupName,
    String thingName,
  }) async {
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (overrideDynamicGroups != null)
        'overrideDynamicGroups': overrideDynamicGroups,
      if (thingArn != null) 'thingArn': thingArn,
      if (thingGroupArn != null) 'thingGroupArn': thingGroupArn,
      if (thingGroupName != null) 'thingGroupName': thingGroupName,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/thing-groups/addThingToThingGroup',
      exceptionFnMap: _exceptionFns,
    );
    return AddThingToThingGroupResponse.fromJson(response);
  }

  /// Associates a group with a continuous job. The following criteria must be
  /// met:
  ///
  /// <ul>
  /// <li>
  /// The job must have been created with the <code>targetSelection</code> field
  /// set to "CONTINUOUS".
  /// </li>
  /// <li>
  /// The job status must currently be "IN_PROGRESS".
  /// </li>
  /// <li>
  /// The total number of targets associated with a job must not exceed 100.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [targets] :
  /// A list of thing group ARNs that define the targets of the job.
  ///
  /// Parameter [comment] :
  /// An optional comment string describing why the job was associated with the
  /// targets.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following
  /// format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  Future<AssociateTargetsWithJobResponse> associateTargetsWithJob({
    @_s.required String jobId,
    @_s.required List<String> targets,
    String comment,
    String namespaceId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targets, 'targets');
    _s.validateStringLength(
      'comment',
      comment,
      0,
      2028,
    );
    _s.validateStringPattern(
      'comment',
      comment,
      r'''[^\p{C}]+''',
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'namespaceId',
      namespaceId,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $query = <String, List<String>>{
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    final $payload = <String, dynamic>{
      'targets': targets,
      if (comment != null) 'comment': comment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssociateTargetsWithJobResponse.fromJson(response);
  }

  /// Attaches a policy to the specified target.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to attach.
  ///
  /// Parameter [target] :
  /// The <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/security-iam.html">identity</a>
  /// to which the policy is attached.
  Future<void> attachPolicy({
    @_s.required String policyName,
    @_s.required String target,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(target, 'target');
    final $payload = <String, dynamic>{
      'target': target,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/target-policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Attaches the specified policy to the specified principal (certificate or
  /// other credential).
  ///
  /// <b>Note:</b> This API is deprecated. Please use <a>AttachPolicy</a>
  /// instead.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [principal] :
  /// The principal, which can be a certificate ARN (as returned from the
  /// CreateCertificate operation) or an Amazon Cognito ID.
  @Deprecated('Deprecated')
  Future<void> attachPrincipalPolicy({
    @_s.required String policyName,
    @_s.required String principal,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    final headers = <String, String>{};
    principal?.let((v) => headers['x-amzn-iot-principal'] = v.toString());
    await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/principal-policies/${Uri.encodeComponent(policyName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a Device Defender security profile with a thing group or this
  /// account. Each thing group or account can have up to five security profiles
  /// associated with it.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The security profile that is attached.
  ///
  /// Parameter [securityProfileTargetArn] :
  /// The ARN of the target (thing group) to which the security profile is
  /// attached.
  Future<void> attachSecurityProfile({
    @_s.required String securityProfileName,
    @_s.required String securityProfileTargetArn,
  }) async {
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        securityProfileTargetArn, 'securityProfileTargetArn');
    final $query = <String, List<String>>{
      if (securityProfileTargetArn != null)
        'securityProfileTargetArn': [securityProfileTargetArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AttachSecurityProfileResponse.fromJson(response);
  }

  /// Attaches the specified principal to the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [principal] :
  /// The principal, which can be a certificate ARN (as returned from the
  /// CreateCertificate operation) or an Amazon Cognito ID.
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<void> attachThingPrincipal({
    @_s.required String principal,
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(principal, 'principal');
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    principal?.let((v) => headers['x-amzn-principal'] = v.toString());
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/principals',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return AttachThingPrincipalResponse.fromJson(response);
  }

  /// Cancels a mitigation action task that is in progress. If the task is not
  /// in progress, an InvalidRequestException occurs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier for the task that you want to cancel.
  Future<void> cancelAuditMitigationActionsTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/audit/mitigationactions/tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelAuditMitigationActionsTaskResponse.fromJson(response);
  }

  /// Cancels an audit that is in progress. The audit can be either scheduled or
  /// on demand. If the audit isn't in progress, an "InvalidRequestException"
  /// occurs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The ID of the audit you want to cancel. You can only cancel an audit that
  /// is "IN_PROGRESS".
  Future<void> cancelAuditTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      40,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/audit/tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelAuditTaskResponse.fromJson(response);
  }

  /// Cancels a pending transfer for the specified certificate.
  ///
  /// <b>Note</b> Only the transfer source account can use this operation to
  /// cancel a transfer. (Transfer destinations can use
  /// <a>RejectCertificateTransfer</a> instead.) After transfer, AWS IoT returns
  /// the certificate to the source account in the INACTIVE state. After the
  /// destination account has accepted the transfer, the transfer cannot be
  /// cancelled.
  ///
  /// After a certificate transfer is cancelled, the status of the certificate
  /// changes from PENDING_TRANSFER to INACTIVE.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransferAlreadyCompletedException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  Future<void> cancelCertificateTransfer({
    @_s.required String certificateId,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/cancel-certificate-transfer/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a Device Defender ML Detect mitigation action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  Future<void> cancelDetectMitigationActionsTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/detect/mitigationactions/tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelDetectMitigationActionsTaskResponse.fromJson(response);
  }

  /// Cancels a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [comment] :
  /// An optional comment string describing why the job was canceled.
  ///
  /// Parameter [force] :
  /// (Optional) If <code>true</code> job executions with status "IN_PROGRESS"
  /// and "QUEUED" are canceled, otherwise only job executions with status
  /// "QUEUED" are canceled. The default is <code>false</code>.
  ///
  /// Canceling a job which is "IN_PROGRESS", will cause a device which is
  /// executing the job to be unable to update the job execution status. Use
  /// caution and ensure that each device executing a job which is canceled is
  /// able to recover to a valid state.
  ///
  /// Parameter [reasonCode] :
  /// (Optional)A reason code string that explains why the job was canceled.
  Future<CancelJobResponse> cancelJob({
    @_s.required String jobId,
    String comment,
    bool force,
    String reasonCode,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'comment',
      comment,
      0,
      2028,
    );
    _s.validateStringPattern(
      'comment',
      comment,
      r'''[^\p{C}]+''',
    );
    _s.validateStringLength(
      'reasonCode',
      reasonCode,
      0,
      128,
    );
    _s.validateStringPattern(
      'reasonCode',
      reasonCode,
      r'''[\p{Upper}\p{Digit}_]+''',
    );
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final $payload = <String, dynamic>{
      if (comment != null) 'comment': comment,
      if (reasonCode != null) 'reasonCode': reasonCode,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/cancel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobResponse.fromJson(response);
  }

  /// Cancels the execution of a job for a given thing.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  /// May throw [VersionConflictException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job to be canceled.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose execution of the job will be canceled.
  ///
  /// Parameter [expectedVersion] :
  /// (Optional) The expected current version of the job execution. Each time
  /// you update the job execution, its version is incremented. If the version
  /// of the job execution stored in Jobs does not match, the update is rejected
  /// with a VersionMismatch error, and an ErrorResponse that contains the
  /// current job execution status data is returned. (This makes it unnecessary
  /// to perform a separate DescribeJobExecution request in order to obtain the
  /// job execution status data.)
  ///
  /// Parameter [force] :
  /// (Optional) If <code>true</code> the job execution will be canceled if it
  /// has status IN_PROGRESS or QUEUED, otherwise the job execution will be
  /// canceled only if it has status QUEUED. If you attempt to cancel a job
  /// execution that is IN_PROGRESS, and you do not set <code>force</code> to
  /// <code>true</code>, then an <code>InvalidStateTransitionException</code>
  /// will be thrown. The default is <code>false</code>.
  ///
  /// Canceling a job execution which is "IN_PROGRESS", will cause the device to
  /// be unable to update the job execution status. Use caution and ensure that
  /// the device is able to recover to a valid state.
  ///
  /// Parameter [statusDetails] :
  /// A collection of name/value pairs that describe the status of the job
  /// execution. If not specified, the statusDetails are unchanged. You can
  /// specify at most 10 name/value pairs.
  Future<void> cancelJobExecution({
    @_s.required String jobId,
    @_s.required String thingName,
    int expectedVersion,
    bool force,
    Map<String, String> statusDetails,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final $payload = <String, dynamic>{
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}/cancel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Clears the default authorizer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<void> clearDefaultAuthorizer() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/default-authorizer',
      exceptionFnMap: _exceptionFns,
    );
    return ClearDefaultAuthorizerResponse.fromJson(response);
  }

  /// Confirms a topic rule destination. When you create a rule requiring a
  /// destination, AWS IoT sends a confirmation message to the endpoint or base
  /// address you specify. The message includes a token which you pass back when
  /// calling <code>ConfirmTopicRuleDestination</code> to confirm that you own
  /// or have access to the endpoint.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [confirmationToken] :
  /// The token used to confirm ownership or access to the topic rule
  /// confirmation URL.
  Future<void> confirmTopicRuleDestination({
    @_s.required String confirmationToken,
  }) async {
    ArgumentError.checkNotNull(confirmationToken, 'confirmationToken');
    _s.validateStringLength(
      'confirmationToken',
      confirmationToken,
      1,
      2048,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/confirmdestination/${confirmationToken.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return ConfirmTopicRuleDestinationResponse.fromJson(response);
  }

  /// Creates a Device Defender audit suppression.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [clientRequestToken] :
  /// The epoch timestamp in seconds at which this suppression expires.
  ///
  /// Parameter [description] :
  /// The description of the audit suppression.
  ///
  /// Parameter [expirationDate] :
  /// The epoch timestamp in seconds at which this suppression expires.
  ///
  /// Parameter [suppressIndefinitely] :
  /// Indicates whether a suppression should exist indefinitely or not.
  Future<void> createAuditSuppression({
    @_s.required String checkName,
    @_s.required String clientRequestToken,
    @_s.required ResourceIdentifier resourceIdentifier,
    String description,
    DateTime expirationDate,
    bool suppressIndefinitely,
  }) async {
    ArgumentError.checkNotNull(checkName, 'checkName');
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{Graph}\x20]*''',
    );
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'resourceIdentifier': resourceIdentifier,
      if (description != null) 'description': description,
      if (expirationDate != null)
        'expirationDate': unixTimestampToJson(expirationDate),
      if (suppressIndefinitely != null)
        'suppressIndefinitely': suppressIndefinitely,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAuditSuppressionResponse.fromJson(response);
  }

  /// Creates an authorizer.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerFunctionArn] :
  /// The ARN of the authorizer's Lambda function.
  ///
  /// Parameter [authorizerName] :
  /// The authorizer name.
  ///
  /// Parameter [signingDisabled] :
  /// Specifies whether AWS IoT validates the token signature in an
  /// authorization request.
  ///
  /// Parameter [status] :
  /// The status of the create authorizer request.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the custom authorizer.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  ///
  /// Parameter [tokenKeyName] :
  /// The name of the token key used to extract the token from the HTTP headers.
  ///
  /// Parameter [tokenSigningPublicKeys] :
  /// The public keys used to verify the digital signature returned by your
  /// custom authentication service.
  Future<CreateAuthorizerResponse> createAuthorizer({
    @_s.required String authorizerFunctionArn,
    @_s.required String authorizerName,
    bool signingDisabled,
    AuthorizerStatus status,
    List<Tag> tags,
    String tokenKeyName,
    Map<String, String> tokenSigningPublicKeys,
  }) async {
    ArgumentError.checkNotNull(authorizerFunctionArn, 'authorizerFunctionArn');
    _s.validateStringLength(
      'authorizerFunctionArn',
      authorizerFunctionArn,
      0,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(authorizerName, 'authorizerName');
    _s.validateStringLength(
      'authorizerName',
      authorizerName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authorizerName',
      authorizerName,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'tokenKeyName',
      tokenKeyName,
      1,
      128,
    );
    _s.validateStringPattern(
      'tokenKeyName',
      tokenKeyName,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $payload = <String, dynamic>{
      'authorizerFunctionArn': authorizerFunctionArn,
      if (signingDisabled != null) 'signingDisabled': signingDisabled,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (tokenKeyName != null) 'tokenKeyName': tokenKeyName,
      if (tokenSigningPublicKeys != null)
        'tokenSigningPublicKeys': tokenSigningPublicKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAuthorizerResponse.fromJson(response);
  }

  /// Creates a billing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [billingGroupName] :
  /// The name you wish to give to the billing group.
  ///
  /// Parameter [billingGroupProperties] :
  /// The properties of the billing group.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the billing group.
  Future<CreateBillingGroupResponse> createBillingGroup({
    @_s.required String billingGroupName,
    BillingGroupProperties billingGroupProperties,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(billingGroupName, 'billingGroupName');
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (billingGroupProperties != null)
        'billingGroupProperties': billingGroupProperties,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBillingGroupResponse.fromJson(response);
  }

  /// Creates an X.509 certificate using the specified certificate signing
  /// request.
  ///
  /// <b>Note:</b> The CSR must include a public key that is either an RSA key
  /// with a length of at least 2048 bits or an ECC key from NIST P-256 or NIST
  /// P-384 curves.
  ///
  /// <b>Note:</b> Reusing the same certificate signing request (CSR) results in
  /// a distinct certificate.
  ///
  /// You can create multiple certificates in a batch by creating a directory,
  /// copying multiple .csr files into that directory, and then specifying that
  /// directory on the command line. The following commands show how to create a
  /// batch of certificates given a batch of CSRs.
  ///
  /// Assuming a set of CSRs are located inside of the directory
  /// my-csr-directory:
  ///
  /// On Linux and OS X, the command is:
  ///
  /// $ ls my-csr-directory/ | xargs -I {} aws iot create-certificate-from-csr
  /// --certificate-signing-request file://my-csr-directory/{}
  ///
  /// This command lists all of the CSRs in my-csr-directory and pipes each CSR
  /// file name to the aws iot create-certificate-from-csr AWS CLI command to
  /// create a certificate for the corresponding CSR.
  ///
  /// The aws iot create-certificate-from-csr part of the command can also be
  /// run in parallel to speed up the certificate creation process:
  ///
  /// $ ls my-csr-directory/ | xargs -P 10 -I {} aws iot
  /// create-certificate-from-csr --certificate-signing-request
  /// file://my-csr-directory/{}
  ///
  /// On Windows PowerShell, the command to create certificates for all CSRs in
  /// my-csr-directory is:
  ///
  /// &gt; ls -Name my-csr-directory | %{aws iot create-certificate-from-csr
  /// --certificate-signing-request file://my-csr-directory/$_}
  ///
  /// On a Windows command prompt, the command to create certificates for all
  /// CSRs in my-csr-directory is:
  ///
  /// &gt; forfiles /p my-csr-directory /c "cmd /c aws iot
  /// create-certificate-from-csr --certificate-signing-request file://@path"
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateSigningRequest] :
  /// The certificate signing request (CSR).
  ///
  /// Parameter [setAsActive] :
  /// Specifies whether the certificate is active.
  Future<CreateCertificateFromCsrResponse> createCertificateFromCsr({
    @_s.required String certificateSigningRequest,
    bool setAsActive,
  }) async {
    ArgumentError.checkNotNull(
        certificateSigningRequest, 'certificateSigningRequest');
    _s.validateStringLength(
      'certificateSigningRequest',
      certificateSigningRequest,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final $payload = <String, dynamic>{
      'certificateSigningRequest': certificateSigningRequest,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/certificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateCertificateFromCsrResponse.fromJson(response);
  }

  /// Use this API to define a Custom Metric published by your devices to Device
  /// Defender.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [clientRequestToken] :
  /// Each custom metric must have a unique client request token. If you try to
  /// create a new custom metric that already exists with a different token, an
  /// exception occurs. If you omit this value, AWS SDKs will automatically
  /// generate a unique client request.
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric. This will be used in the metric report
  /// submitted from the device/thing. Shouldn't begin with <code>aws:</code>.
  /// Cannot be updated once defined.
  ///
  /// Parameter [metricType] :
  /// The type of the custom metric. Types include <code>string-list</code>,
  /// <code>ip-address-list</code>, <code>number-list</code>, and
  /// <code>number</code>.
  ///
  /// Parameter [displayName] :
  /// Field represents a friendly name in the console for the custom metric; it
  /// doesn't have to be unique. Don't use this name as the metric identifier in
  /// the device metric report. Can be updated once defined.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the custom metric.
  Future<CreateCustomMetricResponse> createCustomMetric({
    @_s.required String clientRequestToken,
    @_s.required String metricName,
    @_s.required CustomMetricType metricType,
    String displayName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricName, 'metricName');
    _s.validateStringLength(
      'metricName',
      metricName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'metricName',
      metricName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricType, 'metricType');
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      128,
    );
    _s.validateStringPattern(
      'displayName',
      displayName,
      r'''[\p{Graph}\x20]*''',
    );
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'metricType': metricType?.toValue() ?? '',
      if (displayName != null) 'displayName': displayName,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomMetricResponse.fromJson(response);
  }

  /// Create a dimension that you can use to limit the scope of a metric used in
  /// a security profile for AWS IoT Device Defender. For example, using a
  /// <code>TOPIC_FILTER</code> dimension, you can narrow down the scope of the
  /// metric only to MQTT topics whose name match the pattern specified in the
  /// dimension.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [clientRequestToken] :
  /// Each dimension must have a unique client request token. If you try to
  /// create a new dimension with the same token as a dimension that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [name] :
  /// A unique identifier for the dimension. Choose something that describes the
  /// type and value to make it easy to remember what it does.
  ///
  /// Parameter [stringValues] :
  /// Specifies the value or list of values for the dimension. For
  /// <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the
  /// MQTT topic (for example, "admin/#").
  ///
  /// Parameter [type] :
  /// Specifies the type of dimension. Supported types:
  /// <code>TOPIC_FILTER.</code>
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the dimension.
  Future<CreateDimensionResponse> createDimension({
    @_s.required String clientRequestToken,
    @_s.required String name,
    @_s.required List<String> stringValues,
    @_s.required DimensionType type,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stringValues, 'stringValues');
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'stringValues': stringValues,
      'type': type?.toValue() ?? '',
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDimensionResponse.fromJson(response);
  }

  /// Creates a domain configuration.
  /// <note>
  /// The domain configuration feature is in public preview and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [LimitExceededException].
  /// May throw [CertificateValidationException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration. This value must be unique to a
  /// region.
  ///
  /// Parameter [authorizerConfig] :
  /// An object that specifies the authorization service for a domain.
  ///
  /// Parameter [domainName] :
  /// The name of the domain.
  ///
  /// Parameter [serverCertificateArns] :
  /// The ARNs of the certificates that AWS IoT passes to the device during the
  /// TLS handshake. Currently you can specify only one certificate ARN. This
  /// value is not required for AWS-managed domains.
  ///
  /// Parameter [serviceType] :
  /// The type of service delivered by the endpoint.
  /// <note>
  /// AWS IoT Core currently supports only the <code>DATA</code> service type.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the domain configuration.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  ///
  /// Parameter [validationCertificateArn] :
  /// The certificate used to validate the server certificate and prove domain
  /// name ownership. This certificate must be signed by a public certificate
  /// authority. This value is not required for AWS-managed domains.
  Future<CreateDomainConfigurationResponse> createDomainConfiguration({
    @_s.required String domainConfigurationName,
    AuthorizerConfig authorizerConfig,
    String domainName,
    List<String> serverCertificateArns,
    ServiceType serviceType,
    List<Tag> tags,
    String validationCertificateArn,
  }) async {
    ArgumentError.checkNotNull(
        domainConfigurationName, 'domainConfigurationName');
    _s.validateStringLength(
      'domainConfigurationName',
      domainConfigurationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainConfigurationName',
      domainConfigurationName,
      r'''[\w.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'domainName',
      domainName,
      1,
      253,
    );
    _s.validateStringLength(
      'validationCertificateArn',
      validationCertificateArn,
      1,
      2048,
    );
    _s.validateStringPattern(
      'validationCertificateArn',
      validationCertificateArn,
      r'''arn:aws(-cn|-us-gov|-iso-b|-iso)?:acm:[a-z]{2}-(gov-|iso-|isob-)?[a-z]{4,9}-\d{1}:\d{12}:certificate/[a-zA-Z0-9/-]+''',
    );
    final $payload = <String, dynamic>{
      if (authorizerConfig != null) 'authorizerConfig': authorizerConfig,
      if (domainName != null) 'domainName': domainName,
      if (serverCertificateArns != null)
        'serverCertificateArns': serverCertificateArns,
      if (serviceType != null) 'serviceType': serviceType.toValue(),
      if (tags != null) 'tags': tags,
      if (validationCertificateArn != null)
        'validationCertificateArn': validationCertificateArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDomainConfigurationResponse.fromJson(response);
  }

  /// Creates a dynamic thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidQueryException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [queryString] :
  /// The dynamic thing group search query string.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/query-syntax.html">Query
  /// Syntax</a> for information about query string syntax.
  ///
  /// Parameter [thingGroupName] :
  /// The dynamic thing group name to create.
  ///
  /// Parameter [indexName] :
  /// The dynamic thing group index name.
  /// <note>
  /// Currently one index is supported: "AWS_Things".
  /// </note>
  ///
  /// Parameter [queryVersion] :
  /// The dynamic thing group query version.
  /// <note>
  /// Currently one query version is supported: "2017-09-30". If not specified,
  /// the query version defaults to this value.
  /// </note>
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the dynamic thing group.
  ///
  /// Parameter [thingGroupProperties] :
  /// The dynamic thing group properties.
  Future<CreateDynamicThingGroupResponse> createDynamicThingGroup({
    @_s.required String queryString,
    @_s.required String thingGroupName,
    String indexName,
    String queryVersion,
    List<Tag> tags,
    ThingGroupProperties thingGroupProperties,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      128,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
      if (tags != null) 'tags': tags,
      if (thingGroupProperties != null)
        'thingGroupProperties': thingGroupProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/dynamic-thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDynamicThingGroupResponse.fromJson(response);
  }

  /// Creates a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// A job identifier which must be unique for your AWS account. We recommend
  /// using a UUID. Alpha-numeric characters, "-" and "_" are valid for use
  /// here.
  ///
  /// Parameter [targets] :
  /// A list of things and thing groups to which the job should be sent.
  ///
  /// Parameter [abortConfig] :
  /// Allows you to create criteria to abort a job.
  ///
  /// Parameter [description] :
  /// A short text description of the job.
  ///
  /// Parameter [document] :
  /// The job document.
  /// <note>
  /// If the job document resides in an S3 bucket, you must use a placeholder
  /// link when specifying the document.
  ///
  /// The placeholder link is of the following form:
  ///
  /// <code>${aws:iot:s3-presigned-url:https://s3.amazonaws.com/<i>bucket</i>/<i>key</i>}</code>
  ///
  /// where <i>bucket</i> is your bucket name and <i>key</i> is the object in
  /// the bucket to which you are linking.
  /// </note>
  ///
  /// Parameter [documentSource] :
  /// An S3 link to the job document.
  ///
  /// Parameter [jobExecutionsRolloutConfig] :
  /// Allows you to create a staged rollout of the job.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following
  /// format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  ///
  /// Parameter [presignedUrlConfig] :
  /// Configuration information for pre-signed S3 URLs.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the job.
  ///
  /// Parameter [targetSelection] :
  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the
  /// job (SNAPSHOT). If continuous, the job may also be run on a thing when a
  /// change is detected in a target. For example, a job will run on a thing
  /// when the thing is added to a target group, even after the job was
  /// completed by all things originally in the group.
  ///
  /// Parameter [timeoutConfig] :
  /// Specifies the amount of time each device has to finish its execution of
  /// the job. The timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to
  /// another terminal state before the time expires, it will be automatically
  /// set to <code>TIMED_OUT</code>.
  Future<CreateJobResponse> createJob({
    @_s.required String jobId,
    @_s.required List<String> targets,
    AbortConfig abortConfig,
    String description,
    String document,
    String documentSource,
    JobExecutionsRolloutConfig jobExecutionsRolloutConfig,
    String namespaceId,
    PresignedUrlConfig presignedUrlConfig,
    List<Tag> tags,
    TargetSelection targetSelection,
    TimeoutConfig timeoutConfig,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targets, 'targets');
    _s.validateStringLength(
      'description',
      description,
      0,
      2028,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[^\p{C}]+''',
    );
    _s.validateStringLength(
      'document',
      document,
      0,
      32768,
    );
    _s.validateStringLength(
      'documentSource',
      documentSource,
      1,
      1350,
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'namespaceId',
      namespaceId,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $payload = <String, dynamic>{
      'targets': targets,
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (description != null) 'description': description,
      if (document != null) 'document': document,
      if (documentSource != null) 'documentSource': documentSource,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (namespaceId != null) 'namespaceId': namespaceId,
      if (presignedUrlConfig != null) 'presignedUrlConfig': presignedUrlConfig,
      if (tags != null) 'tags': tags,
      if (targetSelection != null) 'targetSelection': targetSelection.toValue(),
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// Creates a 2048-bit RSA key pair and issues an X.509 certificate using the
  /// issued public key. You can also call <code>CreateKeysAndCertificate</code>
  /// over MQTT from a device, for more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-wo-cert.html#provision-mqtt-api">Provisioning
  /// MQTT API</a>.
  ///
  /// <b>Note</b> This is the only time AWS IoT issues the private key for this
  /// certificate, so it is important to keep it in a secure location.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [setAsActive] :
  /// Specifies whether the certificate is active.
  Future<CreateKeysAndCertificateResponse> createKeysAndCertificate({
    bool setAsActive,
  }) async {
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/keys-and-certificate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateKeysAndCertificateResponse.fromJson(response);
  }

  /// Defines an action that can be applied to audit findings by using
  /// StartAuditMitigationActionsTask. Only certain types of mitigation actions
  /// can be applied to specific check names. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/device-defender-mitigation-actions.html">Mitigation
  /// actions</a>. Each mitigation action can apply only one type of change.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// A friendly name for the action. Choose a friendly name that accurately
  /// describes the action (for example, <code>EnableLoggingAction</code>).
  ///
  /// Parameter [actionParams] :
  /// Defines the type of action and the parameters for that action.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that is used to apply the mitigation action.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the mitigation action.
  Future<CreateMitigationActionResponse> createMitigationAction({
    @_s.required String actionName,
    @_s.required MitigationActionParams actionParams,
    @_s.required String roleArn,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(actionName, 'actionName');
    _s.validateStringLength(
      'actionName',
      actionName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionName',
      actionName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(actionParams, 'actionParams');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'actionParams': actionParams,
      'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMitigationActionResponse.fromJson(response);
  }

  /// Creates an AWS IoT OTAUpdate on a target group of things or groups.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [files] :
  /// The files to be streamed by the OTA update.
  ///
  /// Parameter [otaUpdateId] :
  /// The ID of the OTA update to be created.
  ///
  /// Parameter [roleArn] :
  /// The IAM role that grants AWS IoT access to the Amazon S3, AWS IoT jobs and
  /// AWS Code Signing resources to create an OTA update job.
  ///
  /// Parameter [targets] :
  /// The devices targeted to receive OTA updates.
  ///
  /// Parameter [additionalParameters] :
  /// A list of additional OTA update parameters which are name-value pairs.
  ///
  /// Parameter [awsJobAbortConfig] :
  /// The criteria that determine when and how a job abort takes place.
  ///
  /// Parameter [awsJobExecutionsRolloutConfig] :
  /// Configuration for the rollout of OTA updates.
  ///
  /// Parameter [awsJobPresignedUrlConfig] :
  /// Configuration information for pre-signed URLs.
  ///
  /// Parameter [awsJobTimeoutConfig] :
  /// Specifies the amount of time each device has to finish its execution of
  /// the job. A timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to
  /// another terminal state before the timer expires, it will be automatically
  /// set to <code>TIMED_OUT</code>.
  ///
  /// Parameter [description] :
  /// The description of the OTA update.
  ///
  /// Parameter [protocols] :
  /// The protocol used to transfer the OTA update image. Valid values are
  /// [HTTP], [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the
  /// target device can choose the protocol.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage updates.
  ///
  /// Parameter [targetSelection] :
  /// Specifies whether the update will continue to run (CONTINUOUS), or will be
  /// complete after all the things specified as targets have completed the
  /// update (SNAPSHOT). If continuous, the update may also be run on a thing
  /// when a change is detected in a target. For example, an update will run on
  /// a thing when the thing is added to a target group, even after the update
  /// was completed by all things originally in the group. Valid values:
  /// CONTINUOUS | SNAPSHOT.
  Future<CreateOTAUpdateResponse> createOTAUpdate({
    @_s.required List<OTAUpdateFile> files,
    @_s.required String otaUpdateId,
    @_s.required String roleArn,
    @_s.required List<String> targets,
    Map<String, String> additionalParameters,
    AwsJobAbortConfig awsJobAbortConfig,
    AwsJobExecutionsRolloutConfig awsJobExecutionsRolloutConfig,
    AwsJobPresignedUrlConfig awsJobPresignedUrlConfig,
    AwsJobTimeoutConfig awsJobTimeoutConfig,
    String description,
    List<Protocol> protocols,
    List<Tag> tags,
    TargetSelection targetSelection,
  }) async {
    ArgumentError.checkNotNull(files, 'files');
    ArgumentError.checkNotNull(otaUpdateId, 'otaUpdateId');
    _s.validateStringLength(
      'otaUpdateId',
      otaUpdateId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'otaUpdateId',
      otaUpdateId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targets, 'targets');
    _s.validateStringLength(
      'description',
      description,
      0,
      2028,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[^\p{C}]+''',
    );
    final $payload = <String, dynamic>{
      'files': files,
      'roleArn': roleArn,
      'targets': targets,
      if (additionalParameters != null)
        'additionalParameters': additionalParameters,
      if (awsJobAbortConfig != null) 'awsJobAbortConfig': awsJobAbortConfig,
      if (awsJobExecutionsRolloutConfig != null)
        'awsJobExecutionsRolloutConfig': awsJobExecutionsRolloutConfig,
      if (awsJobPresignedUrlConfig != null)
        'awsJobPresignedUrlConfig': awsJobPresignedUrlConfig,
      if (awsJobTimeoutConfig != null)
        'awsJobTimeoutConfig': awsJobTimeoutConfig,
      if (description != null) 'description': description,
      if (protocols != null)
        'protocols': protocols.map((e) => e?.toValue() ?? '').toList(),
      if (tags != null) 'tags': tags,
      if (targetSelection != null) 'targetSelection': targetSelection.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/otaUpdates/${Uri.encodeComponent(otaUpdateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateOTAUpdateResponse.fromJson(response);
  }

  /// Creates an AWS IoT policy.
  ///
  /// The created policy is the default version for the policy. This operation
  /// creates a policy version with a version identifier of <b>1</b> and sets
  /// <b>1</b> as the policy's default version.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [MalformedPolicyException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON document that describes the policy. <b>policyDocument</b> must
  /// have a minimum length of 1, with a maximum length of 2048, excluding
  /// whitespace.
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the policy.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<CreatePolicyResponse> createPolicy({
    @_s.required String policyDocument,
    @_s.required String policyName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePolicyResponse.fromJson(response);
  }

  /// Creates a new version of the specified AWS IoT policy. To update a policy,
  /// create a new policy version. A managed policy can have up to five
  /// versions. If the policy has five versions, you must use
  /// <a>DeletePolicyVersion</a> to delete an existing version before you create
  /// a new one.
  ///
  /// Optionally, you can set the new version as the policy's default version.
  /// The default version is the operative version (that is, the version that is
  /// in effect for the certificates to which the policy is attached).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [MalformedPolicyException].
  /// May throw [VersionsLimitExceededException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyDocument] :
  /// The JSON document that describes the policy. Minimum length of 1. Maximum
  /// length of 2048, excluding whitespace.
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [setAsDefault] :
  /// Specifies whether the policy version is set as the default. When this
  /// parameter is true, the new policy version becomes the operative version
  /// (that is, the version that is in effect for the certificates to which the
  /// policy is attached).
  Future<CreatePolicyVersionResponse> createPolicyVersion({
    @_s.required String policyDocument,
    @_s.required String policyName,
    bool setAsDefault,
  }) async {
    ArgumentError.checkNotNull(policyDocument, 'policyDocument');
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (setAsDefault != null) 'setAsDefault': [setAsDefault.toString()],
    };
    final $payload = <String, dynamic>{
      'policyDocument': policyDocument,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}/version',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreatePolicyVersionResponse.fromJson(response);
  }

  /// Creates a provisioning claim.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [templateName] :
  /// The name of the provisioning template to use.
  Future<CreateProvisioningClaimResponse> createProvisioningClaim({
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/provisioning-claim',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisioningClaimResponse.fromJson(response);
  }

  /// Creates a fleet provisioning template.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [provisioningRoleArn] :
  /// The role ARN for the role associated with the fleet provisioning template.
  /// This IoT role grants permission to provision a device.
  ///
  /// Parameter [templateBody] :
  /// The JSON formatted contents of the fleet provisioning template.
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provisioning template.
  ///
  /// Parameter [description] :
  /// The description of the fleet provisioning template.
  ///
  /// Parameter [enabled] :
  /// True to enable the fleet provisioning template, otherwise false.
  ///
  /// Parameter [preProvisioningHook] :
  /// Creates a pre-provisioning hook template.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the fleet provisioning template.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<CreateProvisioningTemplateResponse> createProvisioningTemplate({
    @_s.required String provisioningRoleArn,
    @_s.required String templateBody,
    @_s.required String templateName,
    String description,
    bool enabled,
    ProvisioningHook preProvisioningHook,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(provisioningRoleArn, 'provisioningRoleArn');
    _s.validateStringLength(
      'provisioningRoleArn',
      provisioningRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateBody, 'templateBody');
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
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
      r'''[^\p{C}]*''',
    );
    final $payload = <String, dynamic>{
      'provisioningRoleArn': provisioningRoleArn,
      'templateBody': templateBody,
      'templateName': templateName,
      if (description != null) 'description': description,
      if (enabled != null) 'enabled': enabled,
      if (preProvisioningHook != null)
        'preProvisioningHook': preProvisioningHook,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/provisioning-templates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisioningTemplateResponse.fromJson(response);
  }

  /// Creates a new version of a fleet provisioning template.
  ///
  /// May throw [VersionsLimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [templateBody] :
  /// The JSON formatted contents of the fleet provisioning template.
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provisioning template.
  ///
  /// Parameter [setAsDefault] :
  /// Sets a fleet provision template version as the default version.
  Future<CreateProvisioningTemplateVersionResponse>
      createProvisioningTemplateVersion({
    @_s.required String templateBody,
    @_s.required String templateName,
    bool setAsDefault,
  }) async {
    ArgumentError.checkNotNull(templateBody, 'templateBody');
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (setAsDefault != null) 'setAsDefault': [setAsDefault.toString()],
    };
    final $payload = <String, dynamic>{
      'templateBody': templateBody,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisioningTemplateVersionResponse.fromJson(response);
  }

  /// Creates a role alias.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias that points to a role ARN. This allows you to change the
  /// role without having to update the device.
  ///
  /// Parameter [roleArn] :
  /// The role ARN.
  ///
  /// Parameter [credentialDurationSeconds] :
  /// How long (in seconds) the credentials will be valid.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the role alias.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<CreateRoleAliasResponse> createRoleAlias({
    @_s.required String roleAlias,
    @_s.required String roleArn,
    int credentialDurationSeconds,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(roleAlias, 'roleAlias');
    _s.validateStringLength(
      'roleAlias',
      roleAlias,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleAlias',
      roleAlias,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'credentialDurationSeconds',
      credentialDurationSeconds,
      900,
      3600,
    );
    final $payload = <String, dynamic>{
      'roleArn': roleArn,
      if (credentialDurationSeconds != null)
        'credentialDurationSeconds': credentialDurationSeconds,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoleAliasResponse.fromJson(response);
  }

  /// Creates a scheduled audit that is run at a specified time interval.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [frequency] :
  /// How often the scheduled audit takes place, either <code>DAILY</code>,
  /// <code>WEEKLY</code>, <code>BIWEEKLY</code> or <code>MONTHLY</code>. The
  /// start time of each audit is determined by the system.
  ///
  /// Parameter [scheduledAuditName] :
  /// The name you want to give to the scheduled audit. (Max. 128 chars)
  ///
  /// Parameter [targetCheckNames] :
  /// Which checks are performed during the scheduled audit. Checks must be
  /// enabled for your account. (Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or use
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.)
  ///
  /// Parameter [dayOfMonth] :
  /// The day of the month on which the scheduled audit takes place. This can be
  /// "1" through "31" or "LAST". This field is required if the "frequency"
  /// parameter is set to <code>MONTHLY</code>. If days 29 to 31 are specified,
  /// and the month doesn't have that many days, the audit takes place on the
  /// <code>LAST</code> day of the month.
  ///
  /// Parameter [dayOfWeek] :
  /// The day of the week on which the scheduled audit takes place, either
  /// <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>,
  /// <code>THU</code>, <code>FRI</code>, or <code>SAT</code>. This field is
  /// required if the <code>frequency</code> parameter is set to
  /// <code>WEEKLY</code> or <code>BIWEEKLY</code>.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the scheduled audit.
  Future<CreateScheduledAuditResponse> createScheduledAudit({
    @_s.required AuditFrequency frequency,
    @_s.required String scheduledAuditName,
    @_s.required List<String> targetCheckNames,
    String dayOfMonth,
    DayOfWeek dayOfWeek,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(frequency, 'frequency');
    ArgumentError.checkNotNull(scheduledAuditName, 'scheduledAuditName');
    _s.validateStringLength(
      'scheduledAuditName',
      scheduledAuditName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledAuditName',
      scheduledAuditName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetCheckNames, 'targetCheckNames');
    _s.validateStringPattern(
      'dayOfMonth',
      dayOfMonth,
      r'''^([1-9]|[12][0-9]|3[01])$|^LAST$''',
    );
    final $payload = <String, dynamic>{
      'frequency': frequency?.toValue() ?? '',
      'targetCheckNames': targetCheckNames,
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateScheduledAuditResponse.fromJson(response);
  }

  /// Creates a Device Defender security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The name you are giving to the security profile.
  ///
  /// Parameter [additionalMetricsToRetain] :
  /// <i>Please use
  /// <a>CreateSecurityProfileRequest$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but
  /// it is also retained for any metric specified here. Can be used with custom
  /// metrics; cannot be used with dimensions.
  ///
  /// Parameter [additionalMetricsToRetainV2] :
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but
  /// it is also retained for any metric specified here. Can be used with custom
  /// metrics; cannot be used with dimensions.
  ///
  /// Parameter [alertTargets] :
  /// Specifies the destinations to which alerts are sent. (Alerts are always
  /// sent to the console.) Alerts are generated when a device (thing) violates
  /// a behavior.
  ///
  /// Parameter [behaviors] :
  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  ///
  /// Parameter [securityProfileDescription] :
  /// A description of the security profile.
  ///
  /// Parameter [tags] :
  /// Metadata that can be used to manage the security profile.
  Future<CreateSecurityProfileResponse> createSecurityProfile({
    @_s.required String securityProfileName,
    List<String> additionalMetricsToRetain,
    List<MetricToRetain> additionalMetricsToRetainV2,
    Map<AlertTargetType, AlertTarget> alertTargets,
    List<Behavior> behaviors,
    String securityProfileDescription,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'securityProfileDescription',
      securityProfileDescription,
      0,
      1000,
    );
    _s.validateStringPattern(
      'securityProfileDescription',
      securityProfileDescription,
      r'''[\p{Graph}\x20]*''',
    );
    final $payload = <String, dynamic>{
      if (additionalMetricsToRetain != null)
        'additionalMetricsToRetain': additionalMetricsToRetain,
      if (additionalMetricsToRetainV2 != null)
        'additionalMetricsToRetainV2': additionalMetricsToRetainV2,
      if (alertTargets != null)
        'alertTargets': alertTargets.map((k, e) => MapEntry(k.toValue(), e)),
      if (behaviors != null) 'behaviors': behaviors,
      if (securityProfileDescription != null)
        'securityProfileDescription': securityProfileDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSecurityProfileResponse.fromJson(response);
  }

  /// Creates a stream for delivering one or more large files in chunks over
  /// MQTT. A stream transports data bytes in chunks or blocks packaged as MQTT
  /// messages from a source like S3. You can have one or more files associated
  /// with a stream.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [files] :
  /// The files to stream.
  ///
  /// Parameter [roleArn] :
  /// An IAM role that allows the IoT service principal assumes to access your
  /// S3 files.
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  ///
  /// Parameter [description] :
  /// A description of the stream.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage streams.
  Future<CreateStreamResponse> createStream({
    @_s.required List<StreamFile> files,
    @_s.required String roleArn,
    @_s.required String streamId,
    String description,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(files, 'files');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamId, 'streamId');
    _s.validateStringLength(
      'streamId',
      streamId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamId',
      streamId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2028,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[^\p{C}]+''',
    );
    final $payload = <String, dynamic>{
      'files': files,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamResponse.fromJson(response);
  }

  /// Creates a thing record in the registry. If this call is made multiple
  /// times using the same thing name and configuration, the call will succeed.
  /// If this call is made with the same thing name but different configuration
  /// a <code>ResourceAlreadyExistsException</code> is thrown.
  /// <note>
  /// This is a control plane operation. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html">Authorization</a>
  /// for information about authorizing control plane actions.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing to create.
  ///
  /// You can't change a thing's name after you create it. To change a thing's
  /// name, you must create a new thing, give it the new name, and then delete
  /// the old thing.
  ///
  /// Parameter [attributePayload] :
  /// The attribute payload, which consists of up to three name/value pairs in a
  /// JSON document. For example:
  ///
  /// <code>{\"attributes\":{\"string1\":\"string2\"}}</code>
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group the thing will be added to.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type associated with the new thing.
  Future<CreateThingResponse> createThing({
    @_s.required String thingName,
    AttributePayload attributePayload,
    String billingGroupName,
    String thingTypeName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (attributePayload != null) 'attributePayload': attributePayload,
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThingResponse.fromJson(response);
  }

  /// Create a thing group.
  /// <note>
  /// This is a control plane operation. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-authorization.html">Authorization</a>
  /// for information about authorizing control plane actions.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupName] :
  /// The thing group name to create.
  ///
  /// Parameter [parentGroupName] :
  /// The name of the parent thing group.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the thing group.
  ///
  /// Parameter [thingGroupProperties] :
  /// The thing group properties.
  Future<CreateThingGroupResponse> createThingGroup({
    @_s.required String thingGroupName,
    String parentGroupName,
    List<Tag> tags,
    ThingGroupProperties thingGroupProperties,
  }) async {
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'parentGroupName',
      parentGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'parentGroupName',
      parentGroupName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (parentGroupName != null) 'parentGroupName': parentGroupName,
      if (tags != null) 'tags': tags,
      if (thingGroupProperties != null)
        'thingGroupProperties': thingGroupProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThingGroupResponse.fromJson(response);
  }

  /// Creates a new thing type.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the thing type.
  ///
  /// Parameter [thingTypeProperties] :
  /// The ThingTypeProperties for the thing type to create. It contains
  /// information about the new thing type including a description, and a list
  /// of searchable thing attribute names.
  Future<CreateThingTypeResponse> createThingType({
    @_s.required String thingTypeName,
    List<Tag> tags,
    ThingTypeProperties thingTypeProperties,
  }) async {
    ArgumentError.checkNotNull(thingTypeName, 'thingTypeName');
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
      if (thingTypeProperties != null)
        'thingTypeProperties': thingTypeProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/thing-types/${Uri.encodeComponent(thingTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateThingTypeResponse.fromJson(response);
  }

  /// Creates a rule. Creating rules is an administrator-level action. Any user
  /// who has permission to create rules will be able to access data processed
  /// by the rule.
  ///
  /// May throw [SqlParseException].
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  ///
  /// Parameter [topicRulePayload] :
  /// The rule payload.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the topic rule.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: --tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<void> createTopicRule({
    @_s.required String ruleName,
    @_s.required TopicRulePayload topicRulePayload,
    String tags,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(topicRulePayload, 'topicRulePayload');
    final headers = <String, String>{};
    tags?.let((v) => headers['x-amz-tagging'] = v.toString());
    await _protocol.send(
      payload: topicRulePayload,
      method: 'POST',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a topic rule destination. The destination must be confirmed prior
  /// to use.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [destinationConfiguration] :
  /// The topic rule destination configuration.
  Future<CreateTopicRuleDestinationResponse> createTopicRuleDestination({
    @_s.required TopicRuleDestinationConfiguration destinationConfiguration,
  }) async {
    ArgumentError.checkNotNull(
        destinationConfiguration, 'destinationConfiguration');
    final $payload = <String, dynamic>{
      'destinationConfiguration': destinationConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/destinations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTopicRuleDestinationResponse.fromJson(response);
  }

  /// Restores the default settings for Device Defender audits for this account.
  /// Any configuration data you entered is deleted and all audit checks are
  /// reset to disabled.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [deleteScheduledAudits] :
  /// If true, all scheduled audits are deleted.
  Future<void> deleteAccountAuditConfiguration({
    bool deleteScheduledAudits,
  }) async {
    final $query = <String, List<String>>{
      if (deleteScheduledAudits != null)
        'deleteScheduledAudits': [deleteScheduledAudits.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/audit/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAccountAuditConfigurationResponse.fromJson(response);
  }

  /// Deletes a Device Defender audit suppression.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  Future<void> deleteAuditSuppression({
    @_s.required String checkName,
    @_s.required ResourceIdentifier resourceIdentifier,
  }) async {
    ArgumentError.checkNotNull(checkName, 'checkName');
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'resourceIdentifier': resourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/delete',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAuditSuppressionResponse.fromJson(response);
  }

  /// Deletes an authorizer.
  ///
  /// May throw [DeleteConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerName] :
  /// The name of the authorizer to delete.
  Future<void> deleteAuthorizer({
    @_s.required String authorizerName,
  }) async {
    ArgumentError.checkNotNull(authorizerName, 'authorizerName');
    _s.validateStringLength(
      'authorizerName',
      authorizerName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authorizerName',
      authorizerName,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAuthorizerResponse.fromJson(response);
  }

  /// Deletes the billing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the billing group. If the version of the billing
  /// group does not match the expected version specified in the request, the
  /// <code>DeleteBillingGroup</code> request is rejected with a
  /// <code>VersionConflictException</code>.
  Future<void> deleteBillingGroup({
    @_s.required String billingGroupName,
    int expectedVersion,
  }) async {
    ArgumentError.checkNotNull(billingGroupName, 'billingGroupName');
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBillingGroupResponse.fromJson(response);
  }

  /// Deletes a registered CA certificate.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [CertificateStateException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate to delete. (The last part of the certificate ARN
  /// contains the certificate ID.)
  Future<void> deleteCACertificate({
    @_s.required String certificateId,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/cacertificate/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCACertificateResponse.fromJson(response);
  }

  /// Deletes the specified certificate.
  ///
  /// A certificate cannot be deleted if it has a policy or IoT thing attached
  /// to it or if its status is set to ACTIVE. To delete a certificate, first
  /// use the <a>DetachPrincipalPolicy</a> API to detach all policies. Next, use
  /// the <a>UpdateCertificate</a> API to set the certificate to the INACTIVE
  /// status.
  ///
  /// May throw [CertificateStateException].
  /// May throw [DeleteConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [forceDelete] :
  /// Forces the deletion of a certificate if it is inactive and is not attached
  /// to an IoT thing.
  Future<void> deleteCertificate({
    @_s.required String certificateId,
    bool forceDelete,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (forceDelete != null) 'forceDelete': [forceDelete.toString()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/certificates/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// <note>
  /// Before you can delete a custom metric, you must first remove the custom
  /// metric from all security profiles it's a part of. The security profile
  /// associated with the custom metric can be found using the <a
  /// href="https://docs.aws.amazon.com/iot/latest/apireference/API_ListSecurityProfiles.html">ListSecurityProfiles</a>
  /// API with <code>metricName</code> set to your custom metric name.
  /// </note>
  /// Deletes a Device Defender detect custom metric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric.
  Future<void> deleteCustomMetric({
    @_s.required String metricName,
  }) async {
    ArgumentError.checkNotNull(metricName, 'metricName');
    _s.validateStringLength(
      'metricName',
      metricName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'metricName',
      metricName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteCustomMetricResponse.fromJson(response);
  }

  /// Removes the specified dimension from your AWS account.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The unique identifier for the dimension that you want to delete.
  Future<void> deleteDimension({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDimensionResponse.fromJson(response);
  }

  /// Deletes the specified domain configuration.
  /// <note>
  /// The domain configuration feature is in public preview and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration to be deleted.
  Future<void> deleteDomainConfiguration({
    @_s.required String domainConfigurationName,
  }) async {
    ArgumentError.checkNotNull(
        domainConfigurationName, 'domainConfigurationName');
    _s.validateStringLength(
      'domainConfigurationName',
      domainConfigurationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainConfigurationName',
      domainConfigurationName,
      r'''[\w.-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDomainConfigurationResponse.fromJson(response);
  }

  /// Deletes a dynamic thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the dynamic thing group to delete.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the dynamic thing group to delete.
  Future<void> deleteDynamicThingGroup({
    @_s.required String thingGroupName,
    int expectedVersion,
  }) async {
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/dynamic-thing-groups/${Uri.encodeComponent(thingGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDynamicThingGroupResponse.fromJson(response);
  }

  /// Deletes a job and its related job executions.
  ///
  /// Deleting a job may take time, depending on the number of job executions
  /// created for the job and various other factors. While the job is being
  /// deleted, the status of the job will be shown as "DELETION_IN_PROGRESS".
  /// Attempting to delete or cancel a job whose status is already
  /// "DELETION_IN_PROGRESS" will result in an error.
  ///
  /// Only 10 jobs may have status "DELETION_IN_PROGRESS" at the same time, or a
  /// LimitExceededException will occur.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job to be deleted.
  ///
  /// After a job deletion is completed, you may reuse this jobId when you
  /// create a new job. However, this is not recommended, and you must ensure
  /// that your devices are not using the jobId to refer to the deleted job.
  ///
  /// Parameter [force] :
  /// (Optional) When true, you can delete a job which is "IN_PROGRESS".
  /// Otherwise, you can only delete a job which is in a terminal state
  /// ("COMPLETED" or "CANCELED") or an exception will occur. The default is
  /// false.
  /// <note>
  /// Deleting a job which is "IN_PROGRESS", will cause a device which is
  /// executing the job to be unable to access job information or update the job
  /// execution status. Use caution and ensure that each device executing a job
  /// which is deleted is able to recover to a valid state.
  /// </note>
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following
  /// format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  Future<void> deleteJob({
    @_s.required String jobId,
    bool force,
    String namespaceId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'namespaceId',
      namespaceId,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a job execution.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [executionNumber] :
  /// The ID of the job execution to be deleted. The
  /// <code>executionNumber</code> refers to the execution of a particular job
  /// on a particular device.
  ///
  /// Note that once a job execution is deleted, the
  /// <code>executionNumber</code> may be reused by IoT, so be sure you get and
  /// use the correct value here.
  ///
  /// Parameter [jobId] :
  /// The ID of the job whose execution on a particular device will be deleted.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose job execution will be deleted.
  ///
  /// Parameter [force] :
  /// (Optional) When true, you can delete a job execution which is
  /// "IN_PROGRESS". Otherwise, you can only delete a job execution which is in
  /// a terminal state ("SUCCEEDED", "FAILED", "REJECTED", "REMOVED" or
  /// "CANCELED") or an exception will occur. The default is false.
  /// <note>
  /// Deleting a job execution which is "IN_PROGRESS", will cause the device to
  /// be unable to access job information or update the job execution status.
  /// Use caution and ensure that the device is able to recover to a valid
  /// state.
  /// </note>
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following
  /// format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  Future<void> deleteJobExecution({
    @_s.required int executionNumber,
    @_s.required String jobId,
    @_s.required String thingName,
    bool force,
    String namespaceId,
  }) async {
    ArgumentError.checkNotNull(executionNumber, 'executionNumber');
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'namespaceId',
      namespaceId,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}/executionNumber/${Uri.encodeComponent(executionNumber.toString())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a defined mitigation action from your AWS account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// The name of the mitigation action that you want to delete.
  Future<void> deleteMitigationAction({
    @_s.required String actionName,
  }) async {
    ArgumentError.checkNotNull(actionName, 'actionName');
    _s.validateStringLength(
      'actionName',
      actionName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionName',
      actionName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMitigationActionResponse.fromJson(response);
  }

  /// Delete an OTA update.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [VersionConflictException].
  ///
  /// Parameter [otaUpdateId] :
  /// The ID of the OTA update to delete.
  ///
  /// Parameter [deleteStream] :
  /// Specifies if the stream associated with an OTA update should be deleted
  /// when the OTA update is deleted.
  ///
  /// Parameter [forceDeleteAWSJob] :
  /// Specifies if the AWS Job associated with the OTA update should be deleted
  /// when the OTA update is deleted.
  Future<void> deleteOTAUpdate({
    @_s.required String otaUpdateId,
    bool deleteStream,
    bool forceDeleteAWSJob,
  }) async {
    ArgumentError.checkNotNull(otaUpdateId, 'otaUpdateId');
    _s.validateStringLength(
      'otaUpdateId',
      otaUpdateId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'otaUpdateId',
      otaUpdateId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (deleteStream != null) 'deleteStream': [deleteStream.toString()],
      if (forceDeleteAWSJob != null)
        'forceDeleteAWSJob': [forceDeleteAWSJob.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/otaUpdates/${Uri.encodeComponent(otaUpdateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteOTAUpdateResponse.fromJson(response);
  }

  /// Deletes the specified policy.
  ///
  /// A policy cannot be deleted if it has non-default versions or it is
  /// attached to any certificate.
  ///
  /// To delete a policy, use the DeletePolicyVersion API to delete all
  /// non-default versions of the policy; use the DetachPrincipalPolicy API to
  /// detach the policy from any certificate; and then use the DeletePolicy API
  /// to delete the policy.
  ///
  /// When a policy is deleted using DeletePolicy, its default version is
  /// deleted with it.
  ///
  /// May throw [DeleteConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to delete.
  Future<void> deletePolicy({
    @_s.required String policyName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified version of the specified policy. You cannot delete
  /// the default version of a policy using this API. To delete the default
  /// version of a policy, use <a>DeletePolicy</a>. To find out which version of
  /// a policy is marked as the default version, use ListPolicyVersions.
  ///
  /// May throw [DeleteConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// Parameter [policyVersionId] :
  /// The policy version ID.
  Future<void> deletePolicyVersion({
    @_s.required String policyName,
    @_s.required String policyVersionId,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyVersionId, 'policyVersionId');
    _s.validateStringPattern(
      'policyVersionId',
      policyVersionId,
      r'''[0-9]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/policies/${Uri.encodeComponent(policyName)}/version/${Uri.encodeComponent(policyVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a fleet provisioning template.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [DeleteConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingResourceUpdateException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provision template to delete.
  Future<void> deleteProvisioningTemplate({
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProvisioningTemplateResponse.fromJson(response);
  }

  /// Deletes a fleet provisioning template version.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  /// May throw [DeleteConflictException].
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provisioning template version to delete.
  ///
  /// Parameter [versionId] :
  /// The fleet provisioning template version ID to delete.
  Future<void> deleteProvisioningTemplateVersion({
    @_s.required String templateName,
    @_s.required int versionId,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions/${Uri.encodeComponent(versionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProvisioningTemplateVersionResponse.fromJson(response);
  }

  /// Deletes a CA certificate registration code.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<void> deleteRegistrationCode() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/registrationcode',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRegistrationCodeResponse.fromJson(response);
  }

  /// Deletes a role alias
  ///
  /// May throw [DeleteConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias to delete.
  Future<void> deleteRoleAlias({
    @_s.required String roleAlias,
  }) async {
    ArgumentError.checkNotNull(roleAlias, 'roleAlias');
    _s.validateStringLength(
      'roleAlias',
      roleAlias,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleAlias',
      roleAlias,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRoleAliasResponse.fromJson(response);
  }

  /// Deletes a scheduled audit.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [scheduledAuditName] :
  /// The name of the scheduled audit you want to delete.
  Future<void> deleteScheduledAudit({
    @_s.required String scheduledAuditName,
  }) async {
    ArgumentError.checkNotNull(scheduledAuditName, 'scheduledAuditName');
    _s.validateStringLength(
      'scheduledAuditName',
      scheduledAuditName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledAuditName',
      scheduledAuditName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteScheduledAuditResponse.fromJson(response);
  }

  /// Deletes a Device Defender security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [VersionConflictException].
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile to be deleted.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the security profile. A new version is generated
  /// whenever the security profile is updated. If you specify a value that is
  /// different from the actual version, a <code>VersionConflictException</code>
  /// is thrown.
  Future<void> deleteSecurityProfile({
    @_s.required String securityProfileName,
    int expectedVersion,
  }) async {
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSecurityProfileResponse.fromJson(response);
  }

  /// Deletes a stream.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [DeleteConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  Future<void> deleteStream({
    @_s.required String streamId,
  }) async {
    ArgumentError.checkNotNull(streamId, 'streamId');
    _s.validateStringLength(
      'streamId',
      streamId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamId',
      streamId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteStreamResponse.fromJson(response);
  }

  /// Deletes the specified thing. Returns successfully with no error if the
  /// deletion is successful or you specify a thing that doesn't exist.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [VersionConflictException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing to delete.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing record in the registry. If the version
  /// of the record in the registry does not match the expected version
  /// specified in the request, the <code>DeleteThing</code> request is rejected
  /// with a <code>VersionConflictException</code>.
  Future<void> deleteThing({
    @_s.required String thingName,
    int expectedVersion,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThingResponse.fromJson(response);
  }

  /// Deletes a thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the thing group to delete.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing group to delete.
  Future<void> deleteThingGroup({
    @_s.required String thingGroupName,
    int expectedVersion,
  }) async {
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThingGroupResponse.fromJson(response);
  }

  /// Deletes the specified thing type. You cannot delete a thing type if it has
  /// things associated with it. To delete a thing type, first mark it as
  /// deprecated by calling <a>DeprecateThingType</a>, then remove any
  /// associated things by calling <a>UpdateThing</a> to change the thing type
  /// on any associated thing, and finally use <a>DeleteThingType</a> to delete
  /// the thing type.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<void> deleteThingType({
    @_s.required String thingTypeName,
  }) async {
    ArgumentError.checkNotNull(thingTypeName, 'thingTypeName');
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/thing-types/${Uri.encodeComponent(thingTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteThingTypeResponse.fromJson(response);
  }

  /// Deletes the rule.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  Future<void> deleteTopicRule({
    @_s.required String ruleName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a topic rule destination.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [arn] :
  /// The ARN of the topic rule destination to delete.
  Future<void> deleteTopicRuleDestination({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/destinations/${arn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteTopicRuleDestinationResponse.fromJson(response);
  }

  /// Deletes a logging level.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [targetName] :
  /// The name of the resource for which you are configuring logging.
  ///
  /// Parameter [targetType] :
  /// The type of resource for which you are configuring logging. Must be
  /// <code>THING_Group</code>.
  Future<void> deleteV2LoggingLevel({
    @_s.required String targetName,
    @_s.required LogTargetType targetType,
  }) async {
    ArgumentError.checkNotNull(targetName, 'targetName');
    ArgumentError.checkNotNull(targetType, 'targetType');
    final $query = <String, List<String>>{
      if (targetName != null) 'targetName': [targetName],
      if (targetType != null) 'targetType': [targetType.toValue()],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v2LoggingLevel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deprecates a thing type. You can not associate new things with deprecated
  /// thing type.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type to deprecate.
  ///
  /// Parameter [undoDeprecate] :
  /// Whether to undeprecate a deprecated thing type. If <b>true</b>, the thing
  /// type will not be deprecated anymore and you can associate it with things.
  Future<void> deprecateThingType({
    @_s.required String thingTypeName,
    bool undoDeprecate,
  }) async {
    ArgumentError.checkNotNull(thingTypeName, 'thingTypeName');
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (undoDeprecate != null) 'undoDeprecate': undoDeprecate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/thing-types/${Uri.encodeComponent(thingTypeName)}/deprecate',
      exceptionFnMap: _exceptionFns,
    );
    return DeprecateThingTypeResponse.fromJson(response);
  }

  /// Gets information about the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  ///
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  Future<DescribeAccountAuditConfigurationResponse>
      describeAccountAuditConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAccountAuditConfigurationResponse.fromJson(response);
  }

  /// Gets information about a single audit finding. Properties include the
  /// reason for noncompliance, the severity of the issue, and the start time
  /// when the audit that returned the finding.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [findingId] :
  /// A unique identifier for a single audit finding. You can use this
  /// identifier to apply mitigation actions to the finding.
  Future<DescribeAuditFindingResponse> describeAuditFinding({
    @_s.required String findingId,
  }) async {
    ArgumentError.checkNotNull(findingId, 'findingId');
    _s.validateStringLength(
      'findingId',
      findingId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'findingId',
      findingId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/findings/${Uri.encodeComponent(findingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditFindingResponse.fromJson(response);
  }

  /// Gets information about an audit mitigation task that is used to apply
  /// mitigation actions to a set of audit findings. Properties include the
  /// actions being applied, the audit checks to which they're being applied,
  /// the task status, and aggregated task statistics.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier for the audit mitigation task.
  Future<DescribeAuditMitigationActionsTaskResponse>
      describeAuditMitigationActionsTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/audit/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditMitigationActionsTaskResponse.fromJson(response);
  }

  /// Gets information about a Device Defender audit suppression.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  Future<DescribeAuditSuppressionResponse> describeAuditSuppression({
    @_s.required String checkName,
    @_s.required ResourceIdentifier resourceIdentifier,
  }) async {
    ArgumentError.checkNotNull(checkName, 'checkName');
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'resourceIdentifier': resourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/describe',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditSuppressionResponse.fromJson(response);
  }

  /// Gets information about a Device Defender audit.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The ID of the audit whose information you want to get.
  Future<DescribeAuditTaskResponse> describeAuditTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      40,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9\-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuditTaskResponse.fromJson(response);
  }

  /// Describes an authorizer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerName] :
  /// The name of the authorizer to describe.
  Future<DescribeAuthorizerResponse> describeAuthorizer({
    @_s.required String authorizerName,
  }) async {
    ArgumentError.checkNotNull(authorizerName, 'authorizerName');
    _s.validateStringLength(
      'authorizerName',
      authorizerName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authorizerName',
      authorizerName,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAuthorizerResponse.fromJson(response);
  }

  /// Returns information about a billing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  Future<DescribeBillingGroupResponse> describeBillingGroup({
    @_s.required String billingGroupName,
  }) async {
    ArgumentError.checkNotNull(billingGroupName, 'billingGroupName');
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBillingGroupResponse.fromJson(response);
  }

  /// Describes a registered CA certificate.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The CA certificate identifier.
  Future<DescribeCACertificateResponse> describeCACertificate({
    @_s.required String certificateId,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cacertificate/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCACertificateResponse.fromJson(response);
  }

  /// Gets information about the specified certificate.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  Future<DescribeCertificateResponse> describeCertificate({
    @_s.required String certificateId,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCertificateResponse.fromJson(response);
  }

  /// Gets information about a Device Defender detect custom metric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric.
  Future<DescribeCustomMetricResponse> describeCustomMetric({
    @_s.required String metricName,
  }) async {
    ArgumentError.checkNotNull(metricName, 'metricName');
    _s.validateStringLength(
      'metricName',
      metricName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'metricName',
      metricName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCustomMetricResponse.fromJson(response);
  }

  /// Describes the default authorizer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<DescribeDefaultAuthorizerResponse> describeDefaultAuthorizer() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/default-authorizer',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDefaultAuthorizerResponse.fromJson(response);
  }

  /// Gets information about a Device Defender ML Detect mitigation action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  Future<DescribeDetectMitigationActionsTaskResponse>
      describeDetectMitigationActionsTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/detect/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDetectMitigationActionsTaskResponse.fromJson(response);
  }

  /// Provides details about a dimension that is defined in your AWS account.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// The unique identifier for the dimension.
  Future<DescribeDimensionResponse> describeDimension({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDimensionResponse.fromJson(response);
  }

  /// Gets summary information about a domain configuration.
  /// <note>
  /// The domain configuration feature is in public preview and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration.
  Future<DescribeDomainConfigurationResponse> describeDomainConfiguration({
    @_s.required String domainConfigurationName,
  }) async {
    ArgumentError.checkNotNull(
        domainConfigurationName, 'domainConfigurationName');
    _s.validateStringLength(
      'domainConfigurationName',
      domainConfigurationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainConfigurationName',
      domainConfigurationName,
      r'''[\w.:-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDomainConfigurationResponse.fromJson(response);
  }

  /// Returns a unique endpoint specific to the AWS account making the call.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [endpointType] :
  /// The endpoint type. Valid endpoint types include:
  ///
  /// <ul>
  /// <li>
  /// <code>iot:Data</code> - Returns a VeriSign signed data endpoint.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>iot:Data-ATS</code> - Returns an ATS signed data endpoint.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>iot:CredentialProvider</code> - Returns an AWS IoT credentials
  /// provider API endpoint.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// <code>iot:Jobs</code> - Returns an AWS IoT device management Jobs API
  /// endpoint.
  /// </li>
  /// </ul>
  /// We strongly recommend that customers use the newer
  /// <code>iot:Data-ATS</code> endpoint type to avoid issues related to the
  /// widespread distrust of Symantec certificate authorities.
  Future<DescribeEndpointResponse> describeEndpoint({
    String endpointType,
  }) async {
    _s.validateStringLength(
      'endpointType',
      endpointType,
      0,
      128,
    );
    final $query = <String, List<String>>{
      if (endpointType != null) 'endpointType': [endpointType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/endpoint',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEndpointResponse.fromJson(response);
  }

  /// Describes event configurations.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  Future<DescribeEventConfigurationsResponse>
      describeEventConfigurations() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/event-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEventConfigurationsResponse.fromJson(response);
  }

  /// Describes a search index.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [indexName] :
  /// The index name.
  Future<DescribeIndexResponse> describeIndex({
    @_s.required String indexName,
  }) async {
    ArgumentError.checkNotNull(indexName, 'indexName');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/indices/${Uri.encodeComponent(indexName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeIndexResponse.fromJson(response);
  }

  /// Describes a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  Future<DescribeJobResponse> describeJob({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobResponse.fromJson(response);
  }

  /// Describes a job execution.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [thingName] :
  /// The name of the thing on which the job execution is running.
  ///
  /// Parameter [executionNumber] :
  /// A string (consisting of the digits "0" through "9" which is used to
  /// specify a particular job execution on a particular device.
  Future<DescribeJobExecutionResponse> describeJobExecution({
    @_s.required String jobId,
    @_s.required String thingName,
    int executionNumber,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (executionNumber != null)
        'executionNumber': [executionNumber.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/things/${Uri.encodeComponent(thingName)}/jobs/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobExecutionResponse.fromJson(response);
  }

  /// Gets information about a mitigation action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// The friendly name that uniquely identifies the mitigation action.
  Future<DescribeMitigationActionResponse> describeMitigationAction({
    @_s.required String actionName,
  }) async {
    ArgumentError.checkNotNull(actionName, 'actionName');
    _s.validateStringLength(
      'actionName',
      actionName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionName',
      actionName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMitigationActionResponse.fromJson(response);
  }

  /// Returns information about a fleet provisioning template.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provisioning template.
  Future<DescribeProvisioningTemplateResponse> describeProvisioningTemplate({
    @_s.required String templateName,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProvisioningTemplateResponse.fromJson(response);
  }

  /// Returns information about a fleet provisioning template version.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The template name.
  ///
  /// Parameter [versionId] :
  /// The fleet provisioning template version ID.
  Future<DescribeProvisioningTemplateVersionResponse>
      describeProvisioningTemplateVersion({
    @_s.required String templateName,
    @_s.required int versionId,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionId, 'versionId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions/${Uri.encodeComponent(versionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProvisioningTemplateVersionResponse.fromJson(response);
  }

  /// Describes a role alias.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias to describe.
  Future<DescribeRoleAliasResponse> describeRoleAlias({
    @_s.required String roleAlias,
  }) async {
    ArgumentError.checkNotNull(roleAlias, 'roleAlias');
    _s.validateStringLength(
      'roleAlias',
      roleAlias,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleAlias',
      roleAlias,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRoleAliasResponse.fromJson(response);
  }

  /// Gets information about a scheduled audit.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [scheduledAuditName] :
  /// The name of the scheduled audit whose information you want to get.
  Future<DescribeScheduledAuditResponse> describeScheduledAudit({
    @_s.required String scheduledAuditName,
  }) async {
    ArgumentError.checkNotNull(scheduledAuditName, 'scheduledAuditName');
    _s.validateStringLength(
      'scheduledAuditName',
      scheduledAuditName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledAuditName',
      scheduledAuditName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScheduledAuditResponse.fromJson(response);
  }

  /// Gets information about a Device Defender security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile whose information you want to get.
  Future<DescribeSecurityProfileResponse> describeSecurityProfile({
    @_s.required String securityProfileName,
  }) async {
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSecurityProfileResponse.fromJson(response);
  }

  /// Gets information about a stream.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  Future<DescribeStreamResponse> describeStream({
    @_s.required String streamId,
  }) async {
    ArgumentError.checkNotNull(streamId, 'streamId');
    _s.validateStringLength(
      'streamId',
      streamId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamId',
      streamId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeStreamResponse.fromJson(response);
  }

  /// Gets information about the specified thing.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<DescribeThingResponse> describeThing({
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingResponse.fromJson(response);
  }

  /// Describe a thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the thing group.
  Future<DescribeThingGroupResponse> describeThingGroup({
    @_s.required String thingGroupName,
  }) async {
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingGroupResponse.fromJson(response);
  }

  /// Describes a bulk thing provisioning task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [taskId] :
  /// The task ID.
  Future<DescribeThingRegistrationTaskResponse> describeThingRegistrationTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      0,
      40,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-registration-tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingRegistrationTaskResponse.fromJson(response);
  }

  /// Gets information about the specified thing type.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<DescribeThingTypeResponse> describeThingType({
    @_s.required String thingTypeName,
  }) async {
    ArgumentError.checkNotNull(thingTypeName, 'thingTypeName');
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-types/${Uri.encodeComponent(thingTypeName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeThingTypeResponse.fromJson(response);
  }

  /// Detaches a policy from the specified target.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The policy to detach.
  ///
  /// Parameter [target] :
  /// The target from which the policy will be detached.
  Future<void> detachPolicy({
    @_s.required String policyName,
    @_s.required String target,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(target, 'target');
    final $payload = <String, dynamic>{
      'target': target,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/target-policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified policy from the specified certificate.
  ///
  /// <b>Note:</b> This API is deprecated. Please use <a>DetachPolicy</a>
  /// instead.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy to detach.
  ///
  /// Parameter [principal] :
  /// The principal.
  ///
  /// Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  @Deprecated('Deprecated')
  Future<void> detachPrincipalPolicy({
    @_s.required String policyName,
    @_s.required String principal,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    final headers = <String, String>{};
    principal?.let((v) => headers['x-amzn-iot-principal'] = v.toString());
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/principal-policies/${Uri.encodeComponent(policyName)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a Device Defender security profile from a thing group or
  /// from this account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The security profile that is detached.
  ///
  /// Parameter [securityProfileTargetArn] :
  /// The ARN of the thing group from which the security profile is detached.
  Future<void> detachSecurityProfile({
    @_s.required String securityProfileName,
    @_s.required String securityProfileTargetArn,
  }) async {
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        securityProfileTargetArn, 'securityProfileTargetArn');
    final $query = <String, List<String>>{
      if (securityProfileTargetArn != null)
        'securityProfileTargetArn': [securityProfileTargetArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DetachSecurityProfileResponse.fromJson(response);
  }

  /// Detaches the specified principal from the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  /// <note>
  /// This call is asynchronous. It might take several seconds for the
  /// detachment to propagate.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [principal] :
  /// If the principal is a certificate, this value must be ARN of the
  /// certificate. If the principal is an Amazon Cognito identity, this value
  /// must be the ID of the Amazon Cognito identity.
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  Future<void> detachThingPrincipal({
    @_s.required String principal,
    @_s.required String thingName,
  }) async {
    ArgumentError.checkNotNull(principal, 'principal');
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final headers = <String, String>{};
    principal?.let((v) => headers['x-amzn-principal'] = v.toString());
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/principals',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DetachThingPrincipalResponse.fromJson(response);
  }

  /// Disables the rule.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule to disable.
  Future<void> disableTopicRule({
    @_s.required String ruleName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}/disable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Enables the rule.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the topic rule to enable.
  Future<void> enableTopicRule({
    @_s.required String ruleName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}/enable',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a Device Defender's ML Detect Security Profile training model's
  /// status.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile.
  Future<GetBehaviorModelTrainingSummariesResponse>
      getBehaviorModelTrainingSummaries({
    int maxResults,
    String nextToken,
    String securityProfileName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (securityProfileName != null)
        'securityProfileName': [securityProfileName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/behavior-model-training/summaries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBehaviorModelTrainingSummariesResponse.fromJson(response);
  }

  /// Returns the approximate count of unique values that match the query.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The search query.
  ///
  /// Parameter [aggregationField] :
  /// The field to aggregate.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search.
  ///
  /// Parameter [queryVersion] :
  /// The query version.
  Future<GetCardinalityResponse> getCardinality({
    @_s.required String queryString,
    String aggregationField,
    String indexName,
    String queryVersion,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'aggregationField',
      aggregationField,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      128,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/cardinality',
      exceptionFnMap: _exceptionFns,
    );
    return GetCardinalityResponse.fromJson(response);
  }

  /// Gets a list of the policies that have an effect on the authorization
  /// behavior of the specified device when it connects to the AWS IoT device
  /// gateway.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [cognitoIdentityPoolId] :
  /// The Cognito identity pool ID.
  ///
  /// Parameter [principal] :
  /// The principal. Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  ///
  /// Parameter [thingName] :
  /// The thing name.
  Future<GetEffectivePoliciesResponse> getEffectivePolicies({
    String cognitoIdentityPoolId,
    String principal,
    String thingName,
  }) async {
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (thingName != null) 'thingName': [thingName],
    };
    final $payload = <String, dynamic>{
      if (cognitoIdentityPoolId != null)
        'cognitoIdentityPoolId': cognitoIdentityPoolId,
      if (principal != null) 'principal': principal,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/effective-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetEffectivePoliciesResponse.fromJson(response);
  }

  /// Gets the indexing configuration.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  Future<GetIndexingConfigurationResponse> getIndexingConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/indexing/config',
      exceptionFnMap: _exceptionFns,
    );
    return GetIndexingConfigurationResponse.fromJson(response);
  }

  /// Gets a job document.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  Future<GetJobDocumentResponse> getJobDocument({
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/job-document',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobDocumentResponse.fromJson(response);
  }

  /// Gets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use
  /// <code>GetV2LoggingOptions</code> instead.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  Future<GetLoggingOptionsResponse> getLoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/loggingOptions',
      exceptionFnMap: _exceptionFns,
    );
    return GetLoggingOptionsResponse.fromJson(response);
  }

  /// Gets an OTA update.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [otaUpdateId] :
  /// The OTA update ID.
  Future<GetOTAUpdateResponse> getOTAUpdate({
    @_s.required String otaUpdateId,
  }) async {
    ArgumentError.checkNotNull(otaUpdateId, 'otaUpdateId');
    _s.validateStringLength(
      'otaUpdateId',
      otaUpdateId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'otaUpdateId',
      otaUpdateId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/otaUpdates/${Uri.encodeComponent(otaUpdateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetOTAUpdateResponse.fromJson(response);
  }

  /// Groups the aggregated values that match the query into percentile
  /// groupings. The default percentile groupings are: 1,5,25,50,75,95,99,
  /// although you can specify your own when you call
  /// <code>GetPercentiles</code>. This function returns a value for each
  /// percentile group specified (or the default percentile groupings). The
  /// percentile group "1" contains the aggregated field value that occurs in
  /// approximately one percent of the values that match the query. The
  /// percentile group "5" contains the aggregated field value that occurs in
  /// approximately five percent of the values that match the query, and so on.
  /// The result is an approximation, the more values that match the query, the
  /// more accurate the percentile values.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The query string.
  ///
  /// Parameter [aggregationField] :
  /// The field to aggregate.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search.
  ///
  /// Parameter [percents] :
  /// The percentile groups returned.
  ///
  /// Parameter [queryVersion] :
  /// The query version.
  Future<GetPercentilesResponse> getPercentiles({
    @_s.required String queryString,
    String aggregationField,
    String indexName,
    List<double> percents,
    String queryVersion,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'aggregationField',
      aggregationField,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      128,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (indexName != null) 'indexName': indexName,
      if (percents != null) 'percents': percents,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/percentiles',
      exceptionFnMap: _exceptionFns,
    );
    return GetPercentilesResponse.fromJson(response);
  }

  /// Gets information about the specified policy with the policy document of
  /// the default version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  Future<GetPolicyResponse> getPolicy({
    @_s.required String policyName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Gets information about the specified policy version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The name of the policy.
  ///
  /// Parameter [policyVersionId] :
  /// The policy version ID.
  Future<GetPolicyVersionResponse> getPolicyVersion({
    @_s.required String policyName,
    @_s.required String policyVersionId,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyVersionId, 'policyVersionId');
    _s.validateStringPattern(
      'policyVersionId',
      policyVersionId,
      r'''[0-9]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/policies/${Uri.encodeComponent(policyName)}/version/${Uri.encodeComponent(policyVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyVersionResponse.fromJson(response);
  }

  /// Gets a registration code used to register a CA certificate with AWS IoT.
  ///
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  Future<GetRegistrationCodeResponse> getRegistrationCode() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/registrationcode',
      exceptionFnMap: _exceptionFns,
    );
    return GetRegistrationCodeResponse.fromJson(response);
  }

  /// Returns the count, average, sum, minimum, maximum, sum of squares,
  /// variance, and standard deviation for the specified aggregated field. If
  /// the aggregation field is of type <code>String</code>, only the count
  /// statistic is returned.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [InvalidAggregationException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The query used to search. You can specify "*" for the query string to get
  /// the count of all indexed things in your AWS account.
  ///
  /// Parameter [aggregationField] :
  /// The aggregation field name.
  ///
  /// Parameter [indexName] :
  /// The name of the index to search. The default value is
  /// <code>AWS_Things</code>.
  ///
  /// Parameter [queryVersion] :
  /// The version of the query used to search.
  Future<GetStatisticsResponse> getStatistics({
    @_s.required String queryString,
    String aggregationField,
    String indexName,
    String queryVersion,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'aggregationField',
      aggregationField,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      128,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (aggregationField != null) 'aggregationField': aggregationField,
      if (indexName != null) 'indexName': indexName,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/statistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetStatisticsResponse.fromJson(response);
  }

  /// Gets information about the rule.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  Future<GetTopicRuleResponse> getTopicRule({
    @_s.required String ruleName,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTopicRuleResponse.fromJson(response);
  }

  /// Gets information about a topic rule destination.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [arn] :
  /// The ARN of the topic rule destination.
  Future<GetTopicRuleDestinationResponse> getTopicRuleDestination({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/destinations/${arn.split('/').map(Uri.encodeComponent).join('/')}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTopicRuleDestinationResponse.fromJson(response);
  }

  /// Gets the fine grained logging options.
  ///
  /// May throw [InternalException].
  /// May throw [NotConfiguredException].
  /// May throw [ServiceUnavailableException].
  Future<GetV2LoggingOptionsResponse> getV2LoggingOptions() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2LoggingOptions',
      exceptionFnMap: _exceptionFns,
    );
    return GetV2LoggingOptionsResponse.fromJson(response);
  }

  /// Lists the active violations for a given Device Defender security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [behaviorCriteriaType] :
  /// The criteria for a behavior.
  ///
  /// Parameter [listSuppressedAlerts] :
  /// A list of all suppressed alerts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [securityProfileName] :
  /// The name of the Device Defender security profile for which violations are
  /// listed.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose active violations are listed.
  Future<ListActiveViolationsResponse> listActiveViolations({
    BehaviorCriteriaType behaviorCriteriaType,
    bool listSuppressedAlerts,
    int maxResults,
    String nextToken,
    String securityProfileName,
    String thingName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (behaviorCriteriaType != null)
        'behaviorCriteriaType': [behaviorCriteriaType.toValue()],
      if (listSuppressedAlerts != null)
        'listSuppressedAlerts': [listSuppressedAlerts.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (securityProfileName != null)
        'securityProfileName': [securityProfileName],
      if (thingName != null) 'thingName': [thingName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/active-violations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListActiveViolationsResponse.fromJson(response);
  }

  /// Lists the policies attached to the specified thing group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [target] :
  /// The group or principal for which the policies will be listed. Valid
  /// principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  ///
  /// Parameter [marker] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [recursive] :
  /// When true, recursively list attached policies.
  Future<ListAttachedPoliciesResponse> listAttachedPolicies({
    @_s.required String target,
    String marker,
    int pageSize,
    bool recursive,
  }) async {
    ArgumentError.checkNotNull(target, 'target');
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/attached-policies/${Uri.encodeComponent(target)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttachedPoliciesResponse.fromJson(response);
  }

  /// Lists the findings (results) of a Device Defender audit or of the audits
  /// performed during a specified time period. (Findings are retained for 90
  /// days.)
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [checkName] :
  /// A filter to limit results to the findings for the specified audit check.
  ///
  /// Parameter [endTime] :
  /// A filter to limit results to those found before the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [listSuppressedFindings] :
  /// Boolean flag indicating whether only the suppressed findings or the
  /// unsuppressed findings should be listed. If this parameter isn't provided,
  /// the response will list both suppressed and unsuppressed findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [resourceIdentifier] :
  /// Information identifying the noncompliant resource.
  ///
  /// Parameter [startTime] :
  /// A filter to limit results to those found after the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [taskId] :
  /// A filter to limit results to the audit with the specified ID. You must
  /// specify either the taskId or the startTime and endTime, but not both.
  Future<ListAuditFindingsResponse> listAuditFindings({
    String checkName,
    DateTime endTime,
    bool listSuppressedFindings,
    int maxResults,
    String nextToken,
    ResourceIdentifier resourceIdentifier,
    DateTime startTime,
    String taskId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      40,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9\-]+''',
    );
    final $payload = <String, dynamic>{
      if (checkName != null) 'checkName': checkName,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (listSuppressedFindings != null)
        'listSuppressedFindings': listSuppressedFindings,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceIdentifier != null) 'resourceIdentifier': resourceIdentifier,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (taskId != null) 'taskId': taskId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/findings',
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditFindingsResponse.fromJson(response);
  }

  /// Gets the status of audit mitigation action tasks that were executed.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [findingId] :
  /// Specify this filter to limit results to those that were applied to a
  /// specific audit finding.
  ///
  /// Parameter [taskId] :
  /// Specify this filter to limit results to actions for a specific audit
  /// mitigation actions task.
  ///
  /// Parameter [actionStatus] :
  /// Specify this filter to limit results to those with a specific status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListAuditMitigationActionsExecutionsResponse>
      listAuditMitigationActionsExecutions({
    @_s.required String findingId,
    @_s.required String taskId,
    AuditMitigationActionsExecutionStatus actionStatus,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(findingId, 'findingId');
    _s.validateStringLength(
      'findingId',
      findingId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'findingId',
      findingId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (findingId != null) 'findingId': [findingId],
      if (taskId != null) 'taskId': [taskId],
      if (actionStatus != null) 'actionStatus': [actionStatus.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/mitigationactions/executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditMitigationActionsExecutionsResponse.fromJson(response);
  }

  /// Gets a list of audit mitigation action tasks that match the specified
  /// filters.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// Specify this filter to limit results to tasks that were completed or
  /// canceled on or before a specific date and time.
  ///
  /// Parameter [startTime] :
  /// Specify this filter to limit results to tasks that began on or after a
  /// specific date and time.
  ///
  /// Parameter [auditTaskId] :
  /// Specify this filter to limit results to tasks that were applied to results
  /// for a specific audit.
  ///
  /// Parameter [findingId] :
  /// Specify this filter to limit results to tasks that were applied to a
  /// specific audit finding.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [taskStatus] :
  /// Specify this filter to limit results to tasks that are in a specific
  /// state.
  Future<ListAuditMitigationActionsTasksResponse>
      listAuditMitigationActionsTasks({
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    String auditTaskId,
    String findingId,
    int maxResults,
    String nextToken,
    AuditMitigationActionsTaskStatus taskStatus,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateStringLength(
      'auditTaskId',
      auditTaskId,
      1,
      40,
    );
    _s.validateStringPattern(
      'auditTaskId',
      auditTaskId,
      r'''[a-zA-Z0-9\-]+''',
    );
    _s.validateStringLength(
      'findingId',
      findingId,
      1,
      128,
    );
    _s.validateStringPattern(
      'findingId',
      findingId,
      r'''[a-zA-Z0-9_-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (auditTaskId != null) 'auditTaskId': [auditTaskId],
      if (findingId != null) 'findingId': [findingId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (taskStatus != null) 'taskStatus': [taskStatus.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/mitigationactions/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditMitigationActionsTasksResponse.fromJson(response);
  }

  /// Lists your Device Defender audit listings.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Determines whether suppressions are listed in ascending order by
  /// expiration date or not. If parameter isn't provided,
  /// <code>ascendingOrder=true</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListAuditSuppressionsResponse> listAuditSuppressions({
    bool ascendingOrder,
    String checkName,
    int maxResults,
    String nextToken,
    ResourceIdentifier resourceIdentifier,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $payload = <String, dynamic>{
      if (ascendingOrder != null) 'ascendingOrder': ascendingOrder,
      if (checkName != null) 'checkName': checkName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceIdentifier != null) 'resourceIdentifier': resourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/suppressions/list',
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditSuppressionsResponse.fromJson(response);
  }

  /// Lists the Device Defender audits that have been performed during a given
  /// time period.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time period. Audit information is retained for a
  /// limited time (90 days). Requesting a start time prior to what is retained
  /// results in an "InvalidRequestException".
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [taskStatus] :
  /// A filter to limit the output to audits with the specified completion
  /// status: can be one of "IN_PROGRESS", "COMPLETED", "FAILED", or "CANCELED".
  ///
  /// Parameter [taskType] :
  /// A filter to limit the output to the specified type of audit: can be one of
  /// "ON_DEMAND_AUDIT_TASK" or "SCHEDULED__AUDIT_TASK".
  Future<ListAuditTasksResponse> listAuditTasks({
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    int maxResults,
    String nextToken,
    AuditTaskStatus taskStatus,
    AuditTaskType taskType,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (taskStatus != null) 'taskStatus': [taskStatus.toValue()],
      if (taskType != null) 'taskType': [taskType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuditTasksResponse.fromJson(response);
  }

  /// Lists the authorizers registered in your account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Return the list of authorizers in ascending alphabetical order.
  ///
  /// Parameter [marker] :
  /// A marker used to get the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [status] :
  /// The status of the list authorizers request.
  Future<ListAuthorizersResponse> listAuthorizers({
    bool ascendingOrder,
    String marker,
    int pageSize,
    AuthorizerStatus status,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/authorizers/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAuthorizersResponse.fromJson(response);
  }

  /// Lists the billing groups you have created.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [namePrefixFilter] :
  /// Limit the results to billing groups whose names have the given prefix.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListBillingGroupsResponse> listBillingGroups({
    int maxResults,
    String namePrefixFilter,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'namePrefixFilter',
      namePrefixFilter,
      1,
      128,
    );
    _s.validateStringPattern(
      'namePrefixFilter',
      namePrefixFilter,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namePrefixFilter != null) 'namePrefixFilter': [namePrefixFilter],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/billing-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBillingGroupsResponse.fromJson(response);
  }

  /// Lists the CA certificates registered for your AWS account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Determines the order of the results.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListCACertificatesResponse> listCACertificates({
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/cacertificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCACertificatesResponse.fromJson(response);
  }

  /// Lists the certificates registered in your AWS account.
  ///
  /// The results are paginated with a default page size of 25. You can use the
  /// returned marker to retrieve additional results.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If True, the results are returned in
  /// ascending order, based on the creation date.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListCertificatesResponse> listCertificates({
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCertificatesResponse.fromJson(response);
  }

  /// List the device certificates signed by the specified CA certificate.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [caCertificateId] :
  /// The ID of the CA certificate. This operation will list all registered
  /// device certificate that were signed by this CA certificate.
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If True, the results are returned in
  /// ascending order, based on the creation date.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListCertificatesByCAResponse> listCertificatesByCA({
    @_s.required String caCertificateId,
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(caCertificateId, 'caCertificateId');
    _s.validateStringLength(
      'caCertificateId',
      caCertificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'caCertificateId',
      caCertificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates-by-ca/${Uri.encodeComponent(caCertificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCertificatesByCAResponse.fromJson(response);
  }

  /// Lists your Device Defender detect custom metrics.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListCustomMetricsResponse> listCustomMetrics({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomMetricsResponse.fromJson(response);
  }

  /// Lists mitigation actions executions for a Device Defender ML Detect
  /// Security Profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period for which ML Detect mitigation actions
  /// executions are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [startTime] :
  /// A filter to limit results to those found after the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  ///
  /// Parameter [thingName] :
  /// The name of the thing whose mitigation actions are listed.
  ///
  /// Parameter [violationId] :
  /// The unique identifier of the violation.
  Future<ListDetectMitigationActionsExecutionsResponse>
      listDetectMitigationActionsExecutions({
    DateTime endTime,
    int maxResults,
    String nextToken,
    DateTime startTime,
    String taskId,
    String thingName,
    String violationId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringLength(
      'violationId',
      violationId,
      1,
      128,
    );
    _s.validateStringPattern(
      'violationId',
      violationId,
      r'''[a-zA-Z0-9\-]+''',
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (taskId != null) 'taskId': [taskId],
      if (thingName != null) 'thingName': [thingName],
      if (violationId != null) 'violationId': [violationId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detect/mitigationactions/executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectMitigationActionsExecutionsResponse.fromJson(response);
  }

  /// List of Device Defender ML Detect mitigation actions tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end of the time period for which ML Detect mitigation actions tasks
  /// are returned.
  ///
  /// Parameter [startTime] :
  /// A filter to limit results to those found after the specified time. You
  /// must specify either the startTime and endTime or the taskId, but not both.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDetectMitigationActionsTasksResponse>
      listDetectMitigationActionsTasks({
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/detect/mitigationactions/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDetectMitigationActionsTasksResponse.fromJson(response);
  }

  /// List the set of dimensions that are defined for your AWS account.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to retrieve at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListDimensionsResponse> listDimensions({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/dimensions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDimensionsResponse.fromJson(response);
  }

  /// Gets a list of domain configurations for the user. This list is sorted
  /// alphabetically by domain configuration name.
  /// <note>
  /// The domain configuration feature is in public preview and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  ///
  /// Parameter [serviceType] :
  /// The type of service delivered by the endpoint.
  Future<ListDomainConfigurationsResponse> listDomainConfigurations({
    String marker,
    int pageSize,
    ServiceType serviceType,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
      if (serviceType != null) 'serviceType': [serviceType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/domainConfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDomainConfigurationsResponse.fromJson(response);
  }

  /// Lists the search indices.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token used to get the next set of results, or <code>null</code> if
  /// there are no additional results.
  Future<ListIndicesResponse> listIndices({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/indices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIndicesResponse.fromJson(response);
  }

  /// Lists the job executions for a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier you assigned to this job when it was created.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [status] :
  /// The status of the job.
  Future<ListJobExecutionsForJobResponse> listJobExecutionsForJob({
    @_s.required String jobId,
    int maxResults,
    String nextToken,
    JobExecutionStatus status,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobExecutionsForJobResponse.fromJson(response);
  }

  /// Lists the job executions for the specified thing.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to be returned per request.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following
  /// format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [status] :
  /// An optional filter that lets you search for jobs that have the specified
  /// status.
  Future<ListJobExecutionsForThingResponse> listJobExecutionsForThing({
    @_s.required String thingName,
    int maxResults,
    String namespaceId,
    String nextToken,
    JobExecutionStatus status,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'namespaceId',
      namespaceId,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobExecutionsForThingResponse.fromJson(response);
  }

  /// Lists jobs.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following
  /// format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next set of results.
  ///
  /// Parameter [status] :
  /// An optional filter that lets you search for jobs that have the specified
  /// status.
  ///
  /// Parameter [targetSelection] :
  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the
  /// job (SNAPSHOT). If continuous, the job may also be run on a thing when a
  /// change is detected in a target. For example, a job will run on a thing
  /// when the thing is added to a target group, even after the job was
  /// completed by all things originally in the group.
  ///
  /// Parameter [thingGroupId] :
  /// A filter that limits the returned jobs to those for the specified group.
  ///
  /// Parameter [thingGroupName] :
  /// A filter that limits the returned jobs to those for the specified group.
  Future<ListJobsResponse> listJobs({
    int maxResults,
    String namespaceId,
    String nextToken,
    JobStatus status,
    TargetSelection targetSelection,
    String thingGroupId,
    String thingGroupName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'namespaceId',
      namespaceId,
      r'''[a-zA-Z0-9_-]+''',
    );
    _s.validateStringLength(
      'thingGroupId',
      thingGroupId,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingGroupId',
      thingGroupId,
      r'''[a-zA-Z0-9\-]+''',
    );
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namespaceId != null) 'namespaceId': [namespaceId],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
      if (targetSelection != null)
        'targetSelection': [targetSelection.toValue()],
      if (thingGroupId != null) 'thingGroupId': [thingGroupId],
      if (thingGroupName != null) 'thingGroupName': [thingGroupName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// Gets a list of all mitigation actions that match the specified filter
  /// criteria.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionType] :
  /// Specify a value to limit the result to mitigation actions with a specific
  /// action type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListMitigationActionsResponse> listMitigationActions({
    MitigationActionType actionType,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (actionType != null) 'actionType': [actionType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/mitigationactions/actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMitigationActionsResponse.fromJson(response);
  }

  /// Lists OTA updates.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token used to retrieve the next set of results.
  ///
  /// Parameter [otaUpdateStatus] :
  /// The OTA update job status.
  Future<ListOTAUpdatesResponse> listOTAUpdates({
    int maxResults,
    String nextToken,
    OTAUpdateStatus otaUpdateStatus,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (otaUpdateStatus != null)
        'otaUpdateStatus': [otaUpdateStatus.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/otaUpdates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOTAUpdatesResponse.fromJson(response);
  }

  /// Lists certificates that are being transferred but not yet accepted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If True, the results are returned in
  /// ascending order, based on the creation date.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListOutgoingCertificatesResponse> listOutgoingCertificates({
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/certificates-out-going',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOutgoingCertificatesResponse.fromJson(response);
  }

  /// Lists your policies.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If true, the results are returned in
  /// ascending creation order.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  Future<ListPoliciesResponse> listPolicies({
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPoliciesResponse.fromJson(response);
  }

  /// Lists the principals associated with the specified policy.
  ///
  /// <b>Note:</b> This API is deprecated. Please use
  /// <a>ListTargetsForPolicy</a> instead.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If true, the results are returned in
  /// ascending creation order.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  @Deprecated('Deprecated')
  Future<ListPolicyPrincipalsResponse> listPolicyPrincipals({
    @_s.required String policyName,
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final headers = <String, String>{};
    policyName?.let((v) => headers['x-amzn-iot-policy'] = v.toString());
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policy-principals',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPolicyPrincipalsResponse.fromJson(response);
  }

  /// Lists the versions of the specified policy and identifies the default
  /// version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  Future<ListPolicyVersionsResponse> listPolicyVersions({
    @_s.required String policyName,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/policies/${Uri.encodeComponent(policyName)}/version',
      exceptionFnMap: _exceptionFns,
    );
    return ListPolicyVersionsResponse.fromJson(response);
  }

  /// Lists the policies attached to the specified principal. If you use an
  /// Cognito identity, the ID must be in <a
  /// href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetCredentialsForIdentity.html#API_GetCredentialsForIdentity_RequestSyntax">AmazonCognito
  /// Identity format</a>.
  ///
  /// <b>Note:</b> This API is deprecated. Please use
  /// <a>ListAttachedPolicies</a> instead.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [principal] :
  /// The principal. Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  ///
  /// Parameter [ascendingOrder] :
  /// Specifies the order for results. If true, results are returned in
  /// ascending creation order.
  ///
  /// Parameter [marker] :
  /// The marker for the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The result page size.
  @Deprecated('Deprecated')
  Future<ListPrincipalPoliciesResponse> listPrincipalPolicies({
    @_s.required String principal,
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(principal, 'principal');
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final headers = <String, String>{};
    principal?.let((v) => headers['x-amzn-iot-principal'] = v.toString());
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/principal-policies',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPrincipalPoliciesResponse.fromJson(response);
  }

  /// Lists the things associated with the specified principal. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [principal] :
  /// The principal.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListPrincipalThingsResponse> listPrincipalThings({
    @_s.required String principal,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(principal, 'principal');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final headers = <String, String>{};
    principal?.let((v) => headers['x-amzn-principal'] = v.toString());
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/principals/things',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListPrincipalThingsResponse.fromJson(response);
  }

  /// A list of fleet provisioning template versions.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provisioning template.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results.
  Future<ListProvisioningTemplateVersionsResponse>
      listProvisioningTemplateVersions({
    @_s.required String templateName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisioningTemplateVersionsResponse.fromJson(response);
  }

  /// Lists the fleet provisioning templates in your AWS account.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results.
  Future<ListProvisioningTemplatesResponse> listProvisioningTemplates({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/provisioning-templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisioningTemplatesResponse.fromJson(response);
  }

  /// Lists the role aliases registered in your account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Return the list of role aliases in ascending alphabetical order.
  ///
  /// Parameter [marker] :
  /// A marker used to get the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return at one time.
  Future<ListRoleAliasesResponse> listRoleAliases({
    bool ascendingOrder,
    String marker,
    int pageSize,
  }) async {
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/role-aliases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoleAliasesResponse.fromJson(response);
  }

  /// Lists all of your scheduled audits.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time. The default is 25.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListScheduledAuditsResponse> listScheduledAudits({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/scheduledaudits',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScheduledAuditsResponse.fromJson(response);
  }

  /// Lists the Device Defender security profiles you've created. You can filter
  /// security profiles by dimension or custom metric.
  /// <note>
  /// <code>dimensionName</code> and <code>metricName</code> cannot be used in
  /// the same request.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [dimensionName] :
  /// A filter to limit results to the security profiles that use the defined
  /// dimension. Cannot be used with <code>metricName</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric. Cannot be used with
  /// <code>dimensionName</code>.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListSecurityProfilesResponse> listSecurityProfiles({
    String dimensionName,
    int maxResults,
    String metricName,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'dimensionName',
      dimensionName,
      1,
      128,
    );
    _s.validateStringPattern(
      'dimensionName',
      dimensionName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'metricName',
      metricName,
      1,
      128,
    );
    _s.validateStringPattern(
      'metricName',
      metricName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (dimensionName != null) 'dimensionName': [dimensionName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (metricName != null) 'metricName': [metricName],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/security-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityProfilesResponse.fromJson(response);
  }

  /// Lists the Device Defender security profiles attached to a target (thing
  /// group).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [securityProfileTargetArn] :
  /// The ARN of the target (thing group) whose attached security profiles you
  /// want to get.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [recursive] :
  /// If true, return child groups too.
  Future<ListSecurityProfilesForTargetResponse> listSecurityProfilesForTarget({
    @_s.required String securityProfileTargetArn,
    int maxResults,
    String nextToken,
    bool recursive,
  }) async {
    ArgumentError.checkNotNull(
        securityProfileTargetArn, 'securityProfileTargetArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (securityProfileTargetArn != null)
        'securityProfileTargetArn': [securityProfileTargetArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/security-profiles-for-target',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityProfilesForTargetResponse.fromJson(response);
  }

  /// Lists all of the streams in your AWS account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [ascendingOrder] :
  /// Set to true to return the list of streams in ascending order.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at a time.
  ///
  /// Parameter [nextToken] :
  /// A token used to get the next set of results.
  Future<ListStreamsResponse> listStreams({
    bool ascendingOrder,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (ascendingOrder != null)
        'isAscendingOrder': [ascendingOrder.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/streams',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamsResponse.fromJson(response);
  }

  /// Lists the tags (metadata) you have assigned to the resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $query = <String, List<String>>{
      if (resourceArn != null) 'resourceArn': [resourceArn],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// List targets for the specified policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [marker] :
  /// A marker used to get the next set of results.
  ///
  /// Parameter [pageSize] :
  /// The maximum number of results to return at one time.
  Future<ListTargetsForPolicyResponse> listTargetsForPolicy({
    @_s.required String policyName,
    String marker,
    int pageSize,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'marker',
      marker,
      0,
      1024,
    );
    _s.validateStringPattern(
      'marker',
      marker,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'marker': [marker],
      if (pageSize != null) 'pageSize': [pageSize.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/policy-targets/${Uri.encodeComponent(policyName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetsForPolicyResponse.fromJson(response);
  }

  /// Lists the targets (thing groups) associated with a given Device Defender
  /// security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The security profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListTargetsForSecurityProfileResponse> listTargetsForSecurityProfile({
    @_s.required String securityProfileName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}/targets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTargetsForSecurityProfileResponse.fromJson(response);
  }

  /// List the thing groups in your account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [namePrefixFilter] :
  /// A filter that limits the results to those with the specified name prefix.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [parentGroup] :
  /// A filter that limits the results to those with the specified parent group.
  ///
  /// Parameter [recursive] :
  /// If true, return child groups as well.
  Future<ListThingGroupsResponse> listThingGroups({
    int maxResults,
    String namePrefixFilter,
    String nextToken,
    String parentGroup,
    bool recursive,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'namePrefixFilter',
      namePrefixFilter,
      1,
      128,
    );
    _s.validateStringPattern(
      'namePrefixFilter',
      namePrefixFilter,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'parentGroup',
      parentGroup,
      1,
      128,
    );
    _s.validateStringPattern(
      'parentGroup',
      parentGroup,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (namePrefixFilter != null) 'namePrefixFilter': [namePrefixFilter],
      if (nextToken != null) 'nextToken': [nextToken],
      if (parentGroup != null) 'parentGroup': [parentGroup],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingGroupsResponse.fromJson(response);
  }

  /// List the thing groups to which the specified thing belongs.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [thingName] :
  /// The thing name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingGroupsForThingResponse> listThingGroupsForThing({
    @_s.required String thingName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/thing-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingGroupsForThingResponse.fromJson(response);
  }

  /// Lists the principals associated with the specified thing. A principal can
  /// be X.509 certificates, IAM users, groups, and roles, Amazon Cognito
  /// identities or federated identities.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingPrincipalsResponse> listThingPrincipals({
    @_s.required String thingName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things/${Uri.encodeComponent(thingName)}/principals',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingPrincipalsResponse.fromJson(response);
  }

  /// Information about the thing registration tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [reportType] :
  /// The type of task report.
  ///
  /// Parameter [taskId] :
  /// The id of the task.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingRegistrationTaskReportsResponse>
      listThingRegistrationTaskReports({
    @_s.required ReportType reportType,
    @_s.required String taskId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(reportType, 'reportType');
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      0,
      40,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (reportType != null) 'reportType': [reportType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/thing-registration-tasks/${Uri.encodeComponent(taskId)}/reports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingRegistrationTaskReportsResponse.fromJson(response);
  }

  /// List bulk thing provisioning tasks.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [status] :
  /// The status of the bulk thing provisioning task.
  Future<ListThingRegistrationTasksResponse> listThingRegistrationTasks({
    int maxResults,
    String nextToken,
    Status status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-registration-tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingRegistrationTasksResponse.fromJson(response);
  }

  /// Lists the existing thing types.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<ListThingTypesResponse> listThingTypes({
    int maxResults,
    String nextToken,
    String thingTypeName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (thingTypeName != null) 'thingTypeName': [thingTypeName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-types',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingTypesResponse.fromJson(response);
  }

  /// Lists your things. Use the <b>attributeName</b> and <b>attributeValue</b>
  /// parameters to filter your things. For example, calling
  /// <code>ListThings</code> with attributeName=Color and attributeValue=Red
  /// retrieves all things in the registry that contain an attribute
  /// <b>Color</b> with the value <b>Red</b>.
  /// <note>
  /// You will not be charged for calling this API if an <code>Access
  /// denied</code> error is returned. You will also not be charged if no
  /// attributes or pagination token was provided in request and no pagination
  /// token and no results were returned.
  /// </note>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [attributeName] :
  /// The attribute name used to search for things.
  ///
  /// Parameter [attributeValue] :
  /// The attribute value used to search for things.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in this operation.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type used to search for things.
  Future<ListThingsResponse> listThings({
    String attributeName,
    String attributeValue,
    int maxResults,
    String nextToken,
    String thingTypeName,
  }) async {
    _s.validateStringLength(
      'attributeName',
      attributeName,
      0,
      128,
    );
    _s.validateStringPattern(
      'attributeName',
      attributeName,
      r'''[a-zA-Z0-9_.,@/:#-]+''',
    );
    _s.validateStringLength(
      'attributeValue',
      attributeValue,
      0,
      800,
    );
    _s.validateStringPattern(
      'attributeValue',
      attributeValue,
      r'''[a-zA-Z0-9_.,@/:#-]*''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $query = <String, List<String>>{
      if (attributeName != null) 'attributeName': [attributeName],
      if (attributeValue != null) 'attributeValue': [attributeValue],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (thingTypeName != null) 'thingTypeName': [thingTypeName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingsResponse.fromJson(response);
  }

  /// Lists the things you have added to the given billing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per request.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListThingsInBillingGroupResponse> listThingsInBillingGroup({
    @_s.required String billingGroupName,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(billingGroupName, 'billingGroupName');
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/billing-groups/${Uri.encodeComponent(billingGroupName)}/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingsInBillingGroupResponse.fromJson(response);
  }

  /// Lists the things in the specified group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [thingGroupName] :
  /// The thing group name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [recursive] :
  /// When true, list things in this thing group and in all child groups as
  /// well.
  Future<ListThingsInThingGroupResponse> listThingsInThingGroup({
    @_s.required String thingGroupName,
    int maxResults,
    String nextToken,
    bool recursive,
  }) async {
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (recursive != null) 'recursive': [recursive.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}/things',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListThingsInThingGroupResponse.fromJson(response);
  }

  /// Lists all the topic rule destinations in your AWS account.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  Future<ListTopicRuleDestinationsResponse> listTopicRuleDestinations({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/destinations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTopicRuleDestinationsResponse.fromJson(response);
  }

  /// Lists the rules for the specific topic.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [ruleDisabled] :
  /// Specifies whether the rule is disabled.
  ///
  /// Parameter [topic] :
  /// The topic.
  Future<ListTopicRulesResponse> listTopicRules({
    int maxResults,
    String nextToken,
    bool ruleDisabled,
    String topic,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (ruleDisabled != null) 'ruleDisabled': [ruleDisabled.toString()],
      if (topic != null) 'topic': [topic],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTopicRulesResponse.fromJson(response);
  }

  /// Lists logging levels.
  ///
  /// May throw [InternalException].
  /// May throw [NotConfiguredException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// To retrieve the next set of results, the <code>nextToken</code> value from
  /// a previous response; otherwise <b>null</b> to receive the first set of
  /// results.
  ///
  /// Parameter [targetType] :
  /// The type of resource for which you are configuring logging. Must be
  /// <code>THING_Group</code>.
  Future<ListV2LoggingLevelsResponse> listV2LoggingLevels({
    int maxResults,
    String nextToken,
    LogTargetType targetType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (targetType != null) 'targetType': [targetType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v2LoggingLevel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListV2LoggingLevelsResponse.fromJson(response);
  }

  /// Lists the Device Defender security profile violations discovered during
  /// the given time period. You can use filters to limit the results to those
  /// alerts issued for a particular security profile, behavior, or thing
  /// (device).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [endTime] :
  /// The end time for the alerts to be listed.
  ///
  /// Parameter [startTime] :
  /// The start time for the alerts to be listed.
  ///
  /// Parameter [behaviorCriteriaType] :
  /// The criteria for a behavior.
  ///
  /// Parameter [listSuppressedAlerts] :
  /// A list of all suppressed alerts.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [securityProfileName] :
  /// A filter to limit results to those alerts generated by the specified
  /// security profile.
  ///
  /// Parameter [thingName] :
  /// A filter to limit results to those alerts caused by the specified thing.
  Future<ListViolationEventsResponse> listViolationEvents({
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    BehaviorCriteriaType behaviorCriteriaType,
    bool listSuppressedAlerts,
    int maxResults,
    String nextToken,
    String securityProfileName,
    String thingName,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      250,
    );
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (behaviorCriteriaType != null)
        'behaviorCriteriaType': [behaviorCriteriaType.toValue()],
      if (listSuppressedAlerts != null)
        'listSuppressedAlerts': [listSuppressedAlerts.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (securityProfileName != null)
        'securityProfileName': [securityProfileName],
      if (thingName != null) 'thingName': [thingName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/violation-events',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListViolationEventsResponse.fromJson(response);
  }

  /// Registers a CA certificate with AWS IoT. This CA certificate can then be
  /// used to sign device certificates, which can be then registered with AWS
  /// IoT. You can register up to 10 CA certificates per AWS account that have
  /// the same subject field. This enables you to have up to 10 certificate
  /// authorities sign your device certificates. If you have more than one CA
  /// certificate registered, make sure you pass the CA certificate when you
  /// register your device certificates with the RegisterCertificate API.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [RegistrationCodeValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [CertificateValidationException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [caCertificate] :
  /// The CA certificate.
  ///
  /// Parameter [verificationCertificate] :
  /// The private key verification certificate.
  ///
  /// Parameter [allowAutoRegistration] :
  /// Allows this CA certificate to be used for auto registration of device
  /// certificates.
  ///
  /// Parameter [registrationConfig] :
  /// Information about the registration configuration.
  ///
  /// Parameter [setAsActive] :
  /// A boolean value that specifies if the CA certificate is set to active.
  ///
  /// Parameter [tags] :
  /// Metadata which can be used to manage the CA certificate.
  /// <note>
  /// For URI Request parameters use format: ...key1=value1&amp;key2=value2...
  ///
  /// For the CLI command-line parameter use format: &amp;&amp;tags
  /// "key1=value1&amp;key2=value2..."
  ///
  /// For the cli-input-json file use format: "tags":
  /// "key1=value1&amp;key2=value2..."
  /// </note>
  Future<RegisterCACertificateResponse> registerCACertificate({
    @_s.required String caCertificate,
    @_s.required String verificationCertificate,
    bool allowAutoRegistration,
    RegistrationConfig registrationConfig,
    bool setAsActive,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(caCertificate, 'caCertificate');
    _s.validateStringLength(
      'caCertificate',
      caCertificate,
      1,
      65536,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        verificationCertificate, 'verificationCertificate');
    _s.validateStringLength(
      'verificationCertificate',
      verificationCertificate,
      1,
      65536,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (allowAutoRegistration != null)
        'allowAutoRegistration': [allowAutoRegistration.toString()],
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final $payload = <String, dynamic>{
      'caCertificate': caCertificate,
      'verificationCertificate': verificationCertificate,
      if (registrationConfig != null) 'registrationConfig': registrationConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cacertificate',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RegisterCACertificateResponse.fromJson(response);
  }

  /// Registers a device certificate with AWS IoT. If you have more than one CA
  /// certificate that has the same subject field, you must specify the CA
  /// certificate that was used to sign the device certificate being registered.
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [CertificateValidationException].
  /// May throw [CertificateStateException].
  /// May throw [CertificateConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificatePem] :
  /// The certificate data, in PEM format.
  ///
  /// Parameter [caCertificatePem] :
  /// The CA certificate used to sign the device certificate being registered.
  ///
  /// Parameter [setAsActive] :
  /// A boolean value that specifies if the certificate is set to active.
  ///
  /// Parameter [status] :
  /// The status of the register certificate request.
  Future<RegisterCertificateResponse> registerCertificate({
    @_s.required String certificatePem,
    String caCertificatePem,
    bool setAsActive,
    CertificateStatus status,
  }) async {
    ArgumentError.checkNotNull(certificatePem, 'certificatePem');
    _s.validateStringLength(
      'certificatePem',
      certificatePem,
      1,
      65536,
      isRequired: true,
    );
    _s.validateStringLength(
      'caCertificatePem',
      caCertificatePem,
      1,
      65536,
    );
    final $query = <String, List<String>>{
      if (setAsActive != null) 'setAsActive': [setAsActive.toString()],
    };
    final $payload = <String, dynamic>{
      'certificatePem': certificatePem,
      if (caCertificatePem != null) 'caCertificatePem': caCertificatePem,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/certificate/register',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RegisterCertificateResponse.fromJson(response);
  }

  /// Register a certificate that does not have a certificate authority (CA).
  ///
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidRequestException].
  /// May throw [CertificateStateException].
  /// May throw [CertificateValidationException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificatePem] :
  /// The certificate data, in PEM format.
  ///
  /// Parameter [status] :
  /// The status of the register certificate request.
  Future<RegisterCertificateWithoutCAResponse> registerCertificateWithoutCA({
    @_s.required String certificatePem,
    CertificateStatus status,
  }) async {
    ArgumentError.checkNotNull(certificatePem, 'certificatePem');
    _s.validateStringLength(
      'certificatePem',
      certificatePem,
      1,
      65536,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'certificatePem': certificatePem,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/certificate/register-no-ca',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterCertificateWithoutCAResponse.fromJson(response);
  }

  /// Provisions a thing in the device registry. RegisterThing calls other AWS
  /// IoT control plane APIs. These calls might exceed your account level <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits_iot">
  /// AWS IoT Throttling Limits</a> and cause throttle errors. Please contact <a
  /// href="https://console.aws.amazon.com/support/home">AWS Customer
  /// Support</a> to raise your throttling limits if necessary.
  ///
  /// May throw [InternalFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [UnauthorizedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictingResourceUpdateException].
  /// May throw [ResourceRegistrationFailureException].
  ///
  /// Parameter [templateBody] :
  /// The provisioning template. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-w-cert.html">Provisioning
  /// Devices That Have Device Certificates</a> for more information.
  ///
  /// Parameter [parameters] :
  /// The parameters for provisioning a thing. See <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/provision-template.html">Provisioning
  /// Templates</a> for more information.
  Future<RegisterThingResponse> registerThing({
    @_s.required String templateBody,
    Map<String, String> parameters,
  }) async {
    ArgumentError.checkNotNull(templateBody, 'templateBody');
    final $payload = <String, dynamic>{
      'templateBody': templateBody,
      if (parameters != null) 'parameters': parameters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/things',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterThingResponse.fromJson(response);
  }

  /// Rejects a pending certificate transfer. After AWS IoT rejects a
  /// certificate transfer, the certificate status changes from
  /// <b>PENDING_TRANSFER</b> to <b>INACTIVE</b>.
  ///
  /// To check for pending certificate transfers, call <a>ListCertificates</a>
  /// to enumerate your certificates.
  ///
  /// This operation can only be called by the transfer destination. After it is
  /// called, the certificate will be returned to the source's account in the
  /// INACTIVE state.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TransferAlreadyCompletedException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [rejectReason] :
  /// The reason the certificate transfer was rejected.
  Future<void> rejectCertificateTransfer({
    @_s.required String certificateId,
    String rejectReason,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'rejectReason',
      rejectReason,
      0,
      128,
    );
    final $payload = <String, dynamic>{
      if (rejectReason != null) 'rejectReason': rejectReason,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/reject-certificate-transfer/${Uri.encodeComponent(certificateId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the given thing from the billing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupArn] :
  /// The ARN of the billing group.
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to be removed from the billing group.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to be removed from the billing group.
  Future<void> removeThingFromBillingGroup({
    String billingGroupArn,
    String billingGroupName,
    String thingArn,
    String thingName,
  }) async {
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (billingGroupArn != null) 'billingGroupArn': billingGroupArn,
      if (billingGroupName != null) 'billingGroupName': billingGroupName,
      if (thingArn != null) 'thingArn': thingArn,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/billing-groups/removeThingFromBillingGroup',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveThingFromBillingGroupResponse.fromJson(response);
  }

  /// Remove the specified thing from the specified group.
  ///
  /// You must specify either a <code>thingGroupArn</code> or a
  /// <code>thingGroupName</code> to identify the thing group and either a
  /// <code>thingArn</code> or a <code>thingName</code> to identify the thing to
  /// remove from the thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingArn] :
  /// The ARN of the thing to remove from the group.
  ///
  /// Parameter [thingGroupArn] :
  /// The group ARN.
  ///
  /// Parameter [thingGroupName] :
  /// The group name.
  ///
  /// Parameter [thingName] :
  /// The name of the thing to remove from the group.
  Future<void> removeThingFromThingGroup({
    String thingArn,
    String thingGroupArn,
    String thingGroupName,
    String thingName,
  }) async {
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (thingArn != null) 'thingArn': thingArn,
      if (thingGroupArn != null) 'thingGroupArn': thingGroupArn,
      if (thingGroupName != null) 'thingGroupName': thingGroupName,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/thing-groups/removeThingFromThingGroup',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveThingFromThingGroupResponse.fromJson(response);
  }

  /// Replaces the rule. You must specify all parameters for the new rule.
  /// Creating rules is an administrator-level action. Any user who has
  /// permission to create rules will be able to access data processed by the
  /// rule.
  ///
  /// May throw [SqlParseException].
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [ruleName] :
  /// The name of the rule.
  ///
  /// Parameter [topicRulePayload] :
  /// The rule payload.
  Future<void> replaceTopicRule({
    @_s.required String ruleName,
    @_s.required TopicRulePayload topicRulePayload,
  }) async {
    ArgumentError.checkNotNull(ruleName, 'ruleName');
    _s.validateStringLength(
      'ruleName',
      ruleName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'ruleName',
      ruleName,
      r'''^[a-zA-Z0-9_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(topicRulePayload, 'topicRulePayload');
    await _protocol.send(
      payload: topicRulePayload,
      method: 'PATCH',
      requestUri: '/rules/${Uri.encodeComponent(ruleName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The query search index.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  /// May throw [IndexNotReadyException].
  ///
  /// Parameter [queryString] :
  /// The search query string.
  ///
  /// Parameter [indexName] :
  /// The search index name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at one time.
  ///
  /// Parameter [nextToken] :
  /// The token used to get the next set of results, or <code>null</code> if
  /// there are no additional results.
  ///
  /// Parameter [queryVersion] :
  /// The query version.
  Future<SearchIndexResponse> searchIndex({
    @_s.required String queryString,
    String indexName,
    int maxResults,
    String nextToken,
    String queryVersion,
  }) async {
    ArgumentError.checkNotNull(queryString, 'queryString');
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      128,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'queryString': queryString,
      if (indexName != null) 'indexName': indexName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indices/search',
      exceptionFnMap: _exceptionFns,
    );
    return SearchIndexResponse.fromJson(response);
  }

  /// Sets the default authorizer. This will be used if a websocket connection
  /// is made without specifying an authorizer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [authorizerName] :
  /// The authorizer name.
  Future<SetDefaultAuthorizerResponse> setDefaultAuthorizer({
    @_s.required String authorizerName,
  }) async {
    ArgumentError.checkNotNull(authorizerName, 'authorizerName');
    _s.validateStringLength(
      'authorizerName',
      authorizerName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authorizerName',
      authorizerName,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'authorizerName': authorizerName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/default-authorizer',
      exceptionFnMap: _exceptionFns,
    );
    return SetDefaultAuthorizerResponse.fromJson(response);
  }

  /// Sets the specified version of the specified policy as the policy's default
  /// (operative) version. This action affects all certificates to which the
  /// policy is attached. To list the principals the policy is attached to, use
  /// the ListPrincipalPolicy API.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [policyName] :
  /// The policy name.
  ///
  /// Parameter [policyVersionId] :
  /// The policy version ID.
  Future<void> setDefaultPolicyVersion({
    @_s.required String policyName,
    @_s.required String policyVersionId,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\w+=,.@-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policyVersionId, 'policyVersionId');
    _s.validateStringPattern(
      'policyVersionId',
      policyVersionId,
      r'''[0-9]+''',
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'PATCH',
      requestUri:
          '/policies/${Uri.encodeComponent(policyName)}/version/${Uri.encodeComponent(policyVersionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the logging options.
  ///
  /// NOTE: use of this command is not recommended. Use
  /// <code>SetV2LoggingOptions</code> instead.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [loggingOptionsPayload] :
  /// The logging options payload.
  Future<void> setLoggingOptions({
    @_s.required LoggingOptionsPayload loggingOptionsPayload,
  }) async {
    ArgumentError.checkNotNull(loggingOptionsPayload, 'loggingOptionsPayload');
    await _protocol.send(
      payload: loggingOptionsPayload,
      method: 'POST',
      requestUri: '/loggingOptions',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the logging level.
  ///
  /// May throw [InternalException].
  /// May throw [NotConfiguredException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [logLevel] :
  /// The log level.
  ///
  /// Parameter [logTarget] :
  /// The log target.
  Future<void> setV2LoggingLevel({
    @_s.required LogLevel logLevel,
    @_s.required LogTarget logTarget,
  }) async {
    ArgumentError.checkNotNull(logLevel, 'logLevel');
    ArgumentError.checkNotNull(logTarget, 'logTarget');
    final $payload = <String, dynamic>{
      'logLevel': logLevel?.toValue() ?? '',
      'logTarget': logTarget,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2LoggingLevel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the logging options for the V2 logging service.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [defaultLogLevel] :
  /// The default logging level.
  ///
  /// Parameter [disableAllLogs] :
  /// If true all logs are disabled. The default is false.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that allows IoT to write to Cloudwatch logs.
  Future<void> setV2LoggingOptions({
    LogLevel defaultLogLevel,
    bool disableAllLogs,
    String roleArn,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultLogLevel != null) 'defaultLogLevel': defaultLogLevel.toValue(),
      if (disableAllLogs != null) 'disableAllLogs': disableAllLogs,
      if (roleArn != null) 'roleArn': roleArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v2LoggingOptions',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a task that applies a set of mitigation actions to the specified
  /// target.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TaskAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [auditCheckToActionsMapping] :
  /// For an audit check, specifies which mitigation actions to apply. Those
  /// actions must be defined in your AWS account.
  ///
  /// Parameter [clientRequestToken] :
  /// Each audit mitigation task must have a unique client request token. If you
  /// try to start a new task with the same token as a task that already exists,
  /// an exception occurs. If you omit this value, a unique client request token
  /// is generated automatically.
  ///
  /// Parameter [target] :
  /// Specifies the audit findings to which the mitigation actions are applied.
  /// You can apply them to a type of audit check, to all findings from an
  /// audit, or to a specific set of findings.
  ///
  /// Parameter [taskId] :
  /// A unique identifier for the task. You can use this identifier to check the
  /// status of the task or to cancel it.
  Future<StartAuditMitigationActionsTaskResponse>
      startAuditMitigationActionsTask({
    @_s.required Map<String, List<String>> auditCheckToActionsMapping,
    @_s.required String clientRequestToken,
    @_s.required AuditMitigationActionsTaskTarget target,
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(
        auditCheckToActionsMapping, 'auditCheckToActionsMapping');
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(target, 'target');
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'auditCheckToActionsMapping': auditCheckToActionsMapping,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'target': target,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/audit/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartAuditMitigationActionsTaskResponse.fromJson(response);
  }

  /// Starts a Device Defender ML Detect mitigation actions task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TaskAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actions] :
  /// The actions to be performed when a device has unexpected behavior.
  ///
  /// Parameter [clientRequestToken] :
  /// Each mitigation action task must have a unique client request token. If
  /// you try to create a new task with the same token as a task that already
  /// exists, an exception occurs. If you omit this value, AWS SDKs will
  /// automatically generate a unique client request.
  ///
  /// Parameter [target] :
  /// Specifies the ML Detect findings to which the mitigation actions are
  /// applied.
  ///
  /// Parameter [taskId] :
  /// The unique identifier of the task.
  ///
  /// Parameter [includeOnlyActiveViolations] :
  /// Specifies to list only active violations.
  ///
  /// Parameter [includeSuppressedAlerts] :
  /// Specifies to include suppressed alerts.
  ///
  /// Parameter [violationEventOccurrenceRange] :
  /// Specifies the time period of which violation events occurred between.
  Future<StartDetectMitigationActionsTaskResponse>
      startDetectMitigationActionsTask({
    @_s.required List<String> actions,
    @_s.required String clientRequestToken,
    @_s.required DetectMitigationActionsTaskTarget target,
    @_s.required String taskId,
    bool includeOnlyActiveViolations,
    bool includeSuppressedAlerts,
    ViolationEventOccurrenceRange violationEventOccurrenceRange,
  }) async {
    ArgumentError.checkNotNull(actions, 'actions');
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(target, 'target');
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'actions': actions,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'target': target,
      if (includeOnlyActiveViolations != null)
        'includeOnlyActiveViolations': includeOnlyActiveViolations,
      if (includeSuppressedAlerts != null)
        'includeSuppressedAlerts': includeSuppressedAlerts,
      if (violationEventOccurrenceRange != null)
        'violationEventOccurrenceRange': violationEventOccurrenceRange,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/detect/mitigationactions/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartDetectMitigationActionsTaskResponse.fromJson(response);
  }

  /// Starts an on-demand Device Defender audit.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [targetCheckNames] :
  /// Which checks are performed during the audit. The checks you specify must
  /// be enabled for your account or an exception occurs. Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.
  Future<StartOnDemandAuditTaskResponse> startOnDemandAuditTask({
    @_s.required List<String> targetCheckNames,
  }) async {
    ArgumentError.checkNotNull(targetCheckNames, 'targetCheckNames');
    final $payload = <String, dynamic>{
      'targetCheckNames': targetCheckNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/tasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartOnDemandAuditTaskResponse.fromJson(response);
  }

  /// Creates a bulk thing provisioning task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [inputFileBucket] :
  /// The S3 bucket that contains the input file.
  ///
  /// Parameter [inputFileKey] :
  /// The name of input file within the S3 bucket. This file contains a newline
  /// delimited JSON file. Each line contains the parameter values to provision
  /// one device (thing).
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that grants permission the input file.
  ///
  /// Parameter [templateBody] :
  /// The provisioning template.
  Future<StartThingRegistrationTaskResponse> startThingRegistrationTask({
    @_s.required String inputFileBucket,
    @_s.required String inputFileKey,
    @_s.required String roleArn,
    @_s.required String templateBody,
  }) async {
    ArgumentError.checkNotNull(inputFileBucket, 'inputFileBucket');
    _s.validateStringLength(
      'inputFileBucket',
      inputFileBucket,
      3,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputFileBucket',
      inputFileBucket,
      r'''[a-zA-Z0-9._-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputFileKey, 'inputFileKey');
    _s.validateStringLength(
      'inputFileKey',
      inputFileKey,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'inputFileKey',
      inputFileKey,
      r'''[a-zA-Z0-9!_.*'()-\/]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(templateBody, 'templateBody');
    final $payload = <String, dynamic>{
      'inputFileBucket': inputFileBucket,
      'inputFileKey': inputFileKey,
      'roleArn': roleArn,
      'templateBody': templateBody,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/thing-registration-tasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartThingRegistrationTaskResponse.fromJson(response);
  }

  /// Cancels a bulk thing provisioning task.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [taskId] :
  /// The bulk thing provisioning task ID.
  Future<void> stopThingRegistrationTask({
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringLength(
      'taskId',
      taskId,
      0,
      40,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/thing-registration-tasks/${Uri.encodeComponent(taskId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return StopThingRegistrationTaskResponse.fromJson(response);
  }

  /// Adds to or modifies the tags of the given resource. Tags are metadata
  /// which can be used to manage a resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The new or modified tags for the resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Tests if a specified principal is authorized to perform an AWS IoT action
  /// on a specified resource. Use this to test and debug the authorization
  /// behavior of devices that connect to the AWS IoT device gateway.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [authInfos] :
  /// A list of authorization info objects. Simulating authorization will create
  /// a response for each <code>authInfo</code> object in the list.
  ///
  /// Parameter [clientId] :
  /// The MQTT client ID.
  ///
  /// Parameter [cognitoIdentityPoolId] :
  /// The Cognito identity pool ID.
  ///
  /// Parameter [policyNamesToAdd] :
  /// When testing custom authorization, the policies specified here are treated
  /// as if they are attached to the principal being authorized.
  ///
  /// Parameter [policyNamesToSkip] :
  /// When testing custom authorization, the policies specified here are treated
  /// as if they are not attached to the principal being authorized.
  ///
  /// Parameter [principal] :
  /// The principal. Valid principals are CertificateArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:cert/<i>certificateId</i>),
  /// thingGroupArn
  /// (arn:aws:iot:<i>region</i>:<i>accountId</i>:thinggroup/<i>groupName</i>)
  /// and CognitoId (<i>region</i>:<i>id</i>).
  Future<TestAuthorizationResponse> testAuthorization({
    @_s.required List<AuthInfo> authInfos,
    String clientId,
    String cognitoIdentityPoolId,
    List<String> policyNamesToAdd,
    List<String> policyNamesToSkip,
    String principal,
  }) async {
    ArgumentError.checkNotNull(authInfos, 'authInfos');
    final $query = <String, List<String>>{
      if (clientId != null) 'clientId': [clientId],
    };
    final $payload = <String, dynamic>{
      'authInfos': authInfos,
      if (cognitoIdentityPoolId != null)
        'cognitoIdentityPoolId': cognitoIdentityPoolId,
      if (policyNamesToAdd != null) 'policyNamesToAdd': policyNamesToAdd,
      if (policyNamesToSkip != null) 'policyNamesToSkip': policyNamesToSkip,
      if (principal != null) 'principal': principal,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/test-authorization',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return TestAuthorizationResponse.fromJson(response);
  }

  /// Tests a custom authorization behavior by invoking a specified custom
  /// authorizer. Use this to test and debug the custom authorization behavior
  /// of devices that connect to the AWS IoT device gateway.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [InvalidResponseException].
  ///
  /// Parameter [authorizerName] :
  /// The custom authorizer name.
  ///
  /// Parameter [httpContext] :
  /// Specifies a test HTTP authorization request.
  ///
  /// Parameter [mqttContext] :
  /// Specifies a test MQTT authorization request.
  ///
  /// Parameter [tlsContext] :
  /// Specifies a test TLS authorization request.
  ///
  /// Parameter [token] :
  /// The token returned by your custom authentication service.
  ///
  /// Parameter [tokenSignature] :
  /// The signature made with the token and your custom authentication service's
  /// private key. This value must be Base-64-encoded.
  Future<TestInvokeAuthorizerResponse> testInvokeAuthorizer({
    @_s.required String authorizerName,
    HttpContext httpContext,
    MqttContext mqttContext,
    TlsContext tlsContext,
    String token,
    String tokenSignature,
  }) async {
    ArgumentError.checkNotNull(authorizerName, 'authorizerName');
    _s.validateStringLength(
      'authorizerName',
      authorizerName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authorizerName',
      authorizerName,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'token',
      token,
      1,
      6144,
    );
    _s.validateStringLength(
      'tokenSignature',
      tokenSignature,
      1,
      2560,
    );
    _s.validateStringPattern(
      'tokenSignature',
      tokenSignature,
      r'''[A-Za-z0-9+/]+={0,2}''',
    );
    final $payload = <String, dynamic>{
      if (httpContext != null) 'httpContext': httpContext,
      if (mqttContext != null) 'mqttContext': mqttContext,
      if (tlsContext != null) 'tlsContext': tlsContext,
      if (token != null) 'token': token,
      if (tokenSignature != null) 'tokenSignature': tokenSignature,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}/test',
      exceptionFnMap: _exceptionFns,
    );
    return TestInvokeAuthorizerResponse.fromJson(response);
  }

  /// Transfers the specified certificate to the specified AWS account.
  ///
  /// You can cancel the transfer until it is acknowledged by the recipient.
  ///
  /// No notification is sent to the transfer destination's account. It is up to
  /// the caller to notify the transfer target.
  ///
  /// The certificate being transferred must not be in the ACTIVE state. You can
  /// use the UpdateCertificate API to deactivate it.
  ///
  /// The certificate must not have any policies attached to it. You can use the
  /// DetachPrincipalPolicy API to detach them.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [CertificateStateException].
  /// May throw [TransferConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [targetAwsAccount] :
  /// The AWS account.
  ///
  /// Parameter [transferMessage] :
  /// The transfer message.
  Future<TransferCertificateResponse> transferCertificate({
    @_s.required String certificateId,
    @_s.required String targetAwsAccount,
    String transferMessage,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetAwsAccount, 'targetAwsAccount');
    _s.validateStringLength(
      'targetAwsAccount',
      targetAwsAccount,
      12,
      12,
      isRequired: true,
    );
    _s.validateStringPattern(
      'targetAwsAccount',
      targetAwsAccount,
      r'''[0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'transferMessage',
      transferMessage,
      0,
      128,
    );
    final $query = <String, List<String>>{
      if (targetAwsAccount != null) 'targetAwsAccount': [targetAwsAccount],
    };
    final $payload = <String, dynamic>{
      if (transferMessage != null) 'transferMessage': transferMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/transfer-certificate/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return TransferCertificateResponse.fromJson(response);
  }

  /// Removes the given tags (metadata) from the resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// A list of the keys of the tags to be removed from the resource.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untag',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Configures or reconfigures the Device Defender audit settings for this
  /// account. Settings include how audit notifications are sent and which audit
  /// checks are enabled or disabled.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [auditCheckConfigurations] :
  /// Specifies which audit checks are enabled and disabled for this account.
  /// Use <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are currently enabled.
  ///
  /// Some data collection might start immediately when certain checks are
  /// enabled. When a check is disabled, any data collected so far in relation
  /// to the check is deleted.
  ///
  /// You cannot disable a check if it's used by any scheduled audit. You must
  /// first delete the check from the scheduled audit or delete the scheduled
  /// audit itself.
  ///
  /// On the first call to <code>UpdateAccountAuditConfiguration</code>, this
  /// parameter is required and must specify at least one enabled check.
  ///
  /// Parameter [auditNotificationTargetConfigurations] :
  /// Information about the targets to which audit notifications are sent.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role that grants permission to AWS
  /// IoT to access information about your devices, policies, certificates, and
  /// other items as required when performing an audit.
  Future<void> updateAccountAuditConfiguration({
    Map<String, AuditCheckConfiguration> auditCheckConfigurations,
    Map<AuditNotificationType, AuditNotificationTarget>
        auditNotificationTargetConfigurations,
    String roleArn,
  }) async {
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (auditCheckConfigurations != null)
        'auditCheckConfigurations': auditCheckConfigurations,
      if (auditNotificationTargetConfigurations != null)
        'auditNotificationTargetConfigurations':
            auditNotificationTargetConfigurations
                .map((k, e) => MapEntry(k.toValue(), e)),
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/audit/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountAuditConfigurationResponse.fromJson(response);
  }

  /// Updates a Device Defender audit suppression.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [description] :
  /// The description of the audit suppression.
  ///
  /// Parameter [expirationDate] :
  /// The expiration date (epoch timestamp in seconds) that you want the
  /// suppression to adhere to.
  ///
  /// Parameter [suppressIndefinitely] :
  /// Indicates whether a suppression should exist indefinitely or not.
  Future<void> updateAuditSuppression({
    @_s.required String checkName,
    @_s.required ResourceIdentifier resourceIdentifier,
    String description,
    DateTime expirationDate,
    bool suppressIndefinitely,
  }) async {
    ArgumentError.checkNotNull(checkName, 'checkName');
    ArgumentError.checkNotNull(resourceIdentifier, 'resourceIdentifier');
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\p{Graph}\x20]*''',
    );
    final $payload = <String, dynamic>{
      'checkName': checkName,
      'resourceIdentifier': resourceIdentifier,
      if (description != null) 'description': description,
      if (expirationDate != null)
        'expirationDate': unixTimestampToJson(expirationDate),
      if (suppressIndefinitely != null)
        'suppressIndefinitely': suppressIndefinitely,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/audit/suppressions/update',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAuditSuppressionResponse.fromJson(response);
  }

  /// Updates an authorizer.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [authorizerName] :
  /// The authorizer name.
  ///
  /// Parameter [authorizerFunctionArn] :
  /// The ARN of the authorizer's Lambda function.
  ///
  /// Parameter [status] :
  /// The status of the update authorizer request.
  ///
  /// Parameter [tokenKeyName] :
  /// The key used to extract the token from the HTTP headers.
  ///
  /// Parameter [tokenSigningPublicKeys] :
  /// The public keys used to verify the token signature.
  Future<UpdateAuthorizerResponse> updateAuthorizer({
    @_s.required String authorizerName,
    String authorizerFunctionArn,
    AuthorizerStatus status,
    String tokenKeyName,
    Map<String, String> tokenSigningPublicKeys,
  }) async {
    ArgumentError.checkNotNull(authorizerName, 'authorizerName');
    _s.validateStringLength(
      'authorizerName',
      authorizerName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'authorizerName',
      authorizerName,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'authorizerFunctionArn',
      authorizerFunctionArn,
      0,
      2048,
    );
    _s.validateStringLength(
      'tokenKeyName',
      tokenKeyName,
      1,
      128,
    );
    _s.validateStringPattern(
      'tokenKeyName',
      tokenKeyName,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $payload = <String, dynamic>{
      if (authorizerFunctionArn != null)
        'authorizerFunctionArn': authorizerFunctionArn,
      if (status != null) 'status': status.toValue(),
      if (tokenKeyName != null) 'tokenKeyName': tokenKeyName,
      if (tokenSigningPublicKeys != null)
        'tokenSigningPublicKeys': tokenSigningPublicKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/authorizer/${Uri.encodeComponent(authorizerName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAuthorizerResponse.fromJson(response);
  }

  /// Updates information about the billing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [billingGroupName] :
  /// The name of the billing group.
  ///
  /// Parameter [billingGroupProperties] :
  /// The properties of the billing group.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the billing group. If the version of the billing
  /// group does not match the expected version specified in the request, the
  /// <code>UpdateBillingGroup</code> request is rejected with a
  /// <code>VersionConflictException</code>.
  Future<UpdateBillingGroupResponse> updateBillingGroup({
    @_s.required String billingGroupName,
    @_s.required BillingGroupProperties billingGroupProperties,
    int expectedVersion,
  }) async {
    ArgumentError.checkNotNull(billingGroupName, 'billingGroupName');
    _s.validateStringLength(
      'billingGroupName',
      billingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'billingGroupName',
      billingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        billingGroupProperties, 'billingGroupProperties');
    final $payload = <String, dynamic>{
      'billingGroupProperties': billingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/billing-groups/${Uri.encodeComponent(billingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBillingGroupResponse.fromJson(response);
  }

  /// Updates a registered CA certificate.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The CA certificate identifier.
  ///
  /// Parameter [newAutoRegistrationStatus] :
  /// The new value for the auto registration status. Valid values are: "ENABLE"
  /// or "DISABLE".
  ///
  /// Parameter [newStatus] :
  /// The updated status of the CA certificate.
  ///
  /// <b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should
  /// not be used.
  ///
  /// Parameter [registrationConfig] :
  /// Information about the registration configuration.
  ///
  /// Parameter [removeAutoRegistration] :
  /// If true, removes auto registration.
  Future<void> updateCACertificate({
    @_s.required String certificateId,
    AutoRegistrationStatus newAutoRegistrationStatus,
    CACertificateStatus newStatus,
    RegistrationConfig registrationConfig,
    bool removeAutoRegistration,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (newAutoRegistrationStatus != null)
        'newAutoRegistrationStatus': [newAutoRegistrationStatus.toValue()],
      if (newStatus != null) 'newStatus': [newStatus.toValue()],
    };
    final $payload = <String, dynamic>{
      if (registrationConfig != null) 'registrationConfig': registrationConfig,
      if (removeAutoRegistration != null)
        'removeAutoRegistration': removeAutoRegistration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/cacertificate/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the status of the specified certificate. This operation is
  /// idempotent.
  ///
  /// Certificates must be in the ACTIVE state to authenticate devices that use
  /// a certificate to connect to AWS IoT.
  ///
  /// Within a few minutes of updating a certificate from the ACTIVE state to
  /// any other state, AWS IoT disconnects all devices that used that
  /// certificate to connect. Devices cannot use a certificate that is not in
  /// the ACTIVE state to reconnect.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CertificateStateException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [certificateId] :
  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  ///
  /// Parameter [newStatus] :
  /// The new status.
  ///
  /// <b>Note:</b> Setting the status to PENDING_TRANSFER or PENDING_ACTIVATION
  /// will result in an exception being thrown. PENDING_TRANSFER and
  /// PENDING_ACTIVATION are statuses used internally by AWS IoT. They are not
  /// intended for developer use.
  ///
  /// <b>Note:</b> The status value REGISTER_INACTIVE is deprecated and should
  /// not be used.
  Future<void> updateCertificate({
    @_s.required String certificateId,
    @_s.required CertificateStatus newStatus,
  }) async {
    ArgumentError.checkNotNull(certificateId, 'certificateId');
    _s.validateStringLength(
      'certificateId',
      certificateId,
      64,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'certificateId',
      certificateId,
      r'''(0x)?[a-fA-F0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(newStatus, 'newStatus');
    final $query = <String, List<String>>{
      if (newStatus != null) 'newStatus': [newStatus.toValue()],
    };
    await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/certificates/${Uri.encodeComponent(certificateId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a Device Defender detect custom metric.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [displayName] :
  /// Field represents a friendly name in the console for the custom metric, it
  /// doesn't have to be unique. Don't use this name as the metric identifier in
  /// the device metric report. Can be updated.
  ///
  /// Parameter [metricName] :
  /// The name of the custom metric. Cannot be updated.
  Future<UpdateCustomMetricResponse> updateCustomMetric({
    @_s.required String displayName,
    @_s.required String metricName,
  }) async {
    ArgumentError.checkNotNull(displayName, 'displayName');
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'displayName',
      displayName,
      r'''[\p{Graph}\x20]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metricName, 'metricName');
    _s.validateStringLength(
      'metricName',
      metricName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'metricName',
      metricName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'displayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/custom-metric/${Uri.encodeComponent(metricName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCustomMetricResponse.fromJson(response);
  }

  /// Updates the definition for a dimension. You cannot change the type of a
  /// dimension after it is created (you can delete it and recreate it).
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [name] :
  /// A unique identifier for the dimension. Choose something that describes the
  /// type and value to make it easy to remember what it does.
  ///
  /// Parameter [stringValues] :
  /// Specifies the value or list of values for the dimension. For
  /// <code>TOPIC_FILTER</code> dimensions, this is a pattern used to match the
  /// MQTT topic (for example, "admin/#").
  Future<UpdateDimensionResponse> updateDimension({
    @_s.required String name,
    @_s.required List<String> stringValues,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(stringValues, 'stringValues');
    final $payload = <String, dynamic>{
      'stringValues': stringValues,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/dimensions/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDimensionResponse.fromJson(response);
  }

  /// Updates values stored in the domain configuration. Domain configurations
  /// for default endpoints can't be updated.
  /// <note>
  /// The domain configuration feature is in public preview and is subject to
  /// change.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [CertificateValidationException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [domainConfigurationName] :
  /// The name of the domain configuration to be updated.
  ///
  /// Parameter [authorizerConfig] :
  /// An object that specifies the authorization service for a domain.
  ///
  /// Parameter [domainConfigurationStatus] :
  /// The status to which the domain configuration should be updated.
  ///
  /// Parameter [removeAuthorizerConfig] :
  /// Removes the authorization configuration from a domain.
  Future<UpdateDomainConfigurationResponse> updateDomainConfiguration({
    @_s.required String domainConfigurationName,
    AuthorizerConfig authorizerConfig,
    DomainConfigurationStatus domainConfigurationStatus,
    bool removeAuthorizerConfig,
  }) async {
    ArgumentError.checkNotNull(
        domainConfigurationName, 'domainConfigurationName');
    _s.validateStringLength(
      'domainConfigurationName',
      domainConfigurationName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'domainConfigurationName',
      domainConfigurationName,
      r'''[\w.:-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (authorizerConfig != null) 'authorizerConfig': authorizerConfig,
      if (domainConfigurationStatus != null)
        'domainConfigurationStatus': domainConfigurationStatus.toValue(),
      if (removeAuthorizerConfig != null)
        'removeAuthorizerConfig': removeAuthorizerConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/domainConfigurations/${Uri.encodeComponent(domainConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDomainConfigurationResponse.fromJson(response);
  }

  /// Updates a dynamic thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidQueryException].
  ///
  /// Parameter [thingGroupName] :
  /// The name of the dynamic thing group to update.
  ///
  /// Parameter [thingGroupProperties] :
  /// The dynamic thing group properties to update.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the dynamic thing group to update.
  ///
  /// Parameter [indexName] :
  /// The dynamic thing group index to update.
  /// <note>
  /// Currently one index is supported: 'AWS_Things'.
  /// </note>
  ///
  /// Parameter [queryString] :
  /// The dynamic thing group search query string to update.
  ///
  /// Parameter [queryVersion] :
  /// The dynamic thing group query version to update.
  /// <note>
  /// Currently one query version is supported: "2017-09-30". If not specified,
  /// the query version defaults to this value.
  /// </note>
  Future<UpdateDynamicThingGroupResponse> updateDynamicThingGroup({
    @_s.required String thingGroupName,
    @_s.required ThingGroupProperties thingGroupProperties,
    int expectedVersion,
    String indexName,
    String queryString,
    String queryVersion,
  }) async {
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingGroupProperties, 'thingGroupProperties');
    _s.validateStringLength(
      'indexName',
      indexName,
      1,
      128,
    );
    _s.validateStringPattern(
      'indexName',
      indexName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    _s.validateStringLength(
      'queryString',
      queryString,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'thingGroupProperties': thingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (indexName != null) 'indexName': indexName,
      if (queryString != null) 'queryString': queryString,
      if (queryVersion != null) 'queryVersion': queryVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/dynamic-thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDynamicThingGroupResponse.fromJson(response);
  }

  /// Updates the event configurations.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InternalFailureException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [eventConfigurations] :
  /// The new event configuration values.
  Future<void> updateEventConfigurations({
    Map<EventType, Configuration> eventConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      if (eventConfigurations != null)
        'eventConfigurations':
            eventConfigurations.map((k, e) => MapEntry(k.toValue(), e)),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/event-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEventConfigurationsResponse.fromJson(response);
  }

  /// Updates the search configuration.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [thingGroupIndexingConfiguration] :
  /// Thing group indexing configuration.
  ///
  /// Parameter [thingIndexingConfiguration] :
  /// Thing indexing configuration.
  Future<void> updateIndexingConfiguration({
    ThingGroupIndexingConfiguration thingGroupIndexingConfiguration,
    ThingIndexingConfiguration thingIndexingConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (thingGroupIndexingConfiguration != null)
        'thingGroupIndexingConfiguration': thingGroupIndexingConfiguration,
      if (thingIndexingConfiguration != null)
        'thingIndexingConfiguration': thingIndexingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/indexing/config',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIndexingConfigurationResponse.fromJson(response);
  }

  /// Updates supported fields of the specified job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [jobId] :
  /// The ID of the job to be updated.
  ///
  /// Parameter [abortConfig] :
  /// Allows you to create criteria to abort a job.
  ///
  /// Parameter [description] :
  /// A short text description of the job.
  ///
  /// Parameter [jobExecutionsRolloutConfig] :
  /// Allows you to create a staged rollout of the job.
  ///
  /// Parameter [namespaceId] :
  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following
  /// format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  ///
  /// Parameter [presignedUrlConfig] :
  /// Configuration information for pre-signed S3 URLs.
  ///
  /// Parameter [timeoutConfig] :
  /// Specifies the amount of time each device has to finish its execution of
  /// the job. The timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to
  /// another terminal state before the time expires, it will be automatically
  /// set to <code>TIMED_OUT</code>.
  Future<void> updateJob({
    @_s.required String jobId,
    AbortConfig abortConfig,
    String description,
    JobExecutionsRolloutConfig jobExecutionsRolloutConfig,
    String namespaceId,
    PresignedUrlConfig presignedUrlConfig,
    TimeoutConfig timeoutConfig,
  }) async {
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2028,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[^\p{C}]+''',
    );
    _s.validateStringLength(
      'namespaceId',
      namespaceId,
      1,
      64,
    );
    _s.validateStringPattern(
      'namespaceId',
      namespaceId,
      r'''[a-zA-Z0-9_-]+''',
    );
    final $query = <String, List<String>>{
      if (namespaceId != null) 'namespaceId': [namespaceId],
    };
    final $payload = <String, dynamic>{
      if (abortConfig != null) 'abortConfig': abortConfig,
      if (description != null) 'description': description,
      if (jobExecutionsRolloutConfig != null)
        'jobExecutionsRolloutConfig': jobExecutionsRolloutConfig,
      if (presignedUrlConfig != null) 'presignedUrlConfig': presignedUrlConfig,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/jobs/${Uri.encodeComponent(jobId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the definition for the specified mitigation action.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [actionName] :
  /// The friendly name for the mitigation action. You cannot change the name by
  /// using <code>UpdateMitigationAction</code>. Instead, you must delete and
  /// recreate the mitigation action with the new name.
  ///
  /// Parameter [actionParams] :
  /// Defines the type of action and the parameters for that action.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the IAM role that is used to apply the mitigation action.
  Future<UpdateMitigationActionResponse> updateMitigationAction({
    @_s.required String actionName,
    MitigationActionParams actionParams,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(actionName, 'actionName');
    _s.validateStringLength(
      'actionName',
      actionName,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'actionName',
      actionName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (actionParams != null) 'actionParams': actionParams,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/mitigationactions/actions/${Uri.encodeComponent(actionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMitigationActionResponse.fromJson(response);
  }

  /// Updates a fleet provisioning template.
  ///
  /// May throw [InternalFailureException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [templateName] :
  /// The name of the fleet provisioning template.
  ///
  /// Parameter [defaultVersionId] :
  /// The ID of the default provisioning template version.
  ///
  /// Parameter [description] :
  /// The description of the fleet provisioning template.
  ///
  /// Parameter [enabled] :
  /// True to enable the fleet provisioning template, otherwise false.
  ///
  /// Parameter [preProvisioningHook] :
  /// Updates the pre-provisioning hook template.
  ///
  /// Parameter [provisioningRoleArn] :
  /// The ARN of the role associated with the provisioning template. This IoT
  /// role grants permission to provision a device.
  ///
  /// Parameter [removePreProvisioningHook] :
  /// Removes pre-provisioning hook template.
  Future<void> updateProvisioningTemplate({
    @_s.required String templateName,
    int defaultVersionId,
    String description,
    bool enabled,
    ProvisioningHook preProvisioningHook,
    String provisioningRoleArn,
    bool removePreProvisioningHook,
  }) async {
    ArgumentError.checkNotNull(templateName, 'templateName');
    _s.validateStringLength(
      'templateName',
      templateName,
      1,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'templateName',
      templateName,
      r'''^[0-9A-Za-z_-]+$''',
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
      r'''[^\p{C}]*''',
    );
    _s.validateStringLength(
      'provisioningRoleArn',
      provisioningRoleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (defaultVersionId != null) 'defaultVersionId': defaultVersionId,
      if (description != null) 'description': description,
      if (enabled != null) 'enabled': enabled,
      if (preProvisioningHook != null)
        'preProvisioningHook': preProvisioningHook,
      if (provisioningRoleArn != null)
        'provisioningRoleArn': provisioningRoleArn,
      if (removePreProvisioningHook != null)
        'removePreProvisioningHook': removePreProvisioningHook,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/provisioning-templates/${Uri.encodeComponent(templateName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProvisioningTemplateResponse.fromJson(response);
  }

  /// Updates a role alias.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [roleAlias] :
  /// The role alias to update.
  ///
  /// Parameter [credentialDurationSeconds] :
  /// The number of seconds the credential will be valid.
  ///
  /// Parameter [roleArn] :
  /// The role ARN.
  Future<UpdateRoleAliasResponse> updateRoleAlias({
    @_s.required String roleAlias,
    int credentialDurationSeconds,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(roleAlias, 'roleAlias');
    _s.validateStringLength(
      'roleAlias',
      roleAlias,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleAlias',
      roleAlias,
      r'''[\w=,@-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'credentialDurationSeconds',
      credentialDurationSeconds,
      900,
      3600,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (credentialDurationSeconds != null)
        'credentialDurationSeconds': credentialDurationSeconds,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/role-aliases/${Uri.encodeComponent(roleAlias)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRoleAliasResponse.fromJson(response);
  }

  /// Updates a scheduled audit, including which checks are performed and how
  /// often the audit takes place.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [scheduledAuditName] :
  /// The name of the scheduled audit. (Max. 128 chars)
  ///
  /// Parameter [dayOfMonth] :
  /// The day of the month on which the scheduled audit takes place. This can be
  /// <code>1</code> through <code>31</code> or <code>LAST</code>. This field is
  /// required if the <code>frequency</code> parameter is set to
  /// <code>MONTHLY</code>. If days 29-31 are specified, and the month does not
  /// have that many days, the audit takes place on the "LAST" day of the month.
  ///
  /// Parameter [dayOfWeek] :
  /// The day of the week on which the scheduled audit takes place. This can be
  /// one of <code>SUN</code>, <code>MON</code>, <code>TUE</code>,
  /// <code>WED</code>, <code>THU</code>, <code>FRI</code>, or <code>SAT</code>.
  /// This field is required if the "frequency" parameter is set to
  /// <code>WEEKLY</code> or <code>BIWEEKLY</code>.
  ///
  /// Parameter [frequency] :
  /// How often the scheduled audit takes place, either <code>DAILY</code>,
  /// <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The
  /// start time of each audit is determined by the system.
  ///
  /// Parameter [targetCheckNames] :
  /// Which checks are performed during the scheduled audit. Checks must be
  /// enabled for your account. (Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or use
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.)
  Future<UpdateScheduledAuditResponse> updateScheduledAudit({
    @_s.required String scheduledAuditName,
    String dayOfMonth,
    DayOfWeek dayOfWeek,
    AuditFrequency frequency,
    List<String> targetCheckNames,
  }) async {
    ArgumentError.checkNotNull(scheduledAuditName, 'scheduledAuditName');
    _s.validateStringLength(
      'scheduledAuditName',
      scheduledAuditName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledAuditName',
      scheduledAuditName,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'dayOfMonth',
      dayOfMonth,
      r'''^([1-9]|[12][0-9]|3[01])$|^LAST$''',
    );
    final $payload = <String, dynamic>{
      if (dayOfMonth != null) 'dayOfMonth': dayOfMonth,
      if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.toValue(),
      if (frequency != null) 'frequency': frequency.toValue(),
      if (targetCheckNames != null) 'targetCheckNames': targetCheckNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/audit/scheduledaudits/${Uri.encodeComponent(scheduledAuditName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateScheduledAuditResponse.fromJson(response);
  }

  /// Updates a Device Defender security profile.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [securityProfileName] :
  /// The name of the security profile you want to update.
  ///
  /// Parameter [additionalMetricsToRetain] :
  /// <i>Please use
  /// <a>UpdateSecurityProfileRequest$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but
  /// it is also retained for any metric specified here. Can be used with custom
  /// metrics; cannot be used with dimensions.
  ///
  /// Parameter [additionalMetricsToRetainV2] :
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's behaviors, but it is also
  /// retained for any metric specified here. Can be used with custom metrics;
  /// cannot be used with dimensions.
  ///
  /// Parameter [alertTargets] :
  /// Where the alerts are sent. (Alerts are always sent to the console.)
  ///
  /// Parameter [behaviors] :
  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  ///
  /// Parameter [deleteAdditionalMetricsToRetain] :
  /// If true, delete all <code>additionalMetricsToRetain</code> defined for
  /// this security profile. If any <code>additionalMetricsToRetain</code> are
  /// defined in the current invocation, an exception occurs.
  ///
  /// Parameter [deleteAlertTargets] :
  /// If true, delete all <code>alertTargets</code> defined for this security
  /// profile. If any <code>alertTargets</code> are defined in the current
  /// invocation, an exception occurs.
  ///
  /// Parameter [deleteBehaviors] :
  /// If true, delete all <code>behaviors</code> defined for this security
  /// profile. If any <code>behaviors</code> are defined in the current
  /// invocation, an exception occurs.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the security profile. A new version is generated
  /// whenever the security profile is updated. If you specify a value that is
  /// different from the actual version, a <code>VersionConflictException</code>
  /// is thrown.
  ///
  /// Parameter [securityProfileDescription] :
  /// A description of the security profile.
  Future<UpdateSecurityProfileResponse> updateSecurityProfile({
    @_s.required String securityProfileName,
    List<String> additionalMetricsToRetain,
    List<MetricToRetain> additionalMetricsToRetainV2,
    Map<AlertTargetType, AlertTarget> alertTargets,
    List<Behavior> behaviors,
    bool deleteAdditionalMetricsToRetain,
    bool deleteAlertTargets,
    bool deleteBehaviors,
    int expectedVersion,
    String securityProfileDescription,
  }) async {
    ArgumentError.checkNotNull(securityProfileName, 'securityProfileName');
    _s.validateStringLength(
      'securityProfileName',
      securityProfileName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'securityProfileName',
      securityProfileName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'securityProfileDescription',
      securityProfileDescription,
      0,
      1000,
    );
    _s.validateStringPattern(
      'securityProfileDescription',
      securityProfileDescription,
      r'''[\p{Graph}\x20]*''',
    );
    final $query = <String, List<String>>{
      if (expectedVersion != null)
        'expectedVersion': [expectedVersion.toString()],
    };
    final $payload = <String, dynamic>{
      if (additionalMetricsToRetain != null)
        'additionalMetricsToRetain': additionalMetricsToRetain,
      if (additionalMetricsToRetainV2 != null)
        'additionalMetricsToRetainV2': additionalMetricsToRetainV2,
      if (alertTargets != null)
        'alertTargets': alertTargets.map((k, e) => MapEntry(k.toValue(), e)),
      if (behaviors != null) 'behaviors': behaviors,
      if (deleteAdditionalMetricsToRetain != null)
        'deleteAdditionalMetricsToRetain': deleteAdditionalMetricsToRetain,
      if (deleteAlertTargets != null) 'deleteAlertTargets': deleteAlertTargets,
      if (deleteBehaviors != null) 'deleteBehaviors': deleteBehaviors,
      if (securityProfileDescription != null)
        'securityProfileDescription': securityProfileDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/security-profiles/${Uri.encodeComponent(securityProfileName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSecurityProfileResponse.fromJson(response);
  }

  /// Updates an existing stream. The stream version will be incremented by one.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [streamId] :
  /// The stream ID.
  ///
  /// Parameter [description] :
  /// The description of the stream.
  ///
  /// Parameter [files] :
  /// The files associated with the stream.
  ///
  /// Parameter [roleArn] :
  /// An IAM role that allows the IoT service principal assumes to access your
  /// S3 files.
  Future<UpdateStreamResponse> updateStream({
    @_s.required String streamId,
    String description,
    List<StreamFile> files,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(streamId, 'streamId');
    _s.validateStringLength(
      'streamId',
      streamId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamId',
      streamId,
      r'''[a-zA-Z0-9_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      2028,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[^\p{C}]+''',
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (files != null) 'files': files,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/streams/${Uri.encodeComponent(streamId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStreamResponse.fromJson(response);
  }

  /// Updates the data for a thing.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingName] :
  /// The name of the thing to update.
  ///
  /// You can't change a thing's name. To change a thing's name, you must create
  /// a new thing, give it the new name, and then delete the old thing.
  ///
  /// Parameter [attributePayload] :
  /// A list of thing attributes, a JSON string containing name-value pairs. For
  /// example:
  ///
  /// <code>{\"attributes\":{\"name1\":\"value2\"}}</code>
  ///
  /// This data is used to add new attributes or update existing attributes.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing record in the registry. If the version
  /// of the record in the registry does not match the expected version
  /// specified in the request, the <code>UpdateThing</code> request is rejected
  /// with a <code>VersionConflictException</code>.
  ///
  /// Parameter [removeThingType] :
  /// Remove a thing type association. If <b>true</b>, the association is
  /// removed.
  ///
  /// Parameter [thingTypeName] :
  /// The name of the thing type.
  Future<void> updateThing({
    @_s.required String thingName,
    AttributePayload attributePayload,
    int expectedVersion,
    bool removeThingType,
    String thingTypeName,
  }) async {
    ArgumentError.checkNotNull(thingName, 'thingName');
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'thingTypeName',
      thingTypeName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingTypeName',
      thingTypeName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (attributePayload != null) 'attributePayload': attributePayload,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
      if (removeThingType != null) 'removeThingType': removeThingType,
      if (thingTypeName != null) 'thingTypeName': thingTypeName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/things/${Uri.encodeComponent(thingName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThingResponse.fromJson(response);
  }

  /// Update a thing group.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [VersionConflictException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [thingGroupName] :
  /// The thing group to update.
  ///
  /// Parameter [thingGroupProperties] :
  /// The thing group properties.
  ///
  /// Parameter [expectedVersion] :
  /// The expected version of the thing group. If this does not match the
  /// version of the thing group being updated, the update will fail.
  Future<UpdateThingGroupResponse> updateThingGroup({
    @_s.required String thingGroupName,
    @_s.required ThingGroupProperties thingGroupProperties,
    int expectedVersion,
  }) async {
    ArgumentError.checkNotNull(thingGroupName, 'thingGroupName');
    _s.validateStringLength(
      'thingGroupName',
      thingGroupName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'thingGroupName',
      thingGroupName,
      r'''[a-zA-Z0-9:_-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(thingGroupProperties, 'thingGroupProperties');
    final $payload = <String, dynamic>{
      'thingGroupProperties': thingGroupProperties,
      if (expectedVersion != null) 'expectedVersion': expectedVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/thing-groups/${Uri.encodeComponent(thingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThingGroupResponse.fromJson(response);
  }

  /// Updates the groups to which the thing belongs.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [overrideDynamicGroups] :
  /// Override dynamic thing groups with static thing groups when 10-group limit
  /// is reached. If a thing belongs to 10 thing groups, and one or more of
  /// those groups are dynamic thing groups, adding a thing to a static group
  /// removes the thing from the last dynamic group.
  ///
  /// Parameter [thingGroupsToAdd] :
  /// The groups to which the thing will be added.
  ///
  /// Parameter [thingGroupsToRemove] :
  /// The groups from which the thing will be removed.
  ///
  /// Parameter [thingName] :
  /// The thing whose group memberships will be updated.
  Future<void> updateThingGroupsForThing({
    bool overrideDynamicGroups,
    List<String> thingGroupsToAdd,
    List<String> thingGroupsToRemove,
    String thingName,
  }) async {
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final $payload = <String, dynamic>{
      if (overrideDynamicGroups != null)
        'overrideDynamicGroups': overrideDynamicGroups,
      if (thingGroupsToAdd != null) 'thingGroupsToAdd': thingGroupsToAdd,
      if (thingGroupsToRemove != null)
        'thingGroupsToRemove': thingGroupsToRemove,
      if (thingName != null) 'thingName': thingName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/thing-groups/updateThingGroupsForThing',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateThingGroupsForThingResponse.fromJson(response);
  }

  /// Updates a topic rule destination. You use this to change the status,
  /// endpoint URL, or confirmation URL of the destination.
  ///
  /// May throw [InternalException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedException].
  /// May throw [ConflictingResourceUpdateException].
  ///
  /// Parameter [arn] :
  /// The ARN of the topic rule destination.
  ///
  /// Parameter [status] :
  /// The status of the topic rule destination. Valid values are:
  /// <dl> <dt>IN_PROGRESS</dt> <dd>
  /// A topic rule destination was created but has not been confirmed. You can
  /// set <code>status</code> to <code>IN_PROGRESS</code> by calling
  /// <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation
  /// challenge to be sent to your confirmation endpoint.
  /// </dd> <dt>ENABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is allowed.
  /// You can set <code>status</code> to <code>DISABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>DISABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is not
  /// allowed. You can set <code>status</code> to <code>ENABLED</code> by
  /// calling <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>ERROR</dt> <dd>
  /// Confirmation could not be completed, for example if the confirmation timed
  /// out. You can call <code>GetTopicRuleDestination</code> for details about
  /// the error. You can set <code>status</code> to <code>IN_PROGRESS</code> by
  /// calling <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation
  /// challenge to be sent to your confirmation endpoint.
  /// </dd> </dl>
  Future<void> updateTopicRuleDestination({
    @_s.required String arn,
    @_s.required TopicRuleDestinationStatus status,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    ArgumentError.checkNotNull(status, 'status');
    final $payload = <String, dynamic>{
      'arn': arn,
      'status': status?.toValue() ?? '',
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/destinations',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTopicRuleDestinationResponse.fromJson(response);
  }

  /// Validates a Device Defender security profile behaviors specification.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottlingException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [behaviors] :
  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  Future<ValidateSecurityProfileBehaviorsResponse>
      validateSecurityProfileBehaviors({
    @_s.required List<Behavior> behaviors,
  }) async {
    ArgumentError.checkNotNull(behaviors, 'behaviors');
    final $payload = <String, dynamic>{
      'behaviors': behaviors,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/security-profile-behaviors/validate',
      exceptionFnMap: _exceptionFns,
    );
    return ValidateSecurityProfileBehaviorsResponse.fromJson(response);
  }
}

enum AbortAction {
  @_s.JsonValue('CANCEL')
  cancel,
}

/// The criteria that determine when and how a job abort takes place.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AbortConfig {
  /// The list of criteria that determine when and how to abort the job.
  @_s.JsonKey(name: 'criteriaList')
  final List<AbortCriteria> criteriaList;

  AbortConfig({
    @_s.required this.criteriaList,
  });
  factory AbortConfig.fromJson(Map<String, dynamic> json) =>
      _$AbortConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AbortConfigToJson(this);
}

/// The criteria that determine when and how a job abort takes place.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AbortCriteria {
  /// The type of job action to take to initiate the job abort.
  @_s.JsonKey(name: 'action')
  final AbortAction action;

  /// The type of job execution failures that can initiate a job abort.
  @_s.JsonKey(name: 'failureType')
  final JobExecutionFailureType failureType;

  /// The minimum number of things which must receive job execution notifications
  /// before the job can be aborted.
  @_s.JsonKey(name: 'minNumberOfExecutedThings')
  final int minNumberOfExecutedThings;

  /// The minimum percentage of job execution failures that must occur to initiate
  /// the job abort.
  ///
  /// AWS IoT supports up to two digits after the decimal (for example, 10.9 and
  /// 10.99, but not 10.999).
  @_s.JsonKey(name: 'thresholdPercentage')
  final double thresholdPercentage;

  AbortCriteria({
    @_s.required this.action,
    @_s.required this.failureType,
    @_s.required this.minNumberOfExecutedThings,
    @_s.required this.thresholdPercentage,
  });
  factory AbortCriteria.fromJson(Map<String, dynamic> json) =>
      _$AbortCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$AbortCriteriaToJson(this);
}

/// Describes the actions associated with a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Action {
  /// Change the state of a CloudWatch alarm.
  @_s.JsonKey(name: 'cloudwatchAlarm')
  final CloudwatchAlarmAction cloudwatchAlarm;

  /// Send data to CloudWatch Logs.
  @_s.JsonKey(name: 'cloudwatchLogs')
  final CloudwatchLogsAction cloudwatchLogs;

  /// Capture a CloudWatch metric.
  @_s.JsonKey(name: 'cloudwatchMetric')
  final CloudwatchMetricAction cloudwatchMetric;

  /// Write to a DynamoDB table.
  @_s.JsonKey(name: 'dynamoDB')
  final DynamoDBAction dynamoDB;

  /// Write to a DynamoDB table. This is a new version of the DynamoDB action. It
  /// allows you to write each attribute in an MQTT message payload into a
  /// separate DynamoDB column.
  @_s.JsonKey(name: 'dynamoDBv2')
  final DynamoDBv2Action dynamoDBv2;

  /// Write data to an Amazon Elasticsearch Service domain.
  @_s.JsonKey(name: 'elasticsearch')
  final ElasticsearchAction elasticsearch;

  /// Write to an Amazon Kinesis Firehose stream.
  @_s.JsonKey(name: 'firehose')
  final FirehoseAction firehose;

  /// Send data to an HTTPS endpoint.
  @_s.JsonKey(name: 'http')
  final HttpAction http;

  /// Sends message data to an AWS IoT Analytics channel.
  @_s.JsonKey(name: 'iotAnalytics')
  final IotAnalyticsAction iotAnalytics;

  /// Sends an input to an AWS IoT Events detector.
  @_s.JsonKey(name: 'iotEvents')
  final IotEventsAction iotEvents;

  /// Sends data from the MQTT message that triggered the rule to AWS IoT SiteWise
  /// asset properties.
  @_s.JsonKey(name: 'iotSiteWise')
  final IotSiteWiseAction iotSiteWise;

  /// Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK)
  /// or self-managed Apache Kafka cluster.
  @_s.JsonKey(name: 'kafka')
  final KafkaAction kafka;

  /// Write data to an Amazon Kinesis stream.
  @_s.JsonKey(name: 'kinesis')
  final KinesisAction kinesis;

  /// Invoke a Lambda function.
  @_s.JsonKey(name: 'lambda')
  final LambdaAction lambda;

  /// Publish to another MQTT topic.
  @_s.JsonKey(name: 'republish')
  final RepublishAction republish;

  /// Write to an Amazon S3 bucket.
  @_s.JsonKey(name: 's3')
  final S3Action s3;

  /// Send a message to a Salesforce IoT Cloud Input Stream.
  @_s.JsonKey(name: 'salesforce')
  final SalesforceAction salesforce;

  /// Publish to an Amazon SNS topic.
  @_s.JsonKey(name: 'sns')
  final SnsAction sns;

  /// Publish to an Amazon SQS queue.
  @_s.JsonKey(name: 'sqs')
  final SqsAction sqs;

  /// Starts execution of a Step Functions state machine.
  @_s.JsonKey(name: 'stepFunctions')
  final StepFunctionsAction stepFunctions;

  /// The Timestream rule action writes attributes (measures) from an MQTT message
  /// into an Amazon Timestream table. For more information, see the <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html">Timestream</a>
  /// topic rule action documentation.
  @_s.JsonKey(name: 'timestream')
  final TimestreamAction timestream;

  Action({
    this.cloudwatchAlarm,
    this.cloudwatchLogs,
    this.cloudwatchMetric,
    this.dynamoDB,
    this.dynamoDBv2,
    this.elasticsearch,
    this.firehose,
    this.http,
    this.iotAnalytics,
    this.iotEvents,
    this.iotSiteWise,
    this.kafka,
    this.kinesis,
    this.lambda,
    this.republish,
    this.s3,
    this.salesforce,
    this.sns,
    this.sqs,
    this.stepFunctions,
    this.timestream,
  });
  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}

enum ActionType {
  @_s.JsonValue('PUBLISH')
  publish,
  @_s.JsonValue('SUBSCRIBE')
  subscribe,
  @_s.JsonValue('RECEIVE')
  receive,
  @_s.JsonValue('CONNECT')
  connect,
}

/// Information about an active Device Defender security profile behavior
/// violation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ActiveViolation {
  /// The behavior that is being violated.
  @_s.JsonKey(name: 'behavior')
  final Behavior behavior;

  /// The time the most recent violation occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastViolationTime')
  final DateTime lastViolationTime;

  /// The value of the metric (the measurement) that caused the most recent
  /// violation.
  @_s.JsonKey(name: 'lastViolationValue')
  final MetricValue lastViolationValue;

  /// The security profile with the behavior is in violation.
  @_s.JsonKey(name: 'securityProfileName')
  final String securityProfileName;

  /// The name of the thing responsible for the active violation.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The details of a violation event.
  @_s.JsonKey(name: 'violationEventAdditionalInfo')
  final ViolationEventAdditionalInfo violationEventAdditionalInfo;

  /// The ID of the active violation.
  @_s.JsonKey(name: 'violationId')
  final String violationId;

  /// The time the violation started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'violationStartTime')
  final DateTime violationStartTime;

  ActiveViolation({
    this.behavior,
    this.lastViolationTime,
    this.lastViolationValue,
    this.securityProfileName,
    this.thingName,
    this.violationEventAdditionalInfo,
    this.violationId,
    this.violationStartTime,
  });
  factory ActiveViolation.fromJson(Map<String, dynamic> json) =>
      _$ActiveViolationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddThingToBillingGroupResponse {
  AddThingToBillingGroupResponse();
  factory AddThingToBillingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AddThingToBillingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddThingToThingGroupResponse {
  AddThingToThingGroupResponse();
  factory AddThingToThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AddThingToThingGroupResponseFromJson(json);
}

/// Parameters used when defining a mitigation action that move a set of things
/// to a thing group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AddThingsToThingGroupParams {
  /// The list of groups to which you want to add the things that triggered the
  /// mitigation action. You can add a thing to a maximum of 10 groups, but you
  /// can't add a thing to more than one group in the same hierarchy.
  @_s.JsonKey(name: 'thingGroupNames')
  final List<String> thingGroupNames;

  /// Specifies if this mitigation action can move the things that triggered the
  /// mitigation action even if they are part of one or more dynamic thing groups.
  @_s.JsonKey(name: 'overrideDynamicGroups')
  final bool overrideDynamicGroups;

  AddThingsToThingGroupParams({
    @_s.required this.thingGroupNames,
    this.overrideDynamicGroups,
  });
  factory AddThingsToThingGroupParams.fromJson(Map<String, dynamic> json) =>
      _$AddThingsToThingGroupParamsFromJson(json);

  Map<String, dynamic> toJson() => _$AddThingsToThingGroupParamsToJson(this);
}

/// A structure containing the alert target ARN and the role ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AlertTarget {
  /// The Amazon Resource Name (ARN) of the notification target to which alerts
  /// are sent.
  @_s.JsonKey(name: 'alertTargetArn')
  final String alertTargetArn;

  /// The ARN of the role that grants permission to send alerts to the
  /// notification target.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  AlertTarget({
    @_s.required this.alertTargetArn,
    @_s.required this.roleArn,
  });
  factory AlertTarget.fromJson(Map<String, dynamic> json) =>
      _$AlertTargetFromJson(json);

  Map<String, dynamic> toJson() => _$AlertTargetToJson(this);
}

/// The type of alert target: one of "SNS".
enum AlertTargetType {
  @_s.JsonValue('SNS')
  sns,
}

extension on AlertTargetType {
  String toValue() {
    switch (this) {
      case AlertTargetType.sns:
        return 'SNS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains information that allowed the authorization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Allowed {
  /// A list of policies that allowed the authentication.
  @_s.JsonKey(name: 'policies')
  final List<Policy> policies;

  Allowed({
    this.policies,
  });
  factory Allowed.fromJson(Map<String, dynamic> json) =>
      _$AllowedFromJson(json);
}

/// An asset property timestamp entry containing the following information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetPropertyTimestamp {
  /// A string that contains the time in seconds since epoch. Accepts substitution
  /// templates.
  @_s.JsonKey(name: 'timeInSeconds')
  final String timeInSeconds;

  /// Optional. A string that contains the nanosecond time offset. Accepts
  /// substitution templates.
  @_s.JsonKey(name: 'offsetInNanos')
  final String offsetInNanos;

  AssetPropertyTimestamp({
    @_s.required this.timeInSeconds,
    this.offsetInNanos,
  });
  factory AssetPropertyTimestamp.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyTimestampFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPropertyTimestampToJson(this);
}

/// An asset property value entry containing the following information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetPropertyValue {
  /// The asset property value timestamp.
  @_s.JsonKey(name: 'timestamp')
  final AssetPropertyTimestamp timestamp;

  /// The value of the asset property.
  @_s.JsonKey(name: 'value')
  final AssetPropertyVariant value;

  /// Optional. A string that describes the quality of the value. Accepts
  /// substitution templates. Must be <code>GOOD</code>, <code>BAD</code>, or
  /// <code>UNCERTAIN</code>.
  @_s.JsonKey(name: 'quality')
  final String quality;

  AssetPropertyValue({
    @_s.required this.timestamp,
    @_s.required this.value,
    this.quality,
  });
  factory AssetPropertyValue.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyValueFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPropertyValueToJson(this);
}

/// Contains an asset property value (of a single type).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AssetPropertyVariant {
  /// Optional. A string that contains the boolean value (<code>true</code> or
  /// <code>false</code>) of the value entry. Accepts substitution templates.
  @_s.JsonKey(name: 'booleanValue')
  final String booleanValue;

  /// Optional. A string that contains the double value of the value entry.
  /// Accepts substitution templates.
  @_s.JsonKey(name: 'doubleValue')
  final String doubleValue;

  /// Optional. A string that contains the integer value of the value entry.
  /// Accepts substitution templates.
  @_s.JsonKey(name: 'integerValue')
  final String integerValue;

  /// Optional. The string value of the value entry. Accepts substitution
  /// templates.
  @_s.JsonKey(name: 'stringValue')
  final String stringValue;

  AssetPropertyVariant({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });
  factory AssetPropertyVariant.fromJson(Map<String, dynamic> json) =>
      _$AssetPropertyVariantFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPropertyVariantToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateTargetsWithJobResponse {
  /// A short text description of the job.
  @_s.JsonKey(name: 'description')
  final String description;

  /// An ARN identifying the job.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique identifier you assigned to this job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  AssociateTargetsWithJobResponse({
    this.description,
    this.jobArn,
    this.jobId,
  });
  factory AssociateTargetsWithJobResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateTargetsWithJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachSecurityProfileResponse {
  AttachSecurityProfileResponse();
  factory AttachSecurityProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachSecurityProfileResponseFromJson(json);
}

/// The output from the AttachThingPrincipal operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttachThingPrincipalResponse {
  AttachThingPrincipalResponse();
  factory AttachThingPrincipalResponse.fromJson(Map<String, dynamic> json) =>
      _$AttachThingPrincipalResponseFromJson(json);
}

/// The attribute payload.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AttributePayload {
  /// A JSON string containing up to three key-value pair in JSON format. For
  /// example:
  ///
  /// <code>{\"attributes\":{\"string1\":\"string2\"}}</code>
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// Specifies whether the list of attributes provided in the
  /// <code>AttributePayload</code> is merged with the attributes stored in the
  /// registry, instead of overwriting them.
  ///
  /// To remove an attribute, call <code>UpdateThing</code> with an empty
  /// attribute value.
  /// <note>
  /// The <code>merge</code> attribute is only valid when calling
  /// <code>UpdateThing</code> or <code>UpdateThingGroup</code>.
  /// </note>
  @_s.JsonKey(name: 'merge')
  final bool merge;

  AttributePayload({
    this.attributes,
    this.merge,
  });
  factory AttributePayload.fromJson(Map<String, dynamic> json) =>
      _$AttributePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$AttributePayloadToJson(this);
}

/// Which audit checks are enabled and disabled for this account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuditCheckConfiguration {
  /// True if this audit check is enabled for this account.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  AuditCheckConfiguration({
    this.enabled,
  });
  factory AuditCheckConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AuditCheckConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AuditCheckConfigurationToJson(this);
}

/// Information about the audit check.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuditCheckDetails {
  /// True if the check is complete and found all resources compliant.
  @_s.JsonKey(name: 'checkCompliant')
  final bool checkCompliant;

  /// The completion status of this check. One of "IN_PROGRESS",
  /// "WAITING_FOR_DATA_COLLECTION", "CANCELED", "COMPLETED_COMPLIANT",
  /// "COMPLETED_NON_COMPLIANT", or "FAILED".
  @_s.JsonKey(name: 'checkRunStatus')
  final AuditCheckRunStatus checkRunStatus;

  /// The code of any error encountered when this check is performed during this
  /// audit. One of "INSUFFICIENT_PERMISSIONS" or "AUDIT_CHECK_DISABLED".
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The message associated with any error encountered when this check is
  /// performed during this audit.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The number of resources that were found noncompliant during the check.
  @_s.JsonKey(name: 'nonCompliantResourcesCount')
  final int nonCompliantResourcesCount;

  /// Describes how many of the non-compliant resources created during the
  /// evaluation of an audit check were marked as suppressed.
  @_s.JsonKey(name: 'suppressedNonCompliantResourcesCount')
  final int suppressedNonCompliantResourcesCount;

  /// The number of resources on which the check was performed.
  @_s.JsonKey(name: 'totalResourcesCount')
  final int totalResourcesCount;

  AuditCheckDetails({
    this.checkCompliant,
    this.checkRunStatus,
    this.errorCode,
    this.message,
    this.nonCompliantResourcesCount,
    this.suppressedNonCompliantResourcesCount,
    this.totalResourcesCount,
  });
  factory AuditCheckDetails.fromJson(Map<String, dynamic> json) =>
      _$AuditCheckDetailsFromJson(json);
}

enum AuditCheckRunStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('WAITING_FOR_DATA_COLLECTION')
  waitingForDataCollection,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('COMPLETED_COMPLIANT')
  completedCompliant,
  @_s.JsonValue('COMPLETED_NON_COMPLIANT')
  completedNonCompliant,
  @_s.JsonValue('FAILED')
  failed,
}

/// The findings (results) of the audit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuditFinding {
  /// The audit check that generated this result.
  @_s.JsonKey(name: 'checkName')
  final String checkName;

  /// A unique identifier for this set of audit findings. This identifier is used
  /// to apply mitigation tasks to one or more sets of findings.
  @_s.JsonKey(name: 'findingId')
  final String findingId;

  /// The time the result (finding) was discovered.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'findingTime')
  final DateTime findingTime;

  /// Indicates whether the audit finding was suppressed or not during reporting.
  @_s.JsonKey(name: 'isSuppressed')
  final bool isSuppressed;

  /// The resource that was found to be noncompliant with the audit check.
  @_s.JsonKey(name: 'nonCompliantResource')
  final NonCompliantResource nonCompliantResource;

  /// The reason the resource was noncompliant.
  @_s.JsonKey(name: 'reasonForNonCompliance')
  final String reasonForNonCompliance;

  /// A code that indicates the reason that the resource was noncompliant.
  @_s.JsonKey(name: 'reasonForNonComplianceCode')
  final String reasonForNonComplianceCode;

  /// The list of related resources.
  @_s.JsonKey(name: 'relatedResources')
  final List<RelatedResource> relatedResources;

  /// The severity of the result (finding).
  @_s.JsonKey(name: 'severity')
  final AuditFindingSeverity severity;

  /// The ID of the audit that generated this result (finding).
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  /// The time the audit started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'taskStartTime')
  final DateTime taskStartTime;

  AuditFinding({
    this.checkName,
    this.findingId,
    this.findingTime,
    this.isSuppressed,
    this.nonCompliantResource,
    this.reasonForNonCompliance,
    this.reasonForNonComplianceCode,
    this.relatedResources,
    this.severity,
    this.taskId,
    this.taskStartTime,
  });
  factory AuditFinding.fromJson(Map<String, dynamic> json) =>
      _$AuditFindingFromJson(json);
}

enum AuditFindingSeverity {
  @_s.JsonValue('CRITICAL')
  critical,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('LOW')
  low,
}

enum AuditFrequency {
  @_s.JsonValue('DAILY')
  daily,
  @_s.JsonValue('WEEKLY')
  weekly,
  @_s.JsonValue('BIWEEKLY')
  biweekly,
  @_s.JsonValue('MONTHLY')
  monthly,
}

extension on AuditFrequency {
  String toValue() {
    switch (this) {
      case AuditFrequency.daily:
        return 'DAILY';
      case AuditFrequency.weekly:
        return 'WEEKLY';
      case AuditFrequency.biweekly:
        return 'BIWEEKLY';
      case AuditFrequency.monthly:
        return 'MONTHLY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returned by ListAuditMitigationActionsTask, this object contains information
/// that describes a mitigation action that has been started.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuditMitigationActionExecutionMetadata {
  /// The unique identifier for the mitigation action being applied by the task.
  @_s.JsonKey(name: 'actionId')
  final String actionId;

  /// The friendly name of the mitigation action being applied by the task.
  @_s.JsonKey(name: 'actionName')
  final String actionName;

  /// The date and time when the task was completed or canceled. Blank if the task
  /// is still running.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// If an error occurred, the code that indicates which type of error occurred.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The unique identifier for the findings to which the task and associated
  /// mitigation action are applied.
  @_s.JsonKey(name: 'findingId')
  final String findingId;

  /// If an error occurred, a message that describes the error.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The date and time when the task was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The current status of the task being executed.
  @_s.JsonKey(name: 'status')
  final AuditMitigationActionsExecutionStatus status;

  /// The unique identifier for the task that applies the mitigation action.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  AuditMitigationActionExecutionMetadata({
    this.actionId,
    this.actionName,
    this.endTime,
    this.errorCode,
    this.findingId,
    this.message,
    this.startTime,
    this.status,
    this.taskId,
  });
  factory AuditMitigationActionExecutionMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$AuditMitigationActionExecutionMetadataFromJson(json);
}

enum AuditMitigationActionsExecutionStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('SKIPPED')
  skipped,
  @_s.JsonValue('PENDING')
  pending,
}

extension on AuditMitigationActionsExecutionStatus {
  String toValue() {
    switch (this) {
      case AuditMitigationActionsExecutionStatus.inProgress:
        return 'IN_PROGRESS';
      case AuditMitigationActionsExecutionStatus.completed:
        return 'COMPLETED';
      case AuditMitigationActionsExecutionStatus.failed:
        return 'FAILED';
      case AuditMitigationActionsExecutionStatus.canceled:
        return 'CANCELED';
      case AuditMitigationActionsExecutionStatus.skipped:
        return 'SKIPPED';
      case AuditMitigationActionsExecutionStatus.pending:
        return 'PENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about an audit mitigation actions task that is returned by
/// <code>ListAuditMitigationActionsTasks</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuditMitigationActionsTaskMetadata {
  /// The time at which the audit mitigation actions task was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The unique identifier for the task.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  /// The current state of the audit mitigation actions task.
  @_s.JsonKey(name: 'taskStatus')
  final AuditMitigationActionsTaskStatus taskStatus;

  AuditMitigationActionsTaskMetadata({
    this.startTime,
    this.taskId,
    this.taskStatus,
  });
  factory AuditMitigationActionsTaskMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$AuditMitigationActionsTaskMetadataFromJson(json);
}

enum AuditMitigationActionsTaskStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELED')
  canceled,
}

extension on AuditMitigationActionsTaskStatus {
  String toValue() {
    switch (this) {
      case AuditMitigationActionsTaskStatus.inProgress:
        return 'IN_PROGRESS';
      case AuditMitigationActionsTaskStatus.completed:
        return 'COMPLETED';
      case AuditMitigationActionsTaskStatus.failed:
        return 'FAILED';
      case AuditMitigationActionsTaskStatus.canceled:
        return 'CANCELED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Used in MitigationActionParams, this information identifies the target
/// findings to which the mitigation actions are applied. Only one entry
/// appears.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuditMitigationActionsTaskTarget {
  /// Specifies a filter in the form of an audit check and set of reason codes
  /// that identify the findings from the audit to which the audit mitigation
  /// actions task apply.
  @_s.JsonKey(name: 'auditCheckToReasonCodeFilter')
  final Map<String, List<String>> auditCheckToReasonCodeFilter;

  /// If the task will apply a mitigation action to findings from a specific
  /// audit, this value uniquely identifies the audit.
  @_s.JsonKey(name: 'auditTaskId')
  final String auditTaskId;

  /// If the task will apply a mitigation action to one or more listed findings,
  /// this value uniquely identifies those findings.
  @_s.JsonKey(name: 'findingIds')
  final List<String> findingIds;

  AuditMitigationActionsTaskTarget({
    this.auditCheckToReasonCodeFilter,
    this.auditTaskId,
    this.findingIds,
  });
  factory AuditMitigationActionsTaskTarget.fromJson(
          Map<String, dynamic> json) =>
      _$AuditMitigationActionsTaskTargetFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AuditMitigationActionsTaskTargetToJson(this);
}

/// Information about the targets to which audit notifications are sent.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuditNotificationTarget {
  /// True if notifications to the target are enabled.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The ARN of the role that grants permission to send notifications to the
  /// target.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The ARN of the target (SNS topic) to which audit notifications are sent.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  AuditNotificationTarget({
    this.enabled,
    this.roleArn,
    this.targetArn,
  });
  factory AuditNotificationTarget.fromJson(Map<String, dynamic> json) =>
      _$AuditNotificationTargetFromJson(json);

  Map<String, dynamic> toJson() => _$AuditNotificationTargetToJson(this);
}

enum AuditNotificationType {
  @_s.JsonValue('SNS')
  sns,
}

extension on AuditNotificationType {
  String toValue() {
    switch (this) {
      case AuditNotificationType.sns:
        return 'SNS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Filters out specific findings of a Device Defender audit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuditSuppression {
  @_s.JsonKey(name: 'checkName')
  final String checkName;
  @_s.JsonKey(name: 'resourceIdentifier')
  final ResourceIdentifier resourceIdentifier;

  /// The description of the audit suppression.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The expiration date (epoch timestamp in seconds) that you want the
  /// suppression to adhere to.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expirationDate')
  final DateTime expirationDate;

  /// Indicates whether a suppression should exist indefinitely or not.
  @_s.JsonKey(name: 'suppressIndefinitely')
  final bool suppressIndefinitely;

  AuditSuppression({
    @_s.required this.checkName,
    @_s.required this.resourceIdentifier,
    this.description,
    this.expirationDate,
    this.suppressIndefinitely,
  });
  factory AuditSuppression.fromJson(Map<String, dynamic> json) =>
      _$AuditSuppressionFromJson(json);
}

/// The audits that were performed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuditTaskMetadata {
  /// The ID of this audit.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  /// The status of this audit. One of "IN_PROGRESS", "COMPLETED", "FAILED", or
  /// "CANCELED".
  @_s.JsonKey(name: 'taskStatus')
  final AuditTaskStatus taskStatus;

  /// The type of this audit. One of "ON_DEMAND_AUDIT_TASK" or
  /// "SCHEDULED_AUDIT_TASK".
  @_s.JsonKey(name: 'taskType')
  final AuditTaskType taskType;

  AuditTaskMetadata({
    this.taskId,
    this.taskStatus,
    this.taskType,
  });
  factory AuditTaskMetadata.fromJson(Map<String, dynamic> json) =>
      _$AuditTaskMetadataFromJson(json);
}

enum AuditTaskStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELED')
  canceled,
}

extension on AuditTaskStatus {
  String toValue() {
    switch (this) {
      case AuditTaskStatus.inProgress:
        return 'IN_PROGRESS';
      case AuditTaskStatus.completed:
        return 'COMPLETED';
      case AuditTaskStatus.failed:
        return 'FAILED';
      case AuditTaskStatus.canceled:
        return 'CANCELED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum AuditTaskType {
  @_s.JsonValue('ON_DEMAND_AUDIT_TASK')
  onDemandAuditTask,
  @_s.JsonValue('SCHEDULED_AUDIT_TASK')
  scheduledAuditTask,
}

extension on AuditTaskType {
  String toValue() {
    switch (this) {
      case AuditTaskType.onDemandAuditTask:
        return 'ON_DEMAND_AUDIT_TASK';
      case AuditTaskType.scheduledAuditTask:
        return 'SCHEDULED_AUDIT_TASK';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum AuthDecision {
  @_s.JsonValue('ALLOWED')
  allowed,
  @_s.JsonValue('EXPLICIT_DENY')
  explicitDeny,
  @_s.JsonValue('IMPLICIT_DENY')
  implicitDeny,
}

/// A collection of authorization information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuthInfo {
  /// The resources for which the principal is being authorized to perform the
  /// specified action.
  @_s.JsonKey(name: 'resources')
  final List<String> resources;

  /// The type of action for which the principal is being authorized.
  @_s.JsonKey(name: 'actionType')
  final ActionType actionType;

  AuthInfo({
    @_s.required this.resources,
    this.actionType,
  });
  factory AuthInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthInfoToJson(this);
}

/// The authorizer result.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthResult {
  /// The policies and statements that allowed the specified action.
  @_s.JsonKey(name: 'allowed')
  final Allowed allowed;

  /// The final authorization decision of this scenario. Multiple statements are
  /// taken into account when determining the authorization decision. An explicit
  /// deny statement can override multiple allow statements.
  @_s.JsonKey(name: 'authDecision')
  final AuthDecision authDecision;

  /// Authorization information.
  @_s.JsonKey(name: 'authInfo')
  final AuthInfo authInfo;

  /// The policies and statements that denied the specified action.
  @_s.JsonKey(name: 'denied')
  final Denied denied;

  /// Contains any missing context values found while evaluating policy.
  @_s.JsonKey(name: 'missingContextValues')
  final List<String> missingContextValues;

  AuthResult({
    this.allowed,
    this.authDecision,
    this.authInfo,
    this.denied,
    this.missingContextValues,
  });
  factory AuthResult.fromJson(Map<String, dynamic> json) =>
      _$AuthResultFromJson(json);
}

/// An object that specifies the authorization service for a domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AuthorizerConfig {
  /// A Boolean that specifies whether the domain configuration's authorization
  /// service can be overridden.
  @_s.JsonKey(name: 'allowAuthorizerOverride')
  final bool allowAuthorizerOverride;

  /// The name of the authorization service for a domain configuration.
  @_s.JsonKey(name: 'defaultAuthorizerName')
  final String defaultAuthorizerName;

  AuthorizerConfig({
    this.allowAuthorizerOverride,
    this.defaultAuthorizerName,
  });
  factory AuthorizerConfig.fromJson(Map<String, dynamic> json) =>
      _$AuthorizerConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizerConfigToJson(this);
}

/// The authorizer description.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthorizerDescription {
  /// The authorizer ARN.
  @_s.JsonKey(name: 'authorizerArn')
  final String authorizerArn;

  /// The authorizer's Lambda function ARN.
  @_s.JsonKey(name: 'authorizerFunctionArn')
  final String authorizerFunctionArn;

  /// The authorizer name.
  @_s.JsonKey(name: 'authorizerName')
  final String authorizerName;

  /// The UNIX timestamp of when the authorizer was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The UNIX timestamp of when the authorizer was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// Specifies whether AWS IoT validates the token signature in an authorization
  /// request.
  @_s.JsonKey(name: 'signingDisabled')
  final bool signingDisabled;

  /// The status of the authorizer.
  @_s.JsonKey(name: 'status')
  final AuthorizerStatus status;

  /// The key used to extract the token from the HTTP headers.
  @_s.JsonKey(name: 'tokenKeyName')
  final String tokenKeyName;

  /// The public keys used to validate the token signature returned by your custom
  /// authentication service.
  @_s.JsonKey(name: 'tokenSigningPublicKeys')
  final Map<String, String> tokenSigningPublicKeys;

  AuthorizerDescription({
    this.authorizerArn,
    this.authorizerFunctionArn,
    this.authorizerName,
    this.creationDate,
    this.lastModifiedDate,
    this.signingDisabled,
    this.status,
    this.tokenKeyName,
    this.tokenSigningPublicKeys,
  });
  factory AuthorizerDescription.fromJson(Map<String, dynamic> json) =>
      _$AuthorizerDescriptionFromJson(json);
}

enum AuthorizerStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
}

extension on AuthorizerStatus {
  String toValue() {
    switch (this) {
      case AuthorizerStatus.active:
        return 'ACTIVE';
      case AuthorizerStatus.inactive:
        return 'INACTIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The authorizer summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthorizerSummary {
  /// The authorizer ARN.
  @_s.JsonKey(name: 'authorizerArn')
  final String authorizerArn;

  /// The authorizer name.
  @_s.JsonKey(name: 'authorizerName')
  final String authorizerName;

  AuthorizerSummary({
    this.authorizerArn,
    this.authorizerName,
  });
  factory AuthorizerSummary.fromJson(Map<String, dynamic> json) =>
      _$AuthorizerSummaryFromJson(json);
}

enum AutoRegistrationStatus {
  @_s.JsonValue('ENABLE')
  enable,
  @_s.JsonValue('DISABLE')
  disable,
}

extension on AutoRegistrationStatus {
  String toValue() {
    switch (this) {
      case AutoRegistrationStatus.enable:
        return 'ENABLE';
      case AutoRegistrationStatus.disable:
        return 'DISABLE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The criteria that determine when and how a job abort takes place.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AwsJobAbortConfig {
  /// The list of criteria that determine when and how to abort the job.
  @_s.JsonKey(name: 'abortCriteriaList')
  final List<AwsJobAbortCriteria> abortCriteriaList;

  AwsJobAbortConfig({
    @_s.required this.abortCriteriaList,
  });
  Map<String, dynamic> toJson() => _$AwsJobAbortConfigToJson(this);
}

/// The criteria that determine when and how a job abort takes place.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AwsJobAbortCriteria {
  /// The type of job action to take to initiate the job abort.
  @_s.JsonKey(name: 'action')
  final AwsJobAbortCriteriaAbortAction action;

  /// The type of job execution failures that can initiate a job abort.
  @_s.JsonKey(name: 'failureType')
  final AwsJobAbortCriteriaFailureType failureType;

  /// The minimum number of things which must receive job execution notifications
  /// before the job can be aborted.
  @_s.JsonKey(name: 'minNumberOfExecutedThings')
  final int minNumberOfExecutedThings;

  /// The minimum percentage of job execution failures that must occur to initiate
  /// the job abort.
  ///
  /// AWS IoT supports up to two digits after the decimal (for example, 10.9 and
  /// 10.99, but not 10.999).
  @_s.JsonKey(name: 'thresholdPercentage')
  final double thresholdPercentage;

  AwsJobAbortCriteria({
    @_s.required this.action,
    @_s.required this.failureType,
    @_s.required this.minNumberOfExecutedThings,
    @_s.required this.thresholdPercentage,
  });
  Map<String, dynamic> toJson() => _$AwsJobAbortCriteriaToJson(this);
}

enum AwsJobAbortCriteriaAbortAction {
  @_s.JsonValue('CANCEL')
  cancel,
}

enum AwsJobAbortCriteriaFailureType {
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('ALL')
  all,
}

/// Configuration for the rollout of OTA updates.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsJobExecutionsRolloutConfig {
  /// The rate of increase for a job rollout. This parameter allows you to define
  /// an exponential rate increase for a job rollout.
  @_s.JsonKey(name: 'exponentialRate')
  final AwsJobExponentialRolloutRate exponentialRate;

  /// The maximum number of OTA update job executions started per minute.
  @_s.JsonKey(name: 'maximumPerMinute')
  final int maximumPerMinute;

  AwsJobExecutionsRolloutConfig({
    this.exponentialRate,
    this.maximumPerMinute,
  });
  factory AwsJobExecutionsRolloutConfig.fromJson(Map<String, dynamic> json) =>
      _$AwsJobExecutionsRolloutConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AwsJobExecutionsRolloutConfigToJson(this);
}

/// The rate of increase for a job rollout. This parameter allows you to define
/// an exponential rate increase for a job rollout.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsJobExponentialRolloutRate {
  /// The minimum number of things that will be notified of a pending job, per
  /// minute, at the start of the job rollout. This is the initial rate of the
  /// rollout.
  @_s.JsonKey(name: 'baseRatePerMinute')
  final int baseRatePerMinute;

  /// The rate of increase for a job rollout. The number of things notified is
  /// multiplied by this factor.
  @_s.JsonKey(name: 'incrementFactor')
  final double incrementFactor;

  /// The criteria to initiate the increase in rate of rollout for a job.
  ///
  /// AWS IoT supports up to one digit after the decimal (for example, 1.5, but
  /// not 1.55).
  @_s.JsonKey(name: 'rateIncreaseCriteria')
  final AwsJobRateIncreaseCriteria rateIncreaseCriteria;

  AwsJobExponentialRolloutRate({
    @_s.required this.baseRatePerMinute,
    @_s.required this.incrementFactor,
    @_s.required this.rateIncreaseCriteria,
  });
  factory AwsJobExponentialRolloutRate.fromJson(Map<String, dynamic> json) =>
      _$AwsJobExponentialRolloutRateFromJson(json);

  Map<String, dynamic> toJson() => _$AwsJobExponentialRolloutRateToJson(this);
}

/// Configuration information for pre-signed URLs. Valid when
/// <code>protocols</code> contains HTTP.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsJobPresignedUrlConfig {
  /// How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600,
  /// the default value is 1800 seconds. Pre-signed URLs are generated when a
  /// request for the job document is received.
  @_s.JsonKey(name: 'expiresInSec')
  final int expiresInSec;

  AwsJobPresignedUrlConfig({
    this.expiresInSec,
  });
  factory AwsJobPresignedUrlConfig.fromJson(Map<String, dynamic> json) =>
      _$AwsJobPresignedUrlConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AwsJobPresignedUrlConfigToJson(this);
}

/// The criteria to initiate the increase in rate of rollout for a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AwsJobRateIncreaseCriteria {
  /// When this number of things have been notified, it will initiate an increase
  /// in the rollout rate.
  @_s.JsonKey(name: 'numberOfNotifiedThings')
  final int numberOfNotifiedThings;

  /// When this number of things have succeeded in their job execution, it will
  /// initiate an increase in the rollout rate.
  @_s.JsonKey(name: 'numberOfSucceededThings')
  final int numberOfSucceededThings;

  AwsJobRateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });
  factory AwsJobRateIncreaseCriteria.fromJson(Map<String, dynamic> json) =>
      _$AwsJobRateIncreaseCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$AwsJobRateIncreaseCriteriaToJson(this);
}

/// Specifies the amount of time each device has to finish its execution of the
/// job. A timer is started when the job execution status is set to
/// <code>IN_PROGRESS</code>. If the job execution status is not set to another
/// terminal state before the timer expires, it will be automatically set to
/// <code>TIMED_OUT</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AwsJobTimeoutConfig {
  /// Specifies the amount of time, in minutes, this device has to finish
  /// execution of this job. The timeout interval can be anywhere between 1 minute
  /// and 7 days (1 to 10080 minutes). The in progress timer can't be updated and
  /// will apply to all job executions for the job. Whenever a job execution
  /// remains in the IN_PROGRESS status for longer than this interval, the job
  /// execution will fail and switch to the terminal <code>TIMED_OUT</code>
  /// status.
  @_s.JsonKey(name: 'inProgressTimeoutInMinutes')
  final int inProgressTimeoutInMinutes;

  AwsJobTimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });
  Map<String, dynamic> toJson() => _$AwsJobTimeoutConfigToJson(this);
}

/// A Device Defender security profile behavior.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Behavior {
  /// The name you've given to the behavior.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The criteria that determine if a device is behaving normally in regard to
  /// the <code>metric</code>.
  @_s.JsonKey(name: 'criteria')
  final BehaviorCriteria criteria;

  /// What is measured by the behavior.
  @_s.JsonKey(name: 'metric')
  final String metric;

  /// The dimension for a metric in your behavior. For example, using a
  /// <code>TOPIC_FILTER</code> dimension, you can narrow down the scope of the
  /// metric to only MQTT topics where the name matches the pattern specified in
  /// the dimension. This can't be used with custom metrics.
  @_s.JsonKey(name: 'metricDimension')
  final MetricDimension metricDimension;

  /// Suppresses alerts.
  @_s.JsonKey(name: 'suppressAlerts')
  final bool suppressAlerts;

  Behavior({
    @_s.required this.name,
    this.criteria,
    this.metric,
    this.metricDimension,
    this.suppressAlerts,
  });
  factory Behavior.fromJson(Map<String, dynamic> json) =>
      _$BehaviorFromJson(json);

  Map<String, dynamic> toJson() => _$BehaviorToJson(this);
}

/// The criteria by which the behavior is determined to be normal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BehaviorCriteria {
  /// The operator that relates the thing measured (<code>metric</code>) to the
  /// criteria (containing a <code>value</code> or
  /// <code>statisticalThreshold</code>). Valid operators include:
  ///
  /// <ul>
  /// <li>
  /// <code>string-list</code>: <code>in-set</code> and <code>not-in-set</code>
  /// </li>
  /// <li>
  /// <code>number-list</code>: <code>in-set</code> and <code>not-in-set</code>
  /// </li>
  /// <li>
  /// <code>ip-address-list</code>: <code>in-cidr-set</code> and
  /// <code>not-in-cidr-set</code>
  /// </li>
  /// <li>
  /// <code>number</code>: <code>less-than</code>, <code>less-than-equals</code>,
  /// <code>greater-than</code>, and <code>greater-than-equals</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'comparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// If a device is in violation of the behavior for the specified number of
  /// consecutive datapoints, an alarm occurs. If not specified, the default is 1.
  @_s.JsonKey(name: 'consecutiveDatapointsToAlarm')
  final int consecutiveDatapointsToAlarm;

  /// If an alarm has occurred and the offending device is no longer in violation
  /// of the behavior for the specified number of consecutive datapoints, the
  /// alarm is cleared. If not specified, the default is 1.
  @_s.JsonKey(name: 'consecutiveDatapointsToClear')
  final int consecutiveDatapointsToClear;

  /// Use this to specify the time duration over which the behavior is evaluated,
  /// for those criteria that have a time dimension (for example,
  /// <code>NUM_MESSAGES_SENT</code>). For a <code>statisticalThreshhold</code>
  /// metric comparison, measurements from all devices are accumulated over this
  /// time duration before being used to calculate percentiles, and later,
  /// measurements from an individual device are also accumulated over this time
  /// duration before being given a percentile rank. Cannot be used with
  /// list-based metric datatypes.
  @_s.JsonKey(name: 'durationSeconds')
  final int durationSeconds;

  /// The configuration of an ML Detect
  @_s.JsonKey(name: 'mlDetectionConfig')
  final MachineLearningDetectionConfig mlDetectionConfig;

  /// A statistical ranking (percentile)that indicates a threshold value by which
  /// a behavior is determined to be in compliance or in violation of the
  /// behavior.
  @_s.JsonKey(name: 'statisticalThreshold')
  final StatisticalThreshold statisticalThreshold;

  /// The value to be compared with the <code>metric</code>.
  @_s.JsonKey(name: 'value')
  final MetricValue value;

  BehaviorCriteria({
    this.comparisonOperator,
    this.consecutiveDatapointsToAlarm,
    this.consecutiveDatapointsToClear,
    this.durationSeconds,
    this.mlDetectionConfig,
    this.statisticalThreshold,
    this.value,
  });
  factory BehaviorCriteria.fromJson(Map<String, dynamic> json) =>
      _$BehaviorCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$BehaviorCriteriaToJson(this);
}

enum BehaviorCriteriaType {
  @_s.JsonValue('STATIC')
  static,
  @_s.JsonValue('STATISTICAL')
  statistical,
  @_s.JsonValue('MACHINE_LEARNING')
  machineLearning,
}

extension on BehaviorCriteriaType {
  String toValue() {
    switch (this) {
      case BehaviorCriteriaType.static:
        return 'STATIC';
      case BehaviorCriteriaType.statistical:
        return 'STATISTICAL';
      case BehaviorCriteriaType.machineLearning:
        return 'MACHINE_LEARNING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The summary of an ML Detect behavior model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BehaviorModelTrainingSummary {
  /// The name of the behavior.
  @_s.JsonKey(name: 'behaviorName')
  final String behaviorName;

  /// The percentage of datapoints collected.
  @_s.JsonKey(name: 'datapointsCollectionPercentage')
  final double datapointsCollectionPercentage;

  /// The date the model was last refreshed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModelRefreshDate')
  final DateTime lastModelRefreshDate;

  /// The status of the behavior model.
  @_s.JsonKey(name: 'modelStatus')
  final ModelStatus modelStatus;

  /// The name of the security profile.
  @_s.JsonKey(name: 'securityProfileName')
  final String securityProfileName;

  /// The date a training model started collecting data.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'trainingDataCollectionStartDate')
  final DateTime trainingDataCollectionStartDate;

  BehaviorModelTrainingSummary({
    this.behaviorName,
    this.datapointsCollectionPercentage,
    this.lastModelRefreshDate,
    this.modelStatus,
    this.securityProfileName,
    this.trainingDataCollectionStartDate,
  });
  factory BehaviorModelTrainingSummary.fromJson(Map<String, dynamic> json) =>
      _$BehaviorModelTrainingSummaryFromJson(json);
}

/// Additional information about the billing group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BillingGroupMetadata {
  /// The date the billing group was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  BillingGroupMetadata({
    this.creationDate,
  });
  factory BillingGroupMetadata.fromJson(Map<String, dynamic> json) =>
      _$BillingGroupMetadataFromJson(json);
}

/// The properties of a billing group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BillingGroupProperties {
  /// The description of the billing group.
  @_s.JsonKey(name: 'billingGroupDescription')
  final String billingGroupDescription;

  BillingGroupProperties({
    this.billingGroupDescription,
  });
  factory BillingGroupProperties.fromJson(Map<String, dynamic> json) =>
      _$BillingGroupPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$BillingGroupPropertiesToJson(this);
}

/// A CA certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CACertificate {
  /// The ARN of the CA certificate.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The ID of the CA certificate.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The date the CA certificate was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The status of the CA certificate.
  ///
  /// The status value REGISTER_INACTIVE is deprecated and should not be used.
  @_s.JsonKey(name: 'status')
  final CACertificateStatus status;

  CACertificate({
    this.certificateArn,
    this.certificateId,
    this.creationDate,
    this.status,
  });
  factory CACertificate.fromJson(Map<String, dynamic> json) =>
      _$CACertificateFromJson(json);
}

/// Describes a CA certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CACertificateDescription {
  /// Whether the CA certificate configured for auto registration of device
  /// certificates. Valid values are "ENABLE" and "DISABLE"
  @_s.JsonKey(name: 'autoRegistrationStatus')
  final AutoRegistrationStatus autoRegistrationStatus;

  /// The CA certificate ARN.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The CA certificate ID.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The CA certificate data, in PEM format.
  @_s.JsonKey(name: 'certificatePem')
  final String certificatePem;

  /// The date the CA certificate was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The customer version of the CA certificate.
  @_s.JsonKey(name: 'customerVersion')
  final int customerVersion;

  /// The generation ID of the CA certificate.
  @_s.JsonKey(name: 'generationId')
  final String generationId;

  /// The date the CA certificate was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The owner of the CA certificate.
  @_s.JsonKey(name: 'ownedBy')
  final String ownedBy;

  /// The status of a CA certificate.
  @_s.JsonKey(name: 'status')
  final CACertificateStatus status;

  /// When the CA certificate is valid.
  @_s.JsonKey(name: 'validity')
  final CertificateValidity validity;

  CACertificateDescription({
    this.autoRegistrationStatus,
    this.certificateArn,
    this.certificateId,
    this.certificatePem,
    this.creationDate,
    this.customerVersion,
    this.generationId,
    this.lastModifiedDate,
    this.ownedBy,
    this.status,
    this.validity,
  });
  factory CACertificateDescription.fromJson(Map<String, dynamic> json) =>
      _$CACertificateDescriptionFromJson(json);
}

enum CACertificateStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
}

extension on CACertificateStatus {
  String toValue() {
    switch (this) {
      case CACertificateStatus.active:
        return 'ACTIVE';
      case CACertificateStatus.inactive:
        return 'INACTIVE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum CACertificateUpdateAction {
  @_s.JsonValue('DEACTIVATE')
  deactivate,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelAuditMitigationActionsTaskResponse {
  CancelAuditMitigationActionsTaskResponse();
  factory CancelAuditMitigationActionsTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelAuditMitigationActionsTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelAuditTaskResponse {
  CancelAuditTaskResponse();
  factory CancelAuditTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelAuditTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelDetectMitigationActionsTaskResponse {
  CancelDetectMitigationActionsTaskResponse();
  factory CancelDetectMitigationActionsTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelDetectMitigationActionsTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelJobResponse {
  /// A short text description of the job.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The job ARN.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique identifier you assigned to this job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  CancelJobResponse({
    this.description,
    this.jobArn,
    this.jobId,
  });
  factory CancelJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelJobResponseFromJson(json);
}

enum CannedAccessControlList {
  @_s.JsonValue('private')
  private,
  @_s.JsonValue('public-read')
  publicRead,
  @_s.JsonValue('public-read-write')
  publicReadWrite,
  @_s.JsonValue('aws-exec-read')
  awsExecRead,
  @_s.JsonValue('authenticated-read')
  authenticatedRead,
  @_s.JsonValue('bucket-owner-read')
  bucketOwnerRead,
  @_s.JsonValue('bucket-owner-full-control')
  bucketOwnerFullControl,
  @_s.JsonValue('log-delivery-write')
  logDeliveryWrite,
}

/// Information about a certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Certificate {
  /// The ARN of the certificate.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The ID of the certificate. (The last part of the certificate ARN contains
  /// the certificate ID.)
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The mode of the certificate.
  @_s.JsonKey(name: 'certificateMode')
  final CertificateMode certificateMode;

  /// The date and time the certificate was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The status of the certificate.
  ///
  /// The status value REGISTER_INACTIVE is deprecated and should not be used.
  @_s.JsonKey(name: 'status')
  final CertificateStatus status;

  Certificate({
    this.certificateArn,
    this.certificateId,
    this.certificateMode,
    this.creationDate,
    this.status,
  });
  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

/// Describes a certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CertificateDescription {
  /// The certificate ID of the CA certificate used to sign this certificate.
  @_s.JsonKey(name: 'caCertificateId')
  final String caCertificateId;

  /// The ARN of the certificate.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The ID of the certificate.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The mode of the certificate.
  @_s.JsonKey(name: 'certificateMode')
  final CertificateMode certificateMode;

  /// The certificate data, in PEM format.
  @_s.JsonKey(name: 'certificatePem')
  final String certificatePem;

  /// The date and time the certificate was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The customer version of the certificate.
  @_s.JsonKey(name: 'customerVersion')
  final int customerVersion;

  /// The generation ID of the certificate.
  @_s.JsonKey(name: 'generationId')
  final String generationId;

  /// The date and time the certificate was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The ID of the AWS account that owns the certificate.
  @_s.JsonKey(name: 'ownedBy')
  final String ownedBy;

  /// The ID of the AWS account of the previous owner of the certificate.
  @_s.JsonKey(name: 'previousOwnedBy')
  final String previousOwnedBy;

  /// The status of the certificate.
  @_s.JsonKey(name: 'status')
  final CertificateStatus status;

  /// The transfer data.
  @_s.JsonKey(name: 'transferData')
  final TransferData transferData;

  /// When the certificate is valid.
  @_s.JsonKey(name: 'validity')
  final CertificateValidity validity;

  CertificateDescription({
    this.caCertificateId,
    this.certificateArn,
    this.certificateId,
    this.certificateMode,
    this.certificatePem,
    this.creationDate,
    this.customerVersion,
    this.generationId,
    this.lastModifiedDate,
    this.ownedBy,
    this.previousOwnedBy,
    this.status,
    this.transferData,
    this.validity,
  });
  factory CertificateDescription.fromJson(Map<String, dynamic> json) =>
      _$CertificateDescriptionFromJson(json);
}

enum CertificateMode {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('SNI_ONLY')
  sniOnly,
}

enum CertificateStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('INACTIVE')
  inactive,
  @_s.JsonValue('REVOKED')
  revoked,
  @_s.JsonValue('PENDING_TRANSFER')
  pendingTransfer,
  @_s.JsonValue('REGISTER_INACTIVE')
  registerInactive,
  @_s.JsonValue('PENDING_ACTIVATION')
  pendingActivation,
}

extension on CertificateStatus {
  String toValue() {
    switch (this) {
      case CertificateStatus.active:
        return 'ACTIVE';
      case CertificateStatus.inactive:
        return 'INACTIVE';
      case CertificateStatus.revoked:
        return 'REVOKED';
      case CertificateStatus.pendingTransfer:
        return 'PENDING_TRANSFER';
      case CertificateStatus.registerInactive:
        return 'REGISTER_INACTIVE';
      case CertificateStatus.pendingActivation:
        return 'PENDING_ACTIVATION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// When the certificate is valid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CertificateValidity {
  /// The certificate is not valid after this date.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notAfter')
  final DateTime notAfter;

  /// The certificate is not valid before this date.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'notBefore')
  final DateTime notBefore;

  CertificateValidity({
    this.notAfter,
    this.notBefore,
  });
  factory CertificateValidity.fromJson(Map<String, dynamic> json) =>
      _$CertificateValidityFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ClearDefaultAuthorizerResponse {
  ClearDefaultAuthorizerResponse();
  factory ClearDefaultAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$ClearDefaultAuthorizerResponseFromJson(json);
}

/// Describes an action that updates a CloudWatch alarm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudwatchAlarmAction {
  /// The CloudWatch alarm name.
  @_s.JsonKey(name: 'alarmName')
  final String alarmName;

  /// The IAM role that allows access to the CloudWatch alarm.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The reason for the alarm change.
  @_s.JsonKey(name: 'stateReason')
  final String stateReason;

  /// The value of the alarm state. Acceptable values are: OK, ALARM,
  /// INSUFFICIENT_DATA.
  @_s.JsonKey(name: 'stateValue')
  final String stateValue;

  CloudwatchAlarmAction({
    @_s.required this.alarmName,
    @_s.required this.roleArn,
    @_s.required this.stateReason,
    @_s.required this.stateValue,
  });
  factory CloudwatchAlarmAction.fromJson(Map<String, dynamic> json) =>
      _$CloudwatchAlarmActionFromJson(json);

  Map<String, dynamic> toJson() => _$CloudwatchAlarmActionToJson(this);
}

/// Describes an action that sends data to CloudWatch Logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudwatchLogsAction {
  /// The CloudWatch log group to which the action sends data.
  @_s.JsonKey(name: 'logGroupName')
  final String logGroupName;

  /// The IAM role that allows access to the CloudWatch log.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  CloudwatchLogsAction({
    @_s.required this.logGroupName,
    @_s.required this.roleArn,
  });
  factory CloudwatchLogsAction.fromJson(Map<String, dynamic> json) =>
      _$CloudwatchLogsActionFromJson(json);

  Map<String, dynamic> toJson() => _$CloudwatchLogsActionToJson(this);
}

/// Describes an action that captures a CloudWatch metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudwatchMetricAction {
  /// The CloudWatch metric name.
  @_s.JsonKey(name: 'metricName')
  final String metricName;

  /// The CloudWatch metric namespace name.
  @_s.JsonKey(name: 'metricNamespace')
  final String metricNamespace;

  /// The <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#Unit">metric
  /// unit</a> supported by CloudWatch.
  @_s.JsonKey(name: 'metricUnit')
  final String metricUnit;

  /// The CloudWatch metric value.
  @_s.JsonKey(name: 'metricValue')
  final String metricValue;

  /// The IAM role that allows access to the CloudWatch metric.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// An optional <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/cloudwatch_concepts.html#about_timestamp">Unix
  /// timestamp</a>.
  @_s.JsonKey(name: 'metricTimestamp')
  final String metricTimestamp;

  CloudwatchMetricAction({
    @_s.required this.metricName,
    @_s.required this.metricNamespace,
    @_s.required this.metricUnit,
    @_s.required this.metricValue,
    @_s.required this.roleArn,
    this.metricTimestamp,
  });
  factory CloudwatchMetricAction.fromJson(Map<String, dynamic> json) =>
      _$CloudwatchMetricActionFromJson(json);

  Map<String, dynamic> toJson() => _$CloudwatchMetricActionToJson(this);
}

/// Describes the method to use when code signing a file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CodeSigning {
  /// The ID of the AWSSignerJob which was created to sign the file.
  @_s.JsonKey(name: 'awsSignerJobId')
  final String awsSignerJobId;

  /// A custom method for code signing a file.
  @_s.JsonKey(name: 'customCodeSigning')
  final CustomCodeSigning customCodeSigning;

  /// Describes the code-signing job.
  @_s.JsonKey(name: 'startSigningJobParameter')
  final StartSigningJobParameter startSigningJobParameter;

  CodeSigning({
    this.awsSignerJobId,
    this.customCodeSigning,
    this.startSigningJobParameter,
  });
  factory CodeSigning.fromJson(Map<String, dynamic> json) =>
      _$CodeSigningFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSigningToJson(this);
}

/// Describes the certificate chain being used when code signing a file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CodeSigningCertificateChain {
  /// The name of the certificate.
  @_s.JsonKey(name: 'certificateName')
  final String certificateName;

  /// A base64 encoded binary representation of the code signing certificate
  /// chain.
  @_s.JsonKey(name: 'inlineDocument')
  final String inlineDocument;

  CodeSigningCertificateChain({
    this.certificateName,
    this.inlineDocument,
  });
  factory CodeSigningCertificateChain.fromJson(Map<String, dynamic> json) =>
      _$CodeSigningCertificateChainFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSigningCertificateChainToJson(this);
}

/// Describes the signature for a file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CodeSigningSignature {
  /// A base64 encoded binary representation of the code signing signature.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'inlineDocument')
  final Uint8List inlineDocument;

  CodeSigningSignature({
    this.inlineDocument,
  });
  factory CodeSigningSignature.fromJson(Map<String, dynamic> json) =>
      _$CodeSigningSignatureFromJson(json);

  Map<String, dynamic> toJson() => _$CodeSigningSignatureToJson(this);
}

enum ComparisonOperator {
  @_s.JsonValue('less-than')
  lessThan,
  @_s.JsonValue('less-than-equals')
  lessThanEquals,
  @_s.JsonValue('greater-than')
  greaterThan,
  @_s.JsonValue('greater-than-equals')
  greaterThanEquals,
  @_s.JsonValue('in-cidr-set')
  inCidrSet,
  @_s.JsonValue('not-in-cidr-set')
  notInCidrSet,
  @_s.JsonValue('in-port-set')
  inPortSet,
  @_s.JsonValue('not-in-port-set')
  notInPortSet,
  @_s.JsonValue('in-set')
  inSet,
  @_s.JsonValue('not-in-set')
  notInSet,
}

enum ConfidenceLevel {
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
}

/// Configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Configuration {
  /// True to enable the configuration.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  Configuration({
    this.enabled,
  });
  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfirmTopicRuleDestinationResponse {
  ConfirmTopicRuleDestinationResponse();
  factory ConfirmTopicRuleDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ConfirmTopicRuleDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAuditSuppressionResponse {
  CreateAuditSuppressionResponse();
  factory CreateAuditSuppressionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAuditSuppressionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAuthorizerResponse {
  /// The authorizer ARN.
  @_s.JsonKey(name: 'authorizerArn')
  final String authorizerArn;

  /// The authorizer's name.
  @_s.JsonKey(name: 'authorizerName')
  final String authorizerName;

  CreateAuthorizerResponse({
    this.authorizerArn,
    this.authorizerName,
  });
  factory CreateAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBillingGroupResponse {
  /// The ARN of the billing group.
  @_s.JsonKey(name: 'billingGroupArn')
  final String billingGroupArn;

  /// The ID of the billing group.
  @_s.JsonKey(name: 'billingGroupId')
  final String billingGroupId;

  /// The name you gave to the billing group.
  @_s.JsonKey(name: 'billingGroupName')
  final String billingGroupName;

  CreateBillingGroupResponse({
    this.billingGroupArn,
    this.billingGroupId,
    this.billingGroupName,
  });
  factory CreateBillingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBillingGroupResponseFromJson(json);
}

/// The output from the CreateCertificateFromCsr operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCertificateFromCsrResponse {
  /// The Amazon Resource Name (ARN) of the certificate. You can use the ARN as a
  /// principal for policy operations.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The ID of the certificate. Certificate management operations only take a
  /// certificateId.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The certificate data, in PEM format.
  @_s.JsonKey(name: 'certificatePem')
  final String certificatePem;

  CreateCertificateFromCsrResponse({
    this.certificateArn,
    this.certificateId,
    this.certificatePem,
  });
  factory CreateCertificateFromCsrResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateCertificateFromCsrResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCustomMetricResponse {
  /// The Amazon Resource Number (ARN) of the custom metric, e.g.
  /// <code>arn:<i>aws-partition</i>:iot:<i>region</i>:<i>accountId</i>:custommetric/<i>metricName</i>
  /// </code>
  @_s.JsonKey(name: 'metricArn')
  final String metricArn;

  /// The name of the custom metric to be used in the metric report.
  @_s.JsonKey(name: 'metricName')
  final String metricName;

  CreateCustomMetricResponse({
    this.metricArn,
    this.metricName,
  });
  factory CreateCustomMetricResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomMetricResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDimensionResponse {
  /// The Amazon Resource Name (ARN) of the created dimension.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A unique identifier for the dimension.
  @_s.JsonKey(name: 'name')
  final String name;

  CreateDimensionResponse({
    this.arn,
    this.name,
  });
  factory CreateDimensionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDimensionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainConfigurationResponse {
  /// The ARN of the domain configuration.
  @_s.JsonKey(name: 'domainConfigurationArn')
  final String domainConfigurationArn;

  /// The name of the domain configuration.
  @_s.JsonKey(name: 'domainConfigurationName')
  final String domainConfigurationName;

  CreateDomainConfigurationResponse({
    this.domainConfigurationArn,
    this.domainConfigurationName,
  });
  factory CreateDomainConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDomainConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDynamicThingGroupResponse {
  /// The dynamic thing group index name.
  @_s.JsonKey(name: 'indexName')
  final String indexName;

  /// The dynamic thing group search query string.
  @_s.JsonKey(name: 'queryString')
  final String queryString;

  /// The dynamic thing group query version.
  @_s.JsonKey(name: 'queryVersion')
  final String queryVersion;

  /// The dynamic thing group ARN.
  @_s.JsonKey(name: 'thingGroupArn')
  final String thingGroupArn;

  /// The dynamic thing group ID.
  @_s.JsonKey(name: 'thingGroupId')
  final String thingGroupId;

  /// The dynamic thing group name.
  @_s.JsonKey(name: 'thingGroupName')
  final String thingGroupName;

  CreateDynamicThingGroupResponse({
    this.indexName,
    this.queryString,
    this.queryVersion,
    this.thingGroupArn,
    this.thingGroupId,
    this.thingGroupName,
  });
  factory CreateDynamicThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDynamicThingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateJobResponse {
  /// The job description.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The job ARN.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique identifier you assigned to this job.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  CreateJobResponse({
    this.description,
    this.jobArn,
    this.jobId,
  });
  factory CreateJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobResponseFromJson(json);
}

/// The output of the CreateKeysAndCertificate operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateKeysAndCertificateResponse {
  /// The ARN of the certificate.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The ID of the certificate. AWS IoT issues a default subject name for the
  /// certificate (for example, AWS IoT Certificate).
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The certificate data, in PEM format.
  @_s.JsonKey(name: 'certificatePem')
  final String certificatePem;

  /// The generated key pair.
  @_s.JsonKey(name: 'keyPair')
  final KeyPair keyPair;

  CreateKeysAndCertificateResponse({
    this.certificateArn,
    this.certificateId,
    this.certificatePem,
    this.keyPair,
  });
  factory CreateKeysAndCertificateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateKeysAndCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMitigationActionResponse {
  /// The ARN for the new mitigation action.
  @_s.JsonKey(name: 'actionArn')
  final String actionArn;

  /// A unique identifier for the new mitigation action.
  @_s.JsonKey(name: 'actionId')
  final String actionId;

  CreateMitigationActionResponse({
    this.actionArn,
    this.actionId,
  });
  factory CreateMitigationActionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMitigationActionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateOTAUpdateResponse {
  /// The AWS IoT job ARN associated with the OTA update.
  @_s.JsonKey(name: 'awsIotJobArn')
  final String awsIotJobArn;

  /// The AWS IoT job ID associated with the OTA update.
  @_s.JsonKey(name: 'awsIotJobId')
  final String awsIotJobId;

  /// The OTA update ARN.
  @_s.JsonKey(name: 'otaUpdateArn')
  final String otaUpdateArn;

  /// The OTA update ID.
  @_s.JsonKey(name: 'otaUpdateId')
  final String otaUpdateId;

  /// The OTA update status.
  @_s.JsonKey(name: 'otaUpdateStatus')
  final OTAUpdateStatus otaUpdateStatus;

  CreateOTAUpdateResponse({
    this.awsIotJobArn,
    this.awsIotJobId,
    this.otaUpdateArn,
    this.otaUpdateId,
    this.otaUpdateStatus,
  });
  factory CreateOTAUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOTAUpdateResponseFromJson(json);
}

/// The output from the CreatePolicy operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePolicyResponse {
  /// The policy ARN.
  @_s.JsonKey(name: 'policyArn')
  final String policyArn;

  /// The JSON document that describes the policy.
  @_s.JsonKey(name: 'policyDocument')
  final String policyDocument;

  /// The policy name.
  @_s.JsonKey(name: 'policyName')
  final String policyName;

  /// The policy version ID.
  @_s.JsonKey(name: 'policyVersionId')
  final String policyVersionId;

  CreatePolicyResponse({
    this.policyArn,
    this.policyDocument,
    this.policyName,
    this.policyVersionId,
  });
  factory CreatePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePolicyResponseFromJson(json);
}

/// The output of the CreatePolicyVersion operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePolicyVersionResponse {
  /// Specifies whether the policy version is the default.
  @_s.JsonKey(name: 'isDefaultVersion')
  final bool isDefaultVersion;

  /// The policy ARN.
  @_s.JsonKey(name: 'policyArn')
  final String policyArn;

  /// The JSON document that describes the policy.
  @_s.JsonKey(name: 'policyDocument')
  final String policyDocument;

  /// The policy version ID.
  @_s.JsonKey(name: 'policyVersionId')
  final String policyVersionId;

  CreatePolicyVersionResponse({
    this.isDefaultVersion,
    this.policyArn,
    this.policyDocument,
    this.policyVersionId,
  });
  factory CreatePolicyVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePolicyVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProvisioningClaimResponse {
  /// The ID of the certificate.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The provisioning claim certificate.
  @_s.JsonKey(name: 'certificatePem')
  final String certificatePem;

  /// The provisioning claim expiration time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expiration')
  final DateTime expiration;

  /// The provisioning claim key pair.
  @_s.JsonKey(name: 'keyPair')
  final KeyPair keyPair;

  CreateProvisioningClaimResponse({
    this.certificateId,
    this.certificatePem,
    this.expiration,
    this.keyPair,
  });
  factory CreateProvisioningClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProvisioningClaimResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProvisioningTemplateResponse {
  /// The default version of the fleet provisioning template.
  @_s.JsonKey(name: 'defaultVersionId')
  final int defaultVersionId;

  /// The ARN that identifies the provisioning template.
  @_s.JsonKey(name: 'templateArn')
  final String templateArn;

  /// The name of the fleet provisioning template.
  @_s.JsonKey(name: 'templateName')
  final String templateName;

  CreateProvisioningTemplateResponse({
    this.defaultVersionId,
    this.templateArn,
    this.templateName,
  });
  factory CreateProvisioningTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProvisioningTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProvisioningTemplateVersionResponse {
  /// True if the fleet provisioning template version is the default version,
  /// otherwise false.
  @_s.JsonKey(name: 'isDefaultVersion')
  final bool isDefaultVersion;

  /// The ARN that identifies the provisioning template.
  @_s.JsonKey(name: 'templateArn')
  final String templateArn;

  /// The name of the fleet provisioning template.
  @_s.JsonKey(name: 'templateName')
  final String templateName;

  /// The version of the fleet provisioning template.
  @_s.JsonKey(name: 'versionId')
  final int versionId;

  CreateProvisioningTemplateVersionResponse({
    this.isDefaultVersion,
    this.templateArn,
    this.templateName,
    this.versionId,
  });
  factory CreateProvisioningTemplateVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateProvisioningTemplateVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRoleAliasResponse {
  /// The role alias.
  @_s.JsonKey(name: 'roleAlias')
  final String roleAlias;

  /// The role alias ARN.
  @_s.JsonKey(name: 'roleAliasArn')
  final String roleAliasArn;

  CreateRoleAliasResponse({
    this.roleAlias,
    this.roleAliasArn,
  });
  factory CreateRoleAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoleAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  @_s.JsonKey(name: 'scheduledAuditArn')
  final String scheduledAuditArn;

  CreateScheduledAuditResponse({
    this.scheduledAuditArn,
  });
  factory CreateScheduledAuditResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduledAuditResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSecurityProfileResponse {
  /// The ARN of the security profile.
  @_s.JsonKey(name: 'securityProfileArn')
  final String securityProfileArn;

  /// The name you gave to the security profile.
  @_s.JsonKey(name: 'securityProfileName')
  final String securityProfileName;

  CreateSecurityProfileResponse({
    this.securityProfileArn,
    this.securityProfileName,
  });
  factory CreateSecurityProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSecurityProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStreamResponse {
  /// A description of the stream.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The stream ARN.
  @_s.JsonKey(name: 'streamArn')
  final String streamArn;

  /// The stream ID.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  /// The version of the stream.
  @_s.JsonKey(name: 'streamVersion')
  final int streamVersion;

  CreateStreamResponse({
    this.description,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });
  factory CreateStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateThingGroupResponse {
  /// The thing group ARN.
  @_s.JsonKey(name: 'thingGroupArn')
  final String thingGroupArn;

  /// The thing group ID.
  @_s.JsonKey(name: 'thingGroupId')
  final String thingGroupId;

  /// The thing group name.
  @_s.JsonKey(name: 'thingGroupName')
  final String thingGroupName;

  CreateThingGroupResponse({
    this.thingGroupArn,
    this.thingGroupId,
    this.thingGroupName,
  });
  factory CreateThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateThingGroupResponseFromJson(json);
}

/// The output of the CreateThing operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateThingResponse {
  /// The ARN of the new thing.
  @_s.JsonKey(name: 'thingArn')
  final String thingArn;

  /// The thing ID.
  @_s.JsonKey(name: 'thingId')
  final String thingId;

  /// The name of the new thing.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  CreateThingResponse({
    this.thingArn,
    this.thingId,
    this.thingName,
  });
  factory CreateThingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateThingResponseFromJson(json);
}

/// The output of the CreateThingType operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateThingTypeResponse {
  /// The Amazon Resource Name (ARN) of the thing type.
  @_s.JsonKey(name: 'thingTypeArn')
  final String thingTypeArn;

  /// The thing type ID.
  @_s.JsonKey(name: 'thingTypeId')
  final String thingTypeId;

  /// The name of the thing type.
  @_s.JsonKey(name: 'thingTypeName')
  final String thingTypeName;

  CreateThingTypeResponse({
    this.thingTypeArn,
    this.thingTypeId,
    this.thingTypeName,
  });
  factory CreateThingTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateThingTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTopicRuleDestinationResponse {
  /// The topic rule destination.
  @_s.JsonKey(name: 'topicRuleDestination')
  final TopicRuleDestination topicRuleDestination;

  CreateTopicRuleDestinationResponse({
    this.topicRuleDestination,
  });
  factory CreateTopicRuleDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateTopicRuleDestinationResponseFromJson(json);
}

/// Describes a custom method used to code sign a file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomCodeSigning {
  /// The certificate chain.
  @_s.JsonKey(name: 'certificateChain')
  final CodeSigningCertificateChain certificateChain;

  /// The hash algorithm used to code sign the file.
  @_s.JsonKey(name: 'hashAlgorithm')
  final String hashAlgorithm;

  /// The signature for the file.
  @_s.JsonKey(name: 'signature')
  final CodeSigningSignature signature;

  /// The signature algorithm used to code sign the file.
  @_s.JsonKey(name: 'signatureAlgorithm')
  final String signatureAlgorithm;

  CustomCodeSigning({
    this.certificateChain,
    this.hashAlgorithm,
    this.signature,
    this.signatureAlgorithm,
  });
  factory CustomCodeSigning.fromJson(Map<String, dynamic> json) =>
      _$CustomCodeSigningFromJson(json);

  Map<String, dynamic> toJson() => _$CustomCodeSigningToJson(this);
}

enum CustomMetricType {
  @_s.JsonValue('string-list')
  stringList,
  @_s.JsonValue('ip-address-list')
  ipAddressList,
  @_s.JsonValue('number-list')
  numberList,
  @_s.JsonValue('number')
  number,
}

extension on CustomMetricType {
  String toValue() {
    switch (this) {
      case CustomMetricType.stringList:
        return 'string-list';
      case CustomMetricType.ipAddressList:
        return 'ip-address-list';
      case CustomMetricType.numberList:
        return 'number-list';
      case CustomMetricType.number:
        return 'number';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DayOfWeek {
  @_s.JsonValue('SUN')
  sun,
  @_s.JsonValue('MON')
  mon,
  @_s.JsonValue('TUE')
  tue,
  @_s.JsonValue('WED')
  wed,
  @_s.JsonValue('THU')
  thu,
  @_s.JsonValue('FRI')
  fri,
  @_s.JsonValue('SAT')
  sat,
}

extension on DayOfWeek {
  String toValue() {
    switch (this) {
      case DayOfWeek.sun:
        return 'SUN';
      case DayOfWeek.mon:
        return 'MON';
      case DayOfWeek.tue:
        return 'TUE';
      case DayOfWeek.wed:
        return 'WED';
      case DayOfWeek.thu:
        return 'THU';
      case DayOfWeek.fri:
        return 'FRI';
      case DayOfWeek.sat:
        return 'SAT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAccountAuditConfigurationResponse {
  DeleteAccountAuditConfigurationResponse();
  factory DeleteAccountAuditConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAccountAuditConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAuditSuppressionResponse {
  DeleteAuditSuppressionResponse();
  factory DeleteAuditSuppressionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAuditSuppressionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAuthorizerResponse {
  DeleteAuthorizerResponse();
  factory DeleteAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteBillingGroupResponse {
  DeleteBillingGroupResponse();
  factory DeleteBillingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteBillingGroupResponseFromJson(json);
}

/// The output for the DeleteCACertificate operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCACertificateResponse {
  DeleteCACertificateResponse();
  factory DeleteCACertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCACertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteCustomMetricResponse {
  DeleteCustomMetricResponse();
  factory DeleteCustomMetricResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCustomMetricResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDimensionResponse {
  DeleteDimensionResponse();
  factory DeleteDimensionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDimensionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDomainConfigurationResponse {
  DeleteDomainConfigurationResponse();
  factory DeleteDomainConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteDomainConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDynamicThingGroupResponse {
  DeleteDynamicThingGroupResponse();
  factory DeleteDynamicThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDynamicThingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMitigationActionResponse {
  DeleteMitigationActionResponse();
  factory DeleteMitigationActionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMitigationActionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteOTAUpdateResponse {
  DeleteOTAUpdateResponse();
  factory DeleteOTAUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteOTAUpdateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProvisioningTemplateResponse {
  DeleteProvisioningTemplateResponse();
  factory DeleteProvisioningTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteProvisioningTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProvisioningTemplateVersionResponse {
  DeleteProvisioningTemplateVersionResponse();
  factory DeleteProvisioningTemplateVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteProvisioningTemplateVersionResponseFromJson(json);
}

/// The output for the DeleteRegistrationCode operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRegistrationCodeResponse {
  DeleteRegistrationCodeResponse();
  factory DeleteRegistrationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRegistrationCodeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRoleAliasResponse {
  DeleteRoleAliasResponse();
  factory DeleteRoleAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRoleAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteScheduledAuditResponse {
  DeleteScheduledAuditResponse();
  factory DeleteScheduledAuditResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteScheduledAuditResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSecurityProfileResponse {
  DeleteSecurityProfileResponse();
  factory DeleteSecurityProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteSecurityProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteStreamResponse {
  DeleteStreamResponse();
  factory DeleteStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteThingGroupResponse {
  DeleteThingGroupResponse();
  factory DeleteThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThingGroupResponseFromJson(json);
}

/// The output of the DeleteThing operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteThingResponse {
  DeleteThingResponse();
  factory DeleteThingResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThingResponseFromJson(json);
}

/// The output for the DeleteThingType operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteThingTypeResponse {
  DeleteThingTypeResponse();
  factory DeleteThingTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteThingTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTopicRuleDestinationResponse {
  DeleteTopicRuleDestinationResponse();
  factory DeleteTopicRuleDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteTopicRuleDestinationResponseFromJson(json);
}

/// Contains information that denied the authorization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Denied {
  /// Information that explicitly denies the authorization.
  @_s.JsonKey(name: 'explicitDeny')
  final ExplicitDeny explicitDeny;

  /// Information that implicitly denies the authorization. When a policy doesn't
  /// explicitly deny or allow an action on a resource it is considered an
  /// implicit deny.
  @_s.JsonKey(name: 'implicitDeny')
  final ImplicitDeny implicitDeny;

  Denied({
    this.explicitDeny,
    this.implicitDeny,
  });
  factory Denied.fromJson(Map<String, dynamic> json) => _$DeniedFromJson(json);
}

/// The output for the DeprecateThingType operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeprecateThingTypeResponse {
  DeprecateThingTypeResponse();
  factory DeprecateThingTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeprecateThingTypeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAccountAuditConfigurationResponse {
  /// Which audit checks are enabled and disabled for this account.
  @_s.JsonKey(name: 'auditCheckConfigurations')
  final Map<String, AuditCheckConfiguration> auditCheckConfigurations;

  /// Information about the targets to which audit notifications are sent for this
  /// account.
  @_s.JsonKey(name: 'auditNotificationTargetConfigurations')
  final Map<AuditNotificationType, AuditNotificationTarget>
      auditNotificationTargetConfigurations;

  /// The ARN of the role that grants permission to AWS IoT to access information
  /// about your devices, policies, certificates, and other items as required when
  /// performing an audit.
  ///
  /// On the first call to <code>UpdateAccountAuditConfiguration</code>, this
  /// parameter is required.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  DescribeAccountAuditConfigurationResponse({
    this.auditCheckConfigurations,
    this.auditNotificationTargetConfigurations,
    this.roleArn,
  });
  factory DescribeAccountAuditConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAccountAuditConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAuditFindingResponse {
  @_s.JsonKey(name: 'finding')
  final AuditFinding finding;

  DescribeAuditFindingResponse({
    this.finding,
  });
  factory DescribeAuditFindingResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAuditFindingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAuditMitigationActionsTaskResponse {
  /// Specifies the mitigation actions and their parameters that are applied as
  /// part of this task.
  @_s.JsonKey(name: 'actionsDefinition')
  final List<MitigationAction> actionsDefinition;

  /// Specifies the mitigation actions that should be applied to specific audit
  /// checks.
  @_s.JsonKey(name: 'auditCheckToActionsMapping')
  final Map<String, List<String>> auditCheckToActionsMapping;

  /// The date and time when the task was completed or canceled.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The date and time when the task was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// Identifies the findings to which the mitigation actions are applied. This
  /// can be by audit checks, by audit task, or a set of findings.
  @_s.JsonKey(name: 'target')
  final AuditMitigationActionsTaskTarget target;

  /// Aggregate counts of the results when the mitigation tasks were applied to
  /// the findings for this audit mitigation actions task.
  @_s.JsonKey(name: 'taskStatistics')
  final Map<String, TaskStatisticsForAuditCheck> taskStatistics;

  /// The current status of the task.
  @_s.JsonKey(name: 'taskStatus')
  final AuditMitigationActionsTaskStatus taskStatus;

  DescribeAuditMitigationActionsTaskResponse({
    this.actionsDefinition,
    this.auditCheckToActionsMapping,
    this.endTime,
    this.startTime,
    this.target,
    this.taskStatistics,
    this.taskStatus,
  });
  factory DescribeAuditMitigationActionsTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAuditMitigationActionsTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAuditSuppressionResponse {
  @_s.JsonKey(name: 'checkName')
  final String checkName;

  /// The description of the audit suppression.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The epoch timestamp in seconds at which this suppression expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expirationDate')
  final DateTime expirationDate;
  @_s.JsonKey(name: 'resourceIdentifier')
  final ResourceIdentifier resourceIdentifier;

  /// Indicates whether a suppression should exist indefinitely or not.
  @_s.JsonKey(name: 'suppressIndefinitely')
  final bool suppressIndefinitely;

  DescribeAuditSuppressionResponse({
    this.checkName,
    this.description,
    this.expirationDate,
    this.resourceIdentifier,
    this.suppressIndefinitely,
  });
  factory DescribeAuditSuppressionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAuditSuppressionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAuditTaskResponse {
  /// Detailed information about each check performed during this audit.
  @_s.JsonKey(name: 'auditDetails')
  final Map<String, AuditCheckDetails> auditDetails;

  /// The name of the scheduled audit (only if the audit was a scheduled audit).
  @_s.JsonKey(name: 'scheduledAuditName')
  final String scheduledAuditName;

  /// The time the audit started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'taskStartTime')
  final DateTime taskStartTime;

  /// Statistical information about the audit.
  @_s.JsonKey(name: 'taskStatistics')
  final TaskStatistics taskStatistics;

  /// The status of the audit: one of "IN_PROGRESS", "COMPLETED", "FAILED", or
  /// "CANCELED".
  @_s.JsonKey(name: 'taskStatus')
  final AuditTaskStatus taskStatus;

  /// The type of audit: "ON_DEMAND_AUDIT_TASK" or "SCHEDULED_AUDIT_TASK".
  @_s.JsonKey(name: 'taskType')
  final AuditTaskType taskType;

  DescribeAuditTaskResponse({
    this.auditDetails,
    this.scheduledAuditName,
    this.taskStartTime,
    this.taskStatistics,
    this.taskStatus,
    this.taskType,
  });
  factory DescribeAuditTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAuditTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAuthorizerResponse {
  /// The authorizer description.
  @_s.JsonKey(name: 'authorizerDescription')
  final AuthorizerDescription authorizerDescription;

  DescribeAuthorizerResponse({
    this.authorizerDescription,
  });
  factory DescribeAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeBillingGroupResponse {
  /// The ARN of the billing group.
  @_s.JsonKey(name: 'billingGroupArn')
  final String billingGroupArn;

  /// The ID of the billing group.
  @_s.JsonKey(name: 'billingGroupId')
  final String billingGroupId;

  /// Additional information about the billing group.
  @_s.JsonKey(name: 'billingGroupMetadata')
  final BillingGroupMetadata billingGroupMetadata;

  /// The name of the billing group.
  @_s.JsonKey(name: 'billingGroupName')
  final String billingGroupName;

  /// The properties of the billing group.
  @_s.JsonKey(name: 'billingGroupProperties')
  final BillingGroupProperties billingGroupProperties;

  /// The version of the billing group.
  @_s.JsonKey(name: 'version')
  final int version;

  DescribeBillingGroupResponse({
    this.billingGroupArn,
    this.billingGroupId,
    this.billingGroupMetadata,
    this.billingGroupName,
    this.billingGroupProperties,
    this.version,
  });
  factory DescribeBillingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeBillingGroupResponseFromJson(json);
}

/// The output from the DescribeCACertificate operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCACertificateResponse {
  /// The CA certificate description.
  @_s.JsonKey(name: 'certificateDescription')
  final CACertificateDescription certificateDescription;

  /// Information about the registration configuration.
  @_s.JsonKey(name: 'registrationConfig')
  final RegistrationConfig registrationConfig;

  DescribeCACertificateResponse({
    this.certificateDescription,
    this.registrationConfig,
  });
  factory DescribeCACertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCACertificateResponseFromJson(json);
}

/// The output of the DescribeCertificate operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCertificateResponse {
  /// The description of the certificate.
  @_s.JsonKey(name: 'certificateDescription')
  final CertificateDescription certificateDescription;

  DescribeCertificateResponse({
    this.certificateDescription,
  });
  factory DescribeCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCustomMetricResponse {
  /// The creation date of the custom metric in milliseconds since epoch.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// Field represents a friendly name in the console for the custom metric;
  /// doesn't have to be unique. Don't use this name as the metric identifier in
  /// the device metric report. Can be updated.
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The time the custom metric was last modified in milliseconds since epoch.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The Amazon Resource Number (ARN) of the custom metric.
  @_s.JsonKey(name: 'metricArn')
  final String metricArn;

  /// The name of the custom metric.
  @_s.JsonKey(name: 'metricName')
  final String metricName;

  /// The type of the custom metric. Types include <code>string-list</code>,
  /// <code>ip-address-list</code>, <code>number-list</code>, and
  /// <code>number</code>.
  @_s.JsonKey(name: 'metricType')
  final CustomMetricType metricType;

  DescribeCustomMetricResponse({
    this.creationDate,
    this.displayName,
    this.lastModifiedDate,
    this.metricArn,
    this.metricName,
    this.metricType,
  });
  factory DescribeCustomMetricResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCustomMetricResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDefaultAuthorizerResponse {
  /// The default authorizer's description.
  @_s.JsonKey(name: 'authorizerDescription')
  final AuthorizerDescription authorizerDescription;

  DescribeDefaultAuthorizerResponse({
    this.authorizerDescription,
  });
  factory DescribeDefaultAuthorizerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDefaultAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDetectMitigationActionsTaskResponse {
  /// The description of a task.
  @_s.JsonKey(name: 'taskSummary')
  final DetectMitigationActionsTaskSummary taskSummary;

  DescribeDetectMitigationActionsTaskResponse({
    this.taskSummary,
  });
  factory DescribeDetectMitigationActionsTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDetectMitigationActionsTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDimensionResponse {
  /// The Amazon Resource Name (ARN) for the dimension.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date the dimension was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The date the dimension was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The unique identifier for the dimension.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The value or list of values used to scope the dimension. For example, for
  /// topic filters, this is the pattern used to match the MQTT topic name.
  @_s.JsonKey(name: 'stringValues')
  final List<String> stringValues;

  /// The type of the dimension.
  @_s.JsonKey(name: 'type')
  final DimensionType type;

  DescribeDimensionResponse({
    this.arn,
    this.creationDate,
    this.lastModifiedDate,
    this.name,
    this.stringValues,
    this.type,
  });
  factory DescribeDimensionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDimensionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDomainConfigurationResponse {
  /// An object that specifies the authorization service for a domain.
  @_s.JsonKey(name: 'authorizerConfig')
  final AuthorizerConfig authorizerConfig;

  /// The ARN of the domain configuration.
  @_s.JsonKey(name: 'domainConfigurationArn')
  final String domainConfigurationArn;

  /// The name of the domain configuration.
  @_s.JsonKey(name: 'domainConfigurationName')
  final String domainConfigurationName;

  /// A Boolean value that specifies the current state of the domain
  /// configuration.
  @_s.JsonKey(name: 'domainConfigurationStatus')
  final DomainConfigurationStatus domainConfigurationStatus;

  /// The name of the domain.
  @_s.JsonKey(name: 'domainName')
  final String domainName;

  /// The type of the domain.
  @_s.JsonKey(name: 'domainType')
  final DomainType domainType;

  /// The date and time the domain configuration's status was last changed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStatusChangeDate')
  final DateTime lastStatusChangeDate;

  /// A list containing summary information about the server certificate included
  /// in the domain configuration.
  @_s.JsonKey(name: 'serverCertificates')
  final List<ServerCertificateSummary> serverCertificates;

  /// The type of service delivered by the endpoint.
  @_s.JsonKey(name: 'serviceType')
  final ServiceType serviceType;

  DescribeDomainConfigurationResponse({
    this.authorizerConfig,
    this.domainConfigurationArn,
    this.domainConfigurationName,
    this.domainConfigurationStatus,
    this.domainName,
    this.domainType,
    this.lastStatusChangeDate,
    this.serverCertificates,
    this.serviceType,
  });
  factory DescribeDomainConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeDomainConfigurationResponseFromJson(json);
}

/// The output from the DescribeEndpoint operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointResponse {
  /// The endpoint. The format of the endpoint is as follows:
  /// <i>identifier</i>.iot.<i>region</i>.amazonaws.com.
  @_s.JsonKey(name: 'endpointAddress')
  final String endpointAddress;

  DescribeEndpointResponse({
    this.endpointAddress,
  });
  factory DescribeEndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEventConfigurationsResponse {
  /// The creation date of the event configuration.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The event configurations.
  @_s.JsonKey(name: 'eventConfigurations')
  final Map<EventType, Configuration> eventConfigurations;

  /// The date the event configurations were last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  DescribeEventConfigurationsResponse({
    this.creationDate,
    this.eventConfigurations,
    this.lastModifiedDate,
  });
  factory DescribeEventConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEventConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIndexResponse {
  /// The index name.
  @_s.JsonKey(name: 'indexName')
  final String indexName;

  /// The index status.
  @_s.JsonKey(name: 'indexStatus')
  final IndexStatus indexStatus;

  /// Contains a value that specifies the type of indexing performed. Valid values
  /// are:
  ///
  /// <ul>
  /// <li>
  /// REGISTRY – Your thing index contains only registry data.
  /// </li>
  /// <li>
  /// REGISTRY_AND_SHADOW - Your thing index contains registry data and shadow
  /// data.
  /// </li>
  /// <li>
  /// REGISTRY_AND_CONNECTIVITY_STATUS - Your thing index contains registry data
  /// and thing connectivity status data.
  /// </li>
  /// <li>
  /// REGISTRY_AND_SHADOW_AND_CONNECTIVITY_STATUS - Your thing index contains
  /// registry data, shadow data, and thing connectivity status data.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'schema')
  final String schema;

  DescribeIndexResponse({
    this.indexName,
    this.indexStatus,
    this.schema,
  });
  factory DescribeIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobExecutionResponse {
  /// Information about the job execution.
  @_s.JsonKey(name: 'execution')
  final JobExecution execution;

  DescribeJobExecutionResponse({
    this.execution,
  });
  factory DescribeJobExecutionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobExecutionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeJobResponse {
  /// An S3 link to the job document.
  @_s.JsonKey(name: 'documentSource')
  final String documentSource;

  /// Information about the job.
  @_s.JsonKey(name: 'job')
  final Job job;

  DescribeJobResponse({
    this.documentSource,
    this.job,
  });
  factory DescribeJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMitigationActionResponse {
  /// The ARN that identifies this migration action.
  @_s.JsonKey(name: 'actionArn')
  final String actionArn;

  /// A unique identifier for this action.
  @_s.JsonKey(name: 'actionId')
  final String actionId;

  /// The friendly name that uniquely identifies the mitigation action.
  @_s.JsonKey(name: 'actionName')
  final String actionName;

  /// Parameters that control how the mitigation action is applied, specific to
  /// the type of mitigation action.
  @_s.JsonKey(name: 'actionParams')
  final MitigationActionParams actionParams;

  /// The type of mitigation action.
  @_s.JsonKey(name: 'actionType')
  final MitigationActionType actionType;

  /// The date and time when the mitigation action was added to your AWS account.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The date and time when the mitigation action was last changed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The ARN of the IAM role used to apply this action.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  DescribeMitigationActionResponse({
    this.actionArn,
    this.actionId,
    this.actionName,
    this.actionParams,
    this.actionType,
    this.creationDate,
    this.lastModifiedDate,
    this.roleArn,
  });
  factory DescribeMitigationActionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMitigationActionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProvisioningTemplateResponse {
  /// The date when the fleet provisioning template was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The default fleet template version ID.
  @_s.JsonKey(name: 'defaultVersionId')
  final int defaultVersionId;

  /// The description of the fleet provisioning template.
  @_s.JsonKey(name: 'description')
  final String description;

  /// True if the fleet provisioning template is enabled, otherwise false.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The date when the fleet provisioning template was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// Gets information about a pre-provisioned hook.
  @_s.JsonKey(name: 'preProvisioningHook')
  final ProvisioningHook preProvisioningHook;

  /// The ARN of the role associated with the provisioning template. This IoT role
  /// grants permission to provision a device.
  @_s.JsonKey(name: 'provisioningRoleArn')
  final String provisioningRoleArn;

  /// The ARN of the fleet provisioning template.
  @_s.JsonKey(name: 'templateArn')
  final String templateArn;

  /// The JSON formatted contents of the fleet provisioning template.
  @_s.JsonKey(name: 'templateBody')
  final String templateBody;

  /// The name of the fleet provisioning template.
  @_s.JsonKey(name: 'templateName')
  final String templateName;

  DescribeProvisioningTemplateResponse({
    this.creationDate,
    this.defaultVersionId,
    this.description,
    this.enabled,
    this.lastModifiedDate,
    this.preProvisioningHook,
    this.provisioningRoleArn,
    this.templateArn,
    this.templateBody,
    this.templateName,
  });
  factory DescribeProvisioningTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeProvisioningTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProvisioningTemplateVersionResponse {
  /// The date when the fleet provisioning template version was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// True if the fleet provisioning template version is the default version.
  @_s.JsonKey(name: 'isDefaultVersion')
  final bool isDefaultVersion;

  /// The JSON formatted contents of the fleet provisioning template version.
  @_s.JsonKey(name: 'templateBody')
  final String templateBody;

  /// The fleet provisioning template version ID.
  @_s.JsonKey(name: 'versionId')
  final int versionId;

  DescribeProvisioningTemplateVersionResponse({
    this.creationDate,
    this.isDefaultVersion,
    this.templateBody,
    this.versionId,
  });
  factory DescribeProvisioningTemplateVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeProvisioningTemplateVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRoleAliasResponse {
  /// The role alias description.
  @_s.JsonKey(name: 'roleAliasDescription')
  final RoleAliasDescription roleAliasDescription;

  DescribeRoleAliasResponse({
    this.roleAliasDescription,
  });
  factory DescribeRoleAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRoleAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScheduledAuditResponse {
  /// The day of the month on which the scheduled audit takes place. This is will
  /// be <code>1</code> through <code>31</code> or <code>LAST</code>. If days
  /// <code>29</code>-<code>31</code> are specified, and the month does not have
  /// that many days, the audit takes place on the <code>LAST</code> day of the
  /// month.
  @_s.JsonKey(name: 'dayOfMonth')
  final String dayOfMonth;

  /// The day of the week on which the scheduled audit takes place, either one of
  /// <code>SUN</code>, <code>MON</code>, <code>TUE</code>, <code>WED</code>,
  /// <code>THU</code>, <code>FRI</code>, or <code>SAT</code>.
  @_s.JsonKey(name: 'dayOfWeek')
  final DayOfWeek dayOfWeek;

  /// How often the scheduled audit takes place, either one of <code>DAILY</code>,
  /// <code>WEEKLY</code>, <code>BIWEEKLY</code>, or <code>MONTHLY</code>. The
  /// start time of each audit is determined by the system.
  @_s.JsonKey(name: 'frequency')
  final AuditFrequency frequency;

  /// The ARN of the scheduled audit.
  @_s.JsonKey(name: 'scheduledAuditArn')
  final String scheduledAuditArn;

  /// The name of the scheduled audit.
  @_s.JsonKey(name: 'scheduledAuditName')
  final String scheduledAuditName;

  /// Which checks are performed during the scheduled audit. Checks must be
  /// enabled for your account. (Use
  /// <code>DescribeAccountAuditConfiguration</code> to see the list of all
  /// checks, including those that are enabled or use
  /// <code>UpdateAccountAuditConfiguration</code> to select which checks are
  /// enabled.)
  @_s.JsonKey(name: 'targetCheckNames')
  final List<String> targetCheckNames;

  DescribeScheduledAuditResponse({
    this.dayOfMonth,
    this.dayOfWeek,
    this.frequency,
    this.scheduledAuditArn,
    this.scheduledAuditName,
    this.targetCheckNames,
  });
  factory DescribeScheduledAuditResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeScheduledAuditResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSecurityProfileResponse {
  /// <i>Please use
  /// <a>DescribeSecurityProfileResponse$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's <code>behaviors</code>, but it
  /// is also retained for any metric specified here.
  @_s.JsonKey(name: 'additionalMetricsToRetain')
  final List<String> additionalMetricsToRetain;

  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's behaviors, but it is also
  /// retained for any metric specified here.
  @_s.JsonKey(name: 'additionalMetricsToRetainV2')
  final List<MetricToRetain> additionalMetricsToRetainV2;

  /// Where the alerts are sent. (Alerts are always sent to the console.)
  @_s.JsonKey(name: 'alertTargets')
  final Map<AlertTargetType, AlertTarget> alertTargets;

  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  @_s.JsonKey(name: 'behaviors')
  final List<Behavior> behaviors;

  /// The time the security profile was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The time the security profile was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The ARN of the security profile.
  @_s.JsonKey(name: 'securityProfileArn')
  final String securityProfileArn;

  /// A description of the security profile (associated with the security profile
  /// when it was created or updated).
  @_s.JsonKey(name: 'securityProfileDescription')
  final String securityProfileDescription;

  /// The name of the security profile.
  @_s.JsonKey(name: 'securityProfileName')
  final String securityProfileName;

  /// The version of the security profile. A new version is generated whenever the
  /// security profile is updated.
  @_s.JsonKey(name: 'version')
  final int version;

  DescribeSecurityProfileResponse({
    this.additionalMetricsToRetain,
    this.additionalMetricsToRetainV2,
    this.alertTargets,
    this.behaviors,
    this.creationDate,
    this.lastModifiedDate,
    this.securityProfileArn,
    this.securityProfileDescription,
    this.securityProfileName,
    this.version,
  });
  factory DescribeSecurityProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSecurityProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStreamResponse {
  /// Information about the stream.
  @_s.JsonKey(name: 'streamInfo')
  final StreamInfo streamInfo;

  DescribeStreamResponse({
    this.streamInfo,
  });
  factory DescribeStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeThingGroupResponse {
  /// The dynamic thing group index name.
  @_s.JsonKey(name: 'indexName')
  final String indexName;

  /// The dynamic thing group search query string.
  @_s.JsonKey(name: 'queryString')
  final String queryString;

  /// The dynamic thing group query version.
  @_s.JsonKey(name: 'queryVersion')
  final String queryVersion;

  /// The dynamic thing group status.
  @_s.JsonKey(name: 'status')
  final DynamicGroupStatus status;

  /// The thing group ARN.
  @_s.JsonKey(name: 'thingGroupArn')
  final String thingGroupArn;

  /// The thing group ID.
  @_s.JsonKey(name: 'thingGroupId')
  final String thingGroupId;

  /// Thing group metadata.
  @_s.JsonKey(name: 'thingGroupMetadata')
  final ThingGroupMetadata thingGroupMetadata;

  /// The name of the thing group.
  @_s.JsonKey(name: 'thingGroupName')
  final String thingGroupName;

  /// The thing group properties.
  @_s.JsonKey(name: 'thingGroupProperties')
  final ThingGroupProperties thingGroupProperties;

  /// The version of the thing group.
  @_s.JsonKey(name: 'version')
  final int version;

  DescribeThingGroupResponse({
    this.indexName,
    this.queryString,
    this.queryVersion,
    this.status,
    this.thingGroupArn,
    this.thingGroupId,
    this.thingGroupMetadata,
    this.thingGroupName,
    this.thingGroupProperties,
    this.version,
  });
  factory DescribeThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeThingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeThingRegistrationTaskResponse {
  /// The task creation date.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The number of things that failed to be provisioned.
  @_s.JsonKey(name: 'failureCount')
  final int failureCount;

  /// The S3 bucket that contains the input file.
  @_s.JsonKey(name: 'inputFileBucket')
  final String inputFileBucket;

  /// The input file key.
  @_s.JsonKey(name: 'inputFileKey')
  final String inputFileKey;

  /// The date when the task was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The message.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The progress of the bulk provisioning task expressed as a percentage.
  @_s.JsonKey(name: 'percentageProgress')
  final int percentageProgress;

  /// The role ARN that grants access to the input file bucket.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The status of the bulk thing provisioning task.
  @_s.JsonKey(name: 'status')
  final Status status;

  /// The number of things successfully provisioned.
  @_s.JsonKey(name: 'successCount')
  final int successCount;

  /// The task ID.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  /// The task's template.
  @_s.JsonKey(name: 'templateBody')
  final String templateBody;

  DescribeThingRegistrationTaskResponse({
    this.creationDate,
    this.failureCount,
    this.inputFileBucket,
    this.inputFileKey,
    this.lastModifiedDate,
    this.message,
    this.percentageProgress,
    this.roleArn,
    this.status,
    this.successCount,
    this.taskId,
    this.templateBody,
  });
  factory DescribeThingRegistrationTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeThingRegistrationTaskResponseFromJson(json);
}

/// The output from the DescribeThing operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeThingResponse {
  /// The thing attributes.
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// The name of the billing group the thing belongs to.
  @_s.JsonKey(name: 'billingGroupName')
  final String billingGroupName;

  /// The default MQTT client ID. For a typical device, the thing name is also
  /// used as the default MQTT client ID. Although we don’t require a mapping
  /// between a thing's registry name and its use of MQTT client IDs,
  /// certificates, or shadow state, we recommend that you choose a thing name and
  /// use it as the MQTT client ID for the registry and the Device Shadow service.
  ///
  /// This lets you better organize your AWS IoT fleet without removing the
  /// flexibility of the underlying device certificate model or shadows.
  @_s.JsonKey(name: 'defaultClientId')
  final String defaultClientId;

  /// The ARN of the thing to describe.
  @_s.JsonKey(name: 'thingArn')
  final String thingArn;

  /// The ID of the thing to describe.
  @_s.JsonKey(name: 'thingId')
  final String thingId;

  /// The name of the thing.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The thing type name.
  @_s.JsonKey(name: 'thingTypeName')
  final String thingTypeName;

  /// The current version of the thing record in the registry.
  /// <note>
  /// To avoid unintentional changes to the information in the registry, you can
  /// pass the version information in the <code>expectedVersion</code> parameter
  /// of the <code>UpdateThing</code> and <code>DeleteThing</code> calls.
  /// </note>
  @_s.JsonKey(name: 'version')
  final int version;

  DescribeThingResponse({
    this.attributes,
    this.billingGroupName,
    this.defaultClientId,
    this.thingArn,
    this.thingId,
    this.thingName,
    this.thingTypeName,
    this.version,
  });
  factory DescribeThingResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeThingResponseFromJson(json);
}

/// The output for the DescribeThingType operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeThingTypeResponse {
  /// The thing type ARN.
  @_s.JsonKey(name: 'thingTypeArn')
  final String thingTypeArn;

  /// The thing type ID.
  @_s.JsonKey(name: 'thingTypeId')
  final String thingTypeId;

  /// The ThingTypeMetadata contains additional information about the thing type
  /// including: creation date and time, a value indicating whether the thing type
  /// is deprecated, and a date and time when it was deprecated.
  @_s.JsonKey(name: 'thingTypeMetadata')
  final ThingTypeMetadata thingTypeMetadata;

  /// The name of the thing type.
  @_s.JsonKey(name: 'thingTypeName')
  final String thingTypeName;

  /// The ThingTypeProperties contains information about the thing type including
  /// description, and a list of searchable thing attribute names.
  @_s.JsonKey(name: 'thingTypeProperties')
  final ThingTypeProperties thingTypeProperties;

  DescribeThingTypeResponse({
    this.thingTypeArn,
    this.thingTypeId,
    this.thingTypeMetadata,
    this.thingTypeName,
    this.thingTypeProperties,
  });
  factory DescribeThingTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeThingTypeResponseFromJson(json);
}

/// Describes the location of the updated firmware.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Destination {
  /// Describes the location in S3 of the updated firmware.
  @_s.JsonKey(name: 's3Destination')
  final S3Destination s3Destination;

  Destination({
    this.s3Destination,
  });
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachSecurityProfileResponse {
  DetachSecurityProfileResponse();
  factory DetachSecurityProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DetachSecurityProfileResponseFromJson(json);
}

/// The output from the DetachThingPrincipal operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetachThingPrincipalResponse {
  DetachThingPrincipalResponse();
  factory DetachThingPrincipalResponse.fromJson(Map<String, dynamic> json) =>
      _$DetachThingPrincipalResponseFromJson(json);
}

/// Describes which mitigation actions should be executed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectMitigationActionExecution {
  /// The friendly name that uniquely identifies the mitigation action.
  @_s.JsonKey(name: 'actionName')
  final String actionName;

  /// The error code of a mitigation action.
  @_s.JsonKey(name: 'errorCode')
  final String errorCode;

  /// The date a mitigation action ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'executionEndDate')
  final DateTime executionEndDate;

  /// The date a mitigation action was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'executionStartDate')
  final DateTime executionStartDate;

  /// The message of a mitigation action.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The status of a mitigation action.
  @_s.JsonKey(name: 'status')
  final DetectMitigationActionExecutionStatus status;

  /// The unique identifier of the task.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  /// The name of the thing.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The unique identifier of the violation.
  @_s.JsonKey(name: 'violationId')
  final String violationId;

  DetectMitigationActionExecution({
    this.actionName,
    this.errorCode,
    this.executionEndDate,
    this.executionStartDate,
    this.message,
    this.status,
    this.taskId,
    this.thingName,
    this.violationId,
  });
  factory DetectMitigationActionExecution.fromJson(Map<String, dynamic> json) =>
      _$DetectMitigationActionExecutionFromJson(json);
}

enum DetectMitigationActionExecutionStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCESSFUL')
  successful,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SKIPPED')
  skipped,
}

/// The statistics of a mitigation action task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectMitigationActionsTaskStatistics {
  /// The actions that were performed.
  @_s.JsonKey(name: 'actionsExecuted')
  final int actionsExecuted;

  /// The actions that failed.
  @_s.JsonKey(name: 'actionsFailed')
  final int actionsFailed;

  /// The actions that were skipped.
  @_s.JsonKey(name: 'actionsSkipped')
  final int actionsSkipped;

  DetectMitigationActionsTaskStatistics({
    this.actionsExecuted,
    this.actionsFailed,
    this.actionsSkipped,
  });
  factory DetectMitigationActionsTaskStatistics.fromJson(
          Map<String, dynamic> json) =>
      _$DetectMitigationActionsTaskStatisticsFromJson(json);
}

enum DetectMitigationActionsTaskStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCESSFUL')
  successful,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('CANCELED')
  canceled,
}

/// The summary of the mitigation action tasks.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectMitigationActionsTaskSummary {
  /// The definition of the actions.
  @_s.JsonKey(name: 'actionsDefinition')
  final List<MitigationAction> actionsDefinition;

  /// Includes only active violations.
  @_s.JsonKey(name: 'onlyActiveViolationsIncluded')
  final bool onlyActiveViolationsIncluded;

  /// Includes suppressed alerts.
  @_s.JsonKey(name: 'suppressedAlertsIncluded')
  final bool suppressedAlertsIncluded;

  /// Specifies the ML Detect findings to which the mitigation actions are
  /// applied.
  @_s.JsonKey(name: 'target')
  final DetectMitigationActionsTaskTarget target;

  /// The date the task ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'taskEndTime')
  final DateTime taskEndTime;

  /// The unique identifier of the task.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  /// The date the task started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'taskStartTime')
  final DateTime taskStartTime;

  /// The statistics of a mitigation action task.
  @_s.JsonKey(name: 'taskStatistics')
  final DetectMitigationActionsTaskStatistics taskStatistics;

  /// The status of the task.
  @_s.JsonKey(name: 'taskStatus')
  final DetectMitigationActionsTaskStatus taskStatus;

  /// Specifies the time period of which violation events occurred between.
  @_s.JsonKey(name: 'violationEventOccurrenceRange')
  final ViolationEventOccurrenceRange violationEventOccurrenceRange;

  DetectMitigationActionsTaskSummary({
    this.actionsDefinition,
    this.onlyActiveViolationsIncluded,
    this.suppressedAlertsIncluded,
    this.target,
    this.taskEndTime,
    this.taskId,
    this.taskStartTime,
    this.taskStatistics,
    this.taskStatus,
    this.violationEventOccurrenceRange,
  });
  factory DetectMitigationActionsTaskSummary.fromJson(
          Map<String, dynamic> json) =>
      _$DetectMitigationActionsTaskSummaryFromJson(json);
}

/// The target of a mitigation action task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DetectMitigationActionsTaskTarget {
  /// The name of the behavior.
  @_s.JsonKey(name: 'behaviorName')
  final String behaviorName;

  /// The name of the security profile.
  @_s.JsonKey(name: 'securityProfileName')
  final String securityProfileName;

  /// The unique identifiers of the violations.
  @_s.JsonKey(name: 'violationIds')
  final List<String> violationIds;

  DetectMitigationActionsTaskTarget({
    this.behaviorName,
    this.securityProfileName,
    this.violationIds,
  });
  factory DetectMitigationActionsTaskTarget.fromJson(
          Map<String, dynamic> json) =>
      _$DetectMitigationActionsTaskTargetFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DetectMitigationActionsTaskTargetToJson(this);
}

enum DeviceCertificateUpdateAction {
  @_s.JsonValue('DEACTIVATE')
  deactivate,
}

enum DimensionType {
  @_s.JsonValue('TOPIC_FILTER')
  topicFilter,
}

extension on DimensionType {
  String toValue() {
    switch (this) {
      case DimensionType.topicFilter:
        return 'TOPIC_FILTER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DimensionValueOperator {
  @_s.JsonValue('IN')
  $in,
  @_s.JsonValue('NOT_IN')
  notIn,
}

enum DomainConfigurationStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on DomainConfigurationStatus {
  String toValue() {
    switch (this) {
      case DomainConfigurationStatus.enabled:
        return 'ENABLED';
      case DomainConfigurationStatus.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The summary of a domain configuration. A domain configuration specifies
/// custom IoT-specific information about a domain. A domain configuration can
/// be associated with an AWS-managed domain (for example,
/// dbc123defghijk.iot.us-west-2.amazonaws.com), a customer managed domain, or a
/// default endpoint.
///
/// <ul>
/// <li>
/// Data
/// </li>
/// <li>
/// Jobs
/// </li>
/// <li>
/// CredentialProvider
/// </li>
/// </ul> <note>
/// The domain configuration feature is in public preview and is subject to
/// change.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainConfigurationSummary {
  /// The ARN of the domain configuration.
  @_s.JsonKey(name: 'domainConfigurationArn')
  final String domainConfigurationArn;

  /// The name of the domain configuration. This value must be unique to a region.
  @_s.JsonKey(name: 'domainConfigurationName')
  final String domainConfigurationName;

  /// The type of service delivered by the endpoint.
  @_s.JsonKey(name: 'serviceType')
  final ServiceType serviceType;

  DomainConfigurationSummary({
    this.domainConfigurationArn,
    this.domainConfigurationName,
    this.serviceType,
  });
  factory DomainConfigurationSummary.fromJson(Map<String, dynamic> json) =>
      _$DomainConfigurationSummaryFromJson(json);
}

enum DomainType {
  @_s.JsonValue('ENDPOINT')
  endpoint,
  @_s.JsonValue('AWS_MANAGED')
  awsManaged,
  @_s.JsonValue('CUSTOMER_MANAGED')
  customerManaged,
}

enum DynamicGroupStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('BUILDING')
  building,
  @_s.JsonValue('REBUILDING')
  rebuilding,
}

/// Describes an action to write to a DynamoDB table.
///
/// The <code>tableName</code>, <code>hashKeyField</code>, and
/// <code>rangeKeyField</code> values must match the values used when you
/// created the table.
///
/// The <code>hashKeyValue</code> and <code>rangeKeyvalue</code> fields use a
/// substitution template syntax. These templates provide data at runtime. The
/// syntax is as follows: ${<i>sql-expression</i>}.
///
/// You can specify any valid expression in a WHERE or SELECT clause, including
/// JSON properties, comparisons, calculations, and functions. For example, the
/// following field uses the third level of the topic:
///
/// <code>"hashKeyValue": "${topic(3)}"</code>
///
/// The following field uses the timestamp:
///
/// <code>"rangeKeyValue": "${timestamp()}"</code>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynamoDBAction {
  /// The hash key name.
  @_s.JsonKey(name: 'hashKeyField')
  final String hashKeyField;

  /// The hash key value.
  @_s.JsonKey(name: 'hashKeyValue')
  final String hashKeyValue;

  /// The ARN of the IAM role that grants access to the DynamoDB table.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The name of the DynamoDB table.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  /// The hash key type. Valid values are "STRING" or "NUMBER"
  @_s.JsonKey(name: 'hashKeyType')
  final DynamoKeyType hashKeyType;

  /// The type of operation to be performed. This follows the substitution
  /// template, so it can be <code>${operation}</code>, but the substitution must
  /// result in one of the following: <code>INSERT</code>, <code>UPDATE</code>, or
  /// <code>DELETE</code>.
  @_s.JsonKey(name: 'operation')
  final String operation;

  /// The action payload. This name can be customized.
  @_s.JsonKey(name: 'payloadField')
  final String payloadField;

  /// The range key name.
  @_s.JsonKey(name: 'rangeKeyField')
  final String rangeKeyField;

  /// The range key type. Valid values are "STRING" or "NUMBER"
  @_s.JsonKey(name: 'rangeKeyType')
  final DynamoKeyType rangeKeyType;

  /// The range key value.
  @_s.JsonKey(name: 'rangeKeyValue')
  final String rangeKeyValue;

  DynamoDBAction({
    @_s.required this.hashKeyField,
    @_s.required this.hashKeyValue,
    @_s.required this.roleArn,
    @_s.required this.tableName,
    this.hashKeyType,
    this.operation,
    this.payloadField,
    this.rangeKeyField,
    this.rangeKeyType,
    this.rangeKeyValue,
  });
  factory DynamoDBAction.fromJson(Map<String, dynamic> json) =>
      _$DynamoDBActionFromJson(json);

  Map<String, dynamic> toJson() => _$DynamoDBActionToJson(this);
}

/// Describes an action to write to a DynamoDB table.
///
/// This DynamoDB action writes each attribute in the message payload into it's
/// own column in the DynamoDB table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DynamoDBv2Action {
  /// Specifies the DynamoDB table to which the message data will be written. For
  /// example:
  ///
  /// <code>{ "dynamoDBv2": { "roleArn": "aws:iam:12341251:my-role" "putItem": {
  /// "tableName": "my-table" } } }</code>
  ///
  /// Each attribute in the message payload will be written to a separate column
  /// in the DynamoDB database.
  @_s.JsonKey(name: 'putItem')
  final PutItemInput putItem;

  /// The ARN of the IAM role that grants access to the DynamoDB table.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  DynamoDBv2Action({
    @_s.required this.putItem,
    @_s.required this.roleArn,
  });
  factory DynamoDBv2Action.fromJson(Map<String, dynamic> json) =>
      _$DynamoDBv2ActionFromJson(json);

  Map<String, dynamic> toJson() => _$DynamoDBv2ActionToJson(this);
}

enum DynamoKeyType {
  @_s.JsonValue('STRING')
  string,
  @_s.JsonValue('NUMBER')
  number,
}

/// The policy that has the effect on the authorization results.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EffectivePolicy {
  /// The policy ARN.
  @_s.JsonKey(name: 'policyArn')
  final String policyArn;

  /// The IAM policy document.
  @_s.JsonKey(name: 'policyDocument')
  final String policyDocument;

  /// The policy name.
  @_s.JsonKey(name: 'policyName')
  final String policyName;

  EffectivePolicy({
    this.policyArn,
    this.policyDocument,
    this.policyName,
  });
  factory EffectivePolicy.fromJson(Map<String, dynamic> json) =>
      _$EffectivePolicyFromJson(json);
}

/// Describes an action that writes data to an Amazon Elasticsearch Service
/// domain.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ElasticsearchAction {
  /// The endpoint of your Elasticsearch domain.
  @_s.JsonKey(name: 'endpoint')
  final String endpoint;

  /// The unique identifier for the document you are storing.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The Elasticsearch index where you want to store your data.
  @_s.JsonKey(name: 'index')
  final String index;

  /// The IAM role ARN that has access to Elasticsearch.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The type of document you are storing.
  @_s.JsonKey(name: 'type')
  final String type;

  ElasticsearchAction({
    @_s.required this.endpoint,
    @_s.required this.id,
    @_s.required this.index,
    @_s.required this.roleArn,
    @_s.required this.type,
  });
  factory ElasticsearchAction.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchActionFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticsearchActionToJson(this);
}

/// Parameters used when defining a mitigation action that enable AWS IoT
/// logging.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EnableIoTLoggingParams {
  /// Specifies the type of information to be logged.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The Amazon Resource Name (ARN) of the IAM role used for logging.
  @_s.JsonKey(name: 'roleArnForLogging')
  final String roleArnForLogging;

  EnableIoTLoggingParams({
    @_s.required this.logLevel,
    @_s.required this.roleArnForLogging,
  });
  factory EnableIoTLoggingParams.fromJson(Map<String, dynamic> json) =>
      _$EnableIoTLoggingParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EnableIoTLoggingParamsToJson(this);
}

/// Error information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorInfo {
  /// The error code.
  @_s.JsonKey(name: 'code')
  final String code;

  /// The error message.
  @_s.JsonKey(name: 'message')
  final String message;

  ErrorInfo({
    this.code,
    this.message,
  });
  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);
}

enum EventType {
  @_s.JsonValue('THING')
  thing,
  @_s.JsonValue('THING_GROUP')
  thingGroup,
  @_s.JsonValue('THING_TYPE')
  thingType,
  @_s.JsonValue('THING_GROUP_MEMBERSHIP')
  thingGroupMembership,
  @_s.JsonValue('THING_GROUP_HIERARCHY')
  thingGroupHierarchy,
  @_s.JsonValue('THING_TYPE_ASSOCIATION')
  thingTypeAssociation,
  @_s.JsonValue('JOB')
  job,
  @_s.JsonValue('JOB_EXECUTION')
  jobExecution,
  @_s.JsonValue('POLICY')
  policy,
  @_s.JsonValue('CERTIFICATE')
  certificate,
  @_s.JsonValue('CA_CERTIFICATE')
  caCertificate,
}

extension on EventType {
  String toValue() {
    switch (this) {
      case EventType.thing:
        return 'THING';
      case EventType.thingGroup:
        return 'THING_GROUP';
      case EventType.thingType:
        return 'THING_TYPE';
      case EventType.thingGroupMembership:
        return 'THING_GROUP_MEMBERSHIP';
      case EventType.thingGroupHierarchy:
        return 'THING_GROUP_HIERARCHY';
      case EventType.thingTypeAssociation:
        return 'THING_TYPE_ASSOCIATION';
      case EventType.job:
        return 'JOB';
      case EventType.jobExecution:
        return 'JOB_EXECUTION';
      case EventType.policy:
        return 'POLICY';
      case EventType.certificate:
        return 'CERTIFICATE';
      case EventType.caCertificate:
        return 'CA_CERTIFICATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information that explicitly denies authorization.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExplicitDeny {
  /// The policies that denied the authorization.
  @_s.JsonKey(name: 'policies')
  final List<Policy> policies;

  ExplicitDeny({
    this.policies,
  });
  factory ExplicitDeny.fromJson(Map<String, dynamic> json) =>
      _$ExplicitDenyFromJson(json);
}

/// Allows you to create an exponential rate of rollout for a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExponentialRolloutRate {
  /// The minimum number of things that will be notified of a pending job, per
  /// minute at the start of job rollout. This parameter allows you to define the
  /// initial rate of rollout.
  @_s.JsonKey(name: 'baseRatePerMinute')
  final int baseRatePerMinute;

  /// The exponential factor to increase the rate of rollout for a job.
  ///
  /// AWS IoT supports up to one digit after the decimal (for example, 1.5, but
  /// not 1.55).
  @_s.JsonKey(name: 'incrementFactor')
  final double incrementFactor;

  /// The criteria to initiate the increase in rate of rollout for a job.
  @_s.JsonKey(name: 'rateIncreaseCriteria')
  final RateIncreaseCriteria rateIncreaseCriteria;

  ExponentialRolloutRate({
    @_s.required this.baseRatePerMinute,
    @_s.required this.incrementFactor,
    @_s.required this.rateIncreaseCriteria,
  });
  factory ExponentialRolloutRate.fromJson(Map<String, dynamic> json) =>
      _$ExponentialRolloutRateFromJson(json);

  Map<String, dynamic> toJson() => _$ExponentialRolloutRateToJson(this);
}

/// Describes the name and data type at a field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Field {
  /// The name of the field.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The datatype of the field.
  @_s.JsonKey(name: 'type')
  final FieldType type;

  Field({
    this.name,
    this.type,
  });
  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToJson(this);
}

enum FieldType {
  @_s.JsonValue('Number')
  number,
  @_s.JsonValue('String')
  string,
  @_s.JsonValue('Boolean')
  boolean,
}

/// The location of the OTA update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FileLocation {
  /// The location of the updated firmware in S3.
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  /// The stream that contains the OTA update.
  @_s.JsonKey(name: 'stream')
  final Stream stream;

  FileLocation({
    this.s3Location,
    this.stream,
  });
  factory FileLocation.fromJson(Map<String, dynamic> json) =>
      _$FileLocationFromJson(json);

  Map<String, dynamic> toJson() => _$FileLocationToJson(this);
}

/// Describes an action that writes data to an Amazon Kinesis Firehose stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FirehoseAction {
  /// The delivery stream name.
  @_s.JsonKey(name: 'deliveryStreamName')
  final String deliveryStreamName;

  /// The IAM role that grants access to the Amazon Kinesis Firehose stream.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Whether to deliver the Kinesis Data Firehose stream as a batch by using <a
  /// href="https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html">
  /// <code>PutRecordBatch</code> </a>. The default value is <code>false</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code> and the rule's SQL
  /// statement evaluates to an Array, each Array element forms one record in the
  /// <a
  /// href="https://docs.aws.amazon.com/firehose/latest/APIReference/API_PutRecordBatch.html">
  /// <code>PutRecordBatch</code> </a> request. The resulting array can't have
  /// more than 500 records.
  @_s.JsonKey(name: 'batchMode')
  final bool batchMode;

  /// A character separator that will be used to separate records written to the
  /// Firehose stream. Valid values are: '\n' (newline), '\t' (tab), '\r\n'
  /// (Windows newline), ',' (comma).
  @_s.JsonKey(name: 'separator')
  final String separator;

  FirehoseAction({
    @_s.required this.deliveryStreamName,
    @_s.required this.roleArn,
    this.batchMode,
    this.separator,
  });
  factory FirehoseAction.fromJson(Map<String, dynamic> json) =>
      _$FirehoseActionFromJson(json);

  Map<String, dynamic> toJson() => _$FirehoseActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBehaviorModelTrainingSummariesResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of all ML Detect behaviors and their model status for a given
  /// Security Profile.
  @_s.JsonKey(name: 'summaries')
  final List<BehaviorModelTrainingSummary> summaries;

  GetBehaviorModelTrainingSummariesResponse({
    this.nextToken,
    this.summaries,
  });
  factory GetBehaviorModelTrainingSummariesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetBehaviorModelTrainingSummariesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetCardinalityResponse {
  /// The approximate count of unique values that match the query.
  @_s.JsonKey(name: 'cardinality')
  final int cardinality;

  GetCardinalityResponse({
    this.cardinality,
  });
  factory GetCardinalityResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCardinalityResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEffectivePoliciesResponse {
  /// The effective policies.
  @_s.JsonKey(name: 'effectivePolicies')
  final List<EffectivePolicy> effectivePolicies;

  GetEffectivePoliciesResponse({
    this.effectivePolicies,
  });
  factory GetEffectivePoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEffectivePoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIndexingConfigurationResponse {
  /// The index configuration.
  @_s.JsonKey(name: 'thingGroupIndexingConfiguration')
  final ThingGroupIndexingConfiguration thingGroupIndexingConfiguration;

  /// Thing indexing configuration.
  @_s.JsonKey(name: 'thingIndexingConfiguration')
  final ThingIndexingConfiguration thingIndexingConfiguration;

  GetIndexingConfigurationResponse({
    this.thingGroupIndexingConfiguration,
    this.thingIndexingConfiguration,
  });
  factory GetIndexingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetIndexingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobDocumentResponse {
  /// The job document content.
  @_s.JsonKey(name: 'document')
  final String document;

  GetJobDocumentResponse({
    this.document,
  });
  factory GetJobDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetJobDocumentResponseFromJson(json);
}

/// The output from the GetLoggingOptions operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLoggingOptionsResponse {
  /// The logging level.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The ARN of the IAM role that grants access.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  GetLoggingOptionsResponse({
    this.logLevel,
    this.roleArn,
  });
  factory GetLoggingOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLoggingOptionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetOTAUpdateResponse {
  /// The OTA update info.
  @_s.JsonKey(name: 'otaUpdateInfo')
  final OTAUpdateInfo otaUpdateInfo;

  GetOTAUpdateResponse({
    this.otaUpdateInfo,
  });
  factory GetOTAUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOTAUpdateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPercentilesResponse {
  /// The percentile values of the aggregated fields.
  @_s.JsonKey(name: 'percentiles')
  final List<PercentPair> percentiles;

  GetPercentilesResponse({
    this.percentiles,
  });
  factory GetPercentilesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPercentilesResponseFromJson(json);
}

/// The output from the GetPolicy operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPolicyResponse {
  /// The date the policy was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The default policy version ID.
  @_s.JsonKey(name: 'defaultVersionId')
  final String defaultVersionId;

  /// The generation ID of the policy.
  @_s.JsonKey(name: 'generationId')
  final String generationId;

  /// The date the policy was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The policy ARN.
  @_s.JsonKey(name: 'policyArn')
  final String policyArn;

  /// The JSON document that describes the policy.
  @_s.JsonKey(name: 'policyDocument')
  final String policyDocument;

  /// The policy name.
  @_s.JsonKey(name: 'policyName')
  final String policyName;

  GetPolicyResponse({
    this.creationDate,
    this.defaultVersionId,
    this.generationId,
    this.lastModifiedDate,
    this.policyArn,
    this.policyDocument,
    this.policyName,
  });
  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyResponseFromJson(json);
}

/// The output from the GetPolicyVersion operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPolicyVersionResponse {
  /// The date the policy was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The generation ID of the policy version.
  @_s.JsonKey(name: 'generationId')
  final String generationId;

  /// Specifies whether the policy version is the default.
  @_s.JsonKey(name: 'isDefaultVersion')
  final bool isDefaultVersion;

  /// The date the policy was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The policy ARN.
  @_s.JsonKey(name: 'policyArn')
  final String policyArn;

  /// The JSON document that describes the policy.
  @_s.JsonKey(name: 'policyDocument')
  final String policyDocument;

  /// The policy name.
  @_s.JsonKey(name: 'policyName')
  final String policyName;

  /// The policy version ID.
  @_s.JsonKey(name: 'policyVersionId')
  final String policyVersionId;

  GetPolicyVersionResponse({
    this.creationDate,
    this.generationId,
    this.isDefaultVersion,
    this.lastModifiedDate,
    this.policyArn,
    this.policyDocument,
    this.policyName,
    this.policyVersionId,
  });
  factory GetPolicyVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyVersionResponseFromJson(json);
}

/// The output from the GetRegistrationCode operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRegistrationCodeResponse {
  /// The CA certificate registration code.
  @_s.JsonKey(name: 'registrationCode')
  final String registrationCode;

  GetRegistrationCodeResponse({
    this.registrationCode,
  });
  factory GetRegistrationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRegistrationCodeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStatisticsResponse {
  /// The statistics returned by the Fleet Indexing service based on the query and
  /// aggregation field.
  @_s.JsonKey(name: 'statistics')
  final Statistics statistics;

  GetStatisticsResponse({
    this.statistics,
  });
  factory GetStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStatisticsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTopicRuleDestinationResponse {
  /// The topic rule destination.
  @_s.JsonKey(name: 'topicRuleDestination')
  final TopicRuleDestination topicRuleDestination;

  GetTopicRuleDestinationResponse({
    this.topicRuleDestination,
  });
  factory GetTopicRuleDestinationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTopicRuleDestinationResponseFromJson(json);
}

/// The output from the GetTopicRule operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTopicRuleResponse {
  /// The rule.
  @_s.JsonKey(name: 'rule')
  final TopicRule rule;

  /// The rule ARN.
  @_s.JsonKey(name: 'ruleArn')
  final String ruleArn;

  GetTopicRuleResponse({
    this.rule,
    this.ruleArn,
  });
  factory GetTopicRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTopicRuleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetV2LoggingOptionsResponse {
  /// The default log level.
  @_s.JsonKey(name: 'defaultLogLevel')
  final LogLevel defaultLogLevel;

  /// Disables all logs.
  @_s.JsonKey(name: 'disableAllLogs')
  final bool disableAllLogs;

  /// The IAM role ARN AWS IoT uses to write to your CloudWatch logs.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  GetV2LoggingOptionsResponse({
    this.defaultLogLevel,
    this.disableAllLogs,
    this.roleArn,
  });
  factory GetV2LoggingOptionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetV2LoggingOptionsResponseFromJson(json);
}

/// The name and ARN of a group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupNameAndArn {
  /// The group ARN.
  @_s.JsonKey(name: 'groupArn')
  final String groupArn;

  /// The group name.
  @_s.JsonKey(name: 'groupName')
  final String groupName;

  GroupNameAndArn({
    this.groupArn,
    this.groupName,
  });
  factory GroupNameAndArn.fromJson(Map<String, dynamic> json) =>
      _$GroupNameAndArnFromJson(json);
}

/// Send data to an HTTPS endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpAction {
  /// The endpoint URL. If substitution templates are used in the URL, you must
  /// also specify a <code>confirmationUrl</code>. If this is a new destination, a
  /// new <code>TopicRuleDestination</code> is created if possible.
  @_s.JsonKey(name: 'url')
  final String url;

  /// The authentication method to use when sending data to an HTTPS endpoint.
  @_s.JsonKey(name: 'auth')
  final HttpAuthorization auth;

  /// The URL to which AWS IoT sends a confirmation message. The value of the
  /// confirmation URL must be a prefix of the endpoint URL. If you do not specify
  /// a confirmation URL AWS IoT uses the endpoint URL as the confirmation URL. If
  /// you use substitution templates in the confirmationUrl, you must create and
  /// enable topic rule destinations that match each possible value of the
  /// substitution template before traffic is allowed to your endpoint URL.
  @_s.JsonKey(name: 'confirmationUrl')
  final String confirmationUrl;

  /// The HTTP headers to send with the message data.
  @_s.JsonKey(name: 'headers')
  final List<HttpActionHeader> headers;

  HttpAction({
    @_s.required this.url,
    this.auth,
    this.confirmationUrl,
    this.headers,
  });
  factory HttpAction.fromJson(Map<String, dynamic> json) =>
      _$HttpActionFromJson(json);

  Map<String, dynamic> toJson() => _$HttpActionToJson(this);
}

/// The HTTP action header.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpActionHeader {
  /// The HTTP header key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The HTTP header value. Substitution templates are supported.
  @_s.JsonKey(name: 'value')
  final String value;

  HttpActionHeader({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory HttpActionHeader.fromJson(Map<String, dynamic> json) =>
      _$HttpActionHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HttpActionHeaderToJson(this);
}

/// The authorization method used to send messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpAuthorization {
  /// Use Sig V4 authorization. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
  /// Version 4 Signing Process</a>.
  @_s.JsonKey(name: 'sigv4')
  final SigV4Authorization sigv4;

  HttpAuthorization({
    this.sigv4,
  });
  factory HttpAuthorization.fromJson(Map<String, dynamic> json) =>
      _$HttpAuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$HttpAuthorizationToJson(this);
}

/// Specifies the HTTP context to use for the test authorizer request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpContext {
  /// The header keys and values in an HTTP authorization request.
  @_s.JsonKey(name: 'headers')
  final Map<String, String> headers;

  /// The query string keys and values in an HTTP authorization request.
  @_s.JsonKey(name: 'queryString')
  final String queryString;

  HttpContext({
    this.headers,
    this.queryString,
  });
  Map<String, dynamic> toJson() => _$HttpContextToJson(this);
}

/// HTTP URL destination configuration used by the topic rule's HTTP action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpUrlDestinationConfiguration {
  /// The URL AWS IoT uses to confirm ownership of or access to the topic rule
  /// destination URL.
  @_s.JsonKey(name: 'confirmationUrl')
  final String confirmationUrl;

  HttpUrlDestinationConfiguration({
    @_s.required this.confirmationUrl,
  });
  Map<String, dynamic> toJson() =>
      _$HttpUrlDestinationConfigurationToJson(this);
}

/// HTTP URL destination properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HttpUrlDestinationProperties {
  /// The URL used to confirm the HTTP topic rule destination URL.
  @_s.JsonKey(name: 'confirmationUrl')
  final String confirmationUrl;

  HttpUrlDestinationProperties({
    this.confirmationUrl,
  });
  factory HttpUrlDestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$HttpUrlDestinationPropertiesFromJson(json);
}

/// Information about an HTTP URL destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HttpUrlDestinationSummary {
  /// The URL used to confirm ownership of or access to the HTTP topic rule
  /// destination URL.
  @_s.JsonKey(name: 'confirmationUrl')
  final String confirmationUrl;

  HttpUrlDestinationSummary({
    this.confirmationUrl,
  });
  factory HttpUrlDestinationSummary.fromJson(Map<String, dynamic> json) =>
      _$HttpUrlDestinationSummaryFromJson(json);
}

/// Information that implicitly denies authorization. When policy doesn't
/// explicitly deny or allow an action on a resource it is considered an
/// implicit deny.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImplicitDeny {
  /// Policies that don't contain a matching allow or deny statement for the
  /// specified action on the specified resource.
  @_s.JsonKey(name: 'policies')
  final List<Policy> policies;

  ImplicitDeny({
    this.policies,
  });
  factory ImplicitDeny.fromJson(Map<String, dynamic> json) =>
      _$ImplicitDenyFromJson(json);
}

enum IndexStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('BUILDING')
  building,
  @_s.JsonValue('REBUILDING')
  rebuilding,
}

/// Sends message data to an AWS IoT Analytics channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IotAnalyticsAction {
  /// Whether to process the action as a batch. The default value is
  /// <code>false</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code> and the rule SQL statement
  /// evaluates to an Array, each Array element is delivered as a separate message
  /// when passed by <a
  /// href="https://docs.aws.amazon.com/iotanalytics/latest/APIReference/API_BatchPutMessage.html">
  /// <code>BatchPutMessage</code> </a> to the AWS IoT Analytics channel. The
  /// resulting array can't have more than 100 messages.
  @_s.JsonKey(name: 'batchMode')
  final bool batchMode;

  /// (deprecated) The ARN of the IoT Analytics channel to which message data will
  /// be sent.
  @_s.JsonKey(name: 'channelArn')
  final String channelArn;

  /// The name of the IoT Analytics channel to which message data will be sent.
  @_s.JsonKey(name: 'channelName')
  final String channelName;

  /// The ARN of the role which has a policy that grants IoT Analytics permission
  /// to send message data via IoT Analytics (iotanalytics:BatchPutMessage).
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  IotAnalyticsAction({
    this.batchMode,
    this.channelArn,
    this.channelName,
    this.roleArn,
  });
  factory IotAnalyticsAction.fromJson(Map<String, dynamic> json) =>
      _$IotAnalyticsActionFromJson(json);

  Map<String, dynamic> toJson() => _$IotAnalyticsActionToJson(this);
}

/// Sends an input to an AWS IoT Events detector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IotEventsAction {
  /// The name of the AWS IoT Events input.
  @_s.JsonKey(name: 'inputName')
  final String inputName;

  /// The ARN of the role that grants AWS IoT permission to send an input to an
  /// AWS IoT Events detector. ("Action":"iotevents:BatchPutMessage").
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Whether to process the event actions as a batch. The default value is
  /// <code>false</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code>, you can't specify a
  /// <code>messageId</code>.
  ///
  /// When <code>batchMode</code> is <code>true</code> and the rule SQL statement
  /// evaluates to an Array, each Array element is treated as a separate message
  /// when it's sent to AWS IoT Events by calling <a
  /// href="https://docs.aws.amazon.com/iotevents/latest/apireference/API_iotevents-data_BatchPutMessage.html">
  /// <code>BatchPutMessage</code> </a>. The resulting array can't have more than
  /// 10 messages.
  @_s.JsonKey(name: 'batchMode')
  final bool batchMode;

  /// The ID of the message. The default <code>messageId</code> is a new UUID
  /// value.
  ///
  /// When <code>batchMode</code> is <code>true</code>, you can't specify a
  /// <code>messageId</code>--a new UUID value will be assigned.
  ///
  /// Assign a value to this property to ensure that only one input (message) with
  /// a given <code>messageId</code> will be processed by an AWS IoT Events
  /// detector.
  @_s.JsonKey(name: 'messageId')
  final String messageId;

  IotEventsAction({
    @_s.required this.inputName,
    @_s.required this.roleArn,
    this.batchMode,
    this.messageId,
  });
  factory IotEventsAction.fromJson(Map<String, dynamic> json) =>
      _$IotEventsActionFromJson(json);

  Map<String, dynamic> toJson() => _$IotEventsActionToJson(this);
}

/// Describes an action to send data from an MQTT message that triggered the
/// rule to AWS IoT SiteWise asset properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IotSiteWiseAction {
  /// A list of asset property value entries.
  @_s.JsonKey(name: 'putAssetPropertyValueEntries')
  final List<PutAssetPropertyValueEntry> putAssetPropertyValueEntries;

  /// The ARN of the role that grants AWS IoT permission to send an asset property
  /// value to AWS IoTSiteWise. (<code>"Action":
  /// "iotsitewise:BatchPutAssetPropertyValue"</code>). The trust policy can
  /// restrict access to specific asset hierarchy paths.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  IotSiteWiseAction({
    @_s.required this.putAssetPropertyValueEntries,
    @_s.required this.roleArn,
  });
  factory IotSiteWiseAction.fromJson(Map<String, dynamic> json) =>
      _$IotSiteWiseActionFromJson(json);

  Map<String, dynamic> toJson() => _$IotSiteWiseActionToJson(this);
}

/// The <code>Job</code> object contains details about a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Job {
  /// Configuration for criteria to abort the job.
  @_s.JsonKey(name: 'abortConfig')
  final AbortConfig abortConfig;

  /// If the job was updated, describes the reason for the update.
  @_s.JsonKey(name: 'comment')
  final String comment;

  /// The time, in seconds since the epoch, when the job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'completedAt')
  final DateTime completedAt;

  /// The time, in seconds since the epoch, when the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A short text description of the job.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Will be <code>true</code> if the job was canceled with the optional
  /// <code>force</code> parameter set to <code>true</code>.
  @_s.JsonKey(name: 'forceCanceled')
  final bool forceCanceled;

  /// An ARN identifying the job with format
  /// "arn:aws:iot:region:account:job/jobId".
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// Allows you to create a staged rollout of a job.
  @_s.JsonKey(name: 'jobExecutionsRolloutConfig')
  final JobExecutionsRolloutConfig jobExecutionsRolloutConfig;

  /// The unique identifier you assigned to this job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// Details about the job process.
  @_s.JsonKey(name: 'jobProcessDetails')
  final JobProcessDetails jobProcessDetails;

  /// The time, in seconds since the epoch, when the job was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The namespace used to indicate that a job is a customer-managed job.
  ///
  /// When you specify a value for this parameter, AWS IoT Core sends jobs
  /// notifications to MQTT topics that contain the value in the following format.
  ///
  /// <code>$aws/things/<i>THING_NAME</i>/jobs/<i>JOB_ID</i>/notify-namespace-<i>NAMESPACE_ID</i>/</code>
  /// <note>
  /// The <code>namespaceId</code> feature is in public preview.
  /// </note>
  @_s.JsonKey(name: 'namespaceId')
  final String namespaceId;

  /// Configuration for pre-signed S3 URLs.
  @_s.JsonKey(name: 'presignedUrlConfig')
  final PresignedUrlConfig presignedUrlConfig;

  /// If the job was updated, provides the reason code for the update.
  @_s.JsonKey(name: 'reasonCode')
  final String reasonCode;

  /// The status of the job, one of <code>IN_PROGRESS</code>,
  /// <code>CANCELED</code>, <code>DELETION_IN_PROGRESS</code> or
  /// <code>COMPLETED</code>.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the job
  /// (SNAPSHOT). If continuous, the job may also be run on a thing when a change
  /// is detected in a target. For example, a job will run on a device when the
  /// thing representing the device is added to a target group, even after the job
  /// was completed by all things originally in the group.
  @_s.JsonKey(name: 'targetSelection')
  final TargetSelection targetSelection;

  /// A list of IoT things and thing groups to which the job should be sent.
  @_s.JsonKey(name: 'targets')
  final List<String> targets;

  /// Specifies the amount of time each device has to finish its execution of the
  /// job. A timer is started when the job execution status is set to
  /// <code>IN_PROGRESS</code>. If the job execution status is not set to another
  /// terminal state before the timer expires, it will be automatically set to
  /// <code>TIMED_OUT</code>.
  @_s.JsonKey(name: 'timeoutConfig')
  final TimeoutConfig timeoutConfig;

  Job({
    this.abortConfig,
    this.comment,
    this.completedAt,
    this.createdAt,
    this.description,
    this.forceCanceled,
    this.jobArn,
    this.jobExecutionsRolloutConfig,
    this.jobId,
    this.jobProcessDetails,
    this.lastUpdatedAt,
    this.namespaceId,
    this.presignedUrlConfig,
    this.reasonCode,
    this.status,
    this.targetSelection,
    this.targets,
    this.timeoutConfig,
  });
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

/// The job execution object represents the execution of a job on a particular
/// device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecution {
  /// The estimated number of seconds that remain before the job execution status
  /// will be changed to <code>TIMED_OUT</code>. The timeout interval can be
  /// anywhere between 1 minute and 7 days (1 to 10080 minutes). The actual job
  /// execution timeout can occur up to 60 seconds later than the estimated
  /// duration. This value will not be included if the job execution has reached a
  /// terminal status.
  @_s.JsonKey(name: 'approximateSecondsBeforeTimedOut')
  final int approximateSecondsBeforeTimedOut;

  /// A string (consisting of the digits "0" through "9") which identifies this
  /// particular job execution on this particular device. It can be used in
  /// commands which return or update job execution information.
  @_s.JsonKey(name: 'executionNumber')
  final int executionNumber;

  /// Will be <code>true</code> if the job execution was canceled with the
  /// optional <code>force</code> parameter set to <code>true</code>.
  @_s.JsonKey(name: 'forceCanceled')
  final bool forceCanceled;

  /// The unique identifier you assigned to the job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job execution was queued.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'queuedAt')
  final DateTime queuedAt;

  /// The time, in seconds since the epoch, when the job execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startedAt')
  final DateTime startedAt;

  /// The status of the job execution (IN_PROGRESS, QUEUED, FAILED, SUCCEEDED,
  /// TIMED_OUT, CANCELED, or REJECTED).
  @_s.JsonKey(name: 'status')
  final JobExecutionStatus status;

  /// A collection of name/value pairs that describe the status of the job
  /// execution.
  @_s.JsonKey(name: 'statusDetails')
  final JobExecutionStatusDetails statusDetails;

  /// The ARN of the thing on which the job execution is running.
  @_s.JsonKey(name: 'thingArn')
  final String thingArn;

  /// The version of the job execution. Job execution versions are incremented
  /// each time they are updated by a device.
  @_s.JsonKey(name: 'versionNumber')
  final int versionNumber;

  JobExecution({
    this.approximateSecondsBeforeTimedOut,
    this.executionNumber,
    this.forceCanceled,
    this.jobId,
    this.lastUpdatedAt,
    this.queuedAt,
    this.startedAt,
    this.status,
    this.statusDetails,
    this.thingArn,
    this.versionNumber,
  });
  factory JobExecution.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionFromJson(json);
}

enum JobExecutionFailureType {
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('ALL')
  all,
}

enum JobExecutionStatus {
  @_s.JsonValue('QUEUED')
  queued,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('TIMED_OUT')
  timedOut,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('REMOVED')
  removed,
  @_s.JsonValue('CANCELED')
  canceled,
}

extension on JobExecutionStatus {
  String toValue() {
    switch (this) {
      case JobExecutionStatus.queued:
        return 'QUEUED';
      case JobExecutionStatus.inProgress:
        return 'IN_PROGRESS';
      case JobExecutionStatus.succeeded:
        return 'SUCCEEDED';
      case JobExecutionStatus.failed:
        return 'FAILED';
      case JobExecutionStatus.timedOut:
        return 'TIMED_OUT';
      case JobExecutionStatus.rejected:
        return 'REJECTED';
      case JobExecutionStatus.removed:
        return 'REMOVED';
      case JobExecutionStatus.canceled:
        return 'CANCELED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details of the job execution status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecutionStatusDetails {
  /// The job execution status.
  @_s.JsonKey(name: 'detailsMap')
  final Map<String, String> detailsMap;

  JobExecutionStatusDetails({
    this.detailsMap,
  });
  factory JobExecutionStatusDetails.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionStatusDetailsFromJson(json);
}

/// The job execution summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecutionSummary {
  /// A string (consisting of the digits "0" through "9") which identifies this
  /// particular job execution on this particular device. It can be used later in
  /// commands which return or update job execution information.
  @_s.JsonKey(name: 'executionNumber')
  final int executionNumber;

  /// The time, in seconds since the epoch, when the job execution was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The time, in seconds since the epoch, when the job execution was queued.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'queuedAt')
  final DateTime queuedAt;

  /// The time, in seconds since the epoch, when the job execution started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startedAt')
  final DateTime startedAt;

  /// The status of the job execution.
  @_s.JsonKey(name: 'status')
  final JobExecutionStatus status;

  JobExecutionSummary({
    this.executionNumber,
    this.lastUpdatedAt,
    this.queuedAt,
    this.startedAt,
    this.status,
  });
  factory JobExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionSummaryFromJson(json);
}

/// Contains a summary of information about job executions for a specific job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecutionSummaryForJob {
  /// Contains a subset of information about a job execution.
  @_s.JsonKey(name: 'jobExecutionSummary')
  final JobExecutionSummary jobExecutionSummary;

  /// The ARN of the thing on which the job execution is running.
  @_s.JsonKey(name: 'thingArn')
  final String thingArn;

  JobExecutionSummaryForJob({
    this.jobExecutionSummary,
    this.thingArn,
  });
  factory JobExecutionSummaryForJob.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionSummaryForJobFromJson(json);
}

/// The job execution summary for a thing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobExecutionSummaryForThing {
  /// Contains a subset of information about a job execution.
  @_s.JsonKey(name: 'jobExecutionSummary')
  final JobExecutionSummary jobExecutionSummary;

  /// The unique identifier you assigned to this job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  JobExecutionSummaryForThing({
    this.jobExecutionSummary,
    this.jobId,
  });
  factory JobExecutionSummaryForThing.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionSummaryForThingFromJson(json);
}

/// Allows you to create a staged rollout of a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JobExecutionsRolloutConfig {
  /// The rate of increase for a job rollout. This parameter allows you to define
  /// an exponential rate for a job rollout.
  @_s.JsonKey(name: 'exponentialRate')
  final ExponentialRolloutRate exponentialRate;

  /// The maximum number of things that will be notified of a pending job, per
  /// minute. This parameter allows you to create a staged rollout.
  @_s.JsonKey(name: 'maximumPerMinute')
  final int maximumPerMinute;

  JobExecutionsRolloutConfig({
    this.exponentialRate,
    this.maximumPerMinute,
  });
  factory JobExecutionsRolloutConfig.fromJson(Map<String, dynamic> json) =>
      _$JobExecutionsRolloutConfigFromJson(json);

  Map<String, dynamic> toJson() => _$JobExecutionsRolloutConfigToJson(this);
}

/// The job process details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobProcessDetails {
  /// The number of things that cancelled the job.
  @_s.JsonKey(name: 'numberOfCanceledThings')
  final int numberOfCanceledThings;

  /// The number of things that failed executing the job.
  @_s.JsonKey(name: 'numberOfFailedThings')
  final int numberOfFailedThings;

  /// The number of things currently executing the job.
  @_s.JsonKey(name: 'numberOfInProgressThings')
  final int numberOfInProgressThings;

  /// The number of things that are awaiting execution of the job.
  @_s.JsonKey(name: 'numberOfQueuedThings')
  final int numberOfQueuedThings;

  /// The number of things that rejected the job.
  @_s.JsonKey(name: 'numberOfRejectedThings')
  final int numberOfRejectedThings;

  /// The number of things that are no longer scheduled to execute the job because
  /// they have been deleted or have been removed from the group that was a target
  /// of the job.
  @_s.JsonKey(name: 'numberOfRemovedThings')
  final int numberOfRemovedThings;

  /// The number of things which successfully completed the job.
  @_s.JsonKey(name: 'numberOfSucceededThings')
  final int numberOfSucceededThings;

  /// The number of things whose job execution status is <code>TIMED_OUT</code>.
  @_s.JsonKey(name: 'numberOfTimedOutThings')
  final int numberOfTimedOutThings;

  /// The target devices to which the job execution is being rolled out. This
  /// value will be null after the job execution has finished rolling out to all
  /// the target devices.
  @_s.JsonKey(name: 'processingTargets')
  final List<String> processingTargets;

  JobProcessDetails({
    this.numberOfCanceledThings,
    this.numberOfFailedThings,
    this.numberOfInProgressThings,
    this.numberOfQueuedThings,
    this.numberOfRejectedThings,
    this.numberOfRemovedThings,
    this.numberOfSucceededThings,
    this.numberOfTimedOutThings,
    this.processingTargets,
  });
  factory JobProcessDetails.fromJson(Map<String, dynamic> json) =>
      _$JobProcessDetailsFromJson(json);
}

enum JobStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('DELETION_IN_PROGRESS')
  deletionInProgress,
}

extension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.canceled:
        return 'CANCELED';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.deletionInProgress:
        return 'DELETION_IN_PROGRESS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The job summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobSummary {
  /// The time, in seconds since the epoch, when the job completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'completedAt')
  final DateTime completedAt;

  /// The time, in seconds since the epoch, when the job was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The job ARN.
  @_s.JsonKey(name: 'jobArn')
  final String jobArn;

  /// The unique identifier you assigned to this job when it was created.
  @_s.JsonKey(name: 'jobId')
  final String jobId;

  /// The time, in seconds since the epoch, when the job was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The job summary status.
  @_s.JsonKey(name: 'status')
  final JobStatus status;

  /// Specifies whether the job will continue to run (CONTINUOUS), or will be
  /// complete after all those things specified as targets have completed the job
  /// (SNAPSHOT). If continuous, the job may also be run on a thing when a change
  /// is detected in a target. For example, a job will run on a thing when the
  /// thing is added to a target group, even after the job was completed by all
  /// things originally in the group.
  @_s.JsonKey(name: 'targetSelection')
  final TargetSelection targetSelection;

  /// The ID of the thing group.
  @_s.JsonKey(name: 'thingGroupId')
  final String thingGroupId;

  JobSummary({
    this.completedAt,
    this.createdAt,
    this.jobArn,
    this.jobId,
    this.lastUpdatedAt,
    this.status,
    this.targetSelection,
    this.thingGroupId,
  });
  factory JobSummary.fromJson(Map<String, dynamic> json) =>
      _$JobSummaryFromJson(json);
}

/// Send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK)
/// or self-managed Apache Kafka cluster.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KafkaAction {
  /// Properties of the Apache Kafka producer client.
  @_s.JsonKey(name: 'clientProperties')
  final Map<String, String> clientProperties;

  /// The ARN of Kafka action's VPC <code>TopicRuleDestination</code>.
  @_s.JsonKey(name: 'destinationArn')
  final String destinationArn;

  /// The Kafka topic for messages to be sent to the Kafka broker.
  @_s.JsonKey(name: 'topic')
  final String topic;

  /// The Kafka message key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The Kafka message partition.
  @_s.JsonKey(name: 'partition')
  final String partition;

  KafkaAction({
    @_s.required this.clientProperties,
    @_s.required this.destinationArn,
    @_s.required this.topic,
    this.key,
    this.partition,
  });
  factory KafkaAction.fromJson(Map<String, dynamic> json) =>
      _$KafkaActionFromJson(json);

  Map<String, dynamic> toJson() => _$KafkaActionToJson(this);
}

/// Describes a key pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeyPair {
  /// The private key.
  @_s.JsonKey(name: 'PrivateKey')
  final String privateKey;

  /// The public key.
  @_s.JsonKey(name: 'PublicKey')
  final String publicKey;

  KeyPair({
    this.privateKey,
    this.publicKey,
  });
  factory KeyPair.fromJson(Map<String, dynamic> json) =>
      _$KeyPairFromJson(json);
}

/// Describes an action to write data to an Amazon Kinesis stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisAction {
  /// The ARN of the IAM role that grants access to the Amazon Kinesis stream.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The name of the Amazon Kinesis stream.
  @_s.JsonKey(name: 'streamName')
  final String streamName;

  /// The partition key.
  @_s.JsonKey(name: 'partitionKey')
  final String partitionKey;

  KinesisAction({
    @_s.required this.roleArn,
    @_s.required this.streamName,
    this.partitionKey,
  });
  factory KinesisAction.fromJson(Map<String, dynamic> json) =>
      _$KinesisActionFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisActionToJson(this);
}

/// Describes an action to invoke a Lambda function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LambdaAction {
  /// The ARN of the Lambda function.
  @_s.JsonKey(name: 'functionArn')
  final String functionArn;

  LambdaAction({
    @_s.required this.functionArn,
  });
  factory LambdaAction.fromJson(Map<String, dynamic> json) =>
      _$LambdaActionFromJson(json);

  Map<String, dynamic> toJson() => _$LambdaActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListActiveViolationsResponse {
  /// The list of active violations.
  @_s.JsonKey(name: 'activeViolations')
  final List<ActiveViolation> activeViolations;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListActiveViolationsResponse({
    this.activeViolations,
    this.nextToken,
  });
  factory ListActiveViolationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListActiveViolationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAttachedPoliciesResponse {
  /// The token to retrieve the next set of results, or ``null`` if there are no
  /// more results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  /// The policies.
  @_s.JsonKey(name: 'policies')
  final List<Policy> policies;

  ListAttachedPoliciesResponse({
    this.nextMarker,
    this.policies,
  });
  factory ListAttachedPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAttachedPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAuditFindingsResponse {
  /// The findings (results) of the audit.
  @_s.JsonKey(name: 'findings')
  final List<AuditFinding> findings;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAuditFindingsResponse({
    this.findings,
    this.nextToken,
  });
  factory ListAuditFindingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAuditFindingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAuditMitigationActionsExecutionsResponse {
  /// A set of task execution results based on the input parameters. Details
  /// include the mitigation action applied, start time, and task status.
  @_s.JsonKey(name: 'actionsExecutions')
  final List<AuditMitigationActionExecutionMetadata> actionsExecutions;

  /// The token for the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAuditMitigationActionsExecutionsResponse({
    this.actionsExecutions,
    this.nextToken,
  });
  factory ListAuditMitigationActionsExecutionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAuditMitigationActionsExecutionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAuditMitigationActionsTasksResponse {
  /// The token for the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The collection of audit mitigation tasks that matched the filter criteria.
  @_s.JsonKey(name: 'tasks')
  final List<AuditMitigationActionsTaskMetadata> tasks;

  ListAuditMitigationActionsTasksResponse({
    this.nextToken,
    this.tasks,
  });
  factory ListAuditMitigationActionsTasksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListAuditMitigationActionsTasksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAuditSuppressionsResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of audit suppressions.
  @_s.JsonKey(name: 'suppressions')
  final List<AuditSuppression> suppressions;

  ListAuditSuppressionsResponse({
    this.nextToken,
    this.suppressions,
  });
  factory ListAuditSuppressionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAuditSuppressionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAuditTasksResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The audits that were performed during the specified time period.
  @_s.JsonKey(name: 'tasks')
  final List<AuditTaskMetadata> tasks;

  ListAuditTasksResponse({
    this.nextToken,
    this.tasks,
  });
  factory ListAuditTasksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAuditTasksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAuthorizersResponse {
  /// The authorizers.
  @_s.JsonKey(name: 'authorizers')
  final List<AuthorizerSummary> authorizers;

  /// A marker used to get the next set of results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  ListAuthorizersResponse({
    this.authorizers,
    this.nextMarker,
  });
  factory ListAuthorizersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAuthorizersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBillingGroupsResponse {
  /// The list of billing groups.
  @_s.JsonKey(name: 'billingGroups')
  final List<GroupNameAndArn> billingGroups;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListBillingGroupsResponse({
    this.billingGroups,
    this.nextToken,
  });
  factory ListBillingGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBillingGroupsResponseFromJson(json);
}

/// The output from the ListCACertificates operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCACertificatesResponse {
  /// The CA certificates registered in your AWS account.
  @_s.JsonKey(name: 'certificates')
  final List<CACertificate> certificates;

  /// The current position within the list of CA certificates.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  ListCACertificatesResponse({
    this.certificates,
    this.nextMarker,
  });
  factory ListCACertificatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCACertificatesResponseFromJson(json);
}

/// The output of the ListCertificatesByCA operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCertificatesByCAResponse {
  /// The device certificates signed by the specified CA certificate.
  @_s.JsonKey(name: 'certificates')
  final List<Certificate> certificates;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  ListCertificatesByCAResponse({
    this.certificates,
    this.nextMarker,
  });
  factory ListCertificatesByCAResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCertificatesByCAResponseFromJson(json);
}

/// The output of the ListCertificates operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCertificatesResponse {
  /// The descriptions of the certificates.
  @_s.JsonKey(name: 'certificates')
  final List<Certificate> certificates;

  /// The marker for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  ListCertificatesResponse({
    this.certificates,
    this.nextMarker,
  });
  factory ListCertificatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCertificatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCustomMetricsResponse {
  /// The name of the custom metric.
  @_s.JsonKey(name: 'metricNames')
  final List<String> metricNames;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListCustomMetricsResponse({
    this.metricNames,
    this.nextToken,
  });
  factory ListCustomMetricsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCustomMetricsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDetectMitigationActionsExecutionsResponse {
  /// List of actions executions.
  @_s.JsonKey(name: 'actionsExecutions')
  final List<DetectMitigationActionExecution> actionsExecutions;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDetectMitigationActionsExecutionsResponse({
    this.actionsExecutions,
    this.nextToken,
  });
  factory ListDetectMitigationActionsExecutionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDetectMitigationActionsExecutionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDetectMitigationActionsTasksResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The collection of ML Detect mitigation tasks that matched the filter
  /// criteria.
  @_s.JsonKey(name: 'tasks')
  final List<DetectMitigationActionsTaskSummary> tasks;

  ListDetectMitigationActionsTasksResponse({
    this.nextToken,
    this.tasks,
  });
  factory ListDetectMitigationActionsTasksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDetectMitigationActionsTasksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDimensionsResponse {
  /// A list of the names of the defined dimensions. Use
  /// <code>DescribeDimension</code> to get details for a dimension.
  @_s.JsonKey(name: 'dimensionNames')
  final List<String> dimensionNames;

  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDimensionsResponse({
    this.dimensionNames,
    this.nextToken,
  });
  factory ListDimensionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDimensionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainConfigurationsResponse {
  /// A list of objects that contain summary information about the user's domain
  /// configurations.
  @_s.JsonKey(name: 'domainConfigurations')
  final List<DomainConfigurationSummary> domainConfigurations;

  /// The marker for the next set of results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  ListDomainConfigurationsResponse({
    this.domainConfigurations,
    this.nextMarker,
  });
  factory ListDomainConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDomainConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIndicesResponse {
  /// The index names.
  @_s.JsonKey(name: 'indexNames')
  final List<String> indexNames;

  /// The token used to get the next set of results, or <code>null</code> if there
  /// are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListIndicesResponse({
    this.indexNames,
    this.nextToken,
  });
  factory ListIndicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIndicesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobExecutionsForJobResponse {
  /// A list of job execution summaries.
  @_s.JsonKey(name: 'executionSummaries')
  final List<JobExecutionSummaryForJob> executionSummaries;

  /// The token for the next set of results, or <b>null</b> if there are no
  /// additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobExecutionsForJobResponse({
    this.executionSummaries,
    this.nextToken,
  });
  factory ListJobExecutionsForJobResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobExecutionsForJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobExecutionsForThingResponse {
  /// A list of job execution summaries.
  @_s.JsonKey(name: 'executionSummaries')
  final List<JobExecutionSummaryForThing> executionSummaries;

  /// The token for the next set of results, or <b>null</b> if there are no
  /// additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobExecutionsForThingResponse({
    this.executionSummaries,
    this.nextToken,
  });
  factory ListJobExecutionsForThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListJobExecutionsForThingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsResponse {
  /// A list of jobs.
  @_s.JsonKey(name: 'jobs')
  final List<JobSummary> jobs;

  /// The token for the next set of results, or <b>null</b> if there are no
  /// additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListJobsResponse({
    this.jobs,
    this.nextToken,
  });
  factory ListJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMitigationActionsResponse {
  /// A set of actions that matched the specified filter criteria.
  @_s.JsonKey(name: 'actionIdentifiers')
  final List<MitigationActionIdentifier> actionIdentifiers;

  /// The token for the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMitigationActionsResponse({
    this.actionIdentifiers,
    this.nextToken,
  });
  factory ListMitigationActionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMitigationActionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOTAUpdatesResponse {
  /// A token to use to get the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of OTA update jobs.
  @_s.JsonKey(name: 'otaUpdates')
  final List<OTAUpdateSummary> otaUpdates;

  ListOTAUpdatesResponse({
    this.nextToken,
    this.otaUpdates,
  });
  factory ListOTAUpdatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOTAUpdatesResponseFromJson(json);
}

/// The output from the ListOutgoingCertificates operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOutgoingCertificatesResponse {
  /// The marker for the next set of results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  /// The certificates that are being transferred but not yet accepted.
  @_s.JsonKey(name: 'outgoingCertificates')
  final List<OutgoingCertificate> outgoingCertificates;

  ListOutgoingCertificatesResponse({
    this.nextMarker,
    this.outgoingCertificates,
  });
  factory ListOutgoingCertificatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListOutgoingCertificatesResponseFromJson(json);
}

/// The output from the ListPolicies operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPoliciesResponse {
  /// The marker for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  /// The descriptions of the policies.
  @_s.JsonKey(name: 'policies')
  final List<Policy> policies;

  ListPoliciesResponse({
    this.nextMarker,
    this.policies,
  });
  factory ListPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPoliciesResponseFromJson(json);
}

/// The output from the ListPolicyPrincipals operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPolicyPrincipalsResponse {
  /// The marker for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  /// The descriptions of the principals.
  @_s.JsonKey(name: 'principals')
  final List<String> principals;

  ListPolicyPrincipalsResponse({
    this.nextMarker,
    this.principals,
  });
  factory ListPolicyPrincipalsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPolicyPrincipalsResponseFromJson(json);
}

/// The output from the ListPolicyVersions operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPolicyVersionsResponse {
  /// The policy versions.
  @_s.JsonKey(name: 'policyVersions')
  final List<PolicyVersion> policyVersions;

  ListPolicyVersionsResponse({
    this.policyVersions,
  });
  factory ListPolicyVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPolicyVersionsResponseFromJson(json);
}

/// The output from the ListPrincipalPolicies operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPrincipalPoliciesResponse {
  /// The marker for the next set of results, or null if there are no additional
  /// results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  /// The policies.
  @_s.JsonKey(name: 'policies')
  final List<Policy> policies;

  ListPrincipalPoliciesResponse({
    this.nextMarker,
    this.policies,
  });
  factory ListPrincipalPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPrincipalPoliciesResponseFromJson(json);
}

/// The output from the ListPrincipalThings operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPrincipalThingsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The things.
  @_s.JsonKey(name: 'things')
  final List<String> things;

  ListPrincipalThingsResponse({
    this.nextToken,
    this.things,
  });
  factory ListPrincipalThingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPrincipalThingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProvisioningTemplateVersionsResponse {
  /// A token to retrieve the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of fleet provisioning template versions.
  @_s.JsonKey(name: 'versions')
  final List<ProvisioningTemplateVersionSummary> versions;

  ListProvisioningTemplateVersionsResponse({
    this.nextToken,
    this.versions,
  });
  factory ListProvisioningTemplateVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListProvisioningTemplateVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProvisioningTemplatesResponse {
  /// A token to retrieve the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of fleet provisioning templates
  @_s.JsonKey(name: 'templates')
  final List<ProvisioningTemplateSummary> templates;

  ListProvisioningTemplatesResponse({
    this.nextToken,
    this.templates,
  });
  factory ListProvisioningTemplatesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListProvisioningTemplatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRoleAliasesResponse {
  /// A marker used to get the next set of results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  /// The role aliases.
  @_s.JsonKey(name: 'roleAliases')
  final List<String> roleAliases;

  ListRoleAliasesResponse({
    this.nextMarker,
    this.roleAliases,
  });
  factory ListRoleAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRoleAliasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListScheduledAuditsResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of scheduled audits.
  @_s.JsonKey(name: 'scheduledAudits')
  final List<ScheduledAuditMetadata> scheduledAudits;

  ListScheduledAuditsResponse({
    this.nextToken,
    this.scheduledAudits,
  });
  factory ListScheduledAuditsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListScheduledAuditsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecurityProfilesForTargetResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of security profiles and their associated targets.
  @_s.JsonKey(name: 'securityProfileTargetMappings')
  final List<SecurityProfileTargetMapping> securityProfileTargetMappings;

  ListSecurityProfilesForTargetResponse({
    this.nextToken,
    this.securityProfileTargetMappings,
  });
  factory ListSecurityProfilesForTargetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSecurityProfilesForTargetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSecurityProfilesResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of security profile identifiers (names and ARNs).
  @_s.JsonKey(name: 'securityProfileIdentifiers')
  final List<SecurityProfileIdentifier> securityProfileIdentifiers;

  ListSecurityProfilesResponse({
    this.nextToken,
    this.securityProfileIdentifiers,
  });
  factory ListSecurityProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSecurityProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStreamsResponse {
  /// A token used to get the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of streams.
  @_s.JsonKey(name: 'streams')
  final List<StreamSummary> streams;

  ListStreamsResponse({
    this.nextToken,
    this.streams,
  });
  factory ListStreamsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStreamsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of tags assigned to the resource.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTargetsForPolicyResponse {
  /// A marker used to get the next set of results.
  @_s.JsonKey(name: 'nextMarker')
  final String nextMarker;

  /// The policy targets.
  @_s.JsonKey(name: 'targets')
  final List<String> targets;

  ListTargetsForPolicyResponse({
    this.nextMarker,
    this.targets,
  });
  factory ListTargetsForPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTargetsForPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTargetsForSecurityProfileResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The thing groups to which the security profile is attached.
  @_s.JsonKey(name: 'securityProfileTargets')
  final List<SecurityProfileTarget> securityProfileTargets;

  ListTargetsForSecurityProfileResponse({
    this.nextToken,
    this.securityProfileTargets,
  });
  factory ListTargetsForSecurityProfileResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListTargetsForSecurityProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingGroupsForThingResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The thing groups.
  @_s.JsonKey(name: 'thingGroups')
  final List<GroupNameAndArn> thingGroups;

  ListThingGroupsForThingResponse({
    this.nextToken,
    this.thingGroups,
  });
  factory ListThingGroupsForThingResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThingGroupsForThingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingGroupsResponse {
  /// The token to use to get the next set of results. Will not be returned if
  /// operation has returned all results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The thing groups.
  @_s.JsonKey(name: 'thingGroups')
  final List<GroupNameAndArn> thingGroups;

  ListThingGroupsResponse({
    this.nextToken,
    this.thingGroups,
  });
  factory ListThingGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThingGroupsResponseFromJson(json);
}

/// The output from the ListThingPrincipals operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingPrincipalsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The principals associated with the thing.
  @_s.JsonKey(name: 'principals')
  final List<String> principals;

  ListThingPrincipalsResponse({
    this.nextToken,
    this.principals,
  });
  factory ListThingPrincipalsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThingPrincipalsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingRegistrationTaskReportsResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The type of task report.
  @_s.JsonKey(name: 'reportType')
  final ReportType reportType;

  /// Links to the task resources.
  @_s.JsonKey(name: 'resourceLinks')
  final List<String> resourceLinks;

  ListThingRegistrationTaskReportsResponse({
    this.nextToken,
    this.reportType,
    this.resourceLinks,
  });
  factory ListThingRegistrationTaskReportsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListThingRegistrationTaskReportsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingRegistrationTasksResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of bulk thing provisioning task IDs.
  @_s.JsonKey(name: 'taskIds')
  final List<String> taskIds;

  ListThingRegistrationTasksResponse({
    this.nextToken,
    this.taskIds,
  });
  factory ListThingRegistrationTasksResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListThingRegistrationTasksResponseFromJson(json);
}

/// The output for the ListThingTypes operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingTypesResponse {
  /// The token for the next set of results. Will not be returned if operation has
  /// returned all results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The thing types.
  @_s.JsonKey(name: 'thingTypes')
  final List<ThingTypeDefinition> thingTypes;

  ListThingTypesResponse({
    this.nextToken,
    this.thingTypes,
  });
  factory ListThingTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThingTypesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingsInBillingGroupResponse {
  /// The token to use to get the next set of results. Will not be returned if
  /// operation has returned all results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of things in the billing group.
  @_s.JsonKey(name: 'things')
  final List<String> things;

  ListThingsInBillingGroupResponse({
    this.nextToken,
    this.things,
  });
  factory ListThingsInBillingGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListThingsInBillingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingsInThingGroupResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The things in the specified thing group.
  @_s.JsonKey(name: 'things')
  final List<String> things;

  ListThingsInThingGroupResponse({
    this.nextToken,
    this.things,
  });
  factory ListThingsInThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThingsInThingGroupResponseFromJson(json);
}

/// The output from the ListThings operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListThingsResponse {
  /// The token to use to get the next set of results. Will not be returned if
  /// operation has returned all results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The things.
  @_s.JsonKey(name: 'things')
  final List<ThingAttribute> things;

  ListThingsResponse({
    this.nextToken,
    this.things,
  });
  factory ListThingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTopicRuleDestinationsResponse {
  /// Information about a topic rule destination.
  @_s.JsonKey(name: 'destinationSummaries')
  final List<TopicRuleDestinationSummary> destinationSummaries;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListTopicRuleDestinationsResponse({
    this.destinationSummaries,
    this.nextToken,
  });
  factory ListTopicRuleDestinationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListTopicRuleDestinationsResponseFromJson(json);
}

/// The output from the ListTopicRules operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTopicRulesResponse {
  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The rules.
  @_s.JsonKey(name: 'rules')
  final List<TopicRuleListItem> rules;

  ListTopicRulesResponse({
    this.nextToken,
    this.rules,
  });
  factory ListTopicRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTopicRulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListV2LoggingLevelsResponse {
  /// The logging configuration for a target.
  @_s.JsonKey(name: 'logTargetConfigurations')
  final List<LogTargetConfiguration> logTargetConfigurations;

  /// The token to use to get the next set of results, or <b>null</b> if there are
  /// no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListV2LoggingLevelsResponse({
    this.logTargetConfigurations,
    this.nextToken,
  });
  factory ListV2LoggingLevelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListV2LoggingLevelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListViolationEventsResponse {
  /// A token that can be used to retrieve the next set of results, or
  /// <code>null</code> if there are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The security profile violation alerts issued for this account during the
  /// given time period, potentially filtered by security profile, behavior
  /// violated, or thing (device) violating.
  @_s.JsonKey(name: 'violationEvents')
  final List<ViolationEvent> violationEvents;

  ListViolationEventsResponse({
    this.nextToken,
    this.violationEvents,
  });
  factory ListViolationEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListViolationEventsResponseFromJson(json);
}

enum LogLevel {
  @_s.JsonValue('DEBUG')
  debug,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('WARN')
  warn,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.debug:
        return 'DEBUG';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.warn:
        return 'WARN';
      case LogLevel.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A log target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LogTarget {
  /// The target type.
  @_s.JsonKey(name: 'targetType')
  final LogTargetType targetType;

  /// The target name.
  @_s.JsonKey(name: 'targetName')
  final String targetName;

  LogTarget({
    @_s.required this.targetType,
    this.targetName,
  });
  factory LogTarget.fromJson(Map<String, dynamic> json) =>
      _$LogTargetFromJson(json);

  Map<String, dynamic> toJson() => _$LogTargetToJson(this);
}

/// The target configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogTargetConfiguration {
  /// The logging level.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// A log target
  @_s.JsonKey(name: 'logTarget')
  final LogTarget logTarget;

  LogTargetConfiguration({
    this.logLevel,
    this.logTarget,
  });
  factory LogTargetConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LogTargetConfigurationFromJson(json);
}

enum LogTargetType {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('THING_GROUP')
  thingGroup,
}

extension on LogTargetType {
  String toValue() {
    switch (this) {
      case LogTargetType.$default:
        return 'DEFAULT';
      case LogTargetType.thingGroup:
        return 'THING_GROUP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes the logging options payload.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LoggingOptionsPayload {
  /// The ARN of the IAM role that grants access.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The log level.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  LoggingOptionsPayload({
    @_s.required this.roleArn,
    this.logLevel,
  });
  Map<String, dynamic> toJson() => _$LoggingOptionsPayloadToJson(this);
}

/// The configuration of an ML Detect Security Profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MachineLearningDetectionConfig {
  /// The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>,
  /// <code>Medium</code>, or <code>High</code>.
  @_s.JsonKey(name: 'confidenceLevel')
  final ConfidenceLevel confidenceLevel;

  MachineLearningDetectionConfig({
    @_s.required this.confidenceLevel,
  });
  factory MachineLearningDetectionConfig.fromJson(Map<String, dynamic> json) =>
      _$MachineLearningDetectionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MachineLearningDetectionConfigToJson(this);
}

enum MessageFormat {
  @_s.JsonValue('RAW')
  raw,
  @_s.JsonValue('JSON')
  json,
}

/// The dimension of a metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricDimension {
  /// A unique identifier for the dimension.
  @_s.JsonKey(name: 'dimensionName')
  final String dimensionName;

  /// Defines how the <code>dimensionValues</code> of a dimension are interpreted.
  /// For example, for dimension type TOPIC_FILTER, the <code>IN</code> operator,
  /// a message will be counted only if its topic matches one of the topic
  /// filters. With <code>NOT_IN</code> operator, a message will be counted only
  /// if it doesn't match any of the topic filters. The operator is optional: if
  /// it's not provided (is <code>null</code>), it will be interpreted as
  /// <code>IN</code>.
  @_s.JsonKey(name: 'operator')
  final DimensionValueOperator operator;

  MetricDimension({
    @_s.required this.dimensionName,
    this.operator,
  });
  factory MetricDimension.fromJson(Map<String, dynamic> json) =>
      _$MetricDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$MetricDimensionToJson(this);
}

/// The metric you want to retain. Dimensions are optional.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricToRetain {
  /// What is measured by the behavior.
  @_s.JsonKey(name: 'metric')
  final String metric;

  /// The dimension of a metric. This can't be used with custom metrics.
  @_s.JsonKey(name: 'metricDimension')
  final MetricDimension metricDimension;

  MetricToRetain({
    @_s.required this.metric,
    this.metricDimension,
  });
  factory MetricToRetain.fromJson(Map<String, dynamic> json) =>
      _$MetricToRetainFromJson(json);

  Map<String, dynamic> toJson() => _$MetricToRetainToJson(this);
}

/// The value to be compared with the <code>metric</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricValue {
  /// If the <code>comparisonOperator</code> calls for a set of CIDRs, use this to
  /// specify that set to be compared with the <code>metric</code>.
  @_s.JsonKey(name: 'cidrs')
  final List<String> cidrs;

  /// If the <code>comparisonOperator</code> calls for a numeric value, use this
  /// to specify that numeric value to be compared with the <code>metric</code>.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The numeral value of a metric.
  @_s.JsonKey(name: 'number')
  final double number;

  /// The numeral values of a metric.
  @_s.JsonKey(name: 'numbers')
  final List<double> numbers;

  /// If the <code>comparisonOperator</code> calls for a set of ports, use this to
  /// specify that set to be compared with the <code>metric</code>.
  @_s.JsonKey(name: 'ports')
  final List<int> ports;

  /// The string values of a metric.
  @_s.JsonKey(name: 'strings')
  final List<String> strings;

  MetricValue({
    this.cidrs,
    this.count,
    this.number,
    this.numbers,
    this.ports,
    this.strings,
  });
  factory MetricValue.fromJson(Map<String, dynamic> json) =>
      _$MetricValueFromJson(json);

  Map<String, dynamic> toJson() => _$MetricValueToJson(this);
}

/// Describes which changes should be applied as part of a mitigation action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MitigationAction {
  /// The set of parameters for this mitigation action. The parameters vary,
  /// depending on the kind of action you apply.
  @_s.JsonKey(name: 'actionParams')
  final MitigationActionParams actionParams;

  /// A unique identifier for the mitigation action.
  @_s.JsonKey(name: 'id')
  final String id;

  /// A user-friendly name for the mitigation action.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The IAM role ARN used to apply this mitigation action.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  MitigationAction({
    this.actionParams,
    this.id,
    this.name,
    this.roleArn,
  });
  factory MitigationAction.fromJson(Map<String, dynamic> json) =>
      _$MitigationActionFromJson(json);
}

/// Information that identifies a mitigation action. This information is
/// returned by ListMitigationActions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MitigationActionIdentifier {
  /// The IAM role ARN used to apply this mitigation action.
  @_s.JsonKey(name: 'actionArn')
  final String actionArn;

  /// The friendly name of the mitigation action.
  @_s.JsonKey(name: 'actionName')
  final String actionName;

  /// The date when this mitigation action was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  MitigationActionIdentifier({
    this.actionArn,
    this.actionName,
    this.creationDate,
  });
  factory MitigationActionIdentifier.fromJson(Map<String, dynamic> json) =>
      _$MitigationActionIdentifierFromJson(json);
}

/// The set of parameters for this mitigation action. You can specify only one
/// type of parameter (in other words, you can apply only one action for each
/// defined mitigation action).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MitigationActionParams {
  /// Parameters to define a mitigation action that moves devices associated with
  /// a certificate to one or more specified thing groups, typically for
  /// quarantine.
  @_s.JsonKey(name: 'addThingsToThingGroupParams')
  final AddThingsToThingGroupParams addThingsToThingGroupParams;

  /// Parameters to define a mitigation action that enables AWS IoT logging at a
  /// specified level of detail.
  @_s.JsonKey(name: 'enableIoTLoggingParams')
  final EnableIoTLoggingParams enableIoTLoggingParams;

  /// Parameters to define a mitigation action that publishes findings to Amazon
  /// Simple Notification Service (Amazon SNS. You can implement your own custom
  /// actions in response to the Amazon SNS messages.
  @_s.JsonKey(name: 'publishFindingToSnsParams')
  final PublishFindingToSnsParams publishFindingToSnsParams;

  /// Parameters to define a mitigation action that adds a blank policy to
  /// restrict permissions.
  @_s.JsonKey(name: 'replaceDefaultPolicyVersionParams')
  final ReplaceDefaultPolicyVersionParams replaceDefaultPolicyVersionParams;

  /// Parameters to define a mitigation action that changes the state of the CA
  /// certificate to inactive.
  @_s.JsonKey(name: 'updateCACertificateParams')
  final UpdateCACertificateParams updateCACertificateParams;

  /// Parameters to define a mitigation action that changes the state of the
  /// device certificate to inactive.
  @_s.JsonKey(name: 'updateDeviceCertificateParams')
  final UpdateDeviceCertificateParams updateDeviceCertificateParams;

  MitigationActionParams({
    this.addThingsToThingGroupParams,
    this.enableIoTLoggingParams,
    this.publishFindingToSnsParams,
    this.replaceDefaultPolicyVersionParams,
    this.updateCACertificateParams,
    this.updateDeviceCertificateParams,
  });
  factory MitigationActionParams.fromJson(Map<String, dynamic> json) =>
      _$MitigationActionParamsFromJson(json);

  Map<String, dynamic> toJson() => _$MitigationActionParamsToJson(this);
}

enum MitigationActionType {
  @_s.JsonValue('UPDATE_DEVICE_CERTIFICATE')
  updateDeviceCertificate,
  @_s.JsonValue('UPDATE_CA_CERTIFICATE')
  updateCaCertificate,
  @_s.JsonValue('ADD_THINGS_TO_THING_GROUP')
  addThingsToThingGroup,
  @_s.JsonValue('REPLACE_DEFAULT_POLICY_VERSION')
  replaceDefaultPolicyVersion,
  @_s.JsonValue('ENABLE_IOT_LOGGING')
  enableIotLogging,
  @_s.JsonValue('PUBLISH_FINDING_TO_SNS')
  publishFindingToSns,
}

extension on MitigationActionType {
  String toValue() {
    switch (this) {
      case MitigationActionType.updateDeviceCertificate:
        return 'UPDATE_DEVICE_CERTIFICATE';
      case MitigationActionType.updateCaCertificate:
        return 'UPDATE_CA_CERTIFICATE';
      case MitigationActionType.addThingsToThingGroup:
        return 'ADD_THINGS_TO_THING_GROUP';
      case MitigationActionType.replaceDefaultPolicyVersion:
        return 'REPLACE_DEFAULT_POLICY_VERSION';
      case MitigationActionType.enableIotLogging:
        return 'ENABLE_IOT_LOGGING';
      case MitigationActionType.publishFindingToSns:
        return 'PUBLISH_FINDING_TO_SNS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ModelStatus {
  @_s.JsonValue('PENDING_BUILD')
  pendingBuild,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// Specifies the MQTT context to use for the test authorizer request
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MqttContext {
  /// The value of the <code>clientId</code> key in an MQTT authorization request.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The value of the <code>password</code> key in an MQTT authorization request.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'password')
  final Uint8List password;

  /// The value of the <code>username</code> key in an MQTT authorization request.
  @_s.JsonKey(name: 'username')
  final String username;

  MqttContext({
    this.clientId,
    this.password,
    this.username,
  });
  Map<String, dynamic> toJson() => _$MqttContextToJson(this);
}

/// Information about the resource that was noncompliant with the audit check.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NonCompliantResource {
  /// Other information about the noncompliant resource.
  @_s.JsonKey(name: 'additionalInfo')
  final Map<String, String> additionalInfo;

  /// Information that identifies the noncompliant resource.
  @_s.JsonKey(name: 'resourceIdentifier')
  final ResourceIdentifier resourceIdentifier;

  /// The type of the noncompliant resource.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  NonCompliantResource({
    this.additionalInfo,
    this.resourceIdentifier,
    this.resourceType,
  });
  factory NonCompliantResource.fromJson(Map<String, dynamic> json) =>
      _$NonCompliantResourceFromJson(json);
}

/// Describes a file to be associated with an OTA update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OTAUpdateFile {
  /// A list of name/attribute pairs.
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// The code signing method of the file.
  @_s.JsonKey(name: 'codeSigning')
  final CodeSigning codeSigning;

  /// The location of the updated firmware.
  @_s.JsonKey(name: 'fileLocation')
  final FileLocation fileLocation;

  /// The name of the file.
  @_s.JsonKey(name: 'fileName')
  final String fileName;

  /// An integer value you can include in the job document to allow your devices
  /// to identify the type of file received from the cloud.
  @_s.JsonKey(name: 'fileType')
  final int fileType;

  /// The file version.
  @_s.JsonKey(name: 'fileVersion')
  final String fileVersion;

  OTAUpdateFile({
    this.attributes,
    this.codeSigning,
    this.fileLocation,
    this.fileName,
    this.fileType,
    this.fileVersion,
  });
  factory OTAUpdateFile.fromJson(Map<String, dynamic> json) =>
      _$OTAUpdateFileFromJson(json);

  Map<String, dynamic> toJson() => _$OTAUpdateFileToJson(this);
}

/// Information about an OTA update.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OTAUpdateInfo {
  /// A collection of name/value pairs
  @_s.JsonKey(name: 'additionalParameters')
  final Map<String, String> additionalParameters;

  /// The AWS IoT job ARN associated with the OTA update.
  @_s.JsonKey(name: 'awsIotJobArn')
  final String awsIotJobArn;

  /// The AWS IoT job ID associated with the OTA update.
  @_s.JsonKey(name: 'awsIotJobId')
  final String awsIotJobId;

  /// Configuration for the rollout of OTA updates.
  @_s.JsonKey(name: 'awsJobExecutionsRolloutConfig')
  final AwsJobExecutionsRolloutConfig awsJobExecutionsRolloutConfig;

  /// Configuration information for pre-signed URLs. Valid when
  /// <code>protocols</code> contains HTTP.
  @_s.JsonKey(name: 'awsJobPresignedUrlConfig')
  final AwsJobPresignedUrlConfig awsJobPresignedUrlConfig;

  /// The date when the OTA update was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// A description of the OTA update.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Error information associated with the OTA update.
  @_s.JsonKey(name: 'errorInfo')
  final ErrorInfo errorInfo;

  /// The date when the OTA update was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The OTA update ARN.
  @_s.JsonKey(name: 'otaUpdateArn')
  final String otaUpdateArn;

  /// A list of files associated with the OTA update.
  @_s.JsonKey(name: 'otaUpdateFiles')
  final List<OTAUpdateFile> otaUpdateFiles;

  /// The OTA update ID.
  @_s.JsonKey(name: 'otaUpdateId')
  final String otaUpdateId;

  /// The status of the OTA update.
  @_s.JsonKey(name: 'otaUpdateStatus')
  final OTAUpdateStatus otaUpdateStatus;

  /// The protocol used to transfer the OTA update image. Valid values are [HTTP],
  /// [MQTT], [HTTP, MQTT]. When both HTTP and MQTT are specified, the target
  /// device can choose the protocol.
  @_s.JsonKey(name: 'protocols')
  final List<Protocol> protocols;

  /// Specifies whether the OTA update will continue to run (CONTINUOUS), or will
  /// be complete after all those things specified as targets have completed the
  /// OTA update (SNAPSHOT). If continuous, the OTA update may also be run on a
  /// thing when a change is detected in a target. For example, an OTA update will
  /// run on a thing when the thing is added to a target group, even after the OTA
  /// update was completed by all things originally in the group.
  @_s.JsonKey(name: 'targetSelection')
  final TargetSelection targetSelection;

  /// The targets of the OTA update.
  @_s.JsonKey(name: 'targets')
  final List<String> targets;

  OTAUpdateInfo({
    this.additionalParameters,
    this.awsIotJobArn,
    this.awsIotJobId,
    this.awsJobExecutionsRolloutConfig,
    this.awsJobPresignedUrlConfig,
    this.creationDate,
    this.description,
    this.errorInfo,
    this.lastModifiedDate,
    this.otaUpdateArn,
    this.otaUpdateFiles,
    this.otaUpdateId,
    this.otaUpdateStatus,
    this.protocols,
    this.targetSelection,
    this.targets,
  });
  factory OTAUpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$OTAUpdateInfoFromJson(json);
}

enum OTAUpdateStatus {
  @_s.JsonValue('CREATE_PENDING')
  createPending,
  @_s.JsonValue('CREATE_IN_PROGRESS')
  createInProgress,
  @_s.JsonValue('CREATE_COMPLETE')
  createComplete,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
}

extension on OTAUpdateStatus {
  String toValue() {
    switch (this) {
      case OTAUpdateStatus.createPending:
        return 'CREATE_PENDING';
      case OTAUpdateStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case OTAUpdateStatus.createComplete:
        return 'CREATE_COMPLETE';
      case OTAUpdateStatus.createFailed:
        return 'CREATE_FAILED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// An OTA update summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OTAUpdateSummary {
  /// The date when the OTA update was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The OTA update ARN.
  @_s.JsonKey(name: 'otaUpdateArn')
  final String otaUpdateArn;

  /// The OTA update ID.
  @_s.JsonKey(name: 'otaUpdateId')
  final String otaUpdateId;

  OTAUpdateSummary({
    this.creationDate,
    this.otaUpdateArn,
    this.otaUpdateId,
  });
  factory OTAUpdateSummary.fromJson(Map<String, dynamic> json) =>
      _$OTAUpdateSummaryFromJson(json);
}

/// A certificate that has been transferred but not yet accepted.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutgoingCertificate {
  /// The certificate ARN.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The certificate ID.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  /// The certificate creation date.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The date the transfer was initiated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'transferDate')
  final DateTime transferDate;

  /// The transfer message.
  @_s.JsonKey(name: 'transferMessage')
  final String transferMessage;

  /// The AWS account to which the transfer was made.
  @_s.JsonKey(name: 'transferredTo')
  final String transferredTo;

  OutgoingCertificate({
    this.certificateArn,
    this.certificateId,
    this.creationDate,
    this.transferDate,
    this.transferMessage,
    this.transferredTo,
  });
  factory OutgoingCertificate.fromJson(Map<String, dynamic> json) =>
      _$OutgoingCertificateFromJson(json);
}

/// Describes the percentile and percentile value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PercentPair {
  /// The percentile.
  @_s.JsonKey(name: 'percent')
  final double percent;

  /// The value of the percentile.
  @_s.JsonKey(name: 'value')
  final double value;

  PercentPair({
    this.percent,
    this.value,
  });
  factory PercentPair.fromJson(Map<String, dynamic> json) =>
      _$PercentPairFromJson(json);
}

/// Describes an AWS IoT policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Policy {
  /// The policy ARN.
  @_s.JsonKey(name: 'policyArn')
  final String policyArn;

  /// The policy name.
  @_s.JsonKey(name: 'policyName')
  final String policyName;

  Policy({
    this.policyArn,
    this.policyName,
  });
  factory Policy.fromJson(Map<String, dynamic> json) => _$PolicyFromJson(json);
}

enum PolicyTemplateName {
  @_s.JsonValue('BLANK_POLICY')
  blankPolicy,
}

/// Describes a policy version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PolicyVersion {
  /// The date and time the policy was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createDate')
  final DateTime createDate;

  /// Specifies whether the policy version is the default.
  @_s.JsonKey(name: 'isDefaultVersion')
  final bool isDefaultVersion;

  /// The policy version ID.
  @_s.JsonKey(name: 'versionId')
  final String versionId;

  PolicyVersion({
    this.createDate,
    this.isDefaultVersion,
    this.versionId,
  });
  factory PolicyVersion.fromJson(Map<String, dynamic> json) =>
      _$PolicyVersionFromJson(json);
}

/// Information about the version of the policy associated with the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PolicyVersionIdentifier {
  /// The name of the policy.
  @_s.JsonKey(name: 'policyName')
  final String policyName;

  /// The ID of the version of the policy associated with the resource.
  @_s.JsonKey(name: 'policyVersionId')
  final String policyVersionId;

  PolicyVersionIdentifier({
    this.policyName,
    this.policyVersionId,
  });
  factory PolicyVersionIdentifier.fromJson(Map<String, dynamic> json) =>
      _$PolicyVersionIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyVersionIdentifierToJson(this);
}

/// Configuration for pre-signed S3 URLs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PresignedUrlConfig {
  /// How long (in seconds) pre-signed URLs are valid. Valid values are 60 - 3600,
  /// the default value is 3600 seconds. Pre-signed URLs are generated when Jobs
  /// receives an MQTT request for the job document.
  @_s.JsonKey(name: 'expiresInSec')
  final int expiresInSec;

  /// The ARN of an IAM role that grants grants permission to download files from
  /// the S3 bucket where the job data/updates are stored. The role must also
  /// grant permission for IoT to download the files.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  PresignedUrlConfig({
    this.expiresInSec,
    this.roleArn,
  });
  factory PresignedUrlConfig.fromJson(Map<String, dynamic> json) =>
      _$PresignedUrlConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PresignedUrlConfigToJson(this);
}

enum Protocol {
  @_s.JsonValue('MQTT')
  mqtt,
  @_s.JsonValue('HTTP')
  http,
}

extension on Protocol {
  String toValue() {
    switch (this) {
      case Protocol.mqtt:
        return 'MQTT';
      case Protocol.http:
        return 'HTTP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Structure that contains <code>payloadVersion</code> and
/// <code>targetArn</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProvisioningHook {
  /// The ARN of the target function.
  ///
  /// <i>Note:</i> Only Lambda functions are currently supported.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  /// The payload that was sent to the target function.
  ///
  /// <i>Note:</i> Only Lambda functions are currently supported.
  @_s.JsonKey(name: 'payloadVersion')
  final String payloadVersion;

  ProvisioningHook({
    @_s.required this.targetArn,
    this.payloadVersion,
  });
  factory ProvisioningHook.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningHookFromJson(json);

  Map<String, dynamic> toJson() => _$ProvisioningHookToJson(this);
}

/// A summary of information about a fleet provisioning template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningTemplateSummary {
  /// The date when the fleet provisioning template summary was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The description of the fleet provisioning template.
  @_s.JsonKey(name: 'description')
  final String description;

  /// True if the fleet provision template is enabled, otherwise false.
  @_s.JsonKey(name: 'enabled')
  final bool enabled;

  /// The date when the fleet provisioning template summary was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The ARN of the fleet provisioning template.
  @_s.JsonKey(name: 'templateArn')
  final String templateArn;

  /// The name of the fleet provisioning template.
  @_s.JsonKey(name: 'templateName')
  final String templateName;

  ProvisioningTemplateSummary({
    this.creationDate,
    this.description,
    this.enabled,
    this.lastModifiedDate,
    this.templateArn,
    this.templateName,
  });
  factory ProvisioningTemplateSummary.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningTemplateSummaryFromJson(json);
}

/// A summary of information about a fleet provision template version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisioningTemplateVersionSummary {
  /// The date when the fleet provisioning template version was created
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// True if the fleet provisioning template version is the default version,
  /// otherwise false.
  @_s.JsonKey(name: 'isDefaultVersion')
  final bool isDefaultVersion;

  /// The ID of the fleet privisioning template version.
  @_s.JsonKey(name: 'versionId')
  final int versionId;

  ProvisioningTemplateVersionSummary({
    this.creationDate,
    this.isDefaultVersion,
    this.versionId,
  });
  factory ProvisioningTemplateVersionSummary.fromJson(
          Map<String, dynamic> json) =>
      _$ProvisioningTemplateVersionSummaryFromJson(json);
}

/// Parameters to define a mitigation action that publishes findings to Amazon
/// SNS. You can implement your own custom actions in response to the Amazon SNS
/// messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PublishFindingToSnsParams {
  /// The ARN of the topic to which you want to publish the findings.
  @_s.JsonKey(name: 'topicArn')
  final String topicArn;

  PublishFindingToSnsParams({
    @_s.required this.topicArn,
  });
  factory PublishFindingToSnsParams.fromJson(Map<String, dynamic> json) =>
      _$PublishFindingToSnsParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PublishFindingToSnsParamsToJson(this);
}

/// An asset property value entry containing the following information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PutAssetPropertyValueEntry {
  /// A list of property values to insert that each contain timestamp, quality,
  /// and value (TQV) information.
  @_s.JsonKey(name: 'propertyValues')
  final List<AssetPropertyValue> propertyValues;

  /// The ID of the AWS IoT SiteWise asset. You must specify either a
  /// <code>propertyAlias</code> or both an <code>aliasId</code> and a
  /// <code>propertyId</code>. Accepts substitution templates.
  @_s.JsonKey(name: 'assetId')
  final String assetId;

  /// Optional. A unique identifier for this entry that you can define to better
  /// track which message caused an error in case of failure. Accepts substitution
  /// templates. Defaults to a new UUID.
  @_s.JsonKey(name: 'entryId')
  final String entryId;

  /// The name of the property alias associated with your asset property. You must
  /// specify either a <code>propertyAlias</code> or both an <code>aliasId</code>
  /// and a <code>propertyId</code>. Accepts substitution templates.
  @_s.JsonKey(name: 'propertyAlias')
  final String propertyAlias;

  /// The ID of the asset's property. You must specify either a
  /// <code>propertyAlias</code> or both an <code>aliasId</code> and a
  /// <code>propertyId</code>. Accepts substitution templates.
  @_s.JsonKey(name: 'propertyId')
  final String propertyId;

  PutAssetPropertyValueEntry({
    @_s.required this.propertyValues,
    this.assetId,
    this.entryId,
    this.propertyAlias,
    this.propertyId,
  });
  factory PutAssetPropertyValueEntry.fromJson(Map<String, dynamic> json) =>
      _$PutAssetPropertyValueEntryFromJson(json);

  Map<String, dynamic> toJson() => _$PutAssetPropertyValueEntryToJson(this);
}

/// The input for the DynamoActionVS action that specifies the DynamoDB table to
/// which the message data will be written.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PutItemInput {
  /// The table where the message data will be written.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  PutItemInput({
    @_s.required this.tableName,
  });
  factory PutItemInput.fromJson(Map<String, dynamic> json) =>
      _$PutItemInputFromJson(json);

  Map<String, dynamic> toJson() => _$PutItemInputToJson(this);
}

/// Allows you to define a criteria to initiate the increase in rate of rollout
/// for a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RateIncreaseCriteria {
  /// The threshold for number of notified things that will initiate the increase
  /// in rate of rollout.
  @_s.JsonKey(name: 'numberOfNotifiedThings')
  final int numberOfNotifiedThings;

  /// The threshold for number of succeeded things that will initiate the increase
  /// in rate of rollout.
  @_s.JsonKey(name: 'numberOfSucceededThings')
  final int numberOfSucceededThings;

  RateIncreaseCriteria({
    this.numberOfNotifiedThings,
    this.numberOfSucceededThings,
  });
  factory RateIncreaseCriteria.fromJson(Map<String, dynamic> json) =>
      _$RateIncreaseCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$RateIncreaseCriteriaToJson(this);
}

/// The output from the RegisterCACertificateResponse operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterCACertificateResponse {
  /// The CA certificate ARN.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The CA certificate identifier.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  RegisterCACertificateResponse({
    this.certificateArn,
    this.certificateId,
  });
  factory RegisterCACertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterCACertificateResponseFromJson(json);
}

/// The output from the RegisterCertificate operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterCertificateResponse {
  /// The certificate ARN.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The certificate identifier.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  RegisterCertificateResponse({
    this.certificateArn,
    this.certificateId,
  });
  factory RegisterCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterCertificateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterCertificateWithoutCAResponse {
  /// The Amazon Resource Name (ARN) of the registered certificate.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The ID of the registered certificate. (The last part of the certificate ARN
  /// contains the certificate ID.
  @_s.JsonKey(name: 'certificateId')
  final String certificateId;

  RegisterCertificateWithoutCAResponse({
    this.certificateArn,
    this.certificateId,
  });
  factory RegisterCertificateWithoutCAResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterCertificateWithoutCAResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterThingResponse {
  /// The certificate data, in PEM format.
  @_s.JsonKey(name: 'certificatePem')
  final String certificatePem;

  /// ARNs for the generated resources.
  @_s.JsonKey(name: 'resourceArns')
  final Map<String, String> resourceArns;

  RegisterThingResponse({
    this.certificatePem,
    this.resourceArns,
  });
  factory RegisterThingResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterThingResponseFromJson(json);
}

/// The registration configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RegistrationConfig {
  /// The ARN of the role.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The template body.
  @_s.JsonKey(name: 'templateBody')
  final String templateBody;

  RegistrationConfig({
    this.roleArn,
    this.templateBody,
  });
  factory RegistrationConfig.fromJson(Map<String, dynamic> json) =>
      _$RegistrationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationConfigToJson(this);
}

/// Information about a related resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RelatedResource {
  /// Other information about the resource.
  @_s.JsonKey(name: 'additionalInfo')
  final Map<String, String> additionalInfo;

  /// Information that identifies the resource.
  @_s.JsonKey(name: 'resourceIdentifier')
  final ResourceIdentifier resourceIdentifier;

  /// The type of resource.
  @_s.JsonKey(name: 'resourceType')
  final ResourceType resourceType;

  RelatedResource({
    this.additionalInfo,
    this.resourceIdentifier,
    this.resourceType,
  });
  factory RelatedResource.fromJson(Map<String, dynamic> json) =>
      _$RelatedResourceFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveThingFromBillingGroupResponse {
  RemoveThingFromBillingGroupResponse();
  factory RemoveThingFromBillingGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveThingFromBillingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveThingFromThingGroupResponse {
  RemoveThingFromThingGroupResponse();
  factory RemoveThingFromThingGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveThingFromThingGroupResponseFromJson(json);
}

/// Parameters to define a mitigation action that adds a blank policy to
/// restrict permissions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ReplaceDefaultPolicyVersionParams {
  /// The name of the template to be applied. The only supported value is
  /// <code>BLANK_POLICY</code>.
  @_s.JsonKey(name: 'templateName')
  final PolicyTemplateName templateName;

  ReplaceDefaultPolicyVersionParams({
    @_s.required this.templateName,
  });
  factory ReplaceDefaultPolicyVersionParams.fromJson(
          Map<String, dynamic> json) =>
      _$ReplaceDefaultPolicyVersionParamsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReplaceDefaultPolicyVersionParamsToJson(this);
}

enum ReportType {
  @_s.JsonValue('ERRORS')
  errors,
  @_s.JsonValue('RESULTS')
  results,
}

extension on ReportType {
  String toValue() {
    switch (this) {
      case ReportType.errors:
        return 'ERRORS';
      case ReportType.results:
        return 'RESULTS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes an action to republish to another topic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RepublishAction {
  /// The ARN of the IAM role that grants access.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The name of the MQTT topic.
  @_s.JsonKey(name: 'topic')
  final String topic;

  /// The Quality of Service (QoS) level to use when republishing messages. The
  /// default value is 0.
  @_s.JsonKey(name: 'qos')
  final int qos;

  RepublishAction({
    @_s.required this.roleArn,
    @_s.required this.topic,
    this.qos,
  });
  factory RepublishAction.fromJson(Map<String, dynamic> json) =>
      _$RepublishActionFromJson(json);

  Map<String, dynamic> toJson() => _$RepublishActionToJson(this);
}

/// Information that identifies the noncompliant resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceIdentifier {
  /// The account with which the resource is associated.
  @_s.JsonKey(name: 'account')
  final String account;

  /// The ID of the CA certificate used to authorize the certificate.
  @_s.JsonKey(name: 'caCertificateId')
  final String caCertificateId;

  /// The client ID.
  @_s.JsonKey(name: 'clientId')
  final String clientId;

  /// The ID of the Amazon Cognito identity pool.
  @_s.JsonKey(name: 'cognitoIdentityPoolId')
  final String cognitoIdentityPoolId;

  /// The ID of the certificate attached to the resource.
  @_s.JsonKey(name: 'deviceCertificateId')
  final String deviceCertificateId;

  /// The ARN of the IAM role that has overly permissive actions.
  @_s.JsonKey(name: 'iamRoleArn')
  final String iamRoleArn;

  /// The version of the policy associated with the resource.
  @_s.JsonKey(name: 'policyVersionIdentifier')
  final PolicyVersionIdentifier policyVersionIdentifier;

  /// The ARN of the role alias that has overly permissive actions.
  @_s.JsonKey(name: 'roleAliasArn')
  final String roleAliasArn;

  ResourceIdentifier({
    this.account,
    this.caCertificateId,
    this.clientId,
    this.cognitoIdentityPoolId,
    this.deviceCertificateId,
    this.iamRoleArn,
    this.policyVersionIdentifier,
    this.roleAliasArn,
  });
  factory ResourceIdentifier.fromJson(Map<String, dynamic> json) =>
      _$ResourceIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceIdentifierToJson(this);
}

enum ResourceType {
  @_s.JsonValue('DEVICE_CERTIFICATE')
  deviceCertificate,
  @_s.JsonValue('CA_CERTIFICATE')
  caCertificate,
  @_s.JsonValue('IOT_POLICY')
  iotPolicy,
  @_s.JsonValue('COGNITO_IDENTITY_POOL')
  cognitoIdentityPool,
  @_s.JsonValue('CLIENT_ID')
  clientId,
  @_s.JsonValue('ACCOUNT_SETTINGS')
  accountSettings,
  @_s.JsonValue('ROLE_ALIAS')
  roleAlias,
  @_s.JsonValue('IAM_ROLE')
  iamRole,
}

/// Role alias description.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoleAliasDescription {
  /// The UNIX timestamp of when the role alias was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The number of seconds for which the credential is valid.
  @_s.JsonKey(name: 'credentialDurationSeconds')
  final int credentialDurationSeconds;

  /// The UNIX timestamp of when the role alias was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The role alias owner.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The role alias.
  @_s.JsonKey(name: 'roleAlias')
  final String roleAlias;

  /// The ARN of the role alias.
  @_s.JsonKey(name: 'roleAliasArn')
  final String roleAliasArn;

  /// The role ARN.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  RoleAliasDescription({
    this.creationDate,
    this.credentialDurationSeconds,
    this.lastModifiedDate,
    this.owner,
    this.roleAlias,
    this.roleAliasArn,
    this.roleArn,
  });
  factory RoleAliasDescription.fromJson(Map<String, dynamic> json) =>
      _$RoleAliasDescriptionFromJson(json);
}

/// Describes an action to write data to an Amazon S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Action {
  /// The Amazon S3 bucket.
  @_s.JsonKey(name: 'bucketName')
  final String bucketName;

  /// The object key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/list_amazons3.html">Actions,
  /// resources, and condition keys for Amazon S3</a>.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The ARN of the IAM role that grants access.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The Amazon S3 canned ACL that controls access to the object identified by
  /// the object key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl">S3
  /// canned ACLs</a>.
  @_s.JsonKey(name: 'cannedAcl')
  final CannedAccessControlList cannedAcl;

  S3Action({
    @_s.required this.bucketName,
    @_s.required this.key,
    @_s.required this.roleArn,
    this.cannedAcl,
  });
  factory S3Action.fromJson(Map<String, dynamic> json) =>
      _$S3ActionFromJson(json);

  Map<String, dynamic> toJson() => _$S3ActionToJson(this);
}

/// Describes the location of updated firmware in S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Destination {
  /// The S3 bucket that contains the updated firmware.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// The S3 prefix.
  @_s.JsonKey(name: 'prefix')
  final String prefix;

  S3Destination({
    this.bucket,
    this.prefix,
  });
  factory S3Destination.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$S3DestinationToJson(this);
}

/// The S3 location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Location {
  /// The S3 bucket.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// The S3 key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The S3 bucket version.
  @_s.JsonKey(name: 'version')
  final String version;

  S3Location({
    this.bucket,
    this.key,
    this.version,
  });
  factory S3Location.fromJson(Map<String, dynamic> json) =>
      _$S3LocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

/// Describes an action to write a message to a Salesforce IoT Cloud Input
/// Stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceAction {
  /// The token used to authenticate access to the Salesforce IoT Cloud Input
  /// Stream. The token is available from the Salesforce IoT Cloud platform after
  /// creation of the Input Stream.
  @_s.JsonKey(name: 'token')
  final String token;

  /// The URL exposed by the Salesforce IoT Cloud Input Stream. The URL is
  /// available from the Salesforce IoT Cloud platform after creation of the Input
  /// Stream.
  @_s.JsonKey(name: 'url')
  final String url;

  SalesforceAction({
    @_s.required this.token,
    @_s.required this.url,
  });
  factory SalesforceAction.fromJson(Map<String, dynamic> json) =>
      _$SalesforceActionFromJson(json);

  Map<String, dynamic> toJson() => _$SalesforceActionToJson(this);
}

/// Information about the scheduled audit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScheduledAuditMetadata {
  /// The day of the month on which the scheduled audit is run (if the
  /// <code>frequency</code> is "MONTHLY"). If days 29-31 are specified, and the
  /// month does not have that many days, the audit takes place on the "LAST" day
  /// of the month.
  @_s.JsonKey(name: 'dayOfMonth')
  final String dayOfMonth;

  /// The day of the week on which the scheduled audit is run (if the
  /// <code>frequency</code> is "WEEKLY" or "BIWEEKLY").
  @_s.JsonKey(name: 'dayOfWeek')
  final DayOfWeek dayOfWeek;

  /// How often the scheduled audit occurs.
  @_s.JsonKey(name: 'frequency')
  final AuditFrequency frequency;

  /// The ARN of the scheduled audit.
  @_s.JsonKey(name: 'scheduledAuditArn')
  final String scheduledAuditArn;

  /// The name of the scheduled audit.
  @_s.JsonKey(name: 'scheduledAuditName')
  final String scheduledAuditName;

  ScheduledAuditMetadata({
    this.dayOfMonth,
    this.dayOfWeek,
    this.frequency,
    this.scheduledAuditArn,
    this.scheduledAuditName,
  });
  factory ScheduledAuditMetadata.fromJson(Map<String, dynamic> json) =>
      _$ScheduledAuditMetadataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchIndexResponse {
  /// The token used to get the next set of results, or <code>null</code> if there
  /// are no additional results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The thing groups that match the search query.
  @_s.JsonKey(name: 'thingGroups')
  final List<ThingGroupDocument> thingGroups;

  /// The things that match the search query.
  @_s.JsonKey(name: 'things')
  final List<ThingDocument> things;

  SearchIndexResponse({
    this.nextToken,
    this.thingGroups,
    this.things,
  });
  factory SearchIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchIndexResponseFromJson(json);
}

/// Identifying information for a Device Defender security profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityProfileIdentifier {
  /// The ARN of the security profile.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The name you've given to the security profile.
  @_s.JsonKey(name: 'name')
  final String name;

  SecurityProfileIdentifier({
    @_s.required this.arn,
    @_s.required this.name,
  });
  factory SecurityProfileIdentifier.fromJson(Map<String, dynamic> json) =>
      _$SecurityProfileIdentifierFromJson(json);
}

/// A target to which an alert is sent when a security profile behavior is
/// violated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityProfileTarget {
  /// The ARN of the security profile.
  @_s.JsonKey(name: 'arn')
  final String arn;

  SecurityProfileTarget({
    @_s.required this.arn,
  });
  factory SecurityProfileTarget.fromJson(Map<String, dynamic> json) =>
      _$SecurityProfileTargetFromJson(json);
}

/// Information about a security profile and the target associated with it.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecurityProfileTargetMapping {
  /// Information that identifies the security profile.
  @_s.JsonKey(name: 'securityProfileIdentifier')
  final SecurityProfileIdentifier securityProfileIdentifier;

  /// Information about the target (thing group) associated with the security
  /// profile.
  @_s.JsonKey(name: 'target')
  final SecurityProfileTarget target;

  SecurityProfileTargetMapping({
    this.securityProfileIdentifier,
    this.target,
  });
  factory SecurityProfileTargetMapping.fromJson(Map<String, dynamic> json) =>
      _$SecurityProfileTargetMappingFromJson(json);
}

enum ServerCertificateStatus {
  @_s.JsonValue('INVALID')
  invalid,
  @_s.JsonValue('VALID')
  valid,
}

/// An object that contains information about a server certificate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServerCertificateSummary {
  /// The ARN of the server certificate.
  @_s.JsonKey(name: 'serverCertificateArn')
  final String serverCertificateArn;

  /// The status of the server certificate.
  @_s.JsonKey(name: 'serverCertificateStatus')
  final ServerCertificateStatus serverCertificateStatus;

  /// Details that explain the status of the server certificate.
  @_s.JsonKey(name: 'serverCertificateStatusDetail')
  final String serverCertificateStatusDetail;

  ServerCertificateSummary({
    this.serverCertificateArn,
    this.serverCertificateStatus,
    this.serverCertificateStatusDetail,
  });
  factory ServerCertificateSummary.fromJson(Map<String, dynamic> json) =>
      _$ServerCertificateSummaryFromJson(json);
}

enum ServiceType {
  @_s.JsonValue('DATA')
  data,
  @_s.JsonValue('CREDENTIAL_PROVIDER')
  credentialProvider,
  @_s.JsonValue('JOBS')
  jobs,
}

extension on ServiceType {
  String toValue() {
    switch (this) {
      case ServiceType.data:
        return 'DATA';
      case ServiceType.credentialProvider:
        return 'CREDENTIAL_PROVIDER';
      case ServiceType.jobs:
        return 'JOBS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetDefaultAuthorizerResponse {
  /// The authorizer ARN.
  @_s.JsonKey(name: 'authorizerArn')
  final String authorizerArn;

  /// The authorizer name.
  @_s.JsonKey(name: 'authorizerName')
  final String authorizerName;

  SetDefaultAuthorizerResponse({
    this.authorizerArn,
    this.authorizerName,
  });
  factory SetDefaultAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$SetDefaultAuthorizerResponseFromJson(json);
}

/// For more information, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
/// Version 4 signing process</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SigV4Authorization {
  /// The ARN of the signing role.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The service name to use while signing with Sig V4.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  /// The signing region.
  @_s.JsonKey(name: 'signingRegion')
  final String signingRegion;

  SigV4Authorization({
    @_s.required this.roleArn,
    @_s.required this.serviceName,
    @_s.required this.signingRegion,
  });
  factory SigV4Authorization.fromJson(Map<String, dynamic> json) =>
      _$SigV4AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$SigV4AuthorizationToJson(this);
}

/// Describes the code-signing profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SigningProfileParameter {
  /// Certificate ARN.
  @_s.JsonKey(name: 'certificateArn')
  final String certificateArn;

  /// The location of the code-signing certificate on your device.
  @_s.JsonKey(name: 'certificatePathOnDevice')
  final String certificatePathOnDevice;

  /// The hardware platform of your device.
  @_s.JsonKey(name: 'platform')
  final String platform;

  SigningProfileParameter({
    this.certificateArn,
    this.certificatePathOnDevice,
    this.platform,
  });
  factory SigningProfileParameter.fromJson(Map<String, dynamic> json) =>
      _$SigningProfileParameterFromJson(json);

  Map<String, dynamic> toJson() => _$SigningProfileParameterToJson(this);
}

/// Describes an action to publish to an Amazon SNS topic.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnsAction {
  /// The ARN of the IAM role that grants access.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The ARN of the SNS topic.
  @_s.JsonKey(name: 'targetArn')
  final String targetArn;

  /// (Optional) The message format of the message to publish. Accepted values are
  /// "JSON" and "RAW". The default value of the attribute is "RAW". SNS uses this
  /// setting to determine if the payload should be parsed and relevant
  /// platform-specific bits of the payload should be extracted. To read more
  /// about SNS message formats, see <a
  /// href="https://docs.aws.amazon.com/sns/latest/dg/json-formats.html">https://docs.aws.amazon.com/sns/latest/dg/json-formats.html</a>
  /// refer to their official documentation.
  @_s.JsonKey(name: 'messageFormat')
  final MessageFormat messageFormat;

  SnsAction({
    @_s.required this.roleArn,
    @_s.required this.targetArn,
    this.messageFormat,
  });
  factory SnsAction.fromJson(Map<String, dynamic> json) =>
      _$SnsActionFromJson(json);

  Map<String, dynamic> toJson() => _$SnsActionToJson(this);
}

/// Describes an action to publish data to an Amazon SQS queue.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SqsAction {
  /// The URL of the Amazon SQS queue.
  @_s.JsonKey(name: 'queueUrl')
  final String queueUrl;

  /// The ARN of the IAM role that grants access.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// Specifies whether to use Base64 encoding.
  @_s.JsonKey(name: 'useBase64')
  final bool useBase64;

  SqsAction({
    @_s.required this.queueUrl,
    @_s.required this.roleArn,
    this.useBase64,
  });
  factory SqsAction.fromJson(Map<String, dynamic> json) =>
      _$SqsActionFromJson(json);

  Map<String, dynamic> toJson() => _$SqsActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartAuditMitigationActionsTaskResponse {
  /// The unique identifier for the audit mitigation task. This matches the
  /// <code>taskId</code> that you specified in the request.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  StartAuditMitigationActionsTaskResponse({
    this.taskId,
  });
  factory StartAuditMitigationActionsTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartAuditMitigationActionsTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDetectMitigationActionsTaskResponse {
  /// The unique identifier of the task.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  StartDetectMitigationActionsTaskResponse({
    this.taskId,
  });
  factory StartDetectMitigationActionsTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartDetectMitigationActionsTaskResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartOnDemandAuditTaskResponse {
  /// The ID of the on-demand audit you started.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  StartOnDemandAuditTaskResponse({
    this.taskId,
  });
  factory StartOnDemandAuditTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$StartOnDemandAuditTaskResponseFromJson(json);
}

/// Information required to start a signing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StartSigningJobParameter {
  /// The location to write the code-signed file.
  @_s.JsonKey(name: 'destination')
  final Destination destination;

  /// The code-signing profile name.
  @_s.JsonKey(name: 'signingProfileName')
  final String signingProfileName;

  /// Describes the code-signing profile.
  @_s.JsonKey(name: 'signingProfileParameter')
  final SigningProfileParameter signingProfileParameter;

  StartSigningJobParameter({
    this.destination,
    this.signingProfileName,
    this.signingProfileParameter,
  });
  factory StartSigningJobParameter.fromJson(Map<String, dynamic> json) =>
      _$StartSigningJobParameterFromJson(json);

  Map<String, dynamic> toJson() => _$StartSigningJobParameterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartThingRegistrationTaskResponse {
  /// The bulk thing provisioning task ID.
  @_s.JsonKey(name: 'taskId')
  final String taskId;

  StartThingRegistrationTaskResponse({
    this.taskId,
  });
  factory StartThingRegistrationTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartThingRegistrationTaskResponseFromJson(json);
}

/// A statistical ranking (percentile) that indicates a threshold value by which
/// a behavior is determined to be in compliance or in violation of the
/// behavior.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StatisticalThreshold {
  /// The percentile that resolves to a threshold value by which compliance with a
  /// behavior is determined. Metrics are collected over the specified period
  /// (<code>durationSeconds</code>) from all reporting devices in your account
  /// and statistical ranks are calculated. Then, the measurements from a device
  /// are collected over the same period. If the accumulated measurements from the
  /// device fall above or below (<code>comparisonOperator</code>) the value
  /// associated with the percentile specified, then the device is considered to
  /// be in compliance with the behavior, otherwise a violation occurs.
  @_s.JsonKey(name: 'statistic')
  final String statistic;

  StatisticalThreshold({
    this.statistic,
  });
  factory StatisticalThreshold.fromJson(Map<String, dynamic> json) =>
      _$StatisticalThresholdFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticalThresholdToJson(this);
}

/// A map of key-value pairs for all supported statistics. Currently, only count
/// is supported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Statistics {
  /// The average of the aggregated field values.
  @_s.JsonKey(name: 'average')
  final double average;

  /// The count of things that match the query.
  @_s.JsonKey(name: 'count')
  final int count;

  /// The maximum aggregated field value.
  @_s.JsonKey(name: 'maximum')
  final double maximum;

  /// The minimum aggregated field value.
  @_s.JsonKey(name: 'minimum')
  final double minimum;

  /// The standard deviation of the aggregated field values.
  @_s.JsonKey(name: 'stdDeviation')
  final double stdDeviation;

  /// The sum of the aggregated field values.
  @_s.JsonKey(name: 'sum')
  final double sum;

  /// The sum of the squares of the aggregated field values.
  @_s.JsonKey(name: 'sumOfSquares')
  final double sumOfSquares;

  /// The variance of the aggregated field values.
  @_s.JsonKey(name: 'variance')
  final double variance;

  Statistics({
    this.average,
    this.count,
    this.maximum,
    this.minimum,
    this.stdDeviation,
    this.sum,
    this.sumOfSquares,
    this.variance,
  });
  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}

enum Status {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Cancelled')
  cancelled,
  @_s.JsonValue('Cancelling')
  cancelling,
}

extension on Status {
  String toValue() {
    switch (this) {
      case Status.inProgress:
        return 'InProgress';
      case Status.completed:
        return 'Completed';
      case Status.failed:
        return 'Failed';
      case Status.cancelled:
        return 'Cancelled';
      case Status.cancelling:
        return 'Cancelling';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Starts execution of a Step Functions state machine.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StepFunctionsAction {
  /// The ARN of the role that grants IoT permission to start execution of a state
  /// machine ("Action":"states:StartExecution").
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The name of the Step Functions state machine whose execution will be
  /// started.
  @_s.JsonKey(name: 'stateMachineName')
  final String stateMachineName;

  /// (Optional) A name will be given to the state machine execution consisting of
  /// this prefix followed by a UUID. Step Functions automatically creates a
  /// unique name for each state machine execution if one is not provided.
  @_s.JsonKey(name: 'executionNamePrefix')
  final String executionNamePrefix;

  StepFunctionsAction({
    @_s.required this.roleArn,
    @_s.required this.stateMachineName,
    this.executionNamePrefix,
  });
  factory StepFunctionsAction.fromJson(Map<String, dynamic> json) =>
      _$StepFunctionsActionFromJson(json);

  Map<String, dynamic> toJson() => _$StepFunctionsActionToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopThingRegistrationTaskResponse {
  StopThingRegistrationTaskResponse();
  factory StopThingRegistrationTaskResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StopThingRegistrationTaskResponseFromJson(json);
}

/// Describes a group of files that can be streamed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Stream {
  /// The ID of a file associated with a stream.
  @_s.JsonKey(name: 'fileId')
  final int fileId;

  /// The stream ID.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  Stream({
    this.fileId,
    this.streamId,
  });
  factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);

  Map<String, dynamic> toJson() => _$StreamToJson(this);
}

/// Represents a file to stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamFile {
  /// The file ID.
  @_s.JsonKey(name: 'fileId')
  final int fileId;

  /// The location of the file in S3.
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  StreamFile({
    this.fileId,
    this.s3Location,
  });
  factory StreamFile.fromJson(Map<String, dynamic> json) =>
      _$StreamFileFromJson(json);

  Map<String, dynamic> toJson() => _$StreamFileToJson(this);
}

/// Information about a stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamInfo {
  /// The date when the stream was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The description of the stream.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The files to stream.
  @_s.JsonKey(name: 'files')
  final List<StreamFile> files;

  /// The date when the stream was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// An IAM role AWS IoT assumes to access your S3 files.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The stream ARN.
  @_s.JsonKey(name: 'streamArn')
  final String streamArn;

  /// The stream ID.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  /// The stream version.
  @_s.JsonKey(name: 'streamVersion')
  final int streamVersion;

  StreamInfo({
    this.createdAt,
    this.description,
    this.files,
    this.lastUpdatedAt,
    this.roleArn,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });
  factory StreamInfo.fromJson(Map<String, dynamic> json) =>
      _$StreamInfoFromJson(json);
}

/// A summary of a stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamSummary {
  /// A description of the stream.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The stream ARN.
  @_s.JsonKey(name: 'streamArn')
  final String streamArn;

  /// The stream ID.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  /// The stream version.
  @_s.JsonKey(name: 'streamVersion')
  final int streamVersion;

  StreamSummary({
    this.description,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });
  factory StreamSummary.fromJson(Map<String, dynamic> json) =>
      _$StreamSummaryFromJson(json);
}

/// A set of key/value pairs that are used to manage the resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag's key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag's value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
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

enum TargetSelection {
  @_s.JsonValue('CONTINUOUS')
  continuous,
  @_s.JsonValue('SNAPSHOT')
  snapshot,
}

extension on TargetSelection {
  String toValue() {
    switch (this) {
      case TargetSelection.continuous:
        return 'CONTINUOUS';
      case TargetSelection.snapshot:
        return 'SNAPSHOT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Statistics for the checks performed during the audit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskStatistics {
  /// The number of checks that did not run because the audit was canceled.
  @_s.JsonKey(name: 'canceledChecks')
  final int canceledChecks;

  /// The number of checks that found compliant resources.
  @_s.JsonKey(name: 'compliantChecks')
  final int compliantChecks;

  /// The number of checks.
  @_s.JsonKey(name: 'failedChecks')
  final int failedChecks;

  /// The number of checks in progress.
  @_s.JsonKey(name: 'inProgressChecks')
  final int inProgressChecks;

  /// The number of checks that found noncompliant resources.
  @_s.JsonKey(name: 'nonCompliantChecks')
  final int nonCompliantChecks;

  /// The number of checks in this audit.
  @_s.JsonKey(name: 'totalChecks')
  final int totalChecks;

  /// The number of checks waiting for data collection.
  @_s.JsonKey(name: 'waitingForDataCollectionChecks')
  final int waitingForDataCollectionChecks;

  TaskStatistics({
    this.canceledChecks,
    this.compliantChecks,
    this.failedChecks,
    this.inProgressChecks,
    this.nonCompliantChecks,
    this.totalChecks,
    this.waitingForDataCollectionChecks,
  });
  factory TaskStatistics.fromJson(Map<String, dynamic> json) =>
      _$TaskStatisticsFromJson(json);
}

/// Provides summary counts of how many tasks for findings are in a particular
/// state. This information is included in the response from
/// DescribeAuditMitigationActionsTask.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TaskStatisticsForAuditCheck {
  /// The number of findings to which the mitigation action task was canceled when
  /// applied.
  @_s.JsonKey(name: 'canceledFindingsCount')
  final int canceledFindingsCount;

  /// The number of findings for which at least one of the actions failed when
  /// applied.
  @_s.JsonKey(name: 'failedFindingsCount')
  final int failedFindingsCount;

  /// The number of findings skipped because of filter conditions provided in the
  /// parameters to the command.
  @_s.JsonKey(name: 'skippedFindingsCount')
  final int skippedFindingsCount;

  /// The number of findings for which all mitigation actions succeeded when
  /// applied.
  @_s.JsonKey(name: 'succeededFindingsCount')
  final int succeededFindingsCount;

  /// The total number of findings to which a task is being applied.
  @_s.JsonKey(name: 'totalFindingsCount')
  final int totalFindingsCount;

  TaskStatisticsForAuditCheck({
    this.canceledFindingsCount,
    this.failedFindingsCount,
    this.skippedFindingsCount,
    this.succeededFindingsCount,
    this.totalFindingsCount,
  });
  factory TaskStatisticsForAuditCheck.fromJson(Map<String, dynamic> json) =>
      _$TaskStatisticsForAuditCheckFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestAuthorizationResponse {
  /// The authentication results.
  @_s.JsonKey(name: 'authResults')
  final List<AuthResult> authResults;

  TestAuthorizationResponse({
    this.authResults,
  });
  factory TestAuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$TestAuthorizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TestInvokeAuthorizerResponse {
  /// The number of seconds after which the connection is terminated.
  @_s.JsonKey(name: 'disconnectAfterInSeconds')
  final int disconnectAfterInSeconds;

  /// True if the token is authenticated, otherwise false.
  @_s.JsonKey(name: 'isAuthenticated')
  final bool isAuthenticated;

  /// IAM policy documents.
  @_s.JsonKey(name: 'policyDocuments')
  final List<String> policyDocuments;

  /// The principal ID.
  @_s.JsonKey(name: 'principalId')
  final String principalId;

  /// The number of seconds after which the temporary credentials are refreshed.
  @_s.JsonKey(name: 'refreshAfterInSeconds')
  final int refreshAfterInSeconds;

  TestInvokeAuthorizerResponse({
    this.disconnectAfterInSeconds,
    this.isAuthenticated,
    this.policyDocuments,
    this.principalId,
    this.refreshAfterInSeconds,
  });
  factory TestInvokeAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$TestInvokeAuthorizerResponseFromJson(json);
}

/// The properties of the thing, including thing name, thing type name, and a
/// list of thing attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThingAttribute {
  /// A list of thing attributes which are name-value pairs.
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// The thing ARN.
  @_s.JsonKey(name: 'thingArn')
  final String thingArn;

  /// The name of the thing.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The name of the thing type, if the thing has been associated with a type.
  @_s.JsonKey(name: 'thingTypeName')
  final String thingTypeName;

  /// The version of the thing record in the registry.
  @_s.JsonKey(name: 'version')
  final int version;

  ThingAttribute({
    this.attributes,
    this.thingArn,
    this.thingName,
    this.thingTypeName,
    this.version,
  });
  factory ThingAttribute.fromJson(Map<String, dynamic> json) =>
      _$ThingAttributeFromJson(json);
}

/// The connectivity status of the thing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThingConnectivity {
  /// True if the thing is connected to the AWS IoT service; false if it is not
  /// connected.
  @_s.JsonKey(name: 'connected')
  final bool connected;

  /// The epoch time (in milliseconds) when the thing last connected or
  /// disconnected. If the thing has been disconnected for more than a few weeks,
  /// the time value might be missing.
  @_s.JsonKey(name: 'timestamp')
  final int timestamp;

  ThingConnectivity({
    this.connected,
    this.timestamp,
  });
  factory ThingConnectivity.fromJson(Map<String, dynamic> json) =>
      _$ThingConnectivityFromJson(json);
}

enum ThingConnectivityIndexingMode {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('STATUS')
  status,
}

/// The thing search index document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThingDocument {
  /// The attributes.
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// Indicates whether the thing is connected to the AWS IoT service.
  @_s.JsonKey(name: 'connectivity')
  final ThingConnectivity connectivity;

  /// The shadow.
  @_s.JsonKey(name: 'shadow')
  final String shadow;

  /// Thing group names.
  @_s.JsonKey(name: 'thingGroupNames')
  final List<String> thingGroupNames;

  /// The thing ID.
  @_s.JsonKey(name: 'thingId')
  final String thingId;

  /// The thing name.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The thing type name.
  @_s.JsonKey(name: 'thingTypeName')
  final String thingTypeName;

  ThingDocument({
    this.attributes,
    this.connectivity,
    this.shadow,
    this.thingGroupNames,
    this.thingId,
    this.thingName,
    this.thingTypeName,
  });
  factory ThingDocument.fromJson(Map<String, dynamic> json) =>
      _$ThingDocumentFromJson(json);
}

/// The thing group search index document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThingGroupDocument {
  /// The thing group attributes.
  @_s.JsonKey(name: 'attributes')
  final Map<String, String> attributes;

  /// Parent group names.
  @_s.JsonKey(name: 'parentGroupNames')
  final List<String> parentGroupNames;

  /// The thing group description.
  @_s.JsonKey(name: 'thingGroupDescription')
  final String thingGroupDescription;

  /// The thing group ID.
  @_s.JsonKey(name: 'thingGroupId')
  final String thingGroupId;

  /// The thing group name.
  @_s.JsonKey(name: 'thingGroupName')
  final String thingGroupName;

  ThingGroupDocument({
    this.attributes,
    this.parentGroupNames,
    this.thingGroupDescription,
    this.thingGroupId,
    this.thingGroupName,
  });
  factory ThingGroupDocument.fromJson(Map<String, dynamic> json) =>
      _$ThingGroupDocumentFromJson(json);
}

/// Thing group indexing configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ThingGroupIndexingConfiguration {
  /// Thing group indexing mode.
  @_s.JsonKey(name: 'thingGroupIndexingMode')
  final ThingGroupIndexingMode thingGroupIndexingMode;

  /// A list of thing group fields to index. This list cannot contain any managed
  /// fields. Use the GetIndexingConfiguration API to get a list of managed
  /// fields.
  ///
  /// Contains custom field names and their data type.
  @_s.JsonKey(name: 'customFields')
  final List<Field> customFields;

  /// Contains fields that are indexed and whose types are already known by the
  /// Fleet Indexing service.
  @_s.JsonKey(name: 'managedFields')
  final List<Field> managedFields;

  ThingGroupIndexingConfiguration({
    @_s.required this.thingGroupIndexingMode,
    this.customFields,
    this.managedFields,
  });
  factory ThingGroupIndexingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ThingGroupIndexingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ThingGroupIndexingConfigurationToJson(this);
}

enum ThingGroupIndexingMode {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('ON')
  on,
}

/// Thing group metadata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThingGroupMetadata {
  /// The UNIX timestamp of when the thing group was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The parent thing group name.
  @_s.JsonKey(name: 'parentGroupName')
  final String parentGroupName;

  /// The root parent thing group.
  @_s.JsonKey(name: 'rootToParentThingGroups')
  final List<GroupNameAndArn> rootToParentThingGroups;

  ThingGroupMetadata({
    this.creationDate,
    this.parentGroupName,
    this.rootToParentThingGroups,
  });
  factory ThingGroupMetadata.fromJson(Map<String, dynamic> json) =>
      _$ThingGroupMetadataFromJson(json);
}

/// Thing group properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ThingGroupProperties {
  /// The thing group attributes in JSON format.
  @_s.JsonKey(name: 'attributePayload')
  final AttributePayload attributePayload;

  /// The thing group description.
  @_s.JsonKey(name: 'thingGroupDescription')
  final String thingGroupDescription;

  ThingGroupProperties({
    this.attributePayload,
    this.thingGroupDescription,
  });
  factory ThingGroupProperties.fromJson(Map<String, dynamic> json) =>
      _$ThingGroupPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ThingGroupPropertiesToJson(this);
}

/// The thing indexing configuration. For more information, see <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/managing-index.html">Managing
/// Thing Indexing</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ThingIndexingConfiguration {
  /// Thing indexing mode. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// REGISTRY – Your thing index contains registry data only.
  /// </li>
  /// <li>
  /// REGISTRY_AND_SHADOW - Your thing index contains registry and shadow data.
  /// </li>
  /// <li>
  /// OFF - Thing indexing is disabled.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'thingIndexingMode')
  final ThingIndexingMode thingIndexingMode;

  /// Contains custom field names and their data type.
  @_s.JsonKey(name: 'customFields')
  final List<Field> customFields;

  /// Contains fields that are indexed and whose types are already known by the
  /// Fleet Indexing service.
  @_s.JsonKey(name: 'managedFields')
  final List<Field> managedFields;

  /// Thing connectivity indexing mode. Valid values are:
  ///
  /// <ul>
  /// <li>
  /// STATUS – Your thing index contains connectivity status. To enable thing
  /// connectivity indexing, thingIndexMode must not be set to OFF.
  /// </li>
  /// <li>
  /// OFF - Thing connectivity status indexing is disabled.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'thingConnectivityIndexingMode')
  final ThingConnectivityIndexingMode thingConnectivityIndexingMode;

  ThingIndexingConfiguration({
    @_s.required this.thingIndexingMode,
    this.customFields,
    this.managedFields,
    this.thingConnectivityIndexingMode,
  });
  factory ThingIndexingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ThingIndexingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ThingIndexingConfigurationToJson(this);
}

enum ThingIndexingMode {
  @_s.JsonValue('OFF')
  off,
  @_s.JsonValue('REGISTRY')
  registry,
  @_s.JsonValue('REGISTRY_AND_SHADOW')
  registryAndShadow,
}

/// The definition of the thing type, including thing type name and description.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThingTypeDefinition {
  /// The thing type ARN.
  @_s.JsonKey(name: 'thingTypeArn')
  final String thingTypeArn;

  /// The ThingTypeMetadata contains additional information about the thing type
  /// including: creation date and time, a value indicating whether the thing type
  /// is deprecated, and a date and time when it was deprecated.
  @_s.JsonKey(name: 'thingTypeMetadata')
  final ThingTypeMetadata thingTypeMetadata;

  /// The name of the thing type.
  @_s.JsonKey(name: 'thingTypeName')
  final String thingTypeName;

  /// The ThingTypeProperties for the thing type.
  @_s.JsonKey(name: 'thingTypeProperties')
  final ThingTypeProperties thingTypeProperties;

  ThingTypeDefinition({
    this.thingTypeArn,
    this.thingTypeMetadata,
    this.thingTypeName,
    this.thingTypeProperties,
  });
  factory ThingTypeDefinition.fromJson(Map<String, dynamic> json) =>
      _$ThingTypeDefinitionFromJson(json);
}

/// The ThingTypeMetadata contains additional information about the thing type
/// including: creation date and time, a value indicating whether the thing type
/// is deprecated, and a date and time when time was deprecated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThingTypeMetadata {
  /// The date and time when the thing type was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// Whether the thing type is deprecated. If <b>true</b>, no new things could be
  /// associated with this type.
  @_s.JsonKey(name: 'deprecated')
  final bool deprecated;

  /// The date and time when the thing type was deprecated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'deprecationDate')
  final DateTime deprecationDate;

  ThingTypeMetadata({
    this.creationDate,
    this.deprecated,
    this.deprecationDate,
  });
  factory ThingTypeMetadata.fromJson(Map<String, dynamic> json) =>
      _$ThingTypeMetadataFromJson(json);
}

/// The ThingTypeProperties contains information about the thing type including:
/// a thing type description, and a list of searchable thing attribute names.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ThingTypeProperties {
  /// A list of searchable thing attribute names.
  @_s.JsonKey(name: 'searchableAttributes')
  final List<String> searchableAttributes;

  /// The description of the thing type.
  @_s.JsonKey(name: 'thingTypeDescription')
  final String thingTypeDescription;

  ThingTypeProperties({
    this.searchableAttributes,
    this.thingTypeDescription,
  });
  factory ThingTypeProperties.fromJson(Map<String, dynamic> json) =>
      _$ThingTypePropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$ThingTypePropertiesToJson(this);
}

/// Specifies the amount of time each device has to finish its execution of the
/// job. A timer is started when the job execution status is set to
/// <code>IN_PROGRESS</code>. If the job execution status is not set to another
/// terminal state before the timer expires, it will be automatically set to
/// <code>TIMED_OUT</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeoutConfig {
  /// Specifies the amount of time, in minutes, this device has to finish
  /// execution of this job. The timeout interval can be anywhere between 1 minute
  /// and 7 days (1 to 10080 minutes). The in progress timer can't be updated and
  /// will apply to all job executions for the job. Whenever a job execution
  /// remains in the IN_PROGRESS status for longer than this interval, the job
  /// execution will fail and switch to the terminal <code>TIMED_OUT</code>
  /// status.
  @_s.JsonKey(name: 'inProgressTimeoutInMinutes')
  final int inProgressTimeoutInMinutes;

  TimeoutConfig({
    this.inProgressTimeoutInMinutes,
  });
  factory TimeoutConfig.fromJson(Map<String, dynamic> json) =>
      _$TimeoutConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TimeoutConfigToJson(this);
}

/// The Timestream rule action writes attributes (measures) from an MQTT message
/// into an Amazon Timestream table. For more information, see the <a
/// href="https://docs.aws.amazon.com/iot/latest/developerguide/timestream-rule-action.html">Timestream</a>
/// topic rule action documentation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimestreamAction {
  /// The name of an Amazon Timestream database.
  @_s.JsonKey(name: 'databaseName')
  final String databaseName;

  /// Metadata attributes of the time series that are written in each measure
  /// record.
  @_s.JsonKey(name: 'dimensions')
  final List<TimestreamDimension> dimensions;

  /// The ARN of the role that grants permission to write to the Amazon Timestream
  /// database table.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The name of the database table into which to write the measure records.
  @_s.JsonKey(name: 'tableName')
  final String tableName;

  /// Specifies an application-defined value to replace the default value assigned
  /// to the Timestream record's timestamp in the <code>time</code> column.
  ///
  /// You can use this property to specify the value and the precision of the
  /// Timestream record's timestamp. You can specify a value from the message
  /// payload or a value computed by a substitution template.
  ///
  /// If omitted, the topic rule action assigns the timestamp, in milliseconds, at
  /// the time it processed the rule.
  @_s.JsonKey(name: 'timestamp')
  final TimestreamTimestamp timestamp;

  TimestreamAction({
    @_s.required this.databaseName,
    @_s.required this.dimensions,
    @_s.required this.roleArn,
    @_s.required this.tableName,
    this.timestamp,
  });
  factory TimestreamAction.fromJson(Map<String, dynamic> json) =>
      _$TimestreamActionFromJson(json);

  Map<String, dynamic> toJson() => _$TimestreamActionToJson(this);
}

/// Metadata attributes of the time series that are written in each measure
/// record.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimestreamDimension {
  /// The metadata dimension name. This is the name of the column in the Amazon
  /// Timestream database table record.
  ///
  /// Dimensions cannot be named: <code>measure_name</code>,
  /// <code>measure_value</code>, or <code>time</code>. These names are reserved.
  /// Dimension names cannot start with <code>ts_</code> or
  /// <code>measure_value</code> and they cannot contain the colon
  /// (<code>:</code>) character.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The value to write in this column of the database record.
  @_s.JsonKey(name: 'value')
  final String value;

  TimestreamDimension({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory TimestreamDimension.fromJson(Map<String, dynamic> json) =>
      _$TimestreamDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$TimestreamDimensionToJson(this);
}

/// Describes how to interpret an application-defined timestamp value from an
/// MQTT message payload and the precision of that value.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimestreamTimestamp {
  /// The precision of the timestamp value that results from the expression
  /// described in <code>value</code>.
  ///
  /// Valid values: <code>SECONDS</code> | <code>MILLISECONDS</code> |
  /// <code>MICROSECONDS</code> | <code>NANOSECONDS</code>. The default is
  /// <code>MILLISECONDS</code>.
  @_s.JsonKey(name: 'unit')
  final String unit;

  /// An expression that returns a long epoch time value.
  @_s.JsonKey(name: 'value')
  final String value;

  TimestreamTimestamp({
    @_s.required this.unit,
    @_s.required this.value,
  });
  factory TimestreamTimestamp.fromJson(Map<String, dynamic> json) =>
      _$TimestreamTimestampFromJson(json);

  Map<String, dynamic> toJson() => _$TimestreamTimestampToJson(this);
}

/// Specifies the TLS context to use for the test authorizer request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TlsContext {
  /// The value of the <code>serverName</code> key in a TLS authorization request.
  @_s.JsonKey(name: 'serverName')
  final String serverName;

  TlsContext({
    this.serverName,
  });
  Map<String, dynamic> toJson() => _$TlsContextToJson(this);
}

/// Describes a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TopicRule {
  /// The actions associated with the rule.
  @_s.JsonKey(name: 'actions')
  final List<Action> actions;

  /// The version of the SQL rules engine to use when evaluating the rule.
  @_s.JsonKey(name: 'awsIotSqlVersion')
  final String awsIotSqlVersion;

  /// The date and time the rule was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The description of the rule.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The action to perform when an error occurs.
  @_s.JsonKey(name: 'errorAction')
  final Action errorAction;

  /// Specifies whether the rule is disabled.
  @_s.JsonKey(name: 'ruleDisabled')
  final bool ruleDisabled;

  /// The name of the rule.
  @_s.JsonKey(name: 'ruleName')
  final String ruleName;

  /// The SQL statement used to query the topic. When using a SQL query with
  /// multiple lines, be sure to escape the newline characters.
  @_s.JsonKey(name: 'sql')
  final String sql;

  TopicRule({
    this.actions,
    this.awsIotSqlVersion,
    this.createdAt,
    this.description,
    this.errorAction,
    this.ruleDisabled,
    this.ruleName,
    this.sql,
  });
  factory TopicRule.fromJson(Map<String, dynamic> json) =>
      _$TopicRuleFromJson(json);
}

/// A topic rule destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TopicRuleDestination {
  /// The topic rule destination URL.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time when the topic rule destination was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Properties of the HTTP URL.
  @_s.JsonKey(name: 'httpUrlProperties')
  final HttpUrlDestinationProperties httpUrlProperties;

  /// The date and time when the topic rule destination was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The status of the topic rule destination. Valid values are:
  /// <dl> <dt>IN_PROGRESS</dt> <dd>
  /// A topic rule destination was created but has not been confirmed. You can set
  /// <code>status</code> to <code>IN_PROGRESS</code> by calling
  /// <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> <dt>ENABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is allowed. You
  /// can set <code>status</code> to <code>DISABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>DISABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is not allowed.
  /// You can set <code>status</code> to <code>ENABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>ERROR</dt> <dd>
  /// Confirmation could not be completed, for example if the confirmation timed
  /// out. You can call <code>GetTopicRuleDestination</code> for details about the
  /// error. You can set <code>status</code> to <code>IN_PROGRESS</code> by
  /// calling <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> </dl>
  @_s.JsonKey(name: 'status')
  final TopicRuleDestinationStatus status;

  /// Additional details or reason why the topic rule destination is in the
  /// current status.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// Properties of the virtual private cloud (VPC) connection.
  @_s.JsonKey(name: 'vpcProperties')
  final VpcDestinationProperties vpcProperties;

  TopicRuleDestination({
    this.arn,
    this.createdAt,
    this.httpUrlProperties,
    this.lastUpdatedAt,
    this.status,
    this.statusReason,
    this.vpcProperties,
  });
  factory TopicRuleDestination.fromJson(Map<String, dynamic> json) =>
      _$TopicRuleDestinationFromJson(json);
}

/// Configuration of the topic rule destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TopicRuleDestinationConfiguration {
  /// Configuration of the HTTP URL.
  @_s.JsonKey(name: 'httpUrlConfiguration')
  final HttpUrlDestinationConfiguration httpUrlConfiguration;

  /// Configuration of the virtual private cloud (VPC) connection.
  @_s.JsonKey(name: 'vpcConfiguration')
  final VpcDestinationConfiguration vpcConfiguration;

  TopicRuleDestinationConfiguration({
    this.httpUrlConfiguration,
    this.vpcConfiguration,
  });
  Map<String, dynamic> toJson() =>
      _$TopicRuleDestinationConfigurationToJson(this);
}

enum TopicRuleDestinationStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('DELETING')
  deleting,
}

extension on TopicRuleDestinationStatus {
  String toValue() {
    switch (this) {
      case TopicRuleDestinationStatus.enabled:
        return 'ENABLED';
      case TopicRuleDestinationStatus.inProgress:
        return 'IN_PROGRESS';
      case TopicRuleDestinationStatus.disabled:
        return 'DISABLED';
      case TopicRuleDestinationStatus.error:
        return 'ERROR';
      case TopicRuleDestinationStatus.deleting:
        return 'DELETING';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about the topic rule destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TopicRuleDestinationSummary {
  /// The topic rule destination ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time when the topic rule destination was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Information about the HTTP URL.
  @_s.JsonKey(name: 'httpUrlSummary')
  final HttpUrlDestinationSummary httpUrlSummary;

  /// The date and time when the topic rule destination was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The status of the topic rule destination. Valid values are:
  /// <dl> <dt>IN_PROGRESS</dt> <dd>
  /// A topic rule destination was created but has not been confirmed. You can set
  /// <code>status</code> to <code>IN_PROGRESS</code> by calling
  /// <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> <dt>ENABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is allowed. You
  /// can set <code>status</code> to <code>DISABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>DISABLED</dt> <dd>
  /// Confirmation was completed, and traffic to this destination is not allowed.
  /// You can set <code>status</code> to <code>ENABLED</code> by calling
  /// <code>UpdateTopicRuleDestination</code>.
  /// </dd> <dt>ERROR</dt> <dd>
  /// Confirmation could not be completed, for example if the confirmation timed
  /// out. You can call <code>GetTopicRuleDestination</code> for details about the
  /// error. You can set <code>status</code> to <code>IN_PROGRESS</code> by
  /// calling <code>UpdateTopicRuleDestination</code>. Calling
  /// <code>UpdateTopicRuleDestination</code> causes a new confirmation challenge
  /// to be sent to your confirmation endpoint.
  /// </dd> </dl>
  @_s.JsonKey(name: 'status')
  final TopicRuleDestinationStatus status;

  /// The reason the topic rule destination is in the current status.
  @_s.JsonKey(name: 'statusReason')
  final String statusReason;

  /// Information about the virtual private cloud (VPC) connection.
  @_s.JsonKey(name: 'vpcDestinationSummary')
  final VpcDestinationSummary vpcDestinationSummary;

  TopicRuleDestinationSummary({
    this.arn,
    this.createdAt,
    this.httpUrlSummary,
    this.lastUpdatedAt,
    this.status,
    this.statusReason,
    this.vpcDestinationSummary,
  });
  factory TopicRuleDestinationSummary.fromJson(Map<String, dynamic> json) =>
      _$TopicRuleDestinationSummaryFromJson(json);
}

/// Describes a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TopicRuleListItem {
  /// The date and time the rule was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The rule ARN.
  @_s.JsonKey(name: 'ruleArn')
  final String ruleArn;

  /// Specifies whether the rule is disabled.
  @_s.JsonKey(name: 'ruleDisabled')
  final bool ruleDisabled;

  /// The name of the rule.
  @_s.JsonKey(name: 'ruleName')
  final String ruleName;

  /// The pattern for the topic names that apply.
  @_s.JsonKey(name: 'topicPattern')
  final String topicPattern;

  TopicRuleListItem({
    this.createdAt,
    this.ruleArn,
    this.ruleDisabled,
    this.ruleName,
    this.topicPattern,
  });
  factory TopicRuleListItem.fromJson(Map<String, dynamic> json) =>
      _$TopicRuleListItemFromJson(json);
}

/// Describes a rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TopicRulePayload {
  /// The actions associated with the rule.
  @_s.JsonKey(name: 'actions')
  final List<Action> actions;

  /// The SQL statement used to query the topic. For more information, see <a
  /// href="https://docs.aws.amazon.com/iot/latest/developerguide/iot-sql-reference.html">AWS
  /// IoT SQL Reference</a> in the <i>AWS IoT Developer Guide</i>.
  @_s.JsonKey(name: 'sql')
  final String sql;

  /// The version of the SQL rules engine to use when evaluating the rule.
  @_s.JsonKey(name: 'awsIotSqlVersion')
  final String awsIotSqlVersion;

  /// The description of the rule.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The action to take when an error occurs.
  @_s.JsonKey(name: 'errorAction')
  final Action errorAction;

  /// Specifies whether the rule is disabled.
  @_s.JsonKey(name: 'ruleDisabled')
  final bool ruleDisabled;

  TopicRulePayload({
    @_s.required this.actions,
    @_s.required this.sql,
    this.awsIotSqlVersion,
    this.description,
    this.errorAction,
    this.ruleDisabled,
  });
  Map<String, dynamic> toJson() => _$TopicRulePayloadToJson(this);
}

/// The output from the TransferCertificate operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransferCertificateResponse {
  /// The ARN of the certificate.
  @_s.JsonKey(name: 'transferredCertificateArn')
  final String transferredCertificateArn;

  TransferCertificateResponse({
    this.transferredCertificateArn,
  });
  factory TransferCertificateResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferCertificateResponseFromJson(json);
}

/// Data used to transfer a certificate to an AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransferData {
  /// The date the transfer was accepted.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'acceptDate')
  final DateTime acceptDate;

  /// The date the transfer was rejected.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'rejectDate')
  final DateTime rejectDate;

  /// The reason why the transfer was rejected.
  @_s.JsonKey(name: 'rejectReason')
  final String rejectReason;

  /// The date the transfer took place.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'transferDate')
  final DateTime transferDate;

  /// The transfer message.
  @_s.JsonKey(name: 'transferMessage')
  final String transferMessage;

  TransferData({
    this.acceptDate,
    this.rejectDate,
    this.rejectReason,
    this.transferDate,
    this.transferMessage,
  });
  factory TransferData.fromJson(Map<String, dynamic> json) =>
      _$TransferDataFromJson(json);
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
class UpdateAccountAuditConfigurationResponse {
  UpdateAccountAuditConfigurationResponse();
  factory UpdateAccountAuditConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAccountAuditConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAuditSuppressionResponse {
  UpdateAuditSuppressionResponse();
  factory UpdateAuditSuppressionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAuditSuppressionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAuthorizerResponse {
  /// The authorizer ARN.
  @_s.JsonKey(name: 'authorizerArn')
  final String authorizerArn;

  /// The authorizer name.
  @_s.JsonKey(name: 'authorizerName')
  final String authorizerName;

  UpdateAuthorizerResponse({
    this.authorizerArn,
    this.authorizerName,
  });
  factory UpdateAuthorizerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAuthorizerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBillingGroupResponse {
  /// The latest version of the billing group.
  @_s.JsonKey(name: 'version')
  final int version;

  UpdateBillingGroupResponse({
    this.version,
  });
  factory UpdateBillingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBillingGroupResponseFromJson(json);
}

/// Parameters to define a mitigation action that changes the state of the CA
/// certificate to inactive.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UpdateCACertificateParams {
  /// The action that you want to apply to the CA certificate. The only supported
  /// value is <code>DEACTIVATE</code>.
  @_s.JsonKey(name: 'action')
  final CACertificateUpdateAction action;

  UpdateCACertificateParams({
    @_s.required this.action,
  });
  factory UpdateCACertificateParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateCACertificateParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCACertificateParamsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCustomMetricResponse {
  /// The creation date of the custom metric in milliseconds since epoch.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// A friendly name in the console for the custom metric
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  /// The time the custom metric was last modified in milliseconds since epoch.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The Amazon Resource Number (ARN) of the custom metric.
  @_s.JsonKey(name: 'metricArn')
  final String metricArn;

  /// The name of the custom metric.
  @_s.JsonKey(name: 'metricName')
  final String metricName;

  /// The type of the custom metric. Types include <code>string-list</code>,
  /// <code>ip-address-list</code>, <code>number-list</code>, and
  /// <code>number</code>.
  @_s.JsonKey(name: 'metricType')
  final CustomMetricType metricType;

  UpdateCustomMetricResponse({
    this.creationDate,
    this.displayName,
    this.lastModifiedDate,
    this.metricArn,
    this.metricName,
    this.metricType,
  });
  factory UpdateCustomMetricResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomMetricResponseFromJson(json);
}

/// Parameters to define a mitigation action that changes the state of the
/// device certificate to inactive.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UpdateDeviceCertificateParams {
  /// The action that you want to apply to the device certificate. The only
  /// supported value is <code>DEACTIVATE</code>.
  @_s.JsonKey(name: 'action')
  final DeviceCertificateUpdateAction action;

  UpdateDeviceCertificateParams({
    @_s.required this.action,
  });
  factory UpdateDeviceCertificateParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateDeviceCertificateParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateDeviceCertificateParamsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDimensionResponse {
  /// The Amazon Resource Name (ARN)of the created dimension.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time, in milliseconds since epoch, when the dimension was
  /// initially created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The date and time, in milliseconds since epoch, when the dimension was most
  /// recently updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// A unique identifier for the dimension.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The value or list of values used to scope the dimension. For example, for
  /// topic filters, this is the pattern used to match the MQTT topic name.
  @_s.JsonKey(name: 'stringValues')
  final List<String> stringValues;

  /// The type of the dimension.
  @_s.JsonKey(name: 'type')
  final DimensionType type;

  UpdateDimensionResponse({
    this.arn,
    this.creationDate,
    this.lastModifiedDate,
    this.name,
    this.stringValues,
    this.type,
  });
  factory UpdateDimensionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDimensionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainConfigurationResponse {
  /// The ARN of the domain configuration that was updated.
  @_s.JsonKey(name: 'domainConfigurationArn')
  final String domainConfigurationArn;

  /// The name of the domain configuration that was updated.
  @_s.JsonKey(name: 'domainConfigurationName')
  final String domainConfigurationName;

  UpdateDomainConfigurationResponse({
    this.domainConfigurationArn,
    this.domainConfigurationName,
  });
  factory UpdateDomainConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDomainConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDynamicThingGroupResponse {
  /// The dynamic thing group version.
  @_s.JsonKey(name: 'version')
  final int version;

  UpdateDynamicThingGroupResponse({
    this.version,
  });
  factory UpdateDynamicThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDynamicThingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEventConfigurationsResponse {
  UpdateEventConfigurationsResponse();
  factory UpdateEventConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateEventConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateIndexingConfigurationResponse {
  UpdateIndexingConfigurationResponse();
  factory UpdateIndexingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateIndexingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMitigationActionResponse {
  /// The ARN for the new mitigation action.
  @_s.JsonKey(name: 'actionArn')
  final String actionArn;

  /// A unique identifier for the mitigation action.
  @_s.JsonKey(name: 'actionId')
  final String actionId;

  UpdateMitigationActionResponse({
    this.actionArn,
    this.actionId,
  });
  factory UpdateMitigationActionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMitigationActionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProvisioningTemplateResponse {
  UpdateProvisioningTemplateResponse();
  factory UpdateProvisioningTemplateResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProvisioningTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRoleAliasResponse {
  /// The role alias.
  @_s.JsonKey(name: 'roleAlias')
  final String roleAlias;

  /// The role alias ARN.
  @_s.JsonKey(name: 'roleAliasArn')
  final String roleAliasArn;

  UpdateRoleAliasResponse({
    this.roleAlias,
    this.roleAliasArn,
  });
  factory UpdateRoleAliasResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoleAliasResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateScheduledAuditResponse {
  /// The ARN of the scheduled audit.
  @_s.JsonKey(name: 'scheduledAuditArn')
  final String scheduledAuditArn;

  UpdateScheduledAuditResponse({
    this.scheduledAuditArn,
  });
  factory UpdateScheduledAuditResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateScheduledAuditResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSecurityProfileResponse {
  /// <i>Please use
  /// <a>UpdateSecurityProfileResponse$additionalMetricsToRetainV2</a>
  /// instead.</i>
  ///
  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the security profile's
  /// <code>behaviors</code>, but it is also retained for any metric specified
  /// here.
  @_s.JsonKey(name: 'additionalMetricsToRetain')
  final List<String> additionalMetricsToRetain;

  /// A list of metrics whose data is retained (stored). By default, data is
  /// retained for any metric used in the profile's behaviors, but it is also
  /// retained for any metric specified here. Can be used with custom metrics;
  /// cannot be used with dimensions.
  @_s.JsonKey(name: 'additionalMetricsToRetainV2')
  final List<MetricToRetain> additionalMetricsToRetainV2;

  /// Where the alerts are sent. (Alerts are always sent to the console.)
  @_s.JsonKey(name: 'alertTargets')
  final Map<AlertTargetType, AlertTarget> alertTargets;

  /// Specifies the behaviors that, when violated by a device (thing), cause an
  /// alert.
  @_s.JsonKey(name: 'behaviors')
  final List<Behavior> behaviors;

  /// The time the security profile was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationDate')
  final DateTime creationDate;

  /// The time the security profile was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedDate')
  final DateTime lastModifiedDate;

  /// The ARN of the security profile that was updated.
  @_s.JsonKey(name: 'securityProfileArn')
  final String securityProfileArn;

  /// The description of the security profile.
  @_s.JsonKey(name: 'securityProfileDescription')
  final String securityProfileDescription;

  /// The name of the security profile that was updated.
  @_s.JsonKey(name: 'securityProfileName')
  final String securityProfileName;

  /// The updated version of the security profile.
  @_s.JsonKey(name: 'version')
  final int version;

  UpdateSecurityProfileResponse({
    this.additionalMetricsToRetain,
    this.additionalMetricsToRetainV2,
    this.alertTargets,
    this.behaviors,
    this.creationDate,
    this.lastModifiedDate,
    this.securityProfileArn,
    this.securityProfileDescription,
    this.securityProfileName,
    this.version,
  });
  factory UpdateSecurityProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSecurityProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateStreamResponse {
  /// A description of the stream.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The stream ARN.
  @_s.JsonKey(name: 'streamArn')
  final String streamArn;

  /// The stream ID.
  @_s.JsonKey(name: 'streamId')
  final String streamId;

  /// The stream version.
  @_s.JsonKey(name: 'streamVersion')
  final int streamVersion;

  UpdateStreamResponse({
    this.description,
    this.streamArn,
    this.streamId,
    this.streamVersion,
  });
  factory UpdateStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThingGroupResponse {
  /// The version of the updated thing group.
  @_s.JsonKey(name: 'version')
  final int version;

  UpdateThingGroupResponse({
    this.version,
  });
  factory UpdateThingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateThingGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThingGroupsForThingResponse {
  UpdateThingGroupsForThingResponse();
  factory UpdateThingGroupsForThingResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateThingGroupsForThingResponseFromJson(json);
}

/// The output from the UpdateThing operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateThingResponse {
  UpdateThingResponse();
  factory UpdateThingResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateThingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTopicRuleDestinationResponse {
  UpdateTopicRuleDestinationResponse();
  factory UpdateTopicRuleDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateTopicRuleDestinationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidateSecurityProfileBehaviorsResponse {
  /// True if the behaviors were valid.
  @_s.JsonKey(name: 'valid')
  final bool valid;

  /// The list of any errors found in the behaviors.
  @_s.JsonKey(name: 'validationErrors')
  final List<ValidationError> validationErrors;

  ValidateSecurityProfileBehaviorsResponse({
    this.valid,
    this.validationErrors,
  });
  factory ValidateSecurityProfileBehaviorsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ValidateSecurityProfileBehaviorsResponseFromJson(json);
}

/// Information about an error found in a behavior specification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidationError {
  /// The description of an error found in the behaviors.
  @_s.JsonKey(name: 'errorMessage')
  final String errorMessage;

  ValidationError({
    this.errorMessage,
  });
  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);
}

/// Information about a Device Defender security profile behavior violation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ViolationEvent {
  /// The behavior that was violated.
  @_s.JsonKey(name: 'behavior')
  final Behavior behavior;

  /// The value of the metric (the measurement).
  @_s.JsonKey(name: 'metricValue')
  final MetricValue metricValue;

  /// The name of the security profile whose behavior was violated.
  @_s.JsonKey(name: 'securityProfileName')
  final String securityProfileName;

  /// The name of the thing responsible for the violation event.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  /// The details of a violation event.
  @_s.JsonKey(name: 'violationEventAdditionalInfo')
  final ViolationEventAdditionalInfo violationEventAdditionalInfo;

  /// The time the violation event occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'violationEventTime')
  final DateTime violationEventTime;

  /// The type of violation event.
  @_s.JsonKey(name: 'violationEventType')
  final ViolationEventType violationEventType;

  /// The ID of the violation event.
  @_s.JsonKey(name: 'violationId')
  final String violationId;

  ViolationEvent({
    this.behavior,
    this.metricValue,
    this.securityProfileName,
    this.thingName,
    this.violationEventAdditionalInfo,
    this.violationEventTime,
    this.violationEventType,
    this.violationId,
  });
  factory ViolationEvent.fromJson(Map<String, dynamic> json) =>
      _$ViolationEventFromJson(json);
}

/// The details of a violation event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ViolationEventAdditionalInfo {
  /// The sensitivity of anomalous behavior evaluation. Can be <code>Low</code>,
  /// <code>Medium</code>, or <code>High</code>.
  @_s.JsonKey(name: 'confidenceLevel')
  final ConfidenceLevel confidenceLevel;

  ViolationEventAdditionalInfo({
    this.confidenceLevel,
  });
  factory ViolationEventAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$ViolationEventAdditionalInfoFromJson(json);
}

/// Specifies the time period of which violation events occurred between.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ViolationEventOccurrenceRange {
  /// The end date and time of a time period in which violation events occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The start date and time of a time period in which violation events occurred.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  ViolationEventOccurrenceRange({
    @_s.required this.endTime,
    @_s.required this.startTime,
  });
  factory ViolationEventOccurrenceRange.fromJson(Map<String, dynamic> json) =>
      _$ViolationEventOccurrenceRangeFromJson(json);

  Map<String, dynamic> toJson() => _$ViolationEventOccurrenceRangeToJson(this);
}

enum ViolationEventType {
  @_s.JsonValue('in-alarm')
  inAlarm,
  @_s.JsonValue('alarm-cleared')
  alarmCleared,
  @_s.JsonValue('alarm-invalidated')
  alarmInvalidated,
}

/// The configuration information for a virtual private cloud (VPC) destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcDestinationConfiguration {
  /// The ARN of a role that has permission to create and attach to elastic
  /// network interfaces (ENIs).
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The subnet IDs of the VPC destination.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC.
  @_s.JsonKey(name: 'vpcId')
  final String vpcId;

  /// The security groups of the VPC destination.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  VpcDestinationConfiguration({
    @_s.required this.roleArn,
    @_s.required this.subnetIds,
    @_s.required this.vpcId,
    this.securityGroups,
  });
  Map<String, dynamic> toJson() => _$VpcDestinationConfigurationToJson(this);
}

/// The properties of a virtual private cloud (VPC) destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcDestinationProperties {
  /// The ARN of a role that has permission to create and attach to elastic
  /// network interfaces (ENIs).
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The security groups of the VPC destination.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  /// The subnet IDs of the VPC destination.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC.
  @_s.JsonKey(name: 'vpcId')
  final String vpcId;

  VpcDestinationProperties({
    this.roleArn,
    this.securityGroups,
    this.subnetIds,
    this.vpcId,
  });
  factory VpcDestinationProperties.fromJson(Map<String, dynamic> json) =>
      _$VpcDestinationPropertiesFromJson(json);
}

/// The summary of a virtual private cloud (VPC) destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcDestinationSummary {
  /// The ARN of a role that has permission to create and attach to elastic
  /// network interfaces (ENIs).
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// The security groups of the VPC destination.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  /// The subnet IDs of the VPC destination.
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC.
  @_s.JsonKey(name: 'vpcId')
  final String vpcId;

  VpcDestinationSummary({
    this.roleArn,
    this.securityGroups,
    this.subnetIds,
    this.vpcId,
  });
  factory VpcDestinationSummary.fromJson(Map<String, dynamic> json) =>
      _$VpcDestinationSummaryFromJson(json);
}

class CertificateConflictException extends _s.GenericAwsException {
  CertificateConflictException({String type, String message})
      : super(
            type: type, code: 'CertificateConflictException', message: message);
}

class CertificateStateException extends _s.GenericAwsException {
  CertificateStateException({String type, String message})
      : super(type: type, code: 'CertificateStateException', message: message);
}

class CertificateValidationException extends _s.GenericAwsException {
  CertificateValidationException({String type, String message})
      : super(
            type: type,
            code: 'CertificateValidationException',
            message: message);
}

class ConflictingResourceUpdateException extends _s.GenericAwsException {
  ConflictingResourceUpdateException({String type, String message})
      : super(
            type: type,
            code: 'ConflictingResourceUpdateException',
            message: message);
}

class DeleteConflictException extends _s.GenericAwsException {
  DeleteConflictException({String type, String message})
      : super(type: type, code: 'DeleteConflictException', message: message);
}

class IndexNotReadyException extends _s.GenericAwsException {
  IndexNotReadyException({String type, String message})
      : super(type: type, code: 'IndexNotReadyException', message: message);
}

class InternalException extends _s.GenericAwsException {
  InternalException({String type, String message})
      : super(type: type, code: 'InternalException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String type, String message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class InvalidAggregationException extends _s.GenericAwsException {
  InvalidAggregationException({String type, String message})
      : super(
            type: type, code: 'InvalidAggregationException', message: message);
}

class InvalidQueryException extends _s.GenericAwsException {
  InvalidQueryException({String type, String message})
      : super(type: type, code: 'InvalidQueryException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidResponseException extends _s.GenericAwsException {
  InvalidResponseException({String type, String message})
      : super(type: type, code: 'InvalidResponseException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MalformedPolicyException extends _s.GenericAwsException {
  MalformedPolicyException({String type, String message})
      : super(type: type, code: 'MalformedPolicyException', message: message);
}

class NotConfiguredException extends _s.GenericAwsException {
  NotConfiguredException({String type, String message})
      : super(type: type, code: 'NotConfiguredException', message: message);
}

class RegistrationCodeValidationException extends _s.GenericAwsException {
  RegistrationCodeValidationException({String type, String message})
      : super(
            type: type,
            code: 'RegistrationCodeValidationException',
            message: message);
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

class ResourceRegistrationFailureException extends _s.GenericAwsException {
  ResourceRegistrationFailureException({String type, String message})
      : super(
            type: type,
            code: 'ResourceRegistrationFailureException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class SqlParseException extends _s.GenericAwsException {
  SqlParseException({String type, String message})
      : super(type: type, code: 'SqlParseException', message: message);
}

class TaskAlreadyExistsException extends _s.GenericAwsException {
  TaskAlreadyExistsException({String type, String message})
      : super(type: type, code: 'TaskAlreadyExistsException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TransferAlreadyCompletedException extends _s.GenericAwsException {
  TransferAlreadyCompletedException({String type, String message})
      : super(
            type: type,
            code: 'TransferAlreadyCompletedException',
            message: message);
}

class TransferConflictException extends _s.GenericAwsException {
  TransferConflictException({String type, String message})
      : super(type: type, code: 'TransferConflictException', message: message);
}

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String type, String message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

class VersionConflictException extends _s.GenericAwsException {
  VersionConflictException({String type, String message})
      : super(type: type, code: 'VersionConflictException', message: message);
}

class VersionsLimitExceededException extends _s.GenericAwsException {
  VersionsLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'VersionsLimitExceededException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CertificateConflictException': (type, message) =>
      CertificateConflictException(type: type, message: message),
  'CertificateStateException': (type, message) =>
      CertificateStateException(type: type, message: message),
  'CertificateValidationException': (type, message) =>
      CertificateValidationException(type: type, message: message),
  'ConflictingResourceUpdateException': (type, message) =>
      ConflictingResourceUpdateException(type: type, message: message),
  'DeleteConflictException': (type, message) =>
      DeleteConflictException(type: type, message: message),
  'IndexNotReadyException': (type, message) =>
      IndexNotReadyException(type: type, message: message),
  'InternalException': (type, message) =>
      InternalException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'InvalidAggregationException': (type, message) =>
      InvalidAggregationException(type: type, message: message),
  'InvalidQueryException': (type, message) =>
      InvalidQueryException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidResponseException': (type, message) =>
      InvalidResponseException(type: type, message: message),
  'InvalidStateTransitionException': (type, message) =>
      InvalidStateTransitionException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MalformedPolicyException': (type, message) =>
      MalformedPolicyException(type: type, message: message),
  'NotConfiguredException': (type, message) =>
      NotConfiguredException(type: type, message: message),
  'RegistrationCodeValidationException': (type, message) =>
      RegistrationCodeValidationException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceRegistrationFailureException': (type, message) =>
      ResourceRegistrationFailureException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'SqlParseException': (type, message) =>
      SqlParseException(type: type, message: message),
  'TaskAlreadyExistsException': (type, message) =>
      TaskAlreadyExistsException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TransferAlreadyCompletedException': (type, message) =>
      TransferAlreadyCompletedException(type: type, message: message),
  'TransferConflictException': (type, message) =>
      TransferConflictException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'VersionConflictException': (type, message) =>
      VersionConflictException(type: type, message: message),
  'VersionsLimitExceededException': (type, message) =>
      VersionsLimitExceededException(type: type, message: message),
};
