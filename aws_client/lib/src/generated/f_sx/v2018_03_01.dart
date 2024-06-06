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

/// Amazon FSx is a fully managed service that makes it easy for storage and
/// application administrators to launch and use shared file storage.
class FSx {
  final _s.JsonProtocol _protocol;
  FSx({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'fsx',
            signingName: 'fsx',
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

  /// Use this action to associate one or more Domain Name Server (DNS) aliases
  /// with an existing Amazon FSx for Windows File Server file system. A file
  /// system can have a maximum of 50 DNS aliases associated with it at any one
  /// time. If you try to associate a DNS alias that is already associated with
  /// the file system, FSx takes no action on that alias in the request. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html">Working
  /// with DNS Aliases</a> and <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/walkthrough05-file-system-custom-CNAME.html">Walkthrough
  /// 5: Using DNS aliases to access your file system</a>, including additional
  /// steps you must take to be able to access your file system using a DNS
  /// alias.
  ///
  /// The system response shows the DNS aliases that Amazon FSx is attempting to
  /// associate with the file system. Use the API operation to monitor the
  /// status of the aliases Amazon FSx is associating with the file system.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [aliases] :
  /// An array of one or more DNS alias names to associate with the file system.
  /// The alias name has to comply with the following formatting requirements:
  ///
  /// <ul>
  /// <li>
  /// Formatted as a fully-qualified domain name (FQDN), <i>
  /// <code>hostname.domain</code> </i>, for example,
  /// <code>accounting.corp.example.com</code>.
  /// </li>
  /// <li>
  /// Can contain alphanumeric characters and the hyphen (-).
  /// </li>
  /// <li>
  /// Cannot start or end with a hyphen.
  /// </li>
  /// <li>
  /// Can start with a numeric.
  /// </li>
  /// </ul>
  /// For DNS alias names, Amazon FSx stores alphabetic characters as lowercase
  /// letters (a-z), regardless of how you specify them: as uppercase letters,
  /// lowercase letters, or the corresponding letters in escape codes.
  ///
  /// Parameter [fileSystemId] :
  /// Specifies the file system with which you want to associate one or more DNS
  /// aliases.
  Future<AssociateFileSystemAliasesResponse> associateFileSystemAliases({
    required List<String> aliases,
    required String fileSystemId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.AssociateFileSystemAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Aliases': aliases,
        'FileSystemId': fileSystemId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return AssociateFileSystemAliasesResponse.fromJson(jsonResponse.body);
  }

  /// Cancels an existing Amazon FSx for Lustre data repository task if that
  /// task is in either the <code>PENDING</code> or <code>EXECUTING</code>
  /// state. When you cancel am export task, Amazon FSx does the following.
  ///
  /// <ul>
  /// <li>
  /// Any files that FSx has already exported are not reverted.
  /// </li>
  /// <li>
  /// FSx continues to export any files that are in-flight when the cancel
  /// operation is received.
  /// </li>
  /// <li>
  /// FSx does not export any files that have not yet been exported.
  /// </li>
  /// </ul>
  /// For a release task, Amazon FSx will stop releasing files upon
  /// cancellation. Any files that have already been released will remain in the
  /// released state.
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [DataRepositoryTaskNotFound].
  /// May throw [DataRepositoryTaskEnded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [taskId] :
  /// Specifies the data repository task to cancel.
  Future<CancelDataRepositoryTaskResponse> cancelDataRepositoryTask({
    required String taskId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CancelDataRepositoryTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TaskId': taskId,
      },
    );

    return CancelDataRepositoryTaskResponse.fromJson(jsonResponse.body);
  }

  /// Copies an existing backup within the same Amazon Web Services account to
  /// another Amazon Web Services Region (cross-Region copy) or within the same
  /// Amazon Web Services Region (in-Region copy). You can have up to five
  /// backup copy requests in progress to a single destination Region per
  /// account.
  ///
  /// You can use cross-Region backup copies for cross-Region disaster recovery.
  /// You can periodically take backups and copy them to another Region so that
  /// in the event of a disaster in the primary Region, you can restore from
  /// backup and recover availability quickly in the other Region. You can make
  /// cross-Region copies only within your Amazon Web Services partition. A
  /// partition is a grouping of Regions. Amazon Web Services currently has
  /// three partitions: <code>aws</code> (Standard Regions), <code>aws-cn</code>
  /// (China Regions), and <code>aws-us-gov</code> (Amazon Web Services GovCloud
  /// [US] Regions).
  ///
  /// You can also use backup copies to clone your file dataset to another
  /// Region or within the same Region.
  ///
  /// You can use the <code>SourceRegion</code> parameter to specify the Amazon
  /// Web Services Region from which the backup will be copied. For example, if
  /// you make the call from the <code>us-west-1</code> Region and want to copy
  /// a backup from the <code>us-east-2</code> Region, you specify
  /// <code>us-east-2</code> in the <code>SourceRegion</code> parameter to make
  /// a cross-Region copy. If you don't specify a Region, the backup copy is
  /// created in the same Region where the request is sent from (in-Region
  /// copy).
  ///
  /// For more information about creating backup copies, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html#copy-backups">
  /// Copying backups</a> in the <i>Amazon FSx for Windows User Guide</i>, <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html#copy-backups">Copying
  /// backups</a> in the <i>Amazon FSx for Lustre User Guide</i>, and <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/using-backups.html#copy-backups">Copying
  /// backups</a> in the <i>Amazon FSx for OpenZFS User Guide</i>.
  ///
  /// May throw [BadRequest].
  /// May throw [BackupNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [UnsupportedOperation].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [InvalidSourceKmsKey].
  /// May throw [InvalidDestinationKmsKey].
  /// May throw [InvalidRegion].
  /// May throw [SourceBackupUnavailable].
  /// May throw [IncompatibleRegionForMultiAZ].
  ///
  /// Parameter [sourceBackupId] :
  /// The ID of the source backup. Specifies the ID of the backup that's being
  /// copied.
  ///
  /// Parameter [copyTags] :
  /// A Boolean flag indicating whether tags from the source backup should be
  /// copied to the backup copy. This value defaults to <code>false</code>.
  ///
  /// If you set <code>CopyTags</code> to <code>true</code> and the source
  /// backup has existing tags, you can use the <code>Tags</code> parameter to
  /// create new tags, provided that the sum of the source backup tags and the
  /// new tags doesn't exceed 50. Both sets of tags are merged. If there are tag
  /// conflicts (for example, two tags with the same key but different values),
  /// the tags created with the <code>Tags</code> parameter take precedence.
  ///
  /// Parameter [sourceRegion] :
  /// The source Amazon Web Services Region of the backup. Specifies the Amazon
  /// Web Services Region from which the backup is being copied. The source and
  /// destination Regions must be in the same Amazon Web Services partition. If
  /// you don't specify a Region, <code>SourceRegion</code> defaults to the
  /// Region where the request is sent from (in-Region copy).
  Future<CopyBackupResponse> copyBackup({
    required String sourceBackupId,
    String? clientRequestToken,
    bool? copyTags,
    String? kmsKeyId,
    String? sourceRegion,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CopyBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceBackupId': sourceBackupId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (copyTags != null) 'CopyTags': copyTags,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (sourceRegion != null) 'SourceRegion': sourceRegion,
        if (tags != null) 'Tags': tags,
      },
    );

    return CopyBackupResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing volume by using a snapshot from another Amazon FSx for
  /// OpenZFS file system. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/on-demand-replication.html">on-demand
  /// data replication</a> in the Amazon FSx for OpenZFS User Guide.
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [ServiceLimitExceeded].
  ///
  /// Parameter [volumeId] :
  /// Specifies the ID of the volume that you are copying the snapshot to.
  ///
  /// Parameter [copyStrategy] :
  /// Specifies the strategy to use when copying data from a snapshot to the
  /// volume.
  ///
  /// <ul>
  /// <li>
  /// <code>FULL_COPY</code> - Copies all data from the snapshot to the volume.
  /// </li>
  /// <li>
  /// <code>INCREMENTAL_COPY</code> - Copies only the snapshot data that's
  /// changed since the previous replication.
  /// </li>
  /// </ul> <note>
  /// <code>CLONE</code> isn't a valid copy strategy option for the
  /// <code>CopySnapshotAndUpdateVolume</code> operation.
  /// </note>
  ///
  /// Parameter [options] :
  /// Confirms that you want to delete data on the destination volume that
  /// wasn’t there during the previous snapshot replication.
  ///
  /// Your replication will fail if you don’t include an option for a specific
  /// type of data and that data is on your destination. For example, if you
  /// don’t include <code>DELETE_INTERMEDIATE_SNAPSHOTS</code> and there are
  /// intermediate snapshots on the destination, you can’t copy the snapshot.
  ///
  /// <ul>
  /// <li>
  /// <code>DELETE_INTERMEDIATE_SNAPSHOTS</code> - Deletes snapshots on the
  /// destination volume that aren’t on the source volume.
  /// </li>
  /// <li>
  /// <code>DELETE_CLONED_VOLUMES</code> - Deletes snapshot clones on the
  /// destination volume that aren't on the source volume.
  /// </li>
  /// <li>
  /// <code>DELETE_INTERMEDIATE_DATA</code> - Overwrites snapshots on the
  /// destination volume that don’t match the source snapshot that you’re
  /// copying.
  /// </li>
  /// </ul>
  Future<CopySnapshotAndUpdateVolumeResponse> copySnapshotAndUpdateVolume({
    required String sourceSnapshotARN,
    required String volumeId,
    String? clientRequestToken,
    OpenZFSCopyStrategy? copyStrategy,
    List<UpdateOpenZFSVolumeOption>? options,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CopySnapshotAndUpdateVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceSnapshotARN': sourceSnapshotARN,
        'VolumeId': volumeId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (copyStrategy != null) 'CopyStrategy': copyStrategy.toValue(),
        if (options != null)
          'Options': options.map((e) => e.toValue()).toList(),
      },
    );

    return CopySnapshotAndUpdateVolumeResponse.fromJson(jsonResponse.body);
  }

  /// Creates a backup of an existing Amazon FSx for Windows File Server file
  /// system, Amazon FSx for Lustre file system, Amazon FSx for NetApp ONTAP
  /// volume, or Amazon FSx for OpenZFS file system. We recommend creating
  /// regular backups so that you can restore a file system or volume from a
  /// backup if an issue arises with the original file system or volume.
  ///
  /// For Amazon FSx for Lustre file systems, you can create a backup only for
  /// file systems that have the following configuration:
  ///
  /// <ul>
  /// <li>
  /// A Persistent deployment type
  /// </li>
  /// <li>
  /// Are <i>not</i> linked to a data repository
  /// </li>
  /// </ul>
  /// For more information about backups, see the following:
  ///
  /// <ul>
  /// <li>
  /// For Amazon FSx for Lustre, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html">Working
  /// with FSx for Lustre backups</a>.
  /// </li>
  /// <li>
  /// For Amazon FSx for Windows, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html">Working
  /// with FSx for Windows backups</a>.
  /// </li>
  /// <li>
  /// For Amazon FSx for NetApp ONTAP, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/using-backups.html">Working
  /// with FSx for NetApp ONTAP backups</a>.
  /// </li>
  /// <li>
  /// For Amazon FSx for OpenZFS, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/using-backups.html">Working
  /// with FSx for OpenZFS backups</a>.
  /// </li>
  /// </ul>
  /// If a backup with the specified client request token exists and the
  /// parameters match, this operation returns the description of the existing
  /// backup. If a backup with the specified client request token exists and the
  /// parameters don't match, this operation returns
  /// <code>IncompatibleParameterError</code>. If a backup with the specified
  /// client request token doesn't exist, <code>CreateBackup</code> does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new Amazon FSx backup with an assigned ID, and an initial
  /// lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the backup.
  /// </li>
  /// </ul>
  /// By using the idempotent operation, you can retry a
  /// <code>CreateBackup</code> operation without the risk of creating an extra
  /// backup. This approach can be useful when an initial call fails in a way
  /// that makes it unclear whether a backup was created. If you use the same
  /// client request token and the initial call created a backup, the operation
  /// returns a successful result because all the parameters are the same.
  ///
  /// The <code>CreateBackup</code> operation returns while the backup's
  /// lifecycle state is still <code>CREATING</code>. You can check the backup
  /// creation status by calling the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeBackups.html">DescribeBackups</a>
  /// operation, which returns the backup state along with other information.
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [FileSystemNotFound].
  /// May throw [VolumeNotFound].
  /// May throw [BackupInProgress].
  /// May throw [IncompatibleParameterError].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [clientRequestToken] :
  /// (Optional) A string of up to 63 ASCII characters that Amazon FSx uses to
  /// ensure idempotent creation. This string is automatically filled on your
  /// behalf when you use the Command Line Interface (CLI) or an Amazon Web
  /// Services SDK.
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system to back up.
  ///
  /// Parameter [tags] :
  /// (Optional) The tags to apply to the backup at backup creation. The key
  /// value of the <code>Name</code> tag appears in the console as the backup
  /// name. If you have set <code>CopyTagsToBackups</code> to <code>true</code>,
  /// and you specify one or more tags using the <code>CreateBackup</code>
  /// operation, no existing file system tags are copied from the file system to
  /// the backup.
  ///
  /// Parameter [volumeId] :
  /// (Optional) The ID of the FSx for ONTAP volume to back up.
  Future<CreateBackupResponse> createBackup({
    String? clientRequestToken,
    String? fileSystemId,
    List<Tag>? tags,
    String? volumeId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (fileSystemId != null) 'FileSystemId': fileSystemId,
        if (tags != null) 'Tags': tags,
        if (volumeId != null) 'VolumeId': volumeId,
      },
    );

    return CreateBackupResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon FSx for Lustre data repository association (DRA). A data
  /// repository association is a link between a directory on the file system
  /// and an Amazon S3 bucket or prefix. You can have a maximum of 8 data
  /// repository associations on a file system. Data repository associations are
  /// supported on all FSx for Lustre 2.12 and 2.15 file systems, excluding
  /// <code>scratch_1</code> deployment type.
  ///
  /// Each data repository association must have a unique Amazon FSx file system
  /// directory and a unique S3 bucket or prefix associated with it. You can
  /// configure a data repository association for automatic import only, for
  /// automatic export only, or for both. To learn more about linking a data
  /// repository to your file system, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/create-dra-linked-data-repo.html">Linking
  /// your file system to an S3 bucket</a>.
  /// <note>
  /// <code>CreateDataRepositoryAssociation</code> isn't supported on Amazon
  /// File Cache resources. To create a DRA on Amazon File Cache, use the
  /// <code>CreateFileCache</code> operation.
  /// </note>
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [FileSystemNotFound].
  /// May throw [IncompatibleParameterError].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [dataRepositoryPath] :
  /// The path to the Amazon S3 data repository that will be linked to the file
  /// system. The path can be an S3 bucket or prefix in the format
  /// <code>s3://myBucket/myPrefix/</code>. This path specifies where in the S3
  /// data repository files will be imported from or exported to.
  ///
  /// Parameter [batchImportMetaDataOnCreate] :
  /// Set to <code>true</code> to run an import data repository task to import
  /// metadata from the data repository to the file system after the data
  /// repository association is created. Default is <code>false</code>.
  ///
  /// Parameter [fileSystemPath] :
  /// A path on the file system that points to a high-level directory (such as
  /// <code>/ns1/</code>) or subdirectory (such as <code>/ns1/subdir/</code>)
  /// that will be mapped 1-1 with <code>DataRepositoryPath</code>. The leading
  /// forward slash in the name is required. Two data repository associations
  /// cannot have overlapping file system paths. For example, if a data
  /// repository is associated with file system path <code>/ns1/</code>, then
  /// you cannot link another data repository with file system path
  /// <code>/ns1/ns2</code>.
  ///
  /// This path specifies where in your file system files will be exported from
  /// or imported to. This file system directory can be linked to only one
  /// Amazon S3 bucket, and no other S3 bucket can be linked to the directory.
  /// <note>
  /// If you specify only a forward slash (<code>/</code>) as the file system
  /// path, you can link only one data repository to the file system. You can
  /// only specify "/" as the file system path for the first data repository
  /// associated with a file system.
  /// </note>
  ///
  /// Parameter [importedFileChunkSize] :
  /// For files imported from a data repository, this value determines the
  /// stripe count and maximum amount of data per file (in MiB) stored on a
  /// single physical disk. The maximum number of disks that a single file can
  /// be striped across is limited by the total number of disks that make up the
  /// file system.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  ///
  /// Parameter [s3] :
  /// The configuration for an Amazon S3 data repository linked to an Amazon FSx
  /// Lustre file system with a data repository association. The configuration
  /// defines which file events (new, changed, or deleted files or directories)
  /// are automatically imported from the linked data repository to the file
  /// system or automatically exported from the file system to the data
  /// repository.
  Future<CreateDataRepositoryAssociationResponse>
      createDataRepositoryAssociation({
    required String dataRepositoryPath,
    required String fileSystemId,
    bool? batchImportMetaDataOnCreate,
    String? clientRequestToken,
    String? fileSystemPath,
    int? importedFileChunkSize,
    S3DataRepositoryConfiguration? s3,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'importedFileChunkSize',
      importedFileChunkSize,
      1,
      512000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.CreateDataRepositoryAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataRepositoryPath': dataRepositoryPath,
        'FileSystemId': fileSystemId,
        if (batchImportMetaDataOnCreate != null)
          'BatchImportMetaDataOnCreate': batchImportMetaDataOnCreate,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (fileSystemPath != null) 'FileSystemPath': fileSystemPath,
        if (importedFileChunkSize != null)
          'ImportedFileChunkSize': importedFileChunkSize,
        if (s3 != null) 'S3': s3,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDataRepositoryAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon FSx for Lustre data repository task. A
  /// <code>CreateDataRepositoryTask</code> operation will fail if a data
  /// repository is not linked to the FSx file system.
  ///
  /// You use import and export data repository tasks to perform bulk operations
  /// between your FSx for Lustre file system and its linked data repositories.
  /// An example of a data repository task is exporting any data and metadata
  /// changes, including POSIX metadata, to files, directories, and symbolic
  /// links (symlinks) from your FSx file system to a linked data repository.
  ///
  /// You use release data repository tasks to release data from your file
  /// system for files that are exported to S3. The metadata of released files
  /// remains on the file system so users or applications can still access
  /// released files by reading the files again, which will restore data from
  /// Amazon S3 to the FSx for Lustre file system.
  ///
  /// To learn more about data repository tasks, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html">Data
  /// Repository Tasks</a>. To learn more about linking a data repository to
  /// your file system, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/create-dra-linked-data-repo.html">Linking
  /// your file system to an S3 bucket</a>.
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [FileSystemNotFound].
  /// May throw [IncompatibleParameterError].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [DataRepositoryTaskExecuting].
  ///
  /// Parameter [report] :
  /// Defines whether or not Amazon FSx provides a CompletionReport once the
  /// task has completed. A CompletionReport provides a detailed report on the
  /// files that Amazon FSx processed that meet the criteria specified by the
  /// <code>Scope</code> parameter. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/task-completion-report.html">Working
  /// with Task Completion Reports</a>.
  ///
  /// Parameter [type] :
  /// Specifies the type of data repository task to create.
  ///
  /// <ul>
  /// <li>
  /// <code>EXPORT_TO_REPOSITORY</code> tasks export from your Amazon FSx for
  /// Lustre file system to a linked data repository.
  /// </li>
  /// <li>
  /// <code>IMPORT_METADATA_FROM_REPOSITORY</code> tasks import metadata changes
  /// from a linked S3 bucket to your Amazon FSx for Lustre file system.
  /// </li>
  /// <li>
  /// <code>RELEASE_DATA_FROM_FILESYSTEM</code> tasks release files in your
  /// Amazon FSx for Lustre file system that have been exported to a linked S3
  /// bucket and that meet your specified release criteria.
  /// </li>
  /// <li>
  /// <code>AUTO_RELEASE_DATA</code> tasks automatically release files from an
  /// Amazon File Cache resource.
  /// </li>
  /// </ul>
  ///
  /// Parameter [capacityToRelease] :
  /// Specifies the amount of data to release, in GiB, by an Amazon File Cache
  /// <code>AUTO_RELEASE_DATA</code> task that automatically releases files from
  /// the cache.
  ///
  /// Parameter [paths] :
  /// A list of paths for the data repository task to use when the task is
  /// processed. If a path that you provide isn't valid, the task fails. If you
  /// don't provide paths, the default behavior is to export all files to S3
  /// (for export tasks), import all files from S3 (for import tasks), or
  /// release all exported files that meet the last accessed time criteria (for
  /// release tasks).
  ///
  /// <ul>
  /// <li>
  /// For export tasks, the list contains paths on the FSx for Lustre file
  /// system from which the files are exported to the Amazon S3 bucket. The
  /// default path is the file system root directory. The paths you provide need
  /// to be relative to the mount point of the file system. If the mount point
  /// is <code>/mnt/fsx</code> and <code>/mnt/fsx/path1</code> is a directory or
  /// file on the file system you want to export, then the path to provide is
  /// <code>path1</code>.
  /// </li>
  /// <li>
  /// For import tasks, the list contains paths in the Amazon S3 bucket from
  /// which POSIX metadata changes are imported to the FSx for Lustre file
  /// system. The path can be an S3 bucket or prefix in the format
  /// <code>s3://myBucket/myPrefix</code> (where <code>myPrefix</code> is
  /// optional).
  /// </li>
  /// <li>
  /// For release tasks, the list contains directory or file paths on the FSx
  /// for Lustre file system from which to release exported files. If a
  /// directory is specified, files within the directory are released. If a file
  /// path is specified, only that file is released. To release all exported
  /// files in the file system, specify a forward slash (/) as the path.
  /// <note>
  /// A file must also meet the last accessed time criteria specified in for the
  /// file to be released.
  /// </note> </li>
  /// </ul>
  ///
  /// Parameter [releaseConfiguration] :
  /// The configuration that specifies the last accessed time criteria for files
  /// that will be released from an Amazon FSx for Lustre file system.
  Future<CreateDataRepositoryTaskResponse> createDataRepositoryTask({
    required String fileSystemId,
    required CompletionReport report,
    required DataRepositoryTaskType type,
    int? capacityToRelease,
    String? clientRequestToken,
    List<String>? paths,
    ReleaseConfiguration? releaseConfiguration,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'capacityToRelease',
      capacityToRelease,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateDataRepositoryTask'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'Report': report,
        'Type': type.toValue(),
        if (capacityToRelease != null) 'CapacityToRelease': capacityToRelease,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (paths != null) 'Paths': paths,
        if (releaseConfiguration != null)
          'ReleaseConfiguration': releaseConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDataRepositoryTaskResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon File Cache resource.
  ///
  /// You can use this operation with a client request token in the request that
  /// Amazon File Cache uses to ensure idempotent creation. If a cache with the
  /// specified client request token exists and the parameters match,
  /// <code>CreateFileCache</code> returns the description of the existing
  /// cache. If a cache with the specified client request token exists and the
  /// parameters don't match, this call returns
  /// <code>IncompatibleParameterError</code>. If a file cache with the
  /// specified client request token doesn't exist, <code>CreateFileCache</code>
  /// does the following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new, empty Amazon File Cache resourcewith an assigned ID, and an
  /// initial lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the cache in JSON format.
  /// </li>
  /// </ul> <note>
  /// The <code>CreateFileCache</code> call returns while the cache's lifecycle
  /// state is still <code>CREATING</code>. You can check the cache creation
  /// status by calling the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileCaches.html">DescribeFileCaches</a>
  /// operation, which returns the cache state along with other information.
  /// </note>
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [InvalidNetworkSettings].
  /// May throw [InvalidPerUnitStorageThroughput].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [MissingFileCacheConfiguration].
  ///
  /// Parameter [fileCacheType] :
  /// The type of cache that you're creating, which must be <code>LUSTRE</code>.
  ///
  /// Parameter [fileCacheTypeVersion] :
  /// Sets the Lustre version for the cache that you're creating, which must be
  /// <code>2.12</code>.
  ///
  /// Parameter [storageCapacity] :
  /// The storage capacity of the cache in gibibytes (GiB). Valid values are
  /// 1200 GiB, 2400 GiB, and increments of 2400 GiB.
  ///
  /// Parameter [clientRequestToken] :
  /// An idempotency token for resource creation, in a string of up to 63 ASCII
  /// characters. This token is automatically filled on your behalf when you use
  /// the Command Line Interface (CLI) or an Amazon Web Services SDK.
  ///
  /// By using the idempotent operation, you can retry a
  /// <code>CreateFileCache</code> operation without the risk of creating an
  /// extra cache. This approach can be useful when an initial call fails in a
  /// way that makes it unclear whether a cache was created. Examples are if a
  /// transport level timeout occurred, or your connection was reset. If you use
  /// the same client request token and the initial call created a cache, the
  /// client receives success as long as the parameters are the same.
  ///
  /// Parameter [copyTagsToDataRepositoryAssociations] :
  /// A boolean flag indicating whether tags for the cache should be copied to
  /// data repository associations. This value defaults to false.
  ///
  /// Parameter [dataRepositoryAssociations] :
  /// A list of up to 8 configurations for data repository associations (DRAs)
  /// to be created during the cache creation. The DRAs link the cache to either
  /// an Amazon S3 data repository or a Network File System (NFS) data
  /// repository that supports the NFSv3 protocol.
  ///
  /// The DRA configurations must meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// All configurations on the list must be of the same data repository type,
  /// either all S3 or all NFS. A cache can't link to different data repository
  /// types at the same time.
  /// </li>
  /// <li>
  /// An NFS DRA must link to an NFS file system that supports the NFSv3
  /// protocol.
  /// </li>
  /// </ul>
  /// DRA automatic import and automatic export is not supported.
  ///
  /// Parameter [kmsKeyId] :
  /// Specifies the ID of the Key Management Service (KMS) key to use for
  /// encrypting data on an Amazon File Cache. If a <code>KmsKeyId</code> isn't
  /// specified, the Amazon FSx-managed KMS key for your account is used. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html">Encrypt</a>
  /// in the <i>Key Management Service API Reference</i>.
  ///
  /// Parameter [lustreConfiguration] :
  /// The configuration for the Amazon File Cache resource being created.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of IDs specifying the security groups to apply to all network
  /// interfaces created for Amazon File Cache access. This list isn't returned
  /// in later requests to describe the cache.
  Future<CreateFileCacheResponse> createFileCache({
    required FileCacheType fileCacheType,
    required String fileCacheTypeVersion,
    required int storageCapacity,
    required List<String> subnetIds,
    String? clientRequestToken,
    bool? copyTagsToDataRepositoryAssociations,
    List<FileCacheDataRepositoryAssociation>? dataRepositoryAssociations,
    String? kmsKeyId,
    CreateFileCacheLustreConfiguration? lustreConfiguration,
    List<String>? securityGroupIds,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'storageCapacity',
      storageCapacity,
      0,
      2147483647,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateFileCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileCacheType': fileCacheType.toValue(),
        'FileCacheTypeVersion': fileCacheTypeVersion,
        'StorageCapacity': storageCapacity,
        'SubnetIds': subnetIds,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (copyTagsToDataRepositoryAssociations != null)
          'CopyTagsToDataRepositoryAssociations':
              copyTagsToDataRepositoryAssociations,
        if (dataRepositoryAssociations != null)
          'DataRepositoryAssociations': dataRepositoryAssociations,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (lustreConfiguration != null)
          'LustreConfiguration': lustreConfiguration,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFileCacheResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new, empty Amazon FSx file system. You can create the following
  /// supported Amazon FSx file systems using the <code>CreateFileSystem</code>
  /// API operation:
  ///
  /// <ul>
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
  /// </ul>
  /// This operation requires a client request token in the request that Amazon
  /// FSx uses to ensure idempotent creation. This means that calling the
  /// operation multiple times with the same client request token has no effect.
  /// By using the idempotent operation, you can retry a
  /// <code>CreateFileSystem</code> operation without the risk of creating an
  /// extra file system. This approach can be useful when an initial call fails
  /// in a way that makes it unclear whether a file system was created. Examples
  /// are if a transport level timeout occurred, or your connection was reset.
  /// If you use the same client request token and the initial call created a
  /// file system, the client receives success as long as the parameters are the
  /// same.
  ///
  /// If a file system with the specified client request token exists and the
  /// parameters match, <code>CreateFileSystem</code> returns the description of
  /// the existing file system. If a file system with the specified client
  /// request token exists and the parameters don't match, this call returns
  /// <code>IncompatibleParameterError</code>. If a file system with the
  /// specified client request token doesn't exist,
  /// <code>CreateFileSystem</code> does the following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new, empty Amazon FSx file system with an assigned ID, and an
  /// initial lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the file system in JSON format.
  /// </li>
  /// </ul> <note>
  /// The <code>CreateFileSystem</code> call returns while the file system's
  /// lifecycle state is still <code>CREATING</code>. You can check the
  /// file-system creation status by calling the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html">DescribeFileSystems</a>
  /// operation, which returns the file system state along with other
  /// information.
  /// </note>
  ///
  /// May throw [BadRequest].
  /// May throw [ActiveDirectoryError].
  /// May throw [IncompatibleParameterError].
  /// May throw [InvalidImportPath].
  /// May throw [InvalidExportPath].
  /// May throw [InvalidNetworkSettings].
  /// May throw [InvalidPerUnitStorageThroughput].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  /// May throw [MissingFileSystemConfiguration].
  ///
  /// Parameter [fileSystemType] :
  /// The type of Amazon FSx file system to create. Valid values are
  /// <code>WINDOWS</code>, <code>LUSTRE</code>, <code>ONTAP</code>, and
  /// <code>OPENZFS</code>.
  ///
  /// Parameter [storageCapacity] :
  /// Sets the storage capacity of the file system that you're creating, in
  /// gibibytes (GiB).
  ///
  /// <b>FSx for Lustre file systems</b> - The amount of storage capacity that
  /// you can configure depends on the value that you set for
  /// <code>StorageType</code> and the Lustre <code>DeploymentType</code>, as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// For <code>SCRATCH_2</code>, <code>PERSISTENT_2</code> and
  /// <code>PERSISTENT_1</code> deployment types using SSD storage type, the
  /// valid values are 1200 GiB, 2400 GiB, and increments of 2400 GiB.
  /// </li>
  /// <li>
  /// For <code>PERSISTENT_1</code> HDD file systems, valid values are
  /// increments of 6000 GiB for 12 MB/s/TiB file systems and increments of 1800
  /// GiB for 40 MB/s/TiB file systems.
  /// </li>
  /// <li>
  /// For <code>SCRATCH_1</code> deployment type, valid values are 1200 GiB,
  /// 2400 GiB, and increments of 3600 GiB.
  /// </li>
  /// </ul>
  /// <b>FSx for ONTAP file systems</b> - The amount of storage capacity that
  /// you can configure depends on the value of the <code>HAPairs</code>
  /// property. The minimum value is calculated as 1,024 * <code>HAPairs</code>
  /// and the maximum is calculated as 524,288 * <code>HAPairs</code>.
  ///
  /// <b>FSx for OpenZFS file systems</b> - The amount of storage capacity that
  /// you can configure is from 64 GiB up to 524,288 GiB (512 TiB).
  ///
  /// <b>FSx for Windows File Server file systems</b> - The amount of storage
  /// capacity that you can configure depends on the value that you set for
  /// <code>StorageType</code> as follows:
  ///
  /// <ul>
  /// <li>
  /// For SSD storage, valid values are 32 GiB-65,536 GiB (64 TiB).
  /// </li>
  /// <li>
  /// For HDD storage, valid values are 2000 GiB-65,536 GiB (64 TiB).
  /// </li>
  /// </ul>
  ///
  /// Parameter [subnetIds] :
  /// Specifies the IDs of the subnets that the file system will be accessible
  /// from. For Windows and ONTAP <code>MULTI_AZ_1</code> deployment
  /// types,provide exactly two subnet IDs, one for the preferred file server
  /// and one for the standby file server. You specify one of these subnets as
  /// the preferred subnet using the <code>WindowsConfiguration &gt;
  /// PreferredSubnetID</code> or <code>OntapConfiguration &gt;
  /// PreferredSubnetID</code> properties. For more information about Multi-AZ
  /// file system configuration, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html">
  /// Availability and durability: Single-AZ and Multi-AZ file systems</a> in
  /// the <i>Amazon FSx for Windows User Guide</i> and <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-multiAZ.html">
  /// Availability and durability</a> in the <i>Amazon FSx for ONTAP User
  /// Guide</i>.
  ///
  /// For Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> and all
  /// Lustre deployment types, provide exactly one subnet ID. The file server is
  /// launched in that subnet's Availability Zone.
  ///
  /// Parameter [clientRequestToken] :
  /// A string of up to 63 ASCII characters that Amazon FSx uses to ensure
  /// idempotent creation. This string is automatically filled on your behalf
  /// when you use the Command Line Interface (CLI) or an Amazon Web Services
  /// SDK.
  ///
  /// Parameter [fileSystemTypeVersion] :
  /// (Optional) For FSx for Lustre file systems, sets the Lustre version for
  /// the file system that you're creating. Valid values are <code>2.10</code>,
  /// <code>2.12</code>, and <code>2.15</code>:
  ///
  /// <ul>
  /// <li>
  /// 2.10 is supported by the Scratch and Persistent_1 Lustre deployment types.
  /// </li>
  /// <li>
  /// 2.12 and 2.15 are supported by all Lustre deployment types.
  /// <code>2.12</code> or <code>2.15</code> is required when setting FSx for
  /// Lustre <code>DeploymentType</code> to <code>PERSISTENT_2</code>.
  /// </li>
  /// </ul>
  /// Default value = <code>2.10</code>, except when <code>DeploymentType</code>
  /// is set to <code>PERSISTENT_2</code>, then the default is
  /// <code>2.12</code>.
  /// <note>
  /// If you set <code>FileSystemTypeVersion</code> to <code>2.10</code> for a
  /// <code>PERSISTENT_2</code> Lustre deployment type, the
  /// <code>CreateFileSystem</code> operation fails.
  /// </note>
  ///
  /// Parameter [openZFSConfiguration] :
  /// The OpenZFS configuration for the file system that's being created.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of IDs specifying the security groups to apply to all network
  /// interfaces created for file system access. This list isn't returned in
  /// later requests to describe the file system.
  /// <important>
  /// You must specify a security group if you are creating a Multi-AZ FSx for
  /// ONTAP file system in a VPC subnet that has been shared with you.
  /// </important>
  ///
  /// Parameter [storageType] :
  /// Sets the storage type for the file system that you're creating. Valid
  /// values are <code>SSD</code> and <code>HDD</code>.
  ///
  /// <ul>
  /// <li>
  /// Set to <code>SSD</code> to use solid state drive storage. SSD is supported
  /// on all Windows, Lustre, ONTAP, and OpenZFS deployment types.
  /// </li>
  /// <li>
  /// Set to <code>HDD</code> to use hard disk drive storage. HDD is supported
  /// on <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> Windows file
  /// system deployment types, and on <code>PERSISTENT_1</code> Lustre file
  /// system deployment types.
  /// </li>
  /// </ul>
  /// Default value is <code>SSD</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/optimize-fsx-costs.html#storage-type-options">
  /// Storage type options</a> in the <i>FSx for Windows File Server User
  /// Guide</i> and <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html#storage-options">Multiple
  /// storage options</a> in the <i>FSx for Lustre User Guide</i>.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the file system that's being created. The key value
  /// of the <code>Name</code> tag appears in the console as the file system
  /// name.
  ///
  /// Parameter [windowsConfiguration] :
  /// The Microsoft Windows configuration for the file system that's being
  /// created.
  Future<CreateFileSystemResponse> createFileSystem({
    required FileSystemType fileSystemType,
    required int storageCapacity,
    required List<String> subnetIds,
    String? clientRequestToken,
    String? fileSystemTypeVersion,
    String? kmsKeyId,
    CreateFileSystemLustreConfiguration? lustreConfiguration,
    CreateFileSystemOntapConfiguration? ontapConfiguration,
    CreateFileSystemOpenZFSConfiguration? openZFSConfiguration,
    List<String>? securityGroupIds,
    StorageType? storageType,
    List<Tag>? tags,
    CreateFileSystemWindowsConfiguration? windowsConfiguration,
  }) async {
    _s.validateNumRange(
      'storageCapacity',
      storageCapacity,
      0,
      2147483647,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateFileSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemType': fileSystemType.toValue(),
        'StorageCapacity': storageCapacity,
        'SubnetIds': subnetIds,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (fileSystemTypeVersion != null)
          'FileSystemTypeVersion': fileSystemTypeVersion,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (lustreConfiguration != null)
          'LustreConfiguration': lustreConfiguration,
        if (ontapConfiguration != null)
          'OntapConfiguration': ontapConfiguration,
        if (openZFSConfiguration != null)
          'OpenZFSConfiguration': openZFSConfiguration,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (storageType != null) 'StorageType': storageType.toValue(),
        if (tags != null) 'Tags': tags,
        if (windowsConfiguration != null)
          'WindowsConfiguration': windowsConfiguration,
      },
    );

    return CreateFileSystemResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon FSx for Lustre, Amazon FSx for Windows File Server,
  /// or Amazon FSx for OpenZFS file system from an existing Amazon FSx backup.
  ///
  /// If a file system with the specified client request token exists and the
  /// parameters match, this operation returns the description of the file
  /// system. If a file system with the specified client request token exists
  /// but the parameters don't match, this call returns
  /// <code>IncompatibleParameterError</code>. If a file system with the
  /// specified client request token doesn't exist, this operation does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new Amazon FSx file system from backup with an assigned ID, and
  /// an initial lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the file system.
  /// </li>
  /// </ul>
  /// Parameters like the Active Directory, default share name, automatic
  /// backup, and backup settings default to the parameters of the file system
  /// that was backed up, unless overridden. You can explicitly supply other
  /// settings.
  ///
  /// By using the idempotent operation, you can retry a
  /// <code>CreateFileSystemFromBackup</code> call without the risk of creating
  /// an extra file system. This approach can be useful when an initial call
  /// fails in a way that makes it unclear whether a file system was created.
  /// Examples are if a transport level timeout occurred, or your connection was
  /// reset. If you use the same client request token and the initial call
  /// created a file system, the client receives a success message as long as
  /// the parameters are the same.
  /// <note>
  /// The <code>CreateFileSystemFromBackup</code> call returns while the file
  /// system's lifecycle state is still <code>CREATING</code>. You can check the
  /// file-system creation status by calling the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html">
  /// DescribeFileSystems</a> operation, which returns the file system state
  /// along with other information.
  /// </note>
  ///
  /// May throw [BadRequest].
  /// May throw [ActiveDirectoryError].
  /// May throw [IncompatibleParameterError].
  /// May throw [InvalidNetworkSettings].
  /// May throw [InvalidPerUnitStorageThroughput].
  /// May throw [ServiceLimitExceeded].
  /// May throw [BackupNotFound].
  /// May throw [InternalServerError].
  /// May throw [MissingFileSystemConfiguration].
  ///
  /// Parameter [subnetIds] :
  /// Specifies the IDs of the subnets that the file system will be accessible
  /// from. For Windows <code>MULTI_AZ_1</code> file system deployment types,
  /// provide exactly two subnet IDs, one for the preferred file server and one
  /// for the standby file server. You specify one of these subnets as the
  /// preferred subnet using the <code>WindowsConfiguration &gt;
  /// PreferredSubnetID</code> property.
  ///
  /// Windows <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> file system
  /// deployment types, Lustre file systems, and OpenZFS file systems provide
  /// exactly one subnet ID. The file server is launched in that subnet's
  /// Availability Zone.
  ///
  /// Parameter [clientRequestToken] :
  /// A string of up to 63 ASCII characters that Amazon FSx uses to ensure
  /// idempotent creation. This string is automatically filled on your behalf
  /// when you use the Command Line Interface (CLI) or an Amazon Web Services
  /// SDK.
  ///
  /// Parameter [fileSystemTypeVersion] :
  /// Sets the version for the Amazon FSx for Lustre file system that you're
  /// creating from a backup. Valid values are <code>2.10</code>,
  /// <code>2.12</code>, and <code>2.15</code>.
  ///
  /// You don't need to specify <code>FileSystemTypeVersion</code> because it
  /// will be applied using the backup's <code>FileSystemTypeVersion</code>
  /// setting. If you choose to specify <code>FileSystemTypeVersion</code> when
  /// creating from backup, the value must match the backup's
  /// <code>FileSystemTypeVersion</code> setting.
  ///
  /// Parameter [openZFSConfiguration] :
  /// The OpenZFS configuration for the file system that's being created.
  ///
  /// Parameter [securityGroupIds] :
  /// A list of IDs for the security groups that apply to the specified network
  /// interfaces created for file system access. These security groups apply to
  /// all network interfaces. This value isn't returned in later
  /// <code>DescribeFileSystem</code> requests.
  ///
  /// Parameter [storageCapacity] :
  /// Sets the storage capacity of the OpenZFS file system that you're creating
  /// from a backup, in gibibytes (GiB). Valid values are from 64 GiB up to
  /// 524,288 GiB (512 TiB). However, the value that you specify must be equal
  /// to or greater than the backup's storage capacity value. If you don't use
  /// the <code>StorageCapacity</code> parameter, the default is the backup's
  /// <code>StorageCapacity</code> value.
  ///
  /// If used to create a file system other than OpenZFS, you must provide a
  /// value that matches the backup's <code>StorageCapacity</code> value. If you
  /// provide any other value, Amazon FSx responds with with an HTTP status code
  /// 400 Bad Request.
  ///
  /// Parameter [storageType] :
  /// Sets the storage type for the Windows or OpenZFS file system that you're
  /// creating from a backup. Valid values are <code>SSD</code> and
  /// <code>HDD</code>.
  ///
  /// <ul>
  /// <li>
  /// Set to <code>SSD</code> to use solid state drive storage. SSD is supported
  /// on all Windows and OpenZFS deployment types.
  /// </li>
  /// <li>
  /// Set to <code>HDD</code> to use hard disk drive storage. HDD is supported
  /// on <code>SINGLE_AZ_2</code> and <code>MULTI_AZ_1</code> FSx for Windows
  /// File Server file system deployment types.
  /// </li>
  /// </ul>
  /// The default value is <code>SSD</code>.
  /// <note>
  /// HDD and SSD storage types have different minimum storage capacity
  /// requirements. A restored file system's storage capacity is tied to the
  /// file system that was backed up. You can create a file system that uses HDD
  /// storage from a backup of a file system that used SSD storage if the
  /// original SSD file system had a storage capacity of at least 2000 GiB.
  /// </note>
  ///
  /// Parameter [tags] :
  /// The tags to be applied to the file system at file system creation. The key
  /// value of the <code>Name</code> tag appears in the console as the file
  /// system name.
  ///
  /// Parameter [windowsConfiguration] :
  /// The configuration for this Microsoft Windows file system.
  Future<CreateFileSystemFromBackupResponse> createFileSystemFromBackup({
    required String backupId,
    required List<String> subnetIds,
    String? clientRequestToken,
    String? fileSystemTypeVersion,
    String? kmsKeyId,
    CreateFileSystemLustreConfiguration? lustreConfiguration,
    CreateFileSystemOpenZFSConfiguration? openZFSConfiguration,
    List<String>? securityGroupIds,
    int? storageCapacity,
    StorageType? storageType,
    List<Tag>? tags,
    CreateFileSystemWindowsConfiguration? windowsConfiguration,
  }) async {
    _s.validateNumRange(
      'storageCapacity',
      storageCapacity,
      0,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateFileSystemFromBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'SubnetIds': subnetIds,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (fileSystemTypeVersion != null)
          'FileSystemTypeVersion': fileSystemTypeVersion,
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (lustreConfiguration != null)
          'LustreConfiguration': lustreConfiguration,
        if (openZFSConfiguration != null)
          'OpenZFSConfiguration': openZFSConfiguration,
        if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
        if (storageCapacity != null) 'StorageCapacity': storageCapacity,
        if (storageType != null) 'StorageType': storageType.toValue(),
        if (tags != null) 'Tags': tags,
        if (windowsConfiguration != null)
          'WindowsConfiguration': windowsConfiguration,
      },
    );

    return CreateFileSystemFromBackupResponse.fromJson(jsonResponse.body);
  }

  /// Creates a snapshot of an existing Amazon FSx for OpenZFS volume. With
  /// snapshots, you can easily undo file changes and compare file versions by
  /// restoring the volume to a previous version.
  ///
  /// If a snapshot with the specified client request token exists, and the
  /// parameters match, this operation returns the description of the existing
  /// snapshot. If a snapshot with the specified client request token exists,
  /// and the parameters don't match, this operation returns
  /// <code>IncompatibleParameterError</code>. If a snapshot with the specified
  /// client request token doesn't exist, <code>CreateSnapshot</code> does the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Creates a new OpenZFS snapshot with an assigned ID, and an initial
  /// lifecycle state of <code>CREATING</code>.
  /// </li>
  /// <li>
  /// Returns the description of the snapshot.
  /// </li>
  /// </ul>
  /// By using the idempotent operation, you can retry a
  /// <code>CreateSnapshot</code> operation without the risk of creating an
  /// extra snapshot. This approach can be useful when an initial call fails in
  /// a way that makes it unclear whether a snapshot was created. If you use the
  /// same client request token and the initial call created a snapshot, the
  /// operation returns a successful result because all the parameters are the
  /// same.
  ///
  /// The <code>CreateSnapshot</code> operation returns while the snapshot's
  /// lifecycle state is still <code>CREATING</code>. You can check the snapshot
  /// creation status by calling the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeSnapshots.html">DescribeSnapshots</a>
  /// operation, which returns the snapshot state along with other information.
  ///
  /// May throw [BadRequest].
  /// May throw [VolumeNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [name] :
  /// The name of the snapshot.
  ///
  /// Parameter [volumeId] :
  /// The ID of the volume that you are taking a snapshot of.
  Future<CreateSnapshotResponse> createSnapshot({
    required String name,
    required String volumeId,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'VolumeId': volumeId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Creates a storage virtual machine (SVM) for an Amazon FSx for ONTAP file
  /// system.
  ///
  /// May throw [ActiveDirectoryError].
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [ServiceLimitExceeded].
  /// May throw [UnsupportedOperation].
  ///
  /// Parameter [name] :
  /// The name of the SVM.
  ///
  /// Parameter [activeDirectoryConfiguration] :
  /// Describes the self-managed Microsoft Active Directory to which you want to
  /// join the SVM. Joining an Active Directory provides user authentication and
  /// access control for SMB clients, including Microsoft Windows and macOS
  /// clients accessing the file system.
  ///
  /// Parameter [rootVolumeSecurityStyle] :
  /// The security style of the root volume of the SVM. Specify one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>UNIX</code> if the file system is managed by a UNIX administrator,
  /// the majority of users are NFS clients, and an application accessing the
  /// data uses a UNIX user as the service account.
  /// </li>
  /// <li>
  /// <code>NTFS</code> if the file system is managed by a Microsoft Windows
  /// administrator, the majority of users are SMB clients, and an application
  /// accessing the data uses a Microsoft Windows user as the service account.
  /// </li>
  /// <li>
  /// <code>MIXED</code> This is an advanced setting. For more information, see
  /// <a href="fsx/latest/ONTAPGuide/volume-security-style.html">Volume security
  /// style</a> in the Amazon FSx for NetApp ONTAP User Guide.
  /// </li>
  /// </ul> <p/>
  ///
  /// Parameter [svmAdminPassword] :
  /// The password to use when managing the SVM using the NetApp ONTAP CLI or
  /// REST API. If you do not specify a password, you can still use the file
  /// system's <code>fsxadmin</code> user to manage the SVM.
  Future<CreateStorageVirtualMachineResponse> createStorageVirtualMachine({
    required String fileSystemId,
    required String name,
    CreateSvmActiveDirectoryConfiguration? activeDirectoryConfiguration,
    String? clientRequestToken,
    StorageVirtualMachineRootVolumeSecurityStyle? rootVolumeSecurityStyle,
    String? svmAdminPassword,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateStorageVirtualMachine'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'Name': name,
        if (activeDirectoryConfiguration != null)
          'ActiveDirectoryConfiguration': activeDirectoryConfiguration,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (rootVolumeSecurityStyle != null)
          'RootVolumeSecurityStyle': rootVolumeSecurityStyle.toValue(),
        if (svmAdminPassword != null) 'SvmAdminPassword': svmAdminPassword,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateStorageVirtualMachineResponse.fromJson(jsonResponse.body);
  }

  /// Creates an FSx for ONTAP or Amazon FSx for OpenZFS storage volume.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [MissingVolumeConfiguration].
  /// May throw [ServiceLimitExceeded].
  /// May throw [StorageVirtualMachineNotFound].
  /// May throw [UnsupportedOperation].
  ///
  /// Parameter [name] :
  /// Specifies the name of the volume that you're creating.
  ///
  /// Parameter [volumeType] :
  /// Specifies the type of volume to create; <code>ONTAP</code> and
  /// <code>OPENZFS</code> are the only valid volume types.
  ///
  /// Parameter [ontapConfiguration] :
  /// Specifies the configuration to use when creating the ONTAP volume.
  ///
  /// Parameter [openZFSConfiguration] :
  /// Specifies the configuration to use when creating the OpenZFS volume.
  Future<CreateVolumeResponse> createVolume({
    required String name,
    required VolumeType volumeType,
    String? clientRequestToken,
    CreateOntapVolumeConfiguration? ontapConfiguration,
    CreateOpenZFSVolumeConfiguration? openZFSConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'VolumeType': volumeType.toValue(),
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (ontapConfiguration != null)
          'OntapConfiguration': ontapConfiguration,
        if (openZFSConfiguration != null)
          'OpenZFSConfiguration': openZFSConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateVolumeResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon FSx for NetApp ONTAP volume from an existing Amazon
  /// FSx volume backup.
  ///
  /// May throw [BackupNotFound].
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [MissingVolumeConfiguration].
  /// May throw [ServiceLimitExceeded].
  /// May throw [StorageVirtualMachineNotFound].
  ///
  /// Parameter [name] :
  /// The name of the new volume you're creating.
  ///
  /// Parameter [ontapConfiguration] :
  /// Specifies the configuration of the ONTAP volume that you are creating.
  Future<CreateVolumeFromBackupResponse> createVolumeFromBackup({
    required String backupId,
    required String name,
    String? clientRequestToken,
    CreateOntapVolumeConfiguration? ontapConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.CreateVolumeFromBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'Name': name,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (ontapConfiguration != null)
          'OntapConfiguration': ontapConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateVolumeFromBackupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon FSx backup. After deletion, the backup no longer exists,
  /// and its data is gone.
  ///
  /// The <code>DeleteBackup</code> call returns instantly. The backup won't
  /// show up in later <code>DescribeBackups</code> calls.
  /// <important>
  /// The data in a deleted backup is also deleted and can't be recovered by any
  /// means.
  /// </important>
  ///
  /// May throw [BadRequest].
  /// May throw [BackupInProgress].
  /// May throw [BackupNotFound].
  /// May throw [BackupRestoring].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [BackupBeingCopied].
  ///
  /// Parameter [backupId] :
  /// The ID of the backup that you want to delete.
  ///
  /// Parameter [clientRequestToken] :
  /// A string of up to 63 ASCII characters that Amazon FSx uses to ensure
  /// idempotent deletion. This parameter is automatically filled on your behalf
  /// when using the CLI or SDK.
  Future<DeleteBackupResponse> deleteBackup({
    required String backupId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteBackup'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BackupId': backupId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteBackupResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a data repository association on an Amazon FSx for Lustre file
  /// system. Deleting the data repository association unlinks the file system
  /// from the Amazon S3 bucket. When deleting a data repository association,
  /// you have the option of deleting the data in the file system that
  /// corresponds to the data repository association. Data repository
  /// associations are supported on all FSx for Lustre 2.12 and 2.15 file
  /// systems, excluding <code>scratch_1</code> deployment type.
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [DataRepositoryAssociationNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [associationId] :
  /// The ID of the data repository association that you want to delete.
  ///
  /// Parameter [deleteDataInFileSystem] :
  /// Set to <code>true</code> to delete the data in the file system that
  /// corresponds to the data repository association.
  Future<DeleteDataRepositoryAssociationResponse>
      deleteDataRepositoryAssociation({
    required String associationId,
    String? clientRequestToken,
    bool? deleteDataInFileSystem,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.DeleteDataRepositoryAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationId': associationId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (deleteDataInFileSystem != null)
          'DeleteDataInFileSystem': deleteDataInFileSystem,
      },
    );

    return DeleteDataRepositoryAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon File Cache resource. After deletion, the cache no longer
  /// exists, and its data is gone.
  ///
  /// The <code>DeleteFileCache</code> operation returns while the cache has the
  /// <code>DELETING</code> status. You can check the cache deletion status by
  /// calling the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileCaches.html">DescribeFileCaches</a>
  /// operation, which returns a list of caches in your account. If you pass the
  /// cache ID for a deleted cache, the <code>DescribeFileCaches</code>
  /// operation returns a <code>FileCacheNotFound</code> error.
  /// <important>
  /// The data in a deleted cache is also deleted and can't be recovered by any
  /// means.
  /// </important>
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [FileCacheNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileCacheId] :
  /// The ID of the cache that's being deleted.
  Future<DeleteFileCacheResponse> deleteFileCache({
    required String fileCacheId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteFileCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileCacheId': fileCacheId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteFileCacheResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a file system. After deletion, the file system no longer exists,
  /// and its data is gone. Any existing automatic backups and snapshots are
  /// also deleted.
  ///
  /// To delete an Amazon FSx for NetApp ONTAP file system, first delete all the
  /// volumes and storage virtual machines (SVMs) on the file system. Then
  /// provide a <code>FileSystemId</code> value to the
  /// <code>DeleFileSystem</code> operation.
  ///
  /// By default, when you delete an Amazon FSx for Windows File Server file
  /// system, a final backup is created upon deletion. This final backup isn't
  /// subject to the file system's retention policy, and must be manually
  /// deleted.
  ///
  /// To delete an Amazon FSx for Lustre file system, first <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/unmounting-fs.html">unmount</a>
  /// it from every connected Amazon EC2 instance, then provide a
  /// <code>FileSystemId</code> value to the <code>DeleFileSystem</code>
  /// operation. By default, Amazon FSx will not take a final backup when the
  /// <code>DeleteFileSystem</code> operation is invoked. On file systems not
  /// linked to an Amazon S3 bucket, set <code>SkipFinalBackup</code> to
  /// <code>false</code> to take a final backup of the file system you are
  /// deleting. Backups cannot be enabled on S3-linked file systems. To ensure
  /// all of your data is written back to S3 before deleting your file system,
  /// you can either monitor for the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/monitoring-cloudwatch.html#auto-import-export-metrics">AgeOfOldestQueuedMessage</a>
  /// metric to be zero (if using automatic export) or you can run an <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/export-data-repo-task-dra.html">export
  /// data repository task</a>. If you have automatic export enabled and want to
  /// use an export data repository task, you have to disable automatic export
  /// before executing the export data repository task.
  ///
  /// The <code>DeleteFileSystem</code> operation returns while the file system
  /// has the <code>DELETING</code> status. You can check the file system
  /// deletion status by calling the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DescribeFileSystems.html">DescribeFileSystems</a>
  /// operation, which returns a list of file systems in your account. If you
  /// pass the file system ID for a deleted file system, the
  /// <code>DescribeFileSystems</code> operation returns a
  /// <code>FileSystemNotFound</code> error.
  /// <note>
  /// If a data repository task is in a <code>PENDING</code> or
  /// <code>EXECUTING</code> state, deleting an Amazon FSx for Lustre file
  /// system will fail with an HTTP status code 400 (Bad Request).
  /// </note> <important>
  /// The data in a deleted file system is also deleted and can't be recovered
  /// by any means.
  /// </important>
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [FileSystemNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system that you want to delete.
  ///
  /// Parameter [clientRequestToken] :
  /// A string of up to 63 ASCII characters that Amazon FSx uses to ensure
  /// idempotent deletion. This token is automatically filled on your behalf
  /// when using the Command Line Interface (CLI) or an Amazon Web Services SDK.
  ///
  /// Parameter [openZFSConfiguration] :
  /// The configuration object for the OpenZFS file system used in the
  /// <code>DeleteFileSystem</code> operation.
  Future<DeleteFileSystemResponse> deleteFileSystem({
    required String fileSystemId,
    String? clientRequestToken,
    DeleteFileSystemLustreConfiguration? lustreConfiguration,
    DeleteFileSystemOpenZFSConfiguration? openZFSConfiguration,
    DeleteFileSystemWindowsConfiguration? windowsConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteFileSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (lustreConfiguration != null)
          'LustreConfiguration': lustreConfiguration,
        if (openZFSConfiguration != null)
          'OpenZFSConfiguration': openZFSConfiguration,
        if (windowsConfiguration != null)
          'WindowsConfiguration': windowsConfiguration,
      },
    );

    return DeleteFileSystemResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon FSx for OpenZFS snapshot. After deletion, the snapshot
  /// no longer exists, and its data is gone. Deleting a snapshot doesn't affect
  /// snapshots stored in a file system backup.
  ///
  /// The <code>DeleteSnapshot</code> operation returns instantly. The snapshot
  /// appears with the lifecycle status of <code>DELETING</code> until the
  /// deletion is complete.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [SnapshotNotFound].
  ///
  /// Parameter [snapshotId] :
  /// The ID of the snapshot that you want to delete.
  Future<DeleteSnapshotResponse> deleteSnapshot({
    required String snapshotId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnapshotId': snapshotId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an existing Amazon FSx for ONTAP storage virtual machine (SVM).
  /// Prior to deleting an SVM, you must delete all non-root volumes in the SVM,
  /// otherwise the operation will fail.
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [StorageVirtualMachineNotFound].
  ///
  /// Parameter [storageVirtualMachineId] :
  /// The ID of the SVM that you want to delete.
  Future<DeleteStorageVirtualMachineResponse> deleteStorageVirtualMachine({
    required String storageVirtualMachineId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteStorageVirtualMachine'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StorageVirtualMachineId': storageVirtualMachineId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DeleteStorageVirtualMachineResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon FSx for NetApp ONTAP or Amazon FSx for OpenZFS volume.
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [VolumeNotFound].
  /// May throw [ServiceLimitExceeded].
  ///
  /// Parameter [volumeId] :
  /// The ID of the volume that you are deleting.
  ///
  /// Parameter [ontapConfiguration] :
  /// For Amazon FSx for ONTAP volumes, specify whether to take a final backup
  /// of the volume and apply tags to the backup. To apply tags to the backup,
  /// you must have the <code>fsx:TagResource</code> permission.
  ///
  /// Parameter [openZFSConfiguration] :
  /// For Amazon FSx for OpenZFS volumes, specify whether to delete all child
  /// volumes and snapshots.
  Future<DeleteVolumeResponse> deleteVolume({
    required String volumeId,
    String? clientRequestToken,
    DeleteVolumeOntapConfiguration? ontapConfiguration,
    DeleteVolumeOpenZFSConfiguration? openZFSConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DeleteVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (ontapConfiguration != null)
          'OntapConfiguration': ontapConfiguration,
        if (openZFSConfiguration != null)
          'OpenZFSConfiguration': openZFSConfiguration,
      },
    );

    return DeleteVolumeResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of a specific Amazon FSx backup, if a
  /// <code>BackupIds</code> value is provided for that backup. Otherwise, it
  /// returns all backups owned by your Amazon Web Services account in the
  /// Amazon Web Services Region of the endpoint that you're calling.
  ///
  /// When retrieving all backups, you can optionally specify the
  /// <code>MaxResults</code> parameter to limit the number of backups in a
  /// response. If more backups remain, Amazon FSx returns a
  /// <code>NextToken</code> value in the response. In this case, send a later
  /// request with the <code>NextToken</code> request parameter set to the value
  /// of the <code>NextToken</code> value from the last response.
  ///
  /// This operation is used in an iterative process to retrieve a list of your
  /// backups. <code>DescribeBackups</code> is called first without a
  /// <code>NextToken</code> value. Then the operation continues to be called
  /// with the <code>NextToken</code> parameter set to the value of the last
  /// <code>NextToken</code> value until a response has no
  /// <code>NextToken</code> value.
  ///
  /// When using this operation, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The operation might return fewer than the <code>MaxResults</code> value of
  /// backup descriptions while still including a <code>NextToken</code> value.
  /// </li>
  /// <li>
  /// The order of the backups returned in the response of one
  /// <code>DescribeBackups</code> call and the order of the backups returned
  /// across the responses of a multi-call iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [VolumeNotFound].
  /// May throw [BackupNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [backupIds] :
  /// The IDs of the backups that you want to retrieve. This parameter value
  /// overrides any filters. If any IDs aren't found, a
  /// <code>BackupNotFound</code> error occurs.
  ///
  /// Parameter [filters] :
  /// The filters structure. The supported names are
  /// <code>file-system-id</code>, <code>backup-type</code>,
  /// <code>file-system-type</code>, and <code>volume-id</code>.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of backups to return in the response. This parameter value
  /// must be greater than 0. The number of items that Amazon FSx returns is the
  /// minimum of the <code>MaxResults</code> parameter specified in the request
  /// and the service's internal maximum number of items per page.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token returned from a previous
  /// <code>DescribeBackups</code> operation. If a token is present, the
  /// operation continues the list from where the returning call left off.
  Future<DescribeBackupsResponse> describeBackups({
    List<String>? backupIds,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeBackups'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (backupIds != null) 'BackupIds': backupIds,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeBackupsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of specific Amazon FSx for Lustre or Amazon File
  /// Cache data repository associations, if one or more
  /// <code>AssociationIds</code> values are provided in the request, or if
  /// filters are used in the request. Data repository associations are
  /// supported on Amazon File Cache resources and all FSx for Lustre 2.12 and
  /// 2,15 file systems, excluding <code>scratch_1</code> deployment type.
  ///
  /// You can use filters to narrow the response to include just data repository
  /// associations for specific file systems (use the
  /// <code>file-system-id</code> filter with the ID of the file system) or
  /// caches (use the <code>file-cache-id</code> filter with the ID of the
  /// cache), or data repository associations for a specific repository type
  /// (use the <code>data-repository-type</code> filter with a value of
  /// <code>S3</code> or <code>NFS</code>). If you don't use filters, the
  /// response returns all data repository associations owned by your Amazon Web
  /// Services account in the Amazon Web Services Region of the endpoint that
  /// you're calling.
  ///
  /// When retrieving all data repository associations, you can paginate the
  /// response by using the optional <code>MaxResults</code> parameter to limit
  /// the number of data repository associations returned in a response. If more
  /// data repository associations remain, a <code>NextToken</code> value is
  /// returned in the response. In this case, send a later request with the
  /// <code>NextToken</code> request parameter set to the value of
  /// <code>NextToken</code> from the last response.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [DataRepositoryAssociationNotFound].
  /// May throw [InvalidDataRepositoryType].
  /// May throw [InternalServerError].
  ///
  /// Parameter [associationIds] :
  /// IDs of the data repository associations whose descriptions you want to
  /// retrieve (String).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of resources to return in the response. This value must
  /// be an integer greater than zero.
  Future<DescribeDataRepositoryAssociationsResponse>
      describeDataRepositoryAssociations({
    List<String>? associationIds,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.DescribeDataRepositoryAssociations'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (associationIds != null) 'AssociationIds': associationIds,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeDataRepositoryAssociationsResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the description of specific Amazon FSx for Lustre or Amazon File
  /// Cache data repository tasks, if one or more <code>TaskIds</code> values
  /// are provided in the request, or if filters are used in the request. You
  /// can use filters to narrow the response to include just tasks for specific
  /// file systems or caches, or tasks in a specific lifecycle state. Otherwise,
  /// it returns all data repository tasks owned by your Amazon Web Services
  /// account in the Amazon Web Services Region of the endpoint that you're
  /// calling.
  ///
  /// When retrieving all tasks, you can paginate the response by using the
  /// optional <code>MaxResults</code> parameter to limit the number of tasks
  /// returned in a response. If more tasks remain, a <code>NextToken</code>
  /// value is returned in the response. In this case, send a later request with
  /// the <code>NextToken</code> request parameter set to the value of
  /// <code>NextToken</code> from the last response.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [DataRepositoryTaskNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [filters] :
  /// (Optional) You can use filters to narrow the
  /// <code>DescribeDataRepositoryTasks</code> response to include just tasks
  /// for specific file systems, or tasks in a specific lifecycle state.
  ///
  /// Parameter [taskIds] :
  /// (Optional) IDs of the tasks whose descriptions you want to retrieve
  /// (String).
  Future<DescribeDataRepositoryTasksResponse> describeDataRepositoryTasks({
    List<DataRepositoryTaskFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? taskIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeDataRepositoryTasks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (taskIds != null) 'TaskIds': taskIds,
      },
    );

    return DescribeDataRepositoryTasksResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of a specific Amazon File Cache resource, if a
  /// <code>FileCacheIds</code> value is provided for that cache. Otherwise, it
  /// returns descriptions of all caches owned by your Amazon Web Services
  /// account in the Amazon Web Services Region of the endpoint that you're
  /// calling.
  ///
  /// When retrieving all cache descriptions, you can optionally specify the
  /// <code>MaxResults</code> parameter to limit the number of descriptions in a
  /// response. If more cache descriptions remain, the operation returns a
  /// <code>NextToken</code> value in the response. In this case, send a later
  /// request with the <code>NextToken</code> request parameter set to the value
  /// of <code>NextToken</code> from the last response.
  ///
  /// This operation is used in an iterative process to retrieve a list of your
  /// cache descriptions. <code>DescribeFileCaches</code> is called first
  /// without a <code>NextToken</code>value. Then the operation continues to be
  /// called with the <code>NextToken</code> parameter set to the value of the
  /// last <code>NextToken</code> value until a response has no
  /// <code>NextToken</code>.
  ///
  /// When using this operation, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The implementation might return fewer than <code>MaxResults</code> cache
  /// descriptions while still including a <code>NextToken</code> value.
  /// </li>
  /// <li>
  /// The order of caches returned in the response of one
  /// <code>DescribeFileCaches</code> call and the order of caches returned
  /// across the responses of a multicall iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [FileCacheNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileCacheIds] :
  /// IDs of the caches whose descriptions you want to retrieve (String).
  Future<DescribeFileCachesResponse> describeFileCaches({
    List<String>? fileCacheIds,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeFileCaches'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fileCacheIds != null) 'FileCacheIds': fileCacheIds,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFileCachesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the DNS aliases that are associated with the specified Amazon FSx
  /// for Windows File Server file system. A history of all DNS aliases that
  /// have been associated with and disassociated from the file system is
  /// available in the list of <a>AdministrativeAction</a> provided in the
  /// <a>DescribeFileSystems</a> operation response.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system to return the associated DNS aliases for
  /// (String).
  ///
  /// Parameter [maxResults] :
  /// Maximum number of DNS aliases to return in the response (integer). This
  /// parameter value must be greater than 0. The number of items that Amazon
  /// FSx returns is the minimum of the <code>MaxResults</code> parameter
  /// specified in the request and the service's internal maximum number of
  /// items per page.
  ///
  /// Parameter [nextToken] :
  /// Opaque pagination token returned from a previous
  /// <code>DescribeFileSystemAliases</code> operation (String). If a token is
  /// included in the request, the action continues the list from where the
  /// previous returning call left off.
  Future<DescribeFileSystemAliasesResponse> describeFileSystemAliases({
    required String fileSystemId,
    String? clientRequestToken,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeFileSystemAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFileSystemAliasesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of specific Amazon FSx file systems, if a
  /// <code>FileSystemIds</code> value is provided for that file system.
  /// Otherwise, it returns descriptions of all file systems owned by your
  /// Amazon Web Services account in the Amazon Web Services Region of the
  /// endpoint that you're calling.
  ///
  /// When retrieving all file system descriptions, you can optionally specify
  /// the <code>MaxResults</code> parameter to limit the number of descriptions
  /// in a response. If more file system descriptions remain, Amazon FSx returns
  /// a <code>NextToken</code> value in the response. In this case, send a later
  /// request with the <code>NextToken</code> request parameter set to the value
  /// of <code>NextToken</code> from the last response.
  ///
  /// This operation is used in an iterative process to retrieve a list of your
  /// file system descriptions. <code>DescribeFileSystems</code> is called first
  /// without a <code>NextToken</code>value. Then the operation continues to be
  /// called with the <code>NextToken</code> parameter set to the value of the
  /// last <code>NextToken</code> value until a response has no
  /// <code>NextToken</code>.
  ///
  /// When using this operation, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The implementation might return fewer than <code>MaxResults</code> file
  /// system descriptions while still including a <code>NextToken</code> value.
  /// </li>
  /// <li>
  /// The order of file systems returned in the response of one
  /// <code>DescribeFileSystems</code> call and the order of file systems
  /// returned across the responses of a multicall iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [fileSystemIds] :
  /// IDs of the file systems whose descriptions you want to retrieve (String).
  ///
  /// Parameter [maxResults] :
  /// Maximum number of file systems to return in the response (integer). This
  /// parameter value must be greater than 0. The number of items that Amazon
  /// FSx returns is the minimum of the <code>MaxResults</code> parameter
  /// specified in the request and the service's internal maximum number of
  /// items per page.
  ///
  /// Parameter [nextToken] :
  /// Opaque pagination token returned from a previous
  /// <code>DescribeFileSystems</code> operation (String). If a token present,
  /// the operation continues the list from where the returning call left off.
  Future<DescribeFileSystemsResponse> describeFileSystems({
    List<String>? fileSystemIds,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeFileSystems'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (fileSystemIds != null) 'FileSystemIds': fileSystemIds,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeFileSystemsResponse.fromJson(jsonResponse.body);
  }

  /// Indicates whether participant accounts in your organization can create
  /// Amazon FSx for NetApp ONTAP Multi-AZ file systems in subnets that are
  /// shared by a virtual private cloud (VPC) owner. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/creating-file-systems.html#fsxn-vpc-shared-subnets">Creating
  /// FSx for ONTAP file systems in shared subnets</a>.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  Future<DescribeSharedVpcConfigurationResponse>
      describeSharedVpcConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.DescribeSharedVpcConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeSharedVpcConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of specific Amazon FSx for OpenZFS snapshots, if a
  /// <code>SnapshotIds</code> value is provided. Otherwise, this operation
  /// returns all snapshots owned by your Amazon Web Services account in the
  /// Amazon Web Services Region of the endpoint that you're calling.
  ///
  /// When retrieving all snapshots, you can optionally specify the
  /// <code>MaxResults</code> parameter to limit the number of snapshots in a
  /// response. If more backups remain, Amazon FSx returns a
  /// <code>NextToken</code> value in the response. In this case, send a later
  /// request with the <code>NextToken</code> request parameter set to the value
  /// of <code>NextToken</code> from the last response.
  ///
  /// Use this operation in an iterative process to retrieve a list of your
  /// snapshots. <code>DescribeSnapshots</code> is called first without a
  /// <code>NextToken</code> value. Then the operation continues to be called
  /// with the <code>NextToken</code> parameter set to the value of the last
  /// <code>NextToken</code> value until a response has no
  /// <code>NextToken</code> value.
  ///
  /// When using this operation, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The operation might return fewer than the <code>MaxResults</code> value of
  /// snapshot descriptions while still including a <code>NextToken</code>
  /// value.
  /// </li>
  /// <li>
  /// The order of snapshots returned in the response of one
  /// <code>DescribeSnapshots</code> call and the order of backups returned
  /// across the responses of a multi-call iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [SnapshotNotFound].
  ///
  /// Parameter [filters] :
  /// The filters structure. The supported names are <code>file-system-id</code>
  /// or <code>volume-id</code>.
  ///
  /// Parameter [includeShared] :
  /// Set to <code>false</code> (default) if you want to only see the snapshots
  /// owned by your Amazon Web Services account. Set to <code>true</code> if you
  /// want to see the snapshots in your account and the ones shared with you
  /// from another account.
  ///
  /// Parameter [snapshotIds] :
  /// The IDs of the snapshots that you want to retrieve. This parameter value
  /// overrides any filters. If any IDs aren't found, a
  /// <code>SnapshotNotFound</code> error occurs.
  Future<DescribeSnapshotsResponse> describeSnapshots({
    List<SnapshotFilter>? filters,
    bool? includeShared,
    int? maxResults,
    String? nextToken,
    List<String>? snapshotIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (includeShared != null) 'IncludeShared': includeShared,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (snapshotIds != null) 'SnapshotIds': snapshotIds,
      },
    );

    return DescribeSnapshotsResponse.fromJson(jsonResponse.body);
  }

  /// Describes one or more Amazon FSx for NetApp ONTAP storage virtual machines
  /// (SVMs).
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [StorageVirtualMachineNotFound].
  ///
  /// Parameter [filters] :
  /// Enter a filter name:value pair to view a select set of SVMs.
  ///
  /// Parameter [storageVirtualMachineIds] :
  /// Enter the ID of one or more SVMs that you want to view.
  Future<DescribeStorageVirtualMachinesResponse>
      describeStorageVirtualMachines({
    List<StorageVirtualMachineFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? storageVirtualMachineIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.DescribeStorageVirtualMachines'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (storageVirtualMachineIds != null)
          'StorageVirtualMachineIds': storageVirtualMachineIds,
      },
    );

    return DescribeStorageVirtualMachinesResponse.fromJson(jsonResponse.body);
  }

  /// Describes one or more Amazon FSx for NetApp ONTAP or Amazon FSx for
  /// OpenZFS volumes.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [VolumeNotFound].
  ///
  /// Parameter [filters] :
  /// Enter a filter <code>Name</code> and <code>Values</code> pair to view a
  /// select set of volumes.
  ///
  /// Parameter [volumeIds] :
  /// The IDs of the volumes whose descriptions you want to retrieve.
  Future<DescribeVolumesResponse> describeVolumes({
    List<VolumeFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? volumeIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.DescribeVolumes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (volumeIds != null) 'VolumeIds': volumeIds,
      },
    );

    return DescribeVolumesResponse.fromJson(jsonResponse.body);
  }

  /// Use this action to disassociate, or remove, one or more Domain Name
  /// Service (DNS) aliases from an Amazon FSx for Windows File Server file
  /// system. If you attempt to disassociate a DNS alias that is not associated
  /// with the file system, Amazon FSx responds with an HTTP status code 400
  /// (Bad Request). For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html">Working
  /// with DNS Aliases</a>.
  ///
  /// The system generated response showing the DNS aliases that Amazon FSx is
  /// attempting to disassociate from the file system. Use the API operation to
  /// monitor the status of the aliases Amazon FSx is disassociating with the
  /// file system.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [aliases] :
  /// An array of one or more DNS alias names to disassociate, or remove, from
  /// the file system.
  ///
  /// Parameter [fileSystemId] :
  /// Specifies the file system from which to disassociate the DNS aliases.
  Future<DisassociateFileSystemAliasesResponse> disassociateFileSystemAliases({
    required List<String> aliases,
    required String fileSystemId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.DisassociateFileSystemAliases'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Aliases': aliases,
        'FileSystemId': fileSystemId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DisassociateFileSystemAliasesResponse.fromJson(jsonResponse.body);
  }

  /// Lists tags for Amazon FSx resources.
  ///
  /// When retrieving all tags, you can optionally specify the
  /// <code>MaxResults</code> parameter to limit the number of tags in a
  /// response. If more tags remain, Amazon FSx returns a <code>NextToken</code>
  /// value in the response. In this case, send a later request with the
  /// <code>NextToken</code> request parameter set to the value of
  /// <code>NextToken</code> from the last response.
  ///
  /// This action is used in an iterative process to retrieve a list of your
  /// tags. <code>ListTagsForResource</code> is called first without a
  /// <code>NextToken</code>value. Then the action continues to be called with
  /// the <code>NextToken</code> parameter set to the value of the last
  /// <code>NextToken</code> value until a response has no
  /// <code>NextToken</code>.
  ///
  /// When using this action, keep the following in mind:
  ///
  /// <ul>
  /// <li>
  /// The implementation might return fewer than <code>MaxResults</code> file
  /// system descriptions while still including a <code>NextToken</code> value.
  /// </li>
  /// <li>
  /// The order of tags returned in the response of one
  /// <code>ListTagsForResource</code> call and the order of tags returned
  /// across the responses of a multi-call iteration is unspecified.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFound].
  /// May throw [NotServiceResourceError].
  /// May throw [ResourceDoesNotSupportTagging].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the Amazon FSx resource that will have its tags listed.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of tags to return in the response (integer). This parameter
  /// value must be greater than 0. The number of items that Amazon FSx returns
  /// is the minimum of the <code>MaxResults</code> parameter specified in the
  /// request and the service's internal maximum number of items per page.
  ///
  /// Parameter [nextToken] :
  /// Opaque pagination token returned from a previous
  /// <code>ListTagsForResource</code> operation (String). If a token present,
  /// the action continues the list from where the returning call left off.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Releases the file system lock from an Amazon FSx for OpenZFS file system.
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [FileSystemNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  Future<ReleaseFileSystemNfsV3LocksResponse> releaseFileSystemNfsV3Locks({
    required String fileSystemId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.ReleaseFileSystemNfsV3Locks'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return ReleaseFileSystemNfsV3LocksResponse.fromJson(jsonResponse.body);
  }

  /// Returns an Amazon FSx for OpenZFS volume to the state saved by the
  /// specified snapshot.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [VolumeNotFound].
  ///
  /// Parameter [snapshotId] :
  /// The ID of the source snapshot. Specifies the snapshot that you are
  /// restoring from.
  ///
  /// Parameter [volumeId] :
  /// The ID of the volume that you are restoring.
  ///
  /// Parameter [options] :
  /// The settings used when restoring the specified volume from snapshot.
  ///
  /// <ul>
  /// <li>
  /// <code>DELETE_INTERMEDIATE_SNAPSHOTS</code> - Deletes snapshots between the
  /// current state and the specified snapshot. If there are intermediate
  /// snapshots and this option isn't used,
  /// <code>RestoreVolumeFromSnapshot</code> fails.
  /// </li>
  /// <li>
  /// <code>DELETE_CLONED_VOLUMES</code> - Deletes any dependent clone volumes
  /// created from intermediate snapshots. If there are any dependent clone
  /// volumes and this option isn't used, <code>RestoreVolumeFromSnapshot</code>
  /// fails.
  /// </li>
  /// </ul>
  Future<RestoreVolumeFromSnapshotResponse> restoreVolumeFromSnapshot({
    required String snapshotId,
    required String volumeId,
    String? clientRequestToken,
    List<RestoreOpenZFSVolumeOption>? options,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.RestoreVolumeFromSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SnapshotId': snapshotId,
        'VolumeId': volumeId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (options != null)
          'Options': options.map((e) => e.toValue()).toList(),
      },
    );

    return RestoreVolumeFromSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// After performing steps to repair the Active Directory configuration of an
  /// FSx for Windows File Server file system, use this action to initiate the
  /// process of Amazon FSx attempting to reconnect to the file system.
  ///
  /// May throw [BadRequest].
  /// May throw [FileSystemNotFound].
  /// May throw [InternalServerError].
  Future<StartMisconfiguredStateRecoveryResponse>
      startMisconfiguredStateRecovery({
    required String fileSystemId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.StartMisconfiguredStateRecovery'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return StartMisconfiguredStateRecoveryResponse.fromJson(jsonResponse.body);
  }

  /// Tags an Amazon FSx resource.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFound].
  /// May throw [NotServiceResourceError].
  /// May throw [ResourceDoesNotSupportTagging].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the Amazon FSx resource that you want to
  /// tag.
  ///
  /// Parameter [tags] :
  /// A list of tags for the resource. If a tag with a given key already exists,
  /// the value is replaced by the one specified in this parameter.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// This action removes a tag from an Amazon FSx resource.
  ///
  /// May throw [BadRequest].
  /// May throw [InternalServerError].
  /// May throw [ResourceNotFound].
  /// May throw [NotServiceResourceError].
  /// May throw [ResourceDoesNotSupportTagging].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the Amazon FSx resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// A list of keys of tags on the resource to untag. In case the tag key
  /// doesn't exist, the call will still succeed to be idempotent.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the configuration of an existing data repository association on an
  /// Amazon FSx for Lustre file system. Data repository associations are
  /// supported on all FSx for Lustre 2.12 and 2.15 file systems, excluding
  /// <code>scratch_1</code> deployment type.
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [DataRepositoryAssociationNotFound].
  /// May throw [ServiceLimitExceeded].
  /// May throw [InternalServerError].
  ///
  /// Parameter [associationId] :
  /// The ID of the data repository association that you are updating.
  ///
  /// Parameter [importedFileChunkSize] :
  /// For files imported from a data repository, this value determines the
  /// stripe count and maximum amount of data per file (in MiB) stored on a
  /// single physical disk. The maximum number of disks that a single file can
  /// be striped across is limited by the total number of disks that make up the
  /// file system.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  ///
  /// Parameter [s3] :
  /// The configuration for an Amazon S3 data repository linked to an Amazon FSx
  /// Lustre file system with a data repository association. The configuration
  /// defines which file events (new, changed, or deleted files or directories)
  /// are automatically imported from the linked data repository to the file
  /// system or automatically exported from the file system to the data
  /// repository.
  Future<UpdateDataRepositoryAssociationResponse>
      updateDataRepositoryAssociation({
    required String associationId,
    String? clientRequestToken,
    int? importedFileChunkSize,
    S3DataRepositoryConfiguration? s3,
  }) async {
    _s.validateNumRange(
      'importedFileChunkSize',
      importedFileChunkSize,
      1,
      512000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.UpdateDataRepositoryAssociation'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AssociationId': associationId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (importedFileChunkSize != null)
          'ImportedFileChunkSize': importedFileChunkSize,
        if (s3 != null) 'S3': s3,
      },
    );

    return UpdateDataRepositoryAssociationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of an existing Amazon File Cache resource. You
  /// can update multiple properties in a single request.
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [FileCacheNotFound].
  /// May throw [MissingFileCacheConfiguration].
  /// May throw [ServiceLimitExceeded].
  ///
  /// Parameter [fileCacheId] :
  /// The ID of the cache that you are updating.
  ///
  /// Parameter [lustreConfiguration] :
  /// The configuration updates for an Amazon File Cache resource.
  Future<UpdateFileCacheResponse> updateFileCache({
    required String fileCacheId,
    String? clientRequestToken,
    UpdateFileCacheLustreConfiguration? lustreConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UpdateFileCache'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileCacheId': fileCacheId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (lustreConfiguration != null)
          'LustreConfiguration': lustreConfiguration,
      },
    );

    return UpdateFileCacheResponse.fromJson(jsonResponse.body);
  }

  /// Use this operation to update the configuration of an existing Amazon FSx
  /// file system. You can update multiple properties in a single request.
  ///
  /// For FSx for Windows File Server file systems, you can update the following
  /// properties:
  ///
  /// <ul>
  /// <li>
  /// <code>AuditLogConfiguration</code>
  /// </li>
  /// <li>
  /// <code>AutomaticBackupRetentionDays</code>
  /// </li>
  /// <li>
  /// <code>DailyAutomaticBackupStartTime</code>
  /// </li>
  /// <li>
  /// <code>SelfManagedActiveDirectoryConfiguration</code>
  /// </li>
  /// <li>
  /// <code>StorageCapacity</code>
  /// </li>
  /// <li>
  /// <code>StorageType</code>
  /// </li>
  /// <li>
  /// <code>ThroughputCapacity</code>
  /// </li>
  /// <li>
  /// <code>DiskIopsConfiguration</code>
  /// </li>
  /// <li>
  /// <code>WeeklyMaintenanceStartTime</code>
  /// </li>
  /// </ul>
  /// For FSx for Lustre file systems, you can update the following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>AutoImportPolicy</code>
  /// </li>
  /// <li>
  /// <code>AutomaticBackupRetentionDays</code>
  /// </li>
  /// <li>
  /// <code>DailyAutomaticBackupStartTime</code>
  /// </li>
  /// <li>
  /// <code>DataCompressionType</code>
  /// </li>
  /// <li>
  /// <code>LogConfiguration</code>
  /// </li>
  /// <li>
  /// <code>LustreRootSquashConfiguration</code>
  /// </li>
  /// <li>
  /// <code>PerUnitStorageThroughput</code>
  /// </li>
  /// <li>
  /// <code>StorageCapacity</code>
  /// </li>
  /// <li>
  /// <code>WeeklyMaintenanceStartTime</code>
  /// </li>
  /// </ul>
  /// For FSx for ONTAP file systems, you can update the following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>AddRouteTableIds</code>
  /// </li>
  /// <li>
  /// <code>AutomaticBackupRetentionDays</code>
  /// </li>
  /// <li>
  /// <code>DailyAutomaticBackupStartTime</code>
  /// </li>
  /// <li>
  /// <code>DiskIopsConfiguration</code>
  /// </li>
  /// <li>
  /// <code>FsxAdminPassword</code>
  /// </li>
  /// <li>
  /// <code>HAPairs</code>
  /// </li>
  /// <li>
  /// <code>RemoveRouteTableIds</code>
  /// </li>
  /// <li>
  /// <code>StorageCapacity</code>
  /// </li>
  /// <li>
  /// <code>ThroughputCapacity</code>
  /// </li>
  /// <li>
  /// <code>ThroughputCapacityPerHAPair</code>
  /// </li>
  /// <li>
  /// <code>WeeklyMaintenanceStartTime</code>
  /// </li>
  /// </ul>
  /// For FSx for OpenZFS file systems, you can update the following properties:
  ///
  /// <ul>
  /// <li>
  /// <code>AddRouteTableIds</code>
  /// </li>
  /// <li>
  /// <code>AutomaticBackupRetentionDays</code>
  /// </li>
  /// <li>
  /// <code>CopyTagsToBackups</code>
  /// </li>
  /// <li>
  /// <code>CopyTagsToVolumes</code>
  /// </li>
  /// <li>
  /// <code>DailyAutomaticBackupStartTime</code>
  /// </li>
  /// <li>
  /// <code>DiskIopsConfiguration</code>
  /// </li>
  /// <li>
  /// <code>RemoveRouteTableIds</code>
  /// </li>
  /// <li>
  /// <code>StorageCapacity</code>
  /// </li>
  /// <li>
  /// <code>ThroughputCapacity</code>
  /// </li>
  /// <li>
  /// <code>WeeklyMaintenanceStartTime</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequest].
  /// May throw [UnsupportedOperation].
  /// May throw [IncompatibleParameterError].
  /// May throw [InvalidNetworkSettings].
  /// May throw [InternalServerError].
  /// May throw [FileSystemNotFound].
  /// May throw [MissingFileSystemConfiguration].
  /// May throw [ServiceLimitExceeded].
  ///
  /// Parameter [fileSystemId] :
  /// The ID of the file system that you are updating.
  ///
  /// Parameter [clientRequestToken] :
  /// A string of up to 63 ASCII characters that Amazon FSx uses to ensure
  /// idempotent updates. This string is automatically filled on your behalf
  /// when you use the Command Line Interface (CLI) or an Amazon Web Services
  /// SDK.
  ///
  /// Parameter [openZFSConfiguration] :
  /// The configuration updates for an FSx for OpenZFS file system.
  ///
  /// Parameter [storageCapacity] :
  /// Use this parameter to increase the storage capacity of an FSx for Windows
  /// File Server, FSx for Lustre, FSx for OpenZFS, or FSx for ONTAP file
  /// system. Specifies the storage capacity target value, in GiB, to increase
  /// the storage capacity for the file system that you're updating.
  /// <note>
  /// You can't make a storage capacity increase request if there is an existing
  /// storage capacity increase request in progress.
  /// </note>
  /// For Lustre file systems, the storage capacity target value can be the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// For <code>SCRATCH_2</code>, <code>PERSISTENT_1</code>, and
  /// <code>PERSISTENT_2 SSD</code> deployment types, valid values are in
  /// multiples of 2400 GiB. The value must be greater than the current storage
  /// capacity.
  /// </li>
  /// <li>
  /// For <code>PERSISTENT HDD</code> file systems, valid values are multiples
  /// of 6000 GiB for 12-MBps throughput per TiB file systems and multiples of
  /// 1800 GiB for 40-MBps throughput per TiB file systems. The values must be
  /// greater than the current storage capacity.
  /// </li>
  /// <li>
  /// For <code>SCRATCH_1</code> file systems, you can't increase the storage
  /// capacity.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-storage-capacity.html">Managing
  /// storage and throughput capacity</a> in the <i>FSx for Lustre User
  /// Guide</i>.
  ///
  /// For FSx for OpenZFS file systems, the storage capacity target value must
  /// be at least 10 percent greater than the current storage capacity value.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-storage-capacity.html">Managing
  /// storage capacity</a> in the <i>FSx for OpenZFS User Guide</i>.
  ///
  /// For Windows file systems, the storage capacity target value must be at
  /// least 10 percent greater than the current storage capacity value. To
  /// increase storage capacity, the file system must have at least 16 MBps of
  /// throughput capacity. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html">Managing
  /// storage capacity</a> in the <i>Amazon FSxfor Windows File Server User
  /// Guide</i>.
  ///
  /// For ONTAP file systems, the storage capacity target value must be at least
  /// 10 percent greater than the current storage capacity value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-storage-capacity.html">Managing
  /// storage capacity and provisioned IOPS</a> in the <i>Amazon FSx for NetApp
  /// ONTAP User Guide</i>.
  ///
  /// Parameter [windowsConfiguration] :
  /// The configuration updates for an Amazon FSx for Windows File Server file
  /// system.
  Future<UpdateFileSystemResponse> updateFileSystem({
    required String fileSystemId,
    String? clientRequestToken,
    UpdateFileSystemLustreConfiguration? lustreConfiguration,
    UpdateFileSystemOntapConfiguration? ontapConfiguration,
    UpdateFileSystemOpenZFSConfiguration? openZFSConfiguration,
    int? storageCapacity,
    StorageType? storageType,
    UpdateFileSystemWindowsConfiguration? windowsConfiguration,
  }) async {
    _s.validateNumRange(
      'storageCapacity',
      storageCapacity,
      0,
      2147483647,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UpdateFileSystem'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileSystemId': fileSystemId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (lustreConfiguration != null)
          'LustreConfiguration': lustreConfiguration,
        if (ontapConfiguration != null)
          'OntapConfiguration': ontapConfiguration,
        if (openZFSConfiguration != null)
          'OpenZFSConfiguration': openZFSConfiguration,
        if (storageCapacity != null) 'StorageCapacity': storageCapacity,
        if (storageType != null) 'StorageType': storageType.toValue(),
        if (windowsConfiguration != null)
          'WindowsConfiguration': windowsConfiguration,
      },
    );

    return UpdateFileSystemResponse.fromJson(jsonResponse.body);
  }

  /// Configures whether participant accounts in your organization can create
  /// Amazon FSx for NetApp ONTAP Multi-AZ file systems in subnets that are
  /// shared by a virtual private cloud (VPC) owner. For more information, see
  /// the <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/maz-shared-vpc.html">Amazon
  /// FSx for NetApp ONTAP User Guide</a>.
  /// <note>
  /// We strongly recommend that participant-created Multi-AZ file systems in
  /// the shared VPC are deleted before you disable this feature. Once the
  /// feature is disabled, these file systems will enter a
  /// <code>MISCONFIGURED</code> state and behave like Single-AZ file systems.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/maz-shared-vpc.html#disabling-maz-vpc-sharing">Important
  /// considerations before disabling shared VPC support for Multi-AZ file
  /// systems</a>.
  /// </note>
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  ///
  /// Parameter [enableFsxRouteTableUpdatesFromParticipantAccounts] :
  /// Specifies whether participant accounts can create FSx for ONTAP Multi-AZ
  /// file systems in shared subnets. Set to <code>true</code> to enable or
  /// <code>false</code> to disable.
  Future<UpdateSharedVpcConfigurationResponse> updateSharedVpcConfiguration({
    String? clientRequestToken,
    String? enableFsxRouteTableUpdatesFromParticipantAccounts,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSSimbaAPIService_v20180301.UpdateSharedVpcConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (enableFsxRouteTableUpdatesFromParticipantAccounts != null)
          'EnableFsxRouteTableUpdatesFromParticipantAccounts':
              enableFsxRouteTableUpdatesFromParticipantAccounts,
      },
    );

    return UpdateSharedVpcConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the name of an Amazon FSx for OpenZFS snapshot.
  ///
  /// May throw [BadRequest].
  /// May throw [SnapshotNotFound].
  /// May throw [InternalServerError].
  ///
  /// Parameter [name] :
  /// The name of the snapshot to update.
  ///
  /// Parameter [snapshotId] :
  /// The ID of the snapshot that you want to update, in the format
  /// <code>fsvolsnap-0123456789abcdef0</code>.
  Future<UpdateSnapshotResponse> updateSnapshot({
    required String name,
    required String snapshotId,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UpdateSnapshot'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'SnapshotId': snapshotId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
      },
    );

    return UpdateSnapshotResponse.fromJson(jsonResponse.body);
  }

  /// Updates an FSx for ONTAP storage virtual machine (SVM).
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [StorageVirtualMachineNotFound].
  /// May throw [UnsupportedOperation].
  ///
  /// Parameter [storageVirtualMachineId] :
  /// The ID of the SVM that you want to update, in the format
  /// <code>svm-0123456789abcdef0</code>.
  ///
  /// Parameter [activeDirectoryConfiguration] :
  /// Specifies updates to an SVM's Microsoft Active Directory (AD)
  /// configuration.
  ///
  /// Parameter [svmAdminPassword] :
  /// Specifies a new SvmAdminPassword.
  Future<UpdateStorageVirtualMachineResponse> updateStorageVirtualMachine({
    required String storageVirtualMachineId,
    UpdateSvmActiveDirectoryConfiguration? activeDirectoryConfiguration,
    String? clientRequestToken,
    String? svmAdminPassword,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UpdateStorageVirtualMachine'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StorageVirtualMachineId': storageVirtualMachineId,
        if (activeDirectoryConfiguration != null)
          'ActiveDirectoryConfiguration': activeDirectoryConfiguration,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (svmAdminPassword != null) 'SvmAdminPassword': svmAdminPassword,
      },
    );

    return UpdateStorageVirtualMachineResponse.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of an Amazon FSx for NetApp ONTAP or Amazon FSx
  /// for OpenZFS volume.
  ///
  /// May throw [BadRequest].
  /// May throw [IncompatibleParameterError].
  /// May throw [InternalServerError].
  /// May throw [MissingVolumeConfiguration].
  /// May throw [VolumeNotFound].
  ///
  /// Parameter [volumeId] :
  /// The ID of the volume that you want to update, in the format
  /// <code>fsvol-0123456789abcdef0</code>.
  ///
  /// Parameter [name] :
  /// The name of the OpenZFS volume. OpenZFS root volumes are automatically
  /// named <code>FSX</code>. Child volume names must be unique among their
  /// parent volume's children. The name of the volume is part of the mount
  /// string for the OpenZFS volume.
  ///
  /// Parameter [ontapConfiguration] :
  /// The configuration of the ONTAP volume that you are updating.
  ///
  /// Parameter [openZFSConfiguration] :
  /// The configuration of the OpenZFS volume that you are updating.
  Future<UpdateVolumeResponse> updateVolume({
    required String volumeId,
    String? clientRequestToken,
    String? name,
    UpdateOntapVolumeConfiguration? ontapConfiguration,
    UpdateOpenZFSVolumeConfiguration? openZFSConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSSimbaAPIService_v20180301.UpdateVolume'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VolumeId': volumeId,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (name != null) 'Name': name,
        if (ontapConfiguration != null)
          'OntapConfiguration': ontapConfiguration,
        if (openZFSConfiguration != null)
          'OpenZFSConfiguration': openZFSConfiguration,
      },
    );

    return UpdateVolumeResponse.fromJson(jsonResponse.body);
  }
}

/// The Microsoft Active Directory attributes of the Amazon FSx for Windows File
/// Server file system.
class ActiveDirectoryBackupAttributes {
  /// The ID of the Amazon Web Services Managed Microsoft Active Directory
  /// instance to which the file system is joined.
  final String? activeDirectoryId;

  /// The fully qualified domain name of the self-managed Active Directory
  /// directory.
  final String? domainName;
  final String? resourceARN;

  ActiveDirectoryBackupAttributes({
    this.activeDirectoryId,
    this.domainName,
    this.resourceARN,
  });

  factory ActiveDirectoryBackupAttributes.fromJson(Map<String, dynamic> json) {
    return ActiveDirectoryBackupAttributes(
      activeDirectoryId: json['ActiveDirectoryId'] as String?,
      domainName: json['DomainName'] as String?,
      resourceARN: json['ResourceARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryId = this.activeDirectoryId;
    final domainName = this.domainName;
    final resourceARN = this.resourceARN;
    return {
      if (activeDirectoryId != null) 'ActiveDirectoryId': activeDirectoryId,
      if (domainName != null) 'DomainName': domainName,
      if (resourceARN != null) 'ResourceARN': resourceARN,
    };
  }
}

/// Describes a specific Amazon FSx administrative action for the current
/// Windows, Lustre, OpenZFS, or ONTAP file system or volume.
class AdministrativeAction {
  final AdministrativeActionType? administrativeActionType;
  final AdministrativeActionFailureDetails? failureDetails;

  /// The percentage-complete status of a <code>STORAGE_OPTIMIZATION</code>
  /// administrative action. Does not apply to any other administrative action
  /// type.
  final int? progressPercent;

  /// The remaining bytes to transfer for the FSx for OpenZFS snapshot that you're
  /// copying.
  final int? remainingTransferBytes;

  /// The time that the administrative action request was received.
  final DateTime? requestTime;

  /// The status of the administrative action, as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>FAILED</code> - Amazon FSx failed to process the administrative action
  /// successfully.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - Amazon FSx is processing the administrative
  /// action.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - Amazon FSx is waiting to process the administrative
  /// action.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> - Amazon FSx has finished processing the
  /// administrative task.
  /// </li>
  /// <li>
  /// <code>UPDATED_OPTIMIZING</code> - For a storage-capacity increase update,
  /// Amazon FSx has updated the file system with the new storage capacity, and is
  /// now performing the storage-optimization process.
  /// </li>
  /// </ul>
  final Status? status;

  /// The target value for the administration action, provided in the
  /// <code>UpdateFileSystem</code> operation. Returned for
  /// <code>FILE_SYSTEM_UPDATE</code> administrative actions.
  final FileSystem? targetFileSystemValues;
  final Snapshot? targetSnapshotValues;
  final Volume? targetVolumeValues;

  /// The number of bytes that have transferred for the FSx for OpenZFS snapshot
  /// that you're copying.
  final int? totalTransferBytes;

  AdministrativeAction({
    this.administrativeActionType,
    this.failureDetails,
    this.progressPercent,
    this.remainingTransferBytes,
    this.requestTime,
    this.status,
    this.targetFileSystemValues,
    this.targetSnapshotValues,
    this.targetVolumeValues,
    this.totalTransferBytes,
  });

  factory AdministrativeAction.fromJson(Map<String, dynamic> json) {
    return AdministrativeAction(
      administrativeActionType: (json['AdministrativeActionType'] as String?)
          ?.toAdministrativeActionType(),
      failureDetails: json['FailureDetails'] != null
          ? AdministrativeActionFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      progressPercent: json['ProgressPercent'] as int?,
      remainingTransferBytes: json['RemainingTransferBytes'] as int?,
      requestTime: timeStampFromJson(json['RequestTime']),
      status: (json['Status'] as String?)?.toStatus(),
      targetFileSystemValues: json['TargetFileSystemValues'] != null
          ? FileSystem.fromJson(
              json['TargetFileSystemValues'] as Map<String, dynamic>)
          : null,
      targetSnapshotValues: json['TargetSnapshotValues'] != null
          ? Snapshot.fromJson(
              json['TargetSnapshotValues'] as Map<String, dynamic>)
          : null,
      targetVolumeValues: json['TargetVolumeValues'] != null
          ? Volume.fromJson(json['TargetVolumeValues'] as Map<String, dynamic>)
          : null,
      totalTransferBytes: json['TotalTransferBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final administrativeActionType = this.administrativeActionType;
    final failureDetails = this.failureDetails;
    final progressPercent = this.progressPercent;
    final remainingTransferBytes = this.remainingTransferBytes;
    final requestTime = this.requestTime;
    final status = this.status;
    final targetFileSystemValues = this.targetFileSystemValues;
    final targetSnapshotValues = this.targetSnapshotValues;
    final targetVolumeValues = this.targetVolumeValues;
    final totalTransferBytes = this.totalTransferBytes;
    return {
      if (administrativeActionType != null)
        'AdministrativeActionType': administrativeActionType.toValue(),
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (progressPercent != null) 'ProgressPercent': progressPercent,
      if (remainingTransferBytes != null)
        'RemainingTransferBytes': remainingTransferBytes,
      if (requestTime != null) 'RequestTime': unixTimestampToJson(requestTime),
      if (status != null) 'Status': status.toValue(),
      if (targetFileSystemValues != null)
        'TargetFileSystemValues': targetFileSystemValues,
      if (targetSnapshotValues != null)
        'TargetSnapshotValues': targetSnapshotValues,
      if (targetVolumeValues != null) 'TargetVolumeValues': targetVolumeValues,
      if (totalTransferBytes != null) 'TotalTransferBytes': totalTransferBytes,
    };
  }
}

/// Provides information about a failed administrative action.
class AdministrativeActionFailureDetails {
  /// Error message providing details about the failed administrative action.
  final String? message;

  AdministrativeActionFailureDetails({
    this.message,
  });

  factory AdministrativeActionFailureDetails.fromJson(
      Map<String, dynamic> json) {
    return AdministrativeActionFailureDetails(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Describes the type of administrative action, as follows:
///
/// <ul>
/// <li>
/// <code>FILE_SYSTEM_UPDATE</code> - A file system update administrative action
/// initiated from the Amazon FSx console, API (<code>UpdateFileSystem</code>),
/// or CLI (<code>update-file-system</code>).
/// </li>
/// <li>
/// <code>THROUGHPUT_OPTIMIZATION</code> - After the
/// <code>FILE_SYSTEM_UPDATE</code> task to increase a file system's throughput
/// capacity has been completed successfully, a
/// <code>THROUGHPUT_OPTIMIZATION</code> task starts.
///
/// You can track the storage-optimization progress using the
/// <code>ProgressPercent</code> property. When
/// <code>THROUGHPUT_OPTIMIZATION</code> has been completed successfully, the
/// parent <code>FILE_SYSTEM_UPDATE</code> action status changes to
/// <code>COMPLETED</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-throughput-capacity.html">Managing
/// throughput capacity</a> in the <i>Amazon FSx for Windows File Server User
/// Guide</i>.
/// </li>
/// <li>
/// <code>STORAGE_OPTIMIZATION</code> - After the
/// <code>FILE_SYSTEM_UPDATE</code> task to increase a file system's storage
/// capacity has been completed successfully, a
/// <code>STORAGE_OPTIMIZATION</code> task starts.
///
/// <ul>
/// <li>
/// For Windows and ONTAP, storage optimization is the process of migrating the
/// file system data to newer larger disks.
/// </li>
/// <li>
/// For Lustre, storage optimization consists of rebalancing the data across the
/// existing and newly added file servers.
/// </li>
/// </ul>
/// You can track the storage-optimization progress using the
/// <code>ProgressPercent</code> property. When
/// <code>STORAGE_OPTIMIZATION</code> has been completed successfully, the
/// parent <code>FILE_SYSTEM_UPDATE</code> action status changes to
/// <code>COMPLETED</code>. For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-storage-capacity.html">Managing
/// storage capacity</a> in the <i>Amazon FSx for Windows File Server User
/// Guide</i>, <a
/// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-storage-capacity.html">Managing
/// storage capacity</a> in the <i>Amazon FSx for Lustre User Guide</i>, and <a
/// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-storage-capacity.html">Managing
/// storage capacity and provisioned IOPS</a> in the <i>Amazon FSx for NetApp
/// ONTAP User Guide</i>.
/// </li>
/// <li>
/// <code>FILE_SYSTEM_ALIAS_ASSOCIATION</code> - A file system update to
/// associate a new Domain Name System (DNS) alias with the file system. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_AssociateFileSystemAliases.html">
/// AssociateFileSystemAliases</a>.
/// </li>
/// <li>
/// <code>FILE_SYSTEM_ALIAS_DISASSOCIATION</code> - A file system update to
/// disassociate a DNS alias from the file system. For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_DisassociateFileSystemAliases.html">DisassociateFileSystemAliases</a>.
/// </li>
/// <li>
/// <code>IOPS_OPTIMIZATION</code> - After the <code>FILE_SYSTEM_UPDATE</code>
/// task to increase a file system's throughput capacity has been completed
/// successfully, a <code>IOPS_OPTIMIZATION</code> task starts.
///
/// You can track the storage-optimization progress using the
/// <code>ProgressPercent</code> property. When <code>IOPS_OPTIMIZATION</code>
/// has been completed successfully, the parent <code>FILE_SYSTEM_UPDATE</code>
/// action status changes to <code>COMPLETED</code>. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-provisioned-ssd-iops.html">Managing
/// provisioned SSD IOPS</a> in the Amazon FSx for Windows File Server User
/// Guide.
/// </li>
/// <li>
/// <code>STORAGE_TYPE_OPTIMIZATION</code> - After the
/// <code>FILE_SYSTEM_UPDATE</code> task to increase a file system's throughput
/// capacity has been completed successfully, a
/// <code>STORAGE_TYPE_OPTIMIZATION</code> task starts.
///
/// You can track the storage-optimization progress using the
/// <code>ProgressPercent</code> property. When
/// <code>STORAGE_TYPE_OPTIMIZATION</code> has been completed successfully, the
/// parent <code>FILE_SYSTEM_UPDATE</code> action status changes to
/// <code>COMPLETED</code>.
/// </li>
/// <li>
/// <code>VOLUME_UPDATE</code> - A volume update to an Amazon FSx for OpenZFS
/// volume initiated from the Amazon FSx console, API
/// (<code>UpdateVolume</code>), or CLI (<code>update-volume</code>).
/// </li>
/// <li>
/// <code>VOLUME_RESTORE</code> - An Amazon FSx for OpenZFS volume is returned
/// to the state saved by the specified snapshot, initiated from an API
/// (<code>RestoreVolumeFromSnapshot</code>) or CLI
/// (<code>restore-volume-from-snapshot</code>).
/// </li>
/// <li>
/// <code>SNAPSHOT_UPDATE</code> - A snapshot update to an Amazon FSx for
/// OpenZFS volume initiated from the Amazon FSx console, API
/// (<code>UpdateSnapshot</code>), or CLI (<code>update-snapshot</code>).
/// </li>
/// <li>
/// <code>RELEASE_NFS_V3_LOCKS</code> - Tracks the release of Network File
/// System (NFS) V3 locks on an Amazon FSx for OpenZFS file system.
/// </li>
/// <li>
/// <code>VOLUME_INITIALIZE_WITH_SNAPSHOT</code> - A volume is being created
/// from a snapshot on a different FSx for OpenZFS file system. You can initiate
/// this from the Amazon FSx console, API (<code>CreateVolume</code>), or CLI
/// (<code>create-volume</code>) when using the using the <code>FULL_COPY</code>
/// strategy.
/// </li>
/// <li>
/// <code>VOLUME_UPDATE_WITH_SNAPSHOT</code> - A volume is being updated from a
/// snapshot on a different FSx for OpenZFS file system. You can initiate this
/// from the Amazon FSx console, API (<code>CopySnapshotAndUpdateVolume</code>),
/// or CLI (<code>copy-snapshot-and-update-volume</code>).
/// </li>
/// </ul>
enum AdministrativeActionType {
  fileSystemUpdate,
  storageOptimization,
  fileSystemAliasAssociation,
  fileSystemAliasDisassociation,
  volumeUpdate,
  snapshotUpdate,
  releaseNfsV3Locks,
  volumeRestore,
  throughputOptimization,
  iopsOptimization,
  storageTypeOptimization,
  misconfiguredStateRecovery,
  volumeUpdateWithSnapshot,
  volumeInitializeWithSnapshot,
}

extension AdministrativeActionTypeValueExtension on AdministrativeActionType {
  String toValue() {
    switch (this) {
      case AdministrativeActionType.fileSystemUpdate:
        return 'FILE_SYSTEM_UPDATE';
      case AdministrativeActionType.storageOptimization:
        return 'STORAGE_OPTIMIZATION';
      case AdministrativeActionType.fileSystemAliasAssociation:
        return 'FILE_SYSTEM_ALIAS_ASSOCIATION';
      case AdministrativeActionType.fileSystemAliasDisassociation:
        return 'FILE_SYSTEM_ALIAS_DISASSOCIATION';
      case AdministrativeActionType.volumeUpdate:
        return 'VOLUME_UPDATE';
      case AdministrativeActionType.snapshotUpdate:
        return 'SNAPSHOT_UPDATE';
      case AdministrativeActionType.releaseNfsV3Locks:
        return 'RELEASE_NFS_V3_LOCKS';
      case AdministrativeActionType.volumeRestore:
        return 'VOLUME_RESTORE';
      case AdministrativeActionType.throughputOptimization:
        return 'THROUGHPUT_OPTIMIZATION';
      case AdministrativeActionType.iopsOptimization:
        return 'IOPS_OPTIMIZATION';
      case AdministrativeActionType.storageTypeOptimization:
        return 'STORAGE_TYPE_OPTIMIZATION';
      case AdministrativeActionType.misconfiguredStateRecovery:
        return 'MISCONFIGURED_STATE_RECOVERY';
      case AdministrativeActionType.volumeUpdateWithSnapshot:
        return 'VOLUME_UPDATE_WITH_SNAPSHOT';
      case AdministrativeActionType.volumeInitializeWithSnapshot:
        return 'VOLUME_INITIALIZE_WITH_SNAPSHOT';
    }
  }
}

extension AdministrativeActionTypeFromString on String {
  AdministrativeActionType toAdministrativeActionType() {
    switch (this) {
      case 'FILE_SYSTEM_UPDATE':
        return AdministrativeActionType.fileSystemUpdate;
      case 'STORAGE_OPTIMIZATION':
        return AdministrativeActionType.storageOptimization;
      case 'FILE_SYSTEM_ALIAS_ASSOCIATION':
        return AdministrativeActionType.fileSystemAliasAssociation;
      case 'FILE_SYSTEM_ALIAS_DISASSOCIATION':
        return AdministrativeActionType.fileSystemAliasDisassociation;
      case 'VOLUME_UPDATE':
        return AdministrativeActionType.volumeUpdate;
      case 'SNAPSHOT_UPDATE':
        return AdministrativeActionType.snapshotUpdate;
      case 'RELEASE_NFS_V3_LOCKS':
        return AdministrativeActionType.releaseNfsV3Locks;
      case 'VOLUME_RESTORE':
        return AdministrativeActionType.volumeRestore;
      case 'THROUGHPUT_OPTIMIZATION':
        return AdministrativeActionType.throughputOptimization;
      case 'IOPS_OPTIMIZATION':
        return AdministrativeActionType.iopsOptimization;
      case 'STORAGE_TYPE_OPTIMIZATION':
        return AdministrativeActionType.storageTypeOptimization;
      case 'MISCONFIGURED_STATE_RECOVERY':
        return AdministrativeActionType.misconfiguredStateRecovery;
      case 'VOLUME_UPDATE_WITH_SNAPSHOT':
        return AdministrativeActionType.volumeUpdateWithSnapshot;
      case 'VOLUME_INITIALIZE_WITH_SNAPSHOT':
        return AdministrativeActionType.volumeInitializeWithSnapshot;
    }
    throw Exception('$this is not known in enum AdministrativeActionType');
  }
}

/// Used to specify configuration options for a volume’s storage aggregate or
/// aggregates.
class AggregateConfiguration {
  /// The list of aggregates that this volume resides on. Aggregates are storage
  /// pools which make up your primary storage tier. Each high-availability (HA)
  /// pair has one aggregate. The names of the aggregates map to the names of the
  /// aggregates in the ONTAP CLI and REST API. For FlexVols, there will always be
  /// a single entry.
  ///
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The strings in the value of <code>Aggregates</code> are not are not
  /// formatted as <code>aggrX</code>, where X is a number between 1 and 6.
  /// </li>
  /// <li>
  /// The value of <code>Aggregates</code> contains aggregates that are not
  /// present.
  /// </li>
  /// <li>
  /// One or more of the aggregates supplied are too close to the volume limit to
  /// support adding more volumes.
  /// </li>
  /// </ul>
  final List<String>? aggregates;

  /// The total number of constituents this FlexGroup volume has. Not applicable
  /// for FlexVols.
  final int? totalConstituents;

  AggregateConfiguration({
    this.aggregates,
    this.totalConstituents,
  });

  factory AggregateConfiguration.fromJson(Map<String, dynamic> json) {
    return AggregateConfiguration(
      aggregates: (json['Aggregates'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      totalConstituents: json['TotalConstituents'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregates = this.aggregates;
    final totalConstituents = this.totalConstituents;
    return {
      if (aggregates != null) 'Aggregates': aggregates,
      if (totalConstituents != null) 'TotalConstituents': totalConstituents,
    };
  }
}

/// A DNS alias that is associated with the file system. You can use a DNS alias
/// to access a file system using user-defined DNS names, in addition to the
/// default DNS name that Amazon FSx assigns to the file system. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html">DNS
/// aliases</a> in the <i>FSx for Windows File Server User Guide</i>.
class Alias {
  /// Describes the state of the DNS alias.
  ///
  /// <ul>
  /// <li>
  /// AVAILABLE - The DNS alias is associated with an Amazon FSx file system.
  /// </li>
  /// <li>
  /// CREATING - Amazon FSx is creating the DNS alias and associating it with the
  /// file system.
  /// </li>
  /// <li>
  /// CREATE_FAILED - Amazon FSx was unable to associate the DNS alias with the
  /// file system.
  /// </li>
  /// <li>
  /// DELETING - Amazon FSx is disassociating the DNS alias from the file system
  /// and deleting it.
  /// </li>
  /// <li>
  /// DELETE_FAILED - Amazon FSx was unable to disassociate the DNS alias from the
  /// file system.
  /// </li>
  /// </ul>
  final AliasLifecycle? lifecycle;

  /// The name of the DNS alias. The alias name has to meet the following
  /// requirements:
  ///
  /// <ul>
  /// <li>
  /// Formatted as a fully-qualified domain name (FQDN),
  /// <code>hostname.domain</code>, for example,
  /// <code>accounting.example.com</code>.
  /// </li>
  /// <li>
  /// Can contain alphanumeric characters, the underscore (_), and the hyphen (-).
  /// </li>
  /// <li>
  /// Cannot start or end with a hyphen.
  /// </li>
  /// <li>
  /// Can start with a numeric.
  /// </li>
  /// </ul>
  /// For DNS names, Amazon FSx stores alphabetic characters as lowercase letters
  /// (a-z), regardless of how you specify them: as uppercase letters, lowercase
  /// letters, or the corresponding letters in escape codes.
  final String? name;

  Alias({
    this.lifecycle,
    this.name,
  });

  factory Alias.fromJson(Map<String, dynamic> json) {
    return Alias(
      lifecycle: (json['Lifecycle'] as String?)?.toAliasLifecycle(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycle = this.lifecycle;
    final name = this.name;
    return {
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (name != null) 'Name': name,
    };
  }
}

enum AliasLifecycle {
  available,
  creating,
  deleting,
  createFailed,
  deleteFailed,
}

extension AliasLifecycleValueExtension on AliasLifecycle {
  String toValue() {
    switch (this) {
      case AliasLifecycle.available:
        return 'AVAILABLE';
      case AliasLifecycle.creating:
        return 'CREATING';
      case AliasLifecycle.deleting:
        return 'DELETING';
      case AliasLifecycle.createFailed:
        return 'CREATE_FAILED';
      case AliasLifecycle.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension AliasLifecycleFromString on String {
  AliasLifecycle toAliasLifecycle() {
    switch (this) {
      case 'AVAILABLE':
        return AliasLifecycle.available;
      case 'CREATING':
        return AliasLifecycle.creating;
      case 'DELETING':
        return AliasLifecycle.deleting;
      case 'CREATE_FAILED':
        return AliasLifecycle.createFailed;
      case 'DELETE_FAILED':
        return AliasLifecycle.deleteFailed;
    }
    throw Exception('$this is not known in enum AliasLifecycle');
  }
}

/// The system generated response showing the DNS aliases that Amazon FSx is
/// attempting to associate with the file system. Use the API operation to
/// monitor the status of the aliases Amazon FSx is associating with the file
/// system. It can take up to 2.5 minutes for the alias status to change from
/// <code>CREATING</code> to <code>AVAILABLE</code>.
class AssociateFileSystemAliasesResponse {
  /// An array of the DNS aliases that Amazon FSx is associating with the file
  /// system.
  final List<Alias>? aliases;

  AssociateFileSystemAliasesResponse({
    this.aliases,
  });

  factory AssociateFileSystemAliasesResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateFileSystemAliasesResponse(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => Alias.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    return {
      if (aliases != null) 'Aliases': aliases,
    };
  }
}

/// Describes a data repository association's automatic export policy. The
/// <code>AutoExportPolicy</code> defines the types of updated objects on the
/// file system that will be automatically exported to the data repository. As
/// you create, modify, or delete files, Amazon FSx for Lustre automatically
/// exports the defined changes asynchronously once your application finishes
/// modifying the file.
///
/// The <code>AutoExportPolicy</code> is only supported on Amazon FSx for Lustre
/// file systems with a data repository association.
class AutoExportPolicy {
  /// The <code>AutoExportPolicy</code> can have the following event values:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - New files and directories are automatically exported to
  /// the data repository as they are added to the file system.
  /// </li>
  /// <li>
  /// <code>CHANGED</code> - Changes to files and directories on the file system
  /// are automatically exported to the data repository.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - Files and directories are automatically deleted on
  /// the data repository when they are deleted on the file system.
  /// </li>
  /// </ul>
  /// You can define any combination of event types for your
  /// <code>AutoExportPolicy</code>.
  final List<EventType>? events;

  AutoExportPolicy({
    this.events,
  });

  factory AutoExportPolicy.fromJson(Map<String, dynamic> json) {
    return AutoExportPolicy(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    return {
      if (events != null) 'Events': events.map((e) => e.toValue()).toList(),
    };
  }
}

/// Describes the data repository association's automatic import policy. The
/// AutoImportPolicy defines how Amazon FSx keeps your file metadata and
/// directory listings up to date by importing changes to your Amazon FSx for
/// Lustre file system as you modify objects in a linked S3 bucket.
///
/// The <code>AutoImportPolicy</code> is only supported on Amazon FSx for Lustre
/// file systems with a data repository association.
class AutoImportPolicy {
  /// The <code>AutoImportPolicy</code> can have the following event values:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW</code> - Amazon FSx automatically imports metadata of files added
  /// to the linked S3 bucket that do not currently exist in the FSx file system.
  /// </li>
  /// <li>
  /// <code>CHANGED</code> - Amazon FSx automatically updates file metadata and
  /// invalidates existing file content on the file system as files change in the
  /// data repository.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - Amazon FSx automatically deletes files on the file
  /// system as corresponding files are deleted in the data repository.
  /// </li>
  /// </ul>
  /// You can define any combination of event types for your
  /// <code>AutoImportPolicy</code>.
  final List<EventType>? events;

  AutoImportPolicy({
    this.events,
  });

  factory AutoImportPolicy.fromJson(Map<String, dynamic> json) {
    return AutoImportPolicy(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    return {
      if (events != null) 'Events': events.map((e) => e.toValue()).toList(),
    };
  }
}

enum AutoImportPolicyType {
  none,
  $new,
  newChanged,
  newChangedDeleted,
}

extension AutoImportPolicyTypeValueExtension on AutoImportPolicyType {
  String toValue() {
    switch (this) {
      case AutoImportPolicyType.none:
        return 'NONE';
      case AutoImportPolicyType.$new:
        return 'NEW';
      case AutoImportPolicyType.newChanged:
        return 'NEW_CHANGED';
      case AutoImportPolicyType.newChangedDeleted:
        return 'NEW_CHANGED_DELETED';
    }
  }
}

extension AutoImportPolicyTypeFromString on String {
  AutoImportPolicyType toAutoImportPolicyType() {
    switch (this) {
      case 'NONE':
        return AutoImportPolicyType.none;
      case 'NEW':
        return AutoImportPolicyType.$new;
      case 'NEW_CHANGED':
        return AutoImportPolicyType.newChanged;
      case 'NEW_CHANGED_DELETED':
        return AutoImportPolicyType.newChangedDeleted;
    }
    throw Exception('$this is not known in enum AutoImportPolicyType');
  }
}

/// Sets the autocommit period of files in an FSx for ONTAP SnapLock volume,
/// which determines how long the files must remain unmodified before they're
/// automatically transitioned to the write once, read many (WORM) state.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-autocommit">Autocommit</a>.
class AutocommitPeriod {
  /// Defines the type of time for the autocommit period of a file in an FSx for
  /// ONTAP SnapLock volume. Setting this value to <code>NONE</code> disables
  /// autocommit. The default value is <code>NONE</code>.
  final AutocommitPeriodType type;

  /// Defines the amount of time for the autocommit period of a file in an FSx for
  /// ONTAP SnapLock volume. The following ranges are valid:
  ///
  /// <ul>
  /// <li>
  /// <code>Minutes</code>: 5 - 65,535
  /// </li>
  /// <li>
  /// <code>Hours</code>: 1 - 65,535
  /// </li>
  /// <li>
  /// <code>Days</code>: 1 - 3,650
  /// </li>
  /// <li>
  /// <code>Months</code>: 1 - 120
  /// </li>
  /// <li>
  /// <code>Years</code>: 1 - 10
  /// </li>
  /// </ul>
  final int? value;

  AutocommitPeriod({
    required this.type,
    this.value,
  });

  factory AutocommitPeriod.fromJson(Map<String, dynamic> json) {
    return AutocommitPeriod(
      type: (json['Type'] as String).toAutocommitPeriodType(),
      value: json['Value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum AutocommitPeriodType {
  minutes,
  hours,
  days,
  months,
  years,
  none,
}

extension AutocommitPeriodTypeValueExtension on AutocommitPeriodType {
  String toValue() {
    switch (this) {
      case AutocommitPeriodType.minutes:
        return 'MINUTES';
      case AutocommitPeriodType.hours:
        return 'HOURS';
      case AutocommitPeriodType.days:
        return 'DAYS';
      case AutocommitPeriodType.months:
        return 'MONTHS';
      case AutocommitPeriodType.years:
        return 'YEARS';
      case AutocommitPeriodType.none:
        return 'NONE';
    }
  }
}

extension AutocommitPeriodTypeFromString on String {
  AutocommitPeriodType toAutocommitPeriodType() {
    switch (this) {
      case 'MINUTES':
        return AutocommitPeriodType.minutes;
      case 'HOURS':
        return AutocommitPeriodType.hours;
      case 'DAYS':
        return AutocommitPeriodType.days;
      case 'MONTHS':
        return AutocommitPeriodType.months;
      case 'YEARS':
        return AutocommitPeriodType.years;
      case 'NONE':
        return AutocommitPeriodType.none;
    }
    throw Exception('$this is not known in enum AutocommitPeriodType');
  }
}

/// A backup of an Amazon FSx for Windows File Server, Amazon FSx for Lustre
/// file system, Amazon FSx for NetApp ONTAP volume, or Amazon FSx for OpenZFS
/// file system.
class Backup {
  /// The ID of the backup.
  final String backupId;

  /// The time when a particular backup was created.
  final DateTime creationTime;

  /// The metadata of the file system associated with the backup. This metadata is
  /// persisted even if the file system is deleted.
  final FileSystem fileSystem;

  /// The lifecycle status of the backup.
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The backup is fully available.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - For user-initiated backups on Lustre file systems
  /// only; Amazon FSx hasn't started creating the backup.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - Amazon FSx is creating the backup.
  /// </li>
  /// <li>
  /// <code>TRANSFERRING</code> - For user-initiated backups on Lustre file
  /// systems only; Amazon FSx is transferring the backup to Amazon S3.
  /// </li>
  /// <li>
  /// <code>COPYING</code> - Amazon FSx is copying the backup.
  /// </li>
  /// <li>
  /// <code>DELETED</code> - Amazon FSx deleted the backup and it's no longer
  /// available.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Amazon FSx couldn't finish the backup.
  /// </li>
  /// </ul>
  final BackupLifecycle lifecycle;

  /// The type of the file-system backup.
  final BackupType type;

  /// The configuration of the self-managed Microsoft Active Directory directory
  /// to which the Windows File Server instance is joined.
  final ActiveDirectoryBackupAttributes? directoryInformation;

  /// Details explaining any failures that occurred when creating a backup.
  final BackupFailureDetails? failureDetails;

  /// The ID of the Key Management Service (KMS) key used to encrypt the backup of
  /// the Amazon FSx file system's data at rest.
  final String? kmsKeyId;
  final String? ownerId;
  final int? progressPercent;

  /// The Amazon Resource Name (ARN) for the backup resource.
  final String? resourceARN;

  /// Specifies the resource type that's backed up.
  final ResourceType? resourceType;
  final String? sourceBackupId;

  /// The source Region of the backup. Specifies the Region from where this backup
  /// is copied.
  final String? sourceBackupRegion;

  /// The tags associated with a particular file system.
  final List<Tag>? tags;
  final Volume? volume;

  Backup({
    required this.backupId,
    required this.creationTime,
    required this.fileSystem,
    required this.lifecycle,
    required this.type,
    this.directoryInformation,
    this.failureDetails,
    this.kmsKeyId,
    this.ownerId,
    this.progressPercent,
    this.resourceARN,
    this.resourceType,
    this.sourceBackupId,
    this.sourceBackupRegion,
    this.tags,
    this.volume,
  });

  factory Backup.fromJson(Map<String, dynamic> json) {
    return Backup(
      backupId: json['BackupId'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      fileSystem:
          FileSystem.fromJson(json['FileSystem'] as Map<String, dynamic>),
      lifecycle: (json['Lifecycle'] as String).toBackupLifecycle(),
      type: (json['Type'] as String).toBackupType(),
      directoryInformation: json['DirectoryInformation'] != null
          ? ActiveDirectoryBackupAttributes.fromJson(
              json['DirectoryInformation'] as Map<String, dynamic>)
          : null,
      failureDetails: json['FailureDetails'] != null
          ? BackupFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['KmsKeyId'] as String?,
      ownerId: json['OwnerId'] as String?,
      progressPercent: json['ProgressPercent'] as int?,
      resourceARN: json['ResourceARN'] as String?,
      resourceType: (json['ResourceType'] as String?)?.toResourceType(),
      sourceBackupId: json['SourceBackupId'] as String?,
      sourceBackupRegion: json['SourceBackupRegion'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      volume: json['Volume'] != null
          ? Volume.fromJson(json['Volume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backupId = this.backupId;
    final creationTime = this.creationTime;
    final fileSystem = this.fileSystem;
    final lifecycle = this.lifecycle;
    final type = this.type;
    final directoryInformation = this.directoryInformation;
    final failureDetails = this.failureDetails;
    final kmsKeyId = this.kmsKeyId;
    final ownerId = this.ownerId;
    final progressPercent = this.progressPercent;
    final resourceARN = this.resourceARN;
    final resourceType = this.resourceType;
    final sourceBackupId = this.sourceBackupId;
    final sourceBackupRegion = this.sourceBackupRegion;
    final tags = this.tags;
    final volume = this.volume;
    return {
      'BackupId': backupId,
      'CreationTime': unixTimestampToJson(creationTime),
      'FileSystem': fileSystem,
      'Lifecycle': lifecycle.toValue(),
      'Type': type.toValue(),
      if (directoryInformation != null)
        'DirectoryInformation': directoryInformation,
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (ownerId != null) 'OwnerId': ownerId,
      if (progressPercent != null) 'ProgressPercent': progressPercent,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (resourceType != null) 'ResourceType': resourceType.toValue(),
      if (sourceBackupId != null) 'SourceBackupId': sourceBackupId,
      if (sourceBackupRegion != null) 'SourceBackupRegion': sourceBackupRegion,
      if (tags != null) 'Tags': tags,
      if (volume != null) 'Volume': volume,
    };
  }
}

/// If backup creation fails, this structure contains the details of that
/// failure.
class BackupFailureDetails {
  /// A message describing the backup-creation failure.
  final String? message;

  BackupFailureDetails({
    this.message,
  });

  factory BackupFailureDetails.fromJson(Map<String, dynamic> json) {
    return BackupFailureDetails(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The lifecycle status of the backup.
///
/// <ul>
/// <li>
/// <code>AVAILABLE</code> - The backup is fully available.
/// </li>
/// <li>
/// <code>PENDING</code> - For user-initiated backups on Lustre file systems
/// only; Amazon FSx hasn't started creating the backup.
/// </li>
/// <li>
/// <code>CREATING</code> - Amazon FSx is creating the new user-initiated
/// backup.
/// </li>
/// <li>
/// <code>TRANSFERRING</code> - For user-initiated backups on Lustre file
/// systems only; Amazon FSx is backing up the file system.
/// </li>
/// <li>
/// <code>COPYING</code> - Amazon FSx is copying the backup.
/// </li>
/// <li>
/// <code>DELETED</code> - Amazon FSx deleted the backup and it's no longer
/// available.
/// </li>
/// <li>
/// <code>FAILED</code> - Amazon FSx couldn't finish the backup.
/// </li>
/// </ul>
enum BackupLifecycle {
  available,
  creating,
  transferring,
  deleted,
  failed,
  pending,
  copying,
}

extension BackupLifecycleValueExtension on BackupLifecycle {
  String toValue() {
    switch (this) {
      case BackupLifecycle.available:
        return 'AVAILABLE';
      case BackupLifecycle.creating:
        return 'CREATING';
      case BackupLifecycle.transferring:
        return 'TRANSFERRING';
      case BackupLifecycle.deleted:
        return 'DELETED';
      case BackupLifecycle.failed:
        return 'FAILED';
      case BackupLifecycle.pending:
        return 'PENDING';
      case BackupLifecycle.copying:
        return 'COPYING';
    }
  }
}

extension BackupLifecycleFromString on String {
  BackupLifecycle toBackupLifecycle() {
    switch (this) {
      case 'AVAILABLE':
        return BackupLifecycle.available;
      case 'CREATING':
        return BackupLifecycle.creating;
      case 'TRANSFERRING':
        return BackupLifecycle.transferring;
      case 'DELETED':
        return BackupLifecycle.deleted;
      case 'FAILED':
        return BackupLifecycle.failed;
      case 'PENDING':
        return BackupLifecycle.pending;
      case 'COPYING':
        return BackupLifecycle.copying;
    }
    throw Exception('$this is not known in enum BackupLifecycle');
  }
}

/// The type of the backup.
enum BackupType {
  automatic,
  userInitiated,
  awsBackup,
}

extension BackupTypeValueExtension on BackupType {
  String toValue() {
    switch (this) {
      case BackupType.automatic:
        return 'AUTOMATIC';
      case BackupType.userInitiated:
        return 'USER_INITIATED';
      case BackupType.awsBackup:
        return 'AWS_BACKUP';
    }
  }
}

extension BackupTypeFromString on String {
  BackupType toBackupType() {
    switch (this) {
      case 'AUTOMATIC':
        return BackupType.automatic;
      case 'USER_INITIATED':
        return BackupType.userInitiated;
      case 'AWS_BACKUP':
        return BackupType.awsBackup;
    }
    throw Exception('$this is not known in enum BackupType');
  }
}

class CancelDataRepositoryTaskResponse {
  /// The lifecycle status of the data repository task, as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - Amazon FSx has not started the task.
  /// </li>
  /// <li>
  /// <code>EXECUTING</code> - Amazon FSx is processing the task.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Amazon FSx was not able to complete the task. For
  /// example, there may be files the task failed to process. The
  /// <a>DataRepositoryTaskFailureDetails</a> property provides more information
  /// about task failures.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code> - FSx completed the task successfully.
  /// </li>
  /// <li>
  /// <code>CANCELED</code> - Amazon FSx canceled the task and it did not
  /// complete.
  /// </li>
  /// <li>
  /// <code>CANCELING</code> - FSx is in process of canceling the task.
  /// </li>
  /// </ul>
  final DataRepositoryTaskLifecycle? lifecycle;

  /// The ID of the task being canceled.
  final String? taskId;

  CancelDataRepositoryTaskResponse({
    this.lifecycle,
    this.taskId,
  });

  factory CancelDataRepositoryTaskResponse.fromJson(Map<String, dynamic> json) {
    return CancelDataRepositoryTaskResponse(
      lifecycle:
          (json['Lifecycle'] as String?)?.toDataRepositoryTaskLifecycle(),
      taskId: json['TaskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycle = this.lifecycle;
    final taskId = this.taskId;
    return {
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (taskId != null) 'TaskId': taskId,
    };
  }
}

/// Provides a report detailing the data repository task results of the files
/// processed that match the criteria specified in the report <code>Scope</code>
/// parameter. FSx delivers the report to the file system's linked data
/// repository in Amazon S3, using the path specified in the report
/// <code>Path</code> parameter. You can specify whether or not a report gets
/// generated for a task using the <code>Enabled</code> parameter.
class CompletionReport {
  /// Set <code>Enabled</code> to <code>True</code> to generate a
  /// <code>CompletionReport</code> when the task completes. If set to
  /// <code>true</code>, then you need to provide a report <code>Scope</code>,
  /// <code>Path</code>, and <code>Format</code>. Set <code>Enabled</code> to
  /// <code>False</code> if you do not want a <code>CompletionReport</code>
  /// generated when the task completes.
  final bool enabled;

  /// Required if <code>Enabled</code> is set to <code>true</code>. Specifies the
  /// format of the <code>CompletionReport</code>.
  /// <code>REPORT_CSV_20191124</code> is the only format currently supported.
  /// When <code>Format</code> is set to <code>REPORT_CSV_20191124</code>, the
  /// <code>CompletionReport</code> is provided in CSV format, and is delivered to
  /// <code>{path}/task-{id}/failures.csv</code>.
  final ReportFormat? format;

  /// Required if <code>Enabled</code> is set to <code>true</code>. Specifies the
  /// location of the report on the file system's linked S3 data repository. An
  /// absolute path that defines where the completion report will be stored in the
  /// destination location. The <code>Path</code> you provide must be located
  /// within the file system’s ExportPath. An example <code>Path</code> value is
  /// "s3://myBucket/myExportPath/optionalPrefix". The report provides the
  /// following information for each file in the report: FilePath, FileStatus, and
  /// ErrorCode.
  final String? path;

  /// Required if <code>Enabled</code> is set to <code>true</code>. Specifies the
  /// scope of the <code>CompletionReport</code>; <code>FAILED_FILES_ONLY</code>
  /// is the only scope currently supported. When <code>Scope</code> is set to
  /// <code>FAILED_FILES_ONLY</code>, the <code>CompletionReport</code> only
  /// contains information about files that the data repository task failed to
  /// process.
  final ReportScope? scope;

  CompletionReport({
    required this.enabled,
    this.format,
    this.path,
    this.scope,
  });

  factory CompletionReport.fromJson(Map<String, dynamic> json) {
    return CompletionReport(
      enabled: json['Enabled'] as bool,
      format: (json['Format'] as String?)?.toReportFormat(),
      path: json['Path'] as String?,
      scope: (json['Scope'] as String?)?.toReportScope(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final format = this.format;
    final path = this.path;
    final scope = this.scope;
    return {
      'Enabled': enabled,
      if (format != null) 'Format': format.toValue(),
      if (path != null) 'Path': path,
      if (scope != null) 'Scope': scope.toValue(),
    };
  }
}

class CopyBackupResponse {
  final Backup? backup;

  CopyBackupResponse({
    this.backup,
  });

  factory CopyBackupResponse.fromJson(Map<String, dynamic> json) {
    return CopyBackupResponse(
      backup: json['Backup'] != null
          ? Backup.fromJson(json['Backup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backup = this.backup;
    return {
      if (backup != null) 'Backup': backup,
    };
  }
}

class CopySnapshotAndUpdateVolumeResponse {
  /// A list of administrative actions for the file system that are in process or
  /// waiting to be processed. Administrative actions describe changes to the
  /// Amazon FSx system.
  final List<AdministrativeAction>? administrativeActions;

  /// The lifecycle state of the destination volume.
  final VolumeLifecycle? lifecycle;

  /// The ID of the volume that you copied the snapshot to.
  final String? volumeId;

  CopySnapshotAndUpdateVolumeResponse({
    this.administrativeActions,
    this.lifecycle,
    this.volumeId,
  });

  factory CopySnapshotAndUpdateVolumeResponse.fromJson(
      Map<String, dynamic> json) {
    return CopySnapshotAndUpdateVolumeResponse(
      administrativeActions: (json['AdministrativeActions'] as List?)
          ?.whereNotNull()
          .map((e) => AdministrativeAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      lifecycle: (json['Lifecycle'] as String?)?.toVolumeLifecycle(),
      volumeId: json['VolumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final administrativeActions = this.administrativeActions;
    final lifecycle = this.lifecycle;
    final volumeId = this.volumeId;
    return {
      if (administrativeActions != null)
        'AdministrativeActions': administrativeActions,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (volumeId != null) 'VolumeId': volumeId,
    };
  }
}

/// Used to specify the configuration options for an FSx for ONTAP volume's
/// storage aggregate or aggregates.
class CreateAggregateConfiguration {
  /// Used to specify the names of aggregates on which the volume will be created.
  final List<String>? aggregates;

  /// Used to explicitly set the number of constituents within the FlexGroup per
  /// storage aggregate. This field is optional when creating a FlexGroup volume.
  /// If unspecified, the default value will be 8. This field cannot be provided
  /// when creating a FlexVol volume.
  final int? constituentsPerAggregate;

  CreateAggregateConfiguration({
    this.aggregates,
    this.constituentsPerAggregate,
  });

  Map<String, dynamic> toJson() {
    final aggregates = this.aggregates;
    final constituentsPerAggregate = this.constituentsPerAggregate;
    return {
      if (aggregates != null) 'Aggregates': aggregates,
      if (constituentsPerAggregate != null)
        'ConstituentsPerAggregate': constituentsPerAggregate,
    };
  }
}

/// The response object for the <code>CreateBackup</code> operation.
class CreateBackupResponse {
  /// A description of the backup.
  final Backup? backup;

  CreateBackupResponse({
    this.backup,
  });

  factory CreateBackupResponse.fromJson(Map<String, dynamic> json) {
    return CreateBackupResponse(
      backup: json['Backup'] != null
          ? Backup.fromJson(json['Backup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final backup = this.backup;
    return {
      if (backup != null) 'Backup': backup,
    };
  }
}

class CreateDataRepositoryAssociationResponse {
  /// The response object returned after the data repository association is
  /// created.
  final DataRepositoryAssociation? association;

  CreateDataRepositoryAssociationResponse({
    this.association,
  });

  factory CreateDataRepositoryAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDataRepositoryAssociationResponse(
      association: json['Association'] != null
          ? DataRepositoryAssociation.fromJson(
              json['Association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'Association': association,
    };
  }
}

class CreateDataRepositoryTaskResponse {
  /// The description of the data repository task that you just created.
  final DataRepositoryTask? dataRepositoryTask;

  CreateDataRepositoryTaskResponse({
    this.dataRepositoryTask,
  });

  factory CreateDataRepositoryTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataRepositoryTaskResponse(
      dataRepositoryTask: json['DataRepositoryTask'] != null
          ? DataRepositoryTask.fromJson(
              json['DataRepositoryTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataRepositoryTask = this.dataRepositoryTask;
    return {
      if (dataRepositoryTask != null) 'DataRepositoryTask': dataRepositoryTask,
    };
  }
}

/// The Amazon File Cache configuration for the cache that you are creating.
class CreateFileCacheLustreConfiguration {
  /// Specifies the cache deployment type, which must be <code>CACHE_1</code>.
  final FileCacheLustreDeploymentType deploymentType;

  /// The configuration for a Lustre MDT (Metadata Target) storage volume.
  final FileCacheLustreMetadataConfiguration metadataConfiguration;

  /// Provisions the amount of read and write throughput for each 1 tebibyte (TiB)
  /// of cache storage capacity, in MB/s/TiB. The only supported value is
  /// <code>1000</code>.
  final int perUnitStorageThroughput;
  final String? weeklyMaintenanceStartTime;

  CreateFileCacheLustreConfiguration({
    required this.deploymentType,
    required this.metadataConfiguration,
    required this.perUnitStorageThroughput,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final deploymentType = this.deploymentType;
    final metadataConfiguration = this.metadataConfiguration;
    final perUnitStorageThroughput = this.perUnitStorageThroughput;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      'DeploymentType': deploymentType.toValue(),
      'MetadataConfiguration': metadataConfiguration,
      'PerUnitStorageThroughput': perUnitStorageThroughput,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

class CreateFileCacheResponse {
  /// A description of the cache that was created.
  final FileCacheCreating? fileCache;

  CreateFileCacheResponse({
    this.fileCache,
  });

  factory CreateFileCacheResponse.fromJson(Map<String, dynamic> json) {
    return CreateFileCacheResponse(
      fileCache: json['FileCache'] != null
          ? FileCacheCreating.fromJson(
              json['FileCache'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileCache = this.fileCache;
    return {
      if (fileCache != null) 'FileCache': fileCache,
    };
  }
}

/// The response object for the <code>CreateFileSystemFromBackup</code>
/// operation.
class CreateFileSystemFromBackupResponse {
  /// A description of the file system.
  final FileSystem? fileSystem;

  CreateFileSystemFromBackupResponse({
    this.fileSystem,
  });

  factory CreateFileSystemFromBackupResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateFileSystemFromBackupResponse(
      fileSystem: json['FileSystem'] != null
          ? FileSystem.fromJson(json['FileSystem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystem = this.fileSystem;
    return {
      if (fileSystem != null) 'FileSystem': fileSystem,
    };
  }
}

/// The Lustre configuration for the file system being created.
/// <note>
/// The following parameters are not supported for file systems with a data
/// repository association created with .
///
/// <ul>
/// <li>
/// <code>AutoImportPolicy</code>
/// </li>
/// <li>
/// <code>ExportPath</code>
/// </li>
/// <li>
/// <code>ImportedFileChunkSize</code>
/// </li>
/// <li>
/// <code>ImportPath</code>
/// </li>
/// </ul> </note>
class CreateFileSystemLustreConfiguration {
  /// (Optional) When you create your file system, your existing S3 objects appear
  /// as file and directory listings. Use this parameter to choose how Amazon FSx
  /// keeps your file and directory listings up to date as you add or modify
  /// objects in your linked S3 bucket. <code>AutoImportPolicy</code> can have the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - (Default) AutoImport is off. Amazon FSx only updates
  /// file and directory listings from the linked S3 bucket when the file system
  /// is created. FSx does not update file and directory listings for any new or
  /// changed objects after choosing this option.
  /// </li>
  /// <li>
  /// <code>NEW</code> - AutoImport is on. Amazon FSx automatically imports
  /// directory listings of any new objects added to the linked S3 bucket that do
  /// not currently exist in the FSx file system.
  /// </li>
  /// <li>
  /// <code>NEW_CHANGED</code> - AutoImport is on. Amazon FSx automatically
  /// imports file and directory listings of any new objects added to the S3
  /// bucket and any existing objects that are changed in the S3 bucket after you
  /// choose this option.
  /// </li>
  /// <li>
  /// <code>NEW_CHANGED_DELETED</code> - AutoImport is on. Amazon FSx
  /// automatically imports file and directory listings of any new objects added
  /// to the S3 bucket, any existing objects that are changed in the S3 bucket,
  /// and any objects that were deleted in the S3 bucket.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/older-deployment-types.html#legacy-auto-import-from-s3">
  /// Automatically import updates from your S3 bucket</a>.
  /// <note>
  /// This parameter is not supported for file systems with a data repository
  /// association.
  /// </note>
  final AutoImportPolicyType? autoImportPolicy;

  /// The number of days to retain automatic backups. Setting this property to
  /// <code>0</code> disables automatic backups. You can retain automatic backups
  /// for a maximum of 90 days. The default is <code>0</code>.
  final int? automaticBackupRetentionDays;

  /// (Optional) Not available for use with file systems that are linked to a data
  /// repository. A boolean flag indicating whether tags for the file system
  /// should be copied to backups. The default value is false. If
  /// <code>CopyTagsToBackups</code> is set to true, all file system tags are
  /// copied to all automatic and user-initiated backups when the user doesn't
  /// specify any backup-specific tags. If <code>CopyTagsToBackups</code> is set
  /// to true and you specify one or more backup tags, only the specified tags are
  /// copied to backups. If you specify one or more tags when creating a
  /// user-initiated backup, no tags are copied from the file system, regardless
  /// of this value.
  ///
  /// (Default = <code>false</code>)
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-backups-fsx.html">
  /// Working with backups</a> in the <i>Amazon FSx for Lustre User Guide</i>.
  final bool? copyTagsToBackups;
  final String? dailyAutomaticBackupStartTime;

  /// Sets the data compression configuration for the file system.
  /// <code>DataCompressionType</code> can have the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - (Default) Data compression is turned off when the file
  /// system is created.
  /// </li>
  /// <li>
  /// <code>LZ4</code> - Data compression is turned on with the LZ4 algorithm.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-compression.html">Lustre
  /// data compression</a> in the <i>Amazon FSx for Lustre User Guide</i>.
  final DataCompressionType? dataCompressionType;

  /// (Optional) Choose <code>SCRATCH_1</code> and <code>SCRATCH_2</code>
  /// deployment types when you need temporary storage and shorter-term processing
  /// of data. The <code>SCRATCH_2</code> deployment type provides in-transit
  /// encryption of data and higher burst throughput capacity than
  /// <code>SCRATCH_1</code>.
  ///
  /// Choose <code>PERSISTENT_1</code> for longer-term storage and for
  /// throughput-focused workloads that aren’t latency-sensitive.
  /// <code>PERSISTENT_1</code> supports encryption of data in transit, and is
  /// available in all Amazon Web Services Regions in which FSx for Lustre is
  /// available.
  ///
  /// Choose <code>PERSISTENT_2</code> for longer-term storage and for
  /// latency-sensitive workloads that require the highest levels of
  /// IOPS/throughput. <code>PERSISTENT_2</code> supports SSD storage, and offers
  /// higher <code>PerUnitStorageThroughput</code> (up to 1000 MB/s/TiB).
  /// <code>PERSISTENT_2</code> is available in a limited number of Amazon Web
  /// Services Regions. For more information, and an up-to-date list of Amazon Web
  /// Services Regions in which <code>PERSISTENT_2</code> is available, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/using-fsx-lustre.html#lustre-deployment-types">File
  /// system deployment options for FSx for Lustre</a> in the <i>Amazon FSx for
  /// Lustre User Guide</i>.
  /// <note>
  /// If you choose <code>PERSISTENT_2</code>, and you set
  /// <code>FileSystemTypeVersion</code> to <code>2.10</code>, the
  /// <code>CreateFileSystem</code> operation fails.
  /// </note>
  /// Encryption of data in transit is automatically turned on when you access
  /// <code>SCRATCH_2</code>, <code>PERSISTENT_1</code> and
  /// <code>PERSISTENT_2</code> file systems from Amazon EC2 instances that
  /// support automatic encryption in the Amazon Web Services Regions where they
  /// are available. For more information about encryption in transit for FSx for
  /// Lustre file systems, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/encryption-in-transit-fsxl.html">Encrypting
  /// data in transit</a> in the <i>Amazon FSx for Lustre User Guide</i>.
  ///
  /// (Default = <code>SCRATCH_1</code>)
  final LustreDeploymentType? deploymentType;

  /// The type of drive cache used by <code>PERSISTENT_1</code> file systems that
  /// are provisioned with HDD storage devices. This parameter is required when
  /// storage type is HDD. Set this property to <code>READ</code> to improve the
  /// performance for frequently accessed files by caching up to 20% of the total
  /// storage capacity of the file system.
  ///
  /// This parameter is required when <code>StorageType</code> is set to
  /// <code>HDD</code>.
  final DriveCacheType? driveCacheType;

  /// (Optional) Specifies the path in the Amazon S3 bucket where the root of your
  /// Amazon FSx file system is exported. The path must use the same Amazon S3
  /// bucket as specified in ImportPath. You can provide an optional prefix to
  /// which new and changed data is to be exported from your Amazon FSx for Lustre
  /// file system. If an <code>ExportPath</code> value is not provided, Amazon FSx
  /// sets a default export path,
  /// <code>s3://import-bucket/FSxLustre[creation-timestamp]</code>. The timestamp
  /// is in UTC format, for example
  /// <code>s3://import-bucket/FSxLustre20181105T222312Z</code>.
  ///
  /// The Amazon S3 export bucket must be the same as the import bucket specified
  /// by <code>ImportPath</code>. If you specify only a bucket name, such as
  /// <code>s3://import-bucket</code>, you get a 1:1 mapping of file system
  /// objects to S3 bucket objects. This mapping means that the input data in S3
  /// is overwritten on export. If you provide a custom prefix in the export path,
  /// such as <code>s3://import-bucket/[custom-optional-prefix]</code>, Amazon FSx
  /// exports the contents of your file system to that export prefix in the Amazon
  /// S3 bucket.
  /// <note>
  /// This parameter is not supported for file systems with a data repository
  /// association.
  /// </note>
  final String? exportPath;

  /// (Optional) The path to the Amazon S3 bucket (including the optional prefix)
  /// that you're using as the data repository for your Amazon FSx for Lustre file
  /// system. The root of your FSx for Lustre file system will be mapped to the
  /// root of the Amazon S3 bucket you select. An example is
  /// <code>s3://import-bucket/optional-prefix</code>. If you specify a prefix
  /// after the Amazon S3 bucket name, only object keys with that prefix are
  /// loaded into the file system.
  /// <note>
  /// This parameter is not supported for file systems with a data repository
  /// association.
  /// </note>
  final String? importPath;

  /// (Optional) For files imported from a data repository, this value determines
  /// the stripe count and maximum amount of data per file (in MiB) stored on a
  /// single physical disk. The maximum number of disks that a single file can be
  /// striped across is limited by the total number of disks that make up the file
  /// system.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  /// <note>
  /// This parameter is not supported for file systems with a data repository
  /// association.
  /// </note>
  final int? importedFileChunkSize;

  /// The Lustre logging configuration used when creating an Amazon FSx for Lustre
  /// file system. When logging is enabled, Lustre logs error and warning events
  /// for data repositories associated with your file system to Amazon CloudWatch
  /// Logs.
  final LustreLogCreateConfiguration? logConfiguration;

  /// Required with <code>PERSISTENT_1</code> and <code>PERSISTENT_2</code>
  /// deployment types, provisions the amount of read and write throughput for
  /// each 1 tebibyte (TiB) of file system storage capacity, in MB/s/TiB. File
  /// system throughput capacity is calculated by multiplying ﬁle system storage
  /// capacity (TiB) by the <code>PerUnitStorageThroughput</code> (MB/s/TiB). For
  /// a 2.4-TiB ﬁle system, provisioning 50 MB/s/TiB of
  /// <code>PerUnitStorageThroughput</code> yields 120 MB/s of ﬁle system
  /// throughput. You pay for the amount of throughput that you provision.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// For <code>PERSISTENT_1</code> SSD storage: 50, 100, 200 MB/s/TiB.
  /// </li>
  /// <li>
  /// For <code>PERSISTENT_1</code> HDD storage: 12, 40 MB/s/TiB.
  /// </li>
  /// <li>
  /// For <code>PERSISTENT_2</code> SSD storage: 125, 250, 500, 1000 MB/s/TiB.
  /// </li>
  /// </ul>
  final int? perUnitStorageThroughput;

  /// The Lustre root squash configuration used when creating an Amazon FSx for
  /// Lustre file system. When enabled, root squash restricts root-level access
  /// from clients that try to access your file system as a root user.
  final LustreRootSquashConfiguration? rootSquashConfiguration;

  /// (Optional) The preferred start time to perform weekly maintenance, formatted
  /// d:HH:MM in the UTC time zone, where d is the weekday number, from 1 through
  /// 7, beginning with Monday and ending with Sunday.
  final String? weeklyMaintenanceStartTime;

  CreateFileSystemLustreConfiguration({
    this.autoImportPolicy,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.dailyAutomaticBackupStartTime,
    this.dataCompressionType,
    this.deploymentType,
    this.driveCacheType,
    this.exportPath,
    this.importPath,
    this.importedFileChunkSize,
    this.logConfiguration,
    this.perUnitStorageThroughput,
    this.rootSquashConfiguration,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final autoImportPolicy = this.autoImportPolicy;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final copyTagsToBackups = this.copyTagsToBackups;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final dataCompressionType = this.dataCompressionType;
    final deploymentType = this.deploymentType;
    final driveCacheType = this.driveCacheType;
    final exportPath = this.exportPath;
    final importPath = this.importPath;
    final importedFileChunkSize = this.importedFileChunkSize;
    final logConfiguration = this.logConfiguration;
    final perUnitStorageThroughput = this.perUnitStorageThroughput;
    final rootSquashConfiguration = this.rootSquashConfiguration;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (autoImportPolicy != null)
        'AutoImportPolicy': autoImportPolicy.toValue(),
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (dataCompressionType != null)
        'DataCompressionType': dataCompressionType.toValue(),
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (driveCacheType != null) 'DriveCacheType': driveCacheType.toValue(),
      if (exportPath != null) 'ExportPath': exportPath,
      if (importPath != null) 'ImportPath': importPath,
      if (importedFileChunkSize != null)
        'ImportedFileChunkSize': importedFileChunkSize,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (perUnitStorageThroughput != null)
        'PerUnitStorageThroughput': perUnitStorageThroughput,
      if (rootSquashConfiguration != null)
        'RootSquashConfiguration': rootSquashConfiguration,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The ONTAP configuration properties of the FSx for ONTAP file system that you
/// are creating.
class CreateFileSystemOntapConfiguration {
  /// Specifies the FSx for ONTAP file system deployment type to use in creating
  /// the file system.
  ///
  /// <ul>
  /// <li>
  /// <code>MULTI_AZ_1</code> - (Default) A high availability file system
  /// configured for Multi-AZ redundancy to tolerate temporary Availability Zone
  /// (AZ) unavailability.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_1</code> - A file system configured for Single-AZ
  /// redundancy.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_2</code> - A file system configured with multiple
  /// high-availability (HA) pairs for Single-AZ redundancy.
  /// </li>
  /// </ul>
  /// For information about the use cases for Multi-AZ and Single-AZ deployments,
  /// refer to <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-AZ.html">Choosing
  /// a file system deployment type</a>.
  final OntapDeploymentType deploymentType;
  final int? automaticBackupRetentionDays;
  final String? dailyAutomaticBackupStartTime;

  /// The SSD IOPS configuration for the FSx for ONTAP file system.
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// (Multi-AZ only) Specifies the IP address range in which the endpoints to
  /// access your file system will be created. By default in the Amazon FSx API,
  /// Amazon FSx selects an unused IP address range for you from the 198.19.*
  /// range. By default in the Amazon FSx console, Amazon FSx chooses the last 64
  /// IP addresses from the VPC’s primary CIDR range to use as the endpoint IP
  /// address range for the file system. You can have overlapping endpoint IP
  /// addresses for file systems deployed in the same VPC/route tables, as long as
  /// they don't overlap with any subnet.
  final String? endpointIpAddressRange;

  /// The ONTAP administrative password for the <code>fsxadmin</code> user with
  /// which you administer your file system using the NetApp ONTAP CLI and REST
  /// API.
  final String? fsxAdminPassword;

  /// Specifies how many high-availability (HA) pairs of file servers will power
  /// your file system. Scale-up file systems are powered by 1 HA pair. The
  /// default value is 1. FSx for ONTAP scale-out file systems are powered by up
  /// to 12 HA pairs. The value of this property affects the values of
  /// <code>StorageCapacity</code>, <code>Iops</code>, and
  /// <code>ThroughputCapacity</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/HA-pairs.html">High-availability
  /// (HA) pairs</a> in the FSx for ONTAP user guide.
  ///
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>HAPairs</code> is less than 1 or greater than 12.
  /// </li>
  /// <li>
  /// The value of <code>HAPairs</code> is greater than 1 and the value of
  /// <code>DeploymentType</code> is <code>SINGLE_AZ_1</code> or
  /// <code>MULTI_AZ_1</code>.
  /// </li>
  /// </ul>
  final int? hAPairs;

  /// Required when <code>DeploymentType</code> is set to <code>MULTI_AZ_1</code>.
  /// This specifies the subnet in which you want the preferred file server to be
  /// located.
  final String? preferredSubnetId;

  /// (Multi-AZ only) Specifies the route tables in which Amazon FSx creates the
  /// rules for routing traffic to the correct file server. You should specify all
  /// virtual private cloud (VPC) route tables associated with the subnets in
  /// which your clients are located. By default, Amazon FSx selects your VPC's
  /// default route table.
  /// <note>
  /// Amazon FSx manages these route tables for Multi-AZ file systems using
  /// tag-based authentication. These route tables are tagged with <code>Key:
  /// AmazonFSx; Value: ManagedByAmazonFSx</code>. When creating FSx for ONTAP
  /// Multi-AZ file systems using CloudFormation we recommend that you add the
  /// <code>Key: AmazonFSx; Value: ManagedByAmazonFSx</code> tag manually.
  /// </note>
  final List<String>? routeTableIds;

  /// Sets the throughput capacity for the file system that you're creating in
  /// megabytes per second (MBps). For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-throughput-capacity.html">Managing
  /// throughput capacity</a> in the FSx for ONTAP User Guide.
  ///
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>ThroughputCapacity</code> and
  /// <code>ThroughputCapacityPerHAPair</code> are not the same value.
  /// </li>
  /// <li>
  /// The value of <code>ThroughputCapacity</code> when divided by the value of
  /// <code>HAPairs</code> is outside of the valid range for
  /// <code>ThroughputCapacity</code>.
  /// </li>
  /// </ul>
  final int? throughputCapacity;

  /// Use to choose the throughput capacity per HA pair, rather than the total
  /// throughput for the file system.
  ///
  /// You can define either the <code>ThroughputCapacityPerHAPair</code> or the
  /// <code>ThroughputCapacity</code> when creating a file system, but not both.
  ///
  /// This field and <code>ThroughputCapacity</code> are the same for scale-up
  /// file systems powered by one HA pair.
  ///
  /// <ul>
  /// <li>
  /// For <code>SINGLE_AZ_1</code> and <code>MULTI_AZ_1</code> file systems, valid
  /// values are 128, 256, 512, 1024, 2048, or 4096 MBps.
  /// </li>
  /// <li>
  /// For <code>SINGLE_AZ_2</code> file systems, valid values are 3072 or 6144
  /// MBps.
  /// </li>
  /// </ul>
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>ThroughputCapacity</code> and
  /// <code>ThroughputCapacityPerHAPair</code> are not the same value for file
  /// systems with one HA pair.
  /// </li>
  /// <li>
  /// The value of deployment type is <code>SINGLE_AZ_2</code> and
  /// <code>ThroughputCapacity</code> / <code>ThroughputCapacityPerHAPair</code>
  /// is a valid HA pair (a value between 2 and 12).
  /// </li>
  /// <li>
  /// The value of <code>ThroughputCapacityPerHAPair</code> is not a valid value.
  /// </li>
  /// </ul>
  final int? throughputCapacityPerHAPair;
  final String? weeklyMaintenanceStartTime;

  CreateFileSystemOntapConfiguration({
    required this.deploymentType,
    this.automaticBackupRetentionDays,
    this.dailyAutomaticBackupStartTime,
    this.diskIopsConfiguration,
    this.endpointIpAddressRange,
    this.fsxAdminPassword,
    this.hAPairs,
    this.preferredSubnetId,
    this.routeTableIds,
    this.throughputCapacity,
    this.throughputCapacityPerHAPair,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final deploymentType = this.deploymentType;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final endpointIpAddressRange = this.endpointIpAddressRange;
    final fsxAdminPassword = this.fsxAdminPassword;
    final hAPairs = this.hAPairs;
    final preferredSubnetId = this.preferredSubnetId;
    final routeTableIds = this.routeTableIds;
    final throughputCapacity = this.throughputCapacity;
    final throughputCapacityPerHAPair = this.throughputCapacityPerHAPair;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      'DeploymentType': deploymentType.toValue(),
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (endpointIpAddressRange != null)
        'EndpointIpAddressRange': endpointIpAddressRange,
      if (fsxAdminPassword != null) 'FsxAdminPassword': fsxAdminPassword,
      if (hAPairs != null) 'HAPairs': hAPairs,
      if (preferredSubnetId != null) 'PreferredSubnetId': preferredSubnetId,
      if (routeTableIds != null) 'RouteTableIds': routeTableIds,
      if (throughputCapacity != null) 'ThroughputCapacity': throughputCapacity,
      if (throughputCapacityPerHAPair != null)
        'ThroughputCapacityPerHAPair': throughputCapacityPerHAPair,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The Amazon FSx for OpenZFS configuration properties for the file system that
/// you are creating.
class CreateFileSystemOpenZFSConfiguration {
  /// Specifies the file system deployment type. Single AZ deployment types are
  /// configured for redundancy within a single Availability Zone in an Amazon Web
  /// Services Region . Valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>MULTI_AZ_1</code>- Creates file systems with high availability that
  /// are configured for Multi-AZ redundancy to tolerate temporary unavailability
  /// in Availability Zones (AZs). <code>Multi_AZ_1</code> is available only in
  /// the US East (N. Virginia), US East (Ohio), US West (Oregon), Asia Pacific
  /// (Singapore), Asia Pacific (Tokyo), and Europe (Ireland) Amazon Web Services
  /// Regions.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_1</code>- Creates file systems with throughput capacities of
  /// 64 - 4,096 MB/s. <code>Single_AZ_1</code> is available in all Amazon Web
  /// Services Regions where Amazon FSx for OpenZFS is available.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_2</code>- Creates file systems with throughput capacities of
  /// 160 - 10,240 MB/s using an NVMe L2ARC cache. <code>Single_AZ_2</code> is
  /// available only in the US East (N. Virginia), US East (Ohio), US West
  /// (Oregon), Asia Pacific (Singapore), Asia Pacific (Tokyo), and Europe
  /// (Ireland) Amazon Web Services Regions.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/availability-durability.html#available-aws-regions">Deployment
  /// type availability</a> and <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#zfs-fs-performance">File
  /// system performance</a> in the <i>Amazon FSx for OpenZFS User Guide</i>.
  final OpenZFSDeploymentType deploymentType;

  /// Specifies the throughput of an Amazon FSx for OpenZFS file system, measured
  /// in megabytes per second (MBps). Valid values depend on the DeploymentType
  /// you choose, as follows:
  ///
  /// <ul>
  /// <li>
  /// For <code>MULTI_AZ_1</code> and <code>SINGLE_AZ_2</code>, valid values are
  /// 160, 320, 640, 1280, 2560, 3840, 5120, 7680, or 10240 MBps.
  /// </li>
  /// <li>
  /// For <code>SINGLE_AZ_1</code>, valid values are 64, 128, 256, 512, 1024,
  /// 2048, 3072, or 4096 MBps.
  /// </li>
  /// </ul>
  /// You pay for additional throughput capacity that you provision.
  final int throughputCapacity;
  final int? automaticBackupRetentionDays;

  /// A Boolean value indicating whether tags for the file system should be copied
  /// to backups. This value defaults to <code>false</code>. If it's set to
  /// <code>true</code>, all tags for the file system are copied to all automatic
  /// and user-initiated backups where the user doesn't specify tags. If this
  /// value is <code>true</code>, and you specify one or more tags, only the
  /// specified tags are copied to backups. If you specify one or more tags when
  /// creating a user-initiated backup, no tags are copied from the file system,
  /// regardless of this value.
  final bool? copyTagsToBackups;

  /// A Boolean value indicating whether tags for the file system should be copied
  /// to volumes. This value defaults to <code>false</code>. If it's set to
  /// <code>true</code>, all tags for the file system are copied to volumes where
  /// the user doesn't specify tags. If this value is <code>true</code>, and you
  /// specify one or more tags, only the specified tags are copied to volumes. If
  /// you specify one or more tags when creating the volume, no tags are copied
  /// from the file system, regardless of this value.
  final bool? copyTagsToVolumes;
  final String? dailyAutomaticBackupStartTime;
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// (Multi-AZ only) Specifies the IP address range in which the endpoints to
  /// access your file system will be created. By default in the Amazon FSx API
  /// and Amazon FSx console, Amazon FSx selects an available /28 IP address range
  /// for you from one of the VPC's CIDR ranges. You can have overlapping endpoint
  /// IP addresses for file systems deployed in the same VPC/route tables.
  final String? endpointIpAddressRange;

  /// Required when <code>DeploymentType</code> is set to <code>MULTI_AZ_1</code>.
  /// This specifies the subnet in which you want the preferred file server to be
  /// located.
  final String? preferredSubnetId;

  /// The configuration Amazon FSx uses when creating the root value of the Amazon
  /// FSx for OpenZFS file system. All volumes are children of the root volume.
  final OpenZFSCreateRootVolumeConfiguration? rootVolumeConfiguration;

  /// (Multi-AZ only) Specifies the route tables in which Amazon FSx creates the
  /// rules for routing traffic to the correct file server. You should specify all
  /// virtual private cloud (VPC) route tables associated with the subnets in
  /// which your clients are located. By default, Amazon FSx selects your VPC's
  /// default route table.
  final List<String>? routeTableIds;
  final String? weeklyMaintenanceStartTime;

  CreateFileSystemOpenZFSConfiguration({
    required this.deploymentType,
    required this.throughputCapacity,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.copyTagsToVolumes,
    this.dailyAutomaticBackupStartTime,
    this.diskIopsConfiguration,
    this.endpointIpAddressRange,
    this.preferredSubnetId,
    this.rootVolumeConfiguration,
    this.routeTableIds,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final deploymentType = this.deploymentType;
    final throughputCapacity = this.throughputCapacity;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final copyTagsToBackups = this.copyTagsToBackups;
    final copyTagsToVolumes = this.copyTagsToVolumes;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final endpointIpAddressRange = this.endpointIpAddressRange;
    final preferredSubnetId = this.preferredSubnetId;
    final rootVolumeConfiguration = this.rootVolumeConfiguration;
    final routeTableIds = this.routeTableIds;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      'DeploymentType': deploymentType.toValue(),
      'ThroughputCapacity': throughputCapacity,
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (copyTagsToVolumes != null) 'CopyTagsToVolumes': copyTagsToVolumes,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (endpointIpAddressRange != null)
        'EndpointIpAddressRange': endpointIpAddressRange,
      if (preferredSubnetId != null) 'PreferredSubnetId': preferredSubnetId,
      if (rootVolumeConfiguration != null)
        'RootVolumeConfiguration': rootVolumeConfiguration,
      if (routeTableIds != null) 'RouteTableIds': routeTableIds,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The response object returned after the file system is created.
class CreateFileSystemResponse {
  /// The configuration of the file system that was created.
  final FileSystem? fileSystem;

  CreateFileSystemResponse({
    this.fileSystem,
  });

  factory CreateFileSystemResponse.fromJson(Map<String, dynamic> json) {
    return CreateFileSystemResponse(
      fileSystem: json['FileSystem'] != null
          ? FileSystem.fromJson(json['FileSystem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystem = this.fileSystem;
    return {
      if (fileSystem != null) 'FileSystem': fileSystem,
    };
  }
}

/// The configuration object for the Microsoft Windows file system used in
/// <code>CreateFileSystem</code> and <code>CreateFileSystemFromBackup</code>
/// operations.
class CreateFileSystemWindowsConfiguration {
  /// Sets the throughput capacity of an Amazon FSx file system, measured in
  /// megabytes per second (MB/s), in 2 to the <i>n</i>th increments, between 2^3
  /// (8) and 2^11 (2048).
  final int throughputCapacity;

  /// The ID for an existing Amazon Web Services Managed Microsoft Active
  /// Directory (AD) instance that the file system should join when it's created.
  final String? activeDirectoryId;

  /// An array of one or more DNS alias names that you want to associate with the
  /// Amazon FSx file system. Aliases allow you to use existing DNS names to
  /// access the data in your Amazon FSx file system. You can associate up to 50
  /// aliases with a file system at any time. You can associate additional DNS
  /// aliases after you create the file system using the
  /// AssociateFileSystemAliases operation. You can remove DNS aliases from the
  /// file system after it is created using the DisassociateFileSystemAliases
  /// operation. You only need to specify the alias name in the request payload.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-dns-aliases.html">Working
  /// with DNS Aliases</a> and <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/walkthrough05-file-system-custom-CNAME.html">Walkthrough
  /// 5: Using DNS aliases to access your file system</a>, including additional
  /// steps you must take to be able to access your file system using a DNS alias.
  ///
  /// An alias name has to meet the following requirements:
  ///
  /// <ul>
  /// <li>
  /// Formatted as a fully-qualified domain name (FQDN),
  /// <code>hostname.domain</code>, for example,
  /// <code>accounting.example.com</code>.
  /// </li>
  /// <li>
  /// Can contain alphanumeric characters, the underscore (_), and the hyphen (-).
  /// </li>
  /// <li>
  /// Cannot start or end with a hyphen.
  /// </li>
  /// <li>
  /// Can start with a numeric.
  /// </li>
  /// </ul>
  /// For DNS alias names, Amazon FSx stores alphabetic characters as lowercase
  /// letters (a-z), regardless of how you specify them: as uppercase letters,
  /// lowercase letters, or the corresponding letters in escape codes.
  final List<String>? aliases;

  /// The configuration that Amazon FSx for Windows File Server uses to audit and
  /// log user accesses of files, folders, and file shares on the Amazon FSx for
  /// Windows File Server file system.
  final WindowsAuditLogCreateConfiguration? auditLogConfiguration;

  /// The number of days to retain automatic backups. Setting this property to
  /// <code>0</code> disables automatic backups. You can retain automatic backups
  /// for a maximum of 90 days. The default is <code>30</code>.
  final int? automaticBackupRetentionDays;

  /// A boolean flag indicating whether tags for the file system should be copied
  /// to backups. This value defaults to false. If it's set to true, all tags for
  /// the file system are copied to all automatic and user-initiated backups where
  /// the user doesn't specify tags. If this value is true, and you specify one or
  /// more tags, only the specified tags are copied to backups. If you specify one
  /// or more tags when creating a user-initiated backup, no tags are copied from
  /// the file system, regardless of this value.
  final bool? copyTagsToBackups;

  /// The preferred time to take daily automatic backups, formatted HH:MM in the
  /// UTC time zone.
  final String? dailyAutomaticBackupStartTime;

  /// Specifies the file system deployment type, valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>MULTI_AZ_1</code> - Deploys a high availability file system that is
  /// configured for Multi-AZ redundancy to tolerate temporary Availability Zone
  /// (AZ) unavailability. You can only deploy a Multi-AZ file system in Amazon
  /// Web Services Regions that have a minimum of three Availability Zones. Also
  /// supports HDD storage type
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_1</code> - (Default) Choose to deploy a file system that is
  /// configured for single AZ redundancy.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_2</code> - The latest generation Single AZ file system.
  /// Specifies a file system that is configured for single AZ redundancy and
  /// supports HDD storage type.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html">
  /// Availability and Durability: Single-AZ and Multi-AZ File Systems</a>.
  final WindowsDeploymentType? deploymentType;

  /// The SSD IOPS (input/output operations per second) configuration for an
  /// Amazon FSx for Windows file system. By default, Amazon FSx automatically
  /// provisions 3 IOPS per GiB of storage capacity. You can provision additional
  /// IOPS per GiB of storage, up to the maximum limit associated with your chosen
  /// throughput capacity.
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// Required when <code>DeploymentType</code> is set to <code>MULTI_AZ_1</code>.
  /// This specifies the subnet in which you want the preferred file server to be
  /// located. For in-Amazon Web Services applications, we recommend that you
  /// launch your clients in the same Availability Zone (AZ) as your preferred
  /// file server to reduce cross-AZ data transfer costs and minimize latency.
  final String? preferredSubnetId;
  final SelfManagedActiveDirectoryConfiguration?
      selfManagedActiveDirectoryConfiguration;

  /// The preferred start time to perform weekly maintenance, formatted d:HH:MM in
  /// the UTC time zone, where d is the weekday number, from 1 through 7,
  /// beginning with Monday and ending with Sunday.
  final String? weeklyMaintenanceStartTime;

  CreateFileSystemWindowsConfiguration({
    required this.throughputCapacity,
    this.activeDirectoryId,
    this.aliases,
    this.auditLogConfiguration,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.dailyAutomaticBackupStartTime,
    this.deploymentType,
    this.diskIopsConfiguration,
    this.preferredSubnetId,
    this.selfManagedActiveDirectoryConfiguration,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final throughputCapacity = this.throughputCapacity;
    final activeDirectoryId = this.activeDirectoryId;
    final aliases = this.aliases;
    final auditLogConfiguration = this.auditLogConfiguration;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final copyTagsToBackups = this.copyTagsToBackups;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final deploymentType = this.deploymentType;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final preferredSubnetId = this.preferredSubnetId;
    final selfManagedActiveDirectoryConfiguration =
        this.selfManagedActiveDirectoryConfiguration;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      'ThroughputCapacity': throughputCapacity,
      if (activeDirectoryId != null) 'ActiveDirectoryId': activeDirectoryId,
      if (aliases != null) 'Aliases': aliases,
      if (auditLogConfiguration != null)
        'AuditLogConfiguration': auditLogConfiguration,
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (preferredSubnetId != null) 'PreferredSubnetId': preferredSubnetId,
      if (selfManagedActiveDirectoryConfiguration != null)
        'SelfManagedActiveDirectoryConfiguration':
            selfManagedActiveDirectoryConfiguration,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// Specifies the configuration of the ONTAP volume that you are creating.
class CreateOntapVolumeConfiguration {
  /// Specifies the ONTAP SVM in which to create the volume.
  final String storageVirtualMachineId;

  /// Use to specify configuration options for a volume’s storage aggregate or
  /// aggregates.
  final CreateAggregateConfiguration? aggregateConfiguration;

  /// A boolean flag indicating whether tags for the volume should be copied to
  /// backups. This value defaults to false. If it's set to true, all tags for the
  /// volume are copied to all automatic and user-initiated backups where the user
  /// doesn't specify tags. If this value is true, and you specify one or more
  /// tags, only the specified tags are copied to backups. If you specify one or
  /// more tags when creating a user-initiated backup, no tags are copied from the
  /// volume, regardless of this value.
  final bool? copyTagsToBackups;

  /// Specifies the location in the SVM's namespace where the volume is mounted.
  /// This parameter is required. The <code>JunctionPath</code> must have a
  /// leading forward slash, such as <code>/vol3</code>.
  final String? junctionPath;

  /// Specifies the type of volume you are creating. Valid values are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>RW</code> specifies a read/write volume. <code>RW</code> is the
  /// default.
  /// </li>
  /// <li>
  /// <code>DP</code> specifies a data-protection volume. A <code>DP</code> volume
  /// is read-only and can be used as the destination of a NetApp SnapMirror
  /// relationship.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/volume-types">Volume
  /// types</a> in the Amazon FSx for NetApp ONTAP User Guide.
  final InputOntapVolumeType? ontapVolumeType;

  /// Specifies the security style for the volume. If a volume's security style is
  /// not specified, it is automatically set to the root volume's security style.
  /// The security style determines the type of permissions that FSx for ONTAP
  /// uses to control data access. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/volume-security-style">Volume
  /// security style</a> in the <i>Amazon FSx for NetApp ONTAP User Guide</i>.
  /// Specify one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>UNIX</code> if the file system is managed by a UNIX administrator, the
  /// majority of users are NFS clients, and an application accessing the data
  /// uses a UNIX user as the service account.
  /// </li>
  /// <li>
  /// <code>NTFS</code> if the file system is managed by a Windows administrator,
  /// the majority of users are SMB clients, and an application accessing the data
  /// uses a Windows user as the service account.
  /// </li>
  /// <li>
  /// <code>MIXED</code> This is an advanced setting. For more information, see
  /// the topic <a
  /// href="https://docs.netapp.com/us-en/ontap/nfs-admin/security-styles-their-effects-concept.html">What
  /// the security styles and their effects are</a> in the NetApp Documentation
  /// Center.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/volume-security-style.html">Volume
  /// security style</a> in the FSx for ONTAP User Guide.
  final SecurityStyle? securityStyle;

  /// Specifies the configured size of the volume, in bytes.
  final int? sizeInBytes;

  /// Use <code>SizeInBytes</code> instead. Specifies the size of the volume, in
  /// megabytes (MB), that you are creating.
  final int? sizeInMegabytes;

  /// Specifies the SnapLock configuration for an FSx for ONTAP volume.
  final CreateSnaplockConfiguration? snaplockConfiguration;

  /// Specifies the snapshot policy for the volume. There are three built-in
  /// snapshot policies:
  ///
  /// <ul>
  /// <li>
  /// <code>default</code>: This is the default policy. A maximum of six hourly
  /// snapshots taken five minutes past the hour. A maximum of two daily snapshots
  /// taken Monday through Saturday at 10 minutes after midnight. A maximum of two
  /// weekly snapshots taken every Sunday at 15 minutes after midnight.
  /// </li>
  /// <li>
  /// <code>default-1weekly</code>: This policy is the same as the
  /// <code>default</code> policy except that it only retains one snapshot from
  /// the weekly schedule.
  /// </li>
  /// <li>
  /// <code>none</code>: This policy does not take any snapshots. This policy can
  /// be assigned to volumes to prevent automatic snapshots from being taken.
  /// </li>
  /// </ul>
  /// You can also provide the name of a custom policy that you created with the
  /// ONTAP CLI or REST API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snapshots-ontap.html#snapshot-policies">Snapshot
  /// policies</a> in the Amazon FSx for NetApp ONTAP User Guide.
  final String? snapshotPolicy;

  /// Set to true to enable deduplication, compression, and compaction storage
  /// efficiency features on the volume, or set to false to disable them.
  ///
  /// <code>StorageEfficiencyEnabled</code> is required when creating a
  /// <code>RW</code> volume (<code>OntapVolumeType</code> set to
  /// <code>RW</code>).
  final bool? storageEfficiencyEnabled;
  final TieringPolicy? tieringPolicy;

  /// Use to specify the style of an ONTAP volume. FSx for ONTAP offers two styles
  /// of volumes that you can use for different purposes, FlexVol and FlexGroup
  /// volumes. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/volume-styles.html">Volume
  /// styles</a> in the Amazon FSx for NetApp ONTAP User Guide.
  final VolumeStyle? volumeStyle;

  CreateOntapVolumeConfiguration({
    required this.storageVirtualMachineId,
    this.aggregateConfiguration,
    this.copyTagsToBackups,
    this.junctionPath,
    this.ontapVolumeType,
    this.securityStyle,
    this.sizeInBytes,
    this.sizeInMegabytes,
    this.snaplockConfiguration,
    this.snapshotPolicy,
    this.storageEfficiencyEnabled,
    this.tieringPolicy,
    this.volumeStyle,
  });

  Map<String, dynamic> toJson() {
    final storageVirtualMachineId = this.storageVirtualMachineId;
    final aggregateConfiguration = this.aggregateConfiguration;
    final copyTagsToBackups = this.copyTagsToBackups;
    final junctionPath = this.junctionPath;
    final ontapVolumeType = this.ontapVolumeType;
    final securityStyle = this.securityStyle;
    final sizeInBytes = this.sizeInBytes;
    final sizeInMegabytes = this.sizeInMegabytes;
    final snaplockConfiguration = this.snaplockConfiguration;
    final snapshotPolicy = this.snapshotPolicy;
    final storageEfficiencyEnabled = this.storageEfficiencyEnabled;
    final tieringPolicy = this.tieringPolicy;
    final volumeStyle = this.volumeStyle;
    return {
      'StorageVirtualMachineId': storageVirtualMachineId,
      if (aggregateConfiguration != null)
        'AggregateConfiguration': aggregateConfiguration,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (junctionPath != null) 'JunctionPath': junctionPath,
      if (ontapVolumeType != null) 'OntapVolumeType': ontapVolumeType.toValue(),
      if (securityStyle != null) 'SecurityStyle': securityStyle.toValue(),
      if (sizeInBytes != null) 'SizeInBytes': sizeInBytes,
      if (sizeInMegabytes != null) 'SizeInMegabytes': sizeInMegabytes,
      if (snaplockConfiguration != null)
        'SnaplockConfiguration': snaplockConfiguration,
      if (snapshotPolicy != null) 'SnapshotPolicy': snapshotPolicy,
      if (storageEfficiencyEnabled != null)
        'StorageEfficiencyEnabled': storageEfficiencyEnabled,
      if (tieringPolicy != null) 'TieringPolicy': tieringPolicy,
      if (volumeStyle != null) 'VolumeStyle': volumeStyle.toValue(),
    };
  }
}

/// The snapshot configuration to use when creating an Amazon FSx for OpenZFS
/// volume from a snapshot.
class CreateOpenZFSOriginSnapshotConfiguration {
  /// Specifies the strategy used when copying data from the snapshot to the new
  /// volume.
  ///
  /// <ul>
  /// <li>
  /// <code>CLONE</code> - The new volume references the data in the origin
  /// snapshot. Cloning a snapshot is faster than copying data from the snapshot
  /// to a new volume and doesn't consume disk throughput. However, the origin
  /// snapshot can't be deleted if there is a volume using its copied data.
  /// </li>
  /// <li>
  /// <code>FULL_COPY</code> - Copies all data from the snapshot to the new
  /// volume.
  ///
  /// Specify this option to create the volume from a snapshot on another FSx for
  /// OpenZFS file system.
  /// </li>
  /// </ul> <note>
  /// The <code>INCREMENTAL_COPY</code> option is only for updating an existing
  /// volume by using a snapshot from another FSx for OpenZFS file system. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_CopySnapshotAndUpdateVolume.html">CopySnapshotAndUpdateVolume</a>.
  /// </note>
  final OpenZFSCopyStrategy copyStrategy;
  final String snapshotARN;

  CreateOpenZFSOriginSnapshotConfiguration({
    required this.copyStrategy,
    required this.snapshotARN,
  });

  Map<String, dynamic> toJson() {
    final copyStrategy = this.copyStrategy;
    final snapshotARN = this.snapshotARN;
    return {
      'CopyStrategy': copyStrategy.toValue(),
      'SnapshotARN': snapshotARN,
    };
  }
}

/// Specifies the configuration of the Amazon FSx for OpenZFS volume that you
/// are creating.
class CreateOpenZFSVolumeConfiguration {
  /// The ID of the volume to use as the parent volume of the volume that you are
  /// creating.
  final String parentVolumeId;

  /// A Boolean value indicating whether tags for the volume should be copied to
  /// snapshots. This value defaults to <code>false</code>. If it's set to
  /// <code>true</code>, all tags for the volume are copied to snapshots where the
  /// user doesn't specify tags. If this value is <code>true</code>, and you
  /// specify one or more tags, only the specified tags are copied to snapshots.
  /// If you specify one or more tags when creating the snapshot, no tags are
  /// copied from the volume, regardless of this value.
  final bool? copyTagsToSnapshots;

  /// Specifies the method used to compress the data on the volume. The
  /// compression type is <code>NONE</code> by default.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - Doesn't compress the data on the volume.
  /// <code>NONE</code> is the default.
  /// </li>
  /// <li>
  /// <code>ZSTD</code> - Compresses the data in the volume using the Zstandard
  /// (ZSTD) compression algorithm. ZSTD compression provides a higher level of
  /// data compression and higher read throughput performance than LZ4
  /// compression.
  /// </li>
  /// <li>
  /// <code>LZ4</code> - Compresses the data in the volume using the LZ4
  /// compression algorithm. LZ4 compression provides a lower level of compression
  /// and higher write throughput performance than ZSTD compression.
  /// </li>
  /// </ul>
  /// For more information about volume compression types and the performance of
  /// your Amazon FSx for OpenZFS file system, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#performance-tips-zfs">
  /// Tips for maximizing performance</a> File system and volume settings in the
  /// <i>Amazon FSx for OpenZFS User Guide</i>.
  final OpenZFSDataCompressionType? dataCompressionType;

  /// The configuration object for mounting a Network File System (NFS) file
  /// system.
  final List<OpenZFSNfsExport>? nfsExports;

  /// The configuration object that specifies the snapshot to use as the origin of
  /// the data for the volume.
  final CreateOpenZFSOriginSnapshotConfiguration? originSnapshot;

  /// A Boolean value indicating whether the volume is read-only.
  final bool? readOnly;

  /// Specifies the suggested block size for a volume in a ZFS dataset, in
  /// kibibytes (KiB). Valid values are 4, 8, 16, 32, 64, 128, 256, 512, or 1024
  /// KiB. The default is 128 KiB. We recommend using the default setting for the
  /// majority of use cases. Generally, workloads that write in fixed small or
  /// large record sizes may benefit from setting a custom record size, like
  /// database workloads (small record size) or media streaming workloads (large
  /// record size). For additional guidance on when to set a custom record size,
  /// see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#record-size-performance">
  /// ZFS Record size</a> in the <i>Amazon FSx for OpenZFS User Guide</i>.
  final int? recordSizeKiB;

  /// Sets the maximum storage size in gibibytes (GiB) for the volume. You can
  /// specify a quota that is larger than the storage on the parent volume. A
  /// volume quota limits the amount of storage that the volume can consume to the
  /// configured amount, but does not guarantee the space will be available on the
  /// parent volume. To guarantee quota space, you must also set
  /// <code>StorageCapacityReservationGiB</code>. To <i>not</i> specify a storage
  /// capacity quota, set this to <code>-1</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-volumes.html#volume-properties">Volume
  /// properties</a> in the <i>Amazon FSx for OpenZFS User Guide</i>.
  final int? storageCapacityQuotaGiB;

  /// Specifies the amount of storage in gibibytes (GiB) to reserve from the
  /// parent volume. Setting <code>StorageCapacityReservationGiB</code> guarantees
  /// that the specified amount of storage space on the parent volume will always
  /// be available for the volume. You can't reserve more storage than the parent
  /// volume has. To <i>not</i> specify a storage capacity reservation, set this
  /// to <code>0</code> or <code>-1</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-volumes.html#volume-properties">Volume
  /// properties</a> in the <i>Amazon FSx for OpenZFS User Guide</i>.
  final int? storageCapacityReservationGiB;

  /// Configures how much storage users and groups can use on the volume.
  final List<OpenZFSUserOrGroupQuota>? userAndGroupQuotas;

  CreateOpenZFSVolumeConfiguration({
    required this.parentVolumeId,
    this.copyTagsToSnapshots,
    this.dataCompressionType,
    this.nfsExports,
    this.originSnapshot,
    this.readOnly,
    this.recordSizeKiB,
    this.storageCapacityQuotaGiB,
    this.storageCapacityReservationGiB,
    this.userAndGroupQuotas,
  });

  Map<String, dynamic> toJson() {
    final parentVolumeId = this.parentVolumeId;
    final copyTagsToSnapshots = this.copyTagsToSnapshots;
    final dataCompressionType = this.dataCompressionType;
    final nfsExports = this.nfsExports;
    final originSnapshot = this.originSnapshot;
    final readOnly = this.readOnly;
    final recordSizeKiB = this.recordSizeKiB;
    final storageCapacityQuotaGiB = this.storageCapacityQuotaGiB;
    final storageCapacityReservationGiB = this.storageCapacityReservationGiB;
    final userAndGroupQuotas = this.userAndGroupQuotas;
    return {
      'ParentVolumeId': parentVolumeId,
      if (copyTagsToSnapshots != null)
        'CopyTagsToSnapshots': copyTagsToSnapshots,
      if (dataCompressionType != null)
        'DataCompressionType': dataCompressionType.toValue(),
      if (nfsExports != null) 'NfsExports': nfsExports,
      if (originSnapshot != null) 'OriginSnapshot': originSnapshot,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (recordSizeKiB != null) 'RecordSizeKiB': recordSizeKiB,
      if (storageCapacityQuotaGiB != null)
        'StorageCapacityQuotaGiB': storageCapacityQuotaGiB,
      if (storageCapacityReservationGiB != null)
        'StorageCapacityReservationGiB': storageCapacityReservationGiB,
      if (userAndGroupQuotas != null) 'UserAndGroupQuotas': userAndGroupQuotas,
    };
  }
}

/// Defines the SnapLock configuration when creating an FSx for ONTAP SnapLock
/// volume.
class CreateSnaplockConfiguration {
  /// Specifies the retention mode of an FSx for ONTAP SnapLock volume. After it
  /// is set, it can't be changed. You can choose one of the following retention
  /// modes:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLIANCE</code>: Files transitioned to write once, read many (WORM)
  /// on a Compliance volume can't be deleted until their retention periods
  /// expire. This retention mode is used to address government or
  /// industry-specific mandates or to protect against ransomware attacks. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-compliance.html">SnapLock
  /// Compliance</a>.
  /// </li>
  /// <li>
  /// <code>ENTERPRISE</code>: Files transitioned to WORM on an Enterprise volume
  /// can be deleted by authorized users before their retention periods expire
  /// using privileged delete. This retention mode is used to advance an
  /// organization's data integrity and internal compliance or to test retention
  /// settings before using SnapLock Compliance. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html">SnapLock
  /// Enterprise</a>.
  /// </li>
  /// </ul>
  final SnaplockType snaplockType;

  /// Enables or disables the audit log volume for an FSx for ONTAP SnapLock
  /// volume. The default value is <code>false</code>. If you set
  /// <code>AuditLogVolume</code> to <code>true</code>, the SnapLock volume is
  /// created as an audit log volume. The minimum retention period for an audit
  /// log volume is six months.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/how-snaplock-works.html#snaplock-audit-log-volume">
  /// SnapLock audit log volumes</a>.
  final bool? auditLogVolume;

  /// The configuration object for setting the autocommit period of files in an
  /// FSx for ONTAP SnapLock volume.
  final AutocommitPeriod? autocommitPeriod;

  /// Enables, disables, or permanently disables privileged delete on an FSx for
  /// ONTAP SnapLock Enterprise volume. Enabling privileged delete allows SnapLock
  /// administrators to delete WORM files even if they have active retention
  /// periods. <code>PERMANENTLY_DISABLED</code> is a terminal state. If
  /// privileged delete is permanently disabled on a SnapLock volume, you can't
  /// re-enable it. The default value is <code>DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html#privileged-delete">Privileged
  /// delete</a>.
  final PrivilegedDelete? privilegedDelete;

  /// Specifies the retention period of an FSx for ONTAP SnapLock volume.
  final SnaplockRetentionPeriod? retentionPeriod;

  /// Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume.
  /// Volume-append mode allows you to create WORM-appendable files and write data
  /// to them incrementally. The default value is <code>false</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-append">Volume-append
  /// mode</a>.
  final bool? volumeAppendModeEnabled;

  CreateSnaplockConfiguration({
    required this.snaplockType,
    this.auditLogVolume,
    this.autocommitPeriod,
    this.privilegedDelete,
    this.retentionPeriod,
    this.volumeAppendModeEnabled,
  });

  Map<String, dynamic> toJson() {
    final snaplockType = this.snaplockType;
    final auditLogVolume = this.auditLogVolume;
    final autocommitPeriod = this.autocommitPeriod;
    final privilegedDelete = this.privilegedDelete;
    final retentionPeriod = this.retentionPeriod;
    final volumeAppendModeEnabled = this.volumeAppendModeEnabled;
    return {
      'SnaplockType': snaplockType.toValue(),
      if (auditLogVolume != null) 'AuditLogVolume': auditLogVolume,
      if (autocommitPeriod != null) 'AutocommitPeriod': autocommitPeriod,
      if (privilegedDelete != null)
        'PrivilegedDelete': privilegedDelete.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (volumeAppendModeEnabled != null)
        'VolumeAppendModeEnabled': volumeAppendModeEnabled,
    };
  }
}

class CreateSnapshotResponse {
  /// A description of the snapshot.
  final Snapshot? snapshot;

  CreateSnapshotResponse({
    this.snapshot,
  });

  factory CreateSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return CreateSnapshotResponse(
      snapshot: json['Snapshot'] != null
          ? Snapshot.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class CreateStorageVirtualMachineResponse {
  /// Returned after a successful <code>CreateStorageVirtualMachine</code>
  /// operation; describes the SVM just created.
  final StorageVirtualMachine? storageVirtualMachine;

  CreateStorageVirtualMachineResponse({
    this.storageVirtualMachine,
  });

  factory CreateStorageVirtualMachineResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateStorageVirtualMachineResponse(
      storageVirtualMachine: json['StorageVirtualMachine'] != null
          ? StorageVirtualMachine.fromJson(
              json['StorageVirtualMachine'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageVirtualMachine = this.storageVirtualMachine;
    return {
      if (storageVirtualMachine != null)
        'StorageVirtualMachine': storageVirtualMachine,
    };
  }
}

/// The configuration that Amazon FSx uses to join the ONTAP storage virtual
/// machine (SVM) to your self-managed (including on-premises) Microsoft Active
/// Directory directory.
class CreateSvmActiveDirectoryConfiguration {
  /// The NetBIOS name of the Active Directory computer object that will be
  /// created for your SVM.
  final String netBiosName;
  final SelfManagedActiveDirectoryConfiguration?
      selfManagedActiveDirectoryConfiguration;

  CreateSvmActiveDirectoryConfiguration({
    required this.netBiosName,
    this.selfManagedActiveDirectoryConfiguration,
  });

  Map<String, dynamic> toJson() {
    final netBiosName = this.netBiosName;
    final selfManagedActiveDirectoryConfiguration =
        this.selfManagedActiveDirectoryConfiguration;
    return {
      'NetBiosName': netBiosName,
      if (selfManagedActiveDirectoryConfiguration != null)
        'SelfManagedActiveDirectoryConfiguration':
            selfManagedActiveDirectoryConfiguration,
    };
  }
}

class CreateVolumeFromBackupResponse {
  /// Returned after a successful <code>CreateVolumeFromBackup</code> API
  /// operation, describing the volume just created.
  final Volume? volume;

  CreateVolumeFromBackupResponse({
    this.volume,
  });

  factory CreateVolumeFromBackupResponse.fromJson(Map<String, dynamic> json) {
    return CreateVolumeFromBackupResponse(
      volume: json['Volume'] != null
          ? Volume.fromJson(json['Volume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final volume = this.volume;
    return {
      if (volume != null) 'Volume': volume,
    };
  }
}

class CreateVolumeResponse {
  /// Returned after a successful <code>CreateVolume</code> API operation,
  /// describing the volume just created.
  final Volume? volume;

  CreateVolumeResponse({
    this.volume,
  });

  factory CreateVolumeResponse.fromJson(Map<String, dynamic> json) {
    return CreateVolumeResponse(
      volume: json['Volume'] != null
          ? Volume.fromJson(json['Volume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final volume = this.volume;
    return {
      if (volume != null) 'Volume': volume,
    };
  }
}

enum DataCompressionType {
  none,
  lz4,
}

extension DataCompressionTypeValueExtension on DataCompressionType {
  String toValue() {
    switch (this) {
      case DataCompressionType.none:
        return 'NONE';
      case DataCompressionType.lz4:
        return 'LZ4';
    }
  }
}

extension DataCompressionTypeFromString on String {
  DataCompressionType toDataCompressionType() {
    switch (this) {
      case 'NONE':
        return DataCompressionType.none;
      case 'LZ4':
        return DataCompressionType.lz4;
    }
    throw Exception('$this is not known in enum DataCompressionType');
  }
}

/// The configuration of a data repository association that links an Amazon FSx
/// for Lustre file system to an Amazon S3 bucket or an Amazon File Cache
/// resource to an Amazon S3 bucket or an NFS file system. The data repository
/// association configuration object is returned in the response of the
/// following operations:
///
/// <ul>
/// <li>
/// <code>CreateDataRepositoryAssociation</code>
/// </li>
/// <li>
/// <code>UpdateDataRepositoryAssociation</code>
/// </li>
/// <li>
/// <code>DescribeDataRepositoryAssociations</code>
/// </li>
/// </ul>
/// Data repository associations are supported on Amazon File Cache resources
/// and all FSx for Lustre 2.12 and 2.15 file systems, excluding
/// <code>scratch_1</code> deployment type.
class DataRepositoryAssociation {
  /// The system-generated, unique ID of the data repository association.
  final String? associationId;

  /// A boolean flag indicating whether an import data repository task to import
  /// metadata should run after the data repository association is created. The
  /// task runs if this flag is set to <code>true</code>.
  /// <note>
  /// <code>BatchImportMetaDataOnCreate</code> is not supported for data
  /// repositories linked to an Amazon File Cache resource.
  /// </note>
  final bool? batchImportMetaDataOnCreate;
  final DateTime? creationTime;

  /// The path to the data repository that will be linked to the cache or file
  /// system.
  ///
  /// <ul>
  /// <li>
  /// For Amazon File Cache, the path can be an NFS data repository that will be
  /// linked to the cache. The path can be in one of two formats:
  ///
  /// <ul>
  /// <li>
  /// If you are not using the <code>DataRepositorySubdirectories</code>
  /// parameter, the path is to an NFS Export directory (or one of its
  /// subdirectories) in the format <code>nsf://nfs-domain-name/exportpath</code>.
  /// You can therefore link a single NFS Export to a single data repository
  /// association.
  /// </li>
  /// <li>
  /// If you are using the <code>DataRepositorySubdirectories</code> parameter,
  /// the path is the domain name of the NFS file system in the format
  /// <code>nfs://filer-domain-name</code>, which indicates the root of the
  /// subdirectories specified with the <code>DataRepositorySubdirectories</code>
  /// parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// For Amazon File Cache, the path can be an S3 bucket or prefix in the format
  /// <code>s3://myBucket/myPrefix/</code>.
  /// </li>
  /// <li>
  /// For Amazon FSx for Lustre, the path can be an S3 bucket or prefix in the
  /// format <code>s3://myBucket/myPrefix/</code>.
  /// </li>
  /// </ul>
  final String? dataRepositoryPath;

  /// For Amazon File Cache, a list of NFS Exports that will be linked with an NFS
  /// data repository association. All the subdirectories must be on a single NFS
  /// file system. The Export paths are in the format <code>/exportpath1</code>.
  /// To use this parameter, you must configure <code>DataRepositoryPath</code> as
  /// the domain name of the NFS file system. The NFS file system domain name in
  /// effect is the root of the subdirectories. Note that
  /// <code>DataRepositorySubdirectories</code> is not supported for S3 data
  /// repositories.
  final List<String>? dataRepositorySubdirectories;
  final DataRepositoryFailureDetails? failureDetails;

  /// The globally unique ID of the Amazon File Cache resource.
  final String? fileCacheId;

  /// A path on the Amazon File Cache that points to a high-level directory (such
  /// as <code>/ns1/</code>) or subdirectory (such as <code>/ns1/subdir/</code>)
  /// that will be mapped 1-1 with <code>DataRepositoryPath</code>. The leading
  /// forward slash in the path is required. Two data repository associations
  /// cannot have overlapping cache paths. For example, if a data repository is
  /// associated with cache path <code>/ns1/</code>, then you cannot link another
  /// data repository with cache path <code>/ns1/ns2</code>.
  ///
  /// This path specifies the directory in your cache where files will be exported
  /// from. This cache directory can be linked to only one data repository (S3 or
  /// NFS) and no other data repository can be linked to the directory.
  /// <note>
  /// The cache path can only be set to root (/) on an NFS DRA when
  /// <code>DataRepositorySubdirectories</code> is specified. If you specify root
  /// (/) as the cache path, you can create only one DRA on the cache.
  ///
  /// The cache path cannot be set to root (/) for an S3 DRA.
  /// </note>
  final String? fileCachePath;
  final String? fileSystemId;

  /// A path on the Amazon FSx for Lustre file system that points to a high-level
  /// directory (such as <code>/ns1/</code>) or subdirectory (such as
  /// <code>/ns1/subdir/</code>) that will be mapped 1-1 with
  /// <code>DataRepositoryPath</code>. The leading forward slash in the name is
  /// required. Two data repository associations cannot have overlapping file
  /// system paths. For example, if a data repository is associated with file
  /// system path <code>/ns1/</code>, then you cannot link another data repository
  /// with file system path <code>/ns1/ns2</code>.
  ///
  /// This path specifies where in your file system files will be exported from or
  /// imported to. This file system directory can be linked to only one Amazon S3
  /// bucket, and no other S3 bucket can be linked to the directory.
  /// <note>
  /// If you specify only a forward slash (<code>/</code>) as the file system
  /// path, you can link only one data repository to the file system. You can only
  /// specify "/" as the file system path for the first data repository associated
  /// with a file system.
  /// </note>
  final String? fileSystemPath;

  /// For files imported from a data repository, this value determines the stripe
  /// count and maximum amount of data per file (in MiB) stored on a single
  /// physical disk. The maximum number of disks that a single file can be striped
  /// across is limited by the total number of disks that make up the file system
  /// or cache.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  final int? importedFileChunkSize;

  /// Describes the state of a data repository association. The lifecycle can have
  /// the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The data repository association between the file
  /// system or cache and the data repository is being created. The data
  /// repository is unavailable.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The data repository association is available for
  /// use.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURED</code> - The data repository association is
  /// misconfigured. Until the configuration is corrected, automatic import and
  /// automatic export will not work (only for Amazon FSx for Lustre).
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The data repository association is undergoing a
  /// customer initiated update that might affect its availability.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The data repository association is undergoing a
  /// customer initiated deletion.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The data repository association is in a terminal state
  /// that cannot be recovered.
  /// </li>
  /// </ul>
  final DataRepositoryLifecycle? lifecycle;

  /// The configuration for an NFS data repository linked to an Amazon File Cache
  /// resource with a data repository association.
  final NFSDataRepositoryConfiguration? nfs;
  final String? resourceARN;

  /// The configuration for an Amazon S3 data repository linked to an Amazon FSx
  /// for Lustre file system with a data repository association.
  final S3DataRepositoryConfiguration? s3;
  final List<Tag>? tags;

  DataRepositoryAssociation({
    this.associationId,
    this.batchImportMetaDataOnCreate,
    this.creationTime,
    this.dataRepositoryPath,
    this.dataRepositorySubdirectories,
    this.failureDetails,
    this.fileCacheId,
    this.fileCachePath,
    this.fileSystemId,
    this.fileSystemPath,
    this.importedFileChunkSize,
    this.lifecycle,
    this.nfs,
    this.resourceARN,
    this.s3,
    this.tags,
  });

  factory DataRepositoryAssociation.fromJson(Map<String, dynamic> json) {
    return DataRepositoryAssociation(
      associationId: json['AssociationId'] as String?,
      batchImportMetaDataOnCreate: json['BatchImportMetaDataOnCreate'] as bool?,
      creationTime: timeStampFromJson(json['CreationTime']),
      dataRepositoryPath: json['DataRepositoryPath'] as String?,
      dataRepositorySubdirectories:
          (json['DataRepositorySubdirectories'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      failureDetails: json['FailureDetails'] != null
          ? DataRepositoryFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      fileCacheId: json['FileCacheId'] as String?,
      fileCachePath: json['FileCachePath'] as String?,
      fileSystemId: json['FileSystemId'] as String?,
      fileSystemPath: json['FileSystemPath'] as String?,
      importedFileChunkSize: json['ImportedFileChunkSize'] as int?,
      lifecycle: (json['Lifecycle'] as String?)?.toDataRepositoryLifecycle(),
      nfs: json['NFS'] != null
          ? NFSDataRepositoryConfiguration.fromJson(
              json['NFS'] as Map<String, dynamic>)
          : null,
      resourceARN: json['ResourceARN'] as String?,
      s3: json['S3'] != null
          ? S3DataRepositoryConfiguration.fromJson(
              json['S3'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final batchImportMetaDataOnCreate = this.batchImportMetaDataOnCreate;
    final creationTime = this.creationTime;
    final dataRepositoryPath = this.dataRepositoryPath;
    final dataRepositorySubdirectories = this.dataRepositorySubdirectories;
    final failureDetails = this.failureDetails;
    final fileCacheId = this.fileCacheId;
    final fileCachePath = this.fileCachePath;
    final fileSystemId = this.fileSystemId;
    final fileSystemPath = this.fileSystemPath;
    final importedFileChunkSize = this.importedFileChunkSize;
    final lifecycle = this.lifecycle;
    final nfs = this.nfs;
    final resourceARN = this.resourceARN;
    final s3 = this.s3;
    final tags = this.tags;
    return {
      if (associationId != null) 'AssociationId': associationId,
      if (batchImportMetaDataOnCreate != null)
        'BatchImportMetaDataOnCreate': batchImportMetaDataOnCreate,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataRepositoryPath != null) 'DataRepositoryPath': dataRepositoryPath,
      if (dataRepositorySubdirectories != null)
        'DataRepositorySubdirectories': dataRepositorySubdirectories,
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (fileCacheId != null) 'FileCacheId': fileCacheId,
      if (fileCachePath != null) 'FileCachePath': fileCachePath,
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (fileSystemPath != null) 'FileSystemPath': fileSystemPath,
      if (importedFileChunkSize != null)
        'ImportedFileChunkSize': importedFileChunkSize,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (nfs != null) 'NFS': nfs,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (s3 != null) 'S3': s3,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// The data repository configuration object for Lustre file systems returned in
/// the response of the <code>CreateFileSystem</code> operation.
///
/// This data type is not supported on file systems with a data repository
/// association. For file systems with a data repository association, see .
class DataRepositoryConfiguration {
  /// Describes the file system's linked S3 data repository's
  /// <code>AutoImportPolicy</code>. The AutoImportPolicy configures how Amazon
  /// FSx keeps your file and directory listings up to date as you add or modify
  /// objects in your linked S3 bucket. <code>AutoImportPolicy</code> can have the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - (Default) AutoImport is off. Amazon FSx only updates
  /// file and directory listings from the linked S3 bucket when the file system
  /// is created. FSx does not update file and directory listings for any new or
  /// changed objects after choosing this option.
  /// </li>
  /// <li>
  /// <code>NEW</code> - AutoImport is on. Amazon FSx automatically imports
  /// directory listings of any new objects added to the linked S3 bucket that do
  /// not currently exist in the FSx file system.
  /// </li>
  /// <li>
  /// <code>NEW_CHANGED</code> - AutoImport is on. Amazon FSx automatically
  /// imports file and directory listings of any new objects added to the S3
  /// bucket and any existing objects that are changed in the S3 bucket after you
  /// choose this option.
  /// </li>
  /// <li>
  /// <code>NEW_CHANGED_DELETED</code> - AutoImport is on. Amazon FSx
  /// automatically imports file and directory listings of any new objects added
  /// to the S3 bucket, any existing objects that are changed in the S3 bucket,
  /// and any objects that were deleted in the S3 bucket.
  /// </li>
  /// </ul>
  final AutoImportPolicyType? autoImportPolicy;

  /// The export path to the Amazon S3 bucket (and prefix) that you are using to
  /// store new and changed Lustre file system files in S3.
  final String? exportPath;
  final DataRepositoryFailureDetails? failureDetails;

  /// The import path to the Amazon S3 bucket (and optional prefix) that you're
  /// using as the data repository for your FSx for Lustre file system, for
  /// example <code>s3://import-bucket/optional-prefix</code>. If a prefix is
  /// specified after the Amazon S3 bucket name, only object keys with that prefix
  /// are loaded into the file system.
  final String? importPath;

  /// For files imported from a data repository, this value determines the stripe
  /// count and maximum amount of data per file (in MiB) stored on a single
  /// physical disk. The maximum number of disks that a single file can be striped
  /// across is limited by the total number of disks that make up the file system.
  ///
  /// The default chunk size is 1,024 MiB (1 GiB) and can go as high as 512,000
  /// MiB (500 GiB). Amazon S3 objects have a maximum size of 5 TB.
  final int? importedFileChunkSize;

  /// Describes the state of the file system's S3 durable data repository, if it
  /// is configured with an S3 repository. The lifecycle can have the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The data repository configuration between the FSx
  /// file system and the linked S3 data repository is being created. The data
  /// repository is unavailable.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The data repository is available for use.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURED</code> - Amazon FSx cannot automatically import updates
  /// from the S3 bucket until the data repository configuration is corrected. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/troubleshooting.html#troubleshooting-misconfigured-data-repository">Troubleshooting
  /// a Misconfigured linked S3 bucket</a>.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The data repository is undergoing a customer
  /// initiated update and availability may be impacted.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The data repository is in a terminal state that cannot
  /// be recovered.
  /// </li>
  /// </ul>
  final DataRepositoryLifecycle? lifecycle;

  DataRepositoryConfiguration({
    this.autoImportPolicy,
    this.exportPath,
    this.failureDetails,
    this.importPath,
    this.importedFileChunkSize,
    this.lifecycle,
  });

  factory DataRepositoryConfiguration.fromJson(Map<String, dynamic> json) {
    return DataRepositoryConfiguration(
      autoImportPolicy:
          (json['AutoImportPolicy'] as String?)?.toAutoImportPolicyType(),
      exportPath: json['ExportPath'] as String?,
      failureDetails: json['FailureDetails'] != null
          ? DataRepositoryFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      importPath: json['ImportPath'] as String?,
      importedFileChunkSize: json['ImportedFileChunkSize'] as int?,
      lifecycle: (json['Lifecycle'] as String?)?.toDataRepositoryLifecycle(),
    );
  }

  Map<String, dynamic> toJson() {
    final autoImportPolicy = this.autoImportPolicy;
    final exportPath = this.exportPath;
    final failureDetails = this.failureDetails;
    final importPath = this.importPath;
    final importedFileChunkSize = this.importedFileChunkSize;
    final lifecycle = this.lifecycle;
    return {
      if (autoImportPolicy != null)
        'AutoImportPolicy': autoImportPolicy.toValue(),
      if (exportPath != null) 'ExportPath': exportPath,
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (importPath != null) 'ImportPath': importPath,
      if (importedFileChunkSize != null)
        'ImportedFileChunkSize': importedFileChunkSize,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
    };
  }
}

/// Provides detailed information about the data repository if its
/// <code>Lifecycle</code> is set to <code>MISCONFIGURED</code> or
/// <code>FAILED</code>.
class DataRepositoryFailureDetails {
  final String? message;

  DataRepositoryFailureDetails({
    this.message,
  });

  factory DataRepositoryFailureDetails.fromJson(Map<String, dynamic> json) {
    return DataRepositoryFailureDetails(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

enum DataRepositoryLifecycle {
  creating,
  available,
  misconfigured,
  updating,
  deleting,
  failed,
}

extension DataRepositoryLifecycleValueExtension on DataRepositoryLifecycle {
  String toValue() {
    switch (this) {
      case DataRepositoryLifecycle.creating:
        return 'CREATING';
      case DataRepositoryLifecycle.available:
        return 'AVAILABLE';
      case DataRepositoryLifecycle.misconfigured:
        return 'MISCONFIGURED';
      case DataRepositoryLifecycle.updating:
        return 'UPDATING';
      case DataRepositoryLifecycle.deleting:
        return 'DELETING';
      case DataRepositoryLifecycle.failed:
        return 'FAILED';
    }
  }
}

extension DataRepositoryLifecycleFromString on String {
  DataRepositoryLifecycle toDataRepositoryLifecycle() {
    switch (this) {
      case 'CREATING':
        return DataRepositoryLifecycle.creating;
      case 'AVAILABLE':
        return DataRepositoryLifecycle.available;
      case 'MISCONFIGURED':
        return DataRepositoryLifecycle.misconfigured;
      case 'UPDATING':
        return DataRepositoryLifecycle.updating;
      case 'DELETING':
        return DataRepositoryLifecycle.deleting;
      case 'FAILED':
        return DataRepositoryLifecycle.failed;
    }
    throw Exception('$this is not known in enum DataRepositoryLifecycle');
  }
}

/// A description of the data repository task.
///
/// <ul>
/// <li>
/// You use import and export data repository tasks to perform bulk transfer
/// operations between an Amazon FSx for Lustre file system and a linked data
/// repository.
/// </li>
/// <li>
/// You use release data repository tasks to release files that have been
/// exported to a linked S3 bucket from your Amazon FSx for Lustre file system.
/// </li>
/// <li>
/// An Amazon File Cache resource uses a task to automatically release files
/// from the cache.
/// </li>
/// </ul>
/// To learn more about data repository tasks, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-repository-tasks.html">Data
/// Repository Tasks</a>.
class DataRepositoryTask {
  final DateTime creationTime;

  /// The lifecycle status of the data repository task, as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - The task has not started.
  /// </li>
  /// <li>
  /// <code>EXECUTING</code> - The task is in process.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The task was not able to be completed. For example,
  /// there may be files the task failed to process. The
  /// <a>DataRepositoryTaskFailureDetails</a> property provides more information
  /// about task failures.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code> - The task has completed successfully.
  /// </li>
  /// <li>
  /// <code>CANCELED</code> - The task was canceled and it did not complete.
  /// </li>
  /// <li>
  /// <code>CANCELING</code> - The task is in process of being canceled.
  /// </li>
  /// </ul> <note>
  /// You cannot delete an FSx for Lustre file system if there are data repository
  /// tasks for the file system in the <code>PENDING</code> or
  /// <code>EXECUTING</code> states. Please retry when the data repository task is
  /// finished (with a status of <code>CANCELED</code>, <code>SUCCEEDED</code>, or
  /// <code>FAILED</code>). You can use the DescribeDataRepositoryTask action to
  /// monitor the task status. Contact the FSx team if you need to delete your
  /// file system immediately.
  /// </note>
  final DataRepositoryTaskLifecycle lifecycle;

  /// The system-generated, unique 17-digit ID of the data repository task.
  final String taskId;

  /// The type of data repository task.
  ///
  /// <ul>
  /// <li>
  /// <code>EXPORT_TO_REPOSITORY</code> tasks export from your Amazon FSx for
  /// Lustre file system to a linked data repository.
  /// </li>
  /// <li>
  /// <code>IMPORT_METADATA_FROM_REPOSITORY</code> tasks import metadata changes
  /// from a linked S3 bucket to your Amazon FSx for Lustre file system.
  /// </li>
  /// <li>
  /// <code>RELEASE_DATA_FROM_FILESYSTEM</code> tasks release files in your Amazon
  /// FSx for Lustre file system that have been exported to a linked S3 bucket and
  /// that meet your specified release criteria.
  /// </li>
  /// <li>
  /// <code>AUTO_RELEASE_DATA</code> tasks automatically release files from an
  /// Amazon File Cache resource.
  /// </li>
  /// </ul>
  final DataRepositoryTaskType type;

  /// Specifies the amount of data to release, in GiB, by an Amazon File Cache
  /// AUTO_RELEASE_DATA task that automatically releases files from the cache.
  final int? capacityToRelease;

  /// The time the system completed processing the task, populated after the task
  /// is complete.
  final DateTime? endTime;

  /// Failure message describing why the task failed, it is populated only when
  /// <code>Lifecycle</code> is set to <code>FAILED</code>.
  final DataRepositoryTaskFailureDetails? failureDetails;

  /// The system-generated, unique ID of the cache.
  final String? fileCacheId;

  /// The globally unique ID of the file system.
  final String? fileSystemId;

  /// An array of paths that specify the data for the data repository task to
  /// process. For example, in an EXPORT_TO_REPOSITORY task, the paths specify
  /// which data to export to the linked data repository.
  ///
  /// (Default) If <code>Paths</code> is not specified, Amazon FSx uses the file
  /// system root directory.
  final List<String>? paths;

  /// The configuration that specifies the last accessed time criteria for files
  /// that will be released from an Amazon FSx for Lustre file system.
  final ReleaseConfiguration? releaseConfiguration;
  final CompletionReport? report;
  final String? resourceARN;

  /// The time the system began processing the task.
  final DateTime? startTime;

  /// Provides the status of the number of files that the task has processed
  /// successfully and failed to process.
  final DataRepositoryTaskStatus? status;
  final List<Tag>? tags;

  DataRepositoryTask({
    required this.creationTime,
    required this.lifecycle,
    required this.taskId,
    required this.type,
    this.capacityToRelease,
    this.endTime,
    this.failureDetails,
    this.fileCacheId,
    this.fileSystemId,
    this.paths,
    this.releaseConfiguration,
    this.report,
    this.resourceARN,
    this.startTime,
    this.status,
    this.tags,
  });

  factory DataRepositoryTask.fromJson(Map<String, dynamic> json) {
    return DataRepositoryTask(
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      lifecycle: (json['Lifecycle'] as String).toDataRepositoryTaskLifecycle(),
      taskId: json['TaskId'] as String,
      type: (json['Type'] as String).toDataRepositoryTaskType(),
      capacityToRelease: json['CapacityToRelease'] as int?,
      endTime: timeStampFromJson(json['EndTime']),
      failureDetails: json['FailureDetails'] != null
          ? DataRepositoryTaskFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      fileCacheId: json['FileCacheId'] as String?,
      fileSystemId: json['FileSystemId'] as String?,
      paths: (json['Paths'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      releaseConfiguration: json['ReleaseConfiguration'] != null
          ? ReleaseConfiguration.fromJson(
              json['ReleaseConfiguration'] as Map<String, dynamic>)
          : null,
      report: json['Report'] != null
          ? CompletionReport.fromJson(json['Report'] as Map<String, dynamic>)
          : null,
      resourceARN: json['ResourceARN'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: json['Status'] != null
          ? DataRepositoryTaskStatus.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lifecycle = this.lifecycle;
    final taskId = this.taskId;
    final type = this.type;
    final capacityToRelease = this.capacityToRelease;
    final endTime = this.endTime;
    final failureDetails = this.failureDetails;
    final fileCacheId = this.fileCacheId;
    final fileSystemId = this.fileSystemId;
    final paths = this.paths;
    final releaseConfiguration = this.releaseConfiguration;
    final report = this.report;
    final resourceARN = this.resourceARN;
    final startTime = this.startTime;
    final status = this.status;
    final tags = this.tags;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'Lifecycle': lifecycle.toValue(),
      'TaskId': taskId,
      'Type': type.toValue(),
      if (capacityToRelease != null) 'CapacityToRelease': capacityToRelease,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (fileCacheId != null) 'FileCacheId': fileCacheId,
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (paths != null) 'Paths': paths,
      if (releaseConfiguration != null)
        'ReleaseConfiguration': releaseConfiguration,
      if (report != null) 'Report': report,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Provides information about why a data repository task failed. Only populated
/// when the task <code>Lifecycle</code> is set to <code>FAILED</code>.
class DataRepositoryTaskFailureDetails {
  final String? message;

  DataRepositoryTaskFailureDetails({
    this.message,
  });

  factory DataRepositoryTaskFailureDetails.fromJson(Map<String, dynamic> json) {
    return DataRepositoryTaskFailureDetails(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// (Optional) An array of filter objects you can use to filter the response of
/// data repository tasks you will see in the the response. You can filter the
/// tasks returned in the response by one or more file system IDs, task
/// lifecycles, and by task type. A filter object consists of a filter
/// <code>Name</code>, and one or more <code>Values</code> for the filter.
class DataRepositoryTaskFilter {
  /// Name of the task property to use in filtering the tasks returned in the
  /// response.
  ///
  /// <ul>
  /// <li>
  /// Use <code>file-system-id</code> to retrieve data repository tasks for
  /// specific file systems.
  /// </li>
  /// <li>
  /// Use <code>task-lifecycle</code> to retrieve data repository tasks with one
  /// or more specific lifecycle states, as follows: CANCELED, EXECUTING, FAILED,
  /// PENDING, and SUCCEEDED.
  /// </li>
  /// </ul>
  final DataRepositoryTaskFilterName? name;

  /// Use Values to include the specific file system IDs and task lifecycle states
  /// for the filters you are using.
  final List<String>? values;

  DataRepositoryTaskFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

enum DataRepositoryTaskFilterName {
  fileSystemId,
  taskLifecycle,
  dataRepositoryAssociationId,
  fileCacheId,
}

extension DataRepositoryTaskFilterNameValueExtension
    on DataRepositoryTaskFilterName {
  String toValue() {
    switch (this) {
      case DataRepositoryTaskFilterName.fileSystemId:
        return 'file-system-id';
      case DataRepositoryTaskFilterName.taskLifecycle:
        return 'task-lifecycle';
      case DataRepositoryTaskFilterName.dataRepositoryAssociationId:
        return 'data-repository-association-id';
      case DataRepositoryTaskFilterName.fileCacheId:
        return 'file-cache-id';
    }
  }
}

extension DataRepositoryTaskFilterNameFromString on String {
  DataRepositoryTaskFilterName toDataRepositoryTaskFilterName() {
    switch (this) {
      case 'file-system-id':
        return DataRepositoryTaskFilterName.fileSystemId;
      case 'task-lifecycle':
        return DataRepositoryTaskFilterName.taskLifecycle;
      case 'data-repository-association-id':
        return DataRepositoryTaskFilterName.dataRepositoryAssociationId;
      case 'file-cache-id':
        return DataRepositoryTaskFilterName.fileCacheId;
    }
    throw Exception('$this is not known in enum DataRepositoryTaskFilterName');
  }
}

enum DataRepositoryTaskLifecycle {
  pending,
  executing,
  failed,
  succeeded,
  canceled,
  canceling,
}

extension DataRepositoryTaskLifecycleValueExtension
    on DataRepositoryTaskLifecycle {
  String toValue() {
    switch (this) {
      case DataRepositoryTaskLifecycle.pending:
        return 'PENDING';
      case DataRepositoryTaskLifecycle.executing:
        return 'EXECUTING';
      case DataRepositoryTaskLifecycle.failed:
        return 'FAILED';
      case DataRepositoryTaskLifecycle.succeeded:
        return 'SUCCEEDED';
      case DataRepositoryTaskLifecycle.canceled:
        return 'CANCELED';
      case DataRepositoryTaskLifecycle.canceling:
        return 'CANCELING';
    }
  }
}

extension DataRepositoryTaskLifecycleFromString on String {
  DataRepositoryTaskLifecycle toDataRepositoryTaskLifecycle() {
    switch (this) {
      case 'PENDING':
        return DataRepositoryTaskLifecycle.pending;
      case 'EXECUTING':
        return DataRepositoryTaskLifecycle.executing;
      case 'FAILED':
        return DataRepositoryTaskLifecycle.failed;
      case 'SUCCEEDED':
        return DataRepositoryTaskLifecycle.succeeded;
      case 'CANCELED':
        return DataRepositoryTaskLifecycle.canceled;
      case 'CANCELING':
        return DataRepositoryTaskLifecycle.canceling;
    }
    throw Exception('$this is not known in enum DataRepositoryTaskLifecycle');
  }
}

/// Provides the task status showing a running total of the total number of
/// files to be processed, the number successfully processed, and the number of
/// files the task failed to process.
class DataRepositoryTaskStatus {
  /// A running total of the number of files that the task failed to process.
  final int? failedCount;

  /// The time at which the task status was last updated.
  final DateTime? lastUpdatedTime;

  /// The total amount of data, in GiB, released by an Amazon File Cache
  /// AUTO_RELEASE_DATA task that automatically releases files from the cache.
  final int? releasedCapacity;

  /// A running total of the number of files that the task has successfully
  /// processed.
  final int? succeededCount;

  /// The total number of files that the task will process. While a task is
  /// executing, the sum of <code>SucceededCount</code> plus
  /// <code>FailedCount</code> may not equal <code>TotalCount</code>. When the
  /// task is complete, <code>TotalCount</code> equals the sum of
  /// <code>SucceededCount</code> plus <code>FailedCount</code>.
  final int? totalCount;

  DataRepositoryTaskStatus({
    this.failedCount,
    this.lastUpdatedTime,
    this.releasedCapacity,
    this.succeededCount,
    this.totalCount,
  });

  factory DataRepositoryTaskStatus.fromJson(Map<String, dynamic> json) {
    return DataRepositoryTaskStatus(
      failedCount: json['FailedCount'] as int?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      releasedCapacity: json['ReleasedCapacity'] as int?,
      succeededCount: json['SucceededCount'] as int?,
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedCount = this.failedCount;
    final lastUpdatedTime = this.lastUpdatedTime;
    final releasedCapacity = this.releasedCapacity;
    final succeededCount = this.succeededCount;
    final totalCount = this.totalCount;
    return {
      if (failedCount != null) 'FailedCount': failedCount,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (releasedCapacity != null) 'ReleasedCapacity': releasedCapacity,
      if (succeededCount != null) 'SucceededCount': succeededCount,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

enum DataRepositoryTaskType {
  exportToRepository,
  importMetadataFromRepository,
  releaseDataFromFilesystem,
  autoReleaseData,
}

extension DataRepositoryTaskTypeValueExtension on DataRepositoryTaskType {
  String toValue() {
    switch (this) {
      case DataRepositoryTaskType.exportToRepository:
        return 'EXPORT_TO_REPOSITORY';
      case DataRepositoryTaskType.importMetadataFromRepository:
        return 'IMPORT_METADATA_FROM_REPOSITORY';
      case DataRepositoryTaskType.releaseDataFromFilesystem:
        return 'RELEASE_DATA_FROM_FILESYSTEM';
      case DataRepositoryTaskType.autoReleaseData:
        return 'AUTO_RELEASE_DATA';
    }
  }
}

extension DataRepositoryTaskTypeFromString on String {
  DataRepositoryTaskType toDataRepositoryTaskType() {
    switch (this) {
      case 'EXPORT_TO_REPOSITORY':
        return DataRepositoryTaskType.exportToRepository;
      case 'IMPORT_METADATA_FROM_REPOSITORY':
        return DataRepositoryTaskType.importMetadataFromRepository;
      case 'RELEASE_DATA_FROM_FILESYSTEM':
        return DataRepositoryTaskType.releaseDataFromFilesystem;
      case 'AUTO_RELEASE_DATA':
        return DataRepositoryTaskType.autoReleaseData;
    }
    throw Exception('$this is not known in enum DataRepositoryTaskType');
  }
}

/// The response object for the <code>DeleteBackup</code> operation.
class DeleteBackupResponse {
  /// The ID of the backup that was deleted.
  final String? backupId;

  /// The lifecycle status of the backup. If the <code>DeleteBackup</code>
  /// operation is successful, the status is <code>DELETED</code>.
  final BackupLifecycle? lifecycle;

  DeleteBackupResponse({
    this.backupId,
    this.lifecycle,
  });

  factory DeleteBackupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBackupResponse(
      backupId: json['BackupId'] as String?,
      lifecycle: (json['Lifecycle'] as String?)?.toBackupLifecycle(),
    );
  }

  Map<String, dynamic> toJson() {
    final backupId = this.backupId;
    final lifecycle = this.lifecycle;
    return {
      if (backupId != null) 'BackupId': backupId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
    };
  }
}

class DeleteDataRepositoryAssociationResponse {
  /// The ID of the data repository association being deleted.
  final String? associationId;

  /// Indicates whether data in the file system that corresponds to the data
  /// repository association is being deleted. Default is <code>false</code>.
  final bool? deleteDataInFileSystem;

  /// Describes the lifecycle state of the data repository association being
  /// deleted.
  final DataRepositoryLifecycle? lifecycle;

  DeleteDataRepositoryAssociationResponse({
    this.associationId,
    this.deleteDataInFileSystem,
    this.lifecycle,
  });

  factory DeleteDataRepositoryAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteDataRepositoryAssociationResponse(
      associationId: json['AssociationId'] as String?,
      deleteDataInFileSystem: json['DeleteDataInFileSystem'] as bool?,
      lifecycle: (json['Lifecycle'] as String?)?.toDataRepositoryLifecycle(),
    );
  }

  Map<String, dynamic> toJson() {
    final associationId = this.associationId;
    final deleteDataInFileSystem = this.deleteDataInFileSystem;
    final lifecycle = this.lifecycle;
    return {
      if (associationId != null) 'AssociationId': associationId,
      if (deleteDataInFileSystem != null)
        'DeleteDataInFileSystem': deleteDataInFileSystem,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
    };
  }
}

class DeleteFileCacheResponse {
  /// The ID of the cache that's being deleted.
  final String? fileCacheId;

  /// The cache lifecycle for the deletion request. If the
  /// <code>DeleteFileCache</code> operation is successful, this status is
  /// <code>DELETING</code>.
  final FileCacheLifecycle? lifecycle;

  DeleteFileCacheResponse({
    this.fileCacheId,
    this.lifecycle,
  });

  factory DeleteFileCacheResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFileCacheResponse(
      fileCacheId: json['FileCacheId'] as String?,
      lifecycle: (json['Lifecycle'] as String?)?.toFileCacheLifecycle(),
    );
  }

  Map<String, dynamic> toJson() {
    final fileCacheId = this.fileCacheId;
    final lifecycle = this.lifecycle;
    return {
      if (fileCacheId != null) 'FileCacheId': fileCacheId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
    };
  }
}

/// The configuration object for the Amazon FSx for Lustre file system being
/// deleted in the <code>DeleteFileSystem</code> operation.
class DeleteFileSystemLustreConfiguration {
  /// Use if <code>SkipFinalBackup</code> is set to <code>false</code>, and you
  /// want to apply an array of tags to the final backup. If you have set the file
  /// system property <code>CopyTagsToBackups</code> to true, and you specify one
  /// or more <code>FinalBackupTags</code> when deleting a file system, Amazon FSx
  /// will not copy any existing file system tags to the backup.
  final List<Tag>? finalBackupTags;

  /// Set <code>SkipFinalBackup</code> to false if you want to take a final backup
  /// of the file system you are deleting. By default, Amazon FSx will not take a
  /// final backup on your behalf when the <code>DeleteFileSystem</code> operation
  /// is invoked. (Default = true)
  /// <note>
  /// The <code>fsx:CreateBackup</code> permission is required if you set
  /// <code>SkipFinalBackup</code> to <code>false</code> in order to delete the
  /// file system and take a final backup.
  /// </note>
  final bool? skipFinalBackup;

  DeleteFileSystemLustreConfiguration({
    this.finalBackupTags,
    this.skipFinalBackup,
  });

  Map<String, dynamic> toJson() {
    final finalBackupTags = this.finalBackupTags;
    final skipFinalBackup = this.skipFinalBackup;
    return {
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
      if (skipFinalBackup != null) 'SkipFinalBackup': skipFinalBackup,
    };
  }
}

/// The response object for the Amazon FSx for Lustre file system being deleted
/// in the <code>DeleteFileSystem</code> operation.
class DeleteFileSystemLustreResponse {
  /// The ID of the final backup for this file system.
  final String? finalBackupId;

  /// The set of tags applied to the final backup.
  final List<Tag>? finalBackupTags;

  DeleteFileSystemLustreResponse({
    this.finalBackupId,
    this.finalBackupTags,
  });

  factory DeleteFileSystemLustreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFileSystemLustreResponse(
      finalBackupId: json['FinalBackupId'] as String?,
      finalBackupTags: (json['FinalBackupTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final finalBackupId = this.finalBackupId;
    final finalBackupTags = this.finalBackupTags;
    return {
      if (finalBackupId != null) 'FinalBackupId': finalBackupId,
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
    };
  }
}

/// The configuration object for the Amazon FSx for OpenZFS file system used in
/// the <code>DeleteFileSystem</code> operation.
class DeleteFileSystemOpenZFSConfiguration {
  /// A list of tags to apply to the file system's final backup.
  final List<Tag>? finalBackupTags;

  /// To delete a file system if there are child volumes present below the root
  /// volume, use the string <code>DELETE_CHILD_VOLUMES_AND_SNAPSHOTS</code>. If
  /// your file system has child volumes and you don't use this option, the delete
  /// request will fail.
  final List<DeleteFileSystemOpenZFSOption>? options;

  /// By default, Amazon FSx for OpenZFS takes a final backup on your behalf when
  /// the <code>DeleteFileSystem</code> operation is invoked. Doing this helps
  /// protect you from data loss, and we highly recommend taking the final backup.
  /// If you want to skip taking a final backup, set this value to
  /// <code>true</code>.
  final bool? skipFinalBackup;

  DeleteFileSystemOpenZFSConfiguration({
    this.finalBackupTags,
    this.options,
    this.skipFinalBackup,
  });

  Map<String, dynamic> toJson() {
    final finalBackupTags = this.finalBackupTags;
    final options = this.options;
    final skipFinalBackup = this.skipFinalBackup;
    return {
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
      if (options != null) 'Options': options.map((e) => e.toValue()).toList(),
      if (skipFinalBackup != null) 'SkipFinalBackup': skipFinalBackup,
    };
  }
}

enum DeleteFileSystemOpenZFSOption {
  deleteChildVolumesAndSnapshots,
}

extension DeleteFileSystemOpenZFSOptionValueExtension
    on DeleteFileSystemOpenZFSOption {
  String toValue() {
    switch (this) {
      case DeleteFileSystemOpenZFSOption.deleteChildVolumesAndSnapshots:
        return 'DELETE_CHILD_VOLUMES_AND_SNAPSHOTS';
    }
  }
}

extension DeleteFileSystemOpenZFSOptionFromString on String {
  DeleteFileSystemOpenZFSOption toDeleteFileSystemOpenZFSOption() {
    switch (this) {
      case 'DELETE_CHILD_VOLUMES_AND_SNAPSHOTS':
        return DeleteFileSystemOpenZFSOption.deleteChildVolumesAndSnapshots;
    }
    throw Exception('$this is not known in enum DeleteFileSystemOpenZFSOption');
  }
}

/// The response object for the Amazon FSx for OpenZFS file system that's being
/// deleted in the <code>DeleteFileSystem</code> operation.
class DeleteFileSystemOpenZFSResponse {
  final String? finalBackupId;
  final List<Tag>? finalBackupTags;

  DeleteFileSystemOpenZFSResponse({
    this.finalBackupId,
    this.finalBackupTags,
  });

  factory DeleteFileSystemOpenZFSResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFileSystemOpenZFSResponse(
      finalBackupId: json['FinalBackupId'] as String?,
      finalBackupTags: (json['FinalBackupTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final finalBackupId = this.finalBackupId;
    final finalBackupTags = this.finalBackupTags;
    return {
      if (finalBackupId != null) 'FinalBackupId': finalBackupId,
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
    };
  }
}

/// The response object for the <code>DeleteFileSystem</code> operation.
class DeleteFileSystemResponse {
  /// The ID of the file system that's being deleted.
  final String? fileSystemId;

  /// The file system lifecycle for the deletion request. If the
  /// <code>DeleteFileSystem</code> operation is successful, this status is
  /// <code>DELETING</code>.
  final FileSystemLifecycle? lifecycle;
  final DeleteFileSystemLustreResponse? lustreResponse;

  /// The response object for the OpenZFS file system that's being deleted in the
  /// <code>DeleteFileSystem</code> operation.
  final DeleteFileSystemOpenZFSResponse? openZFSResponse;
  final DeleteFileSystemWindowsResponse? windowsResponse;

  DeleteFileSystemResponse({
    this.fileSystemId,
    this.lifecycle,
    this.lustreResponse,
    this.openZFSResponse,
    this.windowsResponse,
  });

  factory DeleteFileSystemResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFileSystemResponse(
      fileSystemId: json['FileSystemId'] as String?,
      lifecycle: (json['Lifecycle'] as String?)?.toFileSystemLifecycle(),
      lustreResponse: json['LustreResponse'] != null
          ? DeleteFileSystemLustreResponse.fromJson(
              json['LustreResponse'] as Map<String, dynamic>)
          : null,
      openZFSResponse: json['OpenZFSResponse'] != null
          ? DeleteFileSystemOpenZFSResponse.fromJson(
              json['OpenZFSResponse'] as Map<String, dynamic>)
          : null,
      windowsResponse: json['WindowsResponse'] != null
          ? DeleteFileSystemWindowsResponse.fromJson(
              json['WindowsResponse'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final lifecycle = this.lifecycle;
    final lustreResponse = this.lustreResponse;
    final openZFSResponse = this.openZFSResponse;
    final windowsResponse = this.windowsResponse;
    return {
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (lustreResponse != null) 'LustreResponse': lustreResponse,
      if (openZFSResponse != null) 'OpenZFSResponse': openZFSResponse,
      if (windowsResponse != null) 'WindowsResponse': windowsResponse,
    };
  }
}

/// The configuration object for the Microsoft Windows file system used in the
/// <code>DeleteFileSystem</code> operation.
class DeleteFileSystemWindowsConfiguration {
  /// A set of tags for your final backup.
  final List<Tag>? finalBackupTags;

  /// By default, Amazon FSx for Windows takes a final backup on your behalf when
  /// the <code>DeleteFileSystem</code> operation is invoked. Doing this helps
  /// protect you from data loss, and we highly recommend taking the final backup.
  /// If you want to skip this backup, use this flag to do so.
  final bool? skipFinalBackup;

  DeleteFileSystemWindowsConfiguration({
    this.finalBackupTags,
    this.skipFinalBackup,
  });

  Map<String, dynamic> toJson() {
    final finalBackupTags = this.finalBackupTags;
    final skipFinalBackup = this.skipFinalBackup;
    return {
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
      if (skipFinalBackup != null) 'SkipFinalBackup': skipFinalBackup,
    };
  }
}

/// The response object for the Microsoft Windows file system used in the
/// <code>DeleteFileSystem</code> operation.
class DeleteFileSystemWindowsResponse {
  /// The ID of the final backup for this file system.
  final String? finalBackupId;

  /// The set of tags applied to the final backup.
  final List<Tag>? finalBackupTags;

  DeleteFileSystemWindowsResponse({
    this.finalBackupId,
    this.finalBackupTags,
  });

  factory DeleteFileSystemWindowsResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFileSystemWindowsResponse(
      finalBackupId: json['FinalBackupId'] as String?,
      finalBackupTags: (json['FinalBackupTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final finalBackupId = this.finalBackupId;
    final finalBackupTags = this.finalBackupTags;
    return {
      if (finalBackupId != null) 'FinalBackupId': finalBackupId,
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
    };
  }
}

enum DeleteOpenZFSVolumeOption {
  deleteChildVolumesAndSnapshots,
}

extension DeleteOpenZFSVolumeOptionValueExtension on DeleteOpenZFSVolumeOption {
  String toValue() {
    switch (this) {
      case DeleteOpenZFSVolumeOption.deleteChildVolumesAndSnapshots:
        return 'DELETE_CHILD_VOLUMES_AND_SNAPSHOTS';
    }
  }
}

extension DeleteOpenZFSVolumeOptionFromString on String {
  DeleteOpenZFSVolumeOption toDeleteOpenZFSVolumeOption() {
    switch (this) {
      case 'DELETE_CHILD_VOLUMES_AND_SNAPSHOTS':
        return DeleteOpenZFSVolumeOption.deleteChildVolumesAndSnapshots;
    }
    throw Exception('$this is not known in enum DeleteOpenZFSVolumeOption');
  }
}

class DeleteSnapshotResponse {
  /// The lifecycle status of the snapshot. If the <code>DeleteSnapshot</code>
  /// operation is successful, this status is <code>DELETING</code>.
  final SnapshotLifecycle? lifecycle;

  /// The ID of the deleted snapshot.
  final String? snapshotId;

  DeleteSnapshotResponse({
    this.lifecycle,
    this.snapshotId,
  });

  factory DeleteSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSnapshotResponse(
      lifecycle: (json['Lifecycle'] as String?)?.toSnapshotLifecycle(),
      snapshotId: json['SnapshotId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycle = this.lifecycle;
    final snapshotId = this.snapshotId;
    return {
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (snapshotId != null) 'SnapshotId': snapshotId,
    };
  }
}

class DeleteStorageVirtualMachineResponse {
  /// Describes the lifecycle state of the SVM being deleted.
  final StorageVirtualMachineLifecycle? lifecycle;

  /// The ID of the SVM Amazon FSx is deleting.
  final String? storageVirtualMachineId;

  DeleteStorageVirtualMachineResponse({
    this.lifecycle,
    this.storageVirtualMachineId,
  });

  factory DeleteStorageVirtualMachineResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteStorageVirtualMachineResponse(
      lifecycle:
          (json['Lifecycle'] as String?)?.toStorageVirtualMachineLifecycle(),
      storageVirtualMachineId: json['StorageVirtualMachineId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycle = this.lifecycle;
    final storageVirtualMachineId = this.storageVirtualMachineId;
    return {
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (storageVirtualMachineId != null)
        'StorageVirtualMachineId': storageVirtualMachineId,
    };
  }
}

/// Use to specify skipping a final backup, adding tags to a final backup, or
/// bypassing the retention period of an FSx for ONTAP SnapLock Enterprise
/// volume when deleting an FSx for ONTAP volume.
class DeleteVolumeOntapConfiguration {
  /// Setting this to <code>true</code> allows a SnapLock administrator to delete
  /// an FSx for ONTAP SnapLock Enterprise volume with unexpired write once, read
  /// many (WORM) files. The IAM permission
  /// <code>fsx:BypassSnaplockEnterpriseRetention</code> is also required to
  /// delete SnapLock Enterprise volumes with unexpired WORM files. The default
  /// value is <code>false</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-delete-volume.html">
  /// Deleting a SnapLock volume</a>.
  final bool? bypassSnaplockEnterpriseRetention;
  final List<Tag>? finalBackupTags;

  /// Set to true if you want to skip taking a final backup of the volume you are
  /// deleting.
  final bool? skipFinalBackup;

  DeleteVolumeOntapConfiguration({
    this.bypassSnaplockEnterpriseRetention,
    this.finalBackupTags,
    this.skipFinalBackup,
  });

  Map<String, dynamic> toJson() {
    final bypassSnaplockEnterpriseRetention =
        this.bypassSnaplockEnterpriseRetention;
    final finalBackupTags = this.finalBackupTags;
    final skipFinalBackup = this.skipFinalBackup;
    return {
      if (bypassSnaplockEnterpriseRetention != null)
        'BypassSnaplockEnterpriseRetention': bypassSnaplockEnterpriseRetention,
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
      if (skipFinalBackup != null) 'SkipFinalBackup': skipFinalBackup,
    };
  }
}

/// The response object for the Amazon FSx for NetApp ONTAP volume being deleted
/// in the <code>DeleteVolume</code> operation.
class DeleteVolumeOntapResponse {
  final String? finalBackupId;
  final List<Tag>? finalBackupTags;

  DeleteVolumeOntapResponse({
    this.finalBackupId,
    this.finalBackupTags,
  });

  factory DeleteVolumeOntapResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVolumeOntapResponse(
      finalBackupId: json['FinalBackupId'] as String?,
      finalBackupTags: (json['FinalBackupTags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final finalBackupId = this.finalBackupId;
    final finalBackupTags = this.finalBackupTags;
    return {
      if (finalBackupId != null) 'FinalBackupId': finalBackupId,
      if (finalBackupTags != null) 'FinalBackupTags': finalBackupTags,
    };
  }
}

/// A value that specifies whether to delete all child volumes and snapshots.
class DeleteVolumeOpenZFSConfiguration {
  /// To delete the volume's child volumes, snapshots, and clones, use the string
  /// <code>DELETE_CHILD_VOLUMES_AND_SNAPSHOTS</code>.
  final List<DeleteOpenZFSVolumeOption>? options;

  DeleteVolumeOpenZFSConfiguration({
    this.options,
  });

  Map<String, dynamic> toJson() {
    final options = this.options;
    return {
      if (options != null) 'Options': options.map((e) => e.toValue()).toList(),
    };
  }
}

class DeleteVolumeResponse {
  /// The lifecycle state of the volume being deleted. If the
  /// <code>DeleteVolume</code> operation is successful, this value is
  /// <code>DELETING</code>.
  final VolumeLifecycle? lifecycle;

  /// Returned after a <code>DeleteVolume</code> request, showing the status of
  /// the delete request.
  final DeleteVolumeOntapResponse? ontapResponse;

  /// The ID of the volume that's being deleted.
  final String? volumeId;

  DeleteVolumeResponse({
    this.lifecycle,
    this.ontapResponse,
    this.volumeId,
  });

  factory DeleteVolumeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteVolumeResponse(
      lifecycle: (json['Lifecycle'] as String?)?.toVolumeLifecycle(),
      ontapResponse: json['OntapResponse'] != null
          ? DeleteVolumeOntapResponse.fromJson(
              json['OntapResponse'] as Map<String, dynamic>)
          : null,
      volumeId: json['VolumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycle = this.lifecycle;
    final ontapResponse = this.ontapResponse;
    final volumeId = this.volumeId;
    return {
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (ontapResponse != null) 'OntapResponse': ontapResponse,
      if (volumeId != null) 'VolumeId': volumeId,
    };
  }
}

/// Response object for the <code>DescribeBackups</code> operation.
class DescribeBackupsResponse {
  /// An array of backups.
  final List<Backup>? backups;

  /// A <code>NextToken</code> value is present if there are more backups than
  /// returned in the response. You can use the <code>NextToken</code> value in
  /// the subsequent request to fetch the backups.
  final String? nextToken;

  DescribeBackupsResponse({
    this.backups,
    this.nextToken,
  });

  factory DescribeBackupsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeBackupsResponse(
      backups: (json['Backups'] as List?)
          ?.whereNotNull()
          .map((e) => Backup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backups = this.backups;
    final nextToken = this.nextToken;
    return {
      if (backups != null) 'Backups': backups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeDataRepositoryAssociationsResponse {
  /// An array of one or more data repository association descriptions.
  final List<DataRepositoryAssociation>? associations;
  final String? nextToken;

  DescribeDataRepositoryAssociationsResponse({
    this.associations,
    this.nextToken,
  });

  factory DescribeDataRepositoryAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDataRepositoryAssociationsResponse(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataRepositoryAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final nextToken = this.nextToken;
    return {
      if (associations != null) 'Associations': associations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeDataRepositoryTasksResponse {
  /// The collection of data repository task descriptions returned.
  final List<DataRepositoryTask>? dataRepositoryTasks;
  final String? nextToken;

  DescribeDataRepositoryTasksResponse({
    this.dataRepositoryTasks,
    this.nextToken,
  });

  factory DescribeDataRepositoryTasksResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDataRepositoryTasksResponse(
      dataRepositoryTasks: (json['DataRepositoryTasks'] as List?)
          ?.whereNotNull()
          .map((e) => DataRepositoryTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataRepositoryTasks = this.dataRepositoryTasks;
    final nextToken = this.nextToken;
    return {
      if (dataRepositoryTasks != null)
        'DataRepositoryTasks': dataRepositoryTasks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeFileCachesResponse {
  /// The response object for the <code>DescribeFileCaches</code> operation.
  final List<FileCache>? fileCaches;
  final String? nextToken;

  DescribeFileCachesResponse({
    this.fileCaches,
    this.nextToken,
  });

  factory DescribeFileCachesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFileCachesResponse(
      fileCaches: (json['FileCaches'] as List?)
          ?.whereNotNull()
          .map((e) => FileCache.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileCaches = this.fileCaches;
    final nextToken = this.nextToken;
    return {
      if (fileCaches != null) 'FileCaches': fileCaches,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response object for <code>DescribeFileSystemAliases</code> operation.
class DescribeFileSystemAliasesResponse {
  /// An array of one or more DNS aliases currently associated with the specified
  /// file system.
  final List<Alias>? aliases;

  /// Present if there are more DNS aliases than returned in the response
  /// (String). You can use the <code>NextToken</code> value in a later request to
  /// fetch additional descriptions.
  final String? nextToken;

  DescribeFileSystemAliasesResponse({
    this.aliases,
    this.nextToken,
  });

  factory DescribeFileSystemAliasesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFileSystemAliasesResponse(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => Alias.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final nextToken = this.nextToken;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response object for <code>DescribeFileSystems</code> operation.
class DescribeFileSystemsResponse {
  /// An array of file system descriptions.
  final List<FileSystem>? fileSystems;

  /// Present if there are more file systems than returned in the response
  /// (String). You can use the <code>NextToken</code> value in the later request
  /// to fetch the descriptions.
  final String? nextToken;

  DescribeFileSystemsResponse({
    this.fileSystems,
    this.nextToken,
  });

  factory DescribeFileSystemsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFileSystemsResponse(
      fileSystems: (json['FileSystems'] as List?)
          ?.whereNotNull()
          .map((e) => FileSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystems = this.fileSystems;
    final nextToken = this.nextToken;
    return {
      if (fileSystems != null) 'FileSystems': fileSystems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeSharedVpcConfigurationResponse {
  /// Indicates whether participant accounts can create FSx for ONTAP Multi-AZ
  /// file systems in shared subnets.
  final String? enableFsxRouteTableUpdatesFromParticipantAccounts;

  DescribeSharedVpcConfigurationResponse({
    this.enableFsxRouteTableUpdatesFromParticipantAccounts,
  });

  factory DescribeSharedVpcConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSharedVpcConfigurationResponse(
      enableFsxRouteTableUpdatesFromParticipantAccounts:
          json['EnableFsxRouteTableUpdatesFromParticipantAccounts'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableFsxRouteTableUpdatesFromParticipantAccounts =
        this.enableFsxRouteTableUpdatesFromParticipantAccounts;
    return {
      if (enableFsxRouteTableUpdatesFromParticipantAccounts != null)
        'EnableFsxRouteTableUpdatesFromParticipantAccounts':
            enableFsxRouteTableUpdatesFromParticipantAccounts,
    };
  }
}

class DescribeSnapshotsResponse {
  final String? nextToken;

  /// An array of snapshots.
  final List<Snapshot>? snapshots;

  DescribeSnapshotsResponse({
    this.nextToken,
    this.snapshots,
  });

  factory DescribeSnapshotsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSnapshotsResponse(
      nextToken: json['NextToken'] as String?,
      snapshots: (json['Snapshots'] as List?)
          ?.whereNotNull()
          .map((e) => Snapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapshots = this.snapshots;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (snapshots != null) 'Snapshots': snapshots,
    };
  }
}

class DescribeStorageVirtualMachinesResponse {
  final String? nextToken;

  /// Returned after a successful <code>DescribeStorageVirtualMachines</code>
  /// operation, describing each SVM.
  final List<StorageVirtualMachine>? storageVirtualMachines;

  DescribeStorageVirtualMachinesResponse({
    this.nextToken,
    this.storageVirtualMachines,
  });

  factory DescribeStorageVirtualMachinesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeStorageVirtualMachinesResponse(
      nextToken: json['NextToken'] as String?,
      storageVirtualMachines: (json['StorageVirtualMachines'] as List?)
          ?.whereNotNull()
          .map((e) => StorageVirtualMachine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final storageVirtualMachines = this.storageVirtualMachines;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (storageVirtualMachines != null)
        'StorageVirtualMachines': storageVirtualMachines,
    };
  }
}

class DescribeVolumesResponse {
  final String? nextToken;

  /// Returned after a successful <code>DescribeVolumes</code> operation,
  /// describing each volume.
  final List<Volume>? volumes;

  DescribeVolumesResponse({
    this.nextToken,
    this.volumes,
  });

  factory DescribeVolumesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVolumesResponse(
      nextToken: json['NextToken'] as String?,
      volumes: (json['Volumes'] as List?)
          ?.whereNotNull()
          .map((e) => Volume.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final volumes = this.volumes;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (volumes != null) 'Volumes': volumes,
    };
  }
}

/// The system generated response showing the DNS aliases that Amazon FSx is
/// attempting to disassociate from the file system. Use the API operation to
/// monitor the status of the aliases Amazon FSx is removing from the file
/// system.
class DisassociateFileSystemAliasesResponse {
  /// An array of one or more DNS aliases that Amazon FSx is attempting to
  /// disassociate from the file system.
  final List<Alias>? aliases;

  DisassociateFileSystemAliasesResponse({
    this.aliases,
  });

  factory DisassociateFileSystemAliasesResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateFileSystemAliasesResponse(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => Alias.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    return {
      if (aliases != null) 'Aliases': aliases,
    };
  }
}

/// The SSD IOPS (input/output operations per second) configuration for an
/// Amazon FSx for NetApp ONTAP, Amazon FSx for Windows File Server, or FSx for
/// OpenZFS file system. By default, Amazon FSx automatically provisions 3 IOPS
/// per GB of storage capacity. You can provision additional IOPS per GB of
/// storage. The configuration consists of the total number of provisioned SSD
/// IOPS and how it is was provisioned, or the mode (by the customer or by
/// Amazon FSx).
class DiskIopsConfiguration {
  /// The total number of SSD IOPS provisioned for the file system.
  ///
  /// The minimum and maximum values for this property depend on the value of
  /// <code>HAPairs</code> and <code>StorageCapacity</code>. The minimum value is
  /// calculated as <code>StorageCapacity</code> * 3 * <code>HAPairs</code> (3
  /// IOPS per GB of <code>StorageCapacity</code>). The maximum value is
  /// calculated as 200,000 * <code>HAPairs</code>.
  ///
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) if the value
  /// of <code>Iops</code> is outside of the minimum or maximum values.
  final int? iops;

  /// Specifies whether the file system is using the <code>AUTOMATIC</code>
  /// setting of SSD IOPS of 3 IOPS per GB of storage capacity, or if it using a
  /// <code>USER_PROVISIONED</code> value.
  final DiskIopsConfigurationMode? mode;

  DiskIopsConfiguration({
    this.iops,
    this.mode,
  });

  factory DiskIopsConfiguration.fromJson(Map<String, dynamic> json) {
    return DiskIopsConfiguration(
      iops: json['Iops'] as int?,
      mode: (json['Mode'] as String?)?.toDiskIopsConfigurationMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final mode = this.mode;
    return {
      if (iops != null) 'Iops': iops,
      if (mode != null) 'Mode': mode.toValue(),
    };
  }
}

enum DiskIopsConfigurationMode {
  automatic,
  userProvisioned,
}

extension DiskIopsConfigurationModeValueExtension on DiskIopsConfigurationMode {
  String toValue() {
    switch (this) {
      case DiskIopsConfigurationMode.automatic:
        return 'AUTOMATIC';
      case DiskIopsConfigurationMode.userProvisioned:
        return 'USER_PROVISIONED';
    }
  }
}

extension DiskIopsConfigurationModeFromString on String {
  DiskIopsConfigurationMode toDiskIopsConfigurationMode() {
    switch (this) {
      case 'AUTOMATIC':
        return DiskIopsConfigurationMode.automatic;
      case 'USER_PROVISIONED':
        return DiskIopsConfigurationMode.userProvisioned;
    }
    throw Exception('$this is not known in enum DiskIopsConfigurationMode');
  }
}

enum DriveCacheType {
  none,
  read,
}

extension DriveCacheTypeValueExtension on DriveCacheType {
  String toValue() {
    switch (this) {
      case DriveCacheType.none:
        return 'NONE';
      case DriveCacheType.read:
        return 'READ';
    }
  }
}

extension DriveCacheTypeFromString on String {
  DriveCacheType toDriveCacheType() {
    switch (this) {
      case 'NONE':
        return DriveCacheType.none;
      case 'READ':
        return DriveCacheType.read;
    }
    throw Exception('$this is not known in enum DriveCacheType');
  }
}

/// Defines the minimum amount of time since last access for a file to be
/// eligible for release. Only files that have been exported to S3 and that were
/// last accessed or modified before this point-in-time are eligible to be
/// released from the Amazon FSx for Lustre file system.
class DurationSinceLastAccess {
  /// The unit of time used by the <code>Value</code> parameter to determine if a
  /// file can be released, based on when it was last accessed. <code>DAYS</code>
  /// is the only supported value. This is a required parameter.
  final Unit? unit;

  /// An integer that represents the minimum amount of time (in days) since a file
  /// was last accessed in the file system. Only exported files with a
  /// <code>MAX(atime, ctime, mtime)</code> timestamp that is more than this
  /// amount of time in the past (relative to the task create time) will be
  /// released. The default of <code>Value</code> is <code>0</code>. This is a
  /// required parameter.
  /// <note>
  /// If an exported file meets the last accessed time criteria, its file or
  /// directory path must also be specified in the <code>Paths</code> parameter of
  /// the operation in order for the file to be released.
  /// </note>
  final int? value;

  DurationSinceLastAccess({
    this.unit,
    this.value,
  });

  factory DurationSinceLastAccess.fromJson(Map<String, dynamic> json) {
    return DurationSinceLastAccess(
      unit: (json['Unit'] as String?)?.toUnit(),
      value: json['Value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      if (unit != null) 'Unit': unit.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum EventType {
  $new,
  changed,
  deleted,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.$new:
        return 'NEW';
      case EventType.changed:
        return 'CHANGED';
      case EventType.deleted:
        return 'DELETED';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'NEW':
        return EventType.$new;
      case 'CHANGED':
        return EventType.changed;
      case 'DELETED':
        return EventType.deleted;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

/// A description of a specific Amazon File Cache resource, which is a response
/// object from the <code>DescribeFileCaches</code> operation.
class FileCache {
  final DateTime? creationTime;

  /// The Domain Name System (DNS) name for the cache.
  final String? dNSName;

  /// A list of IDs of data repository associations that are associated with this
  /// cache.
  final List<String>? dataRepositoryAssociationIds;

  /// A structure providing details of any failures that occurred.
  final FileCacheFailureDetails? failureDetails;

  /// The system-generated, unique ID of the cache.
  final String? fileCacheId;

  /// The type of cache, which must be <code>LUSTRE</code>.
  final FileCacheType? fileCacheType;

  /// The Lustre version of the cache, which must be <code>2.12</code>.
  final String? fileCacheTypeVersion;

  /// Specifies the ID of the Key Management Service (KMS) key to use for
  /// encrypting data on an Amazon File Cache. If a <code>KmsKeyId</code> isn't
  /// specified, the Amazon FSx-managed KMS key for your account is used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html">Encrypt</a>
  /// in the <i>Key Management Service API Reference</i>.
  final String? kmsKeyId;

  /// The lifecycle status of the cache. The following are the possible values and
  /// what they mean:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The cache is in a healthy state, and is reachable
  /// and available for use.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - The new cache is being created.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - An existing cache is being deleted.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The cache is undergoing a customer-initiated update.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - An existing cache has experienced an unrecoverable
  /// failure. When creating a new cache, the cache was unable to be created.
  /// </li>
  /// </ul>
  final FileCacheLifecycle? lifecycle;

  /// The configuration for the Amazon File Cache resource.
  final FileCacheLustreConfiguration? lustreConfiguration;
  final List<String>? networkInterfaceIds;
  final String? ownerId;
  final String? resourceARN;

  /// The storage capacity of the cache in gibibytes (GiB).
  final int? storageCapacity;
  final List<String>? subnetIds;
  final String? vpcId;

  FileCache({
    this.creationTime,
    this.dNSName,
    this.dataRepositoryAssociationIds,
    this.failureDetails,
    this.fileCacheId,
    this.fileCacheType,
    this.fileCacheTypeVersion,
    this.kmsKeyId,
    this.lifecycle,
    this.lustreConfiguration,
    this.networkInterfaceIds,
    this.ownerId,
    this.resourceARN,
    this.storageCapacity,
    this.subnetIds,
    this.vpcId,
  });

  factory FileCache.fromJson(Map<String, dynamic> json) {
    return FileCache(
      creationTime: timeStampFromJson(json['CreationTime']),
      dNSName: json['DNSName'] as String?,
      dataRepositoryAssociationIds:
          (json['DataRepositoryAssociationIds'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      failureDetails: json['FailureDetails'] != null
          ? FileCacheFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      fileCacheId: json['FileCacheId'] as String?,
      fileCacheType: (json['FileCacheType'] as String?)?.toFileCacheType(),
      fileCacheTypeVersion: json['FileCacheTypeVersion'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      lifecycle: (json['Lifecycle'] as String?)?.toFileCacheLifecycle(),
      lustreConfiguration: json['LustreConfiguration'] != null
          ? FileCacheLustreConfiguration.fromJson(
              json['LustreConfiguration'] as Map<String, dynamic>)
          : null,
      networkInterfaceIds: (json['NetworkInterfaceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ownerId: json['OwnerId'] as String?,
      resourceARN: json['ResourceARN'] as String?,
      storageCapacity: json['StorageCapacity'] as int?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dNSName = this.dNSName;
    final dataRepositoryAssociationIds = this.dataRepositoryAssociationIds;
    final failureDetails = this.failureDetails;
    final fileCacheId = this.fileCacheId;
    final fileCacheType = this.fileCacheType;
    final fileCacheTypeVersion = this.fileCacheTypeVersion;
    final kmsKeyId = this.kmsKeyId;
    final lifecycle = this.lifecycle;
    final lustreConfiguration = this.lustreConfiguration;
    final networkInterfaceIds = this.networkInterfaceIds;
    final ownerId = this.ownerId;
    final resourceARN = this.resourceARN;
    final storageCapacity = this.storageCapacity;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dNSName != null) 'DNSName': dNSName,
      if (dataRepositoryAssociationIds != null)
        'DataRepositoryAssociationIds': dataRepositoryAssociationIds,
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (fileCacheId != null) 'FileCacheId': fileCacheId,
      if (fileCacheType != null) 'FileCacheType': fileCacheType.toValue(),
      if (fileCacheTypeVersion != null)
        'FileCacheTypeVersion': fileCacheTypeVersion,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (lustreConfiguration != null)
        'LustreConfiguration': lustreConfiguration,
      if (networkInterfaceIds != null)
        'NetworkInterfaceIds': networkInterfaceIds,
      if (ownerId != null) 'OwnerId': ownerId,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (storageCapacity != null) 'StorageCapacity': storageCapacity,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// The response object for the Amazon File Cache resource being created in the
/// <code>CreateFileCache</code> operation.
class FileCacheCreating {
  /// A boolean flag indicating whether tags for the cache should be copied to
  /// data repository associations.
  final bool? copyTagsToDataRepositoryAssociations;
  final DateTime? creationTime;

  /// The Domain Name System (DNS) name for the cache.
  final String? dNSName;

  /// A list of IDs of data repository associations that are associated with this
  /// cache.
  final List<String>? dataRepositoryAssociationIds;

  /// A structure providing details of any failures that occurred.
  final FileCacheFailureDetails? failureDetails;

  /// The system-generated, unique ID of the cache.
  final String? fileCacheId;

  /// The type of cache, which must be <code>LUSTRE</code>.
  final FileCacheType? fileCacheType;

  /// The Lustre version of the cache, which must be <code>2.12</code>.
  final String? fileCacheTypeVersion;

  /// Specifies the ID of the Key Management Service (KMS) key to use for
  /// encrypting data on an Amazon File Cache. If a <code>KmsKeyId</code> isn't
  /// specified, the Amazon FSx-managed KMS key for your account is used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_Encrypt.html">Encrypt</a>
  /// in the <i>Key Management Service API Reference</i>.
  final String? kmsKeyId;

  /// The lifecycle status of the cache. The following are the possible values and
  /// what they mean:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The cache is in a healthy state, and is reachable
  /// and available for use.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - The new cache is being created.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - An existing cache is being deleted.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The cache is undergoing a customer-initiated update.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - An existing cache has experienced an unrecoverable
  /// failure. When creating a new cache, the cache was unable to be created.
  /// </li>
  /// </ul>
  final FileCacheLifecycle? lifecycle;

  /// The configuration for the Amazon File Cache resource.
  final FileCacheLustreConfiguration? lustreConfiguration;
  final List<String>? networkInterfaceIds;
  final String? ownerId;
  final String? resourceARN;

  /// The storage capacity of the cache in gibibytes (GiB).
  final int? storageCapacity;
  final List<String>? subnetIds;
  final List<Tag>? tags;
  final String? vpcId;

  FileCacheCreating({
    this.copyTagsToDataRepositoryAssociations,
    this.creationTime,
    this.dNSName,
    this.dataRepositoryAssociationIds,
    this.failureDetails,
    this.fileCacheId,
    this.fileCacheType,
    this.fileCacheTypeVersion,
    this.kmsKeyId,
    this.lifecycle,
    this.lustreConfiguration,
    this.networkInterfaceIds,
    this.ownerId,
    this.resourceARN,
    this.storageCapacity,
    this.subnetIds,
    this.tags,
    this.vpcId,
  });

  factory FileCacheCreating.fromJson(Map<String, dynamic> json) {
    return FileCacheCreating(
      copyTagsToDataRepositoryAssociations:
          json['CopyTagsToDataRepositoryAssociations'] as bool?,
      creationTime: timeStampFromJson(json['CreationTime']),
      dNSName: json['DNSName'] as String?,
      dataRepositoryAssociationIds:
          (json['DataRepositoryAssociationIds'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      failureDetails: json['FailureDetails'] != null
          ? FileCacheFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      fileCacheId: json['FileCacheId'] as String?,
      fileCacheType: (json['FileCacheType'] as String?)?.toFileCacheType(),
      fileCacheTypeVersion: json['FileCacheTypeVersion'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      lifecycle: (json['Lifecycle'] as String?)?.toFileCacheLifecycle(),
      lustreConfiguration: json['LustreConfiguration'] != null
          ? FileCacheLustreConfiguration.fromJson(
              json['LustreConfiguration'] as Map<String, dynamic>)
          : null,
      networkInterfaceIds: (json['NetworkInterfaceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ownerId: json['OwnerId'] as String?,
      resourceARN: json['ResourceARN'] as String?,
      storageCapacity: json['StorageCapacity'] as int?,
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyTagsToDataRepositoryAssociations =
        this.copyTagsToDataRepositoryAssociations;
    final creationTime = this.creationTime;
    final dNSName = this.dNSName;
    final dataRepositoryAssociationIds = this.dataRepositoryAssociationIds;
    final failureDetails = this.failureDetails;
    final fileCacheId = this.fileCacheId;
    final fileCacheType = this.fileCacheType;
    final fileCacheTypeVersion = this.fileCacheTypeVersion;
    final kmsKeyId = this.kmsKeyId;
    final lifecycle = this.lifecycle;
    final lustreConfiguration = this.lustreConfiguration;
    final networkInterfaceIds = this.networkInterfaceIds;
    final ownerId = this.ownerId;
    final resourceARN = this.resourceARN;
    final storageCapacity = this.storageCapacity;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final vpcId = this.vpcId;
    return {
      if (copyTagsToDataRepositoryAssociations != null)
        'CopyTagsToDataRepositoryAssociations':
            copyTagsToDataRepositoryAssociations,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dNSName != null) 'DNSName': dNSName,
      if (dataRepositoryAssociationIds != null)
        'DataRepositoryAssociationIds': dataRepositoryAssociationIds,
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (fileCacheId != null) 'FileCacheId': fileCacheId,
      if (fileCacheType != null) 'FileCacheType': fileCacheType.toValue(),
      if (fileCacheTypeVersion != null)
        'FileCacheTypeVersion': fileCacheTypeVersion,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (lustreConfiguration != null)
        'LustreConfiguration': lustreConfiguration,
      if (networkInterfaceIds != null)
        'NetworkInterfaceIds': networkInterfaceIds,
      if (ownerId != null) 'OwnerId': ownerId,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (storageCapacity != null) 'StorageCapacity': storageCapacity,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (tags != null) 'Tags': tags,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

/// The configuration for a data repository association (DRA) to be created
/// during the Amazon File Cache resource creation. The DRA links the cache to
/// either an Amazon S3 bucket or prefix, or a Network File System (NFS) data
/// repository that supports the NFSv3 protocol.
///
/// The DRA does not support automatic import or automatic export.
class FileCacheDataRepositoryAssociation {
  /// The path to the S3 or NFS data repository that links to the cache. You must
  /// provide one of the following paths:
  ///
  /// <ul>
  /// <li>
  /// The path can be an NFS data repository that links to the cache. The path can
  /// be in one of two formats:
  ///
  /// <ul>
  /// <li>
  /// If you are not using the <code>DataRepositorySubdirectories</code>
  /// parameter, the path is to an NFS Export directory (or one of its
  /// subdirectories) in the format <code>nsf://nfs-domain-name/exportpath</code>.
  /// You can therefore link a single NFS Export to a single data repository
  /// association.
  /// </li>
  /// <li>
  /// If you are using the <code>DataRepositorySubdirectories</code> parameter,
  /// the path is the domain name of the NFS file system in the format
  /// <code>nfs://filer-domain-name</code>, which indicates the root of the
  /// subdirectories specified with the <code>DataRepositorySubdirectories</code>
  /// parameter.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// The path can be an S3 bucket or prefix in the format
  /// <code>s3://myBucket/myPrefix/</code>.
  /// </li>
  /// </ul>
  final String dataRepositoryPath;

  /// A path on the cache that points to a high-level directory (such as
  /// <code>/ns1/</code>) or subdirectory (such as <code>/ns1/subdir/</code>) that
  /// will be mapped 1-1 with <code>DataRepositoryPath</code>. The leading forward
  /// slash in the name is required. Two data repository associations cannot have
  /// overlapping cache paths. For example, if a data repository is associated
  /// with cache path <code>/ns1/</code>, then you cannot link another data
  /// repository with cache path <code>/ns1/ns2</code>.
  ///
  /// This path specifies where in your cache files will be exported from. This
  /// cache directory can be linked to only one data repository, and no data
  /// repository other can be linked to the directory.
  /// <note>
  /// The cache path can only be set to root (/) on an NFS DRA when
  /// <code>DataRepositorySubdirectories</code> is specified. If you specify root
  /// (/) as the cache path, you can create only one DRA on the cache.
  ///
  /// The cache path cannot be set to root (/) for an S3 DRA.
  /// </note>
  final String fileCachePath;

  /// A list of NFS Exports that will be linked with this data repository
  /// association. The Export paths are in the format <code>/exportpath1</code>.
  /// To use this parameter, you must configure <code>DataRepositoryPath</code> as
  /// the domain name of the NFS file system. The NFS file system domain name in
  /// effect is the root of the subdirectories. Note that
  /// <code>DataRepositorySubdirectories</code> is not supported for S3 data
  /// repositories.
  final List<String>? dataRepositorySubdirectories;

  /// The configuration for a data repository association that links an Amazon
  /// File Cache resource to an NFS data repository.
  final FileCacheNFSConfiguration? nfs;

  FileCacheDataRepositoryAssociation({
    required this.dataRepositoryPath,
    required this.fileCachePath,
    this.dataRepositorySubdirectories,
    this.nfs,
  });

  Map<String, dynamic> toJson() {
    final dataRepositoryPath = this.dataRepositoryPath;
    final fileCachePath = this.fileCachePath;
    final dataRepositorySubdirectories = this.dataRepositorySubdirectories;
    final nfs = this.nfs;
    return {
      'DataRepositoryPath': dataRepositoryPath,
      'FileCachePath': fileCachePath,
      if (dataRepositorySubdirectories != null)
        'DataRepositorySubdirectories': dataRepositorySubdirectories,
      if (nfs != null) 'NFS': nfs,
    };
  }
}

/// A structure providing details of any failures that occurred.
class FileCacheFailureDetails {
  /// A message describing any failures that occurred.
  final String? message;

  FileCacheFailureDetails({
    this.message,
  });

  factory FileCacheFailureDetails.fromJson(Map<String, dynamic> json) {
    return FileCacheFailureDetails(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

enum FileCacheLifecycle {
  available,
  creating,
  deleting,
  updating,
  failed,
}

extension FileCacheLifecycleValueExtension on FileCacheLifecycle {
  String toValue() {
    switch (this) {
      case FileCacheLifecycle.available:
        return 'AVAILABLE';
      case FileCacheLifecycle.creating:
        return 'CREATING';
      case FileCacheLifecycle.deleting:
        return 'DELETING';
      case FileCacheLifecycle.updating:
        return 'UPDATING';
      case FileCacheLifecycle.failed:
        return 'FAILED';
    }
  }
}

extension FileCacheLifecycleFromString on String {
  FileCacheLifecycle toFileCacheLifecycle() {
    switch (this) {
      case 'AVAILABLE':
        return FileCacheLifecycle.available;
      case 'CREATING':
        return FileCacheLifecycle.creating;
      case 'DELETING':
        return FileCacheLifecycle.deleting;
      case 'UPDATING':
        return FileCacheLifecycle.updating;
      case 'FAILED':
        return FileCacheLifecycle.failed;
    }
    throw Exception('$this is not known in enum FileCacheLifecycle');
  }
}

/// The configuration for the Amazon File Cache resource.
class FileCacheLustreConfiguration {
  /// The deployment type of the Amazon File Cache resource, which must be
  /// <code>CACHE_1</code>.
  final FileCacheLustreDeploymentType? deploymentType;

  /// The configuration for Lustre logging used to write the enabled logging
  /// events for your Amazon File Cache resource to Amazon CloudWatch Logs.
  final LustreLogConfiguration? logConfiguration;

  /// The configuration for a Lustre MDT (Metadata Target) storage volume.
  final FileCacheLustreMetadataConfiguration? metadataConfiguration;

  /// You use the <code>MountName</code> value when mounting the cache. If you
  /// pass a cache ID to the <code>DescribeFileCaches</code> operation, it returns
  /// the the <code>MountName</code> value as part of the cache's description.
  final String? mountName;

  /// Per unit storage throughput represents the megabytes per second of read or
  /// write throughput per 1 tebibyte of storage provisioned. Cache throughput
  /// capacity is equal to Storage capacity (TiB) * PerUnitStorageThroughput
  /// (MB/s/TiB). The only supported value is <code>1000</code>.
  final int? perUnitStorageThroughput;
  final String? weeklyMaintenanceStartTime;

  FileCacheLustreConfiguration({
    this.deploymentType,
    this.logConfiguration,
    this.metadataConfiguration,
    this.mountName,
    this.perUnitStorageThroughput,
    this.weeklyMaintenanceStartTime,
  });

  factory FileCacheLustreConfiguration.fromJson(Map<String, dynamic> json) {
    return FileCacheLustreConfiguration(
      deploymentType: (json['DeploymentType'] as String?)
          ?.toFileCacheLustreDeploymentType(),
      logConfiguration: json['LogConfiguration'] != null
          ? LustreLogConfiguration.fromJson(
              json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      metadataConfiguration: json['MetadataConfiguration'] != null
          ? FileCacheLustreMetadataConfiguration.fromJson(
              json['MetadataConfiguration'] as Map<String, dynamic>)
          : null,
      mountName: json['MountName'] as String?,
      perUnitStorageThroughput: json['PerUnitStorageThroughput'] as int?,
      weeklyMaintenanceStartTime: json['WeeklyMaintenanceStartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentType = this.deploymentType;
    final logConfiguration = this.logConfiguration;
    final metadataConfiguration = this.metadataConfiguration;
    final mountName = this.mountName;
    final perUnitStorageThroughput = this.perUnitStorageThroughput;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (metadataConfiguration != null)
        'MetadataConfiguration': metadataConfiguration,
      if (mountName != null) 'MountName': mountName,
      if (perUnitStorageThroughput != null)
        'PerUnitStorageThroughput': perUnitStorageThroughput,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

enum FileCacheLustreDeploymentType {
  cache_1,
}

extension FileCacheLustreDeploymentTypeValueExtension
    on FileCacheLustreDeploymentType {
  String toValue() {
    switch (this) {
      case FileCacheLustreDeploymentType.cache_1:
        return 'CACHE_1';
    }
  }
}

extension FileCacheLustreDeploymentTypeFromString on String {
  FileCacheLustreDeploymentType toFileCacheLustreDeploymentType() {
    switch (this) {
      case 'CACHE_1':
        return FileCacheLustreDeploymentType.cache_1;
    }
    throw Exception('$this is not known in enum FileCacheLustreDeploymentType');
  }
}

/// The configuration for a Lustre MDT (Metadata Target) storage volume. The
/// metadata on Amazon File Cache is managed by a Lustre Metadata Server (MDS)
/// while the actual metadata is persisted on an MDT.
class FileCacheLustreMetadataConfiguration {
  /// The storage capacity of the Lustre MDT (Metadata Target) storage volume in
  /// gibibytes (GiB). The only supported value is <code>2400</code> GiB.
  final int storageCapacity;

  FileCacheLustreMetadataConfiguration({
    required this.storageCapacity,
  });

  factory FileCacheLustreMetadataConfiguration.fromJson(
      Map<String, dynamic> json) {
    return FileCacheLustreMetadataConfiguration(
      storageCapacity: json['StorageCapacity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final storageCapacity = this.storageCapacity;
    return {
      'StorageCapacity': storageCapacity,
    };
  }
}

/// The configuration for an NFS data repository association (DRA) created
/// during the creation of the Amazon File Cache resource.
class FileCacheNFSConfiguration {
  /// The version of the NFS (Network File System) protocol of the NFS data
  /// repository. The only supported value is <code>NFS3</code>, which indicates
  /// that the data repository must support the NFSv3 protocol.
  final NfsVersion version;

  /// A list of up to 2 IP addresses of DNS servers used to resolve the NFS file
  /// system domain name. The provided IP addresses can either be the IP addresses
  /// of a DNS forwarder or resolver that the customer manages and runs inside the
  /// customer VPC, or the IP addresses of the on-premises DNS servers.
  final List<String>? dnsIps;

  FileCacheNFSConfiguration({
    required this.version,
    this.dnsIps,
  });

  Map<String, dynamic> toJson() {
    final version = this.version;
    final dnsIps = this.dnsIps;
    return {
      'Version': version.toValue(),
      if (dnsIps != null) 'DnsIps': dnsIps,
    };
  }
}

enum FileCacheType {
  lustre,
}

extension FileCacheTypeValueExtension on FileCacheType {
  String toValue() {
    switch (this) {
      case FileCacheType.lustre:
        return 'LUSTRE';
    }
  }
}

extension FileCacheTypeFromString on String {
  FileCacheType toFileCacheType() {
    switch (this) {
      case 'LUSTRE':
        return FileCacheType.lustre;
    }
    throw Exception('$this is not known in enum FileCacheType');
  }
}

/// A description of a specific Amazon FSx file system.
class FileSystem {
  /// A list of administrative actions for the file system that are in process or
  /// waiting to be processed. Administrative actions describe changes to the
  /// Amazon FSx system that you have initiated using the
  /// <code>UpdateFileSystem</code> operation.
  final List<AdministrativeAction>? administrativeActions;

  /// The time that the file system was created, in seconds (since
  /// 1970-01-01T00:00:00Z), also known as Unix time.
  final DateTime? creationTime;

  /// The Domain Name System (DNS) name for the file system.
  final String? dNSName;
  final FileSystemFailureDetails? failureDetails;

  /// The system-generated, unique 17-digit ID of the file system.
  final String? fileSystemId;

  /// The type of Amazon FSx file system, which can be <code>LUSTRE</code>,
  /// <code>WINDOWS</code>, <code>ONTAP</code>, or <code>OPENZFS</code>.
  final FileSystemType? fileSystemType;

  /// The Lustre version of the Amazon FSx for Lustre file system, which can be
  /// <code>2.10</code>, <code>2.12</code>, or <code>2.15</code>.
  final String? fileSystemTypeVersion;

  /// The ID of the Key Management Service (KMS) key used to encrypt Amazon FSx
  /// file system data. Used as follows with Amazon FSx file system types:
  ///
  /// <ul>
  /// <li>
  /// Amazon FSx for Lustre <code>PERSISTENT_1</code> and
  /// <code>PERSISTENT_2</code> deployment types only.
  ///
  /// <code>SCRATCH_1</code> and <code>SCRATCH_2</code> types are encrypted using
  /// the Amazon FSx service KMS key for your account.
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
  /// </ul>
  final String? kmsKeyId;

  /// The lifecycle status of the file system. The following are the possible
  /// values and what they mean:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The file system is in a healthy state, and is
  /// reachable and available for use.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - Amazon FSx is creating the new file system.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Amazon FSx is deleting an existing file system.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - An existing file system has experienced an
  /// unrecoverable failure. When creating a new file system, Amazon FSx was
  /// unable to create the file system.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURED</code> - The file system is in a failed but recoverable
  /// state.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURED_UNAVAILABLE</code> - (Amazon FSx for Windows File Server
  /// only) The file system is currently unavailable due to a change in your
  /// Active Directory configuration.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - The file system is undergoing a customer-initiated
  /// update.
  /// </li>
  /// </ul>
  final FileSystemLifecycle? lifecycle;
  final LustreFileSystemConfiguration? lustreConfiguration;

  /// The IDs of the elastic network interfaces from which a specific file system
  /// is accessible. The elastic network interface is automatically created in the
  /// same virtual private cloud (VPC) that the Amazon FSx file system was created
  /// in. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html">Elastic
  /// Network Interfaces</a> in the <i>Amazon EC2 User Guide.</i>
  ///
  /// For an Amazon FSx for Windows File Server file system, you can have one
  /// network interface ID. For an Amazon FSx for Lustre file system, you can have
  /// more than one.
  final List<String>? networkInterfaceIds;

  /// The configuration for this Amazon FSx for NetApp ONTAP file system.
  final OntapFileSystemConfiguration? ontapConfiguration;

  /// The configuration for this Amazon FSx for OpenZFS file system.
  final OpenZFSFileSystemConfiguration? openZFSConfiguration;

  /// The Amazon Web Services account that created the file system. If the file
  /// system was created by a user in IAM Identity Center, the Amazon Web Services
  /// account to which the IAM user belongs is the owner.
  final String? ownerId;

  /// The Amazon Resource Name (ARN) of the file system resource.
  final String? resourceARN;

  /// The storage capacity of the file system in gibibytes (GiB).
  ///
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) if the value
  /// of <code>StorageCapacity</code> is outside of the minimum or maximum values.
  final int? storageCapacity;

  /// The type of storage the file system is using. If set to <code>SSD</code>,
  /// the file system uses solid state drive storage. If set to <code>HDD</code>,
  /// the file system uses hard disk drive storage.
  final StorageType? storageType;

  /// Specifies the IDs of the subnets that the file system is accessible from.
  /// For the Amazon FSx Windows and ONTAP <code>MULTI_AZ_1</code> file system
  /// deployment type, there are two subnet IDs, one for the preferred file server
  /// and one for the standby file server. The preferred file server subnet
  /// identified in the <code>PreferredSubnetID</code> property. All other file
  /// systems have only one subnet ID.
  ///
  /// For FSx for Lustre file systems, and Single-AZ Windows file systems, this is
  /// the ID of the subnet that contains the file system's endpoint. For
  /// <code>MULTI_AZ_1</code> Windows and ONTAP file systems, the file system
  /// endpoint is available in the <code>PreferredSubnetID</code>.
  final List<String>? subnetIds;

  /// The tags to associate with the file system. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/tag-resources.html">Tagging
  /// your Amazon FSx resources</a> in the <i>Amazon FSx for Lustre User
  /// Guide</i>.
  final List<Tag>? tags;

  /// The ID of the primary virtual private cloud (VPC) for the file system.
  final String? vpcId;

  /// The configuration for this Amazon FSx for Windows File Server file system.
  final WindowsFileSystemConfiguration? windowsConfiguration;

  FileSystem({
    this.administrativeActions,
    this.creationTime,
    this.dNSName,
    this.failureDetails,
    this.fileSystemId,
    this.fileSystemType,
    this.fileSystemTypeVersion,
    this.kmsKeyId,
    this.lifecycle,
    this.lustreConfiguration,
    this.networkInterfaceIds,
    this.ontapConfiguration,
    this.openZFSConfiguration,
    this.ownerId,
    this.resourceARN,
    this.storageCapacity,
    this.storageType,
    this.subnetIds,
    this.tags,
    this.vpcId,
    this.windowsConfiguration,
  });

  factory FileSystem.fromJson(Map<String, dynamic> json) {
    return FileSystem(
      administrativeActions: (json['AdministrativeActions'] as List?)
          ?.whereNotNull()
          .map((e) => AdministrativeAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      dNSName: json['DNSName'] as String?,
      failureDetails: json['FailureDetails'] != null
          ? FileSystemFailureDetails.fromJson(
              json['FailureDetails'] as Map<String, dynamic>)
          : null,
      fileSystemId: json['FileSystemId'] as String?,
      fileSystemType: (json['FileSystemType'] as String?)?.toFileSystemType(),
      fileSystemTypeVersion: json['FileSystemTypeVersion'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      lifecycle: (json['Lifecycle'] as String?)?.toFileSystemLifecycle(),
      lustreConfiguration: json['LustreConfiguration'] != null
          ? LustreFileSystemConfiguration.fromJson(
              json['LustreConfiguration'] as Map<String, dynamic>)
          : null,
      networkInterfaceIds: (json['NetworkInterfaceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ontapConfiguration: json['OntapConfiguration'] != null
          ? OntapFileSystemConfiguration.fromJson(
              json['OntapConfiguration'] as Map<String, dynamic>)
          : null,
      openZFSConfiguration: json['OpenZFSConfiguration'] != null
          ? OpenZFSFileSystemConfiguration.fromJson(
              json['OpenZFSConfiguration'] as Map<String, dynamic>)
          : null,
      ownerId: json['OwnerId'] as String?,
      resourceARN: json['ResourceARN'] as String?,
      storageCapacity: json['StorageCapacity'] as int?,
      storageType: (json['StorageType'] as String?)?.toStorageType(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
      windowsConfiguration: json['WindowsConfiguration'] != null
          ? WindowsFileSystemConfiguration.fromJson(
              json['WindowsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final administrativeActions = this.administrativeActions;
    final creationTime = this.creationTime;
    final dNSName = this.dNSName;
    final failureDetails = this.failureDetails;
    final fileSystemId = this.fileSystemId;
    final fileSystemType = this.fileSystemType;
    final fileSystemTypeVersion = this.fileSystemTypeVersion;
    final kmsKeyId = this.kmsKeyId;
    final lifecycle = this.lifecycle;
    final lustreConfiguration = this.lustreConfiguration;
    final networkInterfaceIds = this.networkInterfaceIds;
    final ontapConfiguration = this.ontapConfiguration;
    final openZFSConfiguration = this.openZFSConfiguration;
    final ownerId = this.ownerId;
    final resourceARN = this.resourceARN;
    final storageCapacity = this.storageCapacity;
    final storageType = this.storageType;
    final subnetIds = this.subnetIds;
    final tags = this.tags;
    final vpcId = this.vpcId;
    final windowsConfiguration = this.windowsConfiguration;
    return {
      if (administrativeActions != null)
        'AdministrativeActions': administrativeActions,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dNSName != null) 'DNSName': dNSName,
      if (failureDetails != null) 'FailureDetails': failureDetails,
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (fileSystemType != null) 'FileSystemType': fileSystemType.toValue(),
      if (fileSystemTypeVersion != null)
        'FileSystemTypeVersion': fileSystemTypeVersion,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (lustreConfiguration != null)
        'LustreConfiguration': lustreConfiguration,
      if (networkInterfaceIds != null)
        'NetworkInterfaceIds': networkInterfaceIds,
      if (ontapConfiguration != null) 'OntapConfiguration': ontapConfiguration,
      if (openZFSConfiguration != null)
        'OpenZFSConfiguration': openZFSConfiguration,
      if (ownerId != null) 'OwnerId': ownerId,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (storageCapacity != null) 'StorageCapacity': storageCapacity,
      if (storageType != null) 'StorageType': storageType.toValue(),
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (tags != null) 'Tags': tags,
      if (vpcId != null) 'VpcId': vpcId,
      if (windowsConfiguration != null)
        'WindowsConfiguration': windowsConfiguration,
    };
  }
}

/// An Amazon FSx for NetApp ONTAP file system has two endpoints that are used
/// to access data or to manage the file system using the NetApp ONTAP CLI, REST
/// API, or NetApp SnapMirror. They are the <code>Management</code> and
/// <code>Intercluster</code> endpoints.
class FileSystemEndpoint {
  final String? dNSName;

  /// IP addresses of the file system endpoint.
  final List<String>? ipAddresses;

  FileSystemEndpoint({
    this.dNSName,
    this.ipAddresses,
  });

  factory FileSystemEndpoint.fromJson(Map<String, dynamic> json) {
    return FileSystemEndpoint(
      dNSName: json['DNSName'] as String?,
      ipAddresses: (json['IpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dNSName = this.dNSName;
    final ipAddresses = this.ipAddresses;
    return {
      if (dNSName != null) 'DNSName': dNSName,
      if (ipAddresses != null) 'IpAddresses': ipAddresses,
    };
  }
}

/// An Amazon FSx for NetApp ONTAP file system has the following endpoints that
/// are used to access data or to manage the file system using the NetApp ONTAP
/// CLI, REST API, or NetApp SnapMirror.
class FileSystemEndpoints {
  /// An endpoint for managing your file system by setting up NetApp SnapMirror
  /// with other ONTAP systems.
  final FileSystemEndpoint? intercluster;

  /// An endpoint for managing your file system using the NetApp ONTAP CLI and
  /// NetApp ONTAP API.
  final FileSystemEndpoint? management;

  FileSystemEndpoints({
    this.intercluster,
    this.management,
  });

  factory FileSystemEndpoints.fromJson(Map<String, dynamic> json) {
    return FileSystemEndpoints(
      intercluster: json['Intercluster'] != null
          ? FileSystemEndpoint.fromJson(
              json['Intercluster'] as Map<String, dynamic>)
          : null,
      management: json['Management'] != null
          ? FileSystemEndpoint.fromJson(
              json['Management'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final intercluster = this.intercluster;
    final management = this.management;
    return {
      if (intercluster != null) 'Intercluster': intercluster,
      if (management != null) 'Management': management,
    };
  }
}

/// A structure providing details of any failures that occurred.
class FileSystemFailureDetails {
  /// A message describing any failures that occurred.
  final String? message;

  FileSystemFailureDetails({
    this.message,
  });

  factory FileSystemFailureDetails.fromJson(Map<String, dynamic> json) {
    return FileSystemFailureDetails(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The lifecycle status of the file system.
enum FileSystemLifecycle {
  available,
  creating,
  failed,
  deleting,
  misconfigured,
  updating,
  misconfiguredUnavailable,
}

extension FileSystemLifecycleValueExtension on FileSystemLifecycle {
  String toValue() {
    switch (this) {
      case FileSystemLifecycle.available:
        return 'AVAILABLE';
      case FileSystemLifecycle.creating:
        return 'CREATING';
      case FileSystemLifecycle.failed:
        return 'FAILED';
      case FileSystemLifecycle.deleting:
        return 'DELETING';
      case FileSystemLifecycle.misconfigured:
        return 'MISCONFIGURED';
      case FileSystemLifecycle.updating:
        return 'UPDATING';
      case FileSystemLifecycle.misconfiguredUnavailable:
        return 'MISCONFIGURED_UNAVAILABLE';
    }
  }
}

extension FileSystemLifecycleFromString on String {
  FileSystemLifecycle toFileSystemLifecycle() {
    switch (this) {
      case 'AVAILABLE':
        return FileSystemLifecycle.available;
      case 'CREATING':
        return FileSystemLifecycle.creating;
      case 'FAILED':
        return FileSystemLifecycle.failed;
      case 'DELETING':
        return FileSystemLifecycle.deleting;
      case 'MISCONFIGURED':
        return FileSystemLifecycle.misconfigured;
      case 'UPDATING':
        return FileSystemLifecycle.updating;
      case 'MISCONFIGURED_UNAVAILABLE':
        return FileSystemLifecycle.misconfiguredUnavailable;
    }
    throw Exception('$this is not known in enum FileSystemLifecycle');
  }
}

/// An enumeration specifying the currently ongoing maintenance operation.
enum FileSystemMaintenanceOperation {
  patching,
  backingUp,
}

extension FileSystemMaintenanceOperationValueExtension
    on FileSystemMaintenanceOperation {
  String toValue() {
    switch (this) {
      case FileSystemMaintenanceOperation.patching:
        return 'PATCHING';
      case FileSystemMaintenanceOperation.backingUp:
        return 'BACKING_UP';
    }
  }
}

extension FileSystemMaintenanceOperationFromString on String {
  FileSystemMaintenanceOperation toFileSystemMaintenanceOperation() {
    switch (this) {
      case 'PATCHING':
        return FileSystemMaintenanceOperation.patching;
      case 'BACKING_UP':
        return FileSystemMaintenanceOperation.backingUp;
    }
    throw Exception(
        '$this is not known in enum FileSystemMaintenanceOperation');
  }
}

/// The type of file system.
enum FileSystemType {
  windows,
  lustre,
  ontap,
  openzfs,
}

extension FileSystemTypeValueExtension on FileSystemType {
  String toValue() {
    switch (this) {
      case FileSystemType.windows:
        return 'WINDOWS';
      case FileSystemType.lustre:
        return 'LUSTRE';
      case FileSystemType.ontap:
        return 'ONTAP';
      case FileSystemType.openzfs:
        return 'OPENZFS';
    }
  }
}

extension FileSystemTypeFromString on String {
  FileSystemType toFileSystemType() {
    switch (this) {
      case 'WINDOWS':
        return FileSystemType.windows;
      case 'LUSTRE':
        return FileSystemType.lustre;
      case 'ONTAP':
        return FileSystemType.ontap;
      case 'OPENZFS':
        return FileSystemType.openzfs;
    }
    throw Exception('$this is not known in enum FileSystemType');
  }
}

/// A filter used to restrict the results of describe calls. You can use
/// multiple filters to return results that meet all applied filter
/// requirements.
class Filter {
  /// The name for this filter.
  final FilterName? name;

  /// The values of the filter. These are all the values for any of the applied
  /// filters.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

/// The name for a filter.
enum FilterName {
  fileSystemId,
  backupType,
  fileSystemType,
  volumeId,
  dataRepositoryType,
  fileCacheId,
  fileCacheType,
}

extension FilterNameValueExtension on FilterName {
  String toValue() {
    switch (this) {
      case FilterName.fileSystemId:
        return 'file-system-id';
      case FilterName.backupType:
        return 'backup-type';
      case FilterName.fileSystemType:
        return 'file-system-type';
      case FilterName.volumeId:
        return 'volume-id';
      case FilterName.dataRepositoryType:
        return 'data-repository-type';
      case FilterName.fileCacheId:
        return 'file-cache-id';
      case FilterName.fileCacheType:
        return 'file-cache-type';
    }
  }
}

extension FilterNameFromString on String {
  FilterName toFilterName() {
    switch (this) {
      case 'file-system-id':
        return FilterName.fileSystemId;
      case 'backup-type':
        return FilterName.backupType;
      case 'file-system-type':
        return FilterName.fileSystemType;
      case 'volume-id':
        return FilterName.volumeId;
      case 'data-repository-type':
        return FilterName.dataRepositoryType;
      case 'file-cache-id':
        return FilterName.fileCacheId;
      case 'file-cache-type':
        return FilterName.fileCacheType;
    }
    throw Exception('$this is not known in enum FilterName');
  }
}

enum FlexCacheEndpointType {
  none,
  origin,
  cache,
}

extension FlexCacheEndpointTypeValueExtension on FlexCacheEndpointType {
  String toValue() {
    switch (this) {
      case FlexCacheEndpointType.none:
        return 'NONE';
      case FlexCacheEndpointType.origin:
        return 'ORIGIN';
      case FlexCacheEndpointType.cache:
        return 'CACHE';
    }
  }
}

extension FlexCacheEndpointTypeFromString on String {
  FlexCacheEndpointType toFlexCacheEndpointType() {
    switch (this) {
      case 'NONE':
        return FlexCacheEndpointType.none;
      case 'ORIGIN':
        return FlexCacheEndpointType.origin;
      case 'CACHE':
        return FlexCacheEndpointType.cache;
    }
    throw Exception('$this is not known in enum FlexCacheEndpointType');
  }
}

enum InputOntapVolumeType {
  rw,
  dp,
}

extension InputOntapVolumeTypeValueExtension on InputOntapVolumeType {
  String toValue() {
    switch (this) {
      case InputOntapVolumeType.rw:
        return 'RW';
      case InputOntapVolumeType.dp:
        return 'DP';
    }
  }
}

extension InputOntapVolumeTypeFromString on String {
  InputOntapVolumeType toInputOntapVolumeType() {
    switch (this) {
      case 'RW':
        return InputOntapVolumeType.rw;
      case 'DP':
        return InputOntapVolumeType.dp;
    }
    throw Exception('$this is not known in enum InputOntapVolumeType');
  }
}

/// Describes why a resource lifecycle state changed.
class LifecycleTransitionReason {
  final String? message;

  LifecycleTransitionReason({
    this.message,
  });

  factory LifecycleTransitionReason.fromJson(Map<String, dynamic> json) {
    return LifecycleTransitionReason(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The response object for <code>ListTagsForResource</code> operation.
class ListTagsForResourceResponse {
  /// This is present if there are more tags than returned in the response
  /// (String). You can use the <code>NextToken</code> value in the later request
  /// to fetch the tags.
  final String? nextToken;

  /// A list of tags on the resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
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

enum LustreAccessAuditLogLevel {
  disabled,
  warnOnly,
  errorOnly,
  warnError,
}

extension LustreAccessAuditLogLevelValueExtension on LustreAccessAuditLogLevel {
  String toValue() {
    switch (this) {
      case LustreAccessAuditLogLevel.disabled:
        return 'DISABLED';
      case LustreAccessAuditLogLevel.warnOnly:
        return 'WARN_ONLY';
      case LustreAccessAuditLogLevel.errorOnly:
        return 'ERROR_ONLY';
      case LustreAccessAuditLogLevel.warnError:
        return 'WARN_ERROR';
    }
  }
}

extension LustreAccessAuditLogLevelFromString on String {
  LustreAccessAuditLogLevel toLustreAccessAuditLogLevel() {
    switch (this) {
      case 'DISABLED':
        return LustreAccessAuditLogLevel.disabled;
      case 'WARN_ONLY':
        return LustreAccessAuditLogLevel.warnOnly;
      case 'ERROR_ONLY':
        return LustreAccessAuditLogLevel.errorOnly;
      case 'WARN_ERROR':
        return LustreAccessAuditLogLevel.warnError;
    }
    throw Exception('$this is not known in enum LustreAccessAuditLogLevel');
  }
}

enum LustreDeploymentType {
  scratch_1,
  scratch_2,
  persistent_1,
  persistent_2,
}

extension LustreDeploymentTypeValueExtension on LustreDeploymentType {
  String toValue() {
    switch (this) {
      case LustreDeploymentType.scratch_1:
        return 'SCRATCH_1';
      case LustreDeploymentType.scratch_2:
        return 'SCRATCH_2';
      case LustreDeploymentType.persistent_1:
        return 'PERSISTENT_1';
      case LustreDeploymentType.persistent_2:
        return 'PERSISTENT_2';
    }
  }
}

extension LustreDeploymentTypeFromString on String {
  LustreDeploymentType toLustreDeploymentType() {
    switch (this) {
      case 'SCRATCH_1':
        return LustreDeploymentType.scratch_1;
      case 'SCRATCH_2':
        return LustreDeploymentType.scratch_2;
      case 'PERSISTENT_1':
        return LustreDeploymentType.persistent_1;
      case 'PERSISTENT_2':
        return LustreDeploymentType.persistent_2;
    }
    throw Exception('$this is not known in enum LustreDeploymentType');
  }
}

/// The configuration for the Amazon FSx for Lustre file system.
class LustreFileSystemConfiguration {
  final int? automaticBackupRetentionDays;

  /// A boolean flag indicating whether tags on the file system are copied to
  /// backups. If it's set to true, all tags on the file system are copied to all
  /// automatic backups and any user-initiated backups where the user doesn't
  /// specify any tags. If this value is true, and you specify one or more tags,
  /// only the specified tags are copied to backups. If you specify one or more
  /// tags when creating a user-initiated backup, no tags are copied from the file
  /// system, regardless of this value. (Default = false)
  final bool? copyTagsToBackups;
  final String? dailyAutomaticBackupStartTime;

  /// The data compression configuration for the file system.
  /// <code>DataCompressionType</code> can have the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - Data compression is turned off for the file system.
  /// </li>
  /// <li>
  /// <code>LZ4</code> - Data compression is turned on with the LZ4 algorithm.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-compression.html">Lustre
  /// data compression</a>.
  final DataCompressionType? dataCompressionType;
  final DataRepositoryConfiguration? dataRepositoryConfiguration;

  /// The deployment type of the FSx for Lustre file system. <i>Scratch deployment
  /// type</i> is designed for temporary storage and shorter-term processing of
  /// data.
  ///
  /// <code>SCRATCH_1</code> and <code>SCRATCH_2</code> deployment types are best
  /// suited for when you need temporary storage and shorter-term processing of
  /// data. The <code>SCRATCH_2</code> deployment type provides in-transit
  /// encryption of data and higher burst throughput capacity than
  /// <code>SCRATCH_1</code>.
  ///
  /// The <code>PERSISTENT_1</code> and <code>PERSISTENT_2</code> deployment type
  /// is used for longer-term storage and workloads and encryption of data in
  /// transit. <code>PERSISTENT_2</code> offers higher
  /// <code>PerUnitStorageThroughput</code> (up to 1000 MB/s/TiB) along with a
  /// lower minimum storage capacity requirement (600 GiB). To learn more about
  /// FSx for Lustre deployment types, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/lustre-deployment-types.html">
  /// FSx for Lustre deployment options</a>.
  ///
  /// The default is <code>SCRATCH_1</code>.
  final LustreDeploymentType? deploymentType;

  /// The type of drive cache used by <code>PERSISTENT_1</code> file systems that
  /// are provisioned with HDD storage devices. This parameter is required when
  /// <code>StorageType</code> is HDD. When set to <code>READ</code> the file
  /// system has an SSD storage cache that is sized to 20% of the file system's
  /// storage capacity. This improves the performance for frequently accessed
  /// files by caching up to 20% of the total storage capacity.
  ///
  /// This parameter is required when <code>StorageType</code> is set to HDD.
  final DriveCacheType? driveCacheType;

  /// The Lustre logging configuration. Lustre logging writes the enabled log
  /// events for your file system to Amazon CloudWatch Logs.
  final LustreLogConfiguration? logConfiguration;

  /// You use the <code>MountName</code> value when mounting the file system.
  ///
  /// For the <code>SCRATCH_1</code> deployment type, this value is always
  /// "<code>fsx</code>". For <code>SCRATCH_2</code>, <code>PERSISTENT_1</code>,
  /// and <code>PERSISTENT_2</code> deployment types, this value is a string that
  /// is unique within an Amazon Web Services Region.
  final String? mountName;

  /// Per unit storage throughput represents the megabytes per second of read or
  /// write throughput per 1 tebibyte of storage provisioned. File system
  /// throughput capacity is equal to Storage capacity (TiB) *
  /// PerUnitStorageThroughput (MB/s/TiB). This option is only valid for
  /// <code>PERSISTENT_1</code> and <code>PERSISTENT_2</code> deployment types.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// For <code>PERSISTENT_1</code> SSD storage: 50, 100, 200.
  /// </li>
  /// <li>
  /// For <code>PERSISTENT_1</code> HDD storage: 12, 40.
  /// </li>
  /// <li>
  /// For <code>PERSISTENT_2</code> SSD storage: 125, 250, 500, 1000.
  /// </li>
  /// </ul>
  final int? perUnitStorageThroughput;

  /// The Lustre root squash configuration for an Amazon FSx for Lustre file
  /// system. When enabled, root squash restricts root-level access from clients
  /// that try to access your file system as a root user.
  final LustreRootSquashConfiguration? rootSquashConfiguration;

  /// The preferred start time to perform weekly maintenance, formatted d:HH:MM in
  /// the UTC time zone. Here, <code>d</code> is the weekday number, from 1
  /// through 7, beginning with Monday and ending with Sunday.
  final String? weeklyMaintenanceStartTime;

  LustreFileSystemConfiguration({
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.dailyAutomaticBackupStartTime,
    this.dataCompressionType,
    this.dataRepositoryConfiguration,
    this.deploymentType,
    this.driveCacheType,
    this.logConfiguration,
    this.mountName,
    this.perUnitStorageThroughput,
    this.rootSquashConfiguration,
    this.weeklyMaintenanceStartTime,
  });

  factory LustreFileSystemConfiguration.fromJson(Map<String, dynamic> json) {
    return LustreFileSystemConfiguration(
      automaticBackupRetentionDays:
          json['AutomaticBackupRetentionDays'] as int?,
      copyTagsToBackups: json['CopyTagsToBackups'] as bool?,
      dailyAutomaticBackupStartTime:
          json['DailyAutomaticBackupStartTime'] as String?,
      dataCompressionType:
          (json['DataCompressionType'] as String?)?.toDataCompressionType(),
      dataRepositoryConfiguration: json['DataRepositoryConfiguration'] != null
          ? DataRepositoryConfiguration.fromJson(
              json['DataRepositoryConfiguration'] as Map<String, dynamic>)
          : null,
      deploymentType:
          (json['DeploymentType'] as String?)?.toLustreDeploymentType(),
      driveCacheType: (json['DriveCacheType'] as String?)?.toDriveCacheType(),
      logConfiguration: json['LogConfiguration'] != null
          ? LustreLogConfiguration.fromJson(
              json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      mountName: json['MountName'] as String?,
      perUnitStorageThroughput: json['PerUnitStorageThroughput'] as int?,
      rootSquashConfiguration: json['RootSquashConfiguration'] != null
          ? LustreRootSquashConfiguration.fromJson(
              json['RootSquashConfiguration'] as Map<String, dynamic>)
          : null,
      weeklyMaintenanceStartTime: json['WeeklyMaintenanceStartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final copyTagsToBackups = this.copyTagsToBackups;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final dataCompressionType = this.dataCompressionType;
    final dataRepositoryConfiguration = this.dataRepositoryConfiguration;
    final deploymentType = this.deploymentType;
    final driveCacheType = this.driveCacheType;
    final logConfiguration = this.logConfiguration;
    final mountName = this.mountName;
    final perUnitStorageThroughput = this.perUnitStorageThroughput;
    final rootSquashConfiguration = this.rootSquashConfiguration;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (dataCompressionType != null)
        'DataCompressionType': dataCompressionType.toValue(),
      if (dataRepositoryConfiguration != null)
        'DataRepositoryConfiguration': dataRepositoryConfiguration,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (driveCacheType != null) 'DriveCacheType': driveCacheType.toValue(),
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (mountName != null) 'MountName': mountName,
      if (perUnitStorageThroughput != null)
        'PerUnitStorageThroughput': perUnitStorageThroughput,
      if (rootSquashConfiguration != null)
        'RootSquashConfiguration': rootSquashConfiguration,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The configuration for Lustre logging used to write the enabled logging
/// events for your Amazon FSx for Lustre file system or Amazon File Cache
/// resource to Amazon CloudWatch Logs.
class LustreLogConfiguration {
  /// The data repository events that are logged by Amazon FSx.
  ///
  /// <ul>
  /// <li>
  /// <code>WARN_ONLY</code> - only warning events are logged.
  /// </li>
  /// <li>
  /// <code>ERROR_ONLY</code> - only error events are logged.
  /// </li>
  /// <li>
  /// <code>WARN_ERROR</code> - both warning events and error events are logged.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - logging of data repository events is turned off.
  /// </li>
  /// </ul>
  /// Note that Amazon File Cache uses a default setting of
  /// <code>WARN_ERROR</code>, which can't be changed.
  final LustreAccessAuditLogLevel level;

  /// The Amazon Resource Name (ARN) that specifies the destination of the logs.
  /// The destination can be any Amazon CloudWatch Logs log group ARN. The
  /// destination ARN must be in the same Amazon Web Services partition, Amazon
  /// Web Services Region, and Amazon Web Services account as your Amazon FSx file
  /// system.
  final String? destination;

  LustreLogConfiguration({
    required this.level,
    this.destination,
  });

  factory LustreLogConfiguration.fromJson(Map<String, dynamic> json) {
    return LustreLogConfiguration(
      level: (json['Level'] as String).toLustreAccessAuditLogLevel(),
      destination: json['Destination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final level = this.level;
    final destination = this.destination;
    return {
      'Level': level.toValue(),
      if (destination != null) 'Destination': destination,
    };
  }
}

/// The Lustre logging configuration used when creating or updating an Amazon
/// FSx for Lustre file system. An Amazon File Cache is created with Lustre
/// logging enabled by default, with a setting of <code>WARN_ERROR</code> for
/// the logging events. which can't be changed.
///
/// Lustre logging writes the enabled logging events for your file system or
/// cache to Amazon CloudWatch Logs.
class LustreLogCreateConfiguration {
  /// Sets which data repository events are logged by Amazon FSx.
  ///
  /// <ul>
  /// <li>
  /// <code>WARN_ONLY</code> - only warning events are logged.
  /// </li>
  /// <li>
  /// <code>ERROR_ONLY</code> - only error events are logged.
  /// </li>
  /// <li>
  /// <code>WARN_ERROR</code> - both warning events and error events are logged.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - logging of data repository events is turned off.
  /// </li>
  /// </ul>
  final LustreAccessAuditLogLevel level;

  /// The Amazon Resource Name (ARN) that specifies the destination of the logs.
  ///
  /// The destination can be any Amazon CloudWatch Logs log group ARN, with the
  /// following requirements:
  ///
  /// <ul>
  /// <li>
  /// The destination ARN that you provide must be in the same Amazon Web Services
  /// partition, Amazon Web Services Region, and Amazon Web Services account as
  /// your Amazon FSx file system.
  /// </li>
  /// <li>
  /// The name of the Amazon CloudWatch Logs log group must begin with the
  /// <code>/aws/fsx</code> prefix.
  /// </li>
  /// <li>
  /// If you do not provide a destination, Amazon FSx will create and use a log
  /// stream in the CloudWatch Logs <code>/aws/fsx/lustre</code> log group (for
  /// Amazon FSx for Lustre) or <code>/aws/fsx/filecache</code> (for Amazon File
  /// Cache).
  /// </li>
  /// <li>
  /// If <code>Destination</code> is provided and the resource does not exist, the
  /// request will fail with a <code>BadRequest</code> error.
  /// </li>
  /// <li>
  /// If <code>Level</code> is set to <code>DISABLED</code>, you cannot specify a
  /// destination in <code>Destination</code>.
  /// </li>
  /// </ul>
  final String? destination;

  LustreLogCreateConfiguration({
    required this.level,
    this.destination,
  });

  Map<String, dynamic> toJson() {
    final level = this.level;
    final destination = this.destination;
    return {
      'Level': level.toValue(),
      if (destination != null) 'Destination': destination,
    };
  }
}

/// The configuration for Lustre root squash used to restrict root-level access
/// from clients that try to access your FSx for Lustre file system as root. Use
/// the <code>RootSquash</code> parameter to enable root squash. To learn more
/// about Lustre root squash, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/root-squash.html">Lustre
/// root squash</a>.
///
/// You can also use the <code>NoSquashNids</code> parameter to provide an array
/// of clients who are not affected by the root squash setting. These clients
/// will access the file system as root, with unrestricted privileges.
class LustreRootSquashConfiguration {
  /// When root squash is enabled, you can optionally specify an array of NIDs of
  /// clients for which root squash does not apply. A client NID is a Lustre
  /// Network Identifier used to uniquely identify a client. You can specify the
  /// NID as either a single address or a range of addresses:
  ///
  /// <ul>
  /// <li>
  /// A single address is described in standard Lustre NID format by specifying
  /// the client’s IP address followed by the Lustre network ID (for example,
  /// <code>10.0.1.6@tcp</code>).
  /// </li>
  /// <li>
  /// An address range is described using a dash to separate the range (for
  /// example, <code>10.0.[2-10].[1-255]@tcp</code>).
  /// </li>
  /// </ul>
  final List<String>? noSquashNids;

  /// You enable root squash by setting a user ID (UID) and group ID (GID) for the
  /// file system in the format <code>UID:GID</code> (for example,
  /// <code>365534:65534</code>). The UID and GID values can range from
  /// <code>0</code> to <code>4294967294</code>:
  ///
  /// <ul>
  /// <li>
  /// A non-zero value for UID and GID enables root squash. The UID and GID values
  /// can be different, but each must be a non-zero value.
  /// </li>
  /// <li>
  /// A value of <code>0</code> (zero) for UID and GID indicates root, and
  /// therefore disables root squash.
  /// </li>
  /// </ul>
  /// When root squash is enabled, the user ID and group ID of a root user
  /// accessing the file system are re-mapped to the UID and GID you provide.
  final String? rootSquash;

  LustreRootSquashConfiguration({
    this.noSquashNids,
    this.rootSquash,
  });

  factory LustreRootSquashConfiguration.fromJson(Map<String, dynamic> json) {
    return LustreRootSquashConfiguration(
      noSquashNids: (json['NoSquashNids'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      rootSquash: json['RootSquash'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final noSquashNids = this.noSquashNids;
    final rootSquash = this.rootSquash;
    return {
      if (noSquashNids != null) 'NoSquashNids': noSquashNids,
      if (rootSquash != null) 'RootSquash': rootSquash,
    };
  }
}

/// The configuration for a data repository association that links an Amazon
/// File Cache resource to an NFS data repository.
class NFSDataRepositoryConfiguration {
  /// The version of the NFS (Network File System) protocol of the NFS data
  /// repository. Currently, the only supported value is <code>NFS3</code>, which
  /// indicates that the data repository must support the NFSv3 protocol.
  final NfsVersion version;

  /// This parameter is not supported for Amazon File Cache.
  final AutoExportPolicy? autoExportPolicy;

  /// A list of up to 2 IP addresses of DNS servers used to resolve the NFS file
  /// system domain name. The provided IP addresses can either be the IP addresses
  /// of a DNS forwarder or resolver that the customer manages and runs inside the
  /// customer VPC, or the IP addresses of the on-premises DNS servers.
  final List<String>? dnsIps;

  NFSDataRepositoryConfiguration({
    required this.version,
    this.autoExportPolicy,
    this.dnsIps,
  });

  factory NFSDataRepositoryConfiguration.fromJson(Map<String, dynamic> json) {
    return NFSDataRepositoryConfiguration(
      version: (json['Version'] as String).toNfsVersion(),
      autoExportPolicy: json['AutoExportPolicy'] != null
          ? AutoExportPolicy.fromJson(
              json['AutoExportPolicy'] as Map<String, dynamic>)
          : null,
      dnsIps: (json['DnsIps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final version = this.version;
    final autoExportPolicy = this.autoExportPolicy;
    final dnsIps = this.dnsIps;
    return {
      'Version': version.toValue(),
      if (autoExportPolicy != null) 'AutoExportPolicy': autoExportPolicy,
      if (dnsIps != null) 'DnsIps': dnsIps,
    };
  }
}

enum NfsVersion {
  nfs3,
}

extension NfsVersionValueExtension on NfsVersion {
  String toValue() {
    switch (this) {
      case NfsVersion.nfs3:
        return 'NFS3';
    }
  }
}

extension NfsVersionFromString on String {
  NfsVersion toNfsVersion() {
    switch (this) {
      case 'NFS3':
        return NfsVersion.nfs3;
    }
    throw Exception('$this is not known in enum NfsVersion');
  }
}

enum OntapDeploymentType {
  multiAz_1,
  singleAz_1,
  singleAz_2,
}

extension OntapDeploymentTypeValueExtension on OntapDeploymentType {
  String toValue() {
    switch (this) {
      case OntapDeploymentType.multiAz_1:
        return 'MULTI_AZ_1';
      case OntapDeploymentType.singleAz_1:
        return 'SINGLE_AZ_1';
      case OntapDeploymentType.singleAz_2:
        return 'SINGLE_AZ_2';
    }
  }
}

extension OntapDeploymentTypeFromString on String {
  OntapDeploymentType toOntapDeploymentType() {
    switch (this) {
      case 'MULTI_AZ_1':
        return OntapDeploymentType.multiAz_1;
      case 'SINGLE_AZ_1':
        return OntapDeploymentType.singleAz_1;
      case 'SINGLE_AZ_2':
        return OntapDeploymentType.singleAz_2;
    }
    throw Exception('$this is not known in enum OntapDeploymentType');
  }
}

/// Configuration for the FSx for NetApp ONTAP file system.
class OntapFileSystemConfiguration {
  final int? automaticBackupRetentionDays;
  final String? dailyAutomaticBackupStartTime;

  /// Specifies the FSx for ONTAP file system deployment type in use in the file
  /// system.
  ///
  /// <ul>
  /// <li>
  /// <code>MULTI_AZ_1</code> - (Default) A high availability file system
  /// configured for Multi-AZ redundancy to tolerate temporary Availability Zone
  /// (AZ) unavailability.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_1</code> - A file system configured for Single-AZ
  /// redundancy.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_2</code> - A file system configured with multiple
  /// high-availability (HA) pairs for Single-AZ redundancy.
  /// </li>
  /// </ul>
  /// For information about the use cases for Multi-AZ and Single-AZ deployments,
  /// refer to <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/high-availability-multiAZ.html">Choosing
  /// Multi-AZ or Single-AZ file system deployment</a>.
  final OntapDeploymentType? deploymentType;

  /// The SSD IOPS configuration for the ONTAP file system, specifying the number
  /// of provisioned IOPS and the provision mode.
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// (Multi-AZ only) Specifies the IP address range in which the endpoints to
  /// access your file system will be created. By default in the Amazon FSx API,
  /// Amazon FSx selects an unused IP address range for you from the 198.19.*
  /// range. By default in the Amazon FSx console, Amazon FSx chooses the last 64
  /// IP addresses from the VPC’s primary CIDR range to use as the endpoint IP
  /// address range for the file system. You can have overlapping endpoint IP
  /// addresses for file systems deployed in the same VPC/route tables.
  final String? endpointIpAddressRange;

  /// The <code>Management</code> and <code>Intercluster</code> endpoints that are
  /// used to access data or to manage the file system using the NetApp ONTAP CLI,
  /// REST API, or NetApp SnapMirror.
  final FileSystemEndpoints? endpoints;

  /// You can use the <code>fsxadmin</code> user account to access the NetApp
  /// ONTAP CLI and REST API. The password value is always redacted in the
  /// response.
  final String? fsxAdminPassword;

  /// Specifies how many high-availability (HA) file server pairs the file system
  /// will have. The default value is 1. The value of this property affects the
  /// values of <code>StorageCapacity</code>, <code>Iops</code>, and
  /// <code>ThroughputCapacity</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/HA-pairs.html">High-availability
  /// (HA) pairs</a> in the FSx for ONTAP user guide.
  ///
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>HAPairs</code> is less than 1 or greater than 12.
  /// </li>
  /// <li>
  /// The value of <code>HAPairs</code> is greater than 1 and the value of
  /// <code>DeploymentType</code> is <code>SINGLE_AZ_1</code> or
  /// <code>MULTI_AZ_1</code>.
  /// </li>
  /// </ul>
  final int? hAPairs;
  final String? preferredSubnetId;

  /// (Multi-AZ only) The VPC route tables in which your file system's endpoints
  /// are created.
  final List<String>? routeTableIds;
  final int? throughputCapacity;

  /// Use to choose the throughput capacity per HA pair. When the value of
  /// <code>HAPairs</code> is equal to 1, the value of
  /// <code>ThroughputCapacityPerHAPair</code> is the total throughput for the
  /// file system.
  ///
  /// This field and <code>ThroughputCapacity</code> cannot be defined in the same
  /// API call, but one is required.
  ///
  /// This field and <code>ThroughputCapacity</code> are the same for file systems
  /// with one HA pair.
  ///
  /// <ul>
  /// <li>
  /// For <code>SINGLE_AZ_1</code> and <code>MULTI_AZ_1</code>, valid values are
  /// 128, 256, 512, 1024, 2048, or 4096 MBps.
  /// </li>
  /// <li>
  /// For <code>SINGLE_AZ_2</code>, valid values are 3072 or 6144 MBps.
  /// </li>
  /// </ul>
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>ThroughputCapacity</code> and
  /// <code>ThroughputCapacityPerHAPair</code> are not the same value.
  /// </li>
  /// <li>
  /// The value of deployment type is <code>SINGLE_AZ_2</code> and
  /// <code>ThroughputCapacity</code> / <code>ThroughputCapacityPerHAPair</code>
  /// is a valid HA pair (a value between 2 and 12).
  /// </li>
  /// <li>
  /// The value of <code>ThroughputCapacityPerHAPair</code> is not a valid value.
  /// </li>
  /// </ul>
  final int? throughputCapacityPerHAPair;
  final String? weeklyMaintenanceStartTime;

  OntapFileSystemConfiguration({
    this.automaticBackupRetentionDays,
    this.dailyAutomaticBackupStartTime,
    this.deploymentType,
    this.diskIopsConfiguration,
    this.endpointIpAddressRange,
    this.endpoints,
    this.fsxAdminPassword,
    this.hAPairs,
    this.preferredSubnetId,
    this.routeTableIds,
    this.throughputCapacity,
    this.throughputCapacityPerHAPair,
    this.weeklyMaintenanceStartTime,
  });

  factory OntapFileSystemConfiguration.fromJson(Map<String, dynamic> json) {
    return OntapFileSystemConfiguration(
      automaticBackupRetentionDays:
          json['AutomaticBackupRetentionDays'] as int?,
      dailyAutomaticBackupStartTime:
          json['DailyAutomaticBackupStartTime'] as String?,
      deploymentType:
          (json['DeploymentType'] as String?)?.toOntapDeploymentType(),
      diskIopsConfiguration: json['DiskIopsConfiguration'] != null
          ? DiskIopsConfiguration.fromJson(
              json['DiskIopsConfiguration'] as Map<String, dynamic>)
          : null,
      endpointIpAddressRange: json['EndpointIpAddressRange'] as String?,
      endpoints: json['Endpoints'] != null
          ? FileSystemEndpoints.fromJson(
              json['Endpoints'] as Map<String, dynamic>)
          : null,
      fsxAdminPassword: json['FsxAdminPassword'] as String?,
      hAPairs: json['HAPairs'] as int?,
      preferredSubnetId: json['PreferredSubnetId'] as String?,
      routeTableIds: (json['RouteTableIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      throughputCapacity: json['ThroughputCapacity'] as int?,
      throughputCapacityPerHAPair: json['ThroughputCapacityPerHAPair'] as int?,
      weeklyMaintenanceStartTime: json['WeeklyMaintenanceStartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final deploymentType = this.deploymentType;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final endpointIpAddressRange = this.endpointIpAddressRange;
    final endpoints = this.endpoints;
    final fsxAdminPassword = this.fsxAdminPassword;
    final hAPairs = this.hAPairs;
    final preferredSubnetId = this.preferredSubnetId;
    final routeTableIds = this.routeTableIds;
    final throughputCapacity = this.throughputCapacity;
    final throughputCapacityPerHAPair = this.throughputCapacityPerHAPair;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (endpointIpAddressRange != null)
        'EndpointIpAddressRange': endpointIpAddressRange,
      if (endpoints != null) 'Endpoints': endpoints,
      if (fsxAdminPassword != null) 'FsxAdminPassword': fsxAdminPassword,
      if (hAPairs != null) 'HAPairs': hAPairs,
      if (preferredSubnetId != null) 'PreferredSubnetId': preferredSubnetId,
      if (routeTableIds != null) 'RouteTableIds': routeTableIds,
      if (throughputCapacity != null) 'ThroughputCapacity': throughputCapacity,
      if (throughputCapacityPerHAPair != null)
        'ThroughputCapacityPerHAPair': throughputCapacityPerHAPair,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The configuration of an Amazon FSx for NetApp ONTAP volume.
class OntapVolumeConfiguration {
  /// This structure specifies configuration options for a volume’s storage
  /// aggregate or aggregates.
  final AggregateConfiguration? aggregateConfiguration;

  /// A boolean flag indicating whether tags for the volume should be copied to
  /// backups. This value defaults to false. If it's set to true, all tags for the
  /// volume are copied to all automatic and user-initiated backups where the user
  /// doesn't specify tags. If this value is true, and you specify one or more
  /// tags, only the specified tags are copied to backups. If you specify one or
  /// more tags when creating a user-initiated backup, no tags are copied from the
  /// volume, regardless of this value.
  final bool? copyTagsToBackups;

  /// Specifies the FlexCache endpoint type of the volume. Valid values are the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> specifies that the volume doesn't have a FlexCache
  /// configuration. <code>NONE</code> is the default.
  /// </li>
  /// <li>
  /// <code>ORIGIN</code> specifies that the volume is the origin volume for a
  /// FlexCache volume.
  /// </li>
  /// <li>
  /// <code>CACHE</code> specifies that the volume is a FlexCache volume.
  /// </li>
  /// </ul>
  final FlexCacheEndpointType? flexCacheEndpointType;

  /// Specifies the directory that network-attached storage (NAS) clients use to
  /// mount the volume, along with the storage virtual machine (SVM) Domain Name
  /// System (DNS) name or IP address. You can create a <code>JunctionPath</code>
  /// directly below a parent volume junction or on a directory within a volume. A
  /// <code>JunctionPath</code> for a volume named <code>vol3</code> might be
  /// <code>/vol1/vol2/vol3</code>, or <code>/vol1/dir2/vol3</code>, or even
  /// <code>/dir1/dir2/vol3</code>.
  final String? junctionPath;

  /// Specifies the type of volume. Valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>RW</code> specifies a read/write volume. <code>RW</code> is the
  /// default.
  /// </li>
  /// <li>
  /// <code>DP</code> specifies a data-protection volume. You can protect data by
  /// replicating it to data-protection mirror copies. If a disaster occurs, you
  /// can use these data-protection mirror copies to recover data.
  /// </li>
  /// <li>
  /// <code>LS</code> specifies a load-sharing mirror volume. A load-sharing
  /// mirror reduces the network traffic to a FlexVol volume by providing
  /// additional read-only access to clients.
  /// </li>
  /// </ul>
  final OntapVolumeType? ontapVolumeType;

  /// The security style for the volume, which can be <code>UNIX</code>,
  /// <code>NTFS</code>, or <code>MIXED</code>.
  final SecurityStyle? securityStyle;

  /// The configured size of the volume, in bytes.
  final int? sizeInBytes;

  /// The configured size of the volume, in megabytes (MBs).
  final int? sizeInMegabytes;

  /// The SnapLock configuration object for an FSx for ONTAP SnapLock volume.
  final SnaplockConfiguration? snaplockConfiguration;

  /// Specifies the snapshot policy for the volume. There are three built-in
  /// snapshot policies:
  ///
  /// <ul>
  /// <li>
  /// <code>default</code>: This is the default policy. A maximum of six hourly
  /// snapshots taken five minutes past the hour. A maximum of two daily snapshots
  /// taken Monday through Saturday at 10 minutes after midnight. A maximum of two
  /// weekly snapshots taken every Sunday at 15 minutes after midnight.
  /// </li>
  /// <li>
  /// <code>default-1weekly</code>: This policy is the same as the
  /// <code>default</code> policy except that it only retains one snapshot from
  /// the weekly schedule.
  /// </li>
  /// <li>
  /// <code>none</code>: This policy does not take any snapshots. This policy can
  /// be assigned to volumes to prevent automatic snapshots from being taken.
  /// </li>
  /// </ul>
  /// You can also provide the name of a custom policy that you created with the
  /// ONTAP CLI or REST API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snapshots-ontap.html#snapshot-policies">Snapshot
  /// policies</a> in the Amazon FSx for NetApp ONTAP User Guide.
  final String? snapshotPolicy;

  /// The volume's storage efficiency setting.
  final bool? storageEfficiencyEnabled;

  /// The ID of the volume's storage virtual machine.
  final String? storageVirtualMachineId;

  /// A Boolean flag indicating whether this volume is the root volume for its
  /// storage virtual machine (SVM). Only one volume on an SVM can be the root
  /// volume. This value defaults to <code>false</code>. If this value is
  /// <code>true</code>, then this is the SVM root volume.
  ///
  /// This flag is useful when you're deleting an SVM, because you must first
  /// delete all non-root volumes. This flag, when set to <code>false</code>,
  /// helps you identify which volumes to delete before you can delete the SVM.
  final bool? storageVirtualMachineRoot;

  /// The volume's <code>TieringPolicy</code> setting.
  final TieringPolicy? tieringPolicy;

  /// The volume's universally unique identifier (UUID).
  final String? uuid;

  /// Use to specify the style of an ONTAP volume. For more information about
  /// FlexVols and FlexGroups, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/volume-types.html">Volume
  /// types</a> in Amazon FSx for NetApp ONTAP User Guide.
  final VolumeStyle? volumeStyle;

  OntapVolumeConfiguration({
    this.aggregateConfiguration,
    this.copyTagsToBackups,
    this.flexCacheEndpointType,
    this.junctionPath,
    this.ontapVolumeType,
    this.securityStyle,
    this.sizeInBytes,
    this.sizeInMegabytes,
    this.snaplockConfiguration,
    this.snapshotPolicy,
    this.storageEfficiencyEnabled,
    this.storageVirtualMachineId,
    this.storageVirtualMachineRoot,
    this.tieringPolicy,
    this.uuid,
    this.volumeStyle,
  });

  factory OntapVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return OntapVolumeConfiguration(
      aggregateConfiguration: json['AggregateConfiguration'] != null
          ? AggregateConfiguration.fromJson(
              json['AggregateConfiguration'] as Map<String, dynamic>)
          : null,
      copyTagsToBackups: json['CopyTagsToBackups'] as bool?,
      flexCacheEndpointType:
          (json['FlexCacheEndpointType'] as String?)?.toFlexCacheEndpointType(),
      junctionPath: json['JunctionPath'] as String?,
      ontapVolumeType:
          (json['OntapVolumeType'] as String?)?.toOntapVolumeType(),
      securityStyle: (json['SecurityStyle'] as String?)?.toSecurityStyle(),
      sizeInBytes: json['SizeInBytes'] as int?,
      sizeInMegabytes: json['SizeInMegabytes'] as int?,
      snaplockConfiguration: json['SnaplockConfiguration'] != null
          ? SnaplockConfiguration.fromJson(
              json['SnaplockConfiguration'] as Map<String, dynamic>)
          : null,
      snapshotPolicy: json['SnapshotPolicy'] as String?,
      storageEfficiencyEnabled: json['StorageEfficiencyEnabled'] as bool?,
      storageVirtualMachineId: json['StorageVirtualMachineId'] as String?,
      storageVirtualMachineRoot: json['StorageVirtualMachineRoot'] as bool?,
      tieringPolicy: json['TieringPolicy'] != null
          ? TieringPolicy.fromJson(
              json['TieringPolicy'] as Map<String, dynamic>)
          : null,
      uuid: json['UUID'] as String?,
      volumeStyle: (json['VolumeStyle'] as String?)?.toVolumeStyle(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregateConfiguration = this.aggregateConfiguration;
    final copyTagsToBackups = this.copyTagsToBackups;
    final flexCacheEndpointType = this.flexCacheEndpointType;
    final junctionPath = this.junctionPath;
    final ontapVolumeType = this.ontapVolumeType;
    final securityStyle = this.securityStyle;
    final sizeInBytes = this.sizeInBytes;
    final sizeInMegabytes = this.sizeInMegabytes;
    final snaplockConfiguration = this.snaplockConfiguration;
    final snapshotPolicy = this.snapshotPolicy;
    final storageEfficiencyEnabled = this.storageEfficiencyEnabled;
    final storageVirtualMachineId = this.storageVirtualMachineId;
    final storageVirtualMachineRoot = this.storageVirtualMachineRoot;
    final tieringPolicy = this.tieringPolicy;
    final uuid = this.uuid;
    final volumeStyle = this.volumeStyle;
    return {
      if (aggregateConfiguration != null)
        'AggregateConfiguration': aggregateConfiguration,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (flexCacheEndpointType != null)
        'FlexCacheEndpointType': flexCacheEndpointType.toValue(),
      if (junctionPath != null) 'JunctionPath': junctionPath,
      if (ontapVolumeType != null) 'OntapVolumeType': ontapVolumeType.toValue(),
      if (securityStyle != null) 'SecurityStyle': securityStyle.toValue(),
      if (sizeInBytes != null) 'SizeInBytes': sizeInBytes,
      if (sizeInMegabytes != null) 'SizeInMegabytes': sizeInMegabytes,
      if (snaplockConfiguration != null)
        'SnaplockConfiguration': snaplockConfiguration,
      if (snapshotPolicy != null) 'SnapshotPolicy': snapshotPolicy,
      if (storageEfficiencyEnabled != null)
        'StorageEfficiencyEnabled': storageEfficiencyEnabled,
      if (storageVirtualMachineId != null)
        'StorageVirtualMachineId': storageVirtualMachineId,
      if (storageVirtualMachineRoot != null)
        'StorageVirtualMachineRoot': storageVirtualMachineRoot,
      if (tieringPolicy != null) 'TieringPolicy': tieringPolicy,
      if (uuid != null) 'UUID': uuid,
      if (volumeStyle != null) 'VolumeStyle': volumeStyle.toValue(),
    };
  }
}

enum OntapVolumeType {
  rw,
  dp,
  ls,
}

extension OntapVolumeTypeValueExtension on OntapVolumeType {
  String toValue() {
    switch (this) {
      case OntapVolumeType.rw:
        return 'RW';
      case OntapVolumeType.dp:
        return 'DP';
      case OntapVolumeType.ls:
        return 'LS';
    }
  }
}

extension OntapVolumeTypeFromString on String {
  OntapVolumeType toOntapVolumeType() {
    switch (this) {
      case 'RW':
        return OntapVolumeType.rw;
      case 'DP':
        return OntapVolumeType.dp;
      case 'LS':
        return OntapVolumeType.ls;
    }
    throw Exception('$this is not known in enum OntapVolumeType');
  }
}

/// Specifies who can mount an OpenZFS file system and the options available
/// while mounting the file system.
class OpenZFSClientConfiguration {
  /// A value that specifies who can mount the file system. You can provide a
  /// wildcard character (<code>*</code>), an IP address (<code>0.0.0.0</code>),
  /// or a CIDR address (<code>192.0.2.0/24</code>). By default, Amazon FSx uses
  /// the wildcard character when specifying the client.
  final String clients;

  /// The options to use when mounting the file system. For a list of options that
  /// you can use with Network File System (NFS), see the <a
  /// href="https://linux.die.net/man/5/exports">exports(5) - Linux man page</a>.
  /// When choosing your options, consider the following:
  ///
  /// <ul>
  /// <li>
  /// <code>crossmnt</code> is used by default. If you don't specify
  /// <code>crossmnt</code> when changing the client configuration, you won't be
  /// able to see or access snapshots in your file system's snapshot directory.
  /// </li>
  /// <li>
  /// <code>sync</code> is used by default. If you instead specify
  /// <code>async</code>, the system acknowledges writes before writing to disk.
  /// If the system crashes before the writes are finished, you lose the unwritten
  /// data.
  /// </li>
  /// </ul>
  final List<String> options;

  OpenZFSClientConfiguration({
    required this.clients,
    required this.options,
  });

  factory OpenZFSClientConfiguration.fromJson(Map<String, dynamic> json) {
    return OpenZFSClientConfiguration(
      clients: json['Clients'] as String,
      options: (json['Options'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clients = this.clients;
    final options = this.options;
    return {
      'Clients': clients,
      'Options': options,
    };
  }
}

enum OpenZFSCopyStrategy {
  clone,
  fullCopy,
  incrementalCopy,
}

extension OpenZFSCopyStrategyValueExtension on OpenZFSCopyStrategy {
  String toValue() {
    switch (this) {
      case OpenZFSCopyStrategy.clone:
        return 'CLONE';
      case OpenZFSCopyStrategy.fullCopy:
        return 'FULL_COPY';
      case OpenZFSCopyStrategy.incrementalCopy:
        return 'INCREMENTAL_COPY';
    }
  }
}

extension OpenZFSCopyStrategyFromString on String {
  OpenZFSCopyStrategy toOpenZFSCopyStrategy() {
    switch (this) {
      case 'CLONE':
        return OpenZFSCopyStrategy.clone;
      case 'FULL_COPY':
        return OpenZFSCopyStrategy.fullCopy;
      case 'INCREMENTAL_COPY':
        return OpenZFSCopyStrategy.incrementalCopy;
    }
    throw Exception('$this is not known in enum OpenZFSCopyStrategy');
  }
}

/// The configuration of an Amazon FSx for OpenZFS root volume.
class OpenZFSCreateRootVolumeConfiguration {
  /// A Boolean value indicating whether tags for the volume should be copied to
  /// snapshots of the volume. This value defaults to <code>false</code>. If it's
  /// set to <code>true</code>, all tags for the volume are copied to snapshots
  /// where the user doesn't specify tags. If this value is <code>true</code> and
  /// you specify one or more tags, only the specified tags are copied to
  /// snapshots. If you specify one or more tags when creating the snapshot, no
  /// tags are copied from the volume, regardless of this value.
  final bool? copyTagsToSnapshots;

  /// Specifies the method used to compress the data on the volume. The
  /// compression type is <code>NONE</code> by default.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - Doesn't compress the data on the volume.
  /// <code>NONE</code> is the default.
  /// </li>
  /// <li>
  /// <code>ZSTD</code> - Compresses the data in the volume using the Zstandard
  /// (ZSTD) compression algorithm. Compared to LZ4, Z-Standard provides a better
  /// compression ratio to minimize on-disk storage utilization.
  /// </li>
  /// <li>
  /// <code>LZ4</code> - Compresses the data in the volume using the LZ4
  /// compression algorithm. Compared to Z-Standard, LZ4 is less compute-intensive
  /// and delivers higher write throughput speeds.
  /// </li>
  /// </ul>
  final OpenZFSDataCompressionType? dataCompressionType;

  /// The configuration object for mounting a file system.
  final List<OpenZFSNfsExport>? nfsExports;

  /// A Boolean value indicating whether the volume is read-only. Setting this
  /// value to <code>true</code> can be useful after you have completed changes to
  /// a volume and no longer want changes to occur.
  final bool? readOnly;

  /// Specifies the record size of an OpenZFS root volume, in kibibytes (KiB).
  /// Valid values are 4, 8, 16, 32, 64, 128, 256, 512, or 1024 KiB. The default
  /// is 128 KiB. Most workloads should use the default record size. Database
  /// workflows can benefit from a smaller record size, while streaming workflows
  /// can benefit from a larger record size. For additional guidance on setting a
  /// custom record size, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#performance-tips-zfs">
  /// Tips for maximizing performance</a> in the <i>Amazon FSx for OpenZFS User
  /// Guide</i>.
  final int? recordSizeKiB;

  /// An object specifying how much storage users or groups can use on the volume.
  final List<OpenZFSUserOrGroupQuota>? userAndGroupQuotas;

  OpenZFSCreateRootVolumeConfiguration({
    this.copyTagsToSnapshots,
    this.dataCompressionType,
    this.nfsExports,
    this.readOnly,
    this.recordSizeKiB,
    this.userAndGroupQuotas,
  });

  Map<String, dynamic> toJson() {
    final copyTagsToSnapshots = this.copyTagsToSnapshots;
    final dataCompressionType = this.dataCompressionType;
    final nfsExports = this.nfsExports;
    final readOnly = this.readOnly;
    final recordSizeKiB = this.recordSizeKiB;
    final userAndGroupQuotas = this.userAndGroupQuotas;
    return {
      if (copyTagsToSnapshots != null)
        'CopyTagsToSnapshots': copyTagsToSnapshots,
      if (dataCompressionType != null)
        'DataCompressionType': dataCompressionType.toValue(),
      if (nfsExports != null) 'NfsExports': nfsExports,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (recordSizeKiB != null) 'RecordSizeKiB': recordSizeKiB,
      if (userAndGroupQuotas != null) 'UserAndGroupQuotas': userAndGroupQuotas,
    };
  }
}

enum OpenZFSDataCompressionType {
  none,
  zstd,
  lz4,
}

extension OpenZFSDataCompressionTypeValueExtension
    on OpenZFSDataCompressionType {
  String toValue() {
    switch (this) {
      case OpenZFSDataCompressionType.none:
        return 'NONE';
      case OpenZFSDataCompressionType.zstd:
        return 'ZSTD';
      case OpenZFSDataCompressionType.lz4:
        return 'LZ4';
    }
  }
}

extension OpenZFSDataCompressionTypeFromString on String {
  OpenZFSDataCompressionType toOpenZFSDataCompressionType() {
    switch (this) {
      case 'NONE':
        return OpenZFSDataCompressionType.none;
      case 'ZSTD':
        return OpenZFSDataCompressionType.zstd;
      case 'LZ4':
        return OpenZFSDataCompressionType.lz4;
    }
    throw Exception('$this is not known in enum OpenZFSDataCompressionType');
  }
}

enum OpenZFSDeploymentType {
  singleAz_1,
  singleAz_2,
  multiAz_1,
}

extension OpenZFSDeploymentTypeValueExtension on OpenZFSDeploymentType {
  String toValue() {
    switch (this) {
      case OpenZFSDeploymentType.singleAz_1:
        return 'SINGLE_AZ_1';
      case OpenZFSDeploymentType.singleAz_2:
        return 'SINGLE_AZ_2';
      case OpenZFSDeploymentType.multiAz_1:
        return 'MULTI_AZ_1';
    }
  }
}

extension OpenZFSDeploymentTypeFromString on String {
  OpenZFSDeploymentType toOpenZFSDeploymentType() {
    switch (this) {
      case 'SINGLE_AZ_1':
        return OpenZFSDeploymentType.singleAz_1;
      case 'SINGLE_AZ_2':
        return OpenZFSDeploymentType.singleAz_2;
      case 'MULTI_AZ_1':
        return OpenZFSDeploymentType.multiAz_1;
    }
    throw Exception('$this is not known in enum OpenZFSDeploymentType');
  }
}

/// The configuration for the Amazon FSx for OpenZFS file system.
class OpenZFSFileSystemConfiguration {
  final int? automaticBackupRetentionDays;

  /// A Boolean value indicating whether tags on the file system should be copied
  /// to backups. If it's set to <code>true</code>, all tags on the file system
  /// are copied to all automatic backups and any user-initiated backups where the
  /// user doesn't specify any tags. If this value is <code>true</code> and you
  /// specify one or more tags, only the specified tags are copied to backups. If
  /// you specify one or more tags when creating a user-initiated backup, no tags
  /// are copied from the file system, regardless of this value.
  final bool? copyTagsToBackups;

  /// A Boolean value indicating whether tags for the volume should be copied to
  /// snapshots. This value defaults to <code>false</code>. If it's set to
  /// <code>true</code>, all tags for the volume are copied to snapshots where the
  /// user doesn't specify tags. If this value is <code>true</code> and you
  /// specify one or more tags, only the specified tags are copied to snapshots.
  /// If you specify one or more tags when creating the snapshot, no tags are
  /// copied from the volume, regardless of this value.
  final bool? copyTagsToVolumes;
  final String? dailyAutomaticBackupStartTime;

  /// Specifies the file-system deployment type. Amazon FSx for OpenZFS
  /// supports&#x2028; <code>MULTI_AZ_1</code>, <code>SINGLE_AZ_1</code>, and
  /// <code>SINGLE_AZ_2</code>.
  final OpenZFSDeploymentType? deploymentType;
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// The IP address of the endpoint that is used to access data or to manage the
  /// file system.
  final String? endpointIpAddress;

  /// (Multi-AZ only) Specifies the IP address range in which the endpoints to
  /// access your file system will be created. By default in the Amazon FSx API
  /// and Amazon FSx console, Amazon FSx selects an available /28 IP address range
  /// for you from one of the VPC's CIDR ranges. You can have overlapping endpoint
  /// IP addresses for file systems deployed in the same VPC/route tables.
  final String? endpointIpAddressRange;

  /// Required when <code>DeploymentType</code> is set to <code>MULTI_AZ_1</code>.
  /// This specifies the subnet in which you want the preferred file server to be
  /// located.
  final String? preferredSubnetId;

  /// The ID of the root volume of the OpenZFS file system.
  final String? rootVolumeId;

  /// (Multi-AZ only) The VPC route tables in which your file system's endpoints
  /// are created.
  final List<String>? routeTableIds;

  /// The throughput of an Amazon FSx file system, measured in megabytes per
  /// second (MBps).
  final int? throughputCapacity;
  final String? weeklyMaintenanceStartTime;

  OpenZFSFileSystemConfiguration({
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.copyTagsToVolumes,
    this.dailyAutomaticBackupStartTime,
    this.deploymentType,
    this.diskIopsConfiguration,
    this.endpointIpAddress,
    this.endpointIpAddressRange,
    this.preferredSubnetId,
    this.rootVolumeId,
    this.routeTableIds,
    this.throughputCapacity,
    this.weeklyMaintenanceStartTime,
  });

  factory OpenZFSFileSystemConfiguration.fromJson(Map<String, dynamic> json) {
    return OpenZFSFileSystemConfiguration(
      automaticBackupRetentionDays:
          json['AutomaticBackupRetentionDays'] as int?,
      copyTagsToBackups: json['CopyTagsToBackups'] as bool?,
      copyTagsToVolumes: json['CopyTagsToVolumes'] as bool?,
      dailyAutomaticBackupStartTime:
          json['DailyAutomaticBackupStartTime'] as String?,
      deploymentType:
          (json['DeploymentType'] as String?)?.toOpenZFSDeploymentType(),
      diskIopsConfiguration: json['DiskIopsConfiguration'] != null
          ? DiskIopsConfiguration.fromJson(
              json['DiskIopsConfiguration'] as Map<String, dynamic>)
          : null,
      endpointIpAddress: json['EndpointIpAddress'] as String?,
      endpointIpAddressRange: json['EndpointIpAddressRange'] as String?,
      preferredSubnetId: json['PreferredSubnetId'] as String?,
      rootVolumeId: json['RootVolumeId'] as String?,
      routeTableIds: (json['RouteTableIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      throughputCapacity: json['ThroughputCapacity'] as int?,
      weeklyMaintenanceStartTime: json['WeeklyMaintenanceStartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final copyTagsToBackups = this.copyTagsToBackups;
    final copyTagsToVolumes = this.copyTagsToVolumes;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final deploymentType = this.deploymentType;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final endpointIpAddress = this.endpointIpAddress;
    final endpointIpAddressRange = this.endpointIpAddressRange;
    final preferredSubnetId = this.preferredSubnetId;
    final rootVolumeId = this.rootVolumeId;
    final routeTableIds = this.routeTableIds;
    final throughputCapacity = this.throughputCapacity;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (copyTagsToVolumes != null) 'CopyTagsToVolumes': copyTagsToVolumes,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (endpointIpAddress != null) 'EndpointIpAddress': endpointIpAddress,
      if (endpointIpAddressRange != null)
        'EndpointIpAddressRange': endpointIpAddressRange,
      if (preferredSubnetId != null) 'PreferredSubnetId': preferredSubnetId,
      if (rootVolumeId != null) 'RootVolumeId': rootVolumeId,
      if (routeTableIds != null) 'RouteTableIds': routeTableIds,
      if (throughputCapacity != null) 'ThroughputCapacity': throughputCapacity,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The Network File System (NFS) configurations for mounting an Amazon FSx for
/// OpenZFS file system.
class OpenZFSNfsExport {
  /// A list of configuration objects that contain the client and options for
  /// mounting the OpenZFS file system.
  final List<OpenZFSClientConfiguration> clientConfigurations;

  OpenZFSNfsExport({
    required this.clientConfigurations,
  });

  factory OpenZFSNfsExport.fromJson(Map<String, dynamic> json) {
    return OpenZFSNfsExport(
      clientConfigurations: (json['ClientConfigurations'] as List)
          .whereNotNull()
          .map((e) =>
              OpenZFSClientConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientConfigurations = this.clientConfigurations;
    return {
      'ClientConfigurations': clientConfigurations,
    };
  }
}

/// The snapshot configuration used when creating an Amazon FSx for OpenZFS
/// volume from a snapshot.
class OpenZFSOriginSnapshotConfiguration {
  /// The strategy used when copying data from the snapshot to the new volume.
  ///
  /// <ul>
  /// <li>
  /// <code>CLONE</code> - The new volume references the data in the origin
  /// snapshot. Cloning a snapshot is faster than copying the data from a snapshot
  /// to a new volume and doesn't consume disk throughput. However, the origin
  /// snapshot can't be deleted if there is a volume using its copied data.
  /// </li>
  /// <li>
  /// <code>FULL_COPY</code> - Copies all data from the snapshot to the new
  /// volume.
  /// </li>
  /// </ul> <note>
  /// The <code>INCREMENTAL_COPY</code> option is only for updating an existing
  /// volume by using a snapshot from another FSx for OpenZFS file system. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_CopySnapshotAndUpdateVolume.html">CopySnapshotAndUpdateVolume</a>.
  /// </note>
  final OpenZFSCopyStrategy? copyStrategy;
  final String? snapshotARN;

  OpenZFSOriginSnapshotConfiguration({
    this.copyStrategy,
    this.snapshotARN,
  });

  factory OpenZFSOriginSnapshotConfiguration.fromJson(
      Map<String, dynamic> json) {
    return OpenZFSOriginSnapshotConfiguration(
      copyStrategy: (json['CopyStrategy'] as String?)?.toOpenZFSCopyStrategy(),
      snapshotARN: json['SnapshotARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyStrategy = this.copyStrategy;
    final snapshotARN = this.snapshotARN;
    return {
      if (copyStrategy != null) 'CopyStrategy': copyStrategy.toValue(),
      if (snapshotARN != null) 'SnapshotARN': snapshotARN,
    };
  }
}

enum OpenZFSQuotaType {
  user,
  group,
}

extension OpenZFSQuotaTypeValueExtension on OpenZFSQuotaType {
  String toValue() {
    switch (this) {
      case OpenZFSQuotaType.user:
        return 'USER';
      case OpenZFSQuotaType.group:
        return 'GROUP';
    }
  }
}

extension OpenZFSQuotaTypeFromString on String {
  OpenZFSQuotaType toOpenZFSQuotaType() {
    switch (this) {
      case 'USER':
        return OpenZFSQuotaType.user;
      case 'GROUP':
        return OpenZFSQuotaType.group;
    }
    throw Exception('$this is not known in enum OpenZFSQuotaType');
  }
}

/// Used to configure quotas that define how much storage a user or group can
/// use on an FSx for OpenZFS volume. For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/managing-volumes.html#volume-properties">Volume
/// properties</a> in the FSx for OpenZFS User Guide.
class OpenZFSUserOrGroupQuota {
  /// The ID of the user or group that the quota applies to.
  final int id;

  /// The user or group's storage quota, in gibibytes (GiB).
  final int storageCapacityQuotaGiB;

  /// Specifies whether the quota applies to a user or group.
  final OpenZFSQuotaType type;

  OpenZFSUserOrGroupQuota({
    required this.id,
    required this.storageCapacityQuotaGiB,
    required this.type,
  });

  factory OpenZFSUserOrGroupQuota.fromJson(Map<String, dynamic> json) {
    return OpenZFSUserOrGroupQuota(
      id: json['Id'] as int,
      storageCapacityQuotaGiB: json['StorageCapacityQuotaGiB'] as int,
      type: (json['Type'] as String).toOpenZFSQuotaType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final storageCapacityQuotaGiB = this.storageCapacityQuotaGiB;
    final type = this.type;
    return {
      'Id': id,
      'StorageCapacityQuotaGiB': storageCapacityQuotaGiB,
      'Type': type.toValue(),
    };
  }
}

/// The configuration of an Amazon FSx for OpenZFS volume.
class OpenZFSVolumeConfiguration {
  /// Specifies the strategy used when copying data from the snapshot to the new
  /// volume.
  ///
  /// <ul>
  /// <li>
  /// <code>CLONE</code> - The new volume references the data in the origin
  /// snapshot. Cloning a snapshot is faster than copying data from the snapshot
  /// to a new volume and doesn't consume disk throughput. However, the origin
  /// snapshot can't be deleted if there is a volume using its copied data.
  /// </li>
  /// <li>
  /// <code>FULL_COPY</code> - Copies all data from the snapshot to the new
  /// volume.
  ///
  /// Specify this option to create the volume from a snapshot on another FSx for
  /// OpenZFS file system.
  /// </li>
  /// </ul> <note>
  /// The <code>INCREMENTAL_COPY</code> option is only for updating an existing
  /// volume by using a snapshot from another FSx for OpenZFS file system. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/APIReference/API_CopySnapshotAndUpdateVolume.html">CopySnapshotAndUpdateVolume</a>.
  /// </note>
  final OpenZFSCopyStrategy? copyStrategy;

  /// A Boolean value indicating whether tags for the volume should be copied to
  /// snapshots. This value defaults to <code>false</code>. If it's set to
  /// <code>true</code>, all tags for the volume are copied to snapshots where the
  /// user doesn't specify tags. If this value is <code>true</code> and you
  /// specify one or more tags, only the specified tags are copied to snapshots.
  /// If you specify one or more tags when creating the snapshot, no tags are
  /// copied from the volume, regardless of this value.
  final bool? copyTagsToSnapshots;

  /// Specifies the method used to compress the data on the volume. The
  /// compression type is <code>NONE</code> by default.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - Doesn't compress the data on the volume.
  /// <code>NONE</code> is the default.
  /// </li>
  /// <li>
  /// <code>ZSTD</code> - Compresses the data in the volume using the Zstandard
  /// (ZSTD) compression algorithm. Compared to LZ4, Z-Standard provides a better
  /// compression ratio to minimize on-disk storage utilization.
  /// </li>
  /// <li>
  /// <code>LZ4</code> - Compresses the data in the volume using the LZ4
  /// compression algorithm. Compared to Z-Standard, LZ4 is less compute-intensive
  /// and delivers higher write throughput speeds.
  /// </li>
  /// </ul>
  final OpenZFSDataCompressionType? dataCompressionType;

  /// A Boolean value indicating whether dependent clone volumes created from
  /// intermediate snapshots should be deleted when a volume is restored from
  /// snapshot.
  final bool? deleteClonedVolumes;

  /// A Boolean value indicating whether snapshot data that differs between the
  /// current state and the specified snapshot should be overwritten when a volume
  /// is restored from a snapshot.
  final bool? deleteIntermediateData;

  /// A Boolean value indicating whether snapshots between the current state and
  /// the specified snapshot should be deleted when a volume is restored from
  /// snapshot.
  final bool? deleteIntermediateSnaphots;

  /// The ID of the snapshot that's being copied or was most recently copied to
  /// the destination volume.
  final String? destinationSnapshot;

  /// The configuration object for mounting a Network File System (NFS) file
  /// system.
  final List<OpenZFSNfsExport>? nfsExports;

  /// The configuration object that specifies the snapshot to use as the origin of
  /// the data for the volume.
  final OpenZFSOriginSnapshotConfiguration? originSnapshot;

  /// The ID of the parent volume.
  final String? parentVolumeId;

  /// A Boolean value indicating whether the volume is read-only.
  final bool? readOnly;

  /// The record size of an OpenZFS volume, in kibibytes (KiB). Valid values are
  /// 4, 8, 16, 32, 64, 128, 256, 512, or 1024 KiB. The default is 128 KiB. Most
  /// workloads should use the default record size. For guidance on when to set a
  /// custom record size, see the <i>Amazon FSx for OpenZFS User Guide</i>.
  final int? recordSizeKiB;

  /// Specifies the ID of the snapshot to which the volume was restored.
  final String? restoreToSnapshot;
  final String? sourceSnapshotARN;

  /// The maximum amount of storage in gibibtyes (GiB) that the volume can use
  /// from its parent. You can specify a quota larger than the storage on the
  /// parent volume.
  final int? storageCapacityQuotaGiB;

  /// The amount of storage in gibibytes (GiB) to reserve from the parent volume.
  /// You can't reserve more storage than the parent volume has reserved.
  final int? storageCapacityReservationGiB;

  /// An object specifying how much storage users or groups can use on the volume.
  final List<OpenZFSUserOrGroupQuota>? userAndGroupQuotas;

  /// The path to the volume from the root volume. For example,
  /// <code>fsx/parentVolume/volume1</code>.
  final String? volumePath;

  OpenZFSVolumeConfiguration({
    this.copyStrategy,
    this.copyTagsToSnapshots,
    this.dataCompressionType,
    this.deleteClonedVolumes,
    this.deleteIntermediateData,
    this.deleteIntermediateSnaphots,
    this.destinationSnapshot,
    this.nfsExports,
    this.originSnapshot,
    this.parentVolumeId,
    this.readOnly,
    this.recordSizeKiB,
    this.restoreToSnapshot,
    this.sourceSnapshotARN,
    this.storageCapacityQuotaGiB,
    this.storageCapacityReservationGiB,
    this.userAndGroupQuotas,
    this.volumePath,
  });

  factory OpenZFSVolumeConfiguration.fromJson(Map<String, dynamic> json) {
    return OpenZFSVolumeConfiguration(
      copyStrategy: (json['CopyStrategy'] as String?)?.toOpenZFSCopyStrategy(),
      copyTagsToSnapshots: json['CopyTagsToSnapshots'] as bool?,
      dataCompressionType: (json['DataCompressionType'] as String?)
          ?.toOpenZFSDataCompressionType(),
      deleteClonedVolumes: json['DeleteClonedVolumes'] as bool?,
      deleteIntermediateData: json['DeleteIntermediateData'] as bool?,
      deleteIntermediateSnaphots: json['DeleteIntermediateSnaphots'] as bool?,
      destinationSnapshot: json['DestinationSnapshot'] as String?,
      nfsExports: (json['NfsExports'] as List?)
          ?.whereNotNull()
          .map((e) => OpenZFSNfsExport.fromJson(e as Map<String, dynamic>))
          .toList(),
      originSnapshot: json['OriginSnapshot'] != null
          ? OpenZFSOriginSnapshotConfiguration.fromJson(
              json['OriginSnapshot'] as Map<String, dynamic>)
          : null,
      parentVolumeId: json['ParentVolumeId'] as String?,
      readOnly: json['ReadOnly'] as bool?,
      recordSizeKiB: json['RecordSizeKiB'] as int?,
      restoreToSnapshot: json['RestoreToSnapshot'] as String?,
      sourceSnapshotARN: json['SourceSnapshotARN'] as String?,
      storageCapacityQuotaGiB: json['StorageCapacityQuotaGiB'] as int?,
      storageCapacityReservationGiB:
          json['StorageCapacityReservationGiB'] as int?,
      userAndGroupQuotas: (json['UserAndGroupQuotas'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OpenZFSUserOrGroupQuota.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumePath: json['VolumePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final copyStrategy = this.copyStrategy;
    final copyTagsToSnapshots = this.copyTagsToSnapshots;
    final dataCompressionType = this.dataCompressionType;
    final deleteClonedVolumes = this.deleteClonedVolumes;
    final deleteIntermediateData = this.deleteIntermediateData;
    final deleteIntermediateSnaphots = this.deleteIntermediateSnaphots;
    final destinationSnapshot = this.destinationSnapshot;
    final nfsExports = this.nfsExports;
    final originSnapshot = this.originSnapshot;
    final parentVolumeId = this.parentVolumeId;
    final readOnly = this.readOnly;
    final recordSizeKiB = this.recordSizeKiB;
    final restoreToSnapshot = this.restoreToSnapshot;
    final sourceSnapshotARN = this.sourceSnapshotARN;
    final storageCapacityQuotaGiB = this.storageCapacityQuotaGiB;
    final storageCapacityReservationGiB = this.storageCapacityReservationGiB;
    final userAndGroupQuotas = this.userAndGroupQuotas;
    final volumePath = this.volumePath;
    return {
      if (copyStrategy != null) 'CopyStrategy': copyStrategy.toValue(),
      if (copyTagsToSnapshots != null)
        'CopyTagsToSnapshots': copyTagsToSnapshots,
      if (dataCompressionType != null)
        'DataCompressionType': dataCompressionType.toValue(),
      if (deleteClonedVolumes != null)
        'DeleteClonedVolumes': deleteClonedVolumes,
      if (deleteIntermediateData != null)
        'DeleteIntermediateData': deleteIntermediateData,
      if (deleteIntermediateSnaphots != null)
        'DeleteIntermediateSnaphots': deleteIntermediateSnaphots,
      if (destinationSnapshot != null)
        'DestinationSnapshot': destinationSnapshot,
      if (nfsExports != null) 'NfsExports': nfsExports,
      if (originSnapshot != null) 'OriginSnapshot': originSnapshot,
      if (parentVolumeId != null) 'ParentVolumeId': parentVolumeId,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (recordSizeKiB != null) 'RecordSizeKiB': recordSizeKiB,
      if (restoreToSnapshot != null) 'RestoreToSnapshot': restoreToSnapshot,
      if (sourceSnapshotARN != null) 'SourceSnapshotARN': sourceSnapshotARN,
      if (storageCapacityQuotaGiB != null)
        'StorageCapacityQuotaGiB': storageCapacityQuotaGiB,
      if (storageCapacityReservationGiB != null)
        'StorageCapacityReservationGiB': storageCapacityReservationGiB,
      if (userAndGroupQuotas != null) 'UserAndGroupQuotas': userAndGroupQuotas,
      if (volumePath != null) 'VolumePath': volumePath,
    };
  }
}

enum PrivilegedDelete {
  disabled,
  enabled,
  permanentlyDisabled,
}

extension PrivilegedDeleteValueExtension on PrivilegedDelete {
  String toValue() {
    switch (this) {
      case PrivilegedDelete.disabled:
        return 'DISABLED';
      case PrivilegedDelete.enabled:
        return 'ENABLED';
      case PrivilegedDelete.permanentlyDisabled:
        return 'PERMANENTLY_DISABLED';
    }
  }
}

extension PrivilegedDeleteFromString on String {
  PrivilegedDelete toPrivilegedDelete() {
    switch (this) {
      case 'DISABLED':
        return PrivilegedDelete.disabled;
      case 'ENABLED':
        return PrivilegedDelete.enabled;
      case 'PERMANENTLY_DISABLED':
        return PrivilegedDelete.permanentlyDisabled;
    }
    throw Exception('$this is not known in enum PrivilegedDelete');
  }
}

/// The configuration that specifies a minimum amount of time since last access
/// for an exported file to be eligible for release from an Amazon FSx for
/// Lustre file system. Only files that were last accessed before this
/// point-in-time can be released. For example, if you specify a last accessed
/// time criteria of 9 days, only files that were last accessed 9.00001 or more
/// days ago can be released.
///
/// Only file data that has been exported to S3 can be released. Files that have
/// not yet been exported to S3, such as new or changed files that have not been
/// exported, are not eligible for release. When files are released, their
/// metadata stays on the file system, so they can still be accessed later.
/// Users and applications can access a released file by reading the file again,
/// which restores data from Amazon S3 to the FSx for Lustre file system.
/// <note>
/// If a file meets the last accessed time criteria, its file or directory path
/// must also be specified with the <code>Paths</code> parameter of the
/// operation in order for the file to be released.
/// </note>
class ReleaseConfiguration {
  /// Defines the point-in-time since an exported file was last accessed, in order
  /// for that file to be eligible for release. Only files that were last accessed
  /// before this point-in-time are eligible to be released from the file system.
  final DurationSinceLastAccess? durationSinceLastAccess;

  ReleaseConfiguration({
    this.durationSinceLastAccess,
  });

  factory ReleaseConfiguration.fromJson(Map<String, dynamic> json) {
    return ReleaseConfiguration(
      durationSinceLastAccess: json['DurationSinceLastAccess'] != null
          ? DurationSinceLastAccess.fromJson(
              json['DurationSinceLastAccess'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final durationSinceLastAccess = this.durationSinceLastAccess;
    return {
      if (durationSinceLastAccess != null)
        'DurationSinceLastAccess': durationSinceLastAccess,
    };
  }
}

class ReleaseFileSystemNfsV3LocksResponse {
  final FileSystem? fileSystem;

  ReleaseFileSystemNfsV3LocksResponse({
    this.fileSystem,
  });

  factory ReleaseFileSystemNfsV3LocksResponse.fromJson(
      Map<String, dynamic> json) {
    return ReleaseFileSystemNfsV3LocksResponse(
      fileSystem: json['FileSystem'] != null
          ? FileSystem.fromJson(json['FileSystem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystem = this.fileSystem;
    return {
      if (fileSystem != null) 'FileSystem': fileSystem,
    };
  }
}

enum ReportFormat {
  reportCsv_20191124,
}

extension ReportFormatValueExtension on ReportFormat {
  String toValue() {
    switch (this) {
      case ReportFormat.reportCsv_20191124:
        return 'REPORT_CSV_20191124';
    }
  }
}

extension ReportFormatFromString on String {
  ReportFormat toReportFormat() {
    switch (this) {
      case 'REPORT_CSV_20191124':
        return ReportFormat.reportCsv_20191124;
    }
    throw Exception('$this is not known in enum ReportFormat');
  }
}

enum ReportScope {
  failedFilesOnly,
}

extension ReportScopeValueExtension on ReportScope {
  String toValue() {
    switch (this) {
      case ReportScope.failedFilesOnly:
        return 'FAILED_FILES_ONLY';
    }
  }
}

extension ReportScopeFromString on String {
  ReportScope toReportScope() {
    switch (this) {
      case 'FAILED_FILES_ONLY':
        return ReportScope.failedFilesOnly;
    }
    throw Exception('$this is not known in enum ReportScope');
  }
}

enum ResourceType {
  fileSystem,
  volume,
}

extension ResourceTypeValueExtension on ResourceType {
  String toValue() {
    switch (this) {
      case ResourceType.fileSystem:
        return 'FILE_SYSTEM';
      case ResourceType.volume:
        return 'VOLUME';
    }
  }
}

extension ResourceTypeFromString on String {
  ResourceType toResourceType() {
    switch (this) {
      case 'FILE_SYSTEM':
        return ResourceType.fileSystem;
      case 'VOLUME':
        return ResourceType.volume;
    }
    throw Exception('$this is not known in enum ResourceType');
  }
}

enum RestoreOpenZFSVolumeOption {
  deleteIntermediateSnapshots,
  deleteClonedVolumes,
}

extension RestoreOpenZFSVolumeOptionValueExtension
    on RestoreOpenZFSVolumeOption {
  String toValue() {
    switch (this) {
      case RestoreOpenZFSVolumeOption.deleteIntermediateSnapshots:
        return 'DELETE_INTERMEDIATE_SNAPSHOTS';
      case RestoreOpenZFSVolumeOption.deleteClonedVolumes:
        return 'DELETE_CLONED_VOLUMES';
    }
  }
}

extension RestoreOpenZFSVolumeOptionFromString on String {
  RestoreOpenZFSVolumeOption toRestoreOpenZFSVolumeOption() {
    switch (this) {
      case 'DELETE_INTERMEDIATE_SNAPSHOTS':
        return RestoreOpenZFSVolumeOption.deleteIntermediateSnapshots;
      case 'DELETE_CLONED_VOLUMES':
        return RestoreOpenZFSVolumeOption.deleteClonedVolumes;
    }
    throw Exception('$this is not known in enum RestoreOpenZFSVolumeOption');
  }
}

class RestoreVolumeFromSnapshotResponse {
  /// A list of administrative actions for the file system that are in process or
  /// waiting to be processed. Administrative actions describe changes to the
  /// Amazon FSx system.
  final List<AdministrativeAction>? administrativeActions;

  /// The lifecycle state of the volume being restored.
  final VolumeLifecycle? lifecycle;

  /// The ID of the volume that you restored.
  final String? volumeId;

  RestoreVolumeFromSnapshotResponse({
    this.administrativeActions,
    this.lifecycle,
    this.volumeId,
  });

  factory RestoreVolumeFromSnapshotResponse.fromJson(
      Map<String, dynamic> json) {
    return RestoreVolumeFromSnapshotResponse(
      administrativeActions: (json['AdministrativeActions'] as List?)
          ?.whereNotNull()
          .map((e) => AdministrativeAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      lifecycle: (json['Lifecycle'] as String?)?.toVolumeLifecycle(),
      volumeId: json['VolumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final administrativeActions = this.administrativeActions;
    final lifecycle = this.lifecycle;
    final volumeId = this.volumeId;
    return {
      if (administrativeActions != null)
        'AdministrativeActions': administrativeActions,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (volumeId != null) 'VolumeId': volumeId,
    };
  }
}

/// Specifies the retention period of an FSx for ONTAP SnapLock volume. After it
/// is set, it can't be changed. Files can't be deleted or modified during the
/// retention period.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-retention.html">Working
/// with the retention period in SnapLock</a>.
class RetentionPeriod {
  /// Defines the type of time for the retention period of an FSx for ONTAP
  /// SnapLock volume. Set it to one of the valid types. If you set it to
  /// <code>INFINITE</code>, the files are retained forever. If you set it to
  /// <code>UNSPECIFIED</code>, the files are retained until you set an explicit
  /// retention period.
  final RetentionPeriodType type;

  /// Defines the amount of time for the retention period of an FSx for ONTAP
  /// SnapLock volume. You can't set a value for <code>INFINITE</code> or
  /// <code>UNSPECIFIED</code>. For all other options, the following ranges are
  /// valid:
  ///
  /// <ul>
  /// <li>
  /// <code>Seconds</code>: 0 - 65,535
  /// </li>
  /// <li>
  /// <code>Minutes</code>: 0 - 65,535
  /// </li>
  /// <li>
  /// <code>Hours</code>: 0 - 24
  /// </li>
  /// <li>
  /// <code>Days</code>: 0 - 365
  /// </li>
  /// <li>
  /// <code>Months</code>: 0 - 12
  /// </li>
  /// <li>
  /// <code>Years</code>: 0 - 100
  /// </li>
  /// </ul>
  final int? value;

  RetentionPeriod({
    required this.type,
    this.value,
  });

  factory RetentionPeriod.fromJson(Map<String, dynamic> json) {
    return RetentionPeriod(
      type: (json['Type'] as String).toRetentionPeriodType(),
      value: json['Value'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    return {
      'Type': type.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum RetentionPeriodType {
  seconds,
  minutes,
  hours,
  days,
  months,
  years,
  infinite,
  unspecified,
}

extension RetentionPeriodTypeValueExtension on RetentionPeriodType {
  String toValue() {
    switch (this) {
      case RetentionPeriodType.seconds:
        return 'SECONDS';
      case RetentionPeriodType.minutes:
        return 'MINUTES';
      case RetentionPeriodType.hours:
        return 'HOURS';
      case RetentionPeriodType.days:
        return 'DAYS';
      case RetentionPeriodType.months:
        return 'MONTHS';
      case RetentionPeriodType.years:
        return 'YEARS';
      case RetentionPeriodType.infinite:
        return 'INFINITE';
      case RetentionPeriodType.unspecified:
        return 'UNSPECIFIED';
    }
  }
}

extension RetentionPeriodTypeFromString on String {
  RetentionPeriodType toRetentionPeriodType() {
    switch (this) {
      case 'SECONDS':
        return RetentionPeriodType.seconds;
      case 'MINUTES':
        return RetentionPeriodType.minutes;
      case 'HOURS':
        return RetentionPeriodType.hours;
      case 'DAYS':
        return RetentionPeriodType.days;
      case 'MONTHS':
        return RetentionPeriodType.months;
      case 'YEARS':
        return RetentionPeriodType.years;
      case 'INFINITE':
        return RetentionPeriodType.infinite;
      case 'UNSPECIFIED':
        return RetentionPeriodType.unspecified;
    }
    throw Exception('$this is not known in enum RetentionPeriodType');
  }
}

/// The configuration for an Amazon S3 data repository linked to an Amazon FSx
/// for Lustre file system with a data repository association. The configuration
/// consists of an <code>AutoImportPolicy</code> that defines which file events
/// on the data repository are automatically imported to the file system and an
/// <code>AutoExportPolicy</code> that defines which file events on the file
/// system are automatically exported to the data repository. File events are
/// when files or directories are added, changed, or deleted on the file system
/// or the data repository.
/// <note>
/// Data repository associations on Amazon File Cache don't use
/// <code>S3DataRepositoryConfiguration</code> because they don't support
/// automatic import or automatic export.
/// </note>
class S3DataRepositoryConfiguration {
  /// Specifies the type of updated objects (new, changed, deleted) that will be
  /// automatically exported from your file system to the linked S3 bucket.
  final AutoExportPolicy? autoExportPolicy;

  /// Specifies the type of updated objects (new, changed, deleted) that will be
  /// automatically imported from the linked S3 bucket to your file system.
  final AutoImportPolicy? autoImportPolicy;

  S3DataRepositoryConfiguration({
    this.autoExportPolicy,
    this.autoImportPolicy,
  });

  factory S3DataRepositoryConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DataRepositoryConfiguration(
      autoExportPolicy: json['AutoExportPolicy'] != null
          ? AutoExportPolicy.fromJson(
              json['AutoExportPolicy'] as Map<String, dynamic>)
          : null,
      autoImportPolicy: json['AutoImportPolicy'] != null
          ? AutoImportPolicy.fromJson(
              json['AutoImportPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final autoExportPolicy = this.autoExportPolicy;
    final autoImportPolicy = this.autoImportPolicy;
    return {
      if (autoExportPolicy != null) 'AutoExportPolicy': autoExportPolicy,
      if (autoImportPolicy != null) 'AutoImportPolicy': autoImportPolicy,
    };
  }
}

enum SecurityStyle {
  unix,
  ntfs,
  mixed,
}

extension SecurityStyleValueExtension on SecurityStyle {
  String toValue() {
    switch (this) {
      case SecurityStyle.unix:
        return 'UNIX';
      case SecurityStyle.ntfs:
        return 'NTFS';
      case SecurityStyle.mixed:
        return 'MIXED';
    }
  }
}

extension SecurityStyleFromString on String {
  SecurityStyle toSecurityStyle() {
    switch (this) {
      case 'UNIX':
        return SecurityStyle.unix;
      case 'NTFS':
        return SecurityStyle.ntfs;
      case 'MIXED':
        return SecurityStyle.mixed;
    }
    throw Exception('$this is not known in enum SecurityStyle');
  }
}

/// The configuration of the self-managed Microsoft Active Directory (AD)
/// directory to which the Windows File Server or ONTAP storage virtual machine
/// (SVM) instance is joined.
class SelfManagedActiveDirectoryAttributes {
  /// A list of up to three IP addresses of DNS servers or domain controllers in
  /// the self-managed AD directory.
  final List<String>? dnsIps;

  /// The fully qualified domain name of the self-managed AD directory.
  final String? domainName;

  /// The name of the domain group whose members have administrative privileges
  /// for the FSx file system.
  final String? fileSystemAdministratorsGroup;

  /// The fully qualified distinguished name of the organizational unit within the
  /// self-managed AD directory to which the Windows File Server or ONTAP storage
  /// virtual machine (SVM) instance is joined.
  final String? organizationalUnitDistinguishedName;

  /// The user name for the service account on your self-managed AD domain that
  /// FSx uses to join to your AD domain.
  final String? userName;

  SelfManagedActiveDirectoryAttributes({
    this.dnsIps,
    this.domainName,
    this.fileSystemAdministratorsGroup,
    this.organizationalUnitDistinguishedName,
    this.userName,
  });

  factory SelfManagedActiveDirectoryAttributes.fromJson(
      Map<String, dynamic> json) {
    return SelfManagedActiveDirectoryAttributes(
      dnsIps: (json['DnsIps'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      domainName: json['DomainName'] as String?,
      fileSystemAdministratorsGroup:
          json['FileSystemAdministratorsGroup'] as String?,
      organizationalUnitDistinguishedName:
          json['OrganizationalUnitDistinguishedName'] as String?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsIps = this.dnsIps;
    final domainName = this.domainName;
    final fileSystemAdministratorsGroup = this.fileSystemAdministratorsGroup;
    final organizationalUnitDistinguishedName =
        this.organizationalUnitDistinguishedName;
    final userName = this.userName;
    return {
      if (dnsIps != null) 'DnsIps': dnsIps,
      if (domainName != null) 'DomainName': domainName,
      if (fileSystemAdministratorsGroup != null)
        'FileSystemAdministratorsGroup': fileSystemAdministratorsGroup,
      if (organizationalUnitDistinguishedName != null)
        'OrganizationalUnitDistinguishedName':
            organizationalUnitDistinguishedName,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// The configuration that Amazon FSx uses to join a FSx for Windows File Server
/// file system or an FSx for ONTAP storage virtual machine (SVM) to a
/// self-managed (including on-premises) Microsoft Active Directory (AD)
/// directory. For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/self-managed-AD.html">
/// Using Amazon FSx for Windows with your self-managed Microsoft Active
/// Directory</a> or <a
/// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-svms.html">Managing
/// FSx for ONTAP SVMs</a>.
class SelfManagedActiveDirectoryConfiguration {
  /// A list of up to three IP addresses of DNS servers or domain controllers in
  /// the self-managed AD directory.
  final List<String> dnsIps;

  /// The fully qualified domain name of the self-managed AD directory, such as
  /// <code>corp.example.com</code>.
  final String domainName;

  /// The password for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain.
  final String password;

  /// The user name for the service account on your self-managed AD domain that
  /// Amazon FSx will use to join to your AD domain. This account must have the
  /// permission to join computers to the domain in the organizational unit
  /// provided in <code>OrganizationalUnitDistinguishedName</code>, or in the
  /// default location of your AD domain.
  final String userName;

  /// (Optional) The name of the domain group whose members are granted
  /// administrative privileges for the file system. Administrative privileges
  /// include taking ownership of files and folders, setting audit controls (audit
  /// ACLs) on files and folders, and administering the file system remotely by
  /// using the FSx Remote PowerShell. The group that you specify must already
  /// exist in your domain. If you don't provide one, your AD domain's Domain
  /// Admins group is used.
  final String? fileSystemAdministratorsGroup;

  /// (Optional) The fully qualified distinguished name of the organizational unit
  /// within your self-managed AD directory. Amazon FSx only accepts OU as the
  /// direct parent of the file system. An example is
  /// <code>OU=FSx,DC=yourdomain,DC=corp,DC=com</code>. To learn more, see <a
  /// href="https://tools.ietf.org/html/rfc2253">RFC 2253</a>. If none is
  /// provided, the FSx file system is created in the default location of your
  /// self-managed AD directory.
  /// <important>
  /// Only Organizational Unit (OU) objects can be the direct parent of the file
  /// system that you're creating.
  /// </important>
  final String? organizationalUnitDistinguishedName;

  SelfManagedActiveDirectoryConfiguration({
    required this.dnsIps,
    required this.domainName,
    required this.password,
    required this.userName,
    this.fileSystemAdministratorsGroup,
    this.organizationalUnitDistinguishedName,
  });

  Map<String, dynamic> toJson() {
    final dnsIps = this.dnsIps;
    final domainName = this.domainName;
    final password = this.password;
    final userName = this.userName;
    final fileSystemAdministratorsGroup = this.fileSystemAdministratorsGroup;
    final organizationalUnitDistinguishedName =
        this.organizationalUnitDistinguishedName;
    return {
      'DnsIps': dnsIps,
      'DomainName': domainName,
      'Password': password,
      'UserName': userName,
      if (fileSystemAdministratorsGroup != null)
        'FileSystemAdministratorsGroup': fileSystemAdministratorsGroup,
      if (organizationalUnitDistinguishedName != null)
        'OrganizationalUnitDistinguishedName':
            organizationalUnitDistinguishedName,
    };
  }
}

/// Specifies changes you are making to the self-managed Microsoft Active
/// Directory (AD) configuration to which an FSx for Windows File Server file
/// system or an FSx for ONTAP SVM is joined.
class SelfManagedActiveDirectoryConfigurationUpdates {
  /// A list of up to three DNS server or domain controller IP addresses in your
  /// self-managed AD domain.
  final List<String>? dnsIps;

  /// Specifies an updated fully qualified domain name of your self-managed AD
  /// configuration.
  final String? domainName;

  /// Specifies the updated name of the self-managed AD domain group whose members
  /// are granted administrative privileges for the Amazon FSx resource.
  final String? fileSystemAdministratorsGroup;

  /// Specifies an updated fully qualified distinguished name of the organization
  /// unit within your self-managed AD.
  final String? organizationalUnitDistinguishedName;

  /// Specifies the updated password for the service account on your self-managed
  /// AD domain. Amazon FSx uses this account to join to your self-managed AD
  /// domain.
  final String? password;

  /// Specifies the updated user name for the service account on your self-managed
  /// AD domain. Amazon FSx uses this account to join to your self-managed AD
  /// domain.
  ///
  /// This account must have the permissions required to join computers to the
  /// domain in the organizational unit provided in
  /// <code>OrganizationalUnitDistinguishedName</code>.
  final String? userName;

  SelfManagedActiveDirectoryConfigurationUpdates({
    this.dnsIps,
    this.domainName,
    this.fileSystemAdministratorsGroup,
    this.organizationalUnitDistinguishedName,
    this.password,
    this.userName,
  });

  Map<String, dynamic> toJson() {
    final dnsIps = this.dnsIps;
    final domainName = this.domainName;
    final fileSystemAdministratorsGroup = this.fileSystemAdministratorsGroup;
    final organizationalUnitDistinguishedName =
        this.organizationalUnitDistinguishedName;
    final password = this.password;
    final userName = this.userName;
    return {
      if (dnsIps != null) 'DnsIps': dnsIps,
      if (domainName != null) 'DomainName': domainName,
      if (fileSystemAdministratorsGroup != null)
        'FileSystemAdministratorsGroup': fileSystemAdministratorsGroup,
      if (organizationalUnitDistinguishedName != null)
        'OrganizationalUnitDistinguishedName':
            organizationalUnitDistinguishedName,
      if (password != null) 'Password': password,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Specifies the SnapLock configuration for an FSx for ONTAP SnapLock volume.
class SnaplockConfiguration {
  /// Enables or disables the audit log volume for an FSx for ONTAP SnapLock
  /// volume. The default value is <code>false</code>. If you set
  /// <code>AuditLogVolume</code> to <code>true</code>, the SnapLock volume is
  /// created as an audit log volume. The minimum retention period for an audit
  /// log volume is six months.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/how-snaplock-works.html#snaplock-audit-log-volume">
  /// SnapLock audit log volumes</a>.
  final bool? auditLogVolume;

  /// The configuration object for setting the autocommit period of files in an
  /// FSx for ONTAP SnapLock volume.
  final AutocommitPeriod? autocommitPeriod;

  /// Enables, disables, or permanently disables privileged delete on an FSx for
  /// ONTAP SnapLock Enterprise volume. Enabling privileged delete allows SnapLock
  /// administrators to delete write once, read many (WORM) files even if they
  /// have active retention periods. <code>PERMANENTLY_DISABLED</code> is a
  /// terminal state. If privileged delete is permanently disabled on a SnapLock
  /// volume, you can't re-enable it. The default value is <code>DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html#privileged-delete">Privileged
  /// delete</a>.
  final PrivilegedDelete? privilegedDelete;

  /// Specifies the retention period of an FSx for ONTAP SnapLock volume.
  final SnaplockRetentionPeriod? retentionPeriod;

  /// Specifies the retention mode of an FSx for ONTAP SnapLock volume. After it
  /// is set, it can't be changed. You can choose one of the following retention
  /// modes:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPLIANCE</code>: Files transitioned to write once, read many (WORM)
  /// on a Compliance volume can't be deleted until their retention periods
  /// expire. This retention mode is used to address government or
  /// industry-specific mandates or to protect against ransomware attacks. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-compliance.html">SnapLock
  /// Compliance</a>.
  /// </li>
  /// <li>
  /// <code>ENTERPRISE</code>: Files transitioned to WORM on an Enterprise volume
  /// can be deleted by authorized users before their retention periods expire
  /// using privileged delete. This retention mode is used to advance an
  /// organization's data integrity and internal compliance or to test retention
  /// settings before using SnapLock Compliance. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html">SnapLock
  /// Enterprise</a>.
  /// </li>
  /// </ul>
  final SnaplockType? snaplockType;

  /// Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume.
  /// Volume-append mode allows you to create WORM-appendable files and write data
  /// to them incrementally. The default value is <code>false</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-append">Volume-append
  /// mode</a>.
  final bool? volumeAppendModeEnabled;

  SnaplockConfiguration({
    this.auditLogVolume,
    this.autocommitPeriod,
    this.privilegedDelete,
    this.retentionPeriod,
    this.snaplockType,
    this.volumeAppendModeEnabled,
  });

  factory SnaplockConfiguration.fromJson(Map<String, dynamic> json) {
    return SnaplockConfiguration(
      auditLogVolume: json['AuditLogVolume'] as bool?,
      autocommitPeriod: json['AutocommitPeriod'] != null
          ? AutocommitPeriod.fromJson(
              json['AutocommitPeriod'] as Map<String, dynamic>)
          : null,
      privilegedDelete:
          (json['PrivilegedDelete'] as String?)?.toPrivilegedDelete(),
      retentionPeriod: json['RetentionPeriod'] != null
          ? SnaplockRetentionPeriod.fromJson(
              json['RetentionPeriod'] as Map<String, dynamic>)
          : null,
      snaplockType: (json['SnaplockType'] as String?)?.toSnaplockType(),
      volumeAppendModeEnabled: json['VolumeAppendModeEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final auditLogVolume = this.auditLogVolume;
    final autocommitPeriod = this.autocommitPeriod;
    final privilegedDelete = this.privilegedDelete;
    final retentionPeriod = this.retentionPeriod;
    final snaplockType = this.snaplockType;
    final volumeAppendModeEnabled = this.volumeAppendModeEnabled;
    return {
      if (auditLogVolume != null) 'AuditLogVolume': auditLogVolume,
      if (autocommitPeriod != null) 'AutocommitPeriod': autocommitPeriod,
      if (privilegedDelete != null)
        'PrivilegedDelete': privilegedDelete.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (snaplockType != null) 'SnaplockType': snaplockType.toValue(),
      if (volumeAppendModeEnabled != null)
        'VolumeAppendModeEnabled': volumeAppendModeEnabled,
    };
  }
}

/// The configuration to set the retention period of an FSx for ONTAP SnapLock
/// volume. The retention period includes default, maximum, and minimum
/// settings. For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-retention.html">Working
/// with the retention period in SnapLock</a>.
class SnaplockRetentionPeriod {
  /// The retention period assigned to a write once, read many (WORM) file by
  /// default if an explicit retention period is not set for an FSx for ONTAP
  /// SnapLock volume. The default retention period must be greater than or equal
  /// to the minimum retention period and less than or equal to the maximum
  /// retention period.
  final RetentionPeriod defaultRetention;

  /// The longest retention period that can be assigned to a WORM file on an FSx
  /// for ONTAP SnapLock volume.
  final RetentionPeriod maximumRetention;

  /// The shortest retention period that can be assigned to a WORM file on an FSx
  /// for ONTAP SnapLock volume.
  final RetentionPeriod minimumRetention;

  SnaplockRetentionPeriod({
    required this.defaultRetention,
    required this.maximumRetention,
    required this.minimumRetention,
  });

  factory SnaplockRetentionPeriod.fromJson(Map<String, dynamic> json) {
    return SnaplockRetentionPeriod(
      defaultRetention: RetentionPeriod.fromJson(
          json['DefaultRetention'] as Map<String, dynamic>),
      maximumRetention: RetentionPeriod.fromJson(
          json['MaximumRetention'] as Map<String, dynamic>),
      minimumRetention: RetentionPeriod.fromJson(
          json['MinimumRetention'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultRetention = this.defaultRetention;
    final maximumRetention = this.maximumRetention;
    final minimumRetention = this.minimumRetention;
    return {
      'DefaultRetention': defaultRetention,
      'MaximumRetention': maximumRetention,
      'MinimumRetention': minimumRetention,
    };
  }
}

enum SnaplockType {
  compliance,
  enterprise,
}

extension SnaplockTypeValueExtension on SnaplockType {
  String toValue() {
    switch (this) {
      case SnaplockType.compliance:
        return 'COMPLIANCE';
      case SnaplockType.enterprise:
        return 'ENTERPRISE';
    }
  }
}

extension SnaplockTypeFromString on String {
  SnaplockType toSnaplockType() {
    switch (this) {
      case 'COMPLIANCE':
        return SnaplockType.compliance;
      case 'ENTERPRISE':
        return SnaplockType.enterprise;
    }
    throw Exception('$this is not known in enum SnaplockType');
  }
}

/// A snapshot of an Amazon FSx for OpenZFS volume.
class Snapshot {
  /// A list of administrative actions for the file system that are in process or
  /// waiting to be processed. Administrative actions describe changes to the
  /// Amazon FSx system.
  final List<AdministrativeAction>? administrativeActions;
  final DateTime? creationTime;

  /// The lifecycle status of the snapshot.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code> - Amazon FSx hasn't started creating the snapshot.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - Amazon FSx is creating the snapshot.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Amazon FSx is deleting the snapshot.
  /// </li>
  /// <li>
  /// <code>AVAILABLE</code> - The snapshot is fully available.
  /// </li>
  /// </ul>
  final SnapshotLifecycle? lifecycle;
  final LifecycleTransitionReason? lifecycleTransitionReason;

  /// The name of the snapshot.
  final String? name;
  final String? resourceARN;

  /// The ID of the snapshot.
  final String? snapshotId;
  final List<Tag>? tags;

  /// The ID of the volume that the snapshot is of.
  final String? volumeId;

  Snapshot({
    this.administrativeActions,
    this.creationTime,
    this.lifecycle,
    this.lifecycleTransitionReason,
    this.name,
    this.resourceARN,
    this.snapshotId,
    this.tags,
    this.volumeId,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    return Snapshot(
      administrativeActions: (json['AdministrativeActions'] as List?)
          ?.whereNotNull()
          .map((e) => AdministrativeAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      lifecycle: (json['Lifecycle'] as String?)?.toSnapshotLifecycle(),
      lifecycleTransitionReason: json['LifecycleTransitionReason'] != null
          ? LifecycleTransitionReason.fromJson(
              json['LifecycleTransitionReason'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      resourceARN: json['ResourceARN'] as String?,
      snapshotId: json['SnapshotId'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeId: json['VolumeId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final administrativeActions = this.administrativeActions;
    final creationTime = this.creationTime;
    final lifecycle = this.lifecycle;
    final lifecycleTransitionReason = this.lifecycleTransitionReason;
    final name = this.name;
    final resourceARN = this.resourceARN;
    final snapshotId = this.snapshotId;
    final tags = this.tags;
    final volumeId = this.volumeId;
    return {
      if (administrativeActions != null)
        'AdministrativeActions': administrativeActions,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (lifecycleTransitionReason != null)
        'LifecycleTransitionReason': lifecycleTransitionReason,
      if (name != null) 'Name': name,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (snapshotId != null) 'SnapshotId': snapshotId,
      if (tags != null) 'Tags': tags,
      if (volumeId != null) 'VolumeId': volumeId,
    };
  }
}

/// A filter used to restrict the results of <code>DescribeSnapshots</code>
/// calls. You can use multiple filters to return results that meet all applied
/// filter requirements.
class SnapshotFilter {
  /// The name of the filter to use. You can filter by the
  /// <code>file-system-id</code> or by <code>volume-id</code>.
  final SnapshotFilterName? name;

  /// The <code>file-system-id</code> or <code>volume-id</code> that you are
  /// filtering for.
  final List<String>? values;

  SnapshotFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

enum SnapshotFilterName {
  fileSystemId,
  volumeId,
}

extension SnapshotFilterNameValueExtension on SnapshotFilterName {
  String toValue() {
    switch (this) {
      case SnapshotFilterName.fileSystemId:
        return 'file-system-id';
      case SnapshotFilterName.volumeId:
        return 'volume-id';
    }
  }
}

extension SnapshotFilterNameFromString on String {
  SnapshotFilterName toSnapshotFilterName() {
    switch (this) {
      case 'file-system-id':
        return SnapshotFilterName.fileSystemId;
      case 'volume-id':
        return SnapshotFilterName.volumeId;
    }
    throw Exception('$this is not known in enum SnapshotFilterName');
  }
}

enum SnapshotLifecycle {
  pending,
  creating,
  deleting,
  available,
}

extension SnapshotLifecycleValueExtension on SnapshotLifecycle {
  String toValue() {
    switch (this) {
      case SnapshotLifecycle.pending:
        return 'PENDING';
      case SnapshotLifecycle.creating:
        return 'CREATING';
      case SnapshotLifecycle.deleting:
        return 'DELETING';
      case SnapshotLifecycle.available:
        return 'AVAILABLE';
    }
  }
}

extension SnapshotLifecycleFromString on String {
  SnapshotLifecycle toSnapshotLifecycle() {
    switch (this) {
      case 'PENDING':
        return SnapshotLifecycle.pending;
      case 'CREATING':
        return SnapshotLifecycle.creating;
      case 'DELETING':
        return SnapshotLifecycle.deleting;
      case 'AVAILABLE':
        return SnapshotLifecycle.available;
    }
    throw Exception('$this is not known in enum SnapshotLifecycle');
  }
}

class StartMisconfiguredStateRecoveryResponse {
  final FileSystem? fileSystem;

  StartMisconfiguredStateRecoveryResponse({
    this.fileSystem,
  });

  factory StartMisconfiguredStateRecoveryResponse.fromJson(
      Map<String, dynamic> json) {
    return StartMisconfiguredStateRecoveryResponse(
      fileSystem: json['FileSystem'] != null
          ? FileSystem.fromJson(json['FileSystem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystem = this.fileSystem;
    return {
      if (fileSystem != null) 'FileSystem': fileSystem,
    };
  }
}

enum Status {
  failed,
  inProgress,
  pending,
  completed,
  updatedOptimizing,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.failed:
        return 'FAILED';
      case Status.inProgress:
        return 'IN_PROGRESS';
      case Status.pending:
        return 'PENDING';
      case Status.completed:
        return 'COMPLETED';
      case Status.updatedOptimizing:
        return 'UPDATED_OPTIMIZING';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'FAILED':
        return Status.failed;
      case 'IN_PROGRESS':
        return Status.inProgress;
      case 'PENDING':
        return Status.pending;
      case 'COMPLETED':
        return Status.completed;
      case 'UPDATED_OPTIMIZING':
        return Status.updatedOptimizing;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// Specifies the file system's storage type.
enum StorageType {
  ssd,
  hdd,
}

extension StorageTypeValueExtension on StorageType {
  String toValue() {
    switch (this) {
      case StorageType.ssd:
        return 'SSD';
      case StorageType.hdd:
        return 'HDD';
    }
  }
}

extension StorageTypeFromString on String {
  StorageType toStorageType() {
    switch (this) {
      case 'SSD':
        return StorageType.ssd;
      case 'HDD':
        return StorageType.hdd;
    }
    throw Exception('$this is not known in enum StorageType');
  }
}

/// Describes the Amazon FSx for NetApp ONTAP storage virtual machine (SVM)
/// configuration.
class StorageVirtualMachine {
  /// Describes the Microsoft Active Directory configuration to which the SVM is
  /// joined, if applicable.
  final SvmActiveDirectoryConfiguration? activeDirectoryConfiguration;
  final DateTime? creationTime;

  /// The endpoints that are used to access data or to manage the SVM using the
  /// NetApp ONTAP CLI, REST API, or NetApp CloudManager. They are the
  /// <code>Iscsi</code>, <code>Management</code>, <code>Nfs</code>, and
  /// <code>Smb</code> endpoints.
  final SvmEndpoints? endpoints;
  final String? fileSystemId;

  /// Describes the SVM's lifecycle status.
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED</code> - The SVM is fully available for use.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - Amazon FSx is creating the new SVM.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Amazon FSx is deleting an existing SVM.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Amazon FSx was unable to create the SVM.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURED</code> - The SVM is in a failed but recoverable state.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - Amazon FSx has not started creating the SVM.
  /// </li>
  /// </ul>
  final StorageVirtualMachineLifecycle? lifecycle;

  /// Describes why the SVM lifecycle state changed.
  final LifecycleTransitionReason? lifecycleTransitionReason;

  /// The name of the SVM, if provisioned.
  final String? name;
  final String? resourceARN;

  /// The security style of the root volume of the SVM.
  final StorageVirtualMachineRootVolumeSecurityStyle? rootVolumeSecurityStyle;

  /// The SVM's system generated unique ID.
  final String? storageVirtualMachineId;

  /// Describes the SVM's subtype.
  final StorageVirtualMachineSubtype? subtype;
  final List<Tag>? tags;

  /// The SVM's UUID (universally unique identifier).
  final String? uuid;

  StorageVirtualMachine({
    this.activeDirectoryConfiguration,
    this.creationTime,
    this.endpoints,
    this.fileSystemId,
    this.lifecycle,
    this.lifecycleTransitionReason,
    this.name,
    this.resourceARN,
    this.rootVolumeSecurityStyle,
    this.storageVirtualMachineId,
    this.subtype,
    this.tags,
    this.uuid,
  });

  factory StorageVirtualMachine.fromJson(Map<String, dynamic> json) {
    return StorageVirtualMachine(
      activeDirectoryConfiguration: json['ActiveDirectoryConfiguration'] != null
          ? SvmActiveDirectoryConfiguration.fromJson(
              json['ActiveDirectoryConfiguration'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      endpoints: json['Endpoints'] != null
          ? SvmEndpoints.fromJson(json['Endpoints'] as Map<String, dynamic>)
          : null,
      fileSystemId: json['FileSystemId'] as String?,
      lifecycle:
          (json['Lifecycle'] as String?)?.toStorageVirtualMachineLifecycle(),
      lifecycleTransitionReason: json['LifecycleTransitionReason'] != null
          ? LifecycleTransitionReason.fromJson(
              json['LifecycleTransitionReason'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      resourceARN: json['ResourceARN'] as String?,
      rootVolumeSecurityStyle: (json['RootVolumeSecurityStyle'] as String?)
          ?.toStorageVirtualMachineRootVolumeSecurityStyle(),
      storageVirtualMachineId: json['StorageVirtualMachineId'] as String?,
      subtype: (json['Subtype'] as String?)?.toStorageVirtualMachineSubtype(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      uuid: json['UUID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryConfiguration = this.activeDirectoryConfiguration;
    final creationTime = this.creationTime;
    final endpoints = this.endpoints;
    final fileSystemId = this.fileSystemId;
    final lifecycle = this.lifecycle;
    final lifecycleTransitionReason = this.lifecycleTransitionReason;
    final name = this.name;
    final resourceARN = this.resourceARN;
    final rootVolumeSecurityStyle = this.rootVolumeSecurityStyle;
    final storageVirtualMachineId = this.storageVirtualMachineId;
    final subtype = this.subtype;
    final tags = this.tags;
    final uuid = this.uuid;
    return {
      if (activeDirectoryConfiguration != null)
        'ActiveDirectoryConfiguration': activeDirectoryConfiguration,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (endpoints != null) 'Endpoints': endpoints,
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (lifecycleTransitionReason != null)
        'LifecycleTransitionReason': lifecycleTransitionReason,
      if (name != null) 'Name': name,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (rootVolumeSecurityStyle != null)
        'RootVolumeSecurityStyle': rootVolumeSecurityStyle.toValue(),
      if (storageVirtualMachineId != null)
        'StorageVirtualMachineId': storageVirtualMachineId,
      if (subtype != null) 'Subtype': subtype.toValue(),
      if (tags != null) 'Tags': tags,
      if (uuid != null) 'UUID': uuid,
    };
  }
}

/// A filter used to restrict the results of describe calls for Amazon FSx for
/// NetApp ONTAP storage virtual machines (SVMs). You can use multiple filters
/// to return results that meet all applied filter requirements.
class StorageVirtualMachineFilter {
  /// The name for this filter.
  final StorageVirtualMachineFilterName? name;

  /// The values of the filter. These are all the values for any of the applied
  /// filters.
  final List<String>? values;

  StorageVirtualMachineFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

enum StorageVirtualMachineFilterName {
  fileSystemId,
}

extension StorageVirtualMachineFilterNameValueExtension
    on StorageVirtualMachineFilterName {
  String toValue() {
    switch (this) {
      case StorageVirtualMachineFilterName.fileSystemId:
        return 'file-system-id';
    }
  }
}

extension StorageVirtualMachineFilterNameFromString on String {
  StorageVirtualMachineFilterName toStorageVirtualMachineFilterName() {
    switch (this) {
      case 'file-system-id':
        return StorageVirtualMachineFilterName.fileSystemId;
    }
    throw Exception(
        '$this is not known in enum StorageVirtualMachineFilterName');
  }
}

enum StorageVirtualMachineLifecycle {
  created,
  creating,
  deleting,
  failed,
  misconfigured,
  pending,
}

extension StorageVirtualMachineLifecycleValueExtension
    on StorageVirtualMachineLifecycle {
  String toValue() {
    switch (this) {
      case StorageVirtualMachineLifecycle.created:
        return 'CREATED';
      case StorageVirtualMachineLifecycle.creating:
        return 'CREATING';
      case StorageVirtualMachineLifecycle.deleting:
        return 'DELETING';
      case StorageVirtualMachineLifecycle.failed:
        return 'FAILED';
      case StorageVirtualMachineLifecycle.misconfigured:
        return 'MISCONFIGURED';
      case StorageVirtualMachineLifecycle.pending:
        return 'PENDING';
    }
  }
}

extension StorageVirtualMachineLifecycleFromString on String {
  StorageVirtualMachineLifecycle toStorageVirtualMachineLifecycle() {
    switch (this) {
      case 'CREATED':
        return StorageVirtualMachineLifecycle.created;
      case 'CREATING':
        return StorageVirtualMachineLifecycle.creating;
      case 'DELETING':
        return StorageVirtualMachineLifecycle.deleting;
      case 'FAILED':
        return StorageVirtualMachineLifecycle.failed;
      case 'MISCONFIGURED':
        return StorageVirtualMachineLifecycle.misconfigured;
      case 'PENDING':
        return StorageVirtualMachineLifecycle.pending;
    }
    throw Exception(
        '$this is not known in enum StorageVirtualMachineLifecycle');
  }
}

enum StorageVirtualMachineRootVolumeSecurityStyle {
  unix,
  ntfs,
  mixed,
}

extension StorageVirtualMachineRootVolumeSecurityStyleValueExtension
    on StorageVirtualMachineRootVolumeSecurityStyle {
  String toValue() {
    switch (this) {
      case StorageVirtualMachineRootVolumeSecurityStyle.unix:
        return 'UNIX';
      case StorageVirtualMachineRootVolumeSecurityStyle.ntfs:
        return 'NTFS';
      case StorageVirtualMachineRootVolumeSecurityStyle.mixed:
        return 'MIXED';
    }
  }
}

extension StorageVirtualMachineRootVolumeSecurityStyleFromString on String {
  StorageVirtualMachineRootVolumeSecurityStyle
      toStorageVirtualMachineRootVolumeSecurityStyle() {
    switch (this) {
      case 'UNIX':
        return StorageVirtualMachineRootVolumeSecurityStyle.unix;
      case 'NTFS':
        return StorageVirtualMachineRootVolumeSecurityStyle.ntfs;
      case 'MIXED':
        return StorageVirtualMachineRootVolumeSecurityStyle.mixed;
    }
    throw Exception(
        '$this is not known in enum StorageVirtualMachineRootVolumeSecurityStyle');
  }
}

enum StorageVirtualMachineSubtype {
  $default,
  dpDestination,
  syncDestination,
  syncSource,
}

extension StorageVirtualMachineSubtypeValueExtension
    on StorageVirtualMachineSubtype {
  String toValue() {
    switch (this) {
      case StorageVirtualMachineSubtype.$default:
        return 'DEFAULT';
      case StorageVirtualMachineSubtype.dpDestination:
        return 'DP_DESTINATION';
      case StorageVirtualMachineSubtype.syncDestination:
        return 'SYNC_DESTINATION';
      case StorageVirtualMachineSubtype.syncSource:
        return 'SYNC_SOURCE';
    }
  }
}

extension StorageVirtualMachineSubtypeFromString on String {
  StorageVirtualMachineSubtype toStorageVirtualMachineSubtype() {
    switch (this) {
      case 'DEFAULT':
        return StorageVirtualMachineSubtype.$default;
      case 'DP_DESTINATION':
        return StorageVirtualMachineSubtype.dpDestination;
      case 'SYNC_DESTINATION':
        return StorageVirtualMachineSubtype.syncDestination;
      case 'SYNC_SOURCE':
        return StorageVirtualMachineSubtype.syncSource;
    }
    throw Exception('$this is not known in enum StorageVirtualMachineSubtype');
  }
}

/// Describes the Microsoft Active Directory (AD) directory configuration to
/// which the FSx for ONTAP storage virtual machine (SVM) is joined. Note that
/// account credentials are not returned in the response payload.
class SvmActiveDirectoryConfiguration {
  /// The NetBIOS name of the AD computer object to which the SVM is joined.
  final String? netBiosName;
  final SelfManagedActiveDirectoryAttributes?
      selfManagedActiveDirectoryConfiguration;

  SvmActiveDirectoryConfiguration({
    this.netBiosName,
    this.selfManagedActiveDirectoryConfiguration,
  });

  factory SvmActiveDirectoryConfiguration.fromJson(Map<String, dynamic> json) {
    return SvmActiveDirectoryConfiguration(
      netBiosName: json['NetBiosName'] as String?,
      selfManagedActiveDirectoryConfiguration:
          json['SelfManagedActiveDirectoryConfiguration'] != null
              ? SelfManagedActiveDirectoryAttributes.fromJson(
                  json['SelfManagedActiveDirectoryConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final netBiosName = this.netBiosName;
    final selfManagedActiveDirectoryConfiguration =
        this.selfManagedActiveDirectoryConfiguration;
    return {
      if (netBiosName != null) 'NetBiosName': netBiosName,
      if (selfManagedActiveDirectoryConfiguration != null)
        'SelfManagedActiveDirectoryConfiguration':
            selfManagedActiveDirectoryConfiguration,
    };
  }
}

/// An Amazon FSx for NetApp ONTAP storage virtual machine (SVM) has four
/// endpoints that are used to access data or to manage the SVM using the NetApp
/// ONTAP CLI, REST API, or NetApp CloudManager. They are the
/// <code>Iscsi</code>, <code>Management</code>, <code>Nfs</code>, and
/// <code>Smb</code> endpoints.
class SvmEndpoint {
  final String? dNSName;

  /// The SVM endpoint's IP addresses.
  final List<String>? ipAddresses;

  SvmEndpoint({
    this.dNSName,
    this.ipAddresses,
  });

  factory SvmEndpoint.fromJson(Map<String, dynamic> json) {
    return SvmEndpoint(
      dNSName: json['DNSName'] as String?,
      ipAddresses: (json['IpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dNSName = this.dNSName;
    final ipAddresses = this.ipAddresses;
    return {
      if (dNSName != null) 'DNSName': dNSName,
      if (ipAddresses != null) 'IpAddresses': ipAddresses,
    };
  }
}

/// An Amazon FSx for NetApp ONTAP storage virtual machine (SVM) has the
/// following endpoints that are used to access data or to manage the SVM using
/// the NetApp ONTAP CLI, REST API, or NetApp CloudManager.
class SvmEndpoints {
  /// An endpoint for connecting using the Internet Small Computer Systems
  /// Interface (iSCSI) protocol.
  final SvmEndpoint? iscsi;

  /// An endpoint for managing SVMs using the NetApp ONTAP CLI, NetApp ONTAP API,
  /// or NetApp CloudManager.
  final SvmEndpoint? management;

  /// An endpoint for connecting using the Network File System (NFS) protocol.
  final SvmEndpoint? nfs;

  /// An endpoint for connecting using the Server Message Block (SMB) protocol.
  final SvmEndpoint? smb;

  SvmEndpoints({
    this.iscsi,
    this.management,
    this.nfs,
    this.smb,
  });

  factory SvmEndpoints.fromJson(Map<String, dynamic> json) {
    return SvmEndpoints(
      iscsi: json['Iscsi'] != null
          ? SvmEndpoint.fromJson(json['Iscsi'] as Map<String, dynamic>)
          : null,
      management: json['Management'] != null
          ? SvmEndpoint.fromJson(json['Management'] as Map<String, dynamic>)
          : null,
      nfs: json['Nfs'] != null
          ? SvmEndpoint.fromJson(json['Nfs'] as Map<String, dynamic>)
          : null,
      smb: json['Smb'] != null
          ? SvmEndpoint.fromJson(json['Smb'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final iscsi = this.iscsi;
    final management = this.management;
    final nfs = this.nfs;
    final smb = this.smb;
    return {
      if (iscsi != null) 'Iscsi': iscsi,
      if (management != null) 'Management': management,
      if (nfs != null) 'Nfs': nfs,
      if (smb != null) 'Smb': smb,
    };
  }
}

/// Specifies a key-value pair for a resource tag.
class Tag {
  /// A value that specifies the <code>TagKey</code>, the name of the tag. Tag
  /// keys must be unique for the resource to which they are attached.
  final String key;

  /// A value that specifies the <code>TagValue</code>, the value assigned to the
  /// corresponding tag key. Tag values can be null and don't have to be unique in
  /// a tag set. For example, you can have a key-value pair in a tag set of
  /// <code>finances : April</code> and also of <code>payroll : April</code>.
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

/// The response object for the <code>TagResource</code> operation.
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Describes the data tiering policy for an ONTAP volume. When enabled, Amazon
/// FSx for ONTAP's intelligent tiering automatically transitions a volume's
/// data between the file system's primary storage and capacity pool storage
/// based on your access patterns.
///
/// Valid tiering policies are the following:
///
/// <ul>
/// <li>
/// <code>SNAPSHOT_ONLY</code> - (Default value) moves cold snapshots to the
/// capacity pool storage tier.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>AUTO</code> - moves cold user data and snapshots to the capacity pool
/// storage tier based on your access patterns.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>ALL</code> - moves all user data blocks in both the active file system
/// and Snapshot copies to the storage pool tier.
/// </li>
/// </ul>
/// <ul>
/// <li>
/// <code>NONE</code> - keeps a volume's data in the primary storage tier,
/// preventing it from being moved to the capacity pool tier.
/// </li>
/// </ul>
class TieringPolicy {
  /// Specifies the number of days that user data in a volume must remain inactive
  /// before it is considered "cold" and moved to the capacity pool. Used with the
  /// <code>AUTO</code> and <code>SNAPSHOT_ONLY</code> tiering policies. Enter a
  /// whole number between 2 and 183. Default values are 31 days for
  /// <code>AUTO</code> and 2 days for <code>SNAPSHOT_ONLY</code>.
  final int? coolingPeriod;

  /// Specifies the tiering policy used to transition data. Default value is
  /// <code>SNAPSHOT_ONLY</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>SNAPSHOT_ONLY</code> - moves cold snapshots to the capacity pool
  /// storage tier.
  /// </li>
  /// <li>
  /// <code>AUTO</code> - moves cold user data and snapshots to the capacity pool
  /// storage tier based on your access patterns.
  /// </li>
  /// <li>
  /// <code>ALL</code> - moves all user data blocks in both the active file system
  /// and Snapshot copies to the storage pool tier.
  /// </li>
  /// <li>
  /// <code>NONE</code> - keeps a volume's data in the primary storage tier,
  /// preventing it from being moved to the capacity pool tier.
  /// </li>
  /// </ul>
  final TieringPolicyName? name;

  TieringPolicy({
    this.coolingPeriod,
    this.name,
  });

  factory TieringPolicy.fromJson(Map<String, dynamic> json) {
    return TieringPolicy(
      coolingPeriod: json['CoolingPeriod'] as int?,
      name: (json['Name'] as String?)?.toTieringPolicyName(),
    );
  }

  Map<String, dynamic> toJson() {
    final coolingPeriod = this.coolingPeriod;
    final name = this.name;
    return {
      if (coolingPeriod != null) 'CoolingPeriod': coolingPeriod,
      if (name != null) 'Name': name.toValue(),
    };
  }
}

enum TieringPolicyName {
  snapshotOnly,
  auto,
  all,
  none,
}

extension TieringPolicyNameValueExtension on TieringPolicyName {
  String toValue() {
    switch (this) {
      case TieringPolicyName.snapshotOnly:
        return 'SNAPSHOT_ONLY';
      case TieringPolicyName.auto:
        return 'AUTO';
      case TieringPolicyName.all:
        return 'ALL';
      case TieringPolicyName.none:
        return 'NONE';
    }
  }
}

extension TieringPolicyNameFromString on String {
  TieringPolicyName toTieringPolicyName() {
    switch (this) {
      case 'SNAPSHOT_ONLY':
        return TieringPolicyName.snapshotOnly;
      case 'AUTO':
        return TieringPolicyName.auto;
      case 'ALL':
        return TieringPolicyName.all;
      case 'NONE':
        return TieringPolicyName.none;
    }
    throw Exception('$this is not known in enum TieringPolicyName');
  }
}

enum Unit {
  days,
}

extension UnitValueExtension on Unit {
  String toValue() {
    switch (this) {
      case Unit.days:
        return 'DAYS';
    }
  }
}

extension UnitFromString on String {
  Unit toUnit() {
    switch (this) {
      case 'DAYS':
        return Unit.days;
    }
    throw Exception('$this is not known in enum Unit');
  }
}

/// The response object for <code>UntagResource</code> action.
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDataRepositoryAssociationResponse {
  /// The response object returned after the data repository association is
  /// updated.
  final DataRepositoryAssociation? association;

  UpdateDataRepositoryAssociationResponse({
    this.association,
  });

  factory UpdateDataRepositoryAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDataRepositoryAssociationResponse(
      association: json['Association'] != null
          ? DataRepositoryAssociation.fromJson(
              json['Association'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final association = this.association;
    return {
      if (association != null) 'Association': association,
    };
  }
}

/// The configuration update for an Amazon File Cache resource.
class UpdateFileCacheLustreConfiguration {
  final String? weeklyMaintenanceStartTime;

  UpdateFileCacheLustreConfiguration({
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

class UpdateFileCacheResponse {
  /// A description of the cache that was updated.
  final FileCache? fileCache;

  UpdateFileCacheResponse({
    this.fileCache,
  });

  factory UpdateFileCacheResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFileCacheResponse(
      fileCache: json['FileCache'] != null
          ? FileCache.fromJson(json['FileCache'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileCache = this.fileCache;
    return {
      if (fileCache != null) 'FileCache': fileCache,
    };
  }
}

/// The configuration object for Amazon FSx for Lustre file systems used in the
/// <code>UpdateFileSystem</code> operation.
class UpdateFileSystemLustreConfiguration {
  /// (Optional) When you create your file system, your existing S3 objects appear
  /// as file and directory listings. Use this property to choose how Amazon FSx
  /// keeps your file and directory listing up to date as you add or modify
  /// objects in your linked S3 bucket. <code>AutoImportPolicy</code> can have the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - (Default) AutoImport is off. Amazon FSx only updates
  /// file and directory listings from the linked S3 bucket when the file system
  /// is created. FSx does not update the file and directory listing for any new
  /// or changed objects after choosing this option.
  /// </li>
  /// <li>
  /// <code>NEW</code> - AutoImport is on. Amazon FSx automatically imports
  /// directory listings of any new objects added to the linked S3 bucket that do
  /// not currently exist in the FSx file system.
  /// </li>
  /// <li>
  /// <code>NEW_CHANGED</code> - AutoImport is on. Amazon FSx automatically
  /// imports file and directory listings of any new objects added to the S3
  /// bucket and any existing objects that are changed in the S3 bucket after you
  /// choose this option.
  /// </li>
  /// <li>
  /// <code>NEW_CHANGED_DELETED</code> - AutoImport is on. Amazon FSx
  /// automatically imports file and directory listings of any new objects added
  /// to the S3 bucket, any existing objects that are changed in the S3 bucket,
  /// and any objects that were deleted in the S3 bucket.
  /// </li>
  /// </ul>
  /// This parameter is not supported for file systems with a data repository
  /// association.
  final AutoImportPolicyType? autoImportPolicy;

  /// The number of days to retain automatic backups. Setting this property to
  /// <code>0</code> disables automatic backups. You can retain automatic backups
  /// for a maximum of 90 days. The default is <code>0</code>.
  final int? automaticBackupRetentionDays;
  final String? dailyAutomaticBackupStartTime;

  /// Sets the data compression configuration for the file system.
  /// <code>DataCompressionType</code> can have the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - Data compression is turned off for the file system.
  /// </li>
  /// <li>
  /// <code>LZ4</code> - Data compression is turned on with the LZ4 algorithm.
  /// </li>
  /// </ul>
  /// If you don't use <code>DataCompressionType</code>, the file system retains
  /// its current data compression configuration.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/data-compression.html">Lustre
  /// data compression</a>.
  final DataCompressionType? dataCompressionType;

  /// The Lustre logging configuration used when updating an Amazon FSx for Lustre
  /// file system. When logging is enabled, Lustre logs error and warning events
  /// for data repositories associated with your file system to Amazon CloudWatch
  /// Logs.
  final LustreLogCreateConfiguration? logConfiguration;

  /// The throughput of an Amazon FSx for Lustre Persistent SSD-based file system,
  /// measured in megabytes per second per tebibyte (MB/s/TiB). You can increase
  /// or decrease your file system's throughput. Valid values depend on the
  /// deployment type of the file system, as follows:
  ///
  /// <ul>
  /// <li>
  /// For <code>PERSISTENT_1</code> SSD-based deployment types, valid values are
  /// 50, 100, and 200 MB/s/TiB.
  /// </li>
  /// <li>
  /// For <code>PERSISTENT_2</code> SSD-based deployment types, valid values are
  /// 125, 250, 500, and 1000 MB/s/TiB.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/LustreGuide/managing-throughput-capacity.html">
  /// Managing throughput capacity</a>.
  final int? perUnitStorageThroughput;

  /// The Lustre root squash configuration used when updating an Amazon FSx for
  /// Lustre file system. When enabled, root squash restricts root-level access
  /// from clients that try to access your file system as a root user.
  final LustreRootSquashConfiguration? rootSquashConfiguration;

  /// (Optional) The preferred start time to perform weekly maintenance, formatted
  /// d:HH:MM in the UTC time zone. d is the weekday number, from 1 through 7,
  /// beginning with Monday and ending with Sunday.
  final String? weeklyMaintenanceStartTime;

  UpdateFileSystemLustreConfiguration({
    this.autoImportPolicy,
    this.automaticBackupRetentionDays,
    this.dailyAutomaticBackupStartTime,
    this.dataCompressionType,
    this.logConfiguration,
    this.perUnitStorageThroughput,
    this.rootSquashConfiguration,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final autoImportPolicy = this.autoImportPolicy;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final dataCompressionType = this.dataCompressionType;
    final logConfiguration = this.logConfiguration;
    final perUnitStorageThroughput = this.perUnitStorageThroughput;
    final rootSquashConfiguration = this.rootSquashConfiguration;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (autoImportPolicy != null)
        'AutoImportPolicy': autoImportPolicy.toValue(),
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (dataCompressionType != null)
        'DataCompressionType': dataCompressionType.toValue(),
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (perUnitStorageThroughput != null)
        'PerUnitStorageThroughput': perUnitStorageThroughput,
      if (rootSquashConfiguration != null)
        'RootSquashConfiguration': rootSquashConfiguration,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The configuration updates for an Amazon FSx for NetApp ONTAP file system.
class UpdateFileSystemOntapConfiguration {
  /// (Multi-AZ only) A list of IDs of new virtual private cloud (VPC) route
  /// tables to associate (add) with your Amazon FSx for NetApp ONTAP file system.
  final List<String>? addRouteTableIds;
  final int? automaticBackupRetentionDays;
  final String? dailyAutomaticBackupStartTime;

  /// The SSD IOPS (input output operations per second) configuration for an
  /// Amazon FSx for NetApp ONTAP file system. The default is 3 IOPS per GB of
  /// storage capacity, but you can provision additional IOPS per GB of storage.
  /// The configuration consists of an IOPS mode (<code>AUTOMATIC</code> or
  /// <code>USER_PROVISIONED</code>), and in the case of
  /// <code>USER_PROVISIONED</code> IOPS, the total number of SSD IOPS
  /// provisioned. For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/increase-primary-storage.html">Updating
  /// SSD storage capacity and IOPS</a>.
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// Update the password for the <code>fsxadmin</code> user by entering a new
  /// password. You use the <code>fsxadmin</code> user to access the NetApp ONTAP
  /// CLI and REST API to manage your file system resources. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-resources-ontap-apps.html">Managing
  /// resources using NetApp Applicaton</a>.
  final String? fsxAdminPassword;

  /// (Multi-AZ only) A list of IDs of existing virtual private cloud (VPC) route
  /// tables to disassociate (remove) from your Amazon FSx for NetApp ONTAP file
  /// system. You can use the API operation to retrieve the list of VPC route
  /// table IDs for a file system.
  final List<String>? removeRouteTableIds;

  /// Enter a new value to change the amount of throughput capacity for the file
  /// system in megabytes per second (MBps). For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/managing-throughput-capacity.html">Managing
  /// throughput capacity</a> in the FSx for ONTAP User Guide.
  ///
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>ThroughputCapacity</code> and
  /// <code>ThroughputCapacityPerHAPair</code> are not the same value.
  /// </li>
  /// <li>
  /// The value of <code>ThroughputCapacity</code> when divided by the value of
  /// <code>HAPairs</code> is outside of the valid range for
  /// <code>ThroughputCapacity</code>.
  /// </li>
  /// </ul>
  final int? throughputCapacity;

  /// Use to choose the throughput capacity per HA pair, rather than the total
  /// throughput for the file system.
  ///
  /// This field and <code>ThroughputCapacity</code> cannot be defined in the same
  /// API call, but one is required.
  ///
  /// This field and <code>ThroughputCapacity</code> are the same for file systems
  /// with one HA pair.
  ///
  /// <ul>
  /// <li>
  /// For <code>SINGLE_AZ_1</code> and <code>MULTI_AZ_1</code>, valid values are
  /// 128, 256, 512, 1024, 2048, or 4096 MBps.
  /// </li>
  /// <li>
  /// For <code>SINGLE_AZ_2</code>, valid values are 3072 or 6144 MBps.
  /// </li>
  /// </ul>
  /// Amazon FSx responds with an HTTP status code 400 (Bad Request) for the
  /// following conditions:
  ///
  /// <ul>
  /// <li>
  /// The value of <code>ThroughputCapacity</code> and
  /// <code>ThroughputCapacityPerHAPair</code> are not the same value for file
  /// systems with one HA pair.
  /// </li>
  /// <li>
  /// The value of deployment type is <code>SINGLE_AZ_2</code> and
  /// <code>ThroughputCapacity</code> / <code>ThroughputCapacityPerHAPair</code>
  /// is a valid HA pair (a value between 2 and 12).
  /// </li>
  /// <li>
  /// The value of <code>ThroughputCapacityPerHAPair</code> is not a valid value.
  /// </li>
  /// </ul>
  final int? throughputCapacityPerHAPair;
  final String? weeklyMaintenanceStartTime;

  UpdateFileSystemOntapConfiguration({
    this.addRouteTableIds,
    this.automaticBackupRetentionDays,
    this.dailyAutomaticBackupStartTime,
    this.diskIopsConfiguration,
    this.fsxAdminPassword,
    this.removeRouteTableIds,
    this.throughputCapacity,
    this.throughputCapacityPerHAPair,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final addRouteTableIds = this.addRouteTableIds;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final fsxAdminPassword = this.fsxAdminPassword;
    final removeRouteTableIds = this.removeRouteTableIds;
    final throughputCapacity = this.throughputCapacity;
    final throughputCapacityPerHAPair = this.throughputCapacityPerHAPair;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (addRouteTableIds != null) 'AddRouteTableIds': addRouteTableIds,
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (fsxAdminPassword != null) 'FsxAdminPassword': fsxAdminPassword,
      if (removeRouteTableIds != null)
        'RemoveRouteTableIds': removeRouteTableIds,
      if (throughputCapacity != null) 'ThroughputCapacity': throughputCapacity,
      if (throughputCapacityPerHAPair != null)
        'ThroughputCapacityPerHAPair': throughputCapacityPerHAPair,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The configuration updates for an Amazon FSx for OpenZFS file system.
class UpdateFileSystemOpenZFSConfiguration {
  /// (Multi-AZ only) A list of IDs of new virtual private cloud (VPC) route
  /// tables to associate (add) with your Amazon FSx for OpenZFS file system.
  final List<String>? addRouteTableIds;
  final int? automaticBackupRetentionDays;

  /// A Boolean value indicating whether tags for the file system should be copied
  /// to backups. This value defaults to <code>false</code>. If it's set to
  /// <code>true</code>, all tags for the file system are copied to all automatic
  /// and user-initiated backups where the user doesn't specify tags. If this
  /// value is <code>true</code> and you specify one or more tags, only the
  /// specified tags are copied to backups. If you specify one or more tags when
  /// creating a user-initiated backup, no tags are copied from the file system,
  /// regardless of this value.
  final bool? copyTagsToBackups;

  /// A Boolean value indicating whether tags for the volume should be copied to
  /// snapshots. This value defaults to <code>false</code>. If it's set to
  /// <code>true</code>, all tags for the volume are copied to snapshots where the
  /// user doesn't specify tags. If this value is <code>true</code> and you
  /// specify one or more tags, only the specified tags are copied to snapshots.
  /// If you specify one or more tags when creating the snapshot, no tags are
  /// copied from the volume, regardless of this value.
  final bool? copyTagsToVolumes;
  final String? dailyAutomaticBackupStartTime;
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// (Multi-AZ only) A list of IDs of existing virtual private cloud (VPC) route
  /// tables to disassociate (remove) from your Amazon FSx for OpenZFS file
  /// system. You can use the API operation to retrieve the list of VPC route
  /// table IDs for a file system.
  final List<String>? removeRouteTableIds;

  /// The throughput of an Amazon FSx for OpenZFS file system, measured in
  /// megabytes per second&#x2028; (MB/s). Valid values depend on the
  /// DeploymentType you choose, as follows:
  ///
  /// <ul>
  /// <li>
  /// For <code>MULTI_AZ_1</code> and <code>SINGLE_AZ_2</code>, valid values are
  /// 160, 320, 640, 1280, 2560, 3840, 5120, 7680, or 10240 MB/s.
  /// </li>
  /// <li>
  /// For <code>SINGLE_AZ_1</code>, valid values are 64, 128, 256, 512, 1024,
  /// 2048, 3072, or 4096 MB/s.
  /// </li>
  /// </ul>
  final int? throughputCapacity;
  final String? weeklyMaintenanceStartTime;

  UpdateFileSystemOpenZFSConfiguration({
    this.addRouteTableIds,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.copyTagsToVolumes,
    this.dailyAutomaticBackupStartTime,
    this.diskIopsConfiguration,
    this.removeRouteTableIds,
    this.throughputCapacity,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final addRouteTableIds = this.addRouteTableIds;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final copyTagsToBackups = this.copyTagsToBackups;
    final copyTagsToVolumes = this.copyTagsToVolumes;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final removeRouteTableIds = this.removeRouteTableIds;
    final throughputCapacity = this.throughputCapacity;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (addRouteTableIds != null) 'AddRouteTableIds': addRouteTableIds,
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (copyTagsToVolumes != null) 'CopyTagsToVolumes': copyTagsToVolumes,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (removeRouteTableIds != null)
        'RemoveRouteTableIds': removeRouteTableIds,
      if (throughputCapacity != null) 'ThroughputCapacity': throughputCapacity,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// The response object for the <code>UpdateFileSystem</code> operation.
class UpdateFileSystemResponse {
  /// A description of the file system that was updated.
  final FileSystem? fileSystem;

  UpdateFileSystemResponse({
    this.fileSystem,
  });

  factory UpdateFileSystemResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFileSystemResponse(
      fileSystem: json['FileSystem'] != null
          ? FileSystem.fromJson(json['FileSystem'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystem = this.fileSystem;
    return {
      if (fileSystem != null) 'FileSystem': fileSystem,
    };
  }
}

/// Updates the configuration for an existing Amazon FSx for Windows File Server
/// file system. Amazon FSx only overwrites existing properties with non-null
/// values provided in the request.
class UpdateFileSystemWindowsConfiguration {
  /// The configuration that Amazon FSx for Windows File Server uses to audit and
  /// log user accesses of files, folders, and file shares on the Amazon FSx for
  /// Windows File Server file system..
  final WindowsAuditLogCreateConfiguration? auditLogConfiguration;

  /// The number of days to retain automatic backups. Setting this property to
  /// <code>0</code> disables automatic backups. You can retain automatic backups
  /// for a maximum of 90 days. The default is <code>30</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/using-backups.html#automatic-backups">Working
  /// with Automatic Daily Backups</a>.
  final int? automaticBackupRetentionDays;

  /// The preferred time to start the daily automatic backup, in the UTC time
  /// zone, for example, <code>02:00</code>
  final String? dailyAutomaticBackupStartTime;

  /// The SSD IOPS (input/output operations per second) configuration for an
  /// Amazon FSx for Windows file system. By default, Amazon FSx automatically
  /// provisions 3 IOPS per GiB of storage capacity. You can provision additional
  /// IOPS per GiB of storage, up to the maximum limit associated with your chosen
  /// throughput capacity.
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// The configuration Amazon FSx uses to join the Windows File Server instance
  /// to the self-managed Microsoft AD directory. You cannot make a self-managed
  /// Microsoft AD update request if there is an existing self-managed Microsoft
  /// AD update request in progress.
  final SelfManagedActiveDirectoryConfigurationUpdates?
      selfManagedActiveDirectoryConfiguration;

  /// Sets the target value for a file system's throughput capacity, in MB/s, that
  /// you are updating the file system to. Valid values are 8, 16, 32, 64, 128,
  /// 256, 512, 1024, 2048. You cannot make a throughput capacity update request
  /// if there is an existing throughput capacity update request in progress. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/managing-throughput-capacity.html">Managing
  /// Throughput Capacity</a>.
  final int? throughputCapacity;

  /// The preferred start time to perform weekly maintenance, formatted d:HH:MM in
  /// the UTC time zone. Where d is the weekday number, from 1 through 7, with 1 =
  /// Monday and 7 = Sunday.
  final String? weeklyMaintenanceStartTime;

  UpdateFileSystemWindowsConfiguration({
    this.auditLogConfiguration,
    this.automaticBackupRetentionDays,
    this.dailyAutomaticBackupStartTime,
    this.diskIopsConfiguration,
    this.selfManagedActiveDirectoryConfiguration,
    this.throughputCapacity,
    this.weeklyMaintenanceStartTime,
  });

  Map<String, dynamic> toJson() {
    final auditLogConfiguration = this.auditLogConfiguration;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final selfManagedActiveDirectoryConfiguration =
        this.selfManagedActiveDirectoryConfiguration;
    final throughputCapacity = this.throughputCapacity;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (auditLogConfiguration != null)
        'AuditLogConfiguration': auditLogConfiguration,
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (selfManagedActiveDirectoryConfiguration != null)
        'SelfManagedActiveDirectoryConfiguration':
            selfManagedActiveDirectoryConfiguration,
      if (throughputCapacity != null) 'ThroughputCapacity': throughputCapacity,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

/// Used to specify changes to the ONTAP configuration for the volume you are
/// updating.
class UpdateOntapVolumeConfiguration {
  /// A boolean flag indicating whether tags for the volume should be copied to
  /// backups. This value defaults to false. If it's set to true, all tags for the
  /// volume are copied to all automatic and user-initiated backups where the user
  /// doesn't specify tags. If this value is true, and you specify one or more
  /// tags, only the specified tags are copied to backups. If you specify one or
  /// more tags when creating a user-initiated backup, no tags are copied from the
  /// volume, regardless of this value.
  final bool? copyTagsToBackups;

  /// Specifies the location in the SVM's namespace where the volume is mounted.
  /// The <code>JunctionPath</code> must have a leading forward slash, such as
  /// <code>/vol3</code>.
  final String? junctionPath;

  /// The security style for the volume, which can be <code>UNIX</code>,
  /// <code>NTFS</code>, or <code>MIXED</code>.
  final SecurityStyle? securityStyle;

  /// The configured size of the volume, in bytes.
  final int? sizeInBytes;

  /// Specifies the size of the volume in megabytes.
  final int? sizeInMegabytes;

  /// The configuration object for updating the SnapLock configuration of an FSx
  /// for ONTAP SnapLock volume.
  final UpdateSnaplockConfiguration? snaplockConfiguration;

  /// Specifies the snapshot policy for the volume. There are three built-in
  /// snapshot policies:
  ///
  /// <ul>
  /// <li>
  /// <code>default</code>: This is the default policy. A maximum of six hourly
  /// snapshots taken five minutes past the hour. A maximum of two daily snapshots
  /// taken Monday through Saturday at 10 minutes after midnight. A maximum of two
  /// weekly snapshots taken every Sunday at 15 minutes after midnight.
  /// </li>
  /// <li>
  /// <code>default-1weekly</code>: This policy is the same as the
  /// <code>default</code> policy except that it only retains one snapshot from
  /// the weekly schedule.
  /// </li>
  /// <li>
  /// <code>none</code>: This policy does not take any snapshots. This policy can
  /// be assigned to volumes to prevent automatic snapshots from being taken.
  /// </li>
  /// </ul>
  /// You can also provide the name of a custom policy that you created with the
  /// ONTAP CLI or REST API.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snapshots-ontap.html#snapshot-policies">Snapshot
  /// policies</a> in the <i>Amazon FSx for NetApp ONTAP User Guide</i>.
  final String? snapshotPolicy;

  /// Default is <code>false</code>. Set to true to enable the deduplication,
  /// compression, and compaction storage efficiency features on the volume.
  final bool? storageEfficiencyEnabled;

  /// Update the volume's data tiering policy.
  final TieringPolicy? tieringPolicy;

  UpdateOntapVolumeConfiguration({
    this.copyTagsToBackups,
    this.junctionPath,
    this.securityStyle,
    this.sizeInBytes,
    this.sizeInMegabytes,
    this.snaplockConfiguration,
    this.snapshotPolicy,
    this.storageEfficiencyEnabled,
    this.tieringPolicy,
  });

  Map<String, dynamic> toJson() {
    final copyTagsToBackups = this.copyTagsToBackups;
    final junctionPath = this.junctionPath;
    final securityStyle = this.securityStyle;
    final sizeInBytes = this.sizeInBytes;
    final sizeInMegabytes = this.sizeInMegabytes;
    final snaplockConfiguration = this.snaplockConfiguration;
    final snapshotPolicy = this.snapshotPolicy;
    final storageEfficiencyEnabled = this.storageEfficiencyEnabled;
    final tieringPolicy = this.tieringPolicy;
    return {
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (junctionPath != null) 'JunctionPath': junctionPath,
      if (securityStyle != null) 'SecurityStyle': securityStyle.toValue(),
      if (sizeInBytes != null) 'SizeInBytes': sizeInBytes,
      if (sizeInMegabytes != null) 'SizeInMegabytes': sizeInMegabytes,
      if (snaplockConfiguration != null)
        'SnaplockConfiguration': snaplockConfiguration,
      if (snapshotPolicy != null) 'SnapshotPolicy': snapshotPolicy,
      if (storageEfficiencyEnabled != null)
        'StorageEfficiencyEnabled': storageEfficiencyEnabled,
      if (tieringPolicy != null) 'TieringPolicy': tieringPolicy,
    };
  }
}

/// Used to specify changes to the OpenZFS configuration for the volume that you
/// are updating.
class UpdateOpenZFSVolumeConfiguration {
  /// Specifies the method used to compress the data on the volume. The
  /// compression type is <code>NONE</code> by default.
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code> - Doesn't compress the data on the volume.
  /// <code>NONE</code> is the default.
  /// </li>
  /// <li>
  /// <code>ZSTD</code> - Compresses the data in the volume using the Zstandard
  /// (ZSTD) compression algorithm. Compared to LZ4, Z-Standard provides a better
  /// compression ratio to minimize on-disk storage utilization.
  /// </li>
  /// <li>
  /// <code>LZ4</code> - Compresses the data in the volume using the LZ4
  /// compression algorithm. Compared to Z-Standard, LZ4 is less compute-intensive
  /// and delivers higher write throughput speeds.
  /// </li>
  /// </ul>
  final OpenZFSDataCompressionType? dataCompressionType;

  /// The configuration object for mounting a Network File System (NFS) file
  /// system.
  final List<OpenZFSNfsExport>? nfsExports;

  /// A Boolean value indicating whether the volume is read-only.
  final bool? readOnly;

  /// Specifies the record size of an OpenZFS volume, in kibibytes (KiB). Valid
  /// values are 4, 8, 16, 32, 64, 128, 256, 512, or 1024 KiB. The default is 128
  /// KiB. Most workloads should use the default record size. Database workflows
  /// can benefit from a smaller record size, while streaming workflows can
  /// benefit from a larger record size. For additional guidance on when to set a
  /// custom record size, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/OpenZFSGuide/performance.html#performance-tips-zfs">
  /// Tips for maximizing performance</a> in the <i>Amazon FSx for OpenZFS User
  /// Guide</i>.
  final int? recordSizeKiB;

  /// The maximum amount of storage in gibibytes (GiB) that the volume can use
  /// from its parent. You can specify a quota larger than the storage on the
  /// parent volume. You can specify a value of <code>-1</code> to unset a
  /// volume's storage capacity quota.
  final int? storageCapacityQuotaGiB;

  /// The amount of storage in gibibytes (GiB) to reserve from the parent volume.
  /// You can't reserve more storage than the parent volume has reserved. You can
  /// specify a value of <code>-1</code> to unset a volume's storage capacity
  /// reservation.
  final int? storageCapacityReservationGiB;

  /// An object specifying how much storage users or groups can use on the volume.
  final List<OpenZFSUserOrGroupQuota>? userAndGroupQuotas;

  UpdateOpenZFSVolumeConfiguration({
    this.dataCompressionType,
    this.nfsExports,
    this.readOnly,
    this.recordSizeKiB,
    this.storageCapacityQuotaGiB,
    this.storageCapacityReservationGiB,
    this.userAndGroupQuotas,
  });

  Map<String, dynamic> toJson() {
    final dataCompressionType = this.dataCompressionType;
    final nfsExports = this.nfsExports;
    final readOnly = this.readOnly;
    final recordSizeKiB = this.recordSizeKiB;
    final storageCapacityQuotaGiB = this.storageCapacityQuotaGiB;
    final storageCapacityReservationGiB = this.storageCapacityReservationGiB;
    final userAndGroupQuotas = this.userAndGroupQuotas;
    return {
      if (dataCompressionType != null)
        'DataCompressionType': dataCompressionType.toValue(),
      if (nfsExports != null) 'NfsExports': nfsExports,
      if (readOnly != null) 'ReadOnly': readOnly,
      if (recordSizeKiB != null) 'RecordSizeKiB': recordSizeKiB,
      if (storageCapacityQuotaGiB != null)
        'StorageCapacityQuotaGiB': storageCapacityQuotaGiB,
      if (storageCapacityReservationGiB != null)
        'StorageCapacityReservationGiB': storageCapacityReservationGiB,
      if (userAndGroupQuotas != null) 'UserAndGroupQuotas': userAndGroupQuotas,
    };
  }
}

enum UpdateOpenZFSVolumeOption {
  deleteIntermediateSnapshots,
  deleteClonedVolumes,
  deleteIntermediateData,
}

extension UpdateOpenZFSVolumeOptionValueExtension on UpdateOpenZFSVolumeOption {
  String toValue() {
    switch (this) {
      case UpdateOpenZFSVolumeOption.deleteIntermediateSnapshots:
        return 'DELETE_INTERMEDIATE_SNAPSHOTS';
      case UpdateOpenZFSVolumeOption.deleteClonedVolumes:
        return 'DELETE_CLONED_VOLUMES';
      case UpdateOpenZFSVolumeOption.deleteIntermediateData:
        return 'DELETE_INTERMEDIATE_DATA';
    }
  }
}

extension UpdateOpenZFSVolumeOptionFromString on String {
  UpdateOpenZFSVolumeOption toUpdateOpenZFSVolumeOption() {
    switch (this) {
      case 'DELETE_INTERMEDIATE_SNAPSHOTS':
        return UpdateOpenZFSVolumeOption.deleteIntermediateSnapshots;
      case 'DELETE_CLONED_VOLUMES':
        return UpdateOpenZFSVolumeOption.deleteClonedVolumes;
      case 'DELETE_INTERMEDIATE_DATA':
        return UpdateOpenZFSVolumeOption.deleteIntermediateData;
    }
    throw Exception('$this is not known in enum UpdateOpenZFSVolumeOption');
  }
}

class UpdateSharedVpcConfigurationResponse {
  /// Indicates whether participant accounts can create FSx for ONTAP Multi-AZ
  /// file systems in shared subnets.
  final String? enableFsxRouteTableUpdatesFromParticipantAccounts;

  UpdateSharedVpcConfigurationResponse({
    this.enableFsxRouteTableUpdatesFromParticipantAccounts,
  });

  factory UpdateSharedVpcConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSharedVpcConfigurationResponse(
      enableFsxRouteTableUpdatesFromParticipantAccounts:
          json['EnableFsxRouteTableUpdatesFromParticipantAccounts'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableFsxRouteTableUpdatesFromParticipantAccounts =
        this.enableFsxRouteTableUpdatesFromParticipantAccounts;
    return {
      if (enableFsxRouteTableUpdatesFromParticipantAccounts != null)
        'EnableFsxRouteTableUpdatesFromParticipantAccounts':
            enableFsxRouteTableUpdatesFromParticipantAccounts,
    };
  }
}

/// Updates the SnapLock configuration for an existing FSx for ONTAP volume.
class UpdateSnaplockConfiguration {
  /// Enables or disables the audit log volume for an FSx for ONTAP SnapLock
  /// volume. The default value is <code>false</code>. If you set
  /// <code>AuditLogVolume</code> to <code>true</code>, the SnapLock volume is
  /// created as an audit log volume. The minimum retention period for an audit
  /// log volume is six months.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/how-snaplock-works.html#snaplock-audit-log-volume">
  /// SnapLock audit log volumes</a>.
  final bool? auditLogVolume;

  /// The configuration object for setting the autocommit period of files in an
  /// FSx for ONTAP SnapLock volume.
  final AutocommitPeriod? autocommitPeriod;

  /// Enables, disables, or permanently disables privileged delete on an FSx for
  /// ONTAP SnapLock Enterprise volume. Enabling privileged delete allows SnapLock
  /// administrators to delete write once, read many (WORM) files even if they
  /// have active retention periods. <code>PERMANENTLY_DISABLED</code> is a
  /// terminal state. If privileged delete is permanently disabled on a SnapLock
  /// volume, you can't re-enable it. The default value is <code>DISABLED</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/snaplock-enterprise.html#privileged-delete">Privileged
  /// delete</a>.
  final PrivilegedDelete? privilegedDelete;

  /// Specifies the retention period of an FSx for ONTAP SnapLock volume.
  final SnaplockRetentionPeriod? retentionPeriod;

  /// Enables or disables volume-append mode on an FSx for ONTAP SnapLock volume.
  /// Volume-append mode allows you to create WORM-appendable files and write data
  /// to them incrementally. The default value is <code>false</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/ONTAPGuide/worm-state.html#worm-state-append">Volume-append
  /// mode</a>.
  final bool? volumeAppendModeEnabled;

  UpdateSnaplockConfiguration({
    this.auditLogVolume,
    this.autocommitPeriod,
    this.privilegedDelete,
    this.retentionPeriod,
    this.volumeAppendModeEnabled,
  });

  Map<String, dynamic> toJson() {
    final auditLogVolume = this.auditLogVolume;
    final autocommitPeriod = this.autocommitPeriod;
    final privilegedDelete = this.privilegedDelete;
    final retentionPeriod = this.retentionPeriod;
    final volumeAppendModeEnabled = this.volumeAppendModeEnabled;
    return {
      if (auditLogVolume != null) 'AuditLogVolume': auditLogVolume,
      if (autocommitPeriod != null) 'AutocommitPeriod': autocommitPeriod,
      if (privilegedDelete != null)
        'PrivilegedDelete': privilegedDelete.toValue(),
      if (retentionPeriod != null) 'RetentionPeriod': retentionPeriod,
      if (volumeAppendModeEnabled != null)
        'VolumeAppendModeEnabled': volumeAppendModeEnabled,
    };
  }
}

class UpdateSnapshotResponse {
  /// Returned after a successful <code>UpdateSnapshot</code> operation,
  /// describing the snapshot that you updated.
  final Snapshot? snapshot;

  UpdateSnapshotResponse({
    this.snapshot,
  });

  factory UpdateSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSnapshotResponse(
      snapshot: json['Snapshot'] != null
          ? Snapshot.fromJson(json['Snapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshot = this.snapshot;
    return {
      if (snapshot != null) 'Snapshot': snapshot,
    };
  }
}

class UpdateStorageVirtualMachineResponse {
  final StorageVirtualMachine? storageVirtualMachine;

  UpdateStorageVirtualMachineResponse({
    this.storageVirtualMachine,
  });

  factory UpdateStorageVirtualMachineResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateStorageVirtualMachineResponse(
      storageVirtualMachine: json['StorageVirtualMachine'] != null
          ? StorageVirtualMachine.fromJson(
              json['StorageVirtualMachine'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageVirtualMachine = this.storageVirtualMachine;
    return {
      if (storageVirtualMachine != null)
        'StorageVirtualMachine': storageVirtualMachine,
    };
  }
}

/// Specifies updates to an FSx for ONTAP storage virtual machine's (SVM)
/// Microsoft Active Directory (AD) configuration. Note that account credentials
/// are not returned in the response payload.
class UpdateSvmActiveDirectoryConfiguration {
  /// Specifies an updated NetBIOS name of the AD computer object
  /// <code>NetBiosName</code> to which an SVM is joined.
  final String? netBiosName;
  final SelfManagedActiveDirectoryConfigurationUpdates?
      selfManagedActiveDirectoryConfiguration;

  UpdateSvmActiveDirectoryConfiguration({
    this.netBiosName,
    this.selfManagedActiveDirectoryConfiguration,
  });

  Map<String, dynamic> toJson() {
    final netBiosName = this.netBiosName;
    final selfManagedActiveDirectoryConfiguration =
        this.selfManagedActiveDirectoryConfiguration;
    return {
      if (netBiosName != null) 'NetBiosName': netBiosName,
      if (selfManagedActiveDirectoryConfiguration != null)
        'SelfManagedActiveDirectoryConfiguration':
            selfManagedActiveDirectoryConfiguration,
    };
  }
}

class UpdateVolumeResponse {
  /// A description of the volume just updated. Returned after a successful
  /// <code>UpdateVolume</code> API operation.
  final Volume? volume;

  UpdateVolumeResponse({
    this.volume,
  });

  factory UpdateVolumeResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVolumeResponse(
      volume: json['Volume'] != null
          ? Volume.fromJson(json['Volume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final volume = this.volume;
    return {
      if (volume != null) 'Volume': volume,
    };
  }
}

/// Describes an Amazon FSx volume.
class Volume {
  /// A list of administrative actions for the volume that are in process or
  /// waiting to be processed. Administrative actions describe changes to the
  /// volume that you have initiated using the <code>UpdateVolume</code> action.
  final List<AdministrativeAction>? administrativeActions;
  final DateTime? creationTime;
  final String? fileSystemId;

  /// The lifecycle status of the volume.
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The volume is fully available for use.
  /// </li>
  /// <li>
  /// <code>CREATED</code> - The volume has been created.
  /// </li>
  /// <li>
  /// <code>CREATING</code> - Amazon FSx is creating the new volume.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - Amazon FSx is deleting an existing volume.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Amazon FSx was unable to create the volume.
  /// </li>
  /// <li>
  /// <code>MISCONFIGURED</code> - The volume is in a failed but recoverable
  /// state.
  /// </li>
  /// <li>
  /// <code>PENDING</code> - Amazon FSx hasn't started creating the volume.
  /// </li>
  /// </ul>
  final VolumeLifecycle? lifecycle;

  /// The reason why the volume lifecycle status changed.
  final LifecycleTransitionReason? lifecycleTransitionReason;

  /// The name of the volume.
  final String? name;
  final OntapVolumeConfiguration? ontapConfiguration;

  /// The configuration of an Amazon FSx for OpenZFS volume.
  final OpenZFSVolumeConfiguration? openZFSConfiguration;
  final String? resourceARN;
  final List<Tag>? tags;

  /// The system-generated, unique ID of the volume.
  final String? volumeId;

  /// The type of the volume.
  final VolumeType? volumeType;

  Volume({
    this.administrativeActions,
    this.creationTime,
    this.fileSystemId,
    this.lifecycle,
    this.lifecycleTransitionReason,
    this.name,
    this.ontapConfiguration,
    this.openZFSConfiguration,
    this.resourceARN,
    this.tags,
    this.volumeId,
    this.volumeType,
  });

  factory Volume.fromJson(Map<String, dynamic> json) {
    return Volume(
      administrativeActions: (json['AdministrativeActions'] as List?)
          ?.whereNotNull()
          .map((e) => AdministrativeAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      fileSystemId: json['FileSystemId'] as String?,
      lifecycle: (json['Lifecycle'] as String?)?.toVolumeLifecycle(),
      lifecycleTransitionReason: json['LifecycleTransitionReason'] != null
          ? LifecycleTransitionReason.fromJson(
              json['LifecycleTransitionReason'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      ontapConfiguration: json['OntapConfiguration'] != null
          ? OntapVolumeConfiguration.fromJson(
              json['OntapConfiguration'] as Map<String, dynamic>)
          : null,
      openZFSConfiguration: json['OpenZFSConfiguration'] != null
          ? OpenZFSVolumeConfiguration.fromJson(
              json['OpenZFSConfiguration'] as Map<String, dynamic>)
          : null,
      resourceARN: json['ResourceARN'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeId: json['VolumeId'] as String?,
      volumeType: (json['VolumeType'] as String?)?.toVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final administrativeActions = this.administrativeActions;
    final creationTime = this.creationTime;
    final fileSystemId = this.fileSystemId;
    final lifecycle = this.lifecycle;
    final lifecycleTransitionReason = this.lifecycleTransitionReason;
    final name = this.name;
    final ontapConfiguration = this.ontapConfiguration;
    final openZFSConfiguration = this.openZFSConfiguration;
    final resourceARN = this.resourceARN;
    final tags = this.tags;
    final volumeId = this.volumeId;
    final volumeType = this.volumeType;
    return {
      if (administrativeActions != null)
        'AdministrativeActions': administrativeActions,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (fileSystemId != null) 'FileSystemId': fileSystemId,
      if (lifecycle != null) 'Lifecycle': lifecycle.toValue(),
      if (lifecycleTransitionReason != null)
        'LifecycleTransitionReason': lifecycleTransitionReason,
      if (name != null) 'Name': name,
      if (ontapConfiguration != null) 'OntapConfiguration': ontapConfiguration,
      if (openZFSConfiguration != null)
        'OpenZFSConfiguration': openZFSConfiguration,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (tags != null) 'Tags': tags,
      if (volumeId != null) 'VolumeId': volumeId,
      if (volumeType != null) 'VolumeType': volumeType.toValue(),
    };
  }
}

/// A filter used to restrict the results of describe calls for Amazon FSx for
/// NetApp ONTAP or Amazon FSx for OpenZFS volumes. You can use multiple filters
/// to return results that meet all applied filter requirements.
class VolumeFilter {
  /// The name for this filter.
  final VolumeFilterName? name;

  /// The values of the filter. These are all the values for any of the applied
  /// filters.
  final List<String>? values;

  VolumeFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name.toValue(),
      if (values != null) 'Values': values,
    };
  }
}

enum VolumeFilterName {
  fileSystemId,
  storageVirtualMachineId,
}

extension VolumeFilterNameValueExtension on VolumeFilterName {
  String toValue() {
    switch (this) {
      case VolumeFilterName.fileSystemId:
        return 'file-system-id';
      case VolumeFilterName.storageVirtualMachineId:
        return 'storage-virtual-machine-id';
    }
  }
}

extension VolumeFilterNameFromString on String {
  VolumeFilterName toVolumeFilterName() {
    switch (this) {
      case 'file-system-id':
        return VolumeFilterName.fileSystemId;
      case 'storage-virtual-machine-id':
        return VolumeFilterName.storageVirtualMachineId;
    }
    throw Exception('$this is not known in enum VolumeFilterName');
  }
}

enum VolumeLifecycle {
  creating,
  created,
  deleting,
  failed,
  misconfigured,
  pending,
  available,
}

extension VolumeLifecycleValueExtension on VolumeLifecycle {
  String toValue() {
    switch (this) {
      case VolumeLifecycle.creating:
        return 'CREATING';
      case VolumeLifecycle.created:
        return 'CREATED';
      case VolumeLifecycle.deleting:
        return 'DELETING';
      case VolumeLifecycle.failed:
        return 'FAILED';
      case VolumeLifecycle.misconfigured:
        return 'MISCONFIGURED';
      case VolumeLifecycle.pending:
        return 'PENDING';
      case VolumeLifecycle.available:
        return 'AVAILABLE';
    }
  }
}

extension VolumeLifecycleFromString on String {
  VolumeLifecycle toVolumeLifecycle() {
    switch (this) {
      case 'CREATING':
        return VolumeLifecycle.creating;
      case 'CREATED':
        return VolumeLifecycle.created;
      case 'DELETING':
        return VolumeLifecycle.deleting;
      case 'FAILED':
        return VolumeLifecycle.failed;
      case 'MISCONFIGURED':
        return VolumeLifecycle.misconfigured;
      case 'PENDING':
        return VolumeLifecycle.pending;
      case 'AVAILABLE':
        return VolumeLifecycle.available;
    }
    throw Exception('$this is not known in enum VolumeLifecycle');
  }
}

enum VolumeStyle {
  flexvol,
  flexgroup,
}

extension VolumeStyleValueExtension on VolumeStyle {
  String toValue() {
    switch (this) {
      case VolumeStyle.flexvol:
        return 'FLEXVOL';
      case VolumeStyle.flexgroup:
        return 'FLEXGROUP';
    }
  }
}

extension VolumeStyleFromString on String {
  VolumeStyle toVolumeStyle() {
    switch (this) {
      case 'FLEXVOL':
        return VolumeStyle.flexvol;
      case 'FLEXGROUP':
        return VolumeStyle.flexgroup;
    }
    throw Exception('$this is not known in enum VolumeStyle');
  }
}

enum VolumeType {
  ontap,
  openzfs,
}

extension VolumeTypeValueExtension on VolumeType {
  String toValue() {
    switch (this) {
      case VolumeType.ontap:
        return 'ONTAP';
      case VolumeType.openzfs:
        return 'OPENZFS';
    }
  }
}

extension VolumeTypeFromString on String {
  VolumeType toVolumeType() {
    switch (this) {
      case 'ONTAP':
        return VolumeType.ontap;
      case 'OPENZFS':
        return VolumeType.openzfs;
    }
    throw Exception('$this is not known in enum VolumeType');
  }
}

enum WindowsAccessAuditLogLevel {
  disabled,
  successOnly,
  failureOnly,
  successAndFailure,
}

extension WindowsAccessAuditLogLevelValueExtension
    on WindowsAccessAuditLogLevel {
  String toValue() {
    switch (this) {
      case WindowsAccessAuditLogLevel.disabled:
        return 'DISABLED';
      case WindowsAccessAuditLogLevel.successOnly:
        return 'SUCCESS_ONLY';
      case WindowsAccessAuditLogLevel.failureOnly:
        return 'FAILURE_ONLY';
      case WindowsAccessAuditLogLevel.successAndFailure:
        return 'SUCCESS_AND_FAILURE';
    }
  }
}

extension WindowsAccessAuditLogLevelFromString on String {
  WindowsAccessAuditLogLevel toWindowsAccessAuditLogLevel() {
    switch (this) {
      case 'DISABLED':
        return WindowsAccessAuditLogLevel.disabled;
      case 'SUCCESS_ONLY':
        return WindowsAccessAuditLogLevel.successOnly;
      case 'FAILURE_ONLY':
        return WindowsAccessAuditLogLevel.failureOnly;
      case 'SUCCESS_AND_FAILURE':
        return WindowsAccessAuditLogLevel.successAndFailure;
    }
    throw Exception('$this is not known in enum WindowsAccessAuditLogLevel');
  }
}

/// The configuration that Amazon FSx for Windows File Server uses to audit and
/// log user accesses of files, folders, and file shares on the Amazon FSx for
/// Windows File Server file system. For more information, see <a
/// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/file-access-auditing.html">
/// File access auditing</a>.
class WindowsAuditLogConfiguration {
  /// Sets which attempt type is logged by Amazon FSx for file and folder
  /// accesses.
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCESS_ONLY</code> - only successful attempts to access files or
  /// folders are logged.
  /// </li>
  /// <li>
  /// <code>FAILURE_ONLY</code> - only failed attempts to access files or folders
  /// are logged.
  /// </li>
  /// <li>
  /// <code>SUCCESS_AND_FAILURE</code> - both successful attempts and failed
  /// attempts to access files or folders are logged.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - access auditing of files and folders is turned off.
  /// </li>
  /// </ul>
  final WindowsAccessAuditLogLevel fileAccessAuditLogLevel;

  /// Sets which attempt type is logged by Amazon FSx for file share accesses.
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCESS_ONLY</code> - only successful attempts to access file shares
  /// are logged.
  /// </li>
  /// <li>
  /// <code>FAILURE_ONLY</code> - only failed attempts to access file shares are
  /// logged.
  /// </li>
  /// <li>
  /// <code>SUCCESS_AND_FAILURE</code> - both successful attempts and failed
  /// attempts to access file shares are logged.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - access auditing of file shares is turned off.
  /// </li>
  /// </ul>
  final WindowsAccessAuditLogLevel fileShareAccessAuditLogLevel;

  /// The Amazon Resource Name (ARN) for the destination of the audit logs. The
  /// destination can be any Amazon CloudWatch Logs log group ARN or Amazon
  /// Kinesis Data Firehose delivery stream ARN.
  ///
  /// The name of the Amazon CloudWatch Logs log group must begin with the
  /// <code>/aws/fsx</code> prefix. The name of the Amazon Kinesis Data Firehose
  /// delivery stream must begin with the <code>aws-fsx</code> prefix.
  ///
  /// The destination ARN (either CloudWatch Logs log group or Kinesis Data
  /// Firehose delivery stream) must be in the same Amazon Web Services partition,
  /// Amazon Web Services Region, and Amazon Web Services account as your Amazon
  /// FSx file system.
  final String? auditLogDestination;

  WindowsAuditLogConfiguration({
    required this.fileAccessAuditLogLevel,
    required this.fileShareAccessAuditLogLevel,
    this.auditLogDestination,
  });

  factory WindowsAuditLogConfiguration.fromJson(Map<String, dynamic> json) {
    return WindowsAuditLogConfiguration(
      fileAccessAuditLogLevel: (json['FileAccessAuditLogLevel'] as String)
          .toWindowsAccessAuditLogLevel(),
      fileShareAccessAuditLogLevel:
          (json['FileShareAccessAuditLogLevel'] as String)
              .toWindowsAccessAuditLogLevel(),
      auditLogDestination: json['AuditLogDestination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileAccessAuditLogLevel = this.fileAccessAuditLogLevel;
    final fileShareAccessAuditLogLevel = this.fileShareAccessAuditLogLevel;
    final auditLogDestination = this.auditLogDestination;
    return {
      'FileAccessAuditLogLevel': fileAccessAuditLogLevel.toValue(),
      'FileShareAccessAuditLogLevel': fileShareAccessAuditLogLevel.toValue(),
      if (auditLogDestination != null)
        'AuditLogDestination': auditLogDestination,
    };
  }
}

/// The Windows file access auditing configuration used when creating or
/// updating an Amazon FSx for Windows File Server file system.
class WindowsAuditLogCreateConfiguration {
  /// Sets which attempt type is logged by Amazon FSx for file and folder
  /// accesses.
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCESS_ONLY</code> - only successful attempts to access files or
  /// folders are logged.
  /// </li>
  /// <li>
  /// <code>FAILURE_ONLY</code> - only failed attempts to access files or folders
  /// are logged.
  /// </li>
  /// <li>
  /// <code>SUCCESS_AND_FAILURE</code> - both successful attempts and failed
  /// attempts to access files or folders are logged.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - access auditing of files and folders is turned off.
  /// </li>
  /// </ul>
  final WindowsAccessAuditLogLevel fileAccessAuditLogLevel;

  /// Sets which attempt type is logged by Amazon FSx for file share accesses.
  ///
  /// <ul>
  /// <li>
  /// <code>SUCCESS_ONLY</code> - only successful attempts to access file shares
  /// are logged.
  /// </li>
  /// <li>
  /// <code>FAILURE_ONLY</code> - only failed attempts to access file shares are
  /// logged.
  /// </li>
  /// <li>
  /// <code>SUCCESS_AND_FAILURE</code> - both successful attempts and failed
  /// attempts to access file shares are logged.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - access auditing of file shares is turned off.
  /// </li>
  /// </ul>
  final WindowsAccessAuditLogLevel fileShareAccessAuditLogLevel;

  /// The Amazon Resource Name (ARN) that specifies the destination of the audit
  /// logs.
  ///
  /// The destination can be any Amazon CloudWatch Logs log group ARN or Amazon
  /// Kinesis Data Firehose delivery stream ARN, with the following requirements:
  ///
  /// <ul>
  /// <li>
  /// The destination ARN that you provide (either CloudWatch Logs log group or
  /// Kinesis Data Firehose delivery stream) must be in the same Amazon Web
  /// Services partition, Amazon Web Services Region, and Amazon Web Services
  /// account as your Amazon FSx file system.
  /// </li>
  /// <li>
  /// The name of the Amazon CloudWatch Logs log group must begin with the
  /// <code>/aws/fsx</code> prefix. The name of the Amazon Kinesis Data Firehose
  /// delivery stream must begin with the <code>aws-fsx</code> prefix.
  /// </li>
  /// <li>
  /// If you do not provide a destination in <code>AuditLogDestination</code>,
  /// Amazon FSx will create and use a log stream in the CloudWatch Logs
  /// <code>/aws/fsx/windows</code> log group.
  /// </li>
  /// <li>
  /// If <code>AuditLogDestination</code> is provided and the resource does not
  /// exist, the request will fail with a <code>BadRequest</code> error.
  /// </li>
  /// <li>
  /// If <code>FileAccessAuditLogLevel</code> and
  /// <code>FileShareAccessAuditLogLevel</code> are both set to
  /// <code>DISABLED</code>, you cannot specify a destination in
  /// <code>AuditLogDestination</code>.
  /// </li>
  /// </ul>
  final String? auditLogDestination;

  WindowsAuditLogCreateConfiguration({
    required this.fileAccessAuditLogLevel,
    required this.fileShareAccessAuditLogLevel,
    this.auditLogDestination,
  });

  Map<String, dynamic> toJson() {
    final fileAccessAuditLogLevel = this.fileAccessAuditLogLevel;
    final fileShareAccessAuditLogLevel = this.fileShareAccessAuditLogLevel;
    final auditLogDestination = this.auditLogDestination;
    return {
      'FileAccessAuditLogLevel': fileAccessAuditLogLevel.toValue(),
      'FileShareAccessAuditLogLevel': fileShareAccessAuditLogLevel.toValue(),
      if (auditLogDestination != null)
        'AuditLogDestination': auditLogDestination,
    };
  }
}

enum WindowsDeploymentType {
  multiAz_1,
  singleAz_1,
  singleAz_2,
}

extension WindowsDeploymentTypeValueExtension on WindowsDeploymentType {
  String toValue() {
    switch (this) {
      case WindowsDeploymentType.multiAz_1:
        return 'MULTI_AZ_1';
      case WindowsDeploymentType.singleAz_1:
        return 'SINGLE_AZ_1';
      case WindowsDeploymentType.singleAz_2:
        return 'SINGLE_AZ_2';
    }
  }
}

extension WindowsDeploymentTypeFromString on String {
  WindowsDeploymentType toWindowsDeploymentType() {
    switch (this) {
      case 'MULTI_AZ_1':
        return WindowsDeploymentType.multiAz_1;
      case 'SINGLE_AZ_1':
        return WindowsDeploymentType.singleAz_1;
      case 'SINGLE_AZ_2':
        return WindowsDeploymentType.singleAz_2;
    }
    throw Exception('$this is not known in enum WindowsDeploymentType');
  }
}

/// The configuration for this Microsoft Windows file system.
class WindowsFileSystemConfiguration {
  /// The ID for an existing Amazon Web Services Managed Microsoft Active
  /// Directory instance that the file system is joined to.
  final String? activeDirectoryId;
  final List<Alias>? aliases;

  /// The configuration that Amazon FSx for Windows File Server uses to audit and
  /// log user accesses of files, folders, and file shares on the Amazon FSx for
  /// Windows File Server file system.
  final WindowsAuditLogConfiguration? auditLogConfiguration;

  /// The number of days to retain automatic backups. Setting this to 0 disables
  /// automatic backups. You can retain automatic backups for a maximum of 90
  /// days.
  final int? automaticBackupRetentionDays;

  /// A boolean flag indicating whether tags on the file system should be copied
  /// to backups. This value defaults to false. If it's set to true, all tags on
  /// the file system are copied to all automatic backups and any user-initiated
  /// backups where the user doesn't specify any tags. If this value is true, and
  /// you specify one or more tags, only the specified tags are copied to backups.
  /// If you specify one or more tags when creating a user-initiated backup, no
  /// tags are copied from the file system, regardless of this value.
  final bool? copyTagsToBackups;

  /// The preferred time to take daily automatic backups, in the UTC time zone.
  final String? dailyAutomaticBackupStartTime;

  /// Specifies the file system deployment type, valid values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>MULTI_AZ_1</code> - Specifies a high availability file system that is
  /// configured for Multi-AZ redundancy to tolerate temporary Availability Zone
  /// (AZ) unavailability, and supports SSD and HDD storage.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_1</code> - (Default) Specifies a file system that is
  /// configured for single AZ redundancy, only supports SSD storage.
  /// </li>
  /// <li>
  /// <code>SINGLE_AZ_2</code> - Latest generation Single AZ file system.
  /// Specifies a file system that is configured for single AZ redundancy and
  /// supports SSD and HDD storage.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html">Single-AZ
  /// and Multi-AZ File Systems</a>.
  final WindowsDeploymentType? deploymentType;

  /// The SSD IOPS (input/output operations per second) configuration for an
  /// Amazon FSx for Windows file system. By default, Amazon FSx automatically
  /// provisions 3 IOPS per GiB of storage capacity. You can provision additional
  /// IOPS per GiB of storage, up to the maximum limit associated with your chosen
  /// throughput capacity.
  final DiskIopsConfiguration? diskIopsConfiguration;

  /// The list of maintenance operations in progress for this file system.
  final List<FileSystemMaintenanceOperation>? maintenanceOperationsInProgress;

  /// For <code>MULTI_AZ_1</code> deployment types, the IP address of the primary,
  /// or preferred, file server.
  ///
  /// Use this IP address when mounting the file system on Linux SMB clients or
  /// Windows SMB clients that are not joined to a Microsoft Active Directory.
  /// Applicable for all Windows file system deployment types. This IP address is
  /// temporarily unavailable when the file system is undergoing maintenance. For
  /// Linux and Windows SMB clients that are joined to an Active Directory, use
  /// the file system's DNSName instead. For more information on mapping and
  /// mounting file shares, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/accessing-file-shares.html">Accessing
  /// File Shares</a>.
  final String? preferredFileServerIp;

  /// For <code>MULTI_AZ_1</code> deployment types, it specifies the ID of the
  /// subnet where the preferred file server is located. Must be one of the two
  /// subnet IDs specified in <code>SubnetIds</code> property. Amazon FSx serves
  /// traffic from this subnet except in the event of a failover to the secondary
  /// file server.
  ///
  /// For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types,
  /// this value is the same as that for <code>SubnetIDs</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/high-availability-multiAZ.html#single-multi-az-resources">Availability
  /// and durability: Single-AZ and Multi-AZ file systems</a>.
  final String? preferredSubnetId;

  /// For <code>MULTI_AZ_1</code> deployment types, use this endpoint when
  /// performing administrative tasks on the file system using Amazon FSx Remote
  /// PowerShell.
  ///
  /// For <code>SINGLE_AZ_1</code> and <code>SINGLE_AZ_2</code> deployment types,
  /// this is the DNS name of the file system.
  ///
  /// This endpoint is temporarily unavailable when the file system is undergoing
  /// maintenance.
  final String? remoteAdministrationEndpoint;
  final SelfManagedActiveDirectoryAttributes?
      selfManagedActiveDirectoryConfiguration;

  /// The throughput of the Amazon FSx file system, measured in megabytes per
  /// second.
  final int? throughputCapacity;

  /// The preferred start time to perform weekly maintenance, formatted d:HH:MM in
  /// the UTC time zone. d is the weekday number, from 1 through 7, beginning with
  /// Monday and ending with Sunday.
  final String? weeklyMaintenanceStartTime;

  WindowsFileSystemConfiguration({
    this.activeDirectoryId,
    this.aliases,
    this.auditLogConfiguration,
    this.automaticBackupRetentionDays,
    this.copyTagsToBackups,
    this.dailyAutomaticBackupStartTime,
    this.deploymentType,
    this.diskIopsConfiguration,
    this.maintenanceOperationsInProgress,
    this.preferredFileServerIp,
    this.preferredSubnetId,
    this.remoteAdministrationEndpoint,
    this.selfManagedActiveDirectoryConfiguration,
    this.throughputCapacity,
    this.weeklyMaintenanceStartTime,
  });

  factory WindowsFileSystemConfiguration.fromJson(Map<String, dynamic> json) {
    return WindowsFileSystemConfiguration(
      activeDirectoryId: json['ActiveDirectoryId'] as String?,
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => Alias.fromJson(e as Map<String, dynamic>))
          .toList(),
      auditLogConfiguration: json['AuditLogConfiguration'] != null
          ? WindowsAuditLogConfiguration.fromJson(
              json['AuditLogConfiguration'] as Map<String, dynamic>)
          : null,
      automaticBackupRetentionDays:
          json['AutomaticBackupRetentionDays'] as int?,
      copyTagsToBackups: json['CopyTagsToBackups'] as bool?,
      dailyAutomaticBackupStartTime:
          json['DailyAutomaticBackupStartTime'] as String?,
      deploymentType:
          (json['DeploymentType'] as String?)?.toWindowsDeploymentType(),
      diskIopsConfiguration: json['DiskIopsConfiguration'] != null
          ? DiskIopsConfiguration.fromJson(
              json['DiskIopsConfiguration'] as Map<String, dynamic>)
          : null,
      maintenanceOperationsInProgress:
          (json['MaintenanceOperationsInProgress'] as List?)
              ?.whereNotNull()
              .map((e) => (e as String).toFileSystemMaintenanceOperation())
              .toList(),
      preferredFileServerIp: json['PreferredFileServerIp'] as String?,
      preferredSubnetId: json['PreferredSubnetId'] as String?,
      remoteAdministrationEndpoint:
          json['RemoteAdministrationEndpoint'] as String?,
      selfManagedActiveDirectoryConfiguration:
          json['SelfManagedActiveDirectoryConfiguration'] != null
              ? SelfManagedActiveDirectoryAttributes.fromJson(
                  json['SelfManagedActiveDirectoryConfiguration']
                      as Map<String, dynamic>)
              : null,
      throughputCapacity: json['ThroughputCapacity'] as int?,
      weeklyMaintenanceStartTime: json['WeeklyMaintenanceStartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryId = this.activeDirectoryId;
    final aliases = this.aliases;
    final auditLogConfiguration = this.auditLogConfiguration;
    final automaticBackupRetentionDays = this.automaticBackupRetentionDays;
    final copyTagsToBackups = this.copyTagsToBackups;
    final dailyAutomaticBackupStartTime = this.dailyAutomaticBackupStartTime;
    final deploymentType = this.deploymentType;
    final diskIopsConfiguration = this.diskIopsConfiguration;
    final maintenanceOperationsInProgress =
        this.maintenanceOperationsInProgress;
    final preferredFileServerIp = this.preferredFileServerIp;
    final preferredSubnetId = this.preferredSubnetId;
    final remoteAdministrationEndpoint = this.remoteAdministrationEndpoint;
    final selfManagedActiveDirectoryConfiguration =
        this.selfManagedActiveDirectoryConfiguration;
    final throughputCapacity = this.throughputCapacity;
    final weeklyMaintenanceStartTime = this.weeklyMaintenanceStartTime;
    return {
      if (activeDirectoryId != null) 'ActiveDirectoryId': activeDirectoryId,
      if (aliases != null) 'Aliases': aliases,
      if (auditLogConfiguration != null)
        'AuditLogConfiguration': auditLogConfiguration,
      if (automaticBackupRetentionDays != null)
        'AutomaticBackupRetentionDays': automaticBackupRetentionDays,
      if (copyTagsToBackups != null) 'CopyTagsToBackups': copyTagsToBackups,
      if (dailyAutomaticBackupStartTime != null)
        'DailyAutomaticBackupStartTime': dailyAutomaticBackupStartTime,
      if (deploymentType != null) 'DeploymentType': deploymentType.toValue(),
      if (diskIopsConfiguration != null)
        'DiskIopsConfiguration': diskIopsConfiguration,
      if (maintenanceOperationsInProgress != null)
        'MaintenanceOperationsInProgress':
            maintenanceOperationsInProgress.map((e) => e.toValue()).toList(),
      if (preferredFileServerIp != null)
        'PreferredFileServerIp': preferredFileServerIp,
      if (preferredSubnetId != null) 'PreferredSubnetId': preferredSubnetId,
      if (remoteAdministrationEndpoint != null)
        'RemoteAdministrationEndpoint': remoteAdministrationEndpoint,
      if (selfManagedActiveDirectoryConfiguration != null)
        'SelfManagedActiveDirectoryConfiguration':
            selfManagedActiveDirectoryConfiguration,
      if (throughputCapacity != null) 'ThroughputCapacity': throughputCapacity,
      if (weeklyMaintenanceStartTime != null)
        'WeeklyMaintenanceStartTime': weeklyMaintenanceStartTime,
    };
  }
}

class ActiveDirectoryError extends _s.GenericAwsException {
  ActiveDirectoryError({String? type, String? message})
      : super(type: type, code: 'ActiveDirectoryError', message: message);
}

class BackupBeingCopied extends _s.GenericAwsException {
  BackupBeingCopied({String? type, String? message})
      : super(type: type, code: 'BackupBeingCopied', message: message);
}

class BackupInProgress extends _s.GenericAwsException {
  BackupInProgress({String? type, String? message})
      : super(type: type, code: 'BackupInProgress', message: message);
}

class BackupNotFound extends _s.GenericAwsException {
  BackupNotFound({String? type, String? message})
      : super(type: type, code: 'BackupNotFound', message: message);
}

class BackupRestoring extends _s.GenericAwsException {
  BackupRestoring({String? type, String? message})
      : super(type: type, code: 'BackupRestoring', message: message);
}

class BadRequest extends _s.GenericAwsException {
  BadRequest({String? type, String? message})
      : super(type: type, code: 'BadRequest', message: message);
}

class DataRepositoryAssociationNotFound extends _s.GenericAwsException {
  DataRepositoryAssociationNotFound({String? type, String? message})
      : super(
            type: type,
            code: 'DataRepositoryAssociationNotFound',
            message: message);
}

class DataRepositoryTaskEnded extends _s.GenericAwsException {
  DataRepositoryTaskEnded({String? type, String? message})
      : super(type: type, code: 'DataRepositoryTaskEnded', message: message);
}

class DataRepositoryTaskExecuting extends _s.GenericAwsException {
  DataRepositoryTaskExecuting({String? type, String? message})
      : super(
            type: type, code: 'DataRepositoryTaskExecuting', message: message);
}

class DataRepositoryTaskNotFound extends _s.GenericAwsException {
  DataRepositoryTaskNotFound({String? type, String? message})
      : super(type: type, code: 'DataRepositoryTaskNotFound', message: message);
}

class FileCacheNotFound extends _s.GenericAwsException {
  FileCacheNotFound({String? type, String? message})
      : super(type: type, code: 'FileCacheNotFound', message: message);
}

class FileSystemNotFound extends _s.GenericAwsException {
  FileSystemNotFound({String? type, String? message})
      : super(type: type, code: 'FileSystemNotFound', message: message);
}

class IncompatibleParameterError extends _s.GenericAwsException {
  IncompatibleParameterError({String? type, String? message})
      : super(type: type, code: 'IncompatibleParameterError', message: message);
}

class IncompatibleRegionForMultiAZ extends _s.GenericAwsException {
  IncompatibleRegionForMultiAZ({String? type, String? message})
      : super(
            type: type, code: 'IncompatibleRegionForMultiAZ', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class InvalidDataRepositoryType extends _s.GenericAwsException {
  InvalidDataRepositoryType({String? type, String? message})
      : super(type: type, code: 'InvalidDataRepositoryType', message: message);
}

class InvalidDestinationKmsKey extends _s.GenericAwsException {
  InvalidDestinationKmsKey({String? type, String? message})
      : super(type: type, code: 'InvalidDestinationKmsKey', message: message);
}

class InvalidExportPath extends _s.GenericAwsException {
  InvalidExportPath({String? type, String? message})
      : super(type: type, code: 'InvalidExportPath', message: message);
}

class InvalidImportPath extends _s.GenericAwsException {
  InvalidImportPath({String? type, String? message})
      : super(type: type, code: 'InvalidImportPath', message: message);
}

class InvalidNetworkSettings extends _s.GenericAwsException {
  InvalidNetworkSettings({String? type, String? message})
      : super(type: type, code: 'InvalidNetworkSettings', message: message);
}

class InvalidPerUnitStorageThroughput extends _s.GenericAwsException {
  InvalidPerUnitStorageThroughput({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPerUnitStorageThroughput',
            message: message);
}

class InvalidRegion extends _s.GenericAwsException {
  InvalidRegion({String? type, String? message})
      : super(type: type, code: 'InvalidRegion', message: message);
}

class InvalidSourceKmsKey extends _s.GenericAwsException {
  InvalidSourceKmsKey({String? type, String? message})
      : super(type: type, code: 'InvalidSourceKmsKey', message: message);
}

class MissingFileCacheConfiguration extends _s.GenericAwsException {
  MissingFileCacheConfiguration({String? type, String? message})
      : super(
            type: type,
            code: 'MissingFileCacheConfiguration',
            message: message);
}

class MissingFileSystemConfiguration extends _s.GenericAwsException {
  MissingFileSystemConfiguration({String? type, String? message})
      : super(
            type: type,
            code: 'MissingFileSystemConfiguration',
            message: message);
}

class MissingVolumeConfiguration extends _s.GenericAwsException {
  MissingVolumeConfiguration({String? type, String? message})
      : super(type: type, code: 'MissingVolumeConfiguration', message: message);
}

class NotServiceResourceError extends _s.GenericAwsException {
  NotServiceResourceError({String? type, String? message})
      : super(type: type, code: 'NotServiceResourceError', message: message);
}

class ResourceDoesNotSupportTagging extends _s.GenericAwsException {
  ResourceDoesNotSupportTagging({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceDoesNotSupportTagging',
            message: message);
}

class ResourceNotFound extends _s.GenericAwsException {
  ResourceNotFound({String? type, String? message})
      : super(type: type, code: 'ResourceNotFound', message: message);
}

class ServiceLimitExceeded extends _s.GenericAwsException {
  ServiceLimitExceeded({String? type, String? message})
      : super(type: type, code: 'ServiceLimitExceeded', message: message);
}

class SnapshotNotFound extends _s.GenericAwsException {
  SnapshotNotFound({String? type, String? message})
      : super(type: type, code: 'SnapshotNotFound', message: message);
}

class SourceBackupUnavailable extends _s.GenericAwsException {
  SourceBackupUnavailable({String? type, String? message})
      : super(type: type, code: 'SourceBackupUnavailable', message: message);
}

class StorageVirtualMachineNotFound extends _s.GenericAwsException {
  StorageVirtualMachineNotFound({String? type, String? message})
      : super(
            type: type,
            code: 'StorageVirtualMachineNotFound',
            message: message);
}

class UnsupportedOperation extends _s.GenericAwsException {
  UnsupportedOperation({String? type, String? message})
      : super(type: type, code: 'UnsupportedOperation', message: message);
}

class VolumeNotFound extends _s.GenericAwsException {
  VolumeNotFound({String? type, String? message})
      : super(type: type, code: 'VolumeNotFound', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ActiveDirectoryError': (type, message) =>
      ActiveDirectoryError(type: type, message: message),
  'BackupBeingCopied': (type, message) =>
      BackupBeingCopied(type: type, message: message),
  'BackupInProgress': (type, message) =>
      BackupInProgress(type: type, message: message),
  'BackupNotFound': (type, message) =>
      BackupNotFound(type: type, message: message),
  'BackupRestoring': (type, message) =>
      BackupRestoring(type: type, message: message),
  'BadRequest': (type, message) => BadRequest(type: type, message: message),
  'DataRepositoryAssociationNotFound': (type, message) =>
      DataRepositoryAssociationNotFound(type: type, message: message),
  'DataRepositoryTaskEnded': (type, message) =>
      DataRepositoryTaskEnded(type: type, message: message),
  'DataRepositoryTaskExecuting': (type, message) =>
      DataRepositoryTaskExecuting(type: type, message: message),
  'DataRepositoryTaskNotFound': (type, message) =>
      DataRepositoryTaskNotFound(type: type, message: message),
  'FileCacheNotFound': (type, message) =>
      FileCacheNotFound(type: type, message: message),
  'FileSystemNotFound': (type, message) =>
      FileSystemNotFound(type: type, message: message),
  'IncompatibleParameterError': (type, message) =>
      IncompatibleParameterError(type: type, message: message),
  'IncompatibleRegionForMultiAZ': (type, message) =>
      IncompatibleRegionForMultiAZ(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'InvalidDataRepositoryType': (type, message) =>
      InvalidDataRepositoryType(type: type, message: message),
  'InvalidDestinationKmsKey': (type, message) =>
      InvalidDestinationKmsKey(type: type, message: message),
  'InvalidExportPath': (type, message) =>
      InvalidExportPath(type: type, message: message),
  'InvalidImportPath': (type, message) =>
      InvalidImportPath(type: type, message: message),
  'InvalidNetworkSettings': (type, message) =>
      InvalidNetworkSettings(type: type, message: message),
  'InvalidPerUnitStorageThroughput': (type, message) =>
      InvalidPerUnitStorageThroughput(type: type, message: message),
  'InvalidRegion': (type, message) =>
      InvalidRegion(type: type, message: message),
  'InvalidSourceKmsKey': (type, message) =>
      InvalidSourceKmsKey(type: type, message: message),
  'MissingFileCacheConfiguration': (type, message) =>
      MissingFileCacheConfiguration(type: type, message: message),
  'MissingFileSystemConfiguration': (type, message) =>
      MissingFileSystemConfiguration(type: type, message: message),
  'MissingVolumeConfiguration': (type, message) =>
      MissingVolumeConfiguration(type: type, message: message),
  'NotServiceResourceError': (type, message) =>
      NotServiceResourceError(type: type, message: message),
  'ResourceDoesNotSupportTagging': (type, message) =>
      ResourceDoesNotSupportTagging(type: type, message: message),
  'ResourceNotFound': (type, message) =>
      ResourceNotFound(type: type, message: message),
  'ServiceLimitExceeded': (type, message) =>
      ServiceLimitExceeded(type: type, message: message),
  'SnapshotNotFound': (type, message) =>
      SnapshotNotFound(type: type, message: message),
  'SourceBackupUnavailable': (type, message) =>
      SourceBackupUnavailable(type: type, message: message),
  'StorageVirtualMachineNotFound': (type, message) =>
      StorageVirtualMachineNotFound(type: type, message: message),
  'UnsupportedOperation': (type, message) =>
      UnsupportedOperation(type: type, message: message),
  'VolumeNotFound': (type, message) =>
      VolumeNotFound(type: type, message: message),
};
