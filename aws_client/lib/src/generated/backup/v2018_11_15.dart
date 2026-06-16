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

/// Backup is a unified backup service designed to protect Amazon Web Services
/// services and their associated data. Backup simplifies the creation,
/// migration, restoration, and deletion of backups, while also providing
/// reporting and auditing.
class Backup {
  final _s.RestJsonProtocol _protocol;
  Backup({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'backup',
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

  /// Associates an MPA approval team with a backup vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of the backup vault to associate with the MPA approval team.
  ///
  /// Parameter [mpaApprovalTeamArn] :
  /// The Amazon Resource Name (ARN) of the MPA approval team to associate with
  /// the backup vault.
  ///
  /// Parameter [requesterComment] :
  /// A comment provided by the requester explaining the association request.
  Future<void> associateBackupVaultMpaApprovalTeam({
    required String backupVaultName,
    required String mpaApprovalTeamArn,
    String? requesterComment,
  }) async {
    final $payload = <String, dynamic>{
      'MpaApprovalTeamArn': mpaApprovalTeamArn,
      if (requesterComment != null) 'RequesterComment': requesterComment,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/mpaApprovalTeam',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified legal hold on a recovery point. This action can only
  /// be performed by a user with sufficient permissions.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidResourceStateException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [cancelDescription] :
  /// A string the describes the reason for removing the legal hold.
  ///
  /// Parameter [legalHoldId] :
  /// The ID of the legal hold.
  ///
  /// Parameter [retainRecordInDays] :
  /// The integer amount, in days, after which to remove legal hold.
  Future<void> cancelLegalHold({
    required String cancelDescription,
    required String legalHoldId,
    int? retainRecordInDays,
  }) async {
    final $query = <String, List<String>>{
      'cancelDescription': [cancelDescription],
      if (retainRecordInDays != null)
        'retainRecordInDays': [retainRecordInDays.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/legal-holds/${Uri.encodeComponent(legalHoldId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a backup plan using a backup plan name and backup rules. A backup
  /// plan is a document that contains information that Backup uses to schedule
  /// tasks that create recovery points for resources.
  ///
  /// If you call <code>CreateBackupPlan</code> with a plan that already exists,
  /// you receive an <code>AlreadyExistsException</code> exception.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlan] :
  /// The body of a backup plan. Includes a <code>BackupPlanName</code> and one
  /// or more sets of <code>Rules</code>.
  ///
  /// Parameter [backupPlanTags] :
  /// The tags to assign to the backup plan.
  ///
  /// Parameter [creatorRequestId] :
  /// Identifies the request and allows failed requests to be retried without
  /// the risk of running the operation twice. If the request includes a
  /// <code>CreatorRequestId</code> that matches an existing backup plan, that
  /// plan is returned. This parameter is optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  Future<CreateBackupPlanOutput> createBackupPlan({
    required BackupPlanInput backupPlan,
    Map<String, String>? backupPlanTags,
    String? creatorRequestId,
  }) async {
    final $payload = <String, dynamic>{
      'BackupPlan': backupPlan,
      if (backupPlanTags != null) 'BackupPlanTags': backupPlanTags,
      'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/backup/plans',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackupPlanOutput.fromJson(response);
  }

  /// Creates a JSON document that specifies a set of resources to assign to a
  /// backup plan. For examples, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/assigning-resources.html#assigning-resources-json">Assigning
  /// resources programmatically</a>.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// The ID of the backup plan.
  ///
  /// Parameter [backupSelection] :
  /// The body of a request to assign a set of resources to a backup plan.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of running the operation twice. This parameter
  /// is optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  Future<CreateBackupSelectionOutput> createBackupSelection({
    required String backupPlanId,
    required BackupSelection backupSelection,
    String? creatorRequestId,
  }) async {
    final $payload = <String, dynamic>{
      'BackupSelection': backupSelection,
      'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/selections',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackupSelectionOutput.fromJson(response);
  }

  /// Creates a logical container where backups are stored. A
  /// <code>CreateBackupVault</code> request includes a name, optionally one or
  /// more resource tags, an encryption key, and a request ID.
  /// <note>
  /// Do not include sensitive data, such as passport numbers, in the name of a
  /// backup vault.
  /// </note>
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [backupVaultTags] :
  /// The tags to assign to the backup vault.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of running the operation twice. This parameter
  /// is optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  Future<CreateBackupVaultOutput> createBackupVault({
    required String backupVaultName,
    Map<String, String>? backupVaultTags,
    String? creatorRequestId,
    String? encryptionKeyArn,
  }) async {
    final $payload = <String, dynamic>{
      if (backupVaultTags != null) 'BackupVaultTags': backupVaultTags,
      'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/backup-vaults/${Uri.encodeComponent(backupVaultName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackupVaultOutput.fromJson(response);
  }

  /// Creates a framework with one or more controls. A framework is a collection
  /// of controls that you can use to evaluate your backup practices. By using
  /// pre-built customizable controls to define your policies, you can evaluate
  /// whether your backup practices comply with your policies and which
  /// resources are not yet in compliance.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [frameworkControls] :
  /// The controls that make up the framework. Each control in the list has a
  /// name, input parameters, and scope.
  ///
  /// Parameter [frameworkName] :
  /// The unique name of the framework. The name must be between 1 and 256
  /// characters, starting with a letter, and consisting of letters (a-z, A-Z),
  /// numbers (0-9), and underscores (_).
  ///
  /// Parameter [frameworkDescription] :
  /// An optional description of the framework with a maximum of 1,024
  /// characters.
  ///
  /// Parameter [frameworkTags] :
  /// The tags to assign to the framework.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>CreateFrameworkInput</code>. Retrying a
  /// successful request with the same idempotency token results in a success
  /// message with no action taken.
  Future<CreateFrameworkOutput> createFramework({
    required List<FrameworkControl> frameworkControls,
    required String frameworkName,
    String? frameworkDescription,
    Map<String, String>? frameworkTags,
    String? idempotencyToken,
  }) async {
    final $payload = <String, dynamic>{
      'FrameworkControls': frameworkControls,
      'FrameworkName': frameworkName,
      if (frameworkDescription != null)
        'FrameworkDescription': frameworkDescription,
      if (frameworkTags != null) 'FrameworkTags': frameworkTags,
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/frameworks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFrameworkOutput.fromJson(response);
  }

  /// Creates a legal hold on a recovery point (backup). A legal hold is a
  /// restraint on altering or deleting a backup until an authorized user
  /// cancels the legal hold. Any actions to delete or disassociate a recovery
  /// point will fail with an error if one or more active legal holds are on the
  /// recovery point.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [description] :
  /// The description of the legal hold.
  ///
  /// Parameter [title] :
  /// The title of the legal hold.
  ///
  /// Parameter [idempotencyToken] :
  /// This is a user-chosen string used to distinguish between otherwise
  /// identical calls. Retrying a successful request with the same idempotency
  /// token results in a success message with no action taken.
  ///
  /// Parameter [recoveryPointSelection] :
  /// The criteria to assign a set of resources, such as resource types or
  /// backup vaults.
  ///
  /// Parameter [tags] :
  /// Optional tags to include. A tag is a key-value pair you can use to manage,
  /// filter, and search for your resources. Allowed characters include UTF-8
  /// letters, numbers, spaces, and the following characters: + - = . _ : /.
  Future<CreateLegalHoldOutput> createLegalHold({
    required String description,
    required String title,
    String? idempotencyToken,
    RecoveryPointSelection? recoveryPointSelection,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Description': description,
      'Title': title,
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      if (recoveryPointSelection != null)
        'RecoveryPointSelection': recoveryPointSelection,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/legal-holds',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLegalHoldOutput.fromJson(response);
  }

  /// Creates a logical container to where backups may be copied.
  ///
  /// This request includes a name, the Region, the maximum number of retention
  /// days, the minimum number of retention days, and optionally can include
  /// tags and a creator request ID.
  /// <note>
  /// Do not include sensitive data, such as passport numbers, in the name of a
  /// backup vault.
  /// </note>
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Logically
  /// air-gapped backup vaults are identified by names that are unique to the
  /// account used to create them and the Region where they are created.
  ///
  /// Parameter [maxRetentionDays] :
  /// The maximum retention period that the vault retains its recovery points.
  ///
  /// Parameter [minRetentionDays] :
  /// This setting specifies the minimum retention period that the vault retains
  /// its recovery points.
  ///
  /// The minimum value accepted is 7 days.
  ///
  /// Parameter [backupVaultTags] :
  /// The tags to assign to the vault.
  ///
  /// Parameter [creatorRequestId] :
  /// The ID of the creation request.
  ///
  /// This parameter is optional. If used, this parameter must contain 1 to 50
  /// alphanumeric or '-_.' characters.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The ARN of the customer-managed KMS key to use for encrypting the
  /// logically air-gapped backup vault. If not specified, the vault will be
  /// encrypted with an Amazon Web Services-owned key managed by Amazon Web
  /// Services Backup.
  Future<CreateLogicallyAirGappedBackupVaultOutput>
      createLogicallyAirGappedBackupVault({
    required String backupVaultName,
    required int maxRetentionDays,
    required int minRetentionDays,
    Map<String, String>? backupVaultTags,
    String? creatorRequestId,
    String? encryptionKeyArn,
  }) async {
    final $payload = <String, dynamic>{
      'MaxRetentionDays': maxRetentionDays,
      'MinRetentionDays': minRetentionDays,
      if (backupVaultTags != null) 'BackupVaultTags': backupVaultTags,
      'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/logically-air-gapped-backup-vaults/${Uri.encodeComponent(backupVaultName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLogicallyAirGappedBackupVaultOutput.fromJson(response);
  }

  /// Creates a report plan. A report plan is a document that contains
  /// information about the contents of the report and where Backup will deliver
  /// it.
  ///
  /// If you call <code>CreateReportPlan</code> with a plan that already exists,
  /// you receive an <code>AlreadyExistsException</code> exception.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [reportDeliveryChannel] :
  /// A structure that contains information about where and how to deliver your
  /// reports, specifically your Amazon S3 bucket name, S3 key prefix, and the
  /// formats of your reports.
  ///
  /// Parameter [reportPlanName] :
  /// The unique name of the report plan. The name must be between 1 and 256
  /// characters, starting with a letter, and consisting of letters (a-z, A-Z),
  /// numbers (0-9), and underscores (_).
  ///
  /// Parameter [reportSetting] :
  /// Identifies the report template for the report. Reports are built using a
  /// report template. The report templates are:
  ///
  /// <code>RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT |
  /// BACKUP_JOB_REPORT | COPY_JOB_REPORT | RESTORE_JOB_REPORT | SCAN_JOB_REPORT
  /// </code>
  ///
  /// If the report template is <code>RESOURCE_COMPLIANCE_REPORT</code> or
  /// <code>CONTROL_COMPLIANCE_REPORT</code>, this API resource also describes
  /// the report coverage by Amazon Web Services Regions and frameworks.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>CreateReportPlanInput</code>. Retrying a
  /// successful request with the same idempotency token results in a success
  /// message with no action taken.
  ///
  /// Parameter [reportPlanDescription] :
  /// An optional description of the report plan with a maximum of 1,024
  /// characters.
  ///
  /// Parameter [reportPlanTags] :
  /// The tags to assign to the report plan.
  Future<CreateReportPlanOutput> createReportPlan({
    required ReportDeliveryChannel reportDeliveryChannel,
    required String reportPlanName,
    required ReportSetting reportSetting,
    String? idempotencyToken,
    String? reportPlanDescription,
    Map<String, String>? reportPlanTags,
  }) async {
    final $payload = <String, dynamic>{
      'ReportDeliveryChannel': reportDeliveryChannel,
      'ReportPlanName': reportPlanName,
      'ReportSetting': reportSetting,
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      if (reportPlanDescription != null)
        'ReportPlanDescription': reportPlanDescription,
      if (reportPlanTags != null) 'ReportPlanTags': reportPlanTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/report-plans',
      exceptionFnMap: _exceptionFns,
    );
    return CreateReportPlanOutput.fromJson(response);
  }

  /// Creates a restore access backup vault that provides temporary access to
  /// recovery points in a logically air-gapped backup vault, subject to MPA
  /// approval.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [sourceBackupVaultArn] :
  /// The ARN of the source backup vault containing the recovery points to which
  /// temporary access is requested.
  ///
  /// Parameter [backupVaultName] :
  /// The name of the backup vault to associate with an MPA approval team.
  ///
  /// Parameter [backupVaultTags] :
  /// Optional tags to assign to the restore access backup vault.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of executing the operation twice.
  ///
  /// Parameter [requesterComment] :
  /// A comment explaining the reason for requesting restore access to the
  /// backup vault.
  Future<CreateRestoreAccessBackupVaultOutput> createRestoreAccessBackupVault({
    required String sourceBackupVaultArn,
    String? backupVaultName,
    Map<String, String>? backupVaultTags,
    String? creatorRequestId,
    String? requesterComment,
  }) async {
    final $payload = <String, dynamic>{
      'SourceBackupVaultArn': sourceBackupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (backupVaultTags != null) 'BackupVaultTags': backupVaultTags,
      'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
      if (requesterComment != null) 'RequesterComment': requesterComment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/restore-access-backup-vaults',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRestoreAccessBackupVaultOutput.fromJson(response);
  }

  /// Creates a restore testing plan.
  ///
  /// The first of two steps to create a restore testing plan. After this
  /// request is successful, finish the procedure using
  /// CreateRestoreTestingSelection.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlan] :
  /// A restore testing plan must contain a unique
  /// <code>RestoreTestingPlanName</code> string you create and must contain a
  /// <code>ScheduleExpression</code> cron. You may optionally include a
  /// <code>StartWindowHours</code> integer and a <code>CreatorRequestId</code>
  /// string.
  ///
  /// The <code>RestoreTestingPlanName</code> is a unique string that is the
  /// name of the restore testing plan. This cannot be changed after creation,
  /// and it must consist of only alphanumeric characters and underscores.
  ///
  /// Parameter [creatorRequestId] :
  /// This is a unique string that identifies the request and allows failed
  /// requests to be retriedwithout the risk of running the operation twice.
  /// This parameter is optional. If used, this parameter must contain 1 to 50
  /// alphanumeric or '-_.' characters.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the restore testing plan.
  Future<CreateRestoreTestingPlanOutput> createRestoreTestingPlan({
    required RestoreTestingPlanForCreate restoreTestingPlan,
    String? creatorRequestId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'RestoreTestingPlan': restoreTestingPlan,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/restore-testing/plans',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRestoreTestingPlanOutput.fromJson(response);
  }

  /// This request can be sent after CreateRestoreTestingPlan request returns
  /// successfully. This is the second part of creating a resource testing plan,
  /// and it must be completed sequentially.
  ///
  /// This consists of <code>RestoreTestingSelectionName</code>,
  /// <code>ProtectedResourceType</code>, and one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ProtectedResourceArns</code>
  /// </li>
  /// <li>
  /// <code>ProtectedResourceConditions</code>
  /// </li>
  /// </ul>
  /// Each protected resource type can have one single value.
  ///
  /// A restore testing selection can include a wildcard value ("*") for
  /// <code>ProtectedResourceArns</code> along with
  /// <code>ProtectedResourceConditions</code>. Alternatively, you can include
  /// up to 30 specific protected resource ARNs in
  /// <code>ProtectedResourceArns</code>.
  ///
  /// Cannot select by both protected resource types AND specific ARNs. Request
  /// will fail if both are included.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlanName] :
  /// Input the restore testing plan name that was returned from the related
  /// CreateRestoreTestingPlan request.
  ///
  /// Parameter [restoreTestingSelection] :
  /// This consists of <code>RestoreTestingSelectionName</code>,
  /// <code>ProtectedResourceType</code>, and one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ProtectedResourceArns</code>
  /// </li>
  /// <li>
  /// <code>ProtectedResourceConditions</code>
  /// </li>
  /// </ul>
  /// Each protected resource type can have one single value.
  ///
  /// A restore testing selection can include a wildcard value ("*") for
  /// <code>ProtectedResourceArns</code> along with
  /// <code>ProtectedResourceConditions</code>. Alternatively, you can include
  /// up to 30 specific protected resource ARNs in
  /// <code>ProtectedResourceArns</code>.
  ///
  /// Parameter [creatorRequestId] :
  /// This is an optional unique string that identifies the request and allows
  /// failed requests to be retried without the risk of running the operation
  /// twice. If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  Future<CreateRestoreTestingSelectionOutput> createRestoreTestingSelection({
    required String restoreTestingPlanName,
    required RestoreTestingSelectionForCreate restoreTestingSelection,
    String? creatorRequestId,
  }) async {
    final $payload = <String, dynamic>{
      'RestoreTestingSelection': restoreTestingSelection,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}/selections',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRestoreTestingSelectionOutput.fromJson(response);
  }

  /// Creates a tiering configuration.
  ///
  /// A tiering configuration enables automatic movement of backup data to a
  /// lower-cost storage tier based on the age of backed-up objects in the
  /// backup vault.
  ///
  /// Each vault can only have one vault-specific tiering configuration, in
  /// addition to any global configuration that applies to all vaults.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [tieringConfiguration] :
  /// A tiering configuration must contain a unique
  /// <code>TieringConfigurationName</code> string you create and must contain a
  /// <code>BackupVaultName</code> and <code>ResourceSelection</code>. You may
  /// optionally include a <code>CreatorRequestId</code> string.
  ///
  /// The <code>TieringConfigurationName</code> is a unique string that is the
  /// name of the tiering configuration. This cannot be changed after creation,
  /// and it must consist of only alphanumeric characters and underscores.
  ///
  /// Parameter [creatorRequestId] :
  /// This is a unique string that identifies the request and allows failed
  /// requests to be retried without the risk of running the operation twice.
  /// This parameter is optional. If used, this parameter must contain 1 to 50
  /// alphanumeric or '-_.' characters.
  ///
  /// Parameter [tieringConfigurationTags] :
  /// The tags to assign to the tiering configuration.
  Future<CreateTieringConfigurationOutput> createTieringConfiguration({
    required TieringConfigurationInputForCreate tieringConfiguration,
    String? creatorRequestId,
    Map<String, String>? tieringConfigurationTags,
  }) async {
    final $payload = <String, dynamic>{
      'TieringConfiguration': tieringConfiguration,
      'CreatorRequestId': creatorRequestId ?? _s.generateIdempotencyToken(),
      if (tieringConfigurationTags != null)
        'TieringConfigurationTags': tieringConfigurationTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tiering-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTieringConfigurationOutput.fromJson(response);
  }

  /// Deletes a backup plan. A backup plan can only be deleted after all
  /// associated selections of resources have been deleted. Deleting a backup
  /// plan deletes the current version of a backup plan. Previous versions, if
  /// any, will still exist.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  Future<DeleteBackupPlanOutput> deleteBackupPlan({
    required String backupPlanId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/backup/plans/${Uri.encodeComponent(backupPlanId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBackupPlanOutput.fromJson(response);
  }

  /// Deletes the resource selection associated with a backup plan that is
  /// specified by the <code>SelectionId</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [selectionId] :
  /// Uniquely identifies the body of a request to assign a set of resources to
  /// a backup plan.
  Future<void> deleteBackupSelection({
    required String backupPlanId,
    required String selectionId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/selections/${Uri.encodeComponent(selectionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the backup vault identified by its name. A vault can be deleted
  /// only if it is empty.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  Future<void> deleteBackupVault({
    required String backupVaultName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/backup-vaults/${Uri.encodeComponent(backupVaultName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the policy document that manages permissions on a backup vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
  Future<void> deleteBackupVaultAccessPolicy({
    required String backupVaultName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes Backup Vault Lock from a backup vault specified by a backup vault
  /// name.
  ///
  /// If the Vault Lock configuration is immutable, then you cannot delete Vault
  /// Lock using API operations, and you will receive an
  /// <code>InvalidRequestException</code> if you attempt to do so. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/vault-lock.html">Vault
  /// Lock</a> in the <i>Backup Developer Guide</i>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of the backup vault from which to delete Backup Vault Lock.
  Future<void> deleteBackupVaultLockConfiguration({
    required String backupVaultName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/vault-lock',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes event notifications for the specified backup vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created.
  Future<void> deleteBackupVaultNotifications({
    required String backupVaultName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the framework specified by a framework name.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [frameworkName] :
  /// The unique name of a framework.
  Future<void> deleteFramework({
    required String frameworkName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/audit/frameworks/${Uri.encodeComponent(frameworkName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the recovery point specified by a recovery point ID.
  ///
  /// If the recovery point ID belongs to a continuous backup, calling this
  /// endpoint deletes the existing continuous backup and stops future
  /// continuous backup.
  ///
  /// When an IAM role's permissions are insufficient to call this API, the
  /// service sends back an HTTP 200 response with an empty HTTP body, but the
  /// recovery point is not deleted. Instead, it enters an <code>EXPIRED</code>
  /// state.
  ///
  /// <code>EXPIRED</code> recovery points can be deleted with this API once the
  /// IAM role has the <code>iam:CreateServiceLinkedRole</code> action. To learn
  /// more about adding this role, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/deleting-backups.html#deleting-backups-troubleshooting">
  /// Troubleshooting manual deletions</a>.
  ///
  /// If the user or role is deleted or the permission within the role is
  /// removed, the deletion will not be successful and will enter an
  /// <code>EXPIRED</code> state.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidResourceStateException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<void> deleteRecoveryPoint({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the report plan specified by a report plan name.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [reportPlanName] :
  /// The unique name of a report plan.
  Future<void> deleteReportPlan({
    required String reportPlanName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/audit/report-plans/${Uri.encodeComponent(reportPlanName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This request deletes the specified restore testing plan.
  ///
  /// Deletion can only successfully occur if all associated restore testing
  /// selections are deleted first.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlanName] :
  /// Required unique name of the restore testing plan you wish to delete.
  Future<void> deleteRestoreTestingPlan({
    required String restoreTestingPlanName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Input the Restore Testing Plan name and Restore Testing Selection name.
  ///
  /// All testing selections associated with a restore testing plan must be
  /// deleted before the restore testing plan can be deleted.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlanName] :
  /// Required unique name of the restore testing plan that contains the restore
  /// testing selection you wish to delete.
  ///
  /// Parameter [restoreTestingSelectionName] :
  /// Required unique name of the restore testing selection you wish to delete.
  Future<void> deleteRestoreTestingSelection({
    required String restoreTestingPlanName,
    required String restoreTestingSelectionName,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}/selections/${Uri.encodeComponent(restoreTestingSelectionName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the tiering configuration specified by a tiering configuration
  /// name.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [tieringConfigurationName] :
  /// The unique name of a tiering configuration.
  Future<void> deleteTieringConfiguration({
    required String tieringConfigurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tiering-configurations/${Uri.encodeComponent(tieringConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns backup job details for the specified <code>BackupJobId</code>.
  ///
  /// May throw [DependencyFailureException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupJobId] :
  /// Uniquely identifies a request to Backup to back up a resource.
  Future<DescribeBackupJobOutput> describeBackupJob({
    required String backupJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-jobs/${Uri.encodeComponent(backupJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBackupJobOutput.fromJson(response);
  }

  /// Returns metadata about a backup vault specified by its name.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [backupVaultAccountId] :
  /// The account ID of the specified backup vault.
  Future<DescribeBackupVaultOutput> describeBackupVault({
    required String backupVaultName,
    String? backupVaultAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (backupVaultAccountId != null)
        'backupVaultAccountId': [backupVaultAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-vaults/${Uri.encodeComponent(backupVaultName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeBackupVaultOutput.fromJson(response);
  }

  /// Returns metadata associated with creating a copy of a resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [copyJobId] :
  /// Uniquely identifies a copy job.
  Future<DescribeCopyJobOutput> describeCopyJob({
    required String copyJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/copy-jobs/${Uri.encodeComponent(copyJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCopyJobOutput.fromJson(response);
  }

  /// Returns the framework details for the specified
  /// <code>FrameworkName</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [frameworkName] :
  /// The unique name of a framework.
  Future<DescribeFrameworkOutput> describeFramework({
    required String frameworkName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/frameworks/${Uri.encodeComponent(frameworkName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFrameworkOutput.fromJson(response);
  }

  /// Describes whether the Amazon Web Services account has enabled different
  /// cross-account management options, including cross-account backup,
  /// multi-party approval, and delegated administrator. Returns an error if the
  /// account is not a member of an Organizations organization. Example:
  /// <code>describe-global-settings --region us-west-2</code>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  Future<DescribeGlobalSettingsOutput> describeGlobalSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/global-settings',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeGlobalSettingsOutput.fromJson(response);
  }

  /// Returns information about a saved resource, including the last time it was
  /// backed up, its Amazon Resource Name (ARN), and the Amazon Web Services
  /// service type of the saved resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  Future<DescribeProtectedResourceOutput> describeProtectedResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resources/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProtectedResourceOutput.fromJson(response);
  }

  /// Returns metadata associated with a recovery point, including ID, status,
  /// encryption, and lifecycle.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [backupVaultAccountId] :
  /// The account ID of the specified backup vault.
  Future<DescribeRecoveryPointOutput> describeRecoveryPoint({
    required String backupVaultName,
    required String recoveryPointArn,
    String? backupVaultAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (backupVaultAccountId != null)
        'backupVaultAccountId': [backupVaultAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRecoveryPointOutput.fromJson(response);
  }

  /// Returns the current service opt-in settings for the Region. If service
  /// opt-in is enabled for a service, Backup tries to protect that service's
  /// resources in this Region, when the resource is included in an on-demand
  /// backup or scheduled backup plan. Otherwise, Backup does not try to protect
  /// that service's resources in this Region.
  ///
  /// May throw [ServiceUnavailableException].
  Future<DescribeRegionSettingsOutput> describeRegionSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/account-settings',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRegionSettingsOutput.fromJson(response);
  }

  /// Returns the details associated with creating a report as specified by its
  /// <code>ReportJobId</code>.
  ///
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [reportJobId] :
  /// The identifier of the report job. A unique, randomly generated, Unicode,
  /// UTF-8 encoded string that is at most 1,024 bytes long. The report job ID
  /// cannot be edited.
  Future<DescribeReportJobOutput> describeReportJob({
    required String reportJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/report-jobs/${Uri.encodeComponent(reportJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReportJobOutput.fromJson(response);
  }

  /// Returns a list of all report plans for an Amazon Web Services account and
  /// Amazon Web Services Region.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [reportPlanName] :
  /// The unique name of a report plan.
  Future<DescribeReportPlanOutput> describeReportPlan({
    required String reportPlanName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/report-plans/${Uri.encodeComponent(reportPlanName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReportPlanOutput.fromJson(response);
  }

  /// Returns metadata associated with a restore job that is specified by a job
  /// ID.
  ///
  /// May throw [DependencyFailureException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreJobId] :
  /// Uniquely identifies the job that restores a recovery point.
  Future<DescribeRestoreJobOutput> describeRestoreJob({
    required String restoreJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-jobs/${Uri.encodeComponent(restoreJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRestoreJobOutput.fromJson(response);
  }

  /// Returns scan job details for the specified ScanJobID.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [scanJobId] :
  /// Uniquely identifies a request to Backup to scan a resource.
  Future<DescribeScanJobOutput> describeScanJob({
    required String scanJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scan/jobs/${Uri.encodeComponent(scanJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScanJobOutput.fromJson(response);
  }

  /// Removes the association between an MPA approval team and a backup vault,
  /// disabling the MPA approval workflow for restore operations.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of the backup vault from which to disassociate the MPA approval
  /// team.
  ///
  /// Parameter [requesterComment] :
  /// An optional comment explaining the reason for disassociating the MPA
  /// approval team from the backup vault.
  Future<void> disassociateBackupVaultMpaApprovalTeam({
    required String backupVaultName,
    String? requesterComment,
  }) async {
    final $payload = <String, dynamic>{
      if (requesterComment != null) 'RequesterComment': requesterComment,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/mpaApprovalTeam?delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified continuous backup recovery point from Backup and
  /// releases control of that continuous backup to the source service, such as
  /// Amazon RDS. The source service will continue to create and retain
  /// continuous backups using the lifecycle that you specified in your original
  /// backup plan.
  ///
  /// Does not support snapshot backup recovery points.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidResourceStateException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The unique name of an Backup vault.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies an Backup recovery
  /// point.
  Future<void> disassociateRecoveryPoint({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}/disassociate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This action to a specific child (nested) recovery point removes the
  /// relationship between the specified recovery point and its parent
  /// (composite) recovery point.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where the child (nested) recovery point is
  /// stored. Backup vaults are identified by names that are unique to the
  /// account used to create them and the Amazon Web Services Region where they
  /// are created.
  ///
  /// Parameter [recoveryPointArn] :
  /// The Amazon Resource Name (ARN) that uniquely identifies the child (nested)
  /// recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45.</code>
  Future<void> disassociateRecoveryPointFromParent({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}/parentAssociation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the backup plan that is specified by the plan ID as a backup
  /// template.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  Future<ExportBackupPlanTemplateOutput> exportBackupPlanTemplate({
    required String backupPlanId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/toTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return ExportBackupPlanTemplateOutput.fromJson(response);
  }

  /// Returns <code>BackupPlan</code> details for the specified
  /// <code>BackupPlanId</code>. The details are the body of a backup plan in
  /// JSON format, in addition to plan metadata.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [maxScheduledRunsPreview] :
  /// Number of future scheduled backup runs to preview. When set to 0
  /// (default), no scheduled runs preview is included in the response. Valid
  /// range is 0-10.
  ///
  /// Parameter [versionId] :
  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1,024 bytes long. Version IDs cannot be edited.
  Future<GetBackupPlanOutput> getBackupPlan({
    required String backupPlanId,
    int? maxScheduledRunsPreview,
    String? versionId,
  }) async {
    _s.validateNumRange(
      'maxScheduledRunsPreview',
      maxScheduledRunsPreview,
      0,
      10,
    );
    final $query = <String, List<String>>{
      if (maxScheduledRunsPreview != null)
        'MaxScheduledRunsPreview': [maxScheduledRunsPreview.toString()],
      if (versionId != null) 'versionId': [versionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup/plans/${Uri.encodeComponent(backupPlanId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupPlanOutput.fromJson(response);
  }

  /// Returns a valid JSON document specifying a backup plan or an error.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanTemplateJson] :
  /// A customer-supplied backup plan document in JSON format.
  Future<GetBackupPlanFromJSONOutput> getBackupPlanFromJSON({
    required String backupPlanTemplateJson,
  }) async {
    final $payload = <String, dynamic>{
      'BackupPlanTemplateJson': backupPlanTemplateJson,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backup/template/json/toPlan',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupPlanFromJSONOutput.fromJson(response);
  }

  /// Returns the template specified by its <code>templateId</code> as a backup
  /// plan.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanTemplateId] :
  /// Uniquely identifies a stored backup plan template.
  Future<GetBackupPlanFromTemplateOutput> getBackupPlanFromTemplate({
    required String backupPlanTemplateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/template/plans/${Uri.encodeComponent(backupPlanTemplateId)}/toPlan',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupPlanFromTemplateOutput.fromJson(response);
  }

  /// Returns selection metadata and a document in JSON format that specifies a
  /// list of resources that are associated with a backup plan.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [selectionId] :
  /// Uniquely identifies the body of a request to assign a set of resources to
  /// a backup plan.
  Future<GetBackupSelectionOutput> getBackupSelection({
    required String backupPlanId,
    required String selectionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/selections/${Uri.encodeComponent(selectionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupSelectionOutput.fromJson(response);
  }

  /// Returns the access policy document that is associated with the named
  /// backup vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  Future<GetBackupVaultAccessPolicyOutput> getBackupVaultAccessPolicy({
    required String backupVaultName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupVaultAccessPolicyOutput.fromJson(response);
  }

  /// Returns event notifications for the specified backup vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  Future<GetBackupVaultNotificationsOutput> getBackupVaultNotifications({
    required String backupVaultName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupVaultNotificationsOutput.fromJson(response);
  }

  /// This action returns details for a specified legal hold. The details are
  /// the body of a legal hold in JSON format, in addition to metadata.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [legalHoldId] :
  /// The ID of the legal hold.
  Future<GetLegalHoldOutput> getLegalHold({
    required String legalHoldId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/legal-holds/${Uri.encodeComponent(legalHoldId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLegalHoldOutput.fromJson(response);
  }

  /// Returns the malware scan results for a specified point in time within a
  /// continuous (point-in-time recovery) backup.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [malwareScanner] :
  /// The scanning engine used for the corresponding scan job. Currently only
  /// <code>GUARDDUTY</code> is supported.
  ///
  /// Parameter [recoveryPointArn] :
  /// An ARN that uniquely identifies the target recovery point for scanning;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [scanEndTime] :
  /// The point in time within the continuous backup to examine for malware scan
  /// results.
  Future<GetPITRMalwareScanResultsOutput> getPITRMalwareScanResults({
    required String backupVaultName,
    required MalwareScanner malwareScanner,
    required String recoveryPointArn,
    required DateTime scanEndTime,
  }) async {
    final $query = <String, List<String>>{
      'BackupVaultName': [backupVaultName],
      'MalwareScanner': [malwareScanner.value],
      'RecoveryPointArn': [recoveryPointArn],
      'ScanEndTime': [_s.iso8601ToJson(scanEndTime).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scan/pitr-malware-scan-results',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPITRMalwareScanResultsOutput.fromJson(response);
  }

  /// This operation returns the metadata and details specific to the backup
  /// index associated with the specified recovery point.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created.
  ///
  /// Accepted characters include lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<GetRecoveryPointIndexDetailsOutput> getRecoveryPointIndexDetails({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}/index',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecoveryPointIndexDetailsOutput.fromJson(response);
  }

  /// Returns a set of metadata key-value pairs that were used to create the
  /// backup.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [backupVaultAccountId] :
  /// The account ID of the specified backup vault.
  Future<GetRecoveryPointRestoreMetadataOutput>
      getRecoveryPointRestoreMetadata({
    required String backupVaultName,
    required String recoveryPointArn,
    String? backupVaultAccountId,
  }) async {
    final $query = <String, List<String>>{
      if (backupVaultAccountId != null)
        'backupVaultAccountId': [backupVaultAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}/restore-metadata',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRecoveryPointRestoreMetadataOutput.fromJson(response);
  }

  /// This request returns the metadata for the specified restore job.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreJobId] :
  /// This is a unique identifier of a restore job within Backup.
  Future<GetRestoreJobMetadataOutput> getRestoreJobMetadata({
    required String restoreJobId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-jobs/${Uri.encodeComponent(restoreJobId)}/metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetRestoreJobMetadataOutput.fromJson(response);
  }

  /// This request returns the minimal required set of metadata needed to start
  /// a restore job with secure default settings. <code>BackupVaultName</code>
  /// and <code>RecoveryPointArn</code> are required parameters.
  /// <code>BackupVaultAccountId</code> is an optional parameter.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web ServicesRegion where they are created. They consist of
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [backupVaultAccountId] :
  /// The account ID of the specified backup vault.
  Future<GetRestoreTestingInferredMetadataOutput>
      getRestoreTestingInferredMetadata({
    required String backupVaultName,
    required String recoveryPointArn,
    String? backupVaultAccountId,
  }) async {
    final $query = <String, List<String>>{
      'BackupVaultName': [backupVaultName],
      'RecoveryPointArn': [recoveryPointArn],
      if (backupVaultAccountId != null)
        'BackupVaultAccountId': [backupVaultAccountId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-testing/inferred-metadata',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRestoreTestingInferredMetadataOutput.fromJson(response);
  }

  /// Returns <code>RestoreTestingPlan</code> details for the specified
  /// <code>RestoreTestingPlanName</code>. The details are the body of a restore
  /// testing plan in JSON format, in addition to plan metadata.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlanName] :
  /// Required unique name of the restore testing plan.
  Future<GetRestoreTestingPlanOutput> getRestoreTestingPlan({
    required String restoreTestingPlanName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRestoreTestingPlanOutput.fromJson(response);
  }

  /// Returns RestoreTestingSelection, which displays resources and elements of
  /// the restore testing plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlanName] :
  /// Required unique name of the restore testing plan.
  ///
  /// Parameter [restoreTestingSelectionName] :
  /// Required unique name of the restore testing selection.
  Future<GetRestoreTestingSelectionOutput> getRestoreTestingSelection({
    required String restoreTestingPlanName,
    required String restoreTestingSelectionName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}/selections/${Uri.encodeComponent(restoreTestingSelectionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRestoreTestingSelectionOutput.fromJson(response);
  }

  /// Returns the Amazon Web Services resource types supported by Backup.
  ///
  /// May throw [ServiceUnavailableException].
  Future<GetSupportedResourceTypesOutput> getSupportedResourceTypes() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/supported-resource-types',
      exceptionFnMap: _exceptionFns,
    );
    return GetSupportedResourceTypesOutput.fromJson(response);
  }

  /// Returns <code>TieringConfiguration</code> details for the specified
  /// <code>TieringConfigurationName</code>. The details are the body of a
  /// tiering configuration in JSON format, in addition to configuration
  /// metadata.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [tieringConfigurationName] :
  /// The unique name of a tiering configuration.
  Future<GetTieringConfigurationOutput> getTieringConfiguration({
    required String tieringConfigurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tiering-configurations/${Uri.encodeComponent(tieringConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTieringConfigurationOutput.fromJson(response);
  }

  /// Returns a list of existing backup jobs for an authenticated account for
  /// the last 30 days. For a longer period of time, consider using these <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">monitoring
  /// tools</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byAccountId] :
  /// The account ID to list the jobs from. Returns only backup jobs associated
  /// with the specified account ID.
  ///
  /// If used from an Organizations management account, passing <code>*</code>
  /// returns all jobs across the organization.
  ///
  /// Parameter [byBackupVaultName] :
  /// Returns only backup jobs that will be stored in the specified backup
  /// vault. Backup vaults are identified by names that are unique to the
  /// account used to create them and the Amazon Web Services Region where they
  /// are created.
  ///
  /// Parameter [byCompleteAfter] :
  /// Returns only backup jobs completed after a date expressed in Unix format
  /// and Coordinated Universal Time (UTC).
  ///
  /// Parameter [byCompleteBefore] :
  /// Returns only backup jobs completed before a date expressed in Unix format
  /// and Coordinated Universal Time (UTC).
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only backup jobs that were created after the specified date.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only backup jobs that were created before the specified date.
  ///
  /// Parameter [byMessageCategory] :
  /// This is an optional parameter that can be used to filter out jobs with a
  /// MessageCategory which matches the value you input.
  ///
  /// Example strings may include <code>AccessDenied</code>,
  /// <code>SUCCESS</code>, <code>AGGREGATE_ALL</code>, and
  /// <code>InvalidParameters</code>.
  ///
  /// View <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  ///
  /// The wildcard () returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message
  /// categories and returns the sum.
  ///
  /// Parameter [byParentJobId] :
  /// This is a filter to list child (nested) jobs based on parent job ID.
  ///
  /// Parameter [byResourceArn] :
  /// Returns only backup jobs that match the specified resource Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only backup jobs for the specified resources:
  ///
  /// <ul>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>CloudFormation</code> for CloudFormation
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code> for Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>EKS</code> for Amazon Elastic Kubernetes Service
  /// </li>
  /// <li>
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases on Amazon
  /// Elastic Compute Cloud instances
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for VMware virtual machines
  /// </li>
  /// </ul>
  ///
  /// Parameter [byState] :
  /// Returns only backup jobs that are in the specified state.
  ///
  /// <code>Completed with issues</code> is a status found only in the Backup
  /// console. For API, this status refers to jobs with a state of
  /// <code>COMPLETED</code> and a <code>MessageCategory</code> with a value
  /// other than <code>SUCCESS</code>; that is, the status is completed but
  /// comes with a status message.
  ///
  /// To obtain the job count for <code>Completed with issues</code>, run two
  /// GET requests, and subtract the second, smaller number:
  ///
  /// GET /backup-jobs/?state=COMPLETED
  ///
  /// GET /backup-jobs/?messageCategory=SUCCESS&state=COMPLETED
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupJobsOutput> listBackupJobs({
    String? byAccountId,
    String? byBackupVaultName,
    DateTime? byCompleteAfter,
    DateTime? byCompleteBefore,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
    String? byMessageCategory,
    String? byParentJobId,
    String? byResourceArn,
    String? byResourceType,
    BackupJobState? byState,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byAccountId != null) 'accountId': [byAccountId],
      if (byBackupVaultName != null) 'backupVaultName': [byBackupVaultName],
      if (byCompleteAfter != null)
        'completeAfter': [_s.iso8601ToJson(byCompleteAfter).toString()],
      if (byCompleteBefore != null)
        'completeBefore': [_s.iso8601ToJson(byCompleteBefore).toString()],
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
      if (byMessageCategory != null) 'messageCategory': [byMessageCategory],
      if (byParentJobId != null) 'parentJobId': [byParentJobId],
      if (byResourceArn != null) 'resourceArn': [byResourceArn],
      if (byResourceType != null) 'resourceType': [byResourceType],
      if (byState != null) 'state': [byState.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupJobsOutput.fromJson(response);
  }

  /// This is a request for a summary of backup jobs created or running within
  /// the most recent 30 days. You can include parameters AccountID, State,
  /// ResourceType, MessageCategory, AggregationPeriod, MaxResults, or NextToken
  /// to filter results.
  ///
  /// This request returns a summary that contains Region, Account, State,
  /// ResourceType, MessageCategory, StartTime, EndTime, and Count of included
  /// jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// Returns the job count for the specified account.
  ///
  /// If the request is sent from a member account or an account not part of
  /// Amazon Web Services Organizations, jobs within requestor's account will be
  /// returned.
  ///
  /// Root, admin, and delegated administrator accounts can use the value ANY to
  /// return job counts from every account in the organization.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts from all accounts within
  /// the authenticated organization, then returns the sum.
  ///
  /// Parameter [aggregationPeriod] :
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> - The daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> - The aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> - The aggregated job count for prior 14 days.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// The value is an integer. Range of accepted values is from 1 to 500.
  ///
  /// Parameter [messageCategory] :
  /// This parameter returns the job count for the specified message category.
  ///
  /// Example accepted strings include <code>AccessDenied</code>,
  /// <code>Success</code>, and <code>InvalidParameters</code>. See <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of accepted MessageCategory strings.
  ///
  /// The the value ANY returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message
  /// categories and returns the sum.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  ///
  /// Parameter [resourceType] :
  /// Returns the job count for the specified resource type. Use request
  /// <code>GetSupportedResourceTypes</code> to obtain strings for supported
  /// resource types.
  ///
  /// The the value ANY returns count of all resource types.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all resource types
  /// and returns the sum.
  ///
  /// The type of Amazon Web Services resource to be backed up; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  ///
  /// Parameter [state] :
  /// This parameter returns the job count for jobs with the specified state.
  ///
  /// The the value ANY returns count of all states.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all states and
  /// returns the sum.
  ///
  /// <code>Completed with issues</code> is a status found only in the Backup
  /// console. For API, this status refers to jobs with a state of
  /// <code>COMPLETED</code> and a <code>MessageCategory</code> with a value
  /// other than <code>SUCCESS</code>; that is, the status is completed but
  /// comes with a status message. To obtain the job count for <code>Completed
  /// with issues</code>, run two GET requests, and subtract the second, smaller
  /// number:
  ///
  /// GET
  /// /audit/backup-job-summaries?AggregationPeriod=FOURTEEN_DAYS&State=COMPLETED
  ///
  /// GET
  /// /audit/backup-job-summaries?AggregationPeriod=FOURTEEN_DAYS&MessageCategory=SUCCESS&State=COMPLETED
  Future<ListBackupJobSummariesOutput> listBackupJobSummaries({
    String? accountId,
    AggregationPeriod? aggregationPeriod,
    int? maxResults,
    String? messageCategory,
    String? nextToken,
    String? resourceType,
    BackupJobStatus? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'AccountId': [accountId],
      if (aggregationPeriod != null)
        'AggregationPeriod': [aggregationPeriod.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (messageCategory != null) 'MessageCategory': [messageCategory],
      if (nextToken != null) 'NextToken': [nextToken],
      if (resourceType != null) 'ResourceType': [resourceType],
      if (state != null) 'State': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/backup-job-summaries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupJobSummariesOutput.fromJson(response);
  }

  /// Lists the active backup plans for the account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [includeDeleted] :
  /// A Boolean value with a default value of <code>FALSE</code> that returns
  /// deleted backup plans when set to <code>TRUE</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupPlansOutput> listBackupPlans({
    bool? includeDeleted,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (includeDeleted != null) 'includeDeleted': [includeDeleted.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup/plans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlansOutput.fromJson(response);
  }

  /// Lists the backup plan templates.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupPlanTemplatesOutput> listBackupPlanTemplates({
    int? maxResults,
    String? nextToken,
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
      requestUri: '/backup/template/plans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlanTemplatesOutput.fromJson(response);
  }

  /// Returns version metadata of your backup plans, including Amazon Resource
  /// Names (ARNs), backup plan IDs, creation and deletion dates, plan names,
  /// and version IDs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupPlanVersionsOutput> listBackupPlanVersions({
    required String backupPlanId,
    int? maxResults,
    String? nextToken,
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
      requestUri: '/backup/plans/${Uri.encodeComponent(backupPlanId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlanVersionsOutput.fromJson(response);
  }

  /// Returns an array containing metadata of the resources associated with the
  /// target backup plan.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupSelectionsOutput> listBackupSelections({
    required String backupPlanId,
    int? maxResults,
    String? nextToken,
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
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/selections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupSelectionsOutput.fromJson(response);
  }

  /// Returns a list of recovery point storage containers along with information
  /// about them.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byShared] :
  /// This parameter will sort the list of vaults by shared vaults.
  ///
  /// Parameter [byVaultType] :
  /// This parameter will sort the list of vaults by vault type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupVaultsOutput> listBackupVaults({
    bool? byShared,
    VaultType? byVaultType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byShared != null) 'shared': [byShared.toString()],
      if (byVaultType != null) 'vaultType': [byVaultType.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-vaults',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupVaultsOutput.fromJson(response);
  }

  /// Returns metadata about your copy jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byAccountId] :
  /// The account ID to list the jobs from. Returns only copy jobs associated
  /// with the specified account ID.
  ///
  /// Parameter [byCompleteAfter] :
  /// Returns only copy jobs completed after a date expressed in Unix format and
  /// Coordinated Universal Time (UTC).
  ///
  /// Parameter [byCompleteBefore] :
  /// Returns only copy jobs completed before a date expressed in Unix format
  /// and Coordinated Universal Time (UTC).
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only copy jobs that were created after the specified date.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only copy jobs that were created before the specified date.
  ///
  /// Parameter [byDestinationVaultArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a source backup
  /// vault to copy from; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  ///
  /// Parameter [byMessageCategory] :
  /// This is an optional parameter that can be used to filter out jobs with a
  /// MessageCategory which matches the value you input.
  ///
  /// Example strings may include <code>AccessDenied</code>,
  /// <code>SUCCESS</code>, <code>AGGREGATE_ALL</code>, and
  /// <code>INVALIDPARAMETERS</code>.
  ///
  /// View <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of accepted strings.
  ///
  /// The the value ANY returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message
  /// categories and returns the sum.
  ///
  /// Parameter [byParentJobId] :
  /// This is a filter to list child (nested) jobs based on parent job ID.
  ///
  /// Parameter [byResourceArn] :
  /// Returns only copy jobs that match the specified resource Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only backup jobs for the specified resources:
  ///
  /// <ul>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>CloudFormation</code> for CloudFormation
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code> for Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>EKS</code> for Amazon Elastic Kubernetes Service
  /// </li>
  /// <li>
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases on Amazon
  /// Elastic Compute Cloud instances
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for VMware virtual machines
  /// </li>
  /// </ul>
  ///
  /// Parameter [bySourceRecoveryPointArn] :
  /// Filters copy jobs by the specified source recovery point ARN.
  ///
  /// Parameter [byState] :
  /// Returns only copy jobs that are in the specified state.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return MaxResults number of items, NextToken allows
  /// you to return more items in your list starting at the location pointed to
  /// by the next token.
  Future<ListCopyJobsOutput> listCopyJobs({
    String? byAccountId,
    DateTime? byCompleteAfter,
    DateTime? byCompleteBefore,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
    String? byDestinationVaultArn,
    String? byMessageCategory,
    String? byParentJobId,
    String? byResourceArn,
    String? byResourceType,
    String? bySourceRecoveryPointArn,
    CopyJobState? byState,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byAccountId != null) 'accountId': [byAccountId],
      if (byCompleteAfter != null)
        'completeAfter': [_s.iso8601ToJson(byCompleteAfter).toString()],
      if (byCompleteBefore != null)
        'completeBefore': [_s.iso8601ToJson(byCompleteBefore).toString()],
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
      if (byDestinationVaultArn != null)
        'destinationVaultArn': [byDestinationVaultArn],
      if (byMessageCategory != null) 'messageCategory': [byMessageCategory],
      if (byParentJobId != null) 'parentJobId': [byParentJobId],
      if (byResourceArn != null) 'resourceArn': [byResourceArn],
      if (byResourceType != null) 'resourceType': [byResourceType],
      if (bySourceRecoveryPointArn != null)
        'sourceRecoveryPointArn': [bySourceRecoveryPointArn],
      if (byState != null) 'state': [byState.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/copy-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCopyJobsOutput.fromJson(response);
  }

  /// This request obtains a list of copy jobs created or running within the the
  /// most recent 30 days. You can include parameters AccountID, State,
  /// ResourceType, MessageCategory, AggregationPeriod, MaxResults, or NextToken
  /// to filter results.
  ///
  /// This request returns a summary that contains Region, Account, State,
  /// RestourceType, MessageCategory, StartTime, EndTime, and Count of included
  /// jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// Returns the job count for the specified account.
  ///
  /// If the request is sent from a member account or an account not part of
  /// Amazon Web Services Organizations, jobs within requestor's account will be
  /// returned.
  ///
  /// Root, admin, and delegated administrator accounts can use the value ANY to
  /// return job counts from every account in the organization.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts from all accounts within
  /// the authenticated organization, then returns the sum.
  ///
  /// Parameter [aggregationPeriod] :
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> - The daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> - The aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> - The aggregated job count for prior 14 days.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// This parameter sets the maximum number of items to be returned.
  ///
  /// The value is an integer. Range of accepted values is from 1 to 500.
  ///
  /// Parameter [messageCategory] :
  /// This parameter returns the job count for the specified message category.
  ///
  /// Example accepted strings include <code>AccessDenied</code>,
  /// <code>Success</code>, and <code>InvalidParameters</code>. See <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of accepted MessageCategory strings.
  ///
  /// The the value ANY returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message
  /// categories and returns the sum.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  ///
  /// Parameter [resourceType] :
  /// Returns the job count for the specified resource type. Use request
  /// <code>GetSupportedResourceTypes</code> to obtain strings for supported
  /// resource types.
  ///
  /// The the value ANY returns count of all resource types.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all resource types
  /// and returns the sum.
  ///
  /// The type of Amazon Web Services resource to be backed up; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  ///
  /// Parameter [state] :
  /// This parameter returns the job count for jobs with the specified state.
  ///
  /// The the value ANY returns count of all states.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all states and
  /// returns the sum.
  Future<ListCopyJobSummariesOutput> listCopyJobSummaries({
    String? accountId,
    AggregationPeriod? aggregationPeriod,
    int? maxResults,
    String? messageCategory,
    String? nextToken,
    String? resourceType,
    CopyJobStatus? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'AccountId': [accountId],
      if (aggregationPeriod != null)
        'AggregationPeriod': [aggregationPeriod.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (messageCategory != null) 'MessageCategory': [messageCategory],
      if (nextToken != null) 'NextToken': [nextToken],
      if (resourceType != null) 'ResourceType': [resourceType],
      if (state != null) 'State': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/copy-job-summaries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCopyJobSummariesOutput.fromJson(response);
  }

  /// Returns a list of all frameworks for an Amazon Web Services account and
  /// Amazon Web Services Region.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The number of desired results from 1 to 1000. Optional. If unspecified,
  /// the query will return 1 MB of data.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListFrameworksOutput> listFrameworks({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/frameworks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFrameworksOutput.fromJson(response);
  }

  /// This operation returns a list of recovery points that have an associated
  /// index, belonging to the specified account.
  ///
  /// Optional parameters you can include are: MaxResults; NextToken;
  /// SourceResourceArns; CreatedBefore; CreatedAfter; and ResourceType.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [createdAfter] :
  /// Returns only indexed recovery points that were created after the specified
  /// date.
  ///
  /// Parameter [createdBefore] :
  /// Returns only indexed recovery points that were created before the
  /// specified date.
  ///
  /// Parameter [indexStatus] :
  /// Include this parameter to filter the returned list by the indicated
  /// statuses.
  ///
  /// Accepted values: <code>PENDING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code> | <code>DELETING</code>
  ///
  /// A recovery point with an index that has the status of <code>ACTIVE</code>
  /// can be included in a search.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned recovery points.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of indexed recovery points, <code>NextToken</code> allows you to return
  /// more items in your list starting at the location pointed to by the next
  /// token.
  ///
  /// Parameter [resourceType] :
  /// Returns a list of indexed recovery points for the specified resource
  /// type(s).
  ///
  /// Accepted values include:
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// </ul>
  ///
  /// Parameter [sourceResourceArn] :
  /// A string of the Amazon Resource Name (ARN) that uniquely identifies the
  /// source resource.
  Future<ListIndexedRecoveryPointsOutput> listIndexedRecoveryPoints({
    DateTime? createdAfter,
    DateTime? createdBefore,
    IndexStatus? indexStatus,
    int? maxResults,
    String? nextToken,
    String? resourceType,
    String? sourceResourceArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (indexStatus != null) 'indexStatus': [indexStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resourceType != null) 'resourceType': [resourceType],
      if (sourceResourceArn != null) 'sourceResourceArn': [sourceResourceArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/indexes/recovery-point',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListIndexedRecoveryPointsOutput.fromJson(response);
  }

  /// This action returns metadata about active and previous legal holds.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  Future<ListLegalHoldsOutput> listLegalHolds({
    int? maxResults,
    String? nextToken,
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
      requestUri: '/legal-holds',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLegalHoldsOutput.fromJson(response);
  }

  /// Returns an array of resources successfully backed up by Backup, including
  /// the time the resource was saved, an Amazon Resource Name (ARN) of the
  /// resource, and a resource type.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListProtectedResourcesOutput> listProtectedResources({
    int? maxResults,
    String? nextToken,
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
      requestUri: '/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProtectedResourcesOutput.fromJson(response);
  }

  /// This request lists the protected resources corresponding to each backup
  /// vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The list of protected resources by backup vault within the vault(s) you
  /// specify by name.
  ///
  /// Parameter [backupVaultAccountId] :
  /// The list of protected resources by backup vault within the vault(s) you
  /// specify by account ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListProtectedResourcesByBackupVaultOutput>
      listProtectedResourcesByBackupVault({
    required String backupVaultName,
    String? backupVaultAccountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (backupVaultAccountId != null)
        'backupVaultAccountId': [backupVaultAccountId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/resources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProtectedResourcesByBackupVaultOutput.fromJson(response);
  }

  /// Returns detailed information about the recovery points stored in a backup
  /// vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  /// <note>
  /// Backup vault name might not be available when a supported service creates
  /// the backup.
  /// </note>
  ///
  /// Parameter [backupVaultAccountId] :
  /// This parameter will sort the list of recovery points by account ID.
  ///
  /// Parameter [byBackupPlanId] :
  /// Returns only recovery points that match the specified backup plan ID.
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only recovery points that were created after the specified
  /// timestamp.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only recovery points that were created before the specified
  /// timestamp.
  ///
  /// Parameter [byParentRecoveryPointArn] :
  /// This returns only recovery points that match the specified parent
  /// (composite) recovery point Amazon Resource Name (ARN).
  ///
  /// Parameter [byResourceArn] :
  /// Returns only recovery points that match the specified resource Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only recovery points that match the specified resource type(s):
  ///
  /// <ul>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>CloudFormation</code> for CloudFormation
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code> for Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>EKS</code> for Amazon Elastic Kubernetes Service
  /// </li>
  /// <li>
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases on Amazon
  /// Elastic Compute Cloud instances
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for VMware virtual machines
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRecoveryPointsByBackupVaultOutput>
      listRecoveryPointsByBackupVault({
    required String backupVaultName,
    String? backupVaultAccountId,
    String? byBackupPlanId,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
    String? byParentRecoveryPointArn,
    String? byResourceArn,
    String? byResourceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (backupVaultAccountId != null)
        'backupVaultAccountId': [backupVaultAccountId],
      if (byBackupPlanId != null) 'backupPlanId': [byBackupPlanId],
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
      if (byParentRecoveryPointArn != null)
        'parentRecoveryPointArn': [byParentRecoveryPointArn],
      if (byResourceArn != null) 'resourceArn': [byResourceArn],
      if (byResourceType != null) 'resourceType': [byResourceType],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryPointsByBackupVaultOutput.fromJson(response);
  }

  /// This action returns recovery point ARNs (Amazon Resource Names) of the
  /// specified legal hold.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [legalHoldId] :
  /// The ID of the legal hold.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  Future<ListRecoveryPointsByLegalHoldOutput> listRecoveryPointsByLegalHold({
    required String legalHoldId,
    int? maxResults,
    String? nextToken,
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
      requestUri:
          '/legal-holds/${Uri.encodeComponent(legalHoldId)}/recovery-points',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryPointsByLegalHoldOutput.fromJson(response);
  }

  /// The information about the recovery points of the type specified by a
  /// resource Amazon Resource Name (ARN).
  /// <note>
  /// For Amazon EFS and Amazon EC2, this action only lists recovery points
  /// created by Backup.
  /// </note>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the resource type.
  ///
  /// Parameter [managedByAWSBackupOnly] :
  /// This attribute filters recovery points based on ownership.
  ///
  /// If this is set to <code>TRUE</code>, the response will contain recovery
  /// points associated with the selected resources that are managed by Backup.
  ///
  /// If this is set to <code>FALSE</code>, the response will contain all
  /// recovery points associated with the selected resource.
  ///
  /// Type: Boolean
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  /// <note>
  /// Amazon RDS requires a value of at least 20.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRecoveryPointsByResourceOutput> listRecoveryPointsByResource({
    required String resourceArn,
    bool? managedByAWSBackupOnly,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (managedByAWSBackupOnly != null)
        'managedByAWSBackupOnly': [managedByAWSBackupOnly.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/resources/${Uri.encodeComponent(resourceArn)}/recovery-points',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryPointsByResourceOutput.fromJson(response);
  }

  /// Returns details about your report jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byCreationAfter] :
  /// Returns only report jobs that were created after the date and time
  /// specified in Unix format and Coordinated Universal Time (UTC). For
  /// example, the value 1516925490 represents Friday, January 26, 2018 12:11:30
  /// AM.
  ///
  /// Parameter [byCreationBefore] :
  /// Returns only report jobs that were created before the date and time
  /// specified in Unix format and Coordinated Universal Time (UTC). For
  /// example, the value 1516925490 represents Friday, January 26, 2018 12:11:30
  /// AM.
  ///
  /// Parameter [byReportPlanName] :
  /// Returns only report jobs with the specified report plan name.
  ///
  /// Parameter [byStatus] :
  /// Returns only report jobs that are in the specified status. The statuses
  /// are:
  ///
  /// <code>CREATED | RUNNING | COMPLETED | FAILED |
  /// COMPLETED_WITH_ISSUES</code>
  ///
  /// Please note that only scanning jobs finish with state completed with
  /// issues. For backup jobs this is a console interpretation of a job that
  /// finishes in completed state and has a status message.
  ///
  /// Parameter [maxResults] :
  /// The number of desired results from 1 to 1000. Optional. If unspecified,
  /// the query will return 1 MB of data.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListReportJobsOutput> listReportJobs({
    DateTime? byCreationAfter,
    DateTime? byCreationBefore,
    String? byReportPlanName,
    String? byStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byCreationAfter != null)
        'CreationAfter': [_s.iso8601ToJson(byCreationAfter).toString()],
      if (byCreationBefore != null)
        'CreationBefore': [_s.iso8601ToJson(byCreationBefore).toString()],
      if (byReportPlanName != null) 'ReportPlanName': [byReportPlanName],
      if (byStatus != null) 'Status': [byStatus],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/report-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReportJobsOutput.fromJson(response);
  }

  /// Returns a list of your report plans. For detailed information about a
  /// single report plan, use <code>DescribeReportPlan</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The number of desired results from 1 to 1000. Optional. If unspecified,
  /// the query will return 1 MB of data.
  ///
  /// Parameter [nextToken] :
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  Future<ListReportPlansOutput> listReportPlans({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/report-plans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReportPlansOutput.fromJson(response);
  }

  /// Returns a list of restore access backup vaults associated with a specified
  /// backup vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of the backup vault for which to list associated restore access
  /// backup vaults.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request to retrieve the next set of
  /// results.
  Future<ListRestoreAccessBackupVaultsOutput> listRestoreAccessBackupVaults({
    required String backupVaultName,
    int? maxResults,
    String? nextToken,
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
      requestUri:
          '/logically-air-gapped-backup-vaults/${Uri.encodeComponent(backupVaultName)}/restore-access-backup-vaults',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreAccessBackupVaultsOutput.fromJson(response);
  }

  /// Returns a list of jobs that Backup initiated to restore a saved resource,
  /// including details about the recovery process.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byAccountId] :
  /// The account ID to list the jobs from. Returns only restore jobs associated
  /// with the specified account ID.
  ///
  /// Parameter [byCompleteAfter] :
  /// Returns only copy jobs completed after a date expressed in Unix format and
  /// Coordinated Universal Time (UTC).
  ///
  /// Parameter [byCompleteBefore] :
  /// Returns only copy jobs completed before a date expressed in Unix format
  /// and Coordinated Universal Time (UTC).
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only restore jobs that were created after the specified date.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only restore jobs that were created before the specified date.
  ///
  /// Parameter [byParentJobId] :
  /// This is a filter to list child (nested) restore jobs based on parent
  /// restore job ID.
  ///
  /// Parameter [byResourceType] :
  /// Include this parameter to return only restore jobs for the specified
  /// resources:
  ///
  /// <ul>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>CloudFormation</code> for CloudFormation
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code> for Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>EKS</code> for Amazon Elastic Kubernetes Service
  /// </li>
  /// <li>
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases on Amazon
  /// Elastic Compute Cloud instances
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for VMware virtual machines
  /// </li>
  /// </ul>
  ///
  /// Parameter [byRestoreTestingPlanArn] :
  /// This returns only restore testing jobs that match the specified resource
  /// Amazon Resource Name (ARN).
  ///
  /// Parameter [byStatus] :
  /// Returns only restore jobs associated with the specified job status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRestoreJobsOutput> listRestoreJobs({
    String? byAccountId,
    DateTime? byCompleteAfter,
    DateTime? byCompleteBefore,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
    String? byParentJobId,
    String? byResourceType,
    String? byRestoreTestingPlanArn,
    RestoreJobStatus? byStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byAccountId != null) 'accountId': [byAccountId],
      if (byCompleteAfter != null)
        'completeAfter': [_s.iso8601ToJson(byCompleteAfter).toString()],
      if (byCompleteBefore != null)
        'completeBefore': [_s.iso8601ToJson(byCompleteBefore).toString()],
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
      if (byParentJobId != null) 'parentJobId': [byParentJobId],
      if (byResourceType != null) 'resourceType': [byResourceType],
      if (byRestoreTestingPlanArn != null)
        'restoreTestingPlanArn': [byRestoreTestingPlanArn],
      if (byStatus != null) 'status': [byStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreJobsOutput.fromJson(response);
  }

  /// This returns restore jobs that contain the specified protected resource.
  ///
  /// You must include <code>ResourceArn</code>. You can optionally include
  /// <code>NextToken</code>, <code>ByStatus</code>, <code>MaxResults</code>,
  /// <code>ByRecoveryPointCreationDateAfter</code> , and
  /// <code>ByRecoveryPointCreationDateBefore</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// Returns only restore jobs that match the specified resource Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [byRecoveryPointCreationDateAfter] :
  /// Returns only restore jobs of recovery points that were created after the
  /// specified date.
  ///
  /// Parameter [byRecoveryPointCreationDateBefore] :
  /// Returns only restore jobs of recovery points that were created before the
  /// specified date.
  ///
  /// Parameter [byStatus] :
  /// Returns only restore jobs associated with the specified job status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request ismade to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRestoreJobsByProtectedResourceOutput>
      listRestoreJobsByProtectedResource({
    required String resourceArn,
    DateTime? byRecoveryPointCreationDateAfter,
    DateTime? byRecoveryPointCreationDateBefore,
    RestoreJobStatus? byStatus,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byRecoveryPointCreationDateAfter != null)
        'recoveryPointCreationDateAfter': [
          _s.iso8601ToJson(byRecoveryPointCreationDateAfter).toString()
        ],
      if (byRecoveryPointCreationDateBefore != null)
        'recoveryPointCreationDateBefore': [
          _s.iso8601ToJson(byRecoveryPointCreationDateBefore).toString()
        ],
      if (byStatus != null) 'status': [byStatus.value],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resources/${Uri.encodeComponent(resourceArn)}/restore-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreJobsByProtectedResourceOutput.fromJson(response);
  }

  /// This request obtains a summary of restore jobs created or running within
  /// the the most recent 30 days. You can include parameters AccountID, State,
  /// ResourceType, AggregationPeriod, MaxResults, or NextToken to filter
  /// results.
  ///
  /// This request returns a summary that contains Region, Account, State,
  /// RestourceType, MessageCategory, StartTime, EndTime, and Count of included
  /// jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// Returns the job count for the specified account.
  ///
  /// If the request is sent from a member account or an account not part of
  /// Amazon Web Services Organizations, jobs within requestor's account will be
  /// returned.
  ///
  /// Root, admin, and delegated administrator accounts can use the value ANY to
  /// return job counts from every account in the organization.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts from all accounts within
  /// the authenticated organization, then returns the sum.
  ///
  /// Parameter [aggregationPeriod] :
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> - The daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> - The aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> - The aggregated job count for prior 14 days.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// This parameter sets the maximum number of items to be returned.
  ///
  /// The value is an integer. Range of accepted values is from 1 to 500.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of
  /// resources, <code>NextToken</code> allows you to return more items in your
  /// list starting at the location pointed to by the next token.
  ///
  /// Parameter [resourceType] :
  /// Returns the job count for the specified resource type. Use request
  /// <code>GetSupportedResourceTypes</code> to obtain strings for supported
  /// resource types.
  ///
  /// The the value ANY returns count of all resource types.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all resource types
  /// and returns the sum.
  ///
  /// The type of Amazon Web Services resource to be backed up; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  ///
  /// Parameter [state] :
  /// This parameter returns the job count for jobs with the specified state.
  ///
  /// The the value ANY returns count of all states.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all states and
  /// returns the sum.
  Future<ListRestoreJobSummariesOutput> listRestoreJobSummaries({
    String? accountId,
    AggregationPeriod? aggregationPeriod,
    int? maxResults,
    String? nextToken,
    String? resourceType,
    RestoreJobState? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'AccountId': [accountId],
      if (aggregationPeriod != null)
        'AggregationPeriod': [aggregationPeriod.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (resourceType != null) 'ResourceType': [resourceType],
      if (state != null) 'State': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/restore-job-summaries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreJobSummariesOutput.fromJson(response);
  }

  /// Returns a list of restore testing plans.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the nexttoken.
  Future<ListRestoreTestingPlansOutput> listRestoreTestingPlans({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-testing/plans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreTestingPlansOutput.fromJson(response);
  }

  /// Returns a list of restore testing selections. Can be filtered by
  /// <code>MaxResults</code> and <code>RestoreTestingPlanName</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlanName] :
  /// Returns restore testing selections by the specified restore testing plan
  /// name.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the nexttoken.
  Future<ListRestoreTestingSelectionsOutput> listRestoreTestingSelections({
    required String restoreTestingPlanName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}/selections',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreTestingSelectionsOutput.fromJson(response);
  }

  /// Returns a list of existing scan jobs for an authenticated account for the
  /// last 30 days.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [byAccountId] :
  /// The account ID to list the jobs from. Returns only backup jobs associated
  /// with the specified account ID.
  ///
  /// If used from an Amazon Web Services Organizations management account,
  /// passing <code>*</code> returns all jobs across the organization.
  ///
  /// Pattern: <code>^[0-9]{12}$</code>
  ///
  /// Parameter [byBackupVaultName] :
  /// Returns only scan jobs that will be stored in the specified backup vault.
  /// Backup vaults are identified by names that are unique to the account used
  /// to create them and the Amazon Web Services Region where they are created.
  ///
  /// Pattern: <code>^[a-zA-Z0-9\-\_\.]{2,50}$</code>
  ///
  /// Parameter [byCompleteAfter] :
  /// Returns only scan jobs completed after a date expressed in Unix format and
  /// Coordinated Universal Time (UTC).
  ///
  /// Parameter [byCompleteBefore] :
  /// Returns only backup jobs completed before a date expressed in Unix format
  /// and Coordinated Universal Time (UTC).
  ///
  /// Parameter [byMalwareScanner] :
  /// Returns only the scan jobs for the specified malware scanner. Currently
  /// only supports <code>GUARDDUTY</code>.
  ///
  /// Parameter [byRecoveryPointArn] :
  /// Returns only the scan jobs that are ran against the specified recovery
  /// point.
  ///
  /// Parameter [byResourceArn] :
  /// Returns only scan jobs that match the specified resource Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns restore testing selections by the specified restore testing plan
  /// name.
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code>for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code>for Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>S3</code>for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// </ul>
  /// Pattern: <code>^[a-zA-Z0-9\-\_\.]{1,50}$</code>
  ///
  /// Parameter [byScanResultStatus] :
  /// Returns only the scan jobs for the specified scan results:
  ///
  /// <ul>
  /// <li>
  /// <code>THREATS_FOUND</code>
  /// </li>
  /// <li>
  /// <code>NO_THREATS_FOUND</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [byState] :
  /// Returns only the scan jobs for the specified scanning job state.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Valid Range: Minimum value of 1. Maximum value of 1000.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListScanJobsOutput> listScanJobs({
    String? byAccountId,
    String? byBackupVaultName,
    DateTime? byCompleteAfter,
    DateTime? byCompleteBefore,
    MalwareScanner? byMalwareScanner,
    String? byRecoveryPointArn,
    String? byResourceArn,
    ScanResourceType? byResourceType,
    ScanResultStatus? byScanResultStatus,
    ScanState? byState,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byAccountId != null) 'ByAccountId': [byAccountId],
      if (byBackupVaultName != null) 'ByBackupVaultName': [byBackupVaultName],
      if (byCompleteAfter != null)
        'ByCompleteAfter': [_s.iso8601ToJson(byCompleteAfter).toString()],
      if (byCompleteBefore != null)
        'ByCompleteBefore': [_s.iso8601ToJson(byCompleteBefore).toString()],
      if (byMalwareScanner != null)
        'ByMalwareScanner': [byMalwareScanner.value],
      if (byRecoveryPointArn != null)
        'ByRecoveryPointArn': [byRecoveryPointArn],
      if (byResourceArn != null) 'ByResourceArn': [byResourceArn],
      if (byResourceType != null) 'ByResourceType': [byResourceType.value],
      if (byScanResultStatus != null)
        'ByScanResultStatus': [byScanResultStatus.value],
      if (byState != null) 'ByState': [byState.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/scan/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScanJobsOutput.fromJson(response);
  }

  /// This is a request for a summary of scan jobs created or running within the
  /// most recent 30 days.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// Returns the job count for the specified account.
  ///
  /// If the request is sent from a member account or an account not part of
  /// Amazon Web Services Organizations, jobs within requestor's account will be
  /// returned.
  ///
  /// Root, admin, and delegated administrator accounts can use the value
  /// <code>ANY</code> to return job counts from every account in the
  /// organization.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts from all accounts within
  /// the authenticated organization, then returns the sum.
  ///
  /// Parameter [aggregationPeriod] :
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code>The daily job count for the prior 1 day.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code>The daily job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code>The daily job count for the prior 14 days.
  /// </li>
  /// </ul>
  ///
  /// Parameter [malwareScanner] :
  /// Returns only the scan jobs for the specified malware scanner. Currently
  /// the only MalwareScanner is <code>GUARDDUTY</code>. But the field also
  /// supports <code>ANY</code>, and <code>AGGREGATE_ALL</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// The value is an integer. Range of accepted values is from 1 to 500.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  ///
  /// Parameter [resourceType] :
  /// Returns the job count for the specified resource type. Use request
  /// <code>GetSupportedResourceTypes</code> to obtain strings for supported
  /// resource types.
  ///
  /// The the value <code>ANY</code> returns count of all resource types.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all resource types
  /// and returns the sum.
  ///
  /// Parameter [scanResultStatus] :
  /// Returns only the scan jobs for the specified scan results.
  ///
  /// Parameter [state] :
  /// Returns only the scan jobs for the specified scanning job state.
  Future<ListScanJobSummariesOutput> listScanJobSummaries({
    String? accountId,
    AggregationPeriod? aggregationPeriod,
    MalwareScanner? malwareScanner,
    int? maxResults,
    String? nextToken,
    String? resourceType,
    ScanResultStatus? scanResultStatus,
    ScanJobStatus? state,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (accountId != null) 'AccountId': [accountId],
      if (aggregationPeriod != null)
        'AggregationPeriod': [aggregationPeriod.value],
      if (malwareScanner != null) 'MalwareScanner': [malwareScanner.value],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (resourceType != null) 'ResourceType': [resourceType],
      if (scanResultStatus != null)
        'ScanResultStatus': [scanResultStatus.value],
      if (state != null) 'State': [state.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/audit/scan-job-summaries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListScanJobSummariesOutput.fromJson(response);
  }

  /// Returns the tags assigned to the resource, such as a target recovery
  /// point, backup plan, or backup vault.
  ///
  /// This operation returns results depending on the resource type used in the
  /// value for <code>resourceArn</code>. For example, recovery points of Amazon
  /// DynamoDB with Advanced Settings have an ARN (Amazon Resource Name) that
  /// begins with <code>arn:aws:backup</code>. Recovery points (backups) of
  /// DynamoDB without Advanced Settings enabled have an ARN that begins with
  /// <code>arn:aws:dynamodb</code>.
  ///
  /// When this operation is called and when you include values of
  /// <code>resourceArn</code> that have an ARN other than
  /// <code>arn:aws:backup</code>, it may return one of the exceptions listed
  /// below. To prevent this exception, include only values representing
  /// resource types that are fully managed by Backup. These have an ARN that
  /// begins <code>arn:aws:backup</code> and they are noted in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the type of resource. Valid targets for
  /// <code>ListTags</code> are recovery points, backup plans, and backup
  /// vaults.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListTagsOutput> listTags({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsOutput.fromJson(response);
  }

  /// Returns a list of tiering configurations.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListTieringConfigurationsOutput> listTieringConfigurations({
    int? maxResults,
    String? nextToken,
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
      requestUri: '/tiering-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTieringConfigurationsOutput.fromJson(response);
  }

  /// Sets a resource-based policy that is used to manage access permissions on
  /// the target backup vault. Requires a backup vault name and an access policy
  /// document in JSON format.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [policy] :
  /// The backup vault access policy document in JSON format.
  Future<void> putBackupVaultAccessPolicy({
    required String backupVaultName,
    String? policy,
  }) async {
    final $payload = <String, dynamic>{
      if (policy != null) 'Policy': policy,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Applies Backup Vault Lock to a backup vault, preventing attempts to delete
  /// any recovery point stored in or created in a backup vault. Vault Lock also
  /// prevents attempts to update the lifecycle policy that controls the
  /// retention period of any recovery point currently stored in a backup vault.
  /// If specified, Vault Lock enforces a minimum and maximum retention period
  /// for future backup and copy jobs that target a backup vault.
  /// <note>
  /// Backup Vault Lock has been assessed by Cohasset Associates for use in
  /// environments that are subject to SEC 17a-4, CFTC, and FINRA regulations.
  /// For more information about how Backup Vault Lock relates to these
  /// regulations, see the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/samples/cohassetreport.zip">Cohasset
  /// Associates Compliance Assessment.</a>
  /// </note>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/vault-lock.html">Backup
  /// Vault Lock</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The Backup Vault Lock configuration that specifies the name of the backup
  /// vault it protects.
  ///
  /// Parameter [changeableForDays] :
  /// The Backup Vault Lock configuration that specifies the number of days
  /// before the lock date. For example, setting <code>ChangeableForDays</code>
  /// to 30 on Jan. 1, 2022 at 8pm UTC will set the lock date to Jan. 31, 2022
  /// at 8pm UTC.
  ///
  /// Backup enforces a 72-hour cooling-off period before Vault Lock takes
  /// effect and becomes immutable. Therefore, you must set
  /// <code>ChangeableForDays</code> to 3 or greater.
  ///
  /// The maximum value you can specify is 36,500 days (approximately 100
  /// years).
  ///
  /// Before the lock date, you can delete Vault Lock from the vault using
  /// <code>DeleteBackupVaultLockConfiguration</code> or change the Vault Lock
  /// configuration using <code>PutBackupVaultLockConfiguration</code>. On and
  /// after the lock date, the Vault Lock becomes immutable and cannot be
  /// changed or deleted.
  ///
  /// If this parameter is not specified, you can delete Vault Lock from the
  /// vault using <code>DeleteBackupVaultLockConfiguration</code> or change the
  /// Vault Lock configuration using
  /// <code>PutBackupVaultLockConfiguration</code> at any time.
  ///
  /// Parameter [maxRetentionDays] :
  /// The Backup Vault Lock configuration that specifies the maximum retention
  /// period that the vault retains its recovery points. This setting can be
  /// useful if, for example, your organization's policies require you to
  /// destroy certain data after retaining it for four years (1460 days).
  ///
  /// If this parameter is not included, Vault Lock does not enforce a maximum
  /// retention period on the recovery points in the vault. If this parameter is
  /// included without a value, Vault Lock will not enforce a maximum retention
  /// period.
  ///
  /// If this parameter is specified, any backup or copy job to the vault must
  /// have a lifecycle policy with a retention period equal to or shorter than
  /// the maximum retention period. If the job's retention period is longer than
  /// that maximum retention period, then the vault fails the backup or copy
  /// job, and you should either modify your lifecycle settings or use a
  /// different vault. The longest maximum retention period you can specify is
  /// 36500 days (approximately 100 years). Recovery points already saved in the
  /// vault prior to Vault Lock are not affected.
  ///
  /// Parameter [minRetentionDays] :
  /// The Backup Vault Lock configuration that specifies the minimum retention
  /// period that the vault retains its recovery points. This setting can be
  /// useful if, for example, your organization's policies require you to retain
  /// certain data for at least seven years (2555 days).
  ///
  /// This parameter is required when a vault lock is created through
  /// CloudFormation; otherwise, this parameter is optional. If this parameter
  /// is not specified, Vault Lock will not enforce a minimum retention period.
  ///
  /// If this parameter is specified, any backup or copy job to the vault must
  /// have a lifecycle policy with a retention period equal to or longer than
  /// the minimum retention period. If the job's retention period is shorter
  /// than that minimum retention period, then the vault fails that backup or
  /// copy job, and you should either modify your lifecycle settings or use a
  /// different vault. The shortest minimum retention period you can specify is
  /// 1 day. Recovery points already saved in the vault prior to Vault Lock are
  /// not affected.
  Future<void> putBackupVaultLockConfiguration({
    required String backupVaultName,
    int? changeableForDays,
    int? maxRetentionDays,
    int? minRetentionDays,
  }) async {
    final $payload = <String, dynamic>{
      if (changeableForDays != null) 'ChangeableForDays': changeableForDays,
      if (maxRetentionDays != null) 'MaxRetentionDays': maxRetentionDays,
      if (minRetentionDays != null) 'MinRetentionDays': minRetentionDays,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/vault-lock',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Turns on notifications on a backup vault for the specified topic and
  /// events.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultEvents] :
  /// An array of events that indicate the status of jobs to back up resources
  /// to the backup vault. For the list of supported events, common use cases,
  /// and code samples, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-notifications.html">Notification
  /// options with Backup</a>.
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [sNSTopicArn] :
  /// The Amazon Resource Name (ARN) that specifies the topic for a backup
  /// vault’s events; for example,
  /// <code>arn:aws:sns:us-west-2:111122223333:MyVaultTopic</code>.
  Future<void> putBackupVaultNotifications({
    required List<BackupVaultEvent> backupVaultEvents,
    required String backupVaultName,
    required String sNSTopicArn,
  }) async {
    final $payload = <String, dynamic>{
      'BackupVaultEvents': backupVaultEvents.map((e) => e.value).toList(),
      'SNSTopicArn': sNSTopicArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This request allows you to send your independent self-run restore test
  /// validation results. <code>RestoreJobId</code> and
  /// <code>ValidationStatus</code> are required. Optionally, you can input a
  /// <code>ValidationStatusMessage</code>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreJobId] :
  /// This is a unique identifier of a restore job within Backup.
  ///
  /// Parameter [validationStatus] :
  /// The status of your restore validation.
  ///
  /// Parameter [validationStatusMessage] :
  /// This is an optional message string you can input to describe the
  /// validation status for the restore test validation.
  Future<void> putRestoreValidationResult({
    required String restoreJobId,
    required RestoreValidationStatus validationStatus,
    String? validationStatusMessage,
  }) async {
    final $payload = <String, dynamic>{
      'ValidationStatus': validationStatus.value,
      if (validationStatusMessage != null)
        'ValidationStatusMessage': validationStatusMessage,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restore-jobs/${Uri.encodeComponent(restoreJobId)}/validations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Revokes access to a restore access backup vault, removing the ability to
  /// restore from its recovery points and permanently deleting the vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of the source backup vault associated with the restore access
  /// backup vault to be revoked.
  ///
  /// Parameter [restoreAccessBackupVaultArn] :
  /// The ARN of the restore access backup vault to revoke.
  ///
  /// Parameter [requesterComment] :
  /// A comment explaining the reason for revoking access to the restore access
  /// backup vault.
  Future<void> revokeRestoreAccessBackupVault({
    required String backupVaultName,
    required String restoreAccessBackupVaultArn,
    String? requesterComment,
  }) async {
    final $query = <String, List<String>>{
      if (requesterComment != null) 'requesterComment': [requesterComment],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/logically-air-gapped-backup-vaults/${Uri.encodeComponent(backupVaultName)}/restore-access-backup-vaults/${Uri.encodeComponent(restoreAccessBackupVaultArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts an on-demand backup job for the specified resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [iamRoleArn] :
  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  ///
  /// Parameter [resourceArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  ///
  /// Parameter [backupOptions] :
  /// The backup option for a selected resource. This option is only available
  /// for Windows Volume Shadow Copy Service (VSS) backup jobs.
  ///
  /// Valid values: Set to <code>"WindowsVSS":"enabled"</code> to enable the
  /// <code>WindowsVSS</code> backup option and create a Windows VSS backup. Set
  /// to <code>"WindowsVSS""disabled"</code> to create a regular backup. The
  /// <code>WindowsVSS</code> option is not enabled by default.
  ///
  /// Parameter [completeWindowMinutes] :
  /// A value in minutes during which a successfully started backup must
  /// complete, or else Backup will cancel the job. This value is optional. This
  /// value begins counting down from when the backup was scheduled. It does not
  /// add additional time for <code>StartWindowMinutes</code>, or if the backup
  /// started later than scheduled.
  ///
  /// Like <code>StartWindowMinutes</code>, this parameter has a maximum value
  /// of 100 years (52,560,000 minutes).
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>StartBackupJob</code>. Retrying a successful
  /// request with the same idempotency token results in a success message with
  /// no action taken.
  ///
  /// Parameter [index] :
  /// Include this parameter to enable index creation if your backup job has a
  /// resource type that supports backup indexes.
  ///
  /// Resource types that support backup indexes include:
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// </ul>
  /// Index can have 1 of 2 possible values, either <code>ENABLED</code> or
  /// <code>DISABLED</code>.
  ///
  /// To create a backup index for an eligible <code>ACTIVE</code> recovery
  /// point that does not yet have a backup index, set value to
  /// <code>ENABLED</code>.
  ///
  /// To delete a backup index, set value to <code>DISABLED</code>.
  ///
  /// Parameter [lifecycle] :
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition
  /// to cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  ///
  /// Resource types that can transition to cold storage are listed in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table. Backup ignores this expression for
  /// other resource types.
  ///
  /// This parameter has a maximum value of 100 years (36,500 days).
  ///
  /// Parameter [logicallyAirGappedBackupVaultArn] :
  /// The ARN of a logically air-gapped vault. ARN must be in the same account
  /// and Region. If provided, supported fully managed resources back up
  /// directly to logically air-gapped vault, while other supported resources
  /// create a temporary (billable) snapshot in backup vault, then copy it to
  /// logically air-gapped vault. Unsupported resources only back up to the
  /// specified backup vault.
  ///
  /// Parameter [recoveryPointTags] :
  /// The tags to assign to the resources.
  ///
  /// Parameter [startWindowMinutes] :
  /// A value in minutes after a backup is scheduled before a job will be
  /// canceled if it doesn't start successfully. This value is optional, and the
  /// default is 8 hours. If this value is included, it must be at least 60
  /// minutes to avoid errors.
  ///
  /// This parameter has a maximum value of 100 years (52,560,000 minutes).
  ///
  /// During the start window, the backup job status remains in
  /// <code>CREATED</code> status until it has successfully begun or until the
  /// start window time has run out. If within the start window time Backup
  /// receives an error that allows the job to be retried, Backup will
  /// automatically retry to begin the job at least every 10 minutes until the
  /// backup successfully begins (the job status changes to
  /// <code>RUNNING</code>) or until the job status changes to
  /// <code>EXPIRED</code> (which is expected to occur when the start window
  /// time is over).
  Future<StartBackupJobOutput> startBackupJob({
    required String backupVaultName,
    required String iamRoleArn,
    required String resourceArn,
    Map<String, String>? backupOptions,
    int? completeWindowMinutes,
    String? idempotencyToken,
    Index? index,
    Lifecycle? lifecycle,
    String? logicallyAirGappedBackupVaultArn,
    Map<String, String>? recoveryPointTags,
    int? startWindowMinutes,
  }) async {
    final $payload = <String, dynamic>{
      'BackupVaultName': backupVaultName,
      'IamRoleArn': iamRoleArn,
      'ResourceArn': resourceArn,
      if (backupOptions != null) 'BackupOptions': backupOptions,
      if (completeWindowMinutes != null)
        'CompleteWindowMinutes': completeWindowMinutes,
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      if (index != null) 'Index': index.value,
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (logicallyAirGappedBackupVaultArn != null)
        'LogicallyAirGappedBackupVaultArn': logicallyAirGappedBackupVaultArn,
      if (recoveryPointTags != null) 'RecoveryPointTags': recoveryPointTags,
      if (startWindowMinutes != null) 'StartWindowMinutes': startWindowMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/backup-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartBackupJobOutput.fromJson(response);
  }

  /// Starts a job to create a one-time copy of the specified resource.
  ///
  /// Does not support continuous backups.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/recov-point-create-a-copy.html#backup-copy-retry">Copy
  /// job retry</a> for information on how Backup retries copy job operations.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [destinationBackupVaultArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a destination
  /// backup vault to copy to; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  ///
  /// Parameter [iamRoleArn] :
  /// Specifies the IAM role ARN used to copy the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  ///
  /// Parameter [recoveryPointArn] :
  /// An ARN that uniquely identifies a recovery point to use for the copy job;
  /// for example,
  /// arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45.
  ///
  /// Parameter [sourceBackupVaultName] :
  /// The name of a logical source container where backups are stored. Backup
  /// vaults are identified by names that are unique to the account used to
  /// create them and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>StartCopyJob</code>. Retrying a successful
  /// request with the same idempotency token results in a success message with
  /// no action taken.
  Future<StartCopyJobOutput> startCopyJob({
    required String destinationBackupVaultArn,
    required String iamRoleArn,
    required String recoveryPointArn,
    required String sourceBackupVaultName,
    String? idempotencyToken,
    Lifecycle? lifecycle,
  }) async {
    final $payload = <String, dynamic>{
      'DestinationBackupVaultArn': destinationBackupVaultArn,
      'IamRoleArn': iamRoleArn,
      'RecoveryPointArn': recoveryPointArn,
      'SourceBackupVaultName': sourceBackupVaultName,
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      if (lifecycle != null) 'Lifecycle': lifecycle,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/copy-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartCopyJobOutput.fromJson(response);
  }

  /// Starts an on-demand report job for the specified report plan.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [reportPlanName] :
  /// The unique name of a report plan.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>StartReportJobInput</code>. Retrying a successful
  /// request with the same idempotency token results in a success message with
  /// no action taken.
  Future<StartReportJobOutput> startReportJob({
    required String reportPlanName,
    String? idempotencyToken,
  }) async {
    final $payload = <String, dynamic>{
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/audit/report-jobs/${Uri.encodeComponent(reportPlanName)}',
      exceptionFnMap: _exceptionFns,
    );
    return StartReportJobOutput.fromJson(response);
  }

  /// Recovers the saved resource identified by an Amazon Resource Name (ARN).
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [metadata] :
  /// A set of metadata key-value pairs.
  ///
  /// You can get configuration metadata about a resource at the time it was
  /// backed up by calling <code>GetRecoveryPointRestoreMetadata</code>.
  /// However, values in addition to those provided by
  /// <code>GetRecoveryPointRestoreMetadata</code> might be required to restore
  /// a resource. For example, you might need to provide a new resource name if
  /// the original already exists.
  ///
  /// For more information about the metadata for each resource, see the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-aur.html#aur-restore-cli">Metadata
  /// for Amazon Aurora</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-docdb.html#docdb-restore-cli">Metadata
  /// for Amazon DocumentDB</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restore-application-stacks.html#restoring-cfn-cli">Metadata
  /// for CloudFormation</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-dynamodb.html#ddb-restore-cli">Metadata
  /// for Amazon DynamoDB</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-ebs.html#ebs-restore-cli">
  /// Metadata for Amazon EBS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-ec2.html#restoring-ec2-cli">Metadata
  /// for Amazon EC2</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-efs.html#efs-restore-cli">Metadata
  /// for Amazon EFS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-eks.html#eks-restore-backup-section">Metadata
  /// for Amazon EKS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-fsx.html#fsx-restore-cli">Metadata
  /// for Amazon FSx</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-nep.html#nep-restore-cli">Metadata
  /// for Amazon Neptune</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-rds.html#rds-restore-cli">Metadata
  /// for Amazon RDS</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/redshift-restores.html#redshift-restore-api">Metadata
  /// for Amazon Redshift</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-storage-gateway.html#restoring-sgw-cli">Metadata
  /// for Storage Gateway</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-s3.html#s3-restore-cli">Metadata
  /// for Amazon S3</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/timestream-restore.html#timestream-restore-api">Metadata
  /// for Amazon Timestream</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restoring-vm.html#vm-restore-cli">Metadata
  /// for virtual machines</a>
  /// </li>
  /// </ul>
  ///
  /// Parameter [recoveryPointArn] :
  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [copySourceTagsToRestoredResource] :
  /// This is an optional parameter. If this equals <code>True</code>, tags
  /// included in the backup will be copied to the restored resource.
  ///
  /// This can only be applied to backups created through Backup.
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that Backup uses to create
  /// the target resource; for example:
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>StartRestoreJob</code>. Retrying a successful
  /// request with the same idempotency token results in a success message with
  /// no action taken.
  ///
  /// Parameter [resourceType] :
  /// Starts a job to restore a recovery point for one of the following
  /// resources:
  ///
  /// <ul>
  /// <li>
  /// <code>Aurora</code> - Amazon Aurora
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> - Amazon DocumentDB
  /// </li>
  /// <li>
  /// <code>CloudFormation</code> - CloudFormation
  /// </li>
  /// <li>
  /// <code>DynamoDB</code> - Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> - Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code> - Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>EFS</code> - Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>EKS</code> - Amazon Elastic Kubernetes Service
  /// </li>
  /// <li>
  /// <code>FSx</code> - Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> - Amazon Neptune
  /// </li>
  /// <li>
  /// <code>RDS</code> - Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Redshift</code> - Amazon Redshift
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> - Storage Gateway
  /// </li>
  /// <li>
  /// <code>S3</code> - Amazon Simple Storage Service
  /// </li>
  /// <li>
  /// <code>Timestream</code> - Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> - Virtual machines
  /// </li>
  /// </ul>
  Future<StartRestoreJobOutput> startRestoreJob({
    required Map<String, String> metadata,
    required String recoveryPointArn,
    bool? copySourceTagsToRestoredResource,
    String? iamRoleArn,
    String? idempotencyToken,
    String? resourceType,
  }) async {
    final $payload = <String, dynamic>{
      'Metadata': metadata,
      'RecoveryPointArn': recoveryPointArn,
      if (copySourceTagsToRestoredResource != null)
        'CopySourceTagsToRestoredResource': copySourceTagsToRestoredResource,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      if (resourceType != null) 'ResourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/restore-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return StartRestoreJobOutput.fromJson(response);
  }

  /// Starts scanning jobs for specific resources.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Pattern: <code>^[a-zA-Z0-9\-\_]{2,50}$</code>
  ///
  /// Parameter [iamRoleArn] :
  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  ///
  /// Parameter [malwareScanner] :
  /// Specifies the malware scanner used during the scan job. Currently only
  /// supports <code>GUARDDUTY</code>.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point.
  /// This is your target recovery point for a full scan. If you are running an
  /// incremental scan, this will be your a recovery point which has been
  /// created after your base recovery point selection.
  ///
  /// Parameter [scanMode] :
  /// Specifies the scan type use for the scan job.
  ///
  /// Includes:
  ///
  /// <ul>
  /// <li>
  /// <code>FULL_SCAN</code> will scan the entire data lineage within the
  /// backup.
  /// </li>
  /// <li>
  /// <code>INCREMENTAL_SCAN</code> will scan the data difference between the
  /// target recovery point and base recovery point ARN.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scannerRoleArn] :
  /// Specified the IAM scanner role ARN.
  ///
  /// Parameter [continuousScanEndTime] :
  /// The point in time the scan job will scan up to for a continuous backup.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>StartScanJob</code>. Retrying a successful
  /// request with the same idempotency token results in a success message with
  /// no action taken.
  ///
  /// Parameter [scanBaseRecoveryPointArn] :
  /// An ARN that uniquely identifies the base recovery point to be used for
  /// incremental scanning.
  Future<StartScanJobOutput> startScanJob({
    required String backupVaultName,
    required String iamRoleArn,
    required MalwareScanner malwareScanner,
    required String recoveryPointArn,
    required ScanMode scanMode,
    required String scannerRoleArn,
    DateTime? continuousScanEndTime,
    String? idempotencyToken,
    String? scanBaseRecoveryPointArn,
  }) async {
    final $payload = <String, dynamic>{
      'BackupVaultName': backupVaultName,
      'IamRoleArn': iamRoleArn,
      'MalwareScanner': malwareScanner.value,
      'RecoveryPointArn': recoveryPointArn,
      'ScanMode': scanMode.value,
      'ScannerRoleArn': scannerRoleArn,
      if (continuousScanEndTime != null)
        'ContinuousScanEndTime': unixTimestampToJson(continuousScanEndTime),
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      if (scanBaseRecoveryPointArn != null)
        'ScanBaseRecoveryPointArn': scanBaseRecoveryPointArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/scan/job',
      exceptionFnMap: _exceptionFns,
    );
    return StartScanJobOutput.fromJson(response);
  }

  /// Attempts to cancel a job to create a one-time backup of a resource.
  ///
  /// This action is not supported for the following services:
  ///
  /// <ul>
  /// <li>
  /// Amazon Aurora
  /// </li>
  /// <li>
  /// Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// Amazon FSx for Lustre
  /// </li>
  /// <li>
  /// Amazon FSx for NetApp ONTAP
  /// </li>
  /// <li>
  /// Amazon FSx for OpenZFS
  /// </li>
  /// <li>
  /// Amazon FSx for Windows File Server
  /// </li>
  /// <li>
  /// Amazon Neptune
  /// </li>
  /// <li>
  /// SAP HANA databases on Amazon EC2 instances
  /// </li>
  /// <li>
  /// Amazon RDS
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupJobId] :
  /// Uniquely identifies a request to Backup to back up a resource.
  Future<void> stopBackupJob({
    required String backupJobId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/backup-jobs/${Uri.encodeComponent(backupJobId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns a set of key-value pairs to a resource.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN that uniquely identifies the resource.
  ///
  /// Parameter [tags] :
  /// Key-value pairs that are used to help organize your resources. You can
  /// assign your own metadata to the resources you create. For clarity, this is
  /// the structure to assign tags:
  /// <code>[{"Key":"string","Value":"string"}]</code>.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a set of key-value pairs from a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN)
  ///
  /// This API is not supported for recovery points for resource types including
  /// Aurora, Amazon DocumentDB. Amazon EBS, Amazon FSx, Neptune, and Amazon
  /// RDS.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the type of the tagged resource.
  ///
  /// ARNs that do not include <code>backup</code> are incompatible with
  /// tagging. <code>TagResource</code> and <code>UntagResource</code> with
  /// invalid ARNs will result in an error. Acceptable ARN content can include
  /// <code>arn:aws:backup:us-east</code>. Invalid ARN content may look like
  /// <code>arn:aws:ec2:us-east</code>.
  ///
  /// Parameter [tagKeyList] :
  /// The keys to identify which key-value tags to remove from a resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeyList,
  }) async {
    final $payload = <String, dynamic>{
      'TagKeyList': tagKeyList,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untag/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified backup plan. The new version is uniquely identified
  /// by its ID.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlan] :
  /// The body of a backup plan. Includes a <code>BackupPlanName</code> and one
  /// or more sets of <code>Rules</code>.
  ///
  /// Parameter [backupPlanId] :
  /// The ID of the backup plan.
  Future<UpdateBackupPlanOutput> updateBackupPlan({
    required BackupPlanInput backupPlan,
    required String backupPlanId,
  }) async {
    final $payload = <String, dynamic>{
      'BackupPlan': backupPlan,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/backup/plans/${Uri.encodeComponent(backupPlanId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBackupPlanOutput.fromJson(response);
  }

  /// Updates the specified framework.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [frameworkName] :
  /// The unique name of a framework. This name is between 1 and 256 characters,
  /// starting with a letter, and consisting of letters (a-z, A-Z), numbers
  /// (0-9), and underscores (_).
  ///
  /// Parameter [frameworkControls] :
  /// The controls that make up the framework. Each control in the list has a
  /// name, input parameters, and scope.
  ///
  /// Parameter [frameworkDescription] :
  /// An optional description of the framework with a maximum 1,024 characters.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>UpdateFrameworkInput</code>. Retrying a
  /// successful request with the same idempotency token results in a success
  /// message with no action taken.
  Future<UpdateFrameworkOutput> updateFramework({
    required String frameworkName,
    List<FrameworkControl>? frameworkControls,
    String? frameworkDescription,
    String? idempotencyToken,
  }) async {
    final $payload = <String, dynamic>{
      if (frameworkControls != null) 'FrameworkControls': frameworkControls,
      if (frameworkDescription != null)
        'FrameworkDescription': frameworkDescription,
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/audit/frameworks/${Uri.encodeComponent(frameworkName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateFrameworkOutput.fromJson(response);
  }

  /// Updates whether the Amazon Web Services account has enabled different
  /// cross-account management options, including cross-account backup,
  /// multi-party approval, and delegated administrator. Returns an error if the
  /// account is not an Organizations management account. Use the
  /// <code>DescribeGlobalSettings</code> API to determine the current settings.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [globalSettings] :
  /// Inputs can include:
  ///
  /// A value for <code>isCrossAccountBackupEnabled</code>. Values can be true
  /// or false. Example: <code>update-global-settings --global-settings
  /// isCrossAccountBackupEnabled=false</code>.
  ///
  /// A value for Multi-party approval, styled as <code>isMpaEnabled</code>.
  /// Values can be true or false. Example: <code>update-global-settings
  /// --global-settings isMpaEnabled=false</code>.
  ///
  /// A value for Backup Service-Linked Role creation, styled as
  /// <code>isDelegatedAdministratorEnabled</code>. Values can be true or false.
  /// Example: <code>update-global-settings --global-settings
  /// isDelegatedAdministratorEnabled=false</code>.
  Future<void> updateGlobalSettings({
    Map<String, String>? globalSettings,
  }) async {
    final $payload = <String, dynamic>{
      if (globalSettings != null) 'GlobalSettings': globalSettings,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/global-settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation updates the settings of a recovery point index.
  ///
  /// Required: BackupVaultName, RecoveryPointArn, and IAMRoleArn
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created.
  ///
  /// Accepted characters include lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [index] :
  /// Index can have 1 of 2 possible values, either <code>ENABLED</code> or
  /// <code>DISABLED</code>.
  ///
  /// To create a backup index for an eligible <code>ACTIVE</code> recovery
  /// point that does not yet have a backup index, set value to
  /// <code>ENABLED</code>.
  ///
  /// To delete a backup index, set value to <code>DISABLED</code>.
  ///
  /// Parameter [recoveryPointArn] :
  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [iamRoleArn] :
  /// This specifies the IAM role ARN used for this operation.
  ///
  /// For example, arn:aws:iam::123456789012:role/S3Access
  Future<UpdateRecoveryPointIndexSettingsOutput>
      updateRecoveryPointIndexSettings({
    required String backupVaultName,
    required Index index,
    required String recoveryPointArn,
    String? iamRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'Index': index.value,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}/index',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecoveryPointIndexSettingsOutput.fromJson(response);
  }

  /// Sets the transition lifecycle of a recovery point.
  ///
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Resource types that can transition to cold storage are listed in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table. Backup ignores this expression for
  /// other resource types.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition
  /// to cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  /// <important>
  /// If your lifecycle currently uses the parameters
  /// <code>DeleteAfterDays</code> and <code>MoveToColdStorageAfterDays</code>,
  /// include these parameters and their values when you call this operation.
  /// Not including them may result in your plan updating with null values.
  /// </important>
  /// This operation does not support continuous backups.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [lifecycle] :
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition
  /// to cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  Future<UpdateRecoveryPointLifecycleOutput> updateRecoveryPointLifecycle({
    required String backupVaultName,
    required String recoveryPointArn,
    Lifecycle? lifecycle,
  }) async {
    final $payload = <String, dynamic>{
      if (lifecycle != null) 'Lifecycle': lifecycle,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRecoveryPointLifecycleOutput.fromJson(response);
  }

  /// Updates the current service opt-in settings for the Region.
  ///
  /// Use the <code>DescribeRegionSettings</code> API to determine the resource
  /// types that are supported.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceTypeManagementPreference] :
  /// Enables or disables full Backup management of backups for a resource type.
  /// To enable full Backup management for DynamoDB along with <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/advanced-ddb-backup.html">
  /// Backup's advanced DynamoDB backup features</a>, follow the procedure to <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/advanced-ddb-backup.html#advanced-ddb-backup-enable-cli">
  /// enable advanced DynamoDB backup programmatically</a>.
  ///
  /// Parameter [resourceTypeOptInPreference] :
  /// Updates the list of services along with the opt-in preferences for the
  /// Region.
  ///
  /// If resource assignments are only based on tags, then service opt-in
  /// settings are applied. If a resource type is explicitly assigned to a
  /// backup plan, such as Amazon S3, Amazon EC2, or Amazon RDS, it will be
  /// included in the backup even if the opt-in is not enabled for that
  /// particular service. If both a resource type and tags are specified in a
  /// resource assignment, the resource type specified in the backup plan takes
  /// priority over the tag condition. Service opt-in settings are disregarded
  /// in this situation.
  Future<void> updateRegionSettings({
    Map<String, bool>? resourceTypeManagementPreference,
    Map<String, bool>? resourceTypeOptInPreference,
  }) async {
    final $payload = <String, dynamic>{
      if (resourceTypeManagementPreference != null)
        'ResourceTypeManagementPreference': resourceTypeManagementPreference,
      if (resourceTypeOptInPreference != null)
        'ResourceTypeOptInPreference': resourceTypeOptInPreference,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/account-settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified report plan.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [reportPlanName] :
  /// The unique name of the report plan. This name is between 1 and 256
  /// characters, starting with a letter, and consisting of letters (a-z, A-Z),
  /// numbers (0-9), and underscores (_).
  ///
  /// Parameter [idempotencyToken] :
  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>UpdateReportPlanInput</code>. Retrying a
  /// successful request with the same idempotency token results in a success
  /// message with no action taken.
  ///
  /// Parameter [reportDeliveryChannel] :
  /// The information about where to deliver your reports, specifically your
  /// Amazon S3 bucket name, S3 key prefix, and the formats of your reports.
  ///
  /// Parameter [reportPlanDescription] :
  /// An optional description of the report plan with a maximum 1,024
  /// characters.
  ///
  /// Parameter [reportSetting] :
  /// The report template for the report. Reports are built using a report
  /// template. The report templates are:
  ///
  /// <code>RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT |
  /// BACKUP_JOB_REPORT | COPY_JOB_REPORT | RESTORE_JOB_REPORT</code>
  ///
  /// If the report template is <code>RESOURCE_COMPLIANCE_REPORT</code> or
  /// <code>CONTROL_COMPLIANCE_REPORT</code>, this API resource also describes
  /// the report coverage by Amazon Web Services Regions and frameworks.
  Future<UpdateReportPlanOutput> updateReportPlan({
    required String reportPlanName,
    String? idempotencyToken,
    ReportDeliveryChannel? reportDeliveryChannel,
    String? reportPlanDescription,
    ReportSetting? reportSetting,
  }) async {
    final $payload = <String, dynamic>{
      'IdempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      if (reportDeliveryChannel != null)
        'ReportDeliveryChannel': reportDeliveryChannel,
      if (reportPlanDescription != null)
        'ReportPlanDescription': reportPlanDescription,
      if (reportSetting != null) 'ReportSetting': reportSetting,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/audit/report-plans/${Uri.encodeComponent(reportPlanName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateReportPlanOutput.fromJson(response);
  }

  /// This request will send changes to your specified restore testing plan.
  /// <code>RestoreTestingPlanName</code> cannot be updated after it is created.
  ///
  /// <code>RecoveryPointSelection</code> can contain:
  ///
  /// <ul>
  /// <li>
  /// <code>Algorithm</code>
  /// </li>
  /// <li>
  /// <code>ExcludeVaults</code>
  /// </li>
  /// <li>
  /// <code>IncludeVaults</code>
  /// </li>
  /// <li>
  /// <code>RecoveryPointTypes</code>
  /// </li>
  /// <li>
  /// <code>SelectionWindowDays</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlan] :
  /// Specifies the body of a restore testing plan.
  ///
  /// Parameter [restoreTestingPlanName] :
  /// The name of the restore testing plan name.
  Future<UpdateRestoreTestingPlanOutput> updateRestoreTestingPlan({
    required RestoreTestingPlanForUpdate restoreTestingPlan,
    required String restoreTestingPlanName,
  }) async {
    final $payload = <String, dynamic>{
      'RestoreTestingPlan': restoreTestingPlan,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRestoreTestingPlanOutput.fromJson(response);
  }

  /// Updates the specified restore testing selection.
  ///
  /// Most elements except the <code>RestoreTestingSelectionName</code> can be
  /// updated with this request.
  ///
  /// You can use either protected resource ARNs or conditions, but not both.
  ///
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [restoreTestingPlanName] :
  /// The restore testing plan name is required to update the indicated testing
  /// plan.
  ///
  /// Parameter [restoreTestingSelection] :
  /// To update your restore testing selection, you can use either protected
  /// resource ARNs or conditions, but not both. That is, if your selection has
  /// <code>ProtectedResourceArns</code>, requesting an update with the
  /// parameter <code>ProtectedResourceConditions</code> will be unsuccessful.
  ///
  /// Parameter [restoreTestingSelectionName] :
  /// The required restore testing selection name of the restore testing
  /// selection you wish to update.
  Future<UpdateRestoreTestingSelectionOutput> updateRestoreTestingSelection({
    required String restoreTestingPlanName,
    required RestoreTestingSelectionForUpdate restoreTestingSelection,
    required String restoreTestingSelectionName,
  }) async {
    final $payload = <String, dynamic>{
      'RestoreTestingSelection': restoreTestingSelection,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/restore-testing/plans/${Uri.encodeComponent(restoreTestingPlanName)}/selections/${Uri.encodeComponent(restoreTestingSelectionName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRestoreTestingSelectionOutput.fromJson(response);
  }

  /// This request will send changes to your specified tiering configuration.
  /// <code>TieringConfigurationName</code> cannot be updated after it is
  /// created.
  ///
  /// <code>ResourceSelection</code> can contain:
  ///
  /// <ul>
  /// <li>
  /// <code>Resources</code>
  /// </li>
  /// <li>
  /// <code>TieringDownSettingsInDays</code>
  /// </li>
  /// <li>
  /// <code>ResourceType</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [ConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [tieringConfiguration] :
  /// Specifies the body of a tiering configuration.
  ///
  /// Parameter [tieringConfigurationName] :
  /// The name of a tiering configuration to update.
  Future<UpdateTieringConfigurationOutput> updateTieringConfiguration({
    required TieringConfigurationInputForUpdate tieringConfiguration,
    required String tieringConfigurationName,
  }) async {
    final $payload = <String, dynamic>{
      'TieringConfiguration': tieringConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/tiering-configurations/${Uri.encodeComponent(tieringConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTieringConfigurationOutput.fromJson(response);
  }
}

class CancelLegalHoldOutput {
  CancelLegalHoldOutput();

  factory CancelLegalHoldOutput.fromJson(Map<String, dynamic> _) {
    return CancelLegalHoldOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateBackupPlanOutput {
  /// The settings for a resource type. This option is only available for Windows
  /// Volume Shadow Copy Service (VSS) backup jobs.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  final String? backupPlanArn;

  /// The ID of the backup plan.
  final String? backupPlanId;

  /// The date and time that a backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. They cannot be edited.
  final String? versionId;

  CreateBackupPlanOutput({
    this.advancedBackupSettings,
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.versionId,
  });

  factory CreateBackupPlanOutput.fromJson(Map<String, dynamic> json) {
    return CreateBackupPlanOutput(
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.nonNulls
          .map((e) => AdvancedBackupSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      backupPlanArn: json['BackupPlanArn'] as String?,
      backupPlanId: json['BackupPlanId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedBackupSettings = this.advancedBackupSettings;
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final creationDate = this.creationDate;
    final versionId = this.versionId;
    return {
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
      if (backupPlanArn != null) 'BackupPlanArn': backupPlanArn,
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class CreateBackupSelectionOutput {
  /// The ID of the backup plan.
  final String? backupPlanId;

  /// The date and time a backup selection is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// Uniquely identifies the body of a request to assign a set of resources to a
  /// backup plan.
  final String? selectionId;

  CreateBackupSelectionOutput({
    this.backupPlanId,
    this.creationDate,
    this.selectionId,
  });

  factory CreateBackupSelectionOutput.fromJson(Map<String, dynamic> json) {
    return CreateBackupSelectionOutput(
      backupPlanId: json['BackupPlanId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      selectionId: json['SelectionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanId = this.backupPlanId;
    final creationDate = this.creationDate;
    final selectionId = this.selectionId;
    return {
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (selectionId != null) 'SelectionId': selectionId,
    };
  }
}

class CreateBackupVaultOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String? backupVaultName;

  /// The date and time a backup vault is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  CreateBackupVaultOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
  });

  factory CreateBackupVaultOutput.fromJson(Map<String, dynamic> json) {
    return CreateBackupVaultOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
    };
  }
}

class CreateFrameworkOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? frameworkArn;

  /// The unique name of the framework. The name must be between 1 and 256
  /// characters, starting with a letter, and consisting of letters (a-z, A-Z),
  /// numbers (0-9), and underscores (_).
  final String? frameworkName;

  CreateFrameworkOutput({
    this.frameworkArn,
    this.frameworkName,
  });

  factory CreateFrameworkOutput.fromJson(Map<String, dynamic> json) {
    return CreateFrameworkOutput(
      frameworkArn: json['FrameworkArn'] as String?,
      frameworkName: json['FrameworkName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final frameworkArn = this.frameworkArn;
    final frameworkName = this.frameworkName;
    return {
      if (frameworkArn != null) 'FrameworkArn': frameworkArn,
      if (frameworkName != null) 'FrameworkName': frameworkName,
    };
  }
}

class CreateLegalHoldOutput {
  /// The time when the legal hold was created.
  final DateTime? creationDate;

  /// The description of the legal hold.
  final String? description;

  /// The Amazon Resource Name (ARN) of the legal hold.
  final String? legalHoldArn;

  /// The ID of the legal hold.
  final String? legalHoldId;

  /// The criteria to assign to a set of resources, such as resource types or
  /// backup vaults.
  final RecoveryPointSelection? recoveryPointSelection;

  /// The status of the legal hold.
  final LegalHoldStatus? status;

  /// The title of the legal hold.
  final String? title;

  CreateLegalHoldOutput({
    this.creationDate,
    this.description,
    this.legalHoldArn,
    this.legalHoldId,
    this.recoveryPointSelection,
    this.status,
    this.title,
  });

  factory CreateLegalHoldOutput.fromJson(Map<String, dynamic> json) {
    return CreateLegalHoldOutput(
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      legalHoldArn: json['LegalHoldArn'] as String?,
      legalHoldId: json['LegalHoldId'] as String?,
      recoveryPointSelection: json['RecoveryPointSelection'] != null
          ? RecoveryPointSelection.fromJson(
              json['RecoveryPointSelection'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.let(LegalHoldStatus.fromString),
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final description = this.description;
    final legalHoldArn = this.legalHoldArn;
    final legalHoldId = this.legalHoldId;
    final recoveryPointSelection = this.recoveryPointSelection;
    final status = this.status;
    final title = this.title;
    return {
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (description != null) 'Description': description,
      if (legalHoldArn != null) 'LegalHoldArn': legalHoldArn,
      if (legalHoldId != null) 'LegalHoldId': legalHoldId,
      if (recoveryPointSelection != null)
        'RecoveryPointSelection': recoveryPointSelection,
      if (status != null) 'Status': status.value,
      if (title != null) 'Title': title,
    };
  }
}

class CreateLogicallyAirGappedBackupVaultOutput {
  /// The ARN (Amazon Resource Name) of the vault.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Logically
  /// air-gapped backup vaults are identified by names that are unique to the
  /// account used to create them and the Region where they are created.
  final String? backupVaultName;

  /// The date and time when the vault was created.
  ///
  /// This value is in Unix format, Coordinated Universal Time (UTC), and accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// The current state of the vault.
  final VaultState? vaultState;

  CreateLogicallyAirGappedBackupVaultOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.vaultState,
  });

  factory CreateLogicallyAirGappedBackupVaultOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateLogicallyAirGappedBackupVaultOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      vaultState: (json['VaultState'] as String?)?.let(VaultState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final vaultState = this.vaultState;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (vaultState != null) 'VaultState': vaultState.value,
    };
  }
}

class CreateReportPlanOutput {
  /// The date and time a backup vault is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationTime</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? reportPlanArn;

  /// The unique name of the report plan.
  final String? reportPlanName;

  CreateReportPlanOutput({
    this.creationTime,
    this.reportPlanArn,
    this.reportPlanName,
  });

  factory CreateReportPlanOutput.fromJson(Map<String, dynamic> json) {
    return CreateReportPlanOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      reportPlanArn: json['ReportPlanArn'] as String?,
      reportPlanName: json['ReportPlanName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final reportPlanArn = this.reportPlanArn;
    final reportPlanName = this.reportPlanName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (reportPlanArn != null) 'ReportPlanArn': reportPlanArn,
      if (reportPlanName != null) 'ReportPlanName': reportPlanName,
    };
  }
}

class CreateRestoreAccessBackupVaultOutput {
  /// >The date and time when the restore access backup vault was created, in Unix
  /// format and Coordinated Universal Time
  final DateTime? creationDate;

  /// The ARN that uniquely identifies the created restore access backup vault.
  final String? restoreAccessBackupVaultArn;

  /// The name of the created restore access backup vault.
  final String? restoreAccessBackupVaultName;

  /// The current state of the restore access backup vault.
  final VaultState? vaultState;

  CreateRestoreAccessBackupVaultOutput({
    this.creationDate,
    this.restoreAccessBackupVaultArn,
    this.restoreAccessBackupVaultName,
    this.vaultState,
  });

  factory CreateRestoreAccessBackupVaultOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateRestoreAccessBackupVaultOutput(
      creationDate: timeStampFromJson(json['CreationDate']),
      restoreAccessBackupVaultArn:
          json['RestoreAccessBackupVaultArn'] as String?,
      restoreAccessBackupVaultName:
          json['RestoreAccessBackupVaultName'] as String?,
      vaultState: (json['VaultState'] as String?)?.let(VaultState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final restoreAccessBackupVaultArn = this.restoreAccessBackupVaultArn;
    final restoreAccessBackupVaultName = this.restoreAccessBackupVaultName;
    final vaultState = this.vaultState;
    return {
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (restoreAccessBackupVaultArn != null)
        'RestoreAccessBackupVaultArn': restoreAccessBackupVaultArn,
      if (restoreAccessBackupVaultName != null)
        'RestoreAccessBackupVaultName': restoreAccessBackupVaultName,
      if (vaultState != null) 'VaultState': vaultState.value,
    };
  }
}

class CreateRestoreTestingPlanOutput {
  /// The date and time a restore testing plan was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087AM.
  final DateTime creationTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies the created restore
  /// testing plan.
  final String restoreTestingPlanArn;

  /// This unique string is the name of the restore testing plan.
  ///
  /// The name cannot be changed after creation. The name consists of only
  /// alphanumeric characters and underscores. Maximum length is 50.
  final String restoreTestingPlanName;

  CreateRestoreTestingPlanOutput({
    required this.creationTime,
    required this.restoreTestingPlanArn,
    required this.restoreTestingPlanName,
  });

  factory CreateRestoreTestingPlanOutput.fromJson(Map<String, dynamic> json) {
    return CreateRestoreTestingPlanOutput(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      restoreTestingPlanArn: (json['RestoreTestingPlanArn'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final restoreTestingPlanArn = this.restoreTestingPlanArn;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'RestoreTestingPlanArn': restoreTestingPlanArn,
      'RestoreTestingPlanName': restoreTestingPlanName,
    };
  }
}

class CreateRestoreTestingSelectionOutput {
  /// The time that the resource testing selection was created.
  final DateTime creationTime;

  /// The ARN of the restore testing plan with which the restore testing selection
  /// is associated.
  final String restoreTestingPlanArn;

  /// The name of the restore testing plan.
  ///
  /// The name cannot be changed after creation. The name consists of only
  /// alphanumeric characters and underscores. Maximum length is 50.
  final String restoreTestingPlanName;

  /// The name of the restore testing selection for the related restore testing
  /// plan.
  ///
  /// The name cannot be changed after creation. The name consists of only
  /// alphanumeric characters and underscores. Maximum length is 50.
  final String restoreTestingSelectionName;

  CreateRestoreTestingSelectionOutput({
    required this.creationTime,
    required this.restoreTestingPlanArn,
    required this.restoreTestingPlanName,
    required this.restoreTestingSelectionName,
  });

  factory CreateRestoreTestingSelectionOutput.fromJson(
      Map<String, dynamic> json) {
    return CreateRestoreTestingSelectionOutput(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      restoreTestingPlanArn: (json['RestoreTestingPlanArn'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
      restoreTestingSelectionName:
          (json['RestoreTestingSelectionName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final restoreTestingPlanArn = this.restoreTestingPlanArn;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final restoreTestingSelectionName = this.restoreTestingSelectionName;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'RestoreTestingPlanArn': restoreTestingPlanArn,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'RestoreTestingSelectionName': restoreTestingSelectionName,
    };
  }
}

class CreateTieringConfigurationOutput {
  /// The date and time a tiering configuration was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087AM.
  final DateTime? creationTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies the created tiering
  /// configuration.
  final String? tieringConfigurationArn;

  /// This unique string is the name of the tiering configuration.
  ///
  /// The name cannot be changed after creation. The name consists of only
  /// alphanumeric characters and underscores. Maximum length is 200.
  final String? tieringConfigurationName;

  CreateTieringConfigurationOutput({
    this.creationTime,
    this.tieringConfigurationArn,
    this.tieringConfigurationName,
  });

  factory CreateTieringConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return CreateTieringConfigurationOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      tieringConfigurationArn: json['TieringConfigurationArn'] as String?,
      tieringConfigurationName: json['TieringConfigurationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final tieringConfigurationArn = this.tieringConfigurationArn;
    final tieringConfigurationName = this.tieringConfigurationName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (tieringConfigurationArn != null)
        'TieringConfigurationArn': tieringConfigurationArn,
      if (tieringConfigurationName != null)
        'TieringConfigurationName': tieringConfigurationName,
    };
  }
}

class DeleteBackupPlanOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  final String? backupPlanArn;

  /// Uniquely identifies a backup plan.
  final String? backupPlanId;

  /// The date and time a backup plan is deleted, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>DeletionDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? deletionDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version IDs cannot be edited.
  final String? versionId;

  DeleteBackupPlanOutput({
    this.backupPlanArn,
    this.backupPlanId,
    this.deletionDate,
    this.versionId,
  });

  factory DeleteBackupPlanOutput.fromJson(Map<String, dynamic> json) {
    return DeleteBackupPlanOutput(
      backupPlanArn: json['BackupPlanArn'] as String?,
      backupPlanId: json['BackupPlanId'] as String?,
      deletionDate: timeStampFromJson(json['DeletionDate']),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final deletionDate = this.deletionDate;
    final versionId = this.versionId;
    return {
      if (backupPlanArn != null) 'BackupPlanArn': backupPlanArn,
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (deletionDate != null)
        'DeletionDate': unixTimestampToJson(deletionDate),
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class DeleteTieringConfigurationOutput {
  DeleteTieringConfigurationOutput();

  factory DeleteTieringConfigurationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteTieringConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeBackupJobOutput {
  /// Returns the account ID that owns the backup job.
  final String? accountId;

  /// Uniquely identifies a request to Backup to back up a resource.
  final String? backupJobId;

  /// Represents the options specified as part of backup plan or on-demand backup
  /// job.
  final Map<String, String>? backupOptions;

  /// The size, in bytes, of a backup (recovery point).
  ///
  /// This value can render differently depending on the resource type as Backup
  /// pulls in data information from other Amazon Web Services services. For
  /// example, the value returned may show a value of <code>0</code>, which may
  /// differ from the anticipated value.
  ///
  /// The expected behavior for values by resource type are described as follows:
  ///
  /// <ul>
  /// <li>
  /// Amazon Aurora, Amazon DocumentDB, and Amazon Neptune do not have this value
  /// populate from the operation <code>GetBackupJobStatus</code>.
  /// </li>
  /// <li>
  /// For Amazon DynamoDB with advanced features, this value refers to the size of
  /// the recovery point (backup).
  /// </li>
  /// <li>
  /// Amazon EC2 and Amazon EBS show volume size (provisioned storage) returned as
  /// part of this value. Amazon EBS does not return backup size information;
  /// snapshot size will have the same value as the original resource that was
  /// backed up.
  /// </li>
  /// <li>
  /// For Amazon EFS, this value refers to the delta bytes transferred during a
  /// backup.
  /// </li>
  /// <li>
  /// For Amazon EKS, this value refers to the size of your nested EKS recovery
  /// point.
  /// </li>
  /// <li>
  /// Amazon FSx does not populate this value from the operation
  /// <code>GetBackupJobStatus</code> for FSx file systems.
  /// </li>
  /// <li>
  /// An Amazon RDS instance will show as <code>0</code>.
  /// </li>
  /// <li>
  /// For virtual machines running VMware, this value is passed to Backup through
  /// an asynchronous workflow, which can mean this displayed value can
  /// under-represent the actual backup size.
  /// </li>
  /// </ul>
  final int? backupSizeInBytes;

  /// Represents the actual backup type selected for a backup job. For example, if
  /// a successful Windows Volume Shadow Copy Service (VSS) backup was taken,
  /// <code>BackupType</code> returns <code>"WindowsVSS"</code>. If
  /// <code>BackupType</code> is empty, then the backup type was a regular backup.
  final String? backupType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String? backupVaultName;

  /// The size in bytes transferred to a backup vault at the time that the job
  /// status was queried.
  final int? bytesTransferred;

  /// This returns the statistics of the included child (nested) backup jobs.
  final Map<BackupJobState, int>? childJobsInState;

  /// The date and time that a job to create a backup job is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// Contains identifying information about the creation of a backup job,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan that is used to create it.
  final RecoveryPointCreator? createdBy;

  /// The date and time that a backup job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the backup.
  /// This can be a customer-managed key or an Amazon Web Services managed key,
  /// depending on the vault configuration.
  final String? encryptionKeyArn;

  /// The date and time that a job to back up resources is expected to be
  /// completed, in Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>ExpectedCompletionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  final DateTime? expectedCompletionDate;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// The date a backup job was initiated.
  final DateTime? initiationDate;

  /// A boolean value indicating whether the backup is encrypted. All backups in
  /// Backup are encrypted, but this field indicates the encryption status for
  /// transparency.
  final bool? isEncrypted;

  /// This returns the boolean value that a backup job is a parent (composite)
  /// job.
  final bool? isParent;

  /// The job count for the specified message category.
  ///
  /// Example strings may include <code>AccessDenied</code>, <code>SUCCESS</code>,
  /// <code>AGGREGATE_ALL</code>, and <code>INVALIDPARAMETERS</code>. View <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of accepted MessageCategory strings.
  final String? messageCategory;

  /// This returns the number of child (nested) backup jobs.
  final int? numberOfChildJobs;

  /// This returns the parent (composite) resource backup job ID.
  final String? parentJobId;

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  final String? percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;
  final Lifecycle? recoveryPointLifecycle;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  final String? resourceArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource to be backed up; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  final String? resourceType;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC) when
  /// a backup job must be started before it is canceled. The value is calculated
  /// by adding the start window to the scheduled time. So if the scheduled time
  /// were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time
  /// would be 8:00 PM on the date specified. The value of <code>StartBy</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startBy;

  /// The current state of a backup job.
  final BackupJobState? state;

  /// A detailed message explaining the status of the job to back up a resource.
  final String? statusMessage;

  /// The lock state of the backup vault. For logically air-gapped vaults, this
  /// indicates whether the vault is locked in compliance mode. Valid values
  /// include <code>LOCKED</code> and <code>UNLOCKED</code>.
  final String? vaultLockState;

  /// The type of backup vault where the recovery point is stored. Valid values
  /// are <code>BACKUP_VAULT</code> for standard backup vaults and
  /// <code>LOGICALLY_AIR_GAPPED_BACKUP_VAULT</code> for logically air-gapped
  /// vaults.
  final String? vaultType;

  DescribeBackupJobOutput({
    this.accountId,
    this.backupJobId,
    this.backupOptions,
    this.backupSizeInBytes,
    this.backupType,
    this.backupVaultArn,
    this.backupVaultName,
    this.bytesTransferred,
    this.childJobsInState,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.expectedCompletionDate,
    this.iamRoleArn,
    this.initiationDate,
    this.isEncrypted,
    this.isParent,
    this.messageCategory,
    this.numberOfChildJobs,
    this.parentJobId,
    this.percentDone,
    this.recoveryPointArn,
    this.recoveryPointLifecycle,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
    this.startBy,
    this.state,
    this.statusMessage,
    this.vaultLockState,
    this.vaultType,
  });

  factory DescribeBackupJobOutput.fromJson(Map<String, dynamic> json) {
    return DescribeBackupJobOutput(
      accountId: json['AccountId'] as String?,
      backupJobId: json['BackupJobId'] as String?,
      backupOptions: (json['BackupOptions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      backupType: json['BackupType'] as String?,
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      bytesTransferred: json['BytesTransferred'] as int?,
      childJobsInState: (json['ChildJobsInState'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(BackupJobState.fromString(k), e as int)),
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      expectedCompletionDate: timeStampFromJson(json['ExpectedCompletionDate']),
      iamRoleArn: json['IamRoleArn'] as String?,
      initiationDate: timeStampFromJson(json['InitiationDate']),
      isEncrypted: json['IsEncrypted'] as bool?,
      isParent: json['IsParent'] as bool?,
      messageCategory: json['MessageCategory'] as String?,
      numberOfChildJobs: json['NumberOfChildJobs'] as int?,
      parentJobId: json['ParentJobId'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      recoveryPointLifecycle: json['RecoveryPointLifecycle'] != null
          ? Lifecycle.fromJson(
              json['RecoveryPointLifecycle'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
      startBy: timeStampFromJson(json['StartBy']),
      state: (json['State'] as String?)?.let(BackupJobState.fromString),
      statusMessage: json['StatusMessage'] as String?,
      vaultLockState: json['VaultLockState'] as String?,
      vaultType: json['VaultType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupJobId = this.backupJobId;
    final backupOptions = this.backupOptions;
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupType = this.backupType;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final bytesTransferred = this.bytesTransferred;
    final childJobsInState = this.childJobsInState;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final expectedCompletionDate = this.expectedCompletionDate;
    final iamRoleArn = this.iamRoleArn;
    final initiationDate = this.initiationDate;
    final isEncrypted = this.isEncrypted;
    final isParent = this.isParent;
    final messageCategory = this.messageCategory;
    final numberOfChildJobs = this.numberOfChildJobs;
    final parentJobId = this.parentJobId;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final recoveryPointLifecycle = this.recoveryPointLifecycle;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final startBy = this.startBy;
    final state = this.state;
    final statusMessage = this.statusMessage;
    final vaultLockState = this.vaultLockState;
    final vaultType = this.vaultType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupJobId != null) 'BackupJobId': backupJobId,
      if (backupOptions != null) 'BackupOptions': backupOptions,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupType != null) 'BackupType': backupType,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (bytesTransferred != null) 'BytesTransferred': bytesTransferred,
      if (childJobsInState != null)
        'ChildJobsInState':
            childJobsInState.map((k, e) => MapEntry(k.value, e)),
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (expectedCompletionDate != null)
        'ExpectedCompletionDate': unixTimestampToJson(expectedCompletionDate),
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (isEncrypted != null) 'IsEncrypted': isEncrypted,
      if (isParent != null) 'IsParent': isParent,
      if (messageCategory != null) 'MessageCategory': messageCategory,
      if (numberOfChildJobs != null) 'NumberOfChildJobs': numberOfChildJobs,
      if (parentJobId != null) 'ParentJobId': parentJobId,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (recoveryPointLifecycle != null)
        'RecoveryPointLifecycle': recoveryPointLifecycle,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startBy != null) 'StartBy': unixTimestampToJson(startBy),
      if (state != null) 'State': state.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vaultLockState != null) 'VaultLockState': vaultLockState,
      if (vaultType != null) 'VaultType': vaultType,
    };
  }
}

class DescribeBackupVaultOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created.
  final String? backupVaultName;

  /// The date and time that a backup vault is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of running the operation twice. This parameter is
  /// optional. If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String? creatorRequestId;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  final String? encryptionKeyArn;

  /// The type of encryption key used for the backup vault. Valid values are
  /// CUSTOMER_MANAGED_KMS_KEY for customer-managed keys or Amazon Web
  /// Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
  final EncryptionKeyType? encryptionKeyType;

  /// Information about the latest update to the MPA approval team association for
  /// this backup vault.
  final LatestMpaApprovalTeamUpdate? latestMpaApprovalTeamUpdate;

  /// The date and time when Backup Vault Lock configuration cannot be changed or
  /// deleted.
  ///
  /// If you applied Vault Lock to your vault without specifying a lock date, you
  /// can change any of your Vault Lock settings, or delete Vault Lock from the
  /// vault entirely, at any time.
  ///
  /// This value is in Unix format, Coordinated Universal Time (UTC), and accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? lockDate;

  /// A Boolean that indicates whether Backup Vault Lock is currently protecting
  /// the backup vault. <code>True</code> means that Vault Lock causes delete or
  /// update operations on the recovery points stored in the vault to fail.
  final bool? locked;

  /// The Backup Vault Lock setting that specifies the maximum retention period
  /// that the vault retains its recovery points. If this parameter is not
  /// specified, Vault Lock does not enforce a maximum retention period on the
  /// recovery points in the vault (allowing indefinite storage).
  ///
  /// If specified, any backup or copy job to the vault must have a lifecycle
  /// policy with a retention period equal to or shorter than the maximum
  /// retention period. If the job's retention period is longer than that maximum
  /// retention period, then the vault fails the backup or copy job, and you
  /// should either modify your lifecycle settings or use a different vault.
  /// Recovery points already stored in the vault prior to Vault Lock are not
  /// affected.
  final int? maxRetentionDays;

  /// The Backup Vault Lock setting that specifies the minimum retention period
  /// that the vault retains its recovery points. If this parameter is not
  /// specified, Vault Lock will not enforce a minimum retention period.
  ///
  /// If specified, any backup or copy job to the vault must have a lifecycle
  /// policy with a retention period equal to or longer than the minimum retention
  /// period. If the job's retention period is shorter than that minimum retention
  /// period, then the vault fails the backup or copy job, and you should either
  /// modify your lifecycle settings or use a different vault. Recovery points
  /// already stored in the vault prior to Vault Lock are not affected.
  final int? minRetentionDays;

  /// The ARN of the MPA approval team associated with this backup vault.
  final String? mpaApprovalTeamArn;

  /// The ARN of the MPA session associated with this backup vault.
  final String? mpaSessionArn;

  /// The number of recovery points that are stored in a backup vault.
  ///
  /// Recovery point count value displayed in the console can be an approximation.
  /// Use <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_ListRecoveryPointsByBackupVault.html">
  /// <code>ListRecoveryPointsByBackupVault</code> </a> API to obtain the exact
  /// count.
  final int? numberOfRecoveryPoints;

  /// The ARN of the source backup vault from which this restore access backup
  /// vault was created.
  final String? sourceBackupVaultArn;

  /// The current state of the vault.->
  final VaultState? vaultState;

  /// The type of vault described.
  final VaultType? vaultType;

  DescribeBackupVaultOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.encryptionKeyType,
    this.latestMpaApprovalTeamUpdate,
    this.lockDate,
    this.locked,
    this.maxRetentionDays,
    this.minRetentionDays,
    this.mpaApprovalTeamArn,
    this.mpaSessionArn,
    this.numberOfRecoveryPoints,
    this.sourceBackupVaultArn,
    this.vaultState,
    this.vaultType,
  });

  factory DescribeBackupVaultOutput.fromJson(Map<String, dynamic> json) {
    return DescribeBackupVaultOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      encryptionKeyType: (json['EncryptionKeyType'] as String?)
          ?.let(EncryptionKeyType.fromString),
      latestMpaApprovalTeamUpdate: json['LatestMpaApprovalTeamUpdate'] != null
          ? LatestMpaApprovalTeamUpdate.fromJson(
              json['LatestMpaApprovalTeamUpdate'] as Map<String, dynamic>)
          : null,
      lockDate: timeStampFromJson(json['LockDate']),
      locked: json['Locked'] as bool?,
      maxRetentionDays: json['MaxRetentionDays'] as int?,
      minRetentionDays: json['MinRetentionDays'] as int?,
      mpaApprovalTeamArn: json['MpaApprovalTeamArn'] as String?,
      mpaSessionArn: json['MpaSessionArn'] as String?,
      numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int?,
      sourceBackupVaultArn: json['SourceBackupVaultArn'] as String?,
      vaultState: (json['VaultState'] as String?)?.let(VaultState.fromString),
      vaultType: (json['VaultType'] as String?)?.let(VaultType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionKeyType = this.encryptionKeyType;
    final latestMpaApprovalTeamUpdate = this.latestMpaApprovalTeamUpdate;
    final lockDate = this.lockDate;
    final locked = this.locked;
    final maxRetentionDays = this.maxRetentionDays;
    final minRetentionDays = this.minRetentionDays;
    final mpaApprovalTeamArn = this.mpaApprovalTeamArn;
    final mpaSessionArn = this.mpaSessionArn;
    final numberOfRecoveryPoints = this.numberOfRecoveryPoints;
    final sourceBackupVaultArn = this.sourceBackupVaultArn;
    final vaultState = this.vaultState;
    final vaultType = this.vaultType;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionKeyType != null)
        'EncryptionKeyType': encryptionKeyType.value,
      if (latestMpaApprovalTeamUpdate != null)
        'LatestMpaApprovalTeamUpdate': latestMpaApprovalTeamUpdate,
      if (lockDate != null) 'LockDate': unixTimestampToJson(lockDate),
      if (locked != null) 'Locked': locked,
      if (maxRetentionDays != null) 'MaxRetentionDays': maxRetentionDays,
      if (minRetentionDays != null) 'MinRetentionDays': minRetentionDays,
      if (mpaApprovalTeamArn != null) 'MpaApprovalTeamArn': mpaApprovalTeamArn,
      if (mpaSessionArn != null) 'MpaSessionArn': mpaSessionArn,
      if (numberOfRecoveryPoints != null)
        'NumberOfRecoveryPoints': numberOfRecoveryPoints,
      if (sourceBackupVaultArn != null)
        'SourceBackupVaultArn': sourceBackupVaultArn,
      if (vaultState != null) 'VaultState': vaultState.value,
      if (vaultType != null) 'VaultType': vaultType.value,
    };
  }
}

class DescribeCopyJobOutput {
  /// Contains detailed information about a copy job.
  final CopyJob? copyJob;

  DescribeCopyJobOutput({
    this.copyJob,
  });

  factory DescribeCopyJobOutput.fromJson(Map<String, dynamic> json) {
    return DescribeCopyJobOutput(
      copyJob: json['CopyJob'] != null
          ? CopyJob.fromJson(json['CopyJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final copyJob = this.copyJob;
    return {
      if (copyJob != null) 'CopyJob': copyJob,
    };
  }
}

class DescribeFrameworkOutput {
  /// The date and time that a framework is created, in ISO 8601 representation.
  /// The value of <code>CreationTime</code> is accurate to milliseconds. For
  /// example, 2020-07-10T15:00:00.000-08:00 represents the 10th of July 2020 at
  /// 3:00 PM 8 hours behind UTC.
  final DateTime? creationTime;

  /// The deployment status of a framework. The statuses are:
  ///
  /// <code>CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS | DELETE_IN_PROGRESS |
  /// COMPLETED | FAILED</code>
  final String? deploymentStatus;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? frameworkArn;

  /// The controls that make up the framework. Each control in the list has a
  /// name, input parameters, and scope.
  final List<FrameworkControl>? frameworkControls;

  /// An optional description of the framework.
  final String? frameworkDescription;

  /// The unique name of a framework.
  final String? frameworkName;

  /// A framework consists of one or more controls. Each control governs a
  /// resource, such as backup plans, backup selections, backup vaults, or
  /// recovery points. You can also turn Config recording on or off for each
  /// resource. The statuses are:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code> when recording is turned on for all resources governed
  /// by the framework.
  /// </li>
  /// <li>
  /// <code>PARTIALLY_ACTIVE</code> when recording is turned off for at least one
  /// resource governed by the framework.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code> when recording is turned off for all resources
  /// governed by the framework.
  /// </li>
  /// <li>
  /// <code>UNAVAILABLE</code> when Backup is unable to validate recording status
  /// at this time.
  /// </li>
  /// </ul>
  final String? frameworkStatus;

  /// A customer-chosen string that you can use to distinguish between otherwise
  /// identical calls to <code>DescribeFrameworkOutput</code>. Retrying a
  /// successful request with the same idempotency token results in a success
  /// message with no action taken.
  final String? idempotencyToken;

  DescribeFrameworkOutput({
    this.creationTime,
    this.deploymentStatus,
    this.frameworkArn,
    this.frameworkControls,
    this.frameworkDescription,
    this.frameworkName,
    this.frameworkStatus,
    this.idempotencyToken,
  });

  factory DescribeFrameworkOutput.fromJson(Map<String, dynamic> json) {
    return DescribeFrameworkOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      deploymentStatus: json['DeploymentStatus'] as String?,
      frameworkArn: json['FrameworkArn'] as String?,
      frameworkControls: (json['FrameworkControls'] as List?)
          ?.nonNulls
          .map((e) => FrameworkControl.fromJson(e as Map<String, dynamic>))
          .toList(),
      frameworkDescription: json['FrameworkDescription'] as String?,
      frameworkName: json['FrameworkName'] as String?,
      frameworkStatus: json['FrameworkStatus'] as String?,
      idempotencyToken: json['IdempotencyToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final deploymentStatus = this.deploymentStatus;
    final frameworkArn = this.frameworkArn;
    final frameworkControls = this.frameworkControls;
    final frameworkDescription = this.frameworkDescription;
    final frameworkName = this.frameworkName;
    final frameworkStatus = this.frameworkStatus;
    final idempotencyToken = this.idempotencyToken;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (deploymentStatus != null) 'DeploymentStatus': deploymentStatus,
      if (frameworkArn != null) 'FrameworkArn': frameworkArn,
      if (frameworkControls != null) 'FrameworkControls': frameworkControls,
      if (frameworkDescription != null)
        'FrameworkDescription': frameworkDescription,
      if (frameworkName != null) 'FrameworkName': frameworkName,
      if (frameworkStatus != null) 'FrameworkStatus': frameworkStatus,
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
    };
  }
}

class DescribeGlobalSettingsOutput {
  /// The status of the flags <code>isCrossAccountBackupEnabled</code>,
  /// <code>isMpaEnabled</code> ('Mpa' refers to multi-party approval), and
  /// <code>isDelegatedAdministratorEnabled</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>isCrossAccountBackupEnabled</code>: Allow accounts in your
  /// organization to copy backups to other accounts.
  /// </li>
  /// <li>
  /// <code>isMpaEnabled</code>: Add cross-account access to your organization
  /// with the option to assign a Multi-party approval team to a logically
  /// air-gapped vault.
  /// </li>
  /// <li>
  /// <code>isDelegatedAdministratorEnabled</code>: Allow Backup to automatically
  /// synchronize delegated administrator permissions with Organizations.
  /// </li>
  /// </ul>
  final Map<String, String>? globalSettings;

  /// The date and time that the supported flags were last updated. This update is
  /// in Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>LastUpdateTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastUpdateTime;

  DescribeGlobalSettingsOutput({
    this.globalSettings,
    this.lastUpdateTime,
  });

  factory DescribeGlobalSettingsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeGlobalSettingsOutput(
      globalSettings: (json['GlobalSettings'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final globalSettings = this.globalSettings;
    final lastUpdateTime = this.lastUpdateTime;
    return {
      if (globalSettings != null) 'GlobalSettings': globalSettings,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
    };
  }
}

class DescribeProtectedResourceOutput {
  /// The date and time that a resource was last backed up, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastBackupTime;

  /// The ARN (Amazon Resource Name) of the backup vault that contains the most
  /// recent backup recovery point.
  final String? lastBackupVaultArn;

  /// The ARN (Amazon Resource Name) of the most recent recovery point.
  final String? lastRecoveryPointArn;

  /// The time, in minutes, that the most recent restore job took to complete.
  final int? latestRestoreExecutionTimeMinutes;

  /// The creation date of the most recent restore job.
  final DateTime? latestRestoreJobCreationDate;

  /// The date the most recent recovery point was created.
  final DateTime? latestRestoreRecoveryPointCreationDate;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// The name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource saved as a recovery point; for
  /// example, an Amazon EBS volume or an Amazon RDS database.
  final String? resourceType;

  DescribeProtectedResourceOutput({
    this.lastBackupTime,
    this.lastBackupVaultArn,
    this.lastRecoveryPointArn,
    this.latestRestoreExecutionTimeMinutes,
    this.latestRestoreJobCreationDate,
    this.latestRestoreRecoveryPointCreationDate,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
  });

  factory DescribeProtectedResourceOutput.fromJson(Map<String, dynamic> json) {
    return DescribeProtectedResourceOutput(
      lastBackupTime: timeStampFromJson(json['LastBackupTime']),
      lastBackupVaultArn: json['LastBackupVaultArn'] as String?,
      lastRecoveryPointArn: json['LastRecoveryPointArn'] as String?,
      latestRestoreExecutionTimeMinutes:
          json['LatestRestoreExecutionTimeMinutes'] as int?,
      latestRestoreJobCreationDate:
          timeStampFromJson(json['LatestRestoreJobCreationDate']),
      latestRestoreRecoveryPointCreationDate:
          timeStampFromJson(json['LatestRestoreRecoveryPointCreationDate']),
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastBackupTime = this.lastBackupTime;
    final lastBackupVaultArn = this.lastBackupVaultArn;
    final lastRecoveryPointArn = this.lastRecoveryPointArn;
    final latestRestoreExecutionTimeMinutes =
        this.latestRestoreExecutionTimeMinutes;
    final latestRestoreJobCreationDate = this.latestRestoreJobCreationDate;
    final latestRestoreRecoveryPointCreationDate =
        this.latestRestoreRecoveryPointCreationDate;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    return {
      if (lastBackupTime != null)
        'LastBackupTime': unixTimestampToJson(lastBackupTime),
      if (lastBackupVaultArn != null) 'LastBackupVaultArn': lastBackupVaultArn,
      if (lastRecoveryPointArn != null)
        'LastRecoveryPointArn': lastRecoveryPointArn,
      if (latestRestoreExecutionTimeMinutes != null)
        'LatestRestoreExecutionTimeMinutes': latestRestoreExecutionTimeMinutes,
      if (latestRestoreJobCreationDate != null)
        'LatestRestoreJobCreationDate':
            unixTimestampToJson(latestRestoreJobCreationDate),
      if (latestRestoreRecoveryPointCreationDate != null)
        'LatestRestoreRecoveryPointCreationDate':
            unixTimestampToJson(latestRestoreRecoveryPointCreationDate),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

class DescribeRecoveryPointOutput {
  /// The size, in bytes, of a backup.
  final int? backupSizeInBytes;

  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created.
  final String? backupVaultName;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  final CalculatedLifecycle? calculatedLifecycle;

  /// The date and time that a job to create a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// The identifier of a resource within a composite group, such as nested
  /// (child) recovery point belonging to a composite (parent) stack. The ID is
  /// transferred from the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resources-section-structure.html#resources-section-structure-syntax">
  /// logical ID</a> within a stack.
  final String? compositeMemberIdentifier;

  /// Contains identifying information about the creation of a recovery point,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan used to create it.
  final RecoveryPointCreator? createdBy;

  /// The date and time that a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// The server-side encryption key used to protect your backups; for example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  final String? encryptionKeyArn;

  /// The type of encryption key used for the recovery point. Valid values are
  /// CUSTOMER_MANAGED_KMS_KEY for customer-managed keys or Amazon Web
  /// Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
  final EncryptionKeyType? encryptionKeyType;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// This is the current status for the backup index associated with the
  /// specified recovery point.
  ///
  /// Statuses are: <code>PENDING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code> | <code>DELETING</code>
  ///
  /// A recovery point with an index that has the status of <code>ACTIVE</code>
  /// can be included in a search.
  final IndexStatus? indexStatus;

  /// A string in the form of a detailed message explaining the status of a backup
  /// index associated with the recovery point.
  final String? indexStatusMessage;

  /// The date and time when the backup job that created this recovery point was
  /// initiated, in Unix format and Coordinated Universal Time (UTC).
  final DateTime? initiationDate;

  /// A Boolean value that is returned as <code>TRUE</code> if the specified
  /// recovery point is encrypted, or <code>FALSE</code> if the recovery point is
  /// not encrypted.
  final bool? isEncrypted;

  /// This returns the boolean value that a recovery point is a parent (composite)
  /// job.
  final bool? isParent;

  /// The date and time that a recovery point was last restored, in Unix format
  /// and Coordinated Universal Time (UTC). The value of
  /// <code>LastRestoreTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastRestoreTime;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups that are transitioned to cold storage must be stored in cold storage
  /// for a minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  ///
  /// Resource types that can transition to cold storage are listed in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table. Backup ignores this expression for other
  /// resource types.
  final Lifecycle? lifecycle;

  /// This is an ARN that uniquely identifies a parent (composite) recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? parentRecoveryPointArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  final String? resourceArn;

  /// The name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource to save as a recovery point; for
  /// example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon
  /// Relational Database Service (Amazon RDS) database.
  final String? resourceType;

  /// Contains the latest scanning results against the recovery point and
  /// currently include <code>MalwareScanner</code>, <code>ScanJobState</code>,
  /// <code>Findings</code>, and <code>LastScanTimestamp</code>
  final List<ScanResult>? scanResults;

  /// An Amazon Resource Name (ARN) that uniquely identifies the source vault
  /// where the resource was originally backed up in; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  /// If the recovery is restored to the same Amazon Web Services account or
  /// Region, this value will be <code>null</code>.
  final String? sourceBackupVaultArn;

  /// A status code specifying the state of the recovery point. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/applicationstackbackups.html#cfnrecoverypointstatus">
  /// Recovery point status</a> in the <i>Backup Developer Guide</i>.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> status indicates that an Backup job has been initiated
  /// for a resource. The backup process has started and is actively processing a
  /// backup job for the associated recovery point.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> status indicates that the backup was successfully
  /// created for the recovery point. The backup process has completed without any
  /// issues, and the recovery point is now ready for use.
  /// </li>
  /// <li>
  /// <code>PARTIAL</code> status indicates a composite recovery point has one or
  /// more nested recovery points that were not in the backup.
  /// </li>
  /// <li>
  /// <code>EXPIRED</code> status indicates that the recovery point has exceeded
  /// its retention period, but Backup lacks permission or is otherwise unable to
  /// delete it. To manually delete these recovery points, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/gs-cleanup-resources.html#cleanup-backups">
  /// Step 3: Delete the recovery points</a> in the <i>Clean up resources</i>
  /// section of <i>Getting started</i>.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> status occurs on a continuous backup where a user has
  /// taken some action that causes the continuous backup to be disabled. This can
  /// be caused by the removal of permissions, turning off versioning, turning off
  /// events being sent to EventBridge, or disabling the EventBridge rules that
  /// are put in place by Backup. For recovery points of Amazon S3, Amazon RDS,
  /// and Amazon Aurora resources, this status occurs when the retention period of
  /// a continuous backup rule is changed.
  ///
  /// To resolve <code>STOPPED</code> status, ensure that all requested
  /// permissions are in place and that versioning is enabled on the S3 bucket.
  /// Once these conditions are met, the next instance of a backup rule running
  /// will result in a new continuous recovery point being created. The recovery
  /// points with STOPPED status do not need to be deleted.
  ///
  /// For SAP HANA on Amazon EC2 <code>STOPPED</code> status occurs due to user
  /// action, application misconfiguration, or backup failure. To ensure that
  /// future continuous backups succeed, refer to the recovery point status and
  /// check SAP HANA for details.
  /// </li>
  /// </ul>
  final RecoveryPointStatus? status;

  /// A status message explaining the status of the recovery point.
  final String? statusMessage;

  /// Specifies the storage class of the recovery point. Valid values are
  /// <code>WARM</code> or <code>COLD</code>.
  final StorageClass? storageClass;

  /// The type of vault in which the described recovery point is stored.
  final VaultType? vaultType;

  DescribeRecoveryPointOutput({
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.calculatedLifecycle,
    this.completionDate,
    this.compositeMemberIdentifier,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.encryptionKeyType,
    this.iamRoleArn,
    this.indexStatus,
    this.indexStatusMessage,
    this.initiationDate,
    this.isEncrypted,
    this.isParent,
    this.lastRestoreTime,
    this.lifecycle,
    this.parentRecoveryPointArn,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
    this.scanResults,
    this.sourceBackupVaultArn,
    this.status,
    this.statusMessage,
    this.storageClass,
    this.vaultType,
  });

  factory DescribeRecoveryPointOutput.fromJson(Map<String, dynamic> json) {
    return DescribeRecoveryPointOutput(
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      calculatedLifecycle: json['CalculatedLifecycle'] != null
          ? CalculatedLifecycle.fromJson(
              json['CalculatedLifecycle'] as Map<String, dynamic>)
          : null,
      completionDate: timeStampFromJson(json['CompletionDate']),
      compositeMemberIdentifier: json['CompositeMemberIdentifier'] as String?,
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      encryptionKeyType: (json['EncryptionKeyType'] as String?)
          ?.let(EncryptionKeyType.fromString),
      iamRoleArn: json['IamRoleArn'] as String?,
      indexStatus:
          (json['IndexStatus'] as String?)?.let(IndexStatus.fromString),
      indexStatusMessage: json['IndexStatusMessage'] as String?,
      initiationDate: timeStampFromJson(json['InitiationDate']),
      isEncrypted: json['IsEncrypted'] as bool?,
      isParent: json['IsParent'] as bool?,
      lastRestoreTime: timeStampFromJson(json['LastRestoreTime']),
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      parentRecoveryPointArn: json['ParentRecoveryPointArn'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
      scanResults: (json['ScanResults'] as List?)
          ?.nonNulls
          .map((e) => ScanResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceBackupVaultArn: json['SourceBackupVaultArn'] as String?,
      status: (json['Status'] as String?)?.let(RecoveryPointStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      storageClass:
          (json['StorageClass'] as String?)?.let(StorageClass.fromString),
      vaultType: (json['VaultType'] as String?)?.let(VaultType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final calculatedLifecycle = this.calculatedLifecycle;
    final completionDate = this.completionDate;
    final compositeMemberIdentifier = this.compositeMemberIdentifier;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionKeyType = this.encryptionKeyType;
    final iamRoleArn = this.iamRoleArn;
    final indexStatus = this.indexStatus;
    final indexStatusMessage = this.indexStatusMessage;
    final initiationDate = this.initiationDate;
    final isEncrypted = this.isEncrypted;
    final isParent = this.isParent;
    final lastRestoreTime = this.lastRestoreTime;
    final lifecycle = this.lifecycle;
    final parentRecoveryPointArn = this.parentRecoveryPointArn;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final scanResults = this.scanResults;
    final sourceBackupVaultArn = this.sourceBackupVaultArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final storageClass = this.storageClass;
    final vaultType = this.vaultType;
    return {
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (calculatedLifecycle != null)
        'CalculatedLifecycle': calculatedLifecycle,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (compositeMemberIdentifier != null)
        'CompositeMemberIdentifier': compositeMemberIdentifier,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionKeyType != null)
        'EncryptionKeyType': encryptionKeyType.value,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (indexStatus != null) 'IndexStatus': indexStatus.value,
      if (indexStatusMessage != null) 'IndexStatusMessage': indexStatusMessage,
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (isEncrypted != null) 'IsEncrypted': isEncrypted,
      if (isParent != null) 'IsParent': isParent,
      if (lastRestoreTime != null)
        'LastRestoreTime': unixTimestampToJson(lastRestoreTime),
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (parentRecoveryPointArn != null)
        'ParentRecoveryPointArn': parentRecoveryPointArn,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (scanResults != null) 'ScanResults': scanResults,
      if (sourceBackupVaultArn != null)
        'SourceBackupVaultArn': sourceBackupVaultArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (storageClass != null) 'StorageClass': storageClass.value,
      if (vaultType != null) 'VaultType': vaultType.value,
    };
  }
}

class DescribeRegionSettingsOutput {
  /// Returns whether Backup fully manages the backups for a resource type.
  ///
  /// For the benefits of full Backup management, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#full-management">Full
  /// Backup management</a>.
  ///
  /// For a list of resource types and whether each supports full Backup
  /// management, see the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table.
  ///
  /// If <code>"DynamoDB":false</code>, you can enable full Backup management for
  /// DynamoDB backup by enabling <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/advanced-ddb-backup.html#advanced-ddb-backup-enable-cli">
  /// Backup's advanced DynamoDB backup features</a>.
  final Map<String, bool>? resourceTypeManagementPreference;

  /// The services along with the opt-in preferences in the Region.
  final Map<String, bool>? resourceTypeOptInPreference;

  DescribeRegionSettingsOutput({
    this.resourceTypeManagementPreference,
    this.resourceTypeOptInPreference,
  });

  factory DescribeRegionSettingsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeRegionSettingsOutput(
      resourceTypeManagementPreference:
          (json['ResourceTypeManagementPreference'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as bool)),
      resourceTypeOptInPreference:
          (json['ResourceTypeOptInPreference'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as bool)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTypeManagementPreference =
        this.resourceTypeManagementPreference;
    final resourceTypeOptInPreference = this.resourceTypeOptInPreference;
    return {
      if (resourceTypeManagementPreference != null)
        'ResourceTypeManagementPreference': resourceTypeManagementPreference,
      if (resourceTypeOptInPreference != null)
        'ResourceTypeOptInPreference': resourceTypeOptInPreference,
    };
  }
}

class DescribeReportJobOutput {
  /// The information about a report job, including its completion and creation
  /// times, report destination, unique report job ID, Amazon Resource Name (ARN),
  /// report template, status, and status message.
  final ReportJob? reportJob;

  DescribeReportJobOutput({
    this.reportJob,
  });

  factory DescribeReportJobOutput.fromJson(Map<String, dynamic> json) {
    return DescribeReportJobOutput(
      reportJob: json['ReportJob'] != null
          ? ReportJob.fromJson(json['ReportJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reportJob = this.reportJob;
    return {
      if (reportJob != null) 'ReportJob': reportJob,
    };
  }
}

class DescribeReportPlanOutput {
  /// Returns details about the report plan that is specified by its name. These
  /// details include the report plan's Amazon Resource Name (ARN), description,
  /// settings, delivery channel, deployment status, creation time, and last
  /// attempted and successful run times.
  final ReportPlan? reportPlan;

  DescribeReportPlanOutput({
    this.reportPlan,
  });

  factory DescribeReportPlanOutput.fromJson(Map<String, dynamic> json) {
    return DescribeReportPlanOutput(
      reportPlan: json['ReportPlan'] != null
          ? ReportPlan.fromJson(json['ReportPlan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reportPlan = this.reportPlan;
    return {
      if (reportPlan != null) 'ReportPlan': reportPlan,
    };
  }
}

class DescribeRestoreJobOutput {
  /// Returns the account ID that owns the restore job.
  final String? accountId;

  /// The size, in bytes, of the restored resource.
  final int? backupSizeInBytes;

  /// The Amazon Resource Name (ARN) of the backup vault containing the recovery
  /// point being restored. This helps identify vault access policies and
  /// permissions.
  final String? backupVaultArn;

  /// The date and time that a job to restore a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// Contains identifying information about the creation of a restore job.
  final RestoreJobCreator? createdBy;

  /// The Amazon Resource Name (ARN) of the resource that was created by the
  /// restore job.
  ///
  /// The format of the ARN depends on the resource type of the backed-up
  /// resource.
  final String? createdResourceArn;

  /// The date and time that a restore job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// The status of the data generated by the restore test.
  final RestoreDeletionStatus? deletionStatus;

  /// This describes the restore job deletion status.
  final String? deletionStatusMessage;

  /// The amount of time in minutes that a job restoring a recovery point is
  /// expected to take.
  final int? expectedCompletionTimeMinutes;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// This is a boolean value indicating whether the restore job is a parent
  /// (composite) restore job.
  final bool? isParent;

  /// This is the unique identifier of the parent restore job for the selected
  /// restore job.
  final String? parentJobId;

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  final String? percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// The creation date of the recovery point made by the specifed restore job.
  final DateTime? recoveryPointCreationDate;

  /// Returns metadata associated with a restore job listed by resource type.
  final String? resourceType;

  /// Uniquely identifies the job that restores a recovery point.
  final String? restoreJobId;

  /// The Amazon Resource Name (ARN) of the original resource that was backed up.
  /// This provides context about what resource is being restored.
  final String? sourceResourceArn;

  /// Status code specifying the state of the job that is initiated by Backup to
  /// restore a recovery point.
  final RestoreJobStatus? status;

  /// A message showing the status of a job to restore a recovery point.
  final String? statusMessage;

  /// The status of validation run on the indicated restore job.
  final RestoreValidationStatus? validationStatus;

  /// The status message.
  final String? validationStatusMessage;

  DescribeRestoreJobOutput({
    this.accountId,
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.completionDate,
    this.createdBy,
    this.createdResourceArn,
    this.creationDate,
    this.deletionStatus,
    this.deletionStatusMessage,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.isParent,
    this.parentJobId,
    this.percentDone,
    this.recoveryPointArn,
    this.recoveryPointCreationDate,
    this.resourceType,
    this.restoreJobId,
    this.sourceResourceArn,
    this.status,
    this.statusMessage,
    this.validationStatus,
    this.validationStatusMessage,
  });

  factory DescribeRestoreJobOutput.fromJson(Map<String, dynamic> json) {
    return DescribeRestoreJobOutput(
      accountId: json['AccountId'] as String?,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      backupVaultArn: json['BackupVaultArn'] as String?,
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RestoreJobCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdResourceArn: json['CreatedResourceArn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      deletionStatus: (json['DeletionStatus'] as String?)
          ?.let(RestoreDeletionStatus.fromString),
      deletionStatusMessage: json['DeletionStatusMessage'] as String?,
      expectedCompletionTimeMinutes:
          json['ExpectedCompletionTimeMinutes'] as int?,
      iamRoleArn: json['IamRoleArn'] as String?,
      isParent: json['IsParent'] as bool?,
      parentJobId: json['ParentJobId'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      recoveryPointCreationDate:
          timeStampFromJson(json['RecoveryPointCreationDate']),
      resourceType: json['ResourceType'] as String?,
      restoreJobId: json['RestoreJobId'] as String?,
      sourceResourceArn: json['SourceResourceArn'] as String?,
      status: (json['Status'] as String?)?.let(RestoreJobStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      validationStatus: (json['ValidationStatus'] as String?)
          ?.let(RestoreValidationStatus.fromString),
      validationStatusMessage: json['ValidationStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupVaultArn = this.backupVaultArn;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final createdResourceArn = this.createdResourceArn;
    final creationDate = this.creationDate;
    final deletionStatus = this.deletionStatus;
    final deletionStatusMessage = this.deletionStatusMessage;
    final expectedCompletionTimeMinutes = this.expectedCompletionTimeMinutes;
    final iamRoleArn = this.iamRoleArn;
    final isParent = this.isParent;
    final parentJobId = this.parentJobId;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final recoveryPointCreationDate = this.recoveryPointCreationDate;
    final resourceType = this.resourceType;
    final restoreJobId = this.restoreJobId;
    final sourceResourceArn = this.sourceResourceArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final validationStatus = this.validationStatus;
    final validationStatusMessage = this.validationStatusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdResourceArn != null) 'CreatedResourceArn': createdResourceArn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (deletionStatus != null) 'DeletionStatus': deletionStatus.value,
      if (deletionStatusMessage != null)
        'DeletionStatusMessage': deletionStatusMessage,
      if (expectedCompletionTimeMinutes != null)
        'ExpectedCompletionTimeMinutes': expectedCompletionTimeMinutes,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (isParent != null) 'IsParent': isParent,
      if (parentJobId != null) 'ParentJobId': parentJobId,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (recoveryPointCreationDate != null)
        'RecoveryPointCreationDate':
            unixTimestampToJson(recoveryPointCreationDate),
      if (resourceType != null) 'ResourceType': resourceType,
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (validationStatus != null) 'ValidationStatus': validationStatus.value,
      if (validationStatusMessage != null)
        'ValidationStatusMessage': validationStatusMessage,
    };
  }
}

class DescribeScanJobOutput {
  /// Returns the account ID that owns the scan job.
  ///
  /// Pattern: <code>^[0-9]{12}$</code>
  final String accountId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  ///
  /// Pattern: <code>^[a-zA-Z0-9\-\_\.]{2,50}$</code>
  final String backupVaultName;
  final ScanJobCreator createdBy;

  /// The date and time that a backup index finished creation, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The scanning engine used for the corresponding scan job. Currently only
  /// <code>GUARDUTY</code> is supported.
  final MalwareScanner malwareScanner;

  /// An ARN that uniquely identifies the target recovery point for scanning.; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String recoveryPointArn;

  /// An ARN that uniquely identifies the source resource of the corresponding
  /// recovery point ARN.
  final String resourceArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String resourceName;

  /// The type of Amazon Web Services Resource to be backed up; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume.
  ///
  /// Pattern: <code>^[a-zA-Z0-9\-\_\.]{1,50}$</code>
  final ScanResourceType resourceType;

  /// The scan job ID that uniquely identified the request to Backup.
  final String scanJobId;

  /// Specifies the scan type used for the scan job.
  final ScanMode scanMode;

  /// Specifies the scanner IAM role ARN used to for the scan job.
  final String scannerRoleArn;

  /// The current state of a scan job.
  final ScanState state;

  /// The date and time that a backup index finished creation, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CompletionDate</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// The point in time the scan job scanned up to for a continuous backup.
  final DateTime? continuousScanEndTime;

  /// The point in time the scan job started scan from for a continuous backup.
  final DateTime? continuousScanStartTime;

  /// An ARN that uniquely identifies the base recovery point for scanning. This
  /// field will only be populated when an incremental scan job has taken place.
  final String? scanBaseRecoveryPointArn;

  /// The scan ID generated by Amazon GuardDuty for the corresponding Scan Job ID
  /// request from Backup.
  final String? scanId;

  /// Contains the <code>ScanResultsStatus</code> for the scanning job and returns
  /// <code>THREATS_FOUND</code> or <code>NO_THREATS_FOUND</code> for completed
  /// jobs.
  final ScanResultInfo? scanResult;

  /// A detailed message explaining the status of the job to back up a resource.
  final String? statusMessage;

  DescribeScanJobOutput({
    required this.accountId,
    required this.backupVaultArn,
    required this.backupVaultName,
    required this.createdBy,
    required this.creationDate,
    required this.iamRoleArn,
    required this.malwareScanner,
    required this.recoveryPointArn,
    required this.resourceArn,
    required this.resourceName,
    required this.resourceType,
    required this.scanJobId,
    required this.scanMode,
    required this.scannerRoleArn,
    required this.state,
    this.completionDate,
    this.continuousScanEndTime,
    this.continuousScanStartTime,
    this.scanBaseRecoveryPointArn,
    this.scanId,
    this.scanResult,
    this.statusMessage,
  });

  factory DescribeScanJobOutput.fromJson(Map<String, dynamic> json) {
    return DescribeScanJobOutput(
      accountId: (json['AccountId'] as String?) ?? '',
      backupVaultArn: (json['BackupVaultArn'] as String?) ?? '',
      backupVaultName: (json['BackupVaultName'] as String?) ?? '',
      createdBy: ScanJobCreator.fromJson(
          (json['CreatedBy'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creationDate: nonNullableTimeStampFromJson(json['CreationDate'] ?? 0),
      iamRoleArn: (json['IamRoleArn'] as String?) ?? '',
      malwareScanner:
          MalwareScanner.fromString((json['MalwareScanner'] as String?) ?? ''),
      recoveryPointArn: (json['RecoveryPointArn'] as String?) ?? '',
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      resourceName: (json['ResourceName'] as String?) ?? '',
      resourceType:
          ScanResourceType.fromString((json['ResourceType'] as String?) ?? ''),
      scanJobId: (json['ScanJobId'] as String?) ?? '',
      scanMode: ScanMode.fromString((json['ScanMode'] as String?) ?? ''),
      scannerRoleArn: (json['ScannerRoleArn'] as String?) ?? '',
      state: ScanState.fromString((json['State'] as String?) ?? ''),
      completionDate: timeStampFromJson(json['CompletionDate']),
      continuousScanEndTime: timeStampFromJson(json['ContinuousScanEndTime']),
      continuousScanStartTime:
          timeStampFromJson(json['ContinuousScanStartTime']),
      scanBaseRecoveryPointArn: json['ScanBaseRecoveryPointArn'] as String?,
      scanId: json['ScanId'] as String?,
      scanResult: json['ScanResult'] != null
          ? ScanResultInfo.fromJson(json['ScanResult'] as Map<String, dynamic>)
          : null,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final iamRoleArn = this.iamRoleArn;
    final malwareScanner = this.malwareScanner;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final scanJobId = this.scanJobId;
    final scanMode = this.scanMode;
    final scannerRoleArn = this.scannerRoleArn;
    final state = this.state;
    final completionDate = this.completionDate;
    final continuousScanEndTime = this.continuousScanEndTime;
    final continuousScanStartTime = this.continuousScanStartTime;
    final scanBaseRecoveryPointArn = this.scanBaseRecoveryPointArn;
    final scanId = this.scanId;
    final scanResult = this.scanResult;
    final statusMessage = this.statusMessage;
    return {
      'AccountId': accountId,
      'BackupVaultArn': backupVaultArn,
      'BackupVaultName': backupVaultName,
      'CreatedBy': createdBy,
      'CreationDate': unixTimestampToJson(creationDate),
      'IamRoleArn': iamRoleArn,
      'MalwareScanner': malwareScanner.value,
      'RecoveryPointArn': recoveryPointArn,
      'ResourceArn': resourceArn,
      'ResourceName': resourceName,
      'ResourceType': resourceType.value,
      'ScanJobId': scanJobId,
      'ScanMode': scanMode.value,
      'ScannerRoleArn': scannerRoleArn,
      'State': state.value,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (continuousScanEndTime != null)
        'ContinuousScanEndTime': unixTimestampToJson(continuousScanEndTime),
      if (continuousScanStartTime != null)
        'ContinuousScanStartTime': unixTimestampToJson(continuousScanStartTime),
      if (scanBaseRecoveryPointArn != null)
        'ScanBaseRecoveryPointArn': scanBaseRecoveryPointArn,
      if (scanId != null) 'ScanId': scanId,
      if (scanResult != null) 'ScanResult': scanResult,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class ExportBackupPlanTemplateOutput {
  /// The body of a backup plan template in JSON format.
  /// <note>
  /// This is a signed JSON document that cannot be modified before being passed
  /// to <code>GetBackupPlanFromJSON.</code>
  /// </note>
  final String? backupPlanTemplateJson;

  ExportBackupPlanTemplateOutput({
    this.backupPlanTemplateJson,
  });

  factory ExportBackupPlanTemplateOutput.fromJson(Map<String, dynamic> json) {
    return ExportBackupPlanTemplateOutput(
      backupPlanTemplateJson: json['BackupPlanTemplateJson'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanTemplateJson = this.backupPlanTemplateJson;
    return {
      if (backupPlanTemplateJson != null)
        'BackupPlanTemplateJson': backupPlanTemplateJson,
    };
  }
}

class GetBackupPlanOutput {
  /// Contains a list of <code>BackupOptions</code> for each resource type. The
  /// list is populated only if the advanced option is set for the backup plan.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  /// Specifies the body of a backup plan. Includes a <code>BackupPlanName</code>
  /// and one or more sets of <code>Rules</code>.
  final BackupPlan? backupPlan;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  final String? backupPlanArn;

  /// Uniquely identifies a backup plan.
  final String? backupPlanId;

  /// The date and time that a backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of running the operation twice.
  final String? creatorRequestId;

  /// The date and time that a backup plan is deleted, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>DeletionDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? deletionDate;

  /// The last time this backup plan was run. A date and time, in Unix format and
  /// Coordinated Universal Time (UTC). The value of
  /// <code>LastExecutionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastExecutionDate;

  /// List of upcoming scheduled backup runs. Only included when
  /// <code>MaxScheduledRunsPreview</code> parameter is greater than 0. Contains
  /// up to 10 future backup executions with their scheduled times, execution
  /// types, and associated rule IDs.
  final List<ScheduledPlanExecutionMember>? scheduledRunsPreview;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version IDs cannot be edited.
  final String? versionId;

  GetBackupPlanOutput({
    this.advancedBackupSettings,
    this.backupPlan,
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.creatorRequestId,
    this.deletionDate,
    this.lastExecutionDate,
    this.scheduledRunsPreview,
    this.versionId,
  });

  factory GetBackupPlanOutput.fromJson(Map<String, dynamic> json) {
    return GetBackupPlanOutput(
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.nonNulls
          .map((e) => AdvancedBackupSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      backupPlan: json['BackupPlan'] != null
          ? BackupPlan.fromJson(json['BackupPlan'] as Map<String, dynamic>)
          : null,
      backupPlanArn: json['BackupPlanArn'] as String?,
      backupPlanId: json['BackupPlanId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      deletionDate: timeStampFromJson(json['DeletionDate']),
      lastExecutionDate: timeStampFromJson(json['LastExecutionDate']),
      scheduledRunsPreview: (json['ScheduledRunsPreview'] as List?)
          ?.nonNulls
          .map((e) =>
              ScheduledPlanExecutionMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedBackupSettings = this.advancedBackupSettings;
    final backupPlan = this.backupPlan;
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final deletionDate = this.deletionDate;
    final lastExecutionDate = this.lastExecutionDate;
    final scheduledRunsPreview = this.scheduledRunsPreview;
    final versionId = this.versionId;
    return {
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
      if (backupPlan != null) 'BackupPlan': backupPlan,
      if (backupPlanArn != null) 'BackupPlanArn': backupPlanArn,
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (deletionDate != null)
        'DeletionDate': unixTimestampToJson(deletionDate),
      if (lastExecutionDate != null)
        'LastExecutionDate': unixTimestampToJson(lastExecutionDate),
      if (scheduledRunsPreview != null)
        'ScheduledRunsPreview': scheduledRunsPreview,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class GetBackupPlanFromJSONOutput {
  /// Specifies the body of a backup plan. Includes a <code>BackupPlanName</code>
  /// and one or more sets of <code>Rules</code>.
  final BackupPlan? backupPlan;

  GetBackupPlanFromJSONOutput({
    this.backupPlan,
  });

  factory GetBackupPlanFromJSONOutput.fromJson(Map<String, dynamic> json) {
    return GetBackupPlanFromJSONOutput(
      backupPlan: json['BackupPlan'] != null
          ? BackupPlan.fromJson(json['BackupPlan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlan = this.backupPlan;
    return {
      if (backupPlan != null) 'BackupPlan': backupPlan,
    };
  }
}

class GetBackupPlanFromTemplateOutput {
  /// Returns the body of a backup plan based on the target template, including
  /// the name, rules, and backup vault of the plan.
  final BackupPlan? backupPlanDocument;

  GetBackupPlanFromTemplateOutput({
    this.backupPlanDocument,
  });

  factory GetBackupPlanFromTemplateOutput.fromJson(Map<String, dynamic> json) {
    return GetBackupPlanFromTemplateOutput(
      backupPlanDocument: json['BackupPlanDocument'] != null
          ? BackupPlan.fromJson(
              json['BackupPlanDocument'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanDocument = this.backupPlanDocument;
    return {
      if (backupPlanDocument != null) 'BackupPlanDocument': backupPlanDocument,
    };
  }
}

class GetBackupSelectionOutput {
  /// Uniquely identifies a backup plan.
  final String? backupPlanId;

  /// Specifies the body of a request to assign a set of resources to a backup
  /// plan.
  final BackupSelection? backupSelection;

  /// The date and time a backup selection is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of running the operation twice.
  final String? creatorRequestId;

  /// Uniquely identifies the body of a request to assign a set of resources to a
  /// backup plan.
  final String? selectionId;

  GetBackupSelectionOutput({
    this.backupPlanId,
    this.backupSelection,
    this.creationDate,
    this.creatorRequestId,
    this.selectionId,
  });

  factory GetBackupSelectionOutput.fromJson(Map<String, dynamic> json) {
    return GetBackupSelectionOutput(
      backupPlanId: json['BackupPlanId'] as String?,
      backupSelection: json['BackupSelection'] != null
          ? BackupSelection.fromJson(
              json['BackupSelection'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      selectionId: json['SelectionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanId = this.backupPlanId;
    final backupSelection = this.backupSelection;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final selectionId = this.selectionId;
    return {
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (backupSelection != null) 'BackupSelection': backupSelection,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (selectionId != null) 'SelectionId': selectionId,
    };
  }
}

class GetBackupVaultAccessPolicyOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created.
  final String? backupVaultName;

  /// The backup vault access policy document in JSON format.
  final String? policy;

  GetBackupVaultAccessPolicyOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.policy,
  });

  factory GetBackupVaultAccessPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetBackupVaultAccessPolicyOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final policy = this.policy;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (policy != null) 'Policy': policy,
    };
  }
}

class GetBackupVaultNotificationsOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// An array of events that indicate the status of jobs to back up resources to
  /// the backup vault.
  final List<BackupVaultEvent>? backupVaultEvents;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created.
  final String? backupVaultName;

  /// An ARN that uniquely identifies an Amazon Simple Notification Service
  /// (Amazon SNS) topic; for example,
  /// <code>arn:aws:sns:us-west-2:111122223333:MyTopic</code>.
  final String? sNSTopicArn;

  GetBackupVaultNotificationsOutput({
    this.backupVaultArn,
    this.backupVaultEvents,
    this.backupVaultName,
    this.sNSTopicArn,
  });

  factory GetBackupVaultNotificationsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetBackupVaultNotificationsOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultEvents: (json['BackupVaultEvents'] as List?)
          ?.nonNulls
          .map((e) => BackupVaultEvent.fromString((e as String)))
          .toList(),
      backupVaultName: json['BackupVaultName'] as String?,
      sNSTopicArn: json['SNSTopicArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultEvents = this.backupVaultEvents;
    final backupVaultName = this.backupVaultName;
    final sNSTopicArn = this.sNSTopicArn;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultEvents != null)
        'BackupVaultEvents': backupVaultEvents.map((e) => e.value).toList(),
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (sNSTopicArn != null) 'SNSTopicArn': sNSTopicArn,
    };
  }
}

class GetLegalHoldOutput {
  /// The reason for removing the legal hold.
  final String? cancelDescription;

  /// The time when the legal hold was cancelled.
  final DateTime? cancellationDate;

  /// The time when the legal hold was created.
  final DateTime? creationDate;

  /// The description of the legal hold.
  final String? description;

  /// The framework ARN for the specified legal hold. The format of the ARN
  /// depends on the resource type.
  final String? legalHoldArn;

  /// The ID of the legal hold.
  final String? legalHoldId;

  /// The criteria to assign a set of resources, such as resource types or backup
  /// vaults.
  final RecoveryPointSelection? recoveryPointSelection;

  /// The date and time until which the legal hold record is retained.
  final DateTime? retainRecordUntil;

  /// The status of the legal hold.
  final LegalHoldStatus? status;

  /// The title of the legal hold.
  final String? title;

  GetLegalHoldOutput({
    this.cancelDescription,
    this.cancellationDate,
    this.creationDate,
    this.description,
    this.legalHoldArn,
    this.legalHoldId,
    this.recoveryPointSelection,
    this.retainRecordUntil,
    this.status,
    this.title,
  });

  factory GetLegalHoldOutput.fromJson(Map<String, dynamic> json) {
    return GetLegalHoldOutput(
      cancelDescription: json['CancelDescription'] as String?,
      cancellationDate: timeStampFromJson(json['CancellationDate']),
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      legalHoldArn: json['LegalHoldArn'] as String?,
      legalHoldId: json['LegalHoldId'] as String?,
      recoveryPointSelection: json['RecoveryPointSelection'] != null
          ? RecoveryPointSelection.fromJson(
              json['RecoveryPointSelection'] as Map<String, dynamic>)
          : null,
      retainRecordUntil: timeStampFromJson(json['RetainRecordUntil']),
      status: (json['Status'] as String?)?.let(LegalHoldStatus.fromString),
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cancelDescription = this.cancelDescription;
    final cancellationDate = this.cancellationDate;
    final creationDate = this.creationDate;
    final description = this.description;
    final legalHoldArn = this.legalHoldArn;
    final legalHoldId = this.legalHoldId;
    final recoveryPointSelection = this.recoveryPointSelection;
    final retainRecordUntil = this.retainRecordUntil;
    final status = this.status;
    final title = this.title;
    return {
      if (cancelDescription != null) 'CancelDescription': cancelDescription,
      if (cancellationDate != null)
        'CancellationDate': unixTimestampToJson(cancellationDate),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (description != null) 'Description': description,
      if (legalHoldArn != null) 'LegalHoldArn': legalHoldArn,
      if (legalHoldId != null) 'LegalHoldId': legalHoldId,
      if (recoveryPointSelection != null)
        'RecoveryPointSelection': recoveryPointSelection,
      if (retainRecordUntil != null)
        'RetainRecordUntil': unixTimestampToJson(retainRecordUntil),
      if (status != null) 'Status': status.value,
      if (title != null) 'Title': title,
    };
  }
}

class GetPITRMalwareScanResultsOutput {
  /// The point in time that was queried. This echoes back the time specified in
  /// the request.
  final DateTime scanEndTime;

  /// Contains the <code>ScanResultStatus</code> for the scan and returns
  /// <code>THREATS_FOUND</code>, <code>NO_THREATS_FOUND</code>, or
  /// <code>UNKNOWN</code>.
  final ScanResultInfo scanResult;

  /// The completion time of the most recent scan job that covered the specified
  /// point in time.
  final DateTime? lastScanJobTime;

  /// The scan ID generated by Amazon GuardDuty for the corresponding Scan Job ID
  /// request from Backup.
  final String? scanId;

  /// Specifies the scan type used for the scan job.
  final ScanMode? scanMode;

  GetPITRMalwareScanResultsOutput({
    required this.scanEndTime,
    required this.scanResult,
    this.lastScanJobTime,
    this.scanId,
    this.scanMode,
  });

  factory GetPITRMalwareScanResultsOutput.fromJson(Map<String, dynamic> json) {
    return GetPITRMalwareScanResultsOutput(
      scanEndTime: nonNullableTimeStampFromJson(json['ScanEndTime'] ?? 0),
      scanResult: ScanResultInfo.fromJson(
          (json['ScanResult'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      lastScanJobTime: timeStampFromJson(json['LastScanJobTime']),
      scanId: json['ScanId'] as String?,
      scanMode: (json['ScanMode'] as String?)?.let(ScanMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final scanEndTime = this.scanEndTime;
    final scanResult = this.scanResult;
    final lastScanJobTime = this.lastScanJobTime;
    final scanId = this.scanId;
    final scanMode = this.scanMode;
    return {
      'ScanEndTime': unixTimestampToJson(scanEndTime),
      'ScanResult': scanResult,
      if (lastScanJobTime != null)
        'LastScanJobTime': unixTimestampToJson(lastScanJobTime),
      if (scanId != null) 'ScanId': scanId,
      if (scanMode != null) 'ScanMode': scanMode.value,
    };
  }
}

class GetRecoveryPointIndexDetailsOutput {
  /// An ARN that uniquely identifies the backup vault where the recovery point
  /// index is stored.
  ///
  /// For example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The date and time that a backup index finished creation, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? indexCompletionDate;

  /// The date and time that a backup index was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? indexCreationDate;

  /// The date and time that a backup index was deleted, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? indexDeletionDate;

  /// This is the current status for the backup index associated with the
  /// specified recovery point.
  ///
  /// Statuses are: <code>PENDING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code> | <code>DELETING</code>
  ///
  /// A recovery point with an index that has the status of <code>ACTIVE</code>
  /// can be included in a search.
  final IndexStatus? indexStatus;

  /// A detailed message explaining the status of a backup index associated with
  /// the recovery point.
  final String? indexStatusMessage;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// A string of the Amazon Resource Name (ARN) that uniquely identifies the
  /// source resource.
  final String? sourceResourceArn;

  /// Count of items within the backup index associated with the recovery point.
  final int? totalItemsIndexed;

  GetRecoveryPointIndexDetailsOutput({
    this.backupVaultArn,
    this.indexCompletionDate,
    this.indexCreationDate,
    this.indexDeletionDate,
    this.indexStatus,
    this.indexStatusMessage,
    this.recoveryPointArn,
    this.sourceResourceArn,
    this.totalItemsIndexed,
  });

  factory GetRecoveryPointIndexDetailsOutput.fromJson(
      Map<String, dynamic> json) {
    return GetRecoveryPointIndexDetailsOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      indexCompletionDate: timeStampFromJson(json['IndexCompletionDate']),
      indexCreationDate: timeStampFromJson(json['IndexCreationDate']),
      indexDeletionDate: timeStampFromJson(json['IndexDeletionDate']),
      indexStatus:
          (json['IndexStatus'] as String?)?.let(IndexStatus.fromString),
      indexStatusMessage: json['IndexStatusMessage'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      sourceResourceArn: json['SourceResourceArn'] as String?,
      totalItemsIndexed: json['TotalItemsIndexed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final indexCompletionDate = this.indexCompletionDate;
    final indexCreationDate = this.indexCreationDate;
    final indexDeletionDate = this.indexDeletionDate;
    final indexStatus = this.indexStatus;
    final indexStatusMessage = this.indexStatusMessage;
    final recoveryPointArn = this.recoveryPointArn;
    final sourceResourceArn = this.sourceResourceArn;
    final totalItemsIndexed = this.totalItemsIndexed;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (indexCompletionDate != null)
        'IndexCompletionDate': unixTimestampToJson(indexCompletionDate),
      if (indexCreationDate != null)
        'IndexCreationDate': unixTimestampToJson(indexCreationDate),
      if (indexDeletionDate != null)
        'IndexDeletionDate': unixTimestampToJson(indexDeletionDate),
      if (indexStatus != null) 'IndexStatus': indexStatus.value,
      if (indexStatusMessage != null) 'IndexStatusMessage': indexStatusMessage,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
      if (totalItemsIndexed != null) 'TotalItemsIndexed': totalItemsIndexed,
    };
  }
}

class GetRecoveryPointRestoreMetadataOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// The resource type of the recovery point.
  final String? resourceType;

  /// The set of metadata key-value pairs that describe the original configuration
  /// of the backed-up resource. These values vary depending on the service that
  /// is being restored.
  final Map<String, String>? restoreMetadata;

  GetRecoveryPointRestoreMetadataOutput({
    this.backupVaultArn,
    this.recoveryPointArn,
    this.resourceType,
    this.restoreMetadata,
  });

  factory GetRecoveryPointRestoreMetadataOutput.fromJson(
      Map<String, dynamic> json) {
    return GetRecoveryPointRestoreMetadataOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceType: json['ResourceType'] as String?,
      restoreMetadata: (json['RestoreMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceType = this.resourceType;
    final restoreMetadata = this.restoreMetadata;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceType != null) 'ResourceType': resourceType,
      if (restoreMetadata != null) 'RestoreMetadata': restoreMetadata,
    };
  }
}

class GetRestoreJobMetadataOutput {
  /// This contains the metadata of the specified backup job.
  final Map<String, String>? metadata;

  /// This is a unique identifier of a restore job within Backup.
  final String? restoreJobId;

  GetRestoreJobMetadataOutput({
    this.metadata,
    this.restoreJobId,
  });

  factory GetRestoreJobMetadataOutput.fromJson(Map<String, dynamic> json) {
    return GetRestoreJobMetadataOutput(
      metadata: (json['Metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      restoreJobId: json['RestoreJobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final restoreJobId = this.restoreJobId;
    return {
      if (metadata != null) 'Metadata': metadata,
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
    };
  }
}

class GetRestoreTestingInferredMetadataOutput {
  /// This is a string map of the metadata inferred from the request.
  final Map<String, String> inferredMetadata;

  GetRestoreTestingInferredMetadataOutput({
    required this.inferredMetadata,
  });

  factory GetRestoreTestingInferredMetadataOutput.fromJson(
      Map<String, dynamic> json) {
    return GetRestoreTestingInferredMetadataOutput(
      inferredMetadata: ((json['InferredMetadata'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final inferredMetadata = this.inferredMetadata;
    return {
      'InferredMetadata': inferredMetadata,
    };
  }
}

class GetRestoreTestingPlanOutput {
  /// Specifies the body of a restore testing plan. Includes
  /// <code>RestoreTestingPlanName</code>.
  final RestoreTestingPlanForGet restoreTestingPlan;

  GetRestoreTestingPlanOutput({
    required this.restoreTestingPlan,
  });

  factory GetRestoreTestingPlanOutput.fromJson(Map<String, dynamic> json) {
    return GetRestoreTestingPlanOutput(
      restoreTestingPlan: RestoreTestingPlanForGet.fromJson(
          (json['RestoreTestingPlan'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final restoreTestingPlan = this.restoreTestingPlan;
    return {
      'RestoreTestingPlan': restoreTestingPlan,
    };
  }
}

class GetRestoreTestingSelectionOutput {
  /// Unique name of the restore testing selection.
  final RestoreTestingSelectionForGet restoreTestingSelection;

  GetRestoreTestingSelectionOutput({
    required this.restoreTestingSelection,
  });

  factory GetRestoreTestingSelectionOutput.fromJson(Map<String, dynamic> json) {
    return GetRestoreTestingSelectionOutput(
      restoreTestingSelection: RestoreTestingSelectionForGet.fromJson(
          (json['RestoreTestingSelection'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final restoreTestingSelection = this.restoreTestingSelection;
    return {
      'RestoreTestingSelection': restoreTestingSelection,
    };
  }
}

class GetSupportedResourceTypesOutput {
  /// Contains a string with the supported Amazon Web Services resource types:
  ///
  /// <ul>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>CloudFormation</code> for CloudFormation
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code> for Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>EKS</code> for Amazon Elastic Kubernetes Service
  /// </li>
  /// <li>
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases on Amazon Elastic
  /// Compute Cloud instances
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for VMware virtual machines
  /// </li>
  /// </ul>
  final List<String>? resourceTypes;

  GetSupportedResourceTypesOutput({
    this.resourceTypes,
  });

  factory GetSupportedResourceTypesOutput.fromJson(Map<String, dynamic> json) {
    return GetSupportedResourceTypesOutput(
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTypes = this.resourceTypes;
    return {
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
    };
  }
}

class GetTieringConfigurationOutput {
  /// Specifies the body of a tiering configuration. Includes
  /// <code>TieringConfigurationName</code>.
  final TieringConfiguration? tieringConfiguration;

  GetTieringConfigurationOutput({
    this.tieringConfiguration,
  });

  factory GetTieringConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return GetTieringConfigurationOutput(
      tieringConfiguration: json['TieringConfiguration'] != null
          ? TieringConfiguration.fromJson(
              json['TieringConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tieringConfiguration = this.tieringConfiguration;
    return {
      if (tieringConfiguration != null)
        'TieringConfiguration': tieringConfiguration,
    };
  }
}

class ListBackupJobsOutput {
  /// An array of structures containing metadata about your backup jobs returned
  /// in JSON format.
  final List<BackupJob>? backupJobs;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListBackupJobsOutput({
    this.backupJobs,
    this.nextToken,
  });

  factory ListBackupJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupJobsOutput(
      backupJobs: (json['BackupJobs'] as List?)
          ?.nonNulls
          .map((e) => BackupJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupJobs = this.backupJobs;
    final nextToken = this.nextToken;
    return {
      if (backupJobs != null) 'BackupJobs': backupJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBackupJobSummariesOutput {
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> - The daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> - The aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> - The aggregated job count for prior 14 days.
  /// </li>
  /// </ul>
  final String? aggregationPeriod;

  /// The summary information.
  final List<BackupJobSummary>? backupJobSummaries;

  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of resources,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListBackupJobSummariesOutput({
    this.aggregationPeriod,
    this.backupJobSummaries,
    this.nextToken,
  });

  factory ListBackupJobSummariesOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupJobSummariesOutput(
      aggregationPeriod: json['AggregationPeriod'] as String?,
      backupJobSummaries: (json['BackupJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => BackupJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationPeriod = this.aggregationPeriod;
    final backupJobSummaries = this.backupJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (aggregationPeriod != null) 'AggregationPeriod': aggregationPeriod,
      if (backupJobSummaries != null) 'BackupJobSummaries': backupJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBackupPlansOutput {
  /// Information about the backup plans.
  final List<BackupPlansListMember>? backupPlansList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListBackupPlansOutput({
    this.backupPlansList,
    this.nextToken,
  });

  factory ListBackupPlansOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupPlansOutput(
      backupPlansList: (json['BackupPlansList'] as List?)
          ?.nonNulls
          .map((e) => BackupPlansListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlansList = this.backupPlansList;
    final nextToken = this.nextToken;
    return {
      if (backupPlansList != null) 'BackupPlansList': backupPlansList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBackupPlanTemplatesOutput {
  /// An array of template list items containing metadata about your saved
  /// templates.
  final List<BackupPlanTemplatesListMember>? backupPlanTemplatesList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListBackupPlanTemplatesOutput({
    this.backupPlanTemplatesList,
    this.nextToken,
  });

  factory ListBackupPlanTemplatesOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupPlanTemplatesOutput(
      backupPlanTemplatesList: (json['BackupPlanTemplatesList'] as List?)
          ?.nonNulls
          .map((e) =>
              BackupPlanTemplatesListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanTemplatesList = this.backupPlanTemplatesList;
    final nextToken = this.nextToken;
    return {
      if (backupPlanTemplatesList != null)
        'BackupPlanTemplatesList': backupPlanTemplatesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBackupPlanVersionsOutput {
  /// An array of version list items containing metadata about your backup plans.
  final List<BackupPlansListMember>? backupPlanVersionsList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListBackupPlanVersionsOutput({
    this.backupPlanVersionsList,
    this.nextToken,
  });

  factory ListBackupPlanVersionsOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupPlanVersionsOutput(
      backupPlanVersionsList: (json['BackupPlanVersionsList'] as List?)
          ?.nonNulls
          .map((e) => BackupPlansListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanVersionsList = this.backupPlanVersionsList;
    final nextToken = this.nextToken;
    return {
      if (backupPlanVersionsList != null)
        'BackupPlanVersionsList': backupPlanVersionsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBackupSelectionsOutput {
  /// An array of backup selection list items containing metadata about each
  /// resource in the list.
  final List<BackupSelectionsListMember>? backupSelectionsList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListBackupSelectionsOutput({
    this.backupSelectionsList,
    this.nextToken,
  });

  factory ListBackupSelectionsOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupSelectionsOutput(
      backupSelectionsList: (json['BackupSelectionsList'] as List?)
          ?.nonNulls
          .map((e) =>
              BackupSelectionsListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupSelectionsList = this.backupSelectionsList;
    final nextToken = this.nextToken;
    return {
      if (backupSelectionsList != null)
        'BackupSelectionsList': backupSelectionsList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBackupVaultsOutput {
  /// An array of backup vault list members containing vault metadata, including
  /// Amazon Resource Name (ARN), display name, creation date, number of saved
  /// recovery points, and encryption information if the resources saved in the
  /// backup vault are encrypted.
  final List<BackupVaultListMember>? backupVaultList;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListBackupVaultsOutput({
    this.backupVaultList,
    this.nextToken,
  });

  factory ListBackupVaultsOutput.fromJson(Map<String, dynamic> json) {
    return ListBackupVaultsOutput(
      backupVaultList: (json['BackupVaultList'] as List?)
          ?.nonNulls
          .map((e) => BackupVaultListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultList = this.backupVaultList;
    final nextToken = this.nextToken;
    return {
      if (backupVaultList != null) 'BackupVaultList': backupVaultList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCopyJobsOutput {
  /// An array of structures containing metadata about your copy jobs returned in
  /// JSON format.
  final List<CopyJob>? copyJobs;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return MaxResults number of items, NextToken allows you
  /// to return more items in your list starting at the location pointed to by the
  /// next token.
  final String? nextToken;

  ListCopyJobsOutput({
    this.copyJobs,
    this.nextToken,
  });

  factory ListCopyJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListCopyJobsOutput(
      copyJobs: (json['CopyJobs'] as List?)
          ?.nonNulls
          .map((e) => CopyJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyJobs = this.copyJobs;
    final nextToken = this.nextToken;
    return {
      if (copyJobs != null) 'CopyJobs': copyJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCopyJobSummariesOutput {
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> - The daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> - The aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> - The aggregated job count for prior 14 days.
  /// </li>
  /// </ul>
  final String? aggregationPeriod;

  /// This return shows a summary that contains Region, Account, State,
  /// ResourceType, MessageCategory, StartTime, EndTime, and Count of included
  /// jobs.
  final List<CopyJobSummary>? copyJobSummaries;

  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of resources,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListCopyJobSummariesOutput({
    this.aggregationPeriod,
    this.copyJobSummaries,
    this.nextToken,
  });

  factory ListCopyJobSummariesOutput.fromJson(Map<String, dynamic> json) {
    return ListCopyJobSummariesOutput(
      aggregationPeriod: json['AggregationPeriod'] as String?,
      copyJobSummaries: (json['CopyJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => CopyJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationPeriod = this.aggregationPeriod;
    final copyJobSummaries = this.copyJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (aggregationPeriod != null) 'AggregationPeriod': aggregationPeriod,
      if (copyJobSummaries != null) 'CopyJobSummaries': copyJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListFrameworksOutput {
  /// The frameworks with details for each framework, including the framework
  /// name, Amazon Resource Name (ARN), description, number of controls, creation
  /// time, and deployment status.
  final List<Framework>? frameworks;

  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  ListFrameworksOutput({
    this.frameworks,
    this.nextToken,
  });

  factory ListFrameworksOutput.fromJson(Map<String, dynamic> json) {
    return ListFrameworksOutput(
      frameworks: (json['Frameworks'] as List?)
          ?.nonNulls
          .map((e) => Framework.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final frameworks = this.frameworks;
    final nextToken = this.nextToken;
    return {
      if (frameworks != null) 'Frameworks': frameworks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIndexedRecoveryPointsOutput {
  /// This is a list of recovery points that have an associated index, belonging
  /// to the specified account.
  final List<IndexedRecoveryPoint>? indexedRecoveryPoints;

  /// The next item following a partial list of returned recovery points.
  ///
  /// For example, if a request is made to return <code>MaxResults</code> number
  /// of indexed recovery points, <code>NextToken</code> allows you to return more
  /// items in your list starting at the location pointed to by the next token.
  final String? nextToken;

  ListIndexedRecoveryPointsOutput({
    this.indexedRecoveryPoints,
    this.nextToken,
  });

  factory ListIndexedRecoveryPointsOutput.fromJson(Map<String, dynamic> json) {
    return ListIndexedRecoveryPointsOutput(
      indexedRecoveryPoints: (json['IndexedRecoveryPoints'] as List?)
          ?.nonNulls
          .map((e) => IndexedRecoveryPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexedRecoveryPoints = this.indexedRecoveryPoints;
    final nextToken = this.nextToken;
    return {
      if (indexedRecoveryPoints != null)
        'IndexedRecoveryPoints': indexedRecoveryPoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLegalHoldsOutput {
  /// This is an array of returned legal holds, both active and previous.
  final List<LegalHold>? legalHolds;

  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of resources,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListLegalHoldsOutput({
    this.legalHolds,
    this.nextToken,
  });

  factory ListLegalHoldsOutput.fromJson(Map<String, dynamic> json) {
    return ListLegalHoldsOutput(
      legalHolds: (json['LegalHolds'] as List?)
          ?.nonNulls
          .map((e) => LegalHold.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final legalHolds = this.legalHolds;
    final nextToken = this.nextToken;
    return {
      if (legalHolds != null) 'LegalHolds': legalHolds,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListProtectedResourcesOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// An array of resources successfully backed up by Backup including the time
  /// the resource was saved, an Amazon Resource Name (ARN) of the resource, and a
  /// resource type.
  final List<ProtectedResource>? results;

  ListProtectedResourcesOutput({
    this.nextToken,
    this.results,
  });

  factory ListProtectedResourcesOutput.fromJson(Map<String, dynamic> json) {
    return ListProtectedResourcesOutput(
      nextToken: json['NextToken'] as String?,
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) => ProtectedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (results != null) 'Results': results,
    };
  }
}

class ListProtectedResourcesByBackupVaultOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// These are the results returned for the request
  /// ListProtectedResourcesByBackupVault.
  final List<ProtectedResource>? results;

  ListProtectedResourcesByBackupVaultOutput({
    this.nextToken,
    this.results,
  });

  factory ListProtectedResourcesByBackupVaultOutput.fromJson(
      Map<String, dynamic> json) {
    return ListProtectedResourcesByBackupVaultOutput(
      nextToken: json['NextToken'] as String?,
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) => ProtectedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (results != null) 'Results': results,
    };
  }
}

class ListRecoveryPointsByBackupVaultOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// An array of objects that contain detailed information about recovery points
  /// saved in a backup vault.
  final List<RecoveryPointByBackupVault>? recoveryPoints;

  ListRecoveryPointsByBackupVaultOutput({
    this.nextToken,
    this.recoveryPoints,
  });

  factory ListRecoveryPointsByBackupVaultOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRecoveryPointsByBackupVaultOutput(
      nextToken: json['NextToken'] as String?,
      recoveryPoints: (json['RecoveryPoints'] as List?)
          ?.nonNulls
          .map((e) =>
              RecoveryPointByBackupVault.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recoveryPoints = this.recoveryPoints;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recoveryPoints != null) 'RecoveryPoints': recoveryPoints,
    };
  }
}

class ListRecoveryPointsByLegalHoldOutput {
  /// The next item following a partial list of returned resources.
  final String? nextToken;

  /// The recovery points.
  final List<RecoveryPointMember>? recoveryPoints;

  ListRecoveryPointsByLegalHoldOutput({
    this.nextToken,
    this.recoveryPoints,
  });

  factory ListRecoveryPointsByLegalHoldOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRecoveryPointsByLegalHoldOutput(
      nextToken: json['NextToken'] as String?,
      recoveryPoints: (json['RecoveryPoints'] as List?)
          ?.nonNulls
          .map((e) => RecoveryPointMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recoveryPoints = this.recoveryPoints;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recoveryPoints != null) 'RecoveryPoints': recoveryPoints,
    };
  }
}

class ListRecoveryPointsByResourceOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// An array of objects that contain detailed information about recovery points
  /// of the specified resource type.
  /// <note>
  /// Only Amazon EFS and Amazon EC2 recovery points return BackupVaultName.
  /// </note>
  final List<RecoveryPointByResource>? recoveryPoints;

  ListRecoveryPointsByResourceOutput({
    this.nextToken,
    this.recoveryPoints,
  });

  factory ListRecoveryPointsByResourceOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRecoveryPointsByResourceOutput(
      nextToken: json['NextToken'] as String?,
      recoveryPoints: (json['RecoveryPoints'] as List?)
          ?.nonNulls
          .map((e) =>
              RecoveryPointByResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recoveryPoints = this.recoveryPoints;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (recoveryPoints != null) 'RecoveryPoints': recoveryPoints,
    };
  }
}

class ListReportJobsOutput {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  /// Details about your report jobs in JSON format.
  final List<ReportJob>? reportJobs;

  ListReportJobsOutput({
    this.nextToken,
    this.reportJobs,
  });

  factory ListReportJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListReportJobsOutput(
      nextToken: json['NextToken'] as String?,
      reportJobs: (json['ReportJobs'] as List?)
          ?.nonNulls
          .map((e) => ReportJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reportJobs = this.reportJobs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reportJobs != null) 'ReportJobs': reportJobs,
    };
  }
}

class ListReportPlansOutput {
  /// An identifier that was returned from the previous call to this operation,
  /// which can be used to return the next set of items in the list.
  final String? nextToken;

  /// The report plans with detailed information for each plan. This information
  /// includes the Amazon Resource Name (ARN), report plan name, description,
  /// settings, delivery channel, deployment status, creation time, and last times
  /// the report plan attempted to and successfully ran.
  final List<ReportPlan>? reportPlans;

  ListReportPlansOutput({
    this.nextToken,
    this.reportPlans,
  });

  factory ListReportPlansOutput.fromJson(Map<String, dynamic> json) {
    return ListReportPlansOutput(
      nextToken: json['NextToken'] as String?,
      reportPlans: (json['ReportPlans'] as List?)
          ?.nonNulls
          .map((e) => ReportPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reportPlans = this.reportPlans;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (reportPlans != null) 'ReportPlans': reportPlans,
    };
  }
}

class ListRestoreAccessBackupVaultsOutput {
  /// The pagination token to use in a subsequent request to retrieve the next set
  /// of results.
  final String? nextToken;

  /// A list of restore access backup vaults associated with the specified backup
  /// vault.
  final List<RestoreAccessBackupVaultListMember>? restoreAccessBackupVaults;

  ListRestoreAccessBackupVaultsOutput({
    this.nextToken,
    this.restoreAccessBackupVaults,
  });

  factory ListRestoreAccessBackupVaultsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRestoreAccessBackupVaultsOutput(
      nextToken: json['NextToken'] as String?,
      restoreAccessBackupVaults: (json['RestoreAccessBackupVaults'] as List?)
          ?.nonNulls
          .map((e) => RestoreAccessBackupVaultListMember.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final restoreAccessBackupVaults = this.restoreAccessBackupVaults;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (restoreAccessBackupVaults != null)
        'RestoreAccessBackupVaults': restoreAccessBackupVaults,
    };
  }
}

class ListRestoreJobsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// An array of objects that contain detailed information about jobs to restore
  /// saved resources.
  final List<RestoreJobsListMember>? restoreJobs;

  ListRestoreJobsOutput({
    this.nextToken,
    this.restoreJobs,
  });

  factory ListRestoreJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListRestoreJobsOutput(
      nextToken: json['NextToken'] as String?,
      restoreJobs: (json['RestoreJobs'] as List?)
          ?.nonNulls
          .map((e) => RestoreJobsListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final restoreJobs = this.restoreJobs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (restoreJobs != null) 'RestoreJobs': restoreJobs,
    };
  }
}

class ListRestoreJobsByProtectedResourceOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows youto return more items in your list starting
  /// at the location pointed to by the next token
  final String? nextToken;

  /// An array of objects that contain detailed information about jobs to restore
  /// saved resources.>
  final List<RestoreJobsListMember>? restoreJobs;

  ListRestoreJobsByProtectedResourceOutput({
    this.nextToken,
    this.restoreJobs,
  });

  factory ListRestoreJobsByProtectedResourceOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRestoreJobsByProtectedResourceOutput(
      nextToken: json['NextToken'] as String?,
      restoreJobs: (json['RestoreJobs'] as List?)
          ?.nonNulls
          .map((e) => RestoreJobsListMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final restoreJobs = this.restoreJobs;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (restoreJobs != null) 'RestoreJobs': restoreJobs,
    };
  }
}

class ListRestoreJobSummariesOutput {
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> - The daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> - The aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> - The aggregated job count for prior 14 days.
  /// </li>
  /// </ul>
  final String? aggregationPeriod;

  /// The next item following a partial list of returned resources. For example,
  /// if a request is made to return <code>MaxResults</code> number of resources,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// This return contains a summary that contains Region, Account, State,
  /// ResourceType, MessageCategory, StartTime, EndTime, and Count of included
  /// jobs.
  final List<RestoreJobSummary>? restoreJobSummaries;

  ListRestoreJobSummariesOutput({
    this.aggregationPeriod,
    this.nextToken,
    this.restoreJobSummaries,
  });

  factory ListRestoreJobSummariesOutput.fromJson(Map<String, dynamic> json) {
    return ListRestoreJobSummariesOutput(
      aggregationPeriod: json['AggregationPeriod'] as String?,
      nextToken: json['NextToken'] as String?,
      restoreJobSummaries: (json['RestoreJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => RestoreJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationPeriod = this.aggregationPeriod;
    final nextToken = this.nextToken;
    final restoreJobSummaries = this.restoreJobSummaries;
    return {
      if (aggregationPeriod != null) 'AggregationPeriod': aggregationPeriod,
      if (nextToken != null) 'NextToken': nextToken,
      if (restoreJobSummaries != null)
        'RestoreJobSummaries': restoreJobSummaries,
    };
  }
}

class ListRestoreTestingPlansOutput {
  /// This is a returned list of restore testing plans.
  final List<RestoreTestingPlanForList> restoreTestingPlans;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the nexttoken.
  final String? nextToken;

  ListRestoreTestingPlansOutput({
    required this.restoreTestingPlans,
    this.nextToken,
  });

  factory ListRestoreTestingPlansOutput.fromJson(Map<String, dynamic> json) {
    return ListRestoreTestingPlansOutput(
      restoreTestingPlans: ((json['RestoreTestingPlans'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              RestoreTestingPlanForList.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final restoreTestingPlans = this.restoreTestingPlans;
    final nextToken = this.nextToken;
    return {
      'RestoreTestingPlans': restoreTestingPlans,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRestoreTestingSelectionsOutput {
  /// The returned restore testing selections associated with the restore testing
  /// plan.
  final List<RestoreTestingSelectionForList> restoreTestingSelections;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the nexttoken.
  final String? nextToken;

  ListRestoreTestingSelectionsOutput({
    required this.restoreTestingSelections,
    this.nextToken,
  });

  factory ListRestoreTestingSelectionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListRestoreTestingSelectionsOutput(
      restoreTestingSelections:
          ((json['RestoreTestingSelections'] as List?) ?? const [])
              .nonNulls
              .map((e) => RestoreTestingSelectionForList.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final restoreTestingSelections = this.restoreTestingSelections;
    final nextToken = this.nextToken;
    return {
      'RestoreTestingSelections': restoreTestingSelections,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListScanJobsOutput {
  /// An array of structures containing metadata about your scan jobs returned in
  /// JSON format.
  final List<ScanJob> scanJobs;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  ListScanJobsOutput({
    required this.scanJobs,
    this.nextToken,
  });

  factory ListScanJobsOutput.fromJson(Map<String, dynamic> json) {
    return ListScanJobsOutput(
      scanJobs: ((json['ScanJobs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ScanJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanJobs = this.scanJobs;
    final nextToken = this.nextToken;
    return {
      'ScanJobs': scanJobs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListScanJobSummariesOutput {
  /// The period for the returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code>The daily job count for the prior 1 day.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code>The daily job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code>The daily job count for the prior 14 days.
  /// </li>
  /// </ul>
  /// Valid Values: <code>'ONE_DAY'</code> | <code>'SEVEN_DAYS'</code> |
  /// <code>'FOURTEEN_DAYS'</code>
  final String? aggregationPeriod;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// The summary information.
  final List<ScanJobSummary>? scanJobSummaries;

  ListScanJobSummariesOutput({
    this.aggregationPeriod,
    this.nextToken,
    this.scanJobSummaries,
  });

  factory ListScanJobSummariesOutput.fromJson(Map<String, dynamic> json) {
    return ListScanJobSummariesOutput(
      aggregationPeriod: json['AggregationPeriod'] as String?,
      nextToken: json['NextToken'] as String?,
      scanJobSummaries: (json['ScanJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => ScanJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationPeriod = this.aggregationPeriod;
    final nextToken = this.nextToken;
    final scanJobSummaries = this.scanJobSummaries;
    return {
      if (aggregationPeriod != null) 'AggregationPeriod': aggregationPeriod,
      if (nextToken != null) 'NextToken': nextToken,
      if (scanJobSummaries != null) 'ScanJobSummaries': scanJobSummaries,
    };
  }
}

class ListTagsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// Information about the tags.
  final Map<String, String>? tags;

  ListTagsOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsOutput(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTieringConfigurationsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// An array of tiering configurations returned by the
  /// <code>ListTieringConfigurations</code> call.
  final List<TieringConfigurationsListMember>? tieringConfigurations;

  ListTieringConfigurationsOutput({
    this.nextToken,
    this.tieringConfigurations,
  });

  factory ListTieringConfigurationsOutput.fromJson(Map<String, dynamic> json) {
    return ListTieringConfigurationsOutput(
      nextToken: json['NextToken'] as String?,
      tieringConfigurations: (json['TieringConfigurations'] as List?)
          ?.nonNulls
          .map((e) => TieringConfigurationsListMember.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tieringConfigurations = this.tieringConfigurations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tieringConfigurations != null)
        'TieringConfigurations': tieringConfigurations,
    };
  }
}

class StartBackupJobOutput {
  /// Uniquely identifies a request to Backup to back up a resource.
  final String? backupJobId;

  /// The date and time that a backup job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// This is a returned boolean value indicating this is a parent (composite)
  /// backup job.
  final bool? isParent;

  /// <i>Note: This field is only returned for Amazon EFS and Advanced DynamoDB
  /// resources.</i>
  ///
  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  StartBackupJobOutput({
    this.backupJobId,
    this.creationDate,
    this.isParent,
    this.recoveryPointArn,
  });

  factory StartBackupJobOutput.fromJson(Map<String, dynamic> json) {
    return StartBackupJobOutput(
      backupJobId: json['BackupJobId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      isParent: json['IsParent'] as bool?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupJobId = this.backupJobId;
    final creationDate = this.creationDate;
    final isParent = this.isParent;
    final recoveryPointArn = this.recoveryPointArn;
    return {
      if (backupJobId != null) 'BackupJobId': backupJobId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (isParent != null) 'IsParent': isParent,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
    };
  }
}

class StartCopyJobOutput {
  /// Uniquely identifies a copy job.
  final String? copyJobId;

  /// The date and time that a copy job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// This is a returned boolean value indicating this is a parent (composite)
  /// copy job.
  final bool? isParent;

  StartCopyJobOutput({
    this.copyJobId,
    this.creationDate,
    this.isParent,
  });

  factory StartCopyJobOutput.fromJson(Map<String, dynamic> json) {
    return StartCopyJobOutput(
      copyJobId: json['CopyJobId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      isParent: json['IsParent'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyJobId = this.copyJobId;
    final creationDate = this.creationDate;
    final isParent = this.isParent;
    return {
      if (copyJobId != null) 'CopyJobId': copyJobId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (isParent != null) 'IsParent': isParent,
    };
  }
}

class StartReportJobOutput {
  /// The identifier of the report job. A unique, randomly generated, Unicode,
  /// UTF-8 encoded string that is at most 1,024 bytes long. The report job ID
  /// cannot be edited.
  final String? reportJobId;

  StartReportJobOutput({
    this.reportJobId,
  });

  factory StartReportJobOutput.fromJson(Map<String, dynamic> json) {
    return StartReportJobOutput(
      reportJobId: json['ReportJobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportJobId = this.reportJobId;
    return {
      if (reportJobId != null) 'ReportJobId': reportJobId,
    };
  }
}

class StartRestoreJobOutput {
  /// Uniquely identifies the job that restores a recovery point.
  final String? restoreJobId;

  StartRestoreJobOutput({
    this.restoreJobId,
  });

  factory StartRestoreJobOutput.fromJson(Map<String, dynamic> json) {
    return StartRestoreJobOutput(
      restoreJobId: json['RestoreJobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final restoreJobId = this.restoreJobId;
    return {
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
    };
  }
}

class StartScanJobOutput {
  /// The date and time that a backup job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// Uniquely identifies a request to Backup to back up a resource.
  final String scanJobId;

  StartScanJobOutput({
    required this.creationDate,
    required this.scanJobId,
  });

  factory StartScanJobOutput.fromJson(Map<String, dynamic> json) {
    return StartScanJobOutput(
      creationDate: nonNullableTimeStampFromJson(json['CreationDate'] ?? 0),
      scanJobId: (json['ScanJobId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final creationDate = this.creationDate;
    final scanJobId = this.scanJobId;
    return {
      'CreationDate': unixTimestampToJson(creationDate),
      'ScanJobId': scanJobId,
    };
  }
}

class UpdateBackupPlanOutput {
  /// Contains a list of <code>BackupOptions</code> for each resource type.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  final String? backupPlanArn;

  /// Uniquely identifies a backup plan.
  final String? backupPlanId;

  /// The date and time a backup plan is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// Contains your scanning configuration for the backup plan and includes the
  /// Malware scanner, your selected resources, and scanner role.
  final List<ScanSetting>? scanSettings;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version Ids cannot be edited.
  final String? versionId;

  UpdateBackupPlanOutput({
    this.advancedBackupSettings,
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.scanSettings,
    this.versionId,
  });

  factory UpdateBackupPlanOutput.fromJson(Map<String, dynamic> json) {
    return UpdateBackupPlanOutput(
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.nonNulls
          .map((e) => AdvancedBackupSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      backupPlanArn: json['BackupPlanArn'] as String?,
      backupPlanId: json['BackupPlanId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      scanSettings: (json['ScanSettings'] as List?)
          ?.nonNulls
          .map((e) => ScanSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedBackupSettings = this.advancedBackupSettings;
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final creationDate = this.creationDate;
    final scanSettings = this.scanSettings;
    final versionId = this.versionId;
    return {
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
      if (backupPlanArn != null) 'BackupPlanArn': backupPlanArn,
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (scanSettings != null) 'ScanSettings': scanSettings,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

class UpdateFrameworkOutput {
  /// The date and time that a framework is created, in ISO 8601 representation.
  /// The value of <code>CreationTime</code> is accurate to milliseconds. For
  /// example, 2020-07-10T15:00:00.000-08:00 represents the 10th of July 2020 at
  /// 3:00 PM 8 hours behind UTC.
  final DateTime? creationTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? frameworkArn;

  /// The unique name of a framework. This name is between 1 and 256 characters,
  /// starting with a letter, and consisting of letters (a-z, A-Z), numbers (0-9),
  /// and underscores (_).
  final String? frameworkName;

  UpdateFrameworkOutput({
    this.creationTime,
    this.frameworkArn,
    this.frameworkName,
  });

  factory UpdateFrameworkOutput.fromJson(Map<String, dynamic> json) {
    return UpdateFrameworkOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      frameworkArn: json['FrameworkArn'] as String?,
      frameworkName: json['FrameworkName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final frameworkArn = this.frameworkArn;
    final frameworkName = this.frameworkName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (frameworkArn != null) 'FrameworkArn': frameworkArn,
      if (frameworkName != null) 'FrameworkName': frameworkName,
    };
  }
}

class UpdateRecoveryPointIndexSettingsOutput {
  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created.
  final String? backupVaultName;

  /// Index can have 1 of 2 possible values, either <code>ENABLED</code> or
  /// <code>DISABLED</code>.
  ///
  /// A value of <code>ENABLED</code> means a backup index for an eligible
  /// <code>ACTIVE</code> recovery point has been created.
  ///
  /// A value of <code>DISABLED</code> means a backup index was deleted.
  final Index? index;

  /// This is the current status for the backup index associated with the
  /// specified recovery point.
  ///
  /// Statuses are: <code>PENDING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code> | <code>DELETING</code>
  ///
  /// A recovery point with an index that has the status of <code>ACTIVE</code>
  /// can be included in a search.
  final IndexStatus? indexStatus;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  UpdateRecoveryPointIndexSettingsOutput({
    this.backupVaultName,
    this.index,
    this.indexStatus,
    this.recoveryPointArn,
  });

  factory UpdateRecoveryPointIndexSettingsOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateRecoveryPointIndexSettingsOutput(
      backupVaultName: json['BackupVaultName'] as String?,
      index: (json['Index'] as String?)?.let(Index.fromString),
      indexStatus:
          (json['IndexStatus'] as String?)?.let(IndexStatus.fromString),
      recoveryPointArn: json['RecoveryPointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultName = this.backupVaultName;
    final index = this.index;
    final indexStatus = this.indexStatus;
    final recoveryPointArn = this.recoveryPointArn;
    return {
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (index != null) 'Index': index.value,
      if (indexStatus != null) 'IndexStatus': indexStatus.value,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
    };
  }
}

class UpdateRecoveryPointLifecycleOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  final CalculatedLifecycle? calculatedLifecycle;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  ///
  /// Resource types that can transition to cold storage are listed in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table. Backup ignores this expression for other
  /// resource types.
  final Lifecycle? lifecycle;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  UpdateRecoveryPointLifecycleOutput({
    this.backupVaultArn,
    this.calculatedLifecycle,
    this.lifecycle,
    this.recoveryPointArn,
  });

  factory UpdateRecoveryPointLifecycleOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateRecoveryPointLifecycleOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      calculatedLifecycle: json['CalculatedLifecycle'] != null
          ? CalculatedLifecycle.fromJson(
              json['CalculatedLifecycle'] as Map<String, dynamic>)
          : null,
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final calculatedLifecycle = this.calculatedLifecycle;
    final lifecycle = this.lifecycle;
    final recoveryPointArn = this.recoveryPointArn;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (calculatedLifecycle != null)
        'CalculatedLifecycle': calculatedLifecycle,
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
    };
  }
}

class UpdateReportPlanOutput {
  /// The date and time that a report plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? reportPlanArn;

  /// The unique name of the report plan.
  final String? reportPlanName;

  UpdateReportPlanOutput({
    this.creationTime,
    this.reportPlanArn,
    this.reportPlanName,
  });

  factory UpdateReportPlanOutput.fromJson(Map<String, dynamic> json) {
    return UpdateReportPlanOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      reportPlanArn: json['ReportPlanArn'] as String?,
      reportPlanName: json['ReportPlanName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final reportPlanArn = this.reportPlanArn;
    final reportPlanName = this.reportPlanName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (reportPlanArn != null) 'ReportPlanArn': reportPlanArn,
      if (reportPlanName != null) 'ReportPlanName': reportPlanName,
    };
  }
}

class UpdateRestoreTestingPlanOutput {
  /// The time the resource testing plan was created.
  final DateTime creationTime;

  /// Unique ARN (Amazon Resource Name) of the restore testing plan.
  final String restoreTestingPlanArn;

  /// The name cannot be changed after creation. The name consists of only
  /// alphanumeric characters and underscores. Maximum length is 50.
  final String restoreTestingPlanName;

  /// The time the update completed for the restore testing plan.
  final DateTime updateTime;

  UpdateRestoreTestingPlanOutput({
    required this.creationTime,
    required this.restoreTestingPlanArn,
    required this.restoreTestingPlanName,
    required this.updateTime,
  });

  factory UpdateRestoreTestingPlanOutput.fromJson(Map<String, dynamic> json) {
    return UpdateRestoreTestingPlanOutput(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      restoreTestingPlanArn: (json['RestoreTestingPlanArn'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final restoreTestingPlanArn = this.restoreTestingPlanArn;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final updateTime = this.updateTime;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'RestoreTestingPlanArn': restoreTestingPlanArn,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

class UpdateRestoreTestingSelectionOutput {
  /// The time the resource testing selection was updated successfully.
  final DateTime creationTime;

  /// Unique string that is the name of the restore testing plan.
  final String restoreTestingPlanArn;

  /// The restore testing plan with which the updated restore testing selection is
  /// associated.
  final String restoreTestingPlanName;

  /// The returned restore testing selection name.
  final String restoreTestingSelectionName;

  /// The time the update completed for the restore testing selection.
  final DateTime updateTime;

  UpdateRestoreTestingSelectionOutput({
    required this.creationTime,
    required this.restoreTestingPlanArn,
    required this.restoreTestingPlanName,
    required this.restoreTestingSelectionName,
    required this.updateTime,
  });

  factory UpdateRestoreTestingSelectionOutput.fromJson(
      Map<String, dynamic> json) {
    return UpdateRestoreTestingSelectionOutput(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      restoreTestingPlanArn: (json['RestoreTestingPlanArn'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
      restoreTestingSelectionName:
          (json['RestoreTestingSelectionName'] as String?) ?? '',
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final restoreTestingPlanArn = this.restoreTestingPlanArn;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final restoreTestingSelectionName = this.restoreTestingSelectionName;
    final updateTime = this.updateTime;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'RestoreTestingPlanArn': restoreTestingPlanArn,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'RestoreTestingSelectionName': restoreTestingSelectionName,
      'UpdateTime': unixTimestampToJson(updateTime),
    };
  }
}

class UpdateTieringConfigurationOutput {
  /// The date and time a tiering configuration was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087AM.
  final DateTime? creationTime;

  /// The date and time a tiering configuration was updated, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastUpdatedTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087AM.
  final DateTime? lastUpdatedTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies the updated tiering
  /// configuration.
  final String? tieringConfigurationArn;

  /// This unique string is the name of the tiering configuration.
  final String? tieringConfigurationName;

  UpdateTieringConfigurationOutput({
    this.creationTime,
    this.lastUpdatedTime,
    this.tieringConfigurationArn,
    this.tieringConfigurationName,
  });

  factory UpdateTieringConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return UpdateTieringConfigurationOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      tieringConfigurationArn: json['TieringConfigurationArn'] as String?,
      tieringConfigurationName: json['TieringConfigurationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final tieringConfigurationArn = this.tieringConfigurationArn;
    final tieringConfigurationName = this.tieringConfigurationName;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (tieringConfigurationArn != null)
        'TieringConfigurationArn': tieringConfigurationArn,
      if (tieringConfigurationName != null)
        'TieringConfigurationName': tieringConfigurationName,
    };
  }
}

/// This contains metadata about a tiering configuration for update operations.
class TieringConfigurationInputForUpdate {
  /// The name of the backup vault where the tiering configuration applies. Use
  /// <code>*</code> to apply to all backup vaults.
  final String backupVaultName;

  /// An array of resource selection objects that specify which resources are
  /// included in the tiering configuration and their tiering settings.
  final List<ResourceSelection> resourceSelection;

  TieringConfigurationInputForUpdate({
    required this.backupVaultName,
    required this.resourceSelection,
  });

  Map<String, dynamic> toJson() {
    final backupVaultName = this.backupVaultName;
    final resourceSelection = this.resourceSelection;
    return {
      'BackupVaultName': backupVaultName,
      'ResourceSelection': resourceSelection,
    };
  }
}

/// This contains metadata about resource selection for tiering configurations.
///
/// You can specify up to 5 different resource selections per tiering
/// configuration. Data moved to lower-cost tier remains there until deletion
/// (one-way transition).
class ResourceSelection {
  /// The type of Amazon Web Services resource; for example, <code>S3</code> for
  /// Amazon S3. For tiering configurations, this is currently limited to
  /// <code>S3</code>.
  final String resourceType;

  /// An array of strings that either contains ARNs of the associated resources or
  /// contains a wildcard <code>*</code> to specify all resources. You can specify
  /// up to 100 specific resources per tiering configuration.
  final List<String> resources;

  /// The number of days after creation within a backup vault that an object can
  /// transition to the low cost warm storage tier. Must be a positive integer
  /// between 60 and 36500 days.
  final int tieringDownSettingsInDays;

  ResourceSelection({
    required this.resourceType,
    required this.resources,
    required this.tieringDownSettingsInDays,
  });

  factory ResourceSelection.fromJson(Map<String, dynamic> json) {
    return ResourceSelection(
      resourceType: (json['ResourceType'] as String?) ?? '',
      resources: ((json['Resources'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      tieringDownSettingsInDays:
          (json['TieringDownSettingsInDays'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final resources = this.resources;
    final tieringDownSettingsInDays = this.tieringDownSettingsInDays;
    return {
      'ResourceType': resourceType,
      'Resources': resources,
      'TieringDownSettingsInDays': tieringDownSettingsInDays,
    };
  }
}

/// This contains metadata about a restore testing selection.
class RestoreTestingSelectionForUpdate {
  /// The Amazon Resource Name (ARN) of the IAM role that Backup uses to create
  /// the target resource; for example:
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// You can include a list of specific ARNs, such as
  /// <code>ProtectedResourceArns: ["arn:aws:...", "arn:aws:..."]</code> or you
  /// can include a wildcard: <code>ProtectedResourceArns: ["*"]</code>, but not
  /// both.
  final List<String>? protectedResourceArns;

  /// The conditions that you define for resources in your restore testing plan
  /// using tags.
  final ProtectedResourceConditions? protectedResourceConditions;

  /// You can override certain restore metadata keys by including the parameter
  /// <code>RestoreMetadataOverrides</code> in the body of
  /// <code>RestoreTestingSelection</code>. Key values are not case sensitive.
  ///
  /// See the complete list of <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restore-testing-inferred-metadata.html">restore
  /// testing inferred metadata</a>.
  final Map<String, String>? restoreMetadataOverrides;

  /// This value represents the time, in hours, data is retained after a restore
  /// test so that optional validation can be completed.
  ///
  /// Accepted value is an integer between 0 and 168 (the hourly equivalent of
  /// seven days).
  final int? validationWindowHours;

  RestoreTestingSelectionForUpdate({
    this.iamRoleArn,
    this.protectedResourceArns,
    this.protectedResourceConditions,
    this.restoreMetadataOverrides,
    this.validationWindowHours,
  });

  Map<String, dynamic> toJson() {
    final iamRoleArn = this.iamRoleArn;
    final protectedResourceArns = this.protectedResourceArns;
    final protectedResourceConditions = this.protectedResourceConditions;
    final restoreMetadataOverrides = this.restoreMetadataOverrides;
    final validationWindowHours = this.validationWindowHours;
    return {
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (protectedResourceArns != null)
        'ProtectedResourceArns': protectedResourceArns,
      if (protectedResourceConditions != null)
        'ProtectedResourceConditions': protectedResourceConditions,
      if (restoreMetadataOverrides != null)
        'RestoreMetadataOverrides': restoreMetadataOverrides,
      if (validationWindowHours != null)
        'ValidationWindowHours': validationWindowHours,
    };
  }
}

/// The conditions that you define for resources in your restore testing plan
/// using tags.
class ProtectedResourceConditions {
  /// Filters the values of your tagged resources for only those resources that
  /// you tagged with the same value. Also called "exact matching."
  final List<KeyValue>? stringEquals;

  /// Filters the values of your tagged resources for only those resources that
  /// you tagged that do not have the same value. Also called "negated matching."
  final List<KeyValue>? stringNotEquals;

  ProtectedResourceConditions({
    this.stringEquals,
    this.stringNotEquals,
  });

  factory ProtectedResourceConditions.fromJson(Map<String, dynamic> json) {
    return ProtectedResourceConditions(
      stringEquals: (json['StringEquals'] as List?)
          ?.nonNulls
          .map((e) => KeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringNotEquals: (json['StringNotEquals'] as List?)
          ?.nonNulls
          .map((e) => KeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stringEquals = this.stringEquals;
    final stringNotEquals = this.stringNotEquals;
    return {
      if (stringEquals != null) 'StringEquals': stringEquals,
      if (stringNotEquals != null) 'StringNotEquals': stringNotEquals,
    };
  }
}

/// Pair of two related strings. Allowed characters are letters, white space,
/// and numbers that can be represented in UTF-8 and the following characters:
/// <code> + - = . _ : /</code>
class KeyValue {
  /// The tag key (String). The key can't start with <code>aws:</code>.
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 128.
  ///
  /// Pattern:
  /// <code>^(?![aA]{1}[wW]{1}[sS]{1}:)([\p{L}\p{Z}\p{N}_.:/=+\-@]+)$</code>
  final String key;

  /// The value of the key.
  ///
  /// Length Constraints: Maximum length of 256.
  ///
  /// Pattern: <code>^([\p{L}\p{Z}\p{N}_.:/=+\-@]*)$</code>
  final String value;

  KeyValue({
    required this.key,
    required this.value,
  });

  factory KeyValue.fromJson(Map<String, dynamic> json) {
    return KeyValue(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// This contains metadata about a restore testing plan.
class RestoreTestingPlanForUpdate {
  /// Required: <code>Algorithm</code>; <code>RecoveryPointTypes</code>;
  /// <code>IncludeVaults</code> (<i>one or more</i>).
  ///
  /// Optional: <i>SelectionWindowDays</i> (<i>'30' if not specified</i>);
  /// <code>ExcludeVaults</code> (defaults to empty list if not listed).
  final RestoreTestingRecoveryPointSelection? recoveryPointSelection;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed. When no CRON expression is provided, Backup will use the default
  /// expression <code>cron(0 5 ? * * *)</code>.
  final String? scheduleExpression;

  /// Optional. This is the timezone in which the schedule expression is set. By
  /// default, ScheduleExpressions are in UTC. You can modify this to a specified
  /// timezone.
  final String? scheduleExpressionTimezone;

  /// Defaults to 24 hours.
  ///
  /// A value in hours after a restore test is scheduled before a job will be
  /// canceled if it doesn't start successfully. This value is optional. If this
  /// value is included, this parameter has a maximum value of 168 hours (one
  /// week).
  final int? startWindowHours;

  RestoreTestingPlanForUpdate({
    this.recoveryPointSelection,
    this.scheduleExpression,
    this.scheduleExpressionTimezone,
    this.startWindowHours,
  });

  Map<String, dynamic> toJson() {
    final recoveryPointSelection = this.recoveryPointSelection;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowHours = this.startWindowHours;
    return {
      if (recoveryPointSelection != null)
        'RecoveryPointSelection': recoveryPointSelection,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowHours != null) 'StartWindowHours': startWindowHours,
    };
  }
}

/// <code>RecoveryPointSelection</code> has five parameters (three required and
/// two optional). The values you specify determine which recovery point is
/// included in the restore test. You must indicate with <code>Algorithm</code>
/// if you want the latest recovery point within your
/// <code>SelectionWindowDays</code> or if you want a random recovery point, and
/// you must indicate through <code>IncludeVaults</code> from which vaults the
/// recovery points can be chosen.
///
/// <code>Algorithm</code> (<i>required</i>) Valid values:
/// "<code>LATEST_WITHIN_WINDOW</code>" or "<code>RANDOM_WITHIN_WINDOW</code>".
///
/// <code>Recovery point types</code> (<i>required</i>) Valid values:
/// "<code>SNAPSHOT</code>" and/or "<code>CONTINUOUS</code>". Include
/// <code>SNAPSHOT</code> to restore only snapshot recovery points; include
/// <code>CONTINUOUS</code> to restore continuous recovery points (point in time
/// restore / PITR); use both to restore either a snapshot or a continuous
/// recovery point. The recovery point will be determined by the value for
/// <code>Algorithm</code>.
///
/// <code>IncludeVaults</code> (<i>required</i>). You must include one or more
/// backup vaults. Use the wildcard ["*"] or specific ARNs.
///
/// <code>SelectionWindowDays</code> (<i>optional</i>) Value must be an integer
/// (in days) from 1 to 365. If not included, the value defaults to
/// <code>30</code>.
///
/// <code>ExcludeVaults</code> (<i>optional</i>). You can choose to input one or
/// more specific backup vault ARNs to exclude those vaults' contents from
/// restore eligibility. Or, you can include a list of selectors. If this
/// parameter and its value are not included, it defaults to empty list.
class RestoreTestingRecoveryPointSelection {
  /// Acceptable values include "LATEST_WITHIN_WINDOW" or "RANDOM_WITHIN_WINDOW"
  final RestoreTestingRecoveryPointSelectionAlgorithm? algorithm;

  /// Accepted values include specific ARNs or list of selectors. Defaults to
  /// empty list if not listed.
  final List<String>? excludeVaults;

  /// Accepted values include wildcard ["*"] or by specific ARNs or ARN wilcard
  /// replacement ["arn:aws:backup:us-west-2:123456789012:backup-vault:asdf", ...]
  /// ["arn:aws:backup:*:*:backup-vault:asdf-*", ...]
  final List<String>? includeVaults;

  /// These are the types of recovery points.
  ///
  /// Include <code>SNAPSHOT</code> to restore only snapshot recovery points;
  /// include <code>CONTINUOUS</code> to restore continuous recovery points (point
  /// in time restore / PITR); use both to restore either a snapshot or a
  /// continuous recovery point. The recovery point will be determined by the
  /// value for <code>Algorithm</code>.
  final List<RestoreTestingRecoveryPointType>? recoveryPointTypes;

  /// Accepted values are integers from 1 to 365.
  final int? selectionWindowDays;

  RestoreTestingRecoveryPointSelection({
    this.algorithm,
    this.excludeVaults,
    this.includeVaults,
    this.recoveryPointTypes,
    this.selectionWindowDays,
  });

  factory RestoreTestingRecoveryPointSelection.fromJson(
      Map<String, dynamic> json) {
    return RestoreTestingRecoveryPointSelection(
      algorithm: (json['Algorithm'] as String?)
          ?.let(RestoreTestingRecoveryPointSelectionAlgorithm.fromString),
      excludeVaults: (json['ExcludeVaults'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      includeVaults: (json['IncludeVaults'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      recoveryPointTypes: (json['RecoveryPointTypes'] as List?)
          ?.nonNulls
          .map((e) => RestoreTestingRecoveryPointType.fromString((e as String)))
          .toList(),
      selectionWindowDays: json['SelectionWindowDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final excludeVaults = this.excludeVaults;
    final includeVaults = this.includeVaults;
    final recoveryPointTypes = this.recoveryPointTypes;
    final selectionWindowDays = this.selectionWindowDays;
    return {
      if (algorithm != null) 'Algorithm': algorithm.value,
      if (excludeVaults != null) 'ExcludeVaults': excludeVaults,
      if (includeVaults != null) 'IncludeVaults': includeVaults,
      if (recoveryPointTypes != null)
        'RecoveryPointTypes': recoveryPointTypes.map((e) => e.value).toList(),
      if (selectionWindowDays != null)
        'SelectionWindowDays': selectionWindowDays,
    };
  }
}

class RestoreTestingRecoveryPointSelectionAlgorithm {
  static const latestWithinWindow =
      RestoreTestingRecoveryPointSelectionAlgorithm._('LATEST_WITHIN_WINDOW');
  static const randomWithinWindow =
      RestoreTestingRecoveryPointSelectionAlgorithm._('RANDOM_WITHIN_WINDOW');

  final String value;

  const RestoreTestingRecoveryPointSelectionAlgorithm._(this.value);

  static const values = [latestWithinWindow, randomWithinWindow];

  static RestoreTestingRecoveryPointSelectionAlgorithm fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RestoreTestingRecoveryPointSelectionAlgorithm._(value));

  @override
  bool operator ==(other) =>
      other is RestoreTestingRecoveryPointSelectionAlgorithm &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RestoreTestingRecoveryPointType {
  static const continuous = RestoreTestingRecoveryPointType._('CONTINUOUS');
  static const snapshot = RestoreTestingRecoveryPointType._('SNAPSHOT');

  final String value;

  const RestoreTestingRecoveryPointType._(this.value);

  static const values = [continuous, snapshot];

  static RestoreTestingRecoveryPointType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RestoreTestingRecoveryPointType._(value));

  @override
  bool operator ==(other) =>
      other is RestoreTestingRecoveryPointType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information from your report plan about where to deliver your
/// reports, specifically your Amazon S3 bucket name, S3 key prefix, and the
/// formats of your reports.
class ReportDeliveryChannel {
  /// The unique name of the S3 bucket that receives your reports.
  final String s3BucketName;

  /// The format of your reports: <code>CSV</code>, <code>JSON</code>, or both. If
  /// not specified, the default format is <code>CSV</code>.
  final List<String>? formats;

  /// The prefix for where Backup Audit Manager delivers your reports to Amazon
  /// S3. The prefix is this part of the following path:
  /// s3://your-bucket-name/<code>prefix</code>/Backup/us-west-2/year/month/day/report-name.
  /// If not specified, there is no prefix.
  final String? s3KeyPrefix;

  ReportDeliveryChannel({
    required this.s3BucketName,
    this.formats,
    this.s3KeyPrefix,
  });

  factory ReportDeliveryChannel.fromJson(Map<String, dynamic> json) {
    return ReportDeliveryChannel(
      s3BucketName: (json['S3BucketName'] as String?) ?? '',
      formats:
          (json['Formats'] as List?)?.nonNulls.map((e) => e as String).toList(),
      s3KeyPrefix: json['S3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final formats = this.formats;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      'S3BucketName': s3BucketName,
      if (formats != null) 'Formats': formats,
      if (s3KeyPrefix != null) 'S3KeyPrefix': s3KeyPrefix,
    };
  }
}

/// Contains detailed information about a report setting.
class ReportSetting {
  /// Identifies the report template for the report. Reports are built using a
  /// report template. The report templates are:
  ///
  /// <code>RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT |
  /// BACKUP_JOB_REPORT | COPY_JOB_REPORT | RESTORE_JOB_REPORT |
  /// SCAN_JOB_REPORT</code>
  final String reportTemplate;

  /// These are the accounts to be included in the report.
  ///
  /// Use string value of <code>ROOT</code> to include all organizational units.
  final List<String>? accounts;

  /// The Amazon Resource Names (ARNs) of the frameworks a report covers.
  final List<String>? frameworkArns;

  /// The number of frameworks a report covers.
  final int? numberOfFrameworks;

  /// These are the Organizational Units to be included in the report.
  final List<String>? organizationUnits;

  /// These are the Regions to be included in the report.
  ///
  /// Use the wildcard as the string value to include all Regions.
  final List<String>? regions;

  ReportSetting({
    required this.reportTemplate,
    this.accounts,
    this.frameworkArns,
    this.numberOfFrameworks,
    this.organizationUnits,
    this.regions,
  });

  factory ReportSetting.fromJson(Map<String, dynamic> json) {
    return ReportSetting(
      reportTemplate: (json['ReportTemplate'] as String?) ?? '',
      accounts: (json['Accounts'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      frameworkArns: (json['FrameworkArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      numberOfFrameworks: json['NumberOfFrameworks'] as int?,
      organizationUnits: (json['OrganizationUnits'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      regions:
          (json['Regions'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final reportTemplate = this.reportTemplate;
    final accounts = this.accounts;
    final frameworkArns = this.frameworkArns;
    final numberOfFrameworks = this.numberOfFrameworks;
    final organizationUnits = this.organizationUnits;
    final regions = this.regions;
    return {
      'ReportTemplate': reportTemplate,
      if (accounts != null) 'Accounts': accounts,
      if (frameworkArns != null) 'FrameworkArns': frameworkArns,
      if (numberOfFrameworks != null) 'NumberOfFrameworks': numberOfFrameworks,
      if (organizationUnits != null) 'OrganizationUnits': organizationUnits,
      if (regions != null) 'Regions': regions,
    };
  }
}

/// Specifies the time period, in days, before a recovery point transitions to
/// cold storage or is deleted.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, on the console, the retention setting must be
/// 90 days greater than the transition to cold after days setting. The
/// transition to cold after days setting can't be changed after a backup has
/// been transitioned to cold.
///
/// Resource types that can transition to cold storage are listed in the <a
/// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
/// availability by resource</a> table. Backup ignores this expression for other
/// resource types.
///
/// To remove the existing lifecycle and retention periods and keep your
/// recovery points indefinitely, specify -1 for
/// <code>MoveToColdStorageAfterDays</code> and <code>DeleteAfterDays</code>.
class Lifecycle {
  /// The number of days after creation that a recovery point is deleted. This
  /// value must be at least 90 days after the number of days specified in
  /// <code>MoveToColdStorageAfterDays</code>.
  final int? deleteAfterDays;

  /// The event after which a recovery point is deleted. A recovery point with
  /// both <code>DeleteAfterDays</code> and <code>DeleteAfterEvent</code> will
  /// delete after whichever condition is satisfied first. Not valid as an input.
  final LifecycleDeleteAfterEvent? deleteAfterEvent;

  /// The number of days after creation that a recovery point is moved to cold
  /// storage.
  final int? moveToColdStorageAfterDays;

  /// If the value is true, your backup plan transitions supported resources to
  /// archive (cold) storage tier in accordance with your lifecycle settings.
  final bool? optInToArchiveForSupportedResources;

  Lifecycle({
    this.deleteAfterDays,
    this.deleteAfterEvent,
    this.moveToColdStorageAfterDays,
    this.optInToArchiveForSupportedResources,
  });

  factory Lifecycle.fromJson(Map<String, dynamic> json) {
    return Lifecycle(
      deleteAfterDays: json['DeleteAfterDays'] as int?,
      deleteAfterEvent: (json['DeleteAfterEvent'] as String?)
          ?.let(LifecycleDeleteAfterEvent.fromString),
      moveToColdStorageAfterDays: json['MoveToColdStorageAfterDays'] as int?,
      optInToArchiveForSupportedResources:
          json['OptInToArchiveForSupportedResources'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteAfterDays = this.deleteAfterDays;
    final deleteAfterEvent = this.deleteAfterEvent;
    final moveToColdStorageAfterDays = this.moveToColdStorageAfterDays;
    final optInToArchiveForSupportedResources =
        this.optInToArchiveForSupportedResources;
    return {
      if (deleteAfterDays != null) 'DeleteAfterDays': deleteAfterDays,
      if (deleteAfterEvent != null) 'DeleteAfterEvent': deleteAfterEvent.value,
      if (moveToColdStorageAfterDays != null)
        'MoveToColdStorageAfterDays': moveToColdStorageAfterDays,
      if (optInToArchiveForSupportedResources != null)
        'OptInToArchiveForSupportedResources':
            optInToArchiveForSupportedResources,
    };
  }
}

/// Contains <code>DeleteAt</code> and <code>MoveToColdStorageAt</code>
/// timestamps, which are used to specify a lifecycle for a recovery point.
///
/// The lifecycle defines when a protected resource is transitioned to cold
/// storage and when it expires. Backup transitions and expires backups
/// automatically according to the lifecycle that you define.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, the “retention” setting must be 90 days
/// greater than the “transition to cold after days” setting. The “transition to
/// cold after days” setting cannot be changed after a backup has been
/// transitioned to cold.
///
/// Resource types that can transition to cold storage are listed in the <a
/// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
/// availability by resource</a> table. Backup ignores this expression for other
/// resource types.
class CalculatedLifecycle {
  /// A timestamp that specifies when to delete a recovery point.
  final DateTime? deleteAt;

  /// A timestamp that specifies when to transition a recovery point to cold
  /// storage.
  final DateTime? moveToColdStorageAt;

  CalculatedLifecycle({
    this.deleteAt,
    this.moveToColdStorageAt,
  });

  factory CalculatedLifecycle.fromJson(Map<String, dynamic> json) {
    return CalculatedLifecycle(
      deleteAt: timeStampFromJson(json['DeleteAt']),
      moveToColdStorageAt: timeStampFromJson(json['MoveToColdStorageAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final deleteAt = this.deleteAt;
    final moveToColdStorageAt = this.moveToColdStorageAt;
    return {
      if (deleteAt != null) 'DeleteAt': unixTimestampToJson(deleteAt),
      if (moveToColdStorageAt != null)
        'MoveToColdStorageAt': unixTimestampToJson(moveToColdStorageAt),
    };
  }
}

class LifecycleDeleteAfterEvent {
  static const deleteAfterCopy =
      LifecycleDeleteAfterEvent._('DELETE_AFTER_COPY');

  final String value;

  const LifecycleDeleteAfterEvent._(this.value);

  static const values = [deleteAfterCopy];

  static LifecycleDeleteAfterEvent fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LifecycleDeleteAfterEvent._(value));

  @override
  bool operator ==(other) =>
      other is LifecycleDeleteAfterEvent && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IndexStatus {
  static const pending = IndexStatus._('PENDING');
  static const active = IndexStatus._('ACTIVE');
  static const failed = IndexStatus._('FAILED');
  static const deleting = IndexStatus._('DELETING');

  final String value;

  const IndexStatus._(this.value);

  static const values = [pending, active, failed, deleting];

  static IndexStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => IndexStatus._(value));

  @override
  bool operator ==(other) => other is IndexStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class Index {
  static const enabled = Index._('ENABLED');
  static const disabled = Index._('DISABLED');

  final String value;

  const Index._(this.value);

  static const values = [enabled, disabled];

  static Index fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Index._(value));

  @override
  bool operator ==(other) => other is Index && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about all of the controls of a framework. Each
/// framework must contain at least one control.
class FrameworkControl {
  /// The name of a control. This name is between 1 and 256 characters.
  final String controlName;

  /// The name/value pairs.
  final List<ControlInputParameter>? controlInputParameters;

  /// The scope of a control. The control scope defines what the control will
  /// evaluate. Three examples of control scopes are: a specific backup plan, all
  /// backup plans with a specific tag, or all backup plans.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_ControlScope.html">
  /// <code>ControlScope</code>.</a>
  final ControlScope? controlScope;

  FrameworkControl({
    required this.controlName,
    this.controlInputParameters,
    this.controlScope,
  });

  factory FrameworkControl.fromJson(Map<String, dynamic> json) {
    return FrameworkControl(
      controlName: (json['ControlName'] as String?) ?? '',
      controlInputParameters: (json['ControlInputParameters'] as List?)
          ?.nonNulls
          .map((e) => ControlInputParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      controlScope: json['ControlScope'] != null
          ? ControlScope.fromJson(json['ControlScope'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final controlName = this.controlName;
    final controlInputParameters = this.controlInputParameters;
    final controlScope = this.controlScope;
    return {
      'ControlName': controlName,
      if (controlInputParameters != null)
        'ControlInputParameters': controlInputParameters,
      if (controlScope != null) 'ControlScope': controlScope,
    };
  }
}

/// A framework consists of one or more controls. Each control has its own
/// control scope. The control scope can include one or more resource types, a
/// combination of a tag key and value, or a combination of one resource type
/// and one resource ID. If no scope is specified, evaluations for the rule are
/// triggered when any resource in your recording group changes in
/// configuration.
/// <note>
/// To set a control scope that includes all of a particular resource, leave the
/// <code>ControlScope</code> empty or do not pass it when calling
/// <code>CreateFramework</code>.
/// </note>
class ControlScope {
  /// The ID of the only Amazon Web Services resource that you want your control
  /// scope to contain.
  final List<String>? complianceResourceIds;

  /// Describes whether the control scope includes one or more types of resources,
  /// such as <code>EFS</code> or <code>RDS</code>.
  final List<String>? complianceResourceTypes;

  /// The tag key-value pair applied to those Amazon Web Services resources that
  /// you want to trigger an evaluation for a rule. A maximum of one key-value
  /// pair can be provided. The tag value is optional, but it cannot be an empty
  /// string if you are creating or editing a framework from the console (though
  /// the value can be an empty string when included in a CloudFormation
  /// template).
  ///
  /// The structure to assign a tag is:
  /// <code>[{"Key":"string","Value":"string"}]</code>.
  final Map<String, String>? tags;

  ControlScope({
    this.complianceResourceIds,
    this.complianceResourceTypes,
    this.tags,
  });

  factory ControlScope.fromJson(Map<String, dynamic> json) {
    return ControlScope(
      complianceResourceIds: (json['ComplianceResourceIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      complianceResourceTypes: (json['ComplianceResourceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final complianceResourceIds = this.complianceResourceIds;
    final complianceResourceTypes = this.complianceResourceTypes;
    final tags = this.tags;
    return {
      if (complianceResourceIds != null)
        'ComplianceResourceIds': complianceResourceIds,
      if (complianceResourceTypes != null)
        'ComplianceResourceTypes': complianceResourceTypes,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The parameters for a control. A control can have zero, one, or more than one
/// parameter. An example of a control with two parameters is: "backup plan
/// frequency is at least <code>daily</code> and the retention period is at
/// least <code>1 year</code>". The first parameter is <code>daily</code>. The
/// second parameter is <code>1 year</code>.
class ControlInputParameter {
  /// The name of a parameter, for example, <code>BackupPlanFrequency</code>.
  final String? parameterName;

  /// The value of parameter, for example, <code>hourly</code>.
  final String? parameterValue;

  ControlInputParameter({
    this.parameterName,
    this.parameterValue,
  });

  factory ControlInputParameter.fromJson(Map<String, dynamic> json) {
    return ControlInputParameter(
      parameterName: json['ParameterName'] as String?,
      parameterValue: json['ParameterValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    return {
      if (parameterName != null) 'ParameterName': parameterName,
      if (parameterValue != null) 'ParameterValue': parameterValue,
    };
  }
}

/// Contains configuration settings for malware scanning, including the scanner
/// type, target resource types, and scanner role.
class ScanSetting {
  /// The malware scanner to use for scanning. Currently only
  /// <code>GUARDDUTY</code> is supported.
  final MalwareScanner? malwareScanner;

  /// An array of resource types to be scanned for malware.
  final List<String>? resourceTypes;

  /// The Amazon Resource Name (ARN) of the IAM role that the scanner uses to
  /// access resources; for example,
  /// <code>arn:aws:iam::123456789012:role/ScannerRole</code>.
  final String? scannerRoleArn;

  ScanSetting({
    this.malwareScanner,
    this.resourceTypes,
    this.scannerRoleArn,
  });

  factory ScanSetting.fromJson(Map<String, dynamic> json) {
    return ScanSetting(
      malwareScanner:
          (json['MalwareScanner'] as String?)?.let(MalwareScanner.fromString),
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      scannerRoleArn: json['ScannerRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final malwareScanner = this.malwareScanner;
    final resourceTypes = this.resourceTypes;
    final scannerRoleArn = this.scannerRoleArn;
    return {
      if (malwareScanner != null) 'MalwareScanner': malwareScanner.value,
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
      if (scannerRoleArn != null) 'ScannerRoleArn': scannerRoleArn,
    };
  }
}

class MalwareScanner {
  static const guardduty = MalwareScanner._('GUARDDUTY');

  final String value;

  const MalwareScanner._(this.value);

  static const values = [guardduty];

  static MalwareScanner fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MalwareScanner._(value));

  @override
  bool operator ==(other) => other is MalwareScanner && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The backup options for each resource type.
class AdvancedBackupSetting {
  /// Specifies the backup option for a selected resource. This option is
  /// available for Windows VSS backup jobs and S3 backups.
  ///
  /// Valid values:
  ///
  /// Set to <code>"WindowsVSS":"enabled"</code> to enable the
  /// <code>WindowsVSS</code> backup option and create a Windows VSS backup.
  ///
  /// Set to <code>"WindowsVSS":"disabled"</code> to create a regular backup. The
  /// <code>WindowsVSS</code> option is not enabled by default.
  ///
  /// For S3 backups, set to <code>"BackupACLs":"disabled"</code> to exclude ACLs
  /// from the backup, or <code>"BackupObjectTags":"disabled"</code> to exclude
  /// object tags from the backup. By default, both ACLs and object tags are
  /// included in S3 backups.
  ///
  /// If you specify an invalid option, you get an
  /// <code>InvalidParameterValueException</code> exception.
  ///
  /// For more information about Windows VSS backups, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/windows-backups.html">Creating
  /// a VSS-Enabled Windows Backup</a>.
  final Map<String, String>? backupOptions;

  /// Specifies an object containing resource type and backup options. The only
  /// supported resource type is Amazon EC2 instances with Windows Volume Shadow
  /// Copy Service (VSS). For a CloudFormation example, see the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/integrate-cloudformation-with-aws-backup.html">sample
  /// CloudFormation template to enable Windows VSS</a> in the <i>Backup User
  /// Guide</i>.
  ///
  /// Valid values: <code>EC2</code>.
  final String? resourceType;

  AdvancedBackupSetting({
    this.backupOptions,
    this.resourceType,
  });

  factory AdvancedBackupSetting.fromJson(Map<String, dynamic> json) {
    return AdvancedBackupSetting(
      backupOptions: (json['BackupOptions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupOptions = this.backupOptions;
    final resourceType = this.resourceType;
    return {
      if (backupOptions != null) 'BackupOptions': backupOptions,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// Contains an optional backup plan display name and an array of
/// <code>BackupRule</code> objects, each of which specifies a backup rule. Each
/// rule in a backup plan is a separate scheduled task.
class BackupPlanInput {
  /// The display name of a backup plan. Must contain 1 to 50 alphanumeric or
  /// '-_.' characters.
  final String backupPlanName;

  /// An array of <code>BackupRule</code> objects, each of which specifies a
  /// scheduled task that is used to back up a selection of resources.
  final List<BackupRuleInput> rules;

  /// Specifies a list of <code>BackupOptions</code> for each resource type. These
  /// settings are only available for Windows Volume Shadow Copy Service (VSS)
  /// backup jobs.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  /// Contains your scanning configuration for the backup rule and includes the
  /// malware scanner, and scan mode of either full or incremental.
  final List<ScanSetting>? scanSettings;

  BackupPlanInput({
    required this.backupPlanName,
    required this.rules,
    this.advancedBackupSettings,
    this.scanSettings,
  });

  Map<String, dynamic> toJson() {
    final backupPlanName = this.backupPlanName;
    final rules = this.rules;
    final advancedBackupSettings = this.advancedBackupSettings;
    final scanSettings = this.scanSettings;
    return {
      'BackupPlanName': backupPlanName,
      'Rules': rules,
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
      if (scanSettings != null) 'ScanSettings': scanSettings,
    };
  }
}

/// Specifies a scheduled task used to back up a selection of resources.
class BackupRuleInput {
  /// A display name for a backup rule. Must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String targetBackupVaultName;

  /// A value in minutes after a backup job is successfully started before it must
  /// be completed or it will be canceled by Backup. This value is optional.
  final int? completionWindowMinutes;

  /// An array of <code>CopyAction</code> objects, which contains the details of
  /// the copy operation.
  final List<CopyAction>? copyActions;

  /// Specifies whether Backup creates continuous backups. True causes Backup to
  /// create continuous backups capable of point-in-time restore (PITR). False (or
  /// not specified) causes Backup to create snapshot backups.
  final bool? enableContinuousBackup;

  /// There can up to one IndexAction in each BackupRule, as each backup can have
  /// 0 or 1 backup index associated with it.
  ///
  /// Within the array is ResourceTypes. Only 1 resource type will be accepted for
  /// each BackupRule. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// </ul>
  final List<IndexAction>? indexActions;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold storage.
  ///
  /// Resource types that can transition to cold storage are listed in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table. Backup ignores this expression for other
  /// resource types.
  ///
  /// This parameter has a maximum value of 100 years (36,500 days).
  final Lifecycle? lifecycle;

  /// The tags to assign to the resources.
  final Map<String, String>? recoveryPointTags;

  /// Contains your scanning configuration for the backup rule and includes the
  /// malware scanner, and scan mode of either full or incremental.
  final List<ScanAction>? scanActions;

  /// A CRON expression in UTC specifying when Backup initiates a backup job. When
  /// no CRON expression is provided, Backup will use the default expression
  /// <code>cron(0 5 ? * * *)</code>.
  final String? scheduleExpression;

  /// The timezone in which the schedule expression is set. By default,
  /// ScheduleExpressions are in UTC. You can modify this to a specified timezone.
  final String? scheduleExpressionTimezone;

  /// A value in minutes after a backup is scheduled before a job will be canceled
  /// if it doesn't start successfully. This value is optional. If this value is
  /// included, it must be at least 60 minutes to avoid errors.
  ///
  /// This parameter has a maximum value of 100 years (52,560,000 minutes).
  ///
  /// During the start window, the backup job status remains in
  /// <code>CREATED</code> status until it has successfully begun or until the
  /// start window time has run out. If within the start window time Backup
  /// receives an error that allows the job to be retried, Backup will
  /// automatically retry to begin the job at least every 10 minutes until the
  /// backup successfully begins (the job status changes to <code>RUNNING</code>)
  /// or until the job status changes to <code>EXPIRED</code> (which is expected
  /// to occur when the start window time is over).
  final int? startWindowMinutes;

  /// The ARN of a logically air-gapped vault. ARN must be in the same account and
  /// Region. If provided, supported fully managed resources back up directly to
  /// logically air-gapped vault, while other supported resources create a
  /// temporary (billable) snapshot in backup vault, then copy it to logically
  /// air-gapped vault. Unsupported resources only back up to the specified backup
  /// vault.
  final String? targetLogicallyAirGappedBackupVaultArn;

  BackupRuleInput({
    required this.ruleName,
    required this.targetBackupVaultName,
    this.completionWindowMinutes,
    this.copyActions,
    this.enableContinuousBackup,
    this.indexActions,
    this.lifecycle,
    this.recoveryPointTags,
    this.scanActions,
    this.scheduleExpression,
    this.scheduleExpressionTimezone,
    this.startWindowMinutes,
    this.targetLogicallyAirGappedBackupVaultArn,
  });

  Map<String, dynamic> toJson() {
    final ruleName = this.ruleName;
    final targetBackupVaultName = this.targetBackupVaultName;
    final completionWindowMinutes = this.completionWindowMinutes;
    final copyActions = this.copyActions;
    final enableContinuousBackup = this.enableContinuousBackup;
    final indexActions = this.indexActions;
    final lifecycle = this.lifecycle;
    final recoveryPointTags = this.recoveryPointTags;
    final scanActions = this.scanActions;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowMinutes = this.startWindowMinutes;
    final targetLogicallyAirGappedBackupVaultArn =
        this.targetLogicallyAirGappedBackupVaultArn;
    return {
      'RuleName': ruleName,
      'TargetBackupVaultName': targetBackupVaultName,
      if (completionWindowMinutes != null)
        'CompletionWindowMinutes': completionWindowMinutes,
      if (copyActions != null) 'CopyActions': copyActions,
      if (enableContinuousBackup != null)
        'EnableContinuousBackup': enableContinuousBackup,
      if (indexActions != null) 'IndexActions': indexActions,
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (recoveryPointTags != null) 'RecoveryPointTags': recoveryPointTags,
      if (scanActions != null) 'ScanActions': scanActions,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowMinutes != null) 'StartWindowMinutes': startWindowMinutes,
      if (targetLogicallyAirGappedBackupVaultArn != null)
        'TargetLogicallyAirGappedBackupVaultArn':
            targetLogicallyAirGappedBackupVaultArn,
    };
  }
}

/// Defines a scanning action that specifies the malware scanner and scan mode
/// to use.
class ScanAction {
  /// The malware scanner to use for the scan action. Currently only
  /// <code>GUARDDUTY</code> is supported.
  final MalwareScanner? malwareScanner;

  /// The scanning mode to use for the scan action.
  ///
  /// Valid values: <code>FULL_SCAN</code> | <code>INCREMENTAL_SCAN</code>.
  final ScanMode? scanMode;

  ScanAction({
    this.malwareScanner,
    this.scanMode,
  });

  factory ScanAction.fromJson(Map<String, dynamic> json) {
    return ScanAction(
      malwareScanner:
          (json['MalwareScanner'] as String?)?.let(MalwareScanner.fromString),
      scanMode: (json['ScanMode'] as String?)?.let(ScanMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final malwareScanner = this.malwareScanner;
    final scanMode = this.scanMode;
    return {
      if (malwareScanner != null) 'MalwareScanner': malwareScanner.value,
      if (scanMode != null) 'ScanMode': scanMode.value,
    };
  }
}

class ScanMode {
  static const fullScan = ScanMode._('FULL_SCAN');
  static const incrementalScan = ScanMode._('INCREMENTAL_SCAN');

  final String value;

  const ScanMode._(this.value);

  static const values = [fullScan, incrementalScan];

  static ScanMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanMode._(value));

  @override
  bool operator ==(other) => other is ScanMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is an optional array within a BackupRule.
///
/// IndexAction consists of one ResourceTypes.
class IndexAction {
  /// 0 or 1 index action will be accepted for each BackupRule.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// </ul>
  final List<String>? resourceTypes;

  IndexAction({
    this.resourceTypes,
  });

  factory IndexAction.fromJson(Map<String, dynamic> json) {
    return IndexAction(
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTypes = this.resourceTypes;
    return {
      if (resourceTypes != null) 'ResourceTypes': resourceTypes,
    };
  }
}

/// The details of the copy operation.
class CopyAction {
  /// An Amazon Resource Name (ARN) that uniquely identifies the destination
  /// backup vault for the copied backup. For example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String destinationBackupVaultArn;
  final Lifecycle? lifecycle;

  CopyAction({
    required this.destinationBackupVaultArn,
    this.lifecycle,
  });

  factory CopyAction.fromJson(Map<String, dynamic> json) {
    return CopyAction(
      destinationBackupVaultArn:
          (json['DestinationBackupVaultArn'] as String?) ?? '',
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationBackupVaultArn = this.destinationBackupVaultArn;
    final lifecycle = this.lifecycle;
    return {
      'DestinationBackupVaultArn': destinationBackupVaultArn,
      if (lifecycle != null) 'Lifecycle': lifecycle,
    };
  }
}

class RestoreValidationStatus {
  static const failed = RestoreValidationStatus._('FAILED');
  static const successful = RestoreValidationStatus._('SUCCESSFUL');
  static const timedOut = RestoreValidationStatus._('TIMED_OUT');
  static const validating = RestoreValidationStatus._('VALIDATING');

  final String value;

  const RestoreValidationStatus._(this.value);

  static const values = [failed, successful, timedOut, validating];

  static RestoreValidationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RestoreValidationStatus._(value));

  @override
  bool operator ==(other) =>
      other is RestoreValidationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class BackupVaultEvent {
  static const backupJobStarted = BackupVaultEvent._('BACKUP_JOB_STARTED');
  static const backupJobCompleted = BackupVaultEvent._('BACKUP_JOB_COMPLETED');
  static const backupJobSuccessful =
      BackupVaultEvent._('BACKUP_JOB_SUCCESSFUL');
  static const backupJobFailed = BackupVaultEvent._('BACKUP_JOB_FAILED');
  static const backupJobExpired = BackupVaultEvent._('BACKUP_JOB_EXPIRED');
  static const restoreJobStarted = BackupVaultEvent._('RESTORE_JOB_STARTED');
  static const restoreJobCompleted =
      BackupVaultEvent._('RESTORE_JOB_COMPLETED');
  static const restoreJobSuccessful =
      BackupVaultEvent._('RESTORE_JOB_SUCCESSFUL');
  static const restoreJobFailed = BackupVaultEvent._('RESTORE_JOB_FAILED');
  static const copyJobStarted = BackupVaultEvent._('COPY_JOB_STARTED');
  static const copyJobSuccessful = BackupVaultEvent._('COPY_JOB_SUCCESSFUL');
  static const copyJobFailed = BackupVaultEvent._('COPY_JOB_FAILED');
  static const recoveryPointModified =
      BackupVaultEvent._('RECOVERY_POINT_MODIFIED');
  static const backupPlanCreated = BackupVaultEvent._('BACKUP_PLAN_CREATED');
  static const backupPlanModified = BackupVaultEvent._('BACKUP_PLAN_MODIFIED');
  static const s3BackupObjectFailed =
      BackupVaultEvent._('S3_BACKUP_OBJECT_FAILED');
  static const s3RestoreObjectFailed =
      BackupVaultEvent._('S3_RESTORE_OBJECT_FAILED');
  static const continuousBackupInterrupted =
      BackupVaultEvent._('CONTINUOUS_BACKUP_INTERRUPTED');
  static const recoveryPointIndexCompleted =
      BackupVaultEvent._('RECOVERY_POINT_INDEX_COMPLETED');
  static const recoveryPointIndexDeleted =
      BackupVaultEvent._('RECOVERY_POINT_INDEX_DELETED');
  static const recoveryPointIndexingFailed =
      BackupVaultEvent._('RECOVERY_POINT_INDEXING_FAILED');
  static const eksRestoreObjectFailed =
      BackupVaultEvent._('EKS_RESTORE_OBJECT_FAILED');
  static const eksRestoreObjectSkipped =
      BackupVaultEvent._('EKS_RESTORE_OBJECT_SKIPPED');
  static const eksBackupObjectFailed =
      BackupVaultEvent._('EKS_BACKUP_OBJECT_FAILED');

  final String value;

  const BackupVaultEvent._(this.value);

  static const values = [
    backupJobStarted,
    backupJobCompleted,
    backupJobSuccessful,
    backupJobFailed,
    backupJobExpired,
    restoreJobStarted,
    restoreJobCompleted,
    restoreJobSuccessful,
    restoreJobFailed,
    copyJobStarted,
    copyJobSuccessful,
    copyJobFailed,
    recoveryPointModified,
    backupPlanCreated,
    backupPlanModified,
    s3BackupObjectFailed,
    s3RestoreObjectFailed,
    continuousBackupInterrupted,
    recoveryPointIndexCompleted,
    recoveryPointIndexDeleted,
    recoveryPointIndexingFailed,
    eksRestoreObjectFailed,
    eksRestoreObjectSkipped,
    eksBackupObjectFailed
  ];

  static BackupVaultEvent fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BackupVaultEvent._(value));

  @override
  bool operator ==(other) => other is BackupVaultEvent && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains metadata about a tiering configuration returned in a list.
class TieringConfigurationsListMember {
  /// The name of the backup vault where the tiering configuration applies. Use
  /// <code>*</code> to apply to all backup vaults.
  final String? backupVaultName;

  /// The date and time a tiering configuration was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087AM.
  final DateTime? creationTime;

  /// The date and time a tiering configuration was updated, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastUpdatedTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087AM.
  final DateTime? lastUpdatedTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies the tiering
  /// configuration.
  final String? tieringConfigurationArn;

  /// The unique name of the tiering configuration.
  final String? tieringConfigurationName;

  TieringConfigurationsListMember({
    this.backupVaultName,
    this.creationTime,
    this.lastUpdatedTime,
    this.tieringConfigurationArn,
    this.tieringConfigurationName,
  });

  factory TieringConfigurationsListMember.fromJson(Map<String, dynamic> json) {
    return TieringConfigurationsListMember(
      backupVaultName: json['BackupVaultName'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      tieringConfigurationArn: json['TieringConfigurationArn'] as String?,
      tieringConfigurationName: json['TieringConfigurationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultName = this.backupVaultName;
    final creationTime = this.creationTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final tieringConfigurationArn = this.tieringConfigurationArn;
    final tieringConfigurationName = this.tieringConfigurationName;
    return {
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (tieringConfigurationArn != null)
        'TieringConfigurationArn': tieringConfigurationArn,
      if (tieringConfigurationName != null)
        'TieringConfigurationName': tieringConfigurationName,
    };
  }
}

/// Contains summary information about scan jobs, including counts and metadata
/// for a specific time period and criteria.
class ScanJobSummary {
  /// The account ID that owns the scan jobs included in this summary.
  final String? accountId;

  /// The number of scan jobs that match the specified criteria.
  final int? count;

  /// The value of time in number format of a job end time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? endTime;

  /// Specifies the malware scanner used during the scan job. Currently only
  /// supports <code>GUARDDUTY</code>.
  final MalwareScanner? malwareScanner;

  /// The Amazon Web Services Region where the scan jobs were executed.
  final String? region;

  /// The type of Amazon Web Services resource for the scan jobs included in this
  /// summary.
  final String? resourceType;

  /// The scan result status for the scan jobs included in this summary.
  ///
  /// Valid values: <code>THREATS_FOUND</code> | <code>NO_THREATS_FOUND</code>.
  final ScanResultStatus? scanResultStatus;

  /// The value of time in number format of a job start time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startTime;

  /// The state of the scan jobs included in this summary.
  ///
  /// Valid values: <code>CREATED</code> | <code>RUNNING</code> |
  /// <code>COMPLETED</code> | <code>COMPLETED_WITH_ISSUES</code> |
  /// <code>FAILED</code> | <code>CANCELED</code>.
  final ScanJobStatus? state;

  ScanJobSummary({
    this.accountId,
    this.count,
    this.endTime,
    this.malwareScanner,
    this.region,
    this.resourceType,
    this.scanResultStatus,
    this.startTime,
    this.state,
  });

  factory ScanJobSummary.fromJson(Map<String, dynamic> json) {
    return ScanJobSummary(
      accountId: json['AccountId'] as String?,
      count: json['Count'] as int?,
      endTime: timeStampFromJson(json['EndTime']),
      malwareScanner:
          (json['MalwareScanner'] as String?)?.let(MalwareScanner.fromString),
      region: json['Region'] as String?,
      resourceType: json['ResourceType'] as String?,
      scanResultStatus: (json['ScanResultStatus'] as String?)
          ?.let(ScanResultStatus.fromString),
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.let(ScanJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final count = this.count;
    final endTime = this.endTime;
    final malwareScanner = this.malwareScanner;
    final region = this.region;
    final resourceType = this.resourceType;
    final scanResultStatus = this.scanResultStatus;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (count != null) 'Count': count,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (malwareScanner != null) 'MalwareScanner': malwareScanner.value,
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType,
      if (scanResultStatus != null) 'ScanResultStatus': scanResultStatus.value,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.value,
    };
  }
}

class ScanJobStatus {
  static const created = ScanJobStatus._('CREATED');
  static const completed = ScanJobStatus._('COMPLETED');
  static const completedWithIssues = ScanJobStatus._('COMPLETED_WITH_ISSUES');
  static const running = ScanJobStatus._('RUNNING');
  static const failed = ScanJobStatus._('FAILED');
  static const canceled = ScanJobStatus._('CANCELED');
  static const aggregateAll = ScanJobStatus._('AGGREGATE_ALL');
  static const any = ScanJobStatus._('ANY');

  final String value;

  const ScanJobStatus._(this.value);

  static const values = [
    created,
    completed,
    completedWithIssues,
    running,
    failed,
    canceled,
    aggregateAll,
    any
  ];

  static ScanJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanJobStatus._(value));

  @override
  bool operator ==(other) => other is ScanJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ScanResultStatus {
  static const noThreatsFound = ScanResultStatus._('NO_THREATS_FOUND');
  static const threatsFound = ScanResultStatus._('THREATS_FOUND');
  static const unknown = ScanResultStatus._('UNKNOWN');

  final String value;

  const ScanResultStatus._(this.value);

  static const values = [noThreatsFound, threatsFound, unknown];

  static ScanResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanResultStatus._(value));

  @override
  bool operator ==(other) => other is ScanResultStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AggregationPeriod {
  static const oneDay = AggregationPeriod._('ONE_DAY');
  static const sevenDays = AggregationPeriod._('SEVEN_DAYS');
  static const fourteenDays = AggregationPeriod._('FOURTEEN_DAYS');

  final String value;

  const AggregationPeriod._(this.value);

  static const values = [oneDay, sevenDays, fourteenDays];

  static AggregationPeriod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AggregationPeriod._(value));

  @override
  bool operator ==(other) => other is AggregationPeriod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metadata about a scan job, including information about the scanning
/// process, results, and associated resources.
class ScanJob {
  /// The account ID that owns the scan job.
  final String accountId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String backupVaultName;

  /// Contains identifying information about the creation of a scan job.
  final ScanJobCreator createdBy;

  /// The date and time that a scan job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime creationDate;

  /// Specifies the IAM role ARN used to create the scan job; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The scanning engine used for the scan job. Currently only
  /// <code>GUARDDUTY</code> is supported.
  final MalwareScanner malwareScanner;

  /// An ARN that uniquely identifies the recovery point being scanned; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String recoveryPointArn;

  /// An ARN that uniquely identifies the source resource of the recovery point
  /// being scanned.
  final String resourceArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String resourceName;

  /// The type of Amazon Web Services resource being scanned; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  final ScanResourceType resourceType;

  /// The unique identifier that identifies the scan job request to Backup.
  final String scanJobId;

  /// Specifies the scan type use for the scan job.
  ///
  /// Includes:
  ///
  /// <code>FULL_SCAN</code> will scan the entire data lineage within the backup.
  ///
  /// <code>INCREMENTAL_SCAN</code> will scan the data difference between the
  /// target recovery point and base recovery point ARN.
  final ScanMode scanMode;

  /// Specifies the scanner IAM role ARN used for the scan job.
  final String scannerRoleArn;

  /// The date and time that a scan job is completed, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CompletionDate</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// The point in time the scan job scanned up to for a continuous backup.
  final DateTime? continuousScanEndTime;

  /// The point in time the scan job started scan from for a continuous backup.
  final DateTime? continuousScanStartTime;

  /// An ARN that uniquely identifies the base recovery point for scanning. This
  /// field is populated when an incremental scan job has taken place.
  final String? scanBaseRecoveryPointArn;

  /// The scan ID generated by the malware scanner for the corresponding scan job.
  final String? scanId;

  /// Contains the scan results information, including the status of threats found
  /// during scanning.
  final ScanResultInfo? scanResult;

  /// The current state of the scan job.
  ///
  /// Valid values: <code>CREATED</code> | <code>RUNNING</code> |
  /// <code>COMPLETED</code> | <code>COMPLETED_WITH_ISSUES</code> |
  /// <code>FAILED</code> | <code>CANCELED</code>.
  final ScanState? state;

  /// A detailed message explaining the status of the scan job.
  final String? statusMessage;

  ScanJob({
    required this.accountId,
    required this.backupVaultArn,
    required this.backupVaultName,
    required this.createdBy,
    required this.creationDate,
    required this.iamRoleArn,
    required this.malwareScanner,
    required this.recoveryPointArn,
    required this.resourceArn,
    required this.resourceName,
    required this.resourceType,
    required this.scanJobId,
    required this.scanMode,
    required this.scannerRoleArn,
    this.completionDate,
    this.continuousScanEndTime,
    this.continuousScanStartTime,
    this.scanBaseRecoveryPointArn,
    this.scanId,
    this.scanResult,
    this.state,
    this.statusMessage,
  });

  factory ScanJob.fromJson(Map<String, dynamic> json) {
    return ScanJob(
      accountId: (json['AccountId'] as String?) ?? '',
      backupVaultArn: (json['BackupVaultArn'] as String?) ?? '',
      backupVaultName: (json['BackupVaultName'] as String?) ?? '',
      createdBy: ScanJobCreator.fromJson(
          (json['CreatedBy'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      creationDate: nonNullableTimeStampFromJson(json['CreationDate'] ?? 0),
      iamRoleArn: (json['IamRoleArn'] as String?) ?? '',
      malwareScanner:
          MalwareScanner.fromString((json['MalwareScanner'] as String?) ?? ''),
      recoveryPointArn: (json['RecoveryPointArn'] as String?) ?? '',
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      resourceName: (json['ResourceName'] as String?) ?? '',
      resourceType:
          ScanResourceType.fromString((json['ResourceType'] as String?) ?? ''),
      scanJobId: (json['ScanJobId'] as String?) ?? '',
      scanMode: ScanMode.fromString((json['ScanMode'] as String?) ?? ''),
      scannerRoleArn: (json['ScannerRoleArn'] as String?) ?? '',
      completionDate: timeStampFromJson(json['CompletionDate']),
      continuousScanEndTime: timeStampFromJson(json['ContinuousScanEndTime']),
      continuousScanStartTime:
          timeStampFromJson(json['ContinuousScanStartTime']),
      scanBaseRecoveryPointArn: json['ScanBaseRecoveryPointArn'] as String?,
      scanId: json['ScanId'] as String?,
      scanResult: json['ScanResult'] != null
          ? ScanResultInfo.fromJson(json['ScanResult'] as Map<String, dynamic>)
          : null,
      state: (json['State'] as String?)?.let(ScanState.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final iamRoleArn = this.iamRoleArn;
    final malwareScanner = this.malwareScanner;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final scanJobId = this.scanJobId;
    final scanMode = this.scanMode;
    final scannerRoleArn = this.scannerRoleArn;
    final completionDate = this.completionDate;
    final continuousScanEndTime = this.continuousScanEndTime;
    final continuousScanStartTime = this.continuousScanStartTime;
    final scanBaseRecoveryPointArn = this.scanBaseRecoveryPointArn;
    final scanId = this.scanId;
    final scanResult = this.scanResult;
    final state = this.state;
    final statusMessage = this.statusMessage;
    return {
      'AccountId': accountId,
      'BackupVaultArn': backupVaultArn,
      'BackupVaultName': backupVaultName,
      'CreatedBy': createdBy,
      'CreationDate': unixTimestampToJson(creationDate),
      'IamRoleArn': iamRoleArn,
      'MalwareScanner': malwareScanner.value,
      'RecoveryPointArn': recoveryPointArn,
      'ResourceArn': resourceArn,
      'ResourceName': resourceName,
      'ResourceType': resourceType.value,
      'ScanJobId': scanJobId,
      'ScanMode': scanMode.value,
      'ScannerRoleArn': scannerRoleArn,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (continuousScanEndTime != null)
        'ContinuousScanEndTime': unixTimestampToJson(continuousScanEndTime),
      if (continuousScanStartTime != null)
        'ContinuousScanStartTime': unixTimestampToJson(continuousScanStartTime),
      if (scanBaseRecoveryPointArn != null)
        'ScanBaseRecoveryPointArn': scanBaseRecoveryPointArn,
      if (scanId != null) 'ScanId': scanId,
      if (scanResult != null) 'ScanResult': scanResult,
      if (state != null) 'State': state.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Contains identifying information about the creation of a scan job, including
/// the backup plan and rule that initiated the scan.
class ScanJobCreator {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  final String backupPlanArn;

  /// The ID of the backup plan.
  final String backupPlanId;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version IDs cannot be edited.
  final String backupPlanVersion;

  /// Uniquely identifies the backup rule that initiated the scan job.
  final String backupRuleId;

  ScanJobCreator({
    required this.backupPlanArn,
    required this.backupPlanId,
    required this.backupPlanVersion,
    required this.backupRuleId,
  });

  factory ScanJobCreator.fromJson(Map<String, dynamic> json) {
    return ScanJobCreator(
      backupPlanArn: (json['BackupPlanArn'] as String?) ?? '',
      backupPlanId: (json['BackupPlanId'] as String?) ?? '',
      backupPlanVersion: (json['BackupPlanVersion'] as String?) ?? '',
      backupRuleId: (json['BackupRuleId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final backupPlanVersion = this.backupPlanVersion;
    final backupRuleId = this.backupRuleId;
    return {
      'BackupPlanArn': backupPlanArn,
      'BackupPlanId': backupPlanId,
      'BackupPlanVersion': backupPlanVersion,
      'BackupRuleId': backupRuleId,
    };
  }
}

class ScanResourceType {
  static const ebs = ScanResourceType._('EBS');
  static const ec2 = ScanResourceType._('EC2');
  static const s3 = ScanResourceType._('S3');

  final String value;

  const ScanResourceType._(this.value);

  static const values = [ebs, ec2, s3];

  static ScanResourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanResourceType._(value));

  @override
  bool operator ==(other) => other is ScanResourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the results of a scan job.
class ScanResultInfo {
  /// The status of the scan results.
  ///
  /// Valid values: <code>THREATS_FOUND</code> | <code>NO_THREATS_FOUND</code> |
  /// <code>UNKNOWN</code>.
  final ScanResultStatus scanResultStatus;

  ScanResultInfo({
    required this.scanResultStatus,
  });

  factory ScanResultInfo.fromJson(Map<String, dynamic> json) {
    return ScanResultInfo(
      scanResultStatus: ScanResultStatus.fromString(
          (json['ScanResultStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final scanResultStatus = this.scanResultStatus;
    return {
      'ScanResultStatus': scanResultStatus.value,
    };
  }
}

class ScanState {
  static const canceled = ScanState._('CANCELED');
  static const completed = ScanState._('COMPLETED');
  static const completedWithIssues = ScanState._('COMPLETED_WITH_ISSUES');
  static const created = ScanState._('CREATED');
  static const failed = ScanState._('FAILED');
  static const running = ScanState._('RUNNING');

  final String value;

  const ScanState._(this.value);

  static const values = [
    canceled,
    completed,
    completedWithIssues,
    created,
    failed,
    running
  ];

  static ScanState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanState._(value));

  @override
  bool operator ==(other) => other is ScanState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains metadata about a restore testing selection.
class RestoreTestingSelectionForList {
  /// The date and time that a restore testing selection was created, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CreationTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26,2018 12:11:30.087 AM.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the IAM role that Backup uses to create
  /// the target resource; for example:
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The type of Amazon Web Services resource included in a restore testing
  /// selection; for example, an Amazon EBS volume or an Amazon RDS database.
  final String protectedResourceType;

  /// Unique string that is the name of the restore testing plan.
  ///
  /// The name cannot be changed after creation. The name must consist of only
  /// alphanumeric characters and underscores. Maximum length is 50.
  final String restoreTestingPlanName;

  /// Unique name of a restore testing selection.
  ///
  /// The name consists of only alphanumeric characters and underscores. Maximum
  /// length is 50.
  final String restoreTestingSelectionName;

  /// This value represents the time, in hours, data is retained after a restore
  /// test so that optional validation can be completed.
  ///
  /// Accepted value is an integer between 0 and 168 (the hourly equivalent of
  /// seven days).
  final int? validationWindowHours;

  RestoreTestingSelectionForList({
    required this.creationTime,
    required this.iamRoleArn,
    required this.protectedResourceType,
    required this.restoreTestingPlanName,
    required this.restoreTestingSelectionName,
    this.validationWindowHours,
  });

  factory RestoreTestingSelectionForList.fromJson(Map<String, dynamic> json) {
    return RestoreTestingSelectionForList(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      iamRoleArn: (json['IamRoleArn'] as String?) ?? '',
      protectedResourceType: (json['ProtectedResourceType'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
      restoreTestingSelectionName:
          (json['RestoreTestingSelectionName'] as String?) ?? '',
      validationWindowHours: json['ValidationWindowHours'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final iamRoleArn = this.iamRoleArn;
    final protectedResourceType = this.protectedResourceType;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final restoreTestingSelectionName = this.restoreTestingSelectionName;
    final validationWindowHours = this.validationWindowHours;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'IamRoleArn': iamRoleArn,
      'ProtectedResourceType': protectedResourceType,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'RestoreTestingSelectionName': restoreTestingSelectionName,
      if (validationWindowHours != null)
        'ValidationWindowHours': validationWindowHours,
    };
  }
}

/// This contains metadata about a restore testing plan.
class RestoreTestingPlanForList {
  /// The date and time that a restore testing plan was created, in Unix format
  /// and Coordinated Universal Time (UTC). The value of <code>CreationTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime creationTime;

  /// An Amazon Resource Name (ARN) that uniquely identifiesa restore testing
  /// plan.
  final String restoreTestingPlanArn;

  /// The restore testing plan name.
  final String restoreTestingPlanName;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed. When no CRON expression is provided, Backup will use the default
  /// expression <code>cron(0 5 ? * * *)</code>.
  final String scheduleExpression;

  /// The last time a restore test was run with the specified restore testing
  /// plan. A date and time, in Unix format and Coordinated Universal Time (UTC).
  /// The value of <code>LastExecutionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  final DateTime? lastExecutionTime;

  /// The date and time that the restore testing plan was updated. This update is
  /// in Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>LastUpdateTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastUpdateTime;

  /// Optional. This is the timezone in which the schedule expression is set. By
  /// default, ScheduleExpressions are in UTC. You can modify this to a specified
  /// timezone.
  final String? scheduleExpressionTimezone;

  /// Defaults to 24 hours.
  ///
  /// A value in hours after a restore test is scheduled before a job will be
  /// canceled if it doesn't start successfully. This value is optional. If this
  /// value is included, this parameter has a maximum value of 168 hours (one
  /// week).
  final int? startWindowHours;

  RestoreTestingPlanForList({
    required this.creationTime,
    required this.restoreTestingPlanArn,
    required this.restoreTestingPlanName,
    required this.scheduleExpression,
    this.lastExecutionTime,
    this.lastUpdateTime,
    this.scheduleExpressionTimezone,
    this.startWindowHours,
  });

  factory RestoreTestingPlanForList.fromJson(Map<String, dynamic> json) {
    return RestoreTestingPlanForList(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      restoreTestingPlanArn: (json['RestoreTestingPlanArn'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
      scheduleExpression: (json['ScheduleExpression'] as String?) ?? '',
      lastExecutionTime: timeStampFromJson(json['LastExecutionTime']),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      scheduleExpressionTimezone: json['ScheduleExpressionTimezone'] as String?,
      startWindowHours: json['StartWindowHours'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final restoreTestingPlanArn = this.restoreTestingPlanArn;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final scheduleExpression = this.scheduleExpression;
    final lastExecutionTime = this.lastExecutionTime;
    final lastUpdateTime = this.lastUpdateTime;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowHours = this.startWindowHours;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'RestoreTestingPlanArn': restoreTestingPlanArn,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'ScheduleExpression': scheduleExpression,
      if (lastExecutionTime != null)
        'LastExecutionTime': unixTimestampToJson(lastExecutionTime),
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowHours != null) 'StartWindowHours': startWindowHours,
    };
  }
}

/// This is a summary of restore jobs created or running within the most recent
/// 30 days.
///
/// The returned summary may contain the following: Region, Account, State,
/// ResourceType, MessageCategory, StartTime, EndTime, and Count of included
/// jobs.
class RestoreJobSummary {
  /// The account ID that owns the jobs within the summary.
  final String? accountId;

  /// The value as a number of jobs in a job summary.
  final int? count;

  /// The value of time in number format of a job end time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? endTime;

  /// The Amazon Web Services Regions within the job summary.
  final String? region;

  /// This value is the job count for the specified resource type. The request
  /// <code>GetSupportedResourceTypes</code> returns strings for supported
  /// resource types.
  final String? resourceType;

  /// The value of time in number format of a job start time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startTime;

  /// This value is job count for jobs with the specified state.
  final RestoreJobState? state;

  RestoreJobSummary({
    this.accountId,
    this.count,
    this.endTime,
    this.region,
    this.resourceType,
    this.startTime,
    this.state,
  });

  factory RestoreJobSummary.fromJson(Map<String, dynamic> json) {
    return RestoreJobSummary(
      accountId: json['AccountId'] as String?,
      count: json['Count'] as int?,
      endTime: timeStampFromJson(json['EndTime']),
      region: json['Region'] as String?,
      resourceType: json['ResourceType'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.let(RestoreJobState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final count = this.count;
    final endTime = this.endTime;
    final region = this.region;
    final resourceType = this.resourceType;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (count != null) 'Count': count,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.value,
    };
  }
}

class RestoreJobState {
  static const created = RestoreJobState._('CREATED');
  static const pending = RestoreJobState._('PENDING');
  static const running = RestoreJobState._('RUNNING');
  static const aborted = RestoreJobState._('ABORTED');
  static const completed = RestoreJobState._('COMPLETED');
  static const failed = RestoreJobState._('FAILED');
  static const aggregateAll = RestoreJobState._('AGGREGATE_ALL');
  static const any = RestoreJobState._('ANY');

  final String value;

  const RestoreJobState._(this.value);

  static const values = [
    created,
    pending,
    running,
    aborted,
    completed,
    failed,
    aggregateAll,
    any
  ];

  static RestoreJobState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RestoreJobState._(value));

  @override
  bool operator ==(other) => other is RestoreJobState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metadata about a restore job.
class RestoreJobsListMember {
  /// The account ID that owns the restore job.
  final String? accountId;

  /// The size, in bytes, of the restored resource.
  final int? backupSizeInBytes;

  /// The Amazon Resource Name (ARN) of the backup vault containing the recovery
  /// point being restored. This helps identify vault access policies and
  /// permissions.
  final String? backupVaultArn;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// Contains identifying information about the creation of a restore job.
  final RestoreJobCreator? createdBy;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? createdResourceArn;

  /// The date and time a restore job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// This notes the status of the data generated by the restore test. The status
  /// may be <code>Deleting</code>, <code>Failed</code>, or
  /// <code>Successful</code>.
  final RestoreDeletionStatus? deletionStatus;

  /// This describes the restore job deletion status.
  final String? deletionStatusMessage;

  /// The amount of time in minutes that a job restoring a recovery point is
  /// expected to take.
  final int? expectedCompletionTimeMinutes;

  /// The IAM role ARN used to create the target recovery point; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// This is a boolean value indicating whether the restore job is a parent
  /// (composite) restore job.
  final bool? isParent;

  /// This is the unique identifier of the parent restore job for the selected
  /// restore job.
  final String? parentJobId;

  /// Contains an estimated percentage complete of a job at the time the job
  /// status was queried.
  final String? percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// The date on which a recovery point was created.
  final DateTime? recoveryPointCreationDate;

  /// The resource type of the listed restore jobs; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database. For Windows Volume Shadow Copy Service (VSS) backups,
  /// the only supported resource type is Amazon EC2.
  final String? resourceType;

  /// Uniquely identifies the job that restores a recovery point.
  final String? restoreJobId;

  /// The Amazon Resource Name (ARN) of the original resource that was backed up.
  /// This provides context about what resource is being restored.
  final String? sourceResourceArn;

  /// A status code specifying the state of the job initiated by Backup to restore
  /// a recovery point.
  final RestoreJobStatus? status;

  /// A detailed message explaining the status of the job to restore a recovery
  /// point.
  final String? statusMessage;

  /// The status of validation run on the indicated restore job.
  final RestoreValidationStatus? validationStatus;

  /// This describes the status of validation run on the indicated restore job.
  final String? validationStatusMessage;

  RestoreJobsListMember({
    this.accountId,
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.completionDate,
    this.createdBy,
    this.createdResourceArn,
    this.creationDate,
    this.deletionStatus,
    this.deletionStatusMessage,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.isParent,
    this.parentJobId,
    this.percentDone,
    this.recoveryPointArn,
    this.recoveryPointCreationDate,
    this.resourceType,
    this.restoreJobId,
    this.sourceResourceArn,
    this.status,
    this.statusMessage,
    this.validationStatus,
    this.validationStatusMessage,
  });

  factory RestoreJobsListMember.fromJson(Map<String, dynamic> json) {
    return RestoreJobsListMember(
      accountId: json['AccountId'] as String?,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      backupVaultArn: json['BackupVaultArn'] as String?,
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RestoreJobCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdResourceArn: json['CreatedResourceArn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      deletionStatus: (json['DeletionStatus'] as String?)
          ?.let(RestoreDeletionStatus.fromString),
      deletionStatusMessage: json['DeletionStatusMessage'] as String?,
      expectedCompletionTimeMinutes:
          json['ExpectedCompletionTimeMinutes'] as int?,
      iamRoleArn: json['IamRoleArn'] as String?,
      isParent: json['IsParent'] as bool?,
      parentJobId: json['ParentJobId'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      recoveryPointCreationDate:
          timeStampFromJson(json['RecoveryPointCreationDate']),
      resourceType: json['ResourceType'] as String?,
      restoreJobId: json['RestoreJobId'] as String?,
      sourceResourceArn: json['SourceResourceArn'] as String?,
      status: (json['Status'] as String?)?.let(RestoreJobStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      validationStatus: (json['ValidationStatus'] as String?)
          ?.let(RestoreValidationStatus.fromString),
      validationStatusMessage: json['ValidationStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupVaultArn = this.backupVaultArn;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final createdResourceArn = this.createdResourceArn;
    final creationDate = this.creationDate;
    final deletionStatus = this.deletionStatus;
    final deletionStatusMessage = this.deletionStatusMessage;
    final expectedCompletionTimeMinutes = this.expectedCompletionTimeMinutes;
    final iamRoleArn = this.iamRoleArn;
    final isParent = this.isParent;
    final parentJobId = this.parentJobId;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final recoveryPointCreationDate = this.recoveryPointCreationDate;
    final resourceType = this.resourceType;
    final restoreJobId = this.restoreJobId;
    final sourceResourceArn = this.sourceResourceArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final validationStatus = this.validationStatus;
    final validationStatusMessage = this.validationStatusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdResourceArn != null) 'CreatedResourceArn': createdResourceArn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (deletionStatus != null) 'DeletionStatus': deletionStatus.value,
      if (deletionStatusMessage != null)
        'DeletionStatusMessage': deletionStatusMessage,
      if (expectedCompletionTimeMinutes != null)
        'ExpectedCompletionTimeMinutes': expectedCompletionTimeMinutes,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (isParent != null) 'IsParent': isParent,
      if (parentJobId != null) 'ParentJobId': parentJobId,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (recoveryPointCreationDate != null)
        'RecoveryPointCreationDate':
            unixTimestampToJson(recoveryPointCreationDate),
      if (resourceType != null) 'ResourceType': resourceType,
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (validationStatus != null) 'ValidationStatus': validationStatus.value,
      if (validationStatusMessage != null)
        'ValidationStatusMessage': validationStatusMessage,
    };
  }
}

class RestoreJobStatus {
  static const pending = RestoreJobStatus._('PENDING');
  static const running = RestoreJobStatus._('RUNNING');
  static const completed = RestoreJobStatus._('COMPLETED');
  static const aborted = RestoreJobStatus._('ABORTED');
  static const failed = RestoreJobStatus._('FAILED');

  final String value;

  const RestoreJobStatus._(this.value);

  static const values = [pending, running, completed, aborted, failed];

  static RestoreJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RestoreJobStatus._(value));

  @override
  bool operator ==(other) => other is RestoreJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the restore testing plan that Backup used to
/// initiate the restore job.
class RestoreJobCreator {
  /// An Amazon Resource Name (ARN) that uniquely identifies a restore testing
  /// plan.
  final String? restoreTestingPlanArn;

  RestoreJobCreator({
    this.restoreTestingPlanArn,
  });

  factory RestoreJobCreator.fromJson(Map<String, dynamic> json) {
    return RestoreJobCreator(
      restoreTestingPlanArn: json['RestoreTestingPlanArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final restoreTestingPlanArn = this.restoreTestingPlanArn;
    return {
      if (restoreTestingPlanArn != null)
        'RestoreTestingPlanArn': restoreTestingPlanArn,
    };
  }
}

class RestoreDeletionStatus {
  static const deleting = RestoreDeletionStatus._('DELETING');
  static const failed = RestoreDeletionStatus._('FAILED');
  static const successful = RestoreDeletionStatus._('SUCCESSFUL');

  final String value;

  const RestoreDeletionStatus._(this.value);

  static const values = [deleting, failed, successful];

  static RestoreDeletionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RestoreDeletionStatus._(value));

  @override
  bool operator ==(other) =>
      other is RestoreDeletionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a restore access backup vault.
class RestoreAccessBackupVaultListMember {
  /// The date and time when the restore access backup vault was approved.
  final DateTime? approvalDate;

  /// The date and time when the restore access backup vault was created.
  final DateTime? creationDate;

  /// Information about the latest request to revoke access to this backup vault.
  final LatestRevokeRequest? latestRevokeRequest;

  /// The ARN of the restore access backup vault.
  final String? restoreAccessBackupVaultArn;

  /// The current state of the restore access backup vault.
  final VaultState? vaultState;

  RestoreAccessBackupVaultListMember({
    this.approvalDate,
    this.creationDate,
    this.latestRevokeRequest,
    this.restoreAccessBackupVaultArn,
    this.vaultState,
  });

  factory RestoreAccessBackupVaultListMember.fromJson(
      Map<String, dynamic> json) {
    return RestoreAccessBackupVaultListMember(
      approvalDate: timeStampFromJson(json['ApprovalDate']),
      creationDate: timeStampFromJson(json['CreationDate']),
      latestRevokeRequest: json['LatestRevokeRequest'] != null
          ? LatestRevokeRequest.fromJson(
              json['LatestRevokeRequest'] as Map<String, dynamic>)
          : null,
      restoreAccessBackupVaultArn:
          json['RestoreAccessBackupVaultArn'] as String?,
      vaultState: (json['VaultState'] as String?)?.let(VaultState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final approvalDate = this.approvalDate;
    final creationDate = this.creationDate;
    final latestRevokeRequest = this.latestRevokeRequest;
    final restoreAccessBackupVaultArn = this.restoreAccessBackupVaultArn;
    final vaultState = this.vaultState;
    return {
      if (approvalDate != null)
        'ApprovalDate': unixTimestampToJson(approvalDate),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (latestRevokeRequest != null)
        'LatestRevokeRequest': latestRevokeRequest,
      if (restoreAccessBackupVaultArn != null)
        'RestoreAccessBackupVaultArn': restoreAccessBackupVaultArn,
      if (vaultState != null) 'VaultState': vaultState.value,
    };
  }
}

class VaultState {
  static const creating = VaultState._('CREATING');
  static const available = VaultState._('AVAILABLE');
  static const failed = VaultState._('FAILED');

  final String value;

  const VaultState._(this.value);

  static const values = [creating, available, failed];

  static VaultState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VaultState._(value));

  @override
  bool operator ==(other) => other is VaultState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the latest request to revoke access to a backup
/// vault.
class LatestRevokeRequest {
  /// The date and time when the revoke request will expire.
  final DateTime? expiryDate;

  /// The date and time when the revoke request was initiated.
  final DateTime? initiationDate;

  /// The ARN of the MPA session associated with this revoke request.
  final String? mpaSessionArn;

  /// The current status of the revoke request.
  final MpaRevokeSessionStatus? status;

  /// A message describing the current status of the revoke request.
  final String? statusMessage;

  LatestRevokeRequest({
    this.expiryDate,
    this.initiationDate,
    this.mpaSessionArn,
    this.status,
    this.statusMessage,
  });

  factory LatestRevokeRequest.fromJson(Map<String, dynamic> json) {
    return LatestRevokeRequest(
      expiryDate: timeStampFromJson(json['ExpiryDate']),
      initiationDate: timeStampFromJson(json['InitiationDate']),
      mpaSessionArn: json['MpaSessionArn'] as String?,
      status:
          (json['Status'] as String?)?.let(MpaRevokeSessionStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiryDate = this.expiryDate;
    final initiationDate = this.initiationDate;
    final mpaSessionArn = this.mpaSessionArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (expiryDate != null) 'ExpiryDate': unixTimestampToJson(expiryDate),
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (mpaSessionArn != null) 'MpaSessionArn': mpaSessionArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class MpaRevokeSessionStatus {
  static const pending = MpaRevokeSessionStatus._('PENDING');
  static const failed = MpaRevokeSessionStatus._('FAILED');

  final String value;

  const MpaRevokeSessionStatus._(this.value);

  static const values = [pending, failed];

  static MpaRevokeSessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MpaRevokeSessionStatus._(value));

  @override
  bool operator ==(other) =>
      other is MpaRevokeSessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about a report plan.
class ReportPlan {
  /// The date and time that a report plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationTime;

  /// The deployment status of a report plan. The statuses are:
  ///
  /// <code>CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS | DELETE_IN_PROGRESS |
  /// COMPLETED</code>
  final String? deploymentStatus;

  /// The date and time that a report job associated with this report plan last
  /// attempted to run, in Unix format and Coordinated Universal Time (UTC). The
  /// value of <code>LastAttemptedExecutionTime</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? lastAttemptedExecutionTime;

  /// The date and time that a report job associated with this report plan last
  /// successfully ran, in Unix format and Coordinated Universal Time (UTC). The
  /// value of <code>LastSuccessfulExecutionTime</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? lastSuccessfulExecutionTime;

  /// Contains information about where and how to deliver your reports,
  /// specifically your Amazon S3 bucket name, S3 key prefix, and the formats of
  /// your reports.
  final ReportDeliveryChannel? reportDeliveryChannel;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? reportPlanArn;

  /// An optional description of the report plan with a maximum 1,024 characters.
  final String? reportPlanDescription;

  /// The unique name of the report plan. This name is between 1 and 256
  /// characters starting with a letter, and consisting of letters (a-z, A-Z),
  /// numbers (0-9), and underscores (_).
  final String? reportPlanName;

  /// Identifies the report template for the report. Reports are built using a
  /// report template. The report templates are:
  ///
  /// <code>RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT |
  /// BACKUP_JOB_REPORT | COPY_JOB_REPORT | RESTORE_JOB_REPORT</code>
  ///
  /// If the report template is <code>RESOURCE_COMPLIANCE_REPORT</code> or
  /// <code>CONTROL_COMPLIANCE_REPORT</code>, this API resource also describes the
  /// report coverage by Amazon Web Services Regions and frameworks.
  final ReportSetting? reportSetting;

  ReportPlan({
    this.creationTime,
    this.deploymentStatus,
    this.lastAttemptedExecutionTime,
    this.lastSuccessfulExecutionTime,
    this.reportDeliveryChannel,
    this.reportPlanArn,
    this.reportPlanDescription,
    this.reportPlanName,
    this.reportSetting,
  });

  factory ReportPlan.fromJson(Map<String, dynamic> json) {
    return ReportPlan(
      creationTime: timeStampFromJson(json['CreationTime']),
      deploymentStatus: json['DeploymentStatus'] as String?,
      lastAttemptedExecutionTime:
          timeStampFromJson(json['LastAttemptedExecutionTime']),
      lastSuccessfulExecutionTime:
          timeStampFromJson(json['LastSuccessfulExecutionTime']),
      reportDeliveryChannel: json['ReportDeliveryChannel'] != null
          ? ReportDeliveryChannel.fromJson(
              json['ReportDeliveryChannel'] as Map<String, dynamic>)
          : null,
      reportPlanArn: json['ReportPlanArn'] as String?,
      reportPlanDescription: json['ReportPlanDescription'] as String?,
      reportPlanName: json['ReportPlanName'] as String?,
      reportSetting: json['ReportSetting'] != null
          ? ReportSetting.fromJson(
              json['ReportSetting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final deploymentStatus = this.deploymentStatus;
    final lastAttemptedExecutionTime = this.lastAttemptedExecutionTime;
    final lastSuccessfulExecutionTime = this.lastSuccessfulExecutionTime;
    final reportDeliveryChannel = this.reportDeliveryChannel;
    final reportPlanArn = this.reportPlanArn;
    final reportPlanDescription = this.reportPlanDescription;
    final reportPlanName = this.reportPlanName;
    final reportSetting = this.reportSetting;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (deploymentStatus != null) 'DeploymentStatus': deploymentStatus,
      if (lastAttemptedExecutionTime != null)
        'LastAttemptedExecutionTime':
            unixTimestampToJson(lastAttemptedExecutionTime),
      if (lastSuccessfulExecutionTime != null)
        'LastSuccessfulExecutionTime':
            unixTimestampToJson(lastSuccessfulExecutionTime),
      if (reportDeliveryChannel != null)
        'ReportDeliveryChannel': reportDeliveryChannel,
      if (reportPlanArn != null) 'ReportPlanArn': reportPlanArn,
      if (reportPlanDescription != null)
        'ReportPlanDescription': reportPlanDescription,
      if (reportPlanName != null) 'ReportPlanName': reportPlanName,
      if (reportSetting != null) 'ReportSetting': reportSetting,
    };
  }
}

/// Contains detailed information about a report job. A report job compiles a
/// report based on a report plan and publishes it to Amazon S3.
class ReportJob {
  /// The date and time that a report job is completed, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CompletionTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionTime;

  /// The date and time that a report job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationTime;

  /// The S3 bucket name and S3 keys for the destination where the report job
  /// publishes the report.
  final ReportDestination? reportDestination;

  /// The identifier for a report job. A unique, randomly generated, Unicode,
  /// UTF-8 encoded string that is at most 1,024 bytes long. Report job IDs cannot
  /// be edited.
  final String? reportJobId;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? reportPlanArn;

  /// Identifies the report template for the report. Reports are built using a
  /// report template. The report templates are:
  ///
  /// <code>RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT |
  /// BACKUP_JOB_REPORT | COPY_JOB_REPORT | RESTORE_JOB_REPORT</code>
  final String? reportTemplate;

  /// The status of a report job. The statuses are:
  ///
  /// <code>CREATED | RUNNING | COMPLETED | FAILED</code>
  ///
  /// <code>COMPLETED</code> means that the report is available for your review at
  /// your designated destination. If the status is <code>FAILED</code>, review
  /// the <code>StatusMessage</code> for the reason.
  final String? status;

  /// A message explaining the status of the report job.
  final String? statusMessage;

  ReportJob({
    this.completionTime,
    this.creationTime,
    this.reportDestination,
    this.reportJobId,
    this.reportPlanArn,
    this.reportTemplate,
    this.status,
    this.statusMessage,
  });

  factory ReportJob.fromJson(Map<String, dynamic> json) {
    return ReportJob(
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      reportDestination: json['ReportDestination'] != null
          ? ReportDestination.fromJson(
              json['ReportDestination'] as Map<String, dynamic>)
          : null,
      reportJobId: json['ReportJobId'] as String?,
      reportPlanArn: json['ReportPlanArn'] as String?,
      reportTemplate: json['ReportTemplate'] as String?,
      status: json['Status'] as String?,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final reportDestination = this.reportDestination;
    final reportJobId = this.reportJobId;
    final reportPlanArn = this.reportPlanArn;
    final reportTemplate = this.reportTemplate;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (reportDestination != null) 'ReportDestination': reportDestination,
      if (reportJobId != null) 'ReportJobId': reportJobId,
      if (reportPlanArn != null) 'ReportPlanArn': reportPlanArn,
      if (reportTemplate != null) 'ReportTemplate': reportTemplate,
      if (status != null) 'Status': status,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Contains information from your report job about your report destination.
class ReportDestination {
  /// The unique name of the Amazon S3 bucket that receives your reports.
  final String? s3BucketName;

  /// The object key that uniquely identifies your reports in your S3 bucket.
  final List<String>? s3Keys;

  ReportDestination({
    this.s3BucketName,
    this.s3Keys,
  });

  factory ReportDestination.fromJson(Map<String, dynamic> json) {
    return ReportDestination(
      s3BucketName: json['S3BucketName'] as String?,
      s3Keys:
          (json['S3Keys'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3Keys = this.s3Keys;
    return {
      if (s3BucketName != null) 'S3BucketName': s3BucketName,
      if (s3Keys != null) 'S3Keys': s3Keys,
    };
  }
}

/// Contains detailed information about a saved recovery point.
class RecoveryPointByResource {
  /// Contains the latest scanning results against the recovery point and
  /// currently include <code>FailedScan</code>, <code>Findings</code>,
  /// <code>LastComputed</code>.
  final AggregatedScanResult? aggregatedScanResult;

  /// The size, in bytes, of a backup.
  final int? backupSizeBytes;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String? backupVaultName;

  /// The date and time a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  final String? encryptionKeyArn;

  /// The type of encryption key used for the recovery point. Valid values are
  /// CUSTOMER_MANAGED_KMS_KEY for customer-managed keys or Amazon Web
  /// Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
  final EncryptionKeyType? encryptionKeyType;

  /// This is the current status for the backup index associated with the
  /// specified recovery point.
  ///
  /// Statuses are: <code>PENDING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code> | <code>DELETING</code>
  ///
  /// A recovery point with an index that has the status of <code>ACTIVE</code>
  /// can be included in a search.
  final IndexStatus? indexStatus;

  /// A string in the form of a detailed message explaining the status of a backup
  /// index associated with the recovery point.
  final String? indexStatusMessage;

  /// This is a boolean value indicating this is a parent (composite) recovery
  /// point.
  final bool? isParent;

  /// The Amazon Resource Name (ARN) of the parent (composite) recovery point.
  final String? parentRecoveryPointArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// A status code specifying the state of the recovery point.
  final RecoveryPointStatus? status;

  /// A message explaining the current status of the recovery point.
  final String? statusMessage;

  /// The type of vault in which the described recovery point is stored.
  final VaultType? vaultType;

  RecoveryPointByResource({
    this.aggregatedScanResult,
    this.backupSizeBytes,
    this.backupVaultName,
    this.creationDate,
    this.encryptionKeyArn,
    this.encryptionKeyType,
    this.indexStatus,
    this.indexStatusMessage,
    this.isParent,
    this.parentRecoveryPointArn,
    this.recoveryPointArn,
    this.resourceName,
    this.status,
    this.statusMessage,
    this.vaultType,
  });

  factory RecoveryPointByResource.fromJson(Map<String, dynamic> json) {
    return RecoveryPointByResource(
      aggregatedScanResult: json['AggregatedScanResult'] != null
          ? AggregatedScanResult.fromJson(
              json['AggregatedScanResult'] as Map<String, dynamic>)
          : null,
      backupSizeBytes: json['BackupSizeBytes'] as int?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      encryptionKeyType: (json['EncryptionKeyType'] as String?)
          ?.let(EncryptionKeyType.fromString),
      indexStatus:
          (json['IndexStatus'] as String?)?.let(IndexStatus.fromString),
      indexStatusMessage: json['IndexStatusMessage'] as String?,
      isParent: json['IsParent'] as bool?,
      parentRecoveryPointArn: json['ParentRecoveryPointArn'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      status: (json['Status'] as String?)?.let(RecoveryPointStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      vaultType: (json['VaultType'] as String?)?.let(VaultType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedScanResult = this.aggregatedScanResult;
    final backupSizeBytes = this.backupSizeBytes;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionKeyType = this.encryptionKeyType;
    final indexStatus = this.indexStatus;
    final indexStatusMessage = this.indexStatusMessage;
    final isParent = this.isParent;
    final parentRecoveryPointArn = this.parentRecoveryPointArn;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceName = this.resourceName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vaultType = this.vaultType;
    return {
      if (aggregatedScanResult != null)
        'AggregatedScanResult': aggregatedScanResult,
      if (backupSizeBytes != null) 'BackupSizeBytes': backupSizeBytes,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionKeyType != null)
        'EncryptionKeyType': encryptionKeyType.value,
      if (indexStatus != null) 'IndexStatus': indexStatus.value,
      if (indexStatusMessage != null) 'IndexStatusMessage': indexStatusMessage,
      if (isParent != null) 'IsParent': isParent,
      if (parentRecoveryPointArn != null)
        'ParentRecoveryPointArn': parentRecoveryPointArn,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vaultType != null) 'VaultType': vaultType.value,
    };
  }
}

class RecoveryPointStatus {
  static const completed = RecoveryPointStatus._('COMPLETED');
  static const partial = RecoveryPointStatus._('PARTIAL');
  static const deleting = RecoveryPointStatus._('DELETING');
  static const expired = RecoveryPointStatus._('EXPIRED');
  static const available = RecoveryPointStatus._('AVAILABLE');
  static const stopped = RecoveryPointStatus._('STOPPED');
  static const creating = RecoveryPointStatus._('CREATING');

  final String value;

  const RecoveryPointStatus._(this.value);

  static const values = [
    completed,
    partial,
    deleting,
    expired,
    available,
    stopped,
    creating
  ];

  static RecoveryPointStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecoveryPointStatus._(value));

  @override
  bool operator ==(other) =>
      other is RecoveryPointStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class VaultType {
  static const backupVault = VaultType._('BACKUP_VAULT');
  static const logicallyAirGappedBackupVault =
      VaultType._('LOGICALLY_AIR_GAPPED_BACKUP_VAULT');
  static const restoreAccessBackupVault =
      VaultType._('RESTORE_ACCESS_BACKUP_VAULT');

  final String value;

  const VaultType._(this.value);

  static const values = [
    backupVault,
    logicallyAirGappedBackupVault,
    restoreAccessBackupVault
  ];

  static VaultType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VaultType._(value));

  @override
  bool operator ==(other) => other is VaultType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class EncryptionKeyType {
  static const awsOwnedKmsKey = EncryptionKeyType._('AWS_OWNED_KMS_KEY');
  static const customerManagedKmsKey =
      EncryptionKeyType._('CUSTOMER_MANAGED_KMS_KEY');

  final String value;

  const EncryptionKeyType._(this.value);

  static const values = [awsOwnedKmsKey, customerManagedKmsKey];

  static EncryptionKeyType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionKeyType._(value));

  @override
  bool operator ==(other) => other is EncryptionKeyType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains aggregated scan results across multiple scan operations, providing
/// a summary of scan status and findings.
class AggregatedScanResult {
  /// A Boolean value indicating whether any of the aggregated scans failed.
  final bool? failedScan;

  /// An array of findings discovered across all aggregated scans.
  final List<ScanFinding>? findings;

  /// The timestamp when the aggregated scan result was last computed, in Unix
  /// format and Coordinated Universal Time (UTC).
  final DateTime? lastComputed;

  AggregatedScanResult({
    this.failedScan,
    this.findings,
    this.lastComputed,
  });

  factory AggregatedScanResult.fromJson(Map<String, dynamic> json) {
    return AggregatedScanResult(
      failedScan: json['FailedScan'] as bool?,
      findings: (json['Findings'] as List?)
          ?.nonNulls
          .map((e) => ScanFinding.fromString((e as String)))
          .toList(),
      lastComputed: timeStampFromJson(json['LastComputed']),
    );
  }

  Map<String, dynamic> toJson() {
    final failedScan = this.failedScan;
    final findings = this.findings;
    final lastComputed = this.lastComputed;
    return {
      if (failedScan != null) 'FailedScan': failedScan,
      if (findings != null) 'Findings': findings.map((e) => e.value).toList(),
      if (lastComputed != null)
        'LastComputed': unixTimestampToJson(lastComputed),
    };
  }
}

class ScanFinding {
  static const malware = ScanFinding._('MALWARE');

  final String value;

  const ScanFinding._(this.value);

  static const values = [malware];

  static ScanFinding fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanFinding._(value));

  @override
  bool operator ==(other) => other is ScanFinding && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is a recovery point which is a child (nested) recovery point of a
/// parent (composite) recovery point. These recovery points can be
/// disassociated from their parent (composite) recovery point, in which case
/// they will no longer be a member.
class RecoveryPointMember {
  /// The name of the backup vault (the logical container in which backups are
  /// stored).
  final String? backupVaultName;

  /// The Amazon Resource Name (ARN) of the parent (composite) recovery point.
  final String? recoveryPointArn;

  /// The Amazon Resource Name (ARN) that uniquely identifies a saved resource.
  final String? resourceArn;

  /// The Amazon Web Services resource type that is saved as a recovery point.
  final String? resourceType;

  RecoveryPointMember({
    this.backupVaultName,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceType,
  });

  factory RecoveryPointMember.fromJson(Map<String, dynamic> json) {
    return RecoveryPointMember(
      backupVaultName: json['BackupVaultName'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultName = this.backupVaultName;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    return {
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// Contains detailed information about the recovery points stored in a backup
/// vault.
class RecoveryPointByBackupVault {
  /// Contains the latest scanning results against the recovery point and
  /// currently include <code>FailedScan</code>, <code>Findings</code>,
  /// <code>LastComputed</code>.
  final AggregatedScanResult? aggregatedScanResult;

  /// The size, in bytes, of a backup.
  final int? backupSizeInBytes;

  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String? backupVaultName;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  final CalculatedLifecycle? calculatedLifecycle;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// The identifier of a resource within a composite group, such as nested
  /// (child) recovery point belonging to a composite (parent) stack. The ID is
  /// transferred from the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resources-section-structure.html#resources-section-structure-syntax">
  /// logical ID</a> within a stack.
  final String? compositeMemberIdentifier;

  /// Contains identifying information about the creation of a recovery point,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan that is used to create it.
  final RecoveryPointCreator? createdBy;

  /// The date and time a recovery point is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  final String? encryptionKeyArn;

  /// The type of encryption key used for the recovery point. Valid values are
  /// CUSTOMER_MANAGED_KMS_KEY for customer-managed keys or Amazon Web
  /// Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
  final EncryptionKeyType? encryptionKeyType;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// This is the current status for the backup index associated with the
  /// specified recovery point.
  ///
  /// Statuses are: <code>PENDING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code> | <code>DELETING</code>
  ///
  /// A recovery point with an index that has the status of <code>ACTIVE</code>
  /// can be included in a search.
  final IndexStatus? indexStatus;

  /// A string in the form of a detailed message explaining the status of a backup
  /// index associated with the recovery point.
  final String? indexStatusMessage;

  /// The date and time when the backup job that created this recovery point was
  /// initiated, in Unix format and Coordinated Universal Time (UTC).
  final DateTime? initiationDate;

  /// A Boolean value that is returned as <code>TRUE</code> if the specified
  /// recovery point is encrypted, or <code>FALSE</code> if the recovery point is
  /// not encrypted.
  final bool? isEncrypted;

  /// This is a boolean value indicating this is a parent (composite) recovery
  /// point.
  final bool? isParent;

  /// The date and time a recovery point was last restored, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastRestoreTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastRestoreTime;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  ///
  /// Resource types that can transition to cold storage are listed in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table. Backup ignores this expression for other
  /// resource types.
  final Lifecycle? lifecycle;

  /// The Amazon Resource Name (ARN) of the parent (composite) recovery point.
  final String? parentRecoveryPointArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource saved as a recovery point; for
  /// example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon
  /// Relational Database Service (Amazon RDS) database. For Windows Volume Shadow
  /// Copy Service (VSS) backups, the only supported resource type is Amazon EC2.
  final String? resourceType;

  /// The backup vault where the recovery point was originally copied from. If the
  /// recovery point is restored to the same account this value will be
  /// <code>null</code>.
  final String? sourceBackupVaultArn;

  /// A status code specifying the state of the recovery point.
  final RecoveryPointStatus? status;

  /// A message explaining the current status of the recovery point.
  final String? statusMessage;

  /// The type of vault in which the described recovery point is stored.
  final VaultType? vaultType;

  RecoveryPointByBackupVault({
    this.aggregatedScanResult,
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.calculatedLifecycle,
    this.completionDate,
    this.compositeMemberIdentifier,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.encryptionKeyType,
    this.iamRoleArn,
    this.indexStatus,
    this.indexStatusMessage,
    this.initiationDate,
    this.isEncrypted,
    this.isParent,
    this.lastRestoreTime,
    this.lifecycle,
    this.parentRecoveryPointArn,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
    this.sourceBackupVaultArn,
    this.status,
    this.statusMessage,
    this.vaultType,
  });

  factory RecoveryPointByBackupVault.fromJson(Map<String, dynamic> json) {
    return RecoveryPointByBackupVault(
      aggregatedScanResult: json['AggregatedScanResult'] != null
          ? AggregatedScanResult.fromJson(
              json['AggregatedScanResult'] as Map<String, dynamic>)
          : null,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      calculatedLifecycle: json['CalculatedLifecycle'] != null
          ? CalculatedLifecycle.fromJson(
              json['CalculatedLifecycle'] as Map<String, dynamic>)
          : null,
      completionDate: timeStampFromJson(json['CompletionDate']),
      compositeMemberIdentifier: json['CompositeMemberIdentifier'] as String?,
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      encryptionKeyType: (json['EncryptionKeyType'] as String?)
          ?.let(EncryptionKeyType.fromString),
      iamRoleArn: json['IamRoleArn'] as String?,
      indexStatus:
          (json['IndexStatus'] as String?)?.let(IndexStatus.fromString),
      indexStatusMessage: json['IndexStatusMessage'] as String?,
      initiationDate: timeStampFromJson(json['InitiationDate']),
      isEncrypted: json['IsEncrypted'] as bool?,
      isParent: json['IsParent'] as bool?,
      lastRestoreTime: timeStampFromJson(json['LastRestoreTime']),
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      parentRecoveryPointArn: json['ParentRecoveryPointArn'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
      sourceBackupVaultArn: json['SourceBackupVaultArn'] as String?,
      status: (json['Status'] as String?)?.let(RecoveryPointStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      vaultType: (json['VaultType'] as String?)?.let(VaultType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregatedScanResult = this.aggregatedScanResult;
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final calculatedLifecycle = this.calculatedLifecycle;
    final completionDate = this.completionDate;
    final compositeMemberIdentifier = this.compositeMemberIdentifier;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionKeyType = this.encryptionKeyType;
    final iamRoleArn = this.iamRoleArn;
    final indexStatus = this.indexStatus;
    final indexStatusMessage = this.indexStatusMessage;
    final initiationDate = this.initiationDate;
    final isEncrypted = this.isEncrypted;
    final isParent = this.isParent;
    final lastRestoreTime = this.lastRestoreTime;
    final lifecycle = this.lifecycle;
    final parentRecoveryPointArn = this.parentRecoveryPointArn;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final sourceBackupVaultArn = this.sourceBackupVaultArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vaultType = this.vaultType;
    return {
      if (aggregatedScanResult != null)
        'AggregatedScanResult': aggregatedScanResult,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (calculatedLifecycle != null)
        'CalculatedLifecycle': calculatedLifecycle,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (compositeMemberIdentifier != null)
        'CompositeMemberIdentifier': compositeMemberIdentifier,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionKeyType != null)
        'EncryptionKeyType': encryptionKeyType.value,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (indexStatus != null) 'IndexStatus': indexStatus.value,
      if (indexStatusMessage != null) 'IndexStatusMessage': indexStatusMessage,
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (isEncrypted != null) 'IsEncrypted': isEncrypted,
      if (isParent != null) 'IsParent': isParent,
      if (lastRestoreTime != null)
        'LastRestoreTime': unixTimestampToJson(lastRestoreTime),
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (parentRecoveryPointArn != null)
        'ParentRecoveryPointArn': parentRecoveryPointArn,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (sourceBackupVaultArn != null)
        'SourceBackupVaultArn': sourceBackupVaultArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vaultType != null) 'VaultType': vaultType.value,
    };
  }
}

/// Contains information about the backup plan and rule that Backup used to
/// initiate the recovery point backup.
class RecoveryPointCreator {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  final String? backupPlanArn;

  /// Uniquely identifies a backup plan.
  final String? backupPlanId;

  /// The name of the backup plan that created this recovery point. This provides
  /// human-readable context about which backup plan was responsible for the
  /// backup job.
  final String? backupPlanName;

  /// Version IDs are unique, randomly generated, Unicode, UTF-8 encoded strings
  /// that are at most 1,024 bytes long. They cannot be edited.
  final String? backupPlanVersion;

  /// The cron expression that defines the schedule for the backup rule. This
  /// shows the frequency and timing of when backups are automatically triggered.
  final String? backupRuleCron;

  /// Uniquely identifies a rule used to schedule the backup of a selection of
  /// resources.
  final String? backupRuleId;

  /// The name of the backup rule within the backup plan that created this
  /// recovery point. This helps identify which specific rule triggered the backup
  /// job.
  final String? backupRuleName;

  /// The timezone used for the backup rule schedule. This provides context for
  /// when backups are scheduled to run in the specified timezone.
  final String? backupRuleTimezone;

  RecoveryPointCreator({
    this.backupPlanArn,
    this.backupPlanId,
    this.backupPlanName,
    this.backupPlanVersion,
    this.backupRuleCron,
    this.backupRuleId,
    this.backupRuleName,
    this.backupRuleTimezone,
  });

  factory RecoveryPointCreator.fromJson(Map<String, dynamic> json) {
    return RecoveryPointCreator(
      backupPlanArn: json['BackupPlanArn'] as String?,
      backupPlanId: json['BackupPlanId'] as String?,
      backupPlanName: json['BackupPlanName'] as String?,
      backupPlanVersion: json['BackupPlanVersion'] as String?,
      backupRuleCron: json['BackupRuleCron'] as String?,
      backupRuleId: json['BackupRuleId'] as String?,
      backupRuleName: json['BackupRuleName'] as String?,
      backupRuleTimezone: json['BackupRuleTimezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final backupPlanName = this.backupPlanName;
    final backupPlanVersion = this.backupPlanVersion;
    final backupRuleCron = this.backupRuleCron;
    final backupRuleId = this.backupRuleId;
    final backupRuleName = this.backupRuleName;
    final backupRuleTimezone = this.backupRuleTimezone;
    return {
      if (backupPlanArn != null) 'BackupPlanArn': backupPlanArn,
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (backupPlanName != null) 'BackupPlanName': backupPlanName,
      if (backupPlanVersion != null) 'BackupPlanVersion': backupPlanVersion,
      if (backupRuleCron != null) 'BackupRuleCron': backupRuleCron,
      if (backupRuleId != null) 'BackupRuleId': backupRuleId,
      if (backupRuleName != null) 'BackupRuleName': backupRuleName,
      if (backupRuleTimezone != null) 'BackupRuleTimezone': backupRuleTimezone,
    };
  }
}

/// A structure that contains information about a backed-up resource.
class ProtectedResource {
  /// The date and time a resource was last backed up, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastBackupTime;

  /// The ARN (Amazon Resource Name) of the backup vault that contains the most
  /// recent backup recovery point.
  final String? lastBackupVaultArn;

  /// The ARN (Amazon Resource Name) of the most recent recovery point.
  final String? lastRecoveryPointArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? resourceArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database. For Windows Volume Shadow Copy Service (VSS) backups,
  /// the only supported resource type is Amazon EC2.
  final String? resourceType;

  ProtectedResource({
    this.lastBackupTime,
    this.lastBackupVaultArn,
    this.lastRecoveryPointArn,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
  });

  factory ProtectedResource.fromJson(Map<String, dynamic> json) {
    return ProtectedResource(
      lastBackupTime: timeStampFromJson(json['LastBackupTime']),
      lastBackupVaultArn: json['LastBackupVaultArn'] as String?,
      lastRecoveryPointArn: json['LastRecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastBackupTime = this.lastBackupTime;
    final lastBackupVaultArn = this.lastBackupVaultArn;
    final lastRecoveryPointArn = this.lastRecoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    return {
      if (lastBackupTime != null)
        'LastBackupTime': unixTimestampToJson(lastBackupTime),
      if (lastBackupVaultArn != null) 'LastBackupVaultArn': lastBackupVaultArn,
      if (lastRecoveryPointArn != null)
        'LastRecoveryPointArn': lastRecoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

/// A legal hold is an administrative tool that helps prevent backups from being
/// deleted while under a hold. While the hold is in place, backups under a hold
/// cannot be deleted and lifecycle policies that would alter the backup status
/// (such as transition to cold storage) are delayed until the legal hold is
/// removed. A backup can have more than one legal hold. Legal holds are applied
/// to one or more backups (also known as recovery points). These backups can be
/// filtered by resource types and by resource IDs.
class LegalHold {
  /// The time when the legal hold was cancelled.
  final DateTime? cancellationDate;

  /// The time when the legal hold was created.
  final DateTime? creationDate;

  /// The description of a legal hold.
  final String? description;

  /// The Amazon Resource Name (ARN) of the legal hold; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? legalHoldArn;

  /// The ID of the legal hold.
  final String? legalHoldId;

  /// The status of the legal hold.
  final LegalHoldStatus? status;

  /// The title of a legal hold.
  final String? title;

  LegalHold({
    this.cancellationDate,
    this.creationDate,
    this.description,
    this.legalHoldArn,
    this.legalHoldId,
    this.status,
    this.title,
  });

  factory LegalHold.fromJson(Map<String, dynamic> json) {
    return LegalHold(
      cancellationDate: timeStampFromJson(json['CancellationDate']),
      creationDate: timeStampFromJson(json['CreationDate']),
      description: json['Description'] as String?,
      legalHoldArn: json['LegalHoldArn'] as String?,
      legalHoldId: json['LegalHoldId'] as String?,
      status: (json['Status'] as String?)?.let(LegalHoldStatus.fromString),
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cancellationDate = this.cancellationDate;
    final creationDate = this.creationDate;
    final description = this.description;
    final legalHoldArn = this.legalHoldArn;
    final legalHoldId = this.legalHoldId;
    final status = this.status;
    final title = this.title;
    return {
      if (cancellationDate != null)
        'CancellationDate': unixTimestampToJson(cancellationDate),
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (description != null) 'Description': description,
      if (legalHoldArn != null) 'LegalHoldArn': legalHoldArn,
      if (legalHoldId != null) 'LegalHoldId': legalHoldId,
      if (status != null) 'Status': status.value,
      if (title != null) 'Title': title,
    };
  }
}

class LegalHoldStatus {
  static const creating = LegalHoldStatus._('CREATING');
  static const active = LegalHoldStatus._('ACTIVE');
  static const canceling = LegalHoldStatus._('CANCELING');
  static const canceled = LegalHoldStatus._('CANCELED');

  final String value;

  const LegalHoldStatus._(this.value);

  static const values = [creating, active, canceling, canceled];

  static LegalHoldStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LegalHoldStatus._(value));

  @override
  bool operator ==(other) => other is LegalHoldStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is a recovery point that has an associated backup index.
///
/// Only recovery points with a backup index can be included in a search.
class IndexedRecoveryPoint {
  /// The date and time that a backup was created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? backupCreationDate;

  /// An ARN that uniquely identifies the backup vault where the recovery point
  /// index is stored.
  ///
  /// For example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// This specifies the IAM role ARN used for this operation.
  ///
  /// For example, arn:aws:iam::123456789012:role/S3Access
  final String? iamRoleArn;

  /// The date and time that a backup index was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? indexCreationDate;

  /// This is the current status for the backup index associated with the
  /// specified recovery point.
  ///
  /// Statuses are: <code>PENDING</code> | <code>ACTIVE</code> |
  /// <code>FAILED</code> | <code>DELETING</code>
  ///
  /// A recovery point with an index that has the status of <code>ACTIVE</code>
  /// can be included in a search.
  final IndexStatus? indexStatus;

  /// A string in the form of a detailed message explaining the status of a backup
  /// index associated with the recovery point.
  final String? indexStatusMessage;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>
  final String? recoveryPointArn;

  /// The resource type of the indexed recovery point.
  ///
  /// <ul>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon Simple Storage Service (Amazon S3)
  /// </li>
  /// </ul>
  final String? resourceType;

  /// A string of the Amazon Resource Name (ARN) that uniquely identifies the
  /// source resource.
  final String? sourceResourceArn;

  IndexedRecoveryPoint({
    this.backupCreationDate,
    this.backupVaultArn,
    this.iamRoleArn,
    this.indexCreationDate,
    this.indexStatus,
    this.indexStatusMessage,
    this.recoveryPointArn,
    this.resourceType,
    this.sourceResourceArn,
  });

  factory IndexedRecoveryPoint.fromJson(Map<String, dynamic> json) {
    return IndexedRecoveryPoint(
      backupCreationDate: timeStampFromJson(json['BackupCreationDate']),
      backupVaultArn: json['BackupVaultArn'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      indexCreationDate: timeStampFromJson(json['IndexCreationDate']),
      indexStatus:
          (json['IndexStatus'] as String?)?.let(IndexStatus.fromString),
      indexStatusMessage: json['IndexStatusMessage'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceType: json['ResourceType'] as String?,
      sourceResourceArn: json['SourceResourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupCreationDate = this.backupCreationDate;
    final backupVaultArn = this.backupVaultArn;
    final iamRoleArn = this.iamRoleArn;
    final indexCreationDate = this.indexCreationDate;
    final indexStatus = this.indexStatus;
    final indexStatusMessage = this.indexStatusMessage;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceType = this.resourceType;
    final sourceResourceArn = this.sourceResourceArn;
    return {
      if (backupCreationDate != null)
        'BackupCreationDate': unixTimestampToJson(backupCreationDate),
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (indexCreationDate != null)
        'IndexCreationDate': unixTimestampToJson(indexCreationDate),
      if (indexStatus != null) 'IndexStatus': indexStatus.value,
      if (indexStatusMessage != null) 'IndexStatusMessage': indexStatusMessage,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceType != null) 'ResourceType': resourceType,
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
    };
  }
}

/// Contains detailed information about a framework. Frameworks contain
/// controls, which evaluate and report on your backup events and resources.
/// Frameworks generate daily compliance results.
class Framework {
  /// The date and time that a framework is created, in ISO 8601 representation.
  /// The value of <code>CreationTime</code> is accurate to milliseconds. For
  /// example, 2020-07-10T15:00:00.000-08:00 represents the 10th of July 2020 at
  /// 3:00 PM 8 hours behind UTC.
  final DateTime? creationTime;

  /// The deployment status of a framework. The statuses are:
  ///
  /// <code>CREATE_IN_PROGRESS | UPDATE_IN_PROGRESS | DELETE_IN_PROGRESS |
  /// COMPLETED | FAILED</code>
  final String? deploymentStatus;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? frameworkArn;

  /// An optional description of the framework with a maximum 1,024 characters.
  final String? frameworkDescription;

  /// The unique name of a framework. This name is between 1 and 256 characters,
  /// starting with a letter, and consisting of letters (a-z, A-Z), numbers (0-9),
  /// and underscores (_).
  final String? frameworkName;

  /// The number of controls contained by the framework.
  final int? numberOfControls;

  Framework({
    this.creationTime,
    this.deploymentStatus,
    this.frameworkArn,
    this.frameworkDescription,
    this.frameworkName,
    this.numberOfControls,
  });

  factory Framework.fromJson(Map<String, dynamic> json) {
    return Framework(
      creationTime: timeStampFromJson(json['CreationTime']),
      deploymentStatus: json['DeploymentStatus'] as String?,
      frameworkArn: json['FrameworkArn'] as String?,
      frameworkDescription: json['FrameworkDescription'] as String?,
      frameworkName: json['FrameworkName'] as String?,
      numberOfControls: json['NumberOfControls'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final deploymentStatus = this.deploymentStatus;
    final frameworkArn = this.frameworkArn;
    final frameworkDescription = this.frameworkDescription;
    final frameworkName = this.frameworkName;
    final numberOfControls = this.numberOfControls;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (deploymentStatus != null) 'DeploymentStatus': deploymentStatus,
      if (frameworkArn != null) 'FrameworkArn': frameworkArn,
      if (frameworkDescription != null)
        'FrameworkDescription': frameworkDescription,
      if (frameworkName != null) 'FrameworkName': frameworkName,
      if (numberOfControls != null) 'NumberOfControls': numberOfControls,
    };
  }
}

/// This is a summary of copy jobs created or running within the most recent 30
/// days.
///
/// The returned summary may contain the following: Region, Account, State,
/// RestourceType, MessageCategory, StartTime, EndTime, and Count of included
/// jobs.
class CopyJobSummary {
  /// The account ID that owns the jobs within the summary.
  final String? accountId;

  /// The value as a number of jobs in a job summary.
  final int? count;

  /// The value of time in number format of a job end time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? endTime;

  /// This parameter is the job count for the specified message category.
  ///
  /// Example strings include <code>AccessDenied</code>, <code>Success</code>, and
  /// <code>InvalidParameters</code>. See <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of MessageCategory strings.
  ///
  /// The the value ANY returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message categories
  /// and returns the sum.
  final String? messageCategory;

  /// The Amazon Web Services Regions within the job summary.
  final String? region;

  /// This value is the job count for the specified resource type. The request
  /// <code>GetSupportedResourceTypes</code> returns strings for supported
  /// resource types
  final String? resourceType;

  /// The value of time in number format of a job start time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startTime;

  /// This value is job count for jobs with the specified state.
  final CopyJobStatus? state;

  CopyJobSummary({
    this.accountId,
    this.count,
    this.endTime,
    this.messageCategory,
    this.region,
    this.resourceType,
    this.startTime,
    this.state,
  });

  factory CopyJobSummary.fromJson(Map<String, dynamic> json) {
    return CopyJobSummary(
      accountId: json['AccountId'] as String?,
      count: json['Count'] as int?,
      endTime: timeStampFromJson(json['EndTime']),
      messageCategory: json['MessageCategory'] as String?,
      region: json['Region'] as String?,
      resourceType: json['ResourceType'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.let(CopyJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final count = this.count;
    final endTime = this.endTime;
    final messageCategory = this.messageCategory;
    final region = this.region;
    final resourceType = this.resourceType;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (count != null) 'Count': count,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (messageCategory != null) 'MessageCategory': messageCategory,
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.value,
    };
  }
}

class CopyJobStatus {
  static const created = CopyJobStatus._('CREATED');
  static const running = CopyJobStatus._('RUNNING');
  static const aborting = CopyJobStatus._('ABORTING');
  static const aborted = CopyJobStatus._('ABORTED');
  static const completing = CopyJobStatus._('COMPLETING');
  static const completed = CopyJobStatus._('COMPLETED');
  static const failing = CopyJobStatus._('FAILING');
  static const failed = CopyJobStatus._('FAILED');
  static const partial = CopyJobStatus._('PARTIAL');
  static const aggregateAll = CopyJobStatus._('AGGREGATE_ALL');
  static const any = CopyJobStatus._('ANY');

  final String value;

  const CopyJobStatus._(this.value);

  static const values = [
    created,
    running,
    aborting,
    aborted,
    completing,
    completed,
    failing,
    failed,
    partial,
    aggregateAll,
    any
  ];

  static CopyJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CopyJobStatus._(value));

  @override
  bool operator ==(other) => other is CopyJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about a copy job.
class CopyJob {
  /// The account ID that owns the copy job.
  final String? accountId;

  /// The size, in bytes, of a copy job.
  final int? backupSizeInBytes;

  /// This returns the statistics of the included child (nested) copy jobs.
  final Map<CopyJobState, int>? childJobsInState;

  /// The date and time a copy job is completed, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CompletionDate</code> is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// The identifier of a resource within a composite group, such as nested
  /// (child) recovery point belonging to a composite (parent) stack. The ID is
  /// transferred from the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resources-section-structure.html#resources-section-structure-syntax">
  /// logical ID</a> within a stack.
  final String? compositeMemberIdentifier;

  /// Uniquely identifies a copy job.
  final String? copyJobId;
  final RecoveryPointCreator? createdBy;

  /// The backup job ID that initiated this copy job. Only applicable to scheduled
  /// copy jobs and automatic copy jobs to logically air-gapped vault.
  final String? createdByBackupJobId;

  /// The date and time a copy job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// An Amazon Resource Name (ARN) that uniquely identifies a destination copy
  /// vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? destinationBackupVaultArn;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the copied
  /// backup in the destination vault. This can be a customer-managed key or an
  /// Amazon Web Services managed key.
  final String? destinationEncryptionKeyArn;

  /// An ARN that uniquely identifies a destination recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? destinationRecoveryPointArn;
  final Lifecycle? destinationRecoveryPointLifecycle;

  /// The lock state of the destination backup vault. For logically air-gapped
  /// vaults, this indicates whether the vault is locked in compliance mode. Valid
  /// values include <code>LOCKED</code> and <code>UNLOCKED</code>.
  final String? destinationVaultLockState;

  /// The type of destination backup vault where the copied recovery point is
  /// stored. Valid values are <code>BACKUP_VAULT</code> for standard backup
  /// vaults and <code>LOGICALLY_AIR_GAPPED_BACKUP_VAULT</code> for logically
  /// air-gapped vaults.
  final String? destinationVaultType;

  /// Specifies the IAM role ARN used to copy the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// This is a boolean value indicating this is a parent (composite) copy job.
  final bool? isParent;

  /// This parameter is the job count for the specified message category.
  ///
  /// Example strings may include <code>AccessDenied</code>, <code>SUCCESS</code>,
  /// <code>AGGREGATE_ALL</code>, and <code>InvalidParameters</code>. See <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of MessageCategory strings.
  ///
  /// The the value ANY returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message categories
  /// and returns the sum
  final String? messageCategory;

  /// The number of child (nested) copy jobs.
  final int? numberOfChildJobs;

  /// This uniquely identifies a request to Backup to copy a resource. The return
  /// will be the parent (composite) job ID.
  final String? parentJobId;

  /// The Amazon Web Services resource to be copied; for example, an Amazon
  /// Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database
  /// Service (Amazon RDS) database.
  final String? resourceArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource to be copied; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  final String? resourceType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a source copy vault;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? sourceBackupVaultArn;

  /// An ARN that uniquely identifies a source recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? sourceRecoveryPointArn;

  /// The current state of a copy job.
  final CopyJobState? state;

  /// A detailed message explaining the status of the job to copy a resource.
  final String? statusMessage;

  CopyJob({
    this.accountId,
    this.backupSizeInBytes,
    this.childJobsInState,
    this.completionDate,
    this.compositeMemberIdentifier,
    this.copyJobId,
    this.createdBy,
    this.createdByBackupJobId,
    this.creationDate,
    this.destinationBackupVaultArn,
    this.destinationEncryptionKeyArn,
    this.destinationRecoveryPointArn,
    this.destinationRecoveryPointLifecycle,
    this.destinationVaultLockState,
    this.destinationVaultType,
    this.iamRoleArn,
    this.isParent,
    this.messageCategory,
    this.numberOfChildJobs,
    this.parentJobId,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
    this.sourceBackupVaultArn,
    this.sourceRecoveryPointArn,
    this.state,
    this.statusMessage,
  });

  factory CopyJob.fromJson(Map<String, dynamic> json) {
    return CopyJob(
      accountId: json['AccountId'] as String?,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      childJobsInState: (json['ChildJobsInState'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(CopyJobState.fromString(k), e as int)),
      completionDate: timeStampFromJson(json['CompletionDate']),
      compositeMemberIdentifier: json['CompositeMemberIdentifier'] as String?,
      copyJobId: json['CopyJobId'] as String?,
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdByBackupJobId: json['CreatedByBackupJobId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      destinationBackupVaultArn: json['DestinationBackupVaultArn'] as String?,
      destinationEncryptionKeyArn:
          json['DestinationEncryptionKeyArn'] as String?,
      destinationRecoveryPointArn:
          json['DestinationRecoveryPointArn'] as String?,
      destinationRecoveryPointLifecycle:
          json['DestinationRecoveryPointLifecycle'] != null
              ? Lifecycle.fromJson(json['DestinationRecoveryPointLifecycle']
                  as Map<String, dynamic>)
              : null,
      destinationVaultLockState: json['DestinationVaultLockState'] as String?,
      destinationVaultType: json['DestinationVaultType'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      isParent: json['IsParent'] as bool?,
      messageCategory: json['MessageCategory'] as String?,
      numberOfChildJobs: json['NumberOfChildJobs'] as int?,
      parentJobId: json['ParentJobId'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
      sourceBackupVaultArn: json['SourceBackupVaultArn'] as String?,
      sourceRecoveryPointArn: json['SourceRecoveryPointArn'] as String?,
      state: (json['State'] as String?)?.let(CopyJobState.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupSizeInBytes = this.backupSizeInBytes;
    final childJobsInState = this.childJobsInState;
    final completionDate = this.completionDate;
    final compositeMemberIdentifier = this.compositeMemberIdentifier;
    final copyJobId = this.copyJobId;
    final createdBy = this.createdBy;
    final createdByBackupJobId = this.createdByBackupJobId;
    final creationDate = this.creationDate;
    final destinationBackupVaultArn = this.destinationBackupVaultArn;
    final destinationEncryptionKeyArn = this.destinationEncryptionKeyArn;
    final destinationRecoveryPointArn = this.destinationRecoveryPointArn;
    final destinationRecoveryPointLifecycle =
        this.destinationRecoveryPointLifecycle;
    final destinationVaultLockState = this.destinationVaultLockState;
    final destinationVaultType = this.destinationVaultType;
    final iamRoleArn = this.iamRoleArn;
    final isParent = this.isParent;
    final messageCategory = this.messageCategory;
    final numberOfChildJobs = this.numberOfChildJobs;
    final parentJobId = this.parentJobId;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final sourceBackupVaultArn = this.sourceBackupVaultArn;
    final sourceRecoveryPointArn = this.sourceRecoveryPointArn;
    final state = this.state;
    final statusMessage = this.statusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (childJobsInState != null)
        'ChildJobsInState':
            childJobsInState.map((k, e) => MapEntry(k.value, e)),
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (compositeMemberIdentifier != null)
        'CompositeMemberIdentifier': compositeMemberIdentifier,
      if (copyJobId != null) 'CopyJobId': copyJobId,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdByBackupJobId != null)
        'CreatedByBackupJobId': createdByBackupJobId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (destinationBackupVaultArn != null)
        'DestinationBackupVaultArn': destinationBackupVaultArn,
      if (destinationEncryptionKeyArn != null)
        'DestinationEncryptionKeyArn': destinationEncryptionKeyArn,
      if (destinationRecoveryPointArn != null)
        'DestinationRecoveryPointArn': destinationRecoveryPointArn,
      if (destinationRecoveryPointLifecycle != null)
        'DestinationRecoveryPointLifecycle': destinationRecoveryPointLifecycle,
      if (destinationVaultLockState != null)
        'DestinationVaultLockState': destinationVaultLockState,
      if (destinationVaultType != null)
        'DestinationVaultType': destinationVaultType,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (isParent != null) 'IsParent': isParent,
      if (messageCategory != null) 'MessageCategory': messageCategory,
      if (numberOfChildJobs != null) 'NumberOfChildJobs': numberOfChildJobs,
      if (parentJobId != null) 'ParentJobId': parentJobId,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (sourceBackupVaultArn != null)
        'SourceBackupVaultArn': sourceBackupVaultArn,
      if (sourceRecoveryPointArn != null)
        'SourceRecoveryPointArn': sourceRecoveryPointArn,
      if (state != null) 'State': state.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class CopyJobState {
  static const created = CopyJobState._('CREATED');
  static const running = CopyJobState._('RUNNING');
  static const completed = CopyJobState._('COMPLETED');
  static const failed = CopyJobState._('FAILED');
  static const partial = CopyJobState._('PARTIAL');

  final String value;

  const CopyJobState._(this.value);

  static const values = [created, running, completed, failed, partial];

  static CopyJobState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CopyJobState._(value));

  @override
  bool operator ==(other) => other is CopyJobState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains metadata about a backup vault.
class BackupVaultListMember {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String? backupVaultName;

  /// The date and time a resource backup is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of running the operation twice. This parameter is
  /// optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String? creatorRequestId;

  /// A server-side encryption key you can specify to encrypt your backups from
  /// services that support full Backup management; for example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// If you specify a key, you must specify its ARN, not its alias. If you do not
  /// specify a key, Backup creates a KMS key for you by default.
  ///
  /// To learn which Backup services support full Backup management and how Backup
  /// handles encryption for backups from services that do not yet support full
  /// Backup, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/encryption.html">
  /// Encryption for backups in Backup</a>
  final String? encryptionKeyArn;

  /// The type of encryption key used for the backup vault. Valid values are
  /// CUSTOMER_MANAGED_KMS_KEY for customer-managed keys or Amazon Web
  /// Services_OWNED_KMS_KEY for Amazon Web Services-owned keys.
  final EncryptionKeyType? encryptionKeyType;

  /// The date and time when Backup Vault Lock configuration becomes immutable,
  /// meaning it cannot be changed or deleted.
  ///
  /// If you applied Vault Lock to your vault without specifying a lock date, you
  /// can change your Vault Lock settings, or delete Vault Lock from the vault
  /// entirely, at any time.
  ///
  /// This value is in Unix format, Coordinated Universal Time (UTC), and accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? lockDate;

  /// A Boolean value that indicates whether Backup Vault Lock applies to the
  /// selected backup vault. If <code>true</code>, Vault Lock prevents delete and
  /// update operations on the recovery points in the selected vault.
  final bool? locked;

  /// The Backup Vault Lock setting that specifies the maximum retention period
  /// that the vault retains its recovery points. If this parameter is not
  /// specified, Vault Lock does not enforce a maximum retention period on the
  /// recovery points in the vault (allowing indefinite storage).
  ///
  /// If specified, any backup or copy job to the vault must have a lifecycle
  /// policy with a retention period equal to or shorter than the maximum
  /// retention period. If the job's retention period is longer than that maximum
  /// retention period, then the vault fails the backup or copy job, and you
  /// should either modify your lifecycle settings or use a different vault.
  /// Recovery points already stored in the vault prior to Vault Lock are not
  /// affected.
  final int? maxRetentionDays;

  /// The Backup Vault Lock setting that specifies the minimum retention period
  /// that the vault retains its recovery points. If this parameter is not
  /// specified, Vault Lock does not enforce a minimum retention period.
  ///
  /// If specified, any backup or copy job to the vault must have a lifecycle
  /// policy with a retention period equal to or longer than the minimum retention
  /// period. If the job's retention period is shorter than that minimum retention
  /// period, then the vault fails the backup or copy job, and you should either
  /// modify your lifecycle settings or use a different vault. Recovery points
  /// already stored in the vault prior to Vault Lock are not affected.
  final int? minRetentionDays;

  /// The number of recovery points that are stored in a backup vault.
  final int? numberOfRecoveryPoints;

  /// The current state of the vault.
  final VaultState? vaultState;

  /// The type of vault in which the described recovery point is stored.
  final VaultType? vaultType;

  BackupVaultListMember({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.encryptionKeyType,
    this.lockDate,
    this.locked,
    this.maxRetentionDays,
    this.minRetentionDays,
    this.numberOfRecoveryPoints,
    this.vaultState,
    this.vaultType,
  });

  factory BackupVaultListMember.fromJson(Map<String, dynamic> json) {
    return BackupVaultListMember(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      encryptionKeyType: (json['EncryptionKeyType'] as String?)
          ?.let(EncryptionKeyType.fromString),
      lockDate: timeStampFromJson(json['LockDate']),
      locked: json['Locked'] as bool?,
      maxRetentionDays: json['MaxRetentionDays'] as int?,
      minRetentionDays: json['MinRetentionDays'] as int?,
      numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int?,
      vaultState: (json['VaultState'] as String?)?.let(VaultState.fromString),
      vaultType: (json['VaultType'] as String?)?.let(VaultType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final encryptionKeyArn = this.encryptionKeyArn;
    final encryptionKeyType = this.encryptionKeyType;
    final lockDate = this.lockDate;
    final locked = this.locked;
    final maxRetentionDays = this.maxRetentionDays;
    final minRetentionDays = this.minRetentionDays;
    final numberOfRecoveryPoints = this.numberOfRecoveryPoints;
    final vaultState = this.vaultState;
    final vaultType = this.vaultType;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (encryptionKeyType != null)
        'EncryptionKeyType': encryptionKeyType.value,
      if (lockDate != null) 'LockDate': unixTimestampToJson(lockDate),
      if (locked != null) 'Locked': locked,
      if (maxRetentionDays != null) 'MaxRetentionDays': maxRetentionDays,
      if (minRetentionDays != null) 'MinRetentionDays': minRetentionDays,
      if (numberOfRecoveryPoints != null)
        'NumberOfRecoveryPoints': numberOfRecoveryPoints,
      if (vaultState != null) 'VaultState': vaultState.value,
      if (vaultType != null) 'VaultType': vaultType.value,
    };
  }
}

/// Contains metadata about a <code>BackupSelection</code> object.
class BackupSelectionsListMember {
  /// Uniquely identifies a backup plan.
  final String? backupPlanId;

  /// The date and time a backup plan is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of running the operation twice. This parameter is
  /// optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String? creatorRequestId;

  /// Specifies the IAM role Amazon Resource Name (ARN) to create the target
  /// recovery point; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// Uniquely identifies a request to assign a set of resources to a backup plan.
  final String? selectionId;

  /// The display name of a resource selection document.
  final String? selectionName;

  BackupSelectionsListMember({
    this.backupPlanId,
    this.creationDate,
    this.creatorRequestId,
    this.iamRoleArn,
    this.selectionId,
    this.selectionName,
  });

  factory BackupSelectionsListMember.fromJson(Map<String, dynamic> json) {
    return BackupSelectionsListMember(
      backupPlanId: json['BackupPlanId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      selectionId: json['SelectionId'] as String?,
      selectionName: json['SelectionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanId = this.backupPlanId;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final iamRoleArn = this.iamRoleArn;
    final selectionId = this.selectionId;
    final selectionName = this.selectionName;
    return {
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (selectionId != null) 'SelectionId': selectionId,
      if (selectionName != null) 'SelectionName': selectionName,
    };
  }
}

/// Contains metadata about a backup plan.
class BackupPlansListMember {
  /// Contains a list of <code>BackupOptions</code> for a resource type.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup plan; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:plan:8F81F553-3A74-4A3F-B93D-B3360DC80C50</code>.
  final String? backupPlanArn;

  /// Uniquely identifies a backup plan.
  final String? backupPlanId;

  /// The display name of a saved backup plan.
  final String? backupPlanName;

  /// The date and time a resource backup plan is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of running the operation twice. This parameter is
  /// optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String? creatorRequestId;

  /// The date and time a backup plan is deleted, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>DeletionDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? deletionDate;

  /// The last time this backup plan was run. A date and time, in Unix format and
  /// Coordinated Universal Time (UTC). The value of
  /// <code>LastExecutionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastExecutionDate;

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version IDs cannot be edited.
  final String? versionId;

  BackupPlansListMember({
    this.advancedBackupSettings,
    this.backupPlanArn,
    this.backupPlanId,
    this.backupPlanName,
    this.creationDate,
    this.creatorRequestId,
    this.deletionDate,
    this.lastExecutionDate,
    this.versionId,
  });

  factory BackupPlansListMember.fromJson(Map<String, dynamic> json) {
    return BackupPlansListMember(
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.nonNulls
          .map((e) => AdvancedBackupSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      backupPlanArn: json['BackupPlanArn'] as String?,
      backupPlanId: json['BackupPlanId'] as String?,
      backupPlanName: json['BackupPlanName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      deletionDate: timeStampFromJson(json['DeletionDate']),
      lastExecutionDate: timeStampFromJson(json['LastExecutionDate']),
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final advancedBackupSettings = this.advancedBackupSettings;
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final backupPlanName = this.backupPlanName;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final deletionDate = this.deletionDate;
    final lastExecutionDate = this.lastExecutionDate;
    final versionId = this.versionId;
    return {
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
      if (backupPlanArn != null) 'BackupPlanArn': backupPlanArn,
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (backupPlanName != null) 'BackupPlanName': backupPlanName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (deletionDate != null)
        'DeletionDate': unixTimestampToJson(deletionDate),
      if (lastExecutionDate != null)
        'LastExecutionDate': unixTimestampToJson(lastExecutionDate),
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// An object specifying metadata associated with a backup plan template.
class BackupPlanTemplatesListMember {
  /// Uniquely identifies a stored backup plan template.
  final String? backupPlanTemplateId;

  /// The optional display name of a backup plan template.
  final String? backupPlanTemplateName;

  BackupPlanTemplatesListMember({
    this.backupPlanTemplateId,
    this.backupPlanTemplateName,
  });

  factory BackupPlanTemplatesListMember.fromJson(Map<String, dynamic> json) {
    return BackupPlanTemplatesListMember(
      backupPlanTemplateId: json['BackupPlanTemplateId'] as String?,
      backupPlanTemplateName: json['BackupPlanTemplateName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanTemplateId = this.backupPlanTemplateId;
    final backupPlanTemplateName = this.backupPlanTemplateName;
    return {
      if (backupPlanTemplateId != null)
        'BackupPlanTemplateId': backupPlanTemplateId,
      if (backupPlanTemplateName != null)
        'BackupPlanTemplateName': backupPlanTemplateName,
    };
  }
}

/// This is a summary of jobs created or running within the most recent 30 days.
///
/// The returned summary may contain the following: Region, Account, State,
/// RestourceType, MessageCategory, StartTime, EndTime, and Count of included
/// jobs.
class BackupJobSummary {
  /// The account ID that owns the jobs within the summary.
  final String? accountId;

  /// The value as a number of jobs in a job summary.
  final int? count;

  /// The value of time in number format of a job end time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? endTime;

  /// This parameter is the job count for the specified message category.
  ///
  /// Example strings include <code>AccessDenied</code>, <code>Success</code>, and
  /// <code>InvalidParameters</code>. See <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of MessageCategory strings.
  ///
  /// The the value ANY returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message categories
  /// and returns the sum.
  final String? messageCategory;

  /// The Amazon Web Services Regions within the job summary.
  final String? region;

  /// This value is the job count for the specified resource type. The request
  /// <code>GetSupportedResourceTypes</code> returns strings for supported
  /// resource types.
  final String? resourceType;

  /// The value of time in number format of a job start time.
  ///
  /// This value is the time in Unix format, Coordinated Universal Time (UTC), and
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startTime;

  /// This value is job count for jobs with the specified state.
  final BackupJobStatus? state;

  BackupJobSummary({
    this.accountId,
    this.count,
    this.endTime,
    this.messageCategory,
    this.region,
    this.resourceType,
    this.startTime,
    this.state,
  });

  factory BackupJobSummary.fromJson(Map<String, dynamic> json) {
    return BackupJobSummary(
      accountId: json['AccountId'] as String?,
      count: json['Count'] as int?,
      endTime: timeStampFromJson(json['EndTime']),
      messageCategory: json['MessageCategory'] as String?,
      region: json['Region'] as String?,
      resourceType: json['ResourceType'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.let(BackupJobStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final count = this.count;
    final endTime = this.endTime;
    final messageCategory = this.messageCategory;
    final region = this.region;
    final resourceType = this.resourceType;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (count != null) 'Count': count,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (messageCategory != null) 'MessageCategory': messageCategory,
      if (region != null) 'Region': region,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.value,
    };
  }
}

class BackupJobStatus {
  static const created = BackupJobStatus._('CREATED');
  static const pending = BackupJobStatus._('PENDING');
  static const running = BackupJobStatus._('RUNNING');
  static const aborting = BackupJobStatus._('ABORTING');
  static const aborted = BackupJobStatus._('ABORTED');
  static const completed = BackupJobStatus._('COMPLETED');
  static const failed = BackupJobStatus._('FAILED');
  static const expired = BackupJobStatus._('EXPIRED');
  static const partial = BackupJobStatus._('PARTIAL');
  static const aggregateAll = BackupJobStatus._('AGGREGATE_ALL');
  static const any = BackupJobStatus._('ANY');

  final String value;

  const BackupJobStatus._(this.value);

  static const values = [
    created,
    pending,
    running,
    aborting,
    aborted,
    completed,
    failed,
    expired,
    partial,
    aggregateAll,
    any
  ];

  static BackupJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BackupJobStatus._(value));

  @override
  bool operator ==(other) => other is BackupJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about a backup job.
class BackupJob {
  /// The account ID that owns the backup job.
  final String? accountId;

  /// Uniquely identifies a request to Backup to back up a resource.
  final String? backupJobId;

  /// Specifies the backup option for a selected resource. This option is only
  /// available for Windows Volume Shadow Copy Service (VSS) backup jobs.
  ///
  /// Valid values: Set to <code>"WindowsVSS":"enabled"</code> to enable the
  /// <code>WindowsVSS</code> backup option and create a Windows VSS backup. Set
  /// to <code>"WindowsVSS":"disabled"</code> to create a regular backup. If you
  /// specify an invalid option, you get an
  /// <code>InvalidParameterValueException</code> exception.
  final Map<String, String>? backupOptions;

  /// The size, in bytes, of a backup (recovery point).
  ///
  /// This value can render differently depending on the resource type as Backup
  /// pulls in data information from other Amazon Web Services services. For
  /// example, the value returned may show a value of <code>0</code>, which may
  /// differ from the anticipated value.
  ///
  /// The expected behavior for values by resource type are described as follows:
  ///
  /// <ul>
  /// <li>
  /// Amazon Aurora, Amazon DocumentDB, and Amazon Neptune do not have this value
  /// populate from the operation <code>GetBackupJobStatus</code>.
  /// </li>
  /// <li>
  /// For Amazon DynamoDB with advanced features, this value refers to the size of
  /// the recovery point (backup).
  /// </li>
  /// <li>
  /// Amazon EC2 and Amazon EBS show volume size (provisioned storage) returned as
  /// part of this value. Amazon EBS does not return backup size information;
  /// snapshot size will have the same value as the original resource that was
  /// backed up.
  /// </li>
  /// <li>
  /// For Amazon EFS, this value refers to the delta bytes transferred during a
  /// backup.
  /// </li>
  /// <li>
  /// For Amazon EKS, this value refers to the size of your nested EKS recovery
  /// point.
  /// </li>
  /// <li>
  /// Amazon FSx does not populate this value from the operation
  /// <code>GetBackupJobStatus</code> for FSx file systems.
  /// </li>
  /// <li>
  /// An Amazon RDS instance will show as <code>0</code>.
  /// </li>
  /// <li>
  /// For virtual machines running VMware, this value is passed to Backup through
  /// an asynchronous workflow, which can mean this displayed value can
  /// under-represent the actual backup size.
  /// </li>
  /// </ul>
  final int? backupSizeInBytes;

  /// Represents the type of backup for a backup job.
  final String? backupType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:backup-vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String? backupVaultName;

  /// The size in bytes transferred to a backup vault at the time that the job
  /// status was queried.
  final int? bytesTransferred;

  /// The date and time a job to create a backup job is completed, in Unix format
  /// and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// Contains identifying information about the creation of a backup job,
  /// including the <code>BackupPlanArn</code>, <code>BackupPlanId</code>,
  /// <code>BackupPlanVersion</code>, and <code>BackupRuleId</code> of the backup
  /// plan used to create it.
  final RecoveryPointCreator? createdBy;

  /// The date and time a backup job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the backup.
  /// This can be a customer-managed key or an Amazon Web Services managed key,
  /// depending on the vault configuration.
  final String? encryptionKeyArn;

  /// The date and time a job to back up resources is expected to be completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>ExpectedCompletionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  final DateTime? expectedCompletionDate;

  /// Specifies the IAM role ARN used to create the target recovery point. IAM
  /// roles other than the default role must include either <code>AWSBackup</code>
  /// or <code>AwsBackup</code> in the role name. For example,
  /// <code>arn:aws:iam::123456789012:role/AWSBackupRDSAccess</code>. Role names
  /// without those strings lack permissions to perform backup jobs.
  final String? iamRoleArn;

  /// The date on which the backup job was initiated.
  final DateTime? initiationDate;

  /// A boolean value indicating whether the backup is encrypted. All backups in
  /// Backup are encrypted, but this field indicates the encryption status for
  /// transparency.
  final bool? isEncrypted;

  /// This is a boolean value indicating this is a parent (composite) backup job.
  final bool? isParent;

  /// This parameter is the job count for the specified message category.
  ///
  /// Example strings may include <code>AccessDenied</code>, <code>SUCCESS</code>,
  /// <code>AGGREGATE_ALL</code>, and <code>INVALIDPARAMETERS</code>. See <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/monitoring.html">Monitoring</a>
  /// for a list of MessageCategory strings.
  ///
  /// The the value ANY returns count of all message categories.
  ///
  /// <code>AGGREGATE_ALL</code> aggregates job counts for all message categories
  /// and returns the sum.
  final String? messageCategory;

  /// This uniquely identifies a request to Backup to back up a resource. The
  /// return will be the parent (composite) job ID.
  final String? parentJobId;

  /// Contains an estimated percentage complete of a job at the time the job
  /// status was queried.
  final String? percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;
  final Lifecycle? recoveryPointLifecycle;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// The non-unique name of the resource that belongs to the specified backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource to be backed up; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database. For Windows Volume Shadow Copy
  /// Service (VSS) backups, the only supported resource type is Amazon EC2.
  final String? resourceType;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC) when
  /// a backup job must be started before it is canceled. The value is calculated
  /// by adding the start window to the scheduled time. So if the scheduled time
  /// were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time
  /// would be 8:00 PM on the date specified. The value of <code>StartBy</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startBy;

  /// The current state of a backup job.
  final BackupJobState? state;

  /// A detailed message explaining the status of the job to back up a resource.
  final String? statusMessage;

  /// The lock state of the backup vault. For logically air-gapped vaults, this
  /// indicates whether the vault is locked in compliance mode. Valid values
  /// include <code>LOCKED</code> and <code>UNLOCKED</code>.
  final String? vaultLockState;

  /// The type of backup vault where the recovery point is stored. Valid values
  /// are <code>BACKUP_VAULT</code> for standard backup vaults and
  /// <code>LOGICALLY_AIR_GAPPED_BACKUP_VAULT</code> for logically air-gapped
  /// vaults.
  final String? vaultType;

  BackupJob({
    this.accountId,
    this.backupJobId,
    this.backupOptions,
    this.backupSizeInBytes,
    this.backupType,
    this.backupVaultArn,
    this.backupVaultName,
    this.bytesTransferred,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.expectedCompletionDate,
    this.iamRoleArn,
    this.initiationDate,
    this.isEncrypted,
    this.isParent,
    this.messageCategory,
    this.parentJobId,
    this.percentDone,
    this.recoveryPointArn,
    this.recoveryPointLifecycle,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
    this.startBy,
    this.state,
    this.statusMessage,
    this.vaultLockState,
    this.vaultType,
  });

  factory BackupJob.fromJson(Map<String, dynamic> json) {
    return BackupJob(
      accountId: json['AccountId'] as String?,
      backupJobId: json['BackupJobId'] as String?,
      backupOptions: (json['BackupOptions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      backupType: json['BackupType'] as String?,
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      bytesTransferred: json['BytesTransferred'] as int?,
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      expectedCompletionDate: timeStampFromJson(json['ExpectedCompletionDate']),
      iamRoleArn: json['IamRoleArn'] as String?,
      initiationDate: timeStampFromJson(json['InitiationDate']),
      isEncrypted: json['IsEncrypted'] as bool?,
      isParent: json['IsParent'] as bool?,
      messageCategory: json['MessageCategory'] as String?,
      parentJobId: json['ParentJobId'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      recoveryPointLifecycle: json['RecoveryPointLifecycle'] != null
          ? Lifecycle.fromJson(
              json['RecoveryPointLifecycle'] as Map<String, dynamic>)
          : null,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
      startBy: timeStampFromJson(json['StartBy']),
      state: (json['State'] as String?)?.let(BackupJobState.fromString),
      statusMessage: json['StatusMessage'] as String?,
      vaultLockState: json['VaultLockState'] as String?,
      vaultType: json['VaultType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupJobId = this.backupJobId;
    final backupOptions = this.backupOptions;
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupType = this.backupType;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final bytesTransferred = this.bytesTransferred;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final expectedCompletionDate = this.expectedCompletionDate;
    final iamRoleArn = this.iamRoleArn;
    final initiationDate = this.initiationDate;
    final isEncrypted = this.isEncrypted;
    final isParent = this.isParent;
    final messageCategory = this.messageCategory;
    final parentJobId = this.parentJobId;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final recoveryPointLifecycle = this.recoveryPointLifecycle;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final startBy = this.startBy;
    final state = this.state;
    final statusMessage = this.statusMessage;
    final vaultLockState = this.vaultLockState;
    final vaultType = this.vaultType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupJobId != null) 'BackupJobId': backupJobId,
      if (backupOptions != null) 'BackupOptions': backupOptions,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupType != null) 'BackupType': backupType,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (bytesTransferred != null) 'BytesTransferred': bytesTransferred,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (expectedCompletionDate != null)
        'ExpectedCompletionDate': unixTimestampToJson(expectedCompletionDate),
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (isEncrypted != null) 'IsEncrypted': isEncrypted,
      if (isParent != null) 'IsParent': isParent,
      if (messageCategory != null) 'MessageCategory': messageCategory,
      if (parentJobId != null) 'ParentJobId': parentJobId,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (recoveryPointLifecycle != null)
        'RecoveryPointLifecycle': recoveryPointLifecycle,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startBy != null) 'StartBy': unixTimestampToJson(startBy),
      if (state != null) 'State': state.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vaultLockState != null) 'VaultLockState': vaultLockState,
      if (vaultType != null) 'VaultType': vaultType,
    };
  }
}

class BackupJobState {
  static const created = BackupJobState._('CREATED');
  static const pending = BackupJobState._('PENDING');
  static const running = BackupJobState._('RUNNING');
  static const aborting = BackupJobState._('ABORTING');
  static const aborted = BackupJobState._('ABORTED');
  static const completed = BackupJobState._('COMPLETED');
  static const failed = BackupJobState._('FAILED');
  static const expired = BackupJobState._('EXPIRED');
  static const partial = BackupJobState._('PARTIAL');

  final String value;

  const BackupJobState._(this.value);

  static const values = [
    created,
    pending,
    running,
    aborting,
    aborted,
    completed,
    failed,
    expired,
    partial
  ];

  static BackupJobState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => BackupJobState._(value));

  @override
  bool operator ==(other) => other is BackupJobState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains metadata about a tiering configuration.
class TieringConfiguration {
  /// The name of the backup vault where the tiering configuration applies. Use
  /// <code>*</code> to apply to all backup vaults.
  final String backupVaultName;

  /// An array of resource selection objects that specify which resources are
  /// included in the tiering configuration and their tiering settings.
  final List<ResourceSelection> resourceSelection;

  /// The unique name of the tiering configuration. This cannot be changed after
  /// creation, and it must consist of only alphanumeric characters and
  /// underscores.
  final String tieringConfigurationName;

  /// The date and time a tiering configuration was created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationTime</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087AM.
  final DateTime? creationTime;

  /// This is a unique string that identifies the request and allows failed
  /// requests to be retried without the risk of running the operation twice.
  final String? creatorRequestId;

  /// The date and time a tiering configuration was updated, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastUpdatedTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087AM.
  final DateTime? lastUpdatedTime;

  /// An Amazon Resource Name (ARN) that uniquely identifies the tiering
  /// configuration.
  final String? tieringConfigurationArn;

  TieringConfiguration({
    required this.backupVaultName,
    required this.resourceSelection,
    required this.tieringConfigurationName,
    this.creationTime,
    this.creatorRequestId,
    this.lastUpdatedTime,
    this.tieringConfigurationArn,
  });

  factory TieringConfiguration.fromJson(Map<String, dynamic> json) {
    return TieringConfiguration(
      backupVaultName: (json['BackupVaultName'] as String?) ?? '',
      resourceSelection: ((json['ResourceSelection'] as List?) ?? const [])
          .nonNulls
          .map((e) => ResourceSelection.fromJson(e as Map<String, dynamic>))
          .toList(),
      tieringConfigurationName:
          (json['TieringConfigurationName'] as String?) ?? '',
      creationTime: timeStampFromJson(json['CreationTime']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      tieringConfigurationArn: json['TieringConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultName = this.backupVaultName;
    final resourceSelection = this.resourceSelection;
    final tieringConfigurationName = this.tieringConfigurationName;
    final creationTime = this.creationTime;
    final creatorRequestId = this.creatorRequestId;
    final lastUpdatedTime = this.lastUpdatedTime;
    final tieringConfigurationArn = this.tieringConfigurationArn;
    return {
      'BackupVaultName': backupVaultName,
      'ResourceSelection': resourceSelection,
      'TieringConfigurationName': tieringConfigurationName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (tieringConfigurationArn != null)
        'TieringConfigurationArn': tieringConfigurationArn,
    };
  }
}

/// This contains metadata about a restore testing selection.
class RestoreTestingSelectionForGet {
  /// The date and time that a restore testing selection was created, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CreationTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 201812:11:30.087 AM.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the IAM role that Backup uses to create
  /// the target resource; for
  /// example:<code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The type of Amazon Web Services resource included in a resource testing
  /// selection; for example, an Amazon EBS volume or an Amazon RDS database.
  final String protectedResourceType;

  /// The RestoreTestingPlanName is a unique string that is the name of the
  /// restore testing plan.
  final String restoreTestingPlanName;

  /// The unique name of the restore testing selection that belongs to the related
  /// restore testing plan.
  ///
  /// The name consists of only alphanumeric characters and underscores. Maximum
  /// length is 50.
  final String restoreTestingSelectionName;

  /// This identifies the request and allows failed requests to be retried without
  /// the risk of running the operation twice. If the request includes a
  /// <code>CreatorRequestId</code> that matches an existing backup plan, that
  /// plan is returned. This parameter is optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String? creatorRequestId;

  /// You can include specific ARNs, such as <code>ProtectedResourceArns:
  /// ["arn:aws:...", "arn:aws:..."]</code> or you can include a wildcard:
  /// <code>ProtectedResourceArns: ["*"]</code>, but not both.
  final List<String>? protectedResourceArns;

  /// In a resource testing selection, this parameter filters by specific
  /// conditions such as <code>StringEquals</code> or
  /// <code>StringNotEquals</code>.
  final ProtectedResourceConditions? protectedResourceConditions;

  /// You can override certain restore metadata keys by including the parameter
  /// <code>RestoreMetadataOverrides</code> in the body of
  /// <code>RestoreTestingSelection</code>. Key values are not case sensitive.
  ///
  /// See the complete list of <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restore-testing-inferred-metadata.html">restore
  /// testing inferred metadata</a>.
  final Map<String, String>? restoreMetadataOverrides;

  /// This is amount of hours (1 to 168) available to run a validation script on
  /// the data. The data will be deleted upon the completion of the validation
  /// script or the end of the specified retention period, whichever comes first.
  final int? validationWindowHours;

  RestoreTestingSelectionForGet({
    required this.creationTime,
    required this.iamRoleArn,
    required this.protectedResourceType,
    required this.restoreTestingPlanName,
    required this.restoreTestingSelectionName,
    this.creatorRequestId,
    this.protectedResourceArns,
    this.protectedResourceConditions,
    this.restoreMetadataOverrides,
    this.validationWindowHours,
  });

  factory RestoreTestingSelectionForGet.fromJson(Map<String, dynamic> json) {
    return RestoreTestingSelectionForGet(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      iamRoleArn: (json['IamRoleArn'] as String?) ?? '',
      protectedResourceType: (json['ProtectedResourceType'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
      restoreTestingSelectionName:
          (json['RestoreTestingSelectionName'] as String?) ?? '',
      creatorRequestId: json['CreatorRequestId'] as String?,
      protectedResourceArns: (json['ProtectedResourceArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      protectedResourceConditions: json['ProtectedResourceConditions'] != null
          ? ProtectedResourceConditions.fromJson(
              json['ProtectedResourceConditions'] as Map<String, dynamic>)
          : null,
      restoreMetadataOverrides:
          (json['RestoreMetadataOverrides'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      validationWindowHours: json['ValidationWindowHours'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final iamRoleArn = this.iamRoleArn;
    final protectedResourceType = this.protectedResourceType;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final restoreTestingSelectionName = this.restoreTestingSelectionName;
    final creatorRequestId = this.creatorRequestId;
    final protectedResourceArns = this.protectedResourceArns;
    final protectedResourceConditions = this.protectedResourceConditions;
    final restoreMetadataOverrides = this.restoreMetadataOverrides;
    final validationWindowHours = this.validationWindowHours;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'IamRoleArn': iamRoleArn,
      'ProtectedResourceType': protectedResourceType,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'RestoreTestingSelectionName': restoreTestingSelectionName,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (protectedResourceArns != null)
        'ProtectedResourceArns': protectedResourceArns,
      if (protectedResourceConditions != null)
        'ProtectedResourceConditions': protectedResourceConditions,
      if (restoreMetadataOverrides != null)
        'RestoreMetadataOverrides': restoreMetadataOverrides,
      if (validationWindowHours != null)
        'ValidationWindowHours': validationWindowHours,
    };
  }
}

/// This contains metadata about a restore testing plan.
class RestoreTestingPlanForGet {
  /// The date and time that a restore testing plan was created, in Unix format
  /// and Coordinated Universal Time (UTC). The value of <code>CreationTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime creationTime;

  /// The specified criteria to assign a set of resources, such as recovery point
  /// types or backup vaults.
  final RestoreTestingRecoveryPointSelection recoveryPointSelection;

  /// An Amazon Resource Name (ARN) that uniquely identifies a restore testing
  /// plan.
  final String restoreTestingPlanArn;

  /// The restore testing plan name.
  final String restoreTestingPlanName;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed. When no CRON expression is provided, Backup will use the default
  /// expression <code>cron(0 5 ? * * *)</code>.
  final String scheduleExpression;

  /// This identifies the request and allows failed requests to be retried without
  /// the risk of running the operation twice. If the request includes a
  /// <code>CreatorRequestId</code> that matches an existing backup plan, that
  /// plan is returned. This parameter is optional.
  ///
  /// If used, this parameter must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String? creatorRequestId;

  /// The last time a restore test was run with the specified restore testing
  /// plan. A date and time, in Unix format and Coordinated Universal Time (UTC).
  /// The value of <code>LastExecutionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  final DateTime? lastExecutionTime;

  /// The date and time that the restore testing plan was updated. This update is
  /// in Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>LastUpdateTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastUpdateTime;

  /// Optional. This is the timezone in which the schedule expression is set. By
  /// default, ScheduleExpressions are in UTC. You can modify this to a specified
  /// timezone.
  final String? scheduleExpressionTimezone;

  /// Defaults to 24 hours.
  ///
  /// A value in hours after a restore test is scheduled before a job will be
  /// canceled if it doesn't start successfully. This value is optional. If this
  /// value is included, this parameter has a maximum value of 168 hours (one
  /// week).
  final int? startWindowHours;

  RestoreTestingPlanForGet({
    required this.creationTime,
    required this.recoveryPointSelection,
    required this.restoreTestingPlanArn,
    required this.restoreTestingPlanName,
    required this.scheduleExpression,
    this.creatorRequestId,
    this.lastExecutionTime,
    this.lastUpdateTime,
    this.scheduleExpressionTimezone,
    this.startWindowHours,
  });

  factory RestoreTestingPlanForGet.fromJson(Map<String, dynamic> json) {
    return RestoreTestingPlanForGet(
      creationTime: nonNullableTimeStampFromJson(json['CreationTime'] ?? 0),
      recoveryPointSelection: RestoreTestingRecoveryPointSelection.fromJson(
          (json['RecoveryPointSelection'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      restoreTestingPlanArn: (json['RestoreTestingPlanArn'] as String?) ?? '',
      restoreTestingPlanName: (json['RestoreTestingPlanName'] as String?) ?? '',
      scheduleExpression: (json['ScheduleExpression'] as String?) ?? '',
      creatorRequestId: json['CreatorRequestId'] as String?,
      lastExecutionTime: timeStampFromJson(json['LastExecutionTime']),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      scheduleExpressionTimezone: json['ScheduleExpressionTimezone'] as String?,
      startWindowHours: json['StartWindowHours'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final recoveryPointSelection = this.recoveryPointSelection;
    final restoreTestingPlanArn = this.restoreTestingPlanArn;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final scheduleExpression = this.scheduleExpression;
    final creatorRequestId = this.creatorRequestId;
    final lastExecutionTime = this.lastExecutionTime;
    final lastUpdateTime = this.lastUpdateTime;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowHours = this.startWindowHours;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'RecoveryPointSelection': recoveryPointSelection,
      'RestoreTestingPlanArn': restoreTestingPlanArn,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'ScheduleExpression': scheduleExpression,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (lastExecutionTime != null)
        'LastExecutionTime': unixTimestampToJson(lastExecutionTime),
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowHours != null) 'StartWindowHours': startWindowHours,
    };
  }
}

/// This specifies criteria to assign a set of resources, such as resource types
/// or backup vaults.
class RecoveryPointSelection {
  final DateRange? dateRange;

  /// These are the resources included in the resource selection (including type
  /// of resources and vaults).
  final List<String>? resourceIdentifiers;

  /// These are the names of the vaults in which the selected recovery points are
  /// contained.
  final List<String>? vaultNames;

  RecoveryPointSelection({
    this.dateRange,
    this.resourceIdentifiers,
    this.vaultNames,
  });

  factory RecoveryPointSelection.fromJson(Map<String, dynamic> json) {
    return RecoveryPointSelection(
      dateRange: json['DateRange'] != null
          ? DateRange.fromJson(json['DateRange'] as Map<String, dynamic>)
          : null,
      resourceIdentifiers: (json['ResourceIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      vaultNames: (json['VaultNames'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dateRange = this.dateRange;
    final resourceIdentifiers = this.resourceIdentifiers;
    final vaultNames = this.vaultNames;
    return {
      if (dateRange != null) 'DateRange': dateRange,
      if (resourceIdentifiers != null)
        'ResourceIdentifiers': resourceIdentifiers,
      if (vaultNames != null) 'VaultNames': vaultNames,
    };
  }
}

/// This is a resource filter containing FromDate: DateTime and ToDate:
/// DateTime. Both values are required. Future DateTime values are not
/// permitted.
///
/// The date and time are in Unix format and Coordinated Universal Time (UTC),
/// and it is accurate to milliseconds ((milliseconds are optional). For
/// example, the value 1516925490.087 represents Friday, January 26, 2018
/// 12:11:30.087 AM.
class DateRange {
  /// This value is the beginning date, inclusive.
  ///
  /// The date and time are in Unix format and Coordinated Universal Time (UTC),
  /// and it is accurate to milliseconds (milliseconds are optional).
  final DateTime fromDate;

  /// This value is the end date, inclusive.
  ///
  /// The date and time are in Unix format and Coordinated Universal Time (UTC),
  /// and it is accurate to milliseconds (milliseconds are optional).
  final DateTime toDate;

  DateRange({
    required this.fromDate,
    required this.toDate,
  });

  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      fromDate: nonNullableTimeStampFromJson(json['FromDate'] ?? 0),
      toDate: nonNullableTimeStampFromJson(json['ToDate'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final fromDate = this.fromDate;
    final toDate = this.toDate;
    return {
      'FromDate': unixTimestampToJson(fromDate),
      'ToDate': unixTimestampToJson(toDate),
    };
  }
}

/// Used to specify a set of resources to a backup plan.
///
/// We recommend that you specify conditions, tags, or resources to include or
/// exclude. Otherwise, Backup attempts to select all supported and opted-in
/// storage resources, which could have unintended cost implications.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/assigning-resources.html#assigning-resources-json">Assigning
/// resources programmatically</a>.
class BackupSelection {
  /// The ARN of the IAM role that Backup uses to authenticate when backing up the
  /// target resource; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The display name of a resource selection document. Must contain 1 to 50
  /// alphanumeric or '-_.' characters.
  final String selectionName;

  /// The conditions that you define to assign resources to your backup plans
  /// using tags. For example, <code>"StringEquals": { "ConditionKey":
  /// "aws:ResourceTag/backup", "ConditionValue": "daily" }</code>.
  ///
  /// <code>Conditions</code> supports <code>StringEquals</code>,
  /// <code>StringLike</code>, <code>StringNotEquals</code>, and
  /// <code>StringNotLike</code>. Condition operators are case sensitive.
  ///
  /// If you specify multiple conditions, the resources much match all conditions
  /// (AND logic).
  final Conditions? conditions;

  /// The conditions that you define to assign resources to your backup plans
  /// using tags. For example, <code>"StringEquals": { "ConditionKey": "backup",
  /// "ConditionValue": "daily"}</code>.
  ///
  /// <code>ListOfTags</code> supports only <code>StringEquals</code>. Condition
  /// operators are case sensitive.
  ///
  /// If you specify multiple conditions, the resources much match any of the
  /// conditions (OR logic).
  final List<Condition>? listOfTags;

  /// The Amazon Resource Names (ARNs) of the resources to exclude from a backup
  /// plan. The maximum number of ARNs is 500 without wildcards, or 30 ARNs with
  /// wildcards.
  ///
  /// If you need to exclude many resources from a backup plan, consider a
  /// different resource selection strategy, such as assigning only one or a few
  /// resource types or refining your resource selection using tags.
  final List<String>? notResources;

  /// The Amazon Resource Names (ARNs) of the resources to assign to a backup
  /// plan. The maximum number of ARNs is 500 without wildcards, or 30 ARNs with
  /// wildcards.
  ///
  /// If you need to assign many resources to a backup plan, consider a different
  /// resource selection strategy, such as assigning all resources of a resource
  /// type or refining your resource selection using tags.
  ///
  /// If you specify multiple ARNs, the resources much match any of the ARNs (OR
  /// logic).
  /// <note>
  /// When using wildcards in ARN patterns for backup selections, the asterisk (*)
  /// must appear at the end of the ARN string (prefix pattern). For example,
  /// <code>arn:aws:s3:::my-bucket-*</code> is valid, but
  /// <code>arn:aws:s3:::*-logs</code> is not supported.
  /// </note>
  final List<String>? resources;

  BackupSelection({
    required this.iamRoleArn,
    required this.selectionName,
    this.conditions,
    this.listOfTags,
    this.notResources,
    this.resources,
  });

  factory BackupSelection.fromJson(Map<String, dynamic> json) {
    return BackupSelection(
      iamRoleArn: (json['IamRoleArn'] as String?) ?? '',
      selectionName: (json['SelectionName'] as String?) ?? '',
      conditions: json['Conditions'] != null
          ? Conditions.fromJson(json['Conditions'] as Map<String, dynamic>)
          : null,
      listOfTags: (json['ListOfTags'] as List?)
          ?.nonNulls
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
      notResources: (json['NotResources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      resources: (json['Resources'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final iamRoleArn = this.iamRoleArn;
    final selectionName = this.selectionName;
    final conditions = this.conditions;
    final listOfTags = this.listOfTags;
    final notResources = this.notResources;
    final resources = this.resources;
    return {
      'IamRoleArn': iamRoleArn,
      'SelectionName': selectionName,
      if (conditions != null) 'Conditions': conditions,
      if (listOfTags != null) 'ListOfTags': listOfTags,
      if (notResources != null) 'NotResources': notResources,
      if (resources != null) 'Resources': resources,
    };
  }
}

/// Contains information about which resources to include or exclude from a
/// backup plan using their tags. Conditions are case sensitive.
class Conditions {
  /// Filters the values of your tagged resources for only those resources that
  /// you tagged with the same value. Also called "exact matching."
  final List<ConditionParameter>? stringEquals;

  /// Filters the values of your tagged resources for matching tag values with the
  /// use of a wildcard character (*) anywhere in the string. For example, "prod*"
  /// or "*rod*" matches the tag value "production".
  final List<ConditionParameter>? stringLike;

  /// Filters the values of your tagged resources for only those resources that
  /// you tagged that do not have the same value. Also called "negated matching."
  final List<ConditionParameter>? stringNotEquals;

  /// Filters the values of your tagged resources for non-matching tag values with
  /// the use of a wildcard character (*) anywhere in the string.
  final List<ConditionParameter>? stringNotLike;

  Conditions({
    this.stringEquals,
    this.stringLike,
    this.stringNotEquals,
    this.stringNotLike,
  });

  factory Conditions.fromJson(Map<String, dynamic> json) {
    return Conditions(
      stringEquals: (json['StringEquals'] as List?)
          ?.nonNulls
          .map((e) => ConditionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringLike: (json['StringLike'] as List?)
          ?.nonNulls
          .map((e) => ConditionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringNotEquals: (json['StringNotEquals'] as List?)
          ?.nonNulls
          .map((e) => ConditionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringNotLike: (json['StringNotLike'] as List?)
          ?.nonNulls
          .map((e) => ConditionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stringEquals = this.stringEquals;
    final stringLike = this.stringLike;
    final stringNotEquals = this.stringNotEquals;
    final stringNotLike = this.stringNotLike;
    return {
      if (stringEquals != null) 'StringEquals': stringEquals,
      if (stringLike != null) 'StringLike': stringLike,
      if (stringNotEquals != null) 'StringNotEquals': stringNotEquals,
      if (stringNotLike != null) 'StringNotLike': stringNotLike,
    };
  }
}

/// Includes information about tags you define to assign tagged resources to a
/// backup plan.
///
/// Include the prefix <code>aws:ResourceTag</code> in your tags. For example,
/// <code>"aws:ResourceTag/TagKey1": "Value1"</code>.
class ConditionParameter {
  /// The key in a key-value pair. For example, in the tag <code>Department:
  /// Accounting</code>, <code>Department</code> is the key.
  final String? conditionKey;

  /// The value in a key-value pair. For example, in the tag <code>Department:
  /// Accounting</code>, <code>Accounting</code> is the value.
  final String? conditionValue;

  ConditionParameter({
    this.conditionKey,
    this.conditionValue,
  });

  factory ConditionParameter.fromJson(Map<String, dynamic> json) {
    return ConditionParameter(
      conditionKey: json['ConditionKey'] as String?,
      conditionValue: json['ConditionValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conditionKey = this.conditionKey;
    final conditionValue = this.conditionValue;
    return {
      if (conditionKey != null) 'ConditionKey': conditionKey,
      if (conditionValue != null) 'ConditionValue': conditionValue,
    };
  }
}

/// Contains an array of triplets made up of a condition type (such as
/// <code>StringEquals</code>), a key, and a value. Used to filter resources
/// using their tags and assign them to a backup plan. Case sensitive.
class Condition {
  /// The key in a key-value pair. For example, in the tag <code>Department:
  /// Accounting</code>, <code>Department</code> is the key.
  final String conditionKey;

  /// An operation applied to a key-value pair used to assign resources to your
  /// backup plan. Condition only supports <code>StringEquals</code>. For more
  /// flexible assignment options, including <code>StringLike</code> and the
  /// ability to exclude resources from your backup plan, use
  /// <code>Conditions</code> (with an "s" on the end) for your <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_BackupSelection.html">
  /// <code>BackupSelection</code> </a>.
  final ConditionType conditionType;

  /// The value in a key-value pair. For example, in the tag <code>Department:
  /// Accounting</code>, <code>Accounting</code> is the value.
  final String conditionValue;

  Condition({
    required this.conditionKey,
    required this.conditionType,
    required this.conditionValue,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      conditionKey: (json['ConditionKey'] as String?) ?? '',
      conditionType:
          ConditionType.fromString((json['ConditionType'] as String?) ?? ''),
      conditionValue: (json['ConditionValue'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final conditionKey = this.conditionKey;
    final conditionType = this.conditionType;
    final conditionValue = this.conditionValue;
    return {
      'ConditionKey': conditionKey,
      'ConditionType': conditionType.value,
      'ConditionValue': conditionValue,
    };
  }
}

class ConditionType {
  static const stringequals = ConditionType._('STRINGEQUALS');

  final String value;

  const ConditionType._(this.value);

  static const values = [stringequals];

  static ConditionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConditionType._(value));

  @override
  bool operator ==(other) => other is ConditionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains an optional backup plan display name and an array of
/// <code>BackupRule</code> objects, each of which specifies a backup rule. Each
/// rule in a backup plan is a separate scheduled task and can back up a
/// different selection of Amazon Web Services resources.
class BackupPlan {
  /// The display name of a backup plan. Must contain only alphanumeric or '-_.'
  /// special characters.
  ///
  /// If this is set in the console, it can contain 1 to 50 characters; if this is
  /// set through CLI or API, it can contain 1 to 200 characters.
  final String backupPlanName;

  /// An array of <code>BackupRule</code> objects, each of which specifies a
  /// scheduled task that is used to back up a selection of resources.
  final List<BackupRule> rules;

  /// Contains a list of <code>BackupOptions</code> for each resource type.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  /// Contains your scanning configuration for the backup plan and includes the
  /// Malware scanner, your selected resources, and scanner role.
  final List<ScanSetting>? scanSettings;

  BackupPlan({
    required this.backupPlanName,
    required this.rules,
    this.advancedBackupSettings,
    this.scanSettings,
  });

  factory BackupPlan.fromJson(Map<String, dynamic> json) {
    return BackupPlan(
      backupPlanName: (json['BackupPlanName'] as String?) ?? '',
      rules: ((json['Rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => BackupRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.nonNulls
          .map((e) => AdvancedBackupSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
      scanSettings: (json['ScanSettings'] as List?)
          ?.nonNulls
          .map((e) => ScanSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanName = this.backupPlanName;
    final rules = this.rules;
    final advancedBackupSettings = this.advancedBackupSettings;
    final scanSettings = this.scanSettings;
    return {
      'BackupPlanName': backupPlanName,
      'Rules': rules,
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
      if (scanSettings != null) 'ScanSettings': scanSettings,
    };
  }
}

/// Specifies a scheduled task used to back up a selection of resources.
class BackupRule {
  /// A display name for a backup rule. Must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created.
  final String targetBackupVaultName;

  /// A value in minutes after a backup job is successfully started before it must
  /// be completed or it will be canceled by Backup. This value is optional.
  final int? completionWindowMinutes;

  /// An array of <code>CopyAction</code> objects, which contains the details of
  /// the copy operation.
  final List<CopyAction>? copyActions;

  /// Specifies whether Backup creates continuous backups. True causes Backup to
  /// create continuous backups capable of point-in-time restore (PITR). False (or
  /// not specified) causes Backup to create snapshot backups.
  final bool? enableContinuousBackup;

  /// IndexActions is an array you use to specify how backup data should be
  /// indexed.
  ///
  /// eEach BackupRule can have 0 or 1 IndexAction, as each backup can have up to
  /// one index associated with it.
  ///
  /// Within the array is ResourceType. Only one will be accepted for each
  /// BackupRule.
  final List<IndexAction>? indexActions;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  ///
  /// Resource types that can transition to cold storage are listed in the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/backup-feature-availability.html#features-by-resource">Feature
  /// availability by resource</a> table. Backup ignores this expression for other
  /// resource types.
  final Lifecycle? lifecycle;

  /// The tags that are assigned to resources that are associated with this rule
  /// when restored from backup.
  final Map<String, String>? recoveryPointTags;

  /// Uniquely identifies a rule that is used to schedule the backup of a
  /// selection of resources.
  final String? ruleId;

  /// Contains your scanning configuration for the backup rule and includes the
  /// malware scanner, and scan mode of either full or incremental.
  final List<ScanAction>? scanActions;

  /// A cron expression in UTC specifying when Backup initiates a backup job. When
  /// no CRON expression is provided, Backup will use the default expression
  /// <code>cron(0 5 ? * * *)</code>.
  ///
  /// For more information about Amazon Web Services cron expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html">Schedule
  /// Expressions for Rules</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  ///
  /// Two examples of Amazon Web Services cron expressions are <code> 15 * ? * *
  /// *</code> (take a backup every hour at 15 minutes past the hour) and <code>0
  /// 12 * * ? *</code> (take a backup every day at 12 noon UTC).
  ///
  /// For a table of examples, click the preceding link and scroll down the page.
  final String? scheduleExpression;

  /// The timezone in which the schedule expression is set. By default,
  /// ScheduleExpressions are in UTC. You can modify this to a specified timezone.
  final String? scheduleExpressionTimezone;

  /// A value in minutes after a backup is scheduled before a job will be canceled
  /// if it doesn't start successfully. This value is optional. If this value is
  /// included, it must be at least 60 minutes to avoid errors.
  ///
  /// During the start window, the backup job status remains in
  /// <code>CREATED</code> status until it has successfully begun or until the
  /// start window time has run out. If within the start window time Backup
  /// receives an error that allows the job to be retried, Backup will
  /// automatically retry to begin the job at least every 10 minutes until the
  /// backup successfully begins (the job status changes to <code>RUNNING</code>)
  /// or until the job status changes to <code>EXPIRED</code> (which is expected
  /// to occur when the start window time is over).
  final int? startWindowMinutes;

  /// The ARN of a logically air-gapped vault. ARN must be in the same account and
  /// Region. If provided, supported fully managed resources back up directly to
  /// logically air-gapped vault, while other supported resources create a
  /// temporary (billable) snapshot in backup vault, then copy it to logically
  /// air-gapped vault. Unsupported resources only back up to the specified backup
  /// vault.
  final String? targetLogicallyAirGappedBackupVaultArn;

  BackupRule({
    required this.ruleName,
    required this.targetBackupVaultName,
    this.completionWindowMinutes,
    this.copyActions,
    this.enableContinuousBackup,
    this.indexActions,
    this.lifecycle,
    this.recoveryPointTags,
    this.ruleId,
    this.scanActions,
    this.scheduleExpression,
    this.scheduleExpressionTimezone,
    this.startWindowMinutes,
    this.targetLogicallyAirGappedBackupVaultArn,
  });

  factory BackupRule.fromJson(Map<String, dynamic> json) {
    return BackupRule(
      ruleName: (json['RuleName'] as String?) ?? '',
      targetBackupVaultName: (json['TargetBackupVaultName'] as String?) ?? '',
      completionWindowMinutes: json['CompletionWindowMinutes'] as int?,
      copyActions: (json['CopyActions'] as List?)
          ?.nonNulls
          .map((e) => CopyAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableContinuousBackup: json['EnableContinuousBackup'] as bool?,
      indexActions: (json['IndexActions'] as List?)
          ?.nonNulls
          .map((e) => IndexAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      recoveryPointTags: (json['RecoveryPointTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      ruleId: json['RuleId'] as String?,
      scanActions: (json['ScanActions'] as List?)
          ?.nonNulls
          .map((e) => ScanAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduleExpression: json['ScheduleExpression'] as String?,
      scheduleExpressionTimezone: json['ScheduleExpressionTimezone'] as String?,
      startWindowMinutes: json['StartWindowMinutes'] as int?,
      targetLogicallyAirGappedBackupVaultArn:
          json['TargetLogicallyAirGappedBackupVaultArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleName = this.ruleName;
    final targetBackupVaultName = this.targetBackupVaultName;
    final completionWindowMinutes = this.completionWindowMinutes;
    final copyActions = this.copyActions;
    final enableContinuousBackup = this.enableContinuousBackup;
    final indexActions = this.indexActions;
    final lifecycle = this.lifecycle;
    final recoveryPointTags = this.recoveryPointTags;
    final ruleId = this.ruleId;
    final scanActions = this.scanActions;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowMinutes = this.startWindowMinutes;
    final targetLogicallyAirGappedBackupVaultArn =
        this.targetLogicallyAirGappedBackupVaultArn;
    return {
      'RuleName': ruleName,
      'TargetBackupVaultName': targetBackupVaultName,
      if (completionWindowMinutes != null)
        'CompletionWindowMinutes': completionWindowMinutes,
      if (copyActions != null) 'CopyActions': copyActions,
      if (enableContinuousBackup != null)
        'EnableContinuousBackup': enableContinuousBackup,
      if (indexActions != null) 'IndexActions': indexActions,
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (recoveryPointTags != null) 'RecoveryPointTags': recoveryPointTags,
      if (ruleId != null) 'RuleId': ruleId,
      if (scanActions != null) 'ScanActions': scanActions,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowMinutes != null) 'StartWindowMinutes': startWindowMinutes,
      if (targetLogicallyAirGappedBackupVaultArn != null)
        'TargetLogicallyAirGappedBackupVaultArn':
            targetLogicallyAirGappedBackupVaultArn,
    };
  }
}

/// Contains information about a scheduled backup plan execution, including the
/// execution time, rule type, and associated rule identifier.
class ScheduledPlanExecutionMember {
  /// The timestamp when the backup is scheduled to run, in Unix format and
  /// Coordinated Universal Time (UTC). The value is accurate to milliseconds.
  final DateTime? executionTime;

  /// The type of backup rule execution. Valid values are <code>CONTINUOUS</code>
  /// (point-in-time recovery), <code>SNAPSHOTS</code> (snapshot backups), or
  /// <code>CONTINUOUS_AND_SNAPSHOTS</code> (both types combined).
  final RuleExecutionType? ruleExecutionType;

  /// The unique identifier of the backup rule that will execute at the scheduled
  /// time.
  final String? ruleId;

  ScheduledPlanExecutionMember({
    this.executionTime,
    this.ruleExecutionType,
    this.ruleId,
  });

  factory ScheduledPlanExecutionMember.fromJson(Map<String, dynamic> json) {
    return ScheduledPlanExecutionMember(
      executionTime: timeStampFromJson(json['ExecutionTime']),
      ruleExecutionType: (json['RuleExecutionType'] as String?)
          ?.let(RuleExecutionType.fromString),
      ruleId: json['RuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionTime = this.executionTime;
    final ruleExecutionType = this.ruleExecutionType;
    final ruleId = this.ruleId;
    return {
      if (executionTime != null)
        'ExecutionTime': unixTimestampToJson(executionTime),
      if (ruleExecutionType != null)
        'RuleExecutionType': ruleExecutionType.value,
      if (ruleId != null) 'RuleId': ruleId,
    };
  }
}

class RuleExecutionType {
  static const continuous = RuleExecutionType._('CONTINUOUS');
  static const snapshots = RuleExecutionType._('SNAPSHOTS');
  static const continuousAndSnapshots =
      RuleExecutionType._('CONTINUOUS_AND_SNAPSHOTS');

  final String value;

  const RuleExecutionType._(this.value);

  static const values = [continuous, snapshots, continuousAndSnapshots];

  static RuleExecutionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleExecutionType._(value));

  @override
  bool operator ==(other) => other is RuleExecutionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StorageClass {
  static const warm = StorageClass._('WARM');
  static const cold = StorageClass._('COLD');
  static const deleted = StorageClass._('DELETED');

  final String value;

  const StorageClass._(this.value);

  static const values = [warm, cold, deleted];

  static StorageClass fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StorageClass._(value));

  @override
  bool operator ==(other) => other is StorageClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the results of a security scan, including scanner information, scan
/// state, and any findings discovered.
class ScanResult {
  /// An array of findings discovered during the scan.
  final List<ScanFinding>? findings;

  /// The timestamp of when the last scan was performed, in Unix format and
  /// Coordinated Universal Time (UTC).
  final DateTime? lastScanTimestamp;

  /// The malware scanner used to perform the scan. Currently only
  /// <code>GUARDDUTY</code> is supported.
  final MalwareScanner? malwareScanner;

  /// The final state of the scan job.
  ///
  /// Valid values: <code>COMPLETED</code> | <code>FAILED</code> |
  /// <code>CANCELED</code>.
  final ScanJobState? scanJobState;

  ScanResult({
    this.findings,
    this.lastScanTimestamp,
    this.malwareScanner,
    this.scanJobState,
  });

  factory ScanResult.fromJson(Map<String, dynamic> json) {
    return ScanResult(
      findings: (json['Findings'] as List?)
          ?.nonNulls
          .map((e) => ScanFinding.fromString((e as String)))
          .toList(),
      lastScanTimestamp: timeStampFromJson(json['LastScanTimestamp']),
      malwareScanner:
          (json['MalwareScanner'] as String?)?.let(MalwareScanner.fromString),
      scanJobState:
          (json['ScanJobState'] as String?)?.let(ScanJobState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final lastScanTimestamp = this.lastScanTimestamp;
    final malwareScanner = this.malwareScanner;
    final scanJobState = this.scanJobState;
    return {
      if (findings != null) 'Findings': findings.map((e) => e.value).toList(),
      if (lastScanTimestamp != null)
        'LastScanTimestamp': unixTimestampToJson(lastScanTimestamp),
      if (malwareScanner != null) 'MalwareScanner': malwareScanner.value,
      if (scanJobState != null) 'ScanJobState': scanJobState.value,
    };
  }
}

class ScanJobState {
  static const completed = ScanJobState._('COMPLETED');
  static const completedWithIssues = ScanJobState._('COMPLETED_WITH_ISSUES');
  static const failed = ScanJobState._('FAILED');
  static const canceled = ScanJobState._('CANCELED');

  final String value;

  const ScanJobState._(this.value);

  static const values = [completed, completedWithIssues, failed, canceled];

  static ScanJobState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanJobState._(value));

  @override
  bool operator ==(other) => other is ScanJobState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the latest update to an MPA approval team
/// association.
class LatestMpaApprovalTeamUpdate {
  /// The date and time when the MPA approval team update will expire.
  final DateTime? expiryDate;

  /// The date and time when the MPA approval team update was initiated.
  final DateTime? initiationDate;

  /// The ARN of the MPA session associated with this update.
  final String? mpaSessionArn;

  /// The current status of the MPA approval team update.
  final MpaSessionStatus? status;

  /// A message describing the current status of the MPA approval team update.
  final String? statusMessage;

  LatestMpaApprovalTeamUpdate({
    this.expiryDate,
    this.initiationDate,
    this.mpaSessionArn,
    this.status,
    this.statusMessage,
  });

  factory LatestMpaApprovalTeamUpdate.fromJson(Map<String, dynamic> json) {
    return LatestMpaApprovalTeamUpdate(
      expiryDate: timeStampFromJson(json['ExpiryDate']),
      initiationDate: timeStampFromJson(json['InitiationDate']),
      mpaSessionArn: json['MpaSessionArn'] as String?,
      status: (json['Status'] as String?)?.let(MpaSessionStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expiryDate = this.expiryDate;
    final initiationDate = this.initiationDate;
    final mpaSessionArn = this.mpaSessionArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (expiryDate != null) 'ExpiryDate': unixTimestampToJson(expiryDate),
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (mpaSessionArn != null) 'MpaSessionArn': mpaSessionArn,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class MpaSessionStatus {
  static const pending = MpaSessionStatus._('PENDING');
  static const approved = MpaSessionStatus._('APPROVED');
  static const failed = MpaSessionStatus._('FAILED');

  final String value;

  const MpaSessionStatus._(this.value);

  static const values = [pending, approved, failed];

  static MpaSessionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MpaSessionStatus._(value));

  @override
  bool operator ==(other) => other is MpaSessionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This contains metadata about a tiering configuration for create operations.
class TieringConfigurationInputForCreate {
  /// The name of the backup vault where the tiering configuration applies. Use
  /// <code>*</code> to apply to all backup vaults.
  final String backupVaultName;

  /// An array of resource selection objects that specify which resources are
  /// included in the tiering configuration and their tiering settings.
  final List<ResourceSelection> resourceSelection;

  /// The unique name of the tiering configuration. This cannot be changed after
  /// creation, and it must consist of only alphanumeric characters and
  /// underscores.
  final String tieringConfigurationName;

  TieringConfigurationInputForCreate({
    required this.backupVaultName,
    required this.resourceSelection,
    required this.tieringConfigurationName,
  });

  Map<String, dynamic> toJson() {
    final backupVaultName = this.backupVaultName;
    final resourceSelection = this.resourceSelection;
    final tieringConfigurationName = this.tieringConfigurationName;
    return {
      'BackupVaultName': backupVaultName,
      'ResourceSelection': resourceSelection,
      'TieringConfigurationName': tieringConfigurationName,
    };
  }
}

/// This contains metadata about a specific restore testing selection.
///
/// ProtectedResourceType is required, such as Amazon EBS or Amazon EC2.
///
/// This consists of <code>RestoreTestingSelectionName</code>,
/// <code>ProtectedResourceType</code>, and one of the following:
///
/// <ul>
/// <li>
/// <code>ProtectedResourceArns</code>
/// </li>
/// <li>
/// <code>ProtectedResourceConditions</code>
/// </li>
/// </ul>
/// Each protected resource type can have one single value.
///
/// A restore testing selection can include a wildcard value ("*") for
/// <code>ProtectedResourceArns</code> along with
/// <code>ProtectedResourceConditions</code>. Alternatively, you can include up
/// to 30 specific protected resource ARNs in
/// <code>ProtectedResourceArns</code>.
///
/// <code>ProtectedResourceConditions</code> examples include as
/// <code>StringEquals</code> and <code>StringNotEquals</code>.
class RestoreTestingSelectionForCreate {
  /// The Amazon Resource Name (ARN) of the IAM role that Backup uses to create
  /// the target resource; for example:
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The type of Amazon Web Services resource included in a restore testing
  /// selection; for example, an Amazon EBS volume or an Amazon RDS database.
  ///
  /// Supported resource types accepted include:
  ///
  /// <ul>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>DynamoDB</code> for Amazon DynamoDB
  /// </li>
  /// <li>
  /// <code>EBS</code> for Amazon Elastic Block Store
  /// </li>
  /// <li>
  /// <code>EC2</code> for Amazon Elastic Compute Cloud
  /// </li>
  /// <li>
  /// <code>EFS</code> for Amazon Elastic File System
  /// </li>
  /// <li>
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon S3
  /// </li>
  /// </ul>
  final String protectedResourceType;

  /// The unique name of the restore testing selection that belongs to the related
  /// restore testing plan.
  ///
  /// The name consists of only alphanumeric characters and underscores. Maximum
  /// length is 50.
  final String restoreTestingSelectionName;

  /// Each protected resource can be filtered by its specific ARNs, such as
  /// <code>ProtectedResourceArns: ["arn:aws:...", "arn:aws:..."]</code> or by a
  /// wildcard: <code>ProtectedResourceArns: ["*"]</code>, but not both.
  final List<String>? protectedResourceArns;

  /// If you have included the wildcard in ProtectedResourceArns, you can include
  /// resource conditions, such as <code>ProtectedResourceConditions: {
  /// StringEquals: [{ key: "XXXX", value: "YYYY" }]</code>.
  final ProtectedResourceConditions? protectedResourceConditions;

  /// You can override certain restore metadata keys by including the parameter
  /// <code>RestoreMetadataOverrides</code> in the body of
  /// <code>RestoreTestingSelection</code>. Key values are not case sensitive.
  ///
  /// See the complete list of <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/restore-testing-inferred-metadata.html">restore
  /// testing inferred metadata</a>.
  final Map<String, String>? restoreMetadataOverrides;

  /// This is amount of hours (0 to 168) available to run a validation script on
  /// the data. The data will be deleted upon the completion of the validation
  /// script or the end of the specified retention period, whichever comes first.
  final int? validationWindowHours;

  RestoreTestingSelectionForCreate({
    required this.iamRoleArn,
    required this.protectedResourceType,
    required this.restoreTestingSelectionName,
    this.protectedResourceArns,
    this.protectedResourceConditions,
    this.restoreMetadataOverrides,
    this.validationWindowHours,
  });

  Map<String, dynamic> toJson() {
    final iamRoleArn = this.iamRoleArn;
    final protectedResourceType = this.protectedResourceType;
    final restoreTestingSelectionName = this.restoreTestingSelectionName;
    final protectedResourceArns = this.protectedResourceArns;
    final protectedResourceConditions = this.protectedResourceConditions;
    final restoreMetadataOverrides = this.restoreMetadataOverrides;
    final validationWindowHours = this.validationWindowHours;
    return {
      'IamRoleArn': iamRoleArn,
      'ProtectedResourceType': protectedResourceType,
      'RestoreTestingSelectionName': restoreTestingSelectionName,
      if (protectedResourceArns != null)
        'ProtectedResourceArns': protectedResourceArns,
      if (protectedResourceConditions != null)
        'ProtectedResourceConditions': protectedResourceConditions,
      if (restoreMetadataOverrides != null)
        'RestoreMetadataOverrides': restoreMetadataOverrides,
      if (validationWindowHours != null)
        'ValidationWindowHours': validationWindowHours,
    };
  }
}

/// This contains metadata about a restore testing plan.
class RestoreTestingPlanForCreate {
  /// <code>RecoveryPointSelection</code> has five parameters (three required and
  /// two optional). The values you specify determine which recovery point is
  /// included in the restore test. You must indicate with <code>Algorithm</code>
  /// if you want the latest recovery point within your
  /// <code>SelectionWindowDays</code> or if you want a random recovery point, and
  /// you must indicate through <code>IncludeVaults</code> from which vaults the
  /// recovery points can be chosen.
  ///
  /// <code>Algorithm</code> (<i>required</i>) Valid values:
  /// "<code>LATEST_WITHIN_WINDOW</code>" or "<code>RANDOM_WITHIN_WINDOW</code>".
  ///
  /// <code>Recovery point types</code> (<i>required</i>) Valid values:
  /// "<code>SNAPSHOT</code>" and/or "<code>CONTINUOUS</code>". Include
  /// <code>SNAPSHOT</code> to restore only snapshot recovery points; include
  /// <code>CONTINUOUS</code> to restore continuous recovery points (point in time
  /// restore / PITR); use both to restore either a snapshot or a continuous
  /// recovery point. The recovery point will be determined by the value for
  /// <code>Algorithm</code>.
  ///
  /// <code>IncludeVaults</code> (<i>required</i>). You must include one or more
  /// backup vaults. Use the wildcard ["*"] or specific ARNs.
  ///
  /// <code>SelectionWindowDays</code> (<i>optional</i>) Value must be an integer
  /// (in days) from 1 to 365. If not included, the value defaults to
  /// <code>30</code>.
  ///
  /// <code>ExcludeVaults</code> (<i>optional</i>). You can choose to input one or
  /// more specific backup vault ARNs to exclude those vaults' contents from
  /// restore eligibility. Or, you can include a list of selectors. If this
  /// parameter and its value are not included, it defaults to empty list.
  final RestoreTestingRecoveryPointSelection recoveryPointSelection;

  /// The RestoreTestingPlanName is a unique string that is the name of the
  /// restore testing plan. This cannot be changed after creation, and it must
  /// consist of only alphanumeric characters and underscores.
  final String restoreTestingPlanName;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed. When no CRON expression is provided, Backup will use the default
  /// expression <code>cron(0 5 ? * * *)</code>.
  final String scheduleExpression;

  /// Optional. This is the timezone in which the schedule expression is set. By
  /// default, ScheduleExpressions are in UTC. You can modify this to a specified
  /// timezone.
  final String? scheduleExpressionTimezone;

  /// Defaults to 24 hours.
  ///
  /// A value in hours after a restore test is scheduled before a job will be
  /// canceled if it doesn't start successfully. This value is optional. If this
  /// value is included, this parameter has a maximum value of 168 hours (one
  /// week).
  final int? startWindowHours;

  RestoreTestingPlanForCreate({
    required this.recoveryPointSelection,
    required this.restoreTestingPlanName,
    required this.scheduleExpression,
    this.scheduleExpressionTimezone,
    this.startWindowHours,
  });

  Map<String, dynamic> toJson() {
    final recoveryPointSelection = this.recoveryPointSelection;
    final restoreTestingPlanName = this.restoreTestingPlanName;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowHours = this.startWindowHours;
    return {
      'RecoveryPointSelection': recoveryPointSelection,
      'RestoreTestingPlanName': restoreTestingPlanName,
      'ScheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowHours != null) 'StartWindowHours': startWindowHours,
    };
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class DependencyFailureException extends _s.GenericAwsException {
  DependencyFailureException({String? type, String? message})
      : super(type: type, code: 'DependencyFailureException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidResourceStateException extends _s.GenericAwsException {
  InvalidResourceStateException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidResourceStateException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MissingParameterValueException extends _s.GenericAwsException {
  MissingParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingParameterValueException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'DependencyFailureException': (type, message) =>
      DependencyFailureException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidResourceStateException': (type, message) =>
      InvalidResourceStateException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MissingParameterValueException': (type, message) =>
      MissingParameterValueException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
};
