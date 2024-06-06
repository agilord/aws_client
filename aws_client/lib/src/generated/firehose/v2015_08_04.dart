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

/// Amazon Data Firehose was previously known as Amazon Kinesis Data Firehose.
/// </note>
/// Amazon Data Firehose is a fully managed service that delivers real-time
/// streaming data to destinations such as Amazon Simple Storage Service (Amazon
/// S3), Amazon OpenSearch Service, Amazon Redshift, Splunk, and various other
/// supportd destinations.
class Firehose {
  final _s.JsonProtocol _protocol;
  Firehose({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'firehose',
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

  /// Creates a Firehose delivery stream.
  ///
  /// By default, you can create up to 50 delivery streams per Amazon Web
  /// Services Region.
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
  /// A Firehose delivery stream can be configured to receive records directly
  /// from providers using <a>PutRecord</a> or <a>PutRecordBatch</a>, or it can
  /// be configured to use an existing Kinesis stream as its source. To specify
  /// a Kinesis data stream as input, set the <code>DeliveryStreamType</code>
  /// parameter to <code>KinesisStreamAsSource</code>, and provide the Kinesis
  /// stream Amazon Resource Name (ARN) and role ARN in the
  /// <code>KinesisStreamSourceConfiguration</code> parameter.
  ///
  /// To create a delivery stream with server-side encryption (SSE) enabled,
  /// include <a>DeliveryStreamEncryptionConfigurationInput</a> in your request.
  /// This is optional. You can also invoke <a>StartDeliveryStreamEncryption</a>
  /// to turn on SSE for an existing delivery stream that doesn't have SSE
  /// enabled.
  ///
  /// A delivery stream is configured with a single destination, such as Amazon
  /// Simple Storage Service (Amazon S3), Amazon Redshift, Amazon OpenSearch
  /// Service, Amazon OpenSearch Serverless, Splunk, and any custom HTTP
  /// endpoint or HTTP endpoints owned by or supported by third-party service
  /// providers, including Datadog, Dynatrace, LogicMonitor, MongoDB, New Relic,
  /// and Sumo Logic. You must specify only one of the following destination
  /// configuration parameters: <code>ExtendedS3DestinationConfiguration</code>,
  /// <code>S3DestinationConfiguration</code>,
  /// <code>ElasticsearchDestinationConfiguration</code>,
  /// <code>RedshiftDestinationConfiguration</code>, or
  /// <code>SplunkDestinationConfiguration</code>.
  ///
  /// When you specify <code>S3DestinationConfiguration</code>, you can also
  /// provide the following optional values: BufferingHints,
  /// <code>EncryptionConfiguration</code>, and <code>CompressionFormat</code>.
  /// By default, if no <code>BufferingHints</code> value is provided, Firehose
  /// buffers data up to 5 MB or for 5 minutes, whichever condition is satisfied
  /// first. <code>BufferingHints</code> is a hint, so there are some cases
  /// where the service cannot adhere to these conditions strictly. For example,
  /// record boundaries might be such that the size is a little over or under
  /// the configured buffering size. By default, no encryption is performed. We
  /// strongly recommend that you enable encryption to ensure secure data
  /// storage in Amazon S3.
  ///
  /// A few notes about Amazon Redshift as a destination:
  ///
  /// <ul>
  /// <li>
  /// An Amazon Redshift destination requires an S3 bucket as intermediate
  /// location. Firehose first delivers data to Amazon S3 and then uses
  /// <code>COPY</code> syntax to load data into an Amazon Redshift table. This
  /// is specified in the
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
  /// exclusively with Firehose, and that the permissions for the account are
  /// restricted for Amazon Redshift <code>INSERT</code> permissions.
  /// </li>
  /// </ul>
  /// Firehose assumes the IAM role that is configured as part of the
  /// destination. The role should allow the Firehose principal to assume the
  /// role, and the role should have permissions that allow the service to
  /// deliver the data. For more information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant
  /// Firehose Access to an Amazon S3 Destination</a> in the <i>Amazon Firehose
  /// Developer Guide</i>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidKMSResourceException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream. This name must be unique per Amazon Web
  /// Services account in the same Amazon Web Services Region. If the delivery
  /// streams are in different accounts or different Regions, you can have
  /// multiple delivery streams with the same name.
  ///
  /// Parameter [amazonOpenSearchServerlessDestinationConfiguration] :
  /// The destination in the Serverless offering for Amazon OpenSearch Service.
  /// You can specify only one destination.
  ///
  /// Parameter [amazonopensearchserviceDestinationConfiguration] :
  /// The destination in Amazon OpenSearch Service. You can specify only one
  /// destination.
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
  /// Parameter [snowflakeDestinationConfiguration] :
  /// Configure Snowflake destination
  ///
  /// Parameter [splunkDestinationConfiguration] :
  /// The destination in Splunk. You can specify only one destination.
  ///
  /// Parameter [tags] :
  /// A set of tags to assign to the delivery stream. A tag is a key-value pair
  /// that you can define and assign to Amazon Web Services resources. Tags are
  /// metadata. For example, you can add friendly names and descriptions or
  /// other types of information that can help you distinguish the delivery
  /// stream. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the Amazon Web Services Billing and Cost
  /// Management User Guide.
  ///
  /// You can specify up to 50 tags when creating a delivery stream.
  ///
  /// If you specify tags in the <code>CreateDeliveryStream</code> action,
  /// Amazon Data Firehose performs an additional authorization on the
  /// <code>firehose:TagDeliveryStream</code> action to verify if users have
  /// permissions to create tags. If you do not provide this permission,
  /// requests to create new Firehose delivery streams with IAM resource tags
  /// will fail with an <code>AccessDeniedException</code> such as following.
  ///
  /// <b>AccessDeniedException</b>
  ///
  /// User: arn:aws:sts::x:assumed-role/x/x is not authorized to perform:
  /// firehose:TagDeliveryStream on resource:
  /// arn:aws:firehose:us-east-1:x:deliverystream/x with an explicit deny in an
  /// identity-based policy.
  ///
  /// For an example IAM policy, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/APIReference/API_CreateDeliveryStream.html#API_CreateDeliveryStream_Examples">Tag
  /// example.</a>
  Future<CreateDeliveryStreamOutput> createDeliveryStream({
    required String deliveryStreamName,
    AmazonOpenSearchServerlessDestinationConfiguration?
        amazonOpenSearchServerlessDestinationConfiguration,
    AmazonopensearchserviceDestinationConfiguration?
        amazonopensearchserviceDestinationConfiguration,
    DeliveryStreamEncryptionConfigurationInput?
        deliveryStreamEncryptionConfigurationInput,
    DeliveryStreamType? deliveryStreamType,
    ElasticsearchDestinationConfiguration?
        elasticsearchDestinationConfiguration,
    ExtendedS3DestinationConfiguration? extendedS3DestinationConfiguration,
    HttpEndpointDestinationConfiguration? httpEndpointDestinationConfiguration,
    KinesisStreamSourceConfiguration? kinesisStreamSourceConfiguration,
    MSKSourceConfiguration? mSKSourceConfiguration,
    RedshiftDestinationConfiguration? redshiftDestinationConfiguration,
    S3DestinationConfiguration? s3DestinationConfiguration,
    SnowflakeDestinationConfiguration? snowflakeDestinationConfiguration,
    SplunkDestinationConfiguration? splunkDestinationConfiguration,
    List<Tag>? tags,
  }) async {
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
        if (amazonOpenSearchServerlessDestinationConfiguration != null)
          'AmazonOpenSearchServerlessDestinationConfiguration':
              amazonOpenSearchServerlessDestinationConfiguration,
        if (amazonopensearchserviceDestinationConfiguration != null)
          'AmazonopensearchserviceDestinationConfiguration':
              amazonopensearchserviceDestinationConfiguration,
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
        if (mSKSourceConfiguration != null)
          'MSKSourceConfiguration': mSKSourceConfiguration,
        if (redshiftDestinationConfiguration != null)
          'RedshiftDestinationConfiguration': redshiftDestinationConfiguration,
        if (s3DestinationConfiguration != null)
          'S3DestinationConfiguration': s3DestinationConfiguration,
        if (snowflakeDestinationConfiguration != null)
          'SnowflakeDestinationConfiguration':
              snowflakeDestinationConfiguration,
        if (splunkDestinationConfiguration != null)
          'SplunkDestinationConfiguration': splunkDestinationConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateDeliveryStreamOutput.fromJson(jsonResponse.body);
  }

  /// Deletes a delivery stream and its data.
  ///
  /// You can delete a delivery stream only if it is in one of the following
  /// states: <code>ACTIVE</code>, <code>DELETING</code>,
  /// <code>CREATING_FAILED</code>, or <code>DELETING_FAILED</code>. You can't
  /// delete a delivery stream that is in the <code>CREATING</code> state. To
  /// check the state of a delivery stream, use <a>DescribeDeliveryStream</a>.
  ///
  /// DeleteDeliveryStream is an asynchronous API. When an API request to
  /// DeleteDeliveryStream succeeds, the delivery stream is marked for deletion,
  /// and it goes into the <code>DELETING</code> state.While the delivery stream
  /// is in the <code>DELETING</code> state, the service might continue to
  /// accept records, but it doesn't make any guarantees with respect to
  /// delivering the data. Therefore, as a best practice, first stop any
  /// applications that are sending records before you delete a delivery stream.
  ///
  /// Removal of a delivery stream that is in the <code>DELETING</code> state is
  /// a low priority operation for the service. A stream may remain in the
  /// <code>DELETING</code> state for several minutes. Therefore, as a best
  /// practice, applications should not wait for streams in the
  /// <code>DELETING</code> state to be removed.
  ///
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [allowForceDelete] :
  /// Set this to true if you want to delete the delivery stream even if
  /// Firehose is unable to retire the grant for the CMK. Firehose might be
  /// unable to retire the grant due to a customer error, such as when the CMK
  /// or the grant are in an invalid state. If you force deletion, you can then
  /// use the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a>
  /// operation to revoke the grant you gave to Firehose. If a failure to retire
  /// the grant happens due to an Amazon Web Services KMS issue, Firehose keeps
  /// retrying the delete operation.
  ///
  /// The default value is false.
  Future<void> deleteDeliveryStream({
    required String deliveryStreamName,
    bool? allowForceDelete,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.DeleteDeliveryStream'
    };
    await _protocol.send(
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
  /// Firehose supports one destination per delivery stream.
  ///
  /// Parameter [limit] :
  /// The limit on the number of destinations to return. You can have one
  /// destination per delivery stream.
  Future<DescribeDeliveryStreamOutput> describeDeliveryStream({
    required String deliveryStreamName,
    String? exclusiveStartDestinationId,
    int? limit,
  }) async {
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
    DeliveryStreamType? deliveryStreamType,
    String? exclusiveStartDeliveryStreamName,
    int? limit,
  }) async {
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
    required String deliveryStreamName,
    String? exclusiveStartTagKey,
    int? limit,
  }) async {
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

  /// Writes a single data record into an Amazon Firehose delivery stream. To
  /// write multiple data records into a delivery stream, use
  /// <a>PutRecordBatch</a>. Applications using these operations are referred to
  /// as producers.
  ///
  /// By default, each delivery stream can take in up to 2,000 transactions per
  /// second, 5,000 records per second, or 5 MB per second. If you use
  /// <a>PutRecord</a> and <a>PutRecordBatch</a>, the limits are an aggregate
  /// across these two operations for each delivery stream. For more information
  /// about limits and how to request an increase, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon
  /// Firehose Limits</a>.
  ///
  /// Firehose accumulates and publishes a particular metric for a customer
  /// account in one minute intervals. It is possible that the bursts of
  /// incoming bytes/records ingested to a delivery stream last only for a few
  /// seconds. Due to this, the actual spikes in the traffic might not be fully
  /// visible in the customer's 1 minute CloudWatch metrics.
  ///
  /// You must specify the name of the delivery stream and the data record when
  /// using <a>PutRecord</a>. The data record consists of a data blob that can
  /// be up to 1,000 KiB in size, and any kind of data. For example, it can be a
  /// segment from a log file, geographic location data, website clickstream
  /// data, and so on.
  ///
  /// Firehose buffers records before delivering them to the destination. To
  /// disambiguate the data blobs at the destination, a common solution is to
  /// use delimiters in the data, such as a newline (<code>\n</code>) or some
  /// other character unique within the data. This allows the consumer
  /// application to parse individual data items when reading the data from the
  /// destination.
  ///
  /// The <code>PutRecord</code> operation returns a <code>RecordId</code>,
  /// which is a unique string assigned to each record. Producer applications
  /// can use this ID for purposes such as auditability and investigation.
  ///
  /// If the <code>PutRecord</code> operation throws a
  /// <code>ServiceUnavailableException</code>, the API is automatically
  /// reinvoked (retried) 3 times. If the exception persists, it is possible
  /// that the throughput limits have been exceeded for the delivery stream.
  ///
  /// Re-invoking the Put API operations (for example, PutRecord and
  /// PutRecordBatch) can result in data duplicates. For larger data assets,
  /// allow for a longer time out before retrying Put API operations.
  ///
  /// Data records sent to Firehose are stored for 24 hours from the time they
  /// are added to a delivery stream as it tries to send the records to the
  /// destination. If the destination is unreachable for more than 24 hours, the
  /// data is no longer available.
  /// <important>
  /// Don't concatenate two or more base64 strings to form the data fields of
  /// your records. Instead, concatenate the raw data, then perform base64
  /// encoding.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidKMSResourceException].
  /// May throw [InvalidSourceException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [record] :
  /// The record.
  Future<PutRecordOutput> putRecord({
    required String deliveryStreamName,
    required Record record,
  }) async {
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
  /// Firehose accumulates and publishes a particular metric for a customer
  /// account in one minute intervals. It is possible that the bursts of
  /// incoming bytes/records ingested to a delivery stream last only for a few
  /// seconds. Due to this, the actual spikes in the traffic might not be fully
  /// visible in the customer's 1 minute CloudWatch metrics.
  ///
  /// For information about service quota, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/limits.html">Amazon
  /// Firehose Quota</a>.
  ///
  /// Each <a>PutRecordBatch</a> request supports up to 500 records. Each record
  /// in the request can be as large as 1,000 KB (before base64 encoding), up to
  /// a limit of 4 MB for the entire request. These limits cannot be changed.
  ///
  /// You must specify the name of the delivery stream and the data record when
  /// using <a>PutRecord</a>. The data record consists of a data blob that can
  /// be up to 1,000 KB in size, and any kind of data. For example, it could be
  /// a segment from a log file, geographic location data, website clickstream
  /// data, and so on.
  ///
  /// Firehose buffers records before delivering them to the destination. To
  /// disambiguate the data blobs at the destination, a common solution is to
  /// use delimiters in the data, such as a newline (<code>\n</code>) or some
  /// other character unique within the data. This allows the consumer
  /// application to parse individual data items when reading the data from the
  /// destination.
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
  /// successfully and unsuccessfully processed records. Firehose tries to
  /// process all records in each <a>PutRecordBatch</a> request. A single record
  /// failure does not stop the processing of subsequent records.
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
  /// the API is automatically reinvoked (retried) 3 times. If the exception
  /// persists, it is possible that the throughput limits have been exceeded for
  /// the delivery stream.
  ///
  /// Re-invoking the Put API operations (for example, PutRecord and
  /// PutRecordBatch) can result in data duplicates. For larger data assets,
  /// allow for a longer time out before retrying Put API operations.
  ///
  /// Data records sent to Firehose are stored for 24 hours from the time they
  /// are added to a delivery stream as it attempts to send the records to the
  /// destination. If the destination is unreachable for more than 24 hours, the
  /// data is no longer available.
  /// <important>
  /// Don't concatenate two or more base64 strings to form the data fields of
  /// your records. Instead, concatenate the raw data, then perform base64
  /// encoding.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [InvalidKMSResourceException].
  /// May throw [InvalidSourceException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [deliveryStreamName] :
  /// The name of the delivery stream.
  ///
  /// Parameter [records] :
  /// One or more records.
  Future<PutRecordBatchOutput> putRecordBatch({
    required String deliveryStreamName,
    required List<Record> records,
  }) async {
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
  /// it, Firehose first sets the encryption status of the stream to
  /// <code>ENABLING</code>, and then to <code>ENABLED</code>. The encryption
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
  /// is of type <code>CUSTOMER_MANAGED_CMK</code>, Firehose schedules the grant
  /// it had on the old CMK for retirement. If the new CMK is of type
  /// <code>CUSTOMER_MANAGED_CMK</code>, Firehose creates a grant that enables
  /// it to use the new CMK to encrypt and decrypt data and to manage the grant.
  ///
  /// For the KMS grant creation to be successful, Firehose APIs
  /// <code>StartDeliveryStreamEncryption</code> and
  /// <code>CreateDeliveryStream</code> should not be called with session
  /// credentials that are more than 6 hours old.
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
  /// deny the permission for Firehose to invoke KMS encrypt and decrypt
  /// operations.
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
    required String deliveryStreamName,
    DeliveryStreamEncryptionConfigurationInput?
        deliveryStreamEncryptionConfigurationInput,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.StartDeliveryStreamEncryption'
    };
    await _protocol.send(
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
  }

  /// Disables server-side encryption (SSE) for the delivery stream.
  ///
  /// This operation is asynchronous. It returns immediately. When you invoke
  /// it, Firehose first sets the encryption status of the stream to
  /// <code>DISABLING</code>, and then to <code>DISABLED</code>. You can
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
  /// <code>StopDeliveryStreamEncryption</code>, Firehose schedules the related
  /// KMS grant for retirement and then retires it after it ensures that it is
  /// finished delivering records to the destination.
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
    required String deliveryStreamName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.StopDeliveryStreamEncryption'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DeliveryStreamName': deliveryStreamName,
      },
    );
  }

  /// Adds or updates tags for the specified delivery stream. A tag is a
  /// key-value pair that you can define and assign to Amazon Web Services
  /// resources. If you specify a tag that already exists, the tag value is
  /// replaced with the value that you specify in the request. Tags are
  /// metadata. For example, you can add friendly names and descriptions or
  /// other types of information that can help you distinguish the delivery
  /// stream. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Amazon Web Services Billing and Cost
  /// Management User Guide</i>.
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
    required String deliveryStreamName,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.TagDeliveryStream'
    };
    await _protocol.send(
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
    required String deliveryStreamName,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.UntagDeliveryStream'
    };
    await _protocol.send(
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
  /// Switching between Amazon OpenSearch Service and other services is not
  /// supported. For an Amazon OpenSearch Service destination, you can only
  /// update to another Amazon OpenSearch Service destination.
  ///
  /// If the destination type is the same, Firehose merges the configuration
  /// parameters specified with the destination configuration that already
  /// exists on the delivery stream. If any of the parameters are not specified
  /// in the call, the existing values are retained. For example, in the Amazon
  /// S3 destination, if <a>EncryptionConfiguration</a> is not specified, then
  /// the existing <code>EncryptionConfiguration</code> is maintained on the
  /// destination.
  ///
  /// If the destination type is not the same, for example, changing the
  /// destination from Amazon S3 to Amazon Redshift, Firehose does not merge any
  /// parameters. In this case, all parameters must be specified.
  ///
  /// Firehose uses <code>CurrentDeliveryStreamVersionId</code> to avoid race
  /// conditions and conflicting merges. This is a required field, and the
  /// service updates the configuration only if the existing configuration has a
  /// version ID that matches. After the update is applied successfully, the
  /// version ID is updated, and can be retrieved using
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
  /// Parameter [amazonOpenSearchServerlessDestinationUpdate] :
  /// Describes an update for a destination in the Serverless offering for
  /// Amazon OpenSearch Service.
  ///
  /// Parameter [amazonopensearchserviceDestinationUpdate] :
  /// Describes an update for a destination in Amazon OpenSearch Service.
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
  /// Parameter [snowflakeDestinationUpdate] :
  /// Update to the Snowflake destination condiguration settings
  ///
  /// Parameter [splunkDestinationUpdate] :
  /// Describes an update for a destination in Splunk.
  Future<void> updateDestination({
    required String currentDeliveryStreamVersionId,
    required String deliveryStreamName,
    required String destinationId,
    AmazonOpenSearchServerlessDestinationUpdate?
        amazonOpenSearchServerlessDestinationUpdate,
    AmazonopensearchserviceDestinationUpdate?
        amazonopensearchserviceDestinationUpdate,
    ElasticsearchDestinationUpdate? elasticsearchDestinationUpdate,
    ExtendedS3DestinationUpdate? extendedS3DestinationUpdate,
    HttpEndpointDestinationUpdate? httpEndpointDestinationUpdate,
    RedshiftDestinationUpdate? redshiftDestinationUpdate,
    S3DestinationUpdate? s3DestinationUpdate,
    SnowflakeDestinationUpdate? snowflakeDestinationUpdate,
    SplunkDestinationUpdate? splunkDestinationUpdate,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Firehose_20150804.UpdateDestination'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CurrentDeliveryStreamVersionId': currentDeliveryStreamVersionId,
        'DeliveryStreamName': deliveryStreamName,
        'DestinationId': destinationId,
        if (amazonOpenSearchServerlessDestinationUpdate != null)
          'AmazonOpenSearchServerlessDestinationUpdate':
              amazonOpenSearchServerlessDestinationUpdate,
        if (amazonopensearchserviceDestinationUpdate != null)
          'AmazonopensearchserviceDestinationUpdate':
              amazonopensearchserviceDestinationUpdate,
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
        if (snowflakeDestinationUpdate != null)
          'SnowflakeDestinationUpdate': snowflakeDestinationUpdate,
        if (splunkDestinationUpdate != null)
          'SplunkDestinationUpdate': splunkDestinationUpdate,
      },
    );
  }
}

/// Describes the buffering to perform before delivering data to the Serverless
/// offering for Amazon OpenSearch Service destination.
class AmazonOpenSearchServerlessBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300 (5 minutes).
  final int? intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it to
  /// the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10 MB
  /// or higher.
  final int? sizeInMBs;

  AmazonOpenSearchServerlessBufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });

  factory AmazonOpenSearchServerlessBufferingHints.fromJson(
      Map<String, dynamic> json) {
    return AmazonOpenSearchServerlessBufferingHints(
      intervalInSeconds: json['IntervalInSeconds'] as int?,
      sizeInMBs: json['SizeInMBs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final intervalInSeconds = this.intervalInSeconds;
    final sizeInMBs = this.sizeInMBs;
    return {
      if (intervalInSeconds != null) 'IntervalInSeconds': intervalInSeconds,
      if (sizeInMBs != null) 'SizeInMBs': sizeInMBs,
    };
  }
}

/// Describes the configuration of a destination in the Serverless offering for
/// Amazon OpenSearch Service.
class AmazonOpenSearchServerlessDestinationConfiguration {
  /// The Serverless offering for Amazon OpenSearch Service index name.
  final String indexName;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for
  /// calling the Serverless offering for Amazon OpenSearch Service Configuration
  /// API and for indexing documents.
  final String roleARN;
  final S3DestinationConfiguration s3Configuration;

  /// The buffering options. If no value is specified, the default values for
  /// AmazonopensearchserviceBufferingHints are used.
  final AmazonOpenSearchServerlessBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the collection in the Serverless
  /// offering for Amazon OpenSearch Service.
  final String? collectionEndpoint;
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to the
  /// Serverless offering for Amazon OpenSearch Service. The default value is 300
  /// (5 minutes).
  final AmazonOpenSearchServerlessRetryOptions? retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When it is set to
  /// FailedDocumentsOnly, Firehose writes any documents that could not be indexed
  /// to the configured Amazon S3 destination, with
  /// AmazonOpenSearchService-failed/ appended to the key prefix. When set to
  /// AllDocuments, Firehose delivers all incoming records to Amazon S3, and also
  /// writes failed documents with AmazonOpenSearchService-failed/ appended to the
  /// prefix.
  final AmazonOpenSearchServerlessS3BackupMode? s3BackupMode;
  final VpcConfiguration? vpcConfiguration;

  AmazonOpenSearchServerlessDestinationConfiguration({
    required this.indexName,
    required this.roleARN,
    required this.s3Configuration,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.collectionEndpoint,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
    this.vpcConfiguration,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final roleARN = this.roleARN;
    final s3Configuration = this.s3Configuration;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final collectionEndpoint = this.collectionEndpoint;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupMode = this.s3BackupMode;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'IndexName': indexName,
      'RoleARN': roleARN,
      'S3Configuration': s3Configuration,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (collectionEndpoint != null) 'CollectionEndpoint': collectionEndpoint,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// The destination description in the Serverless offering for Amazon OpenSearch
/// Service.
class AmazonOpenSearchServerlessDestinationDescription {
  /// The buffering options.
  final AmazonOpenSearchServerlessBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the collection in the Serverless
  /// offering for Amazon OpenSearch Service.
  final String? collectionEndpoint;

  /// The Serverless offering for Amazon OpenSearch Service index name.
  final String? indexName;
  final ProcessingConfiguration? processingConfiguration;

  /// The Serverless offering for Amazon OpenSearch Service retry options.
  final AmazonOpenSearchServerlessRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials.
  final String? roleARN;

  /// The Amazon S3 backup mode.
  final AmazonOpenSearchServerlessS3BackupMode? s3BackupMode;
  final S3DestinationDescription? s3DestinationDescription;
  final VpcConfigurationDescription? vpcConfigurationDescription;

  AmazonOpenSearchServerlessDestinationDescription({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.collectionEndpoint,
    this.indexName,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
    this.s3DestinationDescription,
    this.vpcConfigurationDescription,
  });

  factory AmazonOpenSearchServerlessDestinationDescription.fromJson(
      Map<String, dynamic> json) {
    return AmazonOpenSearchServerlessDestinationDescription(
      bufferingHints: json['BufferingHints'] != null
          ? AmazonOpenSearchServerlessBufferingHints.fromJson(
              json['BufferingHints'] as Map<String, dynamic>)
          : null,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      collectionEndpoint: json['CollectionEndpoint'] as String?,
      indexName: json['IndexName'] as String?,
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      retryOptions: json['RetryOptions'] != null
          ? AmazonOpenSearchServerlessRetryOptions.fromJson(
              json['RetryOptions'] as Map<String, dynamic>)
          : null,
      roleARN: json['RoleARN'] as String?,
      s3BackupMode: (json['S3BackupMode'] as String?)
          ?.toAmazonOpenSearchServerlessS3BackupMode(),
      s3DestinationDescription: json['S3DestinationDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3DestinationDescription'] as Map<String, dynamic>)
          : null,
      vpcConfigurationDescription: json['VpcConfigurationDescription'] != null
          ? VpcConfigurationDescription.fromJson(
              json['VpcConfigurationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final collectionEndpoint = this.collectionEndpoint;
    final indexName = this.indexName;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3DestinationDescription = this.s3DestinationDescription;
    final vpcConfigurationDescription = this.vpcConfigurationDescription;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (collectionEndpoint != null) 'CollectionEndpoint': collectionEndpoint,
      if (indexName != null) 'IndexName': indexName,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3DestinationDescription != null)
        'S3DestinationDescription': s3DestinationDescription,
      if (vpcConfigurationDescription != null)
        'VpcConfigurationDescription': vpcConfigurationDescription,
    };
  }
}

/// Describes an update for a destination in the Serverless offering for Amazon
/// OpenSearch Service.
class AmazonOpenSearchServerlessDestinationUpdate {
  /// The buffering options. If no value is specified,
  /// AmazonopensearchBufferingHints object default values are used.
  final AmazonOpenSearchServerlessBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the collection in the Serverless
  /// offering for Amazon OpenSearch Service.
  final String? collectionEndpoint;

  /// The Serverless offering for Amazon OpenSearch Service index name.
  final String? indexName;
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to the
  /// Serverless offering for Amazon OpenSearch Service. The default value is 300
  /// (5 minutes).
  final AmazonOpenSearchServerlessRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for
  /// calling the Serverless offering for Amazon OpenSearch Service Configuration
  /// API and for indexing documents.
  final String? roleARN;
  final S3DestinationUpdate? s3Update;

  AmazonOpenSearchServerlessDestinationUpdate({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.collectionEndpoint,
    this.indexName,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3Update,
  });

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final collectionEndpoint = this.collectionEndpoint;
    final indexName = this.indexName;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3Update = this.s3Update;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (collectionEndpoint != null) 'CollectionEndpoint': collectionEndpoint,
      if (indexName != null) 'IndexName': indexName,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3Update != null) 'S3Update': s3Update,
    };
  }
}

/// Configures retry behavior in case Firehose is unable to deliver documents to
/// the Serverless offering for Amazon OpenSearch Service.
class AmazonOpenSearchServerlessRetryOptions {
  /// After an initial failure to deliver to the Serverless offering for Amazon
  /// OpenSearch Service, the total amount of time during which Firehose retries
  /// delivery (including the first attempt). After this time has elapsed, the
  /// failed documents are written to Amazon S3. Default value is 300 seconds (5
  /// minutes). A value of 0 (zero) results in no retries.
  final int? durationInSeconds;

  AmazonOpenSearchServerlessRetryOptions({
    this.durationInSeconds,
  });

  factory AmazonOpenSearchServerlessRetryOptions.fromJson(
      Map<String, dynamic> json) {
    return AmazonOpenSearchServerlessRetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

enum AmazonOpenSearchServerlessS3BackupMode {
  failedDocumentsOnly,
  allDocuments,
}

extension AmazonOpenSearchServerlessS3BackupModeValueExtension
    on AmazonOpenSearchServerlessS3BackupMode {
  String toValue() {
    switch (this) {
      case AmazonOpenSearchServerlessS3BackupMode.failedDocumentsOnly:
        return 'FailedDocumentsOnly';
      case AmazonOpenSearchServerlessS3BackupMode.allDocuments:
        return 'AllDocuments';
    }
  }
}

extension AmazonOpenSearchServerlessS3BackupModeFromString on String {
  AmazonOpenSearchServerlessS3BackupMode
      toAmazonOpenSearchServerlessS3BackupMode() {
    switch (this) {
      case 'FailedDocumentsOnly':
        return AmazonOpenSearchServerlessS3BackupMode.failedDocumentsOnly;
      case 'AllDocuments':
        return AmazonOpenSearchServerlessS3BackupMode.allDocuments;
    }
    throw Exception(
        '$this is not known in enum AmazonOpenSearchServerlessS3BackupMode');
  }
}

/// Describes the buffering to perform before delivering data to the Amazon
/// OpenSearch Service destination.
class AmazonopensearchserviceBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300 (5 minutes).
  final int? intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it to
  /// the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10 MB
  /// or higher.
  final int? sizeInMBs;

  AmazonopensearchserviceBufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });

  factory AmazonopensearchserviceBufferingHints.fromJson(
      Map<String, dynamic> json) {
    return AmazonopensearchserviceBufferingHints(
      intervalInSeconds: json['IntervalInSeconds'] as int?,
      sizeInMBs: json['SizeInMBs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final intervalInSeconds = this.intervalInSeconds;
    final sizeInMBs = this.sizeInMBs;
    return {
      if (intervalInSeconds != null) 'IntervalInSeconds': intervalInSeconds,
      if (sizeInMBs != null) 'SizeInMBs': sizeInMBs,
    };
  }
}

/// Describes the configuration of a destination in Amazon OpenSearch Service
class AmazonopensearchserviceDestinationConfiguration {
  /// The ElasticsearAmazon OpenSearch Service index name.
  final String indexName;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for
  /// calling the Amazon OpenSearch Service Configuration API and for indexing
  /// documents.
  final String roleARN;
  final S3DestinationConfiguration s3Configuration;

  /// The buffering options. If no value is specified, the default values for
  /// AmazonopensearchserviceBufferingHints are used.
  final AmazonopensearchserviceBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Specify either this
  /// ClusterEndpoint or the DomainARN field.
  final String? clusterEndpoint;

  /// Indicates the method for setting up document ID. The supported methods are
  /// Firehose generated document ID and OpenSearch Service generated document ID.
  final DocumentIdOptions? documentIdOptions;

  /// The ARN of the Amazon OpenSearch Service domain. The IAM role must have
  /// permissions for DescribeElasticsearchDomain, DescribeElasticsearchDomains,
  /// and DescribeElasticsearchDomainConfig after assuming the role specified in
  /// RoleARN.
  final String? domainARN;

  /// The Amazon OpenSearch Service index rotation period. Index rotation appends
  /// a timestamp to the IndexName to facilitate the expiration of old data.
  final AmazonopensearchserviceIndexRotationPeriod? indexRotationPeriod;
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to Amazon
  /// OpenSearch Service. The default value is 300 (5 minutes).
  final AmazonopensearchserviceRetryOptions? retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When it is set to
  /// FailedDocumentsOnly, Firehose writes any documents that could not be indexed
  /// to the configured Amazon S3 destination, with
  /// AmazonOpenSearchService-failed/ appended to the key prefix. When set to
  /// AllDocuments, Firehose delivers all incoming records to Amazon S3, and also
  /// writes failed documents with AmazonOpenSearchService-failed/ appended to the
  /// prefix.
  final AmazonopensearchserviceS3BackupMode? s3BackupMode;

  /// The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be
  /// only one type per index. If you try to specify a new type for an existing
  /// index that already has another type, Firehose returns an error during run
  /// time.
  final String? typeName;
  final VpcConfiguration? vpcConfiguration;

  AmazonopensearchserviceDestinationConfiguration({
    required this.indexName,
    required this.roleARN,
    required this.s3Configuration,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.documentIdOptions,
    this.domainARN,
    this.indexRotationPeriod,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
    this.typeName,
    this.vpcConfiguration,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final roleARN = this.roleARN;
    final s3Configuration = this.s3Configuration;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final clusterEndpoint = this.clusterEndpoint;
    final documentIdOptions = this.documentIdOptions;
    final domainARN = this.domainARN;
    final indexRotationPeriod = this.indexRotationPeriod;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupMode = this.s3BackupMode;
    final typeName = this.typeName;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'IndexName': indexName,
      'RoleARN': roleARN,
      'S3Configuration': s3Configuration,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (clusterEndpoint != null) 'ClusterEndpoint': clusterEndpoint,
      if (documentIdOptions != null) 'DocumentIdOptions': documentIdOptions,
      if (domainARN != null) 'DomainARN': domainARN,
      if (indexRotationPeriod != null)
        'IndexRotationPeriod': indexRotationPeriod.toValue(),
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (typeName != null) 'TypeName': typeName,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// The destination description in Amazon OpenSearch Service.
class AmazonopensearchserviceDestinationDescription {
  /// The buffering options.
  final AmazonopensearchserviceBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Firehose uses
  /// either this ClusterEndpoint or the DomainARN field to send data to Amazon
  /// OpenSearch Service.
  final String? clusterEndpoint;

  /// Indicates the method for setting up document ID. The supported methods are
  /// Firehose generated document ID and OpenSearch Service generated document ID.
  final DocumentIdOptions? documentIdOptions;

  /// The ARN of the Amazon OpenSearch Service domain.
  final String? domainARN;

  /// The Amazon OpenSearch Service index name.
  final String? indexName;

  /// The Amazon OpenSearch Service index rotation period
  final AmazonopensearchserviceIndexRotationPeriod? indexRotationPeriod;
  final ProcessingConfiguration? processingConfiguration;

  /// The Amazon OpenSearch Service retry options.
  final AmazonopensearchserviceRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials.
  final String? roleARN;

  /// The Amazon S3 backup mode.
  final AmazonopensearchserviceS3BackupMode? s3BackupMode;
  final S3DestinationDescription? s3DestinationDescription;

  /// The Amazon OpenSearch Service type name. This applies to Elasticsearch 6.x
  /// and lower versions. For Elasticsearch 7.x and OpenSearch Service 1.x,
  /// there's no value for TypeName.
  final String? typeName;
  final VpcConfigurationDescription? vpcConfigurationDescription;

  AmazonopensearchserviceDestinationDescription({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.documentIdOptions,
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

  factory AmazonopensearchserviceDestinationDescription.fromJson(
      Map<String, dynamic> json) {
    return AmazonopensearchserviceDestinationDescription(
      bufferingHints: json['BufferingHints'] != null
          ? AmazonopensearchserviceBufferingHints.fromJson(
              json['BufferingHints'] as Map<String, dynamic>)
          : null,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      clusterEndpoint: json['ClusterEndpoint'] as String?,
      documentIdOptions: json['DocumentIdOptions'] != null
          ? DocumentIdOptions.fromJson(
              json['DocumentIdOptions'] as Map<String, dynamic>)
          : null,
      domainARN: json['DomainARN'] as String?,
      indexName: json['IndexName'] as String?,
      indexRotationPeriod: (json['IndexRotationPeriod'] as String?)
          ?.toAmazonopensearchserviceIndexRotationPeriod(),
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      retryOptions: json['RetryOptions'] != null
          ? AmazonopensearchserviceRetryOptions.fromJson(
              json['RetryOptions'] as Map<String, dynamic>)
          : null,
      roleARN: json['RoleARN'] as String?,
      s3BackupMode: (json['S3BackupMode'] as String?)
          ?.toAmazonopensearchserviceS3BackupMode(),
      s3DestinationDescription: json['S3DestinationDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3DestinationDescription'] as Map<String, dynamic>)
          : null,
      typeName: json['TypeName'] as String?,
      vpcConfigurationDescription: json['VpcConfigurationDescription'] != null
          ? VpcConfigurationDescription.fromJson(
              json['VpcConfigurationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final clusterEndpoint = this.clusterEndpoint;
    final documentIdOptions = this.documentIdOptions;
    final domainARN = this.domainARN;
    final indexName = this.indexName;
    final indexRotationPeriod = this.indexRotationPeriod;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3DestinationDescription = this.s3DestinationDescription;
    final typeName = this.typeName;
    final vpcConfigurationDescription = this.vpcConfigurationDescription;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (clusterEndpoint != null) 'ClusterEndpoint': clusterEndpoint,
      if (documentIdOptions != null) 'DocumentIdOptions': documentIdOptions,
      if (domainARN != null) 'DomainARN': domainARN,
      if (indexName != null) 'IndexName': indexName,
      if (indexRotationPeriod != null)
        'IndexRotationPeriod': indexRotationPeriod.toValue(),
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3DestinationDescription != null)
        'S3DestinationDescription': s3DestinationDescription,
      if (typeName != null) 'TypeName': typeName,
      if (vpcConfigurationDescription != null)
        'VpcConfigurationDescription': vpcConfigurationDescription,
    };
  }
}

/// Describes an update for a destination in Amazon OpenSearch Service.
class AmazonopensearchserviceDestinationUpdate {
  /// The buffering options. If no value is specified,
  /// AmazonopensearchBufferingHints object default values are used.
  final AmazonopensearchserviceBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Specify either this
  /// ClusterEndpoint or the DomainARN field.
  final String? clusterEndpoint;

  /// Indicates the method for setting up document ID. The supported methods are
  /// Firehose generated document ID and OpenSearch Service generated document ID.
  final DocumentIdOptions? documentIdOptions;

  /// The ARN of the Amazon OpenSearch Service domain. The IAM role must have
  /// permissions for DescribeDomain, DescribeDomains, and DescribeDomainConfig
  /// after assuming the IAM role specified in RoleARN.
  final String? domainARN;

  /// The Amazon OpenSearch Service index name.
  final String? indexName;

  /// The Amazon OpenSearch Service index rotation period. Index rotation appends
  /// a timestamp to IndexName to facilitate the expiration of old data.
  final AmazonopensearchserviceIndexRotationPeriod? indexRotationPeriod;
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to Amazon
  /// OpenSearch Service. The default value is 300 (5 minutes).
  final AmazonopensearchserviceRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for
  /// calling the Amazon OpenSearch Service Configuration API and for indexing
  /// documents.
  final String? roleARN;
  final S3DestinationUpdate? s3Update;

  /// The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be
  /// only one type per index. If you try to specify a new type for an existing
  /// index that already has another type, Firehose returns an error during
  /// runtime.
  ///
  /// If you upgrade Elasticsearch from 6.x to 7.x and don’t update your delivery
  /// stream, Firehose still delivers data to Elasticsearch with the old index
  /// name and type name. If you want to update your delivery stream with a new
  /// index name, provide an empty string for TypeName.
  final String? typeName;

  AmazonopensearchserviceDestinationUpdate({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.documentIdOptions,
    this.domainARN,
    this.indexName,
    this.indexRotationPeriod,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3Update,
    this.typeName,
  });

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final clusterEndpoint = this.clusterEndpoint;
    final documentIdOptions = this.documentIdOptions;
    final domainARN = this.domainARN;
    final indexName = this.indexName;
    final indexRotationPeriod = this.indexRotationPeriod;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3Update = this.s3Update;
    final typeName = this.typeName;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (clusterEndpoint != null) 'ClusterEndpoint': clusterEndpoint,
      if (documentIdOptions != null) 'DocumentIdOptions': documentIdOptions,
      if (domainARN != null) 'DomainARN': domainARN,
      if (indexName != null) 'IndexName': indexName,
      if (indexRotationPeriod != null)
        'IndexRotationPeriod': indexRotationPeriod.toValue(),
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3Update != null) 'S3Update': s3Update,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

enum AmazonopensearchserviceIndexRotationPeriod {
  noRotation,
  oneHour,
  oneDay,
  oneWeek,
  oneMonth,
}

extension AmazonopensearchserviceIndexRotationPeriodValueExtension
    on AmazonopensearchserviceIndexRotationPeriod {
  String toValue() {
    switch (this) {
      case AmazonopensearchserviceIndexRotationPeriod.noRotation:
        return 'NoRotation';
      case AmazonopensearchserviceIndexRotationPeriod.oneHour:
        return 'OneHour';
      case AmazonopensearchserviceIndexRotationPeriod.oneDay:
        return 'OneDay';
      case AmazonopensearchserviceIndexRotationPeriod.oneWeek:
        return 'OneWeek';
      case AmazonopensearchserviceIndexRotationPeriod.oneMonth:
        return 'OneMonth';
    }
  }
}

extension AmazonopensearchserviceIndexRotationPeriodFromString on String {
  AmazonopensearchserviceIndexRotationPeriod
      toAmazonopensearchserviceIndexRotationPeriod() {
    switch (this) {
      case 'NoRotation':
        return AmazonopensearchserviceIndexRotationPeriod.noRotation;
      case 'OneHour':
        return AmazonopensearchserviceIndexRotationPeriod.oneHour;
      case 'OneDay':
        return AmazonopensearchserviceIndexRotationPeriod.oneDay;
      case 'OneWeek':
        return AmazonopensearchserviceIndexRotationPeriod.oneWeek;
      case 'OneMonth':
        return AmazonopensearchserviceIndexRotationPeriod.oneMonth;
    }
    throw Exception(
        '$this is not known in enum AmazonopensearchserviceIndexRotationPeriod');
  }
}

/// Configures retry behavior in case Firehose is unable to deliver documents to
/// Amazon OpenSearch Service.
class AmazonopensearchserviceRetryOptions {
  /// After an initial failure to deliver to Amazon OpenSearch Service, the total
  /// amount of time during which Firehose retries delivery (including the first
  /// attempt). After this time has elapsed, the failed documents are written to
  /// Amazon S3. Default value is 300 seconds (5 minutes). A value of 0 (zero)
  /// results in no retries.
  final int? durationInSeconds;

  AmazonopensearchserviceRetryOptions({
    this.durationInSeconds,
  });

  factory AmazonopensearchserviceRetryOptions.fromJson(
      Map<String, dynamic> json) {
    return AmazonopensearchserviceRetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

enum AmazonopensearchserviceS3BackupMode {
  failedDocumentsOnly,
  allDocuments,
}

extension AmazonopensearchserviceS3BackupModeValueExtension
    on AmazonopensearchserviceS3BackupMode {
  String toValue() {
    switch (this) {
      case AmazonopensearchserviceS3BackupMode.failedDocumentsOnly:
        return 'FailedDocumentsOnly';
      case AmazonopensearchserviceS3BackupMode.allDocuments:
        return 'AllDocuments';
    }
  }
}

extension AmazonopensearchserviceS3BackupModeFromString on String {
  AmazonopensearchserviceS3BackupMode toAmazonopensearchserviceS3BackupMode() {
    switch (this) {
      case 'FailedDocumentsOnly':
        return AmazonopensearchserviceS3BackupMode.failedDocumentsOnly;
      case 'AllDocuments':
        return AmazonopensearchserviceS3BackupMode.allDocuments;
    }
    throw Exception(
        '$this is not known in enum AmazonopensearchserviceS3BackupMode');
  }
}

/// The authentication configuration of the Amazon MSK cluster.
class AuthenticationConfiguration {
  /// The type of connectivity used to access the Amazon MSK cluster.
  final Connectivity connectivity;

  /// The ARN of the role used to access the Amazon MSK cluster.
  final String roleARN;

  AuthenticationConfiguration({
    required this.connectivity,
    required this.roleARN,
  });

  factory AuthenticationConfiguration.fromJson(Map<String, dynamic> json) {
    return AuthenticationConfiguration(
      connectivity: (json['Connectivity'] as String).toConnectivity(),
      roleARN: json['RoleARN'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final connectivity = this.connectivity;
    final roleARN = this.roleARN;
    return {
      'Connectivity': connectivity.toValue(),
      'RoleARN': roleARN,
    };
  }
}

/// Describes hints for the buffering to perform before delivering data to the
/// destination. These options are treated as hints, and therefore Firehose
/// might choose to use different values when it is optimal. The
/// <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are
/// optional. However, if specify a value for one of them, you must also provide
/// a value for the other.
class BufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300. This parameter
  /// is optional but if you specify a value for it, you must also specify a value
  /// for <code>SizeInMBs</code>, and vice versa.
  final int? intervalInSeconds;

  /// Buffer incoming data to the specified size, in MiBs, before delivering it to
  /// the destination. The default value is 5. This parameter is optional but if
  /// you specify a value for it, you must also specify a value for
  /// <code>IntervalInSeconds</code>, and vice versa.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MiB/sec, the value should be 10
  /// MiB or higher.
  final int? sizeInMBs;

  BufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });

  factory BufferingHints.fromJson(Map<String, dynamic> json) {
    return BufferingHints(
      intervalInSeconds: json['IntervalInSeconds'] as int?,
      sizeInMBs: json['SizeInMBs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final intervalInSeconds = this.intervalInSeconds;
    final sizeInMBs = this.sizeInMBs;
    return {
      if (intervalInSeconds != null) 'IntervalInSeconds': intervalInSeconds,
      if (sizeInMBs != null) 'SizeInMBs': sizeInMBs,
    };
  }
}

/// Describes the Amazon CloudWatch logging options for your delivery stream.
class CloudWatchLoggingOptions {
  /// Enables or disables CloudWatch logging.
  final bool? enabled;

  /// The CloudWatch group name for logging. This value is required if CloudWatch
  /// logging is enabled.
  final String? logGroupName;

  /// The CloudWatch log stream name for logging. This value is required if
  /// CloudWatch logging is enabled.
  final String? logStreamName;

  CloudWatchLoggingOptions({
    this.enabled,
    this.logGroupName,
    this.logStreamName,
  });

  factory CloudWatchLoggingOptions.fromJson(Map<String, dynamic> json) {
    return CloudWatchLoggingOptions(
      enabled: json['Enabled'] as bool?,
      logGroupName: json['LogGroupName'] as String?,
      logStreamName: json['LogStreamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final logGroupName = this.logGroupName;
    final logStreamName = this.logStreamName;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (logGroupName != null) 'LogGroupName': logGroupName,
      if (logStreamName != null) 'LogStreamName': logStreamName,
    };
  }
}

enum CompressionFormat {
  uncompressed,
  gzip,
  zip,
  snappy,
  hadoopSnappy,
}

extension CompressionFormatValueExtension on CompressionFormat {
  String toValue() {
    switch (this) {
      case CompressionFormat.uncompressed:
        return 'UNCOMPRESSED';
      case CompressionFormat.gzip:
        return 'GZIP';
      case CompressionFormat.zip:
        return 'ZIP';
      case CompressionFormat.snappy:
        return 'Snappy';
      case CompressionFormat.hadoopSnappy:
        return 'HADOOP_SNAPPY';
    }
  }
}

extension CompressionFormatFromString on String {
  CompressionFormat toCompressionFormat() {
    switch (this) {
      case 'UNCOMPRESSED':
        return CompressionFormat.uncompressed;
      case 'GZIP':
        return CompressionFormat.gzip;
      case 'ZIP':
        return CompressionFormat.zip;
      case 'Snappy':
        return CompressionFormat.snappy;
      case 'HADOOP_SNAPPY':
        return CompressionFormat.hadoopSnappy;
    }
    throw Exception('$this is not known in enum CompressionFormat');
  }
}

enum Connectivity {
  public,
  private,
}

extension ConnectivityValueExtension on Connectivity {
  String toValue() {
    switch (this) {
      case Connectivity.public:
        return 'PUBLIC';
      case Connectivity.private:
        return 'PRIVATE';
    }
  }
}

extension ConnectivityFromString on String {
  Connectivity toConnectivity() {
    switch (this) {
      case 'PUBLIC':
        return Connectivity.public;
      case 'PRIVATE':
        return Connectivity.private;
    }
    throw Exception('$this is not known in enum Connectivity');
  }
}

enum ContentEncoding {
  none,
  gzip,
}

extension ContentEncodingValueExtension on ContentEncoding {
  String toValue() {
    switch (this) {
      case ContentEncoding.none:
        return 'NONE';
      case ContentEncoding.gzip:
        return 'GZIP';
    }
  }
}

extension ContentEncodingFromString on String {
  ContentEncoding toContentEncoding() {
    switch (this) {
      case 'NONE':
        return ContentEncoding.none;
      case 'GZIP':
        return ContentEncoding.gzip;
    }
    throw Exception('$this is not known in enum ContentEncoding');
  }
}

/// Describes a <code>COPY</code> command for Amazon Redshift.
class CopyCommand {
  /// The name of the target table. The table must already exist in the database.
  final String dataTableName;

  /// Optional parameters to use with the Amazon Redshift <code>COPY</code>
  /// command. For more information, see the "Optional Parameters" section of <a
  /// href="https://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html">Amazon
  /// Redshift COPY command</a>. Some possible examples that would apply to
  /// Firehose are as follows:
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
  final String? copyOptions;

  /// A comma-separated list of column names.
  final String? dataTableColumns;

  CopyCommand({
    required this.dataTableName,
    this.copyOptions,
    this.dataTableColumns,
  });

  factory CopyCommand.fromJson(Map<String, dynamic> json) {
    return CopyCommand(
      dataTableName: json['DataTableName'] as String,
      copyOptions: json['CopyOptions'] as String?,
      dataTableColumns: json['DataTableColumns'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataTableName = this.dataTableName;
    final copyOptions = this.copyOptions;
    final dataTableColumns = this.dataTableColumns;
    return {
      'DataTableName': dataTableName,
      if (copyOptions != null) 'CopyOptions': copyOptions,
      if (dataTableColumns != null) 'DataTableColumns': dataTableColumns,
    };
  }
}

class CreateDeliveryStreamOutput {
  /// The ARN of the delivery stream.
  final String? deliveryStreamARN;

  CreateDeliveryStreamOutput({
    this.deliveryStreamARN,
  });

  factory CreateDeliveryStreamOutput.fromJson(Map<String, dynamic> json) {
    return CreateDeliveryStreamOutput(
      deliveryStreamARN: json['DeliveryStreamARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamARN = this.deliveryStreamARN;
    return {
      if (deliveryStreamARN != null) 'DeliveryStreamARN': deliveryStreamARN,
    };
  }
}

/// Specifies that you want Firehose to convert data from the JSON format to the
/// Parquet or ORC format before writing it to Amazon S3. Firehose uses the
/// serializer and deserializer that you specify, in addition to the column
/// information from the Amazon Web Services Glue table, to deserialize your
/// input data from JSON and then serialize it to the Parquet or ORC format. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html">Firehose
/// Record Format Conversion</a>.
class DataFormatConversionConfiguration {
  /// Defaults to <code>true</code>. Set it to <code>false</code> if you want to
  /// disable format conversion while preserving the configuration details.
  final bool? enabled;

  /// Specifies the deserializer that you want Firehose to use to convert the
  /// format of your data from JSON. This parameter is required if
  /// <code>Enabled</code> is set to true.
  final InputFormatConfiguration? inputFormatConfiguration;

  /// Specifies the serializer that you want Firehose to use to convert the format
  /// of your data to the Parquet or ORC format. This parameter is required if
  /// <code>Enabled</code> is set to true.
  final OutputFormatConfiguration? outputFormatConfiguration;

  /// Specifies the Amazon Web Services Glue Data Catalog table that contains the
  /// column information. This parameter is required if <code>Enabled</code> is
  /// set to true.
  final SchemaConfiguration? schemaConfiguration;

  DataFormatConversionConfiguration({
    this.enabled,
    this.inputFormatConfiguration,
    this.outputFormatConfiguration,
    this.schemaConfiguration,
  });

  factory DataFormatConversionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataFormatConversionConfiguration(
      enabled: json['Enabled'] as bool?,
      inputFormatConfiguration: json['InputFormatConfiguration'] != null
          ? InputFormatConfiguration.fromJson(
              json['InputFormatConfiguration'] as Map<String, dynamic>)
          : null,
      outputFormatConfiguration: json['OutputFormatConfiguration'] != null
          ? OutputFormatConfiguration.fromJson(
              json['OutputFormatConfiguration'] as Map<String, dynamic>)
          : null,
      schemaConfiguration: json['SchemaConfiguration'] != null
          ? SchemaConfiguration.fromJson(
              json['SchemaConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final inputFormatConfiguration = this.inputFormatConfiguration;
    final outputFormatConfiguration = this.outputFormatConfiguration;
    final schemaConfiguration = this.schemaConfiguration;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (inputFormatConfiguration != null)
        'InputFormatConfiguration': inputFormatConfiguration,
      if (outputFormatConfiguration != null)
        'OutputFormatConfiguration': outputFormatConfiguration,
      if (schemaConfiguration != null)
        'SchemaConfiguration': schemaConfiguration,
    };
  }
}

enum DefaultDocumentIdFormat {
  firehoseDefault,
  noDocumentId,
}

extension DefaultDocumentIdFormatValueExtension on DefaultDocumentIdFormat {
  String toValue() {
    switch (this) {
      case DefaultDocumentIdFormat.firehoseDefault:
        return 'FIREHOSE_DEFAULT';
      case DefaultDocumentIdFormat.noDocumentId:
        return 'NO_DOCUMENT_ID';
    }
  }
}

extension DefaultDocumentIdFormatFromString on String {
  DefaultDocumentIdFormat toDefaultDocumentIdFormat() {
    switch (this) {
      case 'FIREHOSE_DEFAULT':
        return DefaultDocumentIdFormat.firehoseDefault;
      case 'NO_DOCUMENT_ID':
        return DefaultDocumentIdFormat.noDocumentId;
    }
    throw Exception('$this is not known in enum DefaultDocumentIdFormat');
  }
}

class DeleteDeliveryStreamOutput {
  DeleteDeliveryStreamOutput();

  factory DeleteDeliveryStreamOutput.fromJson(Map<String, dynamic> _) {
    return DeleteDeliveryStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about a delivery stream.
class DeliveryStreamDescription {
  /// The Amazon Resource Name (ARN) of the delivery stream. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String deliveryStreamARN;

  /// The name of the delivery stream.
  final String deliveryStreamName;

  /// The status of the delivery stream. If the status of a delivery stream is
  /// <code>CREATING_FAILED</code>, this status doesn't change, and you can't
  /// invoke <code>CreateDeliveryStream</code> again on it. However, you can
  /// invoke the <a>DeleteDeliveryStream</a> operation to delete it.
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
  final DeliveryStreamType deliveryStreamType;

  /// The destinations.
  final List<DestinationDescription> destinations;

  /// Indicates whether there are more destinations available to list.
  final bool hasMoreDestinations;

  /// Each time the destination is updated for a delivery stream, the version ID
  /// is changed, and the current version ID is required when updating the
  /// destination. This is so that the service knows it is applying the changes to
  /// the correct version of the delivery stream.
  final String versionId;

  /// The date and time that the delivery stream was created.
  final DateTime? createTimestamp;

  /// Indicates the server-side encryption (SSE) status for the delivery stream.
  final DeliveryStreamEncryptionConfiguration?
      deliveryStreamEncryptionConfiguration;

  /// Provides details in case one of the following operations fails due to an
  /// error related to KMS: <a>CreateDeliveryStream</a>,
  /// <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>,
  /// <a>StopDeliveryStreamEncryption</a>.
  final FailureDescription? failureDescription;

  /// The date and time that the delivery stream was last updated.
  final DateTime? lastUpdateTimestamp;

  /// If the <code>DeliveryStreamType</code> parameter is
  /// <code>KinesisStreamAsSource</code>, a <a>SourceDescription</a> object
  /// describing the source Kinesis data stream.
  final SourceDescription? source;

  DeliveryStreamDescription({
    required this.deliveryStreamARN,
    required this.deliveryStreamName,
    required this.deliveryStreamStatus,
    required this.deliveryStreamType,
    required this.destinations,
    required this.hasMoreDestinations,
    required this.versionId,
    this.createTimestamp,
    this.deliveryStreamEncryptionConfiguration,
    this.failureDescription,
    this.lastUpdateTimestamp,
    this.source,
  });

  factory DeliveryStreamDescription.fromJson(Map<String, dynamic> json) {
    return DeliveryStreamDescription(
      deliveryStreamARN: json['DeliveryStreamARN'] as String,
      deliveryStreamName: json['DeliveryStreamName'] as String,
      deliveryStreamStatus:
          (json['DeliveryStreamStatus'] as String).toDeliveryStreamStatus(),
      deliveryStreamType:
          (json['DeliveryStreamType'] as String).toDeliveryStreamType(),
      destinations: (json['Destinations'] as List)
          .whereNotNull()
          .map(
              (e) => DestinationDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMoreDestinations: json['HasMoreDestinations'] as bool,
      versionId: json['VersionId'] as String,
      createTimestamp: timeStampFromJson(json['CreateTimestamp']),
      deliveryStreamEncryptionConfiguration:
          json['DeliveryStreamEncryptionConfiguration'] != null
              ? DeliveryStreamEncryptionConfiguration.fromJson(
                  json['DeliveryStreamEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      failureDescription: json['FailureDescription'] != null
          ? FailureDescription.fromJson(
              json['FailureDescription'] as Map<String, dynamic>)
          : null,
      lastUpdateTimestamp: timeStampFromJson(json['LastUpdateTimestamp']),
      source: json['Source'] != null
          ? SourceDescription.fromJson(json['Source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamARN = this.deliveryStreamARN;
    final deliveryStreamName = this.deliveryStreamName;
    final deliveryStreamStatus = this.deliveryStreamStatus;
    final deliveryStreamType = this.deliveryStreamType;
    final destinations = this.destinations;
    final hasMoreDestinations = this.hasMoreDestinations;
    final versionId = this.versionId;
    final createTimestamp = this.createTimestamp;
    final deliveryStreamEncryptionConfiguration =
        this.deliveryStreamEncryptionConfiguration;
    final failureDescription = this.failureDescription;
    final lastUpdateTimestamp = this.lastUpdateTimestamp;
    final source = this.source;
    return {
      'DeliveryStreamARN': deliveryStreamARN,
      'DeliveryStreamName': deliveryStreamName,
      'DeliveryStreamStatus': deliveryStreamStatus.toValue(),
      'DeliveryStreamType': deliveryStreamType.toValue(),
      'Destinations': destinations,
      'HasMoreDestinations': hasMoreDestinations,
      'VersionId': versionId,
      if (createTimestamp != null)
        'CreateTimestamp': unixTimestampToJson(createTimestamp),
      if (deliveryStreamEncryptionConfiguration != null)
        'DeliveryStreamEncryptionConfiguration':
            deliveryStreamEncryptionConfiguration,
      if (failureDescription != null) 'FailureDescription': failureDescription,
      if (lastUpdateTimestamp != null)
        'LastUpdateTimestamp': unixTimestampToJson(lastUpdateTimestamp),
      if (source != null) 'Source': source,
    };
  }
}

/// Contains information about the server-side encryption (SSE) status for the
/// delivery stream, the type customer master key (CMK) in use, if any, and the
/// ARN of the CMK. You can get
/// <code>DeliveryStreamEncryptionConfiguration</code> by invoking the
/// <a>DescribeDeliveryStream</a> operation.
class DeliveryStreamEncryptionConfiguration {
  /// Provides details in case one of the following operations fails due to an
  /// error related to KMS: <a>CreateDeliveryStream</a>,
  /// <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>,
  /// <a>StopDeliveryStreamEncryption</a>.
  final FailureDescription? failureDescription;

  /// If <code>KeyType</code> is <code>CUSTOMER_MANAGED_CMK</code>, this field
  /// contains the ARN of the customer managed CMK. If <code>KeyType</code> is
  /// <code>Amazon Web Services_OWNED_CMK</code>,
  /// <code>DeliveryStreamEncryptionConfiguration</code> doesn't contain a value
  /// for <code>KeyARN</code>.
  final String? keyARN;

  /// Indicates the type of customer master key (CMK) that is used for encryption.
  /// The default setting is <code>Amazon Web Services_OWNED_CMK</code>. For more
  /// information about CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">Customer
  /// Master Keys (CMKs)</a>.
  final KeyType? keyType;

  /// This is the server-side encryption (SSE) status for the delivery stream. For
  /// a full description of the different values of this status, see
  /// <a>StartDeliveryStreamEncryption</a> and
  /// <a>StopDeliveryStreamEncryption</a>. If this status is
  /// <code>ENABLING_FAILED</code> or <code>DISABLING_FAILED</code>, it is the
  /// status of the most recent attempt to enable or disable SSE, respectively.
  final DeliveryStreamEncryptionStatus? status;

  DeliveryStreamEncryptionConfiguration({
    this.failureDescription,
    this.keyARN,
    this.keyType,
    this.status,
  });

  factory DeliveryStreamEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DeliveryStreamEncryptionConfiguration(
      failureDescription: json['FailureDescription'] != null
          ? FailureDescription.fromJson(
              json['FailureDescription'] as Map<String, dynamic>)
          : null,
      keyARN: json['KeyARN'] as String?,
      keyType: (json['KeyType'] as String?)?.toKeyType(),
      status: (json['Status'] as String?)?.toDeliveryStreamEncryptionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureDescription = this.failureDescription;
    final keyARN = this.keyARN;
    final keyType = this.keyType;
    final status = this.status;
    return {
      if (failureDescription != null) 'FailureDescription': failureDescription,
      if (keyARN != null) 'KeyARN': keyARN,
      if (keyType != null) 'KeyType': keyType.toValue(),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Specifies the type and Amazon Resource Name (ARN) of the CMK to use for
/// Server-Side Encryption (SSE).
class DeliveryStreamEncryptionConfigurationInput {
  /// Indicates the type of customer master key (CMK) to use for encryption. The
  /// default setting is <code>Amazon Web Services_OWNED_CMK</code>. For more
  /// information about CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys">Customer
  /// Master Keys (CMKs)</a>. When you invoke <a>CreateDeliveryStream</a> or
  /// <a>StartDeliveryStreamEncryption</a> with <code>KeyType</code> set to
  /// CUSTOMER_MANAGED_CMK, Firehose invokes the Amazon KMS operation <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateGrant.html">CreateGrant</a>
  /// to create a grant that allows the Firehose service to use the customer
  /// managed CMK to perform encryption and decryption. Firehose manages that
  /// grant.
  ///
  /// When you invoke <a>StartDeliveryStreamEncryption</a> to change the CMK for a
  /// delivery stream that is encrypted with a customer managed CMK, Firehose
  /// schedules the grant it had on the old CMK for retirement.
  ///
  /// You can use a CMK of type CUSTOMER_MANAGED_CMK to encrypt up to 500 delivery
  /// streams. If a <a>CreateDeliveryStream</a> or
  /// <a>StartDeliveryStreamEncryption</a> operation exceeds this limit, Firehose
  /// throws a <code>LimitExceededException</code>.
  /// <important>
  /// To encrypt your delivery stream, use symmetric CMKs. Firehose doesn't
  /// support asymmetric CMKs. For information about symmetric and asymmetric
  /// CMKs, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html">About
  /// Symmetric and Asymmetric CMKs</a> in the Amazon Web Services Key Management
  /// Service developer guide.
  /// </important>
  final KeyType keyType;

  /// If you set <code>KeyType</code> to <code>CUSTOMER_MANAGED_CMK</code>, you
  /// must specify the Amazon Resource Name (ARN) of the CMK. If you set
  /// <code>KeyType</code> to <code>Amazon Web Services_OWNED_CMK</code>, Firehose
  /// uses a service-account CMK.
  final String? keyARN;

  DeliveryStreamEncryptionConfigurationInput({
    required this.keyType,
    this.keyARN,
  });

  Map<String, dynamic> toJson() {
    final keyType = this.keyType;
    final keyARN = this.keyARN;
    return {
      'KeyType': keyType.toValue(),
      if (keyARN != null) 'KeyARN': keyARN,
    };
  }
}

enum DeliveryStreamEncryptionStatus {
  enabled,
  enabling,
  enablingFailed,
  disabled,
  disabling,
  disablingFailed,
}

extension DeliveryStreamEncryptionStatusValueExtension
    on DeliveryStreamEncryptionStatus {
  String toValue() {
    switch (this) {
      case DeliveryStreamEncryptionStatus.enabled:
        return 'ENABLED';
      case DeliveryStreamEncryptionStatus.enabling:
        return 'ENABLING';
      case DeliveryStreamEncryptionStatus.enablingFailed:
        return 'ENABLING_FAILED';
      case DeliveryStreamEncryptionStatus.disabled:
        return 'DISABLED';
      case DeliveryStreamEncryptionStatus.disabling:
        return 'DISABLING';
      case DeliveryStreamEncryptionStatus.disablingFailed:
        return 'DISABLING_FAILED';
    }
  }
}

extension DeliveryStreamEncryptionStatusFromString on String {
  DeliveryStreamEncryptionStatus toDeliveryStreamEncryptionStatus() {
    switch (this) {
      case 'ENABLED':
        return DeliveryStreamEncryptionStatus.enabled;
      case 'ENABLING':
        return DeliveryStreamEncryptionStatus.enabling;
      case 'ENABLING_FAILED':
        return DeliveryStreamEncryptionStatus.enablingFailed;
      case 'DISABLED':
        return DeliveryStreamEncryptionStatus.disabled;
      case 'DISABLING':
        return DeliveryStreamEncryptionStatus.disabling;
      case 'DISABLING_FAILED':
        return DeliveryStreamEncryptionStatus.disablingFailed;
    }
    throw Exception(
        '$this is not known in enum DeliveryStreamEncryptionStatus');
  }
}

enum DeliveryStreamFailureType {
  retireKmsGrantFailed,
  createKmsGrantFailed,
  kmsAccessDenied,
  disabledKmsKey,
  invalidKmsKey,
  kmsKeyNotFound,
  kmsOptInRequired,
  createEniFailed,
  deleteEniFailed,
  subnetNotFound,
  securityGroupNotFound,
  eniAccessDenied,
  subnetAccessDenied,
  securityGroupAccessDenied,
  unknownError,
}

extension DeliveryStreamFailureTypeValueExtension on DeliveryStreamFailureType {
  String toValue() {
    switch (this) {
      case DeliveryStreamFailureType.retireKmsGrantFailed:
        return 'RETIRE_KMS_GRANT_FAILED';
      case DeliveryStreamFailureType.createKmsGrantFailed:
        return 'CREATE_KMS_GRANT_FAILED';
      case DeliveryStreamFailureType.kmsAccessDenied:
        return 'KMS_ACCESS_DENIED';
      case DeliveryStreamFailureType.disabledKmsKey:
        return 'DISABLED_KMS_KEY';
      case DeliveryStreamFailureType.invalidKmsKey:
        return 'INVALID_KMS_KEY';
      case DeliveryStreamFailureType.kmsKeyNotFound:
        return 'KMS_KEY_NOT_FOUND';
      case DeliveryStreamFailureType.kmsOptInRequired:
        return 'KMS_OPT_IN_REQUIRED';
      case DeliveryStreamFailureType.createEniFailed:
        return 'CREATE_ENI_FAILED';
      case DeliveryStreamFailureType.deleteEniFailed:
        return 'DELETE_ENI_FAILED';
      case DeliveryStreamFailureType.subnetNotFound:
        return 'SUBNET_NOT_FOUND';
      case DeliveryStreamFailureType.securityGroupNotFound:
        return 'SECURITY_GROUP_NOT_FOUND';
      case DeliveryStreamFailureType.eniAccessDenied:
        return 'ENI_ACCESS_DENIED';
      case DeliveryStreamFailureType.subnetAccessDenied:
        return 'SUBNET_ACCESS_DENIED';
      case DeliveryStreamFailureType.securityGroupAccessDenied:
        return 'SECURITY_GROUP_ACCESS_DENIED';
      case DeliveryStreamFailureType.unknownError:
        return 'UNKNOWN_ERROR';
    }
  }
}

extension DeliveryStreamFailureTypeFromString on String {
  DeliveryStreamFailureType toDeliveryStreamFailureType() {
    switch (this) {
      case 'RETIRE_KMS_GRANT_FAILED':
        return DeliveryStreamFailureType.retireKmsGrantFailed;
      case 'CREATE_KMS_GRANT_FAILED':
        return DeliveryStreamFailureType.createKmsGrantFailed;
      case 'KMS_ACCESS_DENIED':
        return DeliveryStreamFailureType.kmsAccessDenied;
      case 'DISABLED_KMS_KEY':
        return DeliveryStreamFailureType.disabledKmsKey;
      case 'INVALID_KMS_KEY':
        return DeliveryStreamFailureType.invalidKmsKey;
      case 'KMS_KEY_NOT_FOUND':
        return DeliveryStreamFailureType.kmsKeyNotFound;
      case 'KMS_OPT_IN_REQUIRED':
        return DeliveryStreamFailureType.kmsOptInRequired;
      case 'CREATE_ENI_FAILED':
        return DeliveryStreamFailureType.createEniFailed;
      case 'DELETE_ENI_FAILED':
        return DeliveryStreamFailureType.deleteEniFailed;
      case 'SUBNET_NOT_FOUND':
        return DeliveryStreamFailureType.subnetNotFound;
      case 'SECURITY_GROUP_NOT_FOUND':
        return DeliveryStreamFailureType.securityGroupNotFound;
      case 'ENI_ACCESS_DENIED':
        return DeliveryStreamFailureType.eniAccessDenied;
      case 'SUBNET_ACCESS_DENIED':
        return DeliveryStreamFailureType.subnetAccessDenied;
      case 'SECURITY_GROUP_ACCESS_DENIED':
        return DeliveryStreamFailureType.securityGroupAccessDenied;
      case 'UNKNOWN_ERROR':
        return DeliveryStreamFailureType.unknownError;
    }
    throw Exception('$this is not known in enum DeliveryStreamFailureType');
  }
}

enum DeliveryStreamStatus {
  creating,
  creatingFailed,
  deleting,
  deletingFailed,
  active,
}

extension DeliveryStreamStatusValueExtension on DeliveryStreamStatus {
  String toValue() {
    switch (this) {
      case DeliveryStreamStatus.creating:
        return 'CREATING';
      case DeliveryStreamStatus.creatingFailed:
        return 'CREATING_FAILED';
      case DeliveryStreamStatus.deleting:
        return 'DELETING';
      case DeliveryStreamStatus.deletingFailed:
        return 'DELETING_FAILED';
      case DeliveryStreamStatus.active:
        return 'ACTIVE';
    }
  }
}

extension DeliveryStreamStatusFromString on String {
  DeliveryStreamStatus toDeliveryStreamStatus() {
    switch (this) {
      case 'CREATING':
        return DeliveryStreamStatus.creating;
      case 'CREATING_FAILED':
        return DeliveryStreamStatus.creatingFailed;
      case 'DELETING':
        return DeliveryStreamStatus.deleting;
      case 'DELETING_FAILED':
        return DeliveryStreamStatus.deletingFailed;
      case 'ACTIVE':
        return DeliveryStreamStatus.active;
    }
    throw Exception('$this is not known in enum DeliveryStreamStatus');
  }
}

enum DeliveryStreamType {
  directPut,
  kinesisStreamAsSource,
  mSKAsSource,
}

extension DeliveryStreamTypeValueExtension on DeliveryStreamType {
  String toValue() {
    switch (this) {
      case DeliveryStreamType.directPut:
        return 'DirectPut';
      case DeliveryStreamType.kinesisStreamAsSource:
        return 'KinesisStreamAsSource';
      case DeliveryStreamType.mSKAsSource:
        return 'MSKAsSource';
    }
  }
}

extension DeliveryStreamTypeFromString on String {
  DeliveryStreamType toDeliveryStreamType() {
    switch (this) {
      case 'DirectPut':
        return DeliveryStreamType.directPut;
      case 'KinesisStreamAsSource':
        return DeliveryStreamType.kinesisStreamAsSource;
      case 'MSKAsSource':
        return DeliveryStreamType.mSKAsSource;
    }
    throw Exception('$this is not known in enum DeliveryStreamType');
  }
}

class DescribeDeliveryStreamOutput {
  /// Information about the delivery stream.
  final DeliveryStreamDescription deliveryStreamDescription;

  DescribeDeliveryStreamOutput({
    required this.deliveryStreamDescription,
  });

  factory DescribeDeliveryStreamOutput.fromJson(Map<String, dynamic> json) {
    return DescribeDeliveryStreamOutput(
      deliveryStreamDescription: DeliveryStreamDescription.fromJson(
          json['DeliveryStreamDescription'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamDescription = this.deliveryStreamDescription;
    return {
      'DeliveryStreamDescription': deliveryStreamDescription,
    };
  }
}

/// The deserializer you want Firehose to use for converting the input data from
/// JSON. Firehose then serializes the data to its final format using the
/// <a>Serializer</a>. Firehose supports two types of deserializers: the <a
/// href="https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-JSON">Apache
/// Hive JSON SerDe</a> and the <a
/// href="https://github.com/rcongiu/Hive-JSON-Serde">OpenX JSON SerDe</a>.
class Deserializer {
  /// The native Hive / HCatalog JsonSerDe. Used by Firehose for deserializing
  /// data, which means converting it from the JSON format in preparation for
  /// serializing it to the Parquet or ORC format. This is one of two
  /// deserializers you can choose, depending on which one offers the
  /// functionality you need. The other option is the OpenX SerDe.
  final HiveJsonSerDe? hiveJsonSerDe;

  /// The OpenX SerDe. Used by Firehose for deserializing data, which means
  /// converting it from the JSON format in preparation for serializing it to the
  /// Parquet or ORC format. This is one of two deserializers you can choose,
  /// depending on which one offers the functionality you need. The other option
  /// is the native Hive / HCatalog JsonSerDe.
  final OpenXJsonSerDe? openXJsonSerDe;

  Deserializer({
    this.hiveJsonSerDe,
    this.openXJsonSerDe,
  });

  factory Deserializer.fromJson(Map<String, dynamic> json) {
    return Deserializer(
      hiveJsonSerDe: json['HiveJsonSerDe'] != null
          ? HiveJsonSerDe.fromJson(
              json['HiveJsonSerDe'] as Map<String, dynamic>)
          : null,
      openXJsonSerDe: json['OpenXJsonSerDe'] != null
          ? OpenXJsonSerDe.fromJson(
              json['OpenXJsonSerDe'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hiveJsonSerDe = this.hiveJsonSerDe;
    final openXJsonSerDe = this.openXJsonSerDe;
    return {
      if (hiveJsonSerDe != null) 'HiveJsonSerDe': hiveJsonSerDe,
      if (openXJsonSerDe != null) 'OpenXJsonSerDe': openXJsonSerDe,
    };
  }
}

/// Describes the destination for a delivery stream.
class DestinationDescription {
  /// The ID of the destination.
  final String destinationId;

  /// The destination in the Serverless offering for Amazon OpenSearch Service.
  final AmazonOpenSearchServerlessDestinationDescription?
      amazonOpenSearchServerlessDestinationDescription;

  /// The destination in Amazon OpenSearch Service.
  final AmazonopensearchserviceDestinationDescription?
      amazonopensearchserviceDestinationDescription;

  /// The destination in Amazon ES.
  final ElasticsearchDestinationDescription?
      elasticsearchDestinationDescription;

  /// The destination in Amazon S3.
  final ExtendedS3DestinationDescription? extendedS3DestinationDescription;

  /// Describes the specified HTTP endpoint destination.
  final HttpEndpointDestinationDescription? httpEndpointDestinationDescription;

  /// The destination in Amazon Redshift.
  final RedshiftDestinationDescription? redshiftDestinationDescription;

  /// [Deprecated] The destination in Amazon S3.
  final S3DestinationDescription? s3DestinationDescription;

  /// Optional description for the destination
  final SnowflakeDestinationDescription? snowflakeDestinationDescription;

  /// The destination in Splunk.
  final SplunkDestinationDescription? splunkDestinationDescription;

  DestinationDescription({
    required this.destinationId,
    this.amazonOpenSearchServerlessDestinationDescription,
    this.amazonopensearchserviceDestinationDescription,
    this.elasticsearchDestinationDescription,
    this.extendedS3DestinationDescription,
    this.httpEndpointDestinationDescription,
    this.redshiftDestinationDescription,
    this.s3DestinationDescription,
    this.snowflakeDestinationDescription,
    this.splunkDestinationDescription,
  });

  factory DestinationDescription.fromJson(Map<String, dynamic> json) {
    return DestinationDescription(
      destinationId: json['DestinationId'] as String,
      amazonOpenSearchServerlessDestinationDescription:
          json['AmazonOpenSearchServerlessDestinationDescription'] != null
              ? AmazonOpenSearchServerlessDestinationDescription.fromJson(
                  json['AmazonOpenSearchServerlessDestinationDescription']
                      as Map<String, dynamic>)
              : null,
      amazonopensearchserviceDestinationDescription:
          json['AmazonopensearchserviceDestinationDescription'] != null
              ? AmazonopensearchserviceDestinationDescription.fromJson(
                  json['AmazonopensearchserviceDestinationDescription']
                      as Map<String, dynamic>)
              : null,
      elasticsearchDestinationDescription:
          json['ElasticsearchDestinationDescription'] != null
              ? ElasticsearchDestinationDescription.fromJson(
                  json['ElasticsearchDestinationDescription']
                      as Map<String, dynamic>)
              : null,
      extendedS3DestinationDescription:
          json['ExtendedS3DestinationDescription'] != null
              ? ExtendedS3DestinationDescription.fromJson(
                  json['ExtendedS3DestinationDescription']
                      as Map<String, dynamic>)
              : null,
      httpEndpointDestinationDescription:
          json['HttpEndpointDestinationDescription'] != null
              ? HttpEndpointDestinationDescription.fromJson(
                  json['HttpEndpointDestinationDescription']
                      as Map<String, dynamic>)
              : null,
      redshiftDestinationDescription: json['RedshiftDestinationDescription'] !=
              null
          ? RedshiftDestinationDescription.fromJson(
              json['RedshiftDestinationDescription'] as Map<String, dynamic>)
          : null,
      s3DestinationDescription: json['S3DestinationDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3DestinationDescription'] as Map<String, dynamic>)
          : null,
      snowflakeDestinationDescription:
          json['SnowflakeDestinationDescription'] != null
              ? SnowflakeDestinationDescription.fromJson(
                  json['SnowflakeDestinationDescription']
                      as Map<String, dynamic>)
              : null,
      splunkDestinationDescription: json['SplunkDestinationDescription'] != null
          ? SplunkDestinationDescription.fromJson(
              json['SplunkDestinationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationId = this.destinationId;
    final amazonOpenSearchServerlessDestinationDescription =
        this.amazonOpenSearchServerlessDestinationDescription;
    final amazonopensearchserviceDestinationDescription =
        this.amazonopensearchserviceDestinationDescription;
    final elasticsearchDestinationDescription =
        this.elasticsearchDestinationDescription;
    final extendedS3DestinationDescription =
        this.extendedS3DestinationDescription;
    final httpEndpointDestinationDescription =
        this.httpEndpointDestinationDescription;
    final redshiftDestinationDescription = this.redshiftDestinationDescription;
    final s3DestinationDescription = this.s3DestinationDescription;
    final snowflakeDestinationDescription =
        this.snowflakeDestinationDescription;
    final splunkDestinationDescription = this.splunkDestinationDescription;
    return {
      'DestinationId': destinationId,
      if (amazonOpenSearchServerlessDestinationDescription != null)
        'AmazonOpenSearchServerlessDestinationDescription':
            amazonOpenSearchServerlessDestinationDescription,
      if (amazonopensearchserviceDestinationDescription != null)
        'AmazonopensearchserviceDestinationDescription':
            amazonopensearchserviceDestinationDescription,
      if (elasticsearchDestinationDescription != null)
        'ElasticsearchDestinationDescription':
            elasticsearchDestinationDescription,
      if (extendedS3DestinationDescription != null)
        'ExtendedS3DestinationDescription': extendedS3DestinationDescription,
      if (httpEndpointDestinationDescription != null)
        'HttpEndpointDestinationDescription':
            httpEndpointDestinationDescription,
      if (redshiftDestinationDescription != null)
        'RedshiftDestinationDescription': redshiftDestinationDescription,
      if (s3DestinationDescription != null)
        'S3DestinationDescription': s3DestinationDescription,
      if (snowflakeDestinationDescription != null)
        'SnowflakeDestinationDescription': snowflakeDestinationDescription,
      if (splunkDestinationDescription != null)
        'SplunkDestinationDescription': splunkDestinationDescription,
    };
  }
}

/// Indicates the method for setting up document ID. The supported methods are
/// Firehose generated document ID and OpenSearch Service generated document ID.
/// <p/>
class DocumentIdOptions {
  /// When the <code>FIREHOSE_DEFAULT</code> option is chosen, Firehose generates
  /// a unique document ID for each record based on a unique internal identifier.
  /// The generated document ID is stable across multiple delivery attempts, which
  /// helps prevent the same record from being indexed multiple times with
  /// different document IDs.
  ///
  /// When the <code>NO_DOCUMENT_ID</code> option is chosen, Firehose does not
  /// include any document IDs in the requests it sends to the Amazon OpenSearch
  /// Service. This causes the Amazon OpenSearch Service domain to generate
  /// document IDs. In case of multiple delivery attempts, this may cause the same
  /// record to be indexed more than once with different document IDs. This option
  /// enables write-heavy operations, such as the ingestion of logs and
  /// observability data, to consume less resources in the Amazon OpenSearch
  /// Service domain, resulting in improved performance.
  final DefaultDocumentIdFormat defaultDocumentIdFormat;

  DocumentIdOptions({
    required this.defaultDocumentIdFormat,
  });

  factory DocumentIdOptions.fromJson(Map<String, dynamic> json) {
    return DocumentIdOptions(
      defaultDocumentIdFormat: (json['DefaultDocumentIdFormat'] as String)
          .toDefaultDocumentIdFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultDocumentIdFormat = this.defaultDocumentIdFormat;
    return {
      'DefaultDocumentIdFormat': defaultDocumentIdFormat.toValue(),
    };
  }
}

/// The configuration of the dynamic partitioning mechanism that creates smaller
/// data sets from the streaming data by partitioning it based on partition
/// keys. Currently, dynamic partitioning is only supported for Amazon S3
/// destinations.
class DynamicPartitioningConfiguration {
  /// Specifies that the dynamic partitioning is enabled for this Firehose
  /// delivery stream.
  final bool? enabled;

  /// The retry behavior in case Firehose is unable to deliver data to an Amazon
  /// S3 prefix.
  final RetryOptions? retryOptions;

  DynamicPartitioningConfiguration({
    this.enabled,
    this.retryOptions,
  });

  factory DynamicPartitioningConfiguration.fromJson(Map<String, dynamic> json) {
    return DynamicPartitioningConfiguration(
      enabled: json['Enabled'] as bool?,
      retryOptions: json['RetryOptions'] != null
          ? RetryOptions.fromJson(json['RetryOptions'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final retryOptions = this.retryOptions;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (retryOptions != null) 'RetryOptions': retryOptions,
    };
  }
}

/// Describes the buffering to perform before delivering data to the Amazon ES
/// destination.
class ElasticsearchBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300 (5 minutes).
  final int? intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it to
  /// the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10 MB
  /// or higher.
  final int? sizeInMBs;

  ElasticsearchBufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });

  factory ElasticsearchBufferingHints.fromJson(Map<String, dynamic> json) {
    return ElasticsearchBufferingHints(
      intervalInSeconds: json['IntervalInSeconds'] as int?,
      sizeInMBs: json['SizeInMBs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final intervalInSeconds = this.intervalInSeconds;
    final sizeInMBs = this.sizeInMBs;
    return {
      if (intervalInSeconds != null) 'IntervalInSeconds': intervalInSeconds,
      if (sizeInMBs != null) 'SizeInMBs': sizeInMBs,
    };
  }
}

/// Describes the configuration of a destination in Amazon ES.
class ElasticsearchDestinationConfiguration {
  /// The Elasticsearch index name.
  final String indexName;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for
  /// calling the Amazon ES Configuration API and for indexing documents. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant
  /// Firehose Access to an Amazon S3 Destination</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String roleARN;

  /// The configuration for the backup Amazon S3 location.
  final S3DestinationConfiguration s3Configuration;

  /// The buffering options. If no value is specified, the default values for
  /// <code>ElasticsearchBufferingHints</code> are used.
  final ElasticsearchBufferingHints? bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Specify either this
  /// <code>ClusterEndpoint</code> or the <code>DomainARN</code> field.
  final String? clusterEndpoint;

  /// Indicates the method for setting up document ID. The supported methods are
  /// Firehose generated document ID and OpenSearch Service generated document ID.
  final DocumentIdOptions? documentIdOptions;

  /// The ARN of the Amazon ES domain. The IAM role must have permissions
  /// for <code>DescribeDomain</code>, <code>DescribeDomains</code>, and
  /// <code>DescribeDomainConfig</code> after assuming the role specified in
  /// <b>RoleARN</b>. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  ///
  /// Specify either <code>ClusterEndpoint</code> or <code>DomainARN</code>.
  final String? domainARN;

  /// The Elasticsearch index rotation period. Index rotation appends a timestamp
  /// to the <code>IndexName</code> to facilitate the expiration of old data. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation">Index
  /// Rotation for the Amazon ES Destination</a>. The default value
  /// is <code>OneDay</code>.
  final ElasticsearchIndexRotationPeriod? indexRotationPeriod;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to Amazon
  /// ES. The default value is 300 (5 minutes).
  final ElasticsearchRetryOptions? retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When it is set to
  /// <code>FailedDocumentsOnly</code>, Firehose writes any documents that could
  /// not be indexed to the configured Amazon S3 destination, with
  /// <code>AmazonOpenSearchService-failed/</code> appended to the key prefix.
  /// When set to <code>AllDocuments</code>, Firehose delivers all incoming
  /// records to Amazon S3, and also writes failed documents with
  /// <code>AmazonOpenSearchService-failed/</code> appended to the prefix. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-s3-backup">Amazon
  /// S3 Backup for the Amazon ES Destination</a>. Default value is
  /// <code>FailedDocumentsOnly</code>.
  ///
  /// You can't change this backup mode after you create the delivery stream.
  final ElasticsearchS3BackupMode? s3BackupMode;

  /// The Elasticsearch type name. For Elasticsearch 6.x, there can be only one
  /// type per index. If you try to specify a new type for an existing index that
  /// already has another type, Firehose returns an error during run time.
  ///
  /// For Elasticsearch 7.x, don't specify a <code>TypeName</code>.
  final String? typeName;

  /// The details of the VPC of the Amazon destination.
  final VpcConfiguration? vpcConfiguration;

  ElasticsearchDestinationConfiguration({
    required this.indexName,
    required this.roleARN,
    required this.s3Configuration,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.documentIdOptions,
    this.domainARN,
    this.indexRotationPeriod,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
    this.typeName,
    this.vpcConfiguration,
  });

  Map<String, dynamic> toJson() {
    final indexName = this.indexName;
    final roleARN = this.roleARN;
    final s3Configuration = this.s3Configuration;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final clusterEndpoint = this.clusterEndpoint;
    final documentIdOptions = this.documentIdOptions;
    final domainARN = this.domainARN;
    final indexRotationPeriod = this.indexRotationPeriod;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupMode = this.s3BackupMode;
    final typeName = this.typeName;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'IndexName': indexName,
      'RoleARN': roleARN,
      'S3Configuration': s3Configuration,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (clusterEndpoint != null) 'ClusterEndpoint': clusterEndpoint,
      if (documentIdOptions != null) 'DocumentIdOptions': documentIdOptions,
      if (domainARN != null) 'DomainARN': domainARN,
      if (indexRotationPeriod != null)
        'IndexRotationPeriod': indexRotationPeriod.toValue(),
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (typeName != null) 'TypeName': typeName,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// The destination description in Amazon ES.
class ElasticsearchDestinationDescription {
  /// The buffering options.
  final ElasticsearchBufferingHints? bufferingHints;

  /// The Amazon CloudWatch logging options.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Firehose uses
  /// either this <code>ClusterEndpoint</code> or the <code>DomainARN</code> field
  /// to send data to Amazon ES.
  final String? clusterEndpoint;

  /// Indicates the method for setting up document ID. The supported methods are
  /// Firehose generated document ID and OpenSearch Service generated document ID.
  final DocumentIdOptions? documentIdOptions;

  /// The ARN of the Amazon ES domain. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  ///
  /// Firehose uses either <code>ClusterEndpoint</code> or <code>DomainARN</code>
  /// to send data to Amazon ES.
  final String? domainARN;

  /// The Elasticsearch index name.
  final String? indexName;

  /// The Elasticsearch index rotation period
  final ElasticsearchIndexRotationPeriod? indexRotationPeriod;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The Amazon ES retry options.
  final ElasticsearchRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String? roleARN;

  /// The Amazon S3 backup mode.
  final ElasticsearchS3BackupMode? s3BackupMode;

  /// The Amazon S3 destination.
  final S3DestinationDescription? s3DestinationDescription;

  /// The Elasticsearch type name. This applies to Elasticsearch 6.x and lower
  /// versions. For Elasticsearch 7.x and OpenSearch Service 1.x, there's no value
  /// for <code>TypeName</code>.
  final String? typeName;

  /// The details of the VPC of the Amazon OpenSearch or the Amazon OpenSearch
  /// Serverless destination.
  final VpcConfigurationDescription? vpcConfigurationDescription;

  ElasticsearchDestinationDescription({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.documentIdOptions,
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
      Map<String, dynamic> json) {
    return ElasticsearchDestinationDescription(
      bufferingHints: json['BufferingHints'] != null
          ? ElasticsearchBufferingHints.fromJson(
              json['BufferingHints'] as Map<String, dynamic>)
          : null,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      clusterEndpoint: json['ClusterEndpoint'] as String?,
      documentIdOptions: json['DocumentIdOptions'] != null
          ? DocumentIdOptions.fromJson(
              json['DocumentIdOptions'] as Map<String, dynamic>)
          : null,
      domainARN: json['DomainARN'] as String?,
      indexName: json['IndexName'] as String?,
      indexRotationPeriod: (json['IndexRotationPeriod'] as String?)
          ?.toElasticsearchIndexRotationPeriod(),
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      retryOptions: json['RetryOptions'] != null
          ? ElasticsearchRetryOptions.fromJson(
              json['RetryOptions'] as Map<String, dynamic>)
          : null,
      roleARN: json['RoleARN'] as String?,
      s3BackupMode:
          (json['S3BackupMode'] as String?)?.toElasticsearchS3BackupMode(),
      s3DestinationDescription: json['S3DestinationDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3DestinationDescription'] as Map<String, dynamic>)
          : null,
      typeName: json['TypeName'] as String?,
      vpcConfigurationDescription: json['VpcConfigurationDescription'] != null
          ? VpcConfigurationDescription.fromJson(
              json['VpcConfigurationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final clusterEndpoint = this.clusterEndpoint;
    final documentIdOptions = this.documentIdOptions;
    final domainARN = this.domainARN;
    final indexName = this.indexName;
    final indexRotationPeriod = this.indexRotationPeriod;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3DestinationDescription = this.s3DestinationDescription;
    final typeName = this.typeName;
    final vpcConfigurationDescription = this.vpcConfigurationDescription;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (clusterEndpoint != null) 'ClusterEndpoint': clusterEndpoint,
      if (documentIdOptions != null) 'DocumentIdOptions': documentIdOptions,
      if (domainARN != null) 'DomainARN': domainARN,
      if (indexName != null) 'IndexName': indexName,
      if (indexRotationPeriod != null)
        'IndexRotationPeriod': indexRotationPeriod.toValue(),
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3DestinationDescription != null)
        'S3DestinationDescription': s3DestinationDescription,
      if (typeName != null) 'TypeName': typeName,
      if (vpcConfigurationDescription != null)
        'VpcConfigurationDescription': vpcConfigurationDescription,
    };
  }
}

/// Describes an update for a destination in Amazon ES.
class ElasticsearchDestinationUpdate {
  /// The buffering options. If no value is specified,
  /// <code>ElasticsearchBufferingHints</code> object default values are used.
  final ElasticsearchBufferingHints? bufferingHints;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The endpoint to use when communicating with the cluster. Specify either this
  /// <code>ClusterEndpoint</code> or the <code>DomainARN</code> field.
  final String? clusterEndpoint;

  /// Indicates the method for setting up document ID. The supported methods are
  /// Firehose generated document ID and OpenSearch Service generated document ID.
  final DocumentIdOptions? documentIdOptions;

  /// The ARN of the Amazon ES domain. The IAM role must have permissions
  /// for <code>DescribeDomain</code>, <code>DescribeDomains</code>, and
  /// <code>DescribeDomainConfig</code> after assuming the IAM role specified in
  /// <code>RoleARN</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  ///
  /// Specify either <code>ClusterEndpoint</code> or <code>DomainARN</code>.
  final String? domainARN;

  /// The Elasticsearch index name.
  final String? indexName;

  /// The Elasticsearch index rotation period. Index rotation appends a timestamp
  /// to <code>IndexName</code> to facilitate the expiration of old data. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation">Index
  /// Rotation for the Amazon ES Destination</a>. Default value
  /// is <code>OneDay</code>.
  final ElasticsearchIndexRotationPeriod? indexRotationPeriod;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to Amazon
  /// ES. The default value is 300 (5 minutes).
  final ElasticsearchRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for
  /// calling the Amazon ES Configuration API and for indexing documents. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3">Grant
  /// Firehose Access to an Amazon S3 Destination</a> and <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String? roleARN;

  /// The Amazon S3 destination.
  final S3DestinationUpdate? s3Update;

  /// The Elasticsearch type name. For Elasticsearch 6.x, there can be only one
  /// type per index. If you try to specify a new type for an existing index that
  /// already has another type, Firehose returns an error during runtime.
  ///
  /// If you upgrade Elasticsearch from 6.x to 7.x and don’t update your delivery
  /// stream, Firehose still delivers data to Elasticsearch with the old index
  /// name and type name. If you want to update your delivery stream with a new
  /// index name, provide an empty string for <code>TypeName</code>.
  final String? typeName;

  ElasticsearchDestinationUpdate({
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.clusterEndpoint,
    this.documentIdOptions,
    this.domainARN,
    this.indexName,
    this.indexRotationPeriod,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3Update,
    this.typeName,
  });

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final clusterEndpoint = this.clusterEndpoint;
    final documentIdOptions = this.documentIdOptions;
    final domainARN = this.domainARN;
    final indexName = this.indexName;
    final indexRotationPeriod = this.indexRotationPeriod;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3Update = this.s3Update;
    final typeName = this.typeName;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (clusterEndpoint != null) 'ClusterEndpoint': clusterEndpoint,
      if (documentIdOptions != null) 'DocumentIdOptions': documentIdOptions,
      if (domainARN != null) 'DomainARN': domainARN,
      if (indexName != null) 'IndexName': indexName,
      if (indexRotationPeriod != null)
        'IndexRotationPeriod': indexRotationPeriod.toValue(),
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3Update != null) 'S3Update': s3Update,
      if (typeName != null) 'TypeName': typeName,
    };
  }
}

enum ElasticsearchIndexRotationPeriod {
  noRotation,
  oneHour,
  oneDay,
  oneWeek,
  oneMonth,
}

extension ElasticsearchIndexRotationPeriodValueExtension
    on ElasticsearchIndexRotationPeriod {
  String toValue() {
    switch (this) {
      case ElasticsearchIndexRotationPeriod.noRotation:
        return 'NoRotation';
      case ElasticsearchIndexRotationPeriod.oneHour:
        return 'OneHour';
      case ElasticsearchIndexRotationPeriod.oneDay:
        return 'OneDay';
      case ElasticsearchIndexRotationPeriod.oneWeek:
        return 'OneWeek';
      case ElasticsearchIndexRotationPeriod.oneMonth:
        return 'OneMonth';
    }
  }
}

extension ElasticsearchIndexRotationPeriodFromString on String {
  ElasticsearchIndexRotationPeriod toElasticsearchIndexRotationPeriod() {
    switch (this) {
      case 'NoRotation':
        return ElasticsearchIndexRotationPeriod.noRotation;
      case 'OneHour':
        return ElasticsearchIndexRotationPeriod.oneHour;
      case 'OneDay':
        return ElasticsearchIndexRotationPeriod.oneDay;
      case 'OneWeek':
        return ElasticsearchIndexRotationPeriod.oneWeek;
      case 'OneMonth':
        return ElasticsearchIndexRotationPeriod.oneMonth;
    }
    throw Exception(
        '$this is not known in enum ElasticsearchIndexRotationPeriod');
  }
}

/// Configures retry behavior in case Firehose is unable to deliver documents to
/// Amazon ES.
class ElasticsearchRetryOptions {
  /// After an initial failure to deliver to Amazon ES, the total amount of time
  /// during which Firehose retries delivery (including the first attempt). After
  /// this time has elapsed, the failed documents are written to Amazon S3.
  /// Default value is 300 seconds (5 minutes). A value of 0 (zero) results in no
  /// retries.
  final int? durationInSeconds;

  ElasticsearchRetryOptions({
    this.durationInSeconds,
  });

  factory ElasticsearchRetryOptions.fromJson(Map<String, dynamic> json) {
    return ElasticsearchRetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

enum ElasticsearchS3BackupMode {
  failedDocumentsOnly,
  allDocuments,
}

extension ElasticsearchS3BackupModeValueExtension on ElasticsearchS3BackupMode {
  String toValue() {
    switch (this) {
      case ElasticsearchS3BackupMode.failedDocumentsOnly:
        return 'FailedDocumentsOnly';
      case ElasticsearchS3BackupMode.allDocuments:
        return 'AllDocuments';
    }
  }
}

extension ElasticsearchS3BackupModeFromString on String {
  ElasticsearchS3BackupMode toElasticsearchS3BackupMode() {
    switch (this) {
      case 'FailedDocumentsOnly':
        return ElasticsearchS3BackupMode.failedDocumentsOnly;
      case 'AllDocuments':
        return ElasticsearchS3BackupMode.allDocuments;
    }
    throw Exception('$this is not known in enum ElasticsearchS3BackupMode');
  }
}

/// Describes the encryption for a destination in Amazon S3.
class EncryptionConfiguration {
  /// The encryption key.
  final KMSEncryptionConfig? kMSEncryptionConfig;

  /// Specifically override existing encryption information to ensure that no
  /// encryption is used.
  final NoEncryptionConfig? noEncryptionConfig;

  EncryptionConfiguration({
    this.kMSEncryptionConfig,
    this.noEncryptionConfig,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      kMSEncryptionConfig: json['KMSEncryptionConfig'] != null
          ? KMSEncryptionConfig.fromJson(
              json['KMSEncryptionConfig'] as Map<String, dynamic>)
          : null,
      noEncryptionConfig:
          (json['NoEncryptionConfig'] as String?)?.toNoEncryptionConfig(),
    );
  }

  Map<String, dynamic> toJson() {
    final kMSEncryptionConfig = this.kMSEncryptionConfig;
    final noEncryptionConfig = this.noEncryptionConfig;
    return {
      if (kMSEncryptionConfig != null)
        'KMSEncryptionConfig': kMSEncryptionConfig,
      if (noEncryptionConfig != null)
        'NoEncryptionConfig': noEncryptionConfig.toValue(),
    };
  }
}

/// Describes the configuration of a destination in Amazon S3.
class ExtendedS3DestinationConfiguration {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String bucketARN;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String roleARN;

  /// The buffering option.
  final BufferingHints? bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// UNCOMPRESSED.
  final CompressionFormat? compressionFormat;

  /// The time zone you prefer. UTC is the default.
  final String? customTimeZone;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  final DataFormatConversionConfiguration? dataFormatConversionConfiguration;

  /// The configuration of the dynamic partitioning mechanism that creates smaller
  /// data sets from the streaming data by partitioning it based on partition
  /// keys. Currently, dynamic partitioning is only supported for Amazon S3
  /// destinations.
  final DynamicPartitioningConfiguration? dynamicPartitioningConfiguration;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration? encryptionConfiguration;

  /// A prefix that Firehose evaluates and adds to failed records before writing
  /// them to S3. This prefix appears immediately following the bucket name. For
  /// information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? errorOutputPrefix;

  /// Specify a file extension. It will override the default file extension
  final String? fileExtension;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? prefix;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The configuration for backup in Amazon S3.
  final S3DestinationConfiguration? s3BackupConfiguration;

  /// The Amazon S3 backup mode. After you create a delivery stream, you can
  /// update it to enable Amazon S3 backup if it is disabled. If backup is
  /// enabled, you can't update the delivery stream to disable it.
  final S3BackupMode? s3BackupMode;

  ExtendedS3DestinationConfiguration({
    required this.bucketARN,
    required this.roleARN,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.compressionFormat,
    this.customTimeZone,
    this.dataFormatConversionConfiguration,
    this.dynamicPartitioningConfiguration,
    this.encryptionConfiguration,
    this.errorOutputPrefix,
    this.fileExtension,
    this.prefix,
    this.processingConfiguration,
    this.s3BackupConfiguration,
    this.s3BackupMode,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final roleARN = this.roleARN;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final compressionFormat = this.compressionFormat;
    final customTimeZone = this.customTimeZone;
    final dataFormatConversionConfiguration =
        this.dataFormatConversionConfiguration;
    final dynamicPartitioningConfiguration =
        this.dynamicPartitioningConfiguration;
    final encryptionConfiguration = this.encryptionConfiguration;
    final errorOutputPrefix = this.errorOutputPrefix;
    final fileExtension = this.fileExtension;
    final prefix = this.prefix;
    final processingConfiguration = this.processingConfiguration;
    final s3BackupConfiguration = this.s3BackupConfiguration;
    final s3BackupMode = this.s3BackupMode;
    return {
      'BucketARN': bucketARN,
      'RoleARN': roleARN,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (compressionFormat != null)
        'CompressionFormat': compressionFormat.toValue(),
      if (customTimeZone != null) 'CustomTimeZone': customTimeZone,
      if (dataFormatConversionConfiguration != null)
        'DataFormatConversionConfiguration': dataFormatConversionConfiguration,
      if (dynamicPartitioningConfiguration != null)
        'DynamicPartitioningConfiguration': dynamicPartitioningConfiguration,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (errorOutputPrefix != null) 'ErrorOutputPrefix': errorOutputPrefix,
      if (fileExtension != null) 'FileExtension': fileExtension,
      if (prefix != null) 'Prefix': prefix,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (s3BackupConfiguration != null)
        'S3BackupConfiguration': s3BackupConfiguration,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
    };
  }
}

/// Describes a destination in Amazon S3.
class ExtendedS3DestinationDescription {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String bucketARN;

  /// The buffering option.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  final CompressionFormat compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String roleARN;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The time zone you prefer. UTC is the default.
  final String? customTimeZone;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  final DataFormatConversionConfiguration? dataFormatConversionConfiguration;

  /// The configuration of the dynamic partitioning mechanism that creates smaller
  /// data sets from the streaming data by partitioning it based on partition
  /// keys. Currently, dynamic partitioning is only supported for Amazon S3
  /// destinations.
  final DynamicPartitioningConfiguration? dynamicPartitioningConfiguration;

  /// A prefix that Firehose evaluates and adds to failed records before writing
  /// them to S3. This prefix appears immediately following the bucket name. For
  /// information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? errorOutputPrefix;

  /// Specify a file extension. It will override the default file extension
  final String? fileExtension;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? prefix;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The configuration for backup in Amazon S3.
  final S3DestinationDescription? s3BackupDescription;

  /// The Amazon S3 backup mode.
  final S3BackupMode? s3BackupMode;

  ExtendedS3DestinationDescription({
    required this.bucketARN,
    required this.bufferingHints,
    required this.compressionFormat,
    required this.encryptionConfiguration,
    required this.roleARN,
    this.cloudWatchLoggingOptions,
    this.customTimeZone,
    this.dataFormatConversionConfiguration,
    this.dynamicPartitioningConfiguration,
    this.errorOutputPrefix,
    this.fileExtension,
    this.prefix,
    this.processingConfiguration,
    this.s3BackupDescription,
    this.s3BackupMode,
  });

  factory ExtendedS3DestinationDescription.fromJson(Map<String, dynamic> json) {
    return ExtendedS3DestinationDescription(
      bucketARN: json['BucketARN'] as String,
      bufferingHints: BufferingHints.fromJson(
          json['BufferingHints'] as Map<String, dynamic>),
      compressionFormat:
          (json['CompressionFormat'] as String).toCompressionFormat(),
      encryptionConfiguration: EncryptionConfiguration.fromJson(
          json['EncryptionConfiguration'] as Map<String, dynamic>),
      roleARN: json['RoleARN'] as String,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      customTimeZone: json['CustomTimeZone'] as String?,
      dataFormatConversionConfiguration:
          json['DataFormatConversionConfiguration'] != null
              ? DataFormatConversionConfiguration.fromJson(
                  json['DataFormatConversionConfiguration']
                      as Map<String, dynamic>)
              : null,
      dynamicPartitioningConfiguration:
          json['DynamicPartitioningConfiguration'] != null
              ? DynamicPartitioningConfiguration.fromJson(
                  json['DynamicPartitioningConfiguration']
                      as Map<String, dynamic>)
              : null,
      errorOutputPrefix: json['ErrorOutputPrefix'] as String?,
      fileExtension: json['FileExtension'] as String?,
      prefix: json['Prefix'] as String?,
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      s3BackupDescription: json['S3BackupDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3BackupDescription'] as Map<String, dynamic>)
          : null,
      s3BackupMode: (json['S3BackupMode'] as String?)?.toS3BackupMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final bufferingHints = this.bufferingHints;
    final compressionFormat = this.compressionFormat;
    final encryptionConfiguration = this.encryptionConfiguration;
    final roleARN = this.roleARN;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final customTimeZone = this.customTimeZone;
    final dataFormatConversionConfiguration =
        this.dataFormatConversionConfiguration;
    final dynamicPartitioningConfiguration =
        this.dynamicPartitioningConfiguration;
    final errorOutputPrefix = this.errorOutputPrefix;
    final fileExtension = this.fileExtension;
    final prefix = this.prefix;
    final processingConfiguration = this.processingConfiguration;
    final s3BackupDescription = this.s3BackupDescription;
    final s3BackupMode = this.s3BackupMode;
    return {
      'BucketARN': bucketARN,
      'BufferingHints': bufferingHints,
      'CompressionFormat': compressionFormat.toValue(),
      'EncryptionConfiguration': encryptionConfiguration,
      'RoleARN': roleARN,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (customTimeZone != null) 'CustomTimeZone': customTimeZone,
      if (dataFormatConversionConfiguration != null)
        'DataFormatConversionConfiguration': dataFormatConversionConfiguration,
      if (dynamicPartitioningConfiguration != null)
        'DynamicPartitioningConfiguration': dynamicPartitioningConfiguration,
      if (errorOutputPrefix != null) 'ErrorOutputPrefix': errorOutputPrefix,
      if (fileExtension != null) 'FileExtension': fileExtension,
      if (prefix != null) 'Prefix': prefix,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (s3BackupDescription != null)
        'S3BackupDescription': s3BackupDescription,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
    };
  }
}

/// Describes an update for a destination in Amazon S3.
class ExtendedS3DestinationUpdate {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String? bucketARN;

  /// The buffering option.
  final BufferingHints? bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  final CompressionFormat? compressionFormat;

  /// The time zone you prefer. UTC is the default.
  final String? customTimeZone;

  /// The serializer, deserializer, and schema for converting data from the JSON
  /// format to the Parquet or ORC format before writing it to Amazon S3.
  final DataFormatConversionConfiguration? dataFormatConversionConfiguration;

  /// The configuration of the dynamic partitioning mechanism that creates smaller
  /// data sets from the streaming data by partitioning it based on partition
  /// keys. Currently, dynamic partitioning is only supported for Amazon S3
  /// destinations.
  final DynamicPartitioningConfiguration? dynamicPartitioningConfiguration;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration? encryptionConfiguration;

  /// A prefix that Firehose evaluates and adds to failed records before writing
  /// them to S3. This prefix appears immediately following the bucket name. For
  /// information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? errorOutputPrefix;

  /// Specify a file extension. It will override the default file extension
  final String? fileExtension;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? prefix;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String? roleARN;

  /// You can update a delivery stream to enable Amazon S3 backup if it is
  /// disabled. If backup is enabled, you can't update the delivery stream to
  /// disable it.
  final S3BackupMode? s3BackupMode;

  /// The Amazon S3 destination for backup.
  final S3DestinationUpdate? s3BackupUpdate;

  ExtendedS3DestinationUpdate({
    this.bucketARN,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.compressionFormat,
    this.customTimeZone,
    this.dataFormatConversionConfiguration,
    this.dynamicPartitioningConfiguration,
    this.encryptionConfiguration,
    this.errorOutputPrefix,
    this.fileExtension,
    this.prefix,
    this.processingConfiguration,
    this.roleARN,
    this.s3BackupMode,
    this.s3BackupUpdate,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final compressionFormat = this.compressionFormat;
    final customTimeZone = this.customTimeZone;
    final dataFormatConversionConfiguration =
        this.dataFormatConversionConfiguration;
    final dynamicPartitioningConfiguration =
        this.dynamicPartitioningConfiguration;
    final encryptionConfiguration = this.encryptionConfiguration;
    final errorOutputPrefix = this.errorOutputPrefix;
    final fileExtension = this.fileExtension;
    final prefix = this.prefix;
    final processingConfiguration = this.processingConfiguration;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3BackupUpdate = this.s3BackupUpdate;
    return {
      if (bucketARN != null) 'BucketARN': bucketARN,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (compressionFormat != null)
        'CompressionFormat': compressionFormat.toValue(),
      if (customTimeZone != null) 'CustomTimeZone': customTimeZone,
      if (dataFormatConversionConfiguration != null)
        'DataFormatConversionConfiguration': dataFormatConversionConfiguration,
      if (dynamicPartitioningConfiguration != null)
        'DynamicPartitioningConfiguration': dynamicPartitioningConfiguration,
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (errorOutputPrefix != null) 'ErrorOutputPrefix': errorOutputPrefix,
      if (fileExtension != null) 'FileExtension': fileExtension,
      if (prefix != null) 'Prefix': prefix,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3BackupUpdate != null) 'S3BackupUpdate': s3BackupUpdate,
    };
  }
}

/// Provides details in case one of the following operations fails due to an
/// error related to KMS: <a>CreateDeliveryStream</a>,
/// <a>DeleteDeliveryStream</a>, <a>StartDeliveryStreamEncryption</a>,
/// <a>StopDeliveryStreamEncryption</a>.
class FailureDescription {
  /// A message providing details about the error that caused the failure.
  final String details;

  /// The type of error that caused the failure.
  final DeliveryStreamFailureType type;

  FailureDescription({
    required this.details,
    required this.type,
  });

  factory FailureDescription.fromJson(Map<String, dynamic> json) {
    return FailureDescription(
      details: json['Details'] as String,
      type: (json['Type'] as String).toDeliveryStreamFailureType(),
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final type = this.type;
    return {
      'Details': details,
      'Type': type.toValue(),
    };
  }
}

enum HECEndpointType {
  raw,
  event,
}

extension HECEndpointTypeValueExtension on HECEndpointType {
  String toValue() {
    switch (this) {
      case HECEndpointType.raw:
        return 'Raw';
      case HECEndpointType.event:
        return 'Event';
    }
  }
}

extension HECEndpointTypeFromString on String {
  HECEndpointType toHECEndpointType() {
    switch (this) {
      case 'Raw':
        return HECEndpointType.raw;
      case 'Event':
        return HECEndpointType.event;
    }
    throw Exception('$this is not known in enum HECEndpointType');
  }
}

/// The native Hive / HCatalog JsonSerDe. Used by Firehose for deserializing
/// data, which means converting it from the JSON format in preparation for
/// serializing it to the Parquet or ORC format. This is one of two
/// deserializers you can choose, depending on which one offers the
/// functionality you need. The other option is the OpenX SerDe.
class HiveJsonSerDe {
  /// Indicates how you want Firehose to parse the date and timestamps that may be
  /// present in your input data JSON. To specify these format strings, follow the
  /// pattern syntax of JodaTime's DateTimeFormat format strings. For more
  /// information, see <a
  /// href="https://www.joda.org/joda-time/apidocs/org/joda/time/format/DateTimeFormat.html">Class
  /// DateTimeFormat</a>. You can also use the special value <code>millis</code>
  /// to parse timestamps in epoch milliseconds. If you don't specify a format,
  /// Firehose uses <code>java.sql.Timestamp::valueOf</code> by default.
  final List<String>? timestampFormats;

  HiveJsonSerDe({
    this.timestampFormats,
  });

  factory HiveJsonSerDe.fromJson(Map<String, dynamic> json) {
    return HiveJsonSerDe(
      timestampFormats: (json['TimestampFormats'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final timestampFormats = this.timestampFormats;
    return {
      if (timestampFormats != null) 'TimestampFormats': timestampFormats,
    };
  }
}

/// Describes the buffering options that can be applied before data is delivered
/// to the HTTP endpoint destination. Firehose treats these options as hints,
/// and it might choose to use more optimal values. The <code>SizeInMBs</code>
/// and <code>IntervalInSeconds</code> parameters are optional. However, if
/// specify a value for one of them, you must also provide a value for the
/// other.
class HttpEndpointBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 300 (5 minutes).
  final int? intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it to
  /// the destination. The default value is 5.
  ///
  /// We recommend setting this parameter to a value greater than the amount of
  /// data you typically ingest into the delivery stream in 10 seconds. For
  /// example, if you typically ingest data at 1 MB/sec, the value should be 10 MB
  /// or higher.
  final int? sizeInMBs;

  HttpEndpointBufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });

  factory HttpEndpointBufferingHints.fromJson(Map<String, dynamic> json) {
    return HttpEndpointBufferingHints(
      intervalInSeconds: json['IntervalInSeconds'] as int?,
      sizeInMBs: json['SizeInMBs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final intervalInSeconds = this.intervalInSeconds;
    final sizeInMBs = this.sizeInMBs;
    return {
      if (intervalInSeconds != null) 'IntervalInSeconds': intervalInSeconds,
      if (sizeInMBs != null) 'SizeInMBs': sizeInMBs,
    };
  }
}

/// Describes the metadata that's delivered to the specified HTTP endpoint
/// destination.
class HttpEndpointCommonAttribute {
  /// The name of the HTTP endpoint common attribute.
  final String attributeName;

  /// The value of the HTTP endpoint common attribute.
  final String attributeValue;

  HttpEndpointCommonAttribute({
    required this.attributeName,
    required this.attributeValue,
  });

  factory HttpEndpointCommonAttribute.fromJson(Map<String, dynamic> json) {
    return HttpEndpointCommonAttribute(
      attributeName: json['AttributeName'] as String,
      attributeValue: json['AttributeValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final attributeValue = this.attributeValue;
    return {
      'AttributeName': attributeName,
      'AttributeValue': attributeValue,
    };
  }
}

/// Describes the configuration of the HTTP endpoint to which Kinesis Firehose
/// delivers data.
class HttpEndpointConfiguration {
  /// The URL of the HTTP endpoint selected as the destination.
  /// <important>
  /// If you choose an HTTP endpoint as your destination, review and follow the
  /// instructions in the <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/httpdeliveryrequestresponse.html">Appendix
  /// - HTTP Endpoint Delivery Request and Response Specifications</a>.
  /// </important>
  final String url;

  /// The access key required for Kinesis Firehose to authenticate with the HTTP
  /// endpoint selected as the destination.
  final String? accessKey;

  /// The name of the HTTP endpoint selected as the destination.
  final String? name;

  HttpEndpointConfiguration({
    required this.url,
    this.accessKey,
    this.name,
  });

  Map<String, dynamic> toJson() {
    final url = this.url;
    final accessKey = this.accessKey;
    final name = this.name;
    return {
      'Url': url,
      if (accessKey != null) 'AccessKey': accessKey,
      if (name != null) 'Name': name,
    };
  }
}

/// Describes the HTTP endpoint selected as the destination.
class HttpEndpointDescription {
  /// The name of the HTTP endpoint selected as the destination.
  final String? name;

  /// The URL of the HTTP endpoint selected as the destination.
  final String? url;

  HttpEndpointDescription({
    this.name,
    this.url,
  });

  factory HttpEndpointDescription.fromJson(Map<String, dynamic> json) {
    return HttpEndpointDescription(
      name: json['Name'] as String?,
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final url = this.url;
    return {
      if (name != null) 'Name': name,
      if (url != null) 'Url': url,
    };
  }
}

/// Describes the configuration of the HTTP endpoint destination.
class HttpEndpointDestinationConfiguration {
  /// The configuration of the HTTP endpoint selected as the destination.
  final HttpEndpointConfiguration endpointConfiguration;
  final S3DestinationConfiguration s3Configuration;

  /// The buffering options that can be used before data is delivered to the
  /// specified destination. Firehose treats these options as hints, and it might
  /// choose to use more optimal values. The <code>SizeInMBs</code> and
  /// <code>IntervalInSeconds</code> parameters are optional. However, if you
  /// specify a value for one of them, you must also provide a value for the
  /// other.
  final HttpEndpointBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;
  final ProcessingConfiguration? processingConfiguration;

  /// The configuration of the requeste sent to the HTTP endpoint specified as the
  /// destination.
  final HttpEndpointRequestConfiguration? requestConfiguration;

  /// Describes the retry behavior in case Firehose is unable to deliver data to
  /// the specified HTTP endpoint destination, or if it doesn't receive a valid
  /// acknowledgment of receipt from the specified HTTP endpoint destination.
  final HttpEndpointRetryOptions? retryOptions;

  /// Firehose uses this IAM role for all the permissions that the delivery stream
  /// needs.
  final String? roleARN;

  /// Describes the S3 bucket backup options for the data that Firehose delivers
  /// to the HTTP endpoint destination. You can back up all documents
  /// (<code>AllData</code>) or only the documents that Firehose could not deliver
  /// to the specified HTTP endpoint destination (<code>FailedDataOnly</code>).
  final HttpEndpointS3BackupMode? s3BackupMode;

  HttpEndpointDestinationConfiguration({
    required this.endpointConfiguration,
    required this.s3Configuration,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.requestConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
  });

  Map<String, dynamic> toJson() {
    final endpointConfiguration = this.endpointConfiguration;
    final s3Configuration = this.s3Configuration;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final processingConfiguration = this.processingConfiguration;
    final requestConfiguration = this.requestConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    return {
      'EndpointConfiguration': endpointConfiguration,
      'S3Configuration': s3Configuration,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (requestConfiguration != null)
        'RequestConfiguration': requestConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
    };
  }
}

/// Describes the HTTP endpoint destination.
class HttpEndpointDestinationDescription {
  /// Describes buffering options that can be applied to the data before it is
  /// delivered to the HTTPS endpoint destination. Firehose teats these options as
  /// hints, and it might choose to use more optimal values. The
  /// <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are
  /// optional. However, if specify a value for one of them, you must also provide
  /// a value for the other.
  final HttpEndpointBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The configuration of the specified HTTP endpoint destination.
  final HttpEndpointDescription? endpointConfiguration;
  final ProcessingConfiguration? processingConfiguration;

  /// The configuration of request sent to the HTTP endpoint specified as the
  /// destination.
  final HttpEndpointRequestConfiguration? requestConfiguration;

  /// Describes the retry behavior in case Firehose is unable to deliver data to
  /// the specified HTTP endpoint destination, or if it doesn't receive a valid
  /// acknowledgment of receipt from the specified HTTP endpoint destination.
  final HttpEndpointRetryOptions? retryOptions;

  /// Firehose uses this IAM role for all the permissions that the delivery stream
  /// needs.
  final String? roleARN;

  /// Describes the S3 bucket backup options for the data that Kinesis Firehose
  /// delivers to the HTTP endpoint destination. You can back up all documents
  /// (<code>AllData</code>) or only the documents that Firehose could not deliver
  /// to the specified HTTP endpoint destination (<code>FailedDataOnly</code>).
  final HttpEndpointS3BackupMode? s3BackupMode;
  final S3DestinationDescription? s3DestinationDescription;

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
      Map<String, dynamic> json) {
    return HttpEndpointDestinationDescription(
      bufferingHints: json['BufferingHints'] != null
          ? HttpEndpointBufferingHints.fromJson(
              json['BufferingHints'] as Map<String, dynamic>)
          : null,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      endpointConfiguration: json['EndpointConfiguration'] != null
          ? HttpEndpointDescription.fromJson(
              json['EndpointConfiguration'] as Map<String, dynamic>)
          : null,
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      requestConfiguration: json['RequestConfiguration'] != null
          ? HttpEndpointRequestConfiguration.fromJson(
              json['RequestConfiguration'] as Map<String, dynamic>)
          : null,
      retryOptions: json['RetryOptions'] != null
          ? HttpEndpointRetryOptions.fromJson(
              json['RetryOptions'] as Map<String, dynamic>)
          : null,
      roleARN: json['RoleARN'] as String?,
      s3BackupMode:
          (json['S3BackupMode'] as String?)?.toHttpEndpointS3BackupMode(),
      s3DestinationDescription: json['S3DestinationDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3DestinationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final endpointConfiguration = this.endpointConfiguration;
    final processingConfiguration = this.processingConfiguration;
    final requestConfiguration = this.requestConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3DestinationDescription = this.s3DestinationDescription;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (endpointConfiguration != null)
        'EndpointConfiguration': endpointConfiguration,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (requestConfiguration != null)
        'RequestConfiguration': requestConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3DestinationDescription != null)
        'S3DestinationDescription': s3DestinationDescription,
    };
  }
}

/// Updates the specified HTTP endpoint destination.
class HttpEndpointDestinationUpdate {
  /// Describes buffering options that can be applied to the data before it is
  /// delivered to the HTTPS endpoint destination. Firehose teats these options as
  /// hints, and it might choose to use more optimal values. The
  /// <code>SizeInMBs</code> and <code>IntervalInSeconds</code> parameters are
  /// optional. However, if specify a value for one of them, you must also provide
  /// a value for the other.
  final HttpEndpointBufferingHints? bufferingHints;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// Describes the configuration of the HTTP endpoint destination.
  final HttpEndpointConfiguration? endpointConfiguration;
  final ProcessingConfiguration? processingConfiguration;

  /// The configuration of the request sent to the HTTP endpoint specified as the
  /// destination.
  final HttpEndpointRequestConfiguration? requestConfiguration;

  /// Describes the retry behavior in case Firehose is unable to deliver data to
  /// the specified HTTP endpoint destination, or if it doesn't receive a valid
  /// acknowledgment of receipt from the specified HTTP endpoint destination.
  final HttpEndpointRetryOptions? retryOptions;

  /// Firehose uses this IAM role for all the permissions that the delivery stream
  /// needs.
  final String? roleARN;

  /// Describes the S3 bucket backup options for the data that Kinesis Firehose
  /// delivers to the HTTP endpoint destination. You can back up all documents
  /// (<code>AllData</code>) or only the documents that Firehose could not deliver
  /// to the specified HTTP endpoint destination (<code>FailedDataOnly</code>).
  final HttpEndpointS3BackupMode? s3BackupMode;
  final S3DestinationUpdate? s3Update;

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

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final endpointConfiguration = this.endpointConfiguration;
    final processingConfiguration = this.processingConfiguration;
    final requestConfiguration = this.requestConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3Update = this.s3Update;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (endpointConfiguration != null)
        'EndpointConfiguration': endpointConfiguration,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (requestConfiguration != null)
        'RequestConfiguration': requestConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3Update != null) 'S3Update': s3Update,
    };
  }
}

/// The configuration of the HTTP endpoint request.
class HttpEndpointRequestConfiguration {
  /// Describes the metadata sent to the HTTP endpoint destination.
  final List<HttpEndpointCommonAttribute>? commonAttributes;

  /// Firehose uses the content encoding to compress the body of a request before
  /// sending the request to the destination. For more information, see <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Encoding">Content-Encoding</a>
  /// in MDN Web Docs, the official Mozilla documentation.
  final ContentEncoding? contentEncoding;

  HttpEndpointRequestConfiguration({
    this.commonAttributes,
    this.contentEncoding,
  });

  factory HttpEndpointRequestConfiguration.fromJson(Map<String, dynamic> json) {
    return HttpEndpointRequestConfiguration(
      commonAttributes: (json['CommonAttributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              HttpEndpointCommonAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      contentEncoding:
          (json['ContentEncoding'] as String?)?.toContentEncoding(),
    );
  }

  Map<String, dynamic> toJson() {
    final commonAttributes = this.commonAttributes;
    final contentEncoding = this.contentEncoding;
    return {
      if (commonAttributes != null) 'CommonAttributes': commonAttributes,
      if (contentEncoding != null) 'ContentEncoding': contentEncoding.toValue(),
    };
  }
}

/// Describes the retry behavior in case Firehose is unable to deliver data to
/// the specified HTTP endpoint destination, or if it doesn't receive a valid
/// acknowledgment of receipt from the specified HTTP endpoint destination.
class HttpEndpointRetryOptions {
  /// The total amount of time that Firehose spends on retries. This duration
  /// starts after the initial attempt to send data to the custom destination via
  /// HTTPS endpoint fails. It doesn't include the periods during which Firehose
  /// waits for acknowledgment from the specified destination after each attempt.
  final int? durationInSeconds;

  HttpEndpointRetryOptions({
    this.durationInSeconds,
  });

  factory HttpEndpointRetryOptions.fromJson(Map<String, dynamic> json) {
    return HttpEndpointRetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

enum HttpEndpointS3BackupMode {
  failedDataOnly,
  allData,
}

extension HttpEndpointS3BackupModeValueExtension on HttpEndpointS3BackupMode {
  String toValue() {
    switch (this) {
      case HttpEndpointS3BackupMode.failedDataOnly:
        return 'FailedDataOnly';
      case HttpEndpointS3BackupMode.allData:
        return 'AllData';
    }
  }
}

extension HttpEndpointS3BackupModeFromString on String {
  HttpEndpointS3BackupMode toHttpEndpointS3BackupMode() {
    switch (this) {
      case 'FailedDataOnly':
        return HttpEndpointS3BackupMode.failedDataOnly;
      case 'AllData':
        return HttpEndpointS3BackupMode.allData;
    }
    throw Exception('$this is not known in enum HttpEndpointS3BackupMode');
  }
}

/// Specifies the deserializer you want to use to convert the format of the
/// input data. This parameter is required if <code>Enabled</code> is set to
/// true.
class InputFormatConfiguration {
  /// Specifies which deserializer to use. You can choose either the Apache Hive
  /// JSON SerDe or the OpenX JSON SerDe. If both are non-null, the server rejects
  /// the request.
  final Deserializer? deserializer;

  InputFormatConfiguration({
    this.deserializer,
  });

  factory InputFormatConfiguration.fromJson(Map<String, dynamic> json) {
    return InputFormatConfiguration(
      deserializer: json['Deserializer'] != null
          ? Deserializer.fromJson(json['Deserializer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deserializer = this.deserializer;
    return {
      if (deserializer != null) 'Deserializer': deserializer,
    };
  }
}

/// Describes an encryption key for a destination in Amazon S3.
class KMSEncryptionConfig {
  /// The Amazon Resource Name (ARN) of the encryption key. Must belong to the
  /// same Amazon Web Services Region as the destination Amazon S3 bucket. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String awsKMSKeyARN;

  KMSEncryptionConfig({
    required this.awsKMSKeyARN,
  });

  factory KMSEncryptionConfig.fromJson(Map<String, dynamic> json) {
    return KMSEncryptionConfig(
      awsKMSKeyARN: json['AWSKMSKeyARN'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final awsKMSKeyARN = this.awsKMSKeyARN;
    return {
      'AWSKMSKeyARN': awsKMSKeyARN,
    };
  }
}

enum KeyType {
  awsOwnedCmk,
  customerManagedCmk,
}

extension KeyTypeValueExtension on KeyType {
  String toValue() {
    switch (this) {
      case KeyType.awsOwnedCmk:
        return 'AWS_OWNED_CMK';
      case KeyType.customerManagedCmk:
        return 'CUSTOMER_MANAGED_CMK';
    }
  }
}

extension KeyTypeFromString on String {
  KeyType toKeyType() {
    switch (this) {
      case 'AWS_OWNED_CMK':
        return KeyType.awsOwnedCmk;
      case 'CUSTOMER_MANAGED_CMK':
        return KeyType.customerManagedCmk;
    }
    throw Exception('$this is not known in enum KeyType');
  }
}

/// The stream and role Amazon Resource Names (ARNs) for a Kinesis data stream
/// used as the source for a delivery stream.
class KinesisStreamSourceConfiguration {
  /// The ARN of the source Kinesis data stream. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Kinesis Data Streams ARN Format</a>.
  final String kinesisStreamARN;

  /// The ARN of the role that provides access to the source Kinesis data stream.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon
  /// Web Services Identity and Access Management (IAM) ARN Format</a>.
  final String roleARN;

  KinesisStreamSourceConfiguration({
    required this.kinesisStreamARN,
    required this.roleARN,
  });

  Map<String, dynamic> toJson() {
    final kinesisStreamARN = this.kinesisStreamARN;
    final roleARN = this.roleARN;
    return {
      'KinesisStreamARN': kinesisStreamARN,
      'RoleARN': roleARN,
    };
  }
}

/// Details about a Kinesis data stream used as the source for a Firehose
/// delivery stream.
class KinesisStreamSourceDescription {
  /// Firehose starts retrieving records from the Kinesis data stream starting
  /// with this timestamp.
  final DateTime? deliveryStartTimestamp;

  /// The Amazon Resource Name (ARN) of the source Kinesis data stream. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams">Amazon
  /// Kinesis Data Streams ARN Format</a>.
  final String? kinesisStreamARN;

  /// The ARN of the role used by the source Kinesis data stream. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam">Amazon
  /// Web Services Identity and Access Management (IAM) ARN Format</a>.
  final String? roleARN;

  KinesisStreamSourceDescription({
    this.deliveryStartTimestamp,
    this.kinesisStreamARN,
    this.roleARN,
  });

  factory KinesisStreamSourceDescription.fromJson(Map<String, dynamic> json) {
    return KinesisStreamSourceDescription(
      deliveryStartTimestamp: timeStampFromJson(json['DeliveryStartTimestamp']),
      kinesisStreamARN: json['KinesisStreamARN'] as String?,
      roleARN: json['RoleARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStartTimestamp = this.deliveryStartTimestamp;
    final kinesisStreamARN = this.kinesisStreamARN;
    final roleARN = this.roleARN;
    return {
      if (deliveryStartTimestamp != null)
        'DeliveryStartTimestamp': unixTimestampToJson(deliveryStartTimestamp),
      if (kinesisStreamARN != null) 'KinesisStreamARN': kinesisStreamARN,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

class ListDeliveryStreamsOutput {
  /// The names of the delivery streams.
  final List<String> deliveryStreamNames;

  /// Indicates whether there are more delivery streams available to list.
  final bool hasMoreDeliveryStreams;

  ListDeliveryStreamsOutput({
    required this.deliveryStreamNames,
    required this.hasMoreDeliveryStreams,
  });

  factory ListDeliveryStreamsOutput.fromJson(Map<String, dynamic> json) {
    return ListDeliveryStreamsOutput(
      deliveryStreamNames: (json['DeliveryStreamNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      hasMoreDeliveryStreams: json['HasMoreDeliveryStreams'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamNames = this.deliveryStreamNames;
    final hasMoreDeliveryStreams = this.hasMoreDeliveryStreams;
    return {
      'DeliveryStreamNames': deliveryStreamNames,
      'HasMoreDeliveryStreams': hasMoreDeliveryStreams,
    };
  }
}

class ListTagsForDeliveryStreamOutput {
  /// If this is <code>true</code> in the response, more tags are available. To
  /// list the remaining tags, set <code>ExclusiveStartTagKey</code> to the key of
  /// the last tag returned and call <code>ListTagsForDeliveryStream</code> again.
  final bool hasMoreTags;

  /// A list of tags associated with <code>DeliveryStreamName</code>, starting
  /// with the first tag after <code>ExclusiveStartTagKey</code> and up to the
  /// specified <code>Limit</code>.
  final List<Tag> tags;

  ListTagsForDeliveryStreamOutput({
    required this.hasMoreTags,
    required this.tags,
  });

  factory ListTagsForDeliveryStreamOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForDeliveryStreamOutput(
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

/// The configuration for the Amazon MSK cluster to be used as the source for a
/// delivery stream.
class MSKSourceConfiguration {
  /// The authentication configuration of the Amazon MSK cluster.
  final AuthenticationConfiguration authenticationConfiguration;

  /// The ARN of the Amazon MSK cluster.
  final String mSKClusterARN;

  /// The topic name within the Amazon MSK cluster.
  final String topicName;

  MSKSourceConfiguration({
    required this.authenticationConfiguration,
    required this.mSKClusterARN,
    required this.topicName,
  });

  Map<String, dynamic> toJson() {
    final authenticationConfiguration = this.authenticationConfiguration;
    final mSKClusterARN = this.mSKClusterARN;
    final topicName = this.topicName;
    return {
      'AuthenticationConfiguration': authenticationConfiguration,
      'MSKClusterARN': mSKClusterARN,
      'TopicName': topicName,
    };
  }
}

/// Details about the Amazon MSK cluster used as the source for a Firehose
/// delivery stream.
class MSKSourceDescription {
  /// The authentication configuration of the Amazon MSK cluster.
  final AuthenticationConfiguration? authenticationConfiguration;

  /// Firehose starts retrieving records from the topic within the Amazon MSK
  /// cluster starting with this timestamp.
  final DateTime? deliveryStartTimestamp;

  /// The ARN of the Amazon MSK cluster.
  final String? mSKClusterARN;

  /// The topic name within the Amazon MSK cluster.
  final String? topicName;

  MSKSourceDescription({
    this.authenticationConfiguration,
    this.deliveryStartTimestamp,
    this.mSKClusterARN,
    this.topicName,
  });

  factory MSKSourceDescription.fromJson(Map<String, dynamic> json) {
    return MSKSourceDescription(
      authenticationConfiguration: json['AuthenticationConfiguration'] != null
          ? AuthenticationConfiguration.fromJson(
              json['AuthenticationConfiguration'] as Map<String, dynamic>)
          : null,
      deliveryStartTimestamp: timeStampFromJson(json['DeliveryStartTimestamp']),
      mSKClusterARN: json['MSKClusterARN'] as String?,
      topicName: json['TopicName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authenticationConfiguration = this.authenticationConfiguration;
    final deliveryStartTimestamp = this.deliveryStartTimestamp;
    final mSKClusterARN = this.mSKClusterARN;
    final topicName = this.topicName;
    return {
      if (authenticationConfiguration != null)
        'AuthenticationConfiguration': authenticationConfiguration,
      if (deliveryStartTimestamp != null)
        'DeliveryStartTimestamp': unixTimestampToJson(deliveryStartTimestamp),
      if (mSKClusterARN != null) 'MSKClusterARN': mSKClusterARN,
      if (topicName != null) 'TopicName': topicName,
    };
  }
}

enum NoEncryptionConfig {
  noEncryption,
}

extension NoEncryptionConfigValueExtension on NoEncryptionConfig {
  String toValue() {
    switch (this) {
      case NoEncryptionConfig.noEncryption:
        return 'NoEncryption';
    }
  }
}

extension NoEncryptionConfigFromString on String {
  NoEncryptionConfig toNoEncryptionConfig() {
    switch (this) {
      case 'NoEncryption':
        return NoEncryptionConfig.noEncryption;
    }
    throw Exception('$this is not known in enum NoEncryptionConfig');
  }
}

/// The OpenX SerDe. Used by Firehose for deserializing data, which means
/// converting it from the JSON format in preparation for serializing it to the
/// Parquet or ORC format. This is one of two deserializers you can choose,
/// depending on which one offers the functionality you need. The other option
/// is the native Hive / HCatalog JsonSerDe.
class OpenXJsonSerDe {
  /// When set to <code>true</code>, which is the default, Firehose converts JSON
  /// keys to lowercase before deserializing them.
  final bool? caseInsensitive;

  /// Maps column names to JSON keys that aren't identical to the column names.
  /// This is useful when the JSON contains keys that are Hive keywords. For
  /// example, <code>timestamp</code> is a Hive keyword. If you have a JSON key
  /// named <code>timestamp</code>, set this parameter to <code>{"ts":
  /// "timestamp"}</code> to map this key to a column named <code>ts</code>.
  final Map<String, String>? columnToJsonKeyMappings;

  /// When set to <code>true</code>, specifies that the names of the keys include
  /// dots and that you want Firehose to replace them with underscores. This is
  /// useful because Apache Hive does not allow dots in column names. For example,
  /// if the JSON contains a key whose name is "a.b", you can define the column
  /// name to be "a_b" when using this option.
  ///
  /// The default is <code>false</code>.
  final bool? convertDotsInJsonKeysToUnderscores;

  OpenXJsonSerDe({
    this.caseInsensitive,
    this.columnToJsonKeyMappings,
    this.convertDotsInJsonKeysToUnderscores,
  });

  factory OpenXJsonSerDe.fromJson(Map<String, dynamic> json) {
    return OpenXJsonSerDe(
      caseInsensitive: json['CaseInsensitive'] as bool?,
      columnToJsonKeyMappings:
          (json['ColumnToJsonKeyMappings'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      convertDotsInJsonKeysToUnderscores:
          json['ConvertDotsInJsonKeysToUnderscores'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final caseInsensitive = this.caseInsensitive;
    final columnToJsonKeyMappings = this.columnToJsonKeyMappings;
    final convertDotsInJsonKeysToUnderscores =
        this.convertDotsInJsonKeysToUnderscores;
    return {
      if (caseInsensitive != null) 'CaseInsensitive': caseInsensitive,
      if (columnToJsonKeyMappings != null)
        'ColumnToJsonKeyMappings': columnToJsonKeyMappings,
      if (convertDotsInJsonKeysToUnderscores != null)
        'ConvertDotsInJsonKeysToUnderscores':
            convertDotsInJsonKeysToUnderscores,
    };
  }
}

enum OrcCompression {
  none,
  zlib,
  snappy,
}

extension OrcCompressionValueExtension on OrcCompression {
  String toValue() {
    switch (this) {
      case OrcCompression.none:
        return 'NONE';
      case OrcCompression.zlib:
        return 'ZLIB';
      case OrcCompression.snappy:
        return 'SNAPPY';
    }
  }
}

extension OrcCompressionFromString on String {
  OrcCompression toOrcCompression() {
    switch (this) {
      case 'NONE':
        return OrcCompression.none;
      case 'ZLIB':
        return OrcCompression.zlib;
      case 'SNAPPY':
        return OrcCompression.snappy;
    }
    throw Exception('$this is not known in enum OrcCompression');
  }
}

enum OrcFormatVersion {
  v0_11,
  v0_12,
}

extension OrcFormatVersionValueExtension on OrcFormatVersion {
  String toValue() {
    switch (this) {
      case OrcFormatVersion.v0_11:
        return 'V0_11';
      case OrcFormatVersion.v0_12:
        return 'V0_12';
    }
  }
}

extension OrcFormatVersionFromString on String {
  OrcFormatVersion toOrcFormatVersion() {
    switch (this) {
      case 'V0_11':
        return OrcFormatVersion.v0_11;
      case 'V0_12':
        return OrcFormatVersion.v0_12;
    }
    throw Exception('$this is not known in enum OrcFormatVersion');
  }
}

/// A serializer to use for converting data to the ORC format before storing it
/// in Amazon S3. For more information, see <a
/// href="https://orc.apache.org/docs/">Apache ORC</a>.
class OrcSerDe {
  /// The Hadoop Distributed File System (HDFS) block size. This is useful if you
  /// intend to copy the data from Amazon S3 to HDFS before querying. The default
  /// is 256 MiB and the minimum is 64 MiB. Firehose uses this value for padding
  /// calculations.
  final int? blockSizeBytes;

  /// The column names for which you want Firehose to create bloom filters. The
  /// default is <code>null</code>.
  final List<String>? bloomFilterColumns;

  /// The Bloom filter false positive probability (FPP). The lower the FPP, the
  /// bigger the Bloom filter. The default value is 0.05, the minimum is 0, and
  /// the maximum is 1.
  final double? bloomFilterFalsePositiveProbability;

  /// The compression code to use over data blocks. The default is
  /// <code>SNAPPY</code>.
  final OrcCompression? compression;

  /// Represents the fraction of the total number of non-null rows. To turn off
  /// dictionary encoding, set this fraction to a number that is less than the
  /// number of distinct keys in a dictionary. To always use dictionary encoding,
  /// set this threshold to 1.
  final double? dictionaryKeyThreshold;

  /// Set this to <code>true</code> to indicate that you want stripes to be padded
  /// to the HDFS block boundaries. This is useful if you intend to copy the data
  /// from Amazon S3 to HDFS before querying. The default is <code>false</code>.
  final bool? enablePadding;

  /// The version of the file to write. The possible values are <code>V0_11</code>
  /// and <code>V0_12</code>. The default is <code>V0_12</code>.
  final OrcFormatVersion? formatVersion;

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
  /// Firehose ignores this parameter when <a>OrcSerDe$EnablePadding</a> is
  /// <code>false</code>.
  final double? paddingTolerance;

  /// The number of rows between index entries. The default is 10,000 and the
  /// minimum is 1,000.
  final int? rowIndexStride;

  /// The number of bytes in each stripe. The default is 64 MiB and the minimum is
  /// 8 MiB.
  final int? stripeSizeBytes;

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

  factory OrcSerDe.fromJson(Map<String, dynamic> json) {
    return OrcSerDe(
      blockSizeBytes: json['BlockSizeBytes'] as int?,
      bloomFilterColumns: (json['BloomFilterColumns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      bloomFilterFalsePositiveProbability:
          json['BloomFilterFalsePositiveProbability'] as double?,
      compression: (json['Compression'] as String?)?.toOrcCompression(),
      dictionaryKeyThreshold: json['DictionaryKeyThreshold'] as double?,
      enablePadding: json['EnablePadding'] as bool?,
      formatVersion: (json['FormatVersion'] as String?)?.toOrcFormatVersion(),
      paddingTolerance: json['PaddingTolerance'] as double?,
      rowIndexStride: json['RowIndexStride'] as int?,
      stripeSizeBytes: json['StripeSizeBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockSizeBytes = this.blockSizeBytes;
    final bloomFilterColumns = this.bloomFilterColumns;
    final bloomFilterFalsePositiveProbability =
        this.bloomFilterFalsePositiveProbability;
    final compression = this.compression;
    final dictionaryKeyThreshold = this.dictionaryKeyThreshold;
    final enablePadding = this.enablePadding;
    final formatVersion = this.formatVersion;
    final paddingTolerance = this.paddingTolerance;
    final rowIndexStride = this.rowIndexStride;
    final stripeSizeBytes = this.stripeSizeBytes;
    return {
      if (blockSizeBytes != null) 'BlockSizeBytes': blockSizeBytes,
      if (bloomFilterColumns != null) 'BloomFilterColumns': bloomFilterColumns,
      if (bloomFilterFalsePositiveProbability != null)
        'BloomFilterFalsePositiveProbability':
            bloomFilterFalsePositiveProbability,
      if (compression != null) 'Compression': compression.toValue(),
      if (dictionaryKeyThreshold != null)
        'DictionaryKeyThreshold': dictionaryKeyThreshold,
      if (enablePadding != null) 'EnablePadding': enablePadding,
      if (formatVersion != null) 'FormatVersion': formatVersion.toValue(),
      if (paddingTolerance != null) 'PaddingTolerance': paddingTolerance,
      if (rowIndexStride != null) 'RowIndexStride': rowIndexStride,
      if (stripeSizeBytes != null) 'StripeSizeBytes': stripeSizeBytes,
    };
  }
}

/// Specifies the serializer that you want Firehose to use to convert the format
/// of your data before it writes it to Amazon S3. This parameter is required if
/// <code>Enabled</code> is set to true.
class OutputFormatConfiguration {
  /// Specifies which serializer to use. You can choose either the ORC SerDe or
  /// the Parquet SerDe. If both are non-null, the server rejects the request.
  final Serializer? serializer;

  OutputFormatConfiguration({
    this.serializer,
  });

  factory OutputFormatConfiguration.fromJson(Map<String, dynamic> json) {
    return OutputFormatConfiguration(
      serializer: json['Serializer'] != null
          ? Serializer.fromJson(json['Serializer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serializer = this.serializer;
    return {
      if (serializer != null) 'Serializer': serializer,
    };
  }
}

enum ParquetCompression {
  uncompressed,
  gzip,
  snappy,
}

extension ParquetCompressionValueExtension on ParquetCompression {
  String toValue() {
    switch (this) {
      case ParquetCompression.uncompressed:
        return 'UNCOMPRESSED';
      case ParquetCompression.gzip:
        return 'GZIP';
      case ParquetCompression.snappy:
        return 'SNAPPY';
    }
  }
}

extension ParquetCompressionFromString on String {
  ParquetCompression toParquetCompression() {
    switch (this) {
      case 'UNCOMPRESSED':
        return ParquetCompression.uncompressed;
      case 'GZIP':
        return ParquetCompression.gzip;
      case 'SNAPPY':
        return ParquetCompression.snappy;
    }
    throw Exception('$this is not known in enum ParquetCompression');
  }
}

/// A serializer to use for converting data to the Parquet format before storing
/// it in Amazon S3. For more information, see <a
/// href="https://parquet.apache.org/documentation/latest/">Apache Parquet</a>.
class ParquetSerDe {
  /// The Hadoop Distributed File System (HDFS) block size. This is useful if you
  /// intend to copy the data from Amazon S3 to HDFS before querying. The default
  /// is 256 MiB and the minimum is 64 MiB. Firehose uses this value for padding
  /// calculations.
  final int? blockSizeBytes;

  /// The compression code to use over data blocks. The possible values are
  /// <code>UNCOMPRESSED</code>, <code>SNAPPY</code>, and <code>GZIP</code>, with
  /// the default being <code>SNAPPY</code>. Use <code>SNAPPY</code> for higher
  /// decompression speed. Use <code>GZIP</code> if the compression ratio is more
  /// important than speed.
  final ParquetCompression? compression;

  /// Indicates whether to enable dictionary compression.
  final bool? enableDictionaryCompression;

  /// The maximum amount of padding to apply. This is useful if you intend to copy
  /// the data from Amazon S3 to HDFS before querying. The default is 0.
  final int? maxPaddingBytes;

  /// The Parquet page size. Column chunks are divided into pages. A page is
  /// conceptually an indivisible unit (in terms of compression and encoding). The
  /// minimum value is 64 KiB and the default is 1 MiB.
  final int? pageSizeBytes;

  /// Indicates the version of row format to output. The possible values are
  /// <code>V1</code> and <code>V2</code>. The default is <code>V1</code>.
  final ParquetWriterVersion? writerVersion;

  ParquetSerDe({
    this.blockSizeBytes,
    this.compression,
    this.enableDictionaryCompression,
    this.maxPaddingBytes,
    this.pageSizeBytes,
    this.writerVersion,
  });

  factory ParquetSerDe.fromJson(Map<String, dynamic> json) {
    return ParquetSerDe(
      blockSizeBytes: json['BlockSizeBytes'] as int?,
      compression: (json['Compression'] as String?)?.toParquetCompression(),
      enableDictionaryCompression: json['EnableDictionaryCompression'] as bool?,
      maxPaddingBytes: json['MaxPaddingBytes'] as int?,
      pageSizeBytes: json['PageSizeBytes'] as int?,
      writerVersion:
          (json['WriterVersion'] as String?)?.toParquetWriterVersion(),
    );
  }

  Map<String, dynamic> toJson() {
    final blockSizeBytes = this.blockSizeBytes;
    final compression = this.compression;
    final enableDictionaryCompression = this.enableDictionaryCompression;
    final maxPaddingBytes = this.maxPaddingBytes;
    final pageSizeBytes = this.pageSizeBytes;
    final writerVersion = this.writerVersion;
    return {
      if (blockSizeBytes != null) 'BlockSizeBytes': blockSizeBytes,
      if (compression != null) 'Compression': compression.toValue(),
      if (enableDictionaryCompression != null)
        'EnableDictionaryCompression': enableDictionaryCompression,
      if (maxPaddingBytes != null) 'MaxPaddingBytes': maxPaddingBytes,
      if (pageSizeBytes != null) 'PageSizeBytes': pageSizeBytes,
      if (writerVersion != null) 'WriterVersion': writerVersion.toValue(),
    };
  }
}

enum ParquetWriterVersion {
  v1,
  v2,
}

extension ParquetWriterVersionValueExtension on ParquetWriterVersion {
  String toValue() {
    switch (this) {
      case ParquetWriterVersion.v1:
        return 'V1';
      case ParquetWriterVersion.v2:
        return 'V2';
    }
  }
}

extension ParquetWriterVersionFromString on String {
  ParquetWriterVersion toParquetWriterVersion() {
    switch (this) {
      case 'V1':
        return ParquetWriterVersion.v1;
      case 'V2':
        return ParquetWriterVersion.v2;
    }
    throw Exception('$this is not known in enum ParquetWriterVersion');
  }
}

/// Describes a data processing configuration.
class ProcessingConfiguration {
  /// Enables or disables data processing.
  final bool? enabled;

  /// The data processors.
  final List<Processor>? processors;

  ProcessingConfiguration({
    this.enabled,
    this.processors,
  });

  factory ProcessingConfiguration.fromJson(Map<String, dynamic> json) {
    return ProcessingConfiguration(
      enabled: json['Enabled'] as bool?,
      processors: (json['Processors'] as List?)
          ?.whereNotNull()
          .map((e) => Processor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final processors = this.processors;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (processors != null) 'Processors': processors,
    };
  }
}

/// Describes a data processor.
/// <note>
/// If you want to add a new line delimiter between records in objects that are
/// delivered to Amazon S3, choose <code>AppendDelimiterToRecord</code> as a
/// processor type. You don’t have to put a processor parameter when you select
/// <code>AppendDelimiterToRecord</code>.
/// </note>
class Processor {
  /// The type of processor.
  final ProcessorType type;

  /// The processor parameters.
  final List<ProcessorParameter>? parameters;

  Processor({
    required this.type,
    this.parameters,
  });

  factory Processor.fromJson(Map<String, dynamic> json) {
    return Processor(
      type: (json['Type'] as String).toProcessorType(),
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => ProcessorParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final parameters = this.parameters;
    return {
      'Type': type.toValue(),
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

/// Describes the processor parameter.
class ProcessorParameter {
  /// The name of the parameter. Currently the following default values are
  /// supported: 3 for <code>NumberOfRetries</code> and 60 for the
  /// <code>BufferIntervalInSeconds</code>. The <code>BufferSizeInMBs</code>
  /// ranges between 0.2 MB and up to 3MB. The default buffering hint is 1MB for
  /// all destinations, except Splunk. For Splunk, the default buffering hint is
  /// 256 KB.
  final ProcessorParameterName parameterName;

  /// The parameter value.
  final String parameterValue;

  ProcessorParameter({
    required this.parameterName,
    required this.parameterValue,
  });

  factory ProcessorParameter.fromJson(Map<String, dynamic> json) {
    return ProcessorParameter(
      parameterName:
          (json['ParameterName'] as String).toProcessorParameterName(),
      parameterValue: json['ParameterValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    return {
      'ParameterName': parameterName.toValue(),
      'ParameterValue': parameterValue,
    };
  }
}

enum ProcessorParameterName {
  lambdaArn,
  numberOfRetries,
  metadataExtractionQuery,
  jsonParsingEngine,
  roleArn,
  bufferSizeInMBs,
  bufferIntervalInSeconds,
  subRecordType,
  delimiter,
  compressionFormat,
  dataMessageExtraction,
}

extension ProcessorParameterNameValueExtension on ProcessorParameterName {
  String toValue() {
    switch (this) {
      case ProcessorParameterName.lambdaArn:
        return 'LambdaArn';
      case ProcessorParameterName.numberOfRetries:
        return 'NumberOfRetries';
      case ProcessorParameterName.metadataExtractionQuery:
        return 'MetadataExtractionQuery';
      case ProcessorParameterName.jsonParsingEngine:
        return 'JsonParsingEngine';
      case ProcessorParameterName.roleArn:
        return 'RoleArn';
      case ProcessorParameterName.bufferSizeInMBs:
        return 'BufferSizeInMBs';
      case ProcessorParameterName.bufferIntervalInSeconds:
        return 'BufferIntervalInSeconds';
      case ProcessorParameterName.subRecordType:
        return 'SubRecordType';
      case ProcessorParameterName.delimiter:
        return 'Delimiter';
      case ProcessorParameterName.compressionFormat:
        return 'CompressionFormat';
      case ProcessorParameterName.dataMessageExtraction:
        return 'DataMessageExtraction';
    }
  }
}

extension ProcessorParameterNameFromString on String {
  ProcessorParameterName toProcessorParameterName() {
    switch (this) {
      case 'LambdaArn':
        return ProcessorParameterName.lambdaArn;
      case 'NumberOfRetries':
        return ProcessorParameterName.numberOfRetries;
      case 'MetadataExtractionQuery':
        return ProcessorParameterName.metadataExtractionQuery;
      case 'JsonParsingEngine':
        return ProcessorParameterName.jsonParsingEngine;
      case 'RoleArn':
        return ProcessorParameterName.roleArn;
      case 'BufferSizeInMBs':
        return ProcessorParameterName.bufferSizeInMBs;
      case 'BufferIntervalInSeconds':
        return ProcessorParameterName.bufferIntervalInSeconds;
      case 'SubRecordType':
        return ProcessorParameterName.subRecordType;
      case 'Delimiter':
        return ProcessorParameterName.delimiter;
      case 'CompressionFormat':
        return ProcessorParameterName.compressionFormat;
      case 'DataMessageExtraction':
        return ProcessorParameterName.dataMessageExtraction;
    }
    throw Exception('$this is not known in enum ProcessorParameterName');
  }
}

enum ProcessorType {
  recordDeAggregation,
  decompression,
  cloudWatchLogProcessing,
  lambda,
  metadataExtraction,
  appendDelimiterToRecord,
}

extension ProcessorTypeValueExtension on ProcessorType {
  String toValue() {
    switch (this) {
      case ProcessorType.recordDeAggregation:
        return 'RecordDeAggregation';
      case ProcessorType.decompression:
        return 'Decompression';
      case ProcessorType.cloudWatchLogProcessing:
        return 'CloudWatchLogProcessing';
      case ProcessorType.lambda:
        return 'Lambda';
      case ProcessorType.metadataExtraction:
        return 'MetadataExtraction';
      case ProcessorType.appendDelimiterToRecord:
        return 'AppendDelimiterToRecord';
    }
  }
}

extension ProcessorTypeFromString on String {
  ProcessorType toProcessorType() {
    switch (this) {
      case 'RecordDeAggregation':
        return ProcessorType.recordDeAggregation;
      case 'Decompression':
        return ProcessorType.decompression;
      case 'CloudWatchLogProcessing':
        return ProcessorType.cloudWatchLogProcessing;
      case 'Lambda':
        return ProcessorType.lambda;
      case 'MetadataExtraction':
        return ProcessorType.metadataExtraction;
      case 'AppendDelimiterToRecord':
        return ProcessorType.appendDelimiterToRecord;
    }
    throw Exception('$this is not known in enum ProcessorType');
  }
}

class PutRecordBatchOutput {
  /// The number of records that might have failed processing. This number might
  /// be greater than 0 even if the <a>PutRecordBatch</a> call succeeds. Check
  /// <code>FailedPutCount</code> to determine whether there are records that you
  /// need to resend.
  final int failedPutCount;

  /// The results array. For each record, the index of the response element is the
  /// same as the index used in the request array.
  final List<PutRecordBatchResponseEntry> requestResponses;

  /// Indicates whether server-side encryption (SSE) was enabled during this
  /// operation.
  final bool? encrypted;

  PutRecordBatchOutput({
    required this.failedPutCount,
    required this.requestResponses,
    this.encrypted,
  });

  factory PutRecordBatchOutput.fromJson(Map<String, dynamic> json) {
    return PutRecordBatchOutput(
      failedPutCount: json['FailedPutCount'] as int,
      requestResponses: (json['RequestResponses'] as List)
          .whereNotNull()
          .map((e) =>
              PutRecordBatchResponseEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      encrypted: json['Encrypted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedPutCount = this.failedPutCount;
    final requestResponses = this.requestResponses;
    final encrypted = this.encrypted;
    return {
      'FailedPutCount': failedPutCount,
      'RequestResponses': requestResponses,
      if (encrypted != null) 'Encrypted': encrypted,
    };
  }
}

/// Contains the result for an individual record from a <a>PutRecordBatch</a>
/// request. If the record is successfully added to your delivery stream, it
/// receives a record ID. If the record fails to be added to your delivery
/// stream, the result includes an error code and an error message.
class PutRecordBatchResponseEntry {
  /// The error code for an individual record result.
  final String? errorCode;

  /// The error message for an individual record result.
  final String? errorMessage;

  /// The ID of the record.
  final String? recordId;

  PutRecordBatchResponseEntry({
    this.errorCode,
    this.errorMessage,
    this.recordId,
  });

  factory PutRecordBatchResponseEntry.fromJson(Map<String, dynamic> json) {
    return PutRecordBatchResponseEntry(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      recordId: json['RecordId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final recordId = this.recordId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (recordId != null) 'RecordId': recordId,
    };
  }
}

class PutRecordOutput {
  /// The ID of the record.
  final String recordId;

  /// Indicates whether server-side encryption (SSE) was enabled during this
  /// operation.
  final bool? encrypted;

  PutRecordOutput({
    required this.recordId,
    this.encrypted,
  });

  factory PutRecordOutput.fromJson(Map<String, dynamic> json) {
    return PutRecordOutput(
      recordId: json['RecordId'] as String,
      encrypted: json['Encrypted'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordId = this.recordId;
    final encrypted = this.encrypted;
    return {
      'RecordId': recordId,
      if (encrypted != null) 'Encrypted': encrypted,
    };
  }
}

/// The unit of data in a delivery stream.
class Record {
  /// The data blob, which is base64-encoded when the blob is serialized. The
  /// maximum size of the data blob, before base64-encoding, is 1,000 KiB.
  final Uint8List data;

  Record({
    required this.data,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    return {
      'Data': base64Encode(data),
    };
  }
}

/// Describes the configuration of a destination in Amazon Redshift.
class RedshiftDestinationConfiguration {
  /// The database connection string.
  final String clusterJDBCURL;

  /// The <code>COPY</code> command.
  final CopyCommand copyCommand;

  /// The user password.
  final String password;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String roleARN;

  /// The configuration for the intermediate Amazon S3 location from which Amazon
  /// Redshift obtains data. Restrictions are described in the topic for
  /// <a>CreateDeliveryStream</a>.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified in <code>RedshiftDestinationConfiguration.S3Configuration</code>
  /// because the Amazon Redshift <code>COPY</code> operation that reads from the
  /// S3 bucket doesn't support these compression formats.
  final S3DestinationConfiguration s3Configuration;

  /// The name of the user.
  final String username;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to Amazon
  /// Redshift. Default value is 3600 (60 minutes).
  final RedshiftRetryOptions? retryOptions;

  /// The configuration for backup in Amazon S3.
  final S3DestinationConfiguration? s3BackupConfiguration;

  /// The Amazon S3 backup mode. After you create a delivery stream, you can
  /// update it to enable Amazon S3 backup if it is disabled. If backup is
  /// enabled, you can't update the delivery stream to disable it.
  final RedshiftS3BackupMode? s3BackupMode;

  RedshiftDestinationConfiguration({
    required this.clusterJDBCURL,
    required this.copyCommand,
    required this.password,
    required this.roleARN,
    required this.s3Configuration,
    required this.username,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupConfiguration,
    this.s3BackupMode,
  });

  Map<String, dynamic> toJson() {
    final clusterJDBCURL = this.clusterJDBCURL;
    final copyCommand = this.copyCommand;
    final password = this.password;
    final roleARN = this.roleARN;
    final s3Configuration = this.s3Configuration;
    final username = this.username;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupConfiguration = this.s3BackupConfiguration;
    final s3BackupMode = this.s3BackupMode;
    return {
      'ClusterJDBCURL': clusterJDBCURL,
      'CopyCommand': copyCommand,
      'Password': password,
      'RoleARN': roleARN,
      'S3Configuration': s3Configuration,
      'Username': username,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupConfiguration != null)
        'S3BackupConfiguration': s3BackupConfiguration,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
    };
  }
}

/// Describes a destination in Amazon Redshift.
class RedshiftDestinationDescription {
  /// The database connection string.
  final String clusterJDBCURL;

  /// The <code>COPY</code> command.
  final CopyCommand copyCommand;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String roleARN;

  /// The Amazon S3 destination.
  final S3DestinationDescription s3DestinationDescription;

  /// The name of the user.
  final String username;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to Amazon
  /// Redshift. Default value is 3600 (60 minutes).
  final RedshiftRetryOptions? retryOptions;

  /// The configuration for backup in Amazon S3.
  final S3DestinationDescription? s3BackupDescription;

  /// The Amazon S3 backup mode.
  final RedshiftS3BackupMode? s3BackupMode;

  RedshiftDestinationDescription({
    required this.clusterJDBCURL,
    required this.copyCommand,
    required this.roleARN,
    required this.s3DestinationDescription,
    required this.username,
    this.cloudWatchLoggingOptions,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupDescription,
    this.s3BackupMode,
  });

  factory RedshiftDestinationDescription.fromJson(Map<String, dynamic> json) {
    return RedshiftDestinationDescription(
      clusterJDBCURL: json['ClusterJDBCURL'] as String,
      copyCommand:
          CopyCommand.fromJson(json['CopyCommand'] as Map<String, dynamic>),
      roleARN: json['RoleARN'] as String,
      s3DestinationDescription: S3DestinationDescription.fromJson(
          json['S3DestinationDescription'] as Map<String, dynamic>),
      username: json['Username'] as String,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      retryOptions: json['RetryOptions'] != null
          ? RedshiftRetryOptions.fromJson(
              json['RetryOptions'] as Map<String, dynamic>)
          : null,
      s3BackupDescription: json['S3BackupDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3BackupDescription'] as Map<String, dynamic>)
          : null,
      s3BackupMode: (json['S3BackupMode'] as String?)?.toRedshiftS3BackupMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final clusterJDBCURL = this.clusterJDBCURL;
    final copyCommand = this.copyCommand;
    final roleARN = this.roleARN;
    final s3DestinationDescription = this.s3DestinationDescription;
    final username = this.username;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupDescription = this.s3BackupDescription;
    final s3BackupMode = this.s3BackupMode;
    return {
      'ClusterJDBCURL': clusterJDBCURL,
      'CopyCommand': copyCommand,
      'RoleARN': roleARN,
      'S3DestinationDescription': s3DestinationDescription,
      'Username': username,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupDescription != null)
        'S3BackupDescription': s3BackupDescription,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
    };
  }
}

/// Describes an update for a destination in Amazon Redshift.
class RedshiftDestinationUpdate {
  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The database connection string.
  final String? clusterJDBCURL;

  /// The <code>COPY</code> command.
  final CopyCommand? copyCommand;

  /// The user password.
  final String? password;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver documents to Amazon
  /// Redshift. Default value is 3600 (60 minutes).
  final RedshiftRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String? roleARN;

  /// You can update a delivery stream to enable Amazon S3 backup if it is
  /// disabled. If backup is enabled, you can't update the delivery stream to
  /// disable it.
  final RedshiftS3BackupMode? s3BackupMode;

  /// The Amazon S3 destination for backup.
  final S3DestinationUpdate? s3BackupUpdate;

  /// The Amazon S3 destination.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified in <code>RedshiftDestinationUpdate.S3Update</code> because the
  /// Amazon Redshift <code>COPY</code> operation that reads from the S3 bucket
  /// doesn't support these compression formats.
  final S3DestinationUpdate? s3Update;

  /// The name of the user.
  final String? username;

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

  Map<String, dynamic> toJson() {
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final clusterJDBCURL = this.clusterJDBCURL;
    final copyCommand = this.copyCommand;
    final password = this.password;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3BackupUpdate = this.s3BackupUpdate;
    final s3Update = this.s3Update;
    final username = this.username;
    return {
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (clusterJDBCURL != null) 'ClusterJDBCURL': clusterJDBCURL,
      if (copyCommand != null) 'CopyCommand': copyCommand,
      if (password != null) 'Password': password,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3BackupUpdate != null) 'S3BackupUpdate': s3BackupUpdate,
      if (s3Update != null) 'S3Update': s3Update,
      if (username != null) 'Username': username,
    };
  }
}

/// Configures retry behavior in case Firehose is unable to deliver documents to
/// Amazon Redshift.
class RedshiftRetryOptions {
  /// The length of time during which Firehose retries delivery after a failure,
  /// starting from the initial request and including the first attempt. The
  /// default value is 3600 seconds (60 minutes). Firehose does not retry if the
  /// value of <code>DurationInSeconds</code> is 0 (zero) or if the first delivery
  /// attempt takes longer than the current value.
  final int? durationInSeconds;

  RedshiftRetryOptions({
    this.durationInSeconds,
  });

  factory RedshiftRetryOptions.fromJson(Map<String, dynamic> json) {
    return RedshiftRetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

enum RedshiftS3BackupMode {
  disabled,
  enabled,
}

extension RedshiftS3BackupModeValueExtension on RedshiftS3BackupMode {
  String toValue() {
    switch (this) {
      case RedshiftS3BackupMode.disabled:
        return 'Disabled';
      case RedshiftS3BackupMode.enabled:
        return 'Enabled';
    }
  }
}

extension RedshiftS3BackupModeFromString on String {
  RedshiftS3BackupMode toRedshiftS3BackupMode() {
    switch (this) {
      case 'Disabled':
        return RedshiftS3BackupMode.disabled;
      case 'Enabled':
        return RedshiftS3BackupMode.enabled;
    }
    throw Exception('$this is not known in enum RedshiftS3BackupMode');
  }
}

/// The retry behavior in case Firehose is unable to deliver data to an Amazon
/// S3 prefix.
class RetryOptions {
  /// The period of time during which Firehose retries to deliver data to the
  /// specified Amazon S3 prefix.
  final int? durationInSeconds;

  RetryOptions({
    this.durationInSeconds,
  });

  factory RetryOptions.fromJson(Map<String, dynamic> json) {
    return RetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

enum S3BackupMode {
  disabled,
  enabled,
}

extension S3BackupModeValueExtension on S3BackupMode {
  String toValue() {
    switch (this) {
      case S3BackupMode.disabled:
        return 'Disabled';
      case S3BackupMode.enabled:
        return 'Enabled';
    }
  }
}

extension S3BackupModeFromString on String {
  S3BackupMode toS3BackupMode() {
    switch (this) {
      case 'Disabled':
        return S3BackupMode.disabled;
      case 'Enabled':
        return S3BackupMode.enabled;
    }
    throw Exception('$this is not known in enum S3BackupMode');
  }
}

/// Describes the configuration of a destination in Amazon S3.
class S3DestinationConfiguration {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String bucketARN;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String roleARN;

  /// The buffering option. If no value is specified, <code>BufferingHints</code>
  /// object default values are used.
  final BufferingHints? bufferingHints;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified for Amazon Redshift destinations because they are not supported by
  /// the Amazon Redshift <code>COPY</code> operation that reads from the S3
  /// bucket.
  final CompressionFormat? compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration? encryptionConfiguration;

  /// A prefix that Firehose evaluates and adds to failed records before writing
  /// them to S3. This prefix appears immediately following the bucket name. For
  /// information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? prefix;

  S3DestinationConfiguration({
    required this.bucketARN,
    required this.roleARN,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.compressionFormat,
    this.encryptionConfiguration,
    this.errorOutputPrefix,
    this.prefix,
  });

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final roleARN = this.roleARN;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final compressionFormat = this.compressionFormat;
    final encryptionConfiguration = this.encryptionConfiguration;
    final errorOutputPrefix = this.errorOutputPrefix;
    final prefix = this.prefix;
    return {
      'BucketARN': bucketARN,
      'RoleARN': roleARN,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (compressionFormat != null)
        'CompressionFormat': compressionFormat.toValue(),
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (errorOutputPrefix != null) 'ErrorOutputPrefix': errorOutputPrefix,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// Describes a destination in Amazon S3.
class S3DestinationDescription {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String bucketARN;

  /// The buffering option. If no value is specified, <code>BufferingHints</code>
  /// object default values are used.
  final BufferingHints bufferingHints;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  final CompressionFormat compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration encryptionConfiguration;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String roleARN;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// A prefix that Firehose evaluates and adds to failed records before writing
  /// them to S3. This prefix appears immediately following the bucket name. For
  /// information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? prefix;

  S3DestinationDescription({
    required this.bucketARN,
    required this.bufferingHints,
    required this.compressionFormat,
    required this.encryptionConfiguration,
    required this.roleARN,
    this.cloudWatchLoggingOptions,
    this.errorOutputPrefix,
    this.prefix,
  });

  factory S3DestinationDescription.fromJson(Map<String, dynamic> json) {
    return S3DestinationDescription(
      bucketARN: json['BucketARN'] as String,
      bufferingHints: BufferingHints.fromJson(
          json['BufferingHints'] as Map<String, dynamic>),
      compressionFormat:
          (json['CompressionFormat'] as String).toCompressionFormat(),
      encryptionConfiguration: EncryptionConfiguration.fromJson(
          json['EncryptionConfiguration'] as Map<String, dynamic>),
      roleARN: json['RoleARN'] as String,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      errorOutputPrefix: json['ErrorOutputPrefix'] as String?,
      prefix: json['Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final bufferingHints = this.bufferingHints;
    final compressionFormat = this.compressionFormat;
    final encryptionConfiguration = this.encryptionConfiguration;
    final roleARN = this.roleARN;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final errorOutputPrefix = this.errorOutputPrefix;
    final prefix = this.prefix;
    return {
      'BucketARN': bucketARN,
      'BufferingHints': bufferingHints,
      'CompressionFormat': compressionFormat.toValue(),
      'EncryptionConfiguration': encryptionConfiguration,
      'RoleARN': roleARN,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (errorOutputPrefix != null) 'ErrorOutputPrefix': errorOutputPrefix,
      if (prefix != null) 'Prefix': prefix,
    };
  }
}

/// Describes an update for a destination in Amazon S3.
class S3DestinationUpdate {
  /// The ARN of the S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String? bucketARN;

  /// The buffering option. If no value is specified, <code>BufferingHints</code>
  /// object default values are used.
  final BufferingHints? bufferingHints;

  /// The CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The compression format. If no value is specified, the default is
  /// <code>UNCOMPRESSED</code>.
  ///
  /// The compression formats <code>SNAPPY</code> or <code>ZIP</code> cannot be
  /// specified for Amazon Redshift destinations because they are not supported by
  /// the Amazon Redshift <code>COPY</code> operation that reads from the S3
  /// bucket.
  final CompressionFormat? compressionFormat;

  /// The encryption configuration. If no value is specified, the default is no
  /// encryption.
  final EncryptionConfiguration? encryptionConfiguration;

  /// A prefix that Firehose evaluates and adds to failed records before writing
  /// them to S3. This prefix appears immediately following the bucket name. For
  /// information about how to specify this prefix, see <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? errorOutputPrefix;

  /// The "YYYY/MM/DD/HH" time format prefix is automatically used for delivered
  /// Amazon S3 files. You can also specify a custom prefix, as described in <a
  /// href="https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html">Custom
  /// Prefixes for Amazon S3 Objects</a>.
  final String? prefix;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
  /// Resource Names (ARNs) and Amazon Web Services Service Namespaces</a>.
  final String? roleARN;

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

  Map<String, dynamic> toJson() {
    final bucketARN = this.bucketARN;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final compressionFormat = this.compressionFormat;
    final encryptionConfiguration = this.encryptionConfiguration;
    final errorOutputPrefix = this.errorOutputPrefix;
    final prefix = this.prefix;
    final roleARN = this.roleARN;
    return {
      if (bucketARN != null) 'BucketARN': bucketARN,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (compressionFormat != null)
        'CompressionFormat': compressionFormat.toValue(),
      if (encryptionConfiguration != null)
        'EncryptionConfiguration': encryptionConfiguration,
      if (errorOutputPrefix != null) 'ErrorOutputPrefix': errorOutputPrefix,
      if (prefix != null) 'Prefix': prefix,
      if (roleARN != null) 'RoleARN': roleARN,
    };
  }
}

/// Specifies the schema to which you want Firehose to configure your data
/// before it writes it to Amazon S3. This parameter is required if
/// <code>Enabled</code> is set to true.
class SchemaConfiguration {
  /// The ID of the Amazon Web Services Glue Data Catalog. If you don't supply
  /// this, the Amazon Web Services account ID is used by default.
  final String? catalogId;

  /// Specifies the name of the Amazon Web Services Glue database that contains
  /// the schema for the output data.
  /// <important>
  /// If the <code>SchemaConfiguration</code> request parameter is used as part of
  /// invoking the <code>CreateDeliveryStream</code> API, then the
  /// <code>DatabaseName</code> property is required and its value must be
  /// specified.
  /// </important>
  final String? databaseName;

  /// If you don't specify an Amazon Web Services Region, the default is the
  /// current Region.
  final String? region;

  /// The role that Firehose can use to access Amazon Web Services Glue. This role
  /// must be in the same account you use for Firehose. Cross-account roles aren't
  /// allowed.
  /// <important>
  /// If the <code>SchemaConfiguration</code> request parameter is used as part of
  /// invoking the <code>CreateDeliveryStream</code> API, then the
  /// <code>RoleARN</code> property is required and its value must be specified.
  /// </important>
  final String? roleARN;

  /// Specifies the Amazon Web Services Glue table that contains the column
  /// information that constitutes your data schema.
  /// <important>
  /// If the <code>SchemaConfiguration</code> request parameter is used as part of
  /// invoking the <code>CreateDeliveryStream</code> API, then the
  /// <code>TableName</code> property is required and its value must be specified.
  /// </important>
  final String? tableName;

  /// Specifies the table version for the output data schema. If you don't specify
  /// this version ID, or if you set it to <code>LATEST</code>, Firehose uses the
  /// most recent version. This means that any updates to the table are
  /// automatically picked up.
  final String? versionId;

  SchemaConfiguration({
    this.catalogId,
    this.databaseName,
    this.region,
    this.roleARN,
    this.tableName,
    this.versionId,
  });

  factory SchemaConfiguration.fromJson(Map<String, dynamic> json) {
    return SchemaConfiguration(
      catalogId: json['CatalogId'] as String?,
      databaseName: json['DatabaseName'] as String?,
      region: json['Region'] as String?,
      roleARN: json['RoleARN'] as String?,
      tableName: json['TableName'] as String?,
      versionId: json['VersionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogId = this.catalogId;
    final databaseName = this.databaseName;
    final region = this.region;
    final roleARN = this.roleARN;
    final tableName = this.tableName;
    final versionId = this.versionId;
    return {
      if (catalogId != null) 'CatalogId': catalogId,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (region != null) 'Region': region,
      if (roleARN != null) 'RoleARN': roleARN,
      if (tableName != null) 'TableName': tableName,
      if (versionId != null) 'VersionId': versionId,
    };
  }
}

/// The serializer that you want Firehose to use to convert data to the target
/// format before writing it to Amazon S3. Firehose supports two types of
/// serializers: the <a
/// href="https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/orc/OrcSerde.html">ORC
/// SerDe</a> and the <a
/// href="https://hive.apache.org/javadocs/r1.2.2/api/org/apache/hadoop/hive/ql/io/parquet/serde/ParquetHiveSerDe.html">Parquet
/// SerDe</a>.
class Serializer {
  /// A serializer to use for converting data to the ORC format before storing it
  /// in Amazon S3. For more information, see <a
  /// href="https://orc.apache.org/docs/">Apache ORC</a>.
  final OrcSerDe? orcSerDe;

  /// A serializer to use for converting data to the Parquet format before storing
  /// it in Amazon S3. For more information, see <a
  /// href="https://parquet.apache.org/documentation/latest/">Apache Parquet</a>.
  final ParquetSerDe? parquetSerDe;

  Serializer({
    this.orcSerDe,
    this.parquetSerDe,
  });

  factory Serializer.fromJson(Map<String, dynamic> json) {
    return Serializer(
      orcSerDe: json['OrcSerDe'] != null
          ? OrcSerDe.fromJson(json['OrcSerDe'] as Map<String, dynamic>)
          : null,
      parquetSerDe: json['ParquetSerDe'] != null
          ? ParquetSerDe.fromJson(json['ParquetSerDe'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final orcSerDe = this.orcSerDe;
    final parquetSerDe = this.parquetSerDe;
    return {
      if (orcSerDe != null) 'OrcSerDe': orcSerDe,
      if (parquetSerDe != null) 'ParquetSerDe': parquetSerDe,
    };
  }
}

enum SnowflakeDataLoadingOption {
  jsonMapping,
  variantContentMapping,
  variantContentAndMetadataMapping,
}

extension SnowflakeDataLoadingOptionValueExtension
    on SnowflakeDataLoadingOption {
  String toValue() {
    switch (this) {
      case SnowflakeDataLoadingOption.jsonMapping:
        return 'JSON_MAPPING';
      case SnowflakeDataLoadingOption.variantContentMapping:
        return 'VARIANT_CONTENT_MAPPING';
      case SnowflakeDataLoadingOption.variantContentAndMetadataMapping:
        return 'VARIANT_CONTENT_AND_METADATA_MAPPING';
    }
  }
}

extension SnowflakeDataLoadingOptionFromString on String {
  SnowflakeDataLoadingOption toSnowflakeDataLoadingOption() {
    switch (this) {
      case 'JSON_MAPPING':
        return SnowflakeDataLoadingOption.jsonMapping;
      case 'VARIANT_CONTENT_MAPPING':
        return SnowflakeDataLoadingOption.variantContentMapping;
      case 'VARIANT_CONTENT_AND_METADATA_MAPPING':
        return SnowflakeDataLoadingOption.variantContentAndMetadataMapping;
    }
    throw Exception('$this is not known in enum SnowflakeDataLoadingOption');
  }
}

/// Configure Snowflake destination
class SnowflakeDestinationConfiguration {
  /// URL for accessing your Snowflake account. This URL must include your <a
  /// href="https://docs.snowflake.com/en/user-guide/admin-account-identifier">account
  /// identifier</a>. Note that the protocol (https://) and port number are
  /// optional.
  final String accountUrl;

  /// All data in Snowflake is maintained in databases.
  final String database;

  /// The private key used to encrypt your Snowflake client. For information, see
  /// <a
  /// href="https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation">Using
  /// Key Pair Authentication &amp; Key Rotation</a>.
  final String privateKey;

  /// The Amazon Resource Name (ARN) of the Snowflake role
  final String roleARN;
  final S3DestinationConfiguration s3Configuration;

  /// Each database consists of one or more schemas, which are logical groupings
  /// of database objects, such as tables and views
  final String schema;

  /// All data in Snowflake is stored in database tables, logically structured as
  /// collections of columns and rows.
  final String table;

  /// User login name for the Snowflake account.
  final String user;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The name of the record content column
  final String? contentColumnName;

  /// Choose to load JSON keys mapped to table column names or choose to split the
  /// JSON payload where content is mapped to a record content column and source
  /// metadata is mapped to a record metadata column.
  final SnowflakeDataLoadingOption? dataLoadingOption;

  /// Passphrase to decrypt the private key when the key is encrypted. For
  /// information, see <a
  /// href="https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation">Using
  /// Key Pair Authentication &amp; Key Rotation</a>.
  final String? keyPassphrase;

  /// The name of the record metadata column
  final String? metaDataColumnName;
  final ProcessingConfiguration? processingConfiguration;

  /// The time period where Firehose will retry sending data to the chosen HTTP
  /// endpoint.
  final SnowflakeRetryOptions? retryOptions;

  /// Choose an S3 backup mode
  final SnowflakeS3BackupMode? s3BackupMode;

  /// Optionally configure a Snowflake role. Otherwise the default user role will
  /// be used.
  final SnowflakeRoleConfiguration? snowflakeRoleConfiguration;

  /// The VPCE ID for Firehose to privately connect with Snowflake. The ID format
  /// is com.amazonaws.vpce.[region].vpce-svc-&lt;[id]&gt;. For more information,
  /// see <a
  /// href="https://docs.snowflake.com/en/user-guide/admin-security-privatelink">Amazon
  /// PrivateLink &amp; Snowflake</a>
  final SnowflakeVpcConfiguration? snowflakeVpcConfiguration;

  SnowflakeDestinationConfiguration({
    required this.accountUrl,
    required this.database,
    required this.privateKey,
    required this.roleARN,
    required this.s3Configuration,
    required this.schema,
    required this.table,
    required this.user,
    this.cloudWatchLoggingOptions,
    this.contentColumnName,
    this.dataLoadingOption,
    this.keyPassphrase,
    this.metaDataColumnName,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
    this.snowflakeRoleConfiguration,
    this.snowflakeVpcConfiguration,
  });

  Map<String, dynamic> toJson() {
    final accountUrl = this.accountUrl;
    final database = this.database;
    final privateKey = this.privateKey;
    final roleARN = this.roleARN;
    final s3Configuration = this.s3Configuration;
    final schema = this.schema;
    final table = this.table;
    final user = this.user;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final contentColumnName = this.contentColumnName;
    final dataLoadingOption = this.dataLoadingOption;
    final keyPassphrase = this.keyPassphrase;
    final metaDataColumnName = this.metaDataColumnName;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupMode = this.s3BackupMode;
    final snowflakeRoleConfiguration = this.snowflakeRoleConfiguration;
    final snowflakeVpcConfiguration = this.snowflakeVpcConfiguration;
    return {
      'AccountUrl': accountUrl,
      'Database': database,
      'PrivateKey': privateKey,
      'RoleARN': roleARN,
      'S3Configuration': s3Configuration,
      'Schema': schema,
      'Table': table,
      'User': user,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (contentColumnName != null) 'ContentColumnName': contentColumnName,
      if (dataLoadingOption != null)
        'DataLoadingOption': dataLoadingOption.toValue(),
      if (keyPassphrase != null) 'KeyPassphrase': keyPassphrase,
      if (metaDataColumnName != null) 'MetaDataColumnName': metaDataColumnName,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (snowflakeRoleConfiguration != null)
        'SnowflakeRoleConfiguration': snowflakeRoleConfiguration,
      if (snowflakeVpcConfiguration != null)
        'SnowflakeVpcConfiguration': snowflakeVpcConfiguration,
    };
  }
}

/// Optional Snowflake destination description
class SnowflakeDestinationDescription {
  /// URL for accessing your Snowflake account. This URL must include your <a
  /// href="https://docs.snowflake.com/en/user-guide/admin-account-identifier">account
  /// identifier</a>. Note that the protocol (https://) and port number are
  /// optional.
  final String? accountUrl;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The name of the record content column
  final String? contentColumnName;

  /// Choose to load JSON keys mapped to table column names or choose to split the
  /// JSON payload where content is mapped to a record content column and source
  /// metadata is mapped to a record metadata column.
  final SnowflakeDataLoadingOption? dataLoadingOption;

  /// All data in Snowflake is maintained in databases.
  final String? database;

  /// The name of the record metadata column
  final String? metaDataColumnName;
  final ProcessingConfiguration? processingConfiguration;

  /// The time period where Firehose will retry sending data to the chosen HTTP
  /// endpoint.
  final SnowflakeRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the Snowflake role
  final String? roleARN;

  /// Choose an S3 backup mode
  final SnowflakeS3BackupMode? s3BackupMode;
  final S3DestinationDescription? s3DestinationDescription;

  /// Each database consists of one or more schemas, which are logical groupings
  /// of database objects, such as tables and views
  final String? schema;

  /// Optionally configure a Snowflake role. Otherwise the default user role will
  /// be used.
  final SnowflakeRoleConfiguration? snowflakeRoleConfiguration;

  /// The VPCE ID for Firehose to privately connect with Snowflake. The ID format
  /// is com.amazonaws.vpce.[region].vpce-svc-&lt;[id]&gt;. For more information,
  /// see <a
  /// href="https://docs.snowflake.com/en/user-guide/admin-security-privatelink">Amazon
  /// PrivateLink &amp; Snowflake</a>
  final SnowflakeVpcConfiguration? snowflakeVpcConfiguration;

  /// All data in Snowflake is stored in database tables, logically structured as
  /// collections of columns and rows.
  final String? table;

  /// User login name for the Snowflake account.
  final String? user;

  SnowflakeDestinationDescription({
    this.accountUrl,
    this.cloudWatchLoggingOptions,
    this.contentColumnName,
    this.dataLoadingOption,
    this.database,
    this.metaDataColumnName,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
    this.s3DestinationDescription,
    this.schema,
    this.snowflakeRoleConfiguration,
    this.snowflakeVpcConfiguration,
    this.table,
    this.user,
  });

  factory SnowflakeDestinationDescription.fromJson(Map<String, dynamic> json) {
    return SnowflakeDestinationDescription(
      accountUrl: json['AccountUrl'] as String?,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      contentColumnName: json['ContentColumnName'] as String?,
      dataLoadingOption: (json['DataLoadingOption'] as String?)
          ?.toSnowflakeDataLoadingOption(),
      database: json['Database'] as String?,
      metaDataColumnName: json['MetaDataColumnName'] as String?,
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      retryOptions: json['RetryOptions'] != null
          ? SnowflakeRetryOptions.fromJson(
              json['RetryOptions'] as Map<String, dynamic>)
          : null,
      roleARN: json['RoleARN'] as String?,
      s3BackupMode:
          (json['S3BackupMode'] as String?)?.toSnowflakeS3BackupMode(),
      s3DestinationDescription: json['S3DestinationDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3DestinationDescription'] as Map<String, dynamic>)
          : null,
      schema: json['Schema'] as String?,
      snowflakeRoleConfiguration: json['SnowflakeRoleConfiguration'] != null
          ? SnowflakeRoleConfiguration.fromJson(
              json['SnowflakeRoleConfiguration'] as Map<String, dynamic>)
          : null,
      snowflakeVpcConfiguration: json['SnowflakeVpcConfiguration'] != null
          ? SnowflakeVpcConfiguration.fromJson(
              json['SnowflakeVpcConfiguration'] as Map<String, dynamic>)
          : null,
      table: json['Table'] as String?,
      user: json['User'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountUrl = this.accountUrl;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final contentColumnName = this.contentColumnName;
    final dataLoadingOption = this.dataLoadingOption;
    final database = this.database;
    final metaDataColumnName = this.metaDataColumnName;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3DestinationDescription = this.s3DestinationDescription;
    final schema = this.schema;
    final snowflakeRoleConfiguration = this.snowflakeRoleConfiguration;
    final snowflakeVpcConfiguration = this.snowflakeVpcConfiguration;
    final table = this.table;
    final user = this.user;
    return {
      if (accountUrl != null) 'AccountUrl': accountUrl,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (contentColumnName != null) 'ContentColumnName': contentColumnName,
      if (dataLoadingOption != null)
        'DataLoadingOption': dataLoadingOption.toValue(),
      if (database != null) 'Database': database,
      if (metaDataColumnName != null) 'MetaDataColumnName': metaDataColumnName,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3DestinationDescription != null)
        'S3DestinationDescription': s3DestinationDescription,
      if (schema != null) 'Schema': schema,
      if (snowflakeRoleConfiguration != null)
        'SnowflakeRoleConfiguration': snowflakeRoleConfiguration,
      if (snowflakeVpcConfiguration != null)
        'SnowflakeVpcConfiguration': snowflakeVpcConfiguration,
      if (table != null) 'Table': table,
      if (user != null) 'User': user,
    };
  }
}

/// Update to configuration settings
class SnowflakeDestinationUpdate {
  /// URL for accessing your Snowflake account. This URL must include your <a
  /// href="https://docs.snowflake.com/en/user-guide/admin-account-identifier">account
  /// identifier</a>. Note that the protocol (https://) and port number are
  /// optional.
  final String? accountUrl;
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The name of the content metadata column
  final String? contentColumnName;

  /// JSON keys mapped to table column names or choose to split the JSON payload
  /// where content is mapped to a record content column and source metadata is
  /// mapped to a record metadata column.
  final SnowflakeDataLoadingOption? dataLoadingOption;

  /// All data in Snowflake is maintained in databases.
  final String? database;

  /// Passphrase to decrypt the private key when the key is encrypted. For
  /// information, see <a
  /// href="https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation">Using
  /// Key Pair Authentication &amp; Key Rotation</a>.
  final String? keyPassphrase;

  /// The name of the record metadata column
  final String? metaDataColumnName;

  /// The private key used to encrypt your Snowflake client. For information, see
  /// <a
  /// href="https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation">Using
  /// Key Pair Authentication &amp; Key Rotation</a>.
  final String? privateKey;
  final ProcessingConfiguration? processingConfiguration;

  /// Specify how long Firehose retries sending data to the New Relic HTTP
  /// endpoint. After sending data, Firehose first waits for an acknowledgment
  /// from the HTTP endpoint. If an error occurs or the acknowledgment doesn’t
  /// arrive within the acknowledgment timeout period, Firehose starts the retry
  /// duration counter. It keeps retrying until the retry duration expires. After
  /// that, Firehose considers it a data delivery failure and backs up the data to
  /// your Amazon S3 bucket. Every time that Firehose sends data to the HTTP
  /// endpoint (either the initial attempt or a retry), it restarts the
  /// acknowledgement timeout counter and waits for an acknowledgement from the
  /// HTTP endpoint. Even if the retry duration expires, Firehose still waits for
  /// the acknowledgment until it receives it or the acknowledgement timeout
  /// period is reached. If the acknowledgment times out, Firehose determines
  /// whether there's time left in the retry counter. If there is time left, it
  /// retries again and repeats the logic until it receives an acknowledgment or
  /// determines that the retry time has expired. If you don't want Firehose to
  /// retry sending data, set this value to 0.
  final SnowflakeRetryOptions? retryOptions;

  /// The Amazon Resource Name (ARN) of the Snowflake role
  final String? roleARN;

  /// Choose an S3 backup mode
  final SnowflakeS3BackupMode? s3BackupMode;
  final S3DestinationUpdate? s3Update;

  /// Each database consists of one or more schemas, which are logical groupings
  /// of database objects, such as tables and views
  final String? schema;

  /// Optionally configure a Snowflake role. Otherwise the default user role will
  /// be used.
  final SnowflakeRoleConfiguration? snowflakeRoleConfiguration;

  /// All data in Snowflake is stored in database tables, logically structured as
  /// collections of columns and rows.
  final String? table;

  /// User login name for the Snowflake account.
  final String? user;

  SnowflakeDestinationUpdate({
    this.accountUrl,
    this.cloudWatchLoggingOptions,
    this.contentColumnName,
    this.dataLoadingOption,
    this.database,
    this.keyPassphrase,
    this.metaDataColumnName,
    this.privateKey,
    this.processingConfiguration,
    this.retryOptions,
    this.roleARN,
    this.s3BackupMode,
    this.s3Update,
    this.schema,
    this.snowflakeRoleConfiguration,
    this.table,
    this.user,
  });

  Map<String, dynamic> toJson() {
    final accountUrl = this.accountUrl;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final contentColumnName = this.contentColumnName;
    final dataLoadingOption = this.dataLoadingOption;
    final database = this.database;
    final keyPassphrase = this.keyPassphrase;
    final metaDataColumnName = this.metaDataColumnName;
    final privateKey = this.privateKey;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final roleARN = this.roleARN;
    final s3BackupMode = this.s3BackupMode;
    final s3Update = this.s3Update;
    final schema = this.schema;
    final snowflakeRoleConfiguration = this.snowflakeRoleConfiguration;
    final table = this.table;
    final user = this.user;
    return {
      if (accountUrl != null) 'AccountUrl': accountUrl,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (contentColumnName != null) 'ContentColumnName': contentColumnName,
      if (dataLoadingOption != null)
        'DataLoadingOption': dataLoadingOption.toValue(),
      if (database != null) 'Database': database,
      if (keyPassphrase != null) 'KeyPassphrase': keyPassphrase,
      if (metaDataColumnName != null) 'MetaDataColumnName': metaDataColumnName,
      if (privateKey != null) 'PrivateKey': privateKey,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (roleARN != null) 'RoleARN': roleARN,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3Update != null) 'S3Update': s3Update,
      if (schema != null) 'Schema': schema,
      if (snowflakeRoleConfiguration != null)
        'SnowflakeRoleConfiguration': snowflakeRoleConfiguration,
      if (table != null) 'Table': table,
      if (user != null) 'User': user,
    };
  }
}

/// Specify how long Firehose retries sending data to the New Relic HTTP
/// endpoint. After sending data, Firehose first waits for an acknowledgment
/// from the HTTP endpoint. If an error occurs or the acknowledgment doesn’t
/// arrive within the acknowledgment timeout period, Firehose starts the retry
/// duration counter. It keeps retrying until the retry duration expires. After
/// that, Firehose considers it a data delivery failure and backs up the data to
/// your Amazon S3 bucket. Every time that Firehose sends data to the HTTP
/// endpoint (either the initial attempt or a retry), it restarts the
/// acknowledgement timeout counter and waits for an acknowledgement from the
/// HTTP endpoint. Even if the retry duration expires, Firehose still waits for
/// the acknowledgment until it receives it or the acknowledgement timeout
/// period is reached. If the acknowledgment times out, Firehose determines
/// whether there's time left in the retry counter. If there is time left, it
/// retries again and repeats the logic until it receives an acknowledgment or
/// determines that the retry time has expired. If you don't want Firehose to
/// retry sending data, set this value to 0.
class SnowflakeRetryOptions {
  /// the time period where Firehose will retry sending data to the chosen HTTP
  /// endpoint.
  final int? durationInSeconds;

  SnowflakeRetryOptions({
    this.durationInSeconds,
  });

  factory SnowflakeRetryOptions.fromJson(Map<String, dynamic> json) {
    return SnowflakeRetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

/// Optionally configure a Snowflake role. Otherwise the default user role will
/// be used.
class SnowflakeRoleConfiguration {
  /// Enable Snowflake role
  final bool? enabled;

  /// The Snowflake role you wish to configure
  final String? snowflakeRole;

  SnowflakeRoleConfiguration({
    this.enabled,
    this.snowflakeRole,
  });

  factory SnowflakeRoleConfiguration.fromJson(Map<String, dynamic> json) {
    return SnowflakeRoleConfiguration(
      enabled: json['Enabled'] as bool?,
      snowflakeRole: json['SnowflakeRole'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final snowflakeRole = this.snowflakeRole;
    return {
      if (enabled != null) 'Enabled': enabled,
      if (snowflakeRole != null) 'SnowflakeRole': snowflakeRole,
    };
  }
}

enum SnowflakeS3BackupMode {
  failedDataOnly,
  allData,
}

extension SnowflakeS3BackupModeValueExtension on SnowflakeS3BackupMode {
  String toValue() {
    switch (this) {
      case SnowflakeS3BackupMode.failedDataOnly:
        return 'FailedDataOnly';
      case SnowflakeS3BackupMode.allData:
        return 'AllData';
    }
  }
}

extension SnowflakeS3BackupModeFromString on String {
  SnowflakeS3BackupMode toSnowflakeS3BackupMode() {
    switch (this) {
      case 'FailedDataOnly':
        return SnowflakeS3BackupMode.failedDataOnly;
      case 'AllData':
        return SnowflakeS3BackupMode.allData;
    }
    throw Exception('$this is not known in enum SnowflakeS3BackupMode');
  }
}

/// Configure a Snowflake VPC
class SnowflakeVpcConfiguration {
  /// The VPCE ID for Firehose to privately connect with Snowflake. The ID format
  /// is com.amazonaws.vpce.[region].vpce-svc-&lt;[id]&gt;. For more information,
  /// see <a
  /// href="https://docs.snowflake.com/en/user-guide/admin-security-privatelink">Amazon
  /// PrivateLink &amp; Snowflake</a>
  final String privateLinkVpceId;

  SnowflakeVpcConfiguration({
    required this.privateLinkVpceId,
  });

  factory SnowflakeVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return SnowflakeVpcConfiguration(
      privateLinkVpceId: json['PrivateLinkVpceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final privateLinkVpceId = this.privateLinkVpceId;
    return {
      'PrivateLinkVpceId': privateLinkVpceId,
    };
  }
}

/// Details about a Kinesis data stream used as the source for a Firehose
/// delivery stream.
class SourceDescription {
  /// The <a>KinesisStreamSourceDescription</a> value for the source Kinesis data
  /// stream.
  final KinesisStreamSourceDescription? kinesisStreamSourceDescription;

  /// The configuration description for the Amazon MSK cluster to be used as the
  /// source for a delivery stream.
  final MSKSourceDescription? mSKSourceDescription;

  SourceDescription({
    this.kinesisStreamSourceDescription,
    this.mSKSourceDescription,
  });

  factory SourceDescription.fromJson(Map<String, dynamic> json) {
    return SourceDescription(
      kinesisStreamSourceDescription: json['KinesisStreamSourceDescription'] !=
              null
          ? KinesisStreamSourceDescription.fromJson(
              json['KinesisStreamSourceDescription'] as Map<String, dynamic>)
          : null,
      mSKSourceDescription: json['MSKSourceDescription'] != null
          ? MSKSourceDescription.fromJson(
              json['MSKSourceDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisStreamSourceDescription = this.kinesisStreamSourceDescription;
    final mSKSourceDescription = this.mSKSourceDescription;
    return {
      if (kinesisStreamSourceDescription != null)
        'KinesisStreamSourceDescription': kinesisStreamSourceDescription,
      if (mSKSourceDescription != null)
        'MSKSourceDescription': mSKSourceDescription,
    };
  }
}

/// The buffering options. If no value is specified, the default values for
/// Splunk are used.
class SplunkBufferingHints {
  /// Buffer incoming data for the specified period of time, in seconds, before
  /// delivering it to the destination. The default value is 60 (1 minute).
  final int? intervalInSeconds;

  /// Buffer incoming data to the specified size, in MBs, before delivering it to
  /// the destination. The default value is 5.
  final int? sizeInMBs;

  SplunkBufferingHints({
    this.intervalInSeconds,
    this.sizeInMBs,
  });

  factory SplunkBufferingHints.fromJson(Map<String, dynamic> json) {
    return SplunkBufferingHints(
      intervalInSeconds: json['IntervalInSeconds'] as int?,
      sizeInMBs: json['SizeInMBs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final intervalInSeconds = this.intervalInSeconds;
    final sizeInMBs = this.sizeInMBs;
    return {
      if (intervalInSeconds != null) 'IntervalInSeconds': intervalInSeconds,
      if (sizeInMBs != null) 'SizeInMBs': sizeInMBs,
    };
  }
}

/// Describes the configuration of a destination in Splunk.
class SplunkDestinationConfiguration {
  /// The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.
  final String hECEndpoint;

  /// This type can be either "Raw" or "Event."
  final HECEndpointType hECEndpointType;

  /// This is a GUID that you obtain from your Splunk cluster when you create a
  /// new HEC endpoint.
  final String hECToken;

  /// The configuration for the backup Amazon S3 location.
  final S3DestinationConfiguration s3Configuration;

  /// The buffering options. If no value is specified, the default values for
  /// Splunk are used.
  final SplunkBufferingHints? bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The amount of time that Firehose waits to receive an acknowledgment from
  /// Splunk after it sends it data. At the end of the timeout period, Firehose
  /// either tries to send the data again or considers it an error, based on your
  /// retry settings.
  final int? hECAcknowledgmentTimeoutInSeconds;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver data to Splunk, or
  /// if it doesn't receive an acknowledgment of receipt from Splunk.
  final SplunkRetryOptions? retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When set to
  /// <code>FailedEventsOnly</code>, Firehose writes any data that could not be
  /// indexed to the configured Amazon S3 destination. When set to
  /// <code>AllEvents</code>, Firehose delivers all incoming records to Amazon S3,
  /// and also writes failed documents to Amazon S3. The default value is
  /// <code>FailedEventsOnly</code>.
  ///
  /// You can update this backup mode from <code>FailedEventsOnly</code> to
  /// <code>AllEvents</code>. You can't update it from <code>AllEvents</code> to
  /// <code>FailedEventsOnly</code>.
  final SplunkS3BackupMode? s3BackupMode;

  SplunkDestinationConfiguration({
    required this.hECEndpoint,
    required this.hECEndpointType,
    required this.hECToken,
    required this.s3Configuration,
    this.bufferingHints,
    this.cloudWatchLoggingOptions,
    this.hECAcknowledgmentTimeoutInSeconds,
    this.processingConfiguration,
    this.retryOptions,
    this.s3BackupMode,
  });

  Map<String, dynamic> toJson() {
    final hECEndpoint = this.hECEndpoint;
    final hECEndpointType = this.hECEndpointType;
    final hECToken = this.hECToken;
    final s3Configuration = this.s3Configuration;
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final hECAcknowledgmentTimeoutInSeconds =
        this.hECAcknowledgmentTimeoutInSeconds;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupMode = this.s3BackupMode;
    return {
      'HECEndpoint': hECEndpoint,
      'HECEndpointType': hECEndpointType.toValue(),
      'HECToken': hECToken,
      'S3Configuration': s3Configuration,
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (hECAcknowledgmentTimeoutInSeconds != null)
        'HECAcknowledgmentTimeoutInSeconds': hECAcknowledgmentTimeoutInSeconds,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
    };
  }
}

/// Describes a destination in Splunk.
class SplunkDestinationDescription {
  /// The buffering options. If no value is specified, the default values for
  /// Splunk are used.
  final SplunkBufferingHints? bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The amount of time that Firehose waits to receive an acknowledgment from
  /// Splunk after it sends it data. At the end of the timeout period, Firehose
  /// either tries to send the data again or considers it an error, based on your
  /// retry settings.
  final int? hECAcknowledgmentTimeoutInSeconds;

  /// The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.
  final String? hECEndpoint;

  /// This type can be either "Raw" or "Event."
  final HECEndpointType? hECEndpointType;

  /// A GUID you obtain from your Splunk cluster when you create a new HEC
  /// endpoint.
  final String? hECToken;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver data to Splunk or
  /// if it doesn't receive an acknowledgment of receipt from Splunk.
  final SplunkRetryOptions? retryOptions;

  /// Defines how documents should be delivered to Amazon S3. When set to
  /// <code>FailedDocumentsOnly</code>, Firehose writes any data that could not be
  /// indexed to the configured Amazon S3 destination. When set to
  /// <code>AllDocuments</code>, Firehose delivers all incoming records to Amazon
  /// S3, and also writes failed documents to Amazon S3. Default value is
  /// <code>FailedDocumentsOnly</code>.
  final SplunkS3BackupMode? s3BackupMode;

  /// The Amazon S3 destination.&gt;
  final S3DestinationDescription? s3DestinationDescription;

  SplunkDestinationDescription({
    this.bufferingHints,
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

  factory SplunkDestinationDescription.fromJson(Map<String, dynamic> json) {
    return SplunkDestinationDescription(
      bufferingHints: json['BufferingHints'] != null
          ? SplunkBufferingHints.fromJson(
              json['BufferingHints'] as Map<String, dynamic>)
          : null,
      cloudWatchLoggingOptions: json['CloudWatchLoggingOptions'] != null
          ? CloudWatchLoggingOptions.fromJson(
              json['CloudWatchLoggingOptions'] as Map<String, dynamic>)
          : null,
      hECAcknowledgmentTimeoutInSeconds:
          json['HECAcknowledgmentTimeoutInSeconds'] as int?,
      hECEndpoint: json['HECEndpoint'] as String?,
      hECEndpointType:
          (json['HECEndpointType'] as String?)?.toHECEndpointType(),
      hECToken: json['HECToken'] as String?,
      processingConfiguration: json['ProcessingConfiguration'] != null
          ? ProcessingConfiguration.fromJson(
              json['ProcessingConfiguration'] as Map<String, dynamic>)
          : null,
      retryOptions: json['RetryOptions'] != null
          ? SplunkRetryOptions.fromJson(
              json['RetryOptions'] as Map<String, dynamic>)
          : null,
      s3BackupMode: (json['S3BackupMode'] as String?)?.toSplunkS3BackupMode(),
      s3DestinationDescription: json['S3DestinationDescription'] != null
          ? S3DestinationDescription.fromJson(
              json['S3DestinationDescription'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final hECAcknowledgmentTimeoutInSeconds =
        this.hECAcknowledgmentTimeoutInSeconds;
    final hECEndpoint = this.hECEndpoint;
    final hECEndpointType = this.hECEndpointType;
    final hECToken = this.hECToken;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupMode = this.s3BackupMode;
    final s3DestinationDescription = this.s3DestinationDescription;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (hECAcknowledgmentTimeoutInSeconds != null)
        'HECAcknowledgmentTimeoutInSeconds': hECAcknowledgmentTimeoutInSeconds,
      if (hECEndpoint != null) 'HECEndpoint': hECEndpoint,
      if (hECEndpointType != null) 'HECEndpointType': hECEndpointType.toValue(),
      if (hECToken != null) 'HECToken': hECToken,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3DestinationDescription != null)
        'S3DestinationDescription': s3DestinationDescription,
    };
  }
}

/// Describes an update for a destination in Splunk.
class SplunkDestinationUpdate {
  /// The buffering options. If no value is specified, the default values for
  /// Splunk are used.
  final SplunkBufferingHints? bufferingHints;

  /// The Amazon CloudWatch logging options for your delivery stream.
  final CloudWatchLoggingOptions? cloudWatchLoggingOptions;

  /// The amount of time that Firehose waits to receive an acknowledgment from
  /// Splunk after it sends data. At the end of the timeout period, Firehose
  /// either tries to send the data again or considers it an error, based on your
  /// retry settings.
  final int? hECAcknowledgmentTimeoutInSeconds;

  /// The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.
  final String? hECEndpoint;

  /// This type can be either "Raw" or "Event."
  final HECEndpointType? hECEndpointType;

  /// A GUID that you obtain from your Splunk cluster when you create a new HEC
  /// endpoint.
  final String? hECToken;

  /// The data processing configuration.
  final ProcessingConfiguration? processingConfiguration;

  /// The retry behavior in case Firehose is unable to deliver data to Splunk or
  /// if it doesn't receive an acknowledgment of receipt from Splunk.
  final SplunkRetryOptions? retryOptions;

  /// Specifies how you want Firehose to back up documents to Amazon S3. When set
  /// to <code>FailedDocumentsOnly</code>, Firehose writes any data that could not
  /// be indexed to the configured Amazon S3 destination. When set to
  /// <code>AllEvents</code>, Firehose delivers all incoming records to Amazon S3,
  /// and also writes failed documents to Amazon S3. The default value is
  /// <code>FailedEventsOnly</code>.
  ///
  /// You can update this backup mode from <code>FailedEventsOnly</code> to
  /// <code>AllEvents</code>. You can't update it from <code>AllEvents</code> to
  /// <code>FailedEventsOnly</code>.
  final SplunkS3BackupMode? s3BackupMode;

  /// Your update to the configuration of the backup Amazon S3 location.
  final S3DestinationUpdate? s3Update;

  SplunkDestinationUpdate({
    this.bufferingHints,
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

  Map<String, dynamic> toJson() {
    final bufferingHints = this.bufferingHints;
    final cloudWatchLoggingOptions = this.cloudWatchLoggingOptions;
    final hECAcknowledgmentTimeoutInSeconds =
        this.hECAcknowledgmentTimeoutInSeconds;
    final hECEndpoint = this.hECEndpoint;
    final hECEndpointType = this.hECEndpointType;
    final hECToken = this.hECToken;
    final processingConfiguration = this.processingConfiguration;
    final retryOptions = this.retryOptions;
    final s3BackupMode = this.s3BackupMode;
    final s3Update = this.s3Update;
    return {
      if (bufferingHints != null) 'BufferingHints': bufferingHints,
      if (cloudWatchLoggingOptions != null)
        'CloudWatchLoggingOptions': cloudWatchLoggingOptions,
      if (hECAcknowledgmentTimeoutInSeconds != null)
        'HECAcknowledgmentTimeoutInSeconds': hECAcknowledgmentTimeoutInSeconds,
      if (hECEndpoint != null) 'HECEndpoint': hECEndpoint,
      if (hECEndpointType != null) 'HECEndpointType': hECEndpointType.toValue(),
      if (hECToken != null) 'HECToken': hECToken,
      if (processingConfiguration != null)
        'ProcessingConfiguration': processingConfiguration,
      if (retryOptions != null) 'RetryOptions': retryOptions,
      if (s3BackupMode != null) 'S3BackupMode': s3BackupMode.toValue(),
      if (s3Update != null) 'S3Update': s3Update,
    };
  }
}

/// Configures retry behavior in case Firehose is unable to deliver documents to
/// Splunk, or if it doesn't receive an acknowledgment from Splunk.
class SplunkRetryOptions {
  /// The total amount of time that Firehose spends on retries. This duration
  /// starts after the initial attempt to send data to Splunk fails. It doesn't
  /// include the periods during which Firehose waits for acknowledgment from
  /// Splunk after each attempt.
  final int? durationInSeconds;

  SplunkRetryOptions({
    this.durationInSeconds,
  });

  factory SplunkRetryOptions.fromJson(Map<String, dynamic> json) {
    return SplunkRetryOptions(
      durationInSeconds: json['DurationInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
    };
  }
}

enum SplunkS3BackupMode {
  failedEventsOnly,
  allEvents,
}

extension SplunkS3BackupModeValueExtension on SplunkS3BackupMode {
  String toValue() {
    switch (this) {
      case SplunkS3BackupMode.failedEventsOnly:
        return 'FailedEventsOnly';
      case SplunkS3BackupMode.allEvents:
        return 'AllEvents';
    }
  }
}

extension SplunkS3BackupModeFromString on String {
  SplunkS3BackupMode toSplunkS3BackupMode() {
    switch (this) {
      case 'FailedEventsOnly':
        return SplunkS3BackupMode.failedEventsOnly;
      case 'AllEvents':
        return SplunkS3BackupMode.allEvents;
    }
    throw Exception('$this is not known in enum SplunkS3BackupMode');
  }
}

class StartDeliveryStreamEncryptionOutput {
  StartDeliveryStreamEncryptionOutput();

  factory StartDeliveryStreamEncryptionOutput.fromJson(Map<String, dynamic> _) {
    return StartDeliveryStreamEncryptionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopDeliveryStreamEncryptionOutput {
  StopDeliveryStreamEncryptionOutput();

  factory StopDeliveryStreamEncryptionOutput.fromJson(Map<String, dynamic> _) {
    return StopDeliveryStreamEncryptionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Metadata that you can assign to a delivery stream, consisting of a key-value
/// pair.
class Tag {
  /// A unique identifier for the tag. Maximum length: 128 characters. Valid
  /// characters: Unicode letters, digits, white space, _ . / = + - % @
  final String key;

  /// An optional string, which you can use to describe or define the tag. Maximum
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

class TagDeliveryStreamOutput {
  TagDeliveryStreamOutput();

  factory TagDeliveryStreamOutput.fromJson(Map<String, dynamic> _) {
    return TagDeliveryStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagDeliveryStreamOutput {
  UntagDeliveryStreamOutput();

  factory UntagDeliveryStreamOutput.fromJson(Map<String, dynamic> _) {
    return UntagDeliveryStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateDestinationOutput {
  UpdateDestinationOutput();

  factory UpdateDestinationOutput.fromJson(Map<String, dynamic> _) {
    return UpdateDestinationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The details of the VPC of the Amazon OpenSearch or Amazon OpenSearch
/// Serverless destination.
class VpcConfiguration {
  /// The ARN of the IAM role that you want the delivery stream to use to create
  /// endpoints in the destination VPC. You can use your existing Firehose
  /// delivery role or you can specify a new role. In either case, make sure that
  /// the role trusts the Firehose service principal and that it grants the
  /// following permissions:
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
  /// </ul> <important>
  /// When you specify subnets for delivering data to the destination in a private
  /// VPC, make sure you have enough number of free IP addresses in chosen
  /// subnets. If there is no available free IP address in a specified subnet,
  /// Firehose cannot create or add ENIs for the data delivery in the private VPC,
  /// and the delivery will be degraded or fail.
  /// </important>
  final String roleARN;

  /// The IDs of the security groups that you want Firehose to use when it creates
  /// ENIs in the VPC of the Amazon ES destination. You can use the same security
  /// group that the Amazon ES domain uses or different ones. If you specify
  /// different security groups here, ensure that they allow outbound HTTPS
  /// traffic to the Amazon ES domain's security group. Also ensure that the
  /// Amazon ES domain's security group allows HTTPS traffic from the security
  /// groups specified here. If you use the same security group for both your
  /// delivery stream and the Amazon ES domain, make sure the security group
  /// inbound rule allows HTTPS traffic. For more information about security group
  /// rules, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules">Security
  /// group rules</a> in the Amazon VPC documentation.
  final List<String> securityGroupIds;

  /// The IDs of the subnets that you want Firehose to use to create ENIs in the
  /// VPC of the Amazon ES destination. Make sure that the routing tables and
  /// inbound and outbound rules allow traffic to flow from the subnets whose IDs
  /// are specified here to the subnets that have the destination Amazon ES
  /// endpoints. Firehose creates at least one ENI in each of the subnets that are
  /// specified here. Do not delete or modify these ENIs.
  ///
  /// The number of ENIs that Firehose creates in the subnets specified here
  /// scales up and down automatically based on throughput. To enable Firehose to
  /// scale up the number of ENIs to match throughput, ensure that you have
  /// sufficient quota. To help you calculate the quota you need, assume that
  /// Firehose can create up to three ENIs for this delivery stream for each of
  /// the subnets specified here. For more information about ENI quota, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis">Network
  /// Interfaces </a> in the Amazon VPC Quotas topic.
  final List<String> subnetIds;

  VpcConfiguration({
    required this.roleARN,
    required this.securityGroupIds,
    required this.subnetIds,
  });

  Map<String, dynamic> toJson() {
    final roleARN = this.roleARN;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'RoleARN': roleARN,
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
    };
  }
}

/// The details of the VPC of the Amazon ES destination.
class VpcConfigurationDescription {
  /// The ARN of the IAM role that the delivery stream uses to create endpoints in
  /// the destination VPC. You can use your existing Firehose delivery role or you
  /// can specify a new role. In either case, make sure that the role trusts the
  /// Firehose service principal and that it grants the following permissions:
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
  /// Firehose can't scale out by creating more ENIs when necessary. You might
  /// therefore see a degradation in performance.
  final String roleARN;

  /// The IDs of the security groups that Firehose uses when it creates ENIs in
  /// the VPC of the Amazon ES destination. You can use the same security group
  /// that the Amazon ES domain uses or different ones. If you specify different
  /// security groups, ensure that they allow outbound HTTPS traffic to the Amazon
  /// ES domain's security group. Also ensure that the Amazon ES domain's security
  /// group allows HTTPS traffic from the security groups specified here. If you
  /// use the same security group for both your delivery stream and the Amazon ES
  /// domain, make sure the security group inbound rule allows HTTPS traffic. For
  /// more information about security group rules, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules">Security
  /// group rules</a> in the Amazon VPC documentation.
  final List<String> securityGroupIds;

  /// The IDs of the subnets that Firehose uses to create ENIs in the VPC of the
  /// Amazon ES destination. Make sure that the routing tables and inbound and
  /// outbound rules allow traffic to flow from the subnets whose IDs are
  /// specified here to the subnets that have the destination Amazon ES endpoints.
  /// Firehose creates at least one ENI in each of the subnets that are specified
  /// here. Do not delete or modify these ENIs.
  ///
  /// The number of ENIs that Firehose creates in the subnets specified here
  /// scales up and down automatically based on throughput. To enable Firehose to
  /// scale up the number of ENIs to match throughput, ensure that you have
  /// sufficient quota. To help you calculate the quota you need, assume that
  /// Firehose can create up to three ENIs for this delivery stream for each of
  /// the subnets specified here. For more information about ENI quota, see <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis">Network
  /// Interfaces </a> in the Amazon VPC Quotas topic.
  final List<String> subnetIds;

  /// The ID of the Amazon ES destination's VPC.
  final String vpcId;

  VpcConfigurationDescription({
    required this.roleARN,
    required this.securityGroupIds,
    required this.subnetIds,
    required this.vpcId,
  });

  factory VpcConfigurationDescription.fromJson(Map<String, dynamic> json) {
    return VpcConfigurationDescription(
      roleARN: json['RoleARN'] as String,
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final roleARN = this.roleARN;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'RoleARN': roleARN,
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
      'VpcId': vpcId,
    };
  }
}

class ConcurrentModificationException extends _s.GenericAwsException {
  ConcurrentModificationException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentModificationException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidKMSResourceException extends _s.GenericAwsException {
  InvalidKMSResourceException({String? type, String? message})
      : super(
            type: type, code: 'InvalidKMSResourceException', message: message);
}

class InvalidSourceException extends _s.GenericAwsException {
  InvalidSourceException({String? type, String? message})
      : super(type: type, code: 'InvalidSourceException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
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
  'ConcurrentModificationException': (type, message) =>
      ConcurrentModificationException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidKMSResourceException': (type, message) =>
      InvalidKMSResourceException(type: type, message: message),
  'InvalidSourceException': (type, message) =>
      InvalidSourceException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
};
