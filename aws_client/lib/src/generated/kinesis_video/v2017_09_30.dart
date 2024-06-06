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

/// <p/>
class KinesisVideo {
  final _s.RestJsonProtocol _protocol;
  KinesisVideo({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisvideo',
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
  /// for each Amazon Web Services account and Amazon Web Services Region.
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
    required String channelName,
    ChannelType? channelType,
    SingleMasterConfiguration? singleMasterConfiguration,
    List<Tag>? tags,
  }) async {
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
  /// The ID of the Key Management Service (KMS) key that you want Kinesis Video
  /// Streams to use to encrypt stream data.
  ///
  /// If no key ID is specified, the default, Kinesis Video-managed key
  /// (<code>Amazon Web Services/kinesisvideo</code>) is used.
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
    required String streamName,
    int? dataRetentionInHours,
    String? deviceName,
    String? kmsKeyId,
    String? mediaType,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'dataRetentionInHours',
      dataRetentionInHours,
      0,
      1152921504606846976,
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

  /// An asynchronous API that deletes a stream’s existing edge configuration,
  /// as well as the corresponding media from the Edge Agent.
  ///
  /// When you invoke this API, the sync status is set to <code>DELETING</code>.
  /// A deletion process starts, in which active edge jobs are stopped and all
  /// media is deleted from the edge device. The time to delete varies,
  /// depending on the total amount of stored media. If the deletion process
  /// fails, the sync status changes to <code>DELETE_FAILED</code>. You will
  /// need to re-try the deletion.
  ///
  /// When the deletion process has completed successfully, the edge
  /// configuration is no longer accessible.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [StreamEdgeConfigurationNotFoundException].
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream. Specify either the
  /// <code>StreamName</code> or the <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to delete the edge configuration.
  /// Specify either the <code>StreamName</code> or the <code>StreamARN</code>.
  Future<void> deleteEdgeConfiguration({
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteEdgeConfiguration',
      exceptionFnMap: _exceptionFns,
    );
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
    required String channelARN,
    String? currentVersion,
  }) async {
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
    required String streamARN,
    String? currentVersion,
  }) async {
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
  }

  /// Describes a stream’s edge configuration that was set using the
  /// <code>StartEdgeConfigurationUpdate</code> API and the latest status of the
  /// edge agent's recorder and uploader jobs. Use this API to get the status of
  /// the configuration to determine if the configuration is in sync with the
  /// Edge Agent. Use this API to evaluate the health of the Edge Agent.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [ResourceNotFoundException].
  /// May throw [StreamEdgeConfigurationNotFoundException].
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream. Specify either the
  /// <code>StreamName</code>or the <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream whose edge configuration you want to update.
  /// Specify either the <code>StreamName</code> or the <code>StreamARN</code>.
  Future<DescribeEdgeConfigurationOutput> describeEdgeConfiguration({
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeEdgeConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeEdgeConfigurationOutput.fromJson(response);
  }

  /// Gets the <code>ImageGenerationConfiguration</code> for a given Kinesis
  /// video stream.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the Kinesis video stream from which to
  /// retrieve the image generation configuration. You must specify either the
  /// <code>StreamName</code> or the <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to retrieve the image generation
  /// configuration. You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  Future<DescribeImageGenerationConfigurationOutput>
      describeImageGenerationConfiguration({
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeImageGenerationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeImageGenerationConfigurationOutput.fromJson(response);
  }

  /// Returns the most current information about the stream. The
  /// <code>streamName</code> or <code>streamARN</code> should be provided in
  /// the input.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientLimitExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The token to provide in your next request, to get another batch of
  /// results.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream.
  ///
  /// Parameter [streamName] :
  /// The name of the stream.
  Future<DescribeMappedResourceConfigurationOutput>
      describeMappedResourceConfiguration({
    int? maxResults,
    String? nextToken,
    String? streamARN,
    String? streamName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeMappedResourceConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMappedResourceConfigurationOutput.fromJson(response);
  }

  /// Returns the most current information about the channel. Specify the
  /// <code>ChannelName</code> or <code>ChannelARN</code> in the input.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ClientLimitExceededException].
  ///
  /// Parameter [channelARN] :
  /// The Amazon Resource Name (ARN) of the channel.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  Future<DescribeMediaStorageConfigurationOutput>
      describeMediaStorageConfiguration({
    String? channelARN,
    String? channelName,
  }) async {
    final $payload = <String, dynamic>{
      if (channelARN != null) 'ChannelARN': channelARN,
      if (channelName != null) 'ChannelName': channelName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeMediaStorageConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMediaStorageConfigurationOutput.fromJson(response);
  }

  /// Gets the <code>NotificationConfiguration</code> for a given Kinesis video
  /// stream.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the Kinesis video stream from where you
  /// want to retrieve the notification configuration. You must specify either
  /// the <code>StreamName</code> or the StreamARN.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to retrieve the notification
  /// configuration. You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  Future<DescribeNotificationConfigurationOutput>
      describeNotificationConfiguration({
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeNotificationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeNotificationConfigurationOutput.fromJson(response);
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
    String? channelARN,
    String? channelName,
  }) async {
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
    String? streamARN,
    String? streamName,
  }) async {
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
    required APIName aPIName,
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      'APIName': aPIName.toValue(),
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
    required String channelARN,
    SingleMasterChannelEndpointConfiguration?
        singleMasterChannelEndpointConfiguration,
  }) async {
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

  /// Returns an array of edge configurations associated with the specified Edge
  /// Agent.
  ///
  /// In the request, you must specify the Edge Agent <code>HubDeviceArn</code>.
  ///
  /// May throw [NotAuthorizedException].
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  ///
  /// Parameter [hubDeviceArn] :
  /// The "Internet of Things (IoT) Thing" Arn of the edge agent.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of edge configurations to return in the response. The
  /// default is 5.
  ///
  /// Parameter [nextToken] :
  /// If you specify this parameter, when the result of a
  /// <code>ListEdgeAgentConfigurations</code> operation is truncated, the call
  /// returns the <code>NextToken</code> in the response. To get another batch
  /// of edge configurations, provide this token in your next request.
  Future<ListEdgeAgentConfigurationsOutput> listEdgeAgentConfigurations({
    required String hubDeviceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final $payload = <String, dynamic>{
      'HubDeviceArn': hubDeviceArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listEdgeAgentConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListEdgeAgentConfigurationsOutput.fromJson(response);
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
    ChannelNameCondition? channelNameCondition,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
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
    int? maxResults,
    String? nextToken,
    StreamNameCondition? streamNameCondition,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10000,
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
    required String resourceARN,
    String? nextToken,
  }) async {
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
    String? nextToken,
    String? streamARN,
    String? streamName,
  }) async {
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

  /// An asynchronous API that updates a stream’s existing edge configuration.
  /// The Kinesis Video Stream will sync the stream’s edge configuration with
  /// the Edge Agent IoT Greengrass component that runs on an IoT Hub Device,
  /// setup at your premise. The time to sync can vary and depends on the
  /// connectivity of the Hub Device. The <code>SyncStatus</code> will be
  /// updated as the edge configuration is acknowledged, and synced with the
  /// Edge Agent.
  ///
  /// If this API is invoked for the first time, a new edge configuration will
  /// be created for the stream, and the sync status will be set to
  /// <code>SYNCING</code>. You will have to wait for the sync status to reach a
  /// terminal state such as: <code>IN_SYNC</code>, or <code>SYNC_FAILED</code>,
  /// before using this API again. If you invoke this API during the syncing
  /// process, a <code>ResourceInUseException</code> will be thrown. The
  /// connectivity of the stream’s edge configuration and the Edge Agent will be
  /// retried for 15 minutes. After 15 minutes, the status will transition into
  /// the <code>SYNC_FAILED</code> state.
  ///
  /// To move an edge configuration from one device to another, use
  /// <a>DeleteEdgeConfiguration</a> to delete the current edge configuration.
  /// You can then invoke StartEdgeConfigurationUpdate with an updated Hub
  /// Device ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [NoDataRetentionException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [edgeConfig] :
  /// The edge configuration details required to invoke the update process.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream. Specify either the
  /// <code>StreamName</code> or the <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream whose edge configuration you want to update.
  /// Specify either the <code>StreamName</code> or the <code>StreamARN</code>.
  Future<StartEdgeConfigurationUpdateOutput> startEdgeConfigurationUpdate({
    required EdgeConfig edgeConfig,
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      'EdgeConfig': edgeConfig,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/startEdgeConfigurationUpdate',
      exceptionFnMap: _exceptionFns,
    );
    return StartEdgeConfigurationUpdateOutput.fromJson(response);
  }

  /// Adds one or more tags to a signaling channel. A <i>tag</i> is a key-value
  /// pair (the value is optional) that you can define and assign to Amazon Web
  /// Services resources. If you specify a tag that already exists, the tag
  /// value is replaced with the value that you specify in the request. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Billing and Cost Management and Cost
  /// Management User Guide</i>.
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
    required String resourceARN,
    required List<Tag> tags,
  }) async {
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
  }

  /// Adds one or more tags to a stream. A <i>tag</i> is a key-value pair (the
  /// value is optional) that you can define and assign to Amazon Web Services
  /// resources. If you specify a tag that already exists, the tag value is
  /// replaced with the value that you specify in the request. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html">Using
  /// Cost Allocation Tags</a> in the <i>Billing and Cost Management and Cost
  /// Management User Guide</i>.
  ///
  /// You must provide either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  ///
  /// This operation requires permission for the
  /// <code>KinesisVideo:TagStream</code> action.
  ///
  /// A Kinesis video stream can support up to 50 tags.
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
    required Map<String, String> tags,
    String? streamARN,
    String? streamName,
  }) async {
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
    required String resourceARN,
    required List<String> tagKeyList,
  }) async {
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
    required List<String> tagKeyList,
    String? streamARN,
    String? streamName,
  }) async {
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
  }

  /// Increases or decreases the stream's data retention period by the value
  /// that you specify. To indicate whether you want to increase or decrease the
  /// data retention period, specify the <code>Operation</code> parameter in the
  /// request body. In the request, you must specify either the
  /// <code>StreamName</code> or the <code>StreamARN</code>.
  ///
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
  /// The number of hours to adjust the current retention by. The value you
  /// specify is added to or subtracted from the current value, depending on the
  /// <code>operation</code>.
  ///
  /// The minimum value for data retention is 0 and the maximum value is 87600
  /// (ten years).
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
    required String currentVersion,
    required int dataRetentionChangeInHours,
    required UpdateDataRetentionOperation operation,
    String? streamARN,
    String? streamName,
  }) async {
    _s.validateNumRange(
      'dataRetentionChangeInHours',
      dataRetentionChangeInHours,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'CurrentVersion': currentVersion,
      'DataRetentionChangeInHours': dataRetentionChangeInHours,
      'Operation': operation.toValue(),
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateDataRetention',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the <code>StreamInfo</code> and
  /// <code>ImageProcessingConfiguration</code> fields.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  /// May throw [NoDataRetentionException].
  ///
  /// Parameter [imageGenerationConfiguration] :
  /// The structure that contains the information required for the KVS images
  /// delivery. If the structure is null, the configuration will be deleted from
  /// the stream.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the Kinesis video stream from where you
  /// want to update the image generation configuration. You must specify either
  /// the <code>StreamName</code> or the <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to update the image generation
  /// configuration. You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  Future<void> updateImageGenerationConfiguration({
    ImageGenerationConfiguration? imageGenerationConfiguration,
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      if (imageGenerationConfiguration != null)
        'ImageGenerationConfiguration': imageGenerationConfiguration,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateImageGenerationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates a <code>SignalingChannel</code> to a stream to store the media.
  /// There are two signaling modes that you can specify :
  ///
  /// <ul>
  /// <li>
  /// If <code>StorageStatus</code> is enabled, the data will be stored in the
  /// <code>StreamARN</code> provided. In order for WebRTC Ingestion to work,
  /// the stream must have data retention enabled.
  /// </li>
  /// <li>
  /// If <code>StorageStatus</code> is disabled, no data will be stored, and the
  /// <code>StreamARN</code> parameter will not be needed.
  /// </li>
  /// </ul> <important>
  /// If <code>StorageStatus</code> is enabled, direct peer-to-peer
  /// (master-viewer) connections no longer occur. Peers connect directly to the
  /// storage session. You must call the <code>JoinStorageSession</code> API to
  /// trigger an SDP offer send and establish a connection between a peer and
  /// the storage session.
  /// </important>
  ///
  /// May throw [ResourceInUseException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [NoDataRetentionException].
  ///
  /// Parameter [channelARN] :
  /// The Amazon Resource Name (ARN) of the channel.
  ///
  /// Parameter [mediaStorageConfiguration] :
  /// A structure that encapsulates, or contains, the media storage
  /// configuration properties.
  Future<void> updateMediaStorageConfiguration({
    required String channelARN,
    required MediaStorageConfiguration mediaStorageConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'ChannelARN': channelARN,
      'MediaStorageConfiguration': mediaStorageConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateMediaStorageConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the notification information for a stream.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceInUseException].
  /// May throw [NoDataRetentionException].
  ///
  /// Parameter [notificationConfiguration] :
  /// The structure containing the information required for notifications. If
  /// the structure is null, the configuration will be deleted from the stream.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the Kinesis video stream from where you
  /// want to update the notification configuration. You must specify either the
  /// <code>StreamName</code> or the <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to update the notification
  /// configuration. You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  Future<void> updateNotificationConfiguration({
    NotificationConfiguration? notificationConfiguration,
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateNotificationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
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
    required String channelARN,
    required String currentVersion,
    SingleMasterConfiguration? singleMasterConfiguration,
  }) async {
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
    required String currentVersion,
    String? deviceName,
    String? mediaType,
    String? streamARN,
    String? streamName,
  }) async {
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
  }
}

enum APIName {
  putMedia,
  getMedia,
  listFragments,
  getMediaForFragmentList,
  getHlsStreamingSessionUrl,
  getDashStreamingSessionUrl,
  getClip,
  getImages,
}

extension APINameValueExtension on APIName {
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
      case APIName.getImages:
        return 'GET_IMAGES';
    }
  }
}

extension APINameFromString on String {
  APIName toAPIName() {
    switch (this) {
      case 'PUT_MEDIA':
        return APIName.putMedia;
      case 'GET_MEDIA':
        return APIName.getMedia;
      case 'LIST_FRAGMENTS':
        return APIName.listFragments;
      case 'GET_MEDIA_FOR_FRAGMENT_LIST':
        return APIName.getMediaForFragmentList;
      case 'GET_HLS_STREAMING_SESSION_URL':
        return APIName.getHlsStreamingSessionUrl;
      case 'GET_DASH_STREAMING_SESSION_URL':
        return APIName.getDashStreamingSessionUrl;
      case 'GET_CLIP':
        return APIName.getClip;
      case 'GET_IMAGES':
        return APIName.getImages;
    }
    throw Exception('$this is not known in enum APIName');
  }
}

/// A structure that encapsulates a signaling channel's metadata and properties.
class ChannelInfo {
  /// The Amazon Resource Name (ARN) of the signaling channel.
  final String? channelARN;

  /// The name of the signaling channel.
  final String? channelName;

  /// Current status of the signaling channel.
  final Status? channelStatus;

  /// The type of the signaling channel.
  final ChannelType? channelType;

  /// The time at which the signaling channel was created.
  final DateTime? creationTime;

  /// A structure that contains the configuration for the
  /// <code>SINGLE_MASTER</code> channel type.
  final SingleMasterConfiguration? singleMasterConfiguration;

  /// The current version of the signaling channel.
  final String? version;

  ChannelInfo({
    this.channelARN,
    this.channelName,
    this.channelStatus,
    this.channelType,
    this.creationTime,
    this.singleMasterConfiguration,
    this.version,
  });

  factory ChannelInfo.fromJson(Map<String, dynamic> json) {
    return ChannelInfo(
      channelARN: json['ChannelARN'] as String?,
      channelName: json['ChannelName'] as String?,
      channelStatus: (json['ChannelStatus'] as String?)?.toStatus(),
      channelType: (json['ChannelType'] as String?)?.toChannelType(),
      creationTime: timeStampFromJson(json['CreationTime']),
      singleMasterConfiguration: json['SingleMasterConfiguration'] != null
          ? SingleMasterConfiguration.fromJson(
              json['SingleMasterConfiguration'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelARN = this.channelARN;
    final channelName = this.channelName;
    final channelStatus = this.channelStatus;
    final channelType = this.channelType;
    final creationTime = this.creationTime;
    final singleMasterConfiguration = this.singleMasterConfiguration;
    final version = this.version;
    return {
      if (channelARN != null) 'ChannelARN': channelARN,
      if (channelName != null) 'ChannelName': channelName,
      if (channelStatus != null) 'ChannelStatus': channelStatus.toValue(),
      if (channelType != null) 'ChannelType': channelType.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (singleMasterConfiguration != null)
        'SingleMasterConfiguration': singleMasterConfiguration,
      if (version != null) 'Version': version,
    };
  }
}

/// An optional input parameter for the <code>ListSignalingChannels</code> API.
/// When this parameter is specified while invoking
/// <code>ListSignalingChannels</code>, the API returns only the channels that
/// satisfy a condition specified in <code>ChannelNameCondition</code>.
class ChannelNameCondition {
  /// A comparison operator. Currently, you can only specify the
  /// <code>BEGINS_WITH</code> operator, which finds signaling channels whose
  /// names begin with a given prefix.
  final ComparisonOperator? comparisonOperator;

  /// A value to compare.
  final String? comparisonValue;

  ChannelNameCondition({
    this.comparisonOperator,
    this.comparisonValue,
  });

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final comparisonValue = this.comparisonValue;
    return {
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.toValue(),
      if (comparisonValue != null) 'ComparisonValue': comparisonValue,
    };
  }
}

enum ChannelProtocol {
  wss,
  https,
  webrtc,
}

extension ChannelProtocolValueExtension on ChannelProtocol {
  String toValue() {
    switch (this) {
      case ChannelProtocol.wss:
        return 'WSS';
      case ChannelProtocol.https:
        return 'HTTPS';
      case ChannelProtocol.webrtc:
        return 'WEBRTC';
    }
  }
}

extension ChannelProtocolFromString on String {
  ChannelProtocol toChannelProtocol() {
    switch (this) {
      case 'WSS':
        return ChannelProtocol.wss;
      case 'HTTPS':
        return ChannelProtocol.https;
      case 'WEBRTC':
        return ChannelProtocol.webrtc;
    }
    throw Exception('$this is not known in enum ChannelProtocol');
  }
}

enum ChannelRole {
  master,
  viewer,
}

extension ChannelRoleValueExtension on ChannelRole {
  String toValue() {
    switch (this) {
      case ChannelRole.master:
        return 'MASTER';
      case ChannelRole.viewer:
        return 'VIEWER';
    }
  }
}

extension ChannelRoleFromString on String {
  ChannelRole toChannelRole() {
    switch (this) {
      case 'MASTER':
        return ChannelRole.master;
      case 'VIEWER':
        return ChannelRole.viewer;
    }
    throw Exception('$this is not known in enum ChannelRole');
  }
}

enum ChannelType {
  singleMaster,
  fullMesh,
}

extension ChannelTypeValueExtension on ChannelType {
  String toValue() {
    switch (this) {
      case ChannelType.singleMaster:
        return 'SINGLE_MASTER';
      case ChannelType.fullMesh:
        return 'FULL_MESH';
    }
  }
}

extension ChannelTypeFromString on String {
  ChannelType toChannelType() {
    switch (this) {
      case 'SINGLE_MASTER':
        return ChannelType.singleMaster;
      case 'FULL_MESH':
        return ChannelType.fullMesh;
    }
    throw Exception('$this is not known in enum ChannelType');
  }
}

enum ComparisonOperator {
  beginsWith,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.beginsWith:
        return 'BEGINS_WITH';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'BEGINS_WITH':
        return ComparisonOperator.beginsWith;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

enum ConfigurationStatus {
  enabled,
  disabled,
}

extension ConfigurationStatusValueExtension on ConfigurationStatus {
  String toValue() {
    switch (this) {
      case ConfigurationStatus.enabled:
        return 'ENABLED';
      case ConfigurationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ConfigurationStatusFromString on String {
  ConfigurationStatus toConfigurationStatus() {
    switch (this) {
      case 'ENABLED':
        return ConfigurationStatus.enabled;
      case 'DISABLED':
        return ConfigurationStatus.disabled;
    }
    throw Exception('$this is not known in enum ConfigurationStatus');
  }
}

class CreateSignalingChannelOutput {
  /// The Amazon Resource Name (ARN) of the created channel.
  final String? channelARN;

  CreateSignalingChannelOutput({
    this.channelARN,
  });

  factory CreateSignalingChannelOutput.fromJson(Map<String, dynamic> json) {
    return CreateSignalingChannelOutput(
      channelARN: json['ChannelARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelARN = this.channelARN;
    return {
      if (channelARN != null) 'ChannelARN': channelARN,
    };
  }
}

class CreateStreamOutput {
  /// The Amazon Resource Name (ARN) of the stream.
  final String? streamARN;

  CreateStreamOutput({
    this.streamARN,
  });

  factory CreateStreamOutput.fromJson(Map<String, dynamic> json) {
    return CreateStreamOutput(
      streamARN: json['StreamARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamARN = this.streamARN;
    return {
      if (streamARN != null) 'StreamARN': streamARN,
    };
  }
}

class DeleteEdgeConfigurationOutput {
  DeleteEdgeConfigurationOutput();

  factory DeleteEdgeConfigurationOutput.fromJson(Map<String, dynamic> _) {
    return DeleteEdgeConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSignalingChannelOutput {
  DeleteSignalingChannelOutput();

  factory DeleteSignalingChannelOutput.fromJson(Map<String, dynamic> _) {
    return DeleteSignalingChannelOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStreamOutput {
  DeleteStreamOutput();

  factory DeleteStreamOutput.fromJson(Map<String, dynamic> _) {
    return DeleteStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration details required to delete the connection of the stream
/// from the Edge Agent.
class DeletionConfig {
  /// The <code>boolean</code> value used to indicate whether or not you want to
  /// mark the media for deletion, once it has been uploaded to the Kinesis Video
  /// Stream cloud. The media files can be deleted if any of the deletion
  /// configuration values are set to <code>true</code>, such as when the limit
  /// for the <code>EdgeRetentionInHours</code>, or the
  /// <code>MaxLocalMediaSizeInMB</code>, has been reached.
  ///
  /// Since the default value is set to <code>true</code>, configure the uploader
  /// schedule such that the media files are not being deleted before they are
  /// initially uploaded to the Amazon Web Services cloud.
  final bool? deleteAfterUpload;

  /// The number of hours that you want to retain the data in the stream on the
  /// Edge Agent. The default value of the retention time is 720 hours, which
  /// translates to 30 days.
  final int? edgeRetentionInHours;

  /// The value of the local size required in order to delete the edge
  /// configuration.
  final LocalSizeConfig? localSizeConfig;

  DeletionConfig({
    this.deleteAfterUpload,
    this.edgeRetentionInHours,
    this.localSizeConfig,
  });

  factory DeletionConfig.fromJson(Map<String, dynamic> json) {
    return DeletionConfig(
      deleteAfterUpload: json['DeleteAfterUpload'] as bool?,
      edgeRetentionInHours: json['EdgeRetentionInHours'] as int?,
      localSizeConfig: json['LocalSizeConfig'] != null
          ? LocalSizeConfig.fromJson(
              json['LocalSizeConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final deleteAfterUpload = this.deleteAfterUpload;
    final edgeRetentionInHours = this.edgeRetentionInHours;
    final localSizeConfig = this.localSizeConfig;
    return {
      if (deleteAfterUpload != null) 'DeleteAfterUpload': deleteAfterUpload,
      if (edgeRetentionInHours != null)
        'EdgeRetentionInHours': edgeRetentionInHours,
      if (localSizeConfig != null) 'LocalSizeConfig': localSizeConfig,
    };
  }
}

class DescribeEdgeConfigurationOutput {
  /// The timestamp at which a stream’s edge configuration was first created.
  final DateTime? creationTime;

  /// An object that contains the latest status details for an edge agent's
  /// recorder and uploader jobs. Use this information to determine the current
  /// health of an edge agent.
  final EdgeAgentStatus? edgeAgentStatus;

  /// A description of the stream's edge configuration that will be used to sync
  /// with the Edge Agent IoT Greengrass component. The Edge Agent component will
  /// run on an IoT Hub Device setup at your premise.
  final EdgeConfig? edgeConfig;

  /// A description of the generated failure status.
  final String? failedStatusDetails;

  /// The timestamp at which a stream’s edge configuration was last updated.
  final DateTime? lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the stream.
  final String? streamARN;

  /// The name of the stream from which the edge configuration was updated.
  final String? streamName;

  /// The latest status of the edge configuration update.
  final SyncStatus? syncStatus;

  DescribeEdgeConfigurationOutput({
    this.creationTime,
    this.edgeAgentStatus,
    this.edgeConfig,
    this.failedStatusDetails,
    this.lastUpdatedTime,
    this.streamARN,
    this.streamName,
    this.syncStatus,
  });

  factory DescribeEdgeConfigurationOutput.fromJson(Map<String, dynamic> json) {
    return DescribeEdgeConfigurationOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      edgeAgentStatus: json['EdgeAgentStatus'] != null
          ? EdgeAgentStatus.fromJson(
              json['EdgeAgentStatus'] as Map<String, dynamic>)
          : null,
      edgeConfig: json['EdgeConfig'] != null
          ? EdgeConfig.fromJson(json['EdgeConfig'] as Map<String, dynamic>)
          : null,
      failedStatusDetails: json['FailedStatusDetails'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      streamARN: json['StreamARN'] as String?,
      streamName: json['StreamName'] as String?,
      syncStatus: (json['SyncStatus'] as String?)?.toSyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final edgeAgentStatus = this.edgeAgentStatus;
    final edgeConfig = this.edgeConfig;
    final failedStatusDetails = this.failedStatusDetails;
    final lastUpdatedTime = this.lastUpdatedTime;
    final streamARN = this.streamARN;
    final streamName = this.streamName;
    final syncStatus = this.syncStatus;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (edgeAgentStatus != null) 'EdgeAgentStatus': edgeAgentStatus,
      if (edgeConfig != null) 'EdgeConfig': edgeConfig,
      if (failedStatusDetails != null)
        'FailedStatusDetails': failedStatusDetails,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
      if (syncStatus != null) 'SyncStatus': syncStatus.toValue(),
    };
  }
}

class DescribeImageGenerationConfigurationOutput {
  /// The structure that contains the information required for the Kinesis video
  /// stream (KVS) images delivery. If this structure is null, the configuration
  /// will be deleted from the stream.
  final ImageGenerationConfiguration? imageGenerationConfiguration;

  DescribeImageGenerationConfigurationOutput({
    this.imageGenerationConfiguration,
  });

  factory DescribeImageGenerationConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeImageGenerationConfigurationOutput(
      imageGenerationConfiguration: json['ImageGenerationConfiguration'] != null
          ? ImageGenerationConfiguration.fromJson(
              json['ImageGenerationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageGenerationConfiguration = this.imageGenerationConfiguration;
    return {
      if (imageGenerationConfiguration != null)
        'ImageGenerationConfiguration': imageGenerationConfiguration,
    };
  }
}

class DescribeMappedResourceConfigurationOutput {
  /// A structure that encapsulates, or contains, the media storage configuration
  /// properties.
  final List<MappedResourceConfigurationListItem>?
      mappedResourceConfigurationList;

  /// The token that was used in the <code>NextToken</code>request to fetch the
  /// next set of results.
  final String? nextToken;

  DescribeMappedResourceConfigurationOutput({
    this.mappedResourceConfigurationList,
    this.nextToken,
  });

  factory DescribeMappedResourceConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeMappedResourceConfigurationOutput(
      mappedResourceConfigurationList:
          (json['MappedResourceConfigurationList'] as List?)
              ?.whereNotNull()
              .map((e) => MappedResourceConfigurationListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mappedResourceConfigurationList =
        this.mappedResourceConfigurationList;
    final nextToken = this.nextToken;
    return {
      if (mappedResourceConfigurationList != null)
        'MappedResourceConfigurationList': mappedResourceConfigurationList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeMediaStorageConfigurationOutput {
  /// A structure that encapsulates, or contains, the media storage configuration
  /// properties.
  final MediaStorageConfiguration? mediaStorageConfiguration;

  DescribeMediaStorageConfigurationOutput({
    this.mediaStorageConfiguration,
  });

  factory DescribeMediaStorageConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeMediaStorageConfigurationOutput(
      mediaStorageConfiguration: json['MediaStorageConfiguration'] != null
          ? MediaStorageConfiguration.fromJson(
              json['MediaStorageConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaStorageConfiguration = this.mediaStorageConfiguration;
    return {
      if (mediaStorageConfiguration != null)
        'MediaStorageConfiguration': mediaStorageConfiguration,
    };
  }
}

class DescribeNotificationConfigurationOutput {
  /// The structure that contains the information required for notifications. If
  /// the structure is null, the configuration will be deleted from the stream.
  final NotificationConfiguration? notificationConfiguration;

  DescribeNotificationConfigurationOutput({
    this.notificationConfiguration,
  });

  factory DescribeNotificationConfigurationOutput.fromJson(
      Map<String, dynamic> json) {
    return DescribeNotificationConfigurationOutput(
      notificationConfiguration: json['NotificationConfiguration'] != null
          ? NotificationConfiguration.fromJson(
              json['NotificationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final notificationConfiguration = this.notificationConfiguration;
    return {
      if (notificationConfiguration != null)
        'NotificationConfiguration': notificationConfiguration,
    };
  }
}

class DescribeSignalingChannelOutput {
  /// A structure that encapsulates the specified signaling channel's metadata and
  /// properties.
  final ChannelInfo? channelInfo;

  DescribeSignalingChannelOutput({
    this.channelInfo,
  });

  factory DescribeSignalingChannelOutput.fromJson(Map<String, dynamic> json) {
    return DescribeSignalingChannelOutput(
      channelInfo: json['ChannelInfo'] != null
          ? ChannelInfo.fromJson(json['ChannelInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelInfo = this.channelInfo;
    return {
      if (channelInfo != null) 'ChannelInfo': channelInfo,
    };
  }
}

class DescribeStreamOutput {
  /// An object that describes the stream.
  final StreamInfo? streamInfo;

  DescribeStreamOutput({
    this.streamInfo,
  });

  factory DescribeStreamOutput.fromJson(Map<String, dynamic> json) {
    return DescribeStreamOutput(
      streamInfo: json['StreamInfo'] != null
          ? StreamInfo.fromJson(json['StreamInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamInfo = this.streamInfo;
    return {
      if (streamInfo != null) 'StreamInfo': streamInfo,
    };
  }
}

/// An object that contains the latest status details for an edge agent's
/// recorder and uploader jobs. Use this information to determine the current
/// health of an edge agent.
class EdgeAgentStatus {
  /// The latest status of a stream’s edge recording job.
  final LastRecorderStatus? lastRecorderStatus;

  /// The latest status of a stream’s edge to cloud uploader job.
  final LastUploaderStatus? lastUploaderStatus;

  EdgeAgentStatus({
    this.lastRecorderStatus,
    this.lastUploaderStatus,
  });

  factory EdgeAgentStatus.fromJson(Map<String, dynamic> json) {
    return EdgeAgentStatus(
      lastRecorderStatus: json['LastRecorderStatus'] != null
          ? LastRecorderStatus.fromJson(
              json['LastRecorderStatus'] as Map<String, dynamic>)
          : null,
      lastUploaderStatus: json['LastUploaderStatus'] != null
          ? LastUploaderStatus.fromJson(
              json['LastUploaderStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lastRecorderStatus = this.lastRecorderStatus;
    final lastUploaderStatus = this.lastUploaderStatus;
    return {
      if (lastRecorderStatus != null) 'LastRecorderStatus': lastRecorderStatus,
      if (lastUploaderStatus != null) 'LastUploaderStatus': lastUploaderStatus,
    };
  }
}

/// A description of the stream's edge configuration that will be used to sync
/// with the Edge Agent IoT Greengrass component. The Edge Agent component will
/// run on an IoT Hub Device setup at your premise.
class EdgeConfig {
  /// The "<b>Internet of Things (IoT) Thing</b>" Arn of the stream.
  final String hubDeviceArn;

  /// The recorder configuration consists of the local
  /// <code>MediaSourceConfig</code> details, that are used as credentials to
  /// access the local media files streamed on the camera.
  final RecorderConfig recorderConfig;

  /// The deletion configuration is made up of the retention time
  /// (<code>EdgeRetentionInHours</code>) and local size configuration
  /// (<code>LocalSizeConfig</code>) details that are used to make the deletion.
  final DeletionConfig? deletionConfig;

  /// The uploader configuration contains the <code>ScheduleExpression</code>
  /// details that are used to schedule upload jobs for the recorded media files
  /// from the Edge Agent to a Kinesis Video Stream.
  final UploaderConfig? uploaderConfig;

  EdgeConfig({
    required this.hubDeviceArn,
    required this.recorderConfig,
    this.deletionConfig,
    this.uploaderConfig,
  });

  factory EdgeConfig.fromJson(Map<String, dynamic> json) {
    return EdgeConfig(
      hubDeviceArn: json['HubDeviceArn'] as String,
      recorderConfig: RecorderConfig.fromJson(
          json['RecorderConfig'] as Map<String, dynamic>),
      deletionConfig: json['DeletionConfig'] != null
          ? DeletionConfig.fromJson(
              json['DeletionConfig'] as Map<String, dynamic>)
          : null,
      uploaderConfig: json['UploaderConfig'] != null
          ? UploaderConfig.fromJson(
              json['UploaderConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hubDeviceArn = this.hubDeviceArn;
    final recorderConfig = this.recorderConfig;
    final deletionConfig = this.deletionConfig;
    final uploaderConfig = this.uploaderConfig;
    return {
      'HubDeviceArn': hubDeviceArn,
      'RecorderConfig': recorderConfig,
      if (deletionConfig != null) 'DeletionConfig': deletionConfig,
      if (uploaderConfig != null) 'UploaderConfig': uploaderConfig,
    };
  }
}

enum Format {
  jpeg,
  png,
}

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.jpeg:
        return 'JPEG';
      case Format.png:
        return 'PNG';
    }
  }
}

extension FormatFromString on String {
  Format toFormat() {
    switch (this) {
      case 'JPEG':
        return Format.jpeg;
      case 'PNG':
        return Format.png;
    }
    throw Exception('$this is not known in enum Format');
  }
}

enum FormatConfigKey {
  jPEGQuality,
}

extension FormatConfigKeyValueExtension on FormatConfigKey {
  String toValue() {
    switch (this) {
      case FormatConfigKey.jPEGQuality:
        return 'JPEGQuality';
    }
  }
}

extension FormatConfigKeyFromString on String {
  FormatConfigKey toFormatConfigKey() {
    switch (this) {
      case 'JPEGQuality':
        return FormatConfigKey.jPEGQuality;
    }
    throw Exception('$this is not known in enum FormatConfigKey');
  }
}

class GetDataEndpointOutput {
  /// The endpoint value. To read data from the stream or to write data to it,
  /// specify this endpoint in your application.
  final String? dataEndpoint;

  GetDataEndpointOutput({
    this.dataEndpoint,
  });

  factory GetDataEndpointOutput.fromJson(Map<String, dynamic> json) {
    return GetDataEndpointOutput(
      dataEndpoint: json['DataEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataEndpoint = this.dataEndpoint;
    return {
      if (dataEndpoint != null) 'DataEndpoint': dataEndpoint,
    };
  }
}

class GetSignalingChannelEndpointOutput {
  /// A list of endpoints for the specified signaling channel.
  final List<ResourceEndpointListItem>? resourceEndpointList;

  GetSignalingChannelEndpointOutput({
    this.resourceEndpointList,
  });

  factory GetSignalingChannelEndpointOutput.fromJson(
      Map<String, dynamic> json) {
    return GetSignalingChannelEndpointOutput(
      resourceEndpointList: (json['ResourceEndpointList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceEndpointListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceEndpointList = this.resourceEndpointList;
    return {
      if (resourceEndpointList != null)
        'ResourceEndpointList': resourceEndpointList,
    };
  }
}

/// The structure that contains the information required for the KVS images
/// delivery. If null, the configuration will be deleted from the stream.
class ImageGenerationConfiguration {
  /// The structure that contains the information required to deliver images to a
  /// customer.
  final ImageGenerationDestinationConfig destinationConfig;

  /// The accepted image format.
  final Format format;

  /// The origin of the Server or Producer timestamps to use to generate the
  /// images.
  final ImageSelectorType imageSelectorType;

  /// The time interval in milliseconds (ms) at which the images need to be
  /// generated from the stream. The minimum value that can be provided is 200 ms.
  /// If the timestamp range is less than the sampling interval, the Image from
  /// the <code>StartTimestamp</code> will be returned if available.
  final int samplingInterval;

  /// Indicates whether the <code>ContinuousImageGenerationConfigurations</code>
  /// API is enabled or disabled.
  final ConfigurationStatus status;

  /// The list of a key-value pair structure that contains extra parameters that
  /// can be applied when the image is generated. The <code>FormatConfig</code>
  /// key is the <code>JPEGQuality</code>, which indicates the JPEG quality key to
  /// be used to generate the image. The <code>FormatConfig</code> value accepts
  /// ints from 1 to 100. If the value is 1, the image will be generated with less
  /// quality and the best compression. If the value is 100, the image will be
  /// generated with the best quality and less compression. If no value is
  /// provided, the default value of the <code>JPEGQuality</code> key will be set
  /// to 80.
  final Map<FormatConfigKey, String>? formatConfig;

  /// The height of the output image that is used in conjunction with the
  /// <code>WidthPixels</code> parameter. When both <code>HeightPixels</code> and
  /// <code>WidthPixels</code> parameters are provided, the image will be
  /// stretched to fit the specified aspect ratio. If only the
  /// <code>HeightPixels</code> parameter is provided, its original aspect ratio
  /// will be used to calculate the <code>WidthPixels</code> ratio. If neither
  /// parameter is provided, the original image size will be returned.
  final int? heightPixels;

  /// The width of the output image that is used in conjunction with the
  /// <code>HeightPixels</code> parameter. When both <code>WidthPixels</code> and
  /// <code>HeightPixels</code> parameters are provided, the image will be
  /// stretched to fit the specified aspect ratio. If only the
  /// <code>WidthPixels</code> parameter is provided, its original aspect ratio
  /// will be used to calculate the <code>HeightPixels</code> ratio. If neither
  /// parameter is provided, the original image size will be returned.
  final int? widthPixels;

  ImageGenerationConfiguration({
    required this.destinationConfig,
    required this.format,
    required this.imageSelectorType,
    required this.samplingInterval,
    required this.status,
    this.formatConfig,
    this.heightPixels,
    this.widthPixels,
  });

  factory ImageGenerationConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageGenerationConfiguration(
      destinationConfig: ImageGenerationDestinationConfig.fromJson(
          json['DestinationConfig'] as Map<String, dynamic>),
      format: (json['Format'] as String).toFormat(),
      imageSelectorType:
          (json['ImageSelectorType'] as String).toImageSelectorType(),
      samplingInterval: json['SamplingInterval'] as int,
      status: (json['Status'] as String).toConfigurationStatus(),
      formatConfig: (json['FormatConfig'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toFormatConfigKey(), e as String)),
      heightPixels: json['HeightPixels'] as int?,
      widthPixels: json['WidthPixels'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationConfig = this.destinationConfig;
    final format = this.format;
    final imageSelectorType = this.imageSelectorType;
    final samplingInterval = this.samplingInterval;
    final status = this.status;
    final formatConfig = this.formatConfig;
    final heightPixels = this.heightPixels;
    final widthPixels = this.widthPixels;
    return {
      'DestinationConfig': destinationConfig,
      'Format': format.toValue(),
      'ImageSelectorType': imageSelectorType.toValue(),
      'SamplingInterval': samplingInterval,
      'Status': status.toValue(),
      if (formatConfig != null)
        'FormatConfig': formatConfig.map((k, e) => MapEntry(k.toValue(), e)),
      if (heightPixels != null) 'HeightPixels': heightPixels,
      if (widthPixels != null) 'WidthPixels': widthPixels,
    };
  }
}

/// The structure that contains the information required to deliver images to a
/// customer.
class ImageGenerationDestinationConfig {
  /// The Amazon Web Services Region of the S3 bucket where images will be
  /// delivered. This <code>DestinationRegion</code> must match the Region where
  /// the stream is located.
  final String destinationRegion;

  /// The Uniform Resource Identifier (URI) that identifies where the images will
  /// be delivered.
  final String uri;

  ImageGenerationDestinationConfig({
    required this.destinationRegion,
    required this.uri,
  });

  factory ImageGenerationDestinationConfig.fromJson(Map<String, dynamic> json) {
    return ImageGenerationDestinationConfig(
      destinationRegion: json['DestinationRegion'] as String,
      uri: json['Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationRegion = this.destinationRegion;
    final uri = this.uri;
    return {
      'DestinationRegion': destinationRegion,
      'Uri': uri,
    };
  }
}

enum ImageSelectorType {
  serverTimestamp,
  producerTimestamp,
}

extension ImageSelectorTypeValueExtension on ImageSelectorType {
  String toValue() {
    switch (this) {
      case ImageSelectorType.serverTimestamp:
        return 'SERVER_TIMESTAMP';
      case ImageSelectorType.producerTimestamp:
        return 'PRODUCER_TIMESTAMP';
    }
  }
}

extension ImageSelectorTypeFromString on String {
  ImageSelectorType toImageSelectorType() {
    switch (this) {
      case 'SERVER_TIMESTAMP':
        return ImageSelectorType.serverTimestamp;
      case 'PRODUCER_TIMESTAMP':
        return ImageSelectorType.producerTimestamp;
    }
    throw Exception('$this is not known in enum ImageSelectorType');
  }
}

/// The latest status of a stream's edge recording job.
class LastRecorderStatus {
  /// A description of a recorder job’s latest status.
  final String? jobStatusDetails;

  /// The timestamp at which the recorder job was last executed and media stored
  /// to local disk.
  final DateTime? lastCollectedTime;

  /// The timestamp at which the recorder status was last updated.
  final DateTime? lastUpdatedTime;

  /// The status of the latest recorder job.
  final RecorderStatus? recorderStatus;

  LastRecorderStatus({
    this.jobStatusDetails,
    this.lastCollectedTime,
    this.lastUpdatedTime,
    this.recorderStatus,
  });

  factory LastRecorderStatus.fromJson(Map<String, dynamic> json) {
    return LastRecorderStatus(
      jobStatusDetails: json['JobStatusDetails'] as String?,
      lastCollectedTime: timeStampFromJson(json['LastCollectedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      recorderStatus: (json['RecorderStatus'] as String?)?.toRecorderStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobStatusDetails = this.jobStatusDetails;
    final lastCollectedTime = this.lastCollectedTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final recorderStatus = this.recorderStatus;
    return {
      if (jobStatusDetails != null) 'JobStatusDetails': jobStatusDetails,
      if (lastCollectedTime != null)
        'LastCollectedTime': unixTimestampToJson(lastCollectedTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (recorderStatus != null) 'RecorderStatus': recorderStatus.toValue(),
    };
  }
}

/// The latest status of a stream’s edge to cloud uploader job.
class LastUploaderStatus {
  /// A description of an uploader job’s latest status.
  final String? jobStatusDetails;

  /// The timestamp at which the uploader job was last executed and media
  /// collected to the cloud.
  final DateTime? lastCollectedTime;

  /// The timestamp at which the uploader status was last updated.
  final DateTime? lastUpdatedTime;

  /// The status of the latest uploader job.
  final UploaderStatus? uploaderStatus;

  LastUploaderStatus({
    this.jobStatusDetails,
    this.lastCollectedTime,
    this.lastUpdatedTime,
    this.uploaderStatus,
  });

  factory LastUploaderStatus.fromJson(Map<String, dynamic> json) {
    return LastUploaderStatus(
      jobStatusDetails: json['JobStatusDetails'] as String?,
      lastCollectedTime: timeStampFromJson(json['LastCollectedTime']),
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      uploaderStatus: (json['UploaderStatus'] as String?)?.toUploaderStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobStatusDetails = this.jobStatusDetails;
    final lastCollectedTime = this.lastCollectedTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final uploaderStatus = this.uploaderStatus;
    return {
      if (jobStatusDetails != null) 'JobStatusDetails': jobStatusDetails,
      if (lastCollectedTime != null)
        'LastCollectedTime': unixTimestampToJson(lastCollectedTime),
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (uploaderStatus != null) 'UploaderStatus': uploaderStatus.toValue(),
    };
  }
}

/// A description of a single stream's edge configuration.
class ListEdgeAgentConfigurationsEdgeConfig {
  /// The timestamp when the stream first created the edge config.
  final DateTime? creationTime;
  final EdgeConfig? edgeConfig;

  /// A description of the generated failure status.
  final String? failedStatusDetails;

  /// The timestamp when the stream last updated the edge config.
  final DateTime? lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the stream.
  final String? streamARN;

  /// The name of the stream.
  final String? streamName;

  /// The current sync status of the stream's edge configuration.
  final SyncStatus? syncStatus;

  ListEdgeAgentConfigurationsEdgeConfig({
    this.creationTime,
    this.edgeConfig,
    this.failedStatusDetails,
    this.lastUpdatedTime,
    this.streamARN,
    this.streamName,
    this.syncStatus,
  });

  factory ListEdgeAgentConfigurationsEdgeConfig.fromJson(
      Map<String, dynamic> json) {
    return ListEdgeAgentConfigurationsEdgeConfig(
      creationTime: timeStampFromJson(json['CreationTime']),
      edgeConfig: json['EdgeConfig'] != null
          ? EdgeConfig.fromJson(json['EdgeConfig'] as Map<String, dynamic>)
          : null,
      failedStatusDetails: json['FailedStatusDetails'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      streamARN: json['StreamARN'] as String?,
      streamName: json['StreamName'] as String?,
      syncStatus: (json['SyncStatus'] as String?)?.toSyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final edgeConfig = this.edgeConfig;
    final failedStatusDetails = this.failedStatusDetails;
    final lastUpdatedTime = this.lastUpdatedTime;
    final streamARN = this.streamARN;
    final streamName = this.streamName;
    final syncStatus = this.syncStatus;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (edgeConfig != null) 'EdgeConfig': edgeConfig,
      if (failedStatusDetails != null)
        'FailedStatusDetails': failedStatusDetails,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
      if (syncStatus != null) 'SyncStatus': syncStatus.toValue(),
    };
  }
}

class ListEdgeAgentConfigurationsOutput {
  /// A description of a single stream's edge configuration.
  final List<ListEdgeAgentConfigurationsEdgeConfig>? edgeConfigs;

  /// If the response is truncated, the call returns this element with a given
  /// token. To get the next batch of edge configurations, use this token in your
  /// next request.
  final String? nextToken;

  ListEdgeAgentConfigurationsOutput({
    this.edgeConfigs,
    this.nextToken,
  });

  factory ListEdgeAgentConfigurationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListEdgeAgentConfigurationsOutput(
      edgeConfigs: (json['EdgeConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => ListEdgeAgentConfigurationsEdgeConfig.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final edgeConfigs = this.edgeConfigs;
    final nextToken = this.nextToken;
    return {
      if (edgeConfigs != null) 'EdgeConfigs': edgeConfigs,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSignalingChannelsOutput {
  /// An array of <code>ChannelInfo</code> objects.
  final List<ChannelInfo>? channelInfoList;

  /// If the response is truncated, the call returns this element with a token. To
  /// get the next batch of streams, use this token in your next request.
  final String? nextToken;

  ListSignalingChannelsOutput({
    this.channelInfoList,
    this.nextToken,
  });

  factory ListSignalingChannelsOutput.fromJson(Map<String, dynamic> json) {
    return ListSignalingChannelsOutput(
      channelInfoList: (json['ChannelInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelInfoList = this.channelInfoList;
    final nextToken = this.nextToken;
    return {
      if (channelInfoList != null) 'ChannelInfoList': channelInfoList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListStreamsOutput {
  /// If the response is truncated, the call returns this element with a token. To
  /// get the next batch of streams, use this token in your next request.
  final String? nextToken;

  /// An array of <code>StreamInfo</code> objects.
  final List<StreamInfo>? streamInfoList;

  ListStreamsOutput({
    this.nextToken,
    this.streamInfoList,
  });

  factory ListStreamsOutput.fromJson(Map<String, dynamic> json) {
    return ListStreamsOutput(
      nextToken: json['NextToken'] as String?,
      streamInfoList: (json['StreamInfoList'] as List?)
          ?.whereNotNull()
          .map((e) => StreamInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final streamInfoList = this.streamInfoList;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (streamInfoList != null) 'StreamInfoList': streamInfoList,
    };
  }
}

class ListTagsForResourceOutput {
  /// If you specify this parameter and the result of a
  /// <code>ListTagsForResource</code> call is truncated, the response includes a
  /// token that you can use in the next request to fetch the next set of tags.
  final String? nextToken;

  /// A map of tag keys and values associated with the specified signaling
  /// channel.
  final Map<String, String>? tags;

  ListTagsForResourceOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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

class ListTagsForStreamOutput {
  /// If you specify this parameter and the result of a <code>ListTags</code> call
  /// is truncated, the response includes a token that you can use in the next
  /// request to fetch the next set of tags.
  final String? nextToken;

  /// A map of tag keys and values associated with the specified stream.
  final Map<String, String>? tags;

  ListTagsForStreamOutput({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForStreamOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForStreamOutput(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
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

/// The configuration details that include the maximum size of the media
/// (<code>MaxLocalMediaSizeInMB</code>) that you want to store for a stream on
/// the Edge Agent, as well as the strategy that should be used
/// (<code>StrategyOnFullSize</code>) when a stream's maximum size has been
/// reached.
class LocalSizeConfig {
  /// The overall maximum size of the media that you want to store for a stream on
  /// the Edge Agent.
  final int? maxLocalMediaSizeInMB;

  /// The strategy to perform when a stream’s <code>MaxLocalMediaSizeInMB</code>
  /// limit is reached.
  final StrategyOnFullSize? strategyOnFullSize;

  LocalSizeConfig({
    this.maxLocalMediaSizeInMB,
    this.strategyOnFullSize,
  });

  factory LocalSizeConfig.fromJson(Map<String, dynamic> json) {
    return LocalSizeConfig(
      maxLocalMediaSizeInMB: json['MaxLocalMediaSizeInMB'] as int?,
      strategyOnFullSize:
          (json['StrategyOnFullSize'] as String?)?.toStrategyOnFullSize(),
    );
  }

  Map<String, dynamic> toJson() {
    final maxLocalMediaSizeInMB = this.maxLocalMediaSizeInMB;
    final strategyOnFullSize = this.strategyOnFullSize;
    return {
      if (maxLocalMediaSizeInMB != null)
        'MaxLocalMediaSizeInMB': maxLocalMediaSizeInMB,
      if (strategyOnFullSize != null)
        'StrategyOnFullSize': strategyOnFullSize.toValue(),
    };
  }
}

/// A structure that encapsulates, or contains, the media storage configuration
/// properties.
class MappedResourceConfigurationListItem {
  /// The Amazon Resource Name (ARN) of the Kinesis Video Stream resource,
  /// associated with the stream.
  final String? arn;

  /// The type of the associated resource for the kinesis video stream.
  final String? type;

  MappedResourceConfigurationListItem({
    this.arn,
    this.type,
  });

  factory MappedResourceConfigurationListItem.fromJson(
      Map<String, dynamic> json) {
    return MappedResourceConfigurationListItem(
      arn: json['ARN'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final type = this.type;
    return {
      if (arn != null) 'ARN': arn,
      if (type != null) 'Type': type,
    };
  }
}

/// The configuration details that consist of the credentials required
/// (<code>MediaUriSecretArn</code> and <code>MediaUriType</code>) to access the
/// media files that are streamed to the camera.
class MediaSourceConfig {
  /// The Amazon Web Services Secrets Manager ARN for the username and password of
  /// the camera, or a local media file location.
  final String mediaUriSecretArn;

  /// The Uniform Resource Identifier (URI) type. The <code>FILE_URI</code> value
  /// can be used to stream local media files.
  /// <note>
  /// Preview only supports the <code>RTSP_URI</code> media source URI format .
  /// </note>
  final MediaUriType mediaUriType;

  MediaSourceConfig({
    required this.mediaUriSecretArn,
    required this.mediaUriType,
  });

  factory MediaSourceConfig.fromJson(Map<String, dynamic> json) {
    return MediaSourceConfig(
      mediaUriSecretArn: json['MediaUriSecretArn'] as String,
      mediaUriType: (json['MediaUriType'] as String).toMediaUriType(),
    );
  }

  Map<String, dynamic> toJson() {
    final mediaUriSecretArn = this.mediaUriSecretArn;
    final mediaUriType = this.mediaUriType;
    return {
      'MediaUriSecretArn': mediaUriSecretArn,
      'MediaUriType': mediaUriType.toValue(),
    };
  }
}

/// A structure that encapsulates, or contains, the media storage configuration
/// properties.
///
/// <ul>
/// <li>
/// If <code>StorageStatus</code> is enabled, the data will be stored in the
/// <code>StreamARN</code> provided. In order for WebRTC Ingestion to work, the
/// stream must have data retention enabled.
/// </li>
/// <li>
/// If <code>StorageStatus</code> is disabled, no data will be stored, and the
/// <code>StreamARN</code> parameter will not be needed.
/// </li>
/// </ul>
class MediaStorageConfiguration {
  /// The status of the media storage configuration.
  final MediaStorageConfigurationStatus status;

  /// The Amazon Resource Name (ARN) of the stream.
  final String? streamARN;

  MediaStorageConfiguration({
    required this.status,
    this.streamARN,
  });

  factory MediaStorageConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaStorageConfiguration(
      status: (json['Status'] as String).toMediaStorageConfigurationStatus(),
      streamARN: json['StreamARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final streamARN = this.streamARN;
    return {
      'Status': status.toValue(),
      if (streamARN != null) 'StreamARN': streamARN,
    };
  }
}

enum MediaStorageConfigurationStatus {
  enabled,
  disabled,
}

extension MediaStorageConfigurationStatusValueExtension
    on MediaStorageConfigurationStatus {
  String toValue() {
    switch (this) {
      case MediaStorageConfigurationStatus.enabled:
        return 'ENABLED';
      case MediaStorageConfigurationStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension MediaStorageConfigurationStatusFromString on String {
  MediaStorageConfigurationStatus toMediaStorageConfigurationStatus() {
    switch (this) {
      case 'ENABLED':
        return MediaStorageConfigurationStatus.enabled;
      case 'DISABLED':
        return MediaStorageConfigurationStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum MediaStorageConfigurationStatus');
  }
}

enum MediaUriType {
  rtspUri,
  fileUri,
}

extension MediaUriTypeValueExtension on MediaUriType {
  String toValue() {
    switch (this) {
      case MediaUriType.rtspUri:
        return 'RTSP_URI';
      case MediaUriType.fileUri:
        return 'FILE_URI';
    }
  }
}

extension MediaUriTypeFromString on String {
  MediaUriType toMediaUriType() {
    switch (this) {
      case 'RTSP_URI':
        return MediaUriType.rtspUri;
      case 'FILE_URI':
        return MediaUriType.fileUri;
    }
    throw Exception('$this is not known in enum MediaUriType');
  }
}

/// The structure that contains the notification information for the KVS images
/// delivery. If this parameter is null, the configuration will be deleted from
/// the stream.
class NotificationConfiguration {
  /// The destination information required to deliver a notification to a
  /// customer.
  final NotificationDestinationConfig destinationConfig;

  /// Indicates if a notification configuration is enabled or disabled.
  final ConfigurationStatus status;

  NotificationConfiguration({
    required this.destinationConfig,
    required this.status,
  });

  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) {
    return NotificationConfiguration(
      destinationConfig: NotificationDestinationConfig.fromJson(
          json['DestinationConfig'] as Map<String, dynamic>),
      status: (json['Status'] as String).toConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationConfig = this.destinationConfig;
    final status = this.status;
    return {
      'DestinationConfig': destinationConfig,
      'Status': status.toValue(),
    };
  }
}

/// The structure that contains the information required to deliver a
/// notification to a customer.
class NotificationDestinationConfig {
  /// The Uniform Resource Identifier (URI) that identifies where the images will
  /// be delivered.
  final String uri;

  NotificationDestinationConfig({
    required this.uri,
  });

  factory NotificationDestinationConfig.fromJson(Map<String, dynamic> json) {
    return NotificationDestinationConfig(
      uri: json['Uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'Uri': uri,
    };
  }
}

/// The recorder configuration consists of the local
/// <code>MediaSourceConfig</code> details that are used as credentials to
/// accesss the local media files streamed on the camera.
class RecorderConfig {
  /// The configuration details that consist of the credentials required
  /// (<code>MediaUriSecretArn</code> and <code>MediaUriType</code>) to access the
  /// media files streamed to the camera.
  final MediaSourceConfig mediaSourceConfig;

  /// The configuration that consists of the <code>ScheduleExpression</code> and
  /// the <code>DurationInMinutes</code> details that specify the scheduling to
  /// record from a camera, or local media file, onto the Edge Agent. If the
  /// <code>ScheduleExpression</code> attribute is not provided, then the Edge
  /// Agent will always be set to recording mode.
  final ScheduleConfig? scheduleConfig;

  RecorderConfig({
    required this.mediaSourceConfig,
    this.scheduleConfig,
  });

  factory RecorderConfig.fromJson(Map<String, dynamic> json) {
    return RecorderConfig(
      mediaSourceConfig: MediaSourceConfig.fromJson(
          json['MediaSourceConfig'] as Map<String, dynamic>),
      scheduleConfig: json['ScheduleConfig'] != null
          ? ScheduleConfig.fromJson(
              json['ScheduleConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaSourceConfig = this.mediaSourceConfig;
    final scheduleConfig = this.scheduleConfig;
    return {
      'MediaSourceConfig': mediaSourceConfig,
      if (scheduleConfig != null) 'ScheduleConfig': scheduleConfig,
    };
  }
}

enum RecorderStatus {
  success,
  userError,
  systemError,
}

extension RecorderStatusValueExtension on RecorderStatus {
  String toValue() {
    switch (this) {
      case RecorderStatus.success:
        return 'SUCCESS';
      case RecorderStatus.userError:
        return 'USER_ERROR';
      case RecorderStatus.systemError:
        return 'SYSTEM_ERROR';
    }
  }
}

extension RecorderStatusFromString on String {
  RecorderStatus toRecorderStatus() {
    switch (this) {
      case 'SUCCESS':
        return RecorderStatus.success;
      case 'USER_ERROR':
        return RecorderStatus.userError;
      case 'SYSTEM_ERROR':
        return RecorderStatus.systemError;
    }
    throw Exception('$this is not known in enum RecorderStatus');
  }
}

/// An object that describes the endpoint of the signaling channel returned by
/// the <code>GetSignalingChannelEndpoint</code> API.
///
/// The media server endpoint will correspond to the <code>WEBRTC</code>
/// Protocol.
class ResourceEndpointListItem {
  /// The protocol of the signaling channel returned by the
  /// <code>GetSignalingChannelEndpoint</code> API.
  final ChannelProtocol? protocol;

  /// The endpoint of the signaling channel returned by the
  /// <code>GetSignalingChannelEndpoint</code> API.
  final String? resourceEndpoint;

  ResourceEndpointListItem({
    this.protocol,
    this.resourceEndpoint,
  });

  factory ResourceEndpointListItem.fromJson(Map<String, dynamic> json) {
    return ResourceEndpointListItem(
      protocol: (json['Protocol'] as String?)?.toChannelProtocol(),
      resourceEndpoint: json['ResourceEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final protocol = this.protocol;
    final resourceEndpoint = this.resourceEndpoint;
    return {
      if (protocol != null) 'Protocol': protocol.toValue(),
      if (resourceEndpoint != null) 'ResourceEndpoint': resourceEndpoint,
    };
  }
}

/// This API enables you to specify the duration that the camera, or local media
/// file, should record onto the Edge Agent. The <code>ScheduleConfig</code>
/// consists of the <code>ScheduleExpression</code> and the
/// <code>DurationInMinutes</code> attributes.
///
/// If the <code>ScheduleConfig</code> is not provided in the
/// <code>RecorderConfig</code>, then the Edge Agent will always be set to
/// recording mode.
///
/// If the <code>ScheduleConfig</code> is not provided in the
/// <code>UploaderConfig</code>, then the Edge Agent will upload at regular
/// intervals (every 1 hour).
class ScheduleConfig {
  /// The total duration to record the media. If the
  /// <code>ScheduleExpression</code> attribute is provided, then the
  /// <code>DurationInSeconds</code> attribute should also be specified.
  final int durationInSeconds;

  /// The Quartz cron expression that takes care of scheduling jobs to record from
  /// the camera, or local media file, onto the Edge Agent. If the
  /// <code>ScheduleExpression</code> is not provided for the
  /// <code>RecorderConfig</code>, then the Edge Agent will always be set to
  /// recording mode.
  ///
  /// For more information about Quartz, refer to the <a
  /// href="http://www.quartz-scheduler.org/documentation/quartz-2.3.0/tutorials/crontrigger.html">
  /// <i>Cron Trigger Tutorial</i> </a> page to understand the valid expressions
  /// and its use.
  final String scheduleExpression;

  ScheduleConfig({
    required this.durationInSeconds,
    required this.scheduleExpression,
  });

  factory ScheduleConfig.fromJson(Map<String, dynamic> json) {
    return ScheduleConfig(
      durationInSeconds: json['DurationInSeconds'] as int,
      scheduleExpression: json['ScheduleExpression'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    final scheduleExpression = this.scheduleExpression;
    return {
      'DurationInSeconds': durationInSeconds,
      'ScheduleExpression': scheduleExpression,
    };
  }
}

/// An object that contains the endpoint configuration for the
/// <code>SINGLE_MASTER</code> channel type.
class SingleMasterChannelEndpointConfiguration {
  /// This property is used to determine the nature of communication over this
  /// <code>SINGLE_MASTER</code> signaling channel. If <code>WSS</code> is
  /// specified, this API returns a websocket endpoint. If <code>HTTPS</code> is
  /// specified, this API returns an <code>HTTPS</code> endpoint.
  final List<ChannelProtocol>? protocols;

  /// This property is used to determine messaging permissions in this
  /// <code>SINGLE_MASTER</code> signaling channel. If <code>MASTER</code> is
  /// specified, this API returns an endpoint that a client can use to receive
  /// offers from and send answers to any of the viewers on this signaling
  /// channel. If <code>VIEWER</code> is specified, this API returns an endpoint
  /// that a client can use only to send offers to another <code>MASTER</code>
  /// client on this signaling channel.
  final ChannelRole? role;

  SingleMasterChannelEndpointConfiguration({
    this.protocols,
    this.role,
  });

  Map<String, dynamic> toJson() {
    final protocols = this.protocols;
    final role = this.role;
    return {
      if (protocols != null)
        'Protocols': protocols.map((e) => e.toValue()).toList(),
      if (role != null) 'Role': role.toValue(),
    };
  }
}

/// A structure that contains the configuration for the
/// <code>SINGLE_MASTER</code> channel type.
class SingleMasterConfiguration {
  /// The period of time a signaling channel retains undelivered messages before
  /// they are discarded.
  final int? messageTtlSeconds;

  SingleMasterConfiguration({
    this.messageTtlSeconds,
  });

  factory SingleMasterConfiguration.fromJson(Map<String, dynamic> json) {
    return SingleMasterConfiguration(
      messageTtlSeconds: json['MessageTtlSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageTtlSeconds = this.messageTtlSeconds;
    return {
      if (messageTtlSeconds != null) 'MessageTtlSeconds': messageTtlSeconds,
    };
  }
}

class StartEdgeConfigurationUpdateOutput {
  /// The timestamp at which a stream’s edge configuration was first created.
  final DateTime? creationTime;

  /// A description of the stream's edge configuration that will be used to sync
  /// with the Edge Agent IoT Greengrass component. The Edge Agent component will
  /// run on an IoT Hub Device setup at your premise.
  final EdgeConfig? edgeConfig;

  /// A description of the generated failure status.
  final String? failedStatusDetails;

  /// The timestamp at which a stream’s edge configuration was last updated.
  final DateTime? lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the stream.
  final String? streamARN;

  /// The name of the stream from which the edge configuration was updated.
  final String? streamName;

  /// The current sync status of the stream's edge configuration. When you invoke
  /// this API, the sync status will be set to the <code>SYNCING</code> state. Use
  /// the <code>DescribeEdgeConfiguration</code> API to get the latest status of
  /// the edge configuration.
  final SyncStatus? syncStatus;

  StartEdgeConfigurationUpdateOutput({
    this.creationTime,
    this.edgeConfig,
    this.failedStatusDetails,
    this.lastUpdatedTime,
    this.streamARN,
    this.streamName,
    this.syncStatus,
  });

  factory StartEdgeConfigurationUpdateOutput.fromJson(
      Map<String, dynamic> json) {
    return StartEdgeConfigurationUpdateOutput(
      creationTime: timeStampFromJson(json['CreationTime']),
      edgeConfig: json['EdgeConfig'] != null
          ? EdgeConfig.fromJson(json['EdgeConfig'] as Map<String, dynamic>)
          : null,
      failedStatusDetails: json['FailedStatusDetails'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      streamARN: json['StreamARN'] as String?,
      streamName: json['StreamName'] as String?,
      syncStatus: (json['SyncStatus'] as String?)?.toSyncStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final edgeConfig = this.edgeConfig;
    final failedStatusDetails = this.failedStatusDetails;
    final lastUpdatedTime = this.lastUpdatedTime;
    final streamARN = this.streamARN;
    final streamName = this.streamName;
    final syncStatus = this.syncStatus;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (edgeConfig != null) 'EdgeConfig': edgeConfig,
      if (failedStatusDetails != null)
        'FailedStatusDetails': failedStatusDetails,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
      if (syncStatus != null) 'SyncStatus': syncStatus.toValue(),
    };
  }
}

enum Status {
  creating,
  active,
  updating,
  deleting,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.creating:
        return 'CREATING';
      case Status.active:
        return 'ACTIVE';
      case Status.updating:
        return 'UPDATING';
      case Status.deleting:
        return 'DELETING';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'CREATING':
        return Status.creating;
      case 'ACTIVE':
        return Status.active;
      case 'UPDATING':
        return Status.updating;
      case 'DELETING':
        return Status.deleting;
    }
    throw Exception('$this is not known in enum Status');
  }
}

enum StrategyOnFullSize {
  deleteOldestMedia,
  denyNewMedia,
}

extension StrategyOnFullSizeValueExtension on StrategyOnFullSize {
  String toValue() {
    switch (this) {
      case StrategyOnFullSize.deleteOldestMedia:
        return 'DELETE_OLDEST_MEDIA';
      case StrategyOnFullSize.denyNewMedia:
        return 'DENY_NEW_MEDIA';
    }
  }
}

extension StrategyOnFullSizeFromString on String {
  StrategyOnFullSize toStrategyOnFullSize() {
    switch (this) {
      case 'DELETE_OLDEST_MEDIA':
        return StrategyOnFullSize.deleteOldestMedia;
      case 'DENY_NEW_MEDIA':
        return StrategyOnFullSize.denyNewMedia;
    }
    throw Exception('$this is not known in enum StrategyOnFullSize');
  }
}

/// An object describing a Kinesis video stream.
class StreamInfo {
  /// A time stamp that indicates when the stream was created.
  final DateTime? creationTime;

  /// How long the stream retains data, in hours.
  final int? dataRetentionInHours;

  /// The name of the device that is associated with the stream.
  final String? deviceName;

  /// The ID of the Key Management Service (KMS) key that Kinesis Video Streams
  /// uses to encrypt data on the stream.
  final String? kmsKeyId;

  /// The <code>MediaType</code> of the stream.
  final String? mediaType;

  /// The status of the stream.
  final Status? status;

  /// The Amazon Resource Name (ARN) of the stream.
  final String? streamARN;

  /// The name of the stream.
  final String? streamName;

  /// The version of the stream.
  final String? version;

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

  factory StreamInfo.fromJson(Map<String, dynamic> json) {
    return StreamInfo(
      creationTime: timeStampFromJson(json['CreationTime']),
      dataRetentionInHours: json['DataRetentionInHours'] as int?,
      deviceName: json['DeviceName'] as String?,
      kmsKeyId: json['KmsKeyId'] as String?,
      mediaType: json['MediaType'] as String?,
      status: (json['Status'] as String?)?.toStatus(),
      streamARN: json['StreamARN'] as String?,
      streamName: json['StreamName'] as String?,
      version: json['Version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataRetentionInHours = this.dataRetentionInHours;
    final deviceName = this.deviceName;
    final kmsKeyId = this.kmsKeyId;
    final mediaType = this.mediaType;
    final status = this.status;
    final streamARN = this.streamARN;
    final streamName = this.streamName;
    final version = this.version;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataRetentionInHours != null)
        'DataRetentionInHours': dataRetentionInHours,
      if (deviceName != null) 'DeviceName': deviceName,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
      if (mediaType != null) 'MediaType': mediaType,
      if (status != null) 'Status': status.toValue(),
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
      if (version != null) 'Version': version,
    };
  }
}

/// Specifies the condition that streams must satisfy to be returned when you
/// list streams (see the <code>ListStreams</code> API). A condition has a
/// comparison operation and a value. Currently, you can specify only the
/// <code>BEGINS_WITH</code> operator, which finds streams whose names start
/// with a given prefix.
class StreamNameCondition {
  /// A comparison operator. Currently, you can specify only the
  /// <code>BEGINS_WITH</code> operator, which finds streams whose names start
  /// with a given prefix.
  final ComparisonOperator? comparisonOperator;

  /// A value to compare.
  final String? comparisonValue;

  StreamNameCondition({
    this.comparisonOperator,
    this.comparisonValue,
  });

  Map<String, dynamic> toJson() {
    final comparisonOperator = this.comparisonOperator;
    final comparisonValue = this.comparisonValue;
    return {
      if (comparisonOperator != null)
        'ComparisonOperator': comparisonOperator.toValue(),
      if (comparisonValue != null) 'ComparisonValue': comparisonValue,
    };
  }
}

enum SyncStatus {
  syncing,
  acknowledged,
  inSync,
  syncFailed,
  deleting,
  deleteFailed,
  deletingAcknowledged,
}

extension SyncStatusValueExtension on SyncStatus {
  String toValue() {
    switch (this) {
      case SyncStatus.syncing:
        return 'SYNCING';
      case SyncStatus.acknowledged:
        return 'ACKNOWLEDGED';
      case SyncStatus.inSync:
        return 'IN_SYNC';
      case SyncStatus.syncFailed:
        return 'SYNC_FAILED';
      case SyncStatus.deleting:
        return 'DELETING';
      case SyncStatus.deleteFailed:
        return 'DELETE_FAILED';
      case SyncStatus.deletingAcknowledged:
        return 'DELETING_ACKNOWLEDGED';
    }
  }
}

extension SyncStatusFromString on String {
  SyncStatus toSyncStatus() {
    switch (this) {
      case 'SYNCING':
        return SyncStatus.syncing;
      case 'ACKNOWLEDGED':
        return SyncStatus.acknowledged;
      case 'IN_SYNC':
        return SyncStatus.inSync;
      case 'SYNC_FAILED':
        return SyncStatus.syncFailed;
      case 'DELETING':
        return SyncStatus.deleting;
      case 'DELETE_FAILED':
        return SyncStatus.deleteFailed;
      case 'DELETING_ACKNOWLEDGED':
        return SyncStatus.deletingAcknowledged;
    }
    throw Exception('$this is not known in enum SyncStatus');
  }
}

/// A key and value pair that is associated with the specified signaling
/// channel.
class Tag {
  /// The key of the tag that is associated with the specified signaling channel.
  final String key;

  /// The value of the tag that is associated with the specified signaling
  /// channel.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class TagStreamOutput {
  TagStreamOutput();

  factory TagStreamOutput.fromJson(Map<String, dynamic> _) {
    return TagStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagStreamOutput {
  UntagStreamOutput();

  factory UntagStreamOutput.fromJson(Map<String, dynamic> _) {
    return UntagStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum UpdateDataRetentionOperation {
  increaseDataRetention,
  decreaseDataRetention,
}

extension UpdateDataRetentionOperationValueExtension
    on UpdateDataRetentionOperation {
  String toValue() {
    switch (this) {
      case UpdateDataRetentionOperation.increaseDataRetention:
        return 'INCREASE_DATA_RETENTION';
      case UpdateDataRetentionOperation.decreaseDataRetention:
        return 'DECREASE_DATA_RETENTION';
    }
  }
}

extension UpdateDataRetentionOperationFromString on String {
  UpdateDataRetentionOperation toUpdateDataRetentionOperation() {
    switch (this) {
      case 'INCREASE_DATA_RETENTION':
        return UpdateDataRetentionOperation.increaseDataRetention;
      case 'DECREASE_DATA_RETENTION':
        return UpdateDataRetentionOperation.decreaseDataRetention;
    }
    throw Exception('$this is not known in enum UpdateDataRetentionOperation');
  }
}

class UpdateDataRetentionOutput {
  UpdateDataRetentionOutput();

  factory UpdateDataRetentionOutput.fromJson(Map<String, dynamic> _) {
    return UpdateDataRetentionOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateImageGenerationConfigurationOutput {
  UpdateImageGenerationConfigurationOutput();

  factory UpdateImageGenerationConfigurationOutput.fromJson(
      Map<String, dynamic> _) {
    return UpdateImageGenerationConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMediaStorageConfigurationOutput {
  UpdateMediaStorageConfigurationOutput();

  factory UpdateMediaStorageConfigurationOutput.fromJson(
      Map<String, dynamic> _) {
    return UpdateMediaStorageConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateNotificationConfigurationOutput {
  UpdateNotificationConfigurationOutput();

  factory UpdateNotificationConfigurationOutput.fromJson(
      Map<String, dynamic> _) {
    return UpdateNotificationConfigurationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSignalingChannelOutput {
  UpdateSignalingChannelOutput();

  factory UpdateSignalingChannelOutput.fromJson(Map<String, dynamic> _) {
    return UpdateSignalingChannelOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStreamOutput {
  UpdateStreamOutput();

  factory UpdateStreamOutput.fromJson(Map<String, dynamic> _) {
    return UpdateStreamOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The configuration that consists of the <code>ScheduleExpression</code> and
/// the <code>DurationInMinutes</code> details that specify the scheduling to
/// record from a camera, or local media file, onto the Edge Agent. If the
/// <code>ScheduleConfig</code> is not provided in the
/// <code>UploaderConfig</code>, then the Edge Agent will upload at regular
/// intervals (every 1 hour).
class UploaderConfig {
  /// The configuration that consists of the <code>ScheduleExpression</code> and
  /// the <code>DurationInMinutes</code> details that specify the scheduling to
  /// record from a camera, or local media file, onto the Edge Agent. If the
  /// <code>ScheduleConfig</code> is not provided in this
  /// <code>UploaderConfig</code>, then the Edge Agent will upload at regular
  /// intervals (every 1 hour).
  final ScheduleConfig scheduleConfig;

  UploaderConfig({
    required this.scheduleConfig,
  });

  factory UploaderConfig.fromJson(Map<String, dynamic> json) {
    return UploaderConfig(
      scheduleConfig: ScheduleConfig.fromJson(
          json['ScheduleConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleConfig = this.scheduleConfig;
    return {
      'ScheduleConfig': scheduleConfig,
    };
  }
}

enum UploaderStatus {
  success,
  userError,
  systemError,
}

extension UploaderStatusValueExtension on UploaderStatus {
  String toValue() {
    switch (this) {
      case UploaderStatus.success:
        return 'SUCCESS';
      case UploaderStatus.userError:
        return 'USER_ERROR';
      case UploaderStatus.systemError:
        return 'SYSTEM_ERROR';
    }
  }
}

extension UploaderStatusFromString on String {
  UploaderStatus toUploaderStatus() {
    switch (this) {
      case 'SUCCESS':
        return UploaderStatus.success;
      case 'USER_ERROR':
        return UploaderStatus.userError;
      case 'SYSTEM_ERROR':
        return UploaderStatus.systemError;
    }
    throw Exception('$this is not known in enum UploaderStatus');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class AccountChannelLimitExceededException extends _s.GenericAwsException {
  AccountChannelLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'AccountChannelLimitExceededException',
            message: message);
}

class AccountStreamLimitExceededException extends _s.GenericAwsException {
  AccountStreamLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'AccountStreamLimitExceededException',
            message: message);
}

class ClientLimitExceededException extends _s.GenericAwsException {
  ClientLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'ClientLimitExceededException', message: message);
}

class DeviceStreamLimitExceededException extends _s.GenericAwsException {
  DeviceStreamLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'DeviceStreamLimitExceededException',
            message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidDeviceException extends _s.GenericAwsException {
  InvalidDeviceException({String? type, String? message})
      : super(type: type, code: 'InvalidDeviceException', message: message);
}

class InvalidResourceFormatException extends _s.GenericAwsException {
  InvalidResourceFormatException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidResourceFormatException',
            message: message);
}

class NoDataRetentionException extends _s.GenericAwsException {
  NoDataRetentionException({String? type, String? message})
      : super(type: type, code: 'NoDataRetentionException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class StreamEdgeConfigurationNotFoundException extends _s.GenericAwsException {
  StreamEdgeConfigurationNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'StreamEdgeConfigurationNotFoundException',
            message: message);
}

class TagsPerResourceExceededLimitException extends _s.GenericAwsException {
  TagsPerResourceExceededLimitException({String? type, String? message})
      : super(
            type: type,
            code: 'TagsPerResourceExceededLimitException',
            message: message);
}

class VersionMismatchException extends _s.GenericAwsException {
  VersionMismatchException({String? type, String? message})
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
  'NoDataRetentionException': (type, message) =>
      NoDataRetentionException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'StreamEdgeConfigurationNotFoundException': (type, message) =>
      StreamEdgeConfigurationNotFoundException(type: type, message: message),
  'TagsPerResourceExceededLimitException': (type, message) =>
      TagsPerResourceExceededLimitException(type: type, message: message),
  'VersionMismatchException': (type, message) =>
      VersionMismatchException(type: type, message: message),
};
