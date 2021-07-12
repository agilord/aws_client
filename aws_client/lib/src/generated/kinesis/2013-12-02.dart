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

/// Amazon Kinesis Data Streams is a managed service that scales elastically for
/// real-time processing of streaming big data.
class Kinesis {
  final _s.JsonProtocol _protocol;
  Kinesis({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesis',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds or updates tags for the specified Kinesis data stream. Each time you
  /// invoke this operation, you can specify up to 10 tags. If you want to add
  /// more than 10 tags to your stream, you can invoke this operation multiple
  /// times. In total, each stream can have up to 50 tags.
  ///
  /// If tags have already been assigned to the stream,
  /// <code>AddTagsToStream</code> overwrites any existing tags that correspond
  /// to the specified tag keys.
  ///
  /// <a>AddTagsToStream</a> has a limit of five transactions per second per
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [streamName] :
  /// The name of the stream.
  ///
  /// Parameter [tags] :
  /// A set of up to 10 key-value pairs to use to create the tags.
  Future<void> addTagsToStream({
    required String streamName,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.AddTagsToStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamName': streamName,
        'Tags': tags,
      },
    );
  }

  /// Creates a Kinesis data stream. A stream captures and transports data
  /// records that are continuously emitted from different data sources or
  /// <i>producers</i>. Scale-out within a stream is explicitly supported by
  /// means of shards, which are uniquely identified groups of data records in a
  /// stream.
  ///
  /// You specify and control the number of shards that a stream is composed of.
  /// Each shard can support reads up to five transactions per second, up to a
  /// maximum data read total of 2 MiB per second. Each shard can support writes
  /// up to 1,000 records per second, up to a maximum data write total of 1 MiB
  /// per second. If the amount of data input increases or decreases, you can
  /// add or remove shards.
  ///
  /// The stream name identifies the stream. The name is scoped to the AWS
  /// account used by the application. It is also scoped by AWS Region. That is,
  /// two streams in two different accounts can have the same name, and two
  /// streams in the same account, but in two different Regions, can have the
  /// same name.
  ///
  /// <code>CreateStream</code> is an asynchronous operation. Upon receiving a
  /// <code>CreateStream</code> request, Kinesis Data Streams immediately
  /// returns and sets the stream status to <code>CREATING</code>. After the
  /// stream is created, Kinesis Data Streams sets the stream status to
  /// <code>ACTIVE</code>. You should perform read and write operations only on
  /// an <code>ACTIVE</code> stream.
  ///
  /// You receive a <code>LimitExceededException</code> when making a
  /// <code>CreateStream</code> request when you try to do one of the following:
  ///
  /// <ul>
  /// <li>
  /// Have more than five streams in the <code>CREATING</code> state at any
  /// point in time.
  /// </li>
  /// <li>
  /// Create more shards than are authorized for your account.
  /// </li>
  /// </ul>
  /// For the default shard limit for an AWS account, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Amazon
  /// Kinesis Data Streams Limits</a> in the <i>Amazon Kinesis Data Streams
  /// Developer Guide</i>. To increase this limit, <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact
  /// AWS Support</a>.
  ///
  /// You can use <code>DescribeStream</code> to check the stream status, which
  /// is returned in <code>StreamStatus</code>.
  ///
  /// <a>CreateStream</a> has a limit of five transactions per second per
  /// account.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [shardCount] :
  /// The number of shards that the stream will use. The throughput of the
  /// stream is a function of the number of shards; more shards are required for
  /// greater provisioned throughput.
  ///
  /// Parameter [streamName] :
  /// A name to identify the stream. The stream name is scoped to the AWS
  /// account used by the application that creates the stream. It is also scoped
  /// by AWS Region. That is, two streams in two different AWS accounts can have
  /// the same name. Two streams in the same AWS account but in two different
  /// Regions can also have the same name.
  Future<void> createStream({
    required int shardCount,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(shardCount, 'shardCount');
    _s.validateNumRange(
      'shardCount',
      shardCount,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.CreateStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ShardCount': shardCount,
        'StreamName': streamName,
      },
    );
  }

  /// Decreases the Kinesis data stream's retention period, which is the length
  /// of time data records are accessible after they are added to the stream.
  /// The minimum value of a stream's retention period is 24 hours.
  ///
  /// This operation may result in lost data. For example, if the stream's
  /// retention period is 48 hours and is decreased to 24 hours, any data
  /// already in the stream that is older than 24 hours is inaccessible.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [retentionPeriodHours] :
  /// The new retention period of the stream, in hours. Must be less than the
  /// current retention period.
  ///
  /// Parameter [streamName] :
  /// The name of the stream to modify.
  Future<void> decreaseStreamRetentionPeriod({
    required int retentionPeriodHours,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(retentionPeriodHours, 'retentionPeriodHours');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DecreaseStreamRetentionPeriod'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RetentionPeriodHours': retentionPeriodHours,
        'StreamName': streamName,
      },
    );
  }

  /// Deletes a Kinesis data stream and all its shards and data. You must shut
  /// down any applications that are operating on the stream before you delete
  /// the stream. If an application attempts to operate on a deleted stream, it
  /// receives the exception <code>ResourceNotFoundException</code>.
  ///
  /// If the stream is in the <code>ACTIVE</code> state, you can delete it.
  /// After a <code>DeleteStream</code> request, the specified stream is in the
  /// <code>DELETING</code> state until Kinesis Data Streams completes the
  /// deletion.
  ///
  /// <b>Note:</b> Kinesis Data Streams might continue to accept data read and
  /// write operations, such as <a>PutRecord</a>, <a>PutRecords</a>, and
  /// <a>GetRecords</a>, on a stream in the <code>DELETING</code> state until
  /// the stream deletion is complete.
  ///
  /// When you delete a stream, any shards in that stream are also deleted, and
  /// any tags are dissociated from the stream.
  ///
  /// You can use the <a>DescribeStream</a> operation to check the state of the
  /// stream, which is returned in <code>StreamStatus</code>.
  ///
  /// <a>DeleteStream</a> has a limit of five transactions per second per
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [streamName] :
  /// The name of the stream to delete.
  ///
  /// Parameter [enforceConsumerDeletion] :
  /// If this parameter is unset (<code>null</code>) or if you set it to
  /// <code>false</code>, and the stream has registered consumers, the call to
  /// <code>DeleteStream</code> fails with a
  /// <code>ResourceInUseException</code>.
  Future<void> deleteStream({
    required String streamName,
    bool? enforceConsumerDeletion,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DeleteStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamName': streamName,
        if (enforceConsumerDeletion != null)
          'EnforceConsumerDeletion': enforceConsumerDeletion,
      },
    );
  }

  /// To deregister a consumer, provide its ARN. Alternatively, you can provide
  /// the ARN of the data stream and the name you gave the consumer when you
  /// registered it. You may also provide all three parameters, as long as they
  /// don't conflict with each other. If you don't know the name or ARN of the
  /// consumer that you want to deregister, you can use the
  /// <a>ListStreamConsumers</a> operation to get a list of the descriptions of
  /// all the consumers that are currently registered with a given data stream.
  /// The description of a consumer contains its name and ARN.
  ///
  /// This operation has a limit of five transactions per second per stream.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [consumerARN] :
  /// The ARN returned by Kinesis Data Streams when you registered the consumer.
  /// If you don't know the ARN of the consumer that you want to deregister, you
  /// can use the ListStreamConsumers operation to get a list of the
  /// descriptions of all the consumers that are currently registered with a
  /// given data stream. The description of a consumer contains its ARN.
  ///
  /// Parameter [consumerName] :
  /// The name that you gave to the consumer.
  ///
  /// Parameter [streamARN] :
  /// The ARN of the Kinesis data stream that the consumer is registered with.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<void> deregisterStreamConsumer({
    String? consumerARN,
    String? consumerName,
    String? streamARN,
  }) async {
    _s.validateStringLength(
      'consumerARN',
      consumerARN,
      1,
      2048,
    );
    _s.validateStringLength(
      'consumerName',
      consumerName,
      1,
      128,
    );
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DeregisterStreamConsumer'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (consumerARN != null) 'ConsumerARN': consumerARN,
        if (consumerName != null) 'ConsumerName': consumerName,
        if (streamARN != null) 'StreamARN': streamARN,
      },
    );
  }

  /// Describes the shard limits and usage for the account.
  ///
  /// If you update your account limits, the old limits might be returned for a
  /// few minutes.
  ///
  /// This operation has a limit of one transaction per second per account.
  ///
  /// May throw [LimitExceededException].
  Future<DescribeLimitsOutput> describeLimits() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DescribeLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeLimitsOutput.fromJson(jsonResponse.body);
  }

  /// Describes the specified Kinesis data stream.
  ///
  /// The information returned includes the stream name, Amazon Resource Name
  /// (ARN), creation time, enhanced metric configuration, and shard map. The
  /// shard map is an array of shard objects. For each shard object, there is
  /// the hash key and sequence number ranges that the shard spans, and the IDs
  /// of any earlier shards that played in a role in creating the shard. Every
  /// record ingested in the stream is identified by a sequence number, which is
  /// assigned when the record is put into the stream.
  ///
  /// You can limit the number of shards returned by each call. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-retrieve-shards.html">Retrieving
  /// Shards from a Stream</a> in the <i>Amazon Kinesis Data Streams Developer
  /// Guide</i>.
  ///
  /// There are no guarantees about the chronological order shards returned. To
  /// process shards in chronological order, use the ID of the parent shard to
  /// track the lineage to the oldest shard.
  ///
  /// This operation has a limit of 10 transactions per second per account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [streamName] :
  /// The name of the stream to describe.
  ///
  /// Parameter [exclusiveStartShardId] :
  /// The shard ID of the shard to start with.
  ///
  /// Parameter [limit] :
  /// The maximum number of shards to return in a single call. The default value
  /// is 100. If you specify a value greater than 100, at most 100 shards are
  /// returned.
  Future<DescribeStreamOutput> describeStream({
    required String streamName,
    String? exclusiveStartShardId,
    int? limit,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'exclusiveStartShardId',
      exclusiveStartShardId,
      1,
      128,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DescribeStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamName': streamName,
        if (exclusiveStartShardId != null)
          'ExclusiveStartShardId': exclusiveStartShardId,
        if (limit != null) 'Limit': limit,
      },
    );

    return DescribeStreamOutput.fromJson(jsonResponse.body);
  }

  /// To get the description of a registered consumer, provide the ARN of the
  /// consumer. Alternatively, you can provide the ARN of the data stream and
  /// the name you gave the consumer when you registered it. You may also
  /// provide all three parameters, as long as they don't conflict with each
  /// other. If you don't know the name or ARN of the consumer that you want to
  /// describe, you can use the <a>ListStreamConsumers</a> operation to get a
  /// list of the descriptions of all the consumers that are currently
  /// registered with a given data stream.
  ///
  /// This operation has a limit of 20 transactions per second per stream.
  ///
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [consumerARN] :
  /// The ARN returned by Kinesis Data Streams when you registered the consumer.
  ///
  /// Parameter [consumerName] :
  /// The name that you gave to the consumer.
  ///
  /// Parameter [streamARN] :
  /// The ARN of the Kinesis data stream that the consumer is registered with.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<DescribeStreamConsumerOutput> describeStreamConsumer({
    String? consumerARN,
    String? consumerName,
    String? streamARN,
  }) async {
    _s.validateStringLength(
      'consumerARN',
      consumerARN,
      1,
      2048,
    );
    _s.validateStringLength(
      'consumerName',
      consumerName,
      1,
      128,
    );
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      2048,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DescribeStreamConsumer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (consumerARN != null) 'ConsumerARN': consumerARN,
        if (consumerName != null) 'ConsumerName': consumerName,
        if (streamARN != null) 'StreamARN': streamARN,
      },
    );

    return DescribeStreamConsumerOutput.fromJson(jsonResponse.body);
  }

  /// Provides a summarized description of the specified Kinesis data stream
  /// without the shard list.
  ///
  /// The information returned includes the stream name, Amazon Resource Name
  /// (ARN), status, record retention period, approximate creation time,
  /// monitoring, encryption details, and open shard count.
  ///
  /// <a>DescribeStreamSummary</a> has a limit of 20 transactions per second per
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [streamName] :
  /// The name of the stream to describe.
  Future<DescribeStreamSummaryOutput> describeStreamSummary({
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DescribeStreamSummary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamName': streamName,
      },
    );

    return DescribeStreamSummaryOutput.fromJson(jsonResponse.body);
  }

  /// Disables enhanced monitoring.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [shardLevelMetrics] :
  /// List of shard-level metrics to disable.
  ///
  /// The following are the valid shard-level metrics. The value
  /// "<code>ALL</code>" disables every metric.
  ///
  /// <ul>
  /// <li>
  /// <code>IncomingBytes</code>
  /// </li>
  /// <li>
  /// <code>IncomingRecords</code>
  /// </li>
  /// <li>
  /// <code>OutgoingBytes</code>
  /// </li>
  /// <li>
  /// <code>OutgoingRecords</code>
  /// </li>
  /// <li>
  /// <code>WriteProvisionedThroughputExceeded</code>
  /// </li>
  /// <li>
  /// <code>ReadProvisionedThroughputExceeded</code>
  /// </li>
  /// <li>
  /// <code>IteratorAgeMilliseconds</code>
  /// </li>
  /// <li>
  /// <code>ALL</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html">Monitoring
  /// the Amazon Kinesis Data Streams Service with Amazon CloudWatch</a> in the
  /// <i>Amazon Kinesis Data Streams Developer Guide</i>.
  ///
  /// Parameter [streamName] :
  /// The name of the Kinesis data stream for which to disable enhanced
  /// monitoring.
  Future<EnhancedMonitoringOutput> disableEnhancedMonitoring({
    required List<MetricsName> shardLevelMetrics,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(shardLevelMetrics, 'shardLevelMetrics');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.DisableEnhancedMonitoring'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ShardLevelMetrics': shardLevelMetrics.map((e) => e.toValue()).toList(),
        'StreamName': streamName,
      },
    );

    return EnhancedMonitoringOutput.fromJson(jsonResponse.body);
  }

  /// Enables enhanced Kinesis data stream monitoring for shard-level metrics.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [shardLevelMetrics] :
  /// List of shard-level metrics to enable.
  ///
  /// The following are the valid shard-level metrics. The value
  /// "<code>ALL</code>" enables every metric.
  ///
  /// <ul>
  /// <li>
  /// <code>IncomingBytes</code>
  /// </li>
  /// <li>
  /// <code>IncomingRecords</code>
  /// </li>
  /// <li>
  /// <code>OutgoingBytes</code>
  /// </li>
  /// <li>
  /// <code>OutgoingRecords</code>
  /// </li>
  /// <li>
  /// <code>WriteProvisionedThroughputExceeded</code>
  /// </li>
  /// <li>
  /// <code>ReadProvisionedThroughputExceeded</code>
  /// </li>
  /// <li>
  /// <code>IteratorAgeMilliseconds</code>
  /// </li>
  /// <li>
  /// <code>ALL</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html">Monitoring
  /// the Amazon Kinesis Data Streams Service with Amazon CloudWatch</a> in the
  /// <i>Amazon Kinesis Data Streams Developer Guide</i>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream for which to enable enhanced monitoring.
  Future<EnhancedMonitoringOutput> enableEnhancedMonitoring({
    required List<MetricsName> shardLevelMetrics,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(shardLevelMetrics, 'shardLevelMetrics');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.EnableEnhancedMonitoring'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ShardLevelMetrics': shardLevelMetrics.map((e) => e.toValue()).toList(),
        'StreamName': streamName,
      },
    );

    return EnhancedMonitoringOutput.fromJson(jsonResponse.body);
  }

  /// Gets data records from a Kinesis data stream's shard.
  ///
  /// Specify a shard iterator using the <code>ShardIterator</code> parameter.
  /// The shard iterator specifies the position in the shard from which you want
  /// to start reading data records sequentially. If there are no records
  /// available in the portion of the shard that the iterator points to,
  /// <a>GetRecords</a> returns an empty list. It might take multiple calls to
  /// get to a portion of the shard that contains records.
  ///
  /// You can scale by provisioning multiple shards per stream while considering
  /// service limits (for more information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Amazon
  /// Kinesis Data Streams Limits</a> in the <i>Amazon Kinesis Data Streams
  /// Developer Guide</i>). Your application should have one thread per shard,
  /// each reading continuously from its stream. To read from a stream
  /// continually, call <a>GetRecords</a> in a loop. Use <a>GetShardIterator</a>
  /// to get the shard iterator to specify in the first <a>GetRecords</a> call.
  /// <a>GetRecords</a> returns a new shard iterator in
  /// <code>NextShardIterator</code>. Specify the shard iterator returned in
  /// <code>NextShardIterator</code> in subsequent calls to <a>GetRecords</a>.
  /// If the shard has been closed, the shard iterator can't return more data
  /// and <a>GetRecords</a> returns <code>null</code> in
  /// <code>NextShardIterator</code>. You can terminate the loop when the shard
  /// is closed, or when the shard iterator reaches the record with the sequence
  /// number or other attribute that marks it as the last record to process.
  ///
  /// Each data record can be up to 1 MiB in size, and each shard can read up to
  /// 2 MiB per second. You can ensure that your calls don't exceed the maximum
  /// supported size or throughput by using the <code>Limit</code> parameter to
  /// specify the maximum number of records that <a>GetRecords</a> can return.
  /// Consider your average record size when determining this limit. The maximum
  /// number of records that can be returned per call is 10,000.
  ///
  /// The size of the data returned by <a>GetRecords</a> varies depending on the
  /// utilization of the shard. The maximum size of data that <a>GetRecords</a>
  /// can return is 10 MiB. If a call returns this amount of data, subsequent
  /// calls made within the next 5 seconds throw
  /// <code>ProvisionedThroughputExceededException</code>. If there is
  /// insufficient provisioned throughput on the stream, subsequent calls made
  /// within the next 1 second throw
  /// <code>ProvisionedThroughputExceededException</code>. <a>GetRecords</a>
  /// doesn't return any data when it throws an exception. For this reason, we
  /// recommend that you wait 1 second between calls to <a>GetRecords</a>.
  /// However, it's possible that the application will get exceptions for longer
  /// than 1 second.
  ///
  /// To detect whether the application is falling behind in processing, you can
  /// use the <code>MillisBehindLatest</code> response attribute. You can also
  /// monitor the stream using CloudWatch metrics and other mechanisms (see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/monitoring.html">Monitoring</a>
  /// in the <i>Amazon Kinesis Data Streams Developer Guide</i>).
  ///
  /// Each Amazon Kinesis record includes a value,
  /// <code>ApproximateArrivalTimestamp</code>, that is set when a stream
  /// successfully receives and stores a record. This is commonly referred to as
  /// a server-side time stamp, whereas a client-side time stamp is set when a
  /// data producer creates or sends the record to a stream (a data producer is
  /// any data source putting data records into a stream, for example with
  /// <a>PutRecords</a>). The time stamp has millisecond precision. There are no
  /// guarantees about the time stamp accuracy, or that the time stamp is always
  /// increasing. For example, records in a shard or across a stream might have
  /// time stamps that are out of order.
  ///
  /// This operation has a limit of five transactions per second per shard.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [ExpiredIteratorException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [KMSNotFoundException].
  /// May throw [KMSOptInRequired].
  /// May throw [KMSThrottlingException].
  ///
  /// Parameter [shardIterator] :
  /// The position in the shard from which you want to start sequentially
  /// reading data records. A shard iterator specifies this position using the
  /// sequence number of a data record in the shard.
  ///
  /// Parameter [limit] :
  /// The maximum number of records to return. Specify a value of up to 10,000.
  /// If you specify a value that is greater than 10,000, <a>GetRecords</a>
  /// throws <code>InvalidArgumentException</code>. The default value is 10,000.
  Future<GetRecordsOutput> getRecords({
    required String shardIterator,
    int? limit,
  }) async {
    ArgumentError.checkNotNull(shardIterator, 'shardIterator');
    _s.validateStringLength(
      'shardIterator',
      shardIterator,
      1,
      512,
      isRequired: true,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.GetRecords'
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

  /// Gets an Amazon Kinesis shard iterator. A shard iterator expires 5 minutes
  /// after it is returned to the requester.
  ///
  /// A shard iterator specifies the shard position from which to start reading
  /// data records sequentially. The position is specified using the sequence
  /// number of a data record in a shard. A sequence number is the identifier
  /// associated with every record ingested in the stream, and is assigned when
  /// a record is put into the stream. Each stream has one or more shards.
  ///
  /// You must specify the shard iterator type. For example, you can set the
  /// <code>ShardIteratorType</code> parameter to read exactly from the position
  /// denoted by a specific sequence number by using the
  /// <code>AT_SEQUENCE_NUMBER</code> shard iterator type. Alternatively, the
  /// parameter can read right after the sequence number by using the
  /// <code>AFTER_SEQUENCE_NUMBER</code> shard iterator type, using sequence
  /// numbers returned by earlier calls to <a>PutRecord</a>, <a>PutRecords</a>,
  /// <a>GetRecords</a>, or <a>DescribeStream</a>. In the request, you can
  /// specify the shard iterator type <code>AT_TIMESTAMP</code> to read records
  /// from an arbitrary point in time, <code>TRIM_HORIZON</code> to cause
  /// <code>ShardIterator</code> to point to the last untrimmed record in the
  /// shard in the system (the oldest data record in the shard), or
  /// <code>LATEST</code> so that you always read the most recent data in the
  /// shard.
  ///
  /// When you read repeatedly from a stream, use a <a>GetShardIterator</a>
  /// request to get the first shard iterator for use in your first
  /// <a>GetRecords</a> request and for subsequent reads use the shard iterator
  /// returned by the <a>GetRecords</a> request in
  /// <code>NextShardIterator</code>. A new shard iterator is returned by every
  /// <a>GetRecords</a> request in <code>NextShardIterator</code>, which you use
  /// in the <code>ShardIterator</code> parameter of the next <a>GetRecords</a>
  /// request.
  ///
  /// If a <a>GetShardIterator</a> request is made too often, you receive a
  /// <code>ProvisionedThroughputExceededException</code>. For more information
  /// about throughput limits, see <a>GetRecords</a>, and <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Streams
  /// Limits</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.
  ///
  /// If the shard is closed, <a>GetShardIterator</a> returns a valid iterator
  /// for the last sequence number of the shard. A shard can be closed as a
  /// result of using <a>SplitShard</a> or <a>MergeShards</a>.
  ///
  /// <a>GetShardIterator</a> has a limit of five transactions per second per
  /// account per open shard.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ProvisionedThroughputExceededException].
  ///
  /// Parameter [shardId] :
  /// The shard ID of the Kinesis Data Streams shard to get the iterator for.
  ///
  /// Parameter [shardIteratorType] :
  /// Determines how the shard iterator is used to start reading data records
  /// from the shard.
  ///
  /// The following are the valid Amazon Kinesis shard iterator types:
  ///
  /// <ul>
  /// <li>
  /// AT_SEQUENCE_NUMBER - Start reading from the position denoted by a specific
  /// sequence number, provided in the value
  /// <code>StartingSequenceNumber</code>.
  /// </li>
  /// <li>
  /// AFTER_SEQUENCE_NUMBER - Start reading right after the position denoted by
  /// a specific sequence number, provided in the value
  /// <code>StartingSequenceNumber</code>.
  /// </li>
  /// <li>
  /// AT_TIMESTAMP - Start reading from the position denoted by a specific time
  /// stamp, provided in the value <code>Timestamp</code>.
  /// </li>
  /// <li>
  /// TRIM_HORIZON - Start reading at the last untrimmed record in the shard in
  /// the system, which is the oldest data record in the shard.
  /// </li>
  /// <li>
  /// LATEST - Start reading just after the most recent record in the shard, so
  /// that you always read the most recent data in the shard.
  /// </li>
  /// </ul>
  ///
  /// Parameter [streamName] :
  /// The name of the Amazon Kinesis data stream.
  ///
  /// Parameter [startingSequenceNumber] :
  /// The sequence number of the data record in the shard from which to start
  /// reading. Used with shard iterator type AT_SEQUENCE_NUMBER and
  /// AFTER_SEQUENCE_NUMBER.
  ///
  /// Parameter [timestamp] :
  /// The time stamp of the data record from which to start reading. Used with
  /// shard iterator type AT_TIMESTAMP. A time stamp is the Unix epoch date with
  /// precision in milliseconds. For example,
  /// <code>2016-04-04T19:58:46.480-00:00</code> or <code>1459799926.480</code>.
  /// If a record with this exact time stamp does not exist, the iterator
  /// returned is for the next (later) record. If the time stamp is older than
  /// the current trim horizon, the iterator returned is for the oldest
  /// untrimmed data record (TRIM_HORIZON).
  Future<GetShardIteratorOutput> getShardIterator({
    required String shardId,
    required ShardIteratorType shardIteratorType,
    required String streamName,
    String? startingSequenceNumber,
    DateTime? timestamp,
  }) async {
    ArgumentError.checkNotNull(shardId, 'shardId');
    _s.validateStringLength(
      'shardId',
      shardId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(shardIteratorType, 'shardIteratorType');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.GetShardIterator'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ShardId': shardId,
        'ShardIteratorType': shardIteratorType.toValue(),
        'StreamName': streamName,
        if (startingSequenceNumber != null)
          'StartingSequenceNumber': startingSequenceNumber,
        if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
      },
    );

    return GetShardIteratorOutput.fromJson(jsonResponse.body);
  }

  /// Increases the Kinesis data stream's retention period, which is the length
  /// of time data records are accessible after they are added to the stream.
  /// The maximum value of a stream's retention period is 168 hours (7 days).
  ///
  /// If you choose a longer stream retention period, this operation increases
  /// the time period during which records that have not yet expired are
  /// accessible. However, it does not make previous, expired data (older than
  /// the stream's previous retention period) accessible after the operation has
  /// been called. For example, if a stream's retention period is set to 24
  /// hours and is increased to 168 hours, any data that is older than 24 hours
  /// remains inaccessible to consumer applications.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [retentionPeriodHours] :
  /// The new retention period of the stream, in hours. Must be more than the
  /// current retention period.
  ///
  /// Parameter [streamName] :
  /// The name of the stream to modify.
  Future<void> increaseStreamRetentionPeriod({
    required int retentionPeriodHours,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(retentionPeriodHours, 'retentionPeriodHours');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.IncreaseStreamRetentionPeriod'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RetentionPeriodHours': retentionPeriodHours,
        'StreamName': streamName,
      },
    );
  }

  /// Lists the shards in a stream and provides information about each shard.
  /// This operation has a limit of 100 transactions per second per data stream.
  /// <important>
  /// This API is a new operation that is used by the Amazon Kinesis Client
  /// Library (KCL). If you have a fine-grained IAM policy that only allows
  /// specific operations, you must update your policy to allow calls to this
  /// API. For more information, see <a
  /// href="https://docs.aws.amazon.com/streams/latest/dev/controlling-access.html">Controlling
  /// Access to Amazon Kinesis Data Streams Resources Using IAM</a>.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ExpiredNextTokenException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [exclusiveStartShardId] :
  /// Specify this parameter to indicate that you want to list the shards
  /// starting with the shard whose ID immediately follows
  /// <code>ExclusiveStartShardId</code>.
  ///
  /// If you don't specify this parameter, the default behavior is for
  /// <code>ListShards</code> to list the shards starting with the first one in
  /// the stream.
  ///
  /// You cannot specify this parameter if you specify <code>NextToken</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of shards to return in a single call to
  /// <code>ListShards</code>. The minimum value you can specify for this
  /// parameter is 1, and the maximum is 10,000, which is also the default.
  ///
  /// When the number of shards to be listed is greater than the value of
  /// <code>MaxResults</code>, the response contains a <code>NextToken</code>
  /// value that you can use in a subsequent call to <code>ListShards</code> to
  /// list the next set of shards.
  ///
  /// Parameter [nextToken] :
  /// When the number of shards in the data stream is greater than the default
  /// value for the <code>MaxResults</code> parameter, or if you explicitly
  /// specify a value for <code>MaxResults</code> that is less than the number
  /// of shards in the data stream, the response includes a pagination token
  /// named <code>NextToken</code>. You can specify this <code>NextToken</code>
  /// value in a subsequent call to <code>ListShards</code> to list the next set
  /// of shards.
  ///
  /// Don't specify <code>StreamName</code> or
  /// <code>StreamCreationTimestamp</code> if you specify <code>NextToken</code>
  /// because the latter unambiguously identifies the stream.
  ///
  /// You can optionally specify a value for the <code>MaxResults</code>
  /// parameter when you specify <code>NextToken</code>. If you specify a
  /// <code>MaxResults</code> value that is less than the number of shards that
  /// the operation returns if you don't specify <code>MaxResults</code>, the
  /// response will contain a new <code>NextToken</code> value. You can use the
  /// new <code>NextToken</code> value in a subsequent call to the
  /// <code>ListShards</code> operation.
  /// <important>
  /// Tokens expire after 300 seconds. When you obtain a value for
  /// <code>NextToken</code> in the response to a call to
  /// <code>ListShards</code>, you have 300 seconds to use that value. If you
  /// specify an expired token in a call to <code>ListShards</code>, you get
  /// <code>ExpiredNextTokenException</code>.
  /// </important>
  ///
  /// Parameter [streamCreationTimestamp] :
  /// Specify this input parameter to distinguish data streams that have the
  /// same name. For example, if you create a data stream and then delete it,
  /// and you later create another data stream with the same name, you can use
  /// this input parameter to specify which of the two streams you want to list
  /// the shards for.
  ///
  /// You cannot specify this parameter if you specify the
  /// <code>NextToken</code> parameter.
  ///
  /// Parameter [streamName] :
  /// The name of the data stream whose shards you want to list.
  ///
  /// You cannot specify this parameter if you specify the
  /// <code>NextToken</code> parameter.
  Future<ListShardsOutput> listShards({
    String? exclusiveStartShardId,
    int? maxResults,
    String? nextToken,
    ShardFilter? shardFilter,
    DateTime? streamCreationTimestamp,
    String? streamName,
  }) async {
    _s.validateStringLength(
      'exclusiveStartShardId',
      exclusiveStartShardId,
      1,
      128,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1048576,
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.ListShards'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exclusiveStartShardId != null)
          'ExclusiveStartShardId': exclusiveStartShardId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (shardFilter != null) 'ShardFilter': shardFilter,
        if (streamCreationTimestamp != null)
          'StreamCreationTimestamp':
              unixTimestampToJson(streamCreationTimestamp),
        if (streamName != null) 'StreamName': streamName,
      },
    );

    return ListShardsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the consumers registered to receive data from a stream using
  /// enhanced fan-out, and provides information about each consumer.
  ///
  /// This operation has a limit of 5 transactions per second per stream.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ExpiredNextTokenException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [streamARN] :
  /// The ARN of the Kinesis data stream for which you want to list the
  /// registered consumers. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of consumers that you want a single call of
  /// <code>ListStreamConsumers</code> to return.
  ///
  /// Parameter [nextToken] :
  /// When the number of consumers that are registered with the data stream is
  /// greater than the default value for the <code>MaxResults</code> parameter,
  /// or if you explicitly specify a value for <code>MaxResults</code> that is
  /// less than the number of consumers that are registered with the data
  /// stream, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value
  /// in a subsequent call to <code>ListStreamConsumers</code> to list the next
  /// set of registered consumers.
  ///
  /// Don't specify <code>StreamName</code> or
  /// <code>StreamCreationTimestamp</code> if you specify <code>NextToken</code>
  /// because the latter unambiguously identifies the stream.
  ///
  /// You can optionally specify a value for the <code>MaxResults</code>
  /// parameter when you specify <code>NextToken</code>. If you specify a
  /// <code>MaxResults</code> value that is less than the number of consumers
  /// that the operation returns if you don't specify <code>MaxResults</code>,
  /// the response will contain a new <code>NextToken</code> value. You can use
  /// the new <code>NextToken</code> value in a subsequent call to the
  /// <code>ListStreamConsumers</code> operation to list the next set of
  /// consumers.
  /// <important>
  /// Tokens expire after 300 seconds. When you obtain a value for
  /// <code>NextToken</code> in the response to a call to
  /// <code>ListStreamConsumers</code>, you have 300 seconds to use that value.
  /// If you specify an expired token in a call to
  /// <code>ListStreamConsumers</code>, you get
  /// <code>ExpiredNextTokenException</code>.
  /// </important>
  ///
  /// Parameter [streamCreationTimestamp] :
  /// Specify this input parameter to distinguish data streams that have the
  /// same name. For example, if you create a data stream and then delete it,
  /// and you later create another data stream with the same name, you can use
  /// this input parameter to specify which of the two streams you want to list
  /// the consumers for.
  ///
  /// You can't specify this parameter if you specify the NextToken parameter.
  Future<ListStreamConsumersOutput> listStreamConsumers({
    required String streamARN,
    int? maxResults,
    String? nextToken,
    DateTime? streamCreationTimestamp,
  }) async {
    ArgumentError.checkNotNull(streamARN, 'streamARN');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      2048,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1048576,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.ListStreamConsumers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamARN': streamARN,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (streamCreationTimestamp != null)
          'StreamCreationTimestamp':
              unixTimestampToJson(streamCreationTimestamp),
      },
    );

    return ListStreamConsumersOutput.fromJson(jsonResponse.body);
  }

  /// Lists your Kinesis data streams.
  ///
  /// The number of streams may be too large to return from a single call to
  /// <code>ListStreams</code>. You can limit the number of returned streams
  /// using the <code>Limit</code> parameter. If you do not specify a value for
  /// the <code>Limit</code> parameter, Kinesis Data Streams uses the default
  /// limit, which is currently 10.
  ///
  /// You can detect if there are more streams available to list by using the
  /// <code>HasMoreStreams</code> flag from the returned output. If there are
  /// more streams available, you can request more streams by using the name of
  /// the last stream returned by the <code>ListStreams</code> request in the
  /// <code>ExclusiveStartStreamName</code> parameter in a subsequent request to
  /// <code>ListStreams</code>. The group of stream names returned by the
  /// subsequent request is then added to the list. You can continue this
  /// process until all the stream names have been collected in the list.
  ///
  /// <a>ListStreams</a> has a limit of five transactions per second per
  /// account.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [exclusiveStartStreamName] :
  /// The name of the stream to start the list with.
  ///
  /// Parameter [limit] :
  /// The maximum number of streams to list.
  Future<ListStreamsOutput> listStreams({
    String? exclusiveStartStreamName,
    int? limit,
  }) async {
    _s.validateStringLength(
      'exclusiveStartStreamName',
      exclusiveStartStreamName,
      1,
      128,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.ListStreams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (exclusiveStartStreamName != null)
          'ExclusiveStartStreamName': exclusiveStartStreamName,
        if (limit != null) 'Limit': limit,
      },
    );

    return ListStreamsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags for the specified Kinesis data stream. This operation has a
  /// limit of five transactions per second per account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [streamName] :
  /// The name of the stream.
  ///
  /// Parameter [exclusiveStartTagKey] :
  /// The key to use as the starting point for the list of tags. If this
  /// parameter is set, <code>ListTagsForStream</code> gets all tags that occur
  /// after <code>ExclusiveStartTagKey</code>.
  ///
  /// Parameter [limit] :
  /// The number of tags to return. If this number is less than the total number
  /// of tags associated with the stream, <code>HasMoreTags</code> is set to
  /// <code>true</code>. To list additional tags, set
  /// <code>ExclusiveStartTagKey</code> to the last key in the response.
  Future<ListTagsForStreamOutput> listTagsForStream({
    required String streamName,
    String? exclusiveStartTagKey,
    int? limit,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'exclusiveStartTagKey',
      exclusiveStartTagKey,
      1,
      128,
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.ListTagsForStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamName': streamName,
        if (exclusiveStartTagKey != null)
          'ExclusiveStartTagKey': exclusiveStartTagKey,
        if (limit != null) 'Limit': limit,
      },
    );

    return ListTagsForStreamOutput.fromJson(jsonResponse.body);
  }

  /// Merges two adjacent shards in a Kinesis data stream and combines them into
  /// a single shard to reduce the stream's capacity to ingest and transport
  /// data. Two shards are considered adjacent if the union of the hash key
  /// ranges for the two shards form a contiguous set with no gaps. For example,
  /// if you have two shards, one with a hash key range of 276...381 and the
  /// other with a hash key range of 382...454, then you could merge these two
  /// shards into a single shard that would have a hash key range of 276...454.
  /// After the merge, the single child shard receives data for all hash key
  /// values covered by the two parent shards.
  ///
  /// <code>MergeShards</code> is called when there is a need to reduce the
  /// overall capacity of a stream because of excess capacity that is not being
  /// used. You must specify the shard to be merged and the adjacent shard for a
  /// stream. For more information about merging shards, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-merge.html">Merge
  /// Two Shards</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.
  ///
  /// If the stream is in the <code>ACTIVE</code> state, you can call
  /// <code>MergeShards</code>. If a stream is in the <code>CREATING</code>,
  /// <code>UPDATING</code>, or <code>DELETING</code> state,
  /// <code>MergeShards</code> returns a <code>ResourceInUseException</code>. If
  /// the specified stream does not exist, <code>MergeShards</code> returns a
  /// <code>ResourceNotFoundException</code>.
  ///
  /// You can use <a>DescribeStream</a> to check the state of the stream, which
  /// is returned in <code>StreamStatus</code>.
  ///
  /// <code>MergeShards</code> is an asynchronous operation. Upon receiving a
  /// <code>MergeShards</code> request, Amazon Kinesis Data Streams immediately
  /// returns a response and sets the <code>StreamStatus</code> to
  /// <code>UPDATING</code>. After the operation is completed, Kinesis Data
  /// Streams sets the <code>StreamStatus</code> to <code>ACTIVE</code>. Read
  /// and write operations continue to work while the stream is in the
  /// <code>UPDATING</code> state.
  ///
  /// You use <a>DescribeStream</a> to determine the shard IDs that are
  /// specified in the <code>MergeShards</code> request.
  ///
  /// If you try to operate on too many streams in parallel using
  /// <a>CreateStream</a>, <a>DeleteStream</a>, <code>MergeShards</code>, or
  /// <a>SplitShard</a>, you receive a <code>LimitExceededException</code>.
  ///
  /// <code>MergeShards</code> has a limit of five transactions per second per
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [adjacentShardToMerge] :
  /// The shard ID of the adjacent shard for the merge.
  ///
  /// Parameter [shardToMerge] :
  /// The shard ID of the shard to combine with the adjacent shard for the
  /// merge.
  ///
  /// Parameter [streamName] :
  /// The name of the stream for the merge.
  Future<void> mergeShards({
    required String adjacentShardToMerge,
    required String shardToMerge,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(adjacentShardToMerge, 'adjacentShardToMerge');
    _s.validateStringLength(
      'adjacentShardToMerge',
      adjacentShardToMerge,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(shardToMerge, 'shardToMerge');
    _s.validateStringLength(
      'shardToMerge',
      shardToMerge,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.MergeShards'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AdjacentShardToMerge': adjacentShardToMerge,
        'ShardToMerge': shardToMerge,
        'StreamName': streamName,
      },
    );
  }

  /// Writes a single data record into an Amazon Kinesis data stream. Call
  /// <code>PutRecord</code> to send data into the stream for real-time
  /// ingestion and subsequent processing, one record at a time. Each shard can
  /// support writes up to 1,000 records per second, up to a maximum data write
  /// total of 1 MiB per second.
  ///
  /// You must specify the name of the stream that captures, stores, and
  /// transports the data; a partition key; and the data blob itself.
  ///
  /// The data blob can be any type of data; for example, a segment from a log
  /// file, geographic/location data, website clickstream data, and so on.
  ///
  /// The partition key is used by Kinesis Data Streams to distribute data
  /// across shards. Kinesis Data Streams segregates the data records that
  /// belong to a stream into multiple shards, using the partition key
  /// associated with each data record to determine the shard to which a given
  /// data record belongs.
  ///
  /// Partition keys are Unicode strings, with a maximum length limit of 256
  /// characters for each key. An MD5 hash function is used to map partition
  /// keys to 128-bit integer values and to map associated data records to
  /// shards using the hash key ranges of the shards. You can override hashing
  /// the partition key to determine the shard by explicitly specifying a hash
  /// value using the <code>ExplicitHashKey</code> parameter. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream">Adding
  /// Data to a Stream</a> in the <i>Amazon Kinesis Data Streams Developer
  /// Guide</i>.
  ///
  /// <code>PutRecord</code> returns the shard ID of where the data record was
  /// placed and the sequence number that was assigned to the data record.
  ///
  /// Sequence numbers increase over time and are specific to a shard within a
  /// stream, not across all shards within a stream. To guarantee strictly
  /// increasing ordering, write serially to a shard and use the
  /// <code>SequenceNumberForOrdering</code> parameter. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream">Adding
  /// Data to a Stream</a> in the <i>Amazon Kinesis Data Streams Developer
  /// Guide</i>.
  /// <important>
  /// After you write a record to a stream, you cannot modify that record or its
  /// order within the stream.
  /// </important>
  /// If a <code>PutRecord</code> request cannot be processed because of
  /// insufficient provisioned throughput on the shard involved in the request,
  /// <code>PutRecord</code> throws
  /// <code>ProvisionedThroughputExceededException</code>.
  ///
  /// By default, data records are accessible for 24 hours from the time that
  /// they are added to a stream. You can use
  /// <a>IncreaseStreamRetentionPeriod</a> or
  /// <a>DecreaseStreamRetentionPeriod</a> to modify this retention period.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [KMSNotFoundException].
  /// May throw [KMSOptInRequired].
  /// May throw [KMSThrottlingException].
  ///
  /// Parameter [data] :
  /// The data blob to put into the record, which is base64-encoded when the
  /// blob is serialized. When the data blob (the payload before
  /// base64-encoding) is added to the partition key size, the total size must
  /// not exceed the maximum record size (1 MiB).
  ///
  /// Parameter [partitionKey] :
  /// Determines which shard in the stream the data record is assigned to.
  /// Partition keys are Unicode strings with a maximum length limit of 256
  /// characters for each key. Amazon Kinesis Data Streams uses the partition
  /// key as input to a hash function that maps the partition key and associated
  /// data to a specific shard. Specifically, an MD5 hash function is used to
  /// map partition keys to 128-bit integer values and to map associated data
  /// records to shards. As a result of this hashing mechanism, all data records
  /// with the same partition key map to the same shard within the stream.
  ///
  /// Parameter [streamName] :
  /// The name of the stream to put the data record into.
  ///
  /// Parameter [explicitHashKey] :
  /// The hash value used to explicitly determine the shard the data record is
  /// assigned to by overriding the partition key hash.
  ///
  /// Parameter [sequenceNumberForOrdering] :
  /// Guarantees strictly increasing sequence numbers, for puts from the same
  /// client and to the same partition key. Usage: set the
  /// <code>SequenceNumberForOrdering</code> of record <i>n</i> to the sequence
  /// number of record <i>n-1</i> (as returned in the result when putting record
  /// <i>n-1</i>). If this parameter is not set, records are coarsely ordered
  /// based on arrival time.
  Future<PutRecordOutput> putRecord({
    required Uint8List data,
    required String partitionKey,
    required String streamName,
    String? explicitHashKey,
    String? sequenceNumberForOrdering,
  }) async {
    ArgumentError.checkNotNull(data, 'data');
    ArgumentError.checkNotNull(partitionKey, 'partitionKey');
    _s.validateStringLength(
      'partitionKey',
      partitionKey,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.PutRecord'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Data': base64Encode(data),
        'PartitionKey': partitionKey,
        'StreamName': streamName,
        if (explicitHashKey != null) 'ExplicitHashKey': explicitHashKey,
        if (sequenceNumberForOrdering != null)
          'SequenceNumberForOrdering': sequenceNumberForOrdering,
      },
    );

    return PutRecordOutput.fromJson(jsonResponse.body);
  }

  /// Writes multiple data records into a Kinesis data stream in a single call
  /// (also referred to as a <code>PutRecords</code> request). Use this
  /// operation to send data into the stream for data ingestion and processing.
  ///
  /// Each <code>PutRecords</code> request can support up to 500 records. Each
  /// record in the request can be as large as 1 MiB, up to a limit of 5 MiB for
  /// the entire request, including partition keys. Each shard can support
  /// writes up to 1,000 records per second, up to a maximum data write total of
  /// 1 MiB per second.
  ///
  /// You must specify the name of the stream that captures, stores, and
  /// transports the data; and an array of request <code>Records</code>, with
  /// each record in the array requiring a partition key and data blob. The
  /// record size limit applies to the total size of the partition key and data
  /// blob.
  ///
  /// The data blob can be any type of data; for example, a segment from a log
  /// file, geographic/location data, website clickstream data, and so on.
  ///
  /// The partition key is used by Kinesis Data Streams as input to a hash
  /// function that maps the partition key and associated data to a specific
  /// shard. An MD5 hash function is used to map partition keys to 128-bit
  /// integer values and to map associated data records to shards. As a result
  /// of this hashing mechanism, all data records with the same partition key
  /// map to the same shard within the stream. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-add-data-to-stream">Adding
  /// Data to a Stream</a> in the <i>Amazon Kinesis Data Streams Developer
  /// Guide</i>.
  ///
  /// Each record in the <code>Records</code> array may include an optional
  /// parameter, <code>ExplicitHashKey</code>, which overrides the partition key
  /// to shard mapping. This parameter allows a data producer to determine
  /// explicitly the shard where the record is stored. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/developing-producers-with-sdk.html#kinesis-using-sdk-java-putrecords">Adding
  /// Multiple Records with PutRecords</a> in the <i>Amazon Kinesis Data Streams
  /// Developer Guide</i>.
  ///
  /// The <code>PutRecords</code> response includes an array of response
  /// <code>Records</code>. Each record in the response array directly
  /// correlates with a record in the request array using natural ordering, from
  /// the top to the bottom of the request and response. The response
  /// <code>Records</code> array always includes the same number of records as
  /// the request array.
  ///
  /// The response <code>Records</code> array includes both successfully and
  /// unsuccessfully processed records. Kinesis Data Streams attempts to process
  /// all records in each <code>PutRecords</code> request. A single record
  /// failure does not stop the processing of subsequent records. As a result,
  /// PutRecords doesn't guarantee the ordering of records. If you need to read
  /// records in the same order they are written to the stream, use
  /// <a>PutRecord</a> instead of <code>PutRecords</code>, and write to the same
  /// shard.
  ///
  /// A successfully processed record includes <code>ShardId</code> and
  /// <code>SequenceNumber</code> values. The <code>ShardId</code> parameter
  /// identifies the shard in the stream where the record is stored. The
  /// <code>SequenceNumber</code> parameter is an identifier assigned to the put
  /// record, unique to all records in the stream.
  ///
  /// An unsuccessfully processed record includes <code>ErrorCode</code> and
  /// <code>ErrorMessage</code> values. <code>ErrorCode</code> reflects the type
  /// of error and can be one of the following values:
  /// <code>ProvisionedThroughputExceededException</code> or
  /// <code>InternalFailure</code>. <code>ErrorMessage</code> provides more
  /// detailed information about the
  /// <code>ProvisionedThroughputExceededException</code> exception including
  /// the account ID, stream name, and shard ID of the record that was
  /// throttled. For more information about partially successful responses, see
  /// <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-add-data-to-stream.html#kinesis-using-sdk-java-putrecords">Adding
  /// Multiple Records with PutRecords</a> in the <i>Amazon Kinesis Data Streams
  /// Developer Guide</i>.
  /// <important>
  /// After you write a record to a stream, you cannot modify that record or its
  /// order within the stream.
  /// </important>
  /// By default, data records are accessible for 24 hours from the time that
  /// they are added to a stream. You can use
  /// <a>IncreaseStreamRetentionPeriod</a> or
  /// <a>DecreaseStreamRetentionPeriod</a> to modify this retention period.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ProvisionedThroughputExceededException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [KMSNotFoundException].
  /// May throw [KMSOptInRequired].
  /// May throw [KMSThrottlingException].
  ///
  /// Parameter [records] :
  /// The records associated with the request.
  ///
  /// Parameter [streamName] :
  /// The stream name associated with the request.
  Future<PutRecordsOutput> putRecords({
    required List<PutRecordsRequestEntry> records,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(records, 'records');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.PutRecords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Records': records,
        'StreamName': streamName,
      },
    );

    return PutRecordsOutput.fromJson(jsonResponse.body);
  }

  /// Registers a consumer with a Kinesis data stream. When you use this
  /// operation, the consumer you register can then call <a>SubscribeToShard</a>
  /// to receive data from the stream using enhanced fan-out, at a rate of up to
  /// 2 MiB per second for every shard you subscribe to. This rate is unaffected
  /// by the total number of consumers that read from the same stream.
  ///
  /// You can register up to 20 consumers per stream. A given consumer can only
  /// be registered with one stream at a time.
  ///
  /// For an example of how to use this operations, see <a
  /// href="/streams/latest/dev/building-enhanced-consumers-api.html">Enhanced
  /// Fan-Out Using the Kinesis Data Streams API</a>.
  ///
  /// The use of this operation has a limit of five transactions per second per
  /// account. Also, only 5 consumers can be created simultaneously. In other
  /// words, you cannot have more than 5 consumers in a <code>CREATING</code>
  /// status at the same time. Registering a 6th consumer while there are 5 in a
  /// <code>CREATING</code> status results in a
  /// <code>LimitExceededException</code>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [consumerName] :
  /// For a given Kinesis data stream, each consumer must have a unique name.
  /// However, consumer names don't have to be unique across data streams.
  ///
  /// Parameter [streamARN] :
  /// The ARN of the Kinesis data stream that you want to register the consumer
  /// with. For more info, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  Future<RegisterStreamConsumerOutput> registerStreamConsumer({
    required String consumerName,
    required String streamARN,
  }) async {
    ArgumentError.checkNotNull(consumerName, 'consumerName');
    _s.validateStringLength(
      'consumerName',
      consumerName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamARN, 'streamARN');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      2048,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.RegisterStreamConsumer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConsumerName': consumerName,
        'StreamARN': streamARN,
      },
    );

    return RegisterStreamConsumerOutput.fromJson(jsonResponse.body);
  }

  /// Removes tags from the specified Kinesis data stream. Removed tags are
  /// deleted and cannot be recovered after this operation successfully
  /// completes.
  ///
  /// If you specify a tag that does not exist, it is ignored.
  ///
  /// <a>RemoveTagsFromStream</a> has a limit of five transactions per second
  /// per account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [streamName] :
  /// The name of the stream.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Each corresponding tag is removed from the stream.
  Future<void> removeTagsFromStream({
    required String streamName,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.RemoveTagsFromStream'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'StreamName': streamName,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Splits a shard into two new shards in the Kinesis data stream, to increase
  /// the stream's capacity to ingest and transport data.
  /// <code>SplitShard</code> is called when there is a need to increase the
  /// overall capacity of a stream because of an expected increase in the volume
  /// of data records being ingested.
  ///
  /// You can also use <code>SplitShard</code> when a shard appears to be
  /// approaching its maximum utilization; for example, the producers sending
  /// data into the specific shard are suddenly sending more than previously
  /// anticipated. You can also call <code>SplitShard</code> to increase stream
  /// capacity, so that more Kinesis Data Streams applications can
  /// simultaneously read data from the stream for real-time processing.
  ///
  /// You must specify the shard to be split and the new hash key, which is the
  /// position in the shard where the shard gets split in two. In many cases,
  /// the new hash key might be the average of the beginning and ending hash
  /// key, but it can be any hash key value in the range being mapped into the
  /// shard. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/kinesis-using-sdk-java-resharding-split.html">Split
  /// a Shard</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>.
  ///
  /// You can use <a>DescribeStream</a> to determine the shard ID and hash key
  /// values for the <code>ShardToSplit</code> and
  /// <code>NewStartingHashKey</code> parameters that are specified in the
  /// <code>SplitShard</code> request.
  ///
  /// <code>SplitShard</code> is an asynchronous operation. Upon receiving a
  /// <code>SplitShard</code> request, Kinesis Data Streams immediately returns
  /// a response and sets the stream status to <code>UPDATING</code>. After the
  /// operation is completed, Kinesis Data Streams sets the stream status to
  /// <code>ACTIVE</code>. Read and write operations continue to work while the
  /// stream is in the <code>UPDATING</code> state.
  ///
  /// You can use <code>DescribeStream</code> to check the status of the stream,
  /// which is returned in <code>StreamStatus</code>. If the stream is in the
  /// <code>ACTIVE</code> state, you can call <code>SplitShard</code>. If a
  /// stream is in <code>CREATING</code> or <code>UPDATING</code> or
  /// <code>DELETING</code> states, <code>DescribeStream</code> returns a
  /// <code>ResourceInUseException</code>.
  ///
  /// If the specified stream does not exist, <code>DescribeStream</code>
  /// returns a <code>ResourceNotFoundException</code>. If you try to create
  /// more shards than are authorized for your account, you receive a
  /// <code>LimitExceededException</code>.
  ///
  /// For the default shard limit for an AWS account, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Kinesis
  /// Data Streams Limits</a> in the <i>Amazon Kinesis Data Streams Developer
  /// Guide</i>. To increase this limit, <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html">contact
  /// AWS Support</a>.
  ///
  /// If you try to operate on too many streams simultaneously using
  /// <a>CreateStream</a>, <a>DeleteStream</a>, <a>MergeShards</a>, and/or
  /// <a>SplitShard</a>, you receive a <code>LimitExceededException</code>.
  ///
  /// <code>SplitShard</code> has a limit of five transactions per second per
  /// account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [newStartingHashKey] :
  /// A hash key value for the starting hash key of one of the child shards
  /// created by the split. The hash key range for a given shard constitutes a
  /// set of ordered contiguous positive integers. The value for
  /// <code>NewStartingHashKey</code> must be in the range of hash keys being
  /// mapped into the shard. The <code>NewStartingHashKey</code> hash key value
  /// and all higher hash key values in hash key range are distributed to one of
  /// the child shards. All the lower hash key values in the range are
  /// distributed to the other child shard.
  ///
  /// Parameter [shardToSplit] :
  /// The shard ID of the shard to split.
  ///
  /// Parameter [streamName] :
  /// The name of the stream for the shard split.
  Future<void> splitShard({
    required String newStartingHashKey,
    required String shardToSplit,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(newStartingHashKey, 'newStartingHashKey');
    ArgumentError.checkNotNull(shardToSplit, 'shardToSplit');
    _s.validateStringLength(
      'shardToSplit',
      shardToSplit,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.SplitShard'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NewStartingHashKey': newStartingHashKey,
        'ShardToSplit': shardToSplit,
        'StreamName': streamName,
      },
    );
  }

  /// Enables or updates server-side encryption using an AWS KMS key for a
  /// specified stream.
  ///
  /// Starting encryption is an asynchronous operation. Upon receiving the
  /// request, Kinesis Data Streams returns immediately and sets the status of
  /// the stream to <code>UPDATING</code>. After the update is complete, Kinesis
  /// Data Streams sets the status of the stream back to <code>ACTIVE</code>.
  /// Updating or applying encryption normally takes a few seconds to complete,
  /// but it can take minutes. You can continue to read and write data to your
  /// stream while its status is <code>UPDATING</code>. Once the status of the
  /// stream is <code>ACTIVE</code>, encryption begins for records written to
  /// the stream.
  ///
  /// API Limits: You can successfully apply a new AWS KMS key for server-side
  /// encryption 25 times in a rolling 24-hour period.
  ///
  /// Note: It can take up to 5 seconds after the stream is in an
  /// <code>ACTIVE</code> status before all records written to the stream are
  /// encrypted. After you enable encryption, you can verify that encryption is
  /// applied by inspecting the API response from <code>PutRecord</code> or
  /// <code>PutRecords</code>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [KMSNotFoundException].
  /// May throw [KMSOptInRequired].
  /// May throw [KMSThrottlingException].
  ///
  /// Parameter [encryptionType] :
  /// The encryption type to use. The only valid value is <code>KMS</code>.
  ///
  /// Parameter [keyId] :
  /// The GUID for the customer-managed AWS KMS key to use for encryption. This
  /// value can be a globally unique identifier, a fully specified Amazon
  /// Resource Name (ARN) to either an alias or a key, or an alias name prefixed
  /// by "alias/".You can also use a master key owned by Kinesis Data Streams by
  /// specifying the alias <code>aws/kinesis</code>.
  ///
  /// <ul>
  /// <li>
  /// Key ARN example:
  /// <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias ARN example:
  /// <code>arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Globally unique key ID example:
  /// <code>12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias name example: <code>alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [streamName] :
  /// The name of the stream for which to start encrypting records.
  Future<void> startStreamEncryption({
    required EncryptionType encryptionType,
    required String keyId,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(encryptionType, 'encryptionType');
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.StartStreamEncryption'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EncryptionType': encryptionType.toValue(),
        'KeyId': keyId,
        'StreamName': streamName,
      },
    );
  }

  /// Disables server-side encryption for a specified stream.
  ///
  /// Stopping encryption is an asynchronous operation. Upon receiving the
  /// request, Kinesis Data Streams returns immediately and sets the status of
  /// the stream to <code>UPDATING</code>. After the update is complete, Kinesis
  /// Data Streams sets the status of the stream back to <code>ACTIVE</code>.
  /// Stopping encryption normally takes a few seconds to complete, but it can
  /// take minutes. You can continue to read and write data to your stream while
  /// its status is <code>UPDATING</code>. Once the status of the stream is
  /// <code>ACTIVE</code>, records written to the stream are no longer encrypted
  /// by Kinesis Data Streams.
  ///
  /// API Limits: You can successfully disable server-side encryption 25 times
  /// in a rolling 24-hour period.
  ///
  /// Note: It can take up to 5 seconds after the stream is in an
  /// <code>ACTIVE</code> status before all records written to the stream are no
  /// longer subject to encryption. After you disabled encryption, you can
  /// verify that encryption is not applied by inspecting the API response from
  /// <code>PutRecord</code> or <code>PutRecords</code>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [encryptionType] :
  /// The encryption type. The only valid value is <code>KMS</code>.
  ///
  /// Parameter [keyId] :
  /// The GUID for the customer-managed AWS KMS key to use for encryption. This
  /// value can be a globally unique identifier, a fully specified Amazon
  /// Resource Name (ARN) to either an alias or a key, or an alias name prefixed
  /// by "alias/".You can also use a master key owned by Kinesis Data Streams by
  /// specifying the alias <code>aws/kinesis</code>.
  ///
  /// <ul>
  /// <li>
  /// Key ARN example:
  /// <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias ARN example:
  /// <code>arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Globally unique key ID example:
  /// <code>12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias name example: <code>alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [streamName] :
  /// The name of the stream on which to stop encrypting records.
  Future<void> stopStreamEncryption({
    required EncryptionType encryptionType,
    required String keyId,
    required String streamName,
  }) async {
    ArgumentError.checkNotNull(encryptionType, 'encryptionType');
    ArgumentError.checkNotNull(keyId, 'keyId');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.StopStreamEncryption'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EncryptionType': encryptionType.toValue(),
        'KeyId': keyId,
        'StreamName': streamName,
      },
    );
  }

  /// Updates the shard count of the specified stream to the specified number of
  /// shards.
  ///
  /// Updating the shard count is an asynchronous operation. Upon receiving the
  /// request, Kinesis Data Streams returns immediately and sets the status of
  /// the stream to <code>UPDATING</code>. After the update is complete, Kinesis
  /// Data Streams sets the status of the stream back to <code>ACTIVE</code>.
  /// Depending on the size of the stream, the scaling action could take a few
  /// minutes to complete. You can continue to read and write data to your
  /// stream while its status is <code>UPDATING</code>.
  ///
  /// To update the shard count, Kinesis Data Streams performs splits or merges
  /// on individual shards. This can cause short-lived shards to be created, in
  /// addition to the final shards. These short-lived shards count towards your
  /// total shard limit for your account in the Region.
  ///
  /// When using this operation, we recommend that you specify a target shard
  /// count that is a multiple of 25% (25%, 50%, 75%, 100%). You can specify any
  /// target value within your shard limit. However, if you specify a target
  /// that isn't a multiple of 25%, the scaling action might take longer to
  /// complete.
  ///
  /// This operation has the following default limits. By default, you cannot do
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// Scale more than ten times per rolling 24-hour period per stream
  /// </li>
  /// <li>
  /// Scale up to more than double your current shard count for a stream
  /// </li>
  /// <li>
  /// Scale down below half your current shard count for a stream
  /// </li>
  /// <li>
  /// Scale up to more than 500 shards in a stream
  /// </li>
  /// <li>
  /// Scale a stream with more than 500 shards down unless the result is less
  /// than 500 shards
  /// </li>
  /// <li>
  /// Scale up to more than the shard limit for your account
  /// </li>
  /// </ul>
  /// For the default limits for an AWS account, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html">Streams
  /// Limits</a> in the <i>Amazon Kinesis Data Streams Developer Guide</i>. To
  /// request an increase in the call rate limit, the shard limit for this API,
  /// or your overall shard limit, use the <a
  /// href="https://console.aws.amazon.com/support/v1#/case/create?issueType=service-limit-increase&amp;limitType=service-code-kinesis">limits
  /// form</a>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [scalingType] :
  /// The scaling type. Uniform scaling creates shards of equal size.
  ///
  /// Parameter [streamName] :
  /// The name of the stream.
  ///
  /// Parameter [targetShardCount] :
  /// The new number of shards. This value has the following default limits. By
  /// default, you cannot do the following:
  ///
  /// <ul>
  /// <li>
  /// Set this value to more than double your current shard count for a stream.
  /// </li>
  /// <li>
  /// Set this value below half your current shard count for a stream.
  /// </li>
  /// <li>
  /// Set this value to more than 500 shards in a stream (the default limit for
  /// shard count per stream is 500 per account per region), unless you request
  /// a limit increase.
  /// </li>
  /// <li>
  /// Scale a stream with more than 500 shards down unless you set this value to
  /// less than 500 shards.
  /// </li>
  /// </ul>
  Future<UpdateShardCountOutput> updateShardCount({
    required ScalingType scalingType,
    required String streamName,
    required int targetShardCount,
  }) async {
    ArgumentError.checkNotNull(scalingType, 'scalingType');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetShardCount, 'targetShardCount');
    _s.validateNumRange(
      'targetShardCount',
      targetShardCount,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Kinesis_20131202.UpdateShardCount'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ScalingType': scalingType.toValue(),
        'StreamName': streamName,
        'TargetShardCount': targetShardCount,
      },
    );

    return UpdateShardCountOutput.fromJson(jsonResponse.body);
  }
}

class ChildShard {
  final HashKeyRange hashKeyRange;
  final List<String> parentShards;
  final String shardId;

  ChildShard({
    required this.hashKeyRange,
    required this.parentShards,
    required this.shardId,
  });

  factory ChildShard.fromJson(Map<String, dynamic> json) {
    return ChildShard(
      hashKeyRange:
          HashKeyRange.fromJson(json['HashKeyRange'] as Map<String, dynamic>),
      parentShards: (json['ParentShards'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      shardId: json['ShardId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final hashKeyRange = this.hashKeyRange;
    final parentShards = this.parentShards;
    final shardId = this.shardId;
    return {
      'HashKeyRange': hashKeyRange,
      'ParentShards': parentShards,
      'ShardId': shardId,
    };
  }
}

/// An object that represents the details of the consumer you registered. This
/// type of object is returned by <a>RegisterStreamConsumer</a>.
class Consumer {
  /// When you register a consumer, Kinesis Data Streams generates an ARN for it.
  /// You need this ARN to be able to call <a>SubscribeToShard</a>.
  ///
  /// If you delete a consumer and then create a new one with the same name, it
  /// won't have the same ARN. That's because consumer ARNs contain the creation
  /// timestamp. This is important to keep in mind if you have IAM policies that
  /// reference consumer ARNs.
  final String consumerARN;

  /// <p/>
  final DateTime consumerCreationTimestamp;

  /// The name of the consumer is something you choose when you register the
  /// consumer.
  final String consumerName;

  /// A consumer can't read data while in the <code>CREATING</code> or
  /// <code>DELETING</code> states.
  final ConsumerStatus consumerStatus;

  Consumer({
    required this.consumerARN,
    required this.consumerCreationTimestamp,
    required this.consumerName,
    required this.consumerStatus,
  });

  factory Consumer.fromJson(Map<String, dynamic> json) {
    return Consumer(
      consumerARN: json['ConsumerARN'] as String,
      consumerCreationTimestamp: nonNullableTimeStampFromJson(
          json['ConsumerCreationTimestamp'] as Object),
      consumerName: json['ConsumerName'] as String,
      consumerStatus: (json['ConsumerStatus'] as String).toConsumerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final consumerARN = this.consumerARN;
    final consumerCreationTimestamp = this.consumerCreationTimestamp;
    final consumerName = this.consumerName;
    final consumerStatus = this.consumerStatus;
    return {
      'ConsumerARN': consumerARN,
      'ConsumerCreationTimestamp':
          unixTimestampToJson(consumerCreationTimestamp),
      'ConsumerName': consumerName,
      'ConsumerStatus': consumerStatus.toValue(),
    };
  }
}

/// An object that represents the details of a registered consumer. This type of
/// object is returned by <a>DescribeStreamConsumer</a>.
class ConsumerDescription {
  /// When you register a consumer, Kinesis Data Streams generates an ARN for it.
  /// You need this ARN to be able to call <a>SubscribeToShard</a>.
  ///
  /// If you delete a consumer and then create a new one with the same name, it
  /// won't have the same ARN. That's because consumer ARNs contain the creation
  /// timestamp. This is important to keep in mind if you have IAM policies that
  /// reference consumer ARNs.
  final String consumerARN;

  /// <p/>
  final DateTime consumerCreationTimestamp;

  /// The name of the consumer is something you choose when you register the
  /// consumer.
  final String consumerName;

  /// A consumer can't read data while in the <code>CREATING</code> or
  /// <code>DELETING</code> states.
  final ConsumerStatus consumerStatus;

  /// The ARN of the stream with which you registered the consumer.
  final String streamARN;

  ConsumerDescription({
    required this.consumerARN,
    required this.consumerCreationTimestamp,
    required this.consumerName,
    required this.consumerStatus,
    required this.streamARN,
  });

  factory ConsumerDescription.fromJson(Map<String, dynamic> json) {
    return ConsumerDescription(
      consumerARN: json['ConsumerARN'] as String,
      consumerCreationTimestamp: nonNullableTimeStampFromJson(
          json['ConsumerCreationTimestamp'] as Object),
      consumerName: json['ConsumerName'] as String,
      consumerStatus: (json['ConsumerStatus'] as String).toConsumerStatus(),
      streamARN: json['StreamARN'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final consumerARN = this.consumerARN;
    final consumerCreationTimestamp = this.consumerCreationTimestamp;
    final consumerName = this.consumerName;
    final consumerStatus = this.consumerStatus;
    final streamARN = this.streamARN;
    return {
      'ConsumerARN': consumerARN,
      'ConsumerCreationTimestamp':
          unixTimestampToJson(consumerCreationTimestamp),
      'ConsumerName': consumerName,
      'ConsumerStatus': consumerStatus.toValue(),
      'StreamARN': streamARN,
    };
  }
}

enum ConsumerStatus {
  creating,
  deleting,
  active,
}

extension on ConsumerStatus {
  String toValue() {
    switch (this) {
      case ConsumerStatus.creating:
        return 'CREATING';
      case ConsumerStatus.deleting:
        return 'DELETING';
      case ConsumerStatus.active:
        return 'ACTIVE';
    }
  }
}

extension on String {
  ConsumerStatus toConsumerStatus() {
    switch (this) {
      case 'CREATING':
        return ConsumerStatus.creating;
      case 'DELETING':
        return ConsumerStatus.deleting;
      case 'ACTIVE':
        return ConsumerStatus.active;
    }
    throw Exception('$this is not known in enum ConsumerStatus');
  }
}

class DescribeLimitsOutput {
  /// The number of open shards.
  final int openShardCount;

  /// The maximum number of shards.
  final int shardLimit;

  DescribeLimitsOutput({
    required this.openShardCount,
    required this.shardLimit,
  });

  factory DescribeLimitsOutput.fromJson(Map<String, dynamic> json) {
    return DescribeLimitsOutput(
      openShardCount: json['OpenShardCount'] as int,
      shardLimit: json['ShardLimit'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final openShardCount = this.openShardCount;
    final shardLimit = this.shardLimit;
    return {
      'OpenShardCount': openShardCount,
      'ShardLimit': shardLimit,
    };
  }
}

class DescribeStreamConsumerOutput {
  /// An object that represents the details of the consumer.
  final ConsumerDescription consumerDescription;

  DescribeStreamConsumerOutput({
    required this.consumerDescription,
  });

  factory DescribeStreamConsumerOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStreamConsumerOutput(
      consumerDescription: ConsumerDescription.fromJson(
          json['ConsumerDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final consumerDescription = this.consumerDescription;
    return {
      'ConsumerDescription': consumerDescription,
    };
  }
}

/// Represents the output for <code>DescribeStream</code>.
class DescribeStreamOutput {
  /// The current status of the stream, the stream Amazon Resource Name (ARN), an
  /// array of shard objects that comprise the stream, and whether there are more
  /// shards available.
  final StreamDescription streamDescription;

  DescribeStreamOutput({
    required this.streamDescription,
  });

  factory DescribeStreamOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStreamOutput(
      streamDescription: StreamDescription.fromJson(
          json['StreamDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final streamDescription = this.streamDescription;
    return {
      'StreamDescription': streamDescription,
    };
  }
}

class DescribeStreamSummaryOutput {
  /// A <a>StreamDescriptionSummary</a> containing information about the stream.
  final StreamDescriptionSummary streamDescriptionSummary;

  DescribeStreamSummaryOutput({
    required this.streamDescriptionSummary,
  });

  factory DescribeStreamSummaryOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStreamSummaryOutput(
      streamDescriptionSummary: StreamDescriptionSummary.fromJson(
          json['StreamDescriptionSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final streamDescriptionSummary = this.streamDescriptionSummary;
    return {
      'StreamDescriptionSummary': streamDescriptionSummary,
    };
  }
}

enum EncryptionType {
  none,
  kms,
}

extension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.none:
        return 'NONE';
      case EncryptionType.kms:
        return 'KMS';
    }
  }
}

extension on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'NONE':
        return EncryptionType.none;
      case 'KMS':
        return EncryptionType.kms;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// Represents enhanced metrics types.
class EnhancedMetrics {
  /// List of shard-level metrics.
  ///
  /// The following are the valid shard-level metrics. The value
  /// "<code>ALL</code>" enhances every metric.
  ///
  /// <ul>
  /// <li>
  /// <code>IncomingBytes</code>
  /// </li>
  /// <li>
  /// <code>IncomingRecords</code>
  /// </li>
  /// <li>
  /// <code>OutgoingBytes</code>
  /// </li>
  /// <li>
  /// <code>OutgoingRecords</code>
  /// </li>
  /// <li>
  /// <code>WriteProvisionedThroughputExceeded</code>
  /// </li>
  /// <li>
  /// <code>ReadProvisionedThroughputExceeded</code>
  /// </li>
  /// <li>
  /// <code>IteratorAgeMilliseconds</code>
  /// </li>
  /// <li>
  /// <code>ALL</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesis/latest/dev/monitoring-with-cloudwatch.html">Monitoring
  /// the Amazon Kinesis Data Streams Service with Amazon CloudWatch</a> in the
  /// <i>Amazon Kinesis Data Streams Developer Guide</i>.
  final List<MetricsName>? shardLevelMetrics;

  EnhancedMetrics({
    this.shardLevelMetrics,
  });

  factory EnhancedMetrics.fromJson(Map<String, dynamic> json) {
    return EnhancedMetrics(
      shardLevelMetrics: (json['ShardLevelMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMetricsName())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final shardLevelMetrics = this.shardLevelMetrics;
    return {
      if (shardLevelMetrics != null)
        'ShardLevelMetrics': shardLevelMetrics.map((e) => e.toValue()).toList(),
    };
  }
}

/// Represents the output for <a>EnableEnhancedMonitoring</a> and
/// <a>DisableEnhancedMonitoring</a>.
class EnhancedMonitoringOutput {
  /// Represents the current state of the metrics that are in the enhanced state
  /// before the operation.
  final List<MetricsName>? currentShardLevelMetrics;

  /// Represents the list of all the metrics that would be in the enhanced state
  /// after the operation.
  final List<MetricsName>? desiredShardLevelMetrics;

  /// The name of the Kinesis data stream.
  final String? streamName;

  EnhancedMonitoringOutput({
    this.currentShardLevelMetrics,
    this.desiredShardLevelMetrics,
    this.streamName,
  });

  factory EnhancedMonitoringOutput.fromJson(Map<String, dynamic> json) {
    return EnhancedMonitoringOutput(
      currentShardLevelMetrics: (json['CurrentShardLevelMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMetricsName())
          .toList(),
      desiredShardLevelMetrics: (json['DesiredShardLevelMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toMetricsName())
          .toList(),
      streamName: json['StreamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentShardLevelMetrics = this.currentShardLevelMetrics;
    final desiredShardLevelMetrics = this.desiredShardLevelMetrics;
    final streamName = this.streamName;
    return {
      if (currentShardLevelMetrics != null)
        'CurrentShardLevelMetrics':
            currentShardLevelMetrics.map((e) => e.toValue()).toList(),
      if (desiredShardLevelMetrics != null)
        'DesiredShardLevelMetrics':
            desiredShardLevelMetrics.map((e) => e.toValue()).toList(),
      if (streamName != null) 'StreamName': streamName,
    };
  }
}

/// Represents the output for <a>GetRecords</a>.
class GetRecordsOutput {
  /// The data records retrieved from the shard.
  final List<Record> records;
  final List<ChildShard>? childShards;

  /// The number of milliseconds the <a>GetRecords</a> response is from the tip of
  /// the stream, indicating how far behind current time the consumer is. A value
  /// of zero indicates that record processing is caught up, and there are no new
  /// records to process at this moment.
  final int? millisBehindLatest;

  /// The next position in the shard from which to start sequentially reading data
  /// records. If set to <code>null</code>, the shard has been closed and the
  /// requested iterator does not return any more data.
  final String? nextShardIterator;

  GetRecordsOutput({
    required this.records,
    this.childShards,
    this.millisBehindLatest,
    this.nextShardIterator,
  });

  factory GetRecordsOutput.fromJson(Map<String, dynamic> json) {
    return GetRecordsOutput(
      records: (json['Records'] as List)
          .whereNotNull()
          .map((e) => Record.fromJson(e as Map<String, dynamic>))
          .toList(),
      childShards: (json['ChildShards'] as List?)
          ?.whereNotNull()
          .map((e) => ChildShard.fromJson(e as Map<String, dynamic>))
          .toList(),
      millisBehindLatest: json['MillisBehindLatest'] as int?,
      nextShardIterator: json['NextShardIterator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final records = this.records;
    final childShards = this.childShards;
    final millisBehindLatest = this.millisBehindLatest;
    final nextShardIterator = this.nextShardIterator;
    return {
      'Records': records,
      if (childShards != null) 'ChildShards': childShards,
      if (millisBehindLatest != null) 'MillisBehindLatest': millisBehindLatest,
      if (nextShardIterator != null) 'NextShardIterator': nextShardIterator,
    };
  }
}

/// Represents the output for <code>GetShardIterator</code>.
class GetShardIteratorOutput {
  /// The position in the shard from which to start reading data records
  /// sequentially. A shard iterator specifies this position using the sequence
  /// number of a data record in a shard.
  final String? shardIterator;

  GetShardIteratorOutput({
    this.shardIterator,
  });

  factory GetShardIteratorOutput.fromJson(Map<String, dynamic> json) {
    return GetShardIteratorOutput(
      shardIterator: json['ShardIterator'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final shardIterator = this.shardIterator;
    return {
      if (shardIterator != null) 'ShardIterator': shardIterator,
    };
  }
}

/// The range of possible hash key values for the shard, which is a set of
/// ordered contiguous positive integers.
class HashKeyRange {
  /// The ending hash key of the hash key range.
  final String endingHashKey;

  /// The starting hash key of the hash key range.
  final String startingHashKey;

  HashKeyRange({
    required this.endingHashKey,
    required this.startingHashKey,
  });

  factory HashKeyRange.fromJson(Map<String, dynamic> json) {
    return HashKeyRange(
      endingHashKey: json['EndingHashKey'] as String,
      startingHashKey: json['StartingHashKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final endingHashKey = this.endingHashKey;
    final startingHashKey = this.startingHashKey;
    return {
      'EndingHashKey': endingHashKey,
      'StartingHashKey': startingHashKey,
    };
  }
}

class ListShardsOutput {
  /// When the number of shards in the data stream is greater than the default
  /// value for the <code>MaxResults</code> parameter, or if you explicitly
  /// specify a value for <code>MaxResults</code> that is less than the number of
  /// shards in the data stream, the response includes a pagination token named
  /// <code>NextToken</code>. You can specify this <code>NextToken</code> value in
  /// a subsequent call to <code>ListShards</code> to list the next set of shards.
  /// For more information about the use of this pagination token when calling the
  /// <code>ListShards</code> operation, see <a>ListShardsInput$NextToken</a>.
  /// <important>
  /// Tokens expire after 300 seconds. When you obtain a value for
  /// <code>NextToken</code> in the response to a call to <code>ListShards</code>,
  /// you have 300 seconds to use that value. If you specify an expired token in a
  /// call to <code>ListShards</code>, you get
  /// <code>ExpiredNextTokenException</code>.
  /// </important>
  final String? nextToken;

  /// An array of JSON objects. Each object represents one shard and specifies the
  /// IDs of the shard, the shard's parent, and the shard that's adjacent to the
  /// shard's parent. Each object also contains the starting and ending hash keys
  /// and the starting and ending sequence numbers for the shard.
  final List<Shard>? shards;

  ListShardsOutput({
    this.nextToken,
    this.shards,
  });

  factory ListShardsOutput.fromJson(Map<String, dynamic> json) {
    return ListShardsOutput(
      nextToken: json['NextToken'] as String?,
      shards: (json['Shards'] as List?)
          ?.whereNotNull()
          .map((e) => Shard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final shards = this.shards;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (shards != null) 'Shards': shards,
    };
  }
}

class ListStreamConsumersOutput {
  /// An array of JSON objects. Each object represents one registered consumer.
  final List<Consumer>? consumers;

  /// When the number of consumers that are registered with the data stream is
  /// greater than the default value for the <code>MaxResults</code> parameter, or
  /// if you explicitly specify a value for <code>MaxResults</code> that is less
  /// than the number of registered consumers, the response includes a pagination
  /// token named <code>NextToken</code>. You can specify this
  /// <code>NextToken</code> value in a subsequent call to
  /// <code>ListStreamConsumers</code> to list the next set of registered
  /// consumers. For more information about the use of this pagination token when
  /// calling the <code>ListStreamConsumers</code> operation, see
  /// <a>ListStreamConsumersInput$NextToken</a>.
  /// <important>
  /// Tokens expire after 300 seconds. When you obtain a value for
  /// <code>NextToken</code> in the response to a call to
  /// <code>ListStreamConsumers</code>, you have 300 seconds to use that value. If
  /// you specify an expired token in a call to <code>ListStreamConsumers</code>,
  /// you get <code>ExpiredNextTokenException</code>.
  /// </important>
  final String? nextToken;

  ListStreamConsumersOutput({
    this.consumers,
    this.nextToken,
  });

  factory ListStreamConsumersOutput.fromJson(Map<String, dynamic> json) {
    return ListStreamConsumersOutput(
      consumers: (json['Consumers'] as List?)
          ?.whereNotNull()
          .map((e) => Consumer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumers = this.consumers;
    final nextToken = this.nextToken;
    return {
      if (consumers != null) 'Consumers': consumers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// Represents the output for <code>ListStreams</code>.
class ListStreamsOutput {
  /// If set to <code>true</code>, there are more streams available to list.
  final bool hasMoreStreams;

  /// The names of the streams that are associated with the AWS account making the
  /// <code>ListStreams</code> request.
  final List<String> streamNames;

  ListStreamsOutput({
    required this.hasMoreStreams,
    required this.streamNames,
  });

  factory ListStreamsOutput.fromJson(Map<String, dynamic> json) {
    return ListStreamsOutput(
      hasMoreStreams: json['HasMoreStreams'] as bool,
      streamNames: (json['StreamNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hasMoreStreams = this.hasMoreStreams;
    final streamNames = this.streamNames;
    return {
      'HasMoreStreams': hasMoreStreams,
      'StreamNames': streamNames,
    };
  }
}

/// Represents the output for <code>ListTagsForStream</code>.
class ListTagsForStreamOutput {
  /// If set to <code>true</code>, more tags are available. To request additional
  /// tags, set <code>ExclusiveStartTagKey</code> to the key of the last tag
  /// returned.
  final bool hasMoreTags;

  /// A list of tags associated with <code>StreamName</code>, starting with the
  /// first tag after <code>ExclusiveStartTagKey</code> and up to the specified
  /// <code>Limit</code>.
  final List<Tag> tags;

  ListTagsForStreamOutput({
    required this.hasMoreTags,
    required this.tags,
  });

  factory ListTagsForStreamOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForStreamOutput(
      hasMoreTags: json['HasMoreTags'] as bool,
      tags: (json['Tags'] as List)
          .whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hasMoreTags = this.hasMoreTags;
    final tags = this.tags;
    return {
      'HasMoreTags': hasMoreTags,
      'Tags': tags,
    };
  }
}

enum MetricsName {
  incomingBytes,
  incomingRecords,
  outgoingBytes,
  outgoingRecords,
  writeProvisionedThroughputExceeded,
  readProvisionedThroughputExceeded,
  iteratorAgeMilliseconds,
  all,
}

extension on MetricsName {
  String toValue() {
    switch (this) {
      case MetricsName.incomingBytes:
        return 'IncomingBytes';
      case MetricsName.incomingRecords:
        return 'IncomingRecords';
      case MetricsName.outgoingBytes:
        return 'OutgoingBytes';
      case MetricsName.outgoingRecords:
        return 'OutgoingRecords';
      case MetricsName.writeProvisionedThroughputExceeded:
        return 'WriteProvisionedThroughputExceeded';
      case MetricsName.readProvisionedThroughputExceeded:
        return 'ReadProvisionedThroughputExceeded';
      case MetricsName.iteratorAgeMilliseconds:
        return 'IteratorAgeMilliseconds';
      case MetricsName.all:
        return 'ALL';
    }
  }
}

extension on String {
  MetricsName toMetricsName() {
    switch (this) {
      case 'IncomingBytes':
        return MetricsName.incomingBytes;
      case 'IncomingRecords':
        return MetricsName.incomingRecords;
      case 'OutgoingBytes':
        return MetricsName.outgoingBytes;
      case 'OutgoingRecords':
        return MetricsName.outgoingRecords;
      case 'WriteProvisionedThroughputExceeded':
        return MetricsName.writeProvisionedThroughputExceeded;
      case 'ReadProvisionedThroughputExceeded':
        return MetricsName.readProvisionedThroughputExceeded;
      case 'IteratorAgeMilliseconds':
        return MetricsName.iteratorAgeMilliseconds;
      case 'ALL':
        return MetricsName.all;
    }
    throw Exception('$this is not known in enum MetricsName');
  }
}

/// Represents the output for <code>PutRecord</code>.
class PutRecordOutput {
  /// The sequence number identifier that was assigned to the put data record. The
  /// sequence number for the record is unique across all records in the stream. A
  /// sequence number is the identifier associated with every record put into the
  /// stream.
  final String sequenceNumber;

  /// The shard ID of the shard where the data record was placed.
  final String shardId;

  /// The encryption type to use on the record. This parameter can be one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: Do not encrypt the records in the stream.
  /// </li>
  /// <li>
  /// <code>KMS</code>: Use server-side encryption on the records in the stream
  /// using a customer-managed AWS KMS key.
  /// </li>
  /// </ul>
  final EncryptionType? encryptionType;

  PutRecordOutput({
    required this.sequenceNumber,
    required this.shardId,
    this.encryptionType,
  });

  factory PutRecordOutput.fromJson(Map<String, dynamic> json) {
    return PutRecordOutput(
      sequenceNumber: json['SequenceNumber'] as String,
      shardId: json['ShardId'] as String,
      encryptionType: (json['EncryptionType'] as String?)?.toEncryptionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final sequenceNumber = this.sequenceNumber;
    final shardId = this.shardId;
    final encryptionType = this.encryptionType;
    return {
      'SequenceNumber': sequenceNumber,
      'ShardId': shardId,
      if (encryptionType != null) 'EncryptionType': encryptionType.toValue(),
    };
  }
}

/// <code>PutRecords</code> results.
class PutRecordsOutput {
  /// An array of successfully and unsuccessfully processed record results,
  /// correlated with the request by natural ordering. A record that is
  /// successfully added to a stream includes <code>SequenceNumber</code> and
  /// <code>ShardId</code> in the result. A record that fails to be added to a
  /// stream includes <code>ErrorCode</code> and <code>ErrorMessage</code> in the
  /// result.
  final List<PutRecordsResultEntry> records;

  /// The encryption type used on the records. This parameter can be one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: Do not encrypt the records.
  /// </li>
  /// <li>
  /// <code>KMS</code>: Use server-side encryption on the records using a
  /// customer-managed AWS KMS key.
  /// </li>
  /// </ul>
  final EncryptionType? encryptionType;

  /// The number of unsuccessfully processed records in a <code>PutRecords</code>
  /// request.
  final int? failedRecordCount;

  PutRecordsOutput({
    required this.records,
    this.encryptionType,
    this.failedRecordCount,
  });

  factory PutRecordsOutput.fromJson(Map<String, dynamic> json) {
    return PutRecordsOutput(
      records: (json['Records'] as List)
          .whereNotNull()
          .map((e) => PutRecordsResultEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      encryptionType: (json['EncryptionType'] as String?)?.toEncryptionType(),
      failedRecordCount: json['FailedRecordCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final records = this.records;
    final encryptionType = this.encryptionType;
    final failedRecordCount = this.failedRecordCount;
    return {
      'Records': records,
      if (encryptionType != null) 'EncryptionType': encryptionType.toValue(),
      if (failedRecordCount != null) 'FailedRecordCount': failedRecordCount,
    };
  }
}

/// Represents the output for <code>PutRecords</code>.
class PutRecordsRequestEntry {
  /// The data blob to put into the record, which is base64-encoded when the blob
  /// is serialized. When the data blob (the payload before base64-encoding) is
  /// added to the partition key size, the total size must not exceed the maximum
  /// record size (1 MiB).
  final Uint8List data;

  /// Determines which shard in the stream the data record is assigned to.
  /// Partition keys are Unicode strings with a maximum length limit of 256
  /// characters for each key. Amazon Kinesis Data Streams uses the partition key
  /// as input to a hash function that maps the partition key and associated data
  /// to a specific shard. Specifically, an MD5 hash function is used to map
  /// partition keys to 128-bit integer values and to map associated data records
  /// to shards. As a result of this hashing mechanism, all data records with the
  /// same partition key map to the same shard within the stream.
  final String partitionKey;

  /// The hash value used to determine explicitly the shard that the data record
  /// is assigned to by overriding the partition key hash.
  final String? explicitHashKey;

  PutRecordsRequestEntry({
    required this.data,
    required this.partitionKey,
    this.explicitHashKey,
  });

  factory PutRecordsRequestEntry.fromJson(Map<String, dynamic> json) {
    return PutRecordsRequestEntry(
      data: _s.decodeUint8List(json['Data']! as String),
      partitionKey: json['PartitionKey'] as String,
      explicitHashKey: json['ExplicitHashKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final partitionKey = this.partitionKey;
    final explicitHashKey = this.explicitHashKey;
    return {
      'Data': base64Encode(data),
      'PartitionKey': partitionKey,
      if (explicitHashKey != null) 'ExplicitHashKey': explicitHashKey,
    };
  }
}

/// Represents the result of an individual record from a <code>PutRecords</code>
/// request. A record that is successfully added to a stream includes
/// <code>SequenceNumber</code> and <code>ShardId</code> in the result. A record
/// that fails to be added to the stream includes <code>ErrorCode</code> and
/// <code>ErrorMessage</code> in the result.
class PutRecordsResultEntry {
  /// The error code for an individual record result. <code>ErrorCodes</code> can
  /// be either <code>ProvisionedThroughputExceededException</code> or
  /// <code>InternalFailure</code>.
  final String? errorCode;

  /// The error message for an individual record result. An <code>ErrorCode</code>
  /// value of <code>ProvisionedThroughputExceededException</code> has an error
  /// message that includes the account ID, stream name, and shard ID. An
  /// <code>ErrorCode</code> value of <code>InternalFailure</code> has the error
  /// message <code>"Internal Service Failure"</code>.
  final String? errorMessage;

  /// The sequence number for an individual record result.
  final String? sequenceNumber;

  /// The shard ID for an individual record result.
  final String? shardId;

  PutRecordsResultEntry({
    this.errorCode,
    this.errorMessage,
    this.sequenceNumber,
    this.shardId,
  });

  factory PutRecordsResultEntry.fromJson(Map<String, dynamic> json) {
    return PutRecordsResultEntry(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      sequenceNumber: json['SequenceNumber'] as String?,
      shardId: json['ShardId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final sequenceNumber = this.sequenceNumber;
    final shardId = this.shardId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (sequenceNumber != null) 'SequenceNumber': sequenceNumber,
      if (shardId != null) 'ShardId': shardId,
    };
  }
}

/// The unit of data of the Kinesis data stream, which is composed of a sequence
/// number, a partition key, and a data blob.
class Record {
  /// The data blob. The data in the blob is both opaque and immutable to Kinesis
  /// Data Streams, which does not inspect, interpret, or change the data in the
  /// blob in any way. When the data blob (the payload before base64-encoding) is
  /// added to the partition key size, the total size must not exceed the maximum
  /// record size (1 MiB).
  final Uint8List data;

  /// Identifies which shard in the stream the data record is assigned to.
  final String partitionKey;

  /// The unique identifier of the record within its shard.
  final String sequenceNumber;

  /// The approximate time that the record was inserted into the stream.
  final DateTime? approximateArrivalTimestamp;

  /// The encryption type used on the record. This parameter can be one of the
  /// following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: Do not encrypt the records in the stream.
  /// </li>
  /// <li>
  /// <code>KMS</code>: Use server-side encryption on the records in the stream
  /// using a customer-managed AWS KMS key.
  /// </li>
  /// </ul>
  final EncryptionType? encryptionType;

  Record({
    required this.data,
    required this.partitionKey,
    required this.sequenceNumber,
    this.approximateArrivalTimestamp,
    this.encryptionType,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      data: _s.decodeUint8List(json['Data']! as String),
      partitionKey: json['PartitionKey'] as String,
      sequenceNumber: json['SequenceNumber'] as String,
      approximateArrivalTimestamp:
          timeStampFromJson(json['ApproximateArrivalTimestamp']),
      encryptionType: (json['EncryptionType'] as String?)?.toEncryptionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data;
    final partitionKey = this.partitionKey;
    final sequenceNumber = this.sequenceNumber;
    final approximateArrivalTimestamp = this.approximateArrivalTimestamp;
    final encryptionType = this.encryptionType;
    return {
      'Data': base64Encode(data),
      'PartitionKey': partitionKey,
      'SequenceNumber': sequenceNumber,
      if (approximateArrivalTimestamp != null)
        'ApproximateArrivalTimestamp':
            unixTimestampToJson(approximateArrivalTimestamp),
      if (encryptionType != null) 'EncryptionType': encryptionType.toValue(),
    };
  }
}

class RegisterStreamConsumerOutput {
  /// An object that represents the details of the consumer you registered. When
  /// you register a consumer, it gets an ARN that is generated by Kinesis Data
  /// Streams.
  final Consumer consumer;

  RegisterStreamConsumerOutput({
    required this.consumer,
  });

  factory RegisterStreamConsumerOutput.fromJson(Map<String, dynamic> json) {
    return RegisterStreamConsumerOutput(
      consumer: Consumer.fromJson(json['Consumer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final consumer = this.consumer;
    return {
      'Consumer': consumer,
    };
  }
}

enum ScalingType {
  uniformScaling,
}

extension on ScalingType {
  String toValue() {
    switch (this) {
      case ScalingType.uniformScaling:
        return 'UNIFORM_SCALING';
    }
  }
}

extension on String {
  ScalingType toScalingType() {
    switch (this) {
      case 'UNIFORM_SCALING':
        return ScalingType.uniformScaling;
    }
    throw Exception('$this is not known in enum ScalingType');
  }
}

/// The range of possible sequence numbers for the shard.
class SequenceNumberRange {
  /// The starting sequence number for the range.
  final String startingSequenceNumber;

  /// The ending sequence number for the range. Shards that are in the OPEN state
  /// have an ending sequence number of <code>null</code>.
  final String? endingSequenceNumber;

  SequenceNumberRange({
    required this.startingSequenceNumber,
    this.endingSequenceNumber,
  });

  factory SequenceNumberRange.fromJson(Map<String, dynamic> json) {
    return SequenceNumberRange(
      startingSequenceNumber: json['StartingSequenceNumber'] as String,
      endingSequenceNumber: json['EndingSequenceNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final startingSequenceNumber = this.startingSequenceNumber;
    final endingSequenceNumber = this.endingSequenceNumber;
    return {
      'StartingSequenceNumber': startingSequenceNumber,
      if (endingSequenceNumber != null)
        'EndingSequenceNumber': endingSequenceNumber,
    };
  }
}

/// A uniquely identified group of data records in a Kinesis data stream.
class Shard {
  /// The range of possible hash key values for the shard, which is a set of
  /// ordered contiguous positive integers.
  final HashKeyRange hashKeyRange;

  /// The range of possible sequence numbers for the shard.
  final SequenceNumberRange sequenceNumberRange;

  /// The unique identifier of the shard within the stream.
  final String shardId;

  /// The shard ID of the shard adjacent to the shard's parent.
  final String? adjacentParentShardId;

  /// The shard ID of the shard's parent.
  final String? parentShardId;

  Shard({
    required this.hashKeyRange,
    required this.sequenceNumberRange,
    required this.shardId,
    this.adjacentParentShardId,
    this.parentShardId,
  });

  factory Shard.fromJson(Map<String, dynamic> json) {
    return Shard(
      hashKeyRange:
          HashKeyRange.fromJson(json['HashKeyRange'] as Map<String, dynamic>),
      sequenceNumberRange: SequenceNumberRange.fromJson(
          json['SequenceNumberRange'] as Map<String, dynamic>),
      shardId: json['ShardId'] as String,
      adjacentParentShardId: json['AdjacentParentShardId'] as String?,
      parentShardId: json['ParentShardId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hashKeyRange = this.hashKeyRange;
    final sequenceNumberRange = this.sequenceNumberRange;
    final shardId = this.shardId;
    final adjacentParentShardId = this.adjacentParentShardId;
    final parentShardId = this.parentShardId;
    return {
      'HashKeyRange': hashKeyRange,
      'SequenceNumberRange': sequenceNumberRange,
      'ShardId': shardId,
      if (adjacentParentShardId != null)
        'AdjacentParentShardId': adjacentParentShardId,
      if (parentShardId != null) 'ParentShardId': parentShardId,
    };
  }
}

class ShardFilter {
  final ShardFilterType type;
  final String? shardId;
  final DateTime? timestamp;

  ShardFilter({
    required this.type,
    this.shardId,
    this.timestamp,
  });

  factory ShardFilter.fromJson(Map<String, dynamic> json) {
    return ShardFilter(
      type: (json['Type'] as String).toShardFilterType(),
      shardId: json['ShardId'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final shardId = this.shardId;
    final timestamp = this.timestamp;
    return {
      'Type': type.toValue(),
      if (shardId != null) 'ShardId': shardId,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

enum ShardFilterType {
  afterShardId,
  atTrimHorizon,
  fromTrimHorizon,
  atLatest,
  atTimestamp,
  fromTimestamp,
}

extension on ShardFilterType {
  String toValue() {
    switch (this) {
      case ShardFilterType.afterShardId:
        return 'AFTER_SHARD_ID';
      case ShardFilterType.atTrimHorizon:
        return 'AT_TRIM_HORIZON';
      case ShardFilterType.fromTrimHorizon:
        return 'FROM_TRIM_HORIZON';
      case ShardFilterType.atLatest:
        return 'AT_LATEST';
      case ShardFilterType.atTimestamp:
        return 'AT_TIMESTAMP';
      case ShardFilterType.fromTimestamp:
        return 'FROM_TIMESTAMP';
    }
  }
}

extension on String {
  ShardFilterType toShardFilterType() {
    switch (this) {
      case 'AFTER_SHARD_ID':
        return ShardFilterType.afterShardId;
      case 'AT_TRIM_HORIZON':
        return ShardFilterType.atTrimHorizon;
      case 'FROM_TRIM_HORIZON':
        return ShardFilterType.fromTrimHorizon;
      case 'AT_LATEST':
        return ShardFilterType.atLatest;
      case 'AT_TIMESTAMP':
        return ShardFilterType.atTimestamp;
      case 'FROM_TIMESTAMP':
        return ShardFilterType.fromTimestamp;
    }
    throw Exception('$this is not known in enum ShardFilterType');
  }
}

enum ShardIteratorType {
  atSequenceNumber,
  afterSequenceNumber,
  trimHorizon,
  latest,
  atTimestamp,
}

extension on ShardIteratorType {
  String toValue() {
    switch (this) {
      case ShardIteratorType.atSequenceNumber:
        return 'AT_SEQUENCE_NUMBER';
      case ShardIteratorType.afterSequenceNumber:
        return 'AFTER_SEQUENCE_NUMBER';
      case ShardIteratorType.trimHorizon:
        return 'TRIM_HORIZON';
      case ShardIteratorType.latest:
        return 'LATEST';
      case ShardIteratorType.atTimestamp:
        return 'AT_TIMESTAMP';
    }
  }
}

extension on String {
  ShardIteratorType toShardIteratorType() {
    switch (this) {
      case 'AT_SEQUENCE_NUMBER':
        return ShardIteratorType.atSequenceNumber;
      case 'AFTER_SEQUENCE_NUMBER':
        return ShardIteratorType.afterSequenceNumber;
      case 'TRIM_HORIZON':
        return ShardIteratorType.trimHorizon;
      case 'LATEST':
        return ShardIteratorType.latest;
      case 'AT_TIMESTAMP':
        return ShardIteratorType.atTimestamp;
    }
    throw Exception('$this is not known in enum ShardIteratorType');
  }
}

/// Represents the output for <a>DescribeStream</a>.
class StreamDescription {
  /// Represents the current enhanced monitoring settings of the stream.
  final List<EnhancedMetrics> enhancedMonitoring;

  /// If set to <code>true</code>, more shards in the stream are available to
  /// describe.
  final bool hasMoreShards;

  /// The current retention period, in hours. Minimum value of 24. Maximum value
  /// of 168.
  final int retentionPeriodHours;

  /// The shards that comprise the stream.
  final List<Shard> shards;

  /// The Amazon Resource Name (ARN) for the stream being described.
  final String streamARN;

  /// The approximate time that the stream was created.
  final DateTime streamCreationTimestamp;

  /// The name of the stream being described.
  final String streamName;

  /// The current status of the stream being described. The stream status is one
  /// of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The stream is being created. Kinesis Data Streams
  /// immediately returns and sets <code>StreamStatus</code> to
  /// <code>CREATING</code>.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The stream is being deleted. The specified stream is
  /// in the <code>DELETING</code> state until Kinesis Data Streams completes the
  /// deletion.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The stream exists and is ready for read and write
  /// operations or deletion. You should perform read and write operations only on
  /// an <code>ACTIVE</code> stream.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - Shards in the stream are being merged or split. Read
  /// and write operations continue to work while the stream is in the
  /// <code>UPDATING</code> state.
  /// </li>
  /// </ul>
  final StreamStatus streamStatus;

  /// The server-side encryption type used on the stream. This parameter can be
  /// one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>NONE</code>: Do not encrypt the records in the stream.
  /// </li>
  /// <li>
  /// <code>KMS</code>: Use server-side encryption on the records in the stream
  /// using a customer-managed AWS KMS key.
  /// </li>
  /// </ul>
  final EncryptionType? encryptionType;

  /// The GUID for the customer-managed AWS KMS key to use for encryption. This
  /// value can be a globally unique identifier, a fully specified ARN to either
  /// an alias or a key, or an alias name prefixed by "alias/".You can also use a
  /// master key owned by Kinesis Data Streams by specifying the alias
  /// <code>aws/kinesis</code>.
  ///
  /// <ul>
  /// <li>
  /// Key ARN example:
  /// <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias ARN example:
  /// <code>arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Globally unique key ID example:
  /// <code>12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias name example: <code>alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code>
  /// </li>
  /// </ul>
  final String? keyId;

  StreamDescription({
    required this.enhancedMonitoring,
    required this.hasMoreShards,
    required this.retentionPeriodHours,
    required this.shards,
    required this.streamARN,
    required this.streamCreationTimestamp,
    required this.streamName,
    required this.streamStatus,
    this.encryptionType,
    this.keyId,
  });

  factory StreamDescription.fromJson(Map<String, dynamic> json) {
    return StreamDescription(
      enhancedMonitoring: (json['EnhancedMonitoring'] as List)
          .whereNotNull()
          .map((e) => EnhancedMetrics.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMoreShards: json['HasMoreShards'] as bool,
      retentionPeriodHours: json['RetentionPeriodHours'] as int,
      shards: (json['Shards'] as List)
          .whereNotNull()
          .map((e) => Shard.fromJson(e as Map<String, dynamic>))
          .toList(),
      streamARN: json['StreamARN'] as String,
      streamCreationTimestamp: nonNullableTimeStampFromJson(
          json['StreamCreationTimestamp'] as Object),
      streamName: json['StreamName'] as String,
      streamStatus: (json['StreamStatus'] as String).toStreamStatus(),
      encryptionType: (json['EncryptionType'] as String?)?.toEncryptionType(),
      keyId: json['KeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enhancedMonitoring = this.enhancedMonitoring;
    final hasMoreShards = this.hasMoreShards;
    final retentionPeriodHours = this.retentionPeriodHours;
    final shards = this.shards;
    final streamARN = this.streamARN;
    final streamCreationTimestamp = this.streamCreationTimestamp;
    final streamName = this.streamName;
    final streamStatus = this.streamStatus;
    final encryptionType = this.encryptionType;
    final keyId = this.keyId;
    return {
      'EnhancedMonitoring': enhancedMonitoring,
      'HasMoreShards': hasMoreShards,
      'RetentionPeriodHours': retentionPeriodHours,
      'Shards': shards,
      'StreamARN': streamARN,
      'StreamCreationTimestamp': unixTimestampToJson(streamCreationTimestamp),
      'StreamName': streamName,
      'StreamStatus': streamStatus.toValue(),
      if (encryptionType != null) 'EncryptionType': encryptionType.toValue(),
      if (keyId != null) 'KeyId': keyId,
    };
  }
}

/// Represents the output for <a>DescribeStreamSummary</a>
class StreamDescriptionSummary {
  /// Represents the current enhanced monitoring settings of the stream.
  final List<EnhancedMetrics> enhancedMonitoring;

  /// The number of open shards in the stream.
  final int openShardCount;

  /// The current retention period, in hours.
  final int retentionPeriodHours;

  /// The Amazon Resource Name (ARN) for the stream being described.
  final String streamARN;

  /// The approximate time that the stream was created.
  final DateTime streamCreationTimestamp;

  /// The name of the stream being described.
  final String streamName;

  /// The current status of the stream being described. The stream status is one
  /// of the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The stream is being created. Kinesis Data Streams
  /// immediately returns and sets <code>StreamStatus</code> to
  /// <code>CREATING</code>.
  /// </li>
  /// <li>
  /// <code>DELETING</code> - The stream is being deleted. The specified stream is
  /// in the <code>DELETING</code> state until Kinesis Data Streams completes the
  /// deletion.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The stream exists and is ready for read and write
  /// operations or deletion. You should perform read and write operations only on
  /// an <code>ACTIVE</code> stream.
  /// </li>
  /// <li>
  /// <code>UPDATING</code> - Shards in the stream are being merged or split. Read
  /// and write operations continue to work while the stream is in the
  /// <code>UPDATING</code> state.
  /// </li>
  /// </ul>
  final StreamStatus streamStatus;

  /// The number of enhanced fan-out consumers registered with the stream.
  final int? consumerCount;

  /// The encryption type used. This value is one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>KMS</code>
  /// </li>
  /// <li>
  /// <code>NONE</code>
  /// </li>
  /// </ul>
  final EncryptionType? encryptionType;

  /// The GUID for the customer-managed AWS KMS key to use for encryption. This
  /// value can be a globally unique identifier, a fully specified ARN to either
  /// an alias or a key, or an alias name prefixed by "alias/".You can also use a
  /// master key owned by Kinesis Data Streams by specifying the alias
  /// <code>aws/kinesis</code>.
  ///
  /// <ul>
  /// <li>
  /// Key ARN example:
  /// <code>arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias ARN example: <code>
  /// arn:aws:kms:us-east-1:123456789012:alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Globally unique key ID example:
  /// <code>12345678-1234-1234-1234-123456789012</code>
  /// </li>
  /// <li>
  /// Alias name example: <code>alias/MyAliasName</code>
  /// </li>
  /// <li>
  /// Master key owned by Kinesis Data Streams: <code>alias/aws/kinesis</code>
  /// </li>
  /// </ul>
  final String? keyId;

  StreamDescriptionSummary({
    required this.enhancedMonitoring,
    required this.openShardCount,
    required this.retentionPeriodHours,
    required this.streamARN,
    required this.streamCreationTimestamp,
    required this.streamName,
    required this.streamStatus,
    this.consumerCount,
    this.encryptionType,
    this.keyId,
  });

  factory StreamDescriptionSummary.fromJson(Map<String, dynamic> json) {
    return StreamDescriptionSummary(
      enhancedMonitoring: (json['EnhancedMonitoring'] as List)
          .whereNotNull()
          .map((e) => EnhancedMetrics.fromJson(e as Map<String, dynamic>))
          .toList(),
      openShardCount: json['OpenShardCount'] as int,
      retentionPeriodHours: json['RetentionPeriodHours'] as int,
      streamARN: json['StreamARN'] as String,
      streamCreationTimestamp: nonNullableTimeStampFromJson(
          json['StreamCreationTimestamp'] as Object),
      streamName: json['StreamName'] as String,
      streamStatus: (json['StreamStatus'] as String).toStreamStatus(),
      consumerCount: json['ConsumerCount'] as int?,
      encryptionType: (json['EncryptionType'] as String?)?.toEncryptionType(),
      keyId: json['KeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enhancedMonitoring = this.enhancedMonitoring;
    final openShardCount = this.openShardCount;
    final retentionPeriodHours = this.retentionPeriodHours;
    final streamARN = this.streamARN;
    final streamCreationTimestamp = this.streamCreationTimestamp;
    final streamName = this.streamName;
    final streamStatus = this.streamStatus;
    final consumerCount = this.consumerCount;
    final encryptionType = this.encryptionType;
    final keyId = this.keyId;
    return {
      'EnhancedMonitoring': enhancedMonitoring,
      'OpenShardCount': openShardCount,
      'RetentionPeriodHours': retentionPeriodHours,
      'StreamARN': streamARN,
      'StreamCreationTimestamp': unixTimestampToJson(streamCreationTimestamp),
      'StreamName': streamName,
      'StreamStatus': streamStatus.toValue(),
      if (consumerCount != null) 'ConsumerCount': consumerCount,
      if (encryptionType != null) 'EncryptionType': encryptionType.toValue(),
      if (keyId != null) 'KeyId': keyId,
    };
  }
}

enum StreamStatus {
  creating,
  deleting,
  active,
  updating,
}

extension on StreamStatus {
  String toValue() {
    switch (this) {
      case StreamStatus.creating:
        return 'CREATING';
      case StreamStatus.deleting:
        return 'DELETING';
      case StreamStatus.active:
        return 'ACTIVE';
      case StreamStatus.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  StreamStatus toStreamStatus() {
    switch (this) {
      case 'CREATING':
        return StreamStatus.creating;
      case 'DELETING':
        return StreamStatus.deleting;
      case 'ACTIVE':
        return StreamStatus.active;
      case 'UPDATING':
        return StreamStatus.updating;
    }
    throw Exception('$this is not known in enum StreamStatus');
  }
}

/// Metadata assigned to the stream, consisting of a key-value pair.
class Tag {
  /// A unique identifier for the tag. Maximum length: 128 characters. Valid
  /// characters: Unicode letters, digits, white space, _ . / = + - % @
  final String key;

  /// An optional string, typically used to describe or define the tag. Maximum
  /// length: 256 characters. Valid characters: Unicode letters, digits, white
  /// space, _ . / = + - % @
  final String? value;

  Tag({
    required this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class UpdateShardCountOutput {
  /// The current number of shards.
  final int? currentShardCount;

  /// The name of the stream.
  final String? streamName;

  /// The updated number of shards.
  final int? targetShardCount;

  UpdateShardCountOutput({
    this.currentShardCount,
    this.streamName,
    this.targetShardCount,
  });

  factory UpdateShardCountOutput.fromJson(Map<String, dynamic> json) {
    return UpdateShardCountOutput(
      currentShardCount: json['CurrentShardCount'] as int?,
      streamName: json['StreamName'] as String?,
      targetShardCount: json['TargetShardCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentShardCount = this.currentShardCount;
    final streamName = this.streamName;
    final targetShardCount = this.targetShardCount;
    return {
      if (currentShardCount != null) 'CurrentShardCount': currentShardCount,
      if (streamName != null) 'StreamName': streamName,
      if (targetShardCount != null) 'TargetShardCount': targetShardCount,
    };
  }
}

class ExpiredIteratorException extends _s.GenericAwsException {
  ExpiredIteratorException({String? type, String? message})
      : super(type: type, code: 'ExpiredIteratorException', message: message);
}

class ExpiredNextTokenException extends _s.GenericAwsException {
  ExpiredNextTokenException({String? type, String? message})
      : super(type: type, code: 'ExpiredNextTokenException', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class KMSAccessDeniedException extends _s.GenericAwsException {
  KMSAccessDeniedException({String? type, String? message})
      : super(type: type, code: 'KMSAccessDeniedException', message: message);
}

class KMSDisabledException extends _s.GenericAwsException {
  KMSDisabledException({String? type, String? message})
      : super(type: type, code: 'KMSDisabledException', message: message);
}

class KMSInvalidStateException extends _s.GenericAwsException {
  KMSInvalidStateException({String? type, String? message})
      : super(type: type, code: 'KMSInvalidStateException', message: message);
}

class KMSNotFoundException extends _s.GenericAwsException {
  KMSNotFoundException({String? type, String? message})
      : super(type: type, code: 'KMSNotFoundException', message: message);
}

class KMSOptInRequired extends _s.GenericAwsException {
  KMSOptInRequired({String? type, String? message})
      : super(type: type, code: 'KMSOptInRequired', message: message);
}

class KMSThrottlingException extends _s.GenericAwsException {
  KMSThrottlingException({String? type, String? message})
      : super(type: type, code: 'KMSThrottlingException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ProvisionedThroughputExceededException extends _s.GenericAwsException {
  ProvisionedThroughputExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedThroughputExceededException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ExpiredIteratorException': (type, message) =>
      ExpiredIteratorException(type: type, message: message),
  'ExpiredNextTokenException': (type, message) =>
      ExpiredNextTokenException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'KMSAccessDeniedException': (type, message) =>
      KMSAccessDeniedException(type: type, message: message),
  'KMSDisabledException': (type, message) =>
      KMSDisabledException(type: type, message: message),
  'KMSInvalidStateException': (type, message) =>
      KMSInvalidStateException(type: type, message: message),
  'KMSNotFoundException': (type, message) =>
      KMSNotFoundException(type: type, message: message),
  'KMSOptInRequired': (type, message) =>
      KMSOptInRequired(type: type, message: message),
  'KMSThrottlingException': (type, message) =>
      KMSThrottlingException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ProvisionedThroughputExceededException': (type, message) =>
      ProvisionedThroughputExceededException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
