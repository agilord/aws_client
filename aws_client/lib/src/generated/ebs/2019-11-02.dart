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

/// You can use the Amazon Elastic Block Store (Amazon EBS) direct APIs to
/// create EBS snapshots, write data directly to your snapshots, read data on
/// your snapshots, and identify the differences or changes between two
/// snapshots. If you’re an independent software vendor (ISV) who offers backup
/// services for Amazon EBS, the EBS direct APIs make it more efficient and
/// cost-effective to track incremental changes on your EBS volumes through
/// snapshots. This can be done without having to create new volumes from
/// snapshots, and then use Amazon Elastic Compute Cloud (Amazon EC2) instances
/// to compare the differences.
///
/// You can create incremental snapshots directly from data on-premises into EBS
/// volumes and the cloud to use for quick disaster recovery. With the ability
/// to write and read snapshots, you can write your on-premises data to an EBS
/// snapshot during a disaster. Then after recovery, you can restore it back to
/// AWS or on-premises from the snapshot. You no longer need to build and
/// maintain complex mechanisms to copy data to and from Amazon EBS.
///
/// This API reference provides detailed information about the actions, data
/// types, parameters, and errors of the EBS direct APIs. For more information
/// about the elements that make up the EBS direct APIs, and examples of how to
/// use them effectively, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-accessing-snapshot.html">Accessing
/// the Contents of an EBS Snapshot</a> in the <i>Amazon Elastic Compute Cloud
/// User Guide</i>. For more information about the supported AWS Regions,
/// endpoints, and service quotas for the EBS direct APIs, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/ebs-service.html">Amazon
/// Elastic Block Store Endpoints and Quotas</a> in the <i>AWS General
/// Reference</i>.
class Ebs {
  final _s.RestJsonProtocol _protocol;
  Ebs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ebs',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Seals and completes the snapshot after all of the required blocks of data
  /// have been written to it. Completing the snapshot changes the status to
  /// <code>completed</code>. You cannot write new blocks to a snapshot after it
  /// has been completed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestThrottledException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [changedBlocksCount] :
  /// The number of blocks that were written to the snapshot.
  ///
  /// Parameter [snapshotId] :
  /// The ID of the snapshot.
  ///
  /// Parameter [checksum] :
  /// An aggregated Base-64 SHA256 checksum based on the checksums of each
  /// written block.
  ///
  /// To generate the aggregated checksum using the linear aggregation method,
  /// arrange the checksums for each written block in ascending order of their
  /// block index, concatenate them to form a single string, and then generate
  /// the checksum on the entire string using the SHA256 algorithm.
  ///
  /// Parameter [checksumAggregationMethod] :
  /// The aggregation method used to generate the checksum. Currently, the only
  /// supported aggregation method is <code>LINEAR</code>.
  ///
  /// Parameter [checksumAlgorithm] :
  /// The algorithm used to generate the checksum. Currently, the only supported
  /// algorithm is <code>SHA256</code>.
  Future<CompleteSnapshotResponse> completeSnapshot({
    required int changedBlocksCount,
    required String snapshotId,
    String? checksum,
    ChecksumAggregationMethod? checksumAggregationMethod,
    ChecksumAlgorithm? checksumAlgorithm,
  }) async {
    ArgumentError.checkNotNull(changedBlocksCount, 'changedBlocksCount');
    _s.validateNumRange(
      'changedBlocksCount',
      changedBlocksCount,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringLength(
      'snapshotId',
      snapshotId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'checksum',
      checksum,
      0,
      64,
    );
    final headers = <String, String>{
      'x-amz-ChangedBlocksCount': changedBlocksCount.toString(),
      if (checksum != null) 'x-amz-Checksum': checksum.toString(),
      if (checksumAggregationMethod != null)
        'x-amz-Checksum-Aggregation-Method':
            checksumAggregationMethod.toValue(),
      if (checksumAlgorithm != null)
        'x-amz-Checksum-Algorithm': checksumAlgorithm.toValue(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/snapshots/completion/${Uri.encodeComponent(snapshotId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CompleteSnapshotResponse.fromJson(response);
  }

  /// Returns the data in a block in an Amazon Elastic Block Store snapshot.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestThrottledException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [blockIndex] :
  /// The block index of the block from which to get data.
  ///
  /// Obtain the <code>BlockIndex</code> by running the
  /// <code>ListChangedBlocks</code> or <code>ListSnapshotBlocks</code>
  /// operations.
  ///
  /// Parameter [blockToken] :
  /// The block token of the block from which to get data.
  ///
  /// Obtain the <code>BlockToken</code> by running the
  /// <code>ListChangedBlocks</code> or <code>ListSnapshotBlocks</code>
  /// operations.
  ///
  /// Parameter [snapshotId] :
  /// The ID of the snapshot containing the block from which to get data.
  Future<GetSnapshotBlockResponse> getSnapshotBlock({
    required int blockIndex,
    required String blockToken,
    required String snapshotId,
  }) async {
    ArgumentError.checkNotNull(blockIndex, 'blockIndex');
    _s.validateNumRange(
      'blockIndex',
      blockIndex,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(blockToken, 'blockToken');
    _s.validateStringLength(
      'blockToken',
      blockToken,
      0,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringLength(
      'snapshotId',
      snapshotId,
      1,
      64,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'blockToken': [blockToken],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/snapshots/${Uri.encodeComponent(snapshotId)}/blocks/${Uri.encodeComponent(blockIndex.toString())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSnapshotBlockResponse(
      blockData: await response.stream.toBytes(),
      checksum: _s.extractHeaderStringValue(response.headers, 'x-amz-Checksum'),
      checksumAlgorithm: _s
          .extractHeaderStringValue(
              response.headers, 'x-amz-Checksum-Algorithm')
          ?.toChecksumAlgorithm(),
      dataLength:
          _s.extractHeaderIntValue(response.headers, 'x-amz-Data-Length'),
    );
  }

  /// Returns information about the blocks that are different between two Amazon
  /// Elastic Block Store snapshots of the same volume/snapshot lineage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestThrottledException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [secondSnapshotId] :
  /// The ID of the second snapshot to use for the comparison.
  /// <important>
  /// The <code>SecondSnapshotId</code> parameter must be specified with a
  /// <code>FirstSnapshotID</code> parameter; otherwise, an error occurs.
  /// </important>
  ///
  /// Parameter [firstSnapshotId] :
  /// The ID of the first snapshot to use for the comparison.
  /// <important>
  /// The <code>FirstSnapshotID</code> parameter must be specified with a
  /// <code>SecondSnapshotId</code> parameter; otherwise, an error occurs.
  /// </important>
  ///
  /// Parameter [maxResults] :
  /// The number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  ///
  /// Parameter [startingBlockIndex] :
  /// The block index from which the comparison should start.
  ///
  /// The list in the response will start from this block index or the next
  /// valid block index in the snapshots.
  Future<ListChangedBlocksResponse> listChangedBlocks({
    required String secondSnapshotId,
    String? firstSnapshotId,
    int? maxResults,
    String? nextToken,
    int? startingBlockIndex,
  }) async {
    ArgumentError.checkNotNull(secondSnapshotId, 'secondSnapshotId');
    _s.validateStringLength(
      'secondSnapshotId',
      secondSnapshotId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringLength(
      'firstSnapshotId',
      firstSnapshotId,
      1,
      64,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      100,
      10000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      256,
    );
    _s.validateNumRange(
      'startingBlockIndex',
      startingBlockIndex,
      0,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (firstSnapshotId != null) 'firstSnapshotId': [firstSnapshotId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'pageToken': [nextToken],
      if (startingBlockIndex != null)
        'startingBlockIndex': [startingBlockIndex.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/snapshots/${Uri.encodeComponent(secondSnapshotId)}/changedblocks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChangedBlocksResponse.fromJson(response);
  }

  /// Returns information about the blocks in an Amazon Elastic Block Store
  /// snapshot.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestThrottledException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [snapshotId] :
  /// The ID of the snapshot from which to get block indexes and block tokens.
  ///
  /// Parameter [maxResults] :
  /// The number of results to return.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  ///
  /// Parameter [startingBlockIndex] :
  /// The block index from which the list should start. The list in the response
  /// will start from this block index or the next valid block index in the
  /// snapshot.
  Future<ListSnapshotBlocksResponse> listSnapshotBlocks({
    required String snapshotId,
    int? maxResults,
    String? nextToken,
    int? startingBlockIndex,
  }) async {
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringLength(
      'snapshotId',
      snapshotId,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      100,
      10000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      256,
    );
    _s.validateNumRange(
      'startingBlockIndex',
      startingBlockIndex,
      0,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'pageToken': [nextToken],
      if (startingBlockIndex != null)
        'startingBlockIndex': [startingBlockIndex.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/snapshots/${Uri.encodeComponent(snapshotId)}/blocks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSnapshotBlocksResponse.fromJson(response);
  }

  /// Writes a block of data to a snapshot. If the specified block contains
  /// data, the existing data is overwritten. The target snapshot must be in the
  /// <code>pending</code> state.
  ///
  /// Data written to a snapshot must be aligned with 512-byte sectors.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [RequestThrottledException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [blockData] :
  /// The data to write to the block.
  ///
  /// The block data is not signed as part of the Signature Version 4 signing
  /// process. As a result, you must generate and provide a Base64-encoded
  /// SHA256 checksum for the block data using the <b>x-amz-Checksum</b> header.
  /// Also, you must specify the checksum algorithm using the
  /// <b>x-amz-Checksum-Algorithm</b> header. The checksum that you provide is
  /// part of the Signature Version 4 signing process. It is validated against a
  /// checksum generated by Amazon EBS to ensure the validity and authenticity
  /// of the data. If the checksums do not correspond, the request fails. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-accessing-snapshot.html#ebsapis-using-checksums">
  /// Using checksums with the EBS direct APIs</a> in the <i>Amazon Elastic
  /// Compute Cloud User Guide</i>.
  ///
  /// Parameter [blockIndex] :
  /// The block index of the block in which to write the data. A block index is
  /// a logical index in units of <code>512</code> KiB blocks. To identify the
  /// block index, divide the logical offset of the data in the logical volume
  /// by the block size (logical offset of data/<code>524288</code>). The
  /// logical offset of the data must be <code>512</code> KiB aligned.
  ///
  /// Parameter [checksum] :
  /// A Base64-encoded SHA256 checksum of the data. Only SHA256 checksums are
  /// supported.
  ///
  /// Parameter [checksumAlgorithm] :
  /// The algorithm used to generate the checksum. Currently, the only supported
  /// algorithm is <code>SHA256</code>.
  ///
  /// Parameter [dataLength] :
  /// The size of the data to write to the block, in bytes. Currently, the only
  /// supported size is <code>524288</code>.
  ///
  /// Valid values: <code>524288</code>
  ///
  /// Parameter [snapshotId] :
  /// The ID of the snapshot.
  ///
  /// Parameter [progress] :
  /// The progress of the write process, as a percentage.
  Future<PutSnapshotBlockResponse> putSnapshotBlock({
    required Uint8List blockData,
    required int blockIndex,
    required String checksum,
    required ChecksumAlgorithm checksumAlgorithm,
    required int dataLength,
    required String snapshotId,
    int? progress,
  }) async {
    ArgumentError.checkNotNull(blockData, 'blockData');
    ArgumentError.checkNotNull(blockIndex, 'blockIndex');
    _s.validateNumRange(
      'blockIndex',
      blockIndex,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(checksum, 'checksum');
    _s.validateStringLength(
      'checksum',
      checksum,
      0,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(checksumAlgorithm, 'checksumAlgorithm');
    ArgumentError.checkNotNull(dataLength, 'dataLength');
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringLength(
      'snapshotId',
      snapshotId,
      1,
      64,
      isRequired: true,
    );
    _s.validateNumRange(
      'progress',
      progress,
      0,
      100,
    );
    final headers = <String, String>{
      'x-amz-Checksum': checksum.toString(),
      'x-amz-Checksum-Algorithm': checksumAlgorithm.toValue(),
      'x-amz-Data-Length': dataLength.toString(),
      if (progress != null) 'x-amz-Progress': progress.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: blockData,
      method: 'PUT',
      requestUri:
          '/snapshots/${Uri.encodeComponent(snapshotId)}/blocks/${Uri.encodeComponent(blockIndex.toString())}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return PutSnapshotBlockResponse(
      checksum: _s.extractHeaderStringValue(response.headers, 'x-amz-Checksum'),
      checksumAlgorithm: _s
          .extractHeaderStringValue(
              response.headers, 'x-amz-Checksum-Algorithm')
          ?.toChecksumAlgorithm(),
    );
  }

  /// Creates a new Amazon EBS snapshot. The new snapshot enters the
  /// <code>pending</code> state after the request completes.
  ///
  /// After creating the snapshot, use <a
  /// href="https://docs.aws.amazon.com/ebs/latest/APIReference/API_PutSnapshotBlock.html">
  /// PutSnapshotBlock</a> to write blocks of data to the snapshot.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [RequestThrottledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConcurrentLimitExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [volumeSize] :
  /// The size of the volume, in GiB. The maximum size is <code>16384</code> GiB
  /// (16 TiB).
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. Idempotency ensures that an API request
  /// completes only once. With an idempotent request, if the original request
  /// completes successfully. The subsequent retries with the same client token
  /// return the result from the original successful request and they have no
  /// additional effect.
  ///
  /// If you do not specify a client token, one is automatically generated by
  /// the AWS SDK.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-direct-api-idempotency.html">
  /// Idempotency for StartSnapshot API</a> in the <i>Amazon Elastic Compute
  /// Cloud User Guide</i>.
  ///
  /// Parameter [description] :
  /// A description for the snapshot.
  ///
  /// Parameter [encrypted] :
  /// Indicates whether to encrypt the snapshot. To create an encrypted
  /// snapshot, specify <code>true</code>. To create an unencrypted snapshot,
  /// omit this parameter.
  ///
  /// If you specify a value for <b>ParentSnapshotId</b>, omit this parameter.
  ///
  /// If you specify <code>true</code>, the snapshot is encrypted using the CMK
  /// specified using the <b>KmsKeyArn</b> parameter. If no value is specified
  /// for <b>KmsKeyArn</b>, the default CMK for your account is used. If no
  /// default CMK has been specified for your account, the AWS managed CMK is
  /// used. To set a default CMK for your account, use <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyEbsDefaultKmsKeyId.html">
  /// ModifyEbsDefaultKmsKeyId</a>.
  ///
  /// If your account is enabled for encryption by default, you cannot set this
  /// parameter to <code>false</code>. In this case, you can omit this
  /// parameter.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-accessing-snapshot.html#ebsapis-using-encryption">
  /// Using encryption</a> in the <i>Amazon Elastic Compute Cloud User
  /// Guide</i>.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the AWS Key Management Service (AWS KMS)
  /// customer master key (CMK) to be used to encrypt the snapshot. If you do
  /// not specify a CMK, the default AWS managed CMK is used.
  ///
  /// If you specify a <b>ParentSnapshotId</b>, omit this parameter; the
  /// snapshot will be encrypted using the same CMK that was used to encrypt the
  /// parent snapshot.
  ///
  /// If <b>Encrypted</b> is set to <code>true</code>, you must specify a CMK
  /// ARN.
  ///
  /// Parameter [parentSnapshotId] :
  /// The ID of the parent snapshot. If there is no parent snapshot, or if you
  /// are creating the first snapshot for an on-premises volume, omit this
  /// parameter.
  ///
  /// If your account is enabled for encryption by default, you cannot use an
  /// unencrypted snapshot as a parent snapshot. You must first create an
  /// encrypted copy of the parent snapshot using <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CopySnapshot.html">CopySnapshot</a>.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the snapshot.
  ///
  /// Parameter [timeout] :
  /// The amount of time (in minutes) after which the snapshot is automatically
  /// cancelled if:
  ///
  /// <ul>
  /// <li>
  /// No blocks are written to the snapshot.
  /// </li>
  /// <li>
  /// The snapshot is not completed after writing the last block of data.
  /// </li>
  /// </ul>
  /// If no value is specified, the timeout defaults to <code>60</code> minutes.
  Future<StartSnapshotResponse> startSnapshot({
    required int volumeSize,
    String? clientToken,
    String? description,
    bool? encrypted,
    String? kmsKeyArn,
    String? parentSnapshotId,
    List<Tag>? tags,
    int? timeout,
  }) async {
    ArgumentError.checkNotNull(volumeSize, 'volumeSize');
    _s.validateNumRange(
      'volumeSize',
      volumeSize,
      1,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      0,
      255,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      255,
    );
    _s.validateStringLength(
      'kmsKeyArn',
      kmsKeyArn,
      1,
      2048,
    );
    _s.validateStringLength(
      'parentSnapshotId',
      parentSnapshotId,
      1,
      64,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      10,
      60,
    );
    final $payload = <String, dynamic>{
      'VolumeSize': volumeSize,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'Description': description,
      if (encrypted != null) 'Encrypted': encrypted,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (parentSnapshotId != null) 'ParentSnapshotId': parentSnapshotId,
      if (tags != null) 'Tags': tags,
      if (timeout != null) 'Timeout': timeout,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/snapshots',
      exceptionFnMap: _exceptionFns,
    );
    return StartSnapshotResponse.fromJson(response);
  }
}

/// A block of data in an Amazon Elastic Block Store snapshot.
class Block {
  /// The block index.
  final int? blockIndex;

  /// The block token for the block index.
  final String? blockToken;

  Block({
    this.blockIndex,
    this.blockToken,
  });

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      blockIndex: json['BlockIndex'] as int?,
      blockToken: json['BlockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockIndex = this.blockIndex;
    final blockToken = this.blockToken;
    return {
      if (blockIndex != null) 'BlockIndex': blockIndex,
      if (blockToken != null) 'BlockToken': blockToken,
    };
  }
}

/// A block of data in an Amazon Elastic Block Store snapshot that is different
/// from another snapshot of the same volume/snapshot lineage.
class ChangedBlock {
  /// The block index.
  final int? blockIndex;

  /// The block token for the block index of the <code>FirstSnapshotId</code>
  /// specified in the <code>ListChangedBlocks</code> operation. This value is
  /// absent if the first snapshot does not have the changed block that is on the
  /// second snapshot.
  final String? firstBlockToken;

  /// The block token for the block index of the <code>SecondSnapshotId</code>
  /// specified in the <code>ListChangedBlocks</code> operation.
  final String? secondBlockToken;

  ChangedBlock({
    this.blockIndex,
    this.firstBlockToken,
    this.secondBlockToken,
  });

  factory ChangedBlock.fromJson(Map<String, dynamic> json) {
    return ChangedBlock(
      blockIndex: json['BlockIndex'] as int?,
      firstBlockToken: json['FirstBlockToken'] as String?,
      secondBlockToken: json['SecondBlockToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockIndex = this.blockIndex;
    final firstBlockToken = this.firstBlockToken;
    final secondBlockToken = this.secondBlockToken;
    return {
      if (blockIndex != null) 'BlockIndex': blockIndex,
      if (firstBlockToken != null) 'FirstBlockToken': firstBlockToken,
      if (secondBlockToken != null) 'SecondBlockToken': secondBlockToken,
    };
  }
}

enum ChecksumAggregationMethod {
  linear,
}

extension on ChecksumAggregationMethod {
  String toValue() {
    switch (this) {
      case ChecksumAggregationMethod.linear:
        return 'LINEAR';
    }
  }
}

extension on String {
  ChecksumAggregationMethod toChecksumAggregationMethod() {
    switch (this) {
      case 'LINEAR':
        return ChecksumAggregationMethod.linear;
    }
    throw Exception('$this is not known in enum ChecksumAggregationMethod');
  }
}

enum ChecksumAlgorithm {
  sha256,
}

extension on ChecksumAlgorithm {
  String toValue() {
    switch (this) {
      case ChecksumAlgorithm.sha256:
        return 'SHA256';
    }
  }
}

extension on String {
  ChecksumAlgorithm toChecksumAlgorithm() {
    switch (this) {
      case 'SHA256':
        return ChecksumAlgorithm.sha256;
    }
    throw Exception('$this is not known in enum ChecksumAlgorithm');
  }
}

class CompleteSnapshotResponse {
  /// The status of the snapshot.
  final Status? status;

  CompleteSnapshotResponse({
    this.status,
  });

  factory CompleteSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return CompleteSnapshotResponse(
      status: (json['Status'] as String?)?.toStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class GetSnapshotBlockResponse {
  /// The data content of the block.
  final Uint8List? blockData;

  /// The checksum generated for the block, which is Base64 encoded.
  final String? checksum;

  /// The algorithm used to generate the checksum for the block, such as SHA256.
  final ChecksumAlgorithm? checksumAlgorithm;

  /// The size of the data in the block.
  final int? dataLength;

  GetSnapshotBlockResponse({
    this.blockData,
    this.checksum,
    this.checksumAlgorithm,
    this.dataLength,
  });

  factory GetSnapshotBlockResponse.fromJson(Map<String, dynamic> json) {
    return GetSnapshotBlockResponse(
      blockData: _s.decodeNullableUint8List(json['BlockData'] as String?),
      checksum: json['x-amz-Checksum'] as String?,
      checksumAlgorithm:
          (json['x-amz-Checksum-Algorithm'] as String?)?.toChecksumAlgorithm(),
      dataLength: json['x-amz-Data-Length'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockData = this.blockData;
    final checksum = this.checksum;
    final checksumAlgorithm = this.checksumAlgorithm;
    final dataLength = this.dataLength;
    return {
      if (blockData != null) 'BlockData': base64Encode(blockData),
    };
  }
}

class ListChangedBlocksResponse {
  /// The size of the block.
  final int? blockSize;

  /// An array of objects containing information about the changed blocks.
  final List<ChangedBlock>? changedBlocks;

  /// The time when the <code>BlockToken</code> expires.
  final DateTime? expiryTime;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The size of the volume in GB.
  final int? volumeSize;

  ListChangedBlocksResponse({
    this.blockSize,
    this.changedBlocks,
    this.expiryTime,
    this.nextToken,
    this.volumeSize,
  });

  factory ListChangedBlocksResponse.fromJson(Map<String, dynamic> json) {
    return ListChangedBlocksResponse(
      blockSize: json['BlockSize'] as int?,
      changedBlocks: (json['ChangedBlocks'] as List?)
          ?.whereNotNull()
          .map((e) => ChangedBlock.fromJson(e as Map<String, dynamic>))
          .toList(),
      expiryTime: timeStampFromJson(json['ExpiryTime']),
      nextToken: json['NextToken'] as String?,
      volumeSize: json['VolumeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockSize = this.blockSize;
    final changedBlocks = this.changedBlocks;
    final expiryTime = this.expiryTime;
    final nextToken = this.nextToken;
    final volumeSize = this.volumeSize;
    return {
      if (blockSize != null) 'BlockSize': blockSize,
      if (changedBlocks != null) 'ChangedBlocks': changedBlocks,
      if (expiryTime != null) 'ExpiryTime': unixTimestampToJson(expiryTime),
      if (nextToken != null) 'NextToken': nextToken,
      if (volumeSize != null) 'VolumeSize': volumeSize,
    };
  }
}

class ListSnapshotBlocksResponse {
  /// The size of the block.
  final int? blockSize;

  /// An array of objects containing information about the blocks.
  final List<Block>? blocks;

  /// The time when the <code>BlockToken</code> expires.
  final DateTime? expiryTime;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The size of the volume in GB.
  final int? volumeSize;

  ListSnapshotBlocksResponse({
    this.blockSize,
    this.blocks,
    this.expiryTime,
    this.nextToken,
    this.volumeSize,
  });

  factory ListSnapshotBlocksResponse.fromJson(Map<String, dynamic> json) {
    return ListSnapshotBlocksResponse(
      blockSize: json['BlockSize'] as int?,
      blocks: (json['Blocks'] as List?)
          ?.whereNotNull()
          .map((e) => Block.fromJson(e as Map<String, dynamic>))
          .toList(),
      expiryTime: timeStampFromJson(json['ExpiryTime']),
      nextToken: json['NextToken'] as String?,
      volumeSize: json['VolumeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockSize = this.blockSize;
    final blocks = this.blocks;
    final expiryTime = this.expiryTime;
    final nextToken = this.nextToken;
    final volumeSize = this.volumeSize;
    return {
      if (blockSize != null) 'BlockSize': blockSize,
      if (blocks != null) 'Blocks': blocks,
      if (expiryTime != null) 'ExpiryTime': unixTimestampToJson(expiryTime),
      if (nextToken != null) 'NextToken': nextToken,
      if (volumeSize != null) 'VolumeSize': volumeSize,
    };
  }
}

class PutSnapshotBlockResponse {
  /// The SHA256 checksum generated for the block data by Amazon EBS.
  final String? checksum;

  /// The algorithm used by Amazon EBS to generate the checksum.
  final ChecksumAlgorithm? checksumAlgorithm;

  PutSnapshotBlockResponse({
    this.checksum,
    this.checksumAlgorithm,
  });

  factory PutSnapshotBlockResponse.fromJson(Map<String, dynamic> json) {
    return PutSnapshotBlockResponse(
      checksum: json['x-amz-Checksum'] as String?,
      checksumAlgorithm:
          (json['x-amz-Checksum-Algorithm'] as String?)?.toChecksumAlgorithm(),
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final checksumAlgorithm = this.checksumAlgorithm;
    return {};
  }
}

class StartSnapshotResponse {
  /// The size of the blocks in the snapshot, in bytes.
  final int? blockSize;

  /// The description of the snapshot.
  final String? description;

  /// The Amazon Resource Name (ARN) of the AWS Key Management Service (AWS KMS)
  /// customer master key (CMK) used to encrypt the snapshot.
  final String? kmsKeyArn;

  /// The AWS account ID of the snapshot owner.
  final String? ownerId;

  /// The ID of the parent snapshot.
  final String? parentSnapshotId;

  /// The ID of the snapshot.
  final String? snapshotId;

  /// The timestamp when the snapshot was created.
  final DateTime? startTime;

  /// The status of the snapshot.
  final Status? status;

  /// The tags applied to the snapshot. You can specify up to 50 tags per
  /// snapshot. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html">
  /// Tagging your Amazon EC2 resources</a> in the <i>Amazon Elastic Compute Cloud
  /// User Guide</i>.
  final List<Tag>? tags;

  /// The size of the volume, in GiB.
  final int? volumeSize;

  StartSnapshotResponse({
    this.blockSize,
    this.description,
    this.kmsKeyArn,
    this.ownerId,
    this.parentSnapshotId,
    this.snapshotId,
    this.startTime,
    this.status,
    this.tags,
    this.volumeSize,
  });

  factory StartSnapshotResponse.fromJson(Map<String, dynamic> json) {
    return StartSnapshotResponse(
      blockSize: json['BlockSize'] as int?,
      description: json['Description'] as String?,
      kmsKeyArn: json['KmsKeyArn'] as String?,
      ownerId: json['OwnerId'] as String?,
      parentSnapshotId: json['ParentSnapshotId'] as String?,
      snapshotId: json['SnapshotId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      volumeSize: json['VolumeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockSize = this.blockSize;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    final ownerId = this.ownerId;
    final parentSnapshotId = this.parentSnapshotId;
    final snapshotId = this.snapshotId;
    final startTime = this.startTime;
    final status = this.status;
    final tags = this.tags;
    final volumeSize = this.volumeSize;
    return {
      if (blockSize != null) 'BlockSize': blockSize,
      if (description != null) 'Description': description,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (ownerId != null) 'OwnerId': ownerId,
      if (parentSnapshotId != null) 'ParentSnapshotId': parentSnapshotId,
      if (snapshotId != null) 'SnapshotId': snapshotId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (volumeSize != null) 'VolumeSize': volumeSize,
    };
  }
}

enum Status {
  completed,
  pending,
  error,
}

extension on Status {
  String toValue() {
    switch (this) {
      case Status.completed:
        return 'completed';
      case Status.pending:
        return 'pending';
      case Status.error:
        return 'error';
    }
  }
}

extension on String {
  Status toStatus() {
    switch (this) {
      case 'completed':
        return Status.completed;
      case 'pending':
        return Status.pending;
      case 'error':
        return Status.error;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// Describes a tag.
class Tag {
  /// The key of the tag.
  final String? key;

  /// The value of the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConcurrentLimitExceededException extends _s.GenericAwsException {
  ConcurrentLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentLimitExceededException',
            message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class RequestThrottledException extends _s.GenericAwsException {
  RequestThrottledException({String? type, String? message})
      : super(type: type, code: 'RequestThrottledException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConcurrentLimitExceededException': (type, message) =>
      ConcurrentLimitExceededException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'RequestThrottledException': (type, message) =>
      RequestThrottledException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
