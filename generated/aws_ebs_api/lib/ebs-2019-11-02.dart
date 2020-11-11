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
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'ebs-2019-11-02.g.dart';

/// You can use the Amazon Elastic Block Store (EBS) direct APIs to directly
/// read the data on your EBS snapshots, and identify the difference between two
/// snapshots. You can view the details of blocks in an EBS snapshot, compare
/// the block difference between two snapshots, and directly access the data in
/// a snapshot. If you’re an independent software vendor (ISV) who offers backup
/// services for EBS, the EBS direct APIs make it easier and more cost-effective
/// to track incremental changes on your EBS volumes via EBS snapshots. This can
/// be done without having to create new volumes from EBS snapshots.
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
class EBS {
  final _s.RestJsonProtocol _protocol;
  EBS({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'ebs',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns the data in a block in an Amazon Elastic Block Store snapshot.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
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
    @_s.required int blockIndex,
    @_s.required String blockToken,
    @_s.required String snapshotId,
  }) async {
    ArgumentError.checkNotNull(blockIndex, 'blockIndex');
    ArgumentError.checkNotNull(blockToken, 'blockToken');
    _s.validateStringLength(
      'blockToken',
      blockToken,
      0,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'blockToken',
      blockToken,
      r'''^[A-Za-z0-9+/=]+$''',
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
    _s.validateStringPattern(
      'snapshotId',
      snapshotId,
      r'''^snap-[0-9a-f]+$''',
      isRequired: true,
    );
    var _query = '';
    _query = '?${[
      if (blockToken != null) _s.toQueryParam('blockToken', blockToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/snapshots/${Uri.encodeComponent(snapshotId.toString())}/blocks/${Uri.encodeComponent(blockIndex.toString())}$_query',
      exceptionFnMap: _exceptionFns,
    );
    return GetSnapshotBlockResponse.fromJson(
        {...response, 'BlockData': response});
  }

  /// Returns the block indexes and block tokens for blocks that are different
  /// between two Amazon Elastic Block Store snapshots of the same
  /// volume/snapshot lineage.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
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
    @_s.required String secondSnapshotId,
    String firstSnapshotId,
    int maxResults,
    String nextToken,
    int startingBlockIndex,
  }) async {
    ArgumentError.checkNotNull(secondSnapshotId, 'secondSnapshotId');
    _s.validateStringLength(
      'secondSnapshotId',
      secondSnapshotId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'secondSnapshotId',
      secondSnapshotId,
      r'''^snap-[0-9a-f]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'firstSnapshotId',
      firstSnapshotId,
      1,
      64,
    );
    _s.validateStringPattern(
      'firstSnapshotId',
      firstSnapshotId,
      r'''^snap-[0-9a-f]+$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+/=]+$''',
    );
    var _query = '';
    _query = '?${[
      if (firstSnapshotId != null)
        _s.toQueryParam('firstSnapshotId', firstSnapshotId),
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('pageToken', nextToken),
      if (startingBlockIndex != null)
        _s.toQueryParam('startingBlockIndex', startingBlockIndex),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/snapshots/${Uri.encodeComponent(secondSnapshotId.toString())}/changedblocks$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListChangedBlocksResponse.fromJson(response);
  }

  /// Returns the block indexes and block tokens for blocks in an Amazon Elastic
  /// Block Store snapshot.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
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
    @_s.required String snapshotId,
    int maxResults,
    String nextToken,
    int startingBlockIndex,
  }) async {
    ArgumentError.checkNotNull(snapshotId, 'snapshotId');
    _s.validateStringLength(
      'snapshotId',
      snapshotId,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'snapshotId',
      snapshotId,
      r'''^snap-[0-9a-f]+$''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[A-Za-z0-9+/=]+$''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('maxResults', maxResults),
      if (nextToken != null) _s.toQueryParam('pageToken', nextToken),
      if (startingBlockIndex != null)
        _s.toQueryParam('startingBlockIndex', startingBlockIndex),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/snapshots/${Uri.encodeComponent(snapshotId.toString())}/blocks$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListSnapshotBlocksResponse.fromJson(response);
  }
}

/// A block of data in an Amazon Elastic Block Store snapshot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Block {
  /// The block index.
  @_s.JsonKey(name: 'BlockIndex')
  final int blockIndex;

  /// The block token for the block index.
  @_s.JsonKey(name: 'BlockToken')
  final String blockToken;

  Block({
    this.blockIndex,
    this.blockToken,
  });
  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}

/// A block of data in an Amazon Elastic Block Store snapshot that is different
/// from another snapshot of the same volume/snapshot lineage.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChangedBlock {
  /// The block index.
  @_s.JsonKey(name: 'BlockIndex')
  final int blockIndex;

  /// The block token for the block index of the <code>FirstSnapshotId</code>
  /// specified in the <code>ListChangedBlocks</code> operation. This value is
  /// absent if the first snapshot does not have the changed block that is on the
  /// second snapshot.
  @_s.JsonKey(name: 'FirstBlockToken')
  final String firstBlockToken;

  /// The block token for the block index of the <code>SecondSnapshotId</code>
  /// specified in the <code>ListChangedBlocks</code> operation.
  @_s.JsonKey(name: 'SecondBlockToken')
  final String secondBlockToken;

  ChangedBlock({
    this.blockIndex,
    this.firstBlockToken,
    this.secondBlockToken,
  });
  factory ChangedBlock.fromJson(Map<String, dynamic> json) =>
      _$ChangedBlockFromJson(json);
}

enum ChecksumAlgorithm {
  @_s.JsonValue('SHA256')
  sha256,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSnapshotBlockResponse {
  /// The data content of the block.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'BlockData')
  final Uint8List blockData;

  /// The checksum generated for the block, which is Base64 encoded.
  @_s.JsonKey(name: 'x-amz-Checksum')
  final String checksum;

  /// The algorithm used to generate the checksum for the block, such as SHA256.
  @_s.JsonKey(name: 'x-amz-Checksum-Algorithm')
  final ChecksumAlgorithm checksumAlgorithm;

  /// The size of the data in the block.
  @_s.JsonKey(name: 'x-amz-Data-Length')
  final int dataLength;

  GetSnapshotBlockResponse({
    this.blockData,
    this.checksum,
    this.checksumAlgorithm,
    this.dataLength,
  });
  factory GetSnapshotBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSnapshotBlockResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChangedBlocksResponse {
  /// The size of the block.
  @_s.JsonKey(name: 'BlockSize')
  final int blockSize;

  /// An array of objects containing information about the changed blocks.
  @_s.JsonKey(name: 'ChangedBlocks')
  final List<ChangedBlock> changedBlocks;

  /// The time when the <code>BlockToken</code> expires.
  @_s.JsonKey(
      name: 'ExpiryTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime expiryTime;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The size of the volume in GB.
  @_s.JsonKey(name: 'VolumeSize')
  final int volumeSize;

  ListChangedBlocksResponse({
    this.blockSize,
    this.changedBlocks,
    this.expiryTime,
    this.nextToken,
    this.volumeSize,
  });
  factory ListChangedBlocksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChangedBlocksResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSnapshotBlocksResponse {
  /// The size of the block.
  @_s.JsonKey(name: 'BlockSize')
  final int blockSize;

  /// An array of objects containing information about the blocks.
  @_s.JsonKey(name: 'Blocks')
  final List<Block> blocks;

  /// The time when the <code>BlockToken</code> expires.
  @_s.JsonKey(
      name: 'ExpiryTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime expiryTime;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The size of the volume in GB.
  @_s.JsonKey(name: 'VolumeSize')
  final int volumeSize;

  ListSnapshotBlocksResponse({
    this.blockSize,
    this.blocks,
    this.expiryTime,
    this.nextToken,
    this.volumeSize,
  });
  factory ListSnapshotBlocksResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSnapshotBlocksResponseFromJson(json);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
