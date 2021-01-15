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

part '2017-09-30.g.dart';

/// <p/>
class KinesisVideo {
  final _s.RestJsonProtocol _protocol;
  KinesisVideo({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisvideo',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates a signaling channel.
  ///
  /// <code>CreateSignalingChannel</code> is an asynchronous operation.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [AccountChannelLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [TagsPerResourceExceededLimitException].
  ///
  /// Parameter [channelName] :
  /// A name for the signaling channel that you are creating. It must be unique
  /// for each AWS account and AWS Region.
  ///
  /// Parameter [channelType] :
  /// A type of the signaling channel that you are creating. Currently,
  /// <code>SINGLE_MASTER</code> is the only supported channel type.
  ///
  /// Parameter [singleMasterConfiguration] :
  /// A structure containing the configuration for the
  /// <code>SINGLE_MASTER</code> channel type.
  ///
  /// Parameter [tags] :
  /// A set of tags (key-value pairs) that you want to associate with this
  /// channel.
  Future<CreateSignalingChannelOutput> createSignalingChannel({
    @_s.required String channelName,
    ChannelType channelType,
    SingleMasterConfiguration singleMasterConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(channelName, 'channelName');
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ChannelName': channelName,
      if (channelType != null) 'ChannelType': channelType.toValue(),
      if (singleMasterConfiguration != null)
        'SingleMasterConfiguration': singleMasterConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createSignalingChannel',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSignalingChannelOutput.fromJson(response);
  }

  /// Creates a new Kinesis video stream.
  ///
  /// When you create a new stream, Kinesis Video Streams assigns it a version
  /// number. When you change the stream's metadata, Kinesis Video Streams
  /// updates the version.
  ///
  /// <code>CreateStream</code> is an asynchronous operation.
  ///
  /// For information about how the service works, see <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/how-it-works.html">How
  /// it Works</a>.
  ///
  /// You must have permissions for the <code>KinesisVideo:CreateStream</code>
  /// action.
  ///
  /// May throw [AccountStreamLimitExceededException].
  /// May throw [DeviceStreamLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidDeviceException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [TagsPerResourceExceededLimitException].
  ///
  /// Parameter [streamName] :
  /// A name for the stream that you are creating.
  ///
  /// The stream name is an identifier for the stream, and must be unique for
  /// each account and region.
  ///
  /// Parameter [dataRetentionInHours] :
  /// The number of hours that you want to retain the data in the stream.
  /// Kinesis Video Streams retains the data in a data store that is associated
  /// with the stream.
  ///
  /// The default value is 0, indicating that the stream does not persist data.
  ///
  /// When the <code>DataRetentionInHours</code> value is 0, consumers can still
  /// consume the fragments that remain in the service host buffer, which has a
  /// retention time limit of 5 minutes and a retention memory limit of 200 MB.
  /// Fragments are removed from the buffer when either limit is reached.
  ///
  /// Parameter [deviceName] :
  /// The name of the device that is writing to the stream.
  /// <note>
  /// In the current implementation, Kinesis Video Streams does not use this
  /// name.
  /// </note>
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the AWS Key Management Service (AWS KMS) key that you want
  /// Kinesis Video Streams to use to encrypt stream data.
  ///
  /// If no key ID is specified, the default, Kinesis Video-managed key
  /// (<code>aws/kinesisvideo</code>) is used.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html#API_DescribeKey_RequestParameters">DescribeKey</a>.
  ///
  /// Parameter [mediaType] :
  /// The media type of the stream. Consumers of the stream can use this
  /// information when processing the stream. For more information about media
  /// types, see <a
  /// href="http://www.iana.org/assignments/media-types/media-types.xhtml">Media
  /// Types</a>. If you choose to specify the <code>MediaType</code>, see <a
  /// href="https://tools.ietf.org/html/rfc6838#section-4.2">Naming
  /// Requirements</a> for guidelines.
  ///
  /// Example valid values include "video/h264" and "video/h264,audio/aac".
  ///
  /// This parameter is optional; the default value is <code>null</code> (or
  /// empty in JSON).
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the specified stream. Each tag is a
  /// key-value pair (the value is optional).
  Future<CreateStreamOutput> createStream({
    @_s.required String streamName,
    int dataRetentionInHours,
    String deviceName,
    String kmsKeyId,
    String mediaType,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'dataRetentionInHours',
      dataRetentionInHours,
      0,
      1152921504606846976,
    );
    _s.validateStringLength(
      'deviceName',
      deviceName,
      1,
      128,
    );
    _s.validateStringPattern(
      'deviceName',
      deviceName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      2048,
    );
    _s.validateStringPattern(
      'kmsKeyId',
      kmsKeyId,
      r'''.+''',
    );
    _s.validateStringLength(
      'mediaType',
      mediaType,
      1,
      128,
    );
    _s.validateStringPattern(
      'mediaType',
      mediaType,
      r'''[\w\-\.\+]+/[\w\-\.\+]+(,[\w\-\.\+]+/[\w\-\.\+]+)*''',
    );
    final $payload = <String, dynamic>{
      'StreamName': streamName,
      if (dataRetentionInHours != null)
        'DataRetentionInHours': dataRetentionInHours,
      if (deviceName != null) 'DeviceName': deviceName,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (mediaType != null) 'MediaType': mediaType,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createStream',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamOutput.fromJson(response);
  }

  /// Deletes a specified signaling channel. <code>DeleteSignalingChannel</code>
  /// is an asynchronous operation. If you don't specify the channel's current
  /// version, the most recent version is deleted.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [VersionMismatchException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [channelARN] :
  /// The Amazon Resource Name (ARN) of the signaling channel that you want to
  /// delete.
  ///
  /// Parameter [currentVersion] :
  /// The current version of the signaling channel that you want to delete. You
  /// can obtain the current version by invoking the
  /// <code>DescribeSignalingChannel</code> or
  /// <code>ListSignalingChannels</code> API operations.
  Future<void> deleteSignalingChannel({
    @_s.required String channelARN,
    String currentVersion,
  }) async {
    ArgumentError.checkNotNull(channelARN, 'channelARN');
    _s.validateStringLength(
      'channelARN',
      channelARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelARN',
      channelARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'currentVersion',
      currentVersion,
      1,
      64,
    );
    _s.validateStringPattern(
      'currentVersion',
      currentVersion,
      r'''[a-zA-Z0-9]+''',
    );
    final $payload = <String, dynamic>{
      'ChannelARN': channelARN,
      if (currentVersion != null) 'CurrentVersion': currentVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteSignalingChannel',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSignalingChannelOutput.fromJson(response);
  }

  /// Deletes a Kinesis video stream and the data contained in the stream.
  ///
  /// This method marks the stream for deletion, and makes the data in the
  /// stream inaccessible immediately.
  ///
  ///
  ///
  /// To ensure that you have the latest version of the stream before deleting
  /// it, you can specify the stream version. Kinesis Video Streams assigns a
  /// version to each stream. When you update a stream, Kinesis Video Streams
  /// assigns a new version number. To get the latest stream version, use the
  /// <code>DescribeStream</code> API.
  ///
  /// This operation requires permission for the
  /// <code>KinesisVideo:DeleteStream</code> action.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [VersionMismatchException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream that you want to delete.
  ///
  /// Parameter [currentVersion] :
  /// Optional: The version of the stream that you want to delete.
  ///
  /// Specify the version as a safeguard to ensure that your are deleting the
  /// correct stream. To get the stream version, use the
  /// <code>DescribeStream</code> API.
  ///
  /// If not specified, only the <code>CreationTime</code> is checked before
  /// deleting the stream.
  Future<void> deleteStream({
    @_s.required String streamARN,
    String currentVersion,
  }) async {
    ArgumentError.checkNotNull(streamARN, 'streamARN');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'currentVersion',
      currentVersion,
      1,
      64,
    );
    _s.validateStringPattern(
      'currentVersion',
      currentVersion,
      r'''[a-zA-Z0-9]+''',
    );
    final $payload = <String, dynamic>{
      'StreamARN': streamARN,
      if (currentVersion != null) 'CurrentVersion': currentVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteStream',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteStreamOutput.fromJson(response);
  }

  /// Returns the most current information about the signaling channel. You must
  /// specify either the name or the Amazon Resource Name (ARN) of the channel
  /// that you want to describe.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [channelARN] :
  /// The ARN of the signaling channel that you want to describe.
  ///
  /// Parameter [channelName] :
  /// The name of the signaling channel that you want to describe.
  Future<DescribeSignalingChannelOutput> describeSignalingChannel({
    String channelARN,
    String channelName,
  }) async {
    _s.validateStringLength(
      'channelARN',
      channelARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'channelARN',
      channelARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'channelName',
      channelName,
      1,
      256,
    );
    _s.validateStringPattern(
      'channelName',
      channelName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      if (channelARN != null) 'ChannelARN': channelARN,
      if (channelName != null) 'ChannelName': channelName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeSignalingChannel',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSignalingChannelOutput.fromJson(response);
  }

  /// Returns the most current information about the specified stream. You must
  /// specify either the <code>StreamName</code> or the <code>StreamARN</code>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream.
  ///
  /// Parameter [streamName] :
  /// The name of the stream.
  Future<DescribeStreamOutput> describeStream({
    String streamARN,
    String streamName,
  }) async {
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeStream',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeStreamOutput.fromJson(response);
  }

  /// Gets an endpoint for a specified stream for either reading or writing. Use
  /// this endpoint in your application to read from the specified stream (using
  /// the <code>GetMedia</code> or <code>GetMediaForFragmentList</code>
  /// operations) or write to it (using the <code>PutMedia</code> operation).
  /// <note>
  /// The returned endpoint does not have the API name appended. The client
  /// needs to add the API name to the returned endpoint.
  /// </note>
  /// In the request, specify the stream either by <code>StreamName</code> or
  /// <code>StreamARN</code>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [aPIName] :
  /// The name of the API action for which to get an endpoint.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream that you want to get the
  /// endpoint for. You must specify either this parameter or a
  /// <code>StreamName</code> in the request.
  ///
  /// Parameter [streamName] :
  /// The name of the stream that you want to get the endpoint for. You must
  /// specify either this parameter or a <code>StreamARN</code> in the request.
  Future<GetDataEndpointOutput> getDataEndpoint({
    @_s.required APIName aPIName,
    String streamARN,
    String streamName,
  }) async {
    ArgumentError.checkNotNull(aPIName, 'aPIName');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      'APIName': aPIName?.toValue() ?? '',
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getDataEndpoint',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataEndpointOutput.fromJson(response);
  }

  /// Provides an endpoint for the specified signaling channel to send and
  /// receive messages. This API uses the
  /// <code>SingleMasterChannelEndpointConfiguration</code> input parameter,
  /// which consists of the <code>Protocols</code> and <code>Role</code>
  /// properties.
  ///
  /// <code>Protocols</code> is used to determine the communication mechanism.
  /// For example, if you specify <code>WSS</code> as the protocol, this API
  /// produces a secure websocket endpoint. If you specify <code>HTTPS</code> as
  /// the protocol, this API generates an HTTPS endpoint.
  ///
  /// <code>Role</code> determines the messaging permissions. A
  /// <code>MASTER</code> role results in this API generating an endpoint that a
  /// client can use to communicate with any of the viewers on the channel. A
  /// <code>VIEWER</code> role results in this API generating an endpoint that a
  /// client can use to communicate only with a <code>MASTER</code>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [channelARN] :
  /// The Amazon Resource Name (ARN) of the signalling channel for which you
  /// want to get an endpoint.
  ///
  /// Parameter [singleMasterChannelEndpointConfiguration] :
  /// A structure containing the endpoint configuration for the
  /// <code>SINGLE_MASTER</code> channel type.
  Future<GetSignalingChannelEndpointOutput> getSignalingChannelEndpoint({
    @_s.required String channelARN,
    SingleMasterChannelEndpointConfiguration
        singleMasterChannelEndpointConfiguration,
  }) async {
    ArgumentError.checkNotNull(channelARN, 'channelARN');
    _s.validateStringLength(
      'channelARN',
      channelARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelARN',
      channelARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ChannelARN': channelARN,
      if (singleMasterChannelEndpointConfiguration != null)
        'SingleMasterChannelEndpointConfiguration':
            singleMasterChannelEndpointConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getSignalingChannelEndpoint',
      exceptionFnMap: _exceptionFns,
    );
    return GetSignalingChannelEndpointOutput.fromJson(response);
  }

  /// Returns an array of <code>ChannelInfo</code> objects. Each object
  /// describes a signaling channel. To retrieve only those channels that
  /// satisfy a specific condition, you can specify a
  /// <code>ChannelNameCondition</code>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [channelNameCondition] :
  /// Optional: Returns only the channels that satisfy a specific condition.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels to return in the response. The default is
  /// 500.
  ///
  /// Parameter [nextToken] :
  /// If you specify this parameter, when the result of a
  /// <code>ListSignalingChannels</code> operation is truncated, the call
  /// returns the <code>NextToken</code> in the response. To get another batch
  /// of channels, provide this token in your next request.
  Future<ListSignalingChannelsOutput> listSignalingChannels({
    ChannelNameCondition channelNameCondition,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/=]*''',
    );
    final $payload = <String, dynamic>{
      if (channelNameCondition != null)
        'ChannelNameCondition': channelNameCondition,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listSignalingChannels',
      exceptionFnMap: _exceptionFns,
    );
    return ListSignalingChannelsOutput.fromJson(response);
  }

  /// Returns an array of <code>StreamInfo</code> objects. Each object describes
  /// a stream. To retrieve only streams that satisfy a specific condition, you
  /// can specify a <code>StreamNameCondition</code>.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of streams to return in the response. The default is
  /// 10,000.
  ///
  /// Parameter [nextToken] :
  /// If you specify this parameter, when the result of a
  /// <code>ListStreams</code> operation is truncated, the call returns the
  /// <code>NextToken</code> in the response. To get another batch of streams,
  /// provide this token in your next request.
  ///
  /// Parameter [streamNameCondition] :
  /// Optional: Returns only streams that satisfy a specific condition.
  /// Currently, you can specify only the prefix of a stream name as a
  /// condition.
  Future<ListStreamsOutput> listStreams({
    int maxResults,
    String nextToken,
    StreamNameCondition streamNameCondition,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/=]*''',
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (streamNameCondition != null)
        'StreamNameCondition': streamNameCondition,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listStreams',
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamsOutput.fromJson(response);
  }

  /// Returns a list of tags associated with the specified signaling channel.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the signaling channel for which you want
  /// to list tags.
  ///
  /// Parameter [nextToken] :
  /// If you specify this parameter and the result of a
  /// <code>ListTagsForResource</code> call is truncated, the response includes
  /// a token that you can use in the next request to fetch the next batch of
  /// tags.
  Future<ListTagsForResourceOutput> listTagsForResource({
    @_s.required String resourceARN,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/=]*''',
    );
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Returns a list of tags associated with the specified stream.
  ///
  /// In the request, you must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidResourceFormatException].
  ///
  /// Parameter [nextToken] :
  /// If you specify this parameter and the result of a
  /// <code>ListTagsForStream</code> call is truncated, the response includes a
  /// token that you can use in the next request to fetch the next batch of
  /// tags.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream that you want to list tags
  /// for.
  ///
  /// Parameter [streamName] :
  /// The name of the stream that you want to list tags for.
  Future<ListTagsForStreamOutput> listTagsForStream({
    String nextToken,
    String streamARN,
    String streamName,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      512,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/=]*''',
    );
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      if (nextToken != null) 'NextToken': nextToken,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listTagsForStream',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForStreamOutput.fromJson(response);
  }

  /// Adds one or more tags to a signaling channel. A <i>tag</i> is a key-value
  /// pair (the value is optional) that you can define and assign to AWS
  /// resources. If you specify a tag that already exists, the tag value is
  /// replaced with the value that you specify in the request. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TagsPerResourceExceededLimitException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the signaling channel to which you want
  /// to add tags.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the specified signaling channel. Each tag
  /// is a key-value pair.
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TagResource',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceOutput.fromJson(response);
  }

  /// Adds one or more tags to a stream. A <i>tag</i> is a key-value pair (the
  /// value is optional) that you can define and assign to AWS resources. If you
  /// specify a tag that already exists, the tag value is replaced with the
  /// value that you specify in the request. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  ///
  /// You must provide either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  ///
  /// This operation requires permission for the
  /// <code>KinesisVideo:TagStream</code> action.
  ///
  /// Kinesis video streams support up to 50 tags.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidResourceFormatException].
  /// May throw [TagsPerResourceExceededLimitException].
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the specified stream. Each tag is a
  /// key-value pair (the value is optional).
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the resource that you want to add the
  /// tag or tags to.
  ///
  /// Parameter [streamName] :
  /// The name of the stream that you want to add the tag or tags to.
  Future<void> tagStream({
    @_s.required Map<String, String> tags,
    String streamARN,
    String streamName,
  }) async {
    ArgumentError.checkNotNull(tags, 'tags');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      'Tags': tags,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tagStream',
      exceptionFnMap: _exceptionFns,
    );
    return TagStreamOutput.fromJson(response);
  }

  /// Removes one or more tags from a signaling channel. In the request, specify
  /// only a tag key or keys; don't specify the value. If you specify a tag key
  /// that does not exist, it's ignored.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the signaling channel from which you
  /// want to remove tags.
  ///
  /// Parameter [tagKeyList] :
  /// A list of the keys of the tags that you want to remove.
  Future<void> untagResource({
    @_s.required String resourceARN,
    @_s.required List<String> tagKeyList,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeyList, 'tagKeyList');
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'TagKeyList': tagKeyList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UntagResource',
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceOutput.fromJson(response);
  }

  /// Removes one or more tags from a stream. In the request, specify only a tag
  /// key or keys; don't specify the value. If you specify a tag key that does
  /// not exist, it's ignored.
  ///
  /// In the request, you must provide the <code>StreamName</code> or
  /// <code>StreamARN</code>.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [NotAuthorizedException].
  /// May throw [InvalidResourceFormatException].
  ///
  /// Parameter [tagKeyList] :
  /// A list of the keys of the tags that you want to remove.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream that you want to remove tags
  /// from.
  ///
  /// Parameter [streamName] :
  /// The name of the stream that you want to remove tags from.
  Future<void> untagStream({
    @_s.required List<String> tagKeyList,
    String streamARN,
    String streamName,
  }) async {
    ArgumentError.checkNotNull(tagKeyList, 'tagKeyList');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      'TagKeyList': tagKeyList,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untagStream',
      exceptionFnMap: _exceptionFns,
    );
    return UntagStreamOutput.fromJson(response);
  }

  /// Increases or decreases the stream's data retention period by the value
  /// that you specify. To indicate whether you want to increase or decrease the
  /// data retention period, specify the <code>Operation</code> parameter in the
  /// request body. In the request, you must specify either the
  /// <code>StreamName</code> or the <code>StreamARN</code>.
  /// <note>
  /// The retention period that you specify replaces the current value.
  /// </note>
  /// This operation requires permission for the
  /// <code>KinesisVideo:UpdateDataRetention</code> action.
  ///
  /// Changing the data retention period affects the data in the stream as
  /// follows:
  ///
  /// <ul>
  /// <li>
  /// If the data retention period is increased, existing data is retained for
  /// the new retention period. For example, if the data retention period is
  /// increased from one hour to seven hours, all existing data is retained for
  /// seven hours.
  /// </li>
  /// <li>
  /// If the data retention period is decreased, existing data is retained for
  /// the new retention period. For example, if the data retention period is
  /// decreased from seven hours to one hour, all existing data is retained for
  /// one hour, and any data older than one hour is deleted immediately.
  /// </li>
  /// </ul>
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [NotAuthorizedException].
  /// May throw [VersionMismatchException].
  ///
  /// Parameter [currentVersion] :
  /// The version of the stream whose retention period you want to change. To
  /// get the version, call either the <code>DescribeStream</code> or the
  /// <code>ListStreams</code> API.
  ///
  /// Parameter [dataRetentionChangeInHours] :
  /// The retention period, in hours. The value you specify replaces the current
  /// value. The maximum value for this parameter is 87600 (ten years).
  ///
  /// Parameter [operation] :
  /// Indicates whether you want to increase or decrease the retention period.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream whose retention period you
  /// want to change.
  ///
  /// Parameter [streamName] :
  /// The name of the stream whose retention period you want to change.
  Future<void> updateDataRetention({
    @_s.required String currentVersion,
    @_s.required int dataRetentionChangeInHours,
    @_s.required UpdateDataRetentionOperation operation,
    String streamARN,
    String streamName,
  }) async {
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    _s.validateStringLength(
      'currentVersion',
      currentVersion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'currentVersion',
      currentVersion,
      r'''[a-zA-Z0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        dataRetentionChangeInHours, 'dataRetentionChangeInHours');
    _s.validateNumRange(
      'dataRetentionChangeInHours',
      dataRetentionChangeInHours,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(operation, 'operation');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      'CurrentVersion': currentVersion,
      'DataRetentionChangeInHours': dataRetentionChangeInHours,
      'Operation': operation?.toValue() ?? '',
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateDataRetention',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataRetentionOutput.fromJson(response);
  }

  /// Updates the existing signaling channel. This is an asynchronous operation
  /// and takes time to complete.
  ///
  /// If the <code>MessageTtlSeconds</code> value is updated (either increased
  /// or reduced), it only applies to new messages sent via this channel after
  /// it's been updated. Existing messages are still expired as per the previous
  /// <code>MessageTtlSeconds</code> value.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [AccessDeniedException].
  /// May throw [VersionMismatchException].
  ///
  /// Parameter [channelARN] :
  /// The Amazon Resource Name (ARN) of the signaling channel that you want to
  /// update.
  ///
  /// Parameter [currentVersion] :
  /// The current version of the signaling channel that you want to update.
  ///
  /// Parameter [singleMasterConfiguration] :
  /// The structure containing the configuration for the
  /// <code>SINGLE_MASTER</code> type of the signaling channel that you want to
  /// update.
  Future<void> updateSignalingChannel({
    @_s.required String channelARN,
    @_s.required String currentVersion,
    SingleMasterConfiguration singleMasterConfiguration,
  }) async {
    ArgumentError.checkNotNull(channelARN, 'channelARN');
    _s.validateStringLength(
      'channelARN',
      channelARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelARN',
      channelARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    _s.validateStringLength(
      'currentVersion',
      currentVersion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'currentVersion',
      currentVersion,
      r'''[a-zA-Z0-9]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ChannelARN': channelARN,
      'CurrentVersion': currentVersion,
      if (singleMasterConfiguration != null)
        'SingleMasterConfiguration': singleMasterConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateSignalingChannel',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSignalingChannelOutput.fromJson(response);
  }

  /// Updates stream metadata, such as the device name and media type.
  ///
  /// You must provide the stream name or the Amazon Resource Name (ARN) of the
  /// stream.
  ///
  /// To make sure that you have the latest version of the stream before
  /// updating it, you can specify the stream version. Kinesis Video Streams
  /// assigns a version to each stream. When you update a stream, Kinesis Video
  /// Streams assigns a new version number. To get the latest stream version,
  /// use the <code>DescribeStream</code> API.
  ///
  /// <code>UpdateStream</code> is an asynchronous operation, and takes time to
  /// complete.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [NotAuthorizedException].
  /// May throw [VersionMismatchException].
  ///
  /// Parameter [currentVersion] :
  /// The version of the stream whose metadata you want to update.
  ///
  /// Parameter [deviceName] :
  /// The name of the device that is writing to the stream.
  /// <note>
  /// In the current implementation, Kinesis Video Streams does not use this
  /// name.
  /// </note>
  ///
  /// Parameter [mediaType] :
  /// The stream's media type. Use <code>MediaType</code> to specify the type of
  /// content that the stream contains to the consumers of the stream. For more
  /// information about media types, see <a
  /// href="http://www.iana.org/assignments/media-types/media-types.xhtml">Media
  /// Types</a>. If you choose to specify the <code>MediaType</code>, see <a
  /// href="https://tools.ietf.org/html/rfc6838#section-4.2">Naming
  /// Requirements</a>.
  ///
  /// To play video on the console, you must specify the correct video type. For
  /// example, if the video in the stream is H.264, specify
  /// <code>video/h264</code> as the <code>MediaType</code>.
  ///
  /// Parameter [streamARN] :
  /// The ARN of the stream whose metadata you want to update.
  ///
  /// Parameter [streamName] :
  /// The name of the stream whose metadata you want to update.
  ///
  /// The stream name is an identifier for the stream, and must be unique for
  /// each account and region.
  Future<void> updateStream({
    @_s.required String currentVersion,
    String deviceName,
    String mediaType,
    String streamARN,
    String streamName,
  }) async {
    ArgumentError.checkNotNull(currentVersion, 'currentVersion');
    _s.validateStringLength(
      'currentVersion',
      currentVersion,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'currentVersion',
      currentVersion,
      r'''[a-zA-Z0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'deviceName',
      deviceName,
      1,
      128,
    );
    _s.validateStringPattern(
      'deviceName',
      deviceName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateStringLength(
      'mediaType',
      mediaType,
      1,
      128,
    );
    _s.validateStringPattern(
      'mediaType',
      mediaType,
      r'''[\w\-\.\+]+/[\w\-\.\+]+(,[\w\-\.\+]+/[\w\-\.\+]+)*''',
    );
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      'CurrentVersion': currentVersion,
      if (deviceName != null) 'DeviceName': deviceName,
      if (mediaType != null) 'MediaType': mediaType,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateStream',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStreamOutput.fromJson(response);
  }
}

enum APIName {
  @_s.JsonValue('PUT_MEDIA')
  putMedia,
  @_s.JsonValue('GET_MEDIA')
  getMedia,
  @_s.JsonValue('LIST_FRAGMENTS')
  listFragments,
  @_s.JsonValue('GET_MEDIA_FOR_FRAGMENT_LIST')
  getMediaForFragmentList,
  @_s.JsonValue('GET_HLS_STREAMING_SESSION_URL')
  getHlsStreamingSessionUrl,
  @_s.JsonValue('GET_DASH_STREAMING_SESSION_URL')
  getDashStreamingSessionUrl,
  @_s.JsonValue('GET_CLIP')
  getClip,
}

extension on APIName {
  String toValue() {
    switch (this) {
      case APIName.putMedia:
        return 'PUT_MEDIA';
      case APIName.getMedia:
        return 'GET_MEDIA';
      case APIName.listFragments:
        return 'LIST_FRAGMENTS';
      case APIName.getMediaForFragmentList:
        return 'GET_MEDIA_FOR_FRAGMENT_LIST';
      case APIName.getHlsStreamingSessionUrl:
        return 'GET_HLS_STREAMING_SESSION_URL';
      case APIName.getDashStreamingSessionUrl:
        return 'GET_DASH_STREAMING_SESSION_URL';
      case APIName.getClip:
        return 'GET_CLIP';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A structure that encapsulates a signaling channel's metadata and properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelInfo {
  /// The Amazon Resource Name (ARN) of the signaling channel.
  @_s.JsonKey(name: 'ChannelARN')
  final String channelARN;

  /// The name of the signaling channel.
  @_s.JsonKey(name: 'ChannelName')
  final String channelName;

  /// Current status of the signaling channel.
  @_s.JsonKey(name: 'ChannelStatus')
  final Status channelStatus;

  /// The type of the signaling channel.
  @_s.JsonKey(name: 'ChannelType')
  final ChannelType channelType;

  /// The time at which the signaling channel was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// A structure that contains the configuration for the
  /// <code>SINGLE_MASTER</code> channel type.
  @_s.JsonKey(name: 'SingleMasterConfiguration')
  final SingleMasterConfiguration singleMasterConfiguration;

  /// The current version of the signaling channel.
  @_s.JsonKey(name: 'Version')
  final String version;

  ChannelInfo({
    this.channelARN,
    this.channelName,
    this.channelStatus,
    this.channelType,
    this.creationTime,
    this.singleMasterConfiguration,
    this.version,
  });
  factory ChannelInfo.fromJson(Map<String, dynamic> json) =>
      _$ChannelInfoFromJson(json);
}

/// An optional input parameter for the <code>ListSignalingChannels</code> API.
/// When this parameter is specified while invoking
/// <code>ListSignalingChannels</code>, the API returns only the channels that
/// satisfy a condition specified in <code>ChannelNameCondition</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ChannelNameCondition {
  /// A comparison operator. Currently, you can only specify the
  /// <code>BEGINS_WITH</code> operator, which finds signaling channels whose
  /// names begin with a given prefix.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// A value to compare.
  @_s.JsonKey(name: 'ComparisonValue')
  final String comparisonValue;

  ChannelNameCondition({
    this.comparisonOperator,
    this.comparisonValue,
  });
  Map<String, dynamic> toJson() => _$ChannelNameConditionToJson(this);
}

enum ChannelProtocol {
  @_s.JsonValue('WSS')
  wss,
  @_s.JsonValue('HTTPS')
  https,
}

enum ChannelRole {
  @_s.JsonValue('MASTER')
  master,
  @_s.JsonValue('VIEWER')
  viewer,
}

enum ChannelType {
  @_s.JsonValue('SINGLE_MASTER')
  singleMaster,
}

extension on ChannelType {
  String toValue() {
    switch (this) {
      case ChannelType.singleMaster:
        return 'SINGLE_MASTER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ComparisonOperator {
  @_s.JsonValue('BEGINS_WITH')
  beginsWith,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSignalingChannelOutput {
  /// The Amazon Resource Name (ARN) of the created channel.
  @_s.JsonKey(name: 'ChannelARN')
  final String channelARN;

  CreateSignalingChannelOutput({
    this.channelARN,
  });
  factory CreateSignalingChannelOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateSignalingChannelOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStreamOutput {
  /// The Amazon Resource Name (ARN) of the stream.
  @_s.JsonKey(name: 'StreamARN')
  final String streamARN;

  CreateStreamOutput({
    this.streamARN,
  });
  factory CreateStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateStreamOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSignalingChannelOutput {
  DeleteSignalingChannelOutput();
  factory DeleteSignalingChannelOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteSignalingChannelOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteStreamOutput {
  DeleteStreamOutput();
  factory DeleteStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteStreamOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSignalingChannelOutput {
  /// A structure that encapsulates the specified signaling channel's metadata and
  /// properties.
  @_s.JsonKey(name: 'ChannelInfo')
  final ChannelInfo channelInfo;

  DescribeSignalingChannelOutput({
    this.channelInfo,
  });
  factory DescribeSignalingChannelOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeSignalingChannelOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeStreamOutput {
  /// An object that describes the stream.
  @_s.JsonKey(name: 'StreamInfo')
  final StreamInfo streamInfo;

  DescribeStreamOutput({
    this.streamInfo,
  });
  factory DescribeStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeStreamOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDataEndpointOutput {
  /// The endpoint value. To read data from the stream or to write data to it,
  /// specify this endpoint in your application.
  @_s.JsonKey(name: 'DataEndpoint')
  final String dataEndpoint;

  GetDataEndpointOutput({
    this.dataEndpoint,
  });
  factory GetDataEndpointOutput.fromJson(Map<String, dynamic> json) =>
      _$GetDataEndpointOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSignalingChannelEndpointOutput {
  /// A list of endpoints for the specified signaling channel.
  @_s.JsonKey(name: 'ResourceEndpointList')
  final List<ResourceEndpointListItem> resourceEndpointList;

  GetSignalingChannelEndpointOutput({
    this.resourceEndpointList,
  });
  factory GetSignalingChannelEndpointOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetSignalingChannelEndpointOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSignalingChannelsOutput {
  /// An array of <code>ChannelInfo</code> objects.
  @_s.JsonKey(name: 'ChannelInfoList')
  final List<ChannelInfo> channelInfoList;

  /// If the response is truncated, the call returns this element with a token. To
  /// get the next batch of streams, use this token in your next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListSignalingChannelsOutput({
    this.channelInfoList,
    this.nextToken,
  });
  factory ListSignalingChannelsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListSignalingChannelsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStreamsOutput {
  /// If the response is truncated, the call returns this element with a token. To
  /// get the next batch of streams, use this token in your next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>StreamInfo</code> objects.
  @_s.JsonKey(name: 'StreamInfoList')
  final List<StreamInfo> streamInfoList;

  ListStreamsOutput({
    this.nextToken,
    this.streamInfoList,
  });
  factory ListStreamsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListStreamsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceOutput {
  /// If you specify this parameter and the result of a
  /// <code>ListTagsForResource</code> call is truncated, the response includes a
  /// token that you can use in the next request to fetch the next set of tags.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A map of tag keys and values associated with the specified signaling
  /// channel.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForStreamOutput {
  /// If you specify this parameter and the result of a <code>ListTags</code> call
  /// is truncated, the response includes a token that you can use in the next
  /// request to fetch the next set of tags.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A map of tag keys and values associated with the specified stream.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsForStreamOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForStreamOutputFromJson(json);
}

/// An object that describes the endpoint of the signaling channel returned by
/// the <code>GetSignalingChannelEndpoint</code> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceEndpointListItem {
  /// The protocol of the signaling channel returned by the
  /// <code>GetSignalingChannelEndpoint</code> API.
  @_s.JsonKey(name: 'Protocol')
  final ChannelProtocol protocol;

  /// The endpoint of the signaling channel returned by the
  /// <code>GetSignalingChannelEndpoint</code> API.
  @_s.JsonKey(name: 'ResourceEndpoint')
  final String resourceEndpoint;

  ResourceEndpointListItem({
    this.protocol,
    this.resourceEndpoint,
  });
  factory ResourceEndpointListItem.fromJson(Map<String, dynamic> json) =>
      _$ResourceEndpointListItemFromJson(json);
}

/// An object that contains the endpoint configuration for the
/// <code>SINGLE_MASTER</code> channel type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SingleMasterChannelEndpointConfiguration {
  /// This property is used to determine the nature of communication over this
  /// <code>SINGLE_MASTER</code> signaling channel. If <code>WSS</code> is
  /// specified, this API returns a websocket endpoint. If <code>HTTPS</code> is
  /// specified, this API returns an <code>HTTPS</code> endpoint.
  @_s.JsonKey(name: 'Protocols')
  final List<ChannelProtocol> protocols;

  /// This property is used to determine messaging permissions in this
  /// <code>SINGLE_MASTER</code> signaling channel. If <code>MASTER</code> is
  /// specified, this API returns an endpoint that a client can use to receive
  /// offers from and send answers to any of the viewers on this signaling
  /// channel. If <code>VIEWER</code> is specified, this API returns an endpoint
  /// that a client can use only to send offers to another <code>MASTER</code>
  /// client on this signaling channel.
  @_s.JsonKey(name: 'Role')
  final ChannelRole role;

  SingleMasterChannelEndpointConfiguration({
    this.protocols,
    this.role,
  });
  Map<String, dynamic> toJson() =>
      _$SingleMasterChannelEndpointConfigurationToJson(this);
}

/// A structure that contains the configuration for the
/// <code>SINGLE_MASTER</code> channel type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SingleMasterConfiguration {
  /// The period of time a signaling channel retains underlivered messages before
  /// they are discarded.
  @_s.JsonKey(name: 'MessageTtlSeconds')
  final int messageTtlSeconds;

  SingleMasterConfiguration({
    this.messageTtlSeconds,
  });
  factory SingleMasterConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SingleMasterConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SingleMasterConfigurationToJson(this);
}

enum Status {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
}

/// An object describing a Kinesis video stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamInfo {
  /// A time stamp that indicates when the stream was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// How long the stream retains data, in hours.
  @_s.JsonKey(name: 'DataRetentionInHours')
  final int dataRetentionInHours;

  /// The name of the device that is associated with the stream.
  @_s.JsonKey(name: 'DeviceName')
  final String deviceName;

  /// The ID of the AWS Key Management Service (AWS KMS) key that Kinesis Video
  /// Streams uses to encrypt data on the stream.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// The <code>MediaType</code> of the stream.
  @_s.JsonKey(name: 'MediaType')
  final String mediaType;

  /// The status of the stream.
  @_s.JsonKey(name: 'Status')
  final Status status;

  /// The Amazon Resource Name (ARN) of the stream.
  @_s.JsonKey(name: 'StreamARN')
  final String streamARN;

  /// The name of the stream.
  @_s.JsonKey(name: 'StreamName')
  final String streamName;

  /// The version of the stream.
  @_s.JsonKey(name: 'Version')
  final String version;

  StreamInfo({
    this.creationTime,
    this.dataRetentionInHours,
    this.deviceName,
    this.kmsKeyId,
    this.mediaType,
    this.status,
    this.streamARN,
    this.streamName,
    this.version,
  });
  factory StreamInfo.fromJson(Map<String, dynamic> json) =>
      _$StreamInfoFromJson(json);
}

/// Specifies the condition that streams must satisfy to be returned when you
/// list streams (see the <code>ListStreams</code> API). A condition has a
/// comparison operation and a value. Currently, you can specify only the
/// <code>BEGINS_WITH</code> operator, which finds streams whose names start
/// with a given prefix.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StreamNameCondition {
  /// A comparison operator. Currently, you can specify only the
  /// <code>BEGINS_WITH</code> operator, which finds streams whose names start
  /// with a given prefix.
  @_s.JsonKey(name: 'ComparisonOperator')
  final ComparisonOperator comparisonOperator;

  /// A value to compare.
  @_s.JsonKey(name: 'ComparisonValue')
  final String comparisonValue;

  StreamNameCondition({
    this.comparisonOperator,
    this.comparisonValue,
  });
  Map<String, dynamic> toJson() => _$StreamNameConditionToJson(this);
}

/// A key and value pair that is associated with the specified signaling
/// channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Tag {
  /// The key of the tag that is associated with the specified signaling channel.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag that is associated with the specified signaling
  /// channel.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceOutput {
  TagResourceOutput();
  factory TagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$TagResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagStreamOutput {
  TagStreamOutput();
  factory TagStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$TagStreamOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceOutput {
  UntagResourceOutput();
  factory UntagResourceOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagStreamOutput {
  UntagStreamOutput();
  factory UntagStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$UntagStreamOutputFromJson(json);
}

enum UpdateDataRetentionOperation {
  @_s.JsonValue('INCREASE_DATA_RETENTION')
  increaseDataRetention,
  @_s.JsonValue('DECREASE_DATA_RETENTION')
  decreaseDataRetention,
}

extension on UpdateDataRetentionOperation {
  String toValue() {
    switch (this) {
      case UpdateDataRetentionOperation.increaseDataRetention:
        return 'INCREASE_DATA_RETENTION';
      case UpdateDataRetentionOperation.decreaseDataRetention:
        return 'DECREASE_DATA_RETENTION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDataRetentionOutput {
  UpdateDataRetentionOutput();
  factory UpdateDataRetentionOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataRetentionOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSignalingChannelOutput {
  UpdateSignalingChannelOutput();
  factory UpdateSignalingChannelOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateSignalingChannelOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateStreamOutput {
  UpdateStreamOutput();
  factory UpdateStreamOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateStreamOutputFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccountChannelLimitExceededException extends _s.GenericAwsException {
  AccountChannelLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'AccountChannelLimitExceededException',
            message: message);
}

class AccountStreamLimitExceededException extends _s.GenericAwsException {
  AccountStreamLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'AccountStreamLimitExceededException',
            message: message);
}

class ClientLimitExceededException extends _s.GenericAwsException {
  ClientLimitExceededException({String type, String message})
      : super(
            type: type, code: 'ClientLimitExceededException', message: message);
}

class DeviceStreamLimitExceededException extends _s.GenericAwsException {
  DeviceStreamLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'DeviceStreamLimitExceededException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String type, String message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidDeviceException extends _s.GenericAwsException {
  InvalidDeviceException({String type, String message})
      : super(type: type, code: 'InvalidDeviceException', message: message);
}

class InvalidResourceFormatException extends _s.GenericAwsException {
  InvalidResourceFormatException({String type, String message})
      : super(
            type: type,
            code: 'InvalidResourceFormatException',
            message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String type, String message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TagsPerResourceExceededLimitException extends _s.GenericAwsException {
  TagsPerResourceExceededLimitException({String type, String message})
      : super(
            type: type,
            code: 'TagsPerResourceExceededLimitException',
            message: message);
}

class VersionMismatchException extends _s.GenericAwsException {
  VersionMismatchException({String type, String message})
      : super(type: type, code: 'VersionMismatchException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AccountChannelLimitExceededException': (type, message) =>
      AccountChannelLimitExceededException(type: type, message: message),
  'AccountStreamLimitExceededException': (type, message) =>
      AccountStreamLimitExceededException(type: type, message: message),
  'ClientLimitExceededException': (type, message) =>
      ClientLimitExceededException(type: type, message: message),
  'DeviceStreamLimitExceededException': (type, message) =>
      DeviceStreamLimitExceededException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidDeviceException': (type, message) =>
      InvalidDeviceException(type: type, message: message),
  'InvalidResourceFormatException': (type, message) =>
      InvalidResourceFormatException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TagsPerResourceExceededLimitException': (type, message) =>
      TagsPerResourceExceededLimitException(type: type, message: message),
  'VersionMismatchException': (type, message) =>
      VersionMismatchException(type: type, message: message),
};
