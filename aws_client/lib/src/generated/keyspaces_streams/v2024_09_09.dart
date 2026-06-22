// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2024_09_09.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Keyspaces (for Apache Cassandra) change data capture (CDC) records
/// change events for Amazon Keyspaces tables. The change events captured in a
/// stream are time-ordered and de-duplicated write operations. Using stream
/// data you can build event driven applications that incorporate near-real time
/// change events from Amazon Keyspaces tables.
///
/// Amazon Keyspaces CDC is serverless and scales the infrastructure for change
/// events automatically based on the volume of changes on your table.
///
/// This API reference describes the Amazon Keyspaces CDC stream API in detail.
///
/// For more information about Amazon Keyspaces CDC, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/cdc.html">Working
/// with change data capture (CDC) streams in Amazon Keyspaces</a> in the
/// <i>Amazon Keyspaces Developer Guide</i>.
///
/// To learn how Amazon Keyspaces CDC API actions are recorded with CloudTrail,
/// see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/logging-using-cloudtrail.html#service-name-info-in-cloudtrail">Amazon
/// Keyspaces information in CloudTrail</a> in the <i>Amazon Keyspaces Developer
/// Guide</i>.
///
/// To see the metrics Amazon Keyspaces CDC sends to Amazon CloudWatch, see <a
/// href="https://docs.aws.amazon.com/keyspaces/latest/devguide/metrics-dimensions.html#keyspaces-cdc-metrics">Amazon
/// Keyspaces change data capture (CDC) CloudWatch metrics</a> in the <i>Amazon
/// Keyspaces Developer Guide</i>.
class KeyspacesStreams {
  final _s.JsonProtocol _protocol;
  factory KeyspacesStreams({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'cassandra-streams',
      signingName: 'cassandra',
    );
    return KeyspacesStreams._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  KeyspacesStreams._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Retrieves data records from a specified shard in an Amazon Keyspaces data
  /// stream. This operation returns a collection of data records from the
  /// shard, including the primary key columns and information about
  /// modifications made to the captured table data. Each record represents a
  /// single data modification in the Amazon Keyspaces table and includes
  /// metadata about when the change occurred.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [shardIterator] :
  /// The unique identifier of the shard iterator. A shard iterator specifies
  /// the position in the shard from which you want to start reading data
  /// records sequentially. You obtain this value by calling the
  /// <code>GetShardIterator </code> operation. Each shard iterator is valid for
  /// 15 minutes after creation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of records to return in a single
  /// <code>GetRecords</code> request. The default value is 100. You can specify
  /// a limit between 1 and 1000, but the actual number returned might be less
  /// than the specified maximum if the size of the data for the returned
  /// records exceeds the internal size limit.
  Future<GetRecordsOutput> getRecords({
    required String shardIterator,
    int? maxResults,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesStreams.GetRecords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'shardIterator': shardIterator,
        if (maxResults != null) 'maxResults': maxResults,
      },
    );

    return GetRecordsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a shard iterator that serves as a bookmark for reading data from a
  /// specific position in an Amazon Keyspaces data stream's shard. The shard
  /// iterator specifies the shard position from which to start reading data
  /// records sequentially. You can specify whether to begin reading at the
  /// latest record, the oldest record, or at a particular sequence number
  /// within the shard.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [shardId] :
  /// The identifier of the shard within the stream. The shard ID uniquely
  /// identifies a subset of the stream's data records that you want to access.
  ///
  /// Parameter [shardIteratorType] :
  /// Determines how the shard iterator is positioned. Must be one of the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>TRIM_HORIZON</code> - Start reading at the last untrimmed record in
  /// the shard, which is the oldest data record in the shard.
  /// </li>
  /// <li>
  /// <code>AT_SEQUENCE_NUMBER</code> - Start reading exactly from the specified
  /// sequence number.
  /// </li>
  /// <li>
  /// <code>AFTER_SEQUENCE_NUMBER</code> - Start reading right after the
  /// specified sequence number.
  /// </li>
  /// <li>
  /// <code>LATEST</code> - Start reading just after the most recent record in
  /// the shard, so that you always read the most recent data.
  /// </li>
  /// </ul>
  ///
  /// Parameter [streamArn] :
  /// The Amazon Resource Name (ARN) of the stream for which to get the shard
  /// iterator. The ARN uniquely identifies the stream within Amazon Keyspaces.
  ///
  /// Parameter [sequenceNumber] :
  /// The sequence number of the data record in the shard from which to start
  /// reading. Required if <code>ShardIteratorType</code> is
  /// <code>AT_SEQUENCE_NUMBER</code> or <code>AFTER_SEQUENCE_NUMBER</code>.
  /// This parameter is ignored for other iterator types.
  Future<GetShardIteratorOutput> getShardIterator({
    required String shardId,
    required ShardIteratorType shardIteratorType,
    required String streamArn,
    String? sequenceNumber,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesStreams.GetShardIterator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'shardId': shardId,
        'shardIteratorType': shardIteratorType.value,
        'streamArn': streamArn,
        if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
      },
    );

    return GetShardIteratorOutput.fromJson(jsonResponse.body);
  }

  /// Returns detailed information about a specific data capture stream for an
  /// Amazon Keyspaces table. The information includes the stream's Amazon
  /// Resource Name (ARN), creation time, current status, retention period,
  /// shard composition, and associated table details. This operation helps you
  /// monitor and manage the configuration of your Amazon Keyspaces data
  /// streams.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [streamArn] :
  /// The Amazon Resource Name (ARN) of the stream for which detailed
  /// information is requested. This uniquely identifies the specific stream you
  /// want to get information about.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of shard objects to return in a single
  /// <code>GetStream</code> request. The default value is 100. The minimum
  /// value is 1 and the maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous <code>GetStream</code>
  /// operation. If this parameter is specified, the response includes only
  /// records beyond the token, up to the value specified by
  /// <code>MaxResults</code>.
  ///
  /// Parameter [shardFilter] :
  /// Optional filter criteria to apply when retrieving shards. You can filter
  /// shards based on their parent <code>shardID</code> to get a list of
  /// children shards to narrow down the results returned by the
  /// <code>GetStream</code> operation.
  Future<GetStreamOutput> getStream({
    required String streamArn,
    int? maxResults,
    String? nextToken,
    ShardFilter? shardFilter,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesStreams.GetStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'streamArn': streamArn,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (shardFilter != null) 'shardFilter': shardFilter,
      },
    );

    return GetStreamOutput.fromJson(jsonResponse.body);
  }

  /// Returns a list of all data capture streams associated with your Amazon
  /// Keyspaces account or for a specific keyspace or table. The response
  /// includes information such as stream ARNs, table associations, creation
  /// timestamps, and current status. This operation helps you discover and
  /// manage all active data streams in your Amazon Keyspaces environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [keyspaceName] :
  /// The name of the keyspace for which to list streams. If specified, only
  /// streams associated with tables in this keyspace are returned. If omitted,
  /// streams from all keyspaces are included in the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of streams to return in a single
  /// <code>ListStreams</code> request. The default value is 100. The minimum
  /// value is 1 and the maximum value is 100.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous
  /// <code>ListStreams</code> operation. If this parameter is specified, the
  /// response includes only records beyond the token, up to the value specified
  /// by <code>maxResults</code>.
  ///
  /// Parameter [tableName] :
  /// The name of the table for which to list streams. Must be used together
  /// with <code>keyspaceName</code>. If specified, only streams associated with
  /// this specific table are returned.
  Future<ListStreamsOutput> listStreams({
    String? keyspaceName,
    int? maxResults,
    String? nextToken,
    String? tableName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'KeyspacesStreams.ListStreams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (keyspaceName != null) 'keyspaceName': keyspaceName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (tableName != null) 'tableName': tableName,
      },
    );

    return ListStreamsOutput.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class GetRecordsOutput {
  /// An array of change data records retrieved from the specified shard. Each
  /// record represents a single data modification (insert, update, or delete) to
  /// a row in the Amazon Keyspaces table. Records include the primary key columns
  /// and information about what data was modified.
  final List<Record>? changeRecords;

  /// Provides information about the current iterator at the time GetRecords
  /// request was processed by Keyspaces.
  final IteratorDescription? iteratorDescription;

  /// The next position in the shard from which to start sequentially reading data
  /// records. If null, the shard has been closed and the requested iterator will
  /// not return any more data.
  final String? nextShardIterator;

  GetRecordsOutput({
    this.changeRecords,
    this.iteratorDescription,
    this.nextShardIterator,
  });

  factory GetRecordsOutput.fromJson(Map<String, dynamic> json) {
    return GetRecordsOutput(
      changeRecords: (json['changeRecords'] as List?)
          ?.nonNulls
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
      iteratorDescription: json['iteratorDescription'] != null
          ? IteratorDescription.fromJson(
              json['iteratorDescription'] as Map<String, dynamic>)
          : null,
      nextShardIterator: json['nextShardIterator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final changeRecords = this.changeRecords;
    final iteratorDescription = this.iteratorDescription;
    final nextShardIterator = this.nextShardIterator;
    return {
      if (changeRecords != null) 'changeRecords': changeRecords,
      if (iteratorDescription != null)
        'iteratorDescription': iteratorDescription,
      if (nextShardIterator != null) 'nextShardIterator': nextShardIterator,
    };
  }
}

/// @nodoc
class GetShardIteratorOutput {
  /// The unique identifier for the shard iterator. This value is used in the
  /// <code>GetRecords</code> operation to retrieve data records from the
  /// specified shard. Each shard iterator expires 15 minutes after it is returned
  /// to the requester.
  final String? shardIterator;

  GetShardIteratorOutput({
    this.shardIterator,
  });

  factory GetShardIteratorOutput.fromJson(Map<String, dynamic> json) {
    return GetShardIteratorOutput(
      shardIterator: json['shardIterator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shardIterator = this.shardIterator;
    return {
      if (shardIterator != null) 'shardIterator': shardIterator,
    };
  }
}

/// @nodoc
class GetStreamOutput {
  /// The date and time when the request to create this stream was issued. The
  /// value is represented in ISO 8601 format.
  final DateTime creationRequestDateTime;

  /// The name of the keyspace containing the table associated with this stream.
  /// The keyspace name is part of the table's hierarchical identifier in Amazon
  /// Keyspaces.
  final String keyspaceName;

  /// The Amazon Resource Name (ARN) that uniquely identifies the stream within
  /// Amazon Keyspaces. This ARN can be used in other API operations to reference
  /// this specific stream.
  final String streamArn;

  /// A timestamp that serves as a unique identifier for this stream, used for
  /// debugging and monitoring purposes. The stream label represents the point in
  /// time when the stream was created.
  final String streamLabel;

  /// The current status of the stream. Values can be <code>ENABLING</code>,
  /// <code>ENABLED</code>, <code>DISABLING</code>, or <code>DISABLED</code>.
  /// Operations on the stream depend on its current status.
  final StreamStatus streamStatus;

  /// The format of the data records in this stream. Currently, this can be one of
  /// the following options:
  ///
  /// <ul>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - both versions of the row, before and after
  /// the change. This is the default.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - the version of the row after the change.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - the version of the row before the change.
  /// </li>
  /// <li>
  /// <code>KEYS_ONLY</code> - the partition and clustering keys of the row that
  /// was changed.
  /// </li>
  /// </ul>
  final StreamViewType streamViewType;

  /// The name of the table associated with this stream. The stream captures
  /// changes to rows in this Amazon Keyspaces table.
  final String tableName;

  /// A pagination token that can be used in a subsequent <code>GetStream</code>
  /// request. This token is returned if the response contains more shards than
  /// can be returned in a single response.
  final String? nextToken;

  /// An array of shard objects associated with this stream. Each shard contains a
  /// subset of the stream's data records and has its own unique identifier. The
  /// collection of shards represents the complete stream data.
  final List<Shard>? shards;

  GetStreamOutput({
    required this.creationRequestDateTime,
    required this.keyspaceName,
    required this.streamArn,
    required this.streamLabel,
    required this.streamStatus,
    required this.streamViewType,
    required this.tableName,
    this.nextToken,
    this.shards,
  });

  factory GetStreamOutput.fromJson(Map<String, dynamic> json) {
    return GetStreamOutput(
      creationRequestDateTime:
          nonNullableTimeStampFromJson(json['creationRequestDateTime'] ?? 0),
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      streamArn: (json['streamArn'] as String?) ?? '',
      streamLabel: (json['streamLabel'] as String?) ?? '',
      streamStatus:
          StreamStatus.fromString((json['streamStatus'] as String?) ?? ''),
      streamViewType:
          StreamViewType.fromString((json['streamViewType'] as String?) ?? ''),
      tableName: (json['tableName'] as String?) ?? '',
      nextToken: json['nextToken'] as String?,
      shards: (json['shards'] as List?)
          ?.nonNulls
          .map((e) => Shard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationRequestDateTime = this.creationRequestDateTime;
    final keyspaceName = this.keyspaceName;
    final streamArn = this.streamArn;
    final streamLabel = this.streamLabel;
    final streamStatus = this.streamStatus;
    final streamViewType = this.streamViewType;
    final tableName = this.tableName;
    final nextToken = this.nextToken;
    final shards = this.shards;
    return {
      'creationRequestDateTime': unixTimestampToJson(creationRequestDateTime),
      'keyspaceName': keyspaceName,
      'streamArn': streamArn,
      'streamLabel': streamLabel,
      'streamStatus': streamStatus.value,
      'streamViewType': streamViewType.value,
      'tableName': tableName,
      if (nextToken != null) 'nextToken': nextToken,
      if (shards != null) 'shards': shards,
    };
  }
}

/// @nodoc
class ListStreamsOutput {
  /// A pagination token that can be used in a subsequent <code>ListStreams</code>
  /// request. This token is returned if the response contains more streams than
  /// can be returned in a single response based on the <code>maxResults</code>
  /// parameter.
  final String? nextToken;

  /// An array of stream objects, each containing summary information about a
  /// stream including its ARN, status, and associated table information. This
  /// list includes all streams that match the request criteria.
  final List<Stream>? streams;

  ListStreamsOutput({
    this.nextToken,
    this.streams,
  });

  factory ListStreamsOutput.fromJson(Map<String, dynamic> json) {
    return ListStreamsOutput(
      nextToken: json['nextToken'] as String?,
      streams: (json['streams'] as List?)
          ?.nonNulls
          .map((e) => Stream.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final streams = this.streams;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (streams != null) 'streams': streams,
    };
  }
}

/// Represents a change data capture stream for an Amazon Keyspaces table, which
/// enables tracking and processing of data changes.
///
/// @nodoc
class Stream {
  /// The name of the keyspace containing the table associated with this stream.
  final String keyspaceName;

  /// The Amazon Resource Name (ARN) that uniquely identifies this stream.
  final String streamArn;

  /// A unique identifier for this stream that can be used in stream operations.
  final String streamLabel;

  /// The name of the table associated with this stream.
  final String tableName;

  Stream({
    required this.keyspaceName,
    required this.streamArn,
    required this.streamLabel,
    required this.tableName,
  });

  factory Stream.fromJson(Map<String, dynamic> json) {
    return Stream(
      keyspaceName: (json['keyspaceName'] as String?) ?? '',
      streamArn: (json['streamArn'] as String?) ?? '',
      streamLabel: (json['streamLabel'] as String?) ?? '',
      tableName: (json['tableName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final keyspaceName = this.keyspaceName;
    final streamArn = this.streamArn;
    final streamLabel = this.streamLabel;
    final tableName = this.tableName;
    return {
      'keyspaceName': keyspaceName,
      'streamArn': streamArn,
      'streamLabel': streamLabel,
      'tableName': tableName,
    };
  }
}

/// @nodoc
class StreamStatus {
  static const enabling = StreamStatus._('ENABLING');
  static const enabled = StreamStatus._('ENABLED');
  static const disabling = StreamStatus._('DISABLING');
  static const disabled = StreamStatus._('DISABLED');

  final String value;

  const StreamStatus._(this.value);

  static const values = [enabling, enabled, disabling, disabled];

  static StreamStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StreamStatus._(value));

  @override
  bool operator ==(other) => other is StreamStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StreamViewType {
  static const newImage = StreamViewType._('NEW_IMAGE');
  static const oldImage = StreamViewType._('OLD_IMAGE');
  static const newAndOldImages = StreamViewType._('NEW_AND_OLD_IMAGES');
  static const keysOnly = StreamViewType._('KEYS_ONLY');

  final String value;

  const StreamViewType._(this.value);

  static const values = [newImage, oldImage, newAndOldImages, keysOnly];

  static StreamViewType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamViewType._(value));

  @override
  bool operator ==(other) => other is StreamViewType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a uniquely identified group of change records within a change
/// data capture stream for Amazon Keyspaces.
///
/// @nodoc
class Shard {
  /// The identifiers of parent shards that this shard evolved from, if this shard
  /// was created through resharding.
  final List<String>? parentShardIds;

  /// The range of sequence numbers contained within this shard.
  final SequenceNumberRange? sequenceNumberRange;

  /// A unique identifier for this shard within the stream.
  final String? shardId;

  Shard({
    this.parentShardIds,
    this.sequenceNumberRange,
    this.shardId,
  });

  factory Shard.fromJson(Map<String, dynamic> json) {
    return Shard(
      parentShardIds: (json['parentShardIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sequenceNumberRange: json['sequenceNumberRange'] != null
          ? SequenceNumberRange.fromJson(
              json['sequenceNumberRange'] as Map<String, dynamic>)
          : null,
      shardId: json['shardId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parentShardIds = this.parentShardIds;
    final sequenceNumberRange = this.sequenceNumberRange;
    final shardId = this.shardId;
    return {
      if (parentShardIds != null) 'parentShardIds': parentShardIds,
      if (sequenceNumberRange != null)
        'sequenceNumberRange': sequenceNumberRange,
      if (shardId != null) 'shardId': shardId,
    };
  }
}

/// Defines a range of sequence numbers within a change data capture stream's
/// shard for Amazon Keyspaces.
///
/// @nodoc
class SequenceNumberRange {
  /// The ending sequence number of the range, which may be null for open-ended
  /// ranges.
  final String? endingSequenceNumber;

  /// The starting sequence number of the range.
  final String? startingSequenceNumber;

  SequenceNumberRange({
    this.endingSequenceNumber,
    this.startingSequenceNumber,
  });

  factory SequenceNumberRange.fromJson(Map<String, dynamic> json) {
    return SequenceNumberRange(
      endingSequenceNumber: json['endingSequenceNumber'] as String?,
      startingSequenceNumber: json['startingSequenceNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endingSequenceNumber = this.endingSequenceNumber;
    final startingSequenceNumber = this.startingSequenceNumber;
    return {
      if (endingSequenceNumber != null)
        'endingSequenceNumber': endingSequenceNumber,
      if (startingSequenceNumber != null)
        'startingSequenceNumber': startingSequenceNumber,
    };
  }
}

/// A filter used to limit the shards returned by a <code>GetStream</code>
/// operation.
///
/// @nodoc
class ShardFilter {
  /// The identifier of a specific shard used to filter results based on the
  /// specified filter type.
  final String? shardId;

  /// The type of shard filter to use, which determines how the shardId parameter
  /// is interpreted.
  final ShardFilterType? type;

  ShardFilter({
    this.shardId,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final shardId = this.shardId;
    final type = this.type;
    return {
      if (shardId != null) 'shardId': shardId,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class ShardFilterType {
  static const childShards = ShardFilterType._('CHILD_SHARDS');

  final String value;

  const ShardFilterType._(this.value);

  static const values = [childShards];

  static ShardFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ShardFilterType._(value));

  @override
  bool operator ==(other) => other is ShardFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ShardIteratorType {
  static const trimHorizon = ShardIteratorType._('TRIM_HORIZON');
  static const latest = ShardIteratorType._('LATEST');
  static const atSequenceNumber = ShardIteratorType._('AT_SEQUENCE_NUMBER');
  static const afterSequenceNumber =
      ShardIteratorType._('AFTER_SEQUENCE_NUMBER');

  final String value;

  const ShardIteratorType._(this.value);

  static const values = [
    trimHorizon,
    latest,
    atSequenceNumber,
    afterSequenceNumber
  ];

  static ShardIteratorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ShardIteratorType._(value));

  @override
  bool operator ==(other) => other is ShardIteratorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides information about the current iterator.
///
/// @nodoc
class IteratorDescription {
  /// Indicates the current iterator's position within the shard. The possible
  /// values are:
  ///
  /// <ul>
  /// <li>
  /// <code>AT_TIP</code> - No more records are currently available.
  /// </li>
  /// <li>
  /// <code>BEHIND_TIP</code> - Additional records may be available.
  /// </li>
  /// </ul>
  /// Stream progresses in absence of customer records. <code>BEHIND_TIP</code>
  /// with an empty <code>changeRecords</code> list indicates the stream is
  /// progressing but no customer records are available at this position. Continue
  /// polling normally.
  final IteratorPosition? iteratorPosition;

  IteratorDescription({
    this.iteratorPosition,
  });

  factory IteratorDescription.fromJson(Map<String, dynamic> json) {
    return IteratorDescription(
      iteratorPosition: (json['iteratorPosition'] as String?)
          ?.let(IteratorPosition.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final iteratorPosition = this.iteratorPosition;
    return {
      if (iteratorPosition != null) 'iteratorPosition': iteratorPosition.value,
    };
  }
}

/// @nodoc
class IteratorPosition {
  static const atTip = IteratorPosition._('AT_TIP');
  static const behindTip = IteratorPosition._('BEHIND_TIP');

  final String value;

  const IteratorPosition._(this.value);

  static const values = [atTip, behindTip];

  static IteratorPosition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IteratorPosition._(value));

  @override
  bool operator ==(other) => other is IteratorPosition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a change data capture record for a row in an Amazon Keyspaces
/// table, containing both the new and old states of the row.
///
/// @nodoc
class Record {
  /// The clustering key columns and their values for the affected row, which
  /// determine the order of rows within a partition.
  final Map<String, KeyspacesCellValue>? clusteringKeys;

  /// The timestamp indicating when this change data capture record was created.
  final DateTime? createdAt;

  /// The version of the record format, used to track the evolution of the record
  /// structure over time.
  final String? eventVersion;

  /// The state of the row after the change operation that generated this record.
  final KeyspacesRow? newImage;

  /// The state of the row before the change operation that generated this record.
  final KeyspacesRow? oldImage;

  /// The origin or source of this change data capture record.
  final OriginType? origin;

  /// The partition key columns and their values for the affected row.
  final Map<String, KeyspacesCellValue>? partitionKeys;

  /// A unique identifier assigned to this record within the shard, used for
  /// ordering and tracking purposes.
  final String? sequenceNumber;

  Record({
    this.clusteringKeys,
    this.createdAt,
    this.eventVersion,
    this.newImage,
    this.oldImage,
    this.origin,
    this.partitionKeys,
    this.sequenceNumber,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      clusteringKeys: (json['clusteringKeys'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, KeyspacesCellValue.fromJson(e as Map<String, dynamic>))),
      createdAt: timeStampFromJson(json['createdAt']),
      eventVersion: json['eventVersion'] as String?,
      newImage: json['newImage'] != null
          ? KeyspacesRow.fromJson(json['newImage'] as Map<String, dynamic>)
          : null,
      oldImage: json['oldImage'] != null
          ? KeyspacesRow.fromJson(json['oldImage'] as Map<String, dynamic>)
          : null,
      origin: (json['origin'] as String?)?.let(OriginType.fromString),
      partitionKeys: (json['partitionKeys'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, KeyspacesCellValue.fromJson(e as Map<String, dynamic>))),
      sequenceNumber: json['sequenceNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusteringKeys = this.clusteringKeys;
    final createdAt = this.createdAt;
    final eventVersion = this.eventVersion;
    final newImage = this.newImage;
    final oldImage = this.oldImage;
    final origin = this.origin;
    final partitionKeys = this.partitionKeys;
    final sequenceNumber = this.sequenceNumber;
    return {
      if (clusteringKeys != null) 'clusteringKeys': clusteringKeys,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (eventVersion != null) 'eventVersion': eventVersion,
      if (newImage != null) 'newImage': newImage,
      if (oldImage != null) 'oldImage': oldImage,
      if (origin != null) 'origin': origin.value,
      if (partitionKeys != null) 'partitionKeys': partitionKeys,
      if (sequenceNumber != null) 'sequenceNumber': sequenceNumber,
    };
  }
}

/// @nodoc
class OriginType {
  static const user = OriginType._('USER');
  static const replication = OriginType._('REPLICATION');
  static const ttl = OriginType._('TTL');

  final String value;

  const OriginType._(this.value);

  static const values = [user, replication, ttl];

  static OriginType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OriginType._(value));

  @override
  bool operator ==(other) => other is OriginType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a row in an Amazon Keyspaces table, containing regular column
/// values, static column values, and row-level metadata.
///
/// @nodoc
class KeyspacesRow {
  /// Metadata that applies to the entire row, such as timestamps and TTL
  /// information.
  final KeyspacesMetadata? rowMetadata;

  /// A map of static column cells shared by all rows with the same partition key,
  /// where keys are column names and values are the corresponding cells.
  final Map<String, KeyspacesCell>? staticCells;

  /// A map of regular (non-static) column cells in the row, where keys are column
  /// names and values are the corresponding cells.
  final Map<String, KeyspacesCell>? valueCells;

  KeyspacesRow({
    this.rowMetadata,
    this.staticCells,
    this.valueCells,
  });

  factory KeyspacesRow.fromJson(Map<String, dynamic> json) {
    return KeyspacesRow(
      rowMetadata: json['rowMetadata'] != null
          ? KeyspacesMetadata.fromJson(
              json['rowMetadata'] as Map<String, dynamic>)
          : null,
      staticCells: (json['staticCells'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, KeyspacesCell.fromJson(e as Map<String, dynamic>))),
      valueCells: (json['valueCells'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, KeyspacesCell.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final rowMetadata = this.rowMetadata;
    final staticCells = this.staticCells;
    final valueCells = this.valueCells;
    return {
      if (rowMetadata != null) 'rowMetadata': rowMetadata,
      if (staticCells != null) 'staticCells': staticCells,
      if (valueCells != null) 'valueCells': valueCells,
    };
  }
}

/// Contains metadata information associated with Amazon Keyspaces cells and
/// rows.
///
/// @nodoc
class KeyspacesMetadata {
  /// The time at which the associated data will expire, based on the time-to-live
  /// (TTL) setting.
  final String? expirationTime;

  /// The timestamp at which the associated data was written to the database.
  final String? writeTime;

  KeyspacesMetadata({
    this.expirationTime,
    this.writeTime,
  });

  factory KeyspacesMetadata.fromJson(Map<String, dynamic> json) {
    return KeyspacesMetadata(
      expirationTime: json['expirationTime'] as String?,
      writeTime: json['writeTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expirationTime = this.expirationTime;
    final writeTime = this.writeTime;
    return {
      if (expirationTime != null) 'expirationTime': expirationTime,
      if (writeTime != null) 'writeTime': writeTime,
    };
  }
}

/// Represents a cell in an Amazon Keyspaces table, containing both the value
/// and metadata about the cell.
///
/// @nodoc
class KeyspacesCell {
  /// Metadata associated with this cell, such as time-to-live (TTL) expiration
  /// time and write timestamp.
  final KeyspacesMetadata? metadata;

  /// The value stored in this cell, which can be of various data types supported
  /// by Amazon Keyspaces.
  final KeyspacesCellValue? value;

  KeyspacesCell({
    this.metadata,
    this.value,
  });

  factory KeyspacesCell.fromJson(Map<String, dynamic> json) {
    return KeyspacesCell(
      metadata: json['metadata'] != null
          ? KeyspacesMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      value: json['value'] != null
          ? KeyspacesCellValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metadata = this.metadata;
    final value = this.value;
    return {
      if (metadata != null) 'metadata': metadata,
      if (value != null) 'value': value,
    };
  }
}

/// Represents the value of a cell in an Amazon Keyspaces table, supporting
/// various data types with type-specific fields.
///
/// @nodoc
class KeyspacesCellValue {
  /// A value of ASCII text type, containing US-ASCII characters.
  final String? asciiT;

  /// A 64-bit signed integer value.
  final String? bigintT;

  /// A binary large object (BLOB) value stored as a Base64-encoded string.
  final Uint8List? blobT;

  /// A Boolean value, either <code>true</code> or <code>false</code>.
  final bool? boolT;

  /// A distributed counter value that can be incremented and decremented.
  final String? counterT;

  /// A date value without a time component, represented as days since epoch
  /// (January 1, 1970).
  final String? dateT;

  /// A variable-precision decimal number value.
  final String? decimalT;

  /// A 64-bit double-precision floating point value.
  final String? doubleT;

  /// A duration value with nanosecond precision, representing a period of time
  /// encoded as 32-bit months, 32-bit days, and 64-bit nanoseconds.
  final String? durationT;

  /// A 32-bit single-precision floating point value.
  final String? floatT;

  /// An IP address value, either IPv4 or IPv6 format.
  final String? inetT;

  /// A 32-bit signed integer value.
  final String? intT;

  /// An ordered collection of elements that can contain duplicate values.
  final List<KeyspacesCell>? listT;

  /// A collection of key-value pairs where each key is unique.
  final List<KeyspacesCellMapDefinition>? mapT;

  /// An unordered collection of unique elements.
  final List<KeyspacesCell>? setT;

  /// A 16-bit signed integer value.
  final String? smallintT;

  /// A UTF-8 encoded string value.
  final String? textT;

  /// A time value without a date component, with nanosecond precision.
  final String? timeT;

  /// A timestamp value representing date and time with millisecond precision.
  final String? timestampT;

  /// A universally unique identifier (UUID) that includes a timestamp component,
  /// ensuring both uniqueness and time ordering.
  final String? timeuuidT;

  /// An 8-bit signed integer value.
  final String? tinyintT;

  /// A fixed-length ordered list of elements, where each element can be of a
  /// different data type.
  final List<KeyspacesCell>? tupleT;

  /// A user-defined type (UDT) value consisting of named fields, each with its
  /// own data type.
  final Map<String, KeyspacesCell>? udtT;

  /// A universally unique identifier (UUID) value.
  final String? uuidT;

  /// A UTF-8 encoded string value, functionally equivalent to text type.
  final String? varcharT;

  /// An integer value within the +/-10^38 range.
  final String? varintT;

  KeyspacesCellValue({
    this.asciiT,
    this.bigintT,
    this.blobT,
    this.boolT,
    this.counterT,
    this.dateT,
    this.decimalT,
    this.doubleT,
    this.durationT,
    this.floatT,
    this.inetT,
    this.intT,
    this.listT,
    this.mapT,
    this.setT,
    this.smallintT,
    this.textT,
    this.timeT,
    this.timestampT,
    this.timeuuidT,
    this.tinyintT,
    this.tupleT,
    this.udtT,
    this.uuidT,
    this.varcharT,
    this.varintT,
  });

  factory KeyspacesCellValue.fromJson(Map<String, dynamic> json) {
    return KeyspacesCellValue(
      asciiT: json['asciiT'] as String?,
      bigintT: json['bigintT'] as String?,
      blobT: _s.decodeNullableUint8List(json['blobT'] as String?),
      boolT: json['boolT'] as bool?,
      counterT: json['counterT'] as String?,
      dateT: json['dateT'] as String?,
      decimalT: json['decimalT'] as String?,
      doubleT: json['doubleT'] as String?,
      durationT: json['durationT'] as String?,
      floatT: json['floatT'] as String?,
      inetT: json['inetT'] as String?,
      intT: json['intT'] as String?,
      listT: (json['listT'] as List?)
          ?.nonNulls
          .map((e) => KeyspacesCell.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapT: (json['mapT'] as List?)
          ?.nonNulls
          .map((e) =>
              KeyspacesCellMapDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      setT: (json['setT'] as List?)
          ?.nonNulls
          .map((e) => KeyspacesCell.fromJson(e as Map<String, dynamic>))
          .toList(),
      smallintT: json['smallintT'] as String?,
      textT: json['textT'] as String?,
      timeT: json['timeT'] as String?,
      timestampT: json['timestampT'] as String?,
      timeuuidT: json['timeuuidT'] as String?,
      tinyintT: json['tinyintT'] as String?,
      tupleT: (json['tupleT'] as List?)
          ?.nonNulls
          .map((e) => KeyspacesCell.fromJson(e as Map<String, dynamic>))
          .toList(),
      udtT: (json['udtT'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, KeyspacesCell.fromJson(e as Map<String, dynamic>))),
      uuidT: json['uuidT'] as String?,
      varcharT: json['varcharT'] as String?,
      varintT: json['varintT'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final asciiT = this.asciiT;
    final bigintT = this.bigintT;
    final blobT = this.blobT;
    final boolT = this.boolT;
    final counterT = this.counterT;
    final dateT = this.dateT;
    final decimalT = this.decimalT;
    final doubleT = this.doubleT;
    final durationT = this.durationT;
    final floatT = this.floatT;
    final inetT = this.inetT;
    final intT = this.intT;
    final listT = this.listT;
    final mapT = this.mapT;
    final setT = this.setT;
    final smallintT = this.smallintT;
    final textT = this.textT;
    final timeT = this.timeT;
    final timestampT = this.timestampT;
    final timeuuidT = this.timeuuidT;
    final tinyintT = this.tinyintT;
    final tupleT = this.tupleT;
    final udtT = this.udtT;
    final uuidT = this.uuidT;
    final varcharT = this.varcharT;
    final varintT = this.varintT;
    return {
      if (asciiT != null) 'asciiT': asciiT,
      if (bigintT != null) 'bigintT': bigintT,
      if (blobT != null) 'blobT': base64Encode(blobT),
      if (boolT != null) 'boolT': boolT,
      if (counterT != null) 'counterT': counterT,
      if (dateT != null) 'dateT': dateT,
      if (decimalT != null) 'decimalT': decimalT,
      if (doubleT != null) 'doubleT': doubleT,
      if (durationT != null) 'durationT': durationT,
      if (floatT != null) 'floatT': floatT,
      if (inetT != null) 'inetT': inetT,
      if (intT != null) 'intT': intT,
      if (listT != null) 'listT': listT,
      if (mapT != null) 'mapT': mapT,
      if (setT != null) 'setT': setT,
      if (smallintT != null) 'smallintT': smallintT,
      if (textT != null) 'textT': textT,
      if (timeT != null) 'timeT': timeT,
      if (timestampT != null) 'timestampT': timestampT,
      if (timeuuidT != null) 'timeuuidT': timeuuidT,
      if (tinyintT != null) 'tinyintT': tinyintT,
      if (tupleT != null) 'tupleT': tupleT,
      if (udtT != null) 'udtT': udtT,
      if (uuidT != null) 'uuidT': uuidT,
      if (varcharT != null) 'varcharT': varcharT,
      if (varintT != null) 'varintT': varintT,
    };
  }
}

/// Represents a key-value pair within a map data type in Amazon Keyspaces,
/// including the associated metadata.
///
/// @nodoc
class KeyspacesCellMapDefinition {
  /// The key of this map entry in the Amazon Keyspaces cell.
  final KeyspacesCellValue? key;

  /// Metadata for this specific key-value pair within the map, such as timestamps
  /// and TTL information.
  final KeyspacesMetadata? metadata;

  /// The value associated with the key in this map entry.
  final KeyspacesCellValue? value;

  KeyspacesCellMapDefinition({
    this.key,
    this.metadata,
    this.value,
  });

  factory KeyspacesCellMapDefinition.fromJson(Map<String, dynamic> json) {
    return KeyspacesCellMapDefinition(
      key: json['key'] != null
          ? KeyspacesCellValue.fromJson(json['key'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'] != null
          ? KeyspacesMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
          : null,
      value: json['value'] != null
          ? KeyspacesCellValue.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final metadata = this.metadata;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (metadata != null) 'metadata': metadata,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
