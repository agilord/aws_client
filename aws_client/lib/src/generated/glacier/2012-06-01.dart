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

part '2012-06-01.g.dart';

/// Amazon S3 Glacier (Glacier) is a storage solution for "cold data."
///
/// Glacier is an extremely low-cost storage service that provides secure,
/// durable, and easy-to-use storage for data backup and archival. With Glacier,
/// customers can store their data cost effectively for months, years, or
/// decades. Glacier also enables customers to offload the administrative
/// burdens of operating and scaling storage to AWS, so they don't have to worry
/// about capacity planning, hardware provisioning, data replication, hardware
/// failure and recovery, or time-consuming hardware migrations.
///
/// Glacier is a great storage choice when low storage cost is paramount and
/// your data is rarely retrieved. If your application requires fast or frequent
/// access to your data, consider using Amazon S3. For more information, see <a
/// href="http://aws.amazon.com/s3/">Amazon Simple Storage Service (Amazon
/// S3)</a>.
///
/// You can store any kind of data in any format. There is no maximum limit on
/// the total amount of data you can store in Glacier.
///
/// If you are a first-time user of Glacier, we recommend that you begin by
/// reading the following sections in the <i>Amazon S3 Glacier Developer
/// Guide</i>:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/introduction.html">What
/// is Amazon S3 Glacier</a> - This section of the Developer Guide describes the
/// underlying data model, the operations it supports, and the AWS SDKs that you
/// can use to interact with the service.
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/amazon-glacier-getting-started.html">Getting
/// Started with Amazon S3 Glacier</a> - The Getting Started section walks you
/// through the process of creating a vault, uploading archives, creating jobs
/// to download archives, retrieving the job output, and deleting archives.
/// </li>
/// </ul>
class Glacier {
  final _s.RestJsonProtocol _protocol;
  Glacier({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'glacier',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// This operation aborts a multipart upload identified by the upload ID.
  ///
  /// After the Abort Multipart Upload request succeeds, you cannot upload any
  /// more parts to the multipart upload or complete the multipart upload.
  /// Aborting a completed upload fails. However, aborting an already-aborted
  /// upload will succeed, for a short time. For more information about
  /// uploading a part and completing a multipart upload, see
  /// <a>UploadMultipartPart</a> and <a>CompleteMultipartUpload</a>.
  ///
  /// This operation is idempotent.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html">Working
  /// with Archives in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-abort-upload.html">Abort
  /// Multipart Upload</a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [uploadId] :
  /// The upload ID of the multipart upload to delete.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<void> abortMultipartUpload({
    @_s.required String accountId,
    @_s.required String uploadId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/multipart-uploads/${Uri.encodeComponent(uploadId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation aborts the vault locking process if the vault lock is not
  /// in the <code>Locked</code> state. If the vault lock is in the
  /// <code>Locked</code> state when this operation is requested, the operation
  /// returns an <code>AccessDeniedException</code> error. Aborting the vault
  /// locking process removes the vault lock policy from the specified vault.
  ///
  /// A vault lock is put into the <code>InProgress</code> state by calling
  /// <a>InitiateVaultLock</a>. A vault lock is put into the <code>Locked</code>
  /// state by calling <a>CompleteVaultLock</a>. You can get the state of a
  /// vault lock by calling <a>GetVaultLock</a>. For more information about the
  /// vault locking process, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html">Amazon
  /// Glacier Vault Lock</a>. For more information about vault lock policies,
  /// see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html">Amazon
  /// Glacier Access Control with Vault Lock Policies</a>.
  ///
  /// This operation is idempotent. You can successfully invoke this operation
  /// multiple times, if the vault lock is in the <code>InProgress</code> state
  /// or if there is no policy associated with the vault.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '<code>-</code>' (hyphen), in which case Amazon Glacier uses the AWS
  /// account ID associated with the credentials used to sign the request. If
  /// you specify your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<void> abortVaultLock({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/lock-policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation adds the specified tags to a vault. Each tag is composed of
  /// a key and a value. Each vault can have up to 10 tags. If your request
  /// would cause the tag limit for the vault to be exceeded, the operation
  /// throws the <code>LimitExceededException</code> error. If a tag already
  /// exists on the vault under a specified key, the existing key value will be
  /// overwritten. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html">Tagging
  /// Amazon S3 Glacier Resources</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [tags] :
  /// The tags to add to the vault. Each tag is composed of a key and a value.
  /// The value can be an empty string.
  Future<void> addTagsToVault({
    @_s.required String accountId,
    @_s.required String vaultName,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final $payload = <String, dynamic>{
      if (tags != null) 'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/tags?operation=add',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// You call this operation to inform Amazon S3 Glacier (Glacier) that all the
  /// archive parts have been uploaded and that Glacier can now assemble the
  /// archive from the uploaded parts. After assembling and saving the archive
  /// to the vault, Glacier returns the URI path of the newly created archive
  /// resource. Using the URI path, you can then access the archive. After you
  /// upload an archive, you should save the archive ID returned to retrieve the
  /// archive at a later point. You can also get the vault inventory to obtain a
  /// list of archive IDs in a vault. For more information, see
  /// <a>InitiateJob</a>.
  ///
  /// In the request, you must include the computed SHA256 tree hash of the
  /// entire archive you have uploaded. For information about computing a SHA256
  /// tree hash, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html">Computing
  /// Checksums</a>. On the server side, Glacier also constructs the SHA256 tree
  /// hash of the assembled archive. If the values match, Glacier saves the
  /// archive to the vault; otherwise, it returns an error, and the operation
  /// fails. The <a>ListParts</a> operation returns a list of parts uploaded for
  /// a specific multipart upload. It includes checksum information for each
  /// uploaded part that can be used to debug a bad checksum issue.
  ///
  /// Additionally, Glacier also checks for any missing content ranges when
  /// assembling the archive, if missing content ranges are found, Glacier
  /// returns an error and the operation fails.
  ///
  /// Complete Multipart Upload is an idempotent operation. After your first
  /// successful complete multipart upload, if you call the operation again
  /// within a short period, the operation will succeed and return the same
  /// archive ID. This is useful in the event you experience a network issue
  /// that causes an aborted connection or receive a 500 server error, in which
  /// case you can repeat your Complete Multipart Upload request and get the
  /// same archive ID without creating duplicate archives. Note, however, that
  /// after the multipart upload completes, you cannot call the List Parts
  /// operation and the multipart upload will not appear in List Multipart
  /// Uploads response, even if idempotent complete is possible.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html">Uploading
  /// Large Archives in Parts (Multipart Upload)</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-complete-upload.html">Complete
  /// Multipart Upload</a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [uploadId] :
  /// The upload ID of the multipart upload.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [archiveSize] :
  /// The total size, in bytes, of the entire archive. This value should be the
  /// sum of all the sizes of the individual parts that you uploaded.
  ///
  /// Parameter [checksum] :
  /// The SHA256 tree hash of the entire archive. It is the tree hash of SHA256
  /// tree hash of the individual parts. If the value you specify in the request
  /// does not match the SHA256 tree hash of the final assembled archive as
  /// computed by Amazon S3 Glacier (Glacier), Glacier returns an error and the
  /// request fails.
  Future<ArchiveCreationOutput> completeMultipartUpload({
    @_s.required String accountId,
    @_s.required String uploadId,
    @_s.required String vaultName,
    String archiveSize,
    String checksum,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final headers = <String, String>{};
    archiveSize?.let((v) => headers['x-amz-archive-size'] = v.toString());
    checksum?.let((v) => headers['x-amz-sha256-tree-hash'] = v.toString());
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/multipart-uploads/${Uri.encodeComponent(uploadId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ArchiveCreationOutput(
      archiveId:
          _s.extractHeaderStringValue(response.headers, 'x-amz-archive-id'),
      checksum: _s.extractHeaderStringValue(
          response.headers, 'x-amz-sha256-tree-hash'),
      location: _s.extractHeaderStringValue(response.headers, 'Location'),
    );
  }

  /// This operation completes the vault locking process by transitioning the
  /// vault lock from the <code>InProgress</code> state to the
  /// <code>Locked</code> state, which causes the vault lock policy to become
  /// unchangeable. A vault lock is put into the <code>InProgress</code> state
  /// by calling <a>InitiateVaultLock</a>. You can obtain the state of the vault
  /// lock by calling <a>GetVaultLock</a>. For more information about the vault
  /// locking process, <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html">Amazon
  /// Glacier Vault Lock</a>.
  ///
  /// This operation is idempotent. This request is always successful if the
  /// vault lock is in the <code>Locked</code> state and the provided lock ID
  /// matches the lock ID originally used to lock the vault.
  ///
  /// If an invalid lock ID is passed in the request when the vault lock is in
  /// the <code>Locked</code> state, the operation returns an
  /// <code>AccessDeniedException</code> error. If an invalid lock ID is passed
  /// in the request when the vault lock is in the <code>InProgress</code>
  /// state, the operation throws an <code>InvalidParameter</code> error.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '<code>-</code>' (hyphen), in which case Amazon Glacier uses the AWS
  /// account ID associated with the credentials used to sign the request. If
  /// you specify your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [lockId] :
  /// The <code>lockId</code> value is the lock ID obtained from a
  /// <a>InitiateVaultLock</a> request.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<void> completeVaultLock({
    @_s.required String accountId,
    @_s.required String lockId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(lockId, 'lockId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/lock-policy/${Uri.encodeComponent(lockId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation creates a new vault with the specified name. The name of
  /// the vault must be unique within a region for an AWS account. You can
  /// create up to 1,000 vaults per account. If you need to create more vaults,
  /// contact Amazon S3 Glacier.
  ///
  /// You must use the following guidelines when naming a vault.
  ///
  /// <ul>
  /// <li>
  /// Names can be between 1 and 255 characters long.
  /// </li>
  /// <li>
  /// Allowed characters are a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), and
  /// '.' (period).
  /// </li>
  /// </ul>
  /// This operation is idempotent.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/creating-vaults.html">Creating
  /// a Vault in Amazon Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-put.html">Create
  /// Vault </a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the AWS
  /// account ID associated with the credentials used to sign the request. If
  /// you specify your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<CreateVaultOutput> createVault({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateVaultOutput(
      location: _s.extractHeaderStringValue(response.headers, 'Location'),
    );
  }

  /// This operation deletes an archive from a vault. Subsequent requests to
  /// initiate a retrieval of this archive will fail. Archive retrievals that
  /// are in progress for this archive ID may or may not succeed according to
  /// the following scenarios:
  ///
  /// <ul>
  /// <li>
  /// If the archive retrieval job is actively preparing the data for download
  /// when Amazon S3 Glacier receives the delete archive request, the archival
  /// retrieval operation might fail.
  /// </li>
  /// <li>
  /// If the archive retrieval job has successfully prepared the archive for
  /// download when Amazon S3 Glacier receives the delete archive request, you
  /// will be able to download the output.
  /// </li>
  /// </ul>
  /// This operation is idempotent. Attempting to delete an already-deleted
  /// archive does not result in an error.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/deleting-an-archive.html">Deleting
  /// an Archive in Amazon Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-delete.html">Delete
  /// Archive</a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [archiveId] :
  /// The ID of the archive to delete.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<void> deleteArchive({
    @_s.required String accountId,
    @_s.required String archiveId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(archiveId, 'archiveId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/archives/${Uri.encodeComponent(archiveId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes a vault. Amazon S3 Glacier will delete a vault only
  /// if there are no archives in the vault as of the last inventory and there
  /// have been no writes to the vault since the last inventory. If either of
  /// these conditions is not satisfied, the vault deletion fails (that is, the
  /// vault is not removed) and Amazon S3 Glacier returns an error. You can use
  /// <a>DescribeVault</a> to return the number of archives in a vault, and you
  /// can use <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html">Initiate
  /// a Job (POST jobs)</a> to initiate a new inventory retrieval for a vault.
  /// The inventory contains the archive IDs you use to delete archives using <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-delete.html">Delete
  /// Archive (DELETE archive)</a>.
  ///
  /// This operation is idempotent.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/deleting-vaults.html">Deleting
  /// a Vault in Amazon Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-delete.html">Delete
  /// Vault </a> in the <i>Amazon S3 Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<void> deleteVault({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes the access policy associated with the specified
  /// vault. The operation is eventually consistent; that is, it might take some
  /// time for Amazon S3 Glacier to completely remove the access policy, and you
  /// might still see the effect of the policy for a short time after you send
  /// the delete request.
  ///
  /// This operation is idempotent. You can invoke delete multiple times, even
  /// if there is no policy associated with the vault. For more information
  /// about vault access policies, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html">Amazon
  /// Glacier Access Control with Vault Access Policies</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<void> deleteVaultAccessPolicy({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation deletes the notification configuration set for a vault. The
  /// operation is eventually consistent; that is, it might take some time for
  /// Amazon S3 Glacier to completely disable the notifications and you might
  /// still receive some notifications for a short time after you send the
  /// delete request.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html">Configuring
  /// Vault Notifications in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-delete.html">Delete
  /// Vault Notification Configuration </a> in the Amazon S3 Glacier Developer
  /// Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<void> deleteVaultNotifications({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation returns information about a job you previously initiated,
  /// including the job initiation date, the user who initiated the job, the job
  /// status code/message and the Amazon SNS topic to notify after Amazon S3
  /// Glacier (Glacier) completes the job. For more information about initiating
  /// a job, see <a>InitiateJob</a>.
  /// <note>
  /// This operation enables you to check the status of your job. However, it is
  /// strongly recommended that you set up an Amazon SNS topic and specify it in
  /// your initiate job request so that Glacier can notify the topic after it
  /// completes the job.
  /// </note>
  /// A job ID will not expire for at least 24 hours after Glacier completes the
  /// job.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For more information about using this operation, see the documentation for
  /// the underlying REST API <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-describe-job-get.html">Describe
  /// Job</a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [jobId] :
  /// The ID of the job to describe.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<GlacierJobDescription> describeJob({
    @_s.required String accountId,
    @_s.required String jobId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GlacierJobDescription.fromJson(response);
  }

  /// This operation returns information about a vault, including the vault's
  /// Amazon Resource Name (ARN), the date the vault was created, the number of
  /// archives it contains, and the total size of all the archives in the vault.
  /// The number of archives and their total size are as of the last inventory
  /// generation. This means that if you add or remove an archive from a vault,
  /// and then immediately use Describe Vault, the change in contents will not
  /// be immediately reflected. If you want to retrieve the latest inventory of
  /// the vault, use <a>InitiateJob</a>. Amazon S3 Glacier generates vault
  /// inventories approximately daily. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-inventory.html">Downloading
  /// a Vault Inventory in Amazon S3 Glacier</a>.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/retrieving-vault-info.html">Retrieving
  /// Vault Metadata in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-get.html">Describe
  /// Vault </a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<DescribeVaultOutput> describeVault({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVaultOutput.fromJson(response);
  }

  /// This operation returns the current data retrieval policy for the account
  /// and region specified in the GET request. For more information about data
  /// retrieval policies, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html">Amazon
  /// Glacier Data Retrieval Policies</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '<code>-</code>' (hyphen), in which case Amazon Glacier uses the AWS
  /// account ID associated with the credentials used to sign the request. If
  /// you specify your account ID, do not include any hyphens ('-') in the ID.
  Future<GetDataRetrievalPolicyOutput> getDataRetrievalPolicy({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(accountId)}/policies/data-retrieval',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataRetrievalPolicyOutput.fromJson(response);
  }

  /// This operation downloads the output of the job you initiated using
  /// <a>InitiateJob</a>. Depending on the job type you specified when you
  /// initiated the job, the output will be either the content of an archive or
  /// a vault inventory.
  ///
  /// You can download all the job output or download a portion of the output by
  /// specifying a byte range. In the case of an archive retrieval job,
  /// depending on the byte range you specify, Amazon S3 Glacier (Glacier)
  /// returns the checksum for the portion of the data. You can compute the
  /// checksum on the client and verify that the values match to ensure the
  /// portion you downloaded is the correct data.
  ///
  /// A job ID will not expire for at least 24 hours after Glacier completes the
  /// job. That a byte range. For both archive and inventory retrieval jobs, you
  /// should verify the downloaded size against the size returned in the headers
  /// from the <b>Get Job Output</b> response.
  ///
  /// For archive retrieval jobs, you should also verify that the size is what
  /// you expected. If you download a portion of the output, the expected size
  /// is based on the range of bytes you specified. For example, if you specify
  /// a range of <code>bytes=0-1048575</code>, you should verify your download
  /// size is 1,048,576 bytes. If you download an entire archive, the expected
  /// size is the size of the archive when you uploaded it to Amazon S3 Glacier
  /// The expected size is also returned in the headers from the <b>Get Job
  /// Output</b> response.
  ///
  /// In the case of an archive retrieval job, depending on the byte range you
  /// specify, Glacier returns the checksum for the portion of the data. To
  /// ensure the portion you downloaded is the correct data, compute the
  /// checksum on the client, verify that the values match, and verify that the
  /// size is what you expected.
  ///
  /// A job ID does not expire for at least 24 hours after Glacier completes the
  /// job. That is, you can download the job output within the 24 hours period
  /// after Amazon Glacier completes the job.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and the underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-inventory.html">Downloading
  /// a Vault Inventory</a>, <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/downloading-an-archive.html">Downloading
  /// an Archive</a>, and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-job-output-get.html">Get
  /// Job Output </a>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [jobId] :
  /// The job ID whose data is downloaded.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [range] :
  /// The range of bytes to retrieve from the output. For example, if you want
  /// to download the first 1,048,576 bytes, specify the range as
  /// <code>bytes=0-1048575</code>. By default, this operation downloads the
  /// entire output.
  ///
  /// If the job output is large, then you can use a range to retrieve a portion
  /// of the output. This allows you to download the entire output in smaller
  /// chunks of bytes. For example, suppose you have 1 GB of job output you want
  /// to download and you decide to download 128 MB chunks of data at a time,
  /// which is a total of eight Get Job Output requests. You use the following
  /// process to download the job output:
  /// <ol>
  /// <li>
  /// Download a 128 MB chunk of output by specifying the appropriate byte
  /// range. Verify that all 128 MB of data was received.
  /// </li>
  /// <li>
  /// Along with the data, the response includes a SHA256 tree hash of the
  /// payload. You compute the checksum of the payload on the client and compare
  /// it with the checksum you received in the response to ensure you received
  /// all the expected data.
  /// </li>
  /// <li>
  /// Repeat steps 1 and 2 for all the eight 128 MB chunks of output data, each
  /// time specifying the appropriate byte range.
  /// </li>
  /// <li>
  /// After downloading all the parts of the job output, you have a list of
  /// eight checksum values. Compute the tree hash of these values to find the
  /// checksum of the entire output. Using the <a>DescribeJob</a> API, obtain
  /// job information of the job that provided you the output. The response
  /// includes the checksum of the entire archive stored in Amazon S3 Glacier.
  /// You compare this value with the checksum you computed to ensure you have
  /// downloaded the entire archive content with no errors.
  /// <p/> </li> </ol>
  Future<GetJobOutputOutput> getJobOutput({
    @_s.required String accountId,
    @_s.required String jobId,
    @_s.required String vaultName,
    String range,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(jobId, 'jobId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final headers = <String, String>{};
    range?.let((v) => headers['Range'] = v.toString());
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/jobs/${Uri.encodeComponent(jobId)}/output',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetJobOutputOutput(
      body: await response.stream.toBytes(),
      acceptRanges:
          _s.extractHeaderStringValue(response.headers, 'Accept-Ranges'),
      archiveDescription: _s.extractHeaderStringValue(
          response.headers, 'x-amz-archive-description'),
      checksum: _s.extractHeaderStringValue(
          response.headers, 'x-amz-sha256-tree-hash'),
      contentRange:
          _s.extractHeaderStringValue(response.headers, 'Content-Range'),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      status: response.statusCode,
    );
  }

  /// This operation retrieves the <code>access-policy</code> subresource set on
  /// the vault; for more information on setting this subresource, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-SetVaultAccessPolicy.html">Set
  /// Vault Access Policy (PUT access-policy)</a>. If there is no access policy
  /// set on the vault, the operation returns a <code>404 Not found</code>
  /// error. For more information about vault access policies, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html">Amazon
  /// Glacier Access Control with Vault Access Policies</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<GetVaultAccessPolicyOutput> getVaultAccessPolicy({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetVaultAccessPolicyOutput(
      policy: VaultAccessPolicy.fromJson($json),
    );
  }

  /// This operation retrieves the following attributes from the
  /// <code>lock-policy</code> subresource set on the specified vault:
  ///
  /// <ul>
  /// <li>
  /// The vault lock policy set on the vault.
  /// </li>
  /// <li>
  /// The state of the vault lock, which is either <code>InProgess</code> or
  /// <code>Locked</code>.
  /// </li>
  /// <li>
  /// When the lock ID expires. The lock ID is used to complete the vault
  /// locking process.
  /// </li>
  /// <li>
  /// When the vault lock was initiated and put into the <code>InProgress</code>
  /// state.
  /// </li>
  /// </ul>
  /// A vault lock is put into the <code>InProgress</code> state by calling
  /// <a>InitiateVaultLock</a>. A vault lock is put into the <code>Locked</code>
  /// state by calling <a>CompleteVaultLock</a>. You can abort the vault locking
  /// process by calling <a>AbortVaultLock</a>. For more information about the
  /// vault locking process, <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html">Amazon
  /// Glacier Vault Lock</a>.
  ///
  /// If there is no vault lock policy set on the vault, the operation returns a
  /// <code>404 Not found</code> error. For more information about vault lock
  /// policies, <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html">Amazon
  /// Glacier Access Control with Vault Lock Policies</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<GetVaultLockOutput> getVaultLock({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/lock-policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetVaultLockOutput.fromJson(response);
  }

  /// This operation retrieves the <code>notification-configuration</code>
  /// subresource of the specified vault.
  ///
  /// For information about setting a notification configuration on a vault, see
  /// <a>SetVaultNotifications</a>. If a notification configuration for a vault
  /// is not set, the operation returns a <code>404 Not Found</code> error. For
  /// more information about vault notifications, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html">Configuring
  /// Vault Notifications in Amazon S3 Glacier</a>.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html">Configuring
  /// Vault Notifications in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-get.html">Get
  /// Vault Notification Configuration </a> in the <i>Amazon Glacier Developer
  /// Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<GetVaultNotificationsOutput> getVaultNotifications({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return GetVaultNotificationsOutput(
      vaultNotificationConfig: VaultNotificationConfig.fromJson($json),
    );
  }

  /// This operation initiates a job of the specified type, which can be a
  /// select, an archival retrieval, or a vault retrieval. For more information
  /// about using this operation, see the documentation for the underlying REST
  /// API <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html">Initiate
  /// a Job</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [PolicyEnforcedException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [InsufficientCapacityException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [jobParameters] :
  /// Provides options for specifying job information.
  Future<InitiateJobOutput> initiateJob({
    @_s.required String accountId,
    @_s.required String vaultName,
    JobParameters jobParameters,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.sendRaw(
      payload: jobParameters,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/jobs',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InitiateJobOutput(
      jobId: _s.extractHeaderStringValue(response.headers, 'x-amz-job-id'),
      jobOutputPath: _s.extractHeaderStringValue(
          response.headers, 'x-amz-job-output-path'),
      location: _s.extractHeaderStringValue(response.headers, 'Location'),
    );
  }

  /// This operation initiates a multipart upload. Amazon S3 Glacier creates a
  /// multipart upload resource and returns its ID in the response. The
  /// multipart upload ID is used in subsequent requests to upload parts of an
  /// archive (see <a>UploadMultipartPart</a>).
  ///
  /// When you initiate a multipart upload, you specify the part size in number
  /// of bytes. The part size must be a megabyte (1024 KB) multiplied by a power
  /// of 2-for example, 1048576 (1 MB), 2097152 (2 MB), 4194304 (4 MB), 8388608
  /// (8 MB), and so on. The minimum allowable part size is 1 MB, and the
  /// maximum is 4 GB.
  ///
  /// Every part you upload to this resource (see <a>UploadMultipartPart</a>),
  /// except the last one, must have the same size. The last one can be the same
  /// size or smaller. For example, suppose you want to upload a 16.2 MB file.
  /// If you initiate the multipart upload with a part size of 4 MB, you will
  /// upload four parts of 4 MB each and one part of 0.2 MB.
  /// <note>
  /// You don't need to know the size of the archive when you start a multipart
  /// upload because Amazon S3 Glacier does not require you to specify the
  /// overall archive size.
  /// </note>
  /// After you complete the multipart upload, Amazon S3 Glacier (Glacier)
  /// removes the multipart upload resource referenced by the ID. Glacier also
  /// removes the multipart upload resource if you cancel the multipart upload
  /// or it may be removed if there is no activity for a period of 24 hours.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html">Uploading
  /// Large Archives in Parts (Multipart Upload)</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-initiate-upload.html">Initiate
  /// Multipart Upload</a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [archiveDescription] :
  /// The archive description that you are uploading in parts.
  ///
  /// The part size must be a megabyte (1024 KB) multiplied by a power of 2, for
  /// example 1048576 (1 MB), 2097152 (2 MB), 4194304 (4 MB), 8388608 (8 MB),
  /// and so on. The minimum allowable part size is 1 MB, and the maximum is 4
  /// GB (4096 MB).
  ///
  /// Parameter [partSize] :
  /// The size of each part except the last, in bytes. The last part can be
  /// smaller than this part size.
  Future<InitiateMultipartUploadOutput> initiateMultipartUpload({
    @_s.required String accountId,
    @_s.required String vaultName,
    String archiveDescription,
    String partSize,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final headers = <String, String>{};
    archiveDescription
        ?.let((v) => headers['x-amz-archive-description'] = v.toString());
    partSize?.let((v) => headers['x-amz-part-size'] = v.toString());
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/multipart-uploads',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InitiateMultipartUploadOutput(
      location: _s.extractHeaderStringValue(response.headers, 'Location'),
      uploadId: _s.extractHeaderStringValue(
          response.headers, 'x-amz-multipart-upload-id'),
    );
  }

  /// This operation initiates the vault locking process by doing the following:
  ///
  /// <ul>
  /// <li>
  /// Installing a vault lock policy on the specified vault.
  /// </li>
  /// <li>
  /// Setting the lock state of vault lock to <code>InProgress</code>.
  /// </li>
  /// <li>
  /// Returning a lock ID, which is used to complete the vault locking process.
  /// </li>
  /// </ul>
  /// You can set one vault lock policy for each vault and this policy can be up
  /// to 20 KB in size. For more information about vault lock policies, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html">Amazon
  /// Glacier Access Control with Vault Lock Policies</a>.
  ///
  /// You must complete the vault locking process within 24 hours after the
  /// vault lock enters the <code>InProgress</code> state. After the 24 hour
  /// window ends, the lock ID expires, the vault automatically exits the
  /// <code>InProgress</code> state, and the vault lock policy is removed from
  /// the vault. You call <a>CompleteVaultLock</a> to complete the vault locking
  /// process by setting the state of the vault lock to <code>Locked</code>.
  ///
  /// After a vault lock is in the <code>Locked</code> state, you cannot
  /// initiate a new vault lock for the vault.
  ///
  /// You can abort the vault locking process by calling <a>AbortVaultLock</a>.
  /// You can get the state of the vault lock by calling <a>GetVaultLock</a>.
  /// For more information about the vault locking process, <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html">Amazon
  /// Glacier Vault Lock</a>.
  ///
  /// If this operation is called when the vault lock is in the
  /// <code>InProgress</code> state, the operation returns an
  /// <code>AccessDeniedException</code> error. When the vault lock is in the
  /// <code>InProgress</code> state you must call <a>AbortVaultLock</a> before
  /// you can initiate a new vault lock policy.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '<code>-</code>' (hyphen), in which case Amazon Glacier uses the AWS
  /// account ID associated with the credentials used to sign the request. If
  /// you specify your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [policy] :
  /// The vault lock policy as a JSON string, which uses "\" as an escape
  /// character.
  Future<InitiateVaultLockOutput> initiateVaultLock({
    @_s.required String accountId,
    @_s.required String vaultName,
    VaultLockPolicy policy,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.sendRaw(
      payload: policy,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/lock-policy',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return InitiateVaultLockOutput(
      lockId: _s.extractHeaderStringValue(response.headers, 'x-amz-lock-id'),
    );
  }

  /// This operation lists jobs for a vault, including jobs that are in-progress
  /// and jobs that have recently finished. The List Job operation returns a
  /// list of these jobs sorted by job initiation time.
  /// <note>
  /// Amazon Glacier retains recently completed jobs for a period before
  /// deleting them; however, it eventually removes completed jobs. The output
  /// of completed jobs can be retrieved. Retaining completed jobs for a period
  /// of time after they have completed enables you to get a job output in the
  /// event you miss the job completion notification or your first attempt to
  /// download it fails. For example, suppose you start an archive retrieval job
  /// to download an archive. After the job completes, you start to download the
  /// archive but encounter a network error. In this scenario, you can retry and
  /// download the archive while the job exists.
  /// </note>
  /// The List Jobs operation supports pagination. You should always check the
  /// response <code>Marker</code> field. If there are no more jobs to list, the
  /// <code>Marker</code> field is set to <code>null</code>. If there are more
  /// jobs to list, the <code>Marker</code> field is set to a non-null value,
  /// which you can use to continue the pagination of the list. To return a list
  /// of jobs that begins at a specific job, set the marker request parameter to
  /// the <code>Marker</code> value for that job that you obtained from a
  /// previous List Jobs request.
  ///
  /// You can set a maximum limit for the number of jobs returned in the
  /// response by specifying the <code>limit</code> parameter in the request.
  /// The default limit is 50. The number of jobs returned might be fewer than
  /// the limit, but the number of returned jobs never exceeds the limit.
  ///
  /// Additionally, you can filter the jobs list returned by specifying the
  /// optional <code>statuscode</code> parameter or <code>completed</code>
  /// parameter, or both. Using the <code>statuscode</code> parameter, you can
  /// specify to return only jobs that match either the <code>InProgress</code>,
  /// <code>Succeeded</code>, or <code>Failed</code> status. Using the
  /// <code>completed</code> parameter, you can specify to return only jobs that
  /// were completed (<code>true</code>) or jobs that were not completed
  /// (<code>false</code>).
  ///
  /// For more information about using this operation, see the documentation for
  /// the underlying REST API <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-jobs-get.html">List
  /// Jobs</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [completed] :
  /// The state of the jobs to return. You can specify <code>true</code> or
  /// <code>false</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of jobs to be returned. The default limit is 50. The
  /// number of jobs returned might be fewer than the specified limit, but the
  /// number of returned jobs never exceeds the limit.
  ///
  /// Parameter [marker] :
  /// An opaque string used for pagination. This value specifies the job at
  /// which the listing of jobs should begin. Get the marker value from a
  /// previous List Jobs response. You only need to include the marker if you
  /// are continuing the pagination of results started in a previous List Jobs
  /// request.
  ///
  /// Parameter [statuscode] :
  /// The type of job status to return. You can specify the following values:
  /// <code>InProgress</code>, <code>Succeeded</code>, or <code>Failed</code>.
  Future<ListJobsOutput> listJobs({
    @_s.required String accountId,
    @_s.required String vaultName,
    String completed,
    String limit,
    String marker,
    String statuscode,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final $query = <String, List<String>>{
      if (completed != null) 'completed': [completed],
      if (limit != null) 'limit': [limit],
      if (marker != null) 'marker': [marker],
      if (statuscode != null) 'statuscode': [statuscode],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsOutput.fromJson(response);
  }

  /// This operation lists in-progress multipart uploads for the specified
  /// vault. An in-progress multipart upload is a multipart upload that has been
  /// initiated by an <a>InitiateMultipartUpload</a> request, but has not yet
  /// been completed or aborted. The list returned in the List Multipart Upload
  /// response has no guaranteed order.
  ///
  /// The List Multipart Uploads operation supports pagination. By default, this
  /// operation returns up to 50 multipart uploads in the response. You should
  /// always check the response for a <code>marker</code> at which to continue
  /// the list; if there are no more items the <code>marker</code> is
  /// <code>null</code>. To return a list of multipart uploads that begins at a
  /// specific upload, set the <code>marker</code> request parameter to the
  /// value you obtained from a previous List Multipart Upload request. You can
  /// also limit the number of uploads returned in the response by specifying
  /// the <code>limit</code> parameter in the request.
  ///
  /// Note the difference between this operation and listing parts
  /// (<a>ListParts</a>). The List Multipart Uploads operation lists all
  /// multipart uploads for a vault and does not require a multipart upload ID.
  /// The List Parts operation requires a multipart upload ID since parts are
  /// associated with a single upload.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and the underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html">Working
  /// with Archives in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-list-uploads.html">List
  /// Multipart Uploads </a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [limit] :
  /// Specifies the maximum number of uploads returned in the response body. If
  /// this value is not specified, the List Uploads operation returns up to 50
  /// uploads.
  ///
  /// Parameter [marker] :
  /// An opaque string used for pagination. This value specifies the upload at
  /// which the listing of uploads should begin. Get the marker value from a
  /// previous List Uploads response. You need only include the marker if you
  /// are continuing the pagination of results started in a previous List
  /// Uploads request.
  Future<ListMultipartUploadsOutput> listMultipartUploads({
    @_s.required String accountId,
    @_s.required String vaultName,
    String limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/multipart-uploads',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMultipartUploadsOutput.fromJson(response);
  }

  /// This operation lists the parts of an archive that have been uploaded in a
  /// specific multipart upload. You can make this request at any time during an
  /// in-progress multipart upload before you complete the upload (see
  /// <a>CompleteMultipartUpload</a>. List Parts returns an error for completed
  /// uploads. The list returned in the List Parts response is sorted by part
  /// range.
  ///
  /// The List Parts operation supports pagination. By default, this operation
  /// returns up to 50 uploaded parts in the response. You should always check
  /// the response for a <code>marker</code> at which to continue the list; if
  /// there are no more items the <code>marker</code> is <code>null</code>. To
  /// return a list of parts that begins at a specific part, set the
  /// <code>marker</code> request parameter to the value you obtained from a
  /// previous List Parts request. You can also limit the number of parts
  /// returned in the response by specifying the <code>limit</code> parameter in
  /// the request.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and the underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html">Working
  /// with Archives in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-list-parts.html">List
  /// Parts</a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [uploadId] :
  /// The upload ID of the multipart upload.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [limit] :
  /// The maximum number of parts to be returned. The default limit is 50. The
  /// number of parts returned might be fewer than the specified limit, but the
  /// number of returned parts never exceeds the limit.
  ///
  /// Parameter [marker] :
  /// An opaque string used for pagination. This value specifies the part at
  /// which the listing of parts should begin. Get the marker value from the
  /// response of a previous List Parts response. You need only include the
  /// marker if you are continuing the pagination of results started in a
  /// previous List Parts request.
  Future<ListPartsOutput> listParts({
    @_s.required String accountId,
    @_s.required String uploadId,
    @_s.required String vaultName,
    String limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/multipart-uploads/${Uri.encodeComponent(uploadId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPartsOutput.fromJson(response);
  }

  /// This operation lists the provisioned capacity units for the specified AWS
  /// account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the account that owns the vault. You can either
  /// specify an AWS account ID or optionally a single '-' (hyphen), in which
  /// case Amazon S3 Glacier uses the AWS account ID associated with the
  /// credentials used to sign the request. If you use an account ID, don't
  /// include any hyphens ('-') in the ID.
  Future<ListProvisionedCapacityOutput> listProvisionedCapacity({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(accountId)}/provisioned-capacity',
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisionedCapacityOutput.fromJson(response);
  }

  /// This operation lists all the tags attached to a vault. The operation
  /// returns an empty map if there are no tags. For more information about
  /// tags, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html">Tagging
  /// Amazon S3 Glacier Resources</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  Future<ListTagsForVaultOutput> listTagsForVault({
    @_s.required String accountId,
    @_s.required String vaultName,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForVaultOutput.fromJson(response);
  }

  /// This operation lists all vaults owned by the calling user's account. The
  /// list returned in the response is ASCII-sorted by vault name.
  ///
  /// By default, this operation returns up to 10 items. If there are more
  /// vaults to list, the response <code>marker</code> field contains the vault
  /// Amazon Resource Name (ARN) at which to continue the list with a new List
  /// Vaults request; otherwise, the <code>marker</code> field is
  /// <code>null</code>. To return a list of vaults that begins at a specific
  /// vault, set the <code>marker</code> request parameter to the vault ARN you
  /// obtained from a previous List Vaults request. You can also limit the
  /// number of vaults returned in the response by specifying the
  /// <code>limit</code> parameter in the request.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/retrieving-vault-info.html">Retrieving
  /// Vault Metadata in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vaults-get.html">List
  /// Vaults </a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '<code>-</code>' (hyphen), in which case Amazon Glacier uses the AWS
  /// account ID associated with the credentials used to sign the request. If
  /// you specify your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [limit] :
  /// The maximum number of vaults to be returned. The default limit is 10. The
  /// number of vaults returned might be fewer than the specified limit, but the
  /// number of returned vaults never exceeds the limit.
  ///
  /// Parameter [marker] :
  /// A string used for pagination. The marker specifies the vault ARN after
  /// which the listing of vaults should begin.
  Future<ListVaultsOutput> listVaults({
    @_s.required String accountId,
    String limit,
    String marker,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    final $query = <String, List<String>>{
      if (limit != null) 'limit': [limit],
      if (marker != null) 'marker': [marker],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/${Uri.encodeComponent(accountId)}/vaults',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVaultsOutput.fromJson(response);
  }

  /// This operation purchases a provisioned capacity unit for an AWS account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The AWS account ID of the account that owns the vault. You can either
  /// specify an AWS account ID or optionally a single '-' (hyphen), in which
  /// case Amazon S3 Glacier uses the AWS account ID associated with the
  /// credentials used to sign the request. If you use an account ID, don't
  /// include any hyphens ('-') in the ID.
  Future<PurchaseProvisionedCapacityOutput> purchaseProvisionedCapacity({
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'POST',
      requestUri: '/${Uri.encodeComponent(accountId)}/provisioned-capacity',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return PurchaseProvisionedCapacityOutput(
      capacityId:
          _s.extractHeaderStringValue(response.headers, 'x-amz-capacity-id'),
    );
  }

  /// This operation removes one or more tags from the set of tags attached to a
  /// vault. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html">Tagging
  /// Amazon S3 Glacier Resources</a>. This operation is idempotent. The
  /// operation will be successful, even if there are no tags attached to the
  /// vault.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Each corresponding tag is removed from the vault.
  Future<void> removeTagsFromVault({
    @_s.required String accountId,
    @_s.required String vaultName,
    List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final $payload = <String, dynamic>{
      if (tagKeys != null) 'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/tags?operation=remove',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation sets and then enacts a data retrieval policy in the region
  /// specified in the PUT request. You can set one policy per region for an AWS
  /// account. The policy is enacted within a few minutes of a successful PUT
  /// operation.
  ///
  /// The set policy operation does not affect retrieval jobs that were in
  /// progress before the policy was enacted. For more information about data
  /// retrieval policies, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html">Amazon
  /// Glacier Data Retrieval Policies</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID. This value must
  /// match the AWS account ID associated with the credentials used to sign the
  /// request. You can either specify an AWS account ID or optionally a single
  /// '<code>-</code>' (hyphen), in which case Amazon Glacier uses the AWS
  /// account ID associated with the credentials used to sign the request. If
  /// you specify your account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [policy] :
  /// The data retrieval policy in JSON format.
  Future<void> setDataRetrievalPolicy({
    @_s.required String accountId,
    DataRetrievalPolicy policy,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    final $payload = <String, dynamic>{
      if (policy != null) 'Policy': policy,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/${Uri.encodeComponent(accountId)}/policies/data-retrieval',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation configures an access policy for a vault and will overwrite
  /// an existing policy. To configure a vault access policy, send a PUT request
  /// to the <code>access-policy</code> subresource of the vault. An access
  /// policy is specific to a vault and is also called a vault subresource. You
  /// can set one access policy per vault and the policy can be up to 20 KB in
  /// size. For more information about vault access policies, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html">Amazon
  /// Glacier Access Control with Vault Access Policies</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [policy] :
  /// The vault access policy as a JSON string.
  Future<void> setVaultAccessPolicy({
    @_s.required String accountId,
    @_s.required String vaultName,
    VaultAccessPolicy policy,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: policy,
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/access-policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation configures notifications that will be sent when specific
  /// events happen to a vault. By default, you don't get any notifications.
  ///
  /// To configure vault notifications, send a PUT request to the
  /// <code>notification-configuration</code> subresource of the vault. The
  /// request should include a JSON document that provides an Amazon SNS topic
  /// and specific events for which you want Amazon S3 Glacier to send
  /// notifications to the topic.
  ///
  /// Amazon SNS topics must grant permission to the vault to be allowed to
  /// publish notifications to the topic. You can configure a vault to publish a
  /// notification for the following vault events:
  ///
  /// <ul>
  /// <li>
  /// <b>ArchiveRetrievalCompleted</b> This event occurs when a job that was
  /// initiated for an archive retrieval is completed (<a>InitiateJob</a>). The
  /// status of the completed job can be "Succeeded" or "Failed". The
  /// notification sent to the SNS topic is the same output as returned from
  /// <a>DescribeJob</a>.
  /// </li>
  /// <li>
  /// <b>InventoryRetrievalCompleted</b> This event occurs when a job that was
  /// initiated for an inventory retrieval is completed (<a>InitiateJob</a>).
  /// The status of the completed job can be "Succeeded" or "Failed". The
  /// notification sent to the SNS topic is the same output as returned from
  /// <a>DescribeJob</a>.
  /// </li>
  /// </ul>
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html">Configuring
  /// Vault Notifications in Amazon S3 Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-put.html">Set
  /// Vault Notification Configuration </a> in the <i>Amazon Glacier Developer
  /// Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [vaultNotificationConfig] :
  /// Provides options for specifying notification configuration.
  Future<void> setVaultNotifications({
    @_s.required String accountId,
    @_s.required String vaultName,
    VaultNotificationConfig vaultNotificationConfig,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    await _protocol.send(
      payload: vaultNotificationConfig,
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/notification-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// This operation adds an archive to a vault. This is a synchronous
  /// operation, and for a successful upload, your data is durably persisted.
  /// Amazon S3 Glacier returns the archive ID in the
  /// <code>x-amz-archive-id</code> header of the response.
  ///
  /// You must use the archive ID to access your data in Amazon S3 Glacier.
  /// After you upload an archive, you should save the archive ID returned so
  /// that you can retrieve or delete the archive later. Besides saving the
  /// archive ID, you can also index it and give it a friendly name to allow for
  /// better searching. You can also use the optional archive description field
  /// to specify how the archive is referred to in an external index of
  /// archives, such as you might create in Amazon DynamoDB. You can also get
  /// the vault inventory to obtain a list of archive IDs in a vault. For more
  /// information, see <a>InitiateJob</a>.
  ///
  /// You must provide a SHA256 tree hash of the data you are uploading. For
  /// information about computing a SHA256 tree hash, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html">Computing
  /// Checksums</a>.
  ///
  /// You can optionally specify an archive description of up to 1,024 printable
  /// ASCII characters. You can get the archive description when you either
  /// retrieve the archive or get the vault inventory. For more information, see
  /// <a>InitiateJob</a>. Amazon Glacier does not interpret the description in
  /// any way. An archive description does not need to be unique. You cannot use
  /// the description to retrieve or sort the archive list.
  ///
  /// Archives are immutable. After you upload an archive, you cannot edit the
  /// archive or its description.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-an-archive.html">Uploading
  /// an Archive in Amazon Glacier</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-post.html">Upload
  /// Archive</a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [RequestTimeoutException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [archiveDescription] :
  /// The optional description of the archive you are uploading.
  ///
  /// Parameter [body] :
  /// The data to upload.
  ///
  /// Parameter [checksum] :
  /// The SHA256 tree hash of the data being uploaded.
  Future<ArchiveCreationOutput> uploadArchive({
    @_s.required String accountId,
    @_s.required String vaultName,
    String archiveDescription,
    Uint8List body,
    String checksum,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final headers = <String, String>{};
    archiveDescription
        ?.let((v) => headers['x-amz-archive-description'] = v.toString());
    checksum?.let((v) => headers['x-amz-sha256-tree-hash'] = v.toString());
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'POST',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/archives',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ArchiveCreationOutput(
      archiveId:
          _s.extractHeaderStringValue(response.headers, 'x-amz-archive-id'),
      checksum: _s.extractHeaderStringValue(
          response.headers, 'x-amz-sha256-tree-hash'),
      location: _s.extractHeaderStringValue(response.headers, 'Location'),
    );
  }

  /// This operation uploads a part of an archive. You can upload archive parts
  /// in any order. You can also upload them in parallel. You can upload up to
  /// 10,000 parts for a multipart upload.
  ///
  /// Amazon Glacier rejects your upload part request if any of the following
  /// conditions is true:
  ///
  /// <ul>
  /// <li>
  /// <b>SHA256 tree hash does not match</b>To ensure that part data is not
  /// corrupted in transmission, you compute a SHA256 tree hash of the part and
  /// include it in your request. Upon receiving the part data, Amazon S3
  /// Glacier also computes a SHA256 tree hash. If these hash values don't
  /// match, the operation fails. For information about computing a SHA256 tree
  /// hash, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html">Computing
  /// Checksums</a>.
  /// </li>
  /// <li>
  /// <b>Part size does not match</b>The size of each part except the last must
  /// match the size specified in the corresponding
  /// <a>InitiateMultipartUpload</a> request. The size of the last part must be
  /// the same size as, or smaller than, the specified size.
  /// <note>
  /// If you upload a part whose size is smaller than the part size you
  /// specified in your initiate multipart upload request and that part is not
  /// the last part, then the upload part request will succeed. However, the
  /// subsequent Complete Multipart Upload request will fail.
  /// </note> </li>
  /// <li>
  /// <b>Range does not align</b>The byte range value in the request does not
  /// align with the part size specified in the corresponding initiate request.
  /// For example, if you specify a part size of 4194304 bytes (4 MB), then 0 to
  /// 4194303 bytes (4 MB - 1) and 4194304 (4 MB) to 8388607 (8 MB - 1) are
  /// valid part ranges. However, if you set a range value of 2 MB to 6 MB, the
  /// range does not align with the part size and the upload will fail.
  /// </li>
  /// </ul>
  /// This operation is idempotent. If you upload the same part multiple times,
  /// the data included in the most recent request overwrites the previously
  /// uploaded data.
  ///
  /// An AWS account has full permission to perform all operations (actions).
  /// However, AWS Identity and Access Management (IAM) users don't have any
  /// permissions by default. You must grant them explicit permission to perform
  /// specific actions. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html">Access
  /// Control Using AWS Identity and Access Management (IAM)</a>.
  ///
  /// For conceptual information and underlying REST API, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html">Uploading
  /// Large Archives in Parts (Multipart Upload)</a> and <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-upload-part.html">Upload
  /// Part </a> in the <i>Amazon Glacier Developer Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [MissingParameterValueException].
  /// May throw [RequestTimeoutException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [accountId] :
  /// The <code>AccountId</code> value is the AWS account ID of the account that
  /// owns the vault. You can either specify an AWS account ID or optionally a
  /// single '<code>-</code>' (hyphen), in which case Amazon S3 Glacier uses the
  /// AWS account ID associated with the credentials used to sign the request.
  /// If you use an account ID, do not include any hyphens ('-') in the ID.
  ///
  /// Parameter [uploadId] :
  /// The upload ID of the multipart upload.
  ///
  /// Parameter [vaultName] :
  /// The name of the vault.
  ///
  /// Parameter [body] :
  /// The data to upload.
  ///
  /// Parameter [checksum] :
  /// The SHA256 tree hash of the data being uploaded.
  ///
  /// Parameter [range] :
  /// Identifies the range of bytes in the assembled archive that will be
  /// uploaded in this part. Amazon S3 Glacier uses this information to assemble
  /// the archive in the proper sequence. The format of this header follows RFC
  /// 2616. An example header is Content-Range:bytes 0-4194303/*.
  Future<UploadMultipartPartOutput> uploadMultipartPart({
    @_s.required String accountId,
    @_s.required String uploadId,
    @_s.required String vaultName,
    Uint8List body,
    String checksum,
    String range,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    ArgumentError.checkNotNull(vaultName, 'vaultName');
    final headers = <String, String>{};
    checksum?.let((v) => headers['x-amz-sha256-tree-hash'] = v.toString());
    range?.let((v) => headers['Content-Range'] = v.toString());
    final response = await _protocol.sendRaw(
      payload: body,
      method: 'PUT',
      requestUri:
          '/${Uri.encodeComponent(accountId)}/vaults/${Uri.encodeComponent(vaultName)}/multipart-uploads/${Uri.encodeComponent(uploadId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UploadMultipartPartOutput(
      checksum: _s.extractHeaderStringValue(
          response.headers, 'x-amz-sha256-tree-hash'),
    );
  }
}

enum ActionCode {
  @_s.JsonValue('ArchiveRetrieval')
  archiveRetrieval,
  @_s.JsonValue('InventoryRetrieval')
  inventoryRetrieval,
  @_s.JsonValue('Select')
  select,
}

/// Contains the Amazon S3 Glacier response to your request.
///
/// For information about the underlying REST API, see <a
/// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-post.html">Upload
/// Archive</a>. For conceptual information, see <a
/// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html">Working
/// with Archives in Amazon S3 Glacier</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ArchiveCreationOutput {
  /// The ID of the archive. This value is also included as part of the location.
  @_s.JsonKey(name: 'x-amz-archive-id')
  final String archiveId;

  /// The checksum of the archive computed by Amazon S3 Glacier.
  @_s.JsonKey(name: 'x-amz-sha256-tree-hash')
  final String checksum;

  /// The relative URI path of the newly added archive resource.
  @_s.JsonKey(name: 'Location')
  final String location;

  ArchiveCreationOutput({
    this.archiveId,
    this.checksum,
    this.location,
  });
  factory ArchiveCreationOutput.fromJson(Map<String, dynamic> json) =>
      _$ArchiveCreationOutputFromJson(json);
}

/// Contains information about the comma-separated value (CSV) file to select
/// from.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CSVInput {
  /// A single character used to indicate that a row should be ignored when the
  /// character is present at the start of that row.
  @_s.JsonKey(name: 'Comments')
  final String comments;

  /// A value used to separate individual fields from each other within a record.
  @_s.JsonKey(name: 'FieldDelimiter')
  final String fieldDelimiter;

  /// Describes the first line of input. Valid values are <code>None</code>,
  /// <code>Ignore</code>, and <code>Use</code>.
  @_s.JsonKey(name: 'FileHeaderInfo')
  final FileHeaderInfo fileHeaderInfo;

  /// A value used as an escape character where the field delimiter is part of the
  /// value.
  @_s.JsonKey(name: 'QuoteCharacter')
  final String quoteCharacter;

  /// A single character used for escaping the quotation-mark character inside an
  /// already escaped value.
  @_s.JsonKey(name: 'QuoteEscapeCharacter')
  final String quoteEscapeCharacter;

  /// A value used to separate individual records from each other.
  @_s.JsonKey(name: 'RecordDelimiter')
  final String recordDelimiter;

  CSVInput({
    this.comments,
    this.fieldDelimiter,
    this.fileHeaderInfo,
    this.quoteCharacter,
    this.quoteEscapeCharacter,
    this.recordDelimiter,
  });
  factory CSVInput.fromJson(Map<String, dynamic> json) =>
      _$CSVInputFromJson(json);

  Map<String, dynamic> toJson() => _$CSVInputToJson(this);
}

/// Contains information about the comma-separated value (CSV) file that the job
/// results are stored in.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CSVOutput {
  /// A value used to separate individual fields from each other within a record.
  @_s.JsonKey(name: 'FieldDelimiter')
  final String fieldDelimiter;

  /// A value used as an escape character where the field delimiter is part of the
  /// value.
  @_s.JsonKey(name: 'QuoteCharacter')
  final String quoteCharacter;

  /// A single character used for escaping the quotation-mark character inside an
  /// already escaped value.
  @_s.JsonKey(name: 'QuoteEscapeCharacter')
  final String quoteEscapeCharacter;

  /// A value that indicates whether all output fields should be contained within
  /// quotation marks.
  @_s.JsonKey(name: 'QuoteFields')
  final QuoteFields quoteFields;

  /// A value used to separate individual records from each other.
  @_s.JsonKey(name: 'RecordDelimiter')
  final String recordDelimiter;

  CSVOutput({
    this.fieldDelimiter,
    this.quoteCharacter,
    this.quoteEscapeCharacter,
    this.quoteFields,
    this.recordDelimiter,
  });
  factory CSVOutput.fromJson(Map<String, dynamic> json) =>
      _$CSVOutputFromJson(json);

  Map<String, dynamic> toJson() => _$CSVOutputToJson(this);
}

enum CannedACL {
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
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVaultOutput {
  /// The URI of the vault that was created.
  @_s.JsonKey(name: 'Location')
  final String location;

  CreateVaultOutput({
    this.location,
  });
  factory CreateVaultOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateVaultOutputFromJson(json);
}

/// Data retrieval policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataRetrievalPolicy {
  /// The policy rule. Although this is a list type, currently there must be only
  /// one rule, which contains a Strategy field and optionally a BytesPerHour
  /// field.
  @_s.JsonKey(name: 'Rules')
  final List<DataRetrievalRule> rules;

  DataRetrievalPolicy({
    this.rules,
  });
  factory DataRetrievalPolicy.fromJson(Map<String, dynamic> json) =>
      _$DataRetrievalPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$DataRetrievalPolicyToJson(this);
}

/// Data retrieval policy rule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataRetrievalRule {
  /// The maximum number of bytes that can be retrieved in an hour.
  ///
  /// This field is required only if the value of the Strategy field is
  /// <code>BytesPerHour</code>. Your PUT operation will be rejected if the
  /// Strategy field is not set to <code>BytesPerHour</code> and you set this
  /// field.
  @_s.JsonKey(name: 'BytesPerHour')
  final int bytesPerHour;

  /// The type of data retrieval policy to set.
  ///
  /// Valid values: BytesPerHour|FreeTier|None
  @_s.JsonKey(name: 'Strategy')
  final String strategy;

  DataRetrievalRule({
    this.bytesPerHour,
    this.strategy,
  });
  factory DataRetrievalRule.fromJson(Map<String, dynamic> json) =>
      _$DataRetrievalRuleFromJson(json);

  Map<String, dynamic> toJson() => _$DataRetrievalRuleToJson(this);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVaultOutput {
  /// The Universal Coordinated Time (UTC) date when the vault was created. This
  /// value should be a string in the ISO 8601 date format, for example
  /// <code>2012-03-20T17:03:43.221Z</code>.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The Universal Coordinated Time (UTC) date when Amazon S3 Glacier completed
  /// the last vault inventory. This value should be a string in the ISO 8601 date
  /// format, for example <code>2012-03-20T17:03:43.221Z</code>.
  @_s.JsonKey(name: 'LastInventoryDate')
  final String lastInventoryDate;

  /// The number of archives in the vault as of the last inventory date. This
  /// field will return <code>null</code> if an inventory has not yet run on the
  /// vault, for example if you just created the vault.
  @_s.JsonKey(name: 'NumberOfArchives')
  final int numberOfArchives;

  /// Total size, in bytes, of the archives in the vault as of the last inventory
  /// date. This field will return null if an inventory has not yet run on the
  /// vault, for example if you just created the vault.
  @_s.JsonKey(name: 'SizeInBytes')
  final int sizeInBytes;

  /// The Amazon Resource Name (ARN) of the vault.
  @_s.JsonKey(name: 'VaultARN')
  final String vaultARN;

  /// The name of the vault.
  @_s.JsonKey(name: 'VaultName')
  final String vaultName;

  DescribeVaultOutput({
    this.creationDate,
    this.lastInventoryDate,
    this.numberOfArchives,
    this.sizeInBytes,
    this.vaultARN,
    this.vaultName,
  });
  factory DescribeVaultOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVaultOutputFromJson(json);
}

/// Contains information about the encryption used to store the job results in
/// Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Encryption {
  /// The server-side encryption algorithm used when storing job results in Amazon
  /// S3, for example <code>AES256</code> or <code>aws:kms</code>.
  @_s.JsonKey(name: 'EncryptionType')
  final EncryptionType encryptionType;

  /// Optional. If the encryption type is <code>aws:kms</code>, you can use this
  /// value to specify the encryption context for the job results.
  @_s.JsonKey(name: 'KMSContext')
  final String kMSContext;

  /// The AWS KMS key ID to use for object encryption. All GET and PUT requests
  /// for an object protected by AWS KMS fail if not made by using Secure Sockets
  /// Layer (SSL) or Signature Version 4.
  @_s.JsonKey(name: 'KMSKeyId')
  final String kMSKeyId;

  Encryption({
    this.encryptionType,
    this.kMSContext,
    this.kMSKeyId,
  });
  factory Encryption.fromJson(Map<String, dynamic> json) =>
      _$EncryptionFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionToJson(this);
}

enum EncryptionType {
  @_s.JsonValue('aws:kms')
  awsKms,
  @_s.JsonValue('AES256')
  aes256,
}

enum ExpressionType {
  @_s.JsonValue('SQL')
  sql,
}

enum FileHeaderInfo {
  @_s.JsonValue('USE')
  use,
  @_s.JsonValue('IGNORE')
  ignore,
  @_s.JsonValue('NONE')
  none,
}

/// Contains the Amazon S3 Glacier response to the
/// <code>GetDataRetrievalPolicy</code> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataRetrievalPolicyOutput {
  /// Contains the returned data retrieval policy in JSON format.
  @_s.JsonKey(name: 'Policy')
  final DataRetrievalPolicy policy;

  GetDataRetrievalPolicyOutput({
    this.policy,
  });
  factory GetDataRetrievalPolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDataRetrievalPolicyOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetJobOutputOutput {
  /// Indicates the range units accepted. For more information, see <a
  /// href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html">RFC2616</a>.
  @_s.JsonKey(name: 'Accept-Ranges')
  final String acceptRanges;

  /// The description of an archive.
  @_s.JsonKey(name: 'x-amz-archive-description')
  final String archiveDescription;

  /// The job data, either archive data or inventory data.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'body')
  final Uint8List body;

  /// The checksum of the data in the response. This header is returned only when
  /// retrieving the output for an archive retrieval job. Furthermore, this header
  /// appears only under the following conditions:
  ///
  /// <ul>
  /// <li>
  /// You get the entire range of the archive.
  /// </li>
  /// <li>
  /// You request a range to return of the archive that starts and ends on a
  /// multiple of 1 MB. For example, if you have an 3.1 MB archive and you specify
  /// a range to return that starts at 1 MB and ends at 2 MB, then the
  /// x-amz-sha256-tree-hash is returned as a response header.
  /// </li>
  /// <li>
  /// You request a range of the archive to return that starts on a multiple of 1
  /// MB and goes to the end of the archive. For example, if you have a 3.1 MB
  /// archive and you specify a range that starts at 2 MB and ends at 3.1 MB (the
  /// end of the archive), then the x-amz-sha256-tree-hash is returned as a
  /// response header.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'x-amz-sha256-tree-hash')
  final String checksum;

  /// The range of bytes returned by Amazon S3 Glacier. If only partial output is
  /// downloaded, the response provides the range of bytes Amazon S3 Glacier
  /// returned. For example, bytes 0-1048575/8388608 returns the first 1 MB from 8
  /// MB.
  @_s.JsonKey(name: 'Content-Range')
  final String contentRange;

  /// The Content-Type depends on whether the job output is an archive or a vault
  /// inventory. For archive data, the Content-Type is application/octet-stream.
  /// For vault inventory, if you requested CSV format when you initiated the job,
  /// the Content-Type is text/csv. Otherwise, by default, vault inventory is
  /// returned as JSON, and the Content-Type is application/json.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// The HTTP response code for a job output request. The value depends on
  /// whether a range was specified in the request.
  @_s.JsonKey(name: 'status')
  final int status;

  GetJobOutputOutput({
    this.acceptRanges,
    this.archiveDescription,
    this.body,
    this.checksum,
    this.contentRange,
    this.contentType,
    this.status,
  });
  factory GetJobOutputOutput.fromJson(Map<String, dynamic> json) =>
      _$GetJobOutputOutputFromJson(json);
}

/// Output for GetVaultAccessPolicy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVaultAccessPolicyOutput {
  /// Contains the returned vault access policy as a JSON string.
  @_s.JsonKey(name: 'policy')
  final VaultAccessPolicy policy;

  GetVaultAccessPolicyOutput({
    this.policy,
  });
  factory GetVaultAccessPolicyOutput.fromJson(Map<String, dynamic> json) =>
      _$GetVaultAccessPolicyOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVaultLockOutput {
  /// The UTC date and time at which the vault lock was put into the
  /// <code>InProgress</code> state.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The UTC date and time at which the lock ID expires. This value can be
  /// <code>null</code> if the vault lock is in a <code>Locked</code> state.
  @_s.JsonKey(name: 'ExpirationDate')
  final String expirationDate;

  /// The vault lock policy as a JSON string, which uses "\" as an escape
  /// character.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  /// The state of the vault lock. <code>InProgress</code> or <code>Locked</code>.
  @_s.JsonKey(name: 'State')
  final String state;

  GetVaultLockOutput({
    this.creationDate,
    this.expirationDate,
    this.policy,
    this.state,
  });
  factory GetVaultLockOutput.fromJson(Map<String, dynamic> json) =>
      _$GetVaultLockOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVaultNotificationsOutput {
  /// Returns the notification configuration set on the vault.
  @_s.JsonKey(name: 'vaultNotificationConfig')
  final VaultNotificationConfig vaultNotificationConfig;

  GetVaultNotificationsOutput({
    this.vaultNotificationConfig,
  });
  factory GetVaultNotificationsOutput.fromJson(Map<String, dynamic> json) =>
      _$GetVaultNotificationsOutputFromJson(json);
}

/// Contains the description of an Amazon S3 Glacier job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GlacierJobDescription {
  /// The job type. This value is either <code>ArchiveRetrieval</code>,
  /// <code>InventoryRetrieval</code>, or <code>Select</code>.
  @_s.JsonKey(name: 'Action')
  final ActionCode action;

  /// The archive ID requested for a select job or archive retrieval. Otherwise,
  /// this field is null.
  @_s.JsonKey(name: 'ArchiveId')
  final String archiveId;

  /// The SHA256 tree hash of the entire archive for an archive retrieval. For
  /// inventory retrieval or select jobs, this field is null.
  @_s.JsonKey(name: 'ArchiveSHA256TreeHash')
  final String archiveSHA256TreeHash;

  /// For an archive retrieval job, this value is the size in bytes of the archive
  /// being requested for download. For an inventory retrieval or select job, this
  /// value is null.
  @_s.JsonKey(name: 'ArchiveSizeInBytes')
  final int archiveSizeInBytes;

  /// The job status. When a job is completed, you get the job's output using Get
  /// Job Output (GET output).
  @_s.JsonKey(name: 'Completed')
  final bool completed;

  /// The UTC time that the job request completed. While the job is in progress,
  /// the value is null.
  @_s.JsonKey(name: 'CompletionDate')
  final String completionDate;

  /// The UTC date when the job was created. This value is a string representation
  /// of ISO 8601 date format, for example
  /// <code>"2012-03-20T17:03:43.221Z"</code>.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// Parameters used for range inventory retrieval.
  @_s.JsonKey(name: 'InventoryRetrievalParameters')
  final InventoryRetrievalJobDescription inventoryRetrievalParameters;

  /// For an inventory retrieval job, this value is the size in bytes of the
  /// inventory requested for download. For an archive retrieval or select job,
  /// this value is null.
  @_s.JsonKey(name: 'InventorySizeInBytes')
  final int inventorySizeInBytes;

  /// The job description provided when initiating the job.
  @_s.JsonKey(name: 'JobDescription')
  final String jobDescription;

  /// An opaque string that identifies an Amazon S3 Glacier job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// Contains the job output location.
  @_s.JsonKey(name: 'JobOutputPath')
  final String jobOutputPath;

  /// Contains the location where the data from the select job is stored.
  @_s.JsonKey(name: 'OutputLocation')
  final OutputLocation outputLocation;

  /// The retrieved byte range for archive retrieval jobs in the form
  /// <i>StartByteValue</i>-<i>EndByteValue</i>. If no range was specified in the
  /// archive retrieval, then the whole archive is retrieved. In this case,
  /// <i>StartByteValue</i> equals 0 and <i>EndByteValue</i> equals the size of
  /// the archive minus 1. For inventory retrieval or select jobs, this field is
  /// null.
  @_s.JsonKey(name: 'RetrievalByteRange')
  final String retrievalByteRange;

  /// For an archive retrieval job, this value is the checksum of the archive.
  /// Otherwise, this value is null.
  ///
  /// The SHA256 tree hash value for the requested range of an archive. If the
  /// <b>InitiateJob</b> request for an archive specified a tree-hash aligned
  /// range, then this field returns a value.
  ///
  /// If the whole archive is retrieved, this value is the same as the
  /// ArchiveSHA256TreeHash value.
  ///
  /// This field is null for the following:
  ///
  /// <ul>
  /// <li>
  /// Archive retrieval jobs that specify a range that is not tree-hash aligned
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// Archival jobs that specify a range that is equal to the whole archive, when
  /// the job status is <code>InProgress</code>
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// Inventory jobs
  /// </li>
  /// <li>
  /// Select jobs
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SHA256TreeHash')
  final String sHA256TreeHash;

  /// An Amazon SNS topic that receives notification.
  @_s.JsonKey(name: 'SNSTopic')
  final String sNSTopic;

  /// Contains the parameters used for a select.
  @_s.JsonKey(name: 'SelectParameters')
  final SelectParameters selectParameters;

  /// The status code can be <code>InProgress</code>, <code>Succeeded</code>, or
  /// <code>Failed</code>, and indicates the status of the job.
  @_s.JsonKey(name: 'StatusCode')
  final StatusCode statusCode;

  /// A friendly message that describes the job status.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  /// The tier to use for a select or an archive retrieval. Valid values are
  /// <code>Expedited</code>, <code>Standard</code>, or <code>Bulk</code>.
  /// <code>Standard</code> is the default.
  @_s.JsonKey(name: 'Tier')
  final String tier;

  /// The Amazon Resource Name (ARN) of the vault from which an archive retrieval
  /// was requested.
  @_s.JsonKey(name: 'VaultARN')
  final String vaultARN;

  GlacierJobDescription({
    this.action,
    this.archiveId,
    this.archiveSHA256TreeHash,
    this.archiveSizeInBytes,
    this.completed,
    this.completionDate,
    this.creationDate,
    this.inventoryRetrievalParameters,
    this.inventorySizeInBytes,
    this.jobDescription,
    this.jobId,
    this.jobOutputPath,
    this.outputLocation,
    this.retrievalByteRange,
    this.sHA256TreeHash,
    this.sNSTopic,
    this.selectParameters,
    this.statusCode,
    this.statusMessage,
    this.tier,
    this.vaultARN,
  });
  factory GlacierJobDescription.fromJson(Map<String, dynamic> json) =>
      _$GlacierJobDescriptionFromJson(json);
}

/// Contains information about a grant.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Grant {
  /// The grantee.
  @_s.JsonKey(name: 'Grantee')
  final Grantee grantee;

  /// Specifies the permission given to the grantee.
  @_s.JsonKey(name: 'Permission')
  final Permission permission;

  Grant({
    this.grantee,
    this.permission,
  });
  factory Grant.fromJson(Map<String, dynamic> json) => _$GrantFromJson(json);

  Map<String, dynamic> toJson() => _$GrantToJson(this);
}

/// Contains information about the grantee.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Grantee {
  /// Type of grantee
  @_s.JsonKey(name: 'Type')
  final Type type;

  /// Screen name of the grantee.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// Email address of the grantee.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// The canonical user ID of the grantee.
  @_s.JsonKey(name: 'ID')
  final String id;

  /// URI of the grantee group.
  @_s.JsonKey(name: 'URI')
  final String uri;

  Grantee({
    @_s.required this.type,
    this.displayName,
    this.emailAddress,
    this.id,
    this.uri,
  });
  factory Grantee.fromJson(Map<String, dynamic> json) =>
      _$GranteeFromJson(json);

  Map<String, dynamic> toJson() => _$GranteeToJson(this);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InitiateJobOutput {
  /// The ID of the job.
  @_s.JsonKey(name: 'x-amz-job-id')
  final String jobId;

  /// The path to the location of where the select results are stored.
  @_s.JsonKey(name: 'x-amz-job-output-path')
  final String jobOutputPath;

  /// The relative URI path of the job.
  @_s.JsonKey(name: 'Location')
  final String location;

  InitiateJobOutput({
    this.jobId,
    this.jobOutputPath,
    this.location,
  });
  factory InitiateJobOutput.fromJson(Map<String, dynamic> json) =>
      _$InitiateJobOutputFromJson(json);
}

/// The Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InitiateMultipartUploadOutput {
  /// The relative URI path of the multipart upload ID Amazon S3 Glacier created.
  @_s.JsonKey(name: 'Location')
  final String location;

  /// The ID of the multipart upload. This value is also included as part of the
  /// location.
  @_s.JsonKey(name: 'x-amz-multipart-upload-id')
  final String uploadId;

  InitiateMultipartUploadOutput({
    this.location,
    this.uploadId,
  });
  factory InitiateMultipartUploadOutput.fromJson(Map<String, dynamic> json) =>
      _$InitiateMultipartUploadOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InitiateVaultLockOutput {
  /// The lock ID, which is used to complete the vault locking process.
  @_s.JsonKey(name: 'x-amz-lock-id')
  final String lockId;

  InitiateVaultLockOutput({
    this.lockId,
  });
  factory InitiateVaultLockOutput.fromJson(Map<String, dynamic> json) =>
      _$InitiateVaultLockOutputFromJson(json);
}

/// Describes how the archive is serialized.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputSerialization {
  /// Describes the serialization of a CSV-encoded object.
  @_s.JsonKey(name: 'csv')
  final CSVInput csv;

  InputSerialization({
    this.csv,
  });
  factory InputSerialization.fromJson(Map<String, dynamic> json) =>
      _$InputSerializationFromJson(json);

  Map<String, dynamic> toJson() => _$InputSerializationToJson(this);
}

/// Describes the options for a range inventory retrieval job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InventoryRetrievalJobDescription {
  /// The end of the date range in UTC for vault inventory retrieval that includes
  /// archives created before this date. This value should be a string in the ISO
  /// 8601 date format, for example <code>2013-03-20T17:03:43Z</code>.
  @_s.JsonKey(name: 'EndDate')
  final String endDate;

  /// The output format for the vault inventory list, which is set by the
  /// <b>InitiateJob</b> request when initiating a job to retrieve a vault
  /// inventory. Valid values are <code>CSV</code> and <code>JSON</code>.
  @_s.JsonKey(name: 'Format')
  final String format;

  /// The maximum number of inventory items returned per vault inventory retrieval
  /// request. This limit is set when initiating the job with the a
  /// <b>InitiateJob</b> request.
  @_s.JsonKey(name: 'Limit')
  final String limit;

  /// An opaque string that represents where to continue pagination of the vault
  /// inventory retrieval results. You use the marker in a new <b>InitiateJob</b>
  /// request to obtain additional inventory items. If there are no more inventory
  /// items, this value is <code>null</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html#api-initiate-job-post-vault-inventory-list-filtering">
  /// Range Inventory Retrieval</a>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The start of the date range in Universal Coordinated Time (UTC) for vault
  /// inventory retrieval that includes archives created on or after this date.
  /// This value should be a string in the ISO 8601 date format, for example
  /// <code>2013-03-20T17:03:43Z</code>.
  @_s.JsonKey(name: 'StartDate')
  final String startDate;

  InventoryRetrievalJobDescription({
    this.endDate,
    this.format,
    this.limit,
    this.marker,
    this.startDate,
  });
  factory InventoryRetrievalJobDescription.fromJson(
          Map<String, dynamic> json) =>
      _$InventoryRetrievalJobDescriptionFromJson(json);
}

/// Provides options for specifying a range inventory retrieval job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InventoryRetrievalJobInput {
  /// The end of the date range in UTC for vault inventory retrieval that includes
  /// archives created before this date. This value should be a string in the ISO
  /// 8601 date format, for example <code>2013-03-20T17:03:43Z</code>.
  @_s.JsonKey(name: 'EndDate')
  final String endDate;

  /// Specifies the maximum number of inventory items returned per vault inventory
  /// retrieval request. Valid values are greater than or equal to 1.
  @_s.JsonKey(name: 'Limit')
  final String limit;

  /// An opaque string that represents where to continue pagination of the vault
  /// inventory retrieval results. You use the marker in a new <b>InitiateJob</b>
  /// request to obtain additional inventory items. If there are no more inventory
  /// items, this value is <code>null</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The start of the date range in UTC for vault inventory retrieval that
  /// includes archives created on or after this date. This value should be a
  /// string in the ISO 8601 date format, for example
  /// <code>2013-03-20T17:03:43Z</code>.
  @_s.JsonKey(name: 'StartDate')
  final String startDate;

  InventoryRetrievalJobInput({
    this.endDate,
    this.limit,
    this.marker,
    this.startDate,
  });
  Map<String, dynamic> toJson() => _$InventoryRetrievalJobInputToJson(this);
}

/// Provides options for defining a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class JobParameters {
  /// The ID of the archive that you want to retrieve. This field is required only
  /// if <code>Type</code> is set to <code>select</code> or
  /// <code>archive-retrieval</code>code&gt;. An error occurs if you specify this
  /// request parameter for an inventory retrieval job request.
  @_s.JsonKey(name: 'ArchiveId')
  final String archiveId;

  /// The optional description for the job. The description must be less than or
  /// equal to 1,024 bytes. The allowable characters are 7-bit ASCII without
  /// control codes-specifically, ASCII values 32-126 decimal or 0x20-0x7E
  /// hexadecimal.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// When initiating a job to retrieve a vault inventory, you can optionally add
  /// this parameter to your request to specify the output format. If you are
  /// initiating an inventory job and do not specify a Format field, JSON is the
  /// default format. Valid values are "CSV" and "JSON".
  @_s.JsonKey(name: 'Format')
  final String format;

  /// Input parameters used for range inventory retrieval.
  @_s.JsonKey(name: 'InventoryRetrievalParameters')
  final InventoryRetrievalJobInput inventoryRetrievalParameters;

  /// Contains information about the location where the select job results are
  /// stored.
  @_s.JsonKey(name: 'OutputLocation')
  final OutputLocation outputLocation;

  /// The byte range to retrieve for an archive retrieval. in the form
  /// "<i>StartByteValue</i>-<i>EndByteValue</i>" If not specified, the whole
  /// archive is retrieved. If specified, the byte range must be megabyte
  /// (1024*1024) aligned which means that <i>StartByteValue</i> must be divisible
  /// by 1 MB and <i>EndByteValue</i> plus 1 must be divisible by 1 MB or be the
  /// end of the archive specified as the archive byte size value minus 1. If
  /// RetrievalByteRange is not megabyte aligned, this operation returns a 400
  /// response.
  ///
  /// An error occurs if you specify this field for an inventory retrieval job
  /// request.
  @_s.JsonKey(name: 'RetrievalByteRange')
  final String retrievalByteRange;

  /// The Amazon SNS topic ARN to which Amazon S3 Glacier sends a notification
  /// when the job is completed and the output is ready for you to download. The
  /// specified topic publishes the notification to its subscribers. The SNS topic
  /// must exist.
  @_s.JsonKey(name: 'SNSTopic')
  final String sNSTopic;

  /// Contains the parameters that define a job.
  @_s.JsonKey(name: 'SelectParameters')
  final SelectParameters selectParameters;

  /// The tier to use for a select or an archive retrieval job. Valid values are
  /// <code>Expedited</code>, <code>Standard</code>, or <code>Bulk</code>.
  /// <code>Standard</code> is the default.
  @_s.JsonKey(name: 'Tier')
  final String tier;

  /// The job type. You can initiate a job to perform a select query on an
  /// archive, retrieve an archive, or get an inventory of a vault. Valid values
  /// are "select", "archive-retrieval" and "inventory-retrieval".
  @_s.JsonKey(name: 'Type')
  final String type;

  JobParameters({
    this.archiveId,
    this.description,
    this.format,
    this.inventoryRetrievalParameters,
    this.outputLocation,
    this.retrievalByteRange,
    this.sNSTopic,
    this.selectParameters,
    this.tier,
    this.type,
  });
  Map<String, dynamic> toJson() => _$JobParametersToJson(this);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListJobsOutput {
  /// A list of job objects. Each job object contains metadata describing the job.
  @_s.JsonKey(name: 'JobList')
  final List<GlacierJobDescription> jobList;

  /// An opaque string used for pagination that specifies the job at which the
  /// listing of jobs should begin. You get the <code>marker</code> value from a
  /// previous List Jobs response. You only need to include the marker if you are
  /// continuing the pagination of the results started in a previous List Jobs
  /// request.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  ListJobsOutput({
    this.jobList,
    this.marker,
  });
  factory ListJobsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListJobsOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMultipartUploadsOutput {
  /// An opaque string that represents where to continue pagination of the
  /// results. You use the marker in a new List Multipart Uploads request to
  /// obtain more uploads in the list. If there are no more uploads, this value is
  /// <code>null</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// A list of in-progress multipart uploads.
  @_s.JsonKey(name: 'UploadsList')
  final List<UploadListElement> uploadsList;

  ListMultipartUploadsOutput({
    this.marker,
    this.uploadsList,
  });
  factory ListMultipartUploadsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListMultipartUploadsOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPartsOutput {
  /// The description of the archive that was specified in the Initiate Multipart
  /// Upload request.
  @_s.JsonKey(name: 'ArchiveDescription')
  final String archiveDescription;

  /// The UTC time at which the multipart upload was initiated.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// An opaque string that represents where to continue pagination of the
  /// results. You use the marker in a new List Parts request to obtain more jobs
  /// in the list. If there are no more parts, this value is <code>null</code>.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// The ID of the upload to which the parts are associated.
  @_s.JsonKey(name: 'MultipartUploadId')
  final String multipartUploadId;

  /// The part size in bytes. This is the same value that you specified in the
  /// Initiate Multipart Upload request.
  @_s.JsonKey(name: 'PartSizeInBytes')
  final int partSizeInBytes;

  /// A list of the part sizes of the multipart upload. Each object in the array
  /// contains a <code>RangeBytes</code> and <code>sha256-tree-hash</code>
  /// name/value pair.
  @_s.JsonKey(name: 'Parts')
  final List<PartListElement> parts;

  /// The Amazon Resource Name (ARN) of the vault to which the multipart upload
  /// was initiated.
  @_s.JsonKey(name: 'VaultARN')
  final String vaultARN;

  ListPartsOutput({
    this.archiveDescription,
    this.creationDate,
    this.marker,
    this.multipartUploadId,
    this.partSizeInBytes,
    this.parts,
    this.vaultARN,
  });
  factory ListPartsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListPartsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProvisionedCapacityOutput {
  /// The response body contains the following JSON fields.
  @_s.JsonKey(name: 'ProvisionedCapacityList')
  final List<ProvisionedCapacityDescription> provisionedCapacityList;

  ListProvisionedCapacityOutput({
    this.provisionedCapacityList,
  });
  factory ListProvisionedCapacityOutput.fromJson(Map<String, dynamic> json) =>
      _$ListProvisionedCapacityOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForVaultOutput {
  /// The tags attached to the vault. Each tag is composed of a key and a value.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForVaultOutput({
    this.tags,
  });
  factory ListTagsForVaultOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForVaultOutputFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVaultsOutput {
  /// The vault ARN at which to continue pagination of the results. You use the
  /// marker in another List Vaults request to obtain more vaults in the list.
  @_s.JsonKey(name: 'Marker')
  final String marker;

  /// List of vaults.
  @_s.JsonKey(name: 'VaultList')
  final List<DescribeVaultOutput> vaultList;

  ListVaultsOutput({
    this.marker,
    this.vaultList,
  });
  factory ListVaultsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListVaultsOutputFromJson(json);
}

/// Contains information about the location where the select job results are
/// stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputLocation {
  /// Describes an S3 location that will receive the results of the job request.
  @_s.JsonKey(name: 'S3')
  final S3Location s3;

  OutputLocation({
    this.s3,
  });
  factory OutputLocation.fromJson(Map<String, dynamic> json) =>
      _$OutputLocationFromJson(json);

  Map<String, dynamic> toJson() => _$OutputLocationToJson(this);
}

/// Describes how the select output is serialized.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputSerialization {
  /// Describes the serialization of CSV-encoded query results.
  @_s.JsonKey(name: 'csv')
  final CSVOutput csv;

  OutputSerialization({
    this.csv,
  });
  factory OutputSerialization.fromJson(Map<String, dynamic> json) =>
      _$OutputSerializationFromJson(json);

  Map<String, dynamic> toJson() => _$OutputSerializationToJson(this);
}

/// A list of the part sizes of the multipart upload.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PartListElement {
  /// The byte range of a part, inclusive of the upper value of the range.
  @_s.JsonKey(name: 'RangeInBytes')
  final String rangeInBytes;

  /// The SHA256 tree hash value that Amazon S3 Glacier calculated for the part.
  /// This field is never <code>null</code>.
  @_s.JsonKey(name: 'SHA256TreeHash')
  final String sHA256TreeHash;

  PartListElement({
    this.rangeInBytes,
    this.sHA256TreeHash,
  });
  factory PartListElement.fromJson(Map<String, dynamic> json) =>
      _$PartListElementFromJson(json);
}

enum Permission {
  @_s.JsonValue('FULL_CONTROL')
  fullControl,
  @_s.JsonValue('WRITE')
  write,
  @_s.JsonValue('WRITE_ACP')
  writeAcp,
  @_s.JsonValue('READ')
  read,
  @_s.JsonValue('READ_ACP')
  readAcp,
}

/// The definition for a provisioned capacity unit.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionedCapacityDescription {
  /// The ID that identifies the provisioned capacity unit.
  @_s.JsonKey(name: 'CapacityId')
  final String capacityId;

  /// The date that the provisioned capacity unit expires, in Universal
  /// Coordinated Time (UTC).
  @_s.JsonKey(name: 'ExpirationDate')
  final String expirationDate;

  /// The date that the provisioned capacity unit was purchased, in Universal
  /// Coordinated Time (UTC).
  @_s.JsonKey(name: 'StartDate')
  final String startDate;

  ProvisionedCapacityDescription({
    this.capacityId,
    this.expirationDate,
    this.startDate,
  });
  factory ProvisionedCapacityDescription.fromJson(Map<String, dynamic> json) =>
      _$ProvisionedCapacityDescriptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PurchaseProvisionedCapacityOutput {
  /// The ID that identifies the provisioned capacity unit.
  @_s.JsonKey(name: 'x-amz-capacity-id')
  final String capacityId;

  PurchaseProvisionedCapacityOutput({
    this.capacityId,
  });
  factory PurchaseProvisionedCapacityOutput.fromJson(
          Map<String, dynamic> json) =>
      _$PurchaseProvisionedCapacityOutputFromJson(json);
}

enum QuoteFields {
  @_s.JsonValue('ALWAYS')
  always,
  @_s.JsonValue('ASNEEDED')
  asneeded,
}

/// Contains information about the location in Amazon S3 where the select job
/// results are stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Location {
  /// A list of grants that control access to the staged results.
  @_s.JsonKey(name: 'AccessControlList')
  final List<Grant> accessControlList;

  /// The name of the Amazon S3 bucket where the job results are stored.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// The canned access control list (ACL) to apply to the job results.
  @_s.JsonKey(name: 'CannedACL')
  final CannedACL cannedACL;

  /// Contains information about the encryption used to store the job results in
  /// Amazon S3.
  @_s.JsonKey(name: 'Encryption')
  final Encryption encryption;

  /// The prefix that is prepended to the results for this request.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  /// The storage class used to store the job results.
  @_s.JsonKey(name: 'StorageClass')
  final StorageClass storageClass;

  /// The tag-set that is applied to the job results.
  @_s.JsonKey(name: 'Tagging')
  final Map<String, String> tagging;

  /// A map of metadata to store with the job results in Amazon S3.
  @_s.JsonKey(name: 'UserMetadata')
  final Map<String, String> userMetadata;

  S3Location({
    this.accessControlList,
    this.bucketName,
    this.cannedACL,
    this.encryption,
    this.prefix,
    this.storageClass,
    this.tagging,
    this.userMetadata,
  });
  factory S3Location.fromJson(Map<String, dynamic> json) =>
      _$S3LocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

/// Contains information about the parameters used for a select.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SelectParameters {
  /// The expression that is used to select the object.
  @_s.JsonKey(name: 'Expression')
  final String expression;

  /// The type of the provided expression, for example <code>SQL</code>.
  @_s.JsonKey(name: 'ExpressionType')
  final ExpressionType expressionType;

  /// Describes the serialization format of the object.
  @_s.JsonKey(name: 'InputSerialization')
  final InputSerialization inputSerialization;

  /// Describes how the results of the select job are serialized.
  @_s.JsonKey(name: 'OutputSerialization')
  final OutputSerialization outputSerialization;

  SelectParameters({
    this.expression,
    this.expressionType,
    this.inputSerialization,
    this.outputSerialization,
  });
  factory SelectParameters.fromJson(Map<String, dynamic> json) =>
      _$SelectParametersFromJson(json);

  Map<String, dynamic> toJson() => _$SelectParametersToJson(this);
}

enum StatusCode {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Failed')
  failed,
}

enum StorageClass {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('REDUCED_REDUNDANCY')
  reducedRedundancy,
  @_s.JsonValue('STANDARD_IA')
  standardIa,
}

enum Type {
  @_s.JsonValue('AmazonCustomerByEmail')
  amazonCustomerByEmail,
  @_s.JsonValue('CanonicalUser')
  canonicalUser,
  @_s.JsonValue('Group')
  group,
}

/// A list of in-progress multipart uploads for a vault.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UploadListElement {
  /// The description of the archive that was specified in the Initiate Multipart
  /// Upload request.
  @_s.JsonKey(name: 'ArchiveDescription')
  final String archiveDescription;

  /// The UTC time at which the multipart upload was initiated.
  @_s.JsonKey(name: 'CreationDate')
  final String creationDate;

  /// The ID of a multipart upload.
  @_s.JsonKey(name: 'MultipartUploadId')
  final String multipartUploadId;

  /// The part size, in bytes, specified in the Initiate Multipart Upload request.
  /// This is the size of all the parts in the upload except the last part, which
  /// may be smaller than this size.
  @_s.JsonKey(name: 'PartSizeInBytes')
  final int partSizeInBytes;

  /// The Amazon Resource Name (ARN) of the vault that contains the archive.
  @_s.JsonKey(name: 'VaultARN')
  final String vaultARN;

  UploadListElement({
    this.archiveDescription,
    this.creationDate,
    this.multipartUploadId,
    this.partSizeInBytes,
    this.vaultARN,
  });
  factory UploadListElement.fromJson(Map<String, dynamic> json) =>
      _$UploadListElementFromJson(json);
}

/// Contains the Amazon S3 Glacier response to your request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UploadMultipartPartOutput {
  /// The SHA256 tree hash that Amazon S3 Glacier computed for the uploaded part.
  @_s.JsonKey(name: 'x-amz-sha256-tree-hash')
  final String checksum;

  UploadMultipartPartOutput({
    this.checksum,
  });
  factory UploadMultipartPartOutput.fromJson(Map<String, dynamic> json) =>
      _$UploadMultipartPartOutputFromJson(json);
}

/// Contains the vault access policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VaultAccessPolicy {
  /// The vault access policy.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  VaultAccessPolicy({
    this.policy,
  });
  factory VaultAccessPolicy.fromJson(Map<String, dynamic> json) =>
      _$VaultAccessPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$VaultAccessPolicyToJson(this);
}

/// Contains the vault lock policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VaultLockPolicy {
  /// The vault lock policy.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  VaultLockPolicy({
    this.policy,
  });
  Map<String, dynamic> toJson() => _$VaultLockPolicyToJson(this);
}

/// Represents a vault's notification configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VaultNotificationConfig {
  /// A list of one or more events for which Amazon S3 Glacier will send a
  /// notification to the specified Amazon SNS topic.
  @_s.JsonKey(name: 'Events')
  final List<String> events;

  /// The Amazon Simple Notification Service (Amazon SNS) topic Amazon Resource
  /// Name (ARN).
  @_s.JsonKey(name: 'SNSTopic')
  final String sNSTopic;

  VaultNotificationConfig({
    this.events,
    this.sNSTopic,
  });
  factory VaultNotificationConfig.fromJson(Map<String, dynamic> json) =>
      _$VaultNotificationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VaultNotificationConfigToJson(this);
}

class InsufficientCapacityException extends _s.GenericAwsException {
  InsufficientCapacityException({String type, String message})
      : super(
            type: type,
            code: 'InsufficientCapacityException',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class MissingParameterValueException extends _s.GenericAwsException {
  MissingParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'MissingParameterValueException',
            message: message);
}

class PolicyEnforcedException extends _s.GenericAwsException {
  PolicyEnforcedException({String type, String message})
      : super(type: type, code: 'PolicyEnforcedException', message: message);
}

class RequestTimeoutException extends _s.GenericAwsException {
  RequestTimeoutException({String type, String message})
      : super(type: type, code: 'RequestTimeoutException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InsufficientCapacityException': (type, message) =>
      InsufficientCapacityException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'MissingParameterValueException': (type, message) =>
      MissingParameterValueException(type: type, message: message),
  'PolicyEnforcedException': (type, message) =>
      PolicyEnforcedException(type: type, message: message),
  'RequestTimeoutException': (type, message) =>
      RequestTimeoutException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
};
