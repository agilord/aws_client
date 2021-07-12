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

/// AWS Backup is a unified backup service designed to protect AWS services and
/// their associated data. AWS Backup simplifies the creation, migration,
/// restoration, and deletion of backups, while also providing reporting and
/// auditing.
class Backup {
  final _s.RestJsonProtocol _protocol;
  Backup({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'backup',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a backup plan using a backup plan name and backup rules. A backup
  /// plan is a document that contains information that AWS Backup uses to
  /// schedule tasks that create recovery points for resources.
  ///
  /// If you call <code>CreateBackupPlan</code> with a plan that already exists,
  /// an <code>AlreadyExistsException</code> is returned.
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
  Future<CreateBackupPlanOutput> createBackupPlan({
    required BackupPlanInput backupPlan,
    Map<String, String>? backupPlanTags,
    String? creatorRequestId,
  }) async {
    ArgumentError.checkNotNull(backupPlan, 'backupPlan');
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
  /// backup plan. Resources can be included by specifying patterns for a
  /// <code>ListOfTags</code> and selected <code>Resources</code>.
  ///
  /// For example, consider the following patterns:
  ///
  /// <ul>
  /// <li>
  /// <code>Resources: "arn:aws:ec2:region:account-id:volume/volume-id"</code>
  /// </li>
  /// <li>
  /// <code>ConditionKey:"department"</code>
  ///
  /// <code>ConditionValue:"finance"</code>
  ///
  /// <code>ConditionType:"StringEquals"</code>
  /// </li>
  /// <li>
  /// <code>ConditionKey:"importance"</code>
  ///
  /// <code>ConditionValue:"critical"</code>
  ///
  /// <code>ConditionType:"StringEquals"</code>
  /// </li>
  /// </ul>
  /// Using these patterns would back up all Amazon Elastic Block Store (Amazon
  /// EBS) volumes that are tagged as <code>"department=finance"</code>,
  /// <code>"importance=critical"</code>, in addition to an EBS volume with the
  /// specified volume ID.
  ///
  /// Resources and conditions are additive in that all resources that match the
  /// pattern are selected. This shouldn't be confused with a logical AND, where
  /// all conditions must match. The matching patterns are logically put
  /// together using the OR operator. In other words, all patterns that match
  /// are selected for backup.
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
  /// be retried without the risk of running the operation twice.
  Future<CreateBackupSelectionOutput> createBackupSelection({
    required String backupPlanId,
    required BackupSelection backupSelection,
    String? creatorRequestId,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    ArgumentError.checkNotNull(backupSelection, 'backupSelection');
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
  /// Sensitive data, such as passport numbers, should not be included the name
  /// of a backup vault.
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
  /// and the AWS Region where they are created. They consist of letters,
  /// numbers, and hyphens.
  ///
  /// Parameter [backupVaultTags] :
  /// Metadata that you can assign to help organize the resources that you
  /// create. Each tag is a key-value pair.
  ///
  /// Parameter [creatorRequestId] :
  /// A unique string that identifies the request and allows failed requests to
  /// be retried without the risk of running the operation twice.
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
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
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
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
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
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    ArgumentError.checkNotNull(selectionId, 'selectionId');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<void> deleteBackupVault({
    required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<void> deleteBackupVaultAccessPolicy({
    required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/access-policy',
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
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the recovery point specified by a recovery point ID.
  ///
  /// If the recovery point ID belongs to a continuous backup, calling this
  /// endpoint deletes the existing continuous backup and stops future
  /// continuous backup.
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<void> deleteRecoveryPoint({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}',
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
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  Future<DescribeBackupJobOutput> describeBackupJob({
    required String backupJobId,
  }) async {
    ArgumentError.checkNotNull(backupJobId, 'backupJobId');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<DescribeBackupVaultOutput> describeBackupVault({
    required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/backup-vaults/${Uri.encodeComponent(backupVaultName)}',
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
    ArgumentError.checkNotNull(copyJobId, 'copyJobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/copy-jobs/${Uri.encodeComponent(copyJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeCopyJobOutput.fromJson(response);
  }

  /// Describes the global settings of the AWS account, including whether it is
  /// opted in to cross-account backup.
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
  /// backed up, its Amazon Resource Name (ARN), and the AWS service type of the
  /// saved resource.
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<DescribeRecoveryPointOutput> describeRecoveryPoint({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRecoveryPointOutput.fromJson(response);
  }

  /// Returns the current service opt-in settings for the Region. If
  /// service-opt-in is enabled for a service, AWS Backup tries to protect that
  /// service's resources in this Region, when the resource is included in an
  /// on-demand backup or scheduled backup plan. Otherwise, AWS Backup does not
  /// try to protect that service's resources in this Region, AWS Backup does
  /// not try to protect that service's resources in this Region.
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
    ArgumentError.checkNotNull(restoreJobId, 'restoreJobId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/restore-jobs/${Uri.encodeComponent(restoreJobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRestoreJobOutput.fromJson(response);
  }

  /// Deletes the specified continuous backup recovery point from AWS Backup and
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
  /// The unique name of an AWS Backup vault. Required.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies an AWS Backup
  /// recovery point. Required.
  Future<void> disassociateRecoveryPoint({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}/disassociate',
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
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
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
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
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
    ArgumentError.checkNotNull(
        backupPlanTemplateJson, 'backupPlanTemplateJson');
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
    ArgumentError.checkNotNull(backupPlanTemplateId, 'backupPlanTemplateId');
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
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
    ArgumentError.checkNotNull(selectionId, 'selectionId');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<GetBackupVaultAccessPolicyOutput> getBackupVaultAccessPolicy({
    required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  Future<GetBackupVaultNotificationsOutput> getBackupVaultNotifications({
    required String backupVaultName,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetBackupVaultNotificationsOutput.fromJson(response);
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  Future<GetRecoveryPointRestoreMetadataOutput>
      getRecoveryPointRestoreMetadata({
    required String backupVaultName,
    required String recoveryPointArn,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/backup-vaults/${Uri.encodeComponent(backupVaultName)}/recovery-points/${Uri.encodeComponent(recoveryPointArn)}/restore-metadata',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecoveryPointRestoreMetadataOutput.fromJson(response);
  }

  /// Returns the AWS resource types supported by AWS Backup.
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
  /// If used from an AWS Organizations management account, passing
  /// <code>*</code> returns all jobs across the organization.
  ///
  /// Parameter [byBackupVaultName] :
  /// Returns only backup jobs that will be stored in the specified backup
  /// vault. Backup vaults are identified by names that are unique to the
  /// account used to create them and the AWS Region where they are created.
  /// They consist of lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [byCreatedAfter] :
  /// Returns only backup jobs that were created after the specified date.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only backup jobs that were created before the specified date.
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
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
  /// </li>
  /// </ul>
  ///
  /// Parameter [byState] :
  /// Returns only backup jobs that are in the specified state.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupJobsOutput> listBackupJobs({
    String? byAccountId,
    String? byBackupVaultName,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
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
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
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
  /// a request is made to return <code>maxResults</code> number of items,
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
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupPlanVersionsOutput> listBackupPlanVersions({
    required String backupPlanId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
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

  /// Returns a list of existing backup plans for an authenticated account. The
  /// list is populated only if the advanced option is set for the backup plan.
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
  /// a request is made to return <code>maxResults</code> number of items,
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
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupSelectionsOutput> listBackupSelections({
    required String backupPlanId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
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
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListBackupVaultsOutput> listBackupVaults({
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
      requestUri: '/backup-vaults/',
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
  /// Parameter [byResourceArn] :
  /// Returns only copy jobs that match the specified resource Amazon Resource
  /// Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only backup jobs for the specified resources:
  ///
  /// <ul>
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
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
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
  /// a request is made to return maxResults number of items, NextToken allows
  /// you to return more items in your list starting at the location pointed to
  /// by the next token.
  Future<ListCopyJobsOutput> listCopyJobs({
    String? byAccountId,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
    String? byDestinationVaultArn,
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
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
      if (byDestinationVaultArn != null)
        'destinationVaultArn': [byDestinationVaultArn],
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

  /// Returns an array of resources successfully backed up by AWS Backup,
  /// including the time the resource was saved, an Amazon Resource Name (ARN)
  /// of the resource, and a resource type.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
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
  /// Parameter [byResourceArn] :
  /// Returns only recovery points that match the specified resource Amazon
  /// Resource Name (ARN).
  ///
  /// Parameter [byResourceType] :
  /// Returns only recovery points that match the specified resource type.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRecoveryPointsByBackupVaultOutput>
      listRecoveryPointsByBackupVault({
    required String backupVaultName,
    String? byBackupPlanId,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
    String? byResourceArn,
    String? byResourceType,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (byBackupPlanId != null) 'backupPlanId': [byBackupPlanId],
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
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

  /// Returns detailed information about recovery points of the type specified
  /// by a resource Amazon Resource Name (ARN).
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
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRecoveryPointsByResourceOutput> listRecoveryPointsByResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
          '/resources/${Uri.encodeComponent(resourceArn)}/recovery-points/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecoveryPointsByResourceOutput.fromJson(response);
  }

  /// Returns a list of jobs that AWS Backup initiated to restore a saved
  /// resource, including metadata about the recovery process.
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
  /// Parameter [byCreatedAfter] :
  /// Returns only restore jobs that were created after the specified date.
  ///
  /// Parameter [byCreatedBefore] :
  /// Returns only restore jobs that were created before the specified date.
  ///
  /// Parameter [byStatus] :
  /// Returns only restore jobs associated with the specified job status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned.
  ///
  /// Parameter [nextToken] :
  /// The next item following a partial list of returned items. For example, if
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListRestoreJobsOutput> listRestoreJobs({
    String? byAccountId,
    DateTime? byCreatedAfter,
    DateTime? byCreatedBefore,
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
      if (byCreatedAfter != null)
        'createdAfter': [_s.iso8601ToJson(byCreatedAfter).toString()],
      if (byCreatedBefore != null)
        'createdBefore': [_s.iso8601ToJson(byCreatedBefore).toString()],
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

  /// Returns a list of key-value pairs assigned to a target recovery point,
  /// backup plan, or backup vault.
  /// <note>
  /// <code>ListTags</code> are currently only supported with Amazon EFS
  /// backups.
  /// </note>
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
  /// a request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list
  /// starting at the location pointed to by the next token.
  Future<ListTagsOutput> listTags({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [policy] :
  /// The backup vault access policy document in JSON format.
  Future<void> putBackupVaultAccessPolicy({
    required String backupVaultName,
    String? policy,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
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
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
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
    ArgumentError.checkNotNull(backupVaultEvents, 'backupVaultEvents');
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    ArgumentError.checkNotNull(sNSTopicArn, 'sNSTopicArn');
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
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
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
  /// available for Windows VSS backup jobs.
  ///
  /// Valid values: Set to <code>"WindowsVSS”:“enabled"</code> to enable
  /// WindowsVSS backup option and create a VSS Windows backup. Set to
  /// “WindowsVSS”:”disabled” to create a regular backup. The WindowsVSS option
  /// is not enabled by default.
  ///
  /// Parameter [completeWindowMinutes] :
  /// A value in minutes during which a successfully started backup must
  /// complete, or else AWS Backup will cancel the job. This value is optional.
  /// This value begins counting down from when the backup was scheduled. It
  /// does not add additional time for <code>StartWindowMinutes</code>, or if
  /// the backup started later than scheduled.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer chosen string that can be used to distinguish between calls to
  /// <code>StartBackupJob</code>.
  ///
  /// Parameter [lifecycle] :
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  ///
  /// Only Amazon EFS file system backups can be transitioned to cold storage.
  ///
  /// Parameter [recoveryPointTags] :
  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair.
  ///
  /// Parameter [startWindowMinutes] :
  /// A value in minutes after a backup is scheduled before a job will be
  /// canceled if it doesn't start successfully. This value is optional, and the
  /// default is 8 hours.
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
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// create them and the AWS Region where they are created. They consist of
  /// lowercase letters, numbers, and hyphens.
  ///
  /// Parameter [idempotencyToken] :
  /// A customer chosen string that can be used to distinguish between calls to
  /// <code>StartCopyJob</code>.
  Future<StartCopyJobOutput> startCopyJob({
    required String destinationBackupVaultArn,
    required String iamRoleArn,
    required String recoveryPointArn,
    required String sourceBackupVaultName,
    String? idempotencyToken,
    Lifecycle? lifecycle,
  }) async {
    ArgumentError.checkNotNull(
        destinationBackupVaultArn, 'destinationBackupVaultArn');
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    ArgumentError.checkNotNull(sourceBackupVaultName, 'sourceBackupVaultName');
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

  /// Recovers the saved resource identified by an Amazon Resource Name (ARN).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [iamRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that AWS Backup uses to
  /// create the target recovery point; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
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
  /// backed up by AWS Backup. Returned in
  /// <code>GetRecoveryPointRestoreMetadata</code>.
  /// </li>
  /// <li>
  /// <code>Encrypted</code>: A Boolean value that, if true, specifies that the
  /// file system is encrypted. If <code>KmsKeyId</code> is specified,
  /// <code>Encrypted</code> must be set to <code>true</code>.
  /// </li>
  /// <li>
  /// <code>KmsKeyId</code>: Specifies the AWS KMS key that is used to encrypt
  /// the restored file system. You can specify a key from another AWS account
  /// provided that key it is properly shared with your account via AWS KMS.
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
  /// <code>ItemsToRestore </code>: An array of one to five strings where each
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
  /// Parameter [idempotencyToken] :
  /// A customer chosen string that can be used to distinguish between calls to
  /// <code>StartRestoreJob</code>.
  ///
  /// Parameter [resourceType] :
  /// Starts a job to restore a recovery point for one of the following
  /// resources:
  ///
  /// <ul>
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
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
  /// </li>
  /// </ul>
  Future<StartRestoreJobOutput> startRestoreJob({
    required String iamRoleArn,
    required Map<String, String> metadata,
    required String recoveryPointArn,
    String? idempotencyToken,
    String? resourceType,
  }) async {
    ArgumentError.checkNotNull(iamRoleArn, 'iamRoleArn');
    ArgumentError.checkNotNull(metadata, 'metadata');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
    final $payload = <String, dynamic>{
      'IamRoleArn': iamRoleArn,
      'Metadata': metadata,
      'RecoveryPointArn': recoveryPointArn,
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
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupJobId] :
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  Future<void> stopBackupJob({
    required String backupJobId,
  }) async {
    ArgumentError.checkNotNull(backupJobId, 'backupJobId');
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
  /// assign your own metadata to the resources you create.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeyList, 'tagKeyList');
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
    ArgumentError.checkNotNull(backupPlan, 'backupPlan');
    ArgumentError.checkNotNull(backupPlanId, 'backupPlanId');
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

  /// Updates the current global settings for the AWS account. Use the
  /// <code>DescribeGlobalSettings</code> API to determine the current settings.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
  /// May throw [InvalidRequestException].
  ///
  /// Parameter [globalSettings] :
  /// A list of resources along with the opt-in preferences for the account.
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
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  ///
  /// Only Amazon EFS file system backups can be transitioned to cold storage.
  ///
  /// Does not support continuous backups.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [backupVaultName] :
  /// The name of a logical container where backups are stored. Backup vaults
  /// are identified by names that are unique to the account used to create them
  /// and the AWS Region where they are created. They consist of lowercase
  /// letters, numbers, and hyphens.
  ///
  /// Parameter [recoveryPointArn] :
  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point;
  /// for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  ///
  /// Parameter [lifecycle] :
  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup
  /// has been transitioned to cold.
  Future<UpdateRecoveryPointLifecycleOutput> updateRecoveryPointLifecycle({
    required String backupVaultName,
    required String recoveryPointArn,
    Lifecycle? lifecycle,
  }) async {
    ArgumentError.checkNotNull(backupVaultName, 'backupVaultName');
    ArgumentError.checkNotNull(recoveryPointArn, 'recoveryPointArn');
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

  /// Updates the current service opt-in settings for the Region. If
  /// service-opt-in is enabled for a service, AWS Backup tries to protect that
  /// service's resources in this Region, when the resource is included in an
  /// on-demand backup or scheduled backup plan. Otherwise, AWS Backup does not
  /// try to protect that service's resources in this Region. Use the
  /// <code>DescribeRegionSettings</code> API to determine the resource types
  /// that are supported.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [MissingParameterValueException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [resourceTypeOptInPreference] :
  /// Updates the list of services along with the opt-in preferences for the
  /// Region.
  Future<void> updateRegionSettings({
    Map<String, bool>? resourceTypeOptInPreference,
  }) async {
    final $payload = <String, dynamic>{
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
}

/// A list of backup options for each resource type.
class AdvancedBackupSetting {
  /// Specifies the backup option for a selected resource. This option is only
  /// available for Windows VSS backup jobs.
  ///
  /// Valid values:
  ///
  /// Set to <code>"WindowsVSS":"enabled"</code> to enable the WindowsVSS backup
  /// option and create a VSS Windows backup.
  ///
  /// Set to <code>"WindowsVSS":"disabled"</code> to create a regular backup. The
  /// WindowsVSS option is not enabled by default.
  ///
  /// If you specify an invalid option, you get an
  /// <code>InvalidParameterValueException</code> exception.
  ///
  /// For more information about Windows VSS backups, see <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/windows-backups.html">Creating
  /// a VSS-Enabled Windows Backup</a>.
  final Map<String, String>? backupOptions;

  /// Specifies an object containing resource type and backup options. The only
  /// supported resource type is Amazon EC2 instances with Windows VSS. For an
  /// CloudFormation example, see the <a
  /// href="https://docs.aws.amazon.com/aws-backup/latest/devguide/integrate-cloudformation-with-aws-backup.html">sample
  /// CloudFormation template to enable Windows VSS</a> in the <i>AWS Backup User
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

/// Contains detailed information about a backup job.
class BackupJob {
  /// The account ID that owns the backup job.
  final String? accountId;

  /// Uniquely identifies a request to AWS Backup to back up a resource.
  final String? backupJobId;

  /// Specifies the backup option for a selected resource. This option is only
  /// available for Windows VSS backup jobs.
  ///
  /// Valid values: Set to <code>"WindowsVSS”:“enabled"</code> to enable
  /// WindowsVSS backup option and create a VSS Windows backup. Set to
  /// “WindowsVSS”:”disabled” to create a regular backup. If you specify an
  /// invalid option, you get an <code>InvalidParameterValueException</code>
  /// exception.
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
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
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

  /// Contains an estimated percentage complete of a job at the time the job
  /// status was queried.
  final String? percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// The type of AWS resource to be backed up; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database. For VSS Windows backups, the only supported resource
  /// type is Amazon EC2.
  final String? resourceType;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC) when
  /// a backup job must be started before it is canceled. The value is calculated
  /// by adding the start window to the scheduled time. So if the scheduled time
  /// were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time
  /// would be 8:00 PM on the date specified. The value of <code>StartBy</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startBy;

  /// The current state of a resource recovery point.
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
    this.percentDone,
    this.recoveryPointArn,
    this.resourceArn,
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
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
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
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
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
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
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
}

extension on BackupJobState {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum BackupJobState');
  }
}

/// Contains an optional backup plan display name and an array of
/// <code>BackupRule</code> objects, each of which specifies a backup rule. Each
/// rule in a backup plan is a separate scheduled task and can back up a
/// different selection of AWS resources.
class BackupPlan {
  /// The display name of a backup plan.
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
/// rule in a backup plan is a separate scheduled task and can back up a
/// different selection of AWS resources.
class BackupPlanInput {
  /// The optional display name of a backup plan.
  final String backupPlanName;

  /// An array of <code>BackupRule</code> objects, each of which specifies a
  /// scheduled task that is used to back up a selection of resources.
  final List<BackupRuleInput> rules;

  /// Specifies a list of <code>BackupOptions</code> for each resource type. These
  /// settings are only available for Windows VSS backup jobs.
  final List<AdvancedBackupSetting>? advancedBackupSettings;

  BackupPlanInput({
    required this.backupPlanName,
    required this.rules,
    this.advancedBackupSettings,
  });

  factory BackupPlanInput.fromJson(Map<String, dynamic> json) {
    return BackupPlanInput(
      backupPlanName: json['BackupPlanName'] as String,
      rules: (json['Rules'] as List)
          .whereNotNull()
          .map((e) => BackupRuleInput.fromJson(e as Map<String, dynamic>))
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
  /// retried without the risk of running the operation twice.
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
  /// An optional display name for a backup rule.
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String targetBackupVaultName;

  /// A value in minutes after a backup job is successfully started before it must
  /// be completed or it will be canceled by AWS Backup. This value is optional.
  final int? completionWindowMinutes;

  /// An array of <code>CopyAction</code> objects, which contains the details of
  /// the copy operation.
  final List<CopyAction>? copyActions;

  /// Specifies whether AWS Backup creates continuous backups. True causes AWS
  /// Backup to create continuous backups capable of point-in-time restore (PITR).
  /// False (or not specified) causes AWS Backup to create snapshot backups.
  final bool? enableContinuousBackup;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  ///
  /// Only Amazon EFS file system backups can be transitioned to cold storage.
  final Lifecycle? lifecycle;

  /// An array of key-value pair strings that are assigned to resources that are
  /// associated with this rule when restored from backup.
  final Map<String, String>? recoveryPointTags;

  /// Uniquely identifies a rule that is used to schedule the backup of a
  /// selection of resources.
  final String? ruleId;

  /// A CRON expression specifying when AWS Backup initiates a backup job. For
  /// more information about cron expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html">Schedule
  /// Expressions for Rules</a> in the <i>Amazon CloudWatch Events User
  /// Guide.</i>. Prior to specifying a value for this parameter, we recommend
  /// testing your cron expression using one of the many available cron generator
  /// and testing tools.
  final String? scheduleExpression;

  /// A value in minutes after a backup is scheduled before a job will be canceled
  /// if it doesn't start successfully. This value is optional.
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
      if (startWindowMinutes != null) 'StartWindowMinutes': startWindowMinutes,
    };
  }
}

/// Specifies a scheduled task used to back up a selection of resources.
class BackupRuleInput {
  /// An optional display name for a backup rule.
  final String ruleName;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String targetBackupVaultName;

  /// A value in minutes after a backup job is successfully started before it must
  /// be completed or it will be canceled by AWS Backup. This value is optional.
  final int? completionWindowMinutes;

  /// An array of <code>CopyAction</code> objects, which contains the details of
  /// the copy operation.
  final List<CopyAction>? copyActions;

  /// Specifies whether AWS Backup creates continuous backups. True causes AWS
  /// Backup to create continuous backups capable of point-in-time restore (PITR).
  /// False (or not specified) causes AWS Backup to create snapshot backups.
  final bool? enableContinuousBackup;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup will transition and expire backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  ///
  /// Only Amazon EFS file system backups can be transitioned to cold storage.
  final Lifecycle? lifecycle;

  /// To help organize your resources, you can assign your own metadata to the
  /// resources that you create. Each tag is a key-value pair.
  final Map<String, String>? recoveryPointTags;

  /// A CRON expression specifying when AWS Backup initiates a backup job.
  final String? scheduleExpression;

  /// A value in minutes after a backup is scheduled before a job will be canceled
  /// if it doesn't start successfully. This value is optional.
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
    this.startWindowMinutes,
  });

  factory BackupRuleInput.fromJson(Map<String, dynamic> json) {
    return BackupRuleInput(
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
      scheduleExpression: json['ScheduleExpression'] as String?,
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
    final scheduleExpression = this.scheduleExpression;
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
      if (startWindowMinutes != null) 'StartWindowMinutes': startWindowMinutes,
    };
  }
}

/// Used to specify a set of resources to a backup plan.
class BackupSelection {
  /// The ARN of the IAM role that AWS Backup uses to authenticate when backing up
  /// the target resource; for example,
  /// <code>arn:aws:iam::123456789012:role/S3Access</code>.
  final String iamRoleArn;

  /// The display name of a resource selection document.
  final String selectionName;

  /// An array of conditions used to specify a set of resources to assign to a
  /// backup plan; for example, <code>"StringEquals":
  /// {"ec2:ResourceTag/Department": "accounting"</code>. Assigns the backup plan
  /// to every resource with at least one matching tag.
  final List<Condition>? listOfTags;

  /// An array of strings that contain Amazon Resource Names (ARNs) of resources
  /// to assign to a backup plan.
  final List<String>? resources;

  BackupSelection({
    required this.iamRoleArn,
    required this.selectionName,
    this.listOfTags,
    this.resources,
  });

  factory BackupSelection.fromJson(Map<String, dynamic> json) {
    return BackupSelection(
      iamRoleArn: json['IamRoleArn'] as String,
      selectionName: json['SelectionName'] as String,
      listOfTags: (json['ListOfTags'] as List?)
          ?.whereNotNull()
          .map((e) => Condition.fromJson(e as Map<String, dynamic>))
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
    final listOfTags = this.listOfTags;
    final resources = this.resources;
    return {
      'IamRoleArn': iamRoleArn,
      'SelectionName': selectionName,
      if (listOfTags != null) 'ListOfTags': listOfTags,
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
  /// retried without the risk of running the operation twice.
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
}

extension on BackupVaultEvent {
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
    }
  }
}

extension on String {
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
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String? backupVaultName;

  /// The date and time a resource backup is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// A unique string that identifies the request and allows failed requests to be
  /// retried without the risk of running the operation twice.
  final String? creatorRequestId;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  final String? encryptionKeyArn;

  /// The number of recovery points that are stored in a backup vault.
  final int? numberOfRecoveryPoints;

  BackupVaultListMember({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.numberOfRecoveryPoints,
  });

  factory BackupVaultListMember.fromJson(Map<String, dynamic> json) {
    return BackupVaultListMember(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final encryptionKeyArn = this.encryptionKeyArn;
    final numberOfRecoveryPoints = this.numberOfRecoveryPoints;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (numberOfRecoveryPoints != null)
        'NumberOfRecoveryPoints': numberOfRecoveryPoints,
    };
  }
}

/// Contains <code>DeleteAt</code> and <code>MoveToColdStorageAt</code>
/// timestamps, which are used to specify a lifecycle for a recovery point.
///
/// The lifecycle defines when a protected resource is transitioned to cold
/// storage and when it expires. AWS Backup transitions and expires backups
/// automatically according to the lifecycle that you define.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, the “expire after days” setting must be 90
/// days greater than the “transition to cold after days” setting. The
/// “transition to cold after days” setting cannot be changed after a backup has
/// been transitioned to cold.
///
/// Only Amazon EFS file system backups can be transitioned to cold storage.
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

/// Contains an array of triplets made up of a condition type (such as
/// <code>StringEquals</code>), a key, and a value. Conditions are used to
/// filter resources in a selection that is assigned to a backup plan.
class Condition {
  /// The key in a key-value pair. For example, in
  /// <code>"ec2:ResourceTag/Department": "accounting"</code>,
  /// <code>"ec2:ResourceTag/Department"</code> is the key.
  final String conditionKey;

  /// An operation, such as <code>StringEquals</code>, that is applied to a
  /// key-value pair used to filter resources in a selection.
  final ConditionType conditionType;

  /// The value in a key-value pair. For example, in
  /// <code>"ec2:ResourceTag/Department": "accounting"</code>,
  /// <code>"accounting"</code> is the value.
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

enum ConditionType {
  stringequals,
}

extension on ConditionType {
  String toValue() {
    switch (this) {
      case ConditionType.stringequals:
        return 'STRINGEQUALS';
    }
  }
}

extension on String {
  ConditionType toConditionType() {
    switch (this) {
      case 'STRINGEQUALS':
        return ConditionType.stringequals;
    }
    throw Exception('$this is not known in enum ConditionType');
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

  /// The date and time a copy job is completed, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CompletionDate</code> is accurate
  /// to milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

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

  /// The AWS resource to be copied; for example, an Amazon Elastic Block Store
  /// (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS)
  /// database.
  final String? resourceArn;

  /// The type of AWS resource to be copied; for example, an Amazon Elastic Block
  /// Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon
  /// RDS) database.
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
    this.completionDate,
    this.copyJobId,
    this.createdBy,
    this.creationDate,
    this.destinationBackupVaultArn,
    this.destinationRecoveryPointArn,
    this.iamRoleArn,
    this.resourceArn,
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
      completionDate: timeStampFromJson(json['CompletionDate']),
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
      resourceArn: json['ResourceArn'] as String?,
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
    final completionDate = this.completionDate;
    final copyJobId = this.copyJobId;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final destinationBackupVaultArn = this.destinationBackupVaultArn;
    final destinationRecoveryPointArn = this.destinationRecoveryPointArn;
    final iamRoleArn = this.iamRoleArn;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    final sourceBackupVaultArn = this.sourceBackupVaultArn;
    final sourceRecoveryPointArn = this.sourceRecoveryPointArn;
    final state = this.state;
    final statusMessage = this.statusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (copyJobId != null) 'CopyJobId': copyJobId,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (destinationBackupVaultArn != null)
        'DestinationBackupVaultArn': destinationBackupVaultArn,
      if (destinationRecoveryPointArn != null)
        'DestinationRecoveryPointArn': destinationRecoveryPointArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
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
}

extension on CopyJobState {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum CopyJobState');
  }
}

class CreateBackupPlanOutput {
  /// A list of <code>BackupOptions</code> settings for a resource type. This
  /// option is only available for Windows VSS backup jobs.
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

  /// Uniquely identifies a request to AWS Backup to back up a resource.
  final String? backupJobId;

  /// Represents the options specified as part of backup plan or on-demand backup
  /// job.
  final Map<String, String>? backupOptions;

  /// The size, in bytes, of a backup.
  final int? backupSizeInBytes;

  /// Represents the actual backup type selected for a backup job. For example, if
  /// a successful WindowsVSS backup was taken, <code>BackupType</code> returns
  /// "WindowsVSS". If <code>BackupType</code> is empty, then the backup type that
  /// was is a regular backup.
  final String? backupType;

  /// An Amazon Resource Name (ARN) that uniquely identifies a backup vault; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String? backupVaultName;

  /// The size in bytes transferred to a backup vault at the time that the job
  /// status was queried.
  final int? bytesTransferred;

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

  /// Contains an estimated percentage that is complete of a job at the time the
  /// job status was queried.
  final String? percentDone;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  final String? resourceArn;

  /// The type of AWS resource to be backed up; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database.
  final String? resourceType;

  /// Specifies the time in Unix format and Coordinated Universal Time (UTC) when
  /// a backup job must be started before it is canceled. The value is calculated
  /// by adding the start window to the scheduled time. So if the scheduled time
  /// were 6:00 PM and the start window is 2 hours, the <code>StartBy</code> time
  /// would be 8:00 PM on the date specified. The value of <code>StartBy</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? startBy;

  /// The current state of a resource recovery point.
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
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.expectedCompletionDate,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.resourceArn,
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
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      expectedCompletionDate: timeStampFromJson(json['ExpectedCompletionDate']),
      iamRoleArn: json['IamRoleArn'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
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
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
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
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
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
  /// retried without the risk of running the operation twice.
  final String? creatorRequestId;

  /// The server-side encryption key that is used to protect your backups; for
  /// example,
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  final String? encryptionKeyArn;

  /// The number of recovery points that are stored in a backup vault.
  final int? numberOfRecoveryPoints;

  DescribeBackupVaultOutput({
    this.backupVaultArn,
    this.backupVaultName,
    this.creationDate,
    this.creatorRequestId,
    this.encryptionKeyArn,
    this.numberOfRecoveryPoints,
  });

  factory DescribeBackupVaultOutput.fromJson(Map<String, dynamic> json) {
    return DescribeBackupVaultOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      creatorRequestId: json['CreatorRequestId'] as String?,
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      numberOfRecoveryPoints: json['NumberOfRecoveryPoints'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final creatorRequestId = this.creatorRequestId;
    final encryptionKeyArn = this.encryptionKeyArn;
    final numberOfRecoveryPoints = this.numberOfRecoveryPoints;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (creatorRequestId != null) 'CreatorRequestId': creatorRequestId,
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (numberOfRecoveryPoints != null)
        'NumberOfRecoveryPoints': numberOfRecoveryPoints,
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

class DescribeGlobalSettingsOutput {
  /// A list of resources along with the opt-in preferences for the account.
  final Map<String, String>? globalSettings;

  /// The date and time that the global settings were last updated. This update is
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

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// The type of AWS resource saved as a recovery point; for example, an EBS
  /// volume or an Amazon RDS database.
  final String? resourceType;

  DescribeProtectedResourceOutput({
    this.lastBackupTime,
    this.resourceArn,
    this.resourceType,
  });

  factory DescribeProtectedResourceOutput.fromJson(Map<String, dynamic> json) {
    return DescribeProtectedResourceOutput(
      lastBackupTime: timeStampFromJson(json['LastBackupTime']),
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastBackupTime = this.lastBackupTime;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    return {
      if (lastBackupTime != null)
        'LastBackupTime': unixTimestampToJson(lastBackupTime),
      if (resourceArn != null) 'ResourceArn': resourceArn,
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

  /// The date and time that a recovery point was last restored, in Unix format
  /// and Coordinated Universal Time (UTC). The value of
  /// <code>LastRestoreTime</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastRestoreTime;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups that are transitioned to cold storage must be stored in cold storage
  /// for a minimum of 90 days. Therefore, the “expire after days” setting must be
  /// 90 days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  ///
  /// Only Amazon EFS file system backups can be transitioned to cold storage.
  final Lifecycle? lifecycle;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// An ARN that uniquely identifies a saved resource. The format of the ARN
  /// depends on the resource type.
  final String? resourceArn;

  /// The type of AWS resource to save as a recovery point; for example, an Amazon
  /// Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database
  /// Service (Amazon RDS) database.
  final String? resourceType;

  /// An Amazon Resource Name (ARN) that uniquely identifies the source vault
  /// where the resource was originally backed up in; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:BackupVault</code>. If the
  /// recovery is restored to the same AWS account or Region, this value will be
  /// <code>null</code>.
  final String? sourceBackupVaultArn;

  /// A status code specifying the state of the recovery point.
  /// <note>
  /// A partial status indicates that the recovery point was not successfully
  /// re-created and must be retried.
  /// </note>
  final RecoveryPointStatus? status;

  /// Specifies the storage class of the recovery point. Valid values are
  /// <code>WARM</code> or <code>COLD</code>.
  final StorageClass? storageClass;

  DescribeRecoveryPointOutput({
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.calculatedLifecycle,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.iamRoleArn,
    this.isEncrypted,
    this.lastRestoreTime,
    this.lifecycle,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceType,
    this.sourceBackupVaultArn,
    this.status,
    this.storageClass,
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
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      isEncrypted: json['IsEncrypted'] as bool?,
      lastRestoreTime: timeStampFromJson(json['LastRestoreTime']),
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
      sourceBackupVaultArn: json['SourceBackupVaultArn'] as String?,
      status: (json['Status'] as String?)?.toRecoveryPointStatus(),
      storageClass: (json['StorageClass'] as String?)?.toStorageClass(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final calculatedLifecycle = this.calculatedLifecycle;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final iamRoleArn = this.iamRoleArn;
    final isEncrypted = this.isEncrypted;
    final lastRestoreTime = this.lastRestoreTime;
    final lifecycle = this.lifecycle;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    final sourceBackupVaultArn = this.sourceBackupVaultArn;
    final status = this.status;
    final storageClass = this.storageClass;
    return {
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (calculatedLifecycle != null)
        'CalculatedLifecycle': calculatedLifecycle,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (isEncrypted != null) 'IsEncrypted': isEncrypted,
      if (lastRestoreTime != null)
        'LastRestoreTime': unixTimestampToJson(lastRestoreTime),
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceType != null) 'ResourceType': resourceType,
      if (sourceBackupVaultArn != null)
        'SourceBackupVaultArn': sourceBackupVaultArn,
      if (status != null) 'Status': status.toValue(),
      if (storageClass != null) 'StorageClass': storageClass.toValue(),
    };
  }
}

class DescribeRegionSettingsOutput {
  /// Returns a list of all services along with the opt-in preferences in the
  /// Region.
  final Map<String, bool>? resourceTypeOptInPreference;

  DescribeRegionSettingsOutput({
    this.resourceTypeOptInPreference,
  });

  factory DescribeRegionSettingsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeRegionSettingsOutput(
      resourceTypeOptInPreference:
          (json['ResourceTypeOptInPreference'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as bool)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceTypeOptInPreference = this.resourceTypeOptInPreference;
    return {
      if (resourceTypeOptInPreference != null)
        'ResourceTypeOptInPreference': resourceTypeOptInPreference,
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

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource whose
  /// recovery point is being restored. The format of the ARN depends on the
  /// resource type of the backed-up resource.
  final String? createdResourceArn;

  /// The date and time that a restore job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

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

  /// Returns metadata associated with a restore job listed by resource type.
  final String? resourceType;

  /// Uniquely identifies the job that restores a recovery point.
  final String? restoreJobId;

  /// Status code specifying the state of the job that is initiated by AWS Backup
  /// to restore a recovery point.
  final RestoreJobStatus? status;

  /// A message showing the status of a job to restore a recovery point.
  final String? statusMessage;

  DescribeRestoreJobOutput({
    this.accountId,
    this.backupSizeInBytes,
    this.completionDate,
    this.createdResourceArn,
    this.creationDate,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.resourceType,
    this.restoreJobId,
    this.status,
    this.statusMessage,
  });

  factory DescribeRestoreJobOutput.fromJson(Map<String, dynamic> json) {
    return DescribeRestoreJobOutput(
      accountId: json['AccountId'] as String?,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdResourceArn: json['CreatedResourceArn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      expectedCompletionTimeMinutes:
          json['ExpectedCompletionTimeMinutes'] as int?,
      iamRoleArn: json['IamRoleArn'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceType: json['ResourceType'] as String?,
      restoreJobId: json['RestoreJobId'] as String?,
      status: (json['Status'] as String?)?.toRestoreJobStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupSizeInBytes = this.backupSizeInBytes;
    final completionDate = this.completionDate;
    final createdResourceArn = this.createdResourceArn;
    final creationDate = this.creationDate;
    final expectedCompletionTimeMinutes = this.expectedCompletionTimeMinutes;
    final iamRoleArn = this.iamRoleArn;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceType = this.resourceType;
    final restoreJobId = this.restoreJobId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdResourceArn != null) 'CreatedResourceArn': createdResourceArn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (expectedCompletionTimeMinutes != null)
        'ExpectedCompletionTimeMinutes': expectedCompletionTimeMinutes,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceType != null) 'ResourceType': resourceType,
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
      if (status != null) 'Status': status.toValue(),
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

class GetRecoveryPointRestoreMetadataOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// The set of metadata key-value pairs that describe the original configuration
  /// of the backed-up resource. These values vary depending on the service that
  /// is being restored.
  final Map<String, String>? restoreMetadata;

  GetRecoveryPointRestoreMetadataOutput({
    this.backupVaultArn,
    this.recoveryPointArn,
    this.restoreMetadata,
  });

  factory GetRecoveryPointRestoreMetadataOutput.fromJson(
      Map<String, dynamic> json) {
    return GetRecoveryPointRestoreMetadataOutput(
      backupVaultArn: json['BackupVaultArn'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      restoreMetadata: (json['RestoreMetadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final backupVaultArn = this.backupVaultArn;
    final recoveryPointArn = this.recoveryPointArn;
    final restoreMetadata = this.restoreMetadata;
    return {
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (restoreMetadata != null) 'RestoreMetadata': restoreMetadata,
    };
  }
}

class GetSupportedResourceTypesOutput {
  /// Contains a string with the supported AWS resource types:
  ///
  /// <ul>
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
  /// <code>RDS</code> for Amazon Relational Database Service
  /// </li>
  /// <li>
  /// <code>Aurora</code> for Amazon Aurora
  /// </li>
  /// <li>
  /// <code>Storage Gateway</code> for AWS Storage Gateway
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

/// Contains an array of <code>Transition</code> objects specifying how long in
/// days before a recovery point transitions to cold storage or is deleted.
///
/// Backups transitioned to cold storage must be stored in cold storage for a
/// minimum of 90 days. Therefore, on the console, the “expire after days”
/// setting must be 90 days greater than the “transition to cold after days”
/// setting. The “transition to cold after days” setting cannot be changed after
/// a backup has been transitioned to cold.
///
/// Only Amazon EFS file system backups can be transitioned to cold storage.
class Lifecycle {
  /// Specifies the number of days after creation that a recovery point is
  /// deleted. Must be greater than 90 days plus
  /// <code>MoveToColdStorageAfterDays</code>.
  final int? deleteAfterDays;

  /// Specifies the number of days after creation that a recovery point is moved
  /// to cold storage.
  final int? moveToColdStorageAfterDays;

  Lifecycle({
    this.deleteAfterDays,
    this.moveToColdStorageAfterDays,
  });

  factory Lifecycle.fromJson(Map<String, dynamic> json) {
    return Lifecycle(
      deleteAfterDays: json['DeleteAfterDays'] as int?,
      moveToColdStorageAfterDays: json['MoveToColdStorageAfterDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteAfterDays = this.deleteAfterDays;
    final moveToColdStorageAfterDays = this.moveToColdStorageAfterDays;
    return {
      if (deleteAfterDays != null) 'DeleteAfterDays': deleteAfterDays,
      if (moveToColdStorageAfterDays != null)
        'MoveToColdStorageAfterDays': moveToColdStorageAfterDays,
    };
  }
}

class ListBackupJobsOutput {
  /// An array of structures containing metadata about your backup jobs returned
  /// in JSON format.
  final List<BackupJob>? backupJobs;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
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
  /// request is made to return <code>maxResults</code> number of items,
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
  /// request is made to return <code>maxResults</code> number of items,
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
  /// request is made to return <code>maxResults</code> number of items,
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
  /// request is made to return <code>maxResults</code> number of items,
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
  /// request is made to return <code>maxResults</code> number of items,
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

class ListCopyJobsOutput {
  /// An array of structures containing metadata about your copy jobs returned in
  /// JSON format.
  final List<CopyJob>? copyJobs;

  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return maxResults number of items, NextToken allows you
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

class ListProtectedResourcesOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// An array of resources successfully backed up by AWS Backup including the
  /// time the resource was saved, an Amazon Resource Name (ARN) of the resource,
  /// and a resource type.
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
  /// request is made to return <code>maxResults</code> number of items,
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

class ListRecoveryPointsByResourceOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
  /// <code>NextToken</code> allows you to return more items in your list starting
  /// at the location pointed to by the next token.
  final String? nextToken;

  /// An array of objects that contain detailed information about recovery points
  /// of the specified resource type.
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

class ListRestoreJobsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
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

class ListTagsOutput {
  /// The next item following a partial list of returned items. For example, if a
  /// request is made to return <code>maxResults</code> number of items,
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

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? resourceArn;

  /// The type of AWS resource; for example, an Amazon Elastic Block Store (Amazon
  /// EBS) volume or an Amazon Relational Database Service (Amazon RDS) database.
  /// For VSS Windows backups, the only supported resource type is Amazon EC2.
  final String? resourceType;

  ProtectedResource({
    this.lastBackupTime,
    this.resourceArn,
    this.resourceType,
  });

  factory ProtectedResource.fromJson(Map<String, dynamic> json) {
    return ProtectedResource(
      lastBackupTime: timeStampFromJson(json['LastBackupTime']),
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastBackupTime = this.lastBackupTime;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    return {
      if (lastBackupTime != null)
        'LastBackupTime': unixTimestampToJson(lastBackupTime),
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceType != null) 'ResourceType': resourceType,
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
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
  final String? backupVaultName;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  final CalculatedLifecycle? calculatedLifecycle;

  /// The date and time a job to restore a recovery point is completed, in Unix
  /// format and Coordinated Universal Time (UTC). The value of
  /// <code>CompletionDate</code> is accurate to milliseconds. For example, the
  /// value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? completionDate;

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

  /// The date and time a recovery point was last restored, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>LastRestoreTime</code>
  /// is accurate to milliseconds. For example, the value 1516925490.087
  /// represents Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? lastRestoreTime;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  ///
  /// Only Amazon EFS file system backups can be transitioned to cold storage.
  final Lifecycle? lifecycle;

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// An ARN that uniquely identifies a resource. The format of the ARN depends on
  /// the resource type.
  final String? resourceArn;

  /// The type of AWS resource saved as a recovery point; for example, an Amazon
  /// Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database
  /// Service (Amazon RDS) database. For VSS Windows backups, the only supported
  /// resource type is Amazon EC2.
  final String? resourceType;

  /// The backup vault where the recovery point was originally copied from. If the
  /// recovery point is restored to the same account this value will be
  /// <code>null</code>.
  final String? sourceBackupVaultArn;

  /// A status code specifying the state of the recovery point.
  final RecoveryPointStatus? status;

  RecoveryPointByBackupVault({
    this.backupSizeInBytes,
    this.backupVaultArn,
    this.backupVaultName,
    this.calculatedLifecycle,
    this.completionDate,
    this.createdBy,
    this.creationDate,
    this.encryptionKeyArn,
    this.iamRoleArn,
    this.isEncrypted,
    this.lastRestoreTime,
    this.lifecycle,
    this.recoveryPointArn,
    this.resourceArn,
    this.resourceType,
    this.sourceBackupVaultArn,
    this.status,
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
      createdBy: json['CreatedBy'] != null
          ? RecoveryPointCreator.fromJson(
              json['CreatedBy'] as Map<String, dynamic>)
          : null,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
      isEncrypted: json['IsEncrypted'] as bool?,
      lastRestoreTime: timeStampFromJson(json['LastRestoreTime']),
      lifecycle: json['Lifecycle'] != null
          ? Lifecycle.fromJson(json['Lifecycle'] as Map<String, dynamic>)
          : null,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
      sourceBackupVaultArn: json['SourceBackupVaultArn'] as String?,
      status: (json['Status'] as String?)?.toRecoveryPointStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupSizeInBytes = this.backupSizeInBytes;
    final backupVaultArn = this.backupVaultArn;
    final backupVaultName = this.backupVaultName;
    final calculatedLifecycle = this.calculatedLifecycle;
    final completionDate = this.completionDate;
    final createdBy = this.createdBy;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final iamRoleArn = this.iamRoleArn;
    final isEncrypted = this.isEncrypted;
    final lastRestoreTime = this.lastRestoreTime;
    final lifecycle = this.lifecycle;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    final sourceBackupVaultArn = this.sourceBackupVaultArn;
    final status = this.status;
    return {
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (backupVaultArn != null) 'BackupVaultArn': backupVaultArn,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (calculatedLifecycle != null)
        'CalculatedLifecycle': calculatedLifecycle,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdBy != null) 'CreatedBy': createdBy,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (isEncrypted != null) 'IsEncrypted': isEncrypted,
      if (lastRestoreTime != null)
        'LastRestoreTime': unixTimestampToJson(lastRestoreTime),
      if (lifecycle != null) 'Lifecycle': lifecycle,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceType != null) 'ResourceType': resourceType,
      if (sourceBackupVaultArn != null)
        'SourceBackupVaultArn': sourceBackupVaultArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Contains detailed information about a saved recovery point.
class RecoveryPointByResource {
  /// The size, in bytes, of a backup.
  final int? backupSizeBytes;

  /// The name of a logical container where backups are stored. Backup vaults are
  /// identified by names that are unique to the account used to create them and
  /// the AWS Region where they are created. They consist of lowercase letters,
  /// numbers, and hyphens.
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

  /// An Amazon Resource Name (ARN) that uniquely identifies a recovery point; for
  /// example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  /// A status code specifying the state of the recovery point.
  final RecoveryPointStatus? status;

  RecoveryPointByResource({
    this.backupSizeBytes,
    this.backupVaultName,
    this.creationDate,
    this.encryptionKeyArn,
    this.recoveryPointArn,
    this.status,
  });

  factory RecoveryPointByResource.fromJson(Map<String, dynamic> json) {
    return RecoveryPointByResource(
      backupSizeBytes: json['BackupSizeBytes'] as int?,
      backupVaultName: json['BackupVaultName'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      encryptionKeyArn: json['EncryptionKeyArn'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      status: (json['Status'] as String?)?.toRecoveryPointStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupSizeBytes = this.backupSizeBytes;
    final backupVaultName = this.backupVaultName;
    final creationDate = this.creationDate;
    final encryptionKeyArn = this.encryptionKeyArn;
    final recoveryPointArn = this.recoveryPointArn;
    final status = this.status;
    return {
      if (backupSizeBytes != null) 'BackupSizeBytes': backupSizeBytes,
      if (backupVaultName != null) 'BackupVaultName': backupVaultName,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (encryptionKeyArn != null) 'EncryptionKeyArn': encryptionKeyArn,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Contains information about the backup plan and rule that AWS Backup used to
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

enum RecoveryPointStatus {
  completed,
  partial,
  deleting,
  expired,
}

extension on RecoveryPointStatus {
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

extension on String {
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

enum RestoreJobStatus {
  pending,
  running,
  completed,
  aborted,
  failed,
}

extension on RestoreJobStatus {
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

extension on String {
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

  /// An Amazon Resource Name (ARN) that uniquely identifies a resource. The
  /// format of the ARN depends on the resource type.
  final String? createdResourceArn;

  /// The date and time a restore job is created, in Unix format and Coordinated
  /// Universal Time (UTC). The value of <code>CreationDate</code> is accurate to
  /// milliseconds. For example, the value 1516925490.087 represents Friday,
  /// January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

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

  /// The resource type of the listed restore jobs; for example, an Amazon Elastic
  /// Block Store (Amazon EBS) volume or an Amazon Relational Database Service
  /// (Amazon RDS) database. For VSS Windows backups, the only supported resource
  /// type is Amazon EC2.
  final String? resourceType;

  /// Uniquely identifies the job that restores a recovery point.
  final String? restoreJobId;

  /// A status code specifying the state of the job initiated by AWS Backup to
  /// restore a recovery point.
  final RestoreJobStatus? status;

  /// A detailed message explaining the status of the job to restore a recovery
  /// point.
  final String? statusMessage;

  RestoreJobsListMember({
    this.accountId,
    this.backupSizeInBytes,
    this.completionDate,
    this.createdResourceArn,
    this.creationDate,
    this.expectedCompletionTimeMinutes,
    this.iamRoleArn,
    this.percentDone,
    this.recoveryPointArn,
    this.resourceType,
    this.restoreJobId,
    this.status,
    this.statusMessage,
  });

  factory RestoreJobsListMember.fromJson(Map<String, dynamic> json) {
    return RestoreJobsListMember(
      accountId: json['AccountId'] as String?,
      backupSizeInBytes: json['BackupSizeInBytes'] as int?,
      completionDate: timeStampFromJson(json['CompletionDate']),
      createdResourceArn: json['CreatedResourceArn'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      expectedCompletionTimeMinutes:
          json['ExpectedCompletionTimeMinutes'] as int?,
      iamRoleArn: json['IamRoleArn'] as String?,
      percentDone: json['PercentDone'] as String?,
      recoveryPointArn: json['RecoveryPointArn'] as String?,
      resourceType: json['ResourceType'] as String?,
      restoreJobId: json['RestoreJobId'] as String?,
      status: (json['Status'] as String?)?.toRestoreJobStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final backupSizeInBytes = this.backupSizeInBytes;
    final completionDate = this.completionDate;
    final createdResourceArn = this.createdResourceArn;
    final creationDate = this.creationDate;
    final expectedCompletionTimeMinutes = this.expectedCompletionTimeMinutes;
    final iamRoleArn = this.iamRoleArn;
    final percentDone = this.percentDone;
    final recoveryPointArn = this.recoveryPointArn;
    final resourceType = this.resourceType;
    final restoreJobId = this.restoreJobId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (backupSizeInBytes != null) 'BackupSizeInBytes': backupSizeInBytes,
      if (completionDate != null)
        'CompletionDate': unixTimestampToJson(completionDate),
      if (createdResourceArn != null) 'CreatedResourceArn': createdResourceArn,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
      if (expectedCompletionTimeMinutes != null)
        'ExpectedCompletionTimeMinutes': expectedCompletionTimeMinutes,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (percentDone != null) 'PercentDone': percentDone,
      if (recoveryPointArn != null) 'RecoveryPointArn': recoveryPointArn,
      if (resourceType != null) 'ResourceType': resourceType,
      if (restoreJobId != null) 'RestoreJobId': restoreJobId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class StartBackupJobOutput {
  /// Uniquely identifies a request to AWS Backup to back up a resource.
  final String? backupJobId;

  /// The date and time that a backup job is created, in Unix format and
  /// Coordinated Universal Time (UTC). The value of <code>CreationDate</code> is
  /// accurate to milliseconds. For example, the value 1516925490.087 represents
  /// Friday, January 26, 2018 12:11:30.087 AM.
  final DateTime? creationDate;

  /// An ARN that uniquely identifies a recovery point; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:recovery-point:1EB3B5E7-9EB0-435A-A80B-108B488B0D45</code>.
  final String? recoveryPointArn;

  StartBackupJobOutput({
    this.backupJobId,
    this.creationDate,
    this.recoveryPointArn,
  });

  factory StartBackupJobOutput.fromJson(Map<String, dynamic> json) {
    return StartBackupJobOutput(
      backupJobId: json['BackupJobId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
      recoveryPointArn: json['RecoveryPointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backupJobId = this.backupJobId;
    final creationDate = this.creationDate;
    final recoveryPointArn = this.recoveryPointArn;
    return {
      if (backupJobId != null) 'BackupJobId': backupJobId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
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

  StartCopyJobOutput({
    this.copyJobId,
    this.creationDate,
  });

  factory StartCopyJobOutput.fromJson(Map<String, dynamic> json) {
    return StartCopyJobOutput(
      copyJobId: json['CopyJobId'] as String?,
      creationDate: timeStampFromJson(json['CreationDate']),
    );
  }

  Map<String, dynamic> toJson() {
    final copyJobId = this.copyJobId;
    final creationDate = this.creationDate;
    return {
      if (copyJobId != null) 'CopyJobId': copyJobId,
      if (creationDate != null)
        'CreationDate': unixTimestampToJson(creationDate),
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

extension on StorageClass {
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

extension on String {
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

  /// The date and time a backup plan is updated, in Unix format and Coordinated
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

class UpdateRecoveryPointLifecycleOutput {
  /// An ARN that uniquely identifies a backup vault; for example,
  /// <code>arn:aws:backup:us-east-1:123456789012:vault:aBackupVault</code>.
  final String? backupVaultArn;

  /// A <code>CalculatedLifecycle</code> object containing <code>DeleteAt</code>
  /// and <code>MoveToColdStorageAt</code> timestamps.
  final CalculatedLifecycle? calculatedLifecycle;

  /// The lifecycle defines when a protected resource is transitioned to cold
  /// storage and when it expires. AWS Backup transitions and expires backups
  /// automatically according to the lifecycle that you define.
  ///
  /// Backups transitioned to cold storage must be stored in cold storage for a
  /// minimum of 90 days. Therefore, the “expire after days” setting must be 90
  /// days greater than the “transition to cold after days” setting. The
  /// “transition to cold after days” setting cannot be changed after a backup has
  /// been transitioned to cold.
  ///
  /// Only Amazon EFS file system backups can be transitioned to cold storage.
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

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
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
