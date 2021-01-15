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

part '2012-08-10.g.dart';

/// Amazon DynamoDB Streams provides API actions for accessing streams and
/// processing stream records. To learn more about application development with
/// Streams, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html">Capturing
/// Table Activity with DynamoDB Streams</a> in the Amazon DynamoDB Developer
/// Guide.
class DynamoDBStreams {
  final _s.JsonProtocol _protocol;
  DynamoDBStreams({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'streams.dynamodb',
            signingName: 'dynamodb',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Returns information about a stream, including the current status of the
  /// stream, its Amazon Resource Name (ARN), the composition of its shards, and
  /// its corresponding DynamoDB table.
  /// <note>
  /// You can call <code>DescribeStream</code> at a maximum rate of 10 times per
  /// second.
  /// </note>
  /// Each shard in the stream has a <code>SequenceNumberRange</code> associated
  /// with it. If the <code>SequenceNumberRange</code> has a
  /// <code>StartingSequenceNumber</code> but no
  /// <code>EndingSequenceNumber</code>, then the shard is still open (able to
  /// receive more stream records). If both <code>StartingSequenceNumber</code>
  /// and <code>EndingSequenceNumber</code> are present, then that shard is
  /// closed and can no longer receive more data.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [streamArn] :
  /// The Amazon Resource Name (ARN) for the stream.
  ///
  /// Parameter [exclusiveStartShardId] :
  /// The shard ID of the first item that this operation will evaluate. Use the
  /// value that was returned for <code>LastEvaluatedShardId</code> in the
  /// previous operation.
  ///
  /// Parameter [limit] :
  /// The maximum number of shard objects to return. The upper limit is 100.
  Future<DescribeStreamOutput> describeStream({
    @_s.required String streamArn,
    String exclusiveStartShardId,
    int limit,
  }) async {
    ArgumentError.checkNotNull(streamArn, 'streamArn');
    _s.validateStringLength(
      'streamArn',
      streamArn,
      37,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'exclusiveStartShardId',
      exclusiveStartShardId,
      28,
      65,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDBStreams_20120810.DescribeStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamArn': streamArn,
        if (exclusiveStartShardId != null)
          'ExclusiveStartShardId': exclusiveStartShardId,
        if (limit != null) 'Limit': limit,
      },
    );

    return DescribeStreamOutput.fromJson(jsonResponse.body);
  }

  /// Retrieves the stream records from a given shard.
  ///
  /// Specify a shard iterator using the <code>ShardIterator</code> parameter.
  /// The shard iterator specifies the position in the shard from which you want
  /// to start reading stream records sequentially. If there are no stream
  /// records available in the portion of the shard that the iterator points to,
  /// <code>GetRecords</code> returns an empty list. Note that it might take
  /// multiple calls to get to a portion of the shard that contains stream
  /// records.
  /// <note>
  /// <code>GetRecords</code> can retrieve a maximum of 1 MB of data or 1000
  /// stream records, whichever comes first.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServerError].
  /// May throw [ExpiredIteratorException].
  /// May throw [TrimmedDataAccessException].
  ///
  /// Parameter [shardIterator] :
  /// A shard iterator that was retrieved from a previous GetShardIterator
  /// operation. This iterator can be used to access the stream records in this
  /// shard.
  ///
  /// Parameter [limit] :
  /// The maximum number of records to return from the shard. The upper limit is
  /// 1000.
  Future<GetRecordsOutput> getRecords({
    @_s.required String shardIterator,
    int limit,
  }) async {
    ArgumentError.checkNotNull(shardIterator, 'shardIterator');
    _s.validateStringLength(
      'shardIterator',
      shardIterator,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDBStreams_20120810.GetRecords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ShardIterator': shardIterator,
        if (limit != null) 'Limit': limit,
      },
    );

    return GetRecordsOutput.fromJson(jsonResponse.body);
  }

  /// Returns a shard iterator. A shard iterator provides information about how
  /// to retrieve the stream records from within a shard. Use the shard iterator
  /// in a subsequent <code>GetRecords</code> request to read the stream records
  /// from the shard.
  /// <note>
  /// A shard iterator expires 15 minutes after it is returned to the requester.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  /// May throw [TrimmedDataAccessException].
  ///
  /// Parameter [shardId] :
  /// The identifier of the shard. The iterator will be returned for this shard
  /// ID.
  ///
  /// Parameter [shardIteratorType] :
  /// Determines how the shard iterator is used to start reading stream records
  /// from the shard:
  ///
  /// <ul>
  /// <li>
  /// <code>AT_SEQUENCE_NUMBER</code> - Start reading exactly from the position
  /// denoted by a specific sequence number.
  /// </li>
  /// <li>
  /// <code>AFTER_SEQUENCE_NUMBER</code> - Start reading right after the
  /// position denoted by a specific sequence number.
  /// </li>
  /// <li>
  /// <code>TRIM_HORIZON</code> - Start reading at the last (untrimmed) stream
  /// record, which is the oldest record in the shard. In DynamoDB Streams,
  /// there is a 24 hour limit on data retention. Stream records whose age
  /// exceeds this limit are subject to removal (trimming) from the stream.
  /// </li>
  /// <li>
  /// <code>LATEST</code> - Start reading just after the most recent stream
  /// record in the shard, so that you always read the most recent data in the
  /// shard.
  /// </li>
  /// </ul>
  ///
  /// Parameter [streamArn] :
  /// The Amazon Resource Name (ARN) for the stream.
  ///
  /// Parameter [sequenceNumber] :
  /// The sequence number of a stream record in the shard from which to start
  /// reading.
  Future<GetShardIteratorOutput> getShardIterator({
    @_s.required String shardId,
    @_s.required ShardIteratorType shardIteratorType,
    @_s.required String streamArn,
    String sequenceNumber,
  }) async {
    ArgumentError.checkNotNull(shardId, 'shardId');
    _s.validateStringLength(
      'shardId',
      shardId,
      28,
      65,
      isRequired: true,
    );
    ArgumentError.checkNotNull(shardIteratorType, 'shardIteratorType');
    ArgumentError.checkNotNull(streamArn, 'streamArn');
    _s.validateStringLength(
      'streamArn',
      streamArn,
      37,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'sequenceNumber',
      sequenceNumber,
      21,
      40,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDBStreams_20120810.GetShardIterator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ShardId': shardId,
        'ShardIteratorType': shardIteratorType?.toValue() ?? '',
        'StreamArn': streamArn,
        if (sequenceNumber != null) 'SequenceNumber': sequenceNumber,
      },
    );

    return GetShardIteratorOutput.fromJson(jsonResponse.body);
  }

  /// Returns an array of stream ARNs associated with the current account and
  /// endpoint. If the <code>TableName</code> parameter is present, then
  /// <code>ListStreams</code> will return only the streams ARNs for that table.
  /// <note>
  /// You can call <code>ListStreams</code> at a maximum rate of 5 times per
  /// second.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerError].
  ///
  /// Parameter [exclusiveStartStreamArn] :
  /// The ARN (Amazon Resource Name) of the first item that this operation will
  /// evaluate. Use the value that was returned for
  /// <code>LastEvaluatedStreamArn</code> in the previous operation.
  ///
  /// Parameter [limit] :
  /// The maximum number of streams to return. The upper limit is 100.
  ///
  /// Parameter [tableName] :
  /// If this parameter is provided, then only the streams associated with this
  /// table name are returned.
  Future<ListStreamsOutput> listStreams({
    String exclusiveStartStreamArn,
    int limit,
    String tableName,
  }) async {
    _s.validateStringLength(
      'exclusiveStartStreamArn',
      exclusiveStartStreamArn,
      37,
      1024,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      1152921504606846976,
    );
    _s.validateStringLength(
      'tableName',
      tableName,
      3,
      255,
    );
    _s.validateStringPattern(
      'tableName',
      tableName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'DynamoDBStreams_20120810.ListStreams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exclusiveStartStreamArn != null)
          'ExclusiveStartStreamArn': exclusiveStartStreamArn,
        if (limit != null) 'Limit': limit,
        if (tableName != null) 'TableName': tableName,
      },
    );

    return ListStreamsOutput.fromJson(jsonResponse.body);
  }
}

/// Represents the data for an attribute.
///
/// Each attribute value is described as a name-value pair. The name is the data
/// type, and the value is the data itself.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html#HowItWorks.DataTypes">Data
/// Types</a> in the <i>Amazon DynamoDB Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AttributeValue {
  /// An attribute of type Binary. For example:
  ///
  /// <code>"B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"</code>
  @Uint8ListConverter()
  @_s.JsonKey(name: 'B')
  final Uint8List b;

  /// An attribute of type Boolean. For example:
  ///
  /// <code>"BOOL": true</code>
  @_s.JsonKey(name: 'BOOL')
  final bool boolValue;

  /// An attribute of type Binary Set. For example:
  ///
  /// <code>"BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]</code>
  @Uint8ListListConverter()
  @_s.JsonKey(name: 'BS')
  final List<Uint8List> bs;

  /// An attribute of type List. For example:
  ///
  /// <code>"L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N", "3.14159"}]</code>
  @_s.JsonKey(name: 'L')
  final List<AttributeValue> l;

  /// An attribute of type Map. For example:
  ///
  /// <code>"M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}</code>
  @_s.JsonKey(name: 'M')
  final Map<String, AttributeValue> m;

  /// An attribute of type Number. For example:
  ///
  /// <code>"N": "123.45"</code>
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats them
  /// as number type attributes for mathematical operations.
  @_s.JsonKey(name: 'N')
  final String n;

  /// An attribute of type Number Set. For example:
  ///
  /// <code>"NS": ["42.2", "-19", "7.5", "3.14"]</code>
  ///
  /// Numbers are sent across the network to DynamoDB as strings, to maximize
  /// compatibility across languages and libraries. However, DynamoDB treats them
  /// as number type attributes for mathematical operations.
  @_s.JsonKey(name: 'NS')
  final List<String> ns;

  /// An attribute of type Null. For example:
  ///
  /// <code>"NULL": true</code>
  @_s.JsonKey(name: 'NULL')
  final bool nullValue;

  /// An attribute of type String. For example:
  ///
  /// <code>"S": "Hello"</code>
  @_s.JsonKey(name: 'S')
  final String s;

  /// An attribute of type String Set. For example:
  ///
  /// <code>"SS": ["Giraffe", "Hippo" ,"Zebra"]</code>
  @_s.JsonKey(name: 'SS')
  final List<String> ss;

  AttributeValue({
    this.b,
    this.boolValue,
    this.bs,
    this.l,
    this.m,
    this.n,
    this.ns,
    this.nullValue,
    this.s,
    this.ss,
  });
  factory AttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueFromJson(json);
}

/// Represents the output of a <code>DescribeStream</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStreamOutput {
  /// A complete description of the stream, including its creation date and time,
  /// the DynamoDB table associated with the stream, the shard IDs within the
  /// stream, and the beginning and ending sequence numbers of stream records
  /// within the shards.
  @_s.JsonKey(name: 'StreamDescription')
  final StreamDescription streamDescription;

  DescribeStreamOutput({
    this.streamDescription,
  });
  factory DescribeStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeStreamOutputFromJson(json);
}

/// Represents the output of a <code>GetRecords</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecordsOutput {
  /// The next position in the shard from which to start sequentially reading
  /// stream records. If set to <code>null</code>, the shard has been closed and
  /// the requested iterator will not return any more data.
  @_s.JsonKey(name: 'NextShardIterator')
  final String nextShardIterator;

  /// The stream records from the shard, which were retrieved using the shard
  /// iterator.
  @_s.JsonKey(name: 'Records')
  final List<Record> records;

  GetRecordsOutput({
    this.nextShardIterator,
    this.records,
  });
  factory GetRecordsOutput.fromJson(Map<String, dynamic> json) =>
      _$GetRecordsOutputFromJson(json);
}

/// Represents the output of a <code>GetShardIterator</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetShardIteratorOutput {
  /// The position in the shard from which to start reading stream records
  /// sequentially. A shard iterator specifies this position using the sequence
  /// number of a stream record in a shard.
  @_s.JsonKey(name: 'ShardIterator')
  final String shardIterator;

  GetShardIteratorOutput({
    this.shardIterator,
  });
  factory GetShardIteratorOutput.fromJson(Map<String, dynamic> json) =>
      _$GetShardIteratorOutputFromJson(json);
}

/// Contains details about the type of identity that made the request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Identity {
  /// A unique identifier for the entity that made the call. For Time To Live, the
  /// principalId is "dynamodb.amazonaws.com".
  @_s.JsonKey(name: 'PrincipalId')
  final String principalId;

  /// The type of the identity. For Time To Live, the type is "Service".
  @_s.JsonKey(name: 'Type')
  final String type;

  Identity({
    this.principalId,
    this.type,
  });
  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);
}

/// Represents <i>a single element</i> of a key schema. A key schema specifies
/// the attributes that make up the primary key of a table, or the key
/// attributes of an index.
///
/// A <code>KeySchemaElement</code> represents exactly one attribute of the
/// primary key. For example, a simple primary key would be represented by one
/// <code>KeySchemaElement</code> (for the partition key). A composite primary
/// key would require one <code>KeySchemaElement</code> for the partition key,
/// and another <code>KeySchemaElement</code> for the sort key.
///
/// A <code>KeySchemaElement</code> must be a scalar, top-level attribute (not a
/// nested attribute). The data type must be one of String, Number, or Binary.
/// The attribute cannot be nested within a List or a Map.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KeySchemaElement {
  /// The name of a key attribute.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The role that this key attribute will assume:
  ///
  /// <ul>
  /// <li>
  /// <code>HASH</code> - partition key
  /// </li>
  /// <li>
  /// <code>RANGE</code> - sort key
  /// </li>
  /// </ul> <note>
  /// The partition key of an item is also known as its <i>hash attribute</i>. The
  /// term "hash attribute" derives from DynamoDB's usage of an internal hash
  /// function to evenly distribute data items across partitions, based on their
  /// partition key values.
  ///
  /// The sort key of an item is also known as its <i>range attribute</i>. The
  /// term "range attribute" derives from the way DynamoDB stores items with the
  /// same partition key physically close together, in sorted order by the sort
  /// key value.
  /// </note>
  @_s.JsonKey(name: 'KeyType')
  final KeyType keyType;

  KeySchemaElement({
    @_s.required this.attributeName,
    @_s.required this.keyType,
  });
  factory KeySchemaElement.fromJson(Map<String, dynamic> json) =>
      _$KeySchemaElementFromJson(json);
}

enum KeyType {
  @_s.JsonValue('HASH')
  hash,
  @_s.JsonValue('RANGE')
  range,
}

/// Represents the output of a <code>ListStreams</code> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStreamsOutput {
  /// The stream ARN of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding this
  /// value in the new request.
  ///
  /// If <code>LastEvaluatedStreamArn</code> is empty, then the "last page" of
  /// results has been processed and there is no more data to be retrieved.
  ///
  /// If <code>LastEvaluatedStreamArn</code> is not empty, it does not necessarily
  /// mean that there is more data in the result set. The only way to know when
  /// you have reached the end of the result set is when
  /// <code>LastEvaluatedStreamArn</code> is empty.
  @_s.JsonKey(name: 'LastEvaluatedStreamArn')
  final String lastEvaluatedStreamArn;

  /// A list of stream descriptors associated with the current account and
  /// endpoint.
  @_s.JsonKey(name: 'Streams')
  final List<Stream> streams;

  ListStreamsOutput({
    this.lastEvaluatedStreamArn,
    this.streams,
  });
  factory ListStreamsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListStreamsOutputFromJson(json);
}

enum OperationType {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('MODIFY')
  modify,
  @_s.JsonValue('REMOVE')
  remove,
}

/// A description of a unique event within a stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Record {
  /// The region in which the <code>GetRecords</code> request was received.
  @_s.JsonKey(name: 'awsRegion')
  final String awsRegion;

  /// The main body of the stream record, containing all of the DynamoDB-specific
  /// fields.
  @_s.JsonKey(name: 'dynamodb')
  final StreamRecord dynamodb;

  /// A globally unique identifier for the event that was recorded in this stream
  /// record.
  @_s.JsonKey(name: 'eventID')
  final String eventID;

  /// The type of data modification that was performed on the DynamoDB table:
  ///
  /// <ul>
  /// <li>
  /// <code>INSERT</code> - a new item was added to the table.
  /// </li>
  /// <li>
  /// <code>MODIFY</code> - one or more of an existing item's attributes were
  /// modified.
  /// </li>
  /// <li>
  /// <code>REMOVE</code> - the item was deleted from the table
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'eventName')
  final OperationType eventName;

  /// The AWS service from which the stream record originated. For DynamoDB
  /// Streams, this is <code>aws:dynamodb</code>.
  @_s.JsonKey(name: 'eventSource')
  final String eventSource;

  /// The version number of the stream record format. This number is updated
  /// whenever the structure of <code>Record</code> is modified.
  ///
  /// Client applications must not assume that <code>eventVersion</code> will
  /// remain at a particular value, as this number is subject to change at any
  /// time. In general, <code>eventVersion</code> will only increase as the
  /// low-level DynamoDB Streams API evolves.
  @_s.JsonKey(name: 'eventVersion')
  final String eventVersion;

  /// Items that are deleted by the Time to Live process after expiration have the
  /// following fields:
  ///
  /// <ul>
  /// <li>
  /// Records[].userIdentity.type
  ///
  /// "Service"
  /// </li>
  /// <li>
  /// Records[].userIdentity.principalId
  ///
  /// "dynamodb.amazonaws.com"
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'userIdentity')
  final Identity userIdentity;

  Record({
    this.awsRegion,
    this.dynamodb,
    this.eventID,
    this.eventName,
    this.eventSource,
    this.eventVersion,
    this.userIdentity,
  });
  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
}

/// The beginning and ending sequence numbers for the stream records contained
/// within a shard.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SequenceNumberRange {
  /// The last sequence number for the stream records contained within a shard.
  /// String contains numeric characters only.
  @_s.JsonKey(name: 'EndingSequenceNumber')
  final String endingSequenceNumber;

  /// The first sequence number for the stream records contained within a shard.
  /// String contains numeric characters only.
  @_s.JsonKey(name: 'StartingSequenceNumber')
  final String startingSequenceNumber;

  SequenceNumberRange({
    this.endingSequenceNumber,
    this.startingSequenceNumber,
  });
  factory SequenceNumberRange.fromJson(Map<String, dynamic> json) =>
      _$SequenceNumberRangeFromJson(json);
}

/// A uniquely identified group of stream records within a stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Shard {
  /// The shard ID of the current shard's parent.
  @_s.JsonKey(name: 'ParentShardId')
  final String parentShardId;

  /// The range of possible sequence numbers for the shard.
  @_s.JsonKey(name: 'SequenceNumberRange')
  final SequenceNumberRange sequenceNumberRange;

  /// The system-generated identifier for this shard.
  @_s.JsonKey(name: 'ShardId')
  final String shardId;

  Shard({
    this.parentShardId,
    this.sequenceNumberRange,
    this.shardId,
  });
  factory Shard.fromJson(Map<String, dynamic> json) => _$ShardFromJson(json);
}

enum ShardIteratorType {
  @_s.JsonValue('TRIM_HORIZON')
  trimHorizon,
  @_s.JsonValue('LATEST')
  latest,
  @_s.JsonValue('AT_SEQUENCE_NUMBER')
  atSequenceNumber,
  @_s.JsonValue('AFTER_SEQUENCE_NUMBER')
  afterSequenceNumber,
}

extension on ShardIteratorType {
  String toValue() {
    switch (this) {
      case ShardIteratorType.trimHorizon:
        return 'TRIM_HORIZON';
      case ShardIteratorType.latest:
        return 'LATEST';
      case ShardIteratorType.atSequenceNumber:
        return 'AT_SEQUENCE_NUMBER';
      case ShardIteratorType.afterSequenceNumber:
        return 'AFTER_SEQUENCE_NUMBER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents all of the data describing a particular stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Stream {
  /// The Amazon Resource Name (ARN) for the stream.
  @_s.JsonKey(name: 'StreamArn')
  final String streamArn;

  /// A timestamp, in ISO 8601 format, for this stream.
  ///
  /// Note that <code>LatestStreamLabel</code> is not a unique identifier for the
  /// stream, because it is possible that a stream from another table might have
  /// the same timestamp. However, the combination of the following three elements
  /// is guaranteed to be unique:
  ///
  /// <ul>
  /// <li>
  /// the AWS customer ID.
  /// </li>
  /// <li>
  /// the table name
  /// </li>
  /// <li>
  /// the <code>StreamLabel</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StreamLabel')
  final String streamLabel;

  /// The DynamoDB table with which the stream is associated.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  Stream({
    this.streamArn,
    this.streamLabel,
    this.tableName,
  });
  factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);
}

/// Represents all of the data describing a particular stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamDescription {
  /// The date and time when the request to create this stream was issued.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationRequestDateTime')
  final DateTime creationRequestDateTime;

  /// The key attribute(s) of the stream's DynamoDB table.
  @_s.JsonKey(name: 'KeySchema')
  final List<KeySchemaElement> keySchema;

  /// The shard ID of the item where the operation stopped, inclusive of the
  /// previous result set. Use this value to start a new operation, excluding this
  /// value in the new request.
  ///
  /// If <code>LastEvaluatedShardId</code> is empty, then the "last page" of
  /// results has been processed and there is currently no more data to be
  /// retrieved.
  ///
  /// If <code>LastEvaluatedShardId</code> is not empty, it does not necessarily
  /// mean that there is more data in the result set. The only way to know when
  /// you have reached the end of the result set is when
  /// <code>LastEvaluatedShardId</code> is empty.
  @_s.JsonKey(name: 'LastEvaluatedShardId')
  final String lastEvaluatedShardId;

  /// The shards that comprise the stream.
  @_s.JsonKey(name: 'Shards')
  final List<Shard> shards;

  /// The Amazon Resource Name (ARN) for the stream.
  @_s.JsonKey(name: 'StreamArn')
  final String streamArn;

  /// A timestamp, in ISO 8601 format, for this stream.
  ///
  /// Note that <code>LatestStreamLabel</code> is not a unique identifier for the
  /// stream, because it is possible that a stream from another table might have
  /// the same timestamp. However, the combination of the following three elements
  /// is guaranteed to be unique:
  ///
  /// <ul>
  /// <li>
  /// the AWS customer ID.
  /// </li>
  /// <li>
  /// the table name
  /// </li>
  /// <li>
  /// the <code>StreamLabel</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StreamLabel')
  final String streamLabel;

  /// Indicates the current status of the stream:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLING</code> - Streams is currently being enabled on the DynamoDB
  /// table.
  /// </li>
  /// <li>
  /// <code>ENABLED</code> - the stream is enabled.
  /// </li>
  /// <li>
  /// <code>DISABLING</code> - Streams is currently being disabled on the DynamoDB
  /// table.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - the stream is disabled.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StreamStatus')
  final StreamStatus streamStatus;

  /// Indicates the format of the records within this stream:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - only the key attributes of items that were modified
  /// in the DynamoDB table.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - entire items from the table, as they appeared after
  /// they were modified.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - entire items from the table, as they appeared
  /// before they were modified.
  /// </li>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - both the new and the old images of the
  /// items from the table.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StreamViewType')
  final StreamViewType streamViewType;

  /// The DynamoDB table with which the stream is associated.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  StreamDescription({
    this.creationRequestDateTime,
    this.keySchema,
    this.lastEvaluatedShardId,
    this.shards,
    this.streamArn,
    this.streamLabel,
    this.streamStatus,
    this.streamViewType,
    this.tableName,
  });
  factory StreamDescription.fromJson(Map<String, dynamic> json) =>
      _$StreamDescriptionFromJson(json);
}

/// A description of a single data modification that was performed on an item in
/// a DynamoDB table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamRecord {
  /// The approximate date and time when the stream record was created, in <a
  /// href="http://www.epochconverter.com/">UNIX epoch time</a> format.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ApproximateCreationDateTime')
  final DateTime approximateCreationDateTime;

  /// The primary key attribute(s) for the DynamoDB item that was modified.
  @_s.JsonKey(name: 'Keys')
  final Map<String, AttributeValue> keys;

  /// The item in the DynamoDB table as it appeared after it was modified.
  @_s.JsonKey(name: 'NewImage')
  final Map<String, AttributeValue> newImage;

  /// The item in the DynamoDB table as it appeared before it was modified.
  @_s.JsonKey(name: 'OldImage')
  final Map<String, AttributeValue> oldImage;

  /// The sequence number of the stream record.
  @_s.JsonKey(name: 'SequenceNumber')
  final String sequenceNumber;

  /// The size of the stream record, in bytes.
  @_s.JsonKey(name: 'SizeBytes')
  final int sizeBytes;

  /// The type of data from the modified DynamoDB item that was captured in this
  /// stream record:
  ///
  /// <ul>
  /// <li>
  /// <code>KEYS_ONLY</code> - only the key attributes of the modified item.
  /// </li>
  /// <li>
  /// <code>NEW_IMAGE</code> - the entire item, as it appeared after it was
  /// modified.
  /// </li>
  /// <li>
  /// <code>OLD_IMAGE</code> - the entire item, as it appeared before it was
  /// modified.
  /// </li>
  /// <li>
  /// <code>NEW_AND_OLD_IMAGES</code> - both the new and the old item images of
  /// the item.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StreamViewType')
  final StreamViewType streamViewType;

  StreamRecord({
    this.approximateCreationDateTime,
    this.keys,
    this.newImage,
    this.oldImage,
    this.sequenceNumber,
    this.sizeBytes,
    this.streamViewType,
  });
  factory StreamRecord.fromJson(Map<String, dynamic> json) =>
      _$StreamRecordFromJson(json);
}

enum StreamStatus {
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('DISABLING')
  disabling,
  @_s.JsonValue('DISABLED')
  disabled,
}

enum StreamViewType {
  @_s.JsonValue('NEW_IMAGE')
  newImage,
  @_s.JsonValue('OLD_IMAGE')
  oldImage,
  @_s.JsonValue('NEW_AND_OLD_IMAGES')
  newAndOldImages,
  @_s.JsonValue('KEYS_ONLY')
  keysOnly,
}

class ExpiredIteratorException extends _s.GenericAwsException {
  ExpiredIteratorException({String type, String message})
      : super(type: type, code: 'ExpiredIteratorException', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String type, String message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TrimmedDataAccessException extends _s.GenericAwsException {
  TrimmedDataAccessException({String type, String message})
      : super(type: type, code: 'TrimmedDataAccessException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ExpiredIteratorException': (type, message) =>
      ExpiredIteratorException(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TrimmedDataAccessException': (type, message) =>
      TrimmedDataAccessException(type: type, message: message),
};
