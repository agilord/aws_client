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

  /// This action removes the specified legal hold on a recovery point. This
  /// action can only be performed by a user with sufficient permissions.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidResourceStateException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [cancelDescription] :
  /// String describing the reason for removing the legal hold.
  ///
  /// Parameter [legalHoldId] :
  /// Legal hold ID required to remove the specified legal hold on a recovery
  /// point.
  ///
  /// Parameter [retainRecordInDays] :
  /// The integer amount in days specifying amount of days after this API
  /// operation to remove legal hold.
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
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlan] :
  /// Specifies the body of a backup plan. Includes a
  /// <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.
  ///
  /// Parameter [backupPlanTags] :
  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair. The specified
  /// tags are assigned to all backups created with this plan.
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
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/backup/plans/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBackupPlanOutput.fromJson(response);
  }

  /// Creates a JSON document that specifies a set of resources to assign to a
  /// backup plan. For examples, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/assigning-resources.html#assigning-resources-json">Assigning
  /// resources programmatically</a>.
  ///
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies the backup plan to be associated with the selection of
  /// resources.
  ///
  /// Parameter [backupSelection] :
  /// Specifies the body of a request to assign a set of resources to a backup
  /// plan.
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
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/selections/',
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
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [backupVaultTags] :
  /// Metadata that you can assign to help organize the resources that you
  /// create. Each tag is a key-value pair.
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
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
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
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [frameworkControls] :
  /// A list of the controls that make up the framework. Each control in the
  /// list has a name, input parameters, and scope.
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
  /// Metadata that you can assign to help organize the frameworks that you
  /// create. Each tag is a key-value pair.
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

  /// This action creates a legal hold on a recovery point (backup). A legal
  /// hold is a restraint on altering or deleting a backup until an authorized
  /// user cancels the legal hold. Any actions to delete or disassociate a
  /// recovery point will fail with an error if one or more active legal holds
  /// are on the recovery point.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [description] :
  /// This is the string description of the legal hold.
  ///
  /// Parameter [title] :
  /// This is the string title of the legal hold.
  ///
  /// Parameter [idempotencyToken] :
  /// This is a user-chosen string used to distinguish between otherwise
  /// identical calls. Retrying a successful request with the same idempotency
  /// token results in a success message with no action taken.
  ///
  /// Parameter [recoveryPointSelection] :
  /// This specifies criteria to assign a set of resources, such as resource
  /// types or backup vaults.
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
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      if (recoveryPointSelection != null)
        'RecoveryPointSelection': recoveryPointSelection,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/legal-holds/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLegalHoldOutput.fromJson(response);
  }

  /// This request creates a logical container to where backups may be copied.
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
  /// May throw [LimitExceededException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupVaultName] :
  /// This is the name of the vault that is being created.
  ///
  /// Parameter [maxRetentionDays] :
  /// This is the setting that specifies the maximum retention period that the
  /// vault retains its recovery points. If this parameter is not specified,
  /// Backup does not enforce a maximum retention period on the recovery points
  /// in the vault (allowing indefinite storage).
  ///
  /// If specified, any backup or copy job to the vault must have a lifecycle
  /// policy with a retention period equal to or shorter than the maximum
  /// retention period. If the job retention period is longer than that maximum
  /// retention period, then the vault fails the backup or copy job, and you
  /// should either modify your lifecycle settings or use a different vault.
  ///
  /// Parameter [minRetentionDays] :
  /// This setting specifies the minimum retention period that the vault retains
  /// its recovery points. If this parameter is not specified, no minimum
  /// retention period is enforced.
  ///
  /// If specified, any backup or copy job to the vault must have a lifecycle
  /// policy with a retention period equal to or longer than the minimum
  /// retention period. If a job retention period is shorter than that minimum
  /// retention period, then the vault fails the backup or copy job, and you
  /// should either modify your lifecycle settings or use a different vault.
  ///
  /// Parameter [backupVaultTags] :
  /// These are the tags that will be included in the newly-created vault.
  ///
  /// Parameter [creatorRequestId] :
  /// This is the ID of the creation request.
  ///
  /// This parameter is optional. If used, this parameter must contain 1 to 50
  /// alphanumeric or '-_.' characters.
  Future<CreateLogicallyAirGappedBackupVaultOutput>
      createLogicallyAirGappedBackupVault({
    required String backupVaultName,
    required int maxRetentionDays,
    required int minRetentionDays,
    Map<String, String>? backupVaultTags,
    String? creatorRequestId,
  }) async {
    final $payload = <String, dynamic>{
      'MaxRetentionDays': maxRetentionDays,
      'MinRetentionDays': minRetentionDays,
      if (backupVaultTags != null) 'BackupVaultTags': backupVaultTags,
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
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
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
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
  /// BACKUP_JOB_REPORT | COPY_JOB_REPORT | RESTORE_JOB_REPORT</code>
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
  /// Metadata that you can assign to help organize the report plans that you
  /// create. Each tag is a key-value pair.
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

  /// This is the first of two steps to create a restore testing plan; once this
  /// request is successful, finish the procedure with request
  /// CreateRestoreTestingSelection.
  ///
  /// You must include the parameter RestoreTestingPlan. You may optionally
  /// include CreatorRequestId and Tags.
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
  /// Optional tags to include. A tag is a key-value pair you can use to manage,
  /// filter, and search for your resources. Allowed characters include UTF-8
  /// letters,numbers, spaces, and the following characters: + - = . _ : /.
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

  /// Deletes a backup plan. A backup plan can only be deleted after all
  /// associated selections of resources have been deleted. Deleting a backup
  /// plan deletes the current version of a backup plan. Previous versions, if
  /// any, will still exist.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidRequestException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
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
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidResourceStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
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

  /// Returns backup job details for the specified <code>BackupJobId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DependencyFailureException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [backupVaultAccountId] :
  /// This is the account ID of the specified backup vault.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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

  /// Describes whether the Amazon Web Services account is opted in to
  /// cross-account backup. Returns an error if the account is not a member of
  /// an Organizations organization. Example: <code>describe-global-settings
  /// --region us-west-2</code>
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
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [backupVaultAccountId] :
  /// This is the account ID of the specified backup vault.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [DependencyFailureException].
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

  /// Deletes the specified continuous backup recovery point from Backup and
  /// releases control of that continuous backup to the source service, such as
  /// Amazon RDS. The source service will continue to create and retain
  /// continuous backups using the lifecycle that you specified in your original
  /// backup plan.
  ///
  /// Does not support snapshot backup recovery points.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidResourceStateException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [backupVaultName] :
  /// This is the name of a logical container where the child (nested) recovery
  /// point is stored. Backup vaults are identified by names that are unique to
  /// the account used to create them and the Amazon Web Services Region where
  /// they are created. They consist of lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// This is the Amazon Resource Name (ARN) that uniquely identifies the child
  /// (nested) recovery point; for example,
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
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
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/toTemplate/',
      exceptionFnMap: _exceptionFns,
    );
    return ExportBackupPlanTemplateOutput.fromJson(response);
  }

  /// Returns <code>BackupPlan</code> details for the specified
  /// <code>BackupPlanId</code>. The details are the body of a backup plan in
  /// JSON format, in addition to plan metadata.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
  ///
  /// Parameter [versionId] :
  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at
  /// most 1,024 bytes long. Version IDs cannot be edited.
  Future<GetBackupPlanOutput> getBackupPlan({
    required String backupPlanId,
    String? versionId,
  }) async {
    final $query = <String, List<String>>{
      if (versionId != null) 'versionId': [versionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup/plans/${Uri.encodeComponent(backupPlanId)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupPlanOutput.fromJson(response);
  }

  /// Returns a valid JSON document specifying a backup plan or an error.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [legalHoldId] :
  /// This is the ID required to use <code>GetLegalHold</code>. This unique ID
  /// is associated with a specific legal hold.
  Future<GetLegalHoldOutput> getLegalHold({
    required String legalHoldId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/legal-holds/${Uri.encodeComponent(legalHoldId)}/',
      exceptionFnMap: _exceptionFns,
    );
    return GetLegalHoldOutput.fromJson(response);
  }

  /// Returns a set of metadata key-value pairs that were used to create the
  /// backup.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [backupVaultAccountId] :
  /// This is the account ID of the specified backup vault.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
  /// This is the account ID of the specified backup vault.
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
  /// This is the period that sets the boundaries for returned results.
  ///
  /// Acceptable values include
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> for daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> for the aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> for aggregated job count for prior 14 days.
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
  /// /audit/backup-job-summaries?AggregationPeriod=FOURTEEN_DAYS&amp;State=COMPLETED
  ///
  /// GET
  /// /audit/backup-job-summaries?AggregationPeriod=FOURTEEN_DAYS&amp;MessageCategory=SUCCESS&amp;State=COMPLETED
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
        'AggregationPeriod': [aggregationPeriod.toValue()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (messageCategory != null) 'MessageCategory': [messageCategory],
      if (nextToken != null) 'NextToken': [nextToken],
      if (resourceType != null) 'ResourceType': [resourceType],
      if (state != null) 'State': [state.toValue()],
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
  /// are created. They consist of lowercase letters, numbers, and hyphens.
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
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon S3
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for virtual machines
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
  /// GET /backup-jobs/?messageCategory=SUCCESS&amp;state=COMPLETED
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
      if (byState != null) 'state': [byState.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-jobs/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupJobsOutput.fromJson(response);
  }

  /// Returns metadata of your saved backup plan templates, including the
  /// template ID, name, and the creation and deletion dates.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
      requestUri:
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/versions/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlanVersionsOutput.fromJson(response);
  }

  /// Returns a list of all active backup plans for an authenticated account.
  /// The list contains information such as Amazon Resource Names (ARNs), plan
  /// IDs, creation and deletion dates, version IDs, plan names, and creator
  /// request IDs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
      requestUri: '/backup/plans/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupPlansOutput.fromJson(response);
  }

  /// Returns an array containing metadata of the resources associated with the
  /// target backup plan.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
          '/backup/plans/${Uri.encodeComponent(backupPlanId)}/selections/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupSelectionsOutput.fromJson(response);
  }

  /// Returns a list of recovery point storage containers along with information
  /// about them.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
      if (byVaultType != null) 'vaultType': [byVaultType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-vaults/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBackupVaultsOutput.fromJson(response);
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
  /// This is the period that sets the boundaries for returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> for daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> for the aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> for aggregated job count for prior 14 days.
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
        'AggregationPeriod': [aggregationPeriod.toValue()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (messageCategory != null) 'MessageCategory': [messageCategory],
      if (nextToken != null) 'NextToken': [nextToken],
      if (resourceType != null) 'ResourceType': [resourceType],
      if (state != null) 'State': [state.toValue()],
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
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
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
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon S3
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for virtual machines
  /// </li>
  /// </ul>
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
      if (byState != null) 'state': [byState.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/copy-jobs/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCopyJobsOutput.fromJson(response);
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
      requestUri: '/legal-holds/',
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
      requestUri: '/resources/',
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
  /// This is the list of protected resources by backup vault within the
  /// vault(s) you specify by name.
  ///
  /// Parameter [backupVaultAccountId] :
  /// This is the list of protected resources by backup vault within the
  /// vault(s) you specify by account ID.
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
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/resources/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProtectedResourcesByBackupVaultOutput.fromJson(response);
  }

  /// Returns detailed information about the recovery points stored in a backup
  /// vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon S3
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for virtual machines
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
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/',
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
  /// This is the ID of the legal hold.
  ///
  /// Parameter [maxResults] :
  /// This is the maximum number of resource list items to be returned.
  ///
  /// Parameter [nextToken] :
  /// This is the next item following a partial list of returned resources. For
  /// example, if a request is made to return <code>MaxResults</code> number of
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

  /// Returns detailed information about all the recovery points of the type
  /// specified by a resource Amazon Resource Name (ARN).
  /// <note>
  /// For Amazon EFS and Amazon EC2, this action only lists recovery points
  /// created by Backup.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
          '/resources/${Uri.encodeComponent(resourceArn)}/recovery-points/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryPointsByResourceOutput.fromJson(response);
  }

  /// Returns details about your report jobs.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
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
  /// <code>CREATED | RUNNING | COMPLETED | FAILED</code>
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
  /// This is the period that sets the boundaries for returned results.
  ///
  /// Acceptable values include
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> for daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> for the aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> for aggregated job count for prior 14 days.
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
        'AggregationPeriod': [aggregationPeriod.toValue()],
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (resourceType != null) 'ResourceType': [resourceType],
      if (state != null) 'State': [state.toValue()],
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

  /// Returns a list of jobs that Backup initiated to restore a saved resource,
  /// including details about the recovery process.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
  /// <code>FSx</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// <li>
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>SAP HANA on Amazon EC2</code> for SAP HANA databases
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon S3
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for virtual machines
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
      if (byResourceType != null) 'resourceType': [byResourceType],
      if (byRestoreTestingPlanArn != null)
        'restoreTestingPlanArn': [byRestoreTestingPlanArn],
      if (byStatus != null) 'status': [byStatus.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-jobs/',
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
      if (byStatus != null) 'status': [byStatus.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/resources/${Uri.encodeComponent(resourceArn)}/restore-jobs/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRestoreJobsByProtectedResourceOutput.fromJson(response);
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

  /// Returns a list of key-value pairs assigned to a target recovery point,
  /// backup plan, or backup vault.
  ///
  /// <code>ListTags</code> only works for resource types that support full
  /// Backup management of their backups. Those resource types are listed in the
  /// "Full Backup management" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
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
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsOutput.fromJson(response);
  }

  /// Sets a resource-based policy that is used to manage access permissions on
  /// the target backup vault. Requires a backup vault name and an access policy
  /// document in JSON format.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// regulations, see the <a href="samples/cohassetreport.zip">Cohasset
  /// Associates Compliance Assessment.</a>
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidRequestException].
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
  /// If this parameter is not specified, Vault Lock will not enforce a minimum
  /// retention period.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultEvents] :
  /// An array of events that indicate the status of jobs to back up resources
  /// to the backup vault.
  ///
  /// For common use cases and code samples, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/sns-notifications.html">Using
  /// Amazon SNS to track Backup events</a>.
  ///
  /// The following events are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>BACKUP_JOB_STARTED</code> | <code>BACKUP_JOB_COMPLETED</code>
  /// </li>
  /// <li>
  /// <code>COPY_JOB_STARTED</code> | <code>COPY_JOB_SUCCESSFUL</code> |
  /// <code>COPY_JOB_FAILED</code>
  /// </li>
  /// <li>
  /// <code>RESTORE_JOB_STARTED</code> | <code>RESTORE_JOB_COMPLETED</code> |
  /// <code>RECOVERY_POINT_MODIFIED</code>
  /// </li>
  /// <li>
  /// <code>S3_BACKUP_OBJECT_FAILED</code> |
  /// <code>S3_RESTORE_OBJECT_FAILED</code>
  /// </li>
  /// </ul> <note>
  /// The list below shows items that are deprecated events (for reference) and
  /// are no longer in use. They are no longer supported and will not return
  /// statuses or notifications. Refer to the list above for current supported
  /// events.
  /// </note>
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
      'BackupVaultEvents': backupVaultEvents.map((e) => e.toValue()).toList(),
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
  /// This is the status of your restore validation.
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
      'ValidationStatus': validationStatus.toValue(),
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

  /// Starts an on-demand backup job for the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// Specifies the backup option for a selected resource. This option is only
  /// available for Windows Volume Shadow Copy Service (VSS) backup jobs.
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
  /// Resource types that are able to be transitioned to cold storage are listed
  /// in the "Lifecycle to cold storage" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table. Backup ignores this expression
  /// for other resource types.
  ///
  /// This parameter has a maximum value of 100 years (36,500 days).
  ///
  /// Parameter [recoveryPointTags] :
  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair.
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
    Lifecycle? lifecycle,
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
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
      if (lifecycle != null) 'Lifecycle': lifecycle,
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [destinationBackupVaultArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a destination
  /// backup vault to copy to; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
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
  /// They consist of lowercase letters, numbers, and hyphens.
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
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
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
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [metadata] :
  /// A set of metadata key-value pairs. Contains information, such as a
  /// resource name, required to restore a recovery point.
  ///
  /// You can get configuration metadata about a resource at the time it was
  /// backed up by calling <code>GetRecoveryPointRestoreMetadata</code>.
  /// However, values in addition to those provided by
  /// <code>GetRecoveryPointRestoreMetadata</code> might be required to restore
  /// a resource. For example, you might need to provide a new resource name if
  /// the original already exists.
  ///
  /// You need to specify specific metadata to restore an Amazon Elastic File
  /// System (Amazon EFS) instance:
  ///
  /// <ul>
  /// <li>
  /// <code>file-system-id</code>: The ID of the Amazon EFS file system that is
  /// backed up by Backup. Returned in
  /// <code>GetRecoveryPointRestoreMetadata</code>.
  /// </li>
  /// <li>
  /// <code>Encrypted</code>: A Boolean value that, if true, specifies that the
  /// file system is encrypted. If <code>KmsKeyId</code> is specified,
  /// <code>Encrypted</code> must be set to <code>true</code>.
  /// </li>
  /// <li>
  /// <code>KmsKeyId</code>: Specifies the Amazon Web Services KMS key that is
  /// used to encrypt the restored file system. You can specify a key from
  /// another Amazon Web Services account provided that key it is properly
  /// shared with your account via Amazon Web Services KMS.
  /// </li>
  /// <li>
  /// <code>PerformanceMode</code>: Specifies the throughput mode of the file
  /// system.
  /// </li>
  /// <li>
  /// <code>CreationToken</code>: A user-supplied value that ensures the
  /// uniqueness (idempotency) of the request.
  /// </li>
  /// <li>
  /// <code>newFileSystem</code>: A Boolean value that, if true, specifies that
  /// the recovery point is restored to a new Amazon EFS file system.
  /// </li>
  /// <li>
  /// <code>ItemsToRestore</code>: An array of one to five strings where each
  /// string is a file path. Use <code>ItemsToRestore</code> to restore specific
  /// files or directories rather than the entire file system. This parameter is
  /// optional. For example, <code>"itemsToRestore":"[\"/my.test\"]"</code>.
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
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>DocumentDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>CloudFormation</code> for CloudFormation
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
  /// <code>Redshift</code> for Amazon Redshift
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>S3</code> for Amazon S3
  /// </li>
  /// <li>
  /// <code>Timestream</code> for Amazon Timestream
  /// </li>
  /// <li>
  /// <code>VirtualMachine</code> for virtual machines
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
      if (idempotencyToken != null) 'IdempotencyToken': idempotencyToken,
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

  /// Attempts to cancel a job to create a one-time backup of a resource.
  ///
  /// This action is not supported for the following services: Amazon FSx for
  /// Windows File Server, Amazon FSx for Lustre, Amazon FSx for NetApp ONTAP ,
  /// Amazon FSx for OpenZFS, Amazon DocumentDB (with MongoDB compatibility),
  /// Amazon RDS, Amazon Aurora, and Amazon Neptune.
  ///
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
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

  /// Assigns a set of key-value pairs to a recovery point, backup plan, or
  /// backup vault identified by an Amazon Resource Name (ARN).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the type of the tagged resource.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// An ARN that uniquely identifies a resource. The format of the ARN depends
  /// on the type of the tagged resource.
  ///
  /// Parameter [tagKeyList] :
  /// A list of keys to identify which key-value tags to remove from a resource.
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

  /// Updates an existing backup plan identified by its
  /// <code>backupPlanId</code> with the input document in JSON format. The new
  /// version is uniquely identified by a <code>VersionId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupPlan] :
  /// Specifies the body of a backup plan. Includes a
  /// <code>BackupPlanName</code> and one or more sets of <code>Rules</code>.
  ///
  /// Parameter [backupPlanId] :
  /// Uniquely identifies a backup plan.
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

  /// Updates an existing framework identified by its <code>FrameworkName</code>
  /// with the input document in JSON format.
  ///
  /// May throw [AlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [frameworkName] :
  /// The unique name of a framework. This name is between 1 and 256 characters,
  /// starting with a letter, and consisting of letters (a-z, A-Z), numbers
  /// (0-9), and underscores (_).
  ///
  /// Parameter [frameworkControls] :
  /// A list of the controls that make up the framework. Each control in the
  /// list has a name, input parameters, and scope.
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

  /// Updates whether the Amazon Web Services account is opted in to
  /// cross-account backup. Returns an error if the account is not an
  /// Organizations management account. Use the
  /// <code>DescribeGlobalSettings</code> API to determine the current settings.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [globalSettings] :
  /// A value for <code>isCrossAccountBackupEnabled</code> and a Region.
  /// Example: <code>update-global-settings --global-settings
  /// isCrossAccountBackupEnabled=false --region us-west-2</code>.
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

  /// Sets the transition lifecycle of a recovery point.
  ///
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition
  /// to cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  ///
  /// Resource types that are able to be transitioned to cold storage are listed
  /// in the "Lifecycle to cold storage" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table. Backup ignores this expression
  /// for other resource types.
  ///
  /// This operation does not support continuous backups.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
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

  /// Updates an existing report plan identified by its
  /// <code>ReportPlanName</code> with the input document in JSON format.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
  /// May throw [ConflictException].
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
  /// A structure that contains information about where to deliver your reports,
  /// specifically your Amazon S3 bucket name, S3 key prefix, and the formats of
  /// your reports.
  ///
  /// Parameter [reportPlanDescription] :
  /// An optional description of the report plan with a maximum 1,024
  /// characters.
  ///
  /// Parameter [reportSetting] :
  /// Identifies the report template for the report. Reports are built using a
  /// report template. The report templates are:
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
  /// This is the restore testing plan name you wish to update.
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

  /// Most elements except the <code>RestoreTestingSelectionName</code> can be
  /// updated with this request.
  ///
  /// <code>RestoreTestingSelection</code> can use either protected resource
  /// ARNs or conditions, but not both. That is, if your selection has
  /// <code>ProtectedResourceArns</code>, requesting an update with the
  /// parameter <code>ProtectedResourceConditions</code> will be unsuccessful.
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
  /// This is the required restore testing selection name of the restore testing
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
}

/// A list of backup options for each resource type.
class AdvancedBackupSetting {
  /// Specifies the backup option for a selected resource. This option is only
  /// available for Windows VSS backup jobs.
  ///
  /// Valid values:
  ///
  /// Set to <code>"WindowsVSS":"enabled"</code> to enable the
  /// <code>WindowsVSS</code> backup option and create a Windows VSS backup.
  ///
  /// Set to <code>"WindowsVSS":"disabled"</code> to create a regular backup. The
  /// <code>WindowsVSS</code> option is not enabled by default.
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

enum AggregationPeriod {
  oneDay,
  sevenDays,
  fourteenDays,
}

extension AggregationPeriodValueExtension on AggregationPeriod {
  String toValue() {
    switch (this) {
      case AggregationPeriod.oneDay:
        return 'ONE_DAY';
      case AggregationPeriod.sevenDays:
        return 'SEVEN_DAYS';
      case AggregationPeriod.fourteenDays:
        return 'FOURTEEN_DAYS';
    }
  }
}

extension AggregationPeriodFromString on String {
  AggregationPeriod toAggregationPeriod() {
    switch (this) {
      case 'ONE_DAY':
        return AggregationPeriod.oneDay;
      case 'SEVEN_DAYS':
        return AggregationPeriod.sevenDays;
      case 'FOURTEEN_DAYS':
        return AggregationPeriod.fourteenDays;
    }
    throw Exception('$this is not known in enum AggregationPeriod');
  }
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

  /// The size, in bytes, of a backup.
  final int? backupSizeInBytes;

  /// Represents the type of backup for a backup job.
  final String? backupType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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

  /// This is the date on which the backup job was initiated.
  final DateTime? initiationDate;

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

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
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
    this.expectedCompletionDate,
    this.iamRoleArn,
    this.initiationDate,
    this.isParent,
    this.messageCategory,
    this.parentJobId,
    this.percentDone,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
    this.startBy,
    this.state,
    this.statusMessage,
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
      expectedCompletionDate: timeStampFromJson(json['ExpectedCompletionDate']),
      iamRoleArn: json['IamRoleArn'] as String?,
      initiationDate: timeStampFromJson(json['InitiationDate']),
      isParent: json['IsParent'] as bool?,
      messageCategory: json['MessageCategory'] as String?,
      parentJobId: json['ParentJobId'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
      startBy: timeStampFromJson(json['StartBy']),
      state: (json['State'] as String?)?.toBackupJobState(),
      statusMessage: json['StatusMessage'] as String?,
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
    final expectedCompletionDate = this.expectedCompletionDate;
    final iamRoleArn = this.iamRoleArn;
    final initiationDate = this.initiationDate;
    final isParent = this.isParent;
    final messageCategory = this.messageCategory;
    final parentJobId = this.parentJobId;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final startBy = this.startBy;
    final state = this.state;
    final statusMessage = this.statusMessage;
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
      if (expectedCompletionDate != null)
        'ExpectedCompletionDate': unixTimestampToJson(expectedCompletionDate),
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (isParent != null) 'IsParent': isParent,
      if (messageCategory != null) 'MessageCategory': messageCategory,
      if (parentJobId != null) 'ParentJobId': parentJobId,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startBy != null) 'StartBy': unixTimestampToJson(startBy),
      if (state != null) 'State': state.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum BackupJobState {
  created,
  pending,
  running,
  aborting,
  aborted,
  completed,
  failed,
  expired,
  partial,
}

extension BackupJobStateValueExtension on BackupJobState {
  String toValue() {
    switch (this) {
      case BackupJobState.created:
        return 'CREATED';
      case BackupJobState.pending:
        return 'PENDING';
      case BackupJobState.running:
        return 'RUNNING';
      case BackupJobState.aborting:
        return 'ABORTING';
      case BackupJobState.aborted:
        return 'ABORTED';
      case BackupJobState.completed:
        return 'COMPLETED';
      case BackupJobState.failed:
        return 'FAILED';
      case BackupJobState.expired:
        return 'EXPIRED';
      case BackupJobState.partial:
        return 'PARTIAL';
    }
  }
}

extension BackupJobStateFromString on String {
  BackupJobState toBackupJobState() {
    switch (this) {
      case 'CREATED':
        return BackupJobState.created;
      case 'PENDING':
        return BackupJobState.pending;
      case 'RUNNING':
        return BackupJobState.running;
      case 'ABORTING':
        return BackupJobState.aborting;
      case 'ABORTED':
        return BackupJobState.aborted;
      case 'COMPLETED':
        return BackupJobState.completed;
      case 'FAILED':
        return BackupJobState.failed;
      case 'EXPIRED':
        return BackupJobState.expired;
      case 'PARTIAL':
        return BackupJobState.partial;
    }
    throw Exception('$this is not known in enum BackupJobState');
  }
}

enum BackupJobStatus {
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
  any,
}

extension BackupJobStatusValueExtension on BackupJobStatus {
  String toValue() {
    switch (this) {
      case BackupJobStatus.created:
        return 'CREATED';
      case BackupJobStatus.pending:
        return 'PENDING';
      case BackupJobStatus.running:
        return 'RUNNING';
      case BackupJobStatus.aborting:
        return 'ABORTING';
      case BackupJobStatus.aborted:
        return 'ABORTED';
      case BackupJobStatus.completed:
        return 'COMPLETED';
      case BackupJobStatus.failed:
        return 'FAILED';
      case BackupJobStatus.expired:
        return 'EXPIRED';
      case BackupJobStatus.partial:
        return 'PARTIAL';
      case BackupJobStatus.aggregateAll:
        return 'AGGREGATE_ALL';
      case BackupJobStatus.any:
        return 'ANY';
    }
  }
}

extension BackupJobStatusFromString on String {
  BackupJobStatus toBackupJobStatus() {
    switch (this) {
      case 'CREATED':
        return BackupJobStatus.created;
      case 'PENDING':
        return BackupJobStatus.pending;
      case 'RUNNING':
        return BackupJobStatus.running;
      case 'ABORTING':
        return BackupJobStatus.aborting;
      case 'ABORTED':
        return BackupJobStatus.aborted;
      case 'COMPLETED':
        return BackupJobStatus.completed;
      case 'FAILED':
        return BackupJobStatus.failed;
      case 'EXPIRED':
        return BackupJobStatus.expired;
      case 'PARTIAL':
        return BackupJobStatus.partial;
      case 'AGGREGATE_ALL':
        return BackupJobStatus.aggregateAll;
      case 'ANY':
        return BackupJobStatus.any;
    }
    throw Exception('$this is not known in enum BackupJobStatus');
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
      state: (json['State'] as String?)?.toBackupJobStatus(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// Contains an optional backup plan display name and an array of
/// <code>BackupRule</code> objects, each of which specifies a backup rule. Each
/// rule in a backup plan is a separate scheduled task and can back up a
/// different selection of Amazon Web Services resources.
class BackupPlan {
  /// The display name of a backup plan. Must contain 1 to 50 alphanumeric or
  /// '-_.' characters.
  final String backupPlanName;

  /// An array of <code>BackupRule</code> objects, each of which specifies a
  /// scheduled task that is used to back up a selection of resources.
  final List<BackupRule> rules;

  /// Contains a list of <code>BackupOptions</code> for each resource type.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  BackupPlan({
    required this.backupPlanName,
    required this.rules,
    this.advancedBackupSettings,
  });

  factory BackupPlan.fromJson(Map<String, dynamic> json) {
    return BackupPlan(
      backupPlanName: json['BackupPlanName'] as String,
      rules: (json['Rules'] as List)
          .whereNotNull()
          .map((e) => BackupRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.whereNotNull()
          .map((e) => AdvancedBackupSetting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanName = this.backupPlanName;
    final rules = this.rules;
    final advancedBackupSettings = this.advancedBackupSettings;
    return {
      'BackupPlanName': backupPlanName,
      'Rules': rules,
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
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

  BackupPlanInput({
    required this.backupPlanName,
    required this.rules,
    this.advancedBackupSettings,
  });

  Map<String, dynamic> toJson() {
    final backupPlanName = this.backupPlanName;
    final rules = this.rules;
    final advancedBackupSettings = this.advancedBackupSettings;
    return {
      'BackupPlanName': backupPlanName,
      'Rules': rules,
      if (advancedBackupSettings != null)
        'AdvancedBackupSettings': advancedBackupSettings,
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

  /// The last time a job to back up resources was run with this rule. A date and
  /// time, in Unix format and Coordinated Universal Time (UTC). The value of
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
          ?.whereNotNull()
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

/// Specifies a scheduled task used to back up a selection of resources.
class BackupRule {
  /// A display name for a backup rule. Must contain 1 to 50 alphanumeric or '-_.'
  /// characters.
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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
  /// Resource types that are able to be transitioned to cold storage are listed
  /// in the "Lifecycle to cold storage" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table. Backup ignores this expression
  /// for other resource types.
  final Lifecycle? lifecycle;

  /// An array of key-value pair strings that are assigned to resources that are
  /// associated with this rule when restored from backup.
  final Map<String, String>? recoveryPointTags;

  /// Uniquely identifies a rule that is used to schedule the backup of a
  /// selection of resources.
  final String? ruleId;

  /// A cron expression in UTC specifying when Backup initiates a backup job. For
  /// more information about Amazon Web Services cron expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html">Schedule
  /// Expressions for Rules</a> in the <i>Amazon CloudWatch Events User
  /// Guide.</i>. Two examples of Amazon Web Services cron expressions are <code>
  /// 15 * ? * * *</code> (take a backup every hour at 15 minutes past the hour)
  /// and <code>0 12 * * ? *</code> (take a backup every day at 12 noon UTC). For
  /// a table of examples, click the preceding link and scroll down the page.
  final String? scheduleExpression;

  /// This is the timezone in which the schedule expression is set. By default,
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

  BackupRule({
    required this.ruleName,
    required this.targetBackupVaultName,
    this.completionWindowMinutes,
    this.copyActions,
    this.enableContinuousBackup,
    this.lifecycle,
    this.recoveryPointTags,
    this.ruleId,
    this.scheduleExpression,
    this.scheduleExpressionTimezone,
    this.startWindowMinutes,
  });

  factory BackupRule.fromJson(Map<String, dynamic> json) {
    return BackupRule(
      ruleName: json['RuleName'] as String,
      targetBackupVaultName: json['TargetBackupVaultName'] as String,
      completionWindowMinutes: json['CompletionWindowMinutes'] as int?,
      copyActions: (json['CopyActions'] as List?)
          ?.whereNotNull()
          .map((e) => CopyAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      enableContinuousBackup: json['EnableContinuousBackup'] as bool?,
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      recoveryPointTags: (json['RecoveryPointTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      ruleId: json['RuleId'] as String?,
      scheduleExpression: json['ScheduleExpression'] as String?,
      scheduleExpressionTimezone: json['ScheduleExpressionTimezone'] as String?,
      startWindowMinutes: json['StartWindowMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleName = this.ruleName;
    final targetBackupVaultName = this.targetBackupVaultName;
    final completionWindowMinutes = this.completionWindowMinutes;
    final copyActions = this.copyActions;
    final enableContinuousBackup = this.enableContinuousBackup;
    final lifecycle = this.lifecycle;
    final recoveryPointTags = this.recoveryPointTags;
    final ruleId = this.ruleId;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowMinutes = this.startWindowMinutes;
    return {
      'RuleName': ruleName,
      'TargetBackupVaultName': targetBackupVaultName,
      if (completionWindowMinutes != null)
        'CompletionWindowMinutes': completionWindowMinutes,
      if (copyActions != null) 'CopyActions': copyActions,
      if (enableContinuousBackup != null)
        'EnableContinuousBackup': enableContinuousBackup,
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (recoveryPointTags != null) 'RecoveryPointTags': recoveryPointTags,
      if (ruleId != null) 'RuleId': ruleId,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowMinutes != null) 'StartWindowMinutes': startWindowMinutes,
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
  /// the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “retention” setting must be 90 days
  /// greater than the “transition to cold after days” setting. The “transition to
  /// cold after days” setting cannot be changed after a backup has been
  /// transitioned to cold.
  ///
  /// Resource types that are able to be transitioned to cold storage are listed
  /// in the "Lifecycle to cold storage" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table. Backup ignores this expression
  /// for other resource types.
  ///
  /// This parameter has a maximum value of 100 years (36,500 days).
  final Lifecycle? lifecycle;

  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair.
  final Map<String, String>? recoveryPointTags;

  /// A CRON expression in UTC specifying when Backup initiates a backup job.
  final String? scheduleExpression;

  /// This is the timezone in which the schedule expression is set. By default,
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

  BackupRuleInput({
    required this.ruleName,
    required this.targetBackupVaultName,
    this.completionWindowMinutes,
    this.copyActions,
    this.enableContinuousBackup,
    this.lifecycle,
    this.recoveryPointTags,
    this.scheduleExpression,
    this.scheduleExpressionTimezone,
    this.startWindowMinutes,
  });

  Map<String, dynamic> toJson() {
    final ruleName = this.ruleName;
    final targetBackupVaultName = this.targetBackupVaultName;
    final completionWindowMinutes = this.completionWindowMinutes;
    final copyActions = this.copyActions;
    final enableContinuousBackup = this.enableContinuousBackup;
    final lifecycle = this.lifecycle;
    final recoveryPointTags = this.recoveryPointTags;
    final scheduleExpression = this.scheduleExpression;
    final scheduleExpressionTimezone = this.scheduleExpressionTimezone;
    final startWindowMinutes = this.startWindowMinutes;
    return {
      'RuleName': ruleName,
      'TargetBackupVaultName': targetBackupVaultName,
      if (completionWindowMinutes != null)
        'CompletionWindowMinutes': completionWindowMinutes,
      if (copyActions != null) 'CopyActions': copyActions,
      if (enableContinuousBackup != null)
        'EnableContinuousBackup': enableContinuousBackup,
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (recoveryPointTags != null) 'RecoveryPointTags': recoveryPointTags,
      if (scheduleExpression != null) 'ScheduleExpression': scheduleExpression,
      if (scheduleExpressionTimezone != null)
        'ScheduleExpressionTimezone': scheduleExpressionTimezone,
      if (startWindowMinutes != null) 'StartWindowMinutes': startWindowMinutes,
    };
  }
}

/// Used to specify a set of resources to a backup plan.
///
/// Specifying your desired <code>Conditions</code>, <code>ListOfTags</code>,
/// <code>NotResources</code>, and/or <code>Resources</code> is recommended. If
/// none of these are specified, Backup will attempt to select all supported and
/// opted-in storage resources, which could have unintended cost implications.
class BackupSelection {
  /// The ARN of the IAM role that Backup uses to authenticate when backing up the
  /// target resource; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The display name of a resource selection document. Must contain 1 to 50
  /// alphanumeric or '-_.' characters.
  final String selectionName;

  /// A list of conditions that you define to assign resources to your backup
  /// plans using tags. For example, <code>"StringEquals": { "Key":
  /// "aws:ResourceTag/CreatedByCryo", "Value": "true" },</code>. Condition
  /// operators are case sensitive.
  ///
  /// <code>Conditions</code> differs from <code>ListOfTags</code> as follows:
  ///
  /// <ul>
  /// <li>
  /// When you specify more than one condition, you only assign the resources that
  /// match ALL conditions (using AND logic).
  /// </li>
  /// <li>
  /// <code>Conditions</code> supports <code>StringEquals</code>,
  /// <code>StringLike</code>, <code>StringNotEquals</code>, and
  /// <code>StringNotLike</code>. <code>ListOfTags</code> only supports
  /// <code>StringEquals</code>.
  /// </li>
  /// </ul>
  final Conditions? conditions;

  /// A list of conditions that you define to assign resources to your backup
  /// plans using tags. For example, <code>"StringEquals": { "Key":
  /// "aws:ResourceTag/CreatedByCryo", "Value": "true" },</code>. Condition
  /// operators are case sensitive.
  ///
  /// <code>ListOfTags</code> differs from <code>Conditions</code> as follows:
  ///
  /// <ul>
  /// <li>
  /// When you specify more than one condition, you assign all resources that
  /// match AT LEAST ONE condition (using OR logic).
  /// </li>
  /// <li>
  /// <code>ListOfTags</code> only supports <code>StringEquals</code>.
  /// <code>Conditions</code> supports <code>StringEquals</code>,
  /// <code>StringLike</code>, <code>StringNotEquals</code>, and
  /// <code>StringNotLike</code>.
  /// </li>
  /// </ul>
  final List<Condition>? listOfTags;

  /// A list of Amazon Resource Names (ARNs) to exclude from a backup plan. The
  /// maximum number of ARNs is 500 without wildcards, or 30 ARNs with wildcards.
  ///
  /// If you need to exclude many resources from a backup plan, consider a
  /// different resource selection strategy, such as assigning only one or a few
  /// resource types or refining your resource selection using tags.
  final List<String>? notResources;

  /// A list of Amazon Resource Names (ARNs) to assign to a backup plan. The
  /// maximum number of ARNs is 500 without wildcards, or 30 ARNs with wildcards.
  ///
  /// If you need to assign many resources to a backup plan, consider a different
  /// resource selection strategy, such as assigning all resources of a resource
  /// type or refining your resource selection using tags.
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
      iamRoleArn: json['IamRoleArn'] as String,
      selectionName: json['SelectionName'] as String,
      conditions: json['Conditions'] != null
          ? Conditions.fromJson(json['Conditions'] as Map<String, dynamic>)
          : null,
      listOfTags: (json['ListOfTags'] as List?)
          ?.whereNotNull()
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
          .toList(),
      notResources: (json['NotResources'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      resources: (json['Resources'] as List?)
          ?.whereNotNull()
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

enum BackupVaultEvent {
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
}

extension BackupVaultEventValueExtension on BackupVaultEvent {
  String toValue() {
    switch (this) {
      case BackupVaultEvent.backupJobStarted:
        return 'BACKUP_JOB_STARTED';
      case BackupVaultEvent.backupJobCompleted:
        return 'BACKUP_JOB_COMPLETED';
      case BackupVaultEvent.backupJobSuccessful:
        return 'BACKUP_JOB_SUCCESSFUL';
      case BackupVaultEvent.backupJobFailed:
        return 'BACKUP_JOB_FAILED';
      case BackupVaultEvent.backupJobExpired:
        return 'BACKUP_JOB_EXPIRED';
      case BackupVaultEvent.restoreJobStarted:
        return 'RESTORE_JOB_STARTED';
      case BackupVaultEvent.restoreJobCompleted:
        return 'RESTORE_JOB_COMPLETED';
      case BackupVaultEvent.restoreJobSuccessful:
        return 'RESTORE_JOB_SUCCESSFUL';
      case BackupVaultEvent.restoreJobFailed:
        return 'RESTORE_JOB_FAILED';
      case BackupVaultEvent.copyJobStarted:
        return 'COPY_JOB_STARTED';
      case BackupVaultEvent.copyJobSuccessful:
        return 'COPY_JOB_SUCCESSFUL';
      case BackupVaultEvent.copyJobFailed:
        return 'COPY_JOB_FAILED';
      case BackupVaultEvent.recoveryPointModified:
        return 'RECOVERY_POINT_MODIFIED';
      case BackupVaultEvent.backupPlanCreated:
        return 'BACKUP_PLAN_CREATED';
      case BackupVaultEvent.backupPlanModified:
        return 'BACKUP_PLAN_MODIFIED';
      case BackupVaultEvent.s3BackupObjectFailed:
        return 'S3_BACKUP_OBJECT_FAILED';
      case BackupVaultEvent.s3RestoreObjectFailed:
        return 'S3_RESTORE_OBJECT_FAILED';
    }
  }
}

extension BackupVaultEventFromString on String {
  BackupVaultEvent toBackupVaultEvent() {
    switch (this) {
      case 'BACKUP_JOB_STARTED':
        return BackupVaultEvent.backupJobStarted;
      case 'BACKUP_JOB_COMPLETED':
        return BackupVaultEvent.backupJobCompleted;
      case 'BACKUP_JOB_SUCCESSFUL':
        return BackupVaultEvent.backupJobSuccessful;
      case 'BACKUP_JOB_FAILED':
        return BackupVaultEvent.backupJobFailed;
      case 'BACKUP_JOB_EXPIRED':
        return BackupVaultEvent.backupJobExpired;
      case 'RESTORE_JOB_STARTED':
        return BackupVaultEvent.restoreJobStarted;
      case 'RESTORE_JOB_COMPLETED':
        return BackupVaultEvent.restoreJobCompleted;
      case 'RESTORE_JOB_SUCCESSFUL':
        return BackupVaultEvent.restoreJobSuccessful;
      case 'RESTORE_JOB_FAILED':
        return BackupVaultEvent.restoreJobFailed;
      case 'COPY_JOB_STARTED':
        return BackupVaultEvent.copyJobStarted;
      case 'COPY_JOB_SUCCESSFUL':
        return BackupVaultEvent.copyJobSuccessful;
      case 'COPY_JOB_FAILED':
        return BackupVaultEvent.copyJobFailed;
      case 'RECOVERY_POINT_MODIFIED':
        return BackupVaultEvent.recoveryPointModified;
      case 'BACKUP_PLAN_CREATED':
        return BackupVaultEvent.backupPlanCreated;
      case 'BACKUP_PLAN_MODIFIED':
        return BackupVaultEvent.backupPlanModified;
      case 'S3_BACKUP_OBJECT_FAILED':
        return BackupVaultEvent.s3BackupObjectFailed;
      case 'S3_RESTORE_OBJECT_FAILED':
        return BackupVaultEvent.s3RestoreObjectFailed;
    }
    throw Exception('$this is not known in enum BackupVaultEvent');
  }
}

/// Contains metadata about a backup vault.
class BackupVaultListMember {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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

  BackupVaultListMember({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.lockDate,
    this.locked,
    this.maxRetentionDays,
    this.minRetentionDays,
    this.numberOfRecoveryPoints,
  });

  factory BackupVaultListMember.fromJson(Map<String, dynamic> json) {
    return BackupVaultListMember(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      lockDate: timeStampFromJson(json['LockDate']),
      locked: json['Locked'] as bool?,
      maxRetentionDays: json['MaxRetentionDays'] as int?,
      minRetentionDays: json['MinRetentionDays'] as int?,
      numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final encryptionKeyArn = this.encryptionKeyArn;
    final lockDate = this.lockDate;
    final locked = this.locked;
    final maxRetentionDays = this.maxRetentionDays;
    final minRetentionDays = this.minRetentionDays;
    final numberOfRecoveryPoints = this.numberOfRecoveryPoints;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (lockDate != null) 'LockDate': unixTimestampToJson(lockDate),
      if (locked != null) 'Locked': locked,
      if (maxRetentionDays != null) 'MaxRetentionDays': maxRetentionDays,
      if (minRetentionDays != null) 'MinRetentionDays': minRetentionDays,
      if (numberOfRecoveryPoints != null)
        'NumberOfRecoveryPoints': numberOfRecoveryPoints,
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
/// Resource types that are able to be transitioned to cold storage are listed
/// in the "Lifecycle to cold storage" section of the <a
/// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
/// Feature availability by resource</a> table. Backup ignores this expression
/// for other resource types.
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

class CancelLegalHoldOutput {
  CancelLegalHoldOutput();

  factory CancelLegalHoldOutput.fromJson(Map<String, dynamic> _) {
    return CancelLegalHoldOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
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
      conditionKey: json['ConditionKey'] as String,
      conditionType: (json['ConditionType'] as String).toConditionType(),
      conditionValue: json['ConditionValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final conditionKey = this.conditionKey;
    final conditionType = this.conditionType;
    final conditionValue = this.conditionValue;
    return {
      'ConditionKey': conditionKey,
      'ConditionType': conditionType.toValue(),
      'ConditionValue': conditionValue,
    };
  }
}

/// Includes information about tags you define to assign tagged resources to a
/// backup plan.
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

enum ConditionType {
  stringequals,
}

extension ConditionTypeValueExtension on ConditionType {
  String toValue() {
    switch (this) {
      case ConditionType.stringequals:
        return 'STRINGEQUALS';
    }
  }
}

extension ConditionTypeFromString on String {
  ConditionType toConditionType() {
    switch (this) {
      case 'STRINGEQUALS':
        return ConditionType.stringequals;
    }
    throw Exception('$this is not known in enum ConditionType');
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
          ?.whereNotNull()
          .map((e) => ConditionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringLike: (json['StringLike'] as List?)
          ?.whereNotNull()
          .map((e) => ConditionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringNotEquals: (json['StringNotEquals'] as List?)
          ?.whereNotNull()
          .map((e) => ConditionParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringNotLike: (json['StringNotLike'] as List?)
          ?.whereNotNull()
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

/// A list of parameters for a control. A control can have zero, one, or more
/// than one parameter. An example of a control with two parameters is: "backup
/// plan frequency is at least <code>daily</code> and the retention period is at
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
  /// string. The structure to assign a tag is:
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      complianceResourceTypes: (json['ComplianceResourceTypes'] as List?)
          ?.whereNotNull()
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

/// The details of the copy operation.
class CopyAction {
  /// An Amazon Resource Name (ARN) that uniquely identifies the destination
  /// backup vault for the copied backup. For example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String destinationBackupVaultArn;
  final Lifecycle? lifecycle;

  CopyAction({
    required this.destinationBackupVaultArn,
    this.lifecycle,
  });

  factory CopyAction.fromJson(Map<String, dynamic> json) {
    return CopyAction(
      destinationBackupVaultArn: json['DestinationBackupVaultArn'] as String,
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

  /// This is the identifier of a resource within a composite group, such as
  /// nested (child) recovery point belonging to a composite (parent) stack. The
  /// ID is transferred from the <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resources-section-structure.html#resources-section-structure-syntax">
  /// logical ID</a> within a stack.
  final String? compositeMemberIdentifier;

  /// Uniquely identifies a copy job.
  final String? copyJobId;
  final RecoveryPointCreator? createdBy;

  /// The date and time a copy job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// An Amazon Resource Name (ARN) that uniquely identifies a destination copy
  /// vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? destinationBackupVaultArn;

  /// An ARN that uniquely identifies a destination recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? destinationRecoveryPointArn;

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

  /// This is the number of child (nested) copy jobs.
  final int? numberOfChildJobs;

  /// This uniquely identifies a request to Backup to copy a resource. The return
  /// will be the parent (composite) job ID.
  final String? parentJobId;

  /// The Amazon Web Services resource to be copied; for example, an Amazon
  /// Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database
  /// Service (Amazon RDS) database.
  final String? resourceArn;

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource to be copied; for example, an
  /// Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational
  /// Database Service (Amazon RDS) database.
  final String? resourceType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a source copy vault;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
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
    this.creationDate,
    this.destinationBackupVaultArn,
    this.destinationRecoveryPointArn,
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
          ?.map((k, e) => MapEntry(k.toCopyJobState(), e as int)),
      completionDate: timeStampFromJson(json['CompletionDate']),
      compositeMemberIdentifier: json['CompositeMemberIdentifier'] as String?,
      copyJobId: json['CopyJobId'] as String?,
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      destinationBackupVaultArn: json['DestinationBackupVaultArn'] as String?,
      destinationRecoveryPointArn:
          json['DestinationRecoveryPointArn'] as String?,
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
      state: (json['State'] as String?)?.toCopyJobState(),
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
    final creationDate = this.creationDate;
    final destinationBackupVaultArn = this.destinationBackupVaultArn;
    final destinationRecoveryPointArn = this.destinationRecoveryPointArn;
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
            childJobsInState.map((k, e) => MapEntry(k.toValue(), e)),
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (compositeMemberIdentifier != null)
        'CompositeMemberIdentifier': compositeMemberIdentifier,
      if (copyJobId != null) 'CopyJobId': copyJobId,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (destinationBackupVaultArn != null)
        'DestinationBackupVaultArn': destinationBackupVaultArn,
      if (destinationRecoveryPointArn != null)
        'DestinationRecoveryPointArn': destinationRecoveryPointArn,
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
      if (state != null) 'State': state.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum CopyJobState {
  created,
  running,
  completed,
  failed,
  partial,
}

extension CopyJobStateValueExtension on CopyJobState {
  String toValue() {
    switch (this) {
      case CopyJobState.created:
        return 'CREATED';
      case CopyJobState.running:
        return 'RUNNING';
      case CopyJobState.completed:
        return 'COMPLETED';
      case CopyJobState.failed:
        return 'FAILED';
      case CopyJobState.partial:
        return 'PARTIAL';
    }
  }
}

extension CopyJobStateFromString on String {
  CopyJobState toCopyJobState() {
    switch (this) {
      case 'CREATED':
        return CopyJobState.created;
      case 'RUNNING':
        return CopyJobState.running;
      case 'COMPLETED':
        return CopyJobState.completed;
      case 'FAILED':
        return CopyJobState.failed;
      case 'PARTIAL':
        return CopyJobState.partial;
    }
    throw Exception('$this is not known in enum CopyJobState');
  }
}

enum CopyJobStatus {
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
  any,
}

extension CopyJobStatusValueExtension on CopyJobStatus {
  String toValue() {
    switch (this) {
      case CopyJobStatus.created:
        return 'CREATED';
      case CopyJobStatus.running:
        return 'RUNNING';
      case CopyJobStatus.aborting:
        return 'ABORTING';
      case CopyJobStatus.aborted:
        return 'ABORTED';
      case CopyJobStatus.completing:
        return 'COMPLETING';
      case CopyJobStatus.completed:
        return 'COMPLETED';
      case CopyJobStatus.failing:
        return 'FAILING';
      case CopyJobStatus.failed:
        return 'FAILED';
      case CopyJobStatus.partial:
        return 'PARTIAL';
      case CopyJobStatus.aggregateAll:
        return 'AGGREGATE_ALL';
      case CopyJobStatus.any:
        return 'ANY';
    }
  }
}

extension CopyJobStatusFromString on String {
  CopyJobStatus toCopyJobStatus() {
    switch (this) {
      case 'CREATED':
        return CopyJobStatus.created;
      case 'RUNNING':
        return CopyJobStatus.running;
      case 'ABORTING':
        return CopyJobStatus.aborting;
      case 'ABORTED':
        return CopyJobStatus.aborted;
      case 'COMPLETING':
        return CopyJobStatus.completing;
      case 'COMPLETED':
        return CopyJobStatus.completed;
      case 'FAILING':
        return CopyJobStatus.failing;
      case 'FAILED':
        return CopyJobStatus.failed;
      case 'PARTIAL':
        return CopyJobStatus.partial;
      case 'AGGREGATE_ALL':
        return CopyJobStatus.aggregateAll;
      case 'ANY':
        return CopyJobStatus.any;
    }
    throw Exception('$this is not known in enum CopyJobStatus');
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

  /// This is the Amazon Web Services Regions within the job summary.
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
      state: (json['State'] as String?)?.toCopyJobStatus(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

class CreateBackupPlanOutput {
  /// A list of <code>BackupOptions</code> settings for a resource type. This
  /// option is only available for Windows Volume Shadow Copy Service (VSS) backup
  /// jobs.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

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
          ?.whereNotNull()
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
  /// Uniquely identifies a backup plan.
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
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
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
  /// Time in number format when legal hold was created.
  final DateTime? creationDate;

  /// This is the returned string description of the legal hold.
  final String? description;

  /// This is the ARN (Amazon Resource Number) of the created legal hold.
  final String? legalHoldArn;

  /// Legal hold ID returned for the specified legal hold on a recovery point.
  final String? legalHoldId;

  /// This specifies criteria to assign a set of resources, such as resource types
  /// or backup vaults.
  final RecoveryPointSelection? recoveryPointSelection;

  /// This displays the status of the legal hold returned after creating the legal
  /// hold. Statuses can be <code>ACTIVE</code>, <code>PENDING</code>,
  /// <code>CANCELED</code>, <code>CANCELING</code>, or <code>FAILED</code>.
  final LegalHoldStatus? status;

  /// This is the string title of the legal hold returned after creating the legal
  /// hold.
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
      status: (json['Status'] as String?)?.toLegalHoldStatus(),
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
      if (status != null) 'Status': status.toValue(),
      if (title != null) 'Title': title,
    };
  }
}

class CreateLogicallyAirGappedBackupVaultOutput {
  /// This is the ARN (Amazon Resource Name) of the vault being created.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Logically
  /// air-gapped backup vaults are identified by names that are unique to the
  /// account used to create them and the Region where they are created. They
  /// consist of lowercase letters, numbers, and hyphens.
  final String? backupVaultName;

  /// The date and time when the vault was created.
  ///
  /// This value is in Unix format, Coordinated Universal Time (UTC), and accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// This is the current state of the vault.
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
      vaultState: (json['VaultState'] as String?)?.toVaultState(),
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
      if (vaultState != null) 'VaultState': vaultState.toValue(),
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
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      restoreTestingPlanArn: json['RestoreTestingPlanArn'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
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
  /// This is the time the resource testing selection was created successfully.
  final DateTime creationTime;

  /// This is the ARN of the restore testing plan with which the restore testing
  /// selection is associated.
  final String restoreTestingPlanArn;

  /// Unique string that is the name of the restore testing plan.
  ///
  /// The name cannot be changed after creation. The name consists of only
  /// alphanumeric characters and underscores. Maximum length is 50.
  final String restoreTestingPlanName;

  /// This is the unique name of the restore testing selection that belongs to the
  /// related restore testing plan.
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
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      restoreTestingPlanArn: json['RestoreTestingPlanArn'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
      restoreTestingSelectionName:
          json['RestoreTestingSelectionName'] as String,
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
      fromDate: nonNullableTimeStampFromJson(json['FromDate'] as Object),
      toDate: nonNullableTimeStampFromJson(json['ToDate'] as Object),
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

class DescribeBackupJobOutput {
  /// Returns the account ID that owns the backup job.
  final String? accountId;

  /// Uniquely identifies a request to Backup to back up a resource.
  final String? backupJobId;

  /// Represents the options specified as part of backup plan or on-demand backup
  /// job.
  final Map<String, String>? backupOptions;

  /// The size, in bytes, of a backup.
  final int? backupSizeInBytes;

  /// Represents the actual backup type selected for a backup job. For example, if
  /// a successful Windows Volume Shadow Copy Service (VSS) backup was taken,
  /// <code>BackupType</code> returns <code>"WindowsVSS"</code>. If
  /// <code>BackupType</code> is empty, then the backup type was a regular backup.
  final String? backupType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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

  /// The date and time that a job to back up resources is expected to be
  /// completed, in Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>ExpectedCompletionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  final DateTime? expectedCompletionDate;

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// This is the date a backup job was initiated.
  final DateTime? initiationDate;

  /// This returns the boolean value that a backup job is a parent (composite)
  /// job.
  final bool? isParent;

  /// This is the job count for the specified message category.
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

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  final String? resourceArn;

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
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
    this.expectedCompletionDate,
    this.iamRoleArn,
    this.initiationDate,
    this.isParent,
    this.messageCategory,
    this.numberOfChildJobs,
    this.parentJobId,
    this.percentDone,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceName,
    this.resourceType,
    this.startBy,
    this.state,
    this.statusMessage,
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
          ?.map((k, e) => MapEntry(k.toBackupJobState(), e as int)),
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      expectedCompletionDate: timeStampFromJson(json['ExpectedCompletionDate']),
      iamRoleArn: json['IamRoleArn'] as String?,
      initiationDate: timeStampFromJson(json['InitiationDate']),
      isParent: json['IsParent'] as bool?,
      messageCategory: json['MessageCategory'] as String?,
      numberOfChildJobs: json['NumberOfChildJobs'] as int?,
      parentJobId: json['ParentJobId'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      resourceType: json['ResourceType'] as String?,
      startBy: timeStampFromJson(json['StartBy']),
      state: (json['State'] as String?)?.toBackupJobState(),
      statusMessage: json['StatusMessage'] as String?,
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
    final expectedCompletionDate = this.expectedCompletionDate;
    final iamRoleArn = this.iamRoleArn;
    final initiationDate = this.initiationDate;
    final isParent = this.isParent;
    final messageCategory = this.messageCategory;
    final numberOfChildJobs = this.numberOfChildJobs;
    final parentJobId = this.parentJobId;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceName = this.resourceName;
    final resourceType = this.resourceType;
    final startBy = this.startBy;
    final state = this.state;
    final statusMessage = this.statusMessage;
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
            childJobsInState.map((k, e) => MapEntry(k.toValue(), e)),
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (expectedCompletionDate != null)
        'ExpectedCompletionDate': unixTimestampToJson(expectedCompletionDate),
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (initiationDate != null)
        'InitiationDate': unixTimestampToJson(initiationDate),
      if (isParent != null) 'IsParent': isParent,
      if (messageCategory != null) 'MessageCategory': messageCategory,
      if (numberOfChildJobs != null) 'NumberOfChildJobs': numberOfChildJobs,
      if (parentJobId != null) 'ParentJobId': parentJobId,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startBy != null) 'StartBy': unixTimestampToJson(startBy),
      if (state != null) 'State': state.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class DescribeBackupVaultOutput {
  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
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

  /// This is the type of vault described.
  final VaultType? vaultType;

  DescribeBackupVaultOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.lockDate,
    this.locked,
    this.maxRetentionDays,
    this.minRetentionDays,
    this.numberOfRecoveryPoints,
    this.vaultType,
  });

  factory DescribeBackupVaultOutput.fromJson(Map<String, dynamic> json) {
    return DescribeBackupVaultOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      lockDate: timeStampFromJson(json['LockDate']),
      locked: json['Locked'] as bool?,
      maxRetentionDays: json['MaxRetentionDays'] as int?,
      minRetentionDays: json['MinRetentionDays'] as int?,
      numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int?,
      vaultType: (json['VaultType'] as String?)?.toVaultType(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final encryptionKeyArn = this.encryptionKeyArn;
    final lockDate = this.lockDate;
    final locked = this.locked;
    final maxRetentionDays = this.maxRetentionDays;
    final minRetentionDays = this.minRetentionDays;
    final numberOfRecoveryPoints = this.numberOfRecoveryPoints;
    final vaultType = this.vaultType;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (lockDate != null) 'LockDate': unixTimestampToJson(lockDate),
      if (locked != null) 'Locked': locked,
      if (maxRetentionDays != null) 'MaxRetentionDays': maxRetentionDays,
      if (minRetentionDays != null) 'MinRetentionDays': minRetentionDays,
      if (numberOfRecoveryPoints != null)
        'NumberOfRecoveryPoints': numberOfRecoveryPoints,
      if (vaultType != null) 'VaultType': vaultType.toValue(),
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

  /// A list of the controls that make up the framework. Each control in the list
  /// has a name, input parameters, and scope.
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
          ?.whereNotNull()
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
  /// The status of the flag <code>isCrossAccountBackupEnabled</code>.
  final Map<String, String>? globalSettings;

  /// The date and time that the flag <code>isCrossAccountBackupEnabled</code> was
  /// last updated. This update is in Unix format and Coordinated Universal Time
  /// (UTC). The value of <code>LastUpdateTime</code> is accurate to milliseconds.
  /// For example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
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

  /// This is the ARN (Amazon Resource Name) of the backup vault that contains the
  /// most recent backup recovery point.
  final String? lastBackupVaultArn;

  /// This is the ARN (Amazon Resource Name) of the most recent recovery point.
  final String? lastRecoveryPointArn;

  /// This is the time in minutes the most recent restore job took to complete.
  final int? latestRestoreExecutionTimeMinutes;

  /// This is the creation date of the most recent restore job.
  final DateTime? latestRestoreJobCreationDate;

  /// This is the date the most recent recovery point was created.
  final DateTime? latestRestoreRecoveryPointCreationDate;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
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
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String? backupVaultName;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  final CalculatedLifecycle? calculatedLifecycle;

  /// The date and time that a job to create a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// This is the identifier of a resource within a composite group, such as
  /// nested (child) recovery point belonging to a composite (parent) stack. The
  /// ID is transferred from the <a
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

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

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
  /// Resource types that are able to be transitioned to cold storage are listed
  /// in the "Lifecycle to cold storage" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table. Backup ignores this expression
  /// for other resource types.
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

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
  final String? resourceName;

  /// The type of Amazon Web Services resource to save as a recovery point; for
  /// example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon
  /// Relational Database Service (Amazon RDS) database.
  final String? resourceType;

  /// An Amazon Resource Name (ARN) that uniquely identifies the source vault
  /// where the resource was originally backed up in; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:BackupVault</code>. If the
  /// recovery is restored to the same Amazon Web Services account or Region, this
  /// value will be <code>null</code>.
  final String? sourceBackupVaultArn;

  /// A status code specifying the state of the recovery point.
  ///
  /// <code>PARTIAL</code> status indicates Backup could not create the recovery
  /// point before the backup window closed. To increase your backup plan window
  /// using the API, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/API_UpdateBackupPlan.html">UpdateBackupPlan</a>.
  /// You can also increase your backup plan window using the Console by choosing
  /// and editing your backup plan.
  ///
  /// <code>EXPIRED</code> status indicates that the recovery point has exceeded
  /// its retention period, but Backup lacks permission or is otherwise unable to
  /// delete it. To manually delete these recovery points, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/gs-cleanup-resources.html#cleanup-backups">
  /// Step 3: Delete the recovery points</a> in the <i>Clean up resources</i>
  /// section of <i>Getting started</i>.
  ///
  /// <code>STOPPED</code> status occurs on a continuous backup where a user has
  /// taken some action that causes the continuous backup to be disabled. This can
  /// be caused by the removal of permissions, turning off versioning, turning off
  /// events being sent to EventBridge, or disabling the EventBridge rules that
  /// are put in place by Backup.
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
  final RecoveryPointStatus? status;

  /// A status message explaining the status of the recovery point.
  final String? statusMessage;

  /// Specifies the storage class of the recovery point. Valid values are
  /// <code>WARM</code> or <code>COLD</code>.
  final StorageClass? storageClass;

  /// This is the type of vault in which the described recovery point is stored.
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
    this.iamRoleArn,
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
      iamRoleArn: json['IamRoleArn'] as String?,
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
      status: (json['Status'] as String?)?.toRecoveryPointStatus(),
      statusMessage: json['StatusMessage'] as String?,
      storageClass: (json['StorageClass'] as String?)?.toStorageClass(),
      vaultType: (json['VaultType'] as String?)?.toVaultType(),
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
    final iamRoleArn = this.iamRoleArn;
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
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
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
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
      if (vaultType != null) 'VaultType': vaultType.toValue(),
    };
  }
}

class DescribeRegionSettingsOutput {
  /// Returns whether Backup fully manages the backups for a resource type.
  ///
  /// For the benefits of full Backup management, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#full-management">
  /// Full Backup management</a>.
  ///
  /// For a list of resource types and whether each supports full Backup
  /// management, see the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table.
  ///
  /// If <code>"DynamoDB":false</code>, you can enable full Backup management for
  /// DynamoDB backup by enabling <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/advanced-ddb-backup.html#advanced-ddb-backup-enable-cli">
  /// Backup's advanced DynamoDB backup features</a>.
  final Map<String, bool>? resourceTypeManagementPreference;

  /// Returns a list of all services along with the opt-in preferences in the
  /// Region.
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
  /// A list of information about a report job, including its completion and
  /// creation times, report destination, unique report job ID, Amazon Resource
  /// Name (ARN), report template, status, and status message.
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

  /// The date and time that a job to restore a recovery point is completed, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// Contains identifying information about the creation of a restore job.
  final RestoreJobCreator? createdBy;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource whose
  /// recovery point is being restored. The format of the ARN depends on the
  /// resource type of the backed-up resource.
  final String? createdResourceArn;

  /// The date and time that a restore job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
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

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  final String? percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// This is the creation date of the recovery point made by the specifed restore
  /// job.
  final DateTime? recoveryPointCreationDate;

  /// Returns metadata associated with a restore job listed by resource type.
  final String? resourceType;

  /// Uniquely identifies the job that restores a recovery point.
  final String? restoreJobId;

  /// Status code specifying the state of the job that is initiated by Backup to
  /// restore a recovery point.
  final RestoreJobStatus? status;

  /// A message showing the status of a job to restore a recovery point.
  final String? statusMessage;

  /// This is the status of validation run on the indicated restore job.
  final RestoreValidationStatus? validationStatus;

  /// This describes the status of validation run on the indicated restore job.
  final String? validationStatusMessage;

  DescribeRestoreJobOutput({
    this.accountId,
    this.backupSizeInBytes,
    this.completionDate,
    this.createdBy,
    this.createdResourceArn,
    this.creationDate,
    this.deletionStatus,
    this.deletionStatusMessage,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.recoveryPointCreationDate,
    this.resourceType,
    this.restoreJobId,
    this.status,
    this.statusMessage,
    this.validationStatus,
    this.validationStatusMessage,
  });

  factory DescribeRestoreJobOutput.fromJson(Map<String, dynamic> json) {
    return DescribeRestoreJobOutput(
      accountId: json['AccountId'] as String?,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RestoreJobCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdResourceArn: json['CreatedResourceArn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      deletionStatus:
          (json['DeletionStatus'] as String?)?.toRestoreDeletionStatus(),
      deletionStatusMessage: json['DeletionStatusMessage'] as String?,
      expectedCompletionTimeMinutes:
          json['ExpectedCompletionTimeMinutes'] as int?,
      iamRoleArn: json['IamRoleArn'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      recoveryPointCreationDate:
          timeStampFromJson(json['RecoveryPointCreationDate']),
      resourceType: json['ResourceType'] as String?,
      restoreJobId: json['RestoreJobId'] as String?,
      status: (json['Status'] as String?)?.toRestoreJobStatus(),
      statusMessage: json['StatusMessage'] as String?,
      validationStatus:
          (json['ValidationStatus'] as String?)?.toRestoreValidationStatus(),
      validationStatusMessage: json['ValidationStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupSizeInBytes = this.backupSizeInBytes;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final createdResourceArn = this.createdResourceArn;
    final creationDate = this.creationDate;
    final deletionStatus = this.deletionStatus;
    final deletionStatusMessage = this.deletionStatusMessage;
    final expectedCompletionTimeMinutes = this.expectedCompletionTimeMinutes;
    final iamRoleArn = this.iamRoleArn;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final recoveryPointCreationDate = this.recoveryPointCreationDate;
    final resourceType = this.resourceType;
    final restoreJobId = this.restoreJobId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final validationStatus = this.validationStatus;
    final validationStatusMessage = this.validationStatusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdResourceArn != null) 'CreatedResourceArn': createdResourceArn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (deletionStatus != null) 'DeletionStatus': deletionStatus.toValue(),
      if (deletionStatusMessage != null)
        'DeletionStatusMessage': deletionStatusMessage,
      if (expectedCompletionTimeMinutes != null)
        'ExpectedCompletionTimeMinutes': expectedCompletionTimeMinutes,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (recoveryPointCreationDate != null)
        'RecoveryPointCreationDate':
            unixTimestampToJson(recoveryPointCreationDate),
      if (resourceType != null) 'ResourceType': resourceType,
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (validationStatus != null)
        'ValidationStatus': validationStatus.toValue(),
      if (validationStatusMessage != null)
        'ValidationStatusMessage': validationStatusMessage,
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

/// Contains detailed information about all of the controls of a framework. Each
/// framework must contain at least one control.
class FrameworkControl {
  /// The name of a control. This name is between 1 and 256 characters.
  final String controlName;

  /// A list of <code>ParameterName</code> and <code>ParameterValue</code> pairs.
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
      controlName: json['ControlName'] as String,
      controlInputParameters: (json['ControlInputParameters'] as List?)
          ?.whereNotNull()
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

  /// The last time a job to back up resources was run with this backup plan. A
  /// date and time, in Unix format and Coordinated Universal Time (UTC). The
  /// value of <code>LastExecutionDate</code> is accurate to milliseconds. For
  /// example, the value 1516925490.087 represents Friday, January 26, 2018
  /// 12:11:30.087 AM.
  final DateTime? lastExecutionDate;

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
    this.versionId,
  });

  factory GetBackupPlanOutput.fromJson(Map<String, dynamic> json) {
    return GetBackupPlanOutput(
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.whereNotNull()
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
      if (versionId != null) 'VersionId': versionId,
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
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
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
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// An array of events that indicate the status of jobs to back up resources to
  /// the backup vault.
  final List<BackupVaultEvent>? backupVaultEvents;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
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
          ?.whereNotNull()
          .map((e) => (e as String).toBackupVaultEvent())
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
        'BackupVaultEvents': backupVaultEvents.map((e) => e.toValue()).toList(),
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (sNSTopicArn != null) 'SNSTopicArn': sNSTopicArn,
    };
  }
}

class GetLegalHoldOutput {
  /// String describing the reason for removing the legal hold.
  final String? cancelDescription;

  /// Time in number when legal hold was cancelled.
  final DateTime? cancellationDate;

  /// Time in number format when legal hold was created.
  final DateTime? creationDate;

  /// This is the returned string description of the legal hold.
  final String? description;

  /// This is the returned framework ARN for the specified legal hold. An Amazon
  /// Resource Name (ARN) uniquely identifies a resource. The format of the ARN
  /// depends on the resource type.
  final String? legalHoldArn;

  /// This is the returned ID associated with a specified legal hold.
  final String? legalHoldId;

  /// This specifies criteria to assign a set of resources, such as resource types
  /// or backup vaults.
  final RecoveryPointSelection? recoveryPointSelection;

  /// This is the date and time until which the legal hold record will be
  /// retained.
  final DateTime? retainRecordUntil;

  /// This is the status of the legal hold. Statuses can be <code>ACTIVE</code>,
  /// <code>CREATING</code>, <code>CANCELED</code>, and <code>CANCELING</code>.
  final LegalHoldStatus? status;

  /// This is the string title of the legal hold.
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
      status: (json['Status'] as String?)?.toLegalHoldStatus(),
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
      if (status != null) 'Status': status.toValue(),
      if (title != null) 'Title': title,
    };
  }
}

class GetRecoveryPointRestoreMetadataOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// This is the resource type associated with the recovery point.
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
      inferredMetadata: (json['InferredMetadata'] as Map<String, dynamic>)
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
          json['RestoreTestingPlan'] as Map<String, dynamic>),
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
          json['RestoreTestingSelection'] as Map<String, dynamic>),
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
  /// <code>FSX</code> for Amazon FSx
  /// </li>
  /// <li>
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for Storage Gateway
  /// </li>
  /// <li>
  /// <code>DocDB</code> for Amazon DocumentDB (with MongoDB compatibility)
  /// </li>
  /// <li>
  /// <code>Neptune</code> for Amazon Neptune
  /// </li>
  /// </ul>
  final List<String>? resourceTypes;

  GetSupportedResourceTypesOutput({
    this.resourceTypes,
  });

  factory GetSupportedResourceTypesOutput.fromJson(Map<String, dynamic> json) {
    return GetSupportedResourceTypesOutput(
      resourceTypes: (json['ResourceTypes'] as List?)
          ?.whereNotNull()
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

/// A legal hold is an administrative tool that helps prevent backups from being
/// deleted while under a hold. While the hold is in place, backups under a hold
/// cannot be deleted and lifecycle policies that would alter the backup status
/// (such as transition to cold storage) are delayed until the legal hold is
/// removed. A backup can have more than one legal hold. Legal holds are applied
/// to one or more backups (also known as recovery points). These backups can be
/// filtered by resource types and by resource IDs.
class LegalHold {
  /// This is the time in number format when legal hold was cancelled.
  final DateTime? cancellationDate;

  /// This is the time in number format when legal hold was created.
  final DateTime? creationDate;

  /// This is the description of a legal hold.
  final String? description;

  /// This is an Amazon Resource Number (ARN) that uniquely identifies the legal
  /// hold; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? legalHoldArn;

  /// ID of specific legal hold on one or more recovery points.
  final String? legalHoldId;

  /// This is the status of the legal hold. Statuses can be <code>ACTIVE</code>,
  /// <code>CREATING</code>, <code>CANCELED</code>, and <code>CANCELING</code>.
  final LegalHoldStatus? status;

  /// This is the title of a legal hold.
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
      status: (json['Status'] as String?)?.toLegalHoldStatus(),
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
      if (status != null) 'Status': status.toValue(),
      if (title != null) 'Title': title,
    };
  }
}

enum LegalHoldStatus {
  creating,
  active,
  canceling,
  canceled,
}

extension LegalHoldStatusValueExtension on LegalHoldStatus {
  String toValue() {
    switch (this) {
      case LegalHoldStatus.creating:
        return 'CREATING';
      case LegalHoldStatus.active:
        return 'ACTIVE';
      case LegalHoldStatus.canceling:
        return 'CANCELING';
      case LegalHoldStatus.canceled:
        return 'CANCELED';
    }
  }
}

extension LegalHoldStatusFromString on String {
  LegalHoldStatus toLegalHoldStatus() {
    switch (this) {
      case 'CREATING':
        return LegalHoldStatus.creating;
      case 'ACTIVE':
        return LegalHoldStatus.active;
      case 'CANCELING':
        return LegalHoldStatus.canceling;
      case 'CANCELED':
        return LegalHoldStatus.canceled;
    }
    throw Exception('$this is not known in enum LegalHoldStatus');
  }
}

/// Contains an array of <code>Transition</code> objects specifying how long in
/// days before a recovery point transitions to cold storage or is deleted.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, on the console, the “retention” setting must
/// be 90 days greater than the “transition to cold after days” setting. The
/// “transition to cold after days” setting cannot be changed after a backup has
/// been transitioned to cold.
///
/// Resource types that are able to be transitioned to cold storage are listed
/// in the "Lifecycle to cold storage" section of the <a
/// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
/// Feature availability by resource</a> table. Backup ignores this expression
/// for other resource types.
class Lifecycle {
  /// Specifies the number of days after creation that a recovery point is
  /// deleted. Must be greater than 90 days plus
  /// <code>MoveToColdStorageAfterDays</code>.
  final int? deleteAfterDays;

  /// Specifies the number of days after creation that a recovery point is moved
  /// to cold storage.
  final int? moveToColdStorageAfterDays;

  /// Optional Boolean. If this is true, this setting will instruct your backup
  /// plan to transition supported resources to archive (cold) storage tier in
  /// accordance with your lifecycle settings.
  final bool? optInToArchiveForSupportedResources;

  Lifecycle({
    this.deleteAfterDays,
    this.moveToColdStorageAfterDays,
    this.optInToArchiveForSupportedResources,
  });

  factory Lifecycle.fromJson(Map<String, dynamic> json) {
    return Lifecycle(
      deleteAfterDays: json['DeleteAfterDays'] as int?,
      moveToColdStorageAfterDays: json['MoveToColdStorageAfterDays'] as int?,
      optInToArchiveForSupportedResources:
          json['OptInToArchiveForSupportedResources'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteAfterDays = this.deleteAfterDays;
    final moveToColdStorageAfterDays = this.moveToColdStorageAfterDays;
    final optInToArchiveForSupportedResources =
        this.optInToArchiveForSupportedResources;
    return {
      if (deleteAfterDays != null) 'DeleteAfterDays': deleteAfterDays,
      if (moveToColdStorageAfterDays != null)
        'MoveToColdStorageAfterDays': moveToColdStorageAfterDays,
      if (optInToArchiveForSupportedResources != null)
        'OptInToArchiveForSupportedResources':
            optInToArchiveForSupportedResources,
    };
  }
}

class ListBackupJobSummariesOutput {
  /// This is the period that sets the boundaries for returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> for daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> for the aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> for aggregated job count for prior 14 days.
  /// </li>
  /// </ul>
  final String? aggregationPeriod;

  /// This request returns a summary that contains Region, Account, State,
  /// ResourceType, MessageCategory, StartTime, EndTime, and Count of included
  /// jobs.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListBackupPlansOutput {
  /// An array of backup plan list items containing metadata about your saved
  /// backup plans.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListCopyJobSummariesOutput {
  /// This is the period that sets the boundaries for returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> for daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> for the aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> for aggregated job count for prior 14 days.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListFrameworksOutput {
  /// A list of frameworks with details for each framework, including the
  /// framework name, Amazon Resource Name (ARN), description, number of controls,
  /// creation time, and deployment status.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
  /// This return is the next item following a partial list of returned resources.
  final String? nextToken;

  /// This is a list of the recovery points returned by
  /// <code>ListRecoveryPointsByLegalHold</code>.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

  /// A list of your report plans with detailed information for each plan. This
  /// information includes the Amazon Resource Name (ARN), report plan name,
  /// description, settings, delivery channel, deployment status, creation time,
  /// and last times the report plan attempted to and successfully ran.
  final List<ReportPlan>? reportPlans;

  ListReportPlansOutput({
    this.nextToken,
    this.reportPlans,
  });

  factory ListReportPlansOutput.fromJson(Map<String, dynamic> json) {
    return ListReportPlansOutput(
      nextToken: json['NextToken'] as String?,
      reportPlans: (json['ReportPlans'] as List?)
          ?.whereNotNull()
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

class ListRestoreJobSummariesOutput {
  /// This is the period that sets the boundaries for returned results.
  ///
  /// <ul>
  /// <li>
  /// <code>ONE_DAY</code> for daily job count for the prior 14 days.
  /// </li>
  /// <li>
  /// <code>SEVEN_DAYS</code> for the aggregated job count for the prior 7 days.
  /// </li>
  /// <li>
  /// <code>FOURTEEN_DAYS</code> for aggregated job count for prior 14 days.
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
          ?.whereNotNull()
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

class ListRestoreJobsByProtectedResourceOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows youto return more items in your list starting
  /// at the location pointed to by the next token
  final String? nextToken;

  /// An array of objects that contain detailed information about jobs to restore
  /// saved resources.&gt;
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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
      restoreTestingPlans: (json['RestoreTestingPlans'] as List)
          .whereNotNull()
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
      restoreTestingSelections: (json['RestoreTestingSelections'] as List)
          .whereNotNull()
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

class ListTagsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>MaxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// To help organize your resources, you can assign your own metadata to the
  /// resources you create. Each tag is a key-value pair.
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

/// A structure that contains information about a backed-up resource.
class ProtectedResource {
  /// The date and time a resource was last backed up, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastBackupTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastBackupTime;

  /// This is the ARN (Amazon Resource Name) of the backup vault that contains the
  /// most recent backup recovery point.
  final String? lastBackupVaultArn;

  /// This is the ARN (Amazon Resource Name) of the most recent recovery point.
  final String? lastRecoveryPointArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? resourceArn;

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
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

/// A list of conditions that you define for resources in your restore testing
/// plan using tags.
///
/// For example, <code>"StringEquals": { "Key": "aws:ResourceTag/CreatedByCryo",
/// "Value": "true" },</code>. Condition operators are case sensitive.
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
          ?.whereNotNull()
          .map((e) => KeyValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringNotEquals: (json['StringNotEquals'] as List?)
          ?.whereNotNull()
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

/// Contains detailed information about the recovery points stored in a backup
/// vault.
class RecoveryPointByBackupVault {
  /// The size, in bytes, of a backup.
  final int? backupSizeInBytes;

  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
  final String? backupVaultName;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  final CalculatedLifecycle? calculatedLifecycle;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

  /// This is the identifier of a resource within a composite group, such as
  /// nested (child) recovery point belonging to a composite (parent) stack. The
  /// ID is transferred from the <a
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

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

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
  /// Resource types that are able to be transitioned to cold storage are listed
  /// in the "Lifecycle to cold storage" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table. Backup ignores this expression
  /// for other resource types.
  final Lifecycle? lifecycle;

  /// This is the Amazon Resource Name (ARN) of the parent (composite) recovery
  /// point.
  final String? parentRecoveryPointArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
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

  /// A message explaining the reason of the recovery point deletion failure.
  final String? statusMessage;

  /// This is the type of vault in which the described recovery point is stored.
  final VaultType? vaultType;

  RecoveryPointByBackupVault({
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.calculatedLifecycle,
    this.completionDate,
    this.compositeMemberIdentifier,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.iamRoleArn,
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
      iamRoleArn: json['IamRoleArn'] as String?,
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
      status: (json['Status'] as String?)?.toRecoveryPointStatus(),
      statusMessage: json['StatusMessage'] as String?,
      vaultType: (json['VaultType'] as String?)?.toVaultType(),
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
    final iamRoleArn = this.iamRoleArn;
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
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
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
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vaultType != null) 'VaultType': vaultType.toValue(),
    };
  }
}

/// Contains detailed information about a saved recovery point.
class RecoveryPointByResource {
  /// The size, in bytes, of a backup.
  final int? backupSizeBytes;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the Amazon Web Services Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
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

  /// This is a boolean value indicating this is a parent (composite) recovery
  /// point.
  final bool? isParent;

  /// This is the Amazon Resource Name (ARN) of the parent (composite) recovery
  /// point.
  final String? parentRecoveryPointArn;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// This is the non-unique name of the resource that belongs to the specified
  /// backup.
  final String? resourceName;

  /// A status code specifying the state of the recovery point.
  final RecoveryPointStatus? status;

  /// A message explaining the reason of the recovery point deletion failure.
  final String? statusMessage;

  /// This is the type of vault in which the described recovery point is stored.
  final VaultType? vaultType;

  RecoveryPointByResource({
    this.backupSizeBytes,
    this.backupVaultName,
    this.creationDate,
    this.encryptionKeyArn,
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
      backupSizeBytes: json['BackupSizeBytes'] as int?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      isParent: json['IsParent'] as bool?,
      parentRecoveryPointArn: json['ParentRecoveryPointArn'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceName: json['ResourceName'] as String?,
      status: (json['Status'] as String?)?.toRecoveryPointStatus(),
      statusMessage: json['StatusMessage'] as String?,
      vaultType: (json['VaultType'] as String?)?.toVaultType(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupSizeBytes = this.backupSizeBytes;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final isParent = this.isParent;
    final parentRecoveryPointArn = this.parentRecoveryPointArn;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceName = this.resourceName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vaultType = this.vaultType;
    return {
      if (backupSizeBytes != null) 'BackupSizeBytes': backupSizeBytes,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (isParent != null) 'IsParent': isParent,
      if (parentRecoveryPointArn != null)
        'ParentRecoveryPointArn': parentRecoveryPointArn,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceName != null) 'ResourceName': resourceName,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (vaultType != null) 'VaultType': vaultType.toValue(),
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

  /// Version IDs are unique, randomly generated, Unicode, UTF-8 encoded strings
  /// that are at most 1,024 bytes long. They cannot be edited.
  final String? backupPlanVersion;

  /// Uniquely identifies a rule used to schedule the backup of a selection of
  /// resources.
  final String? backupRuleId;

  RecoveryPointCreator({
    this.backupPlanArn,
    this.backupPlanId,
    this.backupPlanVersion,
    this.backupRuleId,
  });

  factory RecoveryPointCreator.fromJson(Map<String, dynamic> json) {
    return RecoveryPointCreator(
      backupPlanArn: json['BackupPlanArn'] as String?,
      backupPlanId: json['BackupPlanId'] as String?,
      backupPlanVersion: json['BackupPlanVersion'] as String?,
      backupRuleId: json['BackupRuleId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupPlanArn = this.backupPlanArn;
    final backupPlanId = this.backupPlanId;
    final backupPlanVersion = this.backupPlanVersion;
    final backupRuleId = this.backupRuleId;
    return {
      if (backupPlanArn != null) 'BackupPlanArn': backupPlanArn,
      if (backupPlanId != null) 'BackupPlanId': backupPlanId,
      if (backupPlanVersion != null) 'BackupPlanVersion': backupPlanVersion,
      if (backupRuleId != null) 'BackupRuleId': backupRuleId,
    };
  }
}

/// This is a recovery point which is a child (nested) recovery point of a
/// parent (composite) recovery point. These recovery points can be
/// disassociated from their parent (composite) recovery point, in which case
/// they will no longer be a member.
class RecoveryPointMember {
  /// This is the name of the backup vault (the logical container in which backups
  /// are stored).
  final String? backupVaultName;

  /// This is the Amazon Resource Name (ARN) of the parent (composite) recovery
  /// point.
  final String? recoveryPointArn;

  /// This is the Amazon Resource Name (ARN) that uniquely identifies a saved
  /// resource.
  final String? resourceArn;

  /// This is the Amazon Web Services resource type that is saved as a recovery
  /// point.
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vaultNames: (json['VaultNames'] as List?)
          ?.whereNotNull()
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

enum RecoveryPointStatus {
  completed,
  partial,
  deleting,
  expired,
}

extension RecoveryPointStatusValueExtension on RecoveryPointStatus {
  String toValue() {
    switch (this) {
      case RecoveryPointStatus.completed:
        return 'COMPLETED';
      case RecoveryPointStatus.partial:
        return 'PARTIAL';
      case RecoveryPointStatus.deleting:
        return 'DELETING';
      case RecoveryPointStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension RecoveryPointStatusFromString on String {
  RecoveryPointStatus toRecoveryPointStatus() {
    switch (this) {
      case 'COMPLETED':
        return RecoveryPointStatus.completed;
      case 'PARTIAL':
        return RecoveryPointStatus.partial;
      case 'DELETING':
        return RecoveryPointStatus.deleting;
      case 'EXPIRED':
        return RecoveryPointStatus.expired;
    }
    throw Exception('$this is not known in enum RecoveryPointStatus');
  }
}

/// Contains information from your report plan about where to deliver your
/// reports, specifically your Amazon S3 bucket name, S3 key prefix, and the
/// formats of your reports.
class ReportDeliveryChannel {
  /// The unique name of the S3 bucket that receives your reports.
  final String s3BucketName;

  /// A list of the format of your reports: <code>CSV</code>, <code>JSON</code>,
  /// or both. If not specified, the default format is <code>CSV</code>.
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
      s3BucketName: json['S3BucketName'] as String,
      formats: (json['Formats'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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
      s3Keys: (json['S3Keys'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

/// Contains detailed information about a report setting.
class ReportSetting {
  /// Identifies the report template for the report. Reports are built using a
  /// report template. The report templates are:
  ///
  /// <code>RESOURCE_COMPLIANCE_REPORT | CONTROL_COMPLIANCE_REPORT |
  /// BACKUP_JOB_REPORT | COPY_JOB_REPORT | RESTORE_JOB_REPORT</code>
  final String reportTemplate;

  /// These are the accounts to be included in the report.
  final List<String>? accounts;

  /// The Amazon Resource Names (ARNs) of the frameworks a report covers.
  final List<String>? frameworkArns;

  /// The number of frameworks a report covers.
  final int? numberOfFrameworks;

  /// These are the Organizational Units to be included in the report.
  final List<String>? organizationUnits;

  /// These are the Regions to be included in the report.
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
      reportTemplate: json['ReportTemplate'] as String,
      accounts: (json['Accounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      frameworkArns: (json['FrameworkArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      numberOfFrameworks: json['NumberOfFrameworks'] as int?,
      organizationUnits: (json['OrganizationUnits'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      regions: (json['Regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
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

enum RestoreDeletionStatus {
  deleting,
  failed,
  successful,
}

extension RestoreDeletionStatusValueExtension on RestoreDeletionStatus {
  String toValue() {
    switch (this) {
      case RestoreDeletionStatus.deleting:
        return 'DELETING';
      case RestoreDeletionStatus.failed:
        return 'FAILED';
      case RestoreDeletionStatus.successful:
        return 'SUCCESSFUL';
    }
  }
}

extension RestoreDeletionStatusFromString on String {
  RestoreDeletionStatus toRestoreDeletionStatus() {
    switch (this) {
      case 'DELETING':
        return RestoreDeletionStatus.deleting;
      case 'FAILED':
        return RestoreDeletionStatus.failed;
      case 'SUCCESSFUL':
        return RestoreDeletionStatus.successful;
    }
    throw Exception('$this is not known in enum RestoreDeletionStatus');
  }
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

enum RestoreJobState {
  created,
  pending,
  running,
  aborted,
  completed,
  failed,
  aggregateAll,
  any,
}

extension RestoreJobStateValueExtension on RestoreJobState {
  String toValue() {
    switch (this) {
      case RestoreJobState.created:
        return 'CREATED';
      case RestoreJobState.pending:
        return 'PENDING';
      case RestoreJobState.running:
        return 'RUNNING';
      case RestoreJobState.aborted:
        return 'ABORTED';
      case RestoreJobState.completed:
        return 'COMPLETED';
      case RestoreJobState.failed:
        return 'FAILED';
      case RestoreJobState.aggregateAll:
        return 'AGGREGATE_ALL';
      case RestoreJobState.any:
        return 'ANY';
    }
  }
}

extension RestoreJobStateFromString on String {
  RestoreJobState toRestoreJobState() {
    switch (this) {
      case 'CREATED':
        return RestoreJobState.created;
      case 'PENDING':
        return RestoreJobState.pending;
      case 'RUNNING':
        return RestoreJobState.running;
      case 'ABORTED':
        return RestoreJobState.aborted;
      case 'COMPLETED':
        return RestoreJobState.completed;
      case 'FAILED':
        return RestoreJobState.failed;
      case 'AGGREGATE_ALL':
        return RestoreJobState.aggregateAll;
      case 'ANY':
        return RestoreJobState.any;
    }
    throw Exception('$this is not known in enum RestoreJobState');
  }
}

enum RestoreJobStatus {
  pending,
  running,
  completed,
  aborted,
  failed,
}

extension RestoreJobStatusValueExtension on RestoreJobStatus {
  String toValue() {
    switch (this) {
      case RestoreJobStatus.pending:
        return 'PENDING';
      case RestoreJobStatus.running:
        return 'RUNNING';
      case RestoreJobStatus.completed:
        return 'COMPLETED';
      case RestoreJobStatus.aborted:
        return 'ABORTED';
      case RestoreJobStatus.failed:
        return 'FAILED';
    }
  }
}

extension RestoreJobStatusFromString on String {
  RestoreJobStatus toRestoreJobStatus() {
    switch (this) {
      case 'PENDING':
        return RestoreJobStatus.pending;
      case 'RUNNING':
        return RestoreJobStatus.running;
      case 'COMPLETED':
        return RestoreJobStatus.completed;
      case 'ABORTED':
        return RestoreJobStatus.aborted;
      case 'FAILED':
        return RestoreJobStatus.failed;
    }
    throw Exception('$this is not known in enum RestoreJobStatus');
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
      state: (json['State'] as String?)?.toRestoreJobState(),
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
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// Contains metadata about a restore job.
class RestoreJobsListMember {
  /// The account ID that owns the restore job.
  final String? accountId;

  /// The size, in bytes, of the restored resource.
  final int? backupSizeInBytes;

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

  /// Specifies the IAM role ARN used to create the target recovery point; for
  /// example, <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String? iamRoleArn;

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

  /// A status code specifying the state of the job initiated by Backup to restore
  /// a recovery point.
  final RestoreJobStatus? status;

  /// A detailed message explaining the status of the job to restore a recovery
  /// point.
  final String? statusMessage;

  /// This is the status of validation run on the indicated restore job.
  final RestoreValidationStatus? validationStatus;

  /// This describes the status of validation run on the indicated restore job.
  final String? validationStatusMessage;

  RestoreJobsListMember({
    this.accountId,
    this.backupSizeInBytes,
    this.completionDate,
    this.createdBy,
    this.createdResourceArn,
    this.creationDate,
    this.deletionStatus,
    this.deletionStatusMessage,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.recoveryPointCreationDate,
    this.resourceType,
    this.restoreJobId,
    this.status,
    this.statusMessage,
    this.validationStatus,
    this.validationStatusMessage,
  });

  factory RestoreJobsListMember.fromJson(Map<String, dynamic> json) {
    return RestoreJobsListMember(
      accountId: json['AccountId'] as String?,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RestoreJobCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdResourceArn: json['CreatedResourceArn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      deletionStatus:
          (json['DeletionStatus'] as String?)?.toRestoreDeletionStatus(),
      deletionStatusMessage: json['DeletionStatusMessage'] as String?,
      expectedCompletionTimeMinutes:
          json['ExpectedCompletionTimeMinutes'] as int?,
      iamRoleArn: json['IamRoleArn'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      recoveryPointCreationDate:
          timeStampFromJson(json['RecoveryPointCreationDate']),
      resourceType: json['ResourceType'] as String?,
      restoreJobId: json['RestoreJobId'] as String?,
      status: (json['Status'] as String?)?.toRestoreJobStatus(),
      statusMessage: json['StatusMessage'] as String?,
      validationStatus:
          (json['ValidationStatus'] as String?)?.toRestoreValidationStatus(),
      validationStatusMessage: json['ValidationStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupSizeInBytes = this.backupSizeInBytes;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final createdResourceArn = this.createdResourceArn;
    final creationDate = this.creationDate;
    final deletionStatus = this.deletionStatus;
    final deletionStatusMessage = this.deletionStatusMessage;
    final expectedCompletionTimeMinutes = this.expectedCompletionTimeMinutes;
    final iamRoleArn = this.iamRoleArn;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final recoveryPointCreationDate = this.recoveryPointCreationDate;
    final resourceType = this.resourceType;
    final restoreJobId = this.restoreJobId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final validationStatus = this.validationStatus;
    final validationStatusMessage = this.validationStatusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdResourceArn != null) 'CreatedResourceArn': createdResourceArn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (deletionStatus != null) 'DeletionStatus': deletionStatus.toValue(),
      if (deletionStatusMessage != null)
        'DeletionStatusMessage': deletionStatusMessage,
      if (expectedCompletionTimeMinutes != null)
        'ExpectedCompletionTimeMinutes': expectedCompletionTimeMinutes,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (recoveryPointCreationDate != null)
        'RecoveryPointCreationDate':
            unixTimestampToJson(recoveryPointCreationDate),
      if (resourceType != null) 'ResourceType': resourceType,
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (validationStatus != null)
        'ValidationStatus': validationStatus.toValue(),
      if (validationStatusMessage != null)
        'ValidationStatusMessage': validationStatusMessage,
    };
  }
}

/// This contains metadata about a restore testing plan.
class RestoreTestingPlanForCreate {
  /// Required: Algorithm; Required: Recovery point types; IncludeVaults (one or
  /// more). Optional: SelectionWindowDays ('30' if not specified); ExcludeVaults
  /// (list of selectors), defaults to empty list if not listed.
  final RestoreTestingRecoveryPointSelection recoveryPointSelection;

  /// The RestoreTestingPlanName is a unique string that is the name of the
  /// restore testing plan. This cannot be changed after creation, and it must
  /// consist of only alphanumeric characters and underscores.
  final String restoreTestingPlanName;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed.
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

  /// This is the restore testing plan name.
  final String restoreTestingPlanName;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed.
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
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      recoveryPointSelection: RestoreTestingRecoveryPointSelection.fromJson(
          json['RecoveryPointSelection'] as Map<String, dynamic>),
      restoreTestingPlanArn: json['RestoreTestingPlanArn'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
      scheduleExpression: json['ScheduleExpression'] as String,
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

  /// This is the restore testing plan name.
  final String restoreTestingPlanName;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed.
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
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      restoreTestingPlanArn: json['RestoreTestingPlanArn'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
      scheduleExpression: json['ScheduleExpression'] as String,
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

/// This contains metadata about a restore testing plan.
class RestoreTestingPlanForUpdate {
  /// Required: <code>Algorithm</code>; <code>RecoveryPointTypes</code>;
  /// <code>IncludeVaults</code> (<i>one or more</i>).
  ///
  /// Optional: <i>SelectionWindowDays</i> (<i>'30' if not specified</i>);
  /// <code>ExcludeVaults</code> (defaults to empty list if not listed).
  final RestoreTestingRecoveryPointSelection? recoveryPointSelection;

  /// A CRON expression in specified timezone when a restore testing plan is
  /// executed.
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

/// Required: Algorithm; Required: Recovery point types; IncludeVaults(one or
/// more). Optional: SelectionWindowDays ('30' if not specified);ExcludeVaults
/// (list of selectors), defaults to empty list if not listed.
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
          ?.toRestoreTestingRecoveryPointSelectionAlgorithm(),
      excludeVaults: (json['ExcludeVaults'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      includeVaults: (json['IncludeVaults'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      recoveryPointTypes: (json['RecoveryPointTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRestoreTestingRecoveryPointType())
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
      if (algorithm != null) 'Algorithm': algorithm.toValue(),
      if (excludeVaults != null) 'ExcludeVaults': excludeVaults,
      if (includeVaults != null) 'IncludeVaults': includeVaults,
      if (recoveryPointTypes != null)
        'RecoveryPointTypes':
            recoveryPointTypes.map((e) => e.toValue()).toList(),
      if (selectionWindowDays != null)
        'SelectionWindowDays': selectionWindowDays,
    };
  }
}

enum RestoreTestingRecoveryPointSelectionAlgorithm {
  latestWithinWindow,
  randomWithinWindow,
}

extension RestoreTestingRecoveryPointSelectionAlgorithmValueExtension
    on RestoreTestingRecoveryPointSelectionAlgorithm {
  String toValue() {
    switch (this) {
      case RestoreTestingRecoveryPointSelectionAlgorithm.latestWithinWindow:
        return 'LATEST_WITHIN_WINDOW';
      case RestoreTestingRecoveryPointSelectionAlgorithm.randomWithinWindow:
        return 'RANDOM_WITHIN_WINDOW';
    }
  }
}

extension RestoreTestingRecoveryPointSelectionAlgorithmFromString on String {
  RestoreTestingRecoveryPointSelectionAlgorithm
      toRestoreTestingRecoveryPointSelectionAlgorithm() {
    switch (this) {
      case 'LATEST_WITHIN_WINDOW':
        return RestoreTestingRecoveryPointSelectionAlgorithm.latestWithinWindow;
      case 'RANDOM_WITHIN_WINDOW':
        return RestoreTestingRecoveryPointSelectionAlgorithm.randomWithinWindow;
    }
    throw Exception(
        '$this is not known in enum RestoreTestingRecoveryPointSelectionAlgorithm');
  }
}

enum RestoreTestingRecoveryPointType {
  continuous,
  snapshot,
}

extension RestoreTestingRecoveryPointTypeValueExtension
    on RestoreTestingRecoveryPointType {
  String toValue() {
    switch (this) {
      case RestoreTestingRecoveryPointType.continuous:
        return 'CONTINUOUS';
      case RestoreTestingRecoveryPointType.snapshot:
        return 'SNAPSHOT';
    }
  }
}

extension RestoreTestingRecoveryPointTypeFromString on String {
  RestoreTestingRecoveryPointType toRestoreTestingRecoveryPointType() {
    switch (this) {
      case 'CONTINUOUS':
        return RestoreTestingRecoveryPointType.continuous;
      case 'SNAPSHOT':
        return RestoreTestingRecoveryPointType.snapshot;
    }
    throw Exception(
        '$this is not known in enum RestoreTestingRecoveryPointType');
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

  /// This is the unique name of the restore testing selection that belongs to the
  /// related restore testing plan.
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

  /// This is amount of hours (1 to 168) available to run a validation script on
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

  /// This is the unique name of the restore testing selection that belongs to the
  /// related restore testing plan.
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
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      iamRoleArn: json['IamRoleArn'] as String,
      protectedResourceType: json['ProtectedResourceType'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
      restoreTestingSelectionName:
          json['RestoreTestingSelectionName'] as String,
      creatorRequestId: json['CreatorRequestId'] as String?,
      protectedResourceArns: (json['ProtectedResourceArns'] as List?)
          ?.whereNotNull()
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

/// This contains metadata about a restore testing selection.
class RestoreTestingSelectionForList {
  /// This is the date and time that a restore testing selection was created, in
  /// Unix format and Coordinated Universal Time (UTC). The value of
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
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      iamRoleArn: json['IamRoleArn'] as String,
      protectedResourceType: json['ProtectedResourceType'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
      restoreTestingSelectionName:
          json['RestoreTestingSelectionName'] as String,
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

  /// A list of conditions that you define for resources in your restore testing
  /// plan using tags.
  ///
  /// For example, <code>"StringEquals": { "Key": "aws:ResourceTag/CreatedByCryo",
  /// "Value": "true" },</code>. Condition operators are case sensitive.
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

enum RestoreValidationStatus {
  failed,
  successful,
  timedOut,
  validating,
}

extension RestoreValidationStatusValueExtension on RestoreValidationStatus {
  String toValue() {
    switch (this) {
      case RestoreValidationStatus.failed:
        return 'FAILED';
      case RestoreValidationStatus.successful:
        return 'SUCCESSFUL';
      case RestoreValidationStatus.timedOut:
        return 'TIMED_OUT';
      case RestoreValidationStatus.validating:
        return 'VALIDATING';
    }
  }
}

extension RestoreValidationStatusFromString on String {
  RestoreValidationStatus toRestoreValidationStatus() {
    switch (this) {
      case 'FAILED':
        return RestoreValidationStatus.failed;
      case 'SUCCESSFUL':
        return RestoreValidationStatus.successful;
      case 'TIMED_OUT':
        return RestoreValidationStatus.timedOut;
      case 'VALIDATING':
        return RestoreValidationStatus.validating;
    }
    throw Exception('$this is not known in enum RestoreValidationStatus');
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

enum StorageClass {
  warm,
  cold,
  deleted,
}

extension StorageClassValueExtension on StorageClass {
  String toValue() {
    switch (this) {
      case StorageClass.warm:
        return 'WARM';
      case StorageClass.cold:
        return 'COLD';
      case StorageClass.deleted:
        return 'DELETED';
    }
  }
}

extension StorageClassFromString on String {
  StorageClass toStorageClass() {
    switch (this) {
      case 'WARM':
        return StorageClass.warm;
      case 'COLD':
        return StorageClass.cold;
      case 'DELETED':
        return StorageClass.deleted;
    }
    throw Exception('$this is not known in enum StorageClass');
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

  /// Unique, randomly generated, Unicode, UTF-8 encoded strings that are at most
  /// 1,024 bytes long. Version Ids cannot be edited.
  final String? versionId;

  UpdateBackupPlanOutput({
    this.advancedBackupSettings,
    this.backupPlanArn,
    this.backupPlanId,
    this.creationDate,
    this.versionId,
  });

  factory UpdateBackupPlanOutput.fromJson(Map<String, dynamic> json) {
    return UpdateBackupPlanOutput(
      advancedBackupSettings: (json['AdvancedBackupSettings'] as List?)
          ?.whereNotNull()
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

class UpdateRecoveryPointLifecycleOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
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
  /// Resource types that are able to be transitioned to cold storage are listed
  /// in the "Lifecycle to cold storage" section of the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/whatisbackup.html#features-by-resource">
  /// Feature availability by resource</a> table. Backup ignores this expression
  /// for other resource types.
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
  /// This is the time the resource testing plan was created.
  final DateTime creationTime;

  /// Unique ARN (Amazon Resource Name) of the restore testing plan.
  final String restoreTestingPlanArn;

  /// The name cannot be changed after creation. The name consists of only
  /// alphanumeric characters and underscores. Maximum length is 50.
  final String restoreTestingPlanName;

  /// This is the time the update completed for the restore testing plan.
  final DateTime updateTime;

  UpdateRestoreTestingPlanOutput({
    required this.creationTime,
    required this.restoreTestingPlanArn,
    required this.restoreTestingPlanName,
    required this.updateTime,
  });

  factory UpdateRestoreTestingPlanOutput.fromJson(Map<String, dynamic> json) {
    return UpdateRestoreTestingPlanOutput(
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      restoreTestingPlanArn: json['RestoreTestingPlanArn'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
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
  /// This is the time the resource testing selection was updated successfully.
  final DateTime creationTime;

  /// Unique string that is the name of the restore testing plan.
  final String restoreTestingPlanArn;

  /// This is the restore testing plan with which the updated restore testing
  /// selection is associated.
  final String restoreTestingPlanName;

  /// This is the returned restore testing selection name.
  final String restoreTestingSelectionName;

  /// This is the time the update completed for the restore testing selection.
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
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      restoreTestingPlanArn: json['RestoreTestingPlanArn'] as String,
      restoreTestingPlanName: json['RestoreTestingPlanName'] as String,
      restoreTestingSelectionName:
          json['RestoreTestingSelectionName'] as String,
      updateTime: nonNullableTimeStampFromJson(json['UpdateTime'] as Object),
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

enum VaultState {
  creating,
  available,
  failed,
}

extension VaultStateValueExtension on VaultState {
  String toValue() {
    switch (this) {
      case VaultState.creating:
        return 'CREATING';
      case VaultState.available:
        return 'AVAILABLE';
      case VaultState.failed:
        return 'FAILED';
    }
  }
}

extension VaultStateFromString on String {
  VaultState toVaultState() {
    switch (this) {
      case 'CREATING':
        return VaultState.creating;
      case 'AVAILABLE':
        return VaultState.available;
      case 'FAILED':
        return VaultState.failed;
    }
    throw Exception('$this is not known in enum VaultState');
  }
}

enum VaultType {
  backupVault,
  logicallyAirGappedBackupVault,
}

extension VaultTypeValueExtension on VaultType {
  String toValue() {
    switch (this) {
      case VaultType.backupVault:
        return 'BACKUP_VAULT';
      case VaultType.logicallyAirGappedBackupVault:
        return 'LOGICALLY_AIR_GAPPED_BACKUP_VAULT';
    }
  }
}

extension VaultTypeFromString on String {
  VaultType toVaultType() {
    switch (this) {
      case 'BACKUP_VAULT':
        return VaultType.backupVault;
      case 'LOGICALLY_AIR_GAPPED_BACKUP_VAULT':
        return VaultType.logicallyAirGappedBackupVault;
    }
    throw Exception('$this is not known in enum VaultType');
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
