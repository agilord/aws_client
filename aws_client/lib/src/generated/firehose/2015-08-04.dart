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

part '2015-08-04.g.dart';

/// Amazon Kinesis Data Firehose is a fully managed service that delivers
/// real-time streaming data to destinations such as Amazon Simple Storage
/// Service (Amazon S3), Amazon Elasticsearch Service (Amazon ES), Amazon
/// Redshift, and Splunk.
class Firehose {
  final _s.JsonProtocol _protocol;
  Firehose({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'firehose',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a Kinesis Data Firehose delivery stream.
  ///
  /// By default, you can create up to 50 delivery streams per AWS Region.
  ///
  /// This is an asynchronous operation that immediately returns. The initial
  /// status of the delivery stream is <code>CREATING</code>. After the delivery
  /// stream is created, its status is <code>ACTIVE</code> and it now accepts
  /// data. If the delivery stream creation fails, the status transitions to
  /// <code>CREATING_FAILED</code>. Attempts to send data to a delivery stream
  /// that is not in the <code>ACTIVE</code> state cause an exception. To check
  /// the state of a delivery stream, use <a>DescribeDeliveryStream</a>.
  ///
  /// If the status of a delivery stream is <code>CREATING_FAILED</code>, this
  /// status doesn't change, and you can't invoke
  /// <code>CreateDeliveryStream</code> again on it. However, you can invoke the
  /// <a>DeleteDeliveryStream</a> operation to delete it.
  ///
  /// A Kinesis Data Firehose delivery stream can be configured to receive
  /// records directly from providers using <a>PutRecord</a> or
  /// <a>PutRecordBatch</a>, or it can be configured to use an existing Kinesis
  /// stream as its source. To specify a Kinesis data stream as input, set the
  /// <code>DeliveryStreamType</code> parameter to
  /// <code>KinesisStreamAsSource</code>, and provide the Kinesis stream Amazon
  /// Resource Name (ARN) and role ARN in the
  /// <code>KinesisStreamSourceConfiguration</code> parameter.
  ///
  /// To create a delivery stream with server-side encryption (SSE) enabled,
  /// include <a>DeliveryStreamEncryptionConfigurationInput</a> in your request.
  /// This is optional. You can also invoke <a>StartDeliveryStreamEncryption</a>
  /// to turn on SSE for an existing delivery stream that doesn't have SSE
  /// enabled.
  ///
  /// A delivery stream is configured with a single destination: Amazon S3,
  /// Amazon ES, Amazon Redshift, or Splunk. You must specify only one of the
  /// following destination configuration parameters:
  /// <code>ExtendedS3DestinationConfiguration</code>,
  /// <code>S3DestinationConfiguration</code>,
  /// <code>ElasticsearchDestinationConfiguration</code>,
  /// <code>RedshiftDestinationConfiguration</code>, or
  /// <code>SplunkDestinationConfiguration</code>.
  ///
  /// When you specify <code>S3DestinationConfiguration</code>, you can also
  /// provide the following optional values: BufferingHints,
  /// <code>EncryptionConfiguration</code>, and <code>CompressionFormat</code>.
  /// By default, if no <code>BufferingHints</code> value is provided, Kinesis
  /// Data Firehose buffers data up to 5 MB or for 5 minutes, whichever
  /// condition is satisfied first. <code>BufferingHints</code> is a hint, so
  /// there are some cases where the service cannot adhere to these conditions
  /// strictly. For example, record boundaries might be such that the size is a
  /// little over or under the configured buffering size. By default, no
  /// encryption is performed. We strongly recommend that you enable encryption
  /// to ensure secure data storage in Amazon S3.
  ///
  /// A few notes about Amazon Redshift as a destination:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Redshift destination requires an S3 bucket as intermediate
  /// location. Kinesis Data Firehose first delivers data to Amazon S3 and then
  /// uses <code>COPY</code> syntax to load data into an Amazon Redshift table.
  /// This is specified in the
  /// <code>RedshiftDestinationConfiguration.S3Configuration</code> parameter.
  /// </li>
  /// <li>
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified in <code>RedshiftDestinationConfiguration.S3Configuration</code>
  /// because the Amazon Redshift <code>COPY</code> operation that reads from
  /// the S3 bucket doesn't support these compression formats.
  /// </li>
  /// <li>
  /// We strongly recommend that you use the user name and password you provide
  /// exclusively with Kinesis Data Firehose, and that the permissions for the
  /// account are restricted for Amazon Redshift <code>INSERT</code>
  /// permissions.
  /// </li>
  /// </ul>
  /// Kinesis Data Firehose assumes the IAM role that is configured as part of
  /// the destination. The role should allow the Kinesis Data Firehose principal
  /// to assume the role, and the role should have permissions that allow the
  /// service to deliver the data. For more information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant
  /// Kinesis Data Firehose Access to an Amazon S3 Destination</a> in the
  /// <i>Amazon Kinesis Data Firehose Developer Guide</i>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidKMSResourceException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream. This name must be unique per AWS account
  /// in the same AWS Region. If the delivery streams are in different accounts
  /// or different Regions, you can have multiple delivery streams with the same
  /// name.
  ///
  /// Parameter [deliveryStreamEncryptionConfigurationInput] :
  /// Used to specify the type and Amazon Resource Name (ARN) of the KMS key
  /// needed for Server-Side Encryption (SSE).
  ///
  /// Parameter [deliveryStreamType] :
  /// The delivery stream type. This parameter can be one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>DirectPut</code>: Provider applications access the delivery stream
  /// directly.
  /// </li>
  /// <li>
  /// <code>KinesisStreamAsSource</code>: The delivery stream uses a Kinesis
  /// data stream as a source.
  /// </li>
  /// </ul>
  ///
  /// Parameter [elasticsearchDestinationConfiguration] :
  /// The destination in Amazon ES. You can specify only one destination.
  ///
  /// Parameter [extendedS3DestinationConfiguration] :
  /// The destination in Amazon S3. You can specify only one destination.
  ///
  /// Parameter [httpEndpointDestinationConfiguration] :
  /// Enables configuring Kinesis Firehose to deliver data to any HTTP endpoint
  /// destination. You can specify only one destination.
  ///
  /// Parameter [kinesisStreamSourceConfiguration] :
  /// When a Kinesis data stream is used as the source for the delivery stream,
  /// a <a>KinesisStreamSourceConfiguration</a> containing the Kinesis data
  /// stream Amazon Resource Name (ARN) and the role ARN for the source stream.
  ///
  /// Parameter [redshiftDestinationConfiguration] :
  /// The destination in Amazon Redshift. You can specify only one destination.
  ///
  /// Parameter [s3DestinationConfiguration] :
  /// [Deprecated] The destination in Amazon S3. You can specify only one
  /// destination.
  ///
  /// Parameter [splunkDestinationConfiguration] :
  /// The destination in Splunk. You can specify only one destination.
  ///
  /// Parameter [tags] :
  /// A set of tags to assign to the delivery stream. A tag is a key-value pair
  /// that you can define and assign to AWS resources. Tags are metadata. For
  /// example, you can add friendly names and descriptions or other types of
  /// information that can help you distinguish the delivery stream. For more
  /// information about tags, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the AWS Billing and Cost Management User
  /// Guide.
  ///
  /// You can specify up to 50 tags when creating a delivery stream.
  Future<CreateDeliveryStreamOutput> createDeliveryStream({
    @_s.required String deliveryStreamName,
    DeliveryStreamEncryptionConfigurationInput
        deliveryStreamEncryptionConfigurationInput,
    DeliveryStreamType deliveryStreamType,
    ElasticsearchDestinationConfiguration elasticsearchDestinationConfiguration,
    ExtendedS3DestinationConfiguration extendedS3DestinationConfiguration,
    HttpEndpointDestinationConfiguration httpEndpointDestinationConfiguration,
    KinesisStreamSourceConfiguration kinesisStreamSourceConfiguration,
    RedshiftDestinationConfiguration redshiftDestinationConfiguration,
    S3DestinationConfiguration s3DestinationConfiguration,
    SplunkDestinationConfiguration splunkDestinationConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.CreateDeliveryStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        if (deliveryStreamEncryptionConfigurationInput != null)
          'DeliveryStreamEncryptionConfigurationInput':
              deliveryStreamEncryptionConfigurationInput,
        if (deliveryStreamType != null)
          'DeliveryStreamType': deliveryStreamType.toValue(),
        if (elasticsearchDestinationConfiguration != null)
          'ElasticsearchDestinationConfiguration':
              elasticsearchDestinationConfiguration,
        if (extendedS3DestinationConfiguration != null)
          'ExtendedS3DestinationConfiguration':
              extendedS3DestinationConfiguration,
        if (httpEndpointDestinationConfiguration != null)
          'HttpEndpointDestinationConfiguration':
              httpEndpointDestinationConfiguration,
        if (kinesisStreamSourceConfiguration != null)
          'KinesisStreamSourceConfiguration': kinesisStreamSourceConfiguration,
        if (redshiftDestinationConfiguration != null)
          'RedshiftDestinationConfiguration': redshiftDestinationConfiguration,
        if (s3DestinationConfiguration != null)
          'S3DestinationConfiguration': s3DestinationConfiguration,
        if (splunkDestinationConfiguration != null)
          'SplunkDestinationConfiguration': splunkDestinationConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDeliveryStreamOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a delivery stream and its data.
  ///
  /// To check the state of a delivery stream, use
  /// <a>DescribeDeliveryStream</a>. You can delete a delivery stream only if it
  /// is in one of the following states: <code>ACTIVE</code>,
  /// <code>DELETING</code>, <code>CREATING_FAILED</code>, or
  /// <code>DELETING_FAILED</code>. You can't delete a delivery stream that is
  /// in the <code>CREATING</code> state. While the deletion request is in
  /// process, the delivery stream is in the <code>DELETING</code> state.
  ///
  /// While the delivery stream is in the <code>DELETING</code> state, the
  /// service might continue to accept records, but it doesn't make any
  /// guarantees with respect to delivering the data. Therefore, as a best
  /// practice, first stop any applications that are sending records before you
  /// delete a delivery stream.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [allowForceDelete] :
  /// Set this to true if you want to delete the delivery stream even if Kinesis
  /// Data Firehose is unable to retire the grant for the CMK. Kinesis Data
  /// Firehose might be unable to retire the grant due to a customer error, such
  /// as when the CMK or the grant are in an invalid state. If you force
  /// deletion, you can then use the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a>
  /// operation to revoke the grant you gave to Kinesis Data Firehose. If a
  /// failure to retire the grant happens due to an AWS KMS issue, Kinesis Data
  /// Firehose keeps retrying the delete operation.
  ///
  /// The default value is false.
  Future<void> deleteDeliveryStream({
    @_s.required String deliveryStreamName,
    bool allowForceDelete,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.DeleteDeliveryStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        if (allowForceDelete != null) 'AllowForceDelete': allowForceDelete,
      },
    );

    return DeleteDeliveryStreamOutput.fromJson(jsonResponse.body);
  }

  /// Describes the specified delivery stream and its status. For example, after
  /// your delivery stream is created, call <code>DescribeDeliveryStream</code>
  /// to see whether the delivery stream is <code>ACTIVE</code> and therefore
  /// ready for data to be sent to it.
  ///
  /// If the status of a delivery stream is <code>CREATING_FAILED</code>, this
  /// status doesn't change, and you can't invoke <a>CreateDeliveryStream</a>
  /// again on it. However, you can invoke the <a>DeleteDeliveryStream</a>
  /// operation to delete it. If the status is <code>DELETING_FAILED</code>, you
  /// can force deletion by invoking <a>DeleteDeliveryStream</a> again but with
  /// <a>DeleteDeliveryStreamInput$AllowForceDelete</a> set to true.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [exclusiveStartDestinationId] :
  /// The ID of the destination to start returning the destination information.
  /// Kinesis Data Firehose supports one destination per delivery stream.
  ///
  /// Parameter [limit] :
  /// The limit on the number of destinations to return. You can have one
  /// destination per delivery stream.
  Future<DescribeDeliveryStreamOutput> describeDeliveryStream({
    @_s.required String deliveryStreamName,
    String exclusiveStartDestinationId,
    int limit,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'exclusiveStartDestinationId',
      exclusiveStartDestinationId,
      1,
      100,
    );
    _s.validateStringPattern(
      'exclusiveStartDestinationId',
      exclusiveStartDestinationId,
      r'''[a-zA-Z0-9-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.DescribeDeliveryStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        if (exclusiveStartDestinationId != null)
          'ExclusiveStartDestinationId': exclusiveStartDestinationId,
        if (limit != null) 'Limit': limit,
      },
    );

    return DescribeDeliveryStreamOutput.fromJson(jsonResponse.body);
  }

  /// Lists your delivery streams in alphabetical order of their names.
  ///
  /// The number of delivery streams might be too large to return using a single
  /// call to <code>ListDeliveryStreams</code>. You can limit the number of
  /// delivery streams returned, using the <code>Limit</code> parameter. To
  /// determine whether there are more delivery streams to list, check the value
  /// of <code>HasMoreDeliveryStreams</code> in the output. If there are more
  /// delivery streams to list, you can request them by calling this operation
  /// again and setting the <code>ExclusiveStartDeliveryStreamName</code>
  /// parameter to the name of the last delivery stream returned in the last
  /// call.
  ///
  /// Parameter [deliveryStreamType] :
  /// The delivery stream type. This can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>DirectPut</code>: Provider applications access the delivery stream
  /// directly.
  /// </li>
  /// <li>
  /// <code>KinesisStreamAsSource</code>: The delivery stream uses a Kinesis
  /// data stream as a source.
  /// </li>
  /// </ul>
  /// This parameter is optional. If this parameter is omitted, delivery streams
  /// of all types are returned.
  ///
  /// Parameter [exclusiveStartDeliveryStreamName] :
  /// The list of delivery streams returned by this call to
  /// <code>ListDeliveryStreams</code> will start with the delivery stream whose
  /// name comes alphabetically immediately after the name you specify in
  /// <code>ExclusiveStartDeliveryStreamName</code>.
  ///
  /// Parameter [limit] :
  /// The maximum number of delivery streams to list. The default value is 10.
  Future<ListDeliveryStreamsOutput> listDeliveryStreams({
    DeliveryStreamType deliveryStreamType,
    String exclusiveStartDeliveryStreamName,
    int limit,
  }) async {
    _s.validateStringLength(
      'exclusiveStartDeliveryStreamName',
      exclusiveStartDeliveryStreamName,
      1,
      64,
    );
    _s.validateStringPattern(
      'exclusiveStartDeliveryStreamName',
      exclusiveStartDeliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.ListDeliveryStreams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (deliveryStreamType != null)
          'DeliveryStreamType': deliveryStreamType.toValue(),
        if (exclusiveStartDeliveryStreamName != null)
          'ExclusiveStartDeliveryStreamName': exclusiveStartDeliveryStreamName,
        if (limit != null) 'Limit': limit,
      },
    );

    return ListDeliveryStreamsOutput.fromJson(jsonResponse.body);
  }

  /// Lists the tags for the specified delivery stream. This operation has a
  /// limit of five transactions per second per account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream whose tags you want to list.
  ///
  /// Parameter [exclusiveStartTagKey] :
  /// The key to use as the starting point for the list of tags. If you set this
  /// parameter, <code>ListTagsForDeliveryStream</code> gets all tags that occur
  /// after <code>ExclusiveStartTagKey</code>.
  ///
  /// Parameter [limit] :
  /// The number of tags to return. If this number is less than the total number
  /// of tags associated with the delivery stream, <code>HasMoreTags</code> is
  /// set to <code>true</code> in the response. To list additional tags, set
  /// <code>ExclusiveStartTagKey</code> to the last key in the response.
  Future<ListTagsForDeliveryStreamOutput> listTagsForDeliveryStream({
    @_s.required String deliveryStreamName,
    String exclusiveStartTagKey,
    int limit,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'exclusiveStartTagKey',
      exclusiveStartTagKey,
      1,
      128,
    );
    _s.validateStringPattern(
      'exclusiveStartTagKey',
      exclusiveStartTagKey,
      r'''^(?!aws:)[\p{L}\p{Z}\p{N}_.:\/=+\-@%]*$''',
    );
    _s.validateNumRange(
      'limit',
      limit,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.ListTagsForDeliveryStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        if (exclusiveStartTagKey != null)
          'ExclusiveStartTagKey': exclusiveStartTagKey,
        if (limit != null) 'Limit': limit,
      },
    );

    return ListTagsForDeliveryStreamOutput.fromJson(jsonResponse.body);
  }

  /// Writes a single data record into an Amazon Kinesis Data Firehose delivery
  /// stream. To write multiple data records into a delivery stream, use
  /// <a>PutRecordBatch</a>. Applications using these operations are referred to
  /// as producers.
  ///
  /// By default, each delivery stream can take in up to 2,000 transactions per
  /// second, 5,000 records per second, or 5 MB per second. If you use
  /// <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate
  /// across these two operations for each delivery stream. For more information
  /// about limits and how to request an increase, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon
  /// Kinesis Data Firehose Limits</a>.
  ///
  /// You must specify the name of the delivery stream and the data record when
  /// using <a>PutRecord</a>. The data record consists of a data blob that can
  /// be up to 1,000 KB in size, and any kind of data. For example, it can be a
  /// segment from a log file, geographic location data, website clickstream
  /// data, and so on.
  ///
  /// Kinesis Data Firehose buffers records before delivering them to the
  /// destination. To disambiguate the data blobs at the destination, a common
  /// solution is to use delimiters in the data, such as a newline
  /// (<code>\n</code>) or some other character unique within the data. This
  /// allows the consumer application to parse individual data items when
  /// reading the data from the destination.
  ///
  /// The <code>PutRecord</code> operation returns a <code>RecordId</code>,
  /// which is a unique string assigned to each record. Producer applications
  /// can use this ID for purposes such as auditability and investigation.
  ///
  /// If the <code>PutRecord</code> operation throws a
  /// <code>ServiceUnavailableException</code>, back off and retry. If the
  /// exception persists, it is possible that the throughput limits have been
  /// exceeded for the delivery stream.
  ///
  /// Data records sent to Kinesis Data Firehose are stored for 24 hours from
  /// the time they are added to a delivery stream as it tries to send the
  /// records to the destination. If the destination is unreachable for more
  /// than 24 hours, the data is no longer available.
  /// <important>
  /// Don't concatenate two or more base64 strings to form the data fields of
  /// your records. Instead, concatenate the raw data, then perform base64
  /// encoding.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidKMSResourceException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [record] :
  /// The record.
  Future<PutRecordOutput> putRecord({
    @_s.required String deliveryStreamName,
    @_s.required Record record,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(record, 'record');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.PutRecord'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        'Record': record,
      },
    );

    return PutRecordOutput.fromJson(jsonResponse.body);
  }

  /// Writes multiple data records into a delivery stream in a single call,
  /// which can achieve higher throughput per producer than when writing single
  /// records. To write single data records into a delivery stream, use
  /// <a>PutRecord</a>. Applications using these operations are referred to as
  /// producers.
  ///
  /// For information about service quota, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon
  /// Kinesis Data Firehose Quota</a>.
  ///
  /// Each <a>PutRecordBatch</a> request supports up to 500 records. Each record
  /// in the request can be as large as 1,000 KB (before 64-bit encoding), up to
  /// a limit of 4 MB for the entire request. These limits cannot be changed.
  ///
  /// You must specify the name of the delivery stream and the data record when
  /// using <a>PutRecord</a>. The data record consists of a data blob that can
  /// be up to 1,000 KB in size, and any kind of data. For example, it could be
  /// a segment from a log file, geographic location data, website clickstream
  /// data, and so on.
  ///
  /// Kinesis Data Firehose buffers records before delivering them to the
  /// destination. To disambiguate the data blobs at the destination, a common
  /// solution is to use delimiters in the data, such as a newline
  /// (<code>\n</code>) or some other character unique within the data. This
  /// allows the consumer application to parse individual data items when
  /// reading the data from the destination.
  ///
  /// The <a>PutRecordBatch</a> response includes a count of failed records,
  /// <code>FailedPutCount</code>, and an array of responses,
  /// <code>RequestResponses</code>. Even if the <a>PutRecordBatch</a> call
  /// succeeds, the value of <code>FailedPutCount</code> may be greater than 0,
  /// indicating that there are records for which the operation didn't succeed.
  /// Each entry in the <code>RequestResponses</code> array provides additional
  /// information about the processed record. It directly correlates with a
  /// record in the request array using the same ordering, from the top to the
  /// bottom. The response array always includes the same number of records as
  /// the request array. <code>RequestResponses</code> includes both
  /// successfully and unsuccessfully processed records. Kinesis Data Firehose
  /// tries to process all records in each <a>PutRecordBatch</a> request. A
  /// single record failure does not stop the processing of subsequent records.
  ///
  /// A successfully processed record includes a <code>RecordId</code> value,
  /// which is unique for the record. An unsuccessfully processed record
  /// includes <code>ErrorCode</code> and <code>ErrorMessage</code> values.
  /// <code>ErrorCode</code> reflects the type of error, and is one of the
  /// following values: <code>ServiceUnavailableException</code> or
  /// <code>InternalFailure</code>. <code>ErrorMessage</code> provides more
  /// detailed information about the error.
  ///
  /// If there is an internal server error or a timeout, the write might have
  /// completed or it might have failed. If <code>FailedPutCount</code> is
  /// greater than 0, retry the request, resending only those records that might
  /// have failed processing. This minimizes the possible duplicate records and
  /// also reduces the total bytes sent (and corresponding charges). We
  /// recommend that you handle any duplicates at the destination.
  ///
  /// If <a>PutRecordBatch</a> throws <code>ServiceUnavailableException</code>,
  /// back off and retry. If the exception persists, it is possible that the
  /// throughput limits have been exceeded for the delivery stream.
  ///
  /// Data records sent to Kinesis Data Firehose are stored for 24 hours from
  /// the time they are added to a delivery stream as it attempts to send the
  /// records to the destination. If the destination is unreachable for more
  /// than 24 hours, the data is no longer available.
  /// <important>
  /// Don't concatenate two or more base64 strings to form the data fields of
  /// your records. Instead, concatenate the raw data, then perform base64
  /// encoding.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidKMSResourceException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [records] :
  /// One or more records.
  Future<PutRecordBatchOutput> putRecordBatch({
    @_s.required String deliveryStreamName,
    @_s.required List<Record> records,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(records, 'records');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.PutRecordBatch'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        'Records': records,
      },
    );

    return PutRecordBatchOutput.fromJson(jsonResponse.body);
  }

  /// Enables server-side encryption (SSE) for the delivery stream.
  ///
  /// This operation is asynchronous. It returns immediately. When you invoke
  /// it, Kinesis Data Firehose first sets the encryption status of the stream
  /// to <code>ENABLING</code>, and then to <code>ENABLED</code>. The encryption
  /// status of a delivery stream is the <code>Status</code> property in
  /// <a>DeliveryStreamEncryptionConfiguration</a>. If the operation fails, the
  /// encryption status changes to <code>ENABLING_FAILED</code>. You can
  /// continue to read and write data to your delivery stream while the
  /// encryption status is <code>ENABLING</code>, but the data is not encrypted.
  /// It can take up to 5 seconds after the encryption status changes to
  /// <code>ENABLED</code> before all records written to the delivery stream are
  /// encrypted. To find out whether a record or a batch of records was
  /// encrypted, check the response elements <a>PutRecordOutput$Encrypted</a>
  /// and <a>PutRecordBatchOutput$Encrypted</a>, respectively.
  ///
  /// To check the encryption status of a delivery stream, use
  /// <a>DescribeDeliveryStream</a>.
  ///
  /// Even if encryption is currently enabled for a delivery stream, you can
  /// still invoke this operation on it to change the ARN of the CMK or both its
  /// type and ARN. If you invoke this method to change the CMK, and the old CMK
  /// is of type <code>CUSTOMER_MANAGED_CMK</code>, Kinesis Data Firehose
  /// schedules the grant it had on the old CMK for retirement. If the new CMK
  /// is of type <code>CUSTOMER_MANAGED_CMK</code>, Kinesis Data Firehose
  /// creates a grant that enables it to use the new CMK to encrypt and decrypt
  /// data and to manage the grant.
  ///
  /// If a delivery stream already has encryption enabled and then you invoke
  /// this operation to change the ARN of the CMK or both its type and ARN and
  /// you get <code>ENABLING_FAILED</code>, this only means that the attempt to
  /// change the CMK failed. In this case, encryption remains enabled with the
  /// old CMK.
  ///
  /// If the encryption status of your delivery stream is
  /// <code>ENABLING_FAILED</code>, you can invoke this operation again with a
  /// valid CMK. The CMK must be enabled and the key policy mustn't explicitly
  /// deny the permission for Kinesis Data Firehose to invoke KMS encrypt and
  /// decrypt operations.
  ///
  /// You can enable SSE for a delivery stream only if it's a delivery stream
  /// that uses <code>DirectPut</code> as its source.
  ///
  /// The <code>StartDeliveryStreamEncryption</code> and
  /// <code>StopDeliveryStreamEncryption</code> operations have a combined limit
  /// of 25 calls per delivery stream per 24 hours. For example, you reach the
  /// limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and
  /// <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery
  /// stream in a 24-hour period.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidKMSResourceException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream for which you want to enable server-side
  /// encryption (SSE).
  ///
  /// Parameter [deliveryStreamEncryptionConfigurationInput] :
  /// Used to specify the type and Amazon Resource Name (ARN) of the KMS key
  /// needed for Server-Side Encryption (SSE).
  Future<void> startDeliveryStreamEncryption({
    @_s.required String deliveryStreamName,
    DeliveryStreamEncryptionConfigurationInput
        deliveryStreamEncryptionConfigurationInput,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.StartDeliveryStreamEncryption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        if (deliveryStreamEncryptionConfigurationInput != null)
          'DeliveryStreamEncryptionConfigurationInput':
              deliveryStreamEncryptionConfigurationInput,
      },
    );

    return StartDeliveryStreamEncryptionOutput.fromJson(jsonResponse.body);
  }

  /// Disables server-side encryption (SSE) for the delivery stream.
  ///
  /// This operation is asynchronous. It returns immediately. When you invoke
  /// it, Kinesis Data Firehose first sets the encryption status of the stream
  /// to <code>DISABLING</code>, and then to <code>DISABLED</code>. You can
  /// continue to read and write data to your stream while its status is
  /// <code>DISABLING</code>. It can take up to 5 seconds after the encryption
  /// status changes to <code>DISABLED</code> before all records written to the
  /// delivery stream are no longer subject to encryption. To find out whether a
  /// record or a batch of records was encrypted, check the response elements
  /// <a>PutRecordOutput$Encrypted</a> and
  /// <a>PutRecordBatchOutput$Encrypted</a>, respectively.
  ///
  /// To check the encryption state of a delivery stream, use
  /// <a>DescribeDeliveryStream</a>.
  ///
  /// If SSE is enabled using a customer managed CMK and then you invoke
  /// <code>StopDeliveryStreamEncryption</code>, Kinesis Data Firehose schedules
  /// the related KMS grant for retirement and then retires it after it ensures
  /// that it is finished delivering records to the destination.
  ///
  /// The <code>StartDeliveryStreamEncryption</code> and
  /// <code>StopDeliveryStreamEncryption</code> operations have a combined limit
  /// of 25 calls per delivery stream per 24 hours. For example, you reach the
  /// limit if you call <code>StartDeliveryStreamEncryption</code> 13 times and
  /// <code>StopDeliveryStreamEncryption</code> 12 times for the same delivery
  /// stream in a 24-hour period.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream for which you want to disable server-side
  /// encryption (SSE).
  Future<void> stopDeliveryStreamEncryption({
    @_s.required String deliveryStreamName,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.StopDeliveryStreamEncryption'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
      },
    );

    return StopDeliveryStreamEncryptionOutput.fromJson(jsonResponse.body);
  }

  /// Adds or updates tags for the specified delivery stream. A tag is a
  /// key-value pair that you can define and assign to AWS resources. If you
  /// specify a tag that already exists, the tag value is replaced with the
  /// value that you specify in the request. Tags are metadata. For example, you
  /// can add friendly names and descriptions or other types of information that
  /// can help you distinguish the delivery stream. For more information about
  /// tags, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  ///
  /// Each delivery stream can have up to 50 tags.
  ///
  /// This operation has a limit of five transactions per second per account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream to which you want to add the tags.
  ///
  /// Parameter [tags] :
  /// A set of key-value pairs to use to create the tags.
  Future<void> tagDeliveryStream({
    @_s.required String deliveryStreamName,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.TagDeliveryStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        'Tags': tags,
      },
    );

    return TagDeliveryStreamOutput.fromJson(jsonResponse.body);
  }

  /// Removes tags from the specified delivery stream. Removed tags are deleted,
  /// and you can't recover them after this operation successfully completes.
  ///
  /// If you specify a tag that doesn't exist, the operation ignores it.
  ///
  /// This operation has a limit of five transactions per second per account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Each corresponding tag is removed from the delivery
  /// stream.
  Future<void> untagDeliveryStream({
    @_s.required String deliveryStreamName,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.UntagDeliveryStream'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
        'TagKeys': tagKeys,
      },
    );

    return UntagDeliveryStreamOutput.fromJson(jsonResponse.body);
  }

  /// Updates the specified destination of the specified delivery stream.
  ///
  /// Use this operation to change the destination type (for example, to replace
  /// the Amazon S3 destination with Amazon Redshift) or change the parameters
  /// associated with a destination (for example, to change the bucket name of
  /// the Amazon S3 destination). The update might not occur immediately. The
  /// target delivery stream remains active while the configurations are
  /// updated, so data writes to the delivery stream can continue during this
  /// process. The updated configurations are usually effective within a few
  /// minutes.
  ///
  /// Switching between Amazon ES and other services is not supported. For an
  /// Amazon ES destination, you can only update to another Amazon ES
  /// destination.
  ///
  /// If the destination type is the same, Kinesis Data Firehose merges the
  /// configuration parameters specified with the destination configuration that
  /// already exists on the delivery stream. If any of the parameters are not
  /// specified in the call, the existing values are retained. For example, in
  /// the Amazon S3 destination, if <a>EncryptionConfiguration</a> is not
  /// specified, then the existing <code>EncryptionConfiguration</code> is
  /// maintained on the destination.
  ///
  /// If the destination type is not the same, for example, changing the
  /// destination from Amazon S3 to Amazon Redshift, Kinesis Data Firehose does
  /// not merge any parameters. In this case, all parameters must be specified.
  ///
  /// Kinesis Data Firehose uses <code>CurrentDeliveryStreamVersionId</code> to
  /// avoid race conditions and conflicting merges. This is a required field,
  /// and the service updates the configuration only if the existing
  /// configuration has a version ID that matches. After the update is applied
  /// successfully, the version ID is updated, and can be retrieved using
  /// <a>DescribeDeliveryStream</a>. Use the new version ID to set
  /// <code>CurrentDeliveryStreamVersionId</code> in the next call.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConcurrentModificationException].
  ///
  /// Parameter [currentDeliveryStreamVersionId] :
  /// Obtain this value from the <code>VersionId</code> result of
  /// <a>DeliveryStreamDescription</a>. This value is required, and helps the
  /// service perform conditional operations. For example, if there is an
  /// interleaving update and this value is null, then the update destination
  /// fails. After the update is successful, the <code>VersionId</code> value is
  /// updated. The service then performs a merge of the old configuration with
  /// the new configuration.
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [destinationId] :
  /// The ID of the destination.
  ///
  /// Parameter [elasticsearchDestinationUpdate] :
  /// Describes an update for a destination in Amazon ES.
  ///
  /// Parameter [extendedS3DestinationUpdate] :
  /// Describes an update for a destination in Amazon S3.
  ///
  /// Parameter [httpEndpointDestinationUpdate] :
  /// Describes an update to the specified HTTP endpoint destination.
  ///
  /// Parameter [redshiftDestinationUpdate] :
  /// Describes an update for a destination in Amazon Redshift.
  ///
  /// Parameter [s3DestinationUpdate] :
  /// [Deprecated] Describes an update for a destination in Amazon S3.
  ///
  /// Parameter [splunkDestinationUpdate] :
  /// Describes an update for a destination in Splunk.
  Future<void> updateDestination({
    @_s.required String currentDeliveryStreamVersionId,
    @_s.required String deliveryStreamName,
    @_s.required String destinationId,
    ElasticsearchDestinationUpdate elasticsearchDestinationUpdate,
    ExtendedS3DestinationUpdate extendedS3DestinationUpdate,
    HttpEndpointDestinationUpdate httpEndpointDestinationUpdate,
    RedshiftDestinationUpdate redshiftDestinationUpdate,
    S3DestinationUpdate s3DestinationUpdate,
    SplunkDestinationUpdate splunkDestinationUpdate,
  }) async {
    ArgumentError.checkNotNull(
        currentDeliveryStreamVersionId, 'currentDeliveryStreamVersionId');
    _s.validateStringLength(
      'currentDeliveryStreamVersionId',
      currentDeliveryStreamVersionId,
      1,
      50,
      isRequired: true,
    );
    _s.validateStringPattern(
      'currentDeliveryStreamVersionId',
      currentDeliveryStreamVersionId,
      r'''[0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(deliveryStreamName, 'deliveryStreamName');
    _s.validateStringLength(
      'deliveryStreamName',
      deliveryStreamName,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'deliveryStreamName',
      deliveryStreamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(destinationId, 'destinationId');
    _s.validateStringLength(
      'destinationId',
      destinationId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'destinationId',
      destinationId,
      r'''[a-zA-Z0-9-]+''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.UpdateDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CurrentDeliveryStreamVersionId': currentDeliveryStreamVersionId,
        'DeliveryStreamName': deliveryStreamName,
        'DestinationId': destinationId,
        if (elasticsearchDestinationUpdate != null)
          'ElasticsearchDestinationUpdate': elasticsearchDestinationUpdate,
        if (extendedS3DestinationUpdate != null)
          'ExtendedS3DestinationUpdate': extendedS3DestinationUpdate,
        if (httpEndpointDestinationUpdate != null)
          'HttpEndpointDestinationUpdate': httpEndpointDestinationUpdate,
        if (redshiftDestinationUpdate != null)
          'RedshiftDestinationUpdate': redshiftDestinationUpdate,
        if (s3DestinationUpdate != null)
          'S3DestinationUpdate': s3DestinationUpdate,
        if (splunkDestinationUpdate != null)
          'SplunkDestinationUpdate': splunkDestinationUpdate,
      },
    );

    return UpdateDestinationOutput.fromJson(jsonResponse.body);
  }
}

/// Describes hints for the buffering to perform before delivering data to the
/// destination. These options are treated as hints, and therefore Kinesis Data
/// Firehose might choose to use different values when it is optimal. The
/// <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are
/// optional. However, if specify a value for one of them, you must also provide
/// a value for the other.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300. This parameter
  /// is optional but if you specify a value for it, you must also specify a value
  /// for <code>SizeInMBs</code>, and vice versa.
  @_s.JsonKey(name: 'IntervalInSeconds')
  final int intervalInSeconds;

  /// Buffer incoming data to the specified size, in MiBs, before delivering it to
  /// the destination. The default value is 5. This parameter is optional but if
  /// you specify a value for it, you must also specify a value for
  /// <code>IntervalInSeconds</code>, and vice versa.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MiB/sec, the value should be 10
  /// MiB or higher.
  @_s.JsonKey(name: 'SizeInMBs')
  final int sizeInMBs;

  BufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });
  factory BufferingHints.fromJson(Map<String, dynamic> json) =>
      _$BufferingHintsFromJson(json);

  Map<String, dynamic> toJson() => _$BufferingHintsToJson(this);
}

/// Describes the Amazon CloudWatch logging options for your delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchLoggingOptions {
  /// Enables or disables CloudWatch logging.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The CloudWatch group name for logging. This value is required if CloudWatch
  /// logging is enabled.
  @_s.JsonKey(name: 'LogGroupName')
  final String logGroupName;

  /// The CloudWatch log stream name for logging. This value is required if
  /// CloudWatch logging is enabled.
  @_s.JsonKey(name: 'LogStreamName')
  final String logStreamName;

  CloudWatchLoggingOptions({
    this.enabled,
    this.logGroupName,
    this.logStreamName,
  });
  factory CloudWatchLoggingOptions.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchLoggingOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchLoggingOptionsToJson(this);
}

enum CompressionFormat {
  @_s.JsonValue('UNCOMPRESSED')
  uncompressed,
  @_s.JsonValue('GZIP')
  gzip,
  @_s.JsonValue('ZIP')
  zip,
  @_s.JsonValue('Snappy')
  snappy,
  @_s.JsonValue('HADOOP_SNAPPY')
  hadoopSnappy,
}

enum ContentEncoding {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('GZIP')
  gzip,
}

/// Describes a <code>COPY</code> command for Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CopyCommand {
  /// The name of the target table. The table must already exist in the database.
  @_s.JsonKey(name: 'DataTableName')
  final String dataTableName;

  /// Optional parameters to use with the Amazon Redshift <code>COPY</code>
  /// command. For more information, see the "Optional Parameters" section of <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html">Amazon
  /// Redshift COPY command</a>. Some possible examples that would apply to
  /// Kinesis Data Firehose are as follows:
  ///
  /// <code>delimiter '\t' lzop;</code> - fields are delimited with "\t" (TAB
  /// character) and compressed using lzop.
  ///
  /// <code>delimiter '|'</code> - fields are delimited with "|" (this is the
  /// default delimiter).
  ///
  /// <code>delimiter '|' escape</code> - the delimiter should be escaped.
  ///
  /// <code>fixedwidth
  /// 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6'</code> -
  /// fields are fixed width in the source, with each width specified after every
  /// column in the table.
  ///
  /// <code>JSON 's3://mybucket/jsonpaths.txt'</code> - data is in JSON format,
  /// and the path specified is the format of the data.
  ///
  /// For more examples, see <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_COPY_command_examples.html">Amazon
  /// Redshift COPY command examples</a>.
  @_s.JsonKey(name: 'CopyOptions')
  final String copyOptions;

  /// A comma-separated list of column names.
  @_s.JsonKey(name: 'DataTableColumns')
  final String dataTableColumns;

  CopyCommand({
    @_s.required this.dataTableName,
    this.copyOptions,
    this.dataTableColumns,
  });
  factory CopyCommand.fromJson(Map<String, dynamic> json) =>
      _$CopyCommandFromJson(json);

  Map<String, dynamic> toJson() => _$CopyCommandToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeliveryStreamOutput {
  /// The ARN of the delivery stream.
  @_s.JsonKey(name: 'DeliveryStreamARN')
  final String deliveryStreamARN;

  CreateDeliveryStreamOutput({
    this.deliveryStreamARN,
  });
  factory CreateDeliveryStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateDeliveryStreamOutputFromJson(json);
}

/// Specifies that you want Kinesis Data Firehose to convert data from the JSON
/// format to the Parquet or ORC format before writing it to Amazon S3. Kinesis
/// Data Firehose uses the serializer and deserializer that you specify, in
/// addition to the column information from the AWS Glue table, to deserialize
/// your input data from JSON and then serialize it to the Parquet or ORC
/// format. For more information, see <a
/// href="https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html">Kinesis
/// Data Firehose Record Format Conversion</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataFormatConversionConfiguration {
  /// Defaults to <code>true</code>. Set it to <code>false</code> if you want to
  /// disable format conversion while preserving the configuration details.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// Specifies the deserializer that you want Kinesis Data Firehose to use to
  /// convert the format of your data from JSON. This parameter is required if
  /// <code>Enabled</code> is set to true.
  @_s.JsonKey(name: 'InputFormatConfiguration')
  final InputFormatConfiguration inputFormatConfiguration;

  /// Specifies the serializer that you want Kinesis Data Firehose to use to
  /// convert the format of your data to the Parquet or ORC format. This parameter
  /// is required if <code>Enabled</code> is set to true.
  @_s.JsonKey(name: 'OutputFormatConfiguration')
  final OutputFormatConfiguration outputFormatConfiguration;

  /// Specifies the AWS Glue Data Catalog table that contains the column
  /// information. This parameter is required if <code>Enabled</code> is set to
  /// true.
  @_s.JsonKey(name: 'SchemaConfiguration')
  final SchemaConfiguration schemaConfiguration;

  DataFormatConversionConfiguration({
    this.enabled,
    this.inputFormatConfiguration,
    this.outputFormatConfiguration,
    this.schemaConfiguration,
  });
  factory DataFormatConversionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$DataFormatConversionConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DataFormatConversionConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDeliveryStreamOutput {
  DeleteDeliveryStreamOutput();
  factory DeleteDeliveryStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteDeliveryStreamOutputFromJson(json);
}

/// Contains information about a delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeliveryStreamDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'DeliveryStreamARN')
  final String deliveryStreamARN;

  /// The name of the delivery stream.
  @_s.JsonKey(name: 'DeliveryStreamName')
  final String deliveryStreamName;

  /// The status of the delivery stream. If the status of a delivery stream is
  /// <code>CREATING_FAILED</code>, this status doesn't change, and you can't
  /// invoke <code>CreateDeliveryStream</code> again on it. However, you can
  /// invoke the <a>DeleteDeliveryStream</a> operation to delete it.
  @_s.JsonKey(name: 'DeliveryStreamStatus')
  final DeliveryStreamStatus deliveryStreamStatus;

  /// The delivery stream type. This can be one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>DirectPut</code>: Provider applications access the delivery stream
  /// directly.
  /// </li>
  /// <li>
  /// <code>KinesisStreamAsSource</code>: The delivery stream uses a Kinesis data
  /// stream as a source.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DeliveryStreamType')
  final DeliveryStreamType deliveryStreamType;

  /// The destinations.
  @_s.JsonKey(name: 'Destinations')
  final List<DestinationDescription> destinations;

  /// Indicates whether there are more destinations available to list.
  @_s.JsonKey(name: 'HasMoreDestinations')
  final bool hasMoreDestinations;

  /// Each time the destination is updated for a delivery stream, the version ID
  /// is changed, and the current version ID is required when updating the
  /// destination. This is so that the service knows it is applying the changes to
  /// the correct version of the delivery stream.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  /// The date and time that the delivery stream was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreateTimestamp')
  final DateTime createTimestamp;

  /// Indicates the server-side encryption (SSE) status for the delivery stream.
  @_s.JsonKey(name: 'DeliveryStreamEncryptionConfiguration')
  final DeliveryStreamEncryptionConfiguration
      deliveryStreamEncryptionConfiguration;

  /// Provides details in case one of the following operations fails due to an
  /// error related to KMS: <a>CreateDeliveryStream</a>,
  /// <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>,
  /// <a>StopDeliveryStreamEncryption</a>.
  @_s.JsonKey(name: 'FailureDescription')
  final FailureDescription failureDescription;

  /// The date and time that the delivery stream was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTimestamp')
  final DateTime lastUpdateTimestamp;

  /// If the <code>DeliveryStreamType</code> parameter is
  /// <code>KinesisStreamAsSource</code>, a <a>SourceDescription</a> object
  /// describing the source Kinesis data stream.
  @_s.JsonKey(name: 'Source')
  final SourceDescription source;

  DeliveryStreamDescription({
    @_s.required this.deliveryStreamARN,
    @_s.required this.deliveryStreamName,
    @_s.required this.deliveryStreamStatus,
    @_s.required this.deliveryStreamType,
    @_s.required this.destinations,
    @_s.required this.hasMoreDestinations,
    @_s.required this.versionId,
    this.createTimestamp,
    this.deliveryStreamEncryptionConfiguration,
    this.failureDescription,
    this.lastUpdateTimestamp,
    this.source,
  });
  factory DeliveryStreamDescription.fromJson(Map<String, dynamic> json) =>
      _$DeliveryStreamDescriptionFromJson(json);
}

/// Contains information about the server-side encryption (SSE) status for the
/// delivery stream, the type customer master key (CMK) in use, if any, and the
/// ARN of the CMK. You can get
/// <code>DeliveryStreamEncryptionConfiguration</code> by invoking the
/// <a>DescribeDeliveryStream</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeliveryStreamEncryptionConfiguration {
  /// Provides details in case one of the following operations fails due to an
  /// error related to KMS: <a>CreateDeliveryStream</a>,
  /// <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>,
  /// <a>StopDeliveryStreamEncryption</a>.
  @_s.JsonKey(name: 'FailureDescription')
  final FailureDescription failureDescription;

  /// If <code>KeyType</code> is <code>CUSTOMER_MANAGED_CMK</code>, this field
  /// contains the ARN of the customer managed CMK. If <code>KeyType</code> is
  /// <code>AWS_OWNED_CMK</code>,
  /// <code>DeliveryStreamEncryptionConfiguration</code> doesn't contain a value
  /// for <code>KeyARN</code>.
  @_s.JsonKey(name: 'KeyARN')
  final String keyARN;

  /// Indicates the type of customer master key (CMK) that is used for encryption.
  /// The default setting is <code>AWS_OWNED_CMK</code>. For more information
  /// about CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">Customer
  /// Master Keys (CMKs)</a>.
  @_s.JsonKey(name: 'KeyType')
  final KeyType keyType;

  /// This is the server-side encryption (SSE) status for the delivery stream. For
  /// a full description of the different values of this status, see
  /// <a>StartDeliveryStreamEncryption</a> and
  /// <a>StopDeliveryStreamEncryption</a>. If this status is
  /// <code>ENABLING_FAILED</code> or <code>DISABLING_FAILED</code>, it is the
  /// status of the most recent attempt to enable or disable SSE, respectively.
  @_s.JsonKey(name: 'Status')
  final DeliveryStreamEncryptionStatus status;

  DeliveryStreamEncryptionConfiguration({
    this.failureDescription,
    this.keyARN,
    this.keyType,
    this.status,
  });
  factory DeliveryStreamEncryptionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$DeliveryStreamEncryptionConfigurationFromJson(json);
}

/// Specifies the type and Amazon Resource Name (ARN) of the CMK to use for
/// Server-Side Encryption (SSE).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeliveryStreamEncryptionConfigurationInput {
  /// Indicates the type of customer master key (CMK) to use for encryption. The
  /// default setting is <code>AWS_OWNED_CMK</code>. For more information about
  /// CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">Customer
  /// Master Keys (CMKs)</a>. When you invoke <a>CreateDeliveryStream</a> or
  /// <a>StartDeliveryStreamEncryption</a> with <code>KeyType</code> set to
  /// CUSTOMER_MANAGED_CMK, Kinesis Data Firehose invokes the Amazon KMS operation
  /// <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateGrant.html">CreateGrant</a>
  /// to create a grant that allows the Kinesis Data Firehose service to use the
  /// customer managed CMK to perform encryption and decryption. Kinesis Data
  /// Firehose manages that grant.
  ///
  /// When you invoke <a>StartDeliveryStreamEncryption</a> to change the CMK for a
  /// delivery stream that is encrypted with a customer managed CMK, Kinesis Data
  /// Firehose schedules the grant it had on the old CMK for retirement.
  ///
  /// You can use a CMK of type CUSTOMER_MANAGED_CMK to encrypt up to 500 delivery
  /// streams. If a <a>CreateDeliveryStream</a> or
  /// <a>StartDeliveryStreamEncryption</a> operation exceeds this limit, Kinesis
  /// Data Firehose throws a <code>LimitExceededException</code>.
  /// <important>
  /// To encrypt your delivery stream, use symmetric CMKs. Kinesis Data Firehose
  /// doesn't support asymmetric CMKs. For information about symmetric and
  /// asymmetric CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html">About
  /// Symmetric and Asymmetric CMKs</a> in the AWS Key Management Service
  /// developer guide.
  /// </important>
  @_s.JsonKey(name: 'KeyType')
  final KeyType keyType;

  /// If you set <code>KeyType</code> to <code>CUSTOMER_MANAGED_CMK</code>, you
  /// must specify the Amazon Resource Name (ARN) of the CMK. If you set
  /// <code>KeyType</code> to <code>AWS_OWNED_CMK</code>, Kinesis Data Firehose
  /// uses a service-account CMK.
  @_s.JsonKey(name: 'KeyARN')
  final String keyARN;

  DeliveryStreamEncryptionConfigurationInput({
    @_s.required this.keyType,
    this.keyARN,
  });
  Map<String, dynamic> toJson() =>
      _$DeliveryStreamEncryptionConfigurationInputToJson(this);
}

enum DeliveryStreamEncryptionStatus {
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('ENABLING')
  enabling,
  @_s.JsonValue('ENABLING_FAILED')
  enablingFailed,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('DISABLING')
  disabling,
  @_s.JsonValue('DISABLING_FAILED')
  disablingFailed,
}

enum DeliveryStreamFailureType {
  @_s.JsonValue('RETIRE_KMS_GRANT_FAILED')
  retireKmsGrantFailed,
  @_s.JsonValue('CREATE_KMS_GRANT_FAILED')
  createKmsGrantFailed,
  @_s.JsonValue('KMS_ACCESS_DENIED')
  kmsAccessDenied,
  @_s.JsonValue('DISABLED_KMS_KEY')
  disabledKmsKey,
  @_s.JsonValue('INVALID_KMS_KEY')
  invalidKmsKey,
  @_s.JsonValue('KMS_KEY_NOT_FOUND')
  kmsKeyNotFound,
  @_s.JsonValue('KMS_OPT_IN_REQUIRED')
  kmsOptInRequired,
  @_s.JsonValue('CREATE_ENI_FAILED')
  createEniFailed,
  @_s.JsonValue('DELETE_ENI_FAILED')
  deleteEniFailed,
  @_s.JsonValue('SUBNET_NOT_FOUND')
  subnetNotFound,
  @_s.JsonValue('SECURITY_GROUP_NOT_FOUND')
  securityGroupNotFound,
  @_s.JsonValue('ENI_ACCESS_DENIED')
  eniAccessDenied,
  @_s.JsonValue('SUBNET_ACCESS_DENIED')
  subnetAccessDenied,
  @_s.JsonValue('SECURITY_GROUP_ACCESS_DENIED')
  securityGroupAccessDenied,
  @_s.JsonValue('UNKNOWN_ERROR')
  unknownError,
}

enum DeliveryStreamStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATING_FAILED')
  creatingFailed,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETING_FAILED')
  deletingFailed,
  @_s.JsonValue('ACTIVE')
  active,
}

enum DeliveryStreamType {
  @_s.JsonValue('DirectPut')
  directPut,
  @_s.JsonValue('KinesisStreamAsSource')
  kinesisStreamAsSource,
}

extension on DeliveryStreamType {
  String toValue() {
    switch (this) {
      case DeliveryStreamType.directPut:
        return 'DirectPut';
      case DeliveryStreamType.kinesisStreamAsSource:
        return 'KinesisStreamAsSource';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDeliveryStreamOutput {
  /// Information about the delivery stream.
  @_s.JsonKey(name: 'DeliveryStreamDescription')
  final DeliveryStreamDescription deliveryStreamDescription;

  DescribeDeliveryStreamOutput({
    @_s.required this.deliveryStreamDescription,
  });
  factory DescribeDeliveryStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeDeliveryStreamOutputFromJson(json);
}

/// The deserializer you want Kinesis Data Firehose to use for converting the
/// input data from JSON. Kinesis Data Firehose then serializes the data to its
/// final format using the <a>Serializer</a>. Kinesis Data Firehose supports two
/// types of deserializers: the <a
/// href="https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-JSON">Apache
/// Hive JSON SerDe</a> and the <a
/// href="https://github.com/rcongiu/Hive-JSON-Serde">OpenX JSON SerDe</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Deserializer {
  /// The native Hive / HCatalog JsonSerDe. Used by Kinesis Data Firehose for
  /// deserializing data, which means converting it from the JSON format in
  /// preparation for serializing it to the Parquet or ORC format. This is one of
  /// two deserializers you can choose, depending on which one offers the
  /// functionality you need. The other option is the OpenX SerDe.
  @_s.JsonKey(name: 'HiveJsonSerDe')
  final HiveJsonSerDe hiveJsonSerDe;

  /// The OpenX SerDe. Used by Kinesis Data Firehose for deserializing data, which
  /// means converting it from the JSON format in preparation for serializing it
  /// to the Parquet or ORC format. This is one of two deserializers you can
  /// choose, depending on which one offers the functionality you need. The other
  /// option is the native Hive / HCatalog JsonSerDe.
  @_s.JsonKey(name: 'OpenXJsonSerDe')
  final OpenXJsonSerDe openXJsonSerDe;

  Deserializer({
    this.hiveJsonSerDe,
    this.openXJsonSerDe,
  });
  factory Deserializer.fromJson(Map<String, dynamic> json) =>
      _$DeserializerFromJson(json);

  Map<String, dynamic> toJson() => _$DeserializerToJson(this);
}

/// Describes the destination for a delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DestinationDescription {
  /// The ID of the destination.
  @_s.JsonKey(name: 'DestinationId')
  final String destinationId;

  /// The destination in Amazon ES.
  @_s.JsonKey(name: 'ElasticsearchDestinationDescription')
  final ElasticsearchDestinationDescription elasticsearchDestinationDescription;

  /// The destination in Amazon S3.
  @_s.JsonKey(name: 'ExtendedS3DestinationDescription')
  final ExtendedS3DestinationDescription extendedS3DestinationDescription;

  /// Describes the specified HTTP endpoint destination.
  @_s.JsonKey(name: 'HttpEndpointDestinationDescription')
  final HttpEndpointDestinationDescription httpEndpointDestinationDescription;

  /// The destination in Amazon Redshift.
  @_s.JsonKey(name: 'RedshiftDestinationDescription')
  final RedshiftDestinationDescription redshiftDestinationDescription;

  /// [Deprecated] The destination in Amazon S3.
  @_s.JsonKey(name: 'S3DestinationDescription')
  final S3DestinationDescription s3DestinationDescription;

  /// The destination in Splunk.
  @_s.JsonKey(name: 'SplunkDestinationDescription')
  final SplunkDestinationDescription splunkDestinationDescription;

  DestinationDescription({
    @_s.required this.destinationId,
    this.elasticsearchDestinationDescription,
    this.extendedS3DestinationDescription,
    this.httpEndpointDestinationDescription,
    this.redshiftDestinationDescription,
    this.s3DestinationDescription,
    this.splunkDestinationDescription,
  });
  factory DestinationDescription.fromJson(Map<String, dynamic> json) =>
      _$DestinationDescriptionFromJson(json);
}

/// Describes the buffering to perform before delivering data to the Amazon ES
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ElasticsearchBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300 (5 minutes).
  @_s.JsonKey(name: 'IntervalInSeconds')
  final int intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it to
  /// the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10 MB
  /// or higher.
  @_s.JsonKey(name: 'SizeInMBs')
  final int sizeInMBs;

  ElasticsearchBufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });
  factory ElasticsearchBufferingHints.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchBufferingHintsFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticsearchBufferingHintsToJson(this);
}

/// Describes the configuration of a destination in Amazon ES.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ElasticsearchDestinationConfiguration {
  /// The Elasticsearch index name.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data
  /// Firehose for calling the Amazon ES Configuration API and for indexing
  /// documents. For more information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant
  /// Kinesis Data Firehose Access to an Amazon S3 Destination</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The configuration for the backup Amazon S3 location.
  @_s.JsonKey(name: 'S3Configuration')
  final S3DestinationConfiguration s3Configuration;

  /// The buffering options. If no value is specified, the default values for
  /// <code>ElasticsearchBufferingHints</code> are used.
  @_s.JsonKey(name: 'BufferingHints')
  final ElasticsearchBufferingHints bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Specify either this
  /// <code>ClusterEndpoint</code> or the <code>DomainARN</code> field.
  @_s.JsonKey(name: 'ClusterEndpoint')
  final String clusterEndpoint;

  /// The ARN of the Amazon ES domain. The IAM role must have permissions
  /// for <code>DescribeElasticsearchDomain</code>,
  /// <code>DescribeElasticsearchDomains</code>, and
  /// <code>DescribeElasticsearchDomainConfig</code> after assuming the role
  /// specified in <b>RoleARN</b>. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Specify either <code>ClusterEndpoint</code> or <code>DomainARN</code>.
  @_s.JsonKey(name: 'DomainARN')
  final String domainARN;

  /// The Elasticsearch index rotation period. Index rotation appends a timestamp
  /// to the <code>IndexName</code> to facilitate the expiration of old data. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation">Index
  /// Rotation for the Amazon ES Destination</a>. The default value
  /// is <code>OneDay</code>.
  @_s.JsonKey(name: 'IndexRotationPeriod')
  final ElasticsearchIndexRotationPeriod indexRotationPeriod;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon ES. The default value is 300 (5 minutes).
  @_s.JsonKey(name: 'RetryOptions')
  final ElasticsearchRetryOptions retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When it is set to
  /// <code>FailedDocumentsOnly</code>, Kinesis Data Firehose writes any documents
  /// that could not be indexed to the configured Amazon S3 destination, with
  /// <code>elasticsearch-failed/</code> appended to the key prefix. When set to
  /// <code>AllDocuments</code>, Kinesis Data Firehose delivers all incoming
  /// records to Amazon S3, and also writes failed documents with
  /// <code>elasticsearch-failed/</code> appended to the prefix. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-s3-backup">Amazon
  /// S3 Backup for the Amazon ES Destination</a>. Default value is
  /// <code>FailedDocumentsOnly</code>.
  ///
  /// You can't change this backup mode after you create the delivery stream.
  @_s.JsonKey(name: 'S3BackupMode')
  final ElasticsearchS3BackupMode s3BackupMode;

  /// The Elasticsearch type name. For Elasticsearch 6.x, there can be only one
  /// type per index. If you try to specify a new type for an existing index that
  /// already has another type, Kinesis Data Firehose returns an error during run
  /// time.
  ///
  /// For Elasticsearch 7.x, don't specify a <code>TypeName</code>.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  /// The details of the VPC of the Amazon ES destination.
  @_s.JsonKey(name: 'VpcConfiguration')
  final VpcConfiguration vpcConfiguration;

  ElasticsearchDestinationConfiguration({
    @_s.required this.indexName,
    @_s.required this.roleARN,
    @_s.required this.s3Configuration,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.domainARN,
    this.indexRotationPeriod,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
    this.typeName,
    this.vpcConfiguration,
  });
  Map<String, dynamic> toJson() =>
      _$ElasticsearchDestinationConfigurationToJson(this);
}

/// The destination description in Amazon ES.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ElasticsearchDestinationDescription {
  /// The buffering options.
  @_s.JsonKey(name: 'BufferingHints')
  final ElasticsearchBufferingHints bufferingHints;

  /// The Amazon CloudWatch logging options.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Kinesis Data
  /// Firehose uses either this <code>ClusterEndpoint</code> or the
  /// <code>DomainARN</code> field to send data to Amazon ES.
  @_s.JsonKey(name: 'ClusterEndpoint')
  final String clusterEndpoint;

  /// The ARN of the Amazon ES domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Kinesis Data Firehose uses either <code>ClusterEndpoint</code> or
  /// <code>DomainARN</code> to send data to Amazon ES.
  @_s.JsonKey(name: 'DomainARN')
  final String domainARN;

  /// The Elasticsearch index name.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The Elasticsearch index rotation period
  @_s.JsonKey(name: 'IndexRotationPeriod')
  final ElasticsearchIndexRotationPeriod indexRotationPeriod;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon ES retry options.
  @_s.JsonKey(name: 'RetryOptions')
  final ElasticsearchRetryOptions retryOptions;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The Amazon S3 backup mode.
  @_s.JsonKey(name: 'S3BackupMode')
  final ElasticsearchS3BackupMode s3BackupMode;

  /// The Amazon S3 destination.
  @_s.JsonKey(name: 'S3DestinationDescription')
  final S3DestinationDescription s3DestinationDescription;

  /// The Elasticsearch type name. This applies to Elasticsearch 6.x and lower
  /// versions. For Elasticsearch 7.x, there's no value for <code>TypeName</code>.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  /// The details of the VPC of the Amazon ES destination.
  @_s.JsonKey(name: 'VpcConfigurationDescription')
  final VpcConfigurationDescription vpcConfigurationDescription;

  ElasticsearchDestinationDescription({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.domainARN,
    this.indexName,
    this.indexRotationPeriod,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
    this.s3DestinationDescription,
    this.typeName,
    this.vpcConfigurationDescription,
  });
  factory ElasticsearchDestinationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ElasticsearchDestinationDescriptionFromJson(json);
}

/// Describes an update for a destination in Amazon ES.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ElasticsearchDestinationUpdate {
  /// The buffering options. If no value is specified,
  /// <code>ElasticsearchBufferingHints</code> object default values are used.
  @_s.JsonKey(name: 'BufferingHints')
  final ElasticsearchBufferingHints bufferingHints;

  /// The CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Specify either this
  /// <code>ClusterEndpoint</code> or the <code>DomainARN</code> field.
  @_s.JsonKey(name: 'ClusterEndpoint')
  final String clusterEndpoint;

  /// The ARN of the Amazon ES domain. The IAM role must have permissions
  /// for <code>DescribeElasticsearchDomain</code>,
  /// <code>DescribeElasticsearchDomains</code>, and
  /// <code>DescribeElasticsearchDomainConfig</code> after assuming the IAM role
  /// specified in <code>RoleARN</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  ///
  /// Specify either <code>ClusterEndpoint</code> or <code>DomainARN</code>.
  @_s.JsonKey(name: 'DomainARN')
  final String domainARN;

  /// The Elasticsearch index name.
  @_s.JsonKey(name: 'IndexName')
  final String indexName;

  /// The Elasticsearch index rotation period. Index rotation appends a timestamp
  /// to <code>IndexName</code> to facilitate the expiration of old data. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation">Index
  /// Rotation for the Amazon ES Destination</a>. Default value
  /// is <code>OneDay</code>.
  @_s.JsonKey(name: 'IndexRotationPeriod')
  final ElasticsearchIndexRotationPeriod indexRotationPeriod;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon ES. The default value is 300 (5 minutes).
  @_s.JsonKey(name: 'RetryOptions')
  final ElasticsearchRetryOptions retryOptions;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Kinesis Data
  /// Firehose for calling the Amazon ES Configuration API and for indexing
  /// documents. For more information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant
  /// Kinesis Data Firehose Access to an Amazon S3 Destination</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The Amazon S3 destination.
  @_s.JsonKey(name: 'S3Update')
  final S3DestinationUpdate s3Update;

  /// The Elasticsearch type name. For Elasticsearch 6.x, there can be only one
  /// type per index. If you try to specify a new type for an existing index that
  /// already has another type, Kinesis Data Firehose returns an error during
  /// runtime.
  ///
  /// If you upgrade Elasticsearch from 6.x to 7.x and don’t update your delivery
  /// stream, Kinesis Data Firehose still delivers data to Elasticsearch with the
  /// old index name and type name. If you want to update your delivery stream
  /// with a new index name, provide an empty string for <code>TypeName</code>.
  @_s.JsonKey(name: 'TypeName')
  final String typeName;

  ElasticsearchDestinationUpdate({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.domainARN,
    this.indexName,
    this.indexRotationPeriod,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3Update,
    this.typeName,
  });
  Map<String, dynamic> toJson() => _$ElasticsearchDestinationUpdateToJson(this);
}

enum ElasticsearchIndexRotationPeriod {
  @_s.JsonValue('NoRotation')
  noRotation,
  @_s.JsonValue('OneHour')
  oneHour,
  @_s.JsonValue('OneDay')
  oneDay,
  @_s.JsonValue('OneWeek')
  oneWeek,
  @_s.JsonValue('OneMonth')
  oneMonth,
}

/// Configures retry behavior in case Kinesis Data Firehose is unable to deliver
/// documents to Amazon ES.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ElasticsearchRetryOptions {
  /// After an initial failure to deliver to Amazon ES, the total amount of time
  /// during which Kinesis Data Firehose retries delivery (including the first
  /// attempt). After this time has elapsed, the failed documents are written to
  /// Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero)
  /// results in no retries.
  @_s.JsonKey(name: 'DurationInSeconds')
  final int durationInSeconds;

  ElasticsearchRetryOptions({
    this.durationInSeconds,
  });
  factory ElasticsearchRetryOptions.fromJson(Map<String, dynamic> json) =>
      _$ElasticsearchRetryOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticsearchRetryOptionsToJson(this);
}

enum ElasticsearchS3BackupMode {
  @_s.JsonValue('FailedDocumentsOnly')
  failedDocumentsOnly,
  @_s.JsonValue('AllDocuments')
  allDocuments,
}

/// Describes the encryption for a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionConfiguration {
  /// The encryption key.
  @_s.JsonKey(name: 'KMSEncryptionConfig')
  final KMSEncryptionConfig kMSEncryptionConfig;

  /// Specifically override existing encryption information to ensure that no
  /// encryption is used.
  @_s.JsonKey(name: 'NoEncryptionConfig')
  final NoEncryptionConfig noEncryptionConfig;

  EncryptionConfiguration({
    this.kMSEncryptionConfig,
    this.noEncryptionConfig,
  });
  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionConfigurationToJson(this);
}

/// Describes the configuration of a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExtendedS3DestinationConfiguration {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The buffering option.
  @_s.JsonKey(name: 'BufferingHints')
  final BufferingHints bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// UNCOMPRESSED.
  @_s.JsonKey(name: 'CompressionFormat')
  final CompressionFormat compressionFormat;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  @_s.JsonKey(name: 'DataFormatConversionConfiguration')
  final DataFormatConversionConfiguration dataFormatConversionConfiguration;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name. For information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'ErrorOutputPrefix')
  final String errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The configuration for backup in Amazon S3.
  @_s.JsonKey(name: 'S3BackupConfiguration')
  final S3DestinationConfiguration s3BackupConfiguration;

  /// The Amazon S3 backup mode. After you create a delivery stream, you can
  /// update it to enable Amazon S3 backup if it is disabled. If backup is
  /// enabled, you can't update the delivery stream to disable it.
  @_s.JsonKey(name: 'S3BackupMode')
  final S3BackupMode s3BackupMode;

  ExtendedS3DestinationConfiguration({
    @_s.required this.bucketARN,
    @_s.required this.roleARN,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.compressionFormat,
    this.dataFormatConversionConfiguration,
    this.encryptionConfiguration,
    this.errorOutputPrefix,
    this.prefix,
    this.processingConfiguration,
    this.s3BackupConfiguration,
    this.s3BackupMode,
  });
  Map<String, dynamic> toJson() =>
      _$ExtendedS3DestinationConfigurationToJson(this);
}

/// Describes a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExtendedS3DestinationDescription {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The buffering option.
  @_s.JsonKey(name: 'BufferingHints')
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  @_s.JsonKey(name: 'CompressionFormat')
  final CompressionFormat compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  @_s.JsonKey(name: 'DataFormatConversionConfiguration')
  final DataFormatConversionConfiguration dataFormatConversionConfiguration;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name. For information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'ErrorOutputPrefix')
  final String errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The configuration for backup in Amazon S3.
  @_s.JsonKey(name: 'S3BackupDescription')
  final S3DestinationDescription s3BackupDescription;

  /// The Amazon S3 backup mode.
  @_s.JsonKey(name: 'S3BackupMode')
  final S3BackupMode s3BackupMode;

  ExtendedS3DestinationDescription({
    @_s.required this.bucketARN,
    @_s.required this.bufferingHints,
    @_s.required this.compressionFormat,
    @_s.required this.encryptionConfiguration,
    @_s.required this.roleARN,
    this.cloudWatchLoggingOptions,
    this.dataFormatConversionConfiguration,
    this.errorOutputPrefix,
    this.prefix,
    this.processingConfiguration,
    this.s3BackupDescription,
    this.s3BackupMode,
  });
  factory ExtendedS3DestinationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$ExtendedS3DestinationDescriptionFromJson(json);
}

/// Describes an update for a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ExtendedS3DestinationUpdate {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The buffering option.
  @_s.JsonKey(name: 'BufferingHints')
  final BufferingHints bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  @_s.JsonKey(name: 'CompressionFormat')
  final CompressionFormat compressionFormat;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  @_s.JsonKey(name: 'DataFormatConversionConfiguration')
  final DataFormatConversionConfiguration dataFormatConversionConfiguration;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name. For information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'ErrorOutputPrefix')
  final String errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// You can update a delivery stream to enable Amazon S3 backup if it is
  /// disabled. If backup is enabled, you can't update the delivery stream to
  /// disable it.
  @_s.JsonKey(name: 'S3BackupMode')
  final S3BackupMode s3BackupMode;

  /// The Amazon S3 destination for backup.
  @_s.JsonKey(name: 'S3BackupUpdate')
  final S3DestinationUpdate s3BackupUpdate;

  ExtendedS3DestinationUpdate({
    this.bucketARN,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.compressionFormat,
    this.dataFormatConversionConfiguration,
    this.encryptionConfiguration,
    this.errorOutputPrefix,
    this.prefix,
    this.processingConfiguration,
    this.roleARN,
    this.s3BackupMode,
    this.s3BackupUpdate,
  });
  Map<String, dynamic> toJson() => _$ExtendedS3DestinationUpdateToJson(this);
}

/// Provides details in case one of the following operations fails due to an
/// error related to KMS: <a>CreateDeliveryStream</a>,
/// <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>,
/// <a>StopDeliveryStreamEncryption</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailureDescription {
  /// A message providing details about the error that caused the failure.
  @_s.JsonKey(name: 'Details')
  final String details;

  /// The type of error that caused the failure.
  @_s.JsonKey(name: 'Type')
  final DeliveryStreamFailureType type;

  FailureDescription({
    @_s.required this.details,
    @_s.required this.type,
  });
  factory FailureDescription.fromJson(Map<String, dynamic> json) =>
      _$FailureDescriptionFromJson(json);
}

enum HECEndpointType {
  @_s.JsonValue('Raw')
  raw,
  @_s.JsonValue('Event')
  event,
}

/// The native Hive / HCatalog JsonSerDe. Used by Kinesis Data Firehose for
/// deserializing data, which means converting it from the JSON format in
/// preparation for serializing it to the Parquet or ORC format. This is one of
/// two deserializers you can choose, depending on which one offers the
/// functionality you need. The other option is the OpenX SerDe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HiveJsonSerDe {
  /// Indicates how you want Kinesis Data Firehose to parse the date and
  /// timestamps that may be present in your input data JSON. To specify these
  /// format strings, follow the pattern syntax of JodaTime's DateTimeFormat
  /// format strings. For more information, see <a
  /// href="https://www.joda.org/joda-time/apidocs/org/joda/time/format/DateTimeFormat.html">Class
  /// DateTimeFormat</a>. You can also use the special value <code>millis</code>
  /// to parse timestamps in epoch milliseconds. If you don't specify a format,
  /// Kinesis Data Firehose uses <code>java.sql.Timestamp::valueOf</code> by
  /// default.
  @_s.JsonKey(name: 'TimestampFormats')
  final List<String> timestampFormats;

  HiveJsonSerDe({
    this.timestampFormats,
  });
  factory HiveJsonSerDe.fromJson(Map<String, dynamic> json) =>
      _$HiveJsonSerDeFromJson(json);

  Map<String, dynamic> toJson() => _$HiveJsonSerDeToJson(this);
}

/// Describes the buffering options that can be applied before data is delivered
/// to the HTTP endpoint destination. Kinesis Data Firehose treats these options
/// as hints, and it might choose to use more optimal values. The
/// <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are
/// optional. However, if specify a value for one of them, you must also provide
/// a value for the other.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpEndpointBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300 (5 minutes).
  @_s.JsonKey(name: 'IntervalInSeconds')
  final int intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it to
  /// the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10 MB
  /// or higher.
  @_s.JsonKey(name: 'SizeInMBs')
  final int sizeInMBs;

  HttpEndpointBufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });
  factory HttpEndpointBufferingHints.fromJson(Map<String, dynamic> json) =>
      _$HttpEndpointBufferingHintsFromJson(json);

  Map<String, dynamic> toJson() => _$HttpEndpointBufferingHintsToJson(this);
}

/// Describes the metadata that's delivered to the specified HTTP endpoint
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpEndpointCommonAttribute {
  /// The name of the HTTP endpoint common attribute.
  @_s.JsonKey(name: 'AttributeName')
  final String attributeName;

  /// The value of the HTTP endpoint common attribute.
  @_s.JsonKey(name: 'AttributeValue')
  final String attributeValue;

  HttpEndpointCommonAttribute({
    @_s.required this.attributeName,
    @_s.required this.attributeValue,
  });
  factory HttpEndpointCommonAttribute.fromJson(Map<String, dynamic> json) =>
      _$HttpEndpointCommonAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$HttpEndpointCommonAttributeToJson(this);
}

/// Describes the configuration of the HTTP endpoint to which Kinesis Firehose
/// delivers data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpEndpointConfiguration {
  /// The URL of the HTTP endpoint selected as the destination.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// The access key required for Kinesis Firehose to authenticate with the HTTP
  /// endpoint selected as the destination.
  @_s.JsonKey(name: 'AccessKey')
  final String accessKey;

  /// The name of the HTTP endpoint selected as the destination.
  @_s.JsonKey(name: 'Name')
  final String name;

  HttpEndpointConfiguration({
    @_s.required this.url,
    this.accessKey,
    this.name,
  });
  Map<String, dynamic> toJson() => _$HttpEndpointConfigurationToJson(this);
}

/// Describes the HTTP endpoint selected as the destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HttpEndpointDescription {
  /// The name of the HTTP endpoint selected as the destination.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The URL of the HTTP endpoint selected as the destination.
  @_s.JsonKey(name: 'Url')
  final String url;

  HttpEndpointDescription({
    this.name,
    this.url,
  });
  factory HttpEndpointDescription.fromJson(Map<String, dynamic> json) =>
      _$HttpEndpointDescriptionFromJson(json);
}

/// Describes the configuration of the HTTP endpoint destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpEndpointDestinationConfiguration {
  /// The configuration of the HTTP endpoint selected as the destination.
  @_s.JsonKey(name: 'EndpointConfiguration')
  final HttpEndpointConfiguration endpointConfiguration;
  @_s.JsonKey(name: 'S3Configuration')
  final S3DestinationConfiguration s3Configuration;

  /// The buffering options that can be used before data is delivered to the
  /// specified destination. Kinesis Data Firehose treats these options as hints,
  /// and it might choose to use more optimal values. The <code>SizeInMBs</code>
  /// and <code>IntervalInSeconds</code> parameters are optional. However, if you
  /// specify a value for one of them, you must also provide a value for the
  /// other.
  @_s.JsonKey(name: 'BufferingHints')
  final HttpEndpointBufferingHints bufferingHints;
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The configuration of the requeste sent to the HTTP endpoint specified as the
  /// destination.
  @_s.JsonKey(name: 'RequestConfiguration')
  final HttpEndpointRequestConfiguration requestConfiguration;

  /// Describes the retry behavior in case Kinesis Data Firehose is unable to
  /// deliver data to the specified HTTP endpoint destination, or if it doesn't
  /// receive a valid acknowledgment of receipt from the specified HTTP endpoint
  /// destination.
  @_s.JsonKey(name: 'RetryOptions')
  final HttpEndpointRetryOptions retryOptions;

  /// Kinesis Data Firehose uses this IAM role for all the permissions that the
  /// delivery stream needs.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// Describes the S3 bucket backup options for the data that Kinesis Data
  /// Firehose delivers to the HTTP endpoint destination. You can back up all
  /// documents (<code>AllData</code>) or only the documents that Kinesis Data
  /// Firehose could not deliver to the specified HTTP endpoint destination
  /// (<code>FailedDataOnly</code>).
  @_s.JsonKey(name: 'S3BackupMode')
  final HttpEndpointS3BackupMode s3BackupMode;

  HttpEndpointDestinationConfiguration({
    @_s.required this.endpointConfiguration,
    @_s.required this.s3Configuration,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.requestConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
  });
  Map<String, dynamic> toJson() =>
      _$HttpEndpointDestinationConfigurationToJson(this);
}

/// Describes the HTTP endpoint destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HttpEndpointDestinationDescription {
  /// Describes buffering options that can be applied to the data before it is
  /// delivered to the HTTPS endpoint destination. Kinesis Data Firehose teats
  /// these options as hints, and it might choose to use more optimal values. The
  /// <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are
  /// optional. However, if specify a value for one of them, you must also provide
  /// a value for the other.
  @_s.JsonKey(name: 'BufferingHints')
  final HttpEndpointBufferingHints bufferingHints;
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The configuration of the specified HTTP endpoint destination.
  @_s.JsonKey(name: 'EndpointConfiguration')
  final HttpEndpointDescription endpointConfiguration;
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The configuration of request sent to the HTTP endpoint specified as the
  /// destination.
  @_s.JsonKey(name: 'RequestConfiguration')
  final HttpEndpointRequestConfiguration requestConfiguration;

  /// Describes the retry behavior in case Kinesis Data Firehose is unable to
  /// deliver data to the specified HTTP endpoint destination, or if it doesn't
  /// receive a valid acknowledgment of receipt from the specified HTTP endpoint
  /// destination.
  @_s.JsonKey(name: 'RetryOptions')
  final HttpEndpointRetryOptions retryOptions;

  /// Kinesis Data Firehose uses this IAM role for all the permissions that the
  /// delivery stream needs.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// Describes the S3 bucket backup options for the data that Kinesis Firehose
  /// delivers to the HTTP endpoint destination. You can back up all documents
  /// (<code>AllData</code>) or only the documents that Kinesis Data Firehose
  /// could not deliver to the specified HTTP endpoint destination
  /// (<code>FailedDataOnly</code>).
  @_s.JsonKey(name: 'S3BackupMode')
  final HttpEndpointS3BackupMode s3BackupMode;
  @_s.JsonKey(name: 'S3DestinationDescription')
  final S3DestinationDescription s3DestinationDescription;

  HttpEndpointDestinationDescription({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.endpointConfiguration,
    this.processingConfiguration,
    this.requestConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
    this.s3DestinationDescription,
  });
  factory HttpEndpointDestinationDescription.fromJson(
          Map<String, dynamic> json) =>
      _$HttpEndpointDestinationDescriptionFromJson(json);
}

/// Updates the specified HTTP endpoint destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HttpEndpointDestinationUpdate {
  /// Describes buffering options that can be applied to the data before it is
  /// delivered to the HTTPS endpoint destination. Kinesis Data Firehose teats
  /// these options as hints, and it might choose to use more optimal values. The
  /// <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are
  /// optional. However, if specify a value for one of them, you must also provide
  /// a value for the other.
  @_s.JsonKey(name: 'BufferingHints')
  final HttpEndpointBufferingHints bufferingHints;
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// Describes the configuration of the HTTP endpoint destination.
  @_s.JsonKey(name: 'EndpointConfiguration')
  final HttpEndpointConfiguration endpointConfiguration;
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The configuration of the request sent to the HTTP endpoint specified as the
  /// destination.
  @_s.JsonKey(name: 'RequestConfiguration')
  final HttpEndpointRequestConfiguration requestConfiguration;

  /// Describes the retry behavior in case Kinesis Data Firehose is unable to
  /// deliver data to the specified HTTP endpoint destination, or if it doesn't
  /// receive a valid acknowledgment of receipt from the specified HTTP endpoint
  /// destination.
  @_s.JsonKey(name: 'RetryOptions')
  final HttpEndpointRetryOptions retryOptions;

  /// Kinesis Data Firehose uses this IAM role for all the permissions that the
  /// delivery stream needs.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// Describes the S3 bucket backup options for the data that Kinesis Firehose
  /// delivers to the HTTP endpoint destination. You can back up all documents
  /// (<code>AllData</code>) or only the documents that Kinesis Data Firehose
  /// could not deliver to the specified HTTP endpoint destination
  /// (<code>FailedDataOnly</code>).
  @_s.JsonKey(name: 'S3BackupMode')
  final HttpEndpointS3BackupMode s3BackupMode;
  @_s.JsonKey(name: 'S3Update')
  final S3DestinationUpdate s3Update;

  HttpEndpointDestinationUpdate({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.endpointConfiguration,
    this.processingConfiguration,
    this.requestConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
    this.s3Update,
  });
  Map<String, dynamic> toJson() => _$HttpEndpointDestinationUpdateToJson(this);
}

/// The configuration of the HTTP endpoint request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpEndpointRequestConfiguration {
  /// Describes the metadata sent to the HTTP endpoint destination.
  @_s.JsonKey(name: 'CommonAttributes')
  final List<HttpEndpointCommonAttribute> commonAttributes;

  /// Kinesis Data Firehose uses the content encoding to compress the body of a
  /// request before sending the request to the destination. For more information,
  /// see <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Encoding">Content-Encoding</a>
  /// in MDN Web Docs, the official Mozilla documentation.
  @_s.JsonKey(name: 'ContentEncoding')
  final ContentEncoding contentEncoding;

  HttpEndpointRequestConfiguration({
    this.commonAttributes,
    this.contentEncoding,
  });
  factory HttpEndpointRequestConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$HttpEndpointRequestConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HttpEndpointRequestConfigurationToJson(this);
}

/// Describes the retry behavior in case Kinesis Data Firehose is unable to
/// deliver data to the specified HTTP endpoint destination, or if it doesn't
/// receive a valid acknowledgment of receipt from the specified HTTP endpoint
/// destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HttpEndpointRetryOptions {
  /// The total amount of time that Kinesis Data Firehose spends on retries. This
  /// duration starts after the initial attempt to send data to the custom
  /// destination via HTTPS endpoint fails. It doesn't include the periods during
  /// which Kinesis Data Firehose waits for acknowledgment from the specified
  /// destination after each attempt.
  @_s.JsonKey(name: 'DurationInSeconds')
  final int durationInSeconds;

  HttpEndpointRetryOptions({
    this.durationInSeconds,
  });
  factory HttpEndpointRetryOptions.fromJson(Map<String, dynamic> json) =>
      _$HttpEndpointRetryOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$HttpEndpointRetryOptionsToJson(this);
}

enum HttpEndpointS3BackupMode {
  @_s.JsonValue('FailedDataOnly')
  failedDataOnly,
  @_s.JsonValue('AllData')
  allData,
}

/// Specifies the deserializer you want to use to convert the format of the
/// input data. This parameter is required if <code>Enabled</code> is set to
/// true.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputFormatConfiguration {
  /// Specifies which deserializer to use. You can choose either the Apache Hive
  /// JSON SerDe or the OpenX JSON SerDe. If both are non-null, the server rejects
  /// the request.
  @_s.JsonKey(name: 'Deserializer')
  final Deserializer deserializer;

  InputFormatConfiguration({
    this.deserializer,
  });
  factory InputFormatConfiguration.fromJson(Map<String, dynamic> json) =>
      _$InputFormatConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$InputFormatConfigurationToJson(this);
}

/// Describes an encryption key for a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KMSEncryptionConfig {
  /// The Amazon Resource Name (ARN) of the encryption key. Must belong to the
  /// same AWS Region as the destination Amazon S3 bucket. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'AWSKMSKeyARN')
  final String awsKMSKeyARN;

  KMSEncryptionConfig({
    @_s.required this.awsKMSKeyARN,
  });
  factory KMSEncryptionConfig.fromJson(Map<String, dynamic> json) =>
      _$KMSEncryptionConfigFromJson(json);

  Map<String, dynamic> toJson() => _$KMSEncryptionConfigToJson(this);
}

enum KeyType {
  @_s.JsonValue('AWS_OWNED_CMK')
  awsOwnedCmk,
  @_s.JsonValue('CUSTOMER_MANAGED_CMK')
  customerManagedCmk,
}

/// The stream and role Amazon Resource Names (ARNs) for a Kinesis data stream
/// used as the source for a delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class KinesisStreamSourceConfiguration {
  /// The ARN of the source Kinesis data stream. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Kinesis Data Streams ARN Format</a>.
  @_s.JsonKey(name: 'KinesisStreamARN')
  final String kinesisStreamARN;

  /// The ARN of the role that provides access to the source Kinesis data stream.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS
  /// Identity and Access Management (IAM) ARN Format</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamSourceConfiguration({
    @_s.required this.kinesisStreamARN,
    @_s.required this.roleARN,
  });
  Map<String, dynamic> toJson() =>
      _$KinesisStreamSourceConfigurationToJson(this);
}

/// Details about a Kinesis data stream used as the source for a Kinesis Data
/// Firehose delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class KinesisStreamSourceDescription {
  /// Kinesis Data Firehose starts retrieving records from the Kinesis data stream
  /// starting with this timestamp.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DeliveryStartTimestamp')
  final DateTime deliveryStartTimestamp;

  /// The Amazon Resource Name (ARN) of the source Kinesis data stream. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Kinesis Data Streams ARN Format</a>.
  @_s.JsonKey(name: 'KinesisStreamARN')
  final String kinesisStreamARN;

  /// The ARN of the role used by the source Kinesis data stream. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">AWS
  /// Identity and Access Management (IAM) ARN Format</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  KinesisStreamSourceDescription({
    this.deliveryStartTimestamp,
    this.kinesisStreamARN,
    this.roleARN,
  });
  factory KinesisStreamSourceDescription.fromJson(Map<String, dynamic> json) =>
      _$KinesisStreamSourceDescriptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeliveryStreamsOutput {
  /// The names of the delivery streams.
  @_s.JsonKey(name: 'DeliveryStreamNames')
  final List<String> deliveryStreamNames;

  /// Indicates whether there are more delivery streams available to list.
  @_s.JsonKey(name: 'HasMoreDeliveryStreams')
  final bool hasMoreDeliveryStreams;

  ListDeliveryStreamsOutput({
    @_s.required this.deliveryStreamNames,
    @_s.required this.hasMoreDeliveryStreams,
  });
  factory ListDeliveryStreamsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListDeliveryStreamsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForDeliveryStreamOutput {
  /// If this is <code>true</code> in the response, more tags are available. To
  /// list the remaining tags, set <code>ExclusiveStartTagKey</code> to the key of
  /// the last tag returned and call <code>ListTagsForDeliveryStream</code> again.
  @_s.JsonKey(name: 'HasMoreTags')
  final bool hasMoreTags;

  /// A list of tags associated with <code>DeliveryStreamName</code>, starting
  /// with the first tag after <code>ExclusiveStartTagKey</code> and up to the
  /// specified <code>Limit</code>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForDeliveryStreamOutput({
    @_s.required this.hasMoreTags,
    @_s.required this.tags,
  });
  factory ListTagsForDeliveryStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForDeliveryStreamOutputFromJson(json);
}

enum NoEncryptionConfig {
  @_s.JsonValue('NoEncryption')
  noEncryption,
}

/// The OpenX SerDe. Used by Kinesis Data Firehose for deserializing data, which
/// means converting it from the JSON format in preparation for serializing it
/// to the Parquet or ORC format. This is one of two deserializers you can
/// choose, depending on which one offers the functionality you need. The other
/// option is the native Hive / HCatalog JsonSerDe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OpenXJsonSerDe {
  /// When set to <code>true</code>, which is the default, Kinesis Data Firehose
  /// converts JSON keys to lowercase before deserializing them.
  @_s.JsonKey(name: 'CaseInsensitive')
  final bool caseInsensitive;

  /// Maps column names to JSON keys that aren't identical to the column names.
  /// This is useful when the JSON contains keys that are Hive keywords. For
  /// example, <code>timestamp</code> is a Hive keyword. If you have a JSON key
  /// named <code>timestamp</code>, set this parameter to <code>{"ts":
  /// "timestamp"}</code> to map this key to a column named <code>ts</code>.
  @_s.JsonKey(name: 'ColumnToJsonKeyMappings')
  final Map<String, String> columnToJsonKeyMappings;

  /// When set to <code>true</code>, specifies that the names of the keys include
  /// dots and that you want Kinesis Data Firehose to replace them with
  /// underscores. This is useful because Apache Hive does not allow dots in
  /// column names. For example, if the JSON contains a key whose name is "a.b",
  /// you can define the column name to be "a_b" when using this option.
  ///
  /// The default is <code>false</code>.
  @_s.JsonKey(name: 'ConvertDotsInJsonKeysToUnderscores')
  final bool convertDotsInJsonKeysToUnderscores;

  OpenXJsonSerDe({
    this.caseInsensitive,
    this.columnToJsonKeyMappings,
    this.convertDotsInJsonKeysToUnderscores,
  });
  factory OpenXJsonSerDe.fromJson(Map<String, dynamic> json) =>
      _$OpenXJsonSerDeFromJson(json);

  Map<String, dynamic> toJson() => _$OpenXJsonSerDeToJson(this);
}

enum OrcCompression {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('ZLIB')
  zlib,
  @_s.JsonValue('SNAPPY')
  snappy,
}

enum OrcFormatVersion {
  @_s.JsonValue('V0_11')
  v0_11,
  @_s.JsonValue('V0_12')
  v0_12,
}

/// A serializer to use for converting data to the ORC format before storing it
/// in Amazon S3. For more information, see <a
/// href="https://orc.apache.org/docs/">Apache ORC</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OrcSerDe {
  /// The Hadoop Distributed File System (HDFS) block size. This is useful if you
  /// intend to copy the data from Amazon S3 to HDFS before querying. The default
  /// is 256 MiB and the minimum is 64 MiB. Kinesis Data Firehose uses this value
  /// for padding calculations.
  @_s.JsonKey(name: 'BlockSizeBytes')
  final int blockSizeBytes;

  /// The column names for which you want Kinesis Data Firehose to create bloom
  /// filters. The default is <code>null</code>.
  @_s.JsonKey(name: 'BloomFilterColumns')
  final List<String> bloomFilterColumns;

  /// The Bloom filter false positive probability (FPP). The lower the FPP, the
  /// bigger the Bloom filter. The default value is 0.05, the minimum is 0, and
  /// the maximum is 1.
  @_s.JsonKey(name: 'BloomFilterFalsePositiveProbability')
  final double bloomFilterFalsePositiveProbability;

  /// The compression code to use over data blocks. The default is
  /// <code>SNAPPY</code>.
  @_s.JsonKey(name: 'Compression')
  final OrcCompression compression;

  /// Represents the fraction of the total number of non-null rows. To turn off
  /// dictionary encoding, set this fraction to a number that is less than the
  /// number of distinct keys in a dictionary. To always use dictionary encoding,
  /// set this threshold to 1.
  @_s.JsonKey(name: 'DictionaryKeyThreshold')
  final double dictionaryKeyThreshold;

  /// Set this to <code>true</code> to indicate that you want stripes to be padded
  /// to the HDFS block boundaries. This is useful if you intend to copy the data
  /// from Amazon S3 to HDFS before querying. The default is <code>false</code>.
  @_s.JsonKey(name: 'EnablePadding')
  final bool enablePadding;

  /// The version of the file to write. The possible values are <code>V0_11</code>
  /// and <code>V0_12</code>. The default is <code>V0_12</code>.
  @_s.JsonKey(name: 'FormatVersion')
  final OrcFormatVersion formatVersion;

  /// A number between 0 and 1 that defines the tolerance for block padding as a
  /// decimal fraction of stripe size. The default value is 0.05, which means 5
  /// percent of stripe size.
  ///
  /// For the default values of 64 MiB ORC stripes and 256 MiB HDFS blocks, the
  /// default block padding tolerance of 5 percent reserves a maximum of 3.2 MiB
  /// for padding within the 256 MiB block. In such a case, if the available size
  /// within the block is more than 3.2 MiB, a new, smaller stripe is inserted to
  /// fit within that space. This ensures that no stripe crosses block boundaries
  /// and causes remote reads within a node-local task.
  ///
  /// Kinesis Data Firehose ignores this parameter when
  /// <a>OrcSerDe$EnablePadding</a> is <code>false</code>.
  @_s.JsonKey(name: 'PaddingTolerance')
  final double paddingTolerance;

  /// The number of rows between index entries. The default is 10,000 and the
  /// minimum is 1,000.
  @_s.JsonKey(name: 'RowIndexStride')
  final int rowIndexStride;

  /// The number of bytes in each stripe. The default is 64 MiB and the minimum is
  /// 8 MiB.
  @_s.JsonKey(name: 'StripeSizeBytes')
  final int stripeSizeBytes;

  OrcSerDe({
    this.blockSizeBytes,
    this.bloomFilterColumns,
    this.bloomFilterFalsePositiveProbability,
    this.compression,
    this.dictionaryKeyThreshold,
    this.enablePadding,
    this.formatVersion,
    this.paddingTolerance,
    this.rowIndexStride,
    this.stripeSizeBytes,
  });
  factory OrcSerDe.fromJson(Map<String, dynamic> json) =>
      _$OrcSerDeFromJson(json);

  Map<String, dynamic> toJson() => _$OrcSerDeToJson(this);
}

/// Specifies the serializer that you want Kinesis Data Firehose to use to
/// convert the format of your data before it writes it to Amazon S3. This
/// parameter is required if <code>Enabled</code> is set to true.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputFormatConfiguration {
  /// Specifies which serializer to use. You can choose either the ORC SerDe or
  /// the Parquet SerDe. If both are non-null, the server rejects the request.
  @_s.JsonKey(name: 'Serializer')
  final Serializer serializer;

  OutputFormatConfiguration({
    this.serializer,
  });
  factory OutputFormatConfiguration.fromJson(Map<String, dynamic> json) =>
      _$OutputFormatConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$OutputFormatConfigurationToJson(this);
}

enum ParquetCompression {
  @_s.JsonValue('UNCOMPRESSED')
  uncompressed,
  @_s.JsonValue('GZIP')
  gzip,
  @_s.JsonValue('SNAPPY')
  snappy,
}

/// A serializer to use for converting data to the Parquet format before storing
/// it in Amazon S3. For more information, see <a
/// href="https://parquet.apache.org/documentation/latest/">Apache Parquet</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParquetSerDe {
  /// The Hadoop Distributed File System (HDFS) block size. This is useful if you
  /// intend to copy the data from Amazon S3 to HDFS before querying. The default
  /// is 256 MiB and the minimum is 64 MiB. Kinesis Data Firehose uses this value
  /// for padding calculations.
  @_s.JsonKey(name: 'BlockSizeBytes')
  final int blockSizeBytes;

  /// The compression code to use over data blocks. The possible values are
  /// <code>UNCOMPRESSED</code>, <code>SNAPPY</code>, and <code>GZIP</code>, with
  /// the default being <code>SNAPPY</code>. Use <code>SNAPPY</code> for higher
  /// decompression speed. Use <code>GZIP</code> if the compression ratio is more
  /// important than speed.
  @_s.JsonKey(name: 'Compression')
  final ParquetCompression compression;

  /// Indicates whether to enable dictionary compression.
  @_s.JsonKey(name: 'EnableDictionaryCompression')
  final bool enableDictionaryCompression;

  /// The maximum amount of padding to apply. This is useful if you intend to copy
  /// the data from Amazon S3 to HDFS before querying. The default is 0.
  @_s.JsonKey(name: 'MaxPaddingBytes')
  final int maxPaddingBytes;

  /// The Parquet page size. Column chunks are divided into pages. A page is
  /// conceptually an indivisible unit (in terms of compression and encoding). The
  /// minimum value is 64 KiB and the default is 1 MiB.
  @_s.JsonKey(name: 'PageSizeBytes')
  final int pageSizeBytes;

  /// Indicates the version of row format to output. The possible values are
  /// <code>V1</code> and <code>V2</code>. The default is <code>V1</code>.
  @_s.JsonKey(name: 'WriterVersion')
  final ParquetWriterVersion writerVersion;

  ParquetSerDe({
    this.blockSizeBytes,
    this.compression,
    this.enableDictionaryCompression,
    this.maxPaddingBytes,
    this.pageSizeBytes,
    this.writerVersion,
  });
  factory ParquetSerDe.fromJson(Map<String, dynamic> json) =>
      _$ParquetSerDeFromJson(json);

  Map<String, dynamic> toJson() => _$ParquetSerDeToJson(this);
}

enum ParquetWriterVersion {
  @_s.JsonValue('V1')
  v1,
  @_s.JsonValue('V2')
  v2,
}

/// Describes a data processing configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingConfiguration {
  /// Enables or disables data processing.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;

  /// The data processors.
  @_s.JsonKey(name: 'Processors')
  final List<Processor> processors;

  ProcessingConfiguration({
    this.enabled,
    this.processors,
  });
  factory ProcessingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ProcessingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingConfigurationToJson(this);
}

/// Describes a data processor.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Processor {
  /// The type of processor.
  @_s.JsonKey(name: 'Type')
  final ProcessorType type;

  /// The processor parameters.
  @_s.JsonKey(name: 'Parameters')
  final List<ProcessorParameter> parameters;

  Processor({
    @_s.required this.type,
    this.parameters,
  });
  factory Processor.fromJson(Map<String, dynamic> json) =>
      _$ProcessorFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessorToJson(this);
}

/// Describes the processor parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessorParameter {
  /// The name of the parameter.
  @_s.JsonKey(name: 'ParameterName')
  final ProcessorParameterName parameterName;

  /// The parameter value.
  @_s.JsonKey(name: 'ParameterValue')
  final String parameterValue;

  ProcessorParameter({
    @_s.required this.parameterName,
    @_s.required this.parameterValue,
  });
  factory ProcessorParameter.fromJson(Map<String, dynamic> json) =>
      _$ProcessorParameterFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessorParameterToJson(this);
}

enum ProcessorParameterName {
  @_s.JsonValue('LambdaArn')
  lambdaArn,
  @_s.JsonValue('NumberOfRetries')
  numberOfRetries,
  @_s.JsonValue('RoleArn')
  roleArn,
  @_s.JsonValue('BufferSizeInMBs')
  bufferSizeInMBs,
  @_s.JsonValue('BufferIntervalInSeconds')
  bufferIntervalInSeconds,
}

enum ProcessorType {
  @_s.JsonValue('Lambda')
  lambda,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRecordBatchOutput {
  /// The number of records that might have failed processing. This number might
  /// be greater than 0 even if the <a>PutRecordBatch</a> call succeeds. Check
  /// <code>FailedPutCount</code> to determine whether there are records that you
  /// need to resend.
  @_s.JsonKey(name: 'FailedPutCount')
  final int failedPutCount;

  /// The results array. For each record, the index of the response element is the
  /// same as the index used in the request array.
  @_s.JsonKey(name: 'RequestResponses')
  final List<PutRecordBatchResponseEntry> requestResponses;

  /// Indicates whether server-side encryption (SSE) was enabled during this
  /// operation.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  PutRecordBatchOutput({
    @_s.required this.failedPutCount,
    @_s.required this.requestResponses,
    this.encrypted,
  });
  factory PutRecordBatchOutput.fromJson(Map<String, dynamic> json) =>
      _$PutRecordBatchOutputFromJson(json);
}

/// Contains the result for an individual record from a <a>PutRecordBatch</a>
/// request. If the record is successfully added to your delivery stream, it
/// receives a record ID. If the record fails to be added to your delivery
/// stream, the result includes an error code and an error message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRecordBatchResponseEntry {
  /// The error code for an individual record result.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message for an individual record result.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The ID of the record.
  @_s.JsonKey(name: 'RecordId')
  final String recordId;

  PutRecordBatchResponseEntry({
    this.errorCode,
    this.errorMessage,
    this.recordId,
  });
  factory PutRecordBatchResponseEntry.fromJson(Map<String, dynamic> json) =>
      _$PutRecordBatchResponseEntryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRecordOutput {
  /// The ID of the record.
  @_s.JsonKey(name: 'RecordId')
  final String recordId;

  /// Indicates whether server-side encryption (SSE) was enabled during this
  /// operation.
  @_s.JsonKey(name: 'Encrypted')
  final bool encrypted;

  PutRecordOutput({
    @_s.required this.recordId,
    this.encrypted,
  });
  factory PutRecordOutput.fromJson(Map<String, dynamic> json) =>
      _$PutRecordOutputFromJson(json);
}

/// The unit of data in a delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Record {
  /// The data blob, which is base64-encoded when the blob is serialized. The
  /// maximum size of the data blob, before base64-encoding, is 1,000 KiB.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Data')
  final Uint8List data;

  Record({
    @_s.required this.data,
  });
  Map<String, dynamic> toJson() => _$RecordToJson(this);
}

/// Describes the configuration of a destination in Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RedshiftDestinationConfiguration {
  /// The database connection string.
  @_s.JsonKey(name: 'ClusterJDBCURL')
  final String clusterJDBCURL;

  /// The <code>COPY</code> command.
  @_s.JsonKey(name: 'CopyCommand')
  final CopyCommand copyCommand;

  /// The user password.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The configuration for the intermediate Amazon S3 location from which Amazon
  /// Redshift obtains data. Restrictions are described in the topic for
  /// <a>CreateDeliveryStream</a>.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified in <code>RedshiftDestinationConfiguration.S3Configuration</code>
  /// because the Amazon Redshift <code>COPY</code> operation that reads from the
  /// S3 bucket doesn't support these compression formats.
  @_s.JsonKey(name: 'S3Configuration')
  final S3DestinationConfiguration s3Configuration;

  /// The name of the user.
  @_s.JsonKey(name: 'Username')
  final String username;

  /// The CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon Redshift. Default value is 3600 (60 minutes).
  @_s.JsonKey(name: 'RetryOptions')
  final RedshiftRetryOptions retryOptions;

  /// The configuration for backup in Amazon S3.
  @_s.JsonKey(name: 'S3BackupConfiguration')
  final S3DestinationConfiguration s3BackupConfiguration;

  /// The Amazon S3 backup mode. After you create a delivery stream, you can
  /// update it to enable Amazon S3 backup if it is disabled. If backup is
  /// enabled, you can't update the delivery stream to disable it.
  @_s.JsonKey(name: 'S3BackupMode')
  final RedshiftS3BackupMode s3BackupMode;

  RedshiftDestinationConfiguration({
    @_s.required this.clusterJDBCURL,
    @_s.required this.copyCommand,
    @_s.required this.password,
    @_s.required this.roleARN,
    @_s.required this.s3Configuration,
    @_s.required this.username,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupConfiguration,
    this.s3BackupMode,
  });
  Map<String, dynamic> toJson() =>
      _$RedshiftDestinationConfigurationToJson(this);
}

/// Describes a destination in Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RedshiftDestinationDescription {
  /// The database connection string.
  @_s.JsonKey(name: 'ClusterJDBCURL')
  final String clusterJDBCURL;

  /// The <code>COPY</code> command.
  @_s.JsonKey(name: 'CopyCommand')
  final CopyCommand copyCommand;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The Amazon S3 destination.
  @_s.JsonKey(name: 'S3DestinationDescription')
  final S3DestinationDescription s3DestinationDescription;

  /// The name of the user.
  @_s.JsonKey(name: 'Username')
  final String username;

  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon Redshift. Default value is 3600 (60 minutes).
  @_s.JsonKey(name: 'RetryOptions')
  final RedshiftRetryOptions retryOptions;

  /// The configuration for backup in Amazon S3.
  @_s.JsonKey(name: 'S3BackupDescription')
  final S3DestinationDescription s3BackupDescription;

  /// The Amazon S3 backup mode.
  @_s.JsonKey(name: 'S3BackupMode')
  final RedshiftS3BackupMode s3BackupMode;

  RedshiftDestinationDescription({
    @_s.required this.clusterJDBCURL,
    @_s.required this.copyCommand,
    @_s.required this.roleARN,
    @_s.required this.s3DestinationDescription,
    @_s.required this.username,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupDescription,
    this.s3BackupMode,
  });
  factory RedshiftDestinationDescription.fromJson(Map<String, dynamic> json) =>
      _$RedshiftDestinationDescriptionFromJson(json);
}

/// Describes an update for a destination in Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RedshiftDestinationUpdate {
  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The database connection string.
  @_s.JsonKey(name: 'ClusterJDBCURL')
  final String clusterJDBCURL;

  /// The <code>COPY</code> command.
  @_s.JsonKey(name: 'CopyCommand')
  final CopyCommand copyCommand;

  /// The user password.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver
  /// documents to Amazon Redshift. Default value is 3600 (60 minutes).
  @_s.JsonKey(name: 'RetryOptions')
  final RedshiftRetryOptions retryOptions;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// You can update a delivery stream to enable Amazon S3 backup if it is
  /// disabled. If backup is enabled, you can't update the delivery stream to
  /// disable it.
  @_s.JsonKey(name: 'S3BackupMode')
  final RedshiftS3BackupMode s3BackupMode;

  /// The Amazon S3 destination for backup.
  @_s.JsonKey(name: 'S3BackupUpdate')
  final S3DestinationUpdate s3BackupUpdate;

  /// The Amazon S3 destination.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified in <code>RedshiftDestinationUpdate.S3Update</code> because the
  /// Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket
  /// doesn't support these compression formats.
  @_s.JsonKey(name: 'S3Update')
  final S3DestinationUpdate s3Update;

  /// The name of the user.
  @_s.JsonKey(name: 'Username')
  final String username;

  RedshiftDestinationUpdate({
    this.cloudWatchLoggingOptions,
    this.clusterJDBCURL,
    this.copyCommand,
    this.password,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
    this.s3BackupUpdate,
    this.s3Update,
    this.username,
  });
  Map<String, dynamic> toJson() => _$RedshiftDestinationUpdateToJson(this);
}

/// Configures retry behavior in case Kinesis Data Firehose is unable to deliver
/// documents to Amazon Redshift.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RedshiftRetryOptions {
  /// The length of time during which Kinesis Data Firehose retries delivery after
  /// a failure, starting from the initial request and including the first
  /// attempt. The default value is 3600 seconds (60 minutes). Kinesis Data
  /// Firehose does not retry if the value of <code>DurationInSeconds</code> is 0
  /// (zero) or if the first delivery attempt takes longer than the current value.
  @_s.JsonKey(name: 'DurationInSeconds')
  final int durationInSeconds;

  RedshiftRetryOptions({
    this.durationInSeconds,
  });
  factory RedshiftRetryOptions.fromJson(Map<String, dynamic> json) =>
      _$RedshiftRetryOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$RedshiftRetryOptionsToJson(this);
}

enum RedshiftS3BackupMode {
  @_s.JsonValue('Disabled')
  disabled,
  @_s.JsonValue('Enabled')
  enabled,
}

enum S3BackupMode {
  @_s.JsonValue('Disabled')
  disabled,
  @_s.JsonValue('Enabled')
  enabled,
}

/// Describes the configuration of a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3DestinationConfiguration {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The buffering option. If no value is specified, <code>BufferingHints</code>
  /// object default values are used.
  @_s.JsonKey(name: 'BufferingHints')
  final BufferingHints bufferingHints;

  /// The CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified for Amazon Redshift destinations because they are not supported by
  /// the Amazon Redshift <code>COPY</code> operation that reads from the S3
  /// bucket.
  @_s.JsonKey(name: 'CompressionFormat')
  final CompressionFormat compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name. For information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'ErrorOutputPrefix')
  final String errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  S3DestinationConfiguration({
    @_s.required this.bucketARN,
    @_s.required this.roleARN,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.compressionFormat,
    this.encryptionConfiguration,
    this.errorOutputPrefix,
    this.prefix,
  });
  Map<String, dynamic> toJson() => _$S3DestinationConfigurationToJson(this);
}

/// Describes a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3DestinationDescription {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The buffering option. If no value is specified, <code>BufferingHints</code>
  /// object default values are used.
  @_s.JsonKey(name: 'BufferingHints')
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  @_s.JsonKey(name: 'CompressionFormat')
  final CompressionFormat compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name. For information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'ErrorOutputPrefix')
  final String errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  S3DestinationDescription({
    @_s.required this.bucketARN,
    @_s.required this.bufferingHints,
    @_s.required this.compressionFormat,
    @_s.required this.encryptionConfiguration,
    @_s.required this.roleARN,
    this.cloudWatchLoggingOptions,
    this.errorOutputPrefix,
    this.prefix,
  });
  factory S3DestinationDescription.fromJson(Map<String, dynamic> json) =>
      _$S3DestinationDescriptionFromJson(json);
}

/// Describes an update for a destination in Amazon S3.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class S3DestinationUpdate {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'BucketARN')
  final String bucketARN;

  /// The buffering option. If no value is specified, <code>BufferingHints</code>
  /// object default values are used.
  @_s.JsonKey(name: 'BufferingHints')
  final BufferingHints bufferingHints;

  /// The CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified for Amazon Redshift destinations because they are not supported by
  /// the Amazon Redshift <code>COPY</code> operation that reads from the S3
  /// bucket.
  @_s.JsonKey(name: 'CompressionFormat')
  final CompressionFormat compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  @_s.JsonKey(name: 'EncryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;

  /// A prefix that Kinesis Data Firehose evaluates and adds to failed records
  /// before writing them to S3. This prefix appears immediately following the
  /// bucket name. For information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'ErrorOutputPrefix')
  final String errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  @_s.JsonKey(name: 'Prefix')
  final String prefix;

  /// The Amazon Resource Name (ARN) of the AWS credentials. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and AWS Service Namespaces</a>.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  S3DestinationUpdate({
    this.bucketARN,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.compressionFormat,
    this.encryptionConfiguration,
    this.errorOutputPrefix,
    this.prefix,
    this.roleARN,
  });
  Map<String, dynamic> toJson() => _$S3DestinationUpdateToJson(this);
}

/// Specifies the schema to which you want Kinesis Data Firehose to configure
/// your data before it writes it to Amazon S3. This parameter is required if
/// <code>Enabled</code> is set to true.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SchemaConfiguration {
  /// The ID of the AWS Glue Data Catalog. If you don't supply this, the AWS
  /// account ID is used by default.
  @_s.JsonKey(name: 'CatalogId')
  final String catalogId;

  /// Specifies the name of the AWS Glue database that contains the schema for the
  /// output data.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// If you don't specify an AWS Region, the default is the current Region.
  @_s.JsonKey(name: 'Region')
  final String region;

  /// The role that Kinesis Data Firehose can use to access AWS Glue. This role
  /// must be in the same account you use for Kinesis Data Firehose. Cross-account
  /// roles aren't allowed.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// Specifies the AWS Glue table that contains the column information that
  /// constitutes your data schema.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  /// Specifies the table version for the output data schema. If you don't specify
  /// this version ID, or if you set it to <code>LATEST</code>, Kinesis Data
  /// Firehose uses the most recent version. This means that any updates to the
  /// table are automatically picked up.
  @_s.JsonKey(name: 'VersionId')
  final String versionId;

  SchemaConfiguration({
    this.catalogId,
    this.databaseName,
    this.region,
    this.roleARN,
    this.tableName,
    this.versionId,
  });
  factory SchemaConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SchemaConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaConfigurationToJson(this);
}

/// The serializer that you want Kinesis Data Firehose to use to convert data to
/// the target format before writing it to Amazon S3. Kinesis Data Firehose
/// supports two types of serializers: the <a
/// href="https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/orc/OrcSerde.html">ORC
/// SerDe</a> and the <a
/// href="https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/parquet/serde/ParquetHiveSerDe.html">Parquet
/// SerDe</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Serializer {
  /// A serializer to use for converting data to the ORC format before storing it
  /// in Amazon S3. For more information, see <a
  /// href="https://orc.apache.org/docs/">Apache ORC</a>.
  @_s.JsonKey(name: 'OrcSerDe')
  final OrcSerDe orcSerDe;

  /// A serializer to use for converting data to the Parquet format before storing
  /// it in Amazon S3. For more information, see <a
  /// href="https://parquet.apache.org/documentation/latest/">Apache Parquet</a>.
  @_s.JsonKey(name: 'ParquetSerDe')
  final ParquetSerDe parquetSerDe;

  Serializer({
    this.orcSerDe,
    this.parquetSerDe,
  });
  factory Serializer.fromJson(Map<String, dynamic> json) =>
      _$SerializerFromJson(json);

  Map<String, dynamic> toJson() => _$SerializerToJson(this);
}

/// Details about a Kinesis data stream used as the source for a Kinesis Data
/// Firehose delivery stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SourceDescription {
  /// The <a>KinesisStreamSourceDescription</a> value for the source Kinesis data
  /// stream.
  @_s.JsonKey(name: 'KinesisStreamSourceDescription')
  final KinesisStreamSourceDescription kinesisStreamSourceDescription;

  SourceDescription({
    this.kinesisStreamSourceDescription,
  });
  factory SourceDescription.fromJson(Map<String, dynamic> json) =>
      _$SourceDescriptionFromJson(json);
}

/// Describes the configuration of a destination in Splunk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SplunkDestinationConfiguration {
  /// The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose sends
  /// your data.
  @_s.JsonKey(name: 'HECEndpoint')
  final String hECEndpoint;

  /// This type can be either "Raw" or "Event."
  @_s.JsonKey(name: 'HECEndpointType')
  final HECEndpointType hECEndpointType;

  /// This is a GUID that you obtain from your Splunk cluster when you create a
  /// new HEC endpoint.
  @_s.JsonKey(name: 'HECToken')
  final String hECToken;

  /// The configuration for the backup Amazon S3 location.
  @_s.JsonKey(name: 'S3Configuration')
  final S3DestinationConfiguration s3Configuration;

  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The amount of time that Kinesis Data Firehose waits to receive an
  /// acknowledgment from Splunk after it sends it data. At the end of the timeout
  /// period, Kinesis Data Firehose either tries to send the data again or
  /// considers it an error, based on your retry settings.
  @_s.JsonKey(name: 'HECAcknowledgmentTimeoutInSeconds')
  final int hECAcknowledgmentTimeoutInSeconds;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver data
  /// to Splunk, or if it doesn't receive an acknowledgment of receipt from
  /// Splunk.
  @_s.JsonKey(name: 'RetryOptions')
  final SplunkRetryOptions retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When set to
  /// <code>FailedEventsOnly</code>, Kinesis Data Firehose writes any data that
  /// could not be indexed to the configured Amazon S3 destination. When set to
  /// <code>AllEvents</code>, Kinesis Data Firehose delivers all incoming records
  /// to Amazon S3, and also writes failed documents to Amazon S3. The default
  /// value is <code>FailedEventsOnly</code>.
  ///
  /// You can update this backup mode from <code>FailedEventsOnly</code> to
  /// <code>AllEvents</code>. You can't update it from <code>AllEvents</code> to
  /// <code>FailedEventsOnly</code>.
  @_s.JsonKey(name: 'S3BackupMode')
  final SplunkS3BackupMode s3BackupMode;

  SplunkDestinationConfiguration({
    @_s.required this.hECEndpoint,
    @_s.required this.hECEndpointType,
    @_s.required this.hECToken,
    @_s.required this.s3Configuration,
    this.cloudWatchLoggingOptions,
    this.hECAcknowledgmentTimeoutInSeconds,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
  });
  Map<String, dynamic> toJson() => _$SplunkDestinationConfigurationToJson(this);
}

/// Describes a destination in Splunk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SplunkDestinationDescription {
  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The amount of time that Kinesis Data Firehose waits to receive an
  /// acknowledgment from Splunk after it sends it data. At the end of the timeout
  /// period, Kinesis Data Firehose either tries to send the data again or
  /// considers it an error, based on your retry settings.
  @_s.JsonKey(name: 'HECAcknowledgmentTimeoutInSeconds')
  final int hECAcknowledgmentTimeoutInSeconds;

  /// The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose sends
  /// your data.
  @_s.JsonKey(name: 'HECEndpoint')
  final String hECEndpoint;

  /// This type can be either "Raw" or "Event."
  @_s.JsonKey(name: 'HECEndpointType')
  final HECEndpointType hECEndpointType;

  /// A GUID you obtain from your Splunk cluster when you create a new HEC
  /// endpoint.
  @_s.JsonKey(name: 'HECToken')
  final String hECToken;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver data
  /// to Splunk or if it doesn't receive an acknowledgment of receipt from Splunk.
  @_s.JsonKey(name: 'RetryOptions')
  final SplunkRetryOptions retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When set to
  /// <code>FailedDocumentsOnly</code>, Kinesis Data Firehose writes any data that
  /// could not be indexed to the configured Amazon S3 destination. When set to
  /// <code>AllDocuments</code>, Kinesis Data Firehose delivers all incoming
  /// records to Amazon S3, and also writes failed documents to Amazon S3. Default
  /// value is <code>FailedDocumentsOnly</code>.
  @_s.JsonKey(name: 'S3BackupMode')
  final SplunkS3BackupMode s3BackupMode;

  /// The Amazon S3 destination.&gt;
  @_s.JsonKey(name: 'S3DestinationDescription')
  final S3DestinationDescription s3DestinationDescription;

  SplunkDestinationDescription({
    this.cloudWatchLoggingOptions,
    this.hECAcknowledgmentTimeoutInSeconds,
    this.hECEndpoint,
    this.hECEndpointType,
    this.hECToken,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
    this.s3DestinationDescription,
  });
  factory SplunkDestinationDescription.fromJson(Map<String, dynamic> json) =>
      _$SplunkDestinationDescriptionFromJson(json);
}

/// Describes an update for a destination in Splunk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SplunkDestinationUpdate {
  /// The Amazon CloudWatch logging options for your delivery stream.
  @_s.JsonKey(name: 'CloudWatchLoggingOptions')
  final CloudWatchLoggingOptions cloudWatchLoggingOptions;

  /// The amount of time that Kinesis Data Firehose waits to receive an
  /// acknowledgment from Splunk after it sends data. At the end of the timeout
  /// period, Kinesis Data Firehose either tries to send the data again or
  /// considers it an error, based on your retry settings.
  @_s.JsonKey(name: 'HECAcknowledgmentTimeoutInSeconds')
  final int hECAcknowledgmentTimeoutInSeconds;

  /// The HTTP Event Collector (HEC) endpoint to which Kinesis Data Firehose sends
  /// your data.
  @_s.JsonKey(name: 'HECEndpoint')
  final String hECEndpoint;

  /// This type can be either "Raw" or "Event."
  @_s.JsonKey(name: 'HECEndpointType')
  final HECEndpointType hECEndpointType;

  /// A GUID that you obtain from your Splunk cluster when you create a new HEC
  /// endpoint.
  @_s.JsonKey(name: 'HECToken')
  final String hECToken;

  /// The data processing configuration.
  @_s.JsonKey(name: 'ProcessingConfiguration')
  final ProcessingConfiguration processingConfiguration;

  /// The retry behavior in case Kinesis Data Firehose is unable to deliver data
  /// to Splunk or if it doesn't receive an acknowledgment of receipt from Splunk.
  @_s.JsonKey(name: 'RetryOptions')
  final SplunkRetryOptions retryOptions;

  /// Specifies how you want Kinesis Data Firehose to back up documents to Amazon
  /// S3. When set to <code>FailedDocumentsOnly</code>, Kinesis Data Firehose
  /// writes any data that could not be indexed to the configured Amazon S3
  /// destination. When set to <code>AllEvents</code>, Kinesis Data Firehose
  /// delivers all incoming records to Amazon S3, and also writes failed documents
  /// to Amazon S3. The default value is <code>FailedEventsOnly</code>.
  ///
  /// You can update this backup mode from <code>FailedEventsOnly</code> to
  /// <code>AllEvents</code>. You can't update it from <code>AllEvents</code> to
  /// <code>FailedEventsOnly</code>.
  @_s.JsonKey(name: 'S3BackupMode')
  final SplunkS3BackupMode s3BackupMode;

  /// Your update to the configuration of the backup Amazon S3 location.
  @_s.JsonKey(name: 'S3Update')
  final S3DestinationUpdate s3Update;

  SplunkDestinationUpdate({
    this.cloudWatchLoggingOptions,
    this.hECAcknowledgmentTimeoutInSeconds,
    this.hECEndpoint,
    this.hECEndpointType,
    this.hECToken,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
    this.s3Update,
  });
  Map<String, dynamic> toJson() => _$SplunkDestinationUpdateToJson(this);
}

/// Configures retry behavior in case Kinesis Data Firehose is unable to deliver
/// documents to Splunk, or if it doesn't receive an acknowledgment from Splunk.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SplunkRetryOptions {
  /// The total amount of time that Kinesis Data Firehose spends on retries. This
  /// duration starts after the initial attempt to send data to Splunk fails. It
  /// doesn't include the periods during which Kinesis Data Firehose waits for
  /// acknowledgment from Splunk after each attempt.
  @_s.JsonKey(name: 'DurationInSeconds')
  final int durationInSeconds;

  SplunkRetryOptions({
    this.durationInSeconds,
  });
  factory SplunkRetryOptions.fromJson(Map<String, dynamic> json) =>
      _$SplunkRetryOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$SplunkRetryOptionsToJson(this);
}

enum SplunkS3BackupMode {
  @_s.JsonValue('FailedEventsOnly')
  failedEventsOnly,
  @_s.JsonValue('AllEvents')
  allEvents,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDeliveryStreamEncryptionOutput {
  StartDeliveryStreamEncryptionOutput();
  factory StartDeliveryStreamEncryptionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$StartDeliveryStreamEncryptionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopDeliveryStreamEncryptionOutput {
  StopDeliveryStreamEncryptionOutput();
  factory StopDeliveryStreamEncryptionOutput.fromJson(
          Map<String, dynamic> json) =>
      _$StopDeliveryStreamEncryptionOutputFromJson(json);
}

/// Metadata that you can assign to a delivery stream, consisting of a key-value
/// pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A unique identifier for the tag. Maximum length: 128 characters. Valid
  /// characters: Unicode letters, digits, white space, _ . / = + - % @
  @_s.JsonKey(name: 'Key')
  final String key;

  /// An optional string, which you can use to describe or define the tag. Maximum
  /// length: 256 characters. Valid characters: Unicode letters, digits, white
  /// space, _ . / = + - % @
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagDeliveryStreamOutput {
  TagDeliveryStreamOutput();
  factory TagDeliveryStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$TagDeliveryStreamOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagDeliveryStreamOutput {
  UntagDeliveryStreamOutput();
  factory UntagDeliveryStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagDeliveryStreamOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDestinationOutput {
  UpdateDestinationOutput();
  factory UpdateDestinationOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateDestinationOutputFromJson(json);
}

/// The details of the VPC of the Amazon ES destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcConfiguration {
  /// The ARN of the IAM role that you want the delivery stream to use to create
  /// endpoints in the destination VPC. You can use your existing Kinesis Data
  /// Firehose delivery role or you can specify a new role. In either case, make
  /// sure that the role trusts the Kinesis Data Firehose service principal and
  /// that it grants the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>ec2:DescribeVpcs</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeVpcAttribute</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeSubnets</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeSecurityGroups</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeNetworkInterfaces</code>
  /// </li>
  /// <li>
  /// <code>ec2:CreateNetworkInterface</code>
  /// </li>
  /// <li>
  /// <code>ec2:CreateNetworkInterfacePermission</code>
  /// </li>
  /// <li>
  /// <code>ec2:DeleteNetworkInterface</code>
  /// </li>
  /// </ul>
  /// If you revoke these permissions after you create the delivery stream,
  /// Kinesis Data Firehose can't scale out by creating more ENIs when necessary.
  /// You might therefore see a degradation in performance.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The IDs of the security groups that you want Kinesis Data Firehose to use
  /// when it creates ENIs in the VPC of the Amazon ES destination. You can use
  /// the same security group that the Amazon ES domain uses or different ones. If
  /// you specify different security groups here, ensure that they allow outbound
  /// HTTPS traffic to the Amazon ES domain's security group. Also ensure that the
  /// Amazon ES domain's security group allows HTTPS traffic from the security
  /// groups specified here. If you use the same security group for both your
  /// delivery stream and the Amazon ES domain, make sure the security group
  /// inbound rule allows HTTPS traffic. For more information about security group
  /// rules, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules">Security
  /// group rules</a> in the Amazon VPC documentation.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The IDs of the subnets that you want Kinesis Data Firehose to use to create
  /// ENIs in the VPC of the Amazon ES destination. Make sure that the routing
  /// tables and inbound and outbound rules allow traffic to flow from the subnets
  /// whose IDs are specified here to the subnets that have the destination Amazon
  /// ES endpoints. Kinesis Data Firehose creates at least one ENI in each of the
  /// subnets that are specified here. Do not delete or modify these ENIs.
  ///
  /// The number of ENIs that Kinesis Data Firehose creates in the subnets
  /// specified here scales up and down automatically based on throughput. To
  /// enable Kinesis Data Firehose to scale up the number of ENIs to match
  /// throughput, ensure that you have sufficient quota. To help you calculate the
  /// quota you need, assume that Kinesis Data Firehose can create up to three
  /// ENIs for this delivery stream for each of the subnets specified here. For
  /// more information about ENI quota, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis">Network
  /// Interfaces </a> in the Amazon VPC Quotas topic.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  VpcConfiguration({
    @_s.required this.roleARN,
    @_s.required this.securityGroupIds,
    @_s.required this.subnetIds,
  });
  Map<String, dynamic> toJson() => _$VpcConfigurationToJson(this);
}

/// The details of the VPC of the Amazon ES destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcConfigurationDescription {
  /// The ARN of the IAM role that the delivery stream uses to create endpoints in
  /// the destination VPC. You can use your existing Kinesis Data Firehose
  /// delivery role or you can specify a new role. In either case, make sure that
  /// the role trusts the Kinesis Data Firehose service principal and that it
  /// grants the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>ec2:DescribeVpcs</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeVpcAttribute</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeSubnets</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeSecurityGroups</code>
  /// </li>
  /// <li>
  /// <code>ec2:DescribeNetworkInterfaces</code>
  /// </li>
  /// <li>
  /// <code>ec2:CreateNetworkInterface</code>
  /// </li>
  /// <li>
  /// <code>ec2:CreateNetworkInterfacePermission</code>
  /// </li>
  /// <li>
  /// <code>ec2:DeleteNetworkInterface</code>
  /// </li>
  /// </ul>
  /// If you revoke these permissions after you create the delivery stream,
  /// Kinesis Data Firehose can't scale out by creating more ENIs when necessary.
  /// You might therefore see a degradation in performance.
  @_s.JsonKey(name: 'RoleARN')
  final String roleARN;

  /// The IDs of the security groups that Kinesis Data Firehose uses when it
  /// creates ENIs in the VPC of the Amazon ES destination. You can use the same
  /// security group that the Amazon ES domain uses or different ones. If you
  /// specify different security groups, ensure that they allow outbound HTTPS
  /// traffic to the Amazon ES domain's security group. Also ensure that the
  /// Amazon ES domain's security group allows HTTPS traffic from the security
  /// groups specified here. If you use the same security group for both your
  /// delivery stream and the Amazon ES domain, make sure the security group
  /// inbound rule allows HTTPS traffic. For more information about security group
  /// rules, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules">Security
  /// group rules</a> in the Amazon VPC documentation.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The IDs of the subnets that Kinesis Data Firehose uses to create ENIs in the
  /// VPC of the Amazon ES destination. Make sure that the routing tables and
  /// inbound and outbound rules allow traffic to flow from the subnets whose IDs
  /// are specified here to the subnets that have the destination Amazon ES
  /// endpoints. Kinesis Data Firehose creates at least one ENI in each of the
  /// subnets that are specified here. Do not delete or modify these ENIs.
  ///
  /// The number of ENIs that Kinesis Data Firehose creates in the subnets
  /// specified here scales up and down automatically based on throughput. To
  /// enable Kinesis Data Firehose to scale up the number of ENIs to match
  /// throughput, ensure that you have sufficient quota. To help you calculate the
  /// quota you need, assume that Kinesis Data Firehose can create up to three
  /// ENIs for this delivery stream for each of the subnets specified here. For
  /// more information about ENI quota, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis">Network
  /// Interfaces </a> in the Amazon VPC Quotas topic.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The ID of the Amazon ES destination's VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  VpcConfigurationDescription({
    @_s.required this.roleARN,
    @_s.required this.securityGroupIds,
    @_s.required this.subnetIds,
    @_s.required this.vpcId,
  });
  factory VpcConfigurationDescription.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigurationDescriptionFromJson(json);
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String type, String message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidKMSResourceException extends _s.GenericAwsException {
  InvalidKMSResourceException({String type, String message})
      : super(
            type: type, code: 'InvalidKMSResourceException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
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
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidKMSResourceException': (type, message) =>
      InvalidKMSResourceException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
};
