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

part '2017-10-14.g.dart';

/// API for AWS Elemental MediaLive
class MediaLive {
  final _s.RestJsonProtocol _protocol;
  MediaLive({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'medialive',
            signingName: 'medialive',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accept an incoming input device transfer. The ownership of the device will
  /// transfer to your AWS account.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inputDeviceId] :
  /// The unique ID of the input device to accept. For example,
  /// hd-123456789abcdef.
  Future<void> acceptInputDeviceTransfer({
    @_s.required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/accept',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptInputDeviceTransferResponse.fromJson(response);
  }

  /// Starts delete of resources.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelIds] :
  /// List of channel IDs
  ///
  /// Parameter [inputIds] :
  /// List of input IDs
  ///
  /// Parameter [inputSecurityGroupIds] :
  /// List of input security group IDs
  ///
  /// Parameter [multiplexIds] :
  /// List of multiplex IDs
  Future<BatchDeleteResponse> batchDelete({
    List<String> channelIds,
    List<String> inputIds,
    List<String> inputSecurityGroupIds,
    List<String> multiplexIds,
  }) async {
    final $payload = <String, dynamic>{
      if (channelIds != null) 'channelIds': channelIds,
      if (inputIds != null) 'inputIds': inputIds,
      if (inputSecurityGroupIds != null)
        'inputSecurityGroupIds': inputSecurityGroupIds,
      if (multiplexIds != null) 'multiplexIds': multiplexIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/batch/delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteResponse.fromJson(response);
  }

  /// Starts existing resources
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelIds] :
  /// List of channel IDs
  ///
  /// Parameter [multiplexIds] :
  /// List of multiplex IDs
  Future<BatchStartResponse> batchStart({
    List<String> channelIds,
    List<String> multiplexIds,
  }) async {
    final $payload = <String, dynamic>{
      if (channelIds != null) 'channelIds': channelIds,
      if (multiplexIds != null) 'multiplexIds': multiplexIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/batch/start',
      exceptionFnMap: _exceptionFns,
    );
    return BatchStartResponse.fromJson(response);
  }

  /// Stops running resources
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelIds] :
  /// List of channel IDs
  ///
  /// Parameter [multiplexIds] :
  /// List of multiplex IDs
  Future<BatchStopResponse> batchStop({
    List<String> channelIds,
    List<String> multiplexIds,
  }) async {
    final $payload = <String, dynamic>{
      if (channelIds != null) 'channelIds': channelIds,
      if (multiplexIds != null) 'multiplexIds': multiplexIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/batch/stop',
      exceptionFnMap: _exceptionFns,
    );
    return BatchStopResponse.fromJson(response);
  }

  /// Update a channel schedule
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelId] :
  /// Id of the channel whose schedule is being updated.
  ///
  /// Parameter [creates] :
  /// Schedule actions to create in the schedule.
  ///
  /// Parameter [deletes] :
  /// Schedule actions to delete from the schedule.
  Future<BatchUpdateScheduleResponse> batchUpdateSchedule({
    @_s.required String channelId,
    BatchScheduleActionCreateRequest creates,
    BatchScheduleActionDeleteRequest deletes,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final $payload = <String, dynamic>{
      if (creates != null) 'creates': creates,
      if (deletes != null) 'deletes': deletes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}/schedule',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateScheduleResponse.fromJson(response);
  }

  /// Cancel an input device transfer that you have requested.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inputDeviceId] :
  /// The unique ID of the input device to cancel. For example,
  /// hd-123456789abcdef.
  Future<void> cancelInputDeviceTransfer({
    @_s.required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
    return CancelInputDeviceTransferResponse.fromJson(response);
  }

  /// Creates a new channel
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [cdiInputSpecification] :
  /// Specification of CDI inputs for this channel
  ///
  /// Parameter [channelClass] :
  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  ///
  /// Parameter [inputAttachments] :
  /// List of input attachments for channel.
  ///
  /// Parameter [inputSpecification] :
  /// Specification of network and file inputs for this channel
  ///
  /// Parameter [logLevel] :
  /// The log level to write to CloudWatch Logs.
  ///
  /// Parameter [name] :
  /// Name of channel.
  ///
  /// Parameter [requestId] :
  /// Unique request ID to be specified. This is needed to prevent retries from
  /// creating multiple resources.
  ///
  /// Parameter [reserved] :
  /// Deprecated field that's only usable by whitelisted customers.
  ///
  /// Parameter [roleArn] :
  /// An optional Amazon Resource Name (ARN) of the role to assume when running
  /// the Channel.
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs.
  Future<CreateChannelResponse> createChannel({
    CdiInputSpecification cdiInputSpecification,
    ChannelClass channelClass,
    List<OutputDestination> destinations,
    EncoderSettings encoderSettings,
    List<InputAttachment> inputAttachments,
    InputSpecification inputSpecification,
    LogLevel logLevel,
    String name,
    String requestId,
    String reserved,
    String roleArn,
    Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (destinations != null) 'destinations': destinations,
      if (encoderSettings != null) 'encoderSettings': encoderSettings,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (reserved != null) 'reserved': reserved,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/channels',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Create an input
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [destinations] :
  /// Destination settings for PUSH type inputs.
  ///
  /// Parameter [inputDevices] :
  /// Settings for the devices.
  ///
  /// Parameter [inputSecurityGroups] :
  /// A list of security groups referenced by IDs to attach to the input.
  ///
  /// Parameter [mediaConnectFlows] :
  /// A list of the MediaConnect Flows that you want to use in this input. You
  /// can specify as few as one
  /// Flow and presently, as many as two. The only requirement is when you have
  /// more than one is that each Flow is in a
  /// separate Availability Zone as this ensures your EML input is redundant to
  /// AZ issues.
  ///
  /// Parameter [name] :
  /// Name of the input.
  ///
  /// Parameter [requestId] :
  /// Unique identifier of the request to ensure the request is handled
  /// exactly once in case of retries.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  ///
  /// Parameter [sources] :
  /// The source URLs for a PULL-type input. Every PULL type input needs
  /// exactly two source URLs for redundancy.
  /// Only specify sources for PULL type Inputs. Leave Destinations empty.
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs.
  Future<CreateInputResponse> createInput({
    List<InputDestinationRequest> destinations,
    List<InputDeviceSettings> inputDevices,
    List<String> inputSecurityGroups,
    List<MediaConnectFlowRequest> mediaConnectFlows,
    String name,
    String requestId,
    String roleArn,
    List<InputSourceRequest> sources,
    Map<String, String> tags,
    InputType type,
    InputVpcRequest vpc,
  }) async {
    final $payload = <String, dynamic>{
      if (destinations != null) 'destinations': destinations,
      if (inputDevices != null) 'inputDevices': inputDevices,
      if (inputSecurityGroups != null)
        'inputSecurityGroups': inputSecurityGroups,
      if (mediaConnectFlows != null) 'mediaConnectFlows': mediaConnectFlows,
      if (name != null) 'name': name,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (roleArn != null) 'roleArn': roleArn,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (vpc != null) 'vpc': vpc,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/inputs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInputResponse.fromJson(response);
  }

  /// Creates a Input Security Group
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs.
  ///
  /// Parameter [whitelistRules] :
  /// List of IPv4 CIDR addresses to whitelist
  Future<CreateInputSecurityGroupResponse> createInputSecurityGroup({
    Map<String, String> tags,
    List<InputWhitelistRuleCidr> whitelistRules,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
      if (whitelistRules != null) 'whitelistRules': whitelistRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/inputSecurityGroups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInputSecurityGroupResponse.fromJson(response);
  }

  /// Create a new multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [availabilityZones] :
  /// A list of availability zones for the multiplex. You must specify exactly
  /// two.
  ///
  /// Parameter [multiplexSettings] :
  /// Configuration for a multiplex event.
  ///
  /// Parameter [name] :
  /// Name of multiplex.
  ///
  /// Parameter [requestId] :
  /// Unique request ID. This prevents retries from creating multiple
  /// resources.
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs.
  Future<CreateMultiplexResponse> createMultiplex({
    @_s.required List<String> availabilityZones,
    @_s.required MultiplexSettings multiplexSettings,
    @_s.required String name,
    @_s.required String requestId,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(availabilityZones, 'availabilityZones');
    ArgumentError.checkNotNull(multiplexSettings, 'multiplexSettings');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(requestId, 'requestId');
    final $payload = <String, dynamic>{
      'availabilityZones': availabilityZones,
      'multiplexSettings': multiplexSettings,
      'name': name,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/multiplexes',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMultiplexResponse.fromJson(response);
  }

  /// Create a new program in the multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [multiplexId] :
  /// ID of the multiplex where the program is to be created.
  ///
  /// Parameter [multiplexProgramSettings] :
  /// The settings for this multiplex program.
  ///
  /// Parameter [programName] :
  /// Name of multiplex program.
  ///
  /// Parameter [requestId] :
  /// Unique request ID. This prevents retries from creating multiple
  /// resources.
  Future<CreateMultiplexProgramResponse> createMultiplexProgram({
    @_s.required String multiplexId,
    @_s.required MultiplexProgramSettings multiplexProgramSettings,
    @_s.required String programName,
    @_s.required String requestId,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    ArgumentError.checkNotNull(
        multiplexProgramSettings, 'multiplexProgramSettings');
    ArgumentError.checkNotNull(programName, 'programName');
    ArgumentError.checkNotNull(requestId, 'requestId');
    final $payload = <String, dynamic>{
      'multiplexProgramSettings': multiplexProgramSettings,
      'programName': programName,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}/programs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMultiplexProgramResponse.fromJson(response);
  }

  /// Create tags for a resource
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<void> createTags({
    @_s.required String resourceArn,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts deletion of channel. The associated outputs are also deleted.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelId] :
  /// Unique ID of the channel.
  Future<DeleteChannelResponse> deleteChannel({
    @_s.required String channelId,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteChannelResponse.fromJson(response);
  }

  /// Deletes the input end point
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inputId] :
  /// Unique ID of the input
  Future<void> deleteInput({
    @_s.required String inputId,
  }) async {
    ArgumentError.checkNotNull(inputId, 'inputId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/inputs/${Uri.encodeComponent(inputId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInputResponse.fromJson(response);
  }

  /// Deletes an Input Security Group
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [inputSecurityGroupId] :
  /// The Input Security Group to delete
  Future<void> deleteInputSecurityGroup({
    @_s.required String inputSecurityGroupId,
  }) async {
    ArgumentError.checkNotNull(inputSecurityGroupId, 'inputSecurityGroupId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/prod/inputSecurityGroups/${Uri.encodeComponent(inputSecurityGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInputSecurityGroupResponse.fromJson(response);
  }

  /// Delete a multiplex. The multiplex must be idle.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex.
  Future<DeleteMultiplexResponse> deleteMultiplex({
    @_s.required String multiplexId,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMultiplexResponse.fromJson(response);
  }

  /// Delete a program from a multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex that the program belongs to.
  ///
  /// Parameter [programName] :
  /// The multiplex program name.
  Future<DeleteMultiplexProgramResponse> deleteMultiplexProgram({
    @_s.required String multiplexId,
    @_s.required String programName,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    ArgumentError.checkNotNull(programName, 'programName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}/programs/${Uri.encodeComponent(programName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteMultiplexProgramResponse.fromJson(response);
  }

  /// Delete an expired reservation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [reservationId] :
  /// Unique reservation ID, e.g. '1234567'
  Future<DeleteReservationResponse> deleteReservation({
    @_s.required String reservationId,
  }) async {
    ArgumentError.checkNotNull(reservationId, 'reservationId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/reservations/${Uri.encodeComponent(reservationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteReservationResponse.fromJson(response);
  }

  /// Delete all schedule actions on a channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelId] :
  /// Id of the channel whose schedule is being deleted.
  Future<void> deleteSchedule({
    @_s.required String channelId,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}/schedule',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteScheduleResponse.fromJson(response);
  }

  /// Removes tags for a resource
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [tagKeys] :
  /// An array of tag keys to delete
  Future<void> deleteTags({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets details about a channel
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelId] :
  /// channel ID
  Future<DescribeChannelResponse> describeChannel({
    @_s.required String channelId,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelResponse.fromJson(response);
  }

  /// Produces details about an input
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [inputId] :
  /// Unique ID of the input
  Future<DescribeInputResponse> describeInput({
    @_s.required String inputId,
  }) async {
    ArgumentError.checkNotNull(inputId, 'inputId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/inputs/${Uri.encodeComponent(inputId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInputResponse.fromJson(response);
  }

  /// Gets the details for the input device
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [inputDeviceId] :
  /// The unique ID of this input device. For example, hd-123456789abcdef.
  Future<DescribeInputDeviceResponse> describeInputDevice({
    @_s.required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInputDeviceResponse.fromJson(response);
  }

  /// Get the latest thumbnail data for the input device.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [accept] :
  /// The HTTP Accept header. Indicates the requested type for the thumbnail.
  ///
  /// Parameter [inputDeviceId] :
  /// The unique ID of this input device. For example, hd-123456789abcdef.
  Future<DescribeInputDeviceThumbnailResponse> describeInputDeviceThumbnail({
    @_s.required AcceptHeader accept,
    @_s.required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(accept, 'accept');
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final headers = <String, String>{};
    accept?.let((v) => headers['accept'] = v.toValue());
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/thumbnailData',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInputDeviceThumbnailResponse(
      body: await response.stream.toBytes(),
      contentLength:
          _s.extractHeaderIntValue(response.headers, 'Content-Length'),
      contentType: _s
          .extractHeaderStringValue(response.headers, 'Content-Type')
          ?.toContentType(),
      eTag: _s.extractHeaderStringValue(response.headers, 'ETag'),
      lastModified:
          _s.extractHeaderDateTimeValue(response.headers, 'Last-Modified'),
    );
  }

  /// Produces a summary of an Input Security Group
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [inputSecurityGroupId] :
  /// The id of the Input Security Group to describe
  Future<DescribeInputSecurityGroupResponse> describeInputSecurityGroup({
    @_s.required String inputSecurityGroupId,
  }) async {
    ArgumentError.checkNotNull(inputSecurityGroupId, 'inputSecurityGroupId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/prod/inputSecurityGroups/${Uri.encodeComponent(inputSecurityGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeInputSecurityGroupResponse.fromJson(response);
  }

  /// Gets details about a multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex.
  Future<DescribeMultiplexResponse> describeMultiplex({
    @_s.required String multiplexId,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMultiplexResponse.fromJson(response);
  }

  /// Get the details for a program in a multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex that the program belongs to.
  ///
  /// Parameter [programName] :
  /// The name of the program.
  Future<DescribeMultiplexProgramResponse> describeMultiplexProgram({
    @_s.required String multiplexId,
    @_s.required String programName,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    ArgumentError.checkNotNull(programName, 'programName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}/programs/${Uri.encodeComponent(programName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMultiplexProgramResponse.fromJson(response);
  }

  /// Get details for an offering.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [offeringId] :
  /// Unique offering ID, e.g. '87654321'
  Future<DescribeOfferingResponse> describeOffering({
    @_s.required String offeringId,
  }) async {
    ArgumentError.checkNotNull(offeringId, 'offeringId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/offerings/${Uri.encodeComponent(offeringId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeOfferingResponse.fromJson(response);
  }

  /// Get details for a reservation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [reservationId] :
  /// Unique reservation ID, e.g. '1234567'
  Future<DescribeReservationResponse> describeReservation({
    @_s.required String reservationId,
  }) async {
    ArgumentError.checkNotNull(reservationId, 'reservationId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/reservations/${Uri.encodeComponent(reservationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReservationResponse.fromJson(response);
  }

  /// Get a channel schedule
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelId] :
  /// Id of the channel whose schedule is being updated.
  Future<DescribeScheduleResponse> describeSchedule({
    @_s.required String channelId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}/schedule',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeScheduleResponse.fromJson(response);
  }

  /// Produces list of channels that have been created
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  Future<ListChannelsResponse> listChannels({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// List input devices that are currently being transferred. List input
  /// devices that you are transferring from your AWS account or input devices
  /// that another AWS account is transferring to you.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  Future<ListInputDeviceTransfersResponse> listInputDeviceTransfers({
    @_s.required String transferType,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(transferType, 'transferType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (transferType != null) 'transferType': [transferType],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/inputDeviceTransfers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInputDeviceTransfersResponse.fromJson(response);
  }

  /// List input devices
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  Future<ListInputDevicesResponse> listInputDevices({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/inputDevices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInputDevicesResponse.fromJson(response);
  }

  /// Produces a list of Input Security Groups for an account
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  Future<ListInputSecurityGroupsResponse> listInputSecurityGroups({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/inputSecurityGroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInputSecurityGroupsResponse.fromJson(response);
  }

  /// Produces list of inputs that have been created
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  Future<ListInputsResponse> listInputs({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/inputs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInputsResponse.fromJson(response);
  }

  /// List the programs that currently exist for a specific multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex that the programs belong to.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next page of results.
  Future<ListMultiplexProgramsResponse> listMultiplexPrograms({
    @_s.required String multiplexId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}/programs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMultiplexProgramsResponse.fromJson(response);
  }

  /// Retrieve a list of the existing multiplexes.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return.
  ///
  /// Parameter [nextToken] :
  /// The token to retrieve the next page of results.
  Future<ListMultiplexesResponse> listMultiplexes({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/multiplexes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMultiplexesResponse.fromJson(response);
  }

  /// List offerings available for purchase.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelClass] :
  /// Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'
  ///
  /// Parameter [channelConfiguration] :
  /// Filter to offerings that match the configuration of an existing channel,
  /// e.g. '2345678' (a channel ID)
  ///
  /// Parameter [codec] :
  /// Filter by codec, 'AVC', 'HEVC', 'MPEG2', 'AUDIO', or 'LINK'
  ///
  /// Parameter [duration] :
  /// Filter by offering duration, e.g. '12'
  ///
  /// Parameter [maximumBitrate] :
  /// Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'
  ///
  /// Parameter [maximumFramerate] :
  /// Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
  ///
  /// Parameter [resolution] :
  /// Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'
  ///
  /// Parameter [resourceType] :
  /// Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
  ///
  /// Parameter [specialFeature] :
  /// Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'
  ///
  /// Parameter [videoQuality] :
  /// Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'
  Future<ListOfferingsResponse> listOfferings({
    String channelClass,
    String channelConfiguration,
    String codec,
    String duration,
    int maxResults,
    String maximumBitrate,
    String maximumFramerate,
    String nextToken,
    String resolution,
    String resourceType,
    String specialFeature,
    String videoQuality,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (channelClass != null) 'channelClass': [channelClass],
      if (channelConfiguration != null)
        'channelConfiguration': [channelConfiguration],
      if (codec != null) 'codec': [codec],
      if (duration != null) 'duration': [duration],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (maximumBitrate != null) 'maximumBitrate': [maximumBitrate],
      if (maximumFramerate != null) 'maximumFramerate': [maximumFramerate],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resolution != null) 'resolution': [resolution],
      if (resourceType != null) 'resourceType': [resourceType],
      if (specialFeature != null) 'specialFeature': [specialFeature],
      if (videoQuality != null) 'videoQuality': [videoQuality],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/offerings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListOfferingsResponse.fromJson(response);
  }

  /// List purchased reservations.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [channelClass] :
  /// Filter by channel class, 'STANDARD' or 'SINGLE_PIPELINE'
  ///
  /// Parameter [codec] :
  /// Filter by codec, 'AVC', 'HEVC', 'MPEG2', 'AUDIO', or 'LINK'
  ///
  /// Parameter [maximumBitrate] :
  /// Filter by bitrate, 'MAX_10_MBPS', 'MAX_20_MBPS', or 'MAX_50_MBPS'
  ///
  /// Parameter [maximumFramerate] :
  /// Filter by framerate, 'MAX_30_FPS' or 'MAX_60_FPS'
  ///
  /// Parameter [resolution] :
  /// Filter by resolution, 'SD', 'HD', 'FHD', or 'UHD'
  ///
  /// Parameter [resourceType] :
  /// Filter by resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
  ///
  /// Parameter [specialFeature] :
  /// Filter by special feature, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'
  ///
  /// Parameter [videoQuality] :
  /// Filter by video quality, 'STANDARD', 'ENHANCED', or 'PREMIUM'
  Future<ListReservationsResponse> listReservations({
    String channelClass,
    String codec,
    int maxResults,
    String maximumBitrate,
    String maximumFramerate,
    String nextToken,
    String resolution,
    String resourceType,
    String specialFeature,
    String videoQuality,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (channelClass != null) 'channelClass': [channelClass],
      if (codec != null) 'codec': [codec],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (maximumBitrate != null) 'maximumBitrate': [maximumBitrate],
      if (maximumFramerate != null) 'maximumFramerate': [maximumFramerate],
      if (nextToken != null) 'nextToken': [nextToken],
      if (resolution != null) 'resolution': [resolution],
      if (resourceType != null) 'resourceType': [resourceType],
      if (specialFeature != null) 'specialFeature': [specialFeature],
      if (videoQuality != null) 'videoQuality': [videoQuality],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/reservations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListReservationsResponse.fromJson(response);
  }

  /// Produces list of tags that have been created for a resource
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prod/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Purchase an offering and create a reservation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [count] :
  /// Number of resources
  ///
  /// Parameter [offeringId] :
  /// Offering to purchase, e.g. '87654321'
  ///
  /// Parameter [name] :
  /// Name for the new reservation
  ///
  /// Parameter [requestId] :
  /// Unique request ID to be specified. This is needed to prevent retries from
  /// creating multiple resources.
  ///
  /// Parameter [start] :
  /// Requested reservation start time (UTC) in ISO-8601 format. The specified
  /// time must be between the first day of the current month and one year from
  /// now. If no value is given, the default is now.
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs
  Future<PurchaseOfferingResponse> purchaseOffering({
    @_s.required int count,
    @_s.required String offeringId,
    String name,
    String requestId,
    String start,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(count, 'count');
    _s.validateNumRange(
      'count',
      count,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(offeringId, 'offeringId');
    final $payload = <String, dynamic>{
      'count': count,
      if (name != null) 'name': name,
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (start != null) 'start': start,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/offerings/${Uri.encodeComponent(offeringId)}/purchase',
      exceptionFnMap: _exceptionFns,
    );
    return PurchaseOfferingResponse.fromJson(response);
  }

  /// Reject the transfer of the specified input device to your AWS account.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inputDeviceId] :
  /// The unique ID of the input device to reject. For example,
  /// hd-123456789abcdef.
  Future<void> rejectInputDeviceTransfer({
    @_s.required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/reject',
      exceptionFnMap: _exceptionFns,
    );
    return RejectInputDeviceTransferResponse.fromJson(response);
  }

  /// Starts an existing channel
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelId] :
  /// A request to start a channel
  Future<StartChannelResponse> startChannel({
    @_s.required String channelId,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartChannelResponse.fromJson(response);
  }

  /// Start (run) the multiplex. Starting the multiplex does not start the
  /// channels. You must explicitly start each channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex.
  Future<StartMultiplexResponse> startMultiplex({
    @_s.required String multiplexId,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}/start',
      exceptionFnMap: _exceptionFns,
    );
    return StartMultiplexResponse.fromJson(response);
  }

  /// Stops a running channel
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelId] :
  /// A request to stop a running channel
  Future<StopChannelResponse> stopChannel({
    @_s.required String channelId,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopChannelResponse.fromJson(response);
  }

  /// Stops a running multiplex. If the multiplex isn't running, this action has
  /// no effect.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex.
  Future<StopMultiplexResponse> stopMultiplex({
    @_s.required String multiplexId,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
    return StopMultiplexResponse.fromJson(response);
  }

  /// Start an input device transfer to another AWS account. After you make the
  /// request, the other account must accept or reject the transfer.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inputDeviceId] :
  /// The unique ID of this input device. For example, hd-123456789abcdef.
  ///
  /// Parameter [targetCustomerId] :
  /// The AWS account ID (12 digits) for the recipient of the device transfer.
  ///
  /// Parameter [transferMessage] :
  /// An optional message for the recipient. Maximum 280 characters.
  Future<void> transferInputDevice({
    @_s.required String inputDeviceId,
    String targetCustomerId,
    String transferMessage,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final $payload = <String, dynamic>{
      if (targetCustomerId != null) 'targetCustomerId': targetCustomerId,
      if (transferMessage != null) 'transferMessage': transferMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/transfer',
      exceptionFnMap: _exceptionFns,
    );
    return TransferInputDeviceResponse.fromJson(response);
  }

  /// Updates a channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelId] :
  /// channel ID
  ///
  /// Parameter [cdiInputSpecification] :
  /// Specification of CDI inputs for this channel
  ///
  /// Parameter [destinations] :
  /// A list of output destinations for this channel.
  ///
  /// Parameter [encoderSettings] :
  /// The encoder settings for this channel.
  ///
  /// Parameter [inputSpecification] :
  /// Specification of network and file inputs for this channel
  ///
  /// Parameter [logLevel] :
  /// The log level to write to CloudWatch Logs.
  ///
  /// Parameter [name] :
  /// The name of the channel.
  ///
  /// Parameter [roleArn] :
  /// An optional Amazon Resource Name (ARN) of the role to assume when running
  /// the Channel. If you do not specify this on an update call but the role was
  /// previously set that role will be removed.
  Future<UpdateChannelResponse> updateChannel({
    @_s.required String channelId,
    CdiInputSpecification cdiInputSpecification,
    List<OutputDestination> destinations,
    EncoderSettings encoderSettings,
    List<InputAttachment> inputAttachments,
    InputSpecification inputSpecification,
    LogLevel logLevel,
    String name,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final $payload = <String, dynamic>{
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (destinations != null) 'destinations': destinations,
      if (encoderSettings != null) 'encoderSettings': encoderSettings,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Changes the class of the channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [channelClass] :
  /// The channel class that you wish to update this channel to use.
  ///
  /// Parameter [channelId] :
  /// Channel Id of the channel whose class should be updated.
  ///
  /// Parameter [destinations] :
  /// A list of output destinations for this channel.
  Future<UpdateChannelClassResponse> updateChannelClass({
    @_s.required ChannelClass channelClass,
    @_s.required String channelId,
    List<OutputDestination> destinations,
  }) async {
    ArgumentError.checkNotNull(channelClass, 'channelClass');
    ArgumentError.checkNotNull(channelId, 'channelId');
    final $payload = <String, dynamic>{
      'channelClass': channelClass?.toValue() ?? '',
      if (destinations != null) 'destinations': destinations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/prod/channels/${Uri.encodeComponent(channelId)}/channelClass',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelClassResponse.fromJson(response);
  }

  /// Updates an input.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inputId] :
  /// Unique ID of the input.
  ///
  /// Parameter [destinations] :
  /// Destination settings for PUSH type inputs.
  ///
  /// Parameter [inputDevices] :
  /// Settings for the devices.
  ///
  /// Parameter [inputSecurityGroups] :
  /// A list of security groups referenced by IDs to attach to the input.
  ///
  /// Parameter [mediaConnectFlows] :
  /// A list of the MediaConnect Flow ARNs that you want to use as the source of
  /// the input. You can specify as few as one
  /// Flow and presently, as many as two. The only requirement is when you have
  /// more than one is that each Flow is in a
  /// separate Availability Zone as this ensures your EML input is redundant to
  /// AZ issues.
  ///
  /// Parameter [name] :
  /// Name of the input.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  ///
  /// Parameter [sources] :
  /// The source URLs for a PULL-type input. Every PULL type input needs
  /// exactly two source URLs for redundancy.
  /// Only specify sources for PULL type Inputs. Leave Destinations empty.
  Future<UpdateInputResponse> updateInput({
    @_s.required String inputId,
    List<InputDestinationRequest> destinations,
    List<InputDeviceRequest> inputDevices,
    List<String> inputSecurityGroups,
    List<MediaConnectFlowRequest> mediaConnectFlows,
    String name,
    String roleArn,
    List<InputSourceRequest> sources,
  }) async {
    ArgumentError.checkNotNull(inputId, 'inputId');
    final $payload = <String, dynamic>{
      if (destinations != null) 'destinations': destinations,
      if (inputDevices != null) 'inputDevices': inputDevices,
      if (inputSecurityGroups != null)
        'inputSecurityGroups': inputSecurityGroups,
      if (mediaConnectFlows != null) 'mediaConnectFlows': mediaConnectFlows,
      if (name != null) 'name': name,
      if (roleArn != null) 'roleArn': roleArn,
      if (sources != null) 'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/prod/inputs/${Uri.encodeComponent(inputId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateInputResponse.fromJson(response);
  }

  /// Updates the parameters for the input device.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [inputDeviceId] :
  /// The unique ID of the input device. For example, hd-123456789abcdef.
  ///
  /// Parameter [hdDeviceSettings] :
  /// The settings that you want to apply to the HD input device.
  ///
  /// Parameter [name] :
  /// The name that you assigned to this input device (not the unique ID).
  ///
  /// Parameter [uhdDeviceSettings] :
  /// The settings that you want to apply to the UHD input device.
  Future<UpdateInputDeviceResponse> updateInputDevice({
    @_s.required String inputDeviceId,
    InputDeviceConfigurableSettings hdDeviceSettings,
    String name,
    InputDeviceConfigurableSettings uhdDeviceSettings,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final $payload = <String, dynamic>{
      if (hdDeviceSettings != null) 'hdDeviceSettings': hdDeviceSettings,
      if (name != null) 'name': name,
      if (uhdDeviceSettings != null) 'uhdDeviceSettings': uhdDeviceSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateInputDeviceResponse.fromJson(response);
  }

  /// Update an Input Security Group's Whilelists.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [ConflictException].
  ///
  /// Parameter [inputSecurityGroupId] :
  /// The id of the Input Security Group to update.
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs.
  ///
  /// Parameter [whitelistRules] :
  /// List of IPv4 CIDR addresses to whitelist
  Future<UpdateInputSecurityGroupResponse> updateInputSecurityGroup({
    @_s.required String inputSecurityGroupId,
    Map<String, String> tags,
    List<InputWhitelistRuleCidr> whitelistRules,
  }) async {
    ArgumentError.checkNotNull(inputSecurityGroupId, 'inputSecurityGroupId');
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
      if (whitelistRules != null) 'whitelistRules': whitelistRules,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/prod/inputSecurityGroups/${Uri.encodeComponent(inputSecurityGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateInputSecurityGroupResponse.fromJson(response);
  }

  /// Updates a multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [ConflictException].
  ///
  /// Parameter [multiplexId] :
  /// ID of the multiplex to update.
  ///
  /// Parameter [multiplexSettings] :
  /// The new settings for a multiplex.
  ///
  /// Parameter [name] :
  /// Name of the multiplex.
  Future<UpdateMultiplexResponse> updateMultiplex({
    @_s.required String multiplexId,
    MultiplexSettings multiplexSettings,
    String name,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    final $payload = <String, dynamic>{
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMultiplexResponse.fromJson(response);
  }

  /// Update a program in a multiplex.
  ///
  /// May throw [BadRequestException].
  /// May throw [UnprocessableEntityException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [ConflictException].
  ///
  /// Parameter [multiplexId] :
  /// The ID of the multiplex of the program to update.
  ///
  /// Parameter [programName] :
  /// The name of the program to update.
  ///
  /// Parameter [multiplexProgramSettings] :
  /// The new settings for a multiplex program.
  Future<UpdateMultiplexProgramResponse> updateMultiplexProgram({
    @_s.required String multiplexId,
    @_s.required String programName,
    MultiplexProgramSettings multiplexProgramSettings,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    ArgumentError.checkNotNull(programName, 'programName');
    final $payload = <String, dynamic>{
      if (multiplexProgramSettings != null)
        'multiplexProgramSettings': multiplexProgramSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/prod/multiplexes/${Uri.encodeComponent(multiplexId)}/programs/${Uri.encodeComponent(programName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMultiplexProgramResponse.fromJson(response);
  }

  /// Update reservation.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [NotFoundException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [reservationId] :
  /// Unique reservation ID, e.g. '1234567'
  ///
  /// Parameter [name] :
  /// Name of the reservation
  Future<UpdateReservationResponse> updateReservation({
    @_s.required String reservationId,
    String name,
  }) async {
    ArgumentError.checkNotNull(reservationId, 'reservationId');
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/prod/reservations/${Uri.encodeComponent(reservationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateReservationResponse.fromJson(response);
  }
}

/// Aac Coding Mode
enum AacCodingMode {
  @_s.JsonValue('AD_RECEIVER_MIX')
  adReceiverMix,
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_1_1')
  codingMode_1_1,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
  @_s.JsonValue('CODING_MODE_5_1')
  codingMode_5_1,
}

/// Aac Input Type
enum AacInputType {
  @_s.JsonValue('BROADCASTER_MIXED_AD')
  broadcasterMixedAd,
  @_s.JsonValue('NORMAL')
  normal,
}

/// Aac Profile
enum AacProfile {
  @_s.JsonValue('HEV1')
  hev1,
  @_s.JsonValue('HEV2')
  hev2,
  @_s.JsonValue('LC')
  lc,
}

/// Aac Rate Control Mode
enum AacRateControlMode {
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('VBR')
  vbr,
}

/// Aac Raw Format
enum AacRawFormat {
  @_s.JsonValue('LATM_LOAS')
  latmLoas,
  @_s.JsonValue('NONE')
  none,
}

/// Aac Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AacSettings {
  /// Average bitrate in bits/second. Valid values depend on rate control mode and
  /// profile.
  @_s.JsonKey(name: 'bitrate')
  final double bitrate;

  /// Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control
  /// mode and profile. The adReceiverMix setting receives a stereo description
  /// plus control track and emits a mono AAC encode of the description track,
  /// with control data emitted in the PES header as per ETSI TS 101 154 Annex E.
  @_s.JsonKey(name: 'codingMode')
  final AacCodingMode codingMode;

  /// Set to "broadcasterMixedAd" when input contains pre-mixed main audio + AD
  /// (narration) as a stereo pair.  The Audio Type field (audioType) will be set
  /// to 3, which signals to downstream systems that this stream contains
  /// "broadcaster mixed AD". Note that the input received by the encoder must
  /// contain pre-mixed audio; the encoder does not perform the mixing. The values
  /// in audioTypeControl and audioType (in AudioDescription) are ignored when set
  /// to broadcasterMixedAd.
  ///
  /// Leave set to "normal" when input does not contain pre-mixed audio + AD.
  @_s.JsonKey(name: 'inputType')
  final AacInputType inputType;

  /// AAC Profile.
  @_s.JsonKey(name: 'profile')
  final AacProfile profile;

  /// Rate Control Mode.
  @_s.JsonKey(name: 'rateControlMode')
  final AacRateControlMode rateControlMode;

  /// Sets LATM / LOAS AAC output for raw containers.
  @_s.JsonKey(name: 'rawFormat')
  final AacRawFormat rawFormat;

  /// Sample rate in Hz. Valid values depend on rate control mode and profile.
  @_s.JsonKey(name: 'sampleRate')
  final double sampleRate;

  /// Use MPEG-2 AAC audio instead of MPEG-4 AAC audio for raw or MPEG-2 Transport
  /// Stream containers.
  @_s.JsonKey(name: 'spec')
  final AacSpec spec;

  /// VBR Quality Level - Only used if rateControlMode is VBR.
  @_s.JsonKey(name: 'vbrQuality')
  final AacVbrQuality vbrQuality;

  AacSettings({
    this.bitrate,
    this.codingMode,
    this.inputType,
    this.profile,
    this.rateControlMode,
    this.rawFormat,
    this.sampleRate,
    this.spec,
    this.vbrQuality,
  });
  factory AacSettings.fromJson(Map<String, dynamic> json) =>
      _$AacSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AacSettingsToJson(this);
}

/// Aac Spec
enum AacSpec {
  @_s.JsonValue('MPEG2')
  mpeg2,
  @_s.JsonValue('MPEG4')
  mpeg4,
}

/// Aac Vbr Quality
enum AacVbrQuality {
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM_HIGH')
  mediumHigh,
  @_s.JsonValue('MEDIUM_LOW')
  mediumLow,
}

/// Ac3 Bitstream Mode
enum Ac3BitstreamMode {
  @_s.JsonValue('COMMENTARY')
  commentary,
  @_s.JsonValue('COMPLETE_MAIN')
  completeMain,
  @_s.JsonValue('DIALOGUE')
  dialogue,
  @_s.JsonValue('EMERGENCY')
  emergency,
  @_s.JsonValue('HEARING_IMPAIRED')
  hearingImpaired,
  @_s.JsonValue('MUSIC_AND_EFFECTS')
  musicAndEffects,
  @_s.JsonValue('VISUALLY_IMPAIRED')
  visuallyImpaired,
  @_s.JsonValue('VOICE_OVER')
  voiceOver,
}

/// Ac3 Coding Mode
enum Ac3CodingMode {
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_1_1')
  codingMode_1_1,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
  @_s.JsonValue('CODING_MODE_3_2_LFE')
  codingMode_3_2Lfe,
}

/// Ac3 Drc Profile
enum Ac3DrcProfile {
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('NONE')
  none,
}

/// Ac3 Lfe Filter
enum Ac3LfeFilter {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Ac3 Metadata Control
enum Ac3MetadataControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Ac3 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Ac3Settings {
  /// Average bitrate in bits/second. Valid bitrates depend on the coding mode.
  @_s.JsonKey(name: 'bitrate')
  final double bitrate;

  /// Specifies the bitstream mode (bsmod) for the emitted AC-3 stream. See ATSC
  /// A/52-2012 for background on these values.
  @_s.JsonKey(name: 'bitstreamMode')
  final Ac3BitstreamMode bitstreamMode;

  /// Dolby Digital coding mode. Determines number of channels.
  @_s.JsonKey(name: 'codingMode')
  final Ac3CodingMode codingMode;

  /// Sets the dialnorm for the output. If excluded and input audio is Dolby
  /// Digital, dialnorm will be passed through.
  @_s.JsonKey(name: 'dialnorm')
  final int dialnorm;

  /// If set to filmStandard, adds dynamic range compression signaling to the
  /// output bitstream as defined in the Dolby Digital specification.
  @_s.JsonKey(name: 'drcProfile')
  final Ac3DrcProfile drcProfile;

  /// When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior
  /// to encoding. Only valid in codingMode32Lfe mode.
  @_s.JsonKey(name: 'lfeFilter')
  final Ac3LfeFilter lfeFilter;

  /// When set to "followInput", encoder metadata will be sourced from the DD,
  /// DD+, or DolbyE decoder that supplied this audio data. If audio was not
  /// supplied from one of these streams, then the static metadata settings will
  /// be used.
  @_s.JsonKey(name: 'metadataControl')
  final Ac3MetadataControl metadataControl;

  Ac3Settings({
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dialnorm,
    this.drcProfile,
    this.lfeFilter,
    this.metadataControl,
  });
  factory Ac3Settings.fromJson(Map<String, dynamic> json) =>
      _$Ac3SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Ac3SettingsToJson(this);
}

/// Placeholder documentation for AcceptInputDeviceTransferResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptInputDeviceTransferResponse {
  AcceptInputDeviceTransferResponse();
  factory AcceptInputDeviceTransferResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AcceptInputDeviceTransferResponseFromJson(json);
}

/// Afd Signaling
enum AfdSignaling {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('FIXED')
  fixed,
  @_s.JsonValue('NONE')
  none,
}

/// Ancillary Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AncillarySourceSettings {
  /// Specifies the number (1 to 4) of the captions channel you want to extract
  /// from the ancillary captions. If you plan to convert the ancillary captions
  /// to another format, complete this field. If you plan to choose Embedded as
  /// the captions destination in the output (to pass through all the channels in
  /// the ancillary captions), leave this field blank because MediaLive ignores
  /// the field.
  @_s.JsonKey(name: 'sourceAncillaryChannelNumber')
  final int sourceAncillaryChannelNumber;

  AncillarySourceSettings({
    this.sourceAncillaryChannelNumber,
  });
  factory AncillarySourceSettings.fromJson(Map<String, dynamic> json) =>
      _$AncillarySourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AncillarySourceSettingsToJson(this);
}

/// Archive Container Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ArchiveContainerSettings {
  @_s.JsonKey(name: 'm2tsSettings')
  final M2tsSettings m2tsSettings;
  @_s.JsonKey(name: 'rawSettings')
  final RawSettings rawSettings;

  ArchiveContainerSettings({
    this.m2tsSettings,
    this.rawSettings,
  });
  factory ArchiveContainerSettings.fromJson(Map<String, dynamic> json) =>
      _$ArchiveContainerSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ArchiveContainerSettingsToJson(this);
}

/// Archive Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ArchiveGroupSettings {
  /// A directory and base filename where archive files should be written.
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  /// Number of seconds to write to archive file before closing and starting a new
  /// one.
  @_s.JsonKey(name: 'rolloverInterval')
  final int rolloverInterval;

  ArchiveGroupSettings({
    @_s.required this.destination,
    this.rolloverInterval,
  });
  factory ArchiveGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$ArchiveGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ArchiveGroupSettingsToJson(this);
}

/// Archive Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ArchiveOutputSettings {
  /// Settings specific to the container type of the file.
  @_s.JsonKey(name: 'containerSettings')
  final ArchiveContainerSettings containerSettings;

  /// Output file extension. If excluded, this will be auto-selected from the
  /// container type.
  @_s.JsonKey(name: 'extension')
  final String extension;

  /// String concatenated to the end of the destination filename.  Required for
  /// multiple outputs of the same type.
  @_s.JsonKey(name: 'nameModifier')
  final String nameModifier;

  ArchiveOutputSettings({
    @_s.required this.containerSettings,
    this.extension,
    this.nameModifier,
  });
  factory ArchiveOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$ArchiveOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ArchiveOutputSettingsToJson(this);
}

/// Arib Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AribDestinationSettings {
  AribDestinationSettings();
  factory AribDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$AribDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AribDestinationSettingsToJson(this);
}

/// Arib Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AribSourceSettings {
  AribSourceSettings();
  factory AribSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$AribSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AribSourceSettingsToJson(this);
}

/// Audio Channel Mapping
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioChannelMapping {
  /// Indices and gain values for each input channel that should be remixed into
  /// this output channel.
  @_s.JsonKey(name: 'inputChannelLevels')
  final List<InputChannelLevel> inputChannelLevels;

  /// The index of the output channel being produced.
  @_s.JsonKey(name: 'outputChannel')
  final int outputChannel;

  AudioChannelMapping({
    @_s.required this.inputChannelLevels,
    @_s.required this.outputChannel,
  });
  factory AudioChannelMapping.fromJson(Map<String, dynamic> json) =>
      _$AudioChannelMappingFromJson(json);

  Map<String, dynamic> toJson() => _$AudioChannelMappingToJson(this);
}

/// Audio Codec Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioCodecSettings {
  @_s.JsonKey(name: 'aacSettings')
  final AacSettings aacSettings;
  @_s.JsonKey(name: 'ac3Settings')
  final Ac3Settings ac3Settings;
  @_s.JsonKey(name: 'eac3Settings')
  final Eac3Settings eac3Settings;
  @_s.JsonKey(name: 'mp2Settings')
  final Mp2Settings mp2Settings;
  @_s.JsonKey(name: 'passThroughSettings')
  final PassThroughSettings passThroughSettings;
  @_s.JsonKey(name: 'wavSettings')
  final WavSettings wavSettings;

  AudioCodecSettings({
    this.aacSettings,
    this.ac3Settings,
    this.eac3Settings,
    this.mp2Settings,
    this.passThroughSettings,
    this.wavSettings,
  });
  factory AudioCodecSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioCodecSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioCodecSettingsToJson(this);
}

/// Audio Description
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioDescription {
  /// The name of the AudioSelector used as the source for this AudioDescription.
  @_s.JsonKey(name: 'audioSelectorName')
  final String audioSelectorName;

  /// The name of this AudioDescription. Outputs will use this name to uniquely
  /// identify this AudioDescription.  Description names should be unique within
  /// this Live Event.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Advanced audio normalization settings.
  @_s.JsonKey(name: 'audioNormalizationSettings')
  final AudioNormalizationSettings audioNormalizationSettings;

  /// Applies only if audioTypeControl is useConfigured. The values for audioType
  /// are defined in ISO-IEC 13818-1.
  @_s.JsonKey(name: 'audioType')
  final AudioType audioType;

  /// Determines how audio type is determined.
  /// followInput: If the input contains an ISO 639 audioType, then that value is
  /// passed through to the output. If the input contains no ISO 639 audioType,
  /// the value in Audio Type is included in the output.
  /// useConfigured: The value in Audio Type is included in the output.
  /// Note that this field and audioType are both ignored if inputType is
  /// broadcasterMixedAd.
  @_s.JsonKey(name: 'audioTypeControl')
  final AudioDescriptionAudioTypeControl audioTypeControl;

  /// Audio codec settings.
  @_s.JsonKey(name: 'codecSettings')
  final AudioCodecSettings codecSettings;

  /// RFC 5646 language code representing the language of the audio output track.
  /// Only used if languageControlMode is useConfigured, or there is no ISO 639
  /// language code specified in the input.
  @_s.JsonKey(name: 'languageCode')
  final String languageCode;

  /// Choosing followInput will cause the ISO 639 language code of the output to
  /// follow the ISO 639 language code of the input. The languageCode will be used
  /// when useConfigured is set, or when followInput is selected but there is no
  /// ISO 639 language code specified by the input.
  @_s.JsonKey(name: 'languageCodeControl')
  final AudioDescriptionLanguageCodeControl languageCodeControl;

  /// Settings that control how input audio channels are remixed into the output
  /// audio channels.
  @_s.JsonKey(name: 'remixSettings')
  final RemixSettings remixSettings;

  /// Used for MS Smooth and Apple HLS outputs. Indicates the name displayed by
  /// the player (eg. English, or Director Commentary).
  @_s.JsonKey(name: 'streamName')
  final String streamName;

  AudioDescription({
    @_s.required this.audioSelectorName,
    @_s.required this.name,
    this.audioNormalizationSettings,
    this.audioType,
    this.audioTypeControl,
    this.codecSettings,
    this.languageCode,
    this.languageCodeControl,
    this.remixSettings,
    this.streamName,
  });
  factory AudioDescription.fromJson(Map<String, dynamic> json) =>
      _$AudioDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$AudioDescriptionToJson(this);
}

/// Audio Description Audio Type Control
enum AudioDescriptionAudioTypeControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Audio Description Language Code Control
enum AudioDescriptionLanguageCodeControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Audio Language Selection
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioLanguageSelection {
  /// Selects a specific three-letter language code from within an audio source.
  @_s.JsonKey(name: 'languageCode')
  final String languageCode;

  /// When set to "strict", the transport stream demux strictly identifies audio
  /// streams by their language descriptor. If a PMT update occurs such that an
  /// audio stream matching the initially selected language is no longer present
  /// then mute will be encoded until the language returns. If "loose", then on a
  /// PMT update the demux will choose another audio stream in the program with
  /// the same stream type if it can't find one with the same language.
  @_s.JsonKey(name: 'languageSelectionPolicy')
  final AudioLanguageSelectionPolicy languageSelectionPolicy;

  AudioLanguageSelection({
    @_s.required this.languageCode,
    this.languageSelectionPolicy,
  });
  factory AudioLanguageSelection.fromJson(Map<String, dynamic> json) =>
      _$AudioLanguageSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$AudioLanguageSelectionToJson(this);
}

/// Audio Language Selection Policy
enum AudioLanguageSelectionPolicy {
  @_s.JsonValue('LOOSE')
  loose,
  @_s.JsonValue('STRICT')
  strict,
}

/// Audio Normalization Algorithm
enum AudioNormalizationAlgorithm {
  @_s.JsonValue('ITU_1770_1')
  itu_1770_1,
  @_s.JsonValue('ITU_1770_2')
  itu_1770_2,
}

/// Audio Normalization Algorithm Control
enum AudioNormalizationAlgorithmControl {
  @_s.JsonValue('CORRECT_AUDIO')
  correctAudio,
}

/// Audio Normalization Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioNormalizationSettings {
  /// Audio normalization algorithm to use. itu17701 conforms to the CALM Act
  /// specification, itu17702 conforms to the EBU R-128 specification.
  @_s.JsonKey(name: 'algorithm')
  final AudioNormalizationAlgorithm algorithm;

  /// When set to correctAudio the output audio is corrected using the chosen
  /// algorithm. If set to measureOnly, the audio will be measured but not
  /// adjusted.
  @_s.JsonKey(name: 'algorithmControl')
  final AudioNormalizationAlgorithmControl algorithmControl;

  /// Target LKFS(loudness) to adjust volume to. If no value is entered, a default
  /// value will be used according to the chosen algorithm.  The CALM Act (1770-1)
  /// recommends a target of -24 LKFS. The EBU R-128 specification (1770-2)
  /// recommends a target of -23 LKFS.
  @_s.JsonKey(name: 'targetLkfs')
  final double targetLkfs;

  AudioNormalizationSettings({
    this.algorithm,
    this.algorithmControl,
    this.targetLkfs,
  });
  factory AudioNormalizationSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioNormalizationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioNormalizationSettingsToJson(this);
}

/// Audio Only Hls Segment Type
enum AudioOnlyHlsSegmentType {
  @_s.JsonValue('AAC')
  aac,
  @_s.JsonValue('FMP4')
  fmp4,
}

/// Audio Only Hls Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioOnlyHlsSettings {
  /// Specifies the group to which the audio Rendition belongs.
  @_s.JsonKey(name: 'audioGroupId')
  final String audioGroupId;

  /// Optional. Specifies the .jpg or .png image to use as the cover art for an
  /// audio-only output. We recommend a low bit-size file because the image
  /// increases the output audio bandwidth.
  ///
  /// The image is attached to the audio as an ID3 tag, frame type APIC, picture
  /// type 0x10, as per the "ID3 tag version 2.4.0 - Native Frames" standard.
  @_s.JsonKey(name: 'audioOnlyImage')
  final InputLocation audioOnlyImage;

  /// Four types of audio-only tracks are supported:
  ///
  /// Audio-Only Variant Stream
  /// The client can play back this audio-only stream instead of video in
  /// low-bandwidth scenarios. Represented as an EXT-X-STREAM-INF in the HLS
  /// manifest.
  ///
  /// Alternate Audio, Auto Select, Default
  /// Alternate rendition that the client should try to play back by default.
  /// Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=YES,
  /// AUTOSELECT=YES
  ///
  /// Alternate Audio, Auto Select, Not Default
  /// Alternate rendition that the client may try to play back by default.
  /// Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO,
  /// AUTOSELECT=YES
  ///
  /// Alternate Audio, not Auto Select
  /// Alternate rendition that the client will not try to play back by default.
  /// Represented as an EXT-X-MEDIA in the HLS manifest with DEFAULT=NO,
  /// AUTOSELECT=NO
  @_s.JsonKey(name: 'audioTrackType')
  final AudioOnlyHlsTrackType audioTrackType;

  /// Specifies the segment type.
  @_s.JsonKey(name: 'segmentType')
  final AudioOnlyHlsSegmentType segmentType;

  AudioOnlyHlsSettings({
    this.audioGroupId,
    this.audioOnlyImage,
    this.audioTrackType,
    this.segmentType,
  });
  factory AudioOnlyHlsSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioOnlyHlsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioOnlyHlsSettingsToJson(this);
}

/// Audio Only Hls Track Type
enum AudioOnlyHlsTrackType {
  @_s.JsonValue('ALTERNATE_AUDIO_AUTO_SELECT')
  alternateAudioAutoSelect,
  @_s.JsonValue('ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT')
  alternateAudioAutoSelectDefault,
  @_s.JsonValue('ALTERNATE_AUDIO_NOT_AUTO_SELECT')
  alternateAudioNotAutoSelect,
  @_s.JsonValue('AUDIO_ONLY_VARIANT_STREAM')
  audioOnlyVariantStream,
}

/// Audio Pid Selection
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioPidSelection {
  /// Selects a specific PID from within a source.
  @_s.JsonKey(name: 'pid')
  final int pid;

  AudioPidSelection({
    @_s.required this.pid,
  });
  factory AudioPidSelection.fromJson(Map<String, dynamic> json) =>
      _$AudioPidSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$AudioPidSelectionToJson(this);
}

/// Audio Selector
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioSelector {
  /// The name of this AudioSelector. AudioDescriptions will use this name to
  /// uniquely identify this Selector.  Selector names should be unique per input.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The audio selector settings.
  @_s.JsonKey(name: 'selectorSettings')
  final AudioSelectorSettings selectorSettings;

  AudioSelector({
    @_s.required this.name,
    this.selectorSettings,
  });
  factory AudioSelector.fromJson(Map<String, dynamic> json) =>
      _$AudioSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSelectorToJson(this);
}

/// Audio Selector Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioSelectorSettings {
  @_s.JsonKey(name: 'audioLanguageSelection')
  final AudioLanguageSelection audioLanguageSelection;
  @_s.JsonKey(name: 'audioPidSelection')
  final AudioPidSelection audioPidSelection;
  @_s.JsonKey(name: 'audioTrackSelection')
  final AudioTrackSelection audioTrackSelection;

  AudioSelectorSettings({
    this.audioLanguageSelection,
    this.audioPidSelection,
    this.audioTrackSelection,
  });
  factory AudioSelectorSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioSelectorSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSelectorSettingsToJson(this);
}

/// Placeholder documentation for AudioSilenceFailoverSettings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioSilenceFailoverSettings {
  /// The name of the audio selector in the input that MediaLive should monitor to
  /// detect silence. Select your most important rendition. If you didn't create
  /// an audio selector in this input, leave blank.
  @_s.JsonKey(name: 'audioSelectorName')
  final String audioSelectorName;

  /// The amount of time (in milliseconds) that the active input must be silent
  /// before automatic input failover occurs. Silence is defined as audio loss or
  /// audio quieter than -50 dBFS.
  @_s.JsonKey(name: 'audioSilenceThresholdMsec')
  final int audioSilenceThresholdMsec;

  AudioSilenceFailoverSettings({
    @_s.required this.audioSelectorName,
    this.audioSilenceThresholdMsec,
  });
  factory AudioSilenceFailoverSettings.fromJson(Map<String, dynamic> json) =>
      _$AudioSilenceFailoverSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AudioSilenceFailoverSettingsToJson(this);
}

/// Audio Track
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioTrack {
  /// 1-based integer value that maps to a specific audio track
  @_s.JsonKey(name: 'track')
  final int track;

  AudioTrack({
    @_s.required this.track,
  });
  factory AudioTrack.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackFromJson(json);

  Map<String, dynamic> toJson() => _$AudioTrackToJson(this);
}

/// Audio Track Selection
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AudioTrackSelection {
  /// Selects one or more unique audio tracks from within a source.
  @_s.JsonKey(name: 'tracks')
  final List<AudioTrack> tracks;

  AudioTrackSelection({
    @_s.required this.tracks,
  });
  factory AudioTrackSelection.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackSelectionFromJson(json);

  Map<String, dynamic> toJson() => _$AudioTrackSelectionToJson(this);
}

/// Audio Type
enum AudioType {
  @_s.JsonValue('CLEAN_EFFECTS')
  cleanEffects,
  @_s.JsonValue('HEARING_IMPAIRED')
  hearingImpaired,
  @_s.JsonValue('UNDEFINED')
  undefined,
  @_s.JsonValue('VISUAL_IMPAIRED_COMMENTARY')
  visualImpairedCommentary,
}

/// Authentication Scheme
enum AuthenticationScheme {
  @_s.JsonValue('AKAMAI')
  akamai,
  @_s.JsonValue('COMMON')
  common,
}

/// The settings for Automatic Input Failover.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutomaticInputFailoverSettings {
  /// The input ID of the secondary input in the automatic input failover pair.
  @_s.JsonKey(name: 'secondaryInputId')
  final String secondaryInputId;

  /// This clear time defines the requirement a recovered input must meet to be
  /// considered healthy. The input must have no failover conditions for this
  /// length of time. Enter a time in milliseconds. This value is particularly
  /// important if the input_preference for the failover pair is set to
  /// PRIMARY_INPUT_PREFERRED, because after this time, MediaLive will switch back
  /// to the primary input.
  @_s.JsonKey(name: 'errorClearTimeMsec')
  final int errorClearTimeMsec;

  /// A list of failover conditions. If any of these conditions occur, MediaLive
  /// will perform a failover to the other input.
  @_s.JsonKey(name: 'failoverConditions')
  final List<FailoverCondition> failoverConditions;

  /// Input preference when deciding which input to make active when a previously
  /// failed input has recovered.
  @_s.JsonKey(name: 'inputPreference')
  final InputPreference inputPreference;

  AutomaticInputFailoverSettings({
    @_s.required this.secondaryInputId,
    this.errorClearTimeMsec,
    this.failoverConditions,
    this.inputPreference,
  });
  factory AutomaticInputFailoverSettings.fromJson(Map<String, dynamic> json) =>
      _$AutomaticInputFailoverSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AutomaticInputFailoverSettingsToJson(this);
}

/// Avail Blanking
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AvailBlanking {
  /// Blanking image to be used. Leave empty for solid black. Only bmp and png
  /// images are supported.
  @_s.JsonKey(name: 'availBlankingImage')
  final InputLocation availBlankingImage;

  /// When set to enabled, causes video, audio and captions to be blanked when
  /// insertion metadata is added.
  @_s.JsonKey(name: 'state')
  final AvailBlankingState state;

  AvailBlanking({
    this.availBlankingImage,
    this.state,
  });
  factory AvailBlanking.fromJson(Map<String, dynamic> json) =>
      _$AvailBlankingFromJson(json);

  Map<String, dynamic> toJson() => _$AvailBlankingToJson(this);
}

/// Avail Blanking State
enum AvailBlankingState {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Avail Configuration
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AvailConfiguration {
  /// Ad avail settings.
  @_s.JsonKey(name: 'availSettings')
  final AvailSettings availSettings;

  AvailConfiguration({
    this.availSettings,
  });
  factory AvailConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AvailConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AvailConfigurationToJson(this);
}

/// Avail Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AvailSettings {
  @_s.JsonKey(name: 'scte35SpliceInsert')
  final Scte35SpliceInsert scte35SpliceInsert;
  @_s.JsonKey(name: 'scte35TimeSignalApos')
  final Scte35TimeSignalApos scte35TimeSignalApos;

  AvailSettings({
    this.scte35SpliceInsert,
    this.scte35TimeSignalApos,
  });
  factory AvailSettings.fromJson(Map<String, dynamic> json) =>
      _$AvailSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AvailSettingsToJson(this);
}

/// Placeholder documentation for BatchDeleteResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteResponse {
  /// List of failed operations
  @_s.JsonKey(name: 'failed')
  final List<BatchFailedResultModel> failed;

  /// List of successful operations
  @_s.JsonKey(name: 'successful')
  final List<BatchSuccessfulResultModel> successful;

  BatchDeleteResponse({
    this.failed,
    this.successful,
  });
  factory BatchDeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteResponseFromJson(json);
}

/// Details from a failed operation
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchFailedResultModel {
  /// ARN of the resource
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Error code for the failed operation
  @_s.JsonKey(name: 'code')
  final String code;

  /// ID of the resource
  @_s.JsonKey(name: 'id')
  final String id;

  /// Error message for the failed operation
  @_s.JsonKey(name: 'message')
  final String message;

  BatchFailedResultModel({
    this.arn,
    this.code,
    this.id,
    this.message,
  });
  factory BatchFailedResultModel.fromJson(Map<String, dynamic> json) =>
      _$BatchFailedResultModelFromJson(json);
}

/// A list of schedule actions to create (in a request) or that have been
/// created (in a response).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchScheduleActionCreateRequest {
  /// A list of schedule actions to create.
  @_s.JsonKey(name: 'scheduleActions')
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionCreateRequest({
    @_s.required this.scheduleActions,
  });
  Map<String, dynamic> toJson() =>
      _$BatchScheduleActionCreateRequestToJson(this);
}

/// List of actions that have been created in the schedule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchScheduleActionCreateResult {
  /// List of actions that have been created in the schedule.
  @_s.JsonKey(name: 'scheduleActions')
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionCreateResult({
    @_s.required this.scheduleActions,
  });
  factory BatchScheduleActionCreateResult.fromJson(Map<String, dynamic> json) =>
      _$BatchScheduleActionCreateResultFromJson(json);
}

/// A list of schedule actions to delete.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BatchScheduleActionDeleteRequest {
  /// A list of schedule actions to delete.
  @_s.JsonKey(name: 'actionNames')
  final List<String> actionNames;

  BatchScheduleActionDeleteRequest({
    @_s.required this.actionNames,
  });
  Map<String, dynamic> toJson() =>
      _$BatchScheduleActionDeleteRequestToJson(this);
}

/// List of actions that have been deleted from the schedule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchScheduleActionDeleteResult {
  /// List of actions that have been deleted from the schedule.
  @_s.JsonKey(name: 'scheduleActions')
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionDeleteResult({
    @_s.required this.scheduleActions,
  });
  factory BatchScheduleActionDeleteResult.fromJson(Map<String, dynamic> json) =>
      _$BatchScheduleActionDeleteResultFromJson(json);
}

/// Placeholder documentation for BatchStartResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchStartResponse {
  /// List of failed operations
  @_s.JsonKey(name: 'failed')
  final List<BatchFailedResultModel> failed;

  /// List of successful operations
  @_s.JsonKey(name: 'successful')
  final List<BatchSuccessfulResultModel> successful;

  BatchStartResponse({
    this.failed,
    this.successful,
  });
  factory BatchStartResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchStartResponseFromJson(json);
}

/// Placeholder documentation for BatchStopResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchStopResponse {
  /// List of failed operations
  @_s.JsonKey(name: 'failed')
  final List<BatchFailedResultModel> failed;

  /// List of successful operations
  @_s.JsonKey(name: 'successful')
  final List<BatchSuccessfulResultModel> successful;

  BatchStopResponse({
    this.failed,
    this.successful,
  });
  factory BatchStopResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchStopResponseFromJson(json);
}

/// Details from a successful operation
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchSuccessfulResultModel {
  /// ARN of the resource
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// ID of the resource
  @_s.JsonKey(name: 'id')
  final String id;

  /// Current state of the resource
  @_s.JsonKey(name: 'state')
  final String state;

  BatchSuccessfulResultModel({
    this.arn,
    this.id,
    this.state,
  });
  factory BatchSuccessfulResultModel.fromJson(Map<String, dynamic> json) =>
      _$BatchSuccessfulResultModelFromJson(json);
}

/// Placeholder documentation for BatchUpdateScheduleResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateScheduleResponse {
  /// Schedule actions created in the schedule.
  @_s.JsonKey(name: 'creates')
  final BatchScheduleActionCreateResult creates;

  /// Schedule actions deleted from the schedule.
  @_s.JsonKey(name: 'deletes')
  final BatchScheduleActionDeleteResult deletes;

  BatchUpdateScheduleResponse({
    this.creates,
    this.deletes,
  });
  factory BatchUpdateScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateScheduleResponseFromJson(json);
}

/// Blackout Slate
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BlackoutSlate {
  /// Blackout slate image to be used. Leave empty for solid black. Only bmp and
  /// png images are supported.
  @_s.JsonKey(name: 'blackoutSlateImage')
  final InputLocation blackoutSlateImage;

  /// Setting to enabled causes the encoder to blackout the video, audio, and
  /// captions, and raise the "Network Blackout Image" slate when an SCTE104/35
  /// Network End Segmentation Descriptor is encountered. The blackout will be
  /// lifted when the Network Start Segmentation Descriptor is encountered. The
  /// Network End and Network Start descriptors must contain a network ID that
  /// matches the value entered in "Network ID".
  @_s.JsonKey(name: 'networkEndBlackout')
  final BlackoutSlateNetworkEndBlackout networkEndBlackout;

  /// Path to local file to use as Network End Blackout image. Image will be
  /// scaled to fill the entire output raster.
  @_s.JsonKey(name: 'networkEndBlackoutImage')
  final InputLocation networkEndBlackoutImage;

  /// Provides Network ID that matches EIDR ID format (e.g.,
  /// "10.XXXX/XXXX-XXXX-XXXX-XXXX-XXXX-C").
  @_s.JsonKey(name: 'networkId')
  final String networkId;

  /// When set to enabled, causes video, audio and captions to be blanked when
  /// indicated by program metadata.
  @_s.JsonKey(name: 'state')
  final BlackoutSlateState state;

  BlackoutSlate({
    this.blackoutSlateImage,
    this.networkEndBlackout,
    this.networkEndBlackoutImage,
    this.networkId,
    this.state,
  });
  factory BlackoutSlate.fromJson(Map<String, dynamic> json) =>
      _$BlackoutSlateFromJson(json);

  Map<String, dynamic> toJson() => _$BlackoutSlateToJson(this);
}

/// Blackout Slate Network End Blackout
enum BlackoutSlateNetworkEndBlackout {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Blackout Slate State
enum BlackoutSlateState {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Burn In Alignment
enum BurnInAlignment {
  @_s.JsonValue('CENTERED')
  centered,
  @_s.JsonValue('LEFT')
  left,
  @_s.JsonValue('SMART')
  smart,
}

/// Burn In Background Color
enum BurnInBackgroundColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('WHITE')
  white,
}

/// Burn In Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BurnInDestinationSettings {
  /// If no explicit xPosition or yPosition is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. Selecting "smart" justification will
  /// left-justify live subtitles and center-justify pre-recorded subtitles.  All
  /// burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'alignment')
  final BurnInAlignment alignment;

  /// Specifies the color of the rectangle behind the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundColor')
  final BurnInBackgroundColor backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter out is equivalent to setting it to 0
  /// (transparent).  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundOpacity')
  final int backgroundOpacity;

  /// External font file used for caption burn-in. File extension must be 'ttf' or
  /// 'tte'.  Although the user can select output fonts for many different types
  /// of input captions,  embedded, STL and teletext sources use a strict grid
  /// system. Using external fonts with these caption sources could cause
  /// unexpected display of proportional fonts.  All burn-in and DVB-Sub font
  /// settings must match.
  @_s.JsonKey(name: 'font')
  final InputLocation font;

  /// Specifies the color of the burned-in captions.  This option is not valid for
  /// source captions that are STL, 608/embedded or teletext.  These source
  /// settings are already pre-defined by the caption stream.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontColor')
  final BurnInFontColor fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontOpacity')
  final int fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontResolution')
  final int fontResolution;

  /// When set to 'auto' fontSize will scale depending on the size of the output.
  /// Giving a positive integer will specify the exact font size in points.  All
  /// burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontSize')
  final String fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  @_s.JsonKey(name: 'outlineColor')
  final BurnInOutlineColor outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  @_s.JsonKey(name: 'outlineSize')
  final int outlineSize;

  /// Specifies the color of the shadow cast by the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowColor')
  final BurnInShadowColor shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter out is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowOpacity')
  final int shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowXOffset')
  final int shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text.  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowYOffset')
  final int shadowYOffset;

  /// Controls whether a fixed grid size will be used to generate the output
  /// subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in
  /// outputs.
  @_s.JsonKey(name: 'teletextGridControl')
  final BurnInTeletextGridControl teletextGridControl;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit xPosition is provided,
  /// the horizontal caption position will be determined by the alignment
  /// parameter.  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'xPosition')
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit yPosition is provided, the
  /// caption will be positioned towards the bottom of the output.  All burn-in
  /// and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'yPosition')
  final int yPosition;

  BurnInDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.font,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowXOffset,
    this.shadowYOffset,
    this.teletextGridControl,
    this.xPosition,
    this.yPosition,
  });
  factory BurnInDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$BurnInDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$BurnInDestinationSettingsToJson(this);
}

/// Burn In Font Color
enum BurnInFontColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('BLUE')
  blue,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('YELLOW')
  yellow,
}

/// Burn In Outline Color
enum BurnInOutlineColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('BLUE')
  blue,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('YELLOW')
  yellow,
}

/// Burn In Shadow Color
enum BurnInShadowColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('WHITE')
  white,
}

/// Burn In Teletext Grid Control
enum BurnInTeletextGridControl {
  @_s.JsonValue('FIXED')
  fixed,
  @_s.JsonValue('SCALED')
  scaled,
}

/// Placeholder documentation for CancelInputDeviceTransferResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelInputDeviceTransferResponse {
  CancelInputDeviceTransferResponse();
  factory CancelInputDeviceTransferResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelInputDeviceTransferResponseFromJson(json);
}

/// Caption Description
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionDescription {
  /// Specifies which input caption selector to use as a caption source when
  /// generating output captions. This field should match a captionSelector name.
  @_s.JsonKey(name: 'captionSelectorName')
  final String captionSelectorName;

  /// Name of the caption description.  Used to associate a caption description
  /// with an output.  Names must be unique within an event.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Additional settings for captions destination that depend on the destination
  /// type.
  @_s.JsonKey(name: 'destinationSettings')
  final CaptionDestinationSettings destinationSettings;

  /// ISO 639-2 three-digit code: http://www.loc.gov/standards/iso639-2/
  @_s.JsonKey(name: 'languageCode')
  final String languageCode;

  /// Human readable information to indicate captions available for players (eg.
  /// English, or Spanish).
  @_s.JsonKey(name: 'languageDescription')
  final String languageDescription;

  CaptionDescription({
    @_s.required this.captionSelectorName,
    @_s.required this.name,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });
  factory CaptionDescription.fromJson(Map<String, dynamic> json) =>
      _$CaptionDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionDescriptionToJson(this);
}

/// Caption Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionDestinationSettings {
  @_s.JsonKey(name: 'aribDestinationSettings')
  final AribDestinationSettings aribDestinationSettings;
  @_s.JsonKey(name: 'burnInDestinationSettings')
  final BurnInDestinationSettings burnInDestinationSettings;
  @_s.JsonKey(name: 'dvbSubDestinationSettings')
  final DvbSubDestinationSettings dvbSubDestinationSettings;
  @_s.JsonKey(name: 'ebuTtDDestinationSettings')
  final EbuTtDDestinationSettings ebuTtDDestinationSettings;
  @_s.JsonKey(name: 'embeddedDestinationSettings')
  final EmbeddedDestinationSettings embeddedDestinationSettings;
  @_s.JsonKey(name: 'embeddedPlusScte20DestinationSettings')
  final EmbeddedPlusScte20DestinationSettings
      embeddedPlusScte20DestinationSettings;
  @_s.JsonKey(name: 'rtmpCaptionInfoDestinationSettings')
  final RtmpCaptionInfoDestinationSettings rtmpCaptionInfoDestinationSettings;
  @_s.JsonKey(name: 'scte20PlusEmbeddedDestinationSettings')
  final Scte20PlusEmbeddedDestinationSettings
      scte20PlusEmbeddedDestinationSettings;
  @_s.JsonKey(name: 'scte27DestinationSettings')
  final Scte27DestinationSettings scte27DestinationSettings;
  @_s.JsonKey(name: 'smpteTtDestinationSettings')
  final SmpteTtDestinationSettings smpteTtDestinationSettings;
  @_s.JsonKey(name: 'teletextDestinationSettings')
  final TeletextDestinationSettings teletextDestinationSettings;
  @_s.JsonKey(name: 'ttmlDestinationSettings')
  final TtmlDestinationSettings ttmlDestinationSettings;
  @_s.JsonKey(name: 'webvttDestinationSettings')
  final WebvttDestinationSettings webvttDestinationSettings;

  CaptionDestinationSettings({
    this.aribDestinationSettings,
    this.burnInDestinationSettings,
    this.dvbSubDestinationSettings,
    this.ebuTtDDestinationSettings,
    this.embeddedDestinationSettings,
    this.embeddedPlusScte20DestinationSettings,
    this.rtmpCaptionInfoDestinationSettings,
    this.scte20PlusEmbeddedDestinationSettings,
    this.scte27DestinationSettings,
    this.smpteTtDestinationSettings,
    this.teletextDestinationSettings,
    this.ttmlDestinationSettings,
    this.webvttDestinationSettings,
  });
  factory CaptionDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$CaptionDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionDestinationSettingsToJson(this);
}

/// Maps a caption channel to an ISO 693-2 language code
/// (http://www.loc.gov/standards/iso639-2), with an optional description.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionLanguageMapping {
  /// The closed caption channel being described by this CaptionLanguageMapping.
  /// Each channel mapping must have a unique channel number (maximum of 4)
  @_s.JsonKey(name: 'captionChannel')
  final int captionChannel;

  /// Three character ISO 639-2 language code (see
  /// http://www.loc.gov/standards/iso639-2)
  @_s.JsonKey(name: 'languageCode')
  final String languageCode;

  /// Textual description of language
  @_s.JsonKey(name: 'languageDescription')
  final String languageDescription;

  CaptionLanguageMapping({
    @_s.required this.captionChannel,
    @_s.required this.languageCode,
    @_s.required this.languageDescription,
  });
  factory CaptionLanguageMapping.fromJson(Map<String, dynamic> json) =>
      _$CaptionLanguageMappingFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionLanguageMappingToJson(this);
}

/// Output groups for this Live Event. Output groups contain information about
/// where streams should be distributed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionSelector {
  /// Name identifier for a caption selector.  This name is used to associate this
  /// caption selector with one or more caption descriptions.  Names must be
  /// unique within an event.
  @_s.JsonKey(name: 'name')
  final String name;

  /// When specified this field indicates the three letter language code of the
  /// caption track to extract from the source.
  @_s.JsonKey(name: 'languageCode')
  final String languageCode;

  /// Caption selector settings.
  @_s.JsonKey(name: 'selectorSettings')
  final CaptionSelectorSettings selectorSettings;

  CaptionSelector({
    @_s.required this.name,
    this.languageCode,
    this.selectorSettings,
  });
  factory CaptionSelector.fromJson(Map<String, dynamic> json) =>
      _$CaptionSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionSelectorToJson(this);
}

/// Caption Selector Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptionSelectorSettings {
  @_s.JsonKey(name: 'ancillarySourceSettings')
  final AncillarySourceSettings ancillarySourceSettings;
  @_s.JsonKey(name: 'aribSourceSettings')
  final AribSourceSettings aribSourceSettings;
  @_s.JsonKey(name: 'dvbSubSourceSettings')
  final DvbSubSourceSettings dvbSubSourceSettings;
  @_s.JsonKey(name: 'embeddedSourceSettings')
  final EmbeddedSourceSettings embeddedSourceSettings;
  @_s.JsonKey(name: 'scte20SourceSettings')
  final Scte20SourceSettings scte20SourceSettings;
  @_s.JsonKey(name: 'scte27SourceSettings')
  final Scte27SourceSettings scte27SourceSettings;
  @_s.JsonKey(name: 'teletextSourceSettings')
  final TeletextSourceSettings teletextSourceSettings;

  CaptionSelectorSettings({
    this.ancillarySourceSettings,
    this.aribSourceSettings,
    this.dvbSubSourceSettings,
    this.embeddedSourceSettings,
    this.scte20SourceSettings,
    this.scte27SourceSettings,
    this.teletextSourceSettings,
  });
  factory CaptionSelectorSettings.fromJson(Map<String, dynamic> json) =>
      _$CaptionSelectorSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$CaptionSelectorSettingsToJson(this);
}

/// Maximum CDI input resolution; SD is 480i and 576i up to 30 frames-per-second
/// (fps), HD is 720p up to 60 fps / 1080i up to 30 fps, FHD is 1080p up to 60
/// fps, UHD is 2160p up to 60 fps
enum CdiInputResolution {
  @_s.JsonValue('SD')
  sd,
  @_s.JsonValue('HD')
  hd,
  @_s.JsonValue('FHD')
  fhd,
  @_s.JsonValue('UHD')
  uhd,
}

/// Placeholder documentation for CdiInputSpecification
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CdiInputSpecification {
  /// Maximum CDI input resolution
  @_s.JsonKey(name: 'resolution')
  final CdiInputResolution resolution;

  CdiInputSpecification({
    this.resolution,
  });
  factory CdiInputSpecification.fromJson(Map<String, dynamic> json) =>
      _$CdiInputSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$CdiInputSpecificationToJson(this);
}

/// Placeholder documentation for Channel
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Channel {
  /// The unique arn of the channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specification of CDI inputs for this channel
  @_s.JsonKey(name: 'cdiInputSpecification')
  final CdiInputSpecification cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  @_s.JsonKey(name: 'channelClass')
  final ChannelClass channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  @_s.JsonKey(name: 'destinations')
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  @_s.JsonKey(name: 'egressEndpoints')
  final List<ChannelEgressEndpoint> egressEndpoints;
  @_s.JsonKey(name: 'encoderSettings')
  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  @_s.JsonKey(name: 'id')
  final String id;

  /// List of input attachments for channel.
  @_s.JsonKey(name: 'inputAttachments')
  final List<InputAttachment> inputAttachments;

  /// Specification of network and file inputs for this channel
  @_s.JsonKey(name: 'inputSpecification')
  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The name of the channel. (user-mutable)
  @_s.JsonKey(name: 'name')
  final String name;

  /// Runtime details for the pipelines of a running channel.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;
  @_s.JsonKey(name: 'state')
  final ChannelState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  Channel({
    this.arn,
    this.cdiInputSpecification,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

/// A standard channel has two encoding pipelines and a single pipeline channel
/// only has one.
enum ChannelClass {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('SINGLE_PIPELINE')
  singlePipeline,
}

extension on ChannelClass {
  String toValue() {
    switch (this) {
      case ChannelClass.standard:
        return 'STANDARD';
      case ChannelClass.singlePipeline:
        return 'SINGLE_PIPELINE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Placeholder documentation for ChannelEgressEndpoint
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelEgressEndpoint {
  /// Public IP of where a channel's output comes from
  @_s.JsonKey(name: 'sourceIp')
  final String sourceIp;

  ChannelEgressEndpoint({
    this.sourceIp,
  });
  factory ChannelEgressEndpoint.fromJson(Map<String, dynamic> json) =>
      _$ChannelEgressEndpointFromJson(json);
}

/// Placeholder documentation for ChannelState
enum ChannelState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('IDLE')
  idle,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('RECOVERING')
  recovering,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('UPDATE_FAILED')
  updateFailed,
}

/// Placeholder documentation for ChannelSummary
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelSummary {
  /// The unique arn of the channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specification of CDI inputs for this channel
  @_s.JsonKey(name: 'cdiInputSpecification')
  final CdiInputSpecification cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  @_s.JsonKey(name: 'channelClass')
  final ChannelClass channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  @_s.JsonKey(name: 'destinations')
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  @_s.JsonKey(name: 'egressEndpoints')
  final List<ChannelEgressEndpoint> egressEndpoints;

  /// The unique id of the channel.
  @_s.JsonKey(name: 'id')
  final String id;

  /// List of input attachments for channel.
  @_s.JsonKey(name: 'inputAttachments')
  final List<InputAttachment> inputAttachments;

  /// Specification of network and file inputs for this channel
  @_s.JsonKey(name: 'inputSpecification')
  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The name of the channel. (user-mutable)
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;
  @_s.JsonKey(name: 'state')
  final ChannelState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ChannelSummary({
    this.arn,
    this.cdiInputSpecification,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  factory ChannelSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelSummaryFromJson(json);
}

/// Passthrough applies no color space conversion to the output
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColorSpacePassthroughSettings {
  ColorSpacePassthroughSettings();
  factory ColorSpacePassthroughSettings.fromJson(Map<String, dynamic> json) =>
      _$ColorSpacePassthroughSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ColorSpacePassthroughSettingsToJson(this);
}

/// Placeholder documentation for CreateChannelResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateChannelResponse {
  @_s.JsonKey(name: 'channel')
  final Channel channel;

  CreateChannelResponse({
    this.channel,
  });
  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelResponseFromJson(json);
}

/// Placeholder documentation for CreateInputResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInputResponse {
  @_s.JsonKey(name: 'input')
  final Input input;

  CreateInputResponse({
    this.input,
  });
  factory CreateInputResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateInputResponseFromJson(json);
}

/// Placeholder documentation for CreateInputSecurityGroupResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInputSecurityGroupResponse {
  @_s.JsonKey(name: 'securityGroup')
  final InputSecurityGroup securityGroup;

  CreateInputSecurityGroupResponse({
    this.securityGroup,
  });
  factory CreateInputSecurityGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateInputSecurityGroupResponseFromJson(json);
}

/// Placeholder documentation for CreateMultiplexProgramResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMultiplexProgramResponse {
  /// The newly created multiplex program.
  @_s.JsonKey(name: 'multiplexProgram')
  final MultiplexProgram multiplexProgram;

  CreateMultiplexProgramResponse({
    this.multiplexProgram,
  });
  factory CreateMultiplexProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMultiplexProgramResponseFromJson(json);
}

/// Placeholder documentation for CreateMultiplexResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMultiplexResponse {
  /// The newly created multiplex.
  @_s.JsonKey(name: 'multiplex')
  final Multiplex multiplex;

  CreateMultiplexResponse({
    this.multiplex,
  });
  factory CreateMultiplexResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMultiplexResponseFromJson(json);
}

/// Placeholder documentation for DeleteChannelResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteChannelResponse {
  /// The unique arn of the channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specification of CDI inputs for this channel
  @_s.JsonKey(name: 'cdiInputSpecification')
  final CdiInputSpecification cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  @_s.JsonKey(name: 'channelClass')
  final ChannelClass channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  @_s.JsonKey(name: 'destinations')
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  @_s.JsonKey(name: 'egressEndpoints')
  final List<ChannelEgressEndpoint> egressEndpoints;
  @_s.JsonKey(name: 'encoderSettings')
  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  @_s.JsonKey(name: 'id')
  final String id;

  /// List of input attachments for channel.
  @_s.JsonKey(name: 'inputAttachments')
  final List<InputAttachment> inputAttachments;

  /// Specification of network and file inputs for this channel
  @_s.JsonKey(name: 'inputSpecification')
  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The name of the channel. (user-mutable)
  @_s.JsonKey(name: 'name')
  final String name;

  /// Runtime details for the pipelines of a running channel.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;
  @_s.JsonKey(name: 'state')
  final ChannelState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DeleteChannelResponse({
    this.arn,
    this.cdiInputSpecification,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  factory DeleteChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteChannelResponseFromJson(json);
}

/// Placeholder documentation for DeleteInputResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInputResponse {
  DeleteInputResponse();
  factory DeleteInputResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInputResponseFromJson(json);
}

/// Placeholder documentation for DeleteInputSecurityGroupResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInputSecurityGroupResponse {
  DeleteInputSecurityGroupResponse();
  factory DeleteInputSecurityGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteInputSecurityGroupResponseFromJson(json);
}

/// Placeholder documentation for DeleteMultiplexProgramResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMultiplexProgramResponse {
  /// The MediaLive channel associated with the program.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  /// The settings for this multiplex program.
  @_s.JsonKey(name: 'multiplexProgramSettings')
  final MultiplexProgramSettings multiplexProgramSettings;

  /// The packet identifier map for this multiplex program.
  @_s.JsonKey(name: 'packetIdentifiersMap')
  final MultiplexProgramPacketIdentifiersMap packetIdentifiersMap;

  /// Contains information about the current sources for the specified program in
  /// the specified multiplex. Keep in mind that each multiplex pipeline connects
  /// to both pipelines in a given source channel (the channel identified by the
  /// program). But only one of those channel pipelines is ever active at one
  /// time.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<MultiplexProgramPipelineDetail> pipelineDetails;

  /// The name of the multiplex program.
  @_s.JsonKey(name: 'programName')
  final String programName;

  DeleteMultiplexProgramResponse({
    this.channelId,
    this.multiplexProgramSettings,
    this.packetIdentifiersMap,
    this.pipelineDetails,
    this.programName,
  });
  factory DeleteMultiplexProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMultiplexProgramResponseFromJson(json);
}

/// Placeholder documentation for DeleteMultiplexResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteMultiplexResponse {
  /// The unique arn of the multiplex.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of availability zones for the multiplex.
  @_s.JsonKey(name: 'availabilityZones')
  final List<String> availabilityZones;

  /// A list of the multiplex output destinations.
  @_s.JsonKey(name: 'destinations')
  final List<MultiplexOutputDestination> destinations;

  /// The unique id of the multiplex.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Configuration for a multiplex event.
  @_s.JsonKey(name: 'multiplexSettings')
  final MultiplexSettings multiplexSettings;

  /// The name of the multiplex.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The number of programs in the multiplex.
  @_s.JsonKey(name: 'programCount')
  final int programCount;

  /// The current state of the multiplex.
  @_s.JsonKey(name: 'state')
  final MultiplexState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DeleteMultiplexResponse({
    this.arn,
    this.availabilityZones,
    this.destinations,
    this.id,
    this.multiplexSettings,
    this.name,
    this.pipelinesRunningCount,
    this.programCount,
    this.state,
    this.tags,
  });
  factory DeleteMultiplexResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteMultiplexResponseFromJson(json);
}

/// Placeholder documentation for DeleteReservationResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReservationResponse {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Number of reserved resources
  @_s.JsonKey(name: 'count')
  final int count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  @_s.JsonKey(name: 'currencyCode')
  final String currencyCode;

  /// Lease duration, e.g. '12'
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  @_s.JsonKey(name: 'durationUnits')
  final OfferingDurationUnits durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  @_s.JsonKey(name: 'end')
  final String end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  @_s.JsonKey(name: 'fixedPrice')
  final double fixedPrice;

  /// User specified reservation name
  @_s.JsonKey(name: 'name')
  final String name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  @_s.JsonKey(name: 'offeringDescription')
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  @_s.JsonKey(name: 'offeringType')
  final OfferingType offeringType;

  /// AWS region, e.g. 'us-west-2'
  @_s.JsonKey(name: 'region')
  final String region;

  /// Unique reservation ID, e.g. '1234567'
  @_s.JsonKey(name: 'reservationId')
  final String reservationId;

  /// Resource configuration details
  @_s.JsonKey(name: 'resourceSpecification')
  final ReservationResourceSpecification resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  @_s.JsonKey(name: 'start')
  final String start;

  /// Current state of reservation, e.g. 'ACTIVE'
  @_s.JsonKey(name: 'state')
  final ReservationState state;

  /// A collection of key-value pairs
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  @_s.JsonKey(name: 'usagePrice')
  final double usagePrice;

  DeleteReservationResponse({
    this.arn,
    this.count,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.end,
    this.fixedPrice,
    this.name,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.reservationId,
    this.resourceSpecification,
    this.start,
    this.state,
    this.tags,
    this.usagePrice,
  });
  factory DeleteReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteReservationResponseFromJson(json);
}

/// Placeholder documentation for DeleteScheduleResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteScheduleResponse {
  DeleteScheduleResponse();
  factory DeleteScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteScheduleResponseFromJson(json);
}

/// Placeholder documentation for DescribeChannelResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelResponse {
  /// The unique arn of the channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specification of CDI inputs for this channel
  @_s.JsonKey(name: 'cdiInputSpecification')
  final CdiInputSpecification cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  @_s.JsonKey(name: 'channelClass')
  final ChannelClass channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  @_s.JsonKey(name: 'destinations')
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  @_s.JsonKey(name: 'egressEndpoints')
  final List<ChannelEgressEndpoint> egressEndpoints;
  @_s.JsonKey(name: 'encoderSettings')
  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  @_s.JsonKey(name: 'id')
  final String id;

  /// List of input attachments for channel.
  @_s.JsonKey(name: 'inputAttachments')
  final List<InputAttachment> inputAttachments;

  /// Specification of network and file inputs for this channel
  @_s.JsonKey(name: 'inputSpecification')
  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The name of the channel. (user-mutable)
  @_s.JsonKey(name: 'name')
  final String name;

  /// Runtime details for the pipelines of a running channel.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;
  @_s.JsonKey(name: 'state')
  final ChannelState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeChannelResponse({
    this.arn,
    this.cdiInputSpecification,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeChannelResponseFromJson(json);
}

/// Placeholder documentation for DescribeInputDeviceResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInputDeviceResponse {
  /// The unique ARN of the input device.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The state of the connection between the input device and AWS.
  @_s.JsonKey(name: 'connectionState')
  final InputDeviceConnectionState connectionState;

  /// The status of the action to synchronize the device configuration. If you
  /// change the configuration of the input device (for example, the maximum
  /// bitrate), MediaLive sends the new data to the device. The device might not
  /// update itself immediately. SYNCED means the device has updated its
  /// configuration. SYNCING means that it has not updated its configuration.
  @_s.JsonKey(name: 'deviceSettingsSyncState')
  final DeviceSettingsSyncState deviceSettingsSyncState;

  /// The status of software on the input device.
  @_s.JsonKey(name: 'deviceUpdateStatus')
  final DeviceUpdateStatus deviceUpdateStatus;

  /// Settings that describe an input device that is type HD.
  @_s.JsonKey(name: 'hdDeviceSettings')
  final InputDeviceHdSettings hdDeviceSettings;

  /// The unique ID of the input device.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The network MAC address of the input device.
  @_s.JsonKey(name: 'macAddress')
  final String macAddress;

  /// A name that you specify for the input device.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The network settings for the input device.
  @_s.JsonKey(name: 'networkSettings')
  final InputDeviceNetworkSettings networkSettings;

  /// The unique serial number of the input device.
  @_s.JsonKey(name: 'serialNumber')
  final String serialNumber;

  /// The type of the input device.
  @_s.JsonKey(name: 'type')
  final InputDeviceType type;

  /// Settings that describe an input device that is type UHD.
  @_s.JsonKey(name: 'uhdDeviceSettings')
  final InputDeviceUhdSettings uhdDeviceSettings;

  DescribeInputDeviceResponse({
    this.arn,
    this.connectionState,
    this.deviceSettingsSyncState,
    this.deviceUpdateStatus,
    this.hdDeviceSettings,
    this.id,
    this.macAddress,
    this.name,
    this.networkSettings,
    this.serialNumber,
    this.type,
    this.uhdDeviceSettings,
  });
  factory DescribeInputDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeInputDeviceResponseFromJson(json);
}

/// Placeholder documentation for DescribeInputDeviceThumbnailResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInputDeviceThumbnailResponse {
  /// The binary data for the thumbnail that the Link device has most recently
  /// sent to MediaLive.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'body')
  final Uint8List body;

  /// The length of the content.
  @_s.JsonKey(name: 'Content-Length')
  final int contentLength;

  /// Specifies the media type of the thumbnail.
  @_s.JsonKey(name: 'Content-Type')
  final ContentType contentType;

  /// The unique, cacheable version of this thumbnail.
  @_s.JsonKey(name: 'ETag')
  final String eTag;

  /// The date and time the thumbnail was last updated at the device.
  @RfcDateTimeConverter()
  @_s.JsonKey(name: 'Last-Modified')
  final DateTime lastModified;

  DescribeInputDeviceThumbnailResponse({
    this.body,
    this.contentLength,
    this.contentType,
    this.eTag,
    this.lastModified,
  });
  factory DescribeInputDeviceThumbnailResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInputDeviceThumbnailResponseFromJson(json);
}

/// Placeholder documentation for DescribeInputResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInputResponse {
  /// The Unique ARN of the input (generated, immutable).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of channel IDs that that input is attached to (currently an input can
  /// only be attached to one channel).
  @_s.JsonKey(name: 'attachedChannels')
  final List<String> attachedChannels;

  /// A list of the destinations of the input (PUSH-type).
  @_s.JsonKey(name: 'destinations')
  final List<InputDestination> destinations;

  /// The generated ID of the input (unique for user account, immutable).
  @_s.JsonKey(name: 'id')
  final String id;

  /// STANDARD - MediaLive expects two sources to be connected to this input. If
  /// the channel is also STANDARD, both sources will be ingested. If the channel
  /// is SINGLE_PIPELINE, only the first source will be ingested; the second
  /// source will always be ignored, even if the first source fails.
  /// SINGLE_PIPELINE - You can connect only one source to this input. If the
  /// ChannelClass is also  SINGLE_PIPELINE, this value is valid. If the
  /// ChannelClass is STANDARD, this value is not valid because the channel
  /// requires two sources in the input.
  @_s.JsonKey(name: 'inputClass')
  final InputClass inputClass;

  /// Settings for the input devices.
  @_s.JsonKey(name: 'inputDevices')
  final List<InputDeviceSettings> inputDevices;

  /// Certain pull input sources can be dynamic, meaning that they can have their
  /// URL's dynamically changes
  /// during input switch actions. Presently, this functionality only works with
  /// MP4_FILE inputs.
  @_s.JsonKey(name: 'inputSourceType')
  final InputSourceType inputSourceType;

  /// A list of MediaConnect Flows for this input.
  @_s.JsonKey(name: 'mediaConnectFlows')
  final List<MediaConnectFlow> mediaConnectFlows;

  /// The user-assigned name (This is a mutable value).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// A list of IDs for all the Input Security Groups attached to the input.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  /// A list of the sources of the input (PULL-type).
  @_s.JsonKey(name: 'sources')
  final List<InputSource> sources;
  @_s.JsonKey(name: 'state')
  final InputState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;
  @_s.JsonKey(name: 'type')
  final InputType type;

  DescribeInputResponse({
    this.arn,
    this.attachedChannels,
    this.destinations,
    this.id,
    this.inputClass,
    this.inputDevices,
    this.inputSourceType,
    this.mediaConnectFlows,
    this.name,
    this.roleArn,
    this.securityGroups,
    this.sources,
    this.state,
    this.tags,
    this.type,
  });
  factory DescribeInputResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeInputResponseFromJson(json);
}

/// Placeholder documentation for DescribeInputSecurityGroupResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeInputSecurityGroupResponse {
  /// Unique ARN of Input Security Group
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Id of the Input Security Group
  @_s.JsonKey(name: 'id')
  final String id;

  /// The list of inputs currently using this Input Security Group.
  @_s.JsonKey(name: 'inputs')
  final List<String> inputs;

  /// The current state of the Input Security Group.
  @_s.JsonKey(name: 'state')
  final InputSecurityGroupState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Whitelist rules and their sync status
  @_s.JsonKey(name: 'whitelistRules')
  final List<InputWhitelistRule> whitelistRules;

  DescribeInputSecurityGroupResponse({
    this.arn,
    this.id,
    this.inputs,
    this.state,
    this.tags,
    this.whitelistRules,
  });
  factory DescribeInputSecurityGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeInputSecurityGroupResponseFromJson(json);
}

/// Placeholder documentation for DescribeMultiplexProgramResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMultiplexProgramResponse {
  /// The MediaLive channel associated with the program.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  /// The settings for this multiplex program.
  @_s.JsonKey(name: 'multiplexProgramSettings')
  final MultiplexProgramSettings multiplexProgramSettings;

  /// The packet identifier map for this multiplex program.
  @_s.JsonKey(name: 'packetIdentifiersMap')
  final MultiplexProgramPacketIdentifiersMap packetIdentifiersMap;

  /// Contains information about the current sources for the specified program in
  /// the specified multiplex. Keep in mind that each multiplex pipeline connects
  /// to both pipelines in a given source channel (the channel identified by the
  /// program). But only one of those channel pipelines is ever active at one
  /// time.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<MultiplexProgramPipelineDetail> pipelineDetails;

  /// The name of the multiplex program.
  @_s.JsonKey(name: 'programName')
  final String programName;

  DescribeMultiplexProgramResponse({
    this.channelId,
    this.multiplexProgramSettings,
    this.packetIdentifiersMap,
    this.pipelineDetails,
    this.programName,
  });
  factory DescribeMultiplexProgramResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMultiplexProgramResponseFromJson(json);
}

/// Placeholder documentation for DescribeMultiplexResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMultiplexResponse {
  /// The unique arn of the multiplex.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of availability zones for the multiplex.
  @_s.JsonKey(name: 'availabilityZones')
  final List<String> availabilityZones;

  /// A list of the multiplex output destinations.
  @_s.JsonKey(name: 'destinations')
  final List<MultiplexOutputDestination> destinations;

  /// The unique id of the multiplex.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Configuration for a multiplex event.
  @_s.JsonKey(name: 'multiplexSettings')
  final MultiplexSettings multiplexSettings;

  /// The name of the multiplex.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The number of programs in the multiplex.
  @_s.JsonKey(name: 'programCount')
  final int programCount;

  /// The current state of the multiplex.
  @_s.JsonKey(name: 'state')
  final MultiplexState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeMultiplexResponse({
    this.arn,
    this.availabilityZones,
    this.destinations,
    this.id,
    this.multiplexSettings,
    this.name,
    this.pipelinesRunningCount,
    this.programCount,
    this.state,
    this.tags,
  });
  factory DescribeMultiplexResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeMultiplexResponseFromJson(json);
}

/// Placeholder documentation for DescribeOfferingResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeOfferingResponse {
  /// Unique offering ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  @_s.JsonKey(name: 'currencyCode')
  final String currencyCode;

  /// Lease duration, e.g. '12'
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  @_s.JsonKey(name: 'durationUnits')
  final OfferingDurationUnits durationUnits;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  @_s.JsonKey(name: 'fixedPrice')
  final double fixedPrice;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  @_s.JsonKey(name: 'offeringDescription')
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  @_s.JsonKey(name: 'offeringType')
  final OfferingType offeringType;

  /// AWS region, e.g. 'us-west-2'
  @_s.JsonKey(name: 'region')
  final String region;

  /// Resource configuration details
  @_s.JsonKey(name: 'resourceSpecification')
  final ReservationResourceSpecification resourceSpecification;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  @_s.JsonKey(name: 'usagePrice')
  final double usagePrice;

  DescribeOfferingResponse({
    this.arn,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.fixedPrice,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.resourceSpecification,
    this.usagePrice,
  });
  factory DescribeOfferingResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeOfferingResponseFromJson(json);
}

/// Placeholder documentation for DescribeReservationResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeReservationResponse {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Number of reserved resources
  @_s.JsonKey(name: 'count')
  final int count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  @_s.JsonKey(name: 'currencyCode')
  final String currencyCode;

  /// Lease duration, e.g. '12'
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  @_s.JsonKey(name: 'durationUnits')
  final OfferingDurationUnits durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  @_s.JsonKey(name: 'end')
  final String end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  @_s.JsonKey(name: 'fixedPrice')
  final double fixedPrice;

  /// User specified reservation name
  @_s.JsonKey(name: 'name')
  final String name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  @_s.JsonKey(name: 'offeringDescription')
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  @_s.JsonKey(name: 'offeringType')
  final OfferingType offeringType;

  /// AWS region, e.g. 'us-west-2'
  @_s.JsonKey(name: 'region')
  final String region;

  /// Unique reservation ID, e.g. '1234567'
  @_s.JsonKey(name: 'reservationId')
  final String reservationId;

  /// Resource configuration details
  @_s.JsonKey(name: 'resourceSpecification')
  final ReservationResourceSpecification resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  @_s.JsonKey(name: 'start')
  final String start;

  /// Current state of reservation, e.g. 'ACTIVE'
  @_s.JsonKey(name: 'state')
  final ReservationState state;

  /// A collection of key-value pairs
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  @_s.JsonKey(name: 'usagePrice')
  final double usagePrice;

  DescribeReservationResponse({
    this.arn,
    this.count,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.end,
    this.fixedPrice,
    this.name,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.reservationId,
    this.resourceSpecification,
    this.start,
    this.state,
    this.tags,
    this.usagePrice,
  });
  factory DescribeReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeReservationResponseFromJson(json);
}

/// Placeholder documentation for DescribeScheduleResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScheduleResponse {
  /// The next token; for use in pagination.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The list of actions in the schedule.
  @_s.JsonKey(name: 'scheduleActions')
  final List<ScheduleAction> scheduleActions;

  DescribeScheduleResponse({
    this.nextToken,
    this.scheduleActions,
  });
  factory DescribeScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeScheduleResponseFromJson(json);
}

/// The status of the action to synchronize the device configuration. If you
/// change the configuration of the input device (for example, the maximum
/// bitrate), MediaLive sends the new data to the device. The device might not
/// update itself immediately. SYNCED means the device has updated its
/// configuration. SYNCING means that it has not updated its configuration.
enum DeviceSettingsSyncState {
  @_s.JsonValue('SYNCED')
  synced,
  @_s.JsonValue('SYNCING')
  syncing,
}

/// The status of software on the input device.
enum DeviceUpdateStatus {
  @_s.JsonValue('UP_TO_DATE')
  upToDate,
  @_s.JsonValue('NOT_UP_TO_DATE')
  notUpToDate,
}

/// DVB Network Information Table (NIT)
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbNitSettings {
  /// The numeric value placed in the Network Information Table (NIT).
  @_s.JsonKey(name: 'networkId')
  final int networkId;

  /// The network name text placed in the networkNameDescriptor inside the Network
  /// Information Table. Maximum length is 256 characters.
  @_s.JsonKey(name: 'networkName')
  final String networkName;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'repInterval')
  final int repInterval;

  DvbNitSettings({
    @_s.required this.networkId,
    @_s.required this.networkName,
    this.repInterval,
  });
  factory DvbNitSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbNitSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbNitSettingsToJson(this);
}

/// Dvb Sdt Output Sdt
enum DvbSdtOutputSdt {
  @_s.JsonValue('SDT_FOLLOW')
  sdtFollow,
  @_s.JsonValue('SDT_FOLLOW_IF_PRESENT')
  sdtFollowIfPresent,
  @_s.JsonValue('SDT_MANUAL')
  sdtManual,
  @_s.JsonValue('SDT_NONE')
  sdtNone,
}

/// DVB Service Description Table (SDT)
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbSdtSettings {
  /// Selects method of inserting SDT information into output stream. The
  /// sdtFollow setting copies SDT information from input stream to output stream.
  /// The sdtFollowIfPresent setting copies SDT information from input stream to
  /// output stream if SDT information is present in the input, otherwise it will
  /// fall back on the user-defined values. The sdtManual setting means user will
  /// enter the SDT information. The sdtNone setting means output stream will not
  /// contain SDT information.
  @_s.JsonKey(name: 'outputSdt')
  final DvbSdtOutputSdt outputSdt;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'repInterval')
  final int repInterval;

  /// The service name placed in the serviceDescriptor in the Service Description
  /// Table. Maximum length is 256 characters.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  /// The service provider name placed in the serviceDescriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  @_s.JsonKey(name: 'serviceProviderName')
  final String serviceProviderName;

  DvbSdtSettings({
    this.outputSdt,
    this.repInterval,
    this.serviceName,
    this.serviceProviderName,
  });
  factory DvbSdtSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbSdtSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbSdtSettingsToJson(this);
}

/// Dvb Sub Destination Alignment
enum DvbSubDestinationAlignment {
  @_s.JsonValue('CENTERED')
  centered,
  @_s.JsonValue('LEFT')
  left,
  @_s.JsonValue('SMART')
  smart,
}

/// Dvb Sub Destination Background Color
enum DvbSubDestinationBackgroundColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('WHITE')
  white,
}

/// Dvb Sub Destination Font Color
enum DvbSubDestinationFontColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('BLUE')
  blue,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('YELLOW')
  yellow,
}

/// Dvb Sub Destination Outline Color
enum DvbSubDestinationOutlineColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('BLUE')
  blue,
  @_s.JsonValue('GREEN')
  green,
  @_s.JsonValue('RED')
  red,
  @_s.JsonValue('WHITE')
  white,
  @_s.JsonValue('YELLOW')
  yellow,
}

/// Dvb Sub Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbSubDestinationSettings {
  /// If no explicit xPosition or yPosition is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. Selecting "smart" justification will
  /// left-justify live subtitles and center-justify pre-recorded subtitles.  This
  /// option is not valid for source captions that are STL or 608/embedded.  These
  /// source settings are already pre-defined by the caption stream.  All burn-in
  /// and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'alignment')
  final DvbSubDestinationAlignment alignment;

  /// Specifies the color of the rectangle behind the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundColor')
  final DvbSubDestinationBackgroundColor backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent).  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'backgroundOpacity')
  final int backgroundOpacity;

  /// External font file used for caption burn-in. File extension must be 'ttf' or
  /// 'tte'.  Although the user can select output fonts for many different types
  /// of input captions, embedded, STL and teletext sources use a strict grid
  /// system. Using external fonts with these caption sources could cause
  /// unexpected display of proportional fonts.  All burn-in and DVB-Sub font
  /// settings must match.
  @_s.JsonKey(name: 'font')
  final InputLocation font;

  /// Specifies the color of the burned-in captions.  This option is not valid for
  /// source captions that are STL, 608/embedded or teletext.  These source
  /// settings are already pre-defined by the caption stream.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontColor')
  final DvbSubDestinationFontColor fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontOpacity')
  final int fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontResolution')
  final int fontResolution;

  /// When set to auto fontSize will scale depending on the size of the output.
  /// Giving a positive integer will specify the exact font size in points.  All
  /// burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'fontSize')
  final String fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  @_s.JsonKey(name: 'outlineColor')
  final DvbSubDestinationOutlineColor outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  @_s.JsonKey(name: 'outlineSize')
  final int outlineSize;

  /// Specifies the color of the shadow cast by the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowColor')
  final DvbSubDestinationShadowColor shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowOpacity')
  final int shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowXOffset')
  final int shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text.  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'shadowYOffset')
  final int shadowYOffset;

  /// Controls whether a fixed grid size will be used to generate the output
  /// subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in
  /// outputs.
  @_s.JsonKey(name: 'teletextGridControl')
  final DvbSubDestinationTeletextGridControl teletextGridControl;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit xPosition is provided,
  /// the horizontal caption position will be determined by the alignment
  /// parameter.  This option is not valid for source captions that are STL,
  /// 608/embedded or teletext. These source settings are already pre-defined by
  /// the caption stream.  All burn-in and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'xPosition')
  final int xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit yPosition is provided, the
  /// caption will be positioned towards the bottom of the output.  This option is
  /// not valid for source captions that are STL, 608/embedded or teletext.  These
  /// source settings are already pre-defined by the caption stream.  All burn-in
  /// and DVB-Sub font settings must match.
  @_s.JsonKey(name: 'yPosition')
  final int yPosition;

  DvbSubDestinationSettings({
    this.alignment,
    this.backgroundColor,
    this.backgroundOpacity,
    this.font,
    this.fontColor,
    this.fontOpacity,
    this.fontResolution,
    this.fontSize,
    this.outlineColor,
    this.outlineSize,
    this.shadowColor,
    this.shadowOpacity,
    this.shadowXOffset,
    this.shadowYOffset,
    this.teletextGridControl,
    this.xPosition,
    this.yPosition,
  });
  factory DvbSubDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbSubDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbSubDestinationSettingsToJson(this);
}

/// Dvb Sub Destination Shadow Color
enum DvbSubDestinationShadowColor {
  @_s.JsonValue('BLACK')
  black,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('WHITE')
  white,
}

/// Dvb Sub Destination Teletext Grid Control
enum DvbSubDestinationTeletextGridControl {
  @_s.JsonValue('FIXED')
  fixed,
  @_s.JsonValue('SCALED')
  scaled,
}

/// Dvb Sub Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbSubSourceSettings {
  /// When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source
  /// content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed
  /// through, regardless of selectors.
  @_s.JsonKey(name: 'pid')
  final int pid;

  DvbSubSourceSettings({
    this.pid,
  });
  factory DvbSubSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbSubSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbSubSourceSettingsToJson(this);
}

/// DVB Time and Date Table (SDT)
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DvbTdtSettings {
  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  @_s.JsonKey(name: 'repInterval')
  final int repInterval;

  DvbTdtSettings({
    this.repInterval,
  });
  factory DvbTdtSettings.fromJson(Map<String, dynamic> json) =>
      _$DvbTdtSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$DvbTdtSettingsToJson(this);
}

/// Eac3 Attenuation Control
enum Eac3AttenuationControl {
  @_s.JsonValue('ATTENUATE_3_DB')
  attenuate_3Db,
  @_s.JsonValue('NONE')
  none,
}

/// Eac3 Bitstream Mode
enum Eac3BitstreamMode {
  @_s.JsonValue('COMMENTARY')
  commentary,
  @_s.JsonValue('COMPLETE_MAIN')
  completeMain,
  @_s.JsonValue('EMERGENCY')
  emergency,
  @_s.JsonValue('HEARING_IMPAIRED')
  hearingImpaired,
  @_s.JsonValue('VISUALLY_IMPAIRED')
  visuallyImpaired,
}

/// Eac3 Coding Mode
enum Eac3CodingMode {
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
  @_s.JsonValue('CODING_MODE_3_2')
  codingMode_3_2,
}

/// Eac3 Dc Filter
enum Eac3DcFilter {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Eac3 Drc Line
enum Eac3DrcLine {
  @_s.JsonValue('FILM_LIGHT')
  filmLight,
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('MUSIC_LIGHT')
  musicLight,
  @_s.JsonValue('MUSIC_STANDARD')
  musicStandard,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SPEECH')
  speech,
}

/// Eac3 Drc Rf
enum Eac3DrcRf {
  @_s.JsonValue('FILM_LIGHT')
  filmLight,
  @_s.JsonValue('FILM_STANDARD')
  filmStandard,
  @_s.JsonValue('MUSIC_LIGHT')
  musicLight,
  @_s.JsonValue('MUSIC_STANDARD')
  musicStandard,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SPEECH')
  speech,
}

/// Eac3 Lfe Control
enum Eac3LfeControl {
  @_s.JsonValue('LFE')
  lfe,
  @_s.JsonValue('NO_LFE')
  noLfe,
}

/// Eac3 Lfe Filter
enum Eac3LfeFilter {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Eac3 Metadata Control
enum Eac3MetadataControl {
  @_s.JsonValue('FOLLOW_INPUT')
  followInput,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Eac3 Passthrough Control
enum Eac3PassthroughControl {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('WHEN_POSSIBLE')
  whenPossible,
}

/// Eac3 Phase Control
enum Eac3PhaseControl {
  @_s.JsonValue('NO_SHIFT')
  noShift,
  @_s.JsonValue('SHIFT_90_DEGREES')
  shift_90Degrees,
}

/// Eac3 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Eac3Settings {
  /// When set to attenuate3Db, applies a 3 dB attenuation to the surround
  /// channels. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'attenuationControl')
  final Eac3AttenuationControl attenuationControl;

  /// Average bitrate in bits/second. Valid bitrates depend on the coding mode.
  @_s.JsonKey(name: 'bitrate')
  final double bitrate;

  /// Specifies the bitstream mode (bsmod) for the emitted E-AC-3 stream. See ATSC
  /// A/52-2012 (Annex E) for background on these values.
  @_s.JsonKey(name: 'bitstreamMode')
  final Eac3BitstreamMode bitstreamMode;

  /// Dolby Digital Plus coding mode. Determines number of channels.
  @_s.JsonKey(name: 'codingMode')
  final Eac3CodingMode codingMode;

  /// When set to enabled, activates a DC highpass filter for all input channels.
  @_s.JsonKey(name: 'dcFilter')
  final Eac3DcFilter dcFilter;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby Digital
  /// Plus, dialnorm will be passed through.
  @_s.JsonKey(name: 'dialnorm')
  final int dialnorm;

  /// Sets the Dolby dynamic range compression profile.
  @_s.JsonKey(name: 'drcLine')
  final Eac3DrcLine drcLine;

  /// Sets the profile for heavy Dolby dynamic range compression, ensures that the
  /// instantaneous signal peaks do not exceed specified levels.
  @_s.JsonKey(name: 'drcRf')
  final Eac3DrcRf drcRf;

  /// When encoding 3/2 audio, setting to lfe enables the LFE channel
  @_s.JsonKey(name: 'lfeControl')
  final Eac3LfeControl lfeControl;

  /// When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior
  /// to encoding. Only valid with codingMode32 coding mode.
  @_s.JsonKey(name: 'lfeFilter')
  final Eac3LfeFilter lfeFilter;

  /// Left only/Right only center mix level. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'loRoCenterMixLevel')
  final double loRoCenterMixLevel;

  /// Left only/Right only surround mix level. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'loRoSurroundMixLevel')
  final double loRoSurroundMixLevel;

  /// Left total/Right total center mix level. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'ltRtCenterMixLevel')
  final double ltRtCenterMixLevel;

  /// Left total/Right total surround mix level. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'ltRtSurroundMixLevel')
  final double ltRtSurroundMixLevel;

  /// When set to followInput, encoder metadata will be sourced from the DD, DD+,
  /// or DolbyE decoder that supplied this audio data. If audio was not supplied
  /// from one of these streams, then the static metadata settings will be used.
  @_s.JsonKey(name: 'metadataControl')
  final Eac3MetadataControl metadataControl;

  /// When set to whenPossible, input DD+ audio will be passed through if it is
  /// present on the input. This detection is dynamic over the life of the
  /// transcode. Inputs that alternate between DD+ and non-DD+ content will have a
  /// consistent DD+ output as the system alternates between passthrough and
  /// encoding.
  @_s.JsonKey(name: 'passthroughControl')
  final Eac3PassthroughControl passthroughControl;

  /// When set to shift90Degrees, applies a 90-degree phase shift to the surround
  /// channels. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'phaseControl')
  final Eac3PhaseControl phaseControl;

  /// Stereo downmix preference. Only used for 3/2 coding mode.
  @_s.JsonKey(name: 'stereoDownmix')
  final Eac3StereoDownmix stereoDownmix;

  /// When encoding 3/2 audio, sets whether an extra center back surround channel
  /// is matrix encoded into the left and right surround channels.
  @_s.JsonKey(name: 'surroundExMode')
  final Eac3SurroundExMode surroundExMode;

  /// When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into
  /// the two channels.
  @_s.JsonKey(name: 'surroundMode')
  final Eac3SurroundMode surroundMode;

  Eac3Settings({
    this.attenuationControl,
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dcFilter,
    this.dialnorm,
    this.drcLine,
    this.drcRf,
    this.lfeControl,
    this.lfeFilter,
    this.loRoCenterMixLevel,
    this.loRoSurroundMixLevel,
    this.ltRtCenterMixLevel,
    this.ltRtSurroundMixLevel,
    this.metadataControl,
    this.passthroughControl,
    this.phaseControl,
    this.stereoDownmix,
    this.surroundExMode,
    this.surroundMode,
  });
  factory Eac3Settings.fromJson(Map<String, dynamic> json) =>
      _$Eac3SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Eac3SettingsToJson(this);
}

/// Eac3 Stereo Downmix
enum Eac3StereoDownmix {
  @_s.JsonValue('DPL2')
  dpl2,
  @_s.JsonValue('LO_RO')
  loRo,
  @_s.JsonValue('LT_RT')
  ltRt,
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
}

/// Eac3 Surround Ex Mode
enum Eac3SurroundExMode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
}

/// Eac3 Surround Mode
enum Eac3SurroundMode {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
  @_s.JsonValue('NOT_INDICATED')
  notIndicated,
}

/// Ebu Tt DDestination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EbuTtDDestinationSettings {
  /// Specifies how to handle the gap between the lines (in multi-line captions).
  ///
  /// - enabled: Fill with the captions background color (as specified in the
  /// input captions).
  /// - disabled: Leave the gap unfilled.
  @_s.JsonKey(name: 'fillLineGap')
  final EbuTtDFillLineGapControl fillLineGap;

  /// Specifies the font family to include in the font data attached to the EBU-TT
  /// captions. Valid only if styleControl is set to include. If you leave this
  /// field empty, the font family is set to "monospaced". (If styleControl is set
  /// to exclude, the font family is always set to "monospaced".)
  ///
  /// You specify only the font family. All other style information (color, bold,
  /// position and so on) is copied from the input captions. The size is always
  /// set to 100% to allow the downstream player to choose the size.
  ///
  /// - Enter a list of font families, as a comma-separated list of font names, in
  /// order of preference. The name can be a font family (such as “Arial”), or a
  /// generic font family (such as “serif”), or “default” (to let the downstream
  /// player choose the font).
  /// - Leave blank to set the family to “monospace”.
  @_s.JsonKey(name: 'fontFamily')
  final String fontFamily;

  /// Specifies the style information (font color, font position, and so on) to
  /// include in the font data that is attached to the EBU-TT captions.
  ///
  /// - include: Take the style information (font color, font position, and so on)
  /// from the source captions and include that information in the font data
  /// attached to the EBU-TT captions. This option is valid only if the source
  /// captions are Embedded or Teletext.
  /// - exclude: In the font data attached to the EBU-TT captions, set the font
  /// family to "monospaced". Do not include any other style information.
  @_s.JsonKey(name: 'styleControl')
  final EbuTtDDestinationStyleControl styleControl;

  EbuTtDDestinationSettings({
    this.fillLineGap,
    this.fontFamily,
    this.styleControl,
  });
  factory EbuTtDDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$EbuTtDDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EbuTtDDestinationSettingsToJson(this);
}

/// Ebu Tt DDestination Style Control
enum EbuTtDDestinationStyleControl {
  @_s.JsonValue('EXCLUDE')
  exclude,
  @_s.JsonValue('INCLUDE')
  include,
}

/// Ebu Tt DFill Line Gap Control
enum EbuTtDFillLineGapControl {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Embedded Convert608 To708
enum EmbeddedConvert608To708 {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('UPCONVERT')
  upconvert,
}

/// Embedded Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmbeddedDestinationSettings {
  EmbeddedDestinationSettings();
  factory EmbeddedDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EmbeddedDestinationSettingsToJson(this);
}

/// Embedded Plus Scte20 Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmbeddedPlusScte20DestinationSettings {
  EmbeddedPlusScte20DestinationSettings();
  factory EmbeddedPlusScte20DestinationSettings.fromJson(
          Map<String, dynamic> json) =>
      _$EmbeddedPlusScte20DestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EmbeddedPlusScte20DestinationSettingsToJson(this);
}

/// Embedded Scte20 Detection
enum EmbeddedScte20Detection {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('OFF')
  off,
}

/// Embedded Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmbeddedSourceSettings {
  /// If upconvert, 608 data is both passed through via the "608 compatibility
  /// bytes" fields of the 708 wrapper as well as translated into 708. 708 data
  /// present in the source content will be discarded.
  @_s.JsonKey(name: 'convert608To708')
  final EmbeddedConvert608To708 convert608To708;

  /// Set to "auto" to handle streams with intermittent and/or non-aligned SCTE-20
  /// and Embedded captions.
  @_s.JsonKey(name: 'scte20Detection')
  final EmbeddedScte20Detection scte20Detection;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  @_s.JsonKey(name: 'source608ChannelNumber')
  final int source608ChannelNumber;

  /// This field is unused and deprecated.
  @_s.JsonKey(name: 'source608TrackNumber')
  final int source608TrackNumber;

  EmbeddedSourceSettings({
    this.convert608To708,
    this.scte20Detection,
    this.source608ChannelNumber,
    this.source608TrackNumber,
  });
  factory EmbeddedSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EmbeddedSourceSettingsToJson(this);
}

/// Encoder Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncoderSettings {
  @_s.JsonKey(name: 'audioDescriptions')
  final List<AudioDescription> audioDescriptions;
  @_s.JsonKey(name: 'outputGroups')
  final List<OutputGroup> outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  @_s.JsonKey(name: 'timecodeConfig')
  final TimecodeConfig timecodeConfig;
  @_s.JsonKey(name: 'videoDescriptions')
  final List<VideoDescription> videoDescriptions;

  /// Settings for ad avail blanking.
  @_s.JsonKey(name: 'availBlanking')
  final AvailBlanking availBlanking;

  /// Event-wide configuration settings for ad avail insertion.
  @_s.JsonKey(name: 'availConfiguration')
  final AvailConfiguration availConfiguration;

  /// Settings for blackout slate.
  @_s.JsonKey(name: 'blackoutSlate')
  final BlackoutSlate blackoutSlate;

  /// Settings for caption decriptions
  @_s.JsonKey(name: 'captionDescriptions')
  final List<CaptionDescription> captionDescriptions;

  /// Feature Activations
  @_s.JsonKey(name: 'featureActivations')
  final FeatureActivations featureActivations;

  /// Configuration settings that apply to the event as a whole.
  @_s.JsonKey(name: 'globalConfiguration')
  final GlobalConfiguration globalConfiguration;

  /// Nielsen configuration settings.
  @_s.JsonKey(name: 'nielsenConfiguration')
  final NielsenConfiguration nielsenConfiguration;

  EncoderSettings({
    @_s.required this.audioDescriptions,
    @_s.required this.outputGroups,
    @_s.required this.timecodeConfig,
    @_s.required this.videoDescriptions,
    this.availBlanking,
    this.availConfiguration,
    this.blackoutSlate,
    this.captionDescriptions,
    this.featureActivations,
    this.globalConfiguration,
    this.nielsenConfiguration,
  });
  factory EncoderSettings.fromJson(Map<String, dynamic> json) =>
      _$EncoderSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$EncoderSettingsToJson(this);
}

/// Failover Condition settings. There can be multiple failover conditions
/// inside AutomaticInputFailoverSettings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FailoverCondition {
  /// Failover condition type-specific settings.
  @_s.JsonKey(name: 'failoverConditionSettings')
  final FailoverConditionSettings failoverConditionSettings;

  FailoverCondition({
    this.failoverConditionSettings,
  });
  factory FailoverCondition.fromJson(Map<String, dynamic> json) =>
      _$FailoverConditionFromJson(json);

  Map<String, dynamic> toJson() => _$FailoverConditionToJson(this);
}

/// Settings for one failover condition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FailoverConditionSettings {
  /// MediaLive will perform a failover if the specified audio selector is silent
  /// for the specified period.
  @_s.JsonKey(name: 'audioSilenceSettings')
  final AudioSilenceFailoverSettings audioSilenceSettings;

  /// MediaLive will perform a failover if content is not detected in this input
  /// for the specified period.
  @_s.JsonKey(name: 'inputLossSettings')
  final InputLossFailoverSettings inputLossSettings;

  /// MediaLive will perform a failover if content is considered black for the
  /// specified period.
  @_s.JsonKey(name: 'videoBlackSettings')
  final VideoBlackFailoverSettings videoBlackSettings;

  FailoverConditionSettings({
    this.audioSilenceSettings,
    this.inputLossSettings,
    this.videoBlackSettings,
  });
  factory FailoverConditionSettings.fromJson(Map<String, dynamic> json) =>
      _$FailoverConditionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FailoverConditionSettingsToJson(this);
}

/// Feature Activations
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FeatureActivations {
  /// Enables the Input Prepare feature. You can create Input Prepare actions in
  /// the schedule only if this feature is enabled.
  /// If you disable the feature on an existing schedule, make sure that you first
  /// delete all input prepare actions from the schedule.
  @_s.JsonKey(name: 'inputPrepareScheduleActions')
  final FeatureActivationsInputPrepareScheduleActions
      inputPrepareScheduleActions;

  FeatureActivations({
    this.inputPrepareScheduleActions,
  });
  factory FeatureActivations.fromJson(Map<String, dynamic> json) =>
      _$FeatureActivationsFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureActivationsToJson(this);
}

/// Feature Activations Input Prepare Schedule Actions
enum FeatureActivationsInputPrepareScheduleActions {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Fec Output Include Fec
enum FecOutputIncludeFec {
  @_s.JsonValue('COLUMN')
  column,
  @_s.JsonValue('COLUMN_AND_ROW')
  columnAndRow,
}

/// Fec Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FecOutputSettings {
  /// Parameter D from SMPTE 2022-1. The height of the FEC protection matrix.  The
  /// number of transport stream packets per column error correction packet. Must
  /// be between 4 and 20, inclusive.
  @_s.JsonKey(name: 'columnDepth')
  final int columnDepth;

  /// Enables column only or column and row based FEC
  @_s.JsonKey(name: 'includeFec')
  final FecOutputIncludeFec includeFec;

  /// Parameter L from SMPTE 2022-1. The width of the FEC protection matrix.  Must
  /// be between 1 and 20, inclusive. If only Column FEC is used, then larger
  /// values increase robustness.  If Row FEC is used, then this is the number of
  /// transport stream packets per row error correction packet, and the value must
  /// be between 4 and 20, inclusive, if includeFec is columnAndRow. If includeFec
  /// is column, this value must be 1 to 20, inclusive.
  @_s.JsonKey(name: 'rowLength')
  final int rowLength;

  FecOutputSettings({
    this.columnDepth,
    this.includeFec,
    this.rowLength,
  });
  factory FecOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$FecOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FecOutputSettingsToJson(this);
}

/// Fixed Afd
enum FixedAfd {
  @_s.JsonValue('AFD_0000')
  afd_0000,
  @_s.JsonValue('AFD_0010')
  afd_0010,
  @_s.JsonValue('AFD_0011')
  afd_0011,
  @_s.JsonValue('AFD_0100')
  afd_0100,
  @_s.JsonValue('AFD_1000')
  afd_1000,
  @_s.JsonValue('AFD_1001')
  afd_1001,
  @_s.JsonValue('AFD_1010')
  afd_1010,
  @_s.JsonValue('AFD_1011')
  afd_1011,
  @_s.JsonValue('AFD_1101')
  afd_1101,
  @_s.JsonValue('AFD_1110')
  afd_1110,
  @_s.JsonValue('AFD_1111')
  afd_1111,
}

/// Start time for the action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FixedModeScheduleActionStartSettings {
  /// Start time for the action to start in the channel. (Not the time for the
  /// action to be added to the schedule: actions are always added to the schedule
  /// immediately.) UTC format: yyyy-mm-ddThh:mm:ss.nnnZ. All the letters are
  /// digits (for example, mm might be 01) except for the two constants "T" for
  /// time and "Z" for "UTC format".
  @_s.JsonKey(name: 'time')
  final String time;

  FixedModeScheduleActionStartSettings({
    @_s.required this.time,
  });
  factory FixedModeScheduleActionStartSettings.fromJson(
          Map<String, dynamic> json) =>
      _$FixedModeScheduleActionStartSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FixedModeScheduleActionStartSettingsToJson(this);
}

/// Fmp4 Hls Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Fmp4HlsSettings {
  /// List all the audio groups that are used with the video output stream. Input
  /// all the audio GROUP-IDs that are associated to the video, separate by ','.
  @_s.JsonKey(name: 'audioRenditionSets')
  final String audioRenditionSets;

  /// If set to passthrough, Nielsen inaudible tones for media tracking will be
  /// detected in the input audio and an equivalent ID3 tag will be inserted in
  /// the output.
  @_s.JsonKey(name: 'nielsenId3Behavior')
  final Fmp4NielsenId3Behavior nielsenId3Behavior;

  /// When set to passthrough, timed metadata is passed through from input to
  /// output.
  @_s.JsonKey(name: 'timedMetadataBehavior')
  final Fmp4TimedMetadataBehavior timedMetadataBehavior;

  Fmp4HlsSettings({
    this.audioRenditionSets,
    this.nielsenId3Behavior,
    this.timedMetadataBehavior,
  });
  factory Fmp4HlsSettings.fromJson(Map<String, dynamic> json) =>
      _$Fmp4HlsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Fmp4HlsSettingsToJson(this);
}

/// Fmp4 Nielsen Id3 Behavior
enum Fmp4NielsenId3Behavior {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// Fmp4 Timed Metadata Behavior
enum Fmp4TimedMetadataBehavior {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// Settings to specify if an action follows another.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FollowModeScheduleActionStartSettings {
  /// Identifies whether this action starts relative to the start or relative to
  /// the end of the reference action.
  @_s.JsonKey(name: 'followPoint')
  final FollowPoint followPoint;

  /// The action name of another action that this one refers to.
  @_s.JsonKey(name: 'referenceActionName')
  final String referenceActionName;

  FollowModeScheduleActionStartSettings({
    @_s.required this.followPoint,
    @_s.required this.referenceActionName,
  });
  factory FollowModeScheduleActionStartSettings.fromJson(
          Map<String, dynamic> json) =>
      _$FollowModeScheduleActionStartSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FollowModeScheduleActionStartSettingsToJson(this);
}

/// Follow reference point.
enum FollowPoint {
  @_s.JsonValue('END')
  end,
  @_s.JsonValue('START')
  start,
}

/// Frame Capture Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FrameCaptureGroupSettings {
  /// The destination for the frame capture files. Either the URI for an Amazon S3
  /// bucket and object, plus a file name prefix (for example,
  /// s3ssl://sportsDelivery/highlights/20180820/curling-) or the URI for a
  /// MediaStore container, plus a file name prefix (for example,
  /// mediastoressl://sportsDelivery/20180820/curling-). The final file names
  /// consist of the prefix from the destination field (for example, "curling-") +
  /// name modifier + the counter (5 digits, starting from 00001) + extension
  /// (which is always .jpg).  For example, curling-low.00001.jpg
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  FrameCaptureGroupSettings({
    @_s.required this.destination,
  });
  factory FrameCaptureGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$FrameCaptureGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FrameCaptureGroupSettingsToJson(this);
}

/// Frame Capture Interval Unit
enum FrameCaptureIntervalUnit {
  @_s.JsonValue('MILLISECONDS')
  milliseconds,
  @_s.JsonValue('SECONDS')
  seconds,
}

/// Frame Capture Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FrameCaptureOutputSettings {
  /// Required if the output group contains more than one output. This modifier
  /// forms part of the output file name.
  @_s.JsonKey(name: 'nameModifier')
  final String nameModifier;

  FrameCaptureOutputSettings({
    this.nameModifier,
  });
  factory FrameCaptureOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$FrameCaptureOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FrameCaptureOutputSettingsToJson(this);
}

/// Frame Capture Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FrameCaptureSettings {
  /// The frequency at which to capture frames for inclusion in the output. May be
  /// specified in either seconds or milliseconds, as specified by
  /// captureIntervalUnits.
  @_s.JsonKey(name: 'captureInterval')
  final int captureInterval;

  /// Unit for the frame capture interval.
  @_s.JsonKey(name: 'captureIntervalUnits')
  final FrameCaptureIntervalUnit captureIntervalUnits;

  FrameCaptureSettings({
    @_s.required this.captureInterval,
    this.captureIntervalUnits,
  });
  factory FrameCaptureSettings.fromJson(Map<String, dynamic> json) =>
      _$FrameCaptureSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$FrameCaptureSettingsToJson(this);
}

/// Global Configuration
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GlobalConfiguration {
  /// Value to set the initial audio gain for the Live Event.
  @_s.JsonKey(name: 'initialAudioGain')
  final int initialAudioGain;

  /// Indicates the action to take when the current input completes (e.g.
  /// end-of-file). When switchAndLoopInputs is configured the encoder will
  /// restart at the beginning of the first input.  When "none" is configured the
  /// encoder will transcode either black, a solid color, or a user specified
  /// slate images per the "Input Loss Behavior" configuration until the next
  /// input switch occurs (which is controlled through the Channel Schedule API).
  @_s.JsonKey(name: 'inputEndAction')
  final GlobalConfigurationInputEndAction inputEndAction;

  /// Settings for system actions when input is lost.
  @_s.JsonKey(name: 'inputLossBehavior')
  final InputLossBehavior inputLossBehavior;

  /// Indicates how MediaLive pipelines are synchronized.
  ///
  /// PIPELINE_LOCKING - MediaLive will attempt to synchronize the output of each
  /// pipeline to the other.
  /// EPOCH_LOCKING - MediaLive will attempt to synchronize the output of each
  /// pipeline to the Unix epoch.
  @_s.JsonKey(name: 'outputLockingMode')
  final GlobalConfigurationOutputLockingMode outputLockingMode;

  /// Indicates whether the rate of frames emitted by the Live encoder should be
  /// paced by its system clock (which optionally may be locked to another source
  /// via NTP) or should be locked to the clock of the source that is providing
  /// the input stream.
  @_s.JsonKey(name: 'outputTimingSource')
  final GlobalConfigurationOutputTimingSource outputTimingSource;

  /// Adjusts video input buffer for streams with very low video framerates. This
  /// is commonly set to enabled for music channels with less than one video frame
  /// per second.
  @_s.JsonKey(name: 'supportLowFramerateInputs')
  final GlobalConfigurationLowFramerateInputs supportLowFramerateInputs;

  GlobalConfiguration({
    this.initialAudioGain,
    this.inputEndAction,
    this.inputLossBehavior,
    this.outputLockingMode,
    this.outputTimingSource,
    this.supportLowFramerateInputs,
  });
  factory GlobalConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GlobalConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalConfigurationToJson(this);
}

/// Global Configuration Input End Action
enum GlobalConfigurationInputEndAction {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SWITCH_AND_LOOP_INPUTS')
  switchAndLoopInputs,
}

/// Global Configuration Low Framerate Inputs
enum GlobalConfigurationLowFramerateInputs {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Global Configuration Output Locking Mode
enum GlobalConfigurationOutputLockingMode {
  @_s.JsonValue('EPOCH_LOCKING')
  epochLocking,
  @_s.JsonValue('PIPELINE_LOCKING')
  pipelineLocking,
}

/// Global Configuration Output Timing Source
enum GlobalConfigurationOutputTimingSource {
  @_s.JsonValue('INPUT_CLOCK')
  inputClock,
  @_s.JsonValue('SYSTEM_CLOCK')
  systemClock,
}

/// H264 Adaptive Quantization
enum H264AdaptiveQuantization {
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('HIGHER')
  higher,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MAX')
  max,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('OFF')
  off,
}

/// H264 Color Metadata
enum H264ColorMetadata {
  @_s.JsonValue('IGNORE')
  ignore,
  @_s.JsonValue('INSERT')
  insert,
}

/// H264 Color Space Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H264ColorSpaceSettings {
  @_s.JsonKey(name: 'colorSpacePassthroughSettings')
  final ColorSpacePassthroughSettings colorSpacePassthroughSettings;
  @_s.JsonKey(name: 'rec601Settings')
  final Rec601Settings rec601Settings;
  @_s.JsonKey(name: 'rec709Settings')
  final Rec709Settings rec709Settings;

  H264ColorSpaceSettings({
    this.colorSpacePassthroughSettings,
    this.rec601Settings,
    this.rec709Settings,
  });
  factory H264ColorSpaceSettings.fromJson(Map<String, dynamic> json) =>
      _$H264ColorSpaceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H264ColorSpaceSettingsToJson(this);
}

/// H264 Entropy Encoding
enum H264EntropyEncoding {
  @_s.JsonValue('CABAC')
  cabac,
  @_s.JsonValue('CAVLC')
  cavlc,
}

/// H264 Filter Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H264FilterSettings {
  @_s.JsonKey(name: 'temporalFilterSettings')
  final TemporalFilterSettings temporalFilterSettings;

  H264FilterSettings({
    this.temporalFilterSettings,
  });
  factory H264FilterSettings.fromJson(Map<String, dynamic> json) =>
      _$H264FilterSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H264FilterSettingsToJson(this);
}

/// H264 Flicker Aq
enum H264FlickerAq {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H264 Force Field Pictures
enum H264ForceFieldPictures {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H264 Framerate Control
enum H264FramerateControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// H264 Gop BReference
enum H264GopBReference {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H264 Gop Size Units
enum H264GopSizeUnits {
  @_s.JsonValue('FRAMES')
  frames,
  @_s.JsonValue('SECONDS')
  seconds,
}

/// H264 Level
enum H264Level {
  @_s.JsonValue('H264_LEVEL_1')
  h264Level_1,
  @_s.JsonValue('H264_LEVEL_1_1')
  h264Level_1_1,
  @_s.JsonValue('H264_LEVEL_1_2')
  h264Level_1_2,
  @_s.JsonValue('H264_LEVEL_1_3')
  h264Level_1_3,
  @_s.JsonValue('H264_LEVEL_2')
  h264Level_2,
  @_s.JsonValue('H264_LEVEL_2_1')
  h264Level_2_1,
  @_s.JsonValue('H264_LEVEL_2_2')
  h264Level_2_2,
  @_s.JsonValue('H264_LEVEL_3')
  h264Level_3,
  @_s.JsonValue('H264_LEVEL_3_1')
  h264Level_3_1,
  @_s.JsonValue('H264_LEVEL_3_2')
  h264Level_3_2,
  @_s.JsonValue('H264_LEVEL_4')
  h264Level_4,
  @_s.JsonValue('H264_LEVEL_4_1')
  h264Level_4_1,
  @_s.JsonValue('H264_LEVEL_4_2')
  h264Level_4_2,
  @_s.JsonValue('H264_LEVEL_5')
  h264Level_5,
  @_s.JsonValue('H264_LEVEL_5_1')
  h264Level_5_1,
  @_s.JsonValue('H264_LEVEL_5_2')
  h264Level_5_2,
  @_s.JsonValue('H264_LEVEL_AUTO')
  h264LevelAuto,
}

/// H264 Look Ahead Rate Control
enum H264LookAheadRateControl {
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
}

/// H264 Par Control
enum H264ParControl {
  @_s.JsonValue('INITIALIZE_FROM_SOURCE')
  initializeFromSource,
  @_s.JsonValue('SPECIFIED')
  specified,
}

/// H264 Profile
enum H264Profile {
  @_s.JsonValue('BASELINE')
  baseline,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('HIGH_10BIT')
  high_10bit,
  @_s.JsonValue('HIGH_422')
  high_422,
  @_s.JsonValue('HIGH_422_10BIT')
  high_422_10bit,
  @_s.JsonValue('MAIN')
  main,
}

/// H264 Quality Level
enum H264QualityLevel {
  @_s.JsonValue('ENHANCED_QUALITY')
  enhancedQuality,
  @_s.JsonValue('STANDARD_QUALITY')
  standardQuality,
}

/// H264 Rate Control Mode
enum H264RateControlMode {
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('MULTIPLEX')
  multiplex,
  @_s.JsonValue('QVBR')
  qvbr,
  @_s.JsonValue('VBR')
  vbr,
}

/// H264 Scan Type
enum H264ScanType {
  @_s.JsonValue('INTERLACED')
  interlaced,
  @_s.JsonValue('PROGRESSIVE')
  progressive,
}

/// H264 Scene Change Detect
enum H264SceneChangeDetect {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H264 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H264Settings {
  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  @_s.JsonKey(name: 'adaptiveQuantization')
  final H264AdaptiveQuantization adaptiveQuantization;

  /// Indicates that AFD values will be written into the output stream.  If
  /// afdSignaling is "auto", the system will try to preserve the input AFD value
  /// (in cases where multiple AFD values are valid). If set to "fixed", the AFD
  /// value will be the value configured in the fixedAfd parameter.
  @_s.JsonKey(name: 'afdSignaling')
  final AfdSignaling afdSignaling;

  /// Average bitrate in bits/second. Required when the rate control mode is VBR
  /// or CBR. Not used for QVBR. In an MS Smooth output group, each output must
  /// have a unique value when its bitrate is rounded down to the nearest multiple
  /// of 1000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  @_s.JsonKey(name: 'bufFillPct')
  final int bufFillPct;

  /// Size of buffer (HRD buffer model) in bits.
  @_s.JsonKey(name: 'bufSize')
  final int bufSize;

  /// Includes colorspace metadata in the output.
  @_s.JsonKey(name: 'colorMetadata')
  final H264ColorMetadata colorMetadata;

  /// Color Space settings
  @_s.JsonKey(name: 'colorSpaceSettings')
  final H264ColorSpaceSettings colorSpaceSettings;

  /// Entropy encoding mode.  Use cabac (must be in Main or High profile) or
  /// cavlc.
  @_s.JsonKey(name: 'entropyEncoding')
  final H264EntropyEncoding entropyEncoding;

  /// Optional filters that you can apply to an encode.
  @_s.JsonKey(name: 'filterSettings')
  final H264FilterSettings filterSettings;

  /// Four bit AFD value to write on all frames of video in the output stream.
  /// Only valid when afdSignaling is set to 'Fixed'.
  @_s.JsonKey(name: 'fixedAfd')
  final FixedAfd fixedAfd;

  /// If set to enabled, adjust quantization within each frame to reduce flicker
  /// or 'pop' on I-frames.
  @_s.JsonKey(name: 'flickerAq')
  final H264FlickerAq flickerAq;

  /// This setting applies only when scan type is "interlaced." It controls
  /// whether coding is performed on a field basis or on a frame basis. (When the
  /// video is progressive, the coding is always performed on a frame basis.)
  /// enabled: Force MediaLive to code on a field basis, so that odd and even sets
  /// of fields are coded separately.
  /// disabled: Code the two sets of fields separately (on a field basis) or
  /// together (on a frame basis using PAFF), depending on what is most
  /// appropriate for the content.
  @_s.JsonKey(name: 'forceFieldPictures')
  final H264ForceFieldPictures forceFieldPictures;

  /// This field indicates how the output video frame rate is specified.  If
  /// "specified" is selected then the output video frame rate is determined by
  /// framerateNumerator and framerateDenominator, else if "initializeFromSource"
  /// is selected then the output video frame rate will be set equal to the input
  /// video frame rate of the first input.
  @_s.JsonKey(name: 'framerateControl')
  final H264FramerateControl framerateControl;

  /// Framerate denominator.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976
  /// fps.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Documentation update needed
  @_s.JsonKey(name: 'gopBReference')
  final H264GopBReference gopBReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  @_s.JsonKey(name: 'gopClosedCadence')
  final int gopClosedCadence;

  /// Number of B-frames between reference frames.
  @_s.JsonKey(name: 'gopNumBFrames')
  final int gopNumBFrames;

  /// GOP size (keyframe interval) in units of either frames or seconds per
  /// gopSizeUnits.
  /// If gopSizeUnits is frames, gopSize must be an integer and must be greater
  /// than or equal to 1.
  /// If gopSizeUnits is seconds, gopSize must be greater than 0, but need not be
  /// an integer.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Indicates if the gopSize is specified in frames or seconds. If seconds the
  /// system will convert the gopSize into a frame count at run time.
  @_s.JsonKey(name: 'gopSizeUnits')
  final H264GopSizeUnits gopSizeUnits;

  /// H.264 Level.
  @_s.JsonKey(name: 'level')
  final H264Level level;

  /// Amount of lookahead. A value of low can decrease latency and memory usage,
  /// while high can produce better quality for certain content.
  @_s.JsonKey(name: 'lookAheadRateControl')
  final H264LookAheadRateControl lookAheadRateControl;

  /// For QVBR: See the tooltip for Quality level
  ///
  /// For VBR: Set the maximum bitrate in order to accommodate expected spikes in
  /// the complexity of the video.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Only meaningful if sceneChangeDetect is set to enabled.  Defaults to 5 if
  /// multiplex rate control is used.  Enforces separation between repeated
  /// (cadence) I-frames and I-frames inserted by Scene Change Detection. If a
  /// scene change I-frame is within I-interval frames of a cadence I-frame, the
  /// GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch
  /// requires enabling lookahead as well as setting I-interval. The normal
  /// cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size +
  /// Min-I-interval - 1
  @_s.JsonKey(name: 'minIInterval')
  final int minIInterval;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  @_s.JsonKey(name: 'numRefFrames')
  final int numRefFrames;

  /// This field indicates how the output pixel aspect ratio is specified.  If
  /// "specified" is selected then the output video pixel aspect ratio is
  /// determined by parNumerator and parDenominator, else if
  /// "initializeFromSource" is selected then the output pixsel aspect ratio will
  /// be set equal to the input video pixel aspect ratio of the first input.
  @_s.JsonKey(name: 'parControl')
  final H264ParControl parControl;

  /// Pixel Aspect Ratio denominator.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// H.264 Profile.
  @_s.JsonKey(name: 'profile')
  final H264Profile profile;

  /// Leave as STANDARD_QUALITY or choose a different value (which might result in
  /// additional costs to run the channel).
  /// - ENHANCED_QUALITY: Produces a slightly better video quality without an
  /// increase in the bitrate. Has an effect only when the Rate control mode is
  /// QVBR or CBR. If this channel is in a MediaLive multiplex, the value must be
  /// ENHANCED_QUALITY.
  /// - STANDARD_QUALITY: Valid for any Rate control mode.
  @_s.JsonKey(name: 'qualityLevel')
  final H264QualityLevel qualityLevel;

  /// Controls the target quality for the video encode. Applies only when the rate
  /// control mode is QVBR. Set values for the QVBR quality level field and Max
  /// bitrate field that suit your most important viewing devices. Recommended
  /// values are:
  /// - Primary screen: Quality level: 8 to 10. Max bitrate: 4M
  /// - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M
  /// - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
  @_s.JsonKey(name: 'qvbrQualityLevel')
  final int qvbrQualityLevel;

  /// Rate control mode.
  ///
  /// QVBR: Quality will match the specified quality level except when it is
  /// constrained by the
  /// maximum bitrate.  Recommended if you or your viewers pay for bandwidth.
  ///
  /// VBR: Quality and bitrate vary, depending on the video complexity.
  /// Recommended instead of QVBR
  /// if you want to maintain a specific average bitrate over the duration of the
  /// channel.
  ///
  /// CBR: Quality varies, depending on the video complexity. Recommended only if
  /// you distribute
  /// your assets to devices that cannot handle variable bitrates.
  ///
  /// Multiplex: This rate control mode is only supported (and is required) when
  /// the video is being
  /// delivered to a MediaLive Multiplex in which case the rate control
  /// configuration is controlled
  /// by the properties within the Multiplex Program.
  @_s.JsonKey(name: 'rateControlMode')
  final H264RateControlMode rateControlMode;

  /// Sets the scan type of the output to progressive or top-field-first
  /// interlaced.
  @_s.JsonKey(name: 'scanType')
  final H264ScanType scanType;

  /// Scene change detection.
  ///
  /// - On: inserts I-frames when scene change is detected.
  /// - Off: does not force an I-frame when scene change is detected.
  @_s.JsonKey(name: 'sceneChangeDetect')
  final H264SceneChangeDetect sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  /// This field is optional; when no value is specified the encoder will choose
  /// the number of slices based on encode resolution.
  @_s.JsonKey(name: 'slices')
  final int slices;

  /// Softness. Selects quantizer matrix, larger values reduce high-frequency
  /// content in the encoded image.
  @_s.JsonKey(name: 'softness')
  final int softness;

  /// If set to enabled, adjust quantization within each frame based on spatial
  /// variation of content complexity.
  @_s.JsonKey(name: 'spatialAq')
  final H264SpatialAq spatialAq;

  /// If set to fixed, use gopNumBFrames B-frames per sub-GOP. If set to dynamic,
  /// optimize the number of B-frames used for each sub-GOP to improve visual
  /// quality.
  @_s.JsonKey(name: 'subgopLength')
  final H264SubGopLength subgopLength;

  /// Produces a bitstream compliant with SMPTE RP-2027.
  @_s.JsonKey(name: 'syntax')
  final H264Syntax syntax;

  /// If set to enabled, adjust quantization within each frame based on temporal
  /// variation of content complexity.
  @_s.JsonKey(name: 'temporalAq')
  final H264TemporalAq temporalAq;

  /// Determines how timecodes should be inserted into the video elementary
  /// stream.
  /// - 'disabled': Do not include timecodes
  /// - 'picTimingSei': Pass through picture timing SEI messages from the source
  /// specified in Timecode Config
  @_s.JsonKey(name: 'timecodeInsertion')
  final H264TimecodeInsertionBehavior timecodeInsertion;

  H264Settings({
    this.adaptiveQuantization,
    this.afdSignaling,
    this.bitrate,
    this.bufFillPct,
    this.bufSize,
    this.colorMetadata,
    this.colorSpaceSettings,
    this.entropyEncoding,
    this.filterSettings,
    this.fixedAfd,
    this.flickerAq,
    this.forceFieldPictures,
    this.framerateControl,
    this.framerateDenominator,
    this.framerateNumerator,
    this.gopBReference,
    this.gopClosedCadence,
    this.gopNumBFrames,
    this.gopSize,
    this.gopSizeUnits,
    this.level,
    this.lookAheadRateControl,
    this.maxBitrate,
    this.minIInterval,
    this.numRefFrames,
    this.parControl,
    this.parDenominator,
    this.parNumerator,
    this.profile,
    this.qualityLevel,
    this.qvbrQualityLevel,
    this.rateControlMode,
    this.scanType,
    this.sceneChangeDetect,
    this.slices,
    this.softness,
    this.spatialAq,
    this.subgopLength,
    this.syntax,
    this.temporalAq,
    this.timecodeInsertion,
  });
  factory H264Settings.fromJson(Map<String, dynamic> json) =>
      _$H264SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H264SettingsToJson(this);
}

/// H264 Spatial Aq
enum H264SpatialAq {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H264 Sub Gop Length
enum H264SubGopLength {
  @_s.JsonValue('DYNAMIC')
  dynamic,
  @_s.JsonValue('FIXED')
  fixed,
}

/// H264 Syntax
enum H264Syntax {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('RP2027')
  rp2027,
}

/// H264 Temporal Aq
enum H264TemporalAq {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H264 Timecode Insertion Behavior
enum H264TimecodeInsertionBehavior {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('PIC_TIMING_SEI')
  picTimingSei,
}

/// H265 Adaptive Quantization
enum H265AdaptiveQuantization {
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('HIGHER')
  higher,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MAX')
  max,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('OFF')
  off,
}

/// H265 Alternative Transfer Function
enum H265AlternativeTransferFunction {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('OMIT')
  omit,
}

/// H265 Color Metadata
enum H265ColorMetadata {
  @_s.JsonValue('IGNORE')
  ignore,
  @_s.JsonValue('INSERT')
  insert,
}

/// H265 Color Space Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H265ColorSpaceSettings {
  @_s.JsonKey(name: 'colorSpacePassthroughSettings')
  final ColorSpacePassthroughSettings colorSpacePassthroughSettings;
  @_s.JsonKey(name: 'hdr10Settings')
  final Hdr10Settings hdr10Settings;
  @_s.JsonKey(name: 'rec601Settings')
  final Rec601Settings rec601Settings;
  @_s.JsonKey(name: 'rec709Settings')
  final Rec709Settings rec709Settings;

  H265ColorSpaceSettings({
    this.colorSpacePassthroughSettings,
    this.hdr10Settings,
    this.rec601Settings,
    this.rec709Settings,
  });
  factory H265ColorSpaceSettings.fromJson(Map<String, dynamic> json) =>
      _$H265ColorSpaceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H265ColorSpaceSettingsToJson(this);
}

/// H265 Filter Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H265FilterSettings {
  @_s.JsonKey(name: 'temporalFilterSettings')
  final TemporalFilterSettings temporalFilterSettings;

  H265FilterSettings({
    this.temporalFilterSettings,
  });
  factory H265FilterSettings.fromJson(Map<String, dynamic> json) =>
      _$H265FilterSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H265FilterSettingsToJson(this);
}

/// H265 Flicker Aq
enum H265FlickerAq {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H265 Gop Size Units
enum H265GopSizeUnits {
  @_s.JsonValue('FRAMES')
  frames,
  @_s.JsonValue('SECONDS')
  seconds,
}

/// H265 Level
enum H265Level {
  @_s.JsonValue('H265_LEVEL_1')
  h265Level_1,
  @_s.JsonValue('H265_LEVEL_2')
  h265Level_2,
  @_s.JsonValue('H265_LEVEL_2_1')
  h265Level_2_1,
  @_s.JsonValue('H265_LEVEL_3')
  h265Level_3,
  @_s.JsonValue('H265_LEVEL_3_1')
  h265Level_3_1,
  @_s.JsonValue('H265_LEVEL_4')
  h265Level_4,
  @_s.JsonValue('H265_LEVEL_4_1')
  h265Level_4_1,
  @_s.JsonValue('H265_LEVEL_5')
  h265Level_5,
  @_s.JsonValue('H265_LEVEL_5_1')
  h265Level_5_1,
  @_s.JsonValue('H265_LEVEL_5_2')
  h265Level_5_2,
  @_s.JsonValue('H265_LEVEL_6')
  h265Level_6,
  @_s.JsonValue('H265_LEVEL_6_1')
  h265Level_6_1,
  @_s.JsonValue('H265_LEVEL_6_2')
  h265Level_6_2,
  @_s.JsonValue('H265_LEVEL_AUTO')
  h265LevelAuto,
}

/// H265 Look Ahead Rate Control
enum H265LookAheadRateControl {
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
}

/// H265 Profile
enum H265Profile {
  @_s.JsonValue('MAIN')
  main,
  @_s.JsonValue('MAIN_10BIT')
  main_10bit,
}

/// H265 Rate Control Mode
enum H265RateControlMode {
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('MULTIPLEX')
  multiplex,
  @_s.JsonValue('QVBR')
  qvbr,
}

/// H265 Scan Type
enum H265ScanType {
  @_s.JsonValue('INTERLACED')
  interlaced,
  @_s.JsonValue('PROGRESSIVE')
  progressive,
}

/// H265 Scene Change Detect
enum H265SceneChangeDetect {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// H265 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class H265Settings {
  /// Framerate denominator.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976
  /// fps.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  @_s.JsonKey(name: 'adaptiveQuantization')
  final H265AdaptiveQuantization adaptiveQuantization;

  /// Indicates that AFD values will be written into the output stream.  If
  /// afdSignaling is "auto", the system will try to preserve the input AFD value
  /// (in cases where multiple AFD values are valid). If set to "fixed", the AFD
  /// value will be the value configured in the fixedAfd parameter.
  @_s.JsonKey(name: 'afdSignaling')
  final AfdSignaling afdSignaling;

  /// Whether or not EML should insert an Alternative Transfer Function SEI
  /// message to support backwards compatibility with non-HDR decoders and
  /// displays.
  @_s.JsonKey(name: 'alternativeTransferFunction')
  final H265AlternativeTransferFunction alternativeTransferFunction;

  /// Average bitrate in bits/second. Required when the rate control mode is VBR
  /// or CBR. Not used for QVBR. In an MS Smooth output group, each output must
  /// have a unique value when its bitrate is rounded down to the nearest multiple
  /// of 1000.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Size of buffer (HRD buffer model) in bits.
  @_s.JsonKey(name: 'bufSize')
  final int bufSize;

  /// Includes colorspace metadata in the output.
  @_s.JsonKey(name: 'colorMetadata')
  final H265ColorMetadata colorMetadata;

  /// Color Space settings
  @_s.JsonKey(name: 'colorSpaceSettings')
  final H265ColorSpaceSettings colorSpaceSettings;

  /// Optional filters that you can apply to an encode.
  @_s.JsonKey(name: 'filterSettings')
  final H265FilterSettings filterSettings;

  /// Four bit AFD value to write on all frames of video in the output stream.
  /// Only valid when afdSignaling is set to 'Fixed'.
  @_s.JsonKey(name: 'fixedAfd')
  final FixedAfd fixedAfd;

  /// If set to enabled, adjust quantization within each frame to reduce flicker
  /// or 'pop' on I-frames.
  @_s.JsonKey(name: 'flickerAq')
  final H265FlickerAq flickerAq;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  @_s.JsonKey(name: 'gopClosedCadence')
  final int gopClosedCadence;

  /// GOP size (keyframe interval) in units of either frames or seconds per
  /// gopSizeUnits.
  /// If gopSizeUnits is frames, gopSize must be an integer and must be greater
  /// than or equal to 1.
  /// If gopSizeUnits is seconds, gopSize must be greater than 0, but need not be
  /// an integer.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Indicates if the gopSize is specified in frames or seconds. If seconds the
  /// system will convert the gopSize into a frame count at run time.
  @_s.JsonKey(name: 'gopSizeUnits')
  final H265GopSizeUnits gopSizeUnits;

  /// H.265 Level.
  @_s.JsonKey(name: 'level')
  final H265Level level;

  /// Amount of lookahead. A value of low can decrease latency and memory usage,
  /// while high can produce better quality for certain content.
  @_s.JsonKey(name: 'lookAheadRateControl')
  final H265LookAheadRateControl lookAheadRateControl;

  /// For QVBR: See the tooltip for Quality level
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// Only meaningful if sceneChangeDetect is set to enabled.  Defaults to 5 if
  /// multiplex rate control is used.  Enforces separation between repeated
  /// (cadence) I-frames and I-frames inserted by Scene Change Detection. If a
  /// scene change I-frame is within I-interval frames of a cadence I-frame, the
  /// GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch
  /// requires enabling lookahead as well as setting I-interval. The normal
  /// cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size +
  /// Min-I-interval - 1
  @_s.JsonKey(name: 'minIInterval')
  final int minIInterval;

  /// Pixel Aspect Ratio denominator.
  @_s.JsonKey(name: 'parDenominator')
  final int parDenominator;

  /// Pixel Aspect Ratio numerator.
  @_s.JsonKey(name: 'parNumerator')
  final int parNumerator;

  /// H.265 Profile.
  @_s.JsonKey(name: 'profile')
  final H265Profile profile;

  /// Controls the target quality for the video encode. Applies only when the rate
  /// control mode is QVBR. Set values for the QVBR quality level field and Max
  /// bitrate field that suit your most important viewing devices. Recommended
  /// values are:
  /// - Primary screen: Quality level: 8 to 10. Max bitrate: 4M
  /// - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M
  /// - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
  @_s.JsonKey(name: 'qvbrQualityLevel')
  final int qvbrQualityLevel;

  /// Rate control mode.
  ///
  /// QVBR: Quality will match the specified quality level except when it is
  /// constrained by the
  /// maximum bitrate.  Recommended if you or your viewers pay for bandwidth.
  ///
  /// CBR: Quality varies, depending on the video complexity. Recommended only if
  /// you distribute
  /// your assets to devices that cannot handle variable bitrates.
  ///
  /// Multiplex: This rate control mode is only supported (and is required) when
  /// the video is being
  /// delivered to a MediaLive Multiplex in which case the rate control
  /// configuration is controlled
  /// by the properties within the Multiplex Program.
  @_s.JsonKey(name: 'rateControlMode')
  final H265RateControlMode rateControlMode;

  /// Sets the scan type of the output to progressive or top-field-first
  /// interlaced.
  @_s.JsonKey(name: 'scanType')
  final H265ScanType scanType;

  /// Scene change detection.
  @_s.JsonKey(name: 'sceneChangeDetect')
  final H265SceneChangeDetect sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  /// This field is optional; when no value is specified the encoder will choose
  /// the number of slices based on encode resolution.
  @_s.JsonKey(name: 'slices')
  final int slices;

  /// H.265 Tier.
  @_s.JsonKey(name: 'tier')
  final H265Tier tier;

  /// Determines how timecodes should be inserted into the video elementary
  /// stream.
  /// - 'disabled': Do not include timecodes
  /// - 'picTimingSei': Pass through picture timing SEI messages from the source
  /// specified in Timecode Config
  @_s.JsonKey(name: 'timecodeInsertion')
  final H265TimecodeInsertionBehavior timecodeInsertion;

  H265Settings({
    @_s.required this.framerateDenominator,
    @_s.required this.framerateNumerator,
    this.adaptiveQuantization,
    this.afdSignaling,
    this.alternativeTransferFunction,
    this.bitrate,
    this.bufSize,
    this.colorMetadata,
    this.colorSpaceSettings,
    this.filterSettings,
    this.fixedAfd,
    this.flickerAq,
    this.gopClosedCadence,
    this.gopSize,
    this.gopSizeUnits,
    this.level,
    this.lookAheadRateControl,
    this.maxBitrate,
    this.minIInterval,
    this.parDenominator,
    this.parNumerator,
    this.profile,
    this.qvbrQualityLevel,
    this.rateControlMode,
    this.scanType,
    this.sceneChangeDetect,
    this.slices,
    this.tier,
    this.timecodeInsertion,
  });
  factory H265Settings.fromJson(Map<String, dynamic> json) =>
      _$H265SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$H265SettingsToJson(this);
}

/// H265 Tier
enum H265Tier {
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('MAIN')
  main,
}

/// H265 Timecode Insertion Behavior
enum H265TimecodeInsertionBehavior {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('PIC_TIMING_SEI')
  picTimingSei,
}

/// Hdr10 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Hdr10Settings {
  /// Maximum Content Light Level
  /// An integer metadata value defining the maximum light level, in nits,
  /// of any single pixel within an encoded HDR video stream or file.
  @_s.JsonKey(name: 'maxCll')
  final int maxCll;

  /// Maximum Frame Average Light Level
  /// An integer metadata value defining the maximum average light level, in nits,
  /// for any single frame within an encoded HDR video stream or file.
  @_s.JsonKey(name: 'maxFall')
  final int maxFall;

  Hdr10Settings({
    this.maxCll,
    this.maxFall,
  });
  factory Hdr10Settings.fromJson(Map<String, dynamic> json) =>
      _$Hdr10SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Hdr10SettingsToJson(this);
}

/// Hls Ad Markers
enum HlsAdMarkers {
  @_s.JsonValue('ADOBE')
  adobe,
  @_s.JsonValue('ELEMENTAL')
  elemental,
  @_s.JsonValue('ELEMENTAL_SCTE35')
  elementalScte35,
}

/// Hls Akamai Http Transfer Mode
enum HlsAkamaiHttpTransferMode {
  @_s.JsonValue('CHUNKED')
  chunked,
  @_s.JsonValue('NON_CHUNKED')
  nonChunked,
}

/// Hls Akamai Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsAkamaiSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  @_s.JsonKey(name: 'connectionRetryInterval')
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  @_s.JsonKey(name: 'filecacheDuration')
  final int filecacheDuration;

  /// Specify whether or not to use chunked transfer encoding to Akamai. User
  /// should contact Akamai to enable this feature.
  @_s.JsonKey(name: 'httpTransferMode')
  final HlsAkamaiHttpTransferMode httpTransferMode;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  @_s.JsonKey(name: 'numRetries')
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  @_s.JsonKey(name: 'restartDelay')
  final int restartDelay;

  /// Salt for authenticated Akamai.
  @_s.JsonKey(name: 'salt')
  final String salt;

  /// Token parameter for authenticated akamai. If not specified, _gda_ is used.
  @_s.JsonKey(name: 'token')
  final String token;

  HlsAkamaiSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.httpTransferMode,
    this.numRetries,
    this.restartDelay,
    this.salt,
    this.token,
  });
  factory HlsAkamaiSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsAkamaiSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsAkamaiSettingsToJson(this);
}

/// Hls Basic Put Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsBasicPutSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  @_s.JsonKey(name: 'connectionRetryInterval')
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  @_s.JsonKey(name: 'filecacheDuration')
  final int filecacheDuration;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  @_s.JsonKey(name: 'numRetries')
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  @_s.JsonKey(name: 'restartDelay')
  final int restartDelay;

  HlsBasicPutSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.numRetries,
    this.restartDelay,
  });
  factory HlsBasicPutSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsBasicPutSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsBasicPutSettingsToJson(this);
}

/// Hls Caption Language Setting
enum HlsCaptionLanguageSetting {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('OMIT')
  omit,
}

/// Hls Cdn Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsCdnSettings {
  @_s.JsonKey(name: 'hlsAkamaiSettings')
  final HlsAkamaiSettings hlsAkamaiSettings;
  @_s.JsonKey(name: 'hlsBasicPutSettings')
  final HlsBasicPutSettings hlsBasicPutSettings;
  @_s.JsonKey(name: 'hlsMediaStoreSettings')
  final HlsMediaStoreSettings hlsMediaStoreSettings;
  @_s.JsonKey(name: 'hlsWebdavSettings')
  final HlsWebdavSettings hlsWebdavSettings;

  HlsCdnSettings({
    this.hlsAkamaiSettings,
    this.hlsBasicPutSettings,
    this.hlsMediaStoreSettings,
    this.hlsWebdavSettings,
  });
  factory HlsCdnSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsCdnSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsCdnSettingsToJson(this);
}

/// Hls Client Cache
enum HlsClientCache {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Hls Codec Specification
enum HlsCodecSpecification {
  @_s.JsonValue('RFC_4281')
  rfc_4281,
  @_s.JsonValue('RFC_6381')
  rfc_6381,
}

/// Hls Directory Structure
enum HlsDirectoryStructure {
  @_s.JsonValue('SINGLE_DIRECTORY')
  singleDirectory,
  @_s.JsonValue('SUBDIRECTORY_PER_STREAM')
  subdirectoryPerStream,
}

/// Hls Discontinuity Tags
enum HlsDiscontinuityTags {
  @_s.JsonValue('INSERT')
  insert,
  @_s.JsonValue('NEVER_INSERT')
  neverInsert,
}

/// Hls Encryption Type
enum HlsEncryptionType {
  @_s.JsonValue('AES128')
  aes128,
  @_s.JsonValue('SAMPLE_AES')
  sampleAes,
}

/// Hls Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsGroupSettings {
  /// A directory or HTTP destination for the HLS segments, manifest files, and
  /// encryption keys (if enabled).
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  /// Choose one or more ad marker types to pass SCTE35 signals through to this
  /// group of Apple HLS outputs.
  @_s.JsonKey(name: 'adMarkers')
  final List<HlsAdMarkers> adMarkers;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  @_s.JsonKey(name: 'baseUrlContent')
  final String baseUrlContent;

  /// Optional. One value per output group.
  ///
  /// This field is required only if you are completing Base URL content A, and
  /// the downstream system has notified you that the media files for pipeline 1
  /// of all outputs are in a location different from the media files for pipeline
  /// 0.
  @_s.JsonKey(name: 'baseUrlContent1')
  final String baseUrlContent1;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  @_s.JsonKey(name: 'baseUrlManifest')
  final String baseUrlManifest;

  /// Optional. One value per output group.
  ///
  /// Complete this field only if you are completing Base URL manifest A, and the
  /// downstream system has notified you that the child manifest files for
  /// pipeline 1 of all outputs are in a location different from the child
  /// manifest files for pipeline 0.
  @_s.JsonKey(name: 'baseUrlManifest1')
  final String baseUrlManifest1;

  /// Mapping of up to 4 caption channels to caption languages.  Is only
  /// meaningful if captionLanguageSetting is set to "insert".
  @_s.JsonKey(name: 'captionLanguageMappings')
  final List<CaptionLanguageMapping> captionLanguageMappings;

  /// Applies only to 608 Embedded output captions.
  /// insert: Include CLOSED-CAPTIONS lines in the manifest. Specify at least one
  /// language in the CC1 Language Code field. One CLOSED-CAPTION line is added
  /// for each Language Code you specify. Make sure to specify the languages in
  /// the order in which they appear in the original source (if the source is
  /// embedded format) or the order of the caption selectors (if the source is
  /// other than embedded). Otherwise, languages in the manifest will not match up
  /// properly with the output captions.
  /// none: Include CLOSED-CAPTIONS=NONE line in the manifest.
  /// omit: Omit any CLOSED-CAPTIONS line from the manifest.
  @_s.JsonKey(name: 'captionLanguageSetting')
  final HlsCaptionLanguageSetting captionLanguageSetting;

  /// When set to "disabled", sets the #EXT-X-ALLOW-CACHE:no tag in the manifest,
  /// which prevents clients from saving media segments for later replay.
  @_s.JsonKey(name: 'clientCache')
  final HlsClientCache clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
  /// generation.
  @_s.JsonKey(name: 'codecSpecification')
  final HlsCodecSpecification codecSpecification;

  /// For use with encryptionType. This is a 128-bit, 16-byte hex value
  /// represented by a 32-character text string. If ivSource is set to "explicit"
  /// then this parameter is required and is used as the IV for encryption.
  @_s.JsonKey(name: 'constantIv')
  final String constantIv;

  /// Place segments in subdirectories.
  @_s.JsonKey(name: 'directoryStructure')
  final HlsDirectoryStructure directoryStructure;

  /// Specifies whether to insert EXT-X-DISCONTINUITY tags in the HLS child
  /// manifests for this output group.
  /// Typically, choose Insert because these tags are required in the manifest
  /// (according to the HLS specification) and serve an important purpose.
  /// Choose Never Insert only if the downstream system is doing real-time
  /// failover (without using the MediaLive automatic failover feature) and only
  /// if that downstream system has advised you to exclude the tags.
  @_s.JsonKey(name: 'discontinuityTags')
  final HlsDiscontinuityTags discontinuityTags;

  /// Encrypts the segments with the given encryption scheme.  Exclude this
  /// parameter if no encryption is desired.
  @_s.JsonKey(name: 'encryptionType')
  final HlsEncryptionType encryptionType;

  /// Parameters that control interactions with the CDN.
  @_s.JsonKey(name: 'hlsCdnSettings')
  final HlsCdnSettings hlsCdnSettings;

  /// State of HLS ID3 Segment Tagging
  @_s.JsonKey(name: 'hlsId3SegmentTagging')
  final HlsId3SegmentTaggingState hlsId3SegmentTagging;

  /// DISABLED: Do not create an I-frame-only manifest, but do create the master
  /// and media manifests (according to the Output Selection field).
  ///
  /// STANDARD: Create an I-frame-only manifest for each output that contains
  /// video, as well as the other manifests (according to the Output Selection
  /// field). The I-frame manifest contains a #EXT-X-I-FRAMES-ONLY tag to indicate
  /// it is I-frame only, and one or more #EXT-X-BYTERANGE entries identifying the
  /// I-frame position. For example, #EXT-X-BYTERANGE:160364@1461888"
  @_s.JsonKey(name: 'iFrameOnlyPlaylists')
  final IFrameOnlyPlaylistType iFrameOnlyPlaylists;

  /// Specifies whether to include the final (incomplete) segment in the media
  /// output when the pipeline stops producing output because of a channel stop, a
  /// channel pause or a loss of input to the pipeline.
  /// Auto means that MediaLive decides whether to include the final segment,
  /// depending on the channel class and the types of output groups.
  /// Suppress means to never include the incomplete segment. We recommend you
  /// choose Auto and let MediaLive control the behavior.
  @_s.JsonKey(name: 'incompleteSegmentBehavior')
  final HlsIncompleteSegmentBehavior incompleteSegmentBehavior;

  /// Applies only if Mode field is LIVE.
  ///
  /// Specifies the maximum number of segments in the media manifest file. After
  /// this maximum, older segments are removed from the media manifest. This
  /// number must be smaller than the number in the Keep Segments field.
  @_s.JsonKey(name: 'indexNSegments')
  final int indexNSegments;

  /// Parameter that control output group behavior on input loss.
  @_s.JsonKey(name: 'inputLossAction')
  final InputLossActionForHlsOut inputLossAction;

  /// For use with encryptionType. The IV (Initialization Vector) is a 128-bit
  /// number used in conjunction with the key for encrypting blocks. If set to
  /// "include", IV is listed in the manifest, otherwise the IV is not in the
  /// manifest.
  @_s.JsonKey(name: 'ivInManifest')
  final HlsIvInManifest ivInManifest;

  /// For use with encryptionType. The IV (Initialization Vector) is a 128-bit
  /// number used in conjunction with the key for encrypting blocks. If this
  /// setting is "followsSegmentNumber", it will cause the IV to change every
  /// segment (to match the segment number). If this is set to "explicit", you
  /// must enter a constantIv value.
  @_s.JsonKey(name: 'ivSource')
  final HlsIvSource ivSource;

  /// Applies only if Mode field is LIVE.
  ///
  /// Specifies the number of media segments to retain in the destination
  /// directory. This number should be bigger than indexNSegments (Num segments).
  /// We recommend (value = (2 x indexNsegments) + 1).
  ///
  /// If this "keep segments" number is too low, the following might happen: the
  /// player is still reading a media manifest file that lists this segment, but
  /// that segment has been removed from the destination directory (as directed by
  /// indexNSegments). This situation would result in a 404 HTTP error on the
  /// player.
  @_s.JsonKey(name: 'keepSegments')
  final int keepSegments;

  /// The value specifies how the key is represented in the resource identified by
  /// the URI.  If parameter is absent, an implicit value of "identity" is used.
  /// A reverse DNS string can also be given.
  @_s.JsonKey(name: 'keyFormat')
  final String keyFormat;

  /// Either a single positive integer version value or a slash delimited list of
  /// version values (1/2/3).
  @_s.JsonKey(name: 'keyFormatVersions')
  final String keyFormatVersions;

  /// The key provider settings.
  @_s.JsonKey(name: 'keyProviderSettings')
  final KeyProviderSettings keyProviderSettings;

  /// When set to gzip, compresses HLS playlist.
  @_s.JsonKey(name: 'manifestCompression')
  final HlsManifestCompression manifestCompression;

  /// Indicates whether the output manifest should use floating point or integer
  /// values for segment duration.
  @_s.JsonKey(name: 'manifestDurationFormat')
  final HlsManifestDurationFormat manifestDurationFormat;

  /// When set, minimumSegmentLength is enforced by looking ahead and back within
  /// the specified range for a nearby avail and extending the segment size if
  /// needed.
  @_s.JsonKey(name: 'minSegmentLength')
  final int minSegmentLength;

  /// If "vod", all segments are indexed and kept permanently in the destination
  /// and manifest. If "live", only the number segments specified in keepSegments
  /// and indexNSegments are kept; newer segments replace older segments, which
  /// may prevent players from rewinding all the way to the beginning of the
  /// event.
  ///
  /// VOD mode uses HLS EXT-X-PLAYLIST-TYPE of EVENT while the channel is running,
  /// converting it to a "VOD" type manifest on completion of the stream.
  @_s.JsonKey(name: 'mode')
  final HlsMode mode;

  /// MANIFESTS_AND_SEGMENTS: Generates manifests (master manifest, if applicable,
  /// and media manifests) for this output group.
  ///
  /// VARIANT_MANIFESTS_AND_SEGMENTS: Generates media manifests for this output
  /// group, but not a master manifest.
  ///
  /// SEGMENTS_ONLY: Does not generate any manifests for this output group.
  @_s.JsonKey(name: 'outputSelection')
  final HlsOutputSelection outputSelection;

  /// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
  /// The value is calculated as follows: either the program date and time are
  /// initialized using the input timecode source, or the time is initialized
  /// using the input timecode source and the date is initialized using the
  /// timestampOffset.
  @_s.JsonKey(name: 'programDateTime')
  final HlsProgramDateTime programDateTime;

  /// Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
  @_s.JsonKey(name: 'programDateTimePeriod')
  final int programDateTimePeriod;

  /// ENABLED: The master manifest (.m3u8 file) for each pipeline includes
  /// information about both pipelines: first its own media files, then the media
  /// files of the other pipeline. This feature allows playout device that support
  /// stale manifest detection to switch from one manifest to the other, when the
  /// current manifest seems to be stale. There are still two destinations and two
  /// master manifests, but both master manifests reference the media files from
  /// both pipelines.
  ///
  /// DISABLED: The master manifest (.m3u8 file) for each pipeline includes
  /// information about its own pipeline only.
  ///
  /// For an HLS output group with MediaPackage as the destination, the DISABLED
  /// behavior is always followed. MediaPackage regenerates the manifests it
  /// serves to players so a redundant manifest from MediaLive is irrelevant.
  @_s.JsonKey(name: 'redundantManifest')
  final HlsRedundantManifest redundantManifest;

  /// Length of MPEG-2 Transport Stream segments to create (in seconds). Note that
  /// segments will end on the next keyframe after this number of seconds, so
  /// actual segment length may be longer.
  @_s.JsonKey(name: 'segmentLength')
  final int segmentLength;

  /// useInputSegmentation has been deprecated. The configured segment size is
  /// always used.
  @_s.JsonKey(name: 'segmentationMode')
  final HlsSegmentationMode segmentationMode;

  /// Number of segments to write to a subdirectory before starting a new one.
  /// directoryStructure must be subdirectoryPerStream for this setting to have an
  /// effect.
  @_s.JsonKey(name: 'segmentsPerSubdirectory')
  final int segmentsPerSubdirectory;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
  /// variant manifest.
  @_s.JsonKey(name: 'streamInfResolution')
  final HlsStreamInfResolution streamInfResolution;

  /// Indicates ID3 frame that has the timecode.
  @_s.JsonKey(name: 'timedMetadataId3Frame')
  final HlsTimedMetadataId3Frame timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  @_s.JsonKey(name: 'timedMetadataId3Period')
  final int timedMetadataId3Period;

  /// Provides an extra millisecond delta offset to fine tune the timestamps.
  @_s.JsonKey(name: 'timestampDeltaMilliseconds')
  final int timestampDeltaMilliseconds;

  /// SEGMENTED_FILES: Emit the program as segments - multiple .ts media files.
  ///
  /// SINGLE_FILE: Applies only if Mode field is VOD. Emit the program as a single
  /// .ts media file. The media manifest includes #EXT-X-BYTERANGE tags to index
  /// segments for playback. A typical use for this value is when sending the
  /// output to AWS Elemental MediaConvert, which can accept only a single media
  /// file. Playback while the channel is running is not guaranteed due to HTTP
  /// server caching.
  @_s.JsonKey(name: 'tsFileMode')
  final HlsTsFileMode tsFileMode;

  HlsGroupSettings({
    @_s.required this.destination,
    this.adMarkers,
    this.baseUrlContent,
    this.baseUrlContent1,
    this.baseUrlManifest,
    this.baseUrlManifest1,
    this.captionLanguageMappings,
    this.captionLanguageSetting,
    this.clientCache,
    this.codecSpecification,
    this.constantIv,
    this.directoryStructure,
    this.discontinuityTags,
    this.encryptionType,
    this.hlsCdnSettings,
    this.hlsId3SegmentTagging,
    this.iFrameOnlyPlaylists,
    this.incompleteSegmentBehavior,
    this.indexNSegments,
    this.inputLossAction,
    this.ivInManifest,
    this.ivSource,
    this.keepSegments,
    this.keyFormat,
    this.keyFormatVersions,
    this.keyProviderSettings,
    this.manifestCompression,
    this.manifestDurationFormat,
    this.minSegmentLength,
    this.mode,
    this.outputSelection,
    this.programDateTime,
    this.programDateTimePeriod,
    this.redundantManifest,
    this.segmentLength,
    this.segmentationMode,
    this.segmentsPerSubdirectory,
    this.streamInfResolution,
    this.timedMetadataId3Frame,
    this.timedMetadataId3Period,
    this.timestampDeltaMilliseconds,
    this.tsFileMode,
  });
  factory HlsGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsGroupSettingsToJson(this);
}

/// Hls H265 Packaging Type
enum HlsH265PackagingType {
  @_s.JsonValue('HEV1')
  hev1,
  @_s.JsonValue('HVC1')
  hvc1,
}

/// Settings for the action to insert a user-defined ID3 tag in each HLS segment
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsId3SegmentTaggingScheduleActionSettings {
  /// ID3 tag to insert into each segment. Supports special keyword identifiers to
  /// substitute in segment-related values.\nSupported keyword identifiers:
  /// https://docs.aws.amazon.com/medialive/latest/ug/variable-data-identifiers.html
  @_s.JsonKey(name: 'tag')
  final String tag;

  HlsId3SegmentTaggingScheduleActionSettings({
    @_s.required this.tag,
  });
  factory HlsId3SegmentTaggingScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$HlsId3SegmentTaggingScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HlsId3SegmentTaggingScheduleActionSettingsToJson(this);
}

/// State of HLS ID3 Segment Tagging
enum HlsId3SegmentTaggingState {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Hls Incomplete Segment Behavior
enum HlsIncompleteSegmentBehavior {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('SUPPRESS')
  suppress,
}

/// Hls Input Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsInputSettings {
  /// When specified the HLS stream with the m3u8 BANDWIDTH that most closely
  /// matches this value will be chosen, otherwise the highest bandwidth stream in
  /// the m3u8 will be chosen.  The bitrate is specified in bits per second, as in
  /// an HLS manifest.
  @_s.JsonKey(name: 'bandwidth')
  final int bandwidth;

  /// When specified, reading of the HLS input will begin this many buffer
  /// segments from the end (most recently written segment).  When not specified,
  /// the HLS input will begin with the first segment specified in the m3u8.
  @_s.JsonKey(name: 'bufferSegments')
  final int bufferSegments;

  /// The number of consecutive times that attempts to read a manifest or segment
  /// must fail before the input is considered unavailable.
  @_s.JsonKey(name: 'retries')
  final int retries;

  /// The number of seconds between retries when an attempt to read a manifest or
  /// segment fails.
  @_s.JsonKey(name: 'retryInterval')
  final int retryInterval;

  HlsInputSettings({
    this.bandwidth,
    this.bufferSegments,
    this.retries,
    this.retryInterval,
  });
  factory HlsInputSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsInputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsInputSettingsToJson(this);
}

/// Hls Iv In Manifest
enum HlsIvInManifest {
  @_s.JsonValue('EXCLUDE')
  exclude,
  @_s.JsonValue('INCLUDE')
  include,
}

/// Hls Iv Source
enum HlsIvSource {
  @_s.JsonValue('EXPLICIT')
  explicit,
  @_s.JsonValue('FOLLOWS_SEGMENT_NUMBER')
  followsSegmentNumber,
}

/// Hls Manifest Compression
enum HlsManifestCompression {
  @_s.JsonValue('GZIP')
  gzip,
  @_s.JsonValue('NONE')
  none,
}

/// Hls Manifest Duration Format
enum HlsManifestDurationFormat {
  @_s.JsonValue('FLOATING_POINT')
  floatingPoint,
  @_s.JsonValue('INTEGER')
  integer,
}

/// Hls Media Store Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsMediaStoreSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  @_s.JsonKey(name: 'connectionRetryInterval')
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  @_s.JsonKey(name: 'filecacheDuration')
  final int filecacheDuration;

  /// When set to temporal, output files are stored in non-persistent memory for
  /// faster reading and writing.
  @_s.JsonKey(name: 'mediaStoreStorageClass')
  final HlsMediaStoreStorageClass mediaStoreStorageClass;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  @_s.JsonKey(name: 'numRetries')
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  @_s.JsonKey(name: 'restartDelay')
  final int restartDelay;

  HlsMediaStoreSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.mediaStoreStorageClass,
    this.numRetries,
    this.restartDelay,
  });
  factory HlsMediaStoreSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsMediaStoreSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsMediaStoreSettingsToJson(this);
}

/// Hls Media Store Storage Class
enum HlsMediaStoreStorageClass {
  @_s.JsonValue('TEMPORAL')
  temporal,
}

/// Hls Mode
enum HlsMode {
  @_s.JsonValue('LIVE')
  live,
  @_s.JsonValue('VOD')
  vod,
}

/// Hls Output Selection
enum HlsOutputSelection {
  @_s.JsonValue('MANIFESTS_AND_SEGMENTS')
  manifestsAndSegments,
  @_s.JsonValue('SEGMENTS_ONLY')
  segmentsOnly,
  @_s.JsonValue('VARIANT_MANIFESTS_AND_SEGMENTS')
  variantManifestsAndSegments,
}

/// Hls Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsOutputSettings {
  /// Settings regarding the underlying stream. These settings are different for
  /// audio-only outputs.
  @_s.JsonKey(name: 'hlsSettings')
  final HlsSettings hlsSettings;

  /// Only applicable when this output is referencing an H.265 video description.
  /// Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
  @_s.JsonKey(name: 'h265PackagingType')
  final HlsH265PackagingType h265PackagingType;

  /// String concatenated to the end of the destination filename. Accepts \"Format
  /// Identifiers\":#formatIdentifierParameters.
  @_s.JsonKey(name: 'nameModifier')
  final String nameModifier;

  /// String concatenated to end of segment filenames.
  @_s.JsonKey(name: 'segmentModifier')
  final String segmentModifier;

  HlsOutputSettings({
    @_s.required this.hlsSettings,
    this.h265PackagingType,
    this.nameModifier,
    this.segmentModifier,
  });
  factory HlsOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsOutputSettingsToJson(this);
}

/// Hls Program Date Time
enum HlsProgramDateTime {
  @_s.JsonValue('EXCLUDE')
  exclude,
  @_s.JsonValue('INCLUDE')
  include,
}

/// Hls Redundant Manifest
enum HlsRedundantManifest {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Hls Segmentation Mode
enum HlsSegmentationMode {
  @_s.JsonValue('USE_INPUT_SEGMENTATION')
  useInputSegmentation,
  @_s.JsonValue('USE_SEGMENT_DURATION')
  useSegmentDuration,
}

/// Hls Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsSettings {
  @_s.JsonKey(name: 'audioOnlyHlsSettings')
  final AudioOnlyHlsSettings audioOnlyHlsSettings;
  @_s.JsonKey(name: 'fmp4HlsSettings')
  final Fmp4HlsSettings fmp4HlsSettings;
  @_s.JsonKey(name: 'standardHlsSettings')
  final StandardHlsSettings standardHlsSettings;

  HlsSettings({
    this.audioOnlyHlsSettings,
    this.fmp4HlsSettings,
    this.standardHlsSettings,
  });
  factory HlsSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsSettingsToJson(this);
}

/// Hls Stream Inf Resolution
enum HlsStreamInfResolution {
  @_s.JsonValue('EXCLUDE')
  exclude,
  @_s.JsonValue('INCLUDE')
  include,
}

/// Hls Timed Metadata Id3 Frame
enum HlsTimedMetadataId3Frame {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PRIV')
  priv,
  @_s.JsonValue('TDRL')
  tdrl,
}

/// Settings for the action to emit HLS metadata
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsTimedMetadataScheduleActionSettings {
  /// Base64 string formatted according to the ID3 specification:
  /// http://id3.org/id3v2.4.0-structure
  @_s.JsonKey(name: 'id3')
  final String id3;

  HlsTimedMetadataScheduleActionSettings({
    @_s.required this.id3,
  });
  factory HlsTimedMetadataScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$HlsTimedMetadataScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HlsTimedMetadataScheduleActionSettingsToJson(this);
}

/// Hls Ts File Mode
enum HlsTsFileMode {
  @_s.JsonValue('SEGMENTED_FILES')
  segmentedFiles,
  @_s.JsonValue('SINGLE_FILE')
  singleFile,
}

/// Hls Webdav Http Transfer Mode
enum HlsWebdavHttpTransferMode {
  @_s.JsonValue('CHUNKED')
  chunked,
  @_s.JsonValue('NON_CHUNKED')
  nonChunked,
}

/// Hls Webdav Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HlsWebdavSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  @_s.JsonKey(name: 'connectionRetryInterval')
  final int connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  @_s.JsonKey(name: 'filecacheDuration')
  final int filecacheDuration;

  /// Specify whether or not to use chunked transfer encoding to WebDAV.
  @_s.JsonKey(name: 'httpTransferMode')
  final HlsWebdavHttpTransferMode httpTransferMode;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  @_s.JsonKey(name: 'numRetries')
  final int numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  @_s.JsonKey(name: 'restartDelay')
  final int restartDelay;

  HlsWebdavSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.httpTransferMode,
    this.numRetries,
    this.restartDelay,
  });
  factory HlsWebdavSettings.fromJson(Map<String, dynamic> json) =>
      _$HlsWebdavSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$HlsWebdavSettingsToJson(this);
}

/// When set to "standard", an I-Frame only playlist will be written out for
/// each video output in the output group. This I-Frame only playlist will
/// contain byte range offsets pointing to the I-frame(s) in each segment.
enum IFrameOnlyPlaylistType {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('STANDARD')
  standard,
}

/// Settings to configure an action so that it occurs as soon as possible.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImmediateModeScheduleActionStartSettings {
  ImmediateModeScheduleActionStartSettings();
  factory ImmediateModeScheduleActionStartSettings.fromJson(
          Map<String, dynamic> json) =>
      _$ImmediateModeScheduleActionStartSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ImmediateModeScheduleActionStartSettingsToJson(this);
}

/// Placeholder documentation for Input
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Input {
  /// The Unique ARN of the input (generated, immutable).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of channel IDs that that input is attached to (currently an input can
  /// only be attached to one channel).
  @_s.JsonKey(name: 'attachedChannels')
  final List<String> attachedChannels;

  /// A list of the destinations of the input (PUSH-type).
  @_s.JsonKey(name: 'destinations')
  final List<InputDestination> destinations;

  /// The generated ID of the input (unique for user account, immutable).
  @_s.JsonKey(name: 'id')
  final String id;

  /// STANDARD - MediaLive expects two sources to be connected to this input. If
  /// the channel is also STANDARD, both sources will be ingested. If the channel
  /// is SINGLE_PIPELINE, only the first source will be ingested; the second
  /// source will always be ignored, even if the first source fails.
  /// SINGLE_PIPELINE - You can connect only one source to this input. If the
  /// ChannelClass is also  SINGLE_PIPELINE, this value is valid. If the
  /// ChannelClass is STANDARD, this value is not valid because the channel
  /// requires two sources in the input.
  @_s.JsonKey(name: 'inputClass')
  final InputClass inputClass;

  /// Settings for the input devices.
  @_s.JsonKey(name: 'inputDevices')
  final List<InputDeviceSettings> inputDevices;

  /// Certain pull input sources can be dynamic, meaning that they can have their
  /// URL's dynamically changes
  /// during input switch actions. Presently, this functionality only works with
  /// MP4_FILE inputs.
  @_s.JsonKey(name: 'inputSourceType')
  final InputSourceType inputSourceType;

  /// A list of MediaConnect Flows for this input.
  @_s.JsonKey(name: 'mediaConnectFlows')
  final List<MediaConnectFlow> mediaConnectFlows;

  /// The user-assigned name (This is a mutable value).
  @_s.JsonKey(name: 'name')
  final String name;

  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;

  /// A list of IDs for all the Input Security Groups attached to the input.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  /// A list of the sources of the input (PULL-type).
  @_s.JsonKey(name: 'sources')
  final List<InputSource> sources;
  @_s.JsonKey(name: 'state')
  final InputState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;
  @_s.JsonKey(name: 'type')
  final InputType type;

  Input({
    this.arn,
    this.attachedChannels,
    this.destinations,
    this.id,
    this.inputClass,
    this.inputDevices,
    this.inputSourceType,
    this.mediaConnectFlows,
    this.name,
    this.roleArn,
    this.securityGroups,
    this.sources,
    this.state,
    this.tags,
    this.type,
  });
  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);
}

/// Placeholder documentation for InputAttachment
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputAttachment {
  /// User-specified settings for defining what the conditions are for declaring
  /// the input unhealthy and failing over to a different input.
  @_s.JsonKey(name: 'automaticInputFailoverSettings')
  final AutomaticInputFailoverSettings automaticInputFailoverSettings;

  /// User-specified name for the attachment. This is required if the user wants
  /// to use this input in an input switch action.
  @_s.JsonKey(name: 'inputAttachmentName')
  final String inputAttachmentName;

  /// The ID of the input
  @_s.JsonKey(name: 'inputId')
  final String inputId;

  /// Settings of an input (caption selector, etc.)
  @_s.JsonKey(name: 'inputSettings')
  final InputSettings inputSettings;

  InputAttachment({
    this.automaticInputFailoverSettings,
    this.inputAttachmentName,
    this.inputId,
    this.inputSettings,
  });
  factory InputAttachment.fromJson(Map<String, dynamic> json) =>
      _$InputAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$InputAttachmentToJson(this);
}

/// Input Channel Level
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputChannelLevel {
  /// Remixing value. Units are in dB and acceptable values are within the range
  /// from -60 (mute) and 6 dB.
  @_s.JsonKey(name: 'gain')
  final int gain;

  /// The index of the input channel used as a source.
  @_s.JsonKey(name: 'inputChannel')
  final int inputChannel;

  InputChannelLevel({
    @_s.required this.gain,
    @_s.required this.inputChannel,
  });
  factory InputChannelLevel.fromJson(Map<String, dynamic> json) =>
      _$InputChannelLevelFromJson(json);

  Map<String, dynamic> toJson() => _$InputChannelLevelToJson(this);
}

/// A standard input has two sources and a single pipeline input only has one.
enum InputClass {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('SINGLE_PIPELINE')
  singlePipeline,
}

/// Settings to let you create a clip of the file input, in order to set up the
/// input to ingest only a portion of the file.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputClippingSettings {
  /// The source of the timecodes in the source being clipped.
  @_s.JsonKey(name: 'inputTimecodeSource')
  final InputTimecodeSource inputTimecodeSource;

  /// Settings to identify the start of the clip.
  @_s.JsonKey(name: 'startTimecode')
  final StartTimecode startTimecode;

  /// Settings to identify the end of the clip.
  @_s.JsonKey(name: 'stopTimecode')
  final StopTimecode stopTimecode;

  InputClippingSettings({
    @_s.required this.inputTimecodeSource,
    this.startTimecode,
    this.stopTimecode,
  });
  factory InputClippingSettings.fromJson(Map<String, dynamic> json) =>
      _$InputClippingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InputClippingSettingsToJson(this);
}

/// codec in increasing order of complexity
enum InputCodec {
  @_s.JsonValue('MPEG2')
  mpeg2,
  @_s.JsonValue('AVC')
  avc,
  @_s.JsonValue('HEVC')
  hevc,
}

/// Input Deblock Filter
enum InputDeblockFilter {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Input Denoise Filter
enum InputDenoiseFilter {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// The settings for a PUSH type input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputDestination {
  /// The system-generated static IP address of endpoint.
  /// It remains fixed for the lifetime of the input.
  @_s.JsonKey(name: 'ip')
  final String ip;

  /// The port number for the input.
  @_s.JsonKey(name: 'port')
  final String port;

  /// This represents the endpoint that the customer stream will be
  /// pushed to.
  @_s.JsonKey(name: 'url')
  final String url;
  @_s.JsonKey(name: 'vpc')
  final InputDestinationVpc vpc;

  InputDestination({
    this.ip,
    this.port,
    this.url,
    this.vpc,
  });
  factory InputDestination.fromJson(Map<String, dynamic> json) =>
      _$InputDestinationFromJson(json);
}

/// Endpoint settings for a PUSH type input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputDestinationRequest {
  /// A unique name for the location the RTMP stream is being pushed
  /// to.
  @_s.JsonKey(name: 'streamName')
  final String streamName;

  InputDestinationRequest({
    this.streamName,
  });
  Map<String, dynamic> toJson() => _$InputDestinationRequestToJson(this);
}

/// The properties for a VPC type input destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputDestinationVpc {
  /// The availability zone of the Input destination.
  @_s.JsonKey(name: 'availabilityZone')
  final String availabilityZone;

  /// The network interface ID of the Input destination in the VPC.
  @_s.JsonKey(name: 'networkInterfaceId')
  final String networkInterfaceId;

  InputDestinationVpc({
    this.availabilityZone,
    this.networkInterfaceId,
  });
  factory InputDestinationVpc.fromJson(Map<String, dynamic> json) =>
      _$InputDestinationVpcFromJson(json);
}

/// The source at the input device that is currently active.
enum InputDeviceActiveInput {
  @_s.JsonValue('HDMI')
  hdmi,
  @_s.JsonValue('SDI')
  sdi,
}

/// Configurable settings for the input device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputDeviceConfigurableSettings {
  /// The input source that you want to use. If the device has a source connected
  /// to only one of its input ports, or if you don't care which source the device
  /// sends, specify Auto. If the device has sources connected to both its input
  /// ports, and you want to use a specific source, specify the source.
  @_s.JsonKey(name: 'configuredInput')
  final InputDeviceConfiguredInput configuredInput;

  /// The maximum bitrate in bits per second. Set a value here to throttle the
  /// bitrate of the source video.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  InputDeviceConfigurableSettings({
    this.configuredInput,
    this.maxBitrate,
  });
  Map<String, dynamic> toJson() =>
      _$InputDeviceConfigurableSettingsToJson(this);
}

/// The source to activate (use) from the input device.
enum InputDeviceConfiguredInput {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('HDMI')
  hdmi,
  @_s.JsonValue('SDI')
  sdi,
}

/// The state of the connection between the input device and AWS.
enum InputDeviceConnectionState {
  @_s.JsonValue('DISCONNECTED')
  disconnected,
  @_s.JsonValue('CONNECTED')
  connected,
}

/// Settings that describe the active source from the input device, and the
/// video characteristics of that source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputDeviceHdSettings {
  /// If you specified Auto as the configured input, specifies which of the
  /// sources is currently active (SDI or HDMI).
  @_s.JsonKey(name: 'activeInput')
  final InputDeviceActiveInput activeInput;

  /// The source at the input device that is currently active. You can specify
  /// this source.
  @_s.JsonKey(name: 'configuredInput')
  final InputDeviceConfiguredInput configuredInput;

  /// The state of the input device.
  @_s.JsonKey(name: 'deviceState')
  final InputDeviceState deviceState;

  /// The frame rate of the video source.
  @_s.JsonKey(name: 'framerate')
  final double framerate;

  /// The height of the video source, in pixels.
  @_s.JsonKey(name: 'height')
  final int height;

  /// The current maximum bitrate for ingesting this source, in bits per second.
  /// You can specify this maximum.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// The scan type of the video source.
  @_s.JsonKey(name: 'scanType')
  final InputDeviceScanType scanType;

  /// The width of the video source, in pixels.
  @_s.JsonKey(name: 'width')
  final int width;

  InputDeviceHdSettings({
    this.activeInput,
    this.configuredInput,
    this.deviceState,
    this.framerate,
    this.height,
    this.maxBitrate,
    this.scanType,
    this.width,
  });
  factory InputDeviceHdSettings.fromJson(Map<String, dynamic> json) =>
      _$InputDeviceHdSettingsFromJson(json);
}

/// Specifies whether the input device has been configured (outside of
/// MediaLive) to use a dynamic IP address assignment (DHCP) or a static IP
/// address.
enum InputDeviceIpScheme {
  @_s.JsonValue('STATIC')
  static,
  @_s.JsonValue('DHCP')
  dhcp,
}

/// The network settings for the input device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputDeviceNetworkSettings {
  /// The DNS addresses of the input device.
  @_s.JsonKey(name: 'dnsAddresses')
  final List<String> dnsAddresses;

  /// The network gateway IP address.
  @_s.JsonKey(name: 'gateway')
  final String gateway;

  /// The IP address of the input device.
  @_s.JsonKey(name: 'ipAddress')
  final String ipAddress;

  /// Specifies whether the input device has been configured (outside of
  /// MediaLive) to use a dynamic IP address assignment (DHCP) or a static IP
  /// address.
  @_s.JsonKey(name: 'ipScheme')
  final InputDeviceIpScheme ipScheme;

  /// The subnet mask of the input device.
  @_s.JsonKey(name: 'subnetMask')
  final String subnetMask;

  InputDeviceNetworkSettings({
    this.dnsAddresses,
    this.gateway,
    this.ipAddress,
    this.ipScheme,
    this.subnetMask,
  });
  factory InputDeviceNetworkSettings.fromJson(Map<String, dynamic> json) =>
      _$InputDeviceNetworkSettingsFromJson(json);
}

/// Settings for an input device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputDeviceRequest {
  /// The unique ID for the device.
  @_s.JsonKey(name: 'id')
  final String id;

  InputDeviceRequest({
    this.id,
  });
  Map<String, dynamic> toJson() => _$InputDeviceRequestToJson(this);
}

/// The scan type of the video source.
enum InputDeviceScanType {
  @_s.JsonValue('INTERLACED')
  interlaced,
  @_s.JsonValue('PROGRESSIVE')
  progressive,
}

/// Settings for an input device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputDeviceSettings {
  /// The unique ID for the device.
  @_s.JsonKey(name: 'id')
  final String id;

  InputDeviceSettings({
    this.id,
  });
  factory InputDeviceSettings.fromJson(Map<String, dynamic> json) =>
      _$InputDeviceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InputDeviceSettingsToJson(this);
}

/// The state of the input device.
enum InputDeviceState {
  @_s.JsonValue('IDLE')
  idle,
  @_s.JsonValue('STREAMING')
  streaming,
}

/// Details of the input device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputDeviceSummary {
  /// The unique ARN of the input device.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The state of the connection between the input device and AWS.
  @_s.JsonKey(name: 'connectionState')
  final InputDeviceConnectionState connectionState;

  /// The status of the action to synchronize the device configuration. If you
  /// change the configuration of the input device (for example, the maximum
  /// bitrate), MediaLive sends the new data to the device. The device might not
  /// update itself immediately. SYNCED means the device has updated its
  /// configuration. SYNCING means that it has not updated its configuration.
  @_s.JsonKey(name: 'deviceSettingsSyncState')
  final DeviceSettingsSyncState deviceSettingsSyncState;

  /// The status of software on the input device.
  @_s.JsonKey(name: 'deviceUpdateStatus')
  final DeviceUpdateStatus deviceUpdateStatus;

  /// Settings that describe an input device that is type HD.
  @_s.JsonKey(name: 'hdDeviceSettings')
  final InputDeviceHdSettings hdDeviceSettings;

  /// The unique ID of the input device.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The network MAC address of the input device.
  @_s.JsonKey(name: 'macAddress')
  final String macAddress;

  /// A name that you specify for the input device.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Network settings for the input device.
  @_s.JsonKey(name: 'networkSettings')
  final InputDeviceNetworkSettings networkSettings;

  /// The unique serial number of the input device.
  @_s.JsonKey(name: 'serialNumber')
  final String serialNumber;

  /// The type of the input device.
  @_s.JsonKey(name: 'type')
  final InputDeviceType type;

  /// Settings that describe an input device that is type UHD.
  @_s.JsonKey(name: 'uhdDeviceSettings')
  final InputDeviceUhdSettings uhdDeviceSettings;

  InputDeviceSummary({
    this.arn,
    this.connectionState,
    this.deviceSettingsSyncState,
    this.deviceUpdateStatus,
    this.hdDeviceSettings,
    this.id,
    this.macAddress,
    this.name,
    this.networkSettings,
    this.serialNumber,
    this.type,
    this.uhdDeviceSettings,
  });
  factory InputDeviceSummary.fromJson(Map<String, dynamic> json) =>
      _$InputDeviceSummaryFromJson(json);
}

/// The type of device transfer. INCOMING for an input device that is being
/// transferred to you, OUTGOING for an input device that you are transferring
/// to another AWS account.
enum InputDeviceTransferType {
  @_s.JsonValue('OUTGOING')
  outgoing,
  @_s.JsonValue('INCOMING')
  incoming,
}

/// The type of the input device. For an AWS Elemental Link device that outputs
/// resolutions up to 1080, choose "HD".
enum InputDeviceType {
  @_s.JsonValue('HD')
  hd,
}

/// Settings that describe the active source from the input device, and the
/// video characteristics of that source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputDeviceUhdSettings {
  /// If you specified Auto as the configured input, specifies which of the
  /// sources is currently active (SDI or HDMI).
  @_s.JsonKey(name: 'activeInput')
  final InputDeviceActiveInput activeInput;

  /// The source at the input device that is currently active. You can specify
  /// this source.
  @_s.JsonKey(name: 'configuredInput')
  final InputDeviceConfiguredInput configuredInput;

  /// The state of the input device.
  @_s.JsonKey(name: 'deviceState')
  final InputDeviceState deviceState;

  /// The frame rate of the video source.
  @_s.JsonKey(name: 'framerate')
  final double framerate;

  /// The height of the video source, in pixels.
  @_s.JsonKey(name: 'height')
  final int height;

  /// The current maximum bitrate for ingesting this source, in bits per second.
  /// You can specify this maximum.
  @_s.JsonKey(name: 'maxBitrate')
  final int maxBitrate;

  /// The scan type of the video source.
  @_s.JsonKey(name: 'scanType')
  final InputDeviceScanType scanType;

  /// The width of the video source, in pixels.
  @_s.JsonKey(name: 'width')
  final int width;

  InputDeviceUhdSettings({
    this.activeInput,
    this.configuredInput,
    this.deviceState,
    this.framerate,
    this.height,
    this.maxBitrate,
    this.scanType,
    this.width,
  });
  factory InputDeviceUhdSettings.fromJson(Map<String, dynamic> json) =>
      _$InputDeviceUhdSettingsFromJson(json);
}

/// Input Filter
enum InputFilter {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('FORCED')
  forced,
}

/// Input Location
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputLocation {
  /// Uniform Resource Identifier - This should be a path to a file accessible to
  /// the Live system (eg. a http:// URI) depending on the output type. For
  /// example, a RTMP destination should have a uri simliar to:
  /// "rtmp://fmsserver/live".
  @_s.JsonKey(name: 'uri')
  final String uri;

  /// key used to extract the password from EC2 Parameter store
  @_s.JsonKey(name: 'passwordParam')
  final String passwordParam;

  /// Documentation update needed
  @_s.JsonKey(name: 'username')
  final String username;

  InputLocation({
    @_s.required this.uri,
    this.passwordParam,
    this.username,
  });
  factory InputLocation.fromJson(Map<String, dynamic> json) =>
      _$InputLocationFromJson(json);

  Map<String, dynamic> toJson() => _$InputLocationToJson(this);
}

/// Input Loss Action For Hls Out
enum InputLossActionForHlsOut {
  @_s.JsonValue('EMIT_OUTPUT')
  emitOutput,
  @_s.JsonValue('PAUSE_OUTPUT')
  pauseOutput,
}

/// Input Loss Action For Ms Smooth Out
enum InputLossActionForMsSmoothOut {
  @_s.JsonValue('EMIT_OUTPUT')
  emitOutput,
  @_s.JsonValue('PAUSE_OUTPUT')
  pauseOutput,
}

/// Input Loss Action For Rtmp Out
enum InputLossActionForRtmpOut {
  @_s.JsonValue('EMIT_OUTPUT')
  emitOutput,
  @_s.JsonValue('PAUSE_OUTPUT')
  pauseOutput,
}

/// Input Loss Action For Udp Out
enum InputLossActionForUdpOut {
  @_s.JsonValue('DROP_PROGRAM')
  dropProgram,
  @_s.JsonValue('DROP_TS')
  dropTs,
  @_s.JsonValue('EMIT_PROGRAM')
  emitProgram,
}

/// Input Loss Behavior
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputLossBehavior {
  /// Documentation update needed
  @_s.JsonKey(name: 'blackFrameMsec')
  final int blackFrameMsec;

  /// When input loss image type is "color" this field specifies the color to use.
  /// Value: 6 hex characters representing the values of RGB.
  @_s.JsonKey(name: 'inputLossImageColor')
  final String inputLossImageColor;

  /// When input loss image type is "slate" these fields specify the parameters
  /// for accessing the slate.
  @_s.JsonKey(name: 'inputLossImageSlate')
  final InputLocation inputLossImageSlate;

  /// Indicates whether to substitute a solid color or a slate into the output
  /// after input loss exceeds blackFrameMsec.
  @_s.JsonKey(name: 'inputLossImageType')
  final InputLossImageType inputLossImageType;

  /// Documentation update needed
  @_s.JsonKey(name: 'repeatFrameMsec')
  final int repeatFrameMsec;

  InputLossBehavior({
    this.blackFrameMsec,
    this.inputLossImageColor,
    this.inputLossImageSlate,
    this.inputLossImageType,
    this.repeatFrameMsec,
  });
  factory InputLossBehavior.fromJson(Map<String, dynamic> json) =>
      _$InputLossBehaviorFromJson(json);

  Map<String, dynamic> toJson() => _$InputLossBehaviorToJson(this);
}

/// MediaLive will perform a failover if content is not detected in this input
/// for the specified period.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputLossFailoverSettings {
  /// The amount of time (in milliseconds) that no input is detected. After that
  /// time, an input failover will occur.
  @_s.JsonKey(name: 'inputLossThresholdMsec')
  final int inputLossThresholdMsec;

  InputLossFailoverSettings({
    this.inputLossThresholdMsec,
  });
  factory InputLossFailoverSettings.fromJson(Map<String, dynamic> json) =>
      _$InputLossFailoverSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InputLossFailoverSettingsToJson(this);
}

/// Input Loss Image Type
enum InputLossImageType {
  @_s.JsonValue('COLOR')
  color,
  @_s.JsonValue('SLATE')
  slate,
}

/// Maximum input bitrate in megabits per second. Bitrates up to 50 Mbps are
/// supported currently.
enum InputMaximumBitrate {
  @_s.JsonValue('MAX_10_MBPS')
  max_10Mbps,
  @_s.JsonValue('MAX_20_MBPS')
  max_20Mbps,
  @_s.JsonValue('MAX_50_MBPS')
  max_50Mbps,
}

/// Input preference when deciding which input to make active when a previously
/// failed input has recovered.
/// If \"EQUAL_INPUT_PREFERENCE\", then the active input will stay active as
/// long as it is healthy.
/// If \"PRIMARY_INPUT_PREFERRED\", then always switch back to the primary input
/// when it is healthy.
enum InputPreference {
  @_s.JsonValue('EQUAL_INPUT_PREFERENCE')
  equalInputPreference,
  @_s.JsonValue('PRIMARY_INPUT_PREFERRED')
  primaryInputPreferred,
}

/// Action to prepare an input for a future immediate input switch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputPrepareScheduleActionSettings {
  /// The name of the input attachment that should be prepared by this action. If
  /// no name is provided, the action will stop the most recent prepare (if any)
  /// when activated.
  @_s.JsonKey(name: 'inputAttachmentNameReference')
  final String inputAttachmentNameReference;

  /// Settings to let you create a clip of the file input, in order to set up the
  /// input to ingest only a portion of the file.
  @_s.JsonKey(name: 'inputClippingSettings')
  final InputClippingSettings inputClippingSettings;

  /// The value for the variable portion of the URL for the dynamic input, for
  /// this instance of the input. Each time you use the same dynamic input in an
  /// input switch action, you can provide a different value, in order to connect
  /// the input to a different content source.
  @_s.JsonKey(name: 'urlPath')
  final List<String> urlPath;

  InputPrepareScheduleActionSettings({
    this.inputAttachmentNameReference,
    this.inputClippingSettings,
    this.urlPath,
  });
  factory InputPrepareScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$InputPrepareScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InputPrepareScheduleActionSettingsToJson(this);
}

/// Input resolution based on lines of vertical resolution in the input; SD is
/// less than 720 lines, HD is 720 to 1080 lines, UHD is greater than 1080 lines
enum InputResolution {
  @_s.JsonValue('SD')
  sd,
  @_s.JsonValue('HD')
  hd,
  @_s.JsonValue('UHD')
  uhd,
}

/// An Input Security Group
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputSecurityGroup {
  /// Unique ARN of Input Security Group
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Id of the Input Security Group
  @_s.JsonKey(name: 'id')
  final String id;

  /// The list of inputs currently using this Input Security Group.
  @_s.JsonKey(name: 'inputs')
  final List<String> inputs;

  /// The current state of the Input Security Group.
  @_s.JsonKey(name: 'state')
  final InputSecurityGroupState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Whitelist rules and their sync status
  @_s.JsonKey(name: 'whitelistRules')
  final List<InputWhitelistRule> whitelistRules;

  InputSecurityGroup({
    this.arn,
    this.id,
    this.inputs,
    this.state,
    this.tags,
    this.whitelistRules,
  });
  factory InputSecurityGroup.fromJson(Map<String, dynamic> json) =>
      _$InputSecurityGroupFromJson(json);
}

/// Placeholder documentation for InputSecurityGroupState
enum InputSecurityGroupState {
  @_s.JsonValue('IDLE')
  idle,
  @_s.JsonValue('IN_USE')
  inUse,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Live Event input parameters. There can be multiple inputs in a single Live
/// Event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputSettings {
  /// Used to select the audio stream to decode for inputs that have multiple
  /// available.
  @_s.JsonKey(name: 'audioSelectors')
  final List<AudioSelector> audioSelectors;

  /// Used to select the caption input to use for inputs that have multiple
  /// available.
  @_s.JsonKey(name: 'captionSelectors')
  final List<CaptionSelector> captionSelectors;

  /// Enable or disable the deblock filter when filtering.
  @_s.JsonKey(name: 'deblockFilter')
  final InputDeblockFilter deblockFilter;

  /// Enable or disable the denoise filter when filtering.
  @_s.JsonKey(name: 'denoiseFilter')
  final InputDenoiseFilter denoiseFilter;

  /// Adjusts the magnitude of filtering from 1 (minimal) to 5 (strongest).
  @_s.JsonKey(name: 'filterStrength')
  final int filterStrength;

  /// Turns on the filter for this input. MPEG-2 inputs have the deblocking filter
  /// enabled by default.
  /// 1) auto - filtering will be applied depending on input type/quality
  /// 2) disabled - no filtering will be applied to the input
  /// 3) forced - filtering will be applied regardless of input type
  @_s.JsonKey(name: 'inputFilter')
  final InputFilter inputFilter;

  /// Input settings.
  @_s.JsonKey(name: 'networkInputSettings')
  final NetworkInputSettings networkInputSettings;

  /// Specifies whether to extract applicable ancillary data from a SMPTE-2038
  /// source in this input. Applicable data types are captions, timecode, AFD, and
  /// SCTE-104 messages.
  /// - PREFER: Extract from SMPTE-2038 if present in this input, otherwise
  /// extract from another source (if any).
  /// - IGNORE: Never extract any ancillary data from SMPTE-2038.
  @_s.JsonKey(name: 'smpte2038DataPreference')
  final Smpte2038DataPreference smpte2038DataPreference;

  /// Loop input if it is a file. This allows a file input to be streamed
  /// indefinitely.
  @_s.JsonKey(name: 'sourceEndBehavior')
  final InputSourceEndBehavior sourceEndBehavior;

  /// Informs which video elementary stream to decode for input types that have
  /// multiple available.
  @_s.JsonKey(name: 'videoSelector')
  final VideoSelector videoSelector;

  InputSettings({
    this.audioSelectors,
    this.captionSelectors,
    this.deblockFilter,
    this.denoiseFilter,
    this.filterStrength,
    this.inputFilter,
    this.networkInputSettings,
    this.smpte2038DataPreference,
    this.sourceEndBehavior,
    this.videoSelector,
  });
  factory InputSettings.fromJson(Map<String, dynamic> json) =>
      _$InputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InputSettingsToJson(this);
}

/// The settings for a PULL type input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputSource {
  /// The key used to extract the password from EC2 Parameter store.
  @_s.JsonKey(name: 'passwordParam')
  final String passwordParam;

  /// This represents the customer's source URL where stream is
  /// pulled from.
  @_s.JsonKey(name: 'url')
  final String url;

  /// The username for the input source.
  @_s.JsonKey(name: 'username')
  final String username;

  InputSource({
    this.passwordParam,
    this.url,
    this.username,
  });
  factory InputSource.fromJson(Map<String, dynamic> json) =>
      _$InputSourceFromJson(json);
}

/// Input Source End Behavior
enum InputSourceEndBehavior {
  @_s.JsonValue('CONTINUE')
  $continue,
  @_s.JsonValue('LOOP')
  loop,
}

/// Settings for for a PULL type input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputSourceRequest {
  /// The key used to extract the password from EC2 Parameter store.
  @_s.JsonKey(name: 'passwordParam')
  final String passwordParam;

  /// This represents the customer's source URL where stream is
  /// pulled from.
  @_s.JsonKey(name: 'url')
  final String url;

  /// The username for the input source.
  @_s.JsonKey(name: 'username')
  final String username;

  InputSourceRequest({
    this.passwordParam,
    this.url,
    this.username,
  });
  Map<String, dynamic> toJson() => _$InputSourceRequestToJson(this);
}

/// There are two types of input sources, static and dynamic. If an input source
/// is dynamic you can
/// change the source url of the input dynamically using an input switch action.
/// However, the only input type
/// to support a dynamic url at this time is MP4_FILE. By default all input
/// sources are static.
enum InputSourceType {
  @_s.JsonValue('STATIC')
  static,
  @_s.JsonValue('DYNAMIC')
  dynamic,
}

/// Placeholder documentation for InputSpecification
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputSpecification {
  /// Input codec
  @_s.JsonKey(name: 'codec')
  final InputCodec codec;

  /// Maximum input bitrate, categorized coarsely
  @_s.JsonKey(name: 'maximumBitrate')
  final InputMaximumBitrate maximumBitrate;

  /// Input resolution, categorized coarsely
  @_s.JsonKey(name: 'resolution')
  final InputResolution resolution;

  InputSpecification({
    this.codec,
    this.maximumBitrate,
    this.resolution,
  });
  factory InputSpecification.fromJson(Map<String, dynamic> json) =>
      _$InputSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$InputSpecificationToJson(this);
}

/// Placeholder documentation for InputState
enum InputState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DETACHED')
  detached,
  @_s.JsonValue('ATTACHED')
  attached,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Settings for the "switch input" action: to switch from ingesting one input
/// to ingesting another input.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputSwitchScheduleActionSettings {
  /// The name of the input attachment (not the name of the input!) to switch to.
  /// The name is specified in the channel configuration.
  @_s.JsonKey(name: 'inputAttachmentNameReference')
  final String inputAttachmentNameReference;

  /// Settings to let you create a clip of the file input, in order to set up the
  /// input to ingest only a portion of the file.
  @_s.JsonKey(name: 'inputClippingSettings')
  final InputClippingSettings inputClippingSettings;

  /// The value for the variable portion of the URL for the dynamic input, for
  /// this instance of the input. Each time you use the same dynamic input in an
  /// input switch action, you can provide a different value, in order to connect
  /// the input to a different content source.
  @_s.JsonKey(name: 'urlPath')
  final List<String> urlPath;

  InputSwitchScheduleActionSettings({
    @_s.required this.inputAttachmentNameReference,
    this.inputClippingSettings,
    this.urlPath,
  });
  factory InputSwitchScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$InputSwitchScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InputSwitchScheduleActionSettingsToJson(this);
}

/// Documentation update needed
enum InputTimecodeSource {
  @_s.JsonValue('ZEROBASED')
  zerobased,
  @_s.JsonValue('EMBEDDED')
  embedded,
}

/// Placeholder documentation for InputType
enum InputType {
  @_s.JsonValue('UDP_PUSH')
  udpPush,
  @_s.JsonValue('RTP_PUSH')
  rtpPush,
  @_s.JsonValue('RTMP_PUSH')
  rtmpPush,
  @_s.JsonValue('RTMP_PULL')
  rtmpPull,
  @_s.JsonValue('URL_PULL')
  urlPull,
  @_s.JsonValue('MP4_FILE')
  mp4File,
  @_s.JsonValue('MEDIACONNECT')
  mediaconnect,
  @_s.JsonValue('INPUT_DEVICE')
  inputDevice,
  @_s.JsonValue('AWS_CDI')
  awsCdi,
}

extension on InputType {
  String toValue() {
    switch (this) {
      case InputType.udpPush:
        return 'UDP_PUSH';
      case InputType.rtpPush:
        return 'RTP_PUSH';
      case InputType.rtmpPush:
        return 'RTMP_PUSH';
      case InputType.rtmpPull:
        return 'RTMP_PULL';
      case InputType.urlPull:
        return 'URL_PULL';
      case InputType.mp4File:
        return 'MP4_FILE';
      case InputType.mediaconnect:
        return 'MEDIACONNECT';
      case InputType.inputDevice:
        return 'INPUT_DEVICE';
      case InputType.awsCdi:
        return 'AWS_CDI';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Settings for a private VPC Input.
/// When this property is specified, the input destination addresses will be
/// created in a VPC rather than with public Internet addresses.
/// This property requires setting the roleArn property on Input creation.
/// Not compatible with the inputSecurityGroups property.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputVpcRequest {
  /// A list of 2 VPC subnet IDs from the same VPC.
  /// Subnet IDs must be mapped to two unique availability zones (AZ).
  @_s.JsonKey(name: 'subnetIds')
  final List<String> subnetIds;

  /// A list of up to 5 EC2 VPC security group IDs to attach to the Input VPC
  /// network interfaces.
  /// Requires subnetIds. If none are specified then the VPC default security
  /// group will be used.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  InputVpcRequest({
    @_s.required this.subnetIds,
    this.securityGroupIds,
  });
  Map<String, dynamic> toJson() => _$InputVpcRequestToJson(this);
}

/// Whitelist rule
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InputWhitelistRule {
  /// The IPv4 CIDR that's whitelisted.
  @_s.JsonKey(name: 'cidr')
  final String cidr;

  InputWhitelistRule({
    this.cidr,
  });
  factory InputWhitelistRule.fromJson(Map<String, dynamic> json) =>
      _$InputWhitelistRuleFromJson(json);
}

/// An IPv4 CIDR to whitelist.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class InputWhitelistRuleCidr {
  /// The IPv4 CIDR to whitelist.
  @_s.JsonKey(name: 'cidr')
  final String cidr;

  InputWhitelistRuleCidr({
    this.cidr,
  });
  Map<String, dynamic> toJson() => _$InputWhitelistRuleCidrToJson(this);
}

/// Key Provider Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KeyProviderSettings {
  @_s.JsonKey(name: 'staticKeySettings')
  final StaticKeySettings staticKeySettings;

  KeyProviderSettings({
    this.staticKeySettings,
  });
  factory KeyProviderSettings.fromJson(Map<String, dynamic> json) =>
      _$KeyProviderSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$KeyProviderSettingsToJson(this);
}

/// If you specify a StopTimecode in an input (in order to clip the file), you
/// can specify if you want the clip to exclude (the default) or include the
/// frame specified by the timecode.
enum LastFrameClippingBehavior {
  @_s.JsonValue('EXCLUDE_LAST_FRAME')
  excludeLastFrame,
  @_s.JsonValue('INCLUDE_LAST_FRAME')
  includeLastFrame,
}

/// Placeholder documentation for ListChannelsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelsResponse {
  @_s.JsonKey(name: 'channels')
  final List<ChannelSummary> channels;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });
  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelsResponseFromJson(json);
}

/// Placeholder documentation for ListInputDeviceTransfersResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInputDeviceTransfersResponse {
  /// The list of devices that you are transferring or are being transferred to
  /// you.
  @_s.JsonKey(name: 'inputDeviceTransfers')
  final List<TransferringInputDeviceSummary> inputDeviceTransfers;

  /// A token to get additional list results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInputDeviceTransfersResponse({
    this.inputDeviceTransfers,
    this.nextToken,
  });
  factory ListInputDeviceTransfersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListInputDeviceTransfersResponseFromJson(json);
}

/// Placeholder documentation for ListInputDevicesResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInputDevicesResponse {
  /// The list of input devices.
  @_s.JsonKey(name: 'inputDevices')
  final List<InputDeviceSummary> inputDevices;

  /// A token to get additional list results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInputDevicesResponse({
    this.inputDevices,
    this.nextToken,
  });
  factory ListInputDevicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInputDevicesResponseFromJson(json);
}

/// Placeholder documentation for ListInputSecurityGroupsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInputSecurityGroupsResponse {
  /// List of input security groups
  @_s.JsonKey(name: 'inputSecurityGroups')
  final List<InputSecurityGroup> inputSecurityGroups;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInputSecurityGroupsResponse({
    this.inputSecurityGroups,
    this.nextToken,
  });
  factory ListInputSecurityGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInputSecurityGroupsResponseFromJson(json);
}

/// Placeholder documentation for ListInputsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInputsResponse {
  @_s.JsonKey(name: 'inputs')
  final List<Input> inputs;
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListInputsResponse({
    this.inputs,
    this.nextToken,
  });
  factory ListInputsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListInputsResponseFromJson(json);
}

/// Placeholder documentation for ListMultiplexProgramsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMultiplexProgramsResponse {
  /// List of multiplex programs.
  @_s.JsonKey(name: 'multiplexPrograms')
  final List<MultiplexProgramSummary> multiplexPrograms;

  /// Token for the next ListMultiplexProgram request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMultiplexProgramsResponse({
    this.multiplexPrograms,
    this.nextToken,
  });
  factory ListMultiplexProgramsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMultiplexProgramsResponseFromJson(json);
}

/// Placeholder documentation for ListMultiplexesResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMultiplexesResponse {
  /// List of multiplexes.
  @_s.JsonKey(name: 'multiplexes')
  final List<MultiplexSummary> multiplexes;

  /// Token for the next ListMultiplexes request.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListMultiplexesResponse({
    this.multiplexes,
    this.nextToken,
  });
  factory ListMultiplexesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMultiplexesResponseFromJson(json);
}

/// Placeholder documentation for ListOfferingsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListOfferingsResponse {
  /// Token to retrieve the next page of results
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of offerings
  @_s.JsonKey(name: 'offerings')
  final List<Offering> offerings;

  ListOfferingsResponse({
    this.nextToken,
    this.offerings,
  });
  factory ListOfferingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListOfferingsResponseFromJson(json);
}

/// Placeholder documentation for ListReservationsResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListReservationsResponse {
  /// Token to retrieve the next page of results
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// List of reservations
  @_s.JsonKey(name: 'reservations')
  final List<Reservation> reservations;

  ListReservationsResponse({
    this.nextToken,
    this.reservations,
  });
  factory ListReservationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListReservationsResponseFromJson(json);
}

/// Placeholder documentation for ListTagsForResourceResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// The log level the user wants for their channel.
enum LogLevel {
  @_s.JsonValue('ERROR')
  error,
  @_s.JsonValue('WARNING')
  warning,
  @_s.JsonValue('INFO')
  info,
  @_s.JsonValue('DEBUG')
  debug,
  @_s.JsonValue('DISABLED')
  disabled,
}

extension on LogLevel {
  String toValue() {
    switch (this) {
      case LogLevel.error:
        return 'ERROR';
      case LogLevel.warning:
        return 'WARNING';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.debug:
        return 'DEBUG';
      case LogLevel.disabled:
        return 'DISABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// M2ts Absent Input Audio Behavior
enum M2tsAbsentInputAudioBehavior {
  @_s.JsonValue('DROP')
  drop,
  @_s.JsonValue('ENCODE_SILENCE')
  encodeSilence,
}

/// M2ts Arib
enum M2tsArib {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// M2ts Arib Captions Pid Control
enum M2tsAribCaptionsPidControl {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// M2ts Audio Buffer Model
enum M2tsAudioBufferModel {
  @_s.JsonValue('ATSC')
  atsc,
  @_s.JsonValue('DVB')
  dvb,
}

/// M2ts Audio Interval
enum M2tsAudioInterval {
  @_s.JsonValue('VIDEO_AND_FIXED_INTERVALS')
  videoAndFixedIntervals,
  @_s.JsonValue('VIDEO_INTERVAL')
  videoInterval,
}

/// M2ts Audio Stream Type
enum M2tsAudioStreamType {
  @_s.JsonValue('ATSC')
  atsc,
  @_s.JsonValue('DVB')
  dvb,
}

/// M2ts Buffer Model
enum M2tsBufferModel {
  @_s.JsonValue('MULTIPLEX')
  multiplex,
  @_s.JsonValue('NONE')
  none,
}

/// M2ts Cc Descriptor
enum M2tsCcDescriptor {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// M2ts Ebif Control
enum M2tsEbifControl {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// M2ts Ebp Placement
enum M2tsEbpPlacement {
  @_s.JsonValue('VIDEO_AND_AUDIO_PIDS')
  videoAndAudioPids,
  @_s.JsonValue('VIDEO_PID')
  videoPid,
}

/// M2ts Es Rate In Pes
enum M2tsEsRateInPes {
  @_s.JsonValue('EXCLUDE')
  exclude,
  @_s.JsonValue('INCLUDE')
  include,
}

/// M2ts Klv
enum M2tsKlv {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// M2ts Nielsen Id3 Behavior
enum M2tsNielsenId3Behavior {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// M2ts Pcr Control
enum M2tsPcrControl {
  @_s.JsonValue('CONFIGURED_PCR_PERIOD')
  configuredPcrPeriod,
  @_s.JsonValue('PCR_EVERY_PES_PACKET')
  pcrEveryPesPacket,
}

/// M2ts Rate Mode
enum M2tsRateMode {
  @_s.JsonValue('CBR')
  cbr,
  @_s.JsonValue('VBR')
  vbr,
}

/// M2ts Scte35 Control
enum M2tsScte35Control {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// M2ts Segmentation Markers
enum M2tsSegmentationMarkers {
  @_s.JsonValue('EBP')
  ebp,
  @_s.JsonValue('EBP_LEGACY')
  ebpLegacy,
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PSI_SEGSTART')
  psiSegstart,
  @_s.JsonValue('RAI_ADAPT')
  raiAdapt,
  @_s.JsonValue('RAI_SEGSTART')
  raiSegstart,
}

/// M2ts Segmentation Style
enum M2tsSegmentationStyle {
  @_s.JsonValue('MAINTAIN_CADENCE')
  maintainCadence,
  @_s.JsonValue('RESET_CADENCE')
  resetCadence,
}

/// M2ts Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class M2tsSettings {
  /// When set to drop, output audio streams will be removed from the program if
  /// the selected input audio stream is removed from the input. This allows the
  /// output audio configuration to dynamically change based on input
  /// configuration. If this is set to encodeSilence, all output audio streams
  /// will output encoded silence when not connected to an active input stream.
  @_s.JsonKey(name: 'absentInputAudioBehavior')
  final M2tsAbsentInputAudioBehavior absentInputAudioBehavior;

  /// When set to enabled, uses ARIB-compliant field muxing and removes video
  /// descriptor.
  @_s.JsonKey(name: 'arib')
  final M2tsArib arib;

  /// Packet Identifier (PID) for ARIB Captions in the transport stream. Can be
  /// entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'aribCaptionsPid')
  final String aribCaptionsPid;

  /// If set to auto, pid number used for ARIB Captions will be auto-selected from
  /// unused pids.  If set to useConfigured, ARIB Captions will be on the
  /// configured pid number.
  @_s.JsonKey(name: 'aribCaptionsPidControl')
  final M2tsAribCaptionsPidControl aribCaptionsPidControl;

  /// When set to dvb, uses DVB buffer model for Dolby Digital audio.  When set to
  /// atsc, the ATSC model is used.
  @_s.JsonKey(name: 'audioBufferModel')
  final M2tsAudioBufferModel audioBufferModel;

  /// The number of audio frames to insert for each PES packet.
  @_s.JsonKey(name: 'audioFramesPerPes')
  final int audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or by
  /// comma separation. Can be entered as decimal or hexadecimal values. Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'audioPids')
  final String audioPids;

  /// When set to atsc, uses stream type = 0x81 for AC3 and stream type = 0x87 for
  /// EAC3. When set to dvb, uses stream type = 0x06.
  @_s.JsonKey(name: 'audioStreamType')
  final M2tsAudioStreamType audioStreamType;

  /// The output bitrate of the transport stream in bits per second. Setting to 0
  /// lets the muxer automatically determine the appropriate bitrate.
  @_s.JsonKey(name: 'bitrate')
  final int bitrate;

  /// Controls the timing accuracy for output network traffic. Leave as MULTIPLEX
  /// to ensure accurate network packet timing. Or set to NONE, which might result
  /// in lower latency but will result in more variability in output network
  /// packet timing. This variability might cause interruptions, jitter, or bursty
  /// behavior in your playback or receiving devices.
  @_s.JsonKey(name: 'bufferModel')
  final M2tsBufferModel bufferModel;

  /// When set to enabled, generates captionServiceDescriptor in PMT.
  @_s.JsonKey(name: 'ccDescriptor')
  final M2tsCcDescriptor ccDescriptor;

  /// Inserts DVB Network Information Table (NIT) at the specified table
  /// repetition interval.
  @_s.JsonKey(name: 'dvbNitSettings')
  final DvbNitSettings dvbNitSettings;

  /// Inserts DVB Service Description Table (SDT) at the specified table
  /// repetition interval.
  @_s.JsonKey(name: 'dvbSdtSettings')
  final DvbSdtSettings dvbSdtSettings;

  /// Packet Identifier (PID) for input source DVB Subtitle data to this output.
  /// Multiple values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values.  Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'dvbSubPids')
  final String dvbSubPids;

  /// Inserts DVB Time and Date Table (TDT) at the specified table repetition
  /// interval.
  @_s.JsonKey(name: 'dvbTdtSettings')
  final DvbTdtSettings dvbTdtSettings;

  /// Packet Identifier (PID) for input source DVB Teletext data to this output.
  /// Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'dvbTeletextPid')
  final String dvbTeletextPid;

  /// If set to passthrough, passes any EBIF data from the input source to this
  /// output.
  @_s.JsonKey(name: 'ebif')
  final M2tsEbifControl ebif;

  /// When videoAndFixedIntervals is selected, audio EBP markers will be added to
  /// partitions 3 and 4. The interval between these additional markers will be
  /// fixed, and will be slightly shorter than the video EBP marker interval. Only
  /// available when EBP Cablelabs segmentation markers are selected.  Partitions
  /// 1 and 2 will always follow the video interval.
  @_s.JsonKey(name: 'ebpAudioInterval')
  final M2tsAudioInterval ebpAudioInterval;

  /// When set, enforces that Encoder Boundary Points do not come within the
  /// specified time interval of each other by looking ahead at input video. If
  /// another EBP is going to come in within the specified time interval, the
  /// current EBP is not emitted, and the segment is "stretched" to the next
  /// marker.  The lookahead value does not add latency to the system. The Live
  /// Event must be configured elsewhere to create sufficient latency to make the
  /// lookahead accurate.
  @_s.JsonKey(name: 'ebpLookaheadMs')
  final int ebpLookaheadMs;

  /// Controls placement of EBP on Audio PIDs. If set to videoAndAudioPids, EBP
  /// markers will be placed on the video PID and all audio PIDs.  If set to
  /// videoPid, EBP markers will be placed on only the video PID.
  @_s.JsonKey(name: 'ebpPlacement')
  final M2tsEbpPlacement ebpPlacement;

  /// This field is unused and deprecated.
  @_s.JsonKey(name: 'ecmPid')
  final String ecmPid;

  /// Include or exclude the ES Rate field in the PES header.
  @_s.JsonKey(name: 'esRateInPes')
  final M2tsEsRateInPes esRateInPes;

  /// Packet Identifier (PID) for input source ETV Platform data to this output.
  /// Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'etvPlatformPid')
  final String etvPlatformPid;

  /// Packet Identifier (PID) for input source ETV Signal data to this output. Can
  /// be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'etvSignalPid')
  final String etvSignalPid;

  /// The length in seconds of each fragment. Only used with EBP markers.
  @_s.JsonKey(name: 'fragmentTime')
  final double fragmentTime;

  /// If set to passthrough, passes any KLV data from the input source to this
  /// output.
  @_s.JsonKey(name: 'klv')
  final M2tsKlv klv;

  /// Packet Identifier (PID) for input source KLV data to this output. Multiple
  /// values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values.  Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'klvDataPids')
  final String klvDataPids;

  /// If set to passthrough, Nielsen inaudible tones for media tracking will be
  /// detected in the input audio and an equivalent ID3 tag will be inserted in
  /// the output.
  @_s.JsonKey(name: 'nielsenId3Behavior')
  final M2tsNielsenId3Behavior nielsenId3Behavior;

  /// Value in bits per second of extra null packets to insert into the transport
  /// stream. This can be used if a downstream encryption system requires periodic
  /// null packets.
  @_s.JsonKey(name: 'nullPacketBitrate')
  final double nullPacketBitrate;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.  Valid values are 0, 10..1000.
  @_s.JsonKey(name: 'patInterval')
  final int patInterval;

  /// When set to pcrEveryPesPacket, a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  @_s.JsonKey(name: 'pcrControl')
  final M2tsPcrControl pcrControl;

  /// Maximum time in milliseconds between Program Clock Reference (PCRs) inserted
  /// into the transport stream.
  @_s.JsonKey(name: 'pcrPeriod')
  final int pcrPeriod;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID. Can be entered as a decimal or hexadecimal value.
  /// Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'pcrPid')
  final String pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. Valid values are 0, 10..1000.
  @_s.JsonKey(name: 'pmtInterval')
  final int pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream. Can be entered as a decimal or hexadecimal value. Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'pmtPid')
  final String pmtPid;

  /// The value of the program number field in the Program Map Table.
  @_s.JsonKey(name: 'programNum')
  final int programNum;

  /// When vbr, does not insert null packets into transport stream to fill
  /// specified bitrate. The bitrate setting acts as the maximum bitrate when vbr
  /// is set.
  @_s.JsonKey(name: 'rateMode')
  final M2tsRateMode rateMode;

  /// Packet Identifier (PID) for input source SCTE-27 data to this output.
  /// Multiple values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values.  Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'scte27Pids')
  final String scte27Pids;

  /// Optionally pass SCTE-35 signals from the input source to this output.
  @_s.JsonKey(name: 'scte35Control')
  final M2tsScte35Control scte35Control;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can
  /// be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'scte35Pid')
  final String scte35Pid;

  /// Inserts segmentation markers at each segmentationTime period. raiSegstart
  /// sets the Random Access Indicator bit in the adaptation field. raiAdapt sets
  /// the RAI bit and adds the current timecode in the private data bytes.
  /// psiSegstart inserts PAT and PMT tables at the start of segments. ebp adds
  /// Encoder Boundary Point information to the adaptation field as per OpenCable
  /// specification OC-SP-EBP-I01-130118. ebpLegacy adds Encoder Boundary Point
  /// information to the adaptation field using a legacy proprietary format.
  @_s.JsonKey(name: 'segmentationMarkers')
  final M2tsSegmentationMarkers segmentationMarkers;

  /// The segmentation style parameter controls how segmentation markers are
  /// inserted into the transport stream. With avails, it is possible that
  /// segments may be truncated, which can influence where future segmentation
  /// markers are inserted.
  ///
  /// When a segmentation style of "resetCadence" is selected and a segment is
  /// truncated due to an avail, we will reset the segmentation cadence. This
  /// means the subsequent segment will have a duration of $segmentationTime
  /// seconds.
  ///
  /// When a segmentation style of "maintainCadence" is selected and a segment is
  /// truncated due to an avail, we will not reset the segmentation cadence. This
  /// means the subsequent segment will likely be truncated as well. However, all
  /// segments after that will have a duration of $segmentationTime seconds. Note
  /// that EBP lookahead is a slight exception to this rule.
  @_s.JsonKey(name: 'segmentationStyle')
  final M2tsSegmentationStyle segmentationStyle;

  /// The length in seconds of each segment. Required unless markers is set to
  /// _none_.
  @_s.JsonKey(name: 'segmentationTime')
  final double segmentationTime;

  /// When set to passthrough, timed metadata will be passed through from input to
  /// output.
  @_s.JsonKey(name: 'timedMetadataBehavior')
  final M2tsTimedMetadataBehavior timedMetadataBehavior;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.  Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'timedMetadataPid')
  final String timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  @_s.JsonKey(name: 'transportStreamId')
  final int transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.  Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'videoPid')
  final String videoPid;

  M2tsSettings({
    this.absentInputAudioBehavior,
    this.arib,
    this.aribCaptionsPid,
    this.aribCaptionsPidControl,
    this.audioBufferModel,
    this.audioFramesPerPes,
    this.audioPids,
    this.audioStreamType,
    this.bitrate,
    this.bufferModel,
    this.ccDescriptor,
    this.dvbNitSettings,
    this.dvbSdtSettings,
    this.dvbSubPids,
    this.dvbTdtSettings,
    this.dvbTeletextPid,
    this.ebif,
    this.ebpAudioInterval,
    this.ebpLookaheadMs,
    this.ebpPlacement,
    this.ecmPid,
    this.esRateInPes,
    this.etvPlatformPid,
    this.etvSignalPid,
    this.fragmentTime,
    this.klv,
    this.klvDataPids,
    this.nielsenId3Behavior,
    this.nullPacketBitrate,
    this.patInterval,
    this.pcrControl,
    this.pcrPeriod,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.programNum,
    this.rateMode,
    this.scte27Pids,
    this.scte35Control,
    this.scte35Pid,
    this.segmentationMarkers,
    this.segmentationStyle,
    this.segmentationTime,
    this.timedMetadataBehavior,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  factory M2tsSettings.fromJson(Map<String, dynamic> json) =>
      _$M2tsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$M2tsSettingsToJson(this);
}

/// M2ts Timed Metadata Behavior
enum M2tsTimedMetadataBehavior {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// M3u8 Nielsen Id3 Behavior
enum M3u8NielsenId3Behavior {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// M3u8 Pcr Control
enum M3u8PcrControl {
  @_s.JsonValue('CONFIGURED_PCR_PERIOD')
  configuredPcrPeriod,
  @_s.JsonValue('PCR_EVERY_PES_PACKET')
  pcrEveryPesPacket,
}

/// M3u8 Scte35 Behavior
enum M3u8Scte35Behavior {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// Settings information for the .m3u8 container
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class M3u8Settings {
  /// The number of audio frames to insert for each PES packet.
  @_s.JsonKey(name: 'audioFramesPerPes')
  final int audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or by
  /// comma separation. Can be entered as decimal or hexadecimal values.
  @_s.JsonKey(name: 'audioPids')
  final String audioPids;

  /// This parameter is unused and deprecated.
  @_s.JsonKey(name: 'ecmPid')
  final String ecmPid;

  /// If set to passthrough, Nielsen inaudible tones for media tracking will be
  /// detected in the input audio and an equivalent ID3 tag will be inserted in
  /// the output.
  @_s.JsonKey(name: 'nielsenId3Behavior')
  final M3u8NielsenId3Behavior nielsenId3Behavior;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. A value of \"0\" writes out the PMT once per segment file.
  @_s.JsonKey(name: 'patInterval')
  final int patInterval;

  /// When set to pcrEveryPesPacket, a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  @_s.JsonKey(name: 'pcrControl')
  final M3u8PcrControl pcrControl;

  /// Maximum time in milliseconds between Program Clock References (PCRs)
  /// inserted into the transport stream.
  @_s.JsonKey(name: 'pcrPeriod')
  final int pcrPeriod;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID. Can be entered as a decimal or hexadecimal value.
  @_s.JsonKey(name: 'pcrPid')
  final String pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. A value of \"0\" writes out the PMT once per segment file.
  @_s.JsonKey(name: 'pmtInterval')
  final int pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.
  @_s.JsonKey(name: 'pmtPid')
  final String pmtPid;

  /// The value of the program number field in the Program Map Table.
  @_s.JsonKey(name: 'programNum')
  final int programNum;

  /// If set to passthrough, passes any SCTE-35 signals from the input source to
  /// this output.
  @_s.JsonKey(name: 'scte35Behavior')
  final M3u8Scte35Behavior scte35Behavior;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can
  /// be entered as a decimal or hexadecimal value.
  @_s.JsonKey(name: 'scte35Pid')
  final String scte35Pid;

  /// When set to passthrough, timed metadata is passed through from input to
  /// output.
  @_s.JsonKey(name: 'timedMetadataBehavior')
  final M3u8TimedMetadataBehavior timedMetadataBehavior;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.  Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  @_s.JsonKey(name: 'timedMetadataPid')
  final String timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  @_s.JsonKey(name: 'transportStreamId')
  final int transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.
  @_s.JsonKey(name: 'videoPid')
  final String videoPid;

  M3u8Settings({
    this.audioFramesPerPes,
    this.audioPids,
    this.ecmPid,
    this.nielsenId3Behavior,
    this.patInterval,
    this.pcrControl,
    this.pcrPeriod,
    this.pcrPid,
    this.pmtInterval,
    this.pmtPid,
    this.programNum,
    this.scte35Behavior,
    this.scte35Pid,
    this.timedMetadataBehavior,
    this.timedMetadataPid,
    this.transportStreamId,
    this.videoPid,
  });
  factory M3u8Settings.fromJson(Map<String, dynamic> json) =>
      _$M3u8SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$M3u8SettingsToJson(this);
}

/// M3u8 Timed Metadata Behavior
enum M3u8TimedMetadataBehavior {
  @_s.JsonValue('NO_PASSTHROUGH')
  noPassthrough,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// The settings for a MediaConnect Flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MediaConnectFlow {
  /// The unique ARN of the MediaConnect Flow being used as a source.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  MediaConnectFlow({
    this.flowArn,
  });
  factory MediaConnectFlow.fromJson(Map<String, dynamic> json) =>
      _$MediaConnectFlowFromJson(json);
}

/// The settings for a MediaConnect Flow.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MediaConnectFlowRequest {
  /// The ARN of the MediaConnect Flow that you want to use as a source.
  @_s.JsonKey(name: 'flowArn')
  final String flowArn;

  MediaConnectFlowRequest({
    this.flowArn,
  });
  Map<String, dynamic> toJson() => _$MediaConnectFlowRequestToJson(this);
}

/// Media Package Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MediaPackageGroupSettings {
  /// MediaPackage channel destination.
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  MediaPackageGroupSettings({
    @_s.required this.destination,
  });
  factory MediaPackageGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$MediaPackageGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPackageGroupSettingsToJson(this);
}

/// MediaPackage Output Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MediaPackageOutputDestinationSettings {
  /// ID of the channel in MediaPackage that is the destination for this output
  /// group. You do not need to specify the individual inputs in MediaPackage;
  /// MediaLive will handle the connection of the two MediaLive pipelines to the
  /// two MediaPackage inputs. The MediaPackage channel and MediaLive channel must
  /// be in the same region.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  MediaPackageOutputDestinationSettings({
    this.channelId,
  });
  factory MediaPackageOutputDestinationSettings.fromJson(
          Map<String, dynamic> json) =>
      _$MediaPackageOutputDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MediaPackageOutputDestinationSettingsToJson(this);
}

/// Media Package Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MediaPackageOutputSettings {
  MediaPackageOutputSettings();
  factory MediaPackageOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$MediaPackageOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPackageOutputSettingsToJson(this);
}

/// Mp2 Coding Mode
enum Mp2CodingMode {
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
}

/// Mp2 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Mp2Settings {
  /// Average bitrate in bits/second.
  @_s.JsonKey(name: 'bitrate')
  final double bitrate;

  /// The MPEG2 Audio coding mode.  Valid values are codingMode10 (for mono) or
  /// codingMode20 (for stereo).
  @_s.JsonKey(name: 'codingMode')
  final Mp2CodingMode codingMode;

  /// Sample rate in Hz.
  @_s.JsonKey(name: 'sampleRate')
  final double sampleRate;

  Mp2Settings({
    this.bitrate,
    this.codingMode,
    this.sampleRate,
  });
  factory Mp2Settings.fromJson(Map<String, dynamic> json) =>
      _$Mp2SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Mp2SettingsToJson(this);
}

/// Mpeg2 Adaptive Quantization
enum Mpeg2AdaptiveQuantization {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('OFF')
  off,
}

/// Mpeg2 Color Metadata
enum Mpeg2ColorMetadata {
  @_s.JsonValue('IGNORE')
  ignore,
  @_s.JsonValue('INSERT')
  insert,
}

/// Mpeg2 Color Space
enum Mpeg2ColorSpace {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
}

/// Mpeg2 Display Ratio
enum Mpeg2DisplayRatio {
  @_s.JsonValue('DISPLAYRATIO16X9')
  displayratio16x9,
  @_s.JsonValue('DISPLAYRATIO4X3')
  displayratio4x3,
}

/// Mpeg2 Filter Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Mpeg2FilterSettings {
  @_s.JsonKey(name: 'temporalFilterSettings')
  final TemporalFilterSettings temporalFilterSettings;

  Mpeg2FilterSettings({
    this.temporalFilterSettings,
  });
  factory Mpeg2FilterSettings.fromJson(Map<String, dynamic> json) =>
      _$Mpeg2FilterSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Mpeg2FilterSettingsToJson(this);
}

/// Mpeg2 Gop Size Units
enum Mpeg2GopSizeUnits {
  @_s.JsonValue('FRAMES')
  frames,
  @_s.JsonValue('SECONDS')
  seconds,
}

/// Mpeg2 Scan Type
enum Mpeg2ScanType {
  @_s.JsonValue('INTERLACED')
  interlaced,
  @_s.JsonValue('PROGRESSIVE')
  progressive,
}

/// Mpeg2 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Mpeg2Settings {
  /// description": "The framerate denominator. For example, 1001. The framerate
  /// is the numerator divided by the denominator. For example, 24000 / 1001 =
  /// 23.976 FPS.
  @_s.JsonKey(name: 'framerateDenominator')
  final int framerateDenominator;

  /// The framerate numerator. For example, 24000. The framerate is the numerator
  /// divided by the denominator. For example, 24000 / 1001 = 23.976 FPS.
  @_s.JsonKey(name: 'framerateNumerator')
  final int framerateNumerator;

  /// Choose Off to disable adaptive quantization. Or choose another value to
  /// enable the quantizer and set its strength. The strengths are: Auto, Off,
  /// Low, Medium, High. When you enable this field, MediaLive allows intra-frame
  /// quantizers to vary, which might improve visual quality.
  @_s.JsonKey(name: 'adaptiveQuantization')
  final Mpeg2AdaptiveQuantization adaptiveQuantization;

  /// Indicates the AFD values that MediaLive will write into the video encode. If
  /// you do not know what AFD signaling is, or if your downstream system has not
  /// given you guidance, choose AUTO.
  /// AUTO: MediaLive will try to preserve the input AFD value (in cases where
  /// multiple AFD values are valid).
  /// FIXED: MediaLive will use the value you specify in fixedAFD.
  @_s.JsonKey(name: 'afdSignaling')
  final AfdSignaling afdSignaling;

  /// Specifies whether to include the color space metadata. The metadata
  /// describes the color space that applies to the video (the colorSpace field).
  /// We recommend that you insert the metadata.
  @_s.JsonKey(name: 'colorMetadata')
  final Mpeg2ColorMetadata colorMetadata;

  /// Choose the type of color space conversion to apply to the output. For
  /// detailed information on setting up both the input and the output to obtain
  /// the desired color space in the output, see the section on \"MediaLive
  /// Features - Video - color space\" in the MediaLive User Guide.
  /// PASSTHROUGH: Keep the color space of the input content - do not convert it.
  /// AUTO:Convert all content that is SD to rec 601, and convert all content that
  /// is HD to rec 709.
  @_s.JsonKey(name: 'colorSpace')
  final Mpeg2ColorSpace colorSpace;

  /// Sets the pixel aspect ratio for the encode.
  @_s.JsonKey(name: 'displayAspectRatio')
  final Mpeg2DisplayRatio displayAspectRatio;

  /// Optionally specify a noise reduction filter, which can improve quality of
  /// compressed content. If you do not choose a filter, no filter will be
  /// applied.
  /// TEMPORAL: This filter is useful for both source content that is noisy (when
  /// it has excessive digital artifacts) and source content that is clean.
  /// When the content is noisy, the filter cleans up the source content before
  /// the encoding phase, with these two effects: First, it improves the output
  /// video quality because the content has been cleaned up. Secondly, it
  /// decreases the bandwidth because MediaLive does not waste bits on encoding
  /// noise.
  /// When the content is reasonably clean, the filter tends to decrease the
  /// bitrate.
  @_s.JsonKey(name: 'filterSettings')
  final Mpeg2FilterSettings filterSettings;

  /// Complete this field only when afdSignaling is set to FIXED. Enter the AFD
  /// value (4 bits) to write on all frames of the video encode.
  @_s.JsonKey(name: 'fixedAfd')
  final FixedAfd fixedAfd;

  /// MPEG2: default is open GOP.
  @_s.JsonKey(name: 'gopClosedCadence')
  final int gopClosedCadence;

  /// Relates to the GOP structure. The number of B-frames between reference
  /// frames. If you do not know what a B-frame is, use the default.
  @_s.JsonKey(name: 'gopNumBFrames')
  final int gopNumBFrames;

  /// Relates to the GOP structure. The GOP size (keyframe interval) in the units
  /// specified in gopSizeUnits. If you do not know what GOP is, use the default.
  /// If gopSizeUnits is frames, then the gopSize must be an integer and must be
  /// greater than or equal to 1.
  /// If gopSizeUnits is seconds, the gopSize must be greater than 0, but does not
  /// need to be an integer.
  @_s.JsonKey(name: 'gopSize')
  final double gopSize;

  /// Relates to the GOP structure. Specifies whether the gopSize is specified in
  /// frames or seconds. If you do not plan to change the default gopSize, leave
  /// the default. If you specify SECONDS, MediaLive will internally convert the
  /// gop size to a frame count.
  @_s.JsonKey(name: 'gopSizeUnits')
  final Mpeg2GopSizeUnits gopSizeUnits;

  /// Set the scan type of the output to PROGRESSIVE or INTERLACED (top field
  /// first).
  @_s.JsonKey(name: 'scanType')
  final Mpeg2ScanType scanType;

  /// Relates to the GOP structure. If you do not know what GOP is, use the
  /// default.
  /// FIXED: Set the number of B-frames in each sub-GOP to the value in
  /// gopNumBFrames.
  /// DYNAMIC: Let MediaLive optimize the number of B-frames in each sub-GOP, to
  /// improve visual quality.
  @_s.JsonKey(name: 'subgopLength')
  final Mpeg2SubGopLength subgopLength;

  /// Determines how MediaLive inserts timecodes in the output video. For detailed
  /// information about setting up the input and the output for a timecode, see
  /// the section on \"MediaLive Features - Timecode configuration\" in the
  /// MediaLive User Guide.
  /// DISABLED: do not include timecodes.
  /// GOP_TIMECODE: Include timecode metadata in the GOP header.
  @_s.JsonKey(name: 'timecodeInsertion')
  final Mpeg2TimecodeInsertionBehavior timecodeInsertion;

  Mpeg2Settings({
    @_s.required this.framerateDenominator,
    @_s.required this.framerateNumerator,
    this.adaptiveQuantization,
    this.afdSignaling,
    this.colorMetadata,
    this.colorSpace,
    this.displayAspectRatio,
    this.filterSettings,
    this.fixedAfd,
    this.gopClosedCadence,
    this.gopNumBFrames,
    this.gopSize,
    this.gopSizeUnits,
    this.scanType,
    this.subgopLength,
    this.timecodeInsertion,
  });
  factory Mpeg2Settings.fromJson(Map<String, dynamic> json) =>
      _$Mpeg2SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Mpeg2SettingsToJson(this);
}

/// Mpeg2 Sub Gop Length
enum Mpeg2SubGopLength {
  @_s.JsonValue('DYNAMIC')
  dynamic,
  @_s.JsonValue('FIXED')
  fixed,
}

/// Mpeg2 Timecode Insertion Behavior
enum Mpeg2TimecodeInsertionBehavior {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('GOP_TIMECODE')
  gopTimecode,
}

/// Ms Smooth Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MsSmoothGroupSettings {
  /// Smooth Streaming publish point on an IIS server. Elemental Live acts as a
  /// "Push" encoder to IIS.
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  /// The ID to include in each message in the sparse track. Ignored if
  /// sparseTrackType is NONE.
  @_s.JsonKey(name: 'acquisitionPointId')
  final String acquisitionPointId;

  /// If set to passthrough for an audio-only MS Smooth output, the fragment
  /// absolute time will be set to the current timecode. This option does not
  /// write timecodes to the audio elementary stream.
  @_s.JsonKey(name: 'audioOnlyTimecodeControl')
  final SmoothGroupAudioOnlyTimecodeControl audioOnlyTimecodeControl;

  /// If set to verifyAuthenticity, verify the https certificate chain to a
  /// trusted Certificate Authority (CA).  This will cause https outputs to
  /// self-signed certificates to fail.
  @_s.JsonKey(name: 'certificateMode')
  final SmoothGroupCertificateMode certificateMode;

  /// Number of seconds to wait before retrying connection to the IIS server if
  /// the connection is lost. Content will be cached during this time and the
  /// cache will be be delivered to the IIS server once the connection is
  /// re-established.
  @_s.JsonKey(name: 'connectionRetryInterval')
  final int connectionRetryInterval;

  /// MS Smooth event ID to be sent to the IIS server.
  ///
  /// Should only be specified if eventIdMode is set to useConfigured.
  @_s.JsonKey(name: 'eventId')
  final String eventId;

  /// Specifies whether or not to send an event ID to the IIS server. If no event
  /// ID is sent and the same Live Event is used without changing the publishing
  /// point, clients might see cached video from the previous run.
  ///
  /// Options:
  /// - "useConfigured" - use the value provided in eventId
  /// - "useTimestamp" - generate and send an event ID based on the current
  /// timestamp
  /// - "noEventId" - do not send an event ID to the IIS server.
  @_s.JsonKey(name: 'eventIdMode')
  final SmoothGroupEventIdMode eventIdMode;

  /// When set to sendEos, send EOS signal to IIS server when stopping the event
  @_s.JsonKey(name: 'eventStopBehavior')
  final SmoothGroupEventStopBehavior eventStopBehavior;

  /// Size in seconds of file cache for streaming outputs.
  @_s.JsonKey(name: 'filecacheDuration')
  final int filecacheDuration;

  /// Length of mp4 fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and framerate.
  @_s.JsonKey(name: 'fragmentLength')
  final int fragmentLength;

  /// Parameter that control output group behavior on input loss.
  @_s.JsonKey(name: 'inputLossAction')
  final InputLossActionForMsSmoothOut inputLossAction;

  /// Number of retry attempts.
  @_s.JsonKey(name: 'numRetries')
  final int numRetries;

  /// Number of seconds before initiating a restart due to output failure, due to
  /// exhausting the numRetries on one segment, or exceeding filecacheDuration.
  @_s.JsonKey(name: 'restartDelay')
  final int restartDelay;

  /// useInputSegmentation has been deprecated. The configured segment size is
  /// always used.
  @_s.JsonKey(name: 'segmentationMode')
  final SmoothGroupSegmentationMode segmentationMode;

  /// Number of milliseconds to delay the output from the second pipeline.
  @_s.JsonKey(name: 'sendDelayMs')
  final int sendDelayMs;

  /// Identifies the type of data to place in the sparse track:
  /// - SCTE35: Insert SCTE-35 messages from the source content. With each
  /// message, insert an IDR frame to start a new segment.
  /// - SCTE35_WITHOUT_SEGMENTATION: Insert SCTE-35 messages from the source
  /// content. With each message, insert an IDR frame but don't start a new
  /// segment.
  /// - NONE: Don't generate a sparse track for any outputs in this output group.
  @_s.JsonKey(name: 'sparseTrackType')
  final SmoothGroupSparseTrackType sparseTrackType;

  /// When set to send, send stream manifest so publishing point doesn't start
  /// until all streams start.
  @_s.JsonKey(name: 'streamManifestBehavior')
  final SmoothGroupStreamManifestBehavior streamManifestBehavior;

  /// Timestamp offset for the event.  Only used if timestampOffsetMode is set to
  /// useConfiguredOffset.
  @_s.JsonKey(name: 'timestampOffset')
  final String timestampOffset;

  /// Type of timestamp date offset to use.
  /// - useEventStartDate: Use the date the event was started as the offset
  /// - useConfiguredOffset: Use an explicitly configured date as the offset
  @_s.JsonKey(name: 'timestampOffsetMode')
  final SmoothGroupTimestampOffsetMode timestampOffsetMode;

  MsSmoothGroupSettings({
    @_s.required this.destination,
    this.acquisitionPointId,
    this.audioOnlyTimecodeControl,
    this.certificateMode,
    this.connectionRetryInterval,
    this.eventId,
    this.eventIdMode,
    this.eventStopBehavior,
    this.filecacheDuration,
    this.fragmentLength,
    this.inputLossAction,
    this.numRetries,
    this.restartDelay,
    this.segmentationMode,
    this.sendDelayMs,
    this.sparseTrackType,
    this.streamManifestBehavior,
    this.timestampOffset,
    this.timestampOffsetMode,
  });
  factory MsSmoothGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$MsSmoothGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MsSmoothGroupSettingsToJson(this);
}

/// Ms Smooth H265 Packaging Type
enum MsSmoothH265PackagingType {
  @_s.JsonValue('HEV1')
  hev1,
  @_s.JsonValue('HVC1')
  hvc1,
}

/// Ms Smooth Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MsSmoothOutputSettings {
  /// Only applicable when this output is referencing an H.265 video description.
  /// Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
  @_s.JsonKey(name: 'h265PackagingType')
  final MsSmoothH265PackagingType h265PackagingType;

  /// String concatenated to the end of the destination filename.  Required for
  /// multiple outputs of the same type.
  @_s.JsonKey(name: 'nameModifier')
  final String nameModifier;

  MsSmoothOutputSettings({
    this.h265PackagingType,
    this.nameModifier,
  });
  factory MsSmoothOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$MsSmoothOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MsSmoothOutputSettingsToJson(this);
}

/// The multiplex object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Multiplex {
  /// The unique arn of the multiplex.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of availability zones for the multiplex.
  @_s.JsonKey(name: 'availabilityZones')
  final List<String> availabilityZones;

  /// A list of the multiplex output destinations.
  @_s.JsonKey(name: 'destinations')
  final List<MultiplexOutputDestination> destinations;

  /// The unique id of the multiplex.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Configuration for a multiplex event.
  @_s.JsonKey(name: 'multiplexSettings')
  final MultiplexSettings multiplexSettings;

  /// The name of the multiplex.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The number of programs in the multiplex.
  @_s.JsonKey(name: 'programCount')
  final int programCount;

  /// The current state of the multiplex.
  @_s.JsonKey(name: 'state')
  final MultiplexState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  Multiplex({
    this.arn,
    this.availabilityZones,
    this.destinations,
    this.id,
    this.multiplexSettings,
    this.name,
    this.pipelinesRunningCount,
    this.programCount,
    this.state,
    this.tags,
  });
  factory Multiplex.fromJson(Map<String, dynamic> json) =>
      _$MultiplexFromJson(json);
}

/// Multiplex Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexGroupSettings {
  MultiplexGroupSettings();
  factory MultiplexGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$MultiplexGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplexGroupSettingsToJson(this);
}

/// Multiplex MediaConnect output destination settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexMediaConnectOutputDestinationSettings {
  /// The MediaConnect entitlement ARN available as a Flow source.
  @_s.JsonKey(name: 'entitlementArn')
  final String entitlementArn;

  MultiplexMediaConnectOutputDestinationSettings({
    this.entitlementArn,
  });
  factory MultiplexMediaConnectOutputDestinationSettings.fromJson(
          Map<String, dynamic> json) =>
      _$MultiplexMediaConnectOutputDestinationSettingsFromJson(json);
}

/// Multiplex output destination settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexOutputDestination {
  /// Multiplex MediaConnect output destination settings.
  @_s.JsonKey(name: 'mediaConnectSettings')
  final MultiplexMediaConnectOutputDestinationSettings mediaConnectSettings;

  MultiplexOutputDestination({
    this.mediaConnectSettings,
  });
  factory MultiplexOutputDestination.fromJson(Map<String, dynamic> json) =>
      _$MultiplexOutputDestinationFromJson(json);
}

/// Multiplex Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexOutputSettings {
  /// Destination is a Multiplex.
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  MultiplexOutputSettings({
    @_s.required this.destination,
  });
  factory MultiplexOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$MultiplexOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplexOutputSettingsToJson(this);
}

/// The multiplex program object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexProgram {
  /// The MediaLive channel associated with the program.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  /// The settings for this multiplex program.
  @_s.JsonKey(name: 'multiplexProgramSettings')
  final MultiplexProgramSettings multiplexProgramSettings;

  /// The packet identifier map for this multiplex program.
  @_s.JsonKey(name: 'packetIdentifiersMap')
  final MultiplexProgramPacketIdentifiersMap packetIdentifiersMap;

  /// Contains information about the current sources for the specified program in
  /// the specified multiplex. Keep in mind that each multiplex pipeline connects
  /// to both pipelines in a given source channel (the channel identified by the
  /// program). But only one of those channel pipelines is ever active at one
  /// time.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<MultiplexProgramPipelineDetail> pipelineDetails;

  /// The name of the multiplex program.
  @_s.JsonKey(name: 'programName')
  final String programName;

  MultiplexProgram({
    this.channelId,
    this.multiplexProgramSettings,
    this.packetIdentifiersMap,
    this.pipelineDetails,
    this.programName,
  });
  factory MultiplexProgram.fromJson(Map<String, dynamic> json) =>
      _$MultiplexProgramFromJson(json);
}

/// Multiplex Program Input Destination Settings for outputting a Channel to a
/// Multiplex
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexProgramChannelDestinationSettings {
  /// The ID of the Multiplex that the encoder is providing output to. You do not
  /// need to specify the individual inputs to the Multiplex; MediaLive will
  /// handle the connection of the two MediaLive pipelines to the two Multiplex
  /// instances.
  /// The Multiplex must be in the same region as the Channel.
  @_s.JsonKey(name: 'multiplexId')
  final String multiplexId;

  /// The program name of the Multiplex program that the encoder is providing
  /// output to.
  @_s.JsonKey(name: 'programName')
  final String programName;

  MultiplexProgramChannelDestinationSettings({
    this.multiplexId,
    this.programName,
  });
  factory MultiplexProgramChannelDestinationSettings.fromJson(
          Map<String, dynamic> json) =>
      _$MultiplexProgramChannelDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MultiplexProgramChannelDestinationSettingsToJson(this);
}

/// Packet identifiers map for a given Multiplex program.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexProgramPacketIdentifiersMap {
  @_s.JsonKey(name: 'audioPids')
  final List<int> audioPids;
  @_s.JsonKey(name: 'dvbSubPids')
  final List<int> dvbSubPids;
  @_s.JsonKey(name: 'dvbTeletextPid')
  final int dvbTeletextPid;
  @_s.JsonKey(name: 'etvPlatformPid')
  final int etvPlatformPid;
  @_s.JsonKey(name: 'etvSignalPid')
  final int etvSignalPid;
  @_s.JsonKey(name: 'klvDataPids')
  final List<int> klvDataPids;
  @_s.JsonKey(name: 'pcrPid')
  final int pcrPid;
  @_s.JsonKey(name: 'pmtPid')
  final int pmtPid;
  @_s.JsonKey(name: 'privateMetadataPid')
  final int privateMetadataPid;
  @_s.JsonKey(name: 'scte27Pids')
  final List<int> scte27Pids;
  @_s.JsonKey(name: 'scte35Pid')
  final int scte35Pid;
  @_s.JsonKey(name: 'timedMetadataPid')
  final int timedMetadataPid;
  @_s.JsonKey(name: 'videoPid')
  final int videoPid;

  MultiplexProgramPacketIdentifiersMap({
    this.audioPids,
    this.dvbSubPids,
    this.dvbTeletextPid,
    this.etvPlatformPid,
    this.etvSignalPid,
    this.klvDataPids,
    this.pcrPid,
    this.pmtPid,
    this.privateMetadataPid,
    this.scte27Pids,
    this.scte35Pid,
    this.timedMetadataPid,
    this.videoPid,
  });
  factory MultiplexProgramPacketIdentifiersMap.fromJson(
          Map<String, dynamic> json) =>
      _$MultiplexProgramPacketIdentifiersMapFromJson(json);
}

/// The current source for one of the pipelines in the multiplex.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexProgramPipelineDetail {
  /// Identifies the channel pipeline that is currently active for the pipeline
  /// (identified by PipelineId) in the multiplex.
  @_s.JsonKey(name: 'activeChannelPipeline')
  final String activeChannelPipeline;

  /// Identifies a specific pipeline in the multiplex.
  @_s.JsonKey(name: 'pipelineId')
  final String pipelineId;

  MultiplexProgramPipelineDetail({
    this.activeChannelPipeline,
    this.pipelineId,
  });
  factory MultiplexProgramPipelineDetail.fromJson(Map<String, dynamic> json) =>
      _$MultiplexProgramPipelineDetailFromJson(json);
}

/// Transport stream service descriptor configuration for the Multiplex program.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexProgramServiceDescriptor {
  /// Name of the provider.
  @_s.JsonKey(name: 'providerName')
  final String providerName;

  /// Name of the service.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  MultiplexProgramServiceDescriptor({
    @_s.required this.providerName,
    @_s.required this.serviceName,
  });
  factory MultiplexProgramServiceDescriptor.fromJson(
          Map<String, dynamic> json) =>
      _$MultiplexProgramServiceDescriptorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MultiplexProgramServiceDescriptorToJson(this);
}

/// Multiplex Program settings configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexProgramSettings {
  /// Unique program number.
  @_s.JsonKey(name: 'programNumber')
  final int programNumber;

  /// Indicates which pipeline is preferred by the multiplex for program ingest.
  @_s.JsonKey(name: 'preferredChannelPipeline')
  final PreferredChannelPipeline preferredChannelPipeline;

  /// Transport stream service descriptor configuration for the Multiplex program.
  @_s.JsonKey(name: 'serviceDescriptor')
  final MultiplexProgramServiceDescriptor serviceDescriptor;

  /// Program video settings configuration.
  @_s.JsonKey(name: 'videoSettings')
  final MultiplexVideoSettings videoSettings;

  MultiplexProgramSettings({
    @_s.required this.programNumber,
    this.preferredChannelPipeline,
    this.serviceDescriptor,
    this.videoSettings,
  });
  factory MultiplexProgramSettings.fromJson(Map<String, dynamic> json) =>
      _$MultiplexProgramSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplexProgramSettingsToJson(this);
}

/// Placeholder documentation for MultiplexProgramSummary
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexProgramSummary {
  /// The MediaLive Channel associated with the program.
  @_s.JsonKey(name: 'channelId')
  final String channelId;

  /// The name of the multiplex program.
  @_s.JsonKey(name: 'programName')
  final String programName;

  MultiplexProgramSummary({
    this.channelId,
    this.programName,
  });
  factory MultiplexProgramSummary.fromJson(Map<String, dynamic> json) =>
      _$MultiplexProgramSummaryFromJson(json);
}

/// Contains configuration for a Multiplex event
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexSettings {
  /// Transport stream bit rate.
  @_s.JsonKey(name: 'transportStreamBitrate')
  final int transportStreamBitrate;

  /// Transport stream ID.
  @_s.JsonKey(name: 'transportStreamId')
  final int transportStreamId;

  /// Maximum video buffer delay in milliseconds.
  @_s.JsonKey(name: 'maximumVideoBufferDelayMilliseconds')
  final int maximumVideoBufferDelayMilliseconds;

  /// Transport stream reserved bit rate.
  @_s.JsonKey(name: 'transportStreamReservedBitrate')
  final int transportStreamReservedBitrate;

  MultiplexSettings({
    @_s.required this.transportStreamBitrate,
    @_s.required this.transportStreamId,
    this.maximumVideoBufferDelayMilliseconds,
    this.transportStreamReservedBitrate,
  });
  factory MultiplexSettings.fromJson(Map<String, dynamic> json) =>
      _$MultiplexSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplexSettingsToJson(this);
}

/// Contains summary configuration for a Multiplex event.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexSettingsSummary {
  /// Transport stream bit rate.
  @_s.JsonKey(name: 'transportStreamBitrate')
  final int transportStreamBitrate;

  MultiplexSettingsSummary({
    this.transportStreamBitrate,
  });
  factory MultiplexSettingsSummary.fromJson(Map<String, dynamic> json) =>
      _$MultiplexSettingsSummaryFromJson(json);
}

/// The current state of the multiplex.
enum MultiplexState {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('CREATE_FAILED')
  createFailed,
  @_s.JsonValue('IDLE')
  idle,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('RUNNING')
  running,
  @_s.JsonValue('RECOVERING')
  recovering,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Statmux rate control settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexStatmuxVideoSettings {
  /// Maximum statmux bitrate.
  @_s.JsonKey(name: 'maximumBitrate')
  final int maximumBitrate;

  /// Minimum statmux bitrate.
  @_s.JsonKey(name: 'minimumBitrate')
  final int minimumBitrate;

  /// The purpose of the priority is to use a combination of the\nmultiplex rate
  /// control algorithm and the QVBR capability of the\nencoder to prioritize the
  /// video quality of some channels in a\nmultiplex over others.  Channels that
  /// have a higher priority will\nget higher video quality at the expense of the
  /// video quality of\nother channels in the multiplex with lower priority.
  @_s.JsonKey(name: 'priority')
  final int priority;

  MultiplexStatmuxVideoSettings({
    this.maximumBitrate,
    this.minimumBitrate,
    this.priority,
  });
  factory MultiplexStatmuxVideoSettings.fromJson(Map<String, dynamic> json) =>
      _$MultiplexStatmuxVideoSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplexStatmuxVideoSettingsToJson(this);
}

/// Placeholder documentation for MultiplexSummary
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MultiplexSummary {
  /// The unique arn of the multiplex.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of availability zones for the multiplex.
  @_s.JsonKey(name: 'availabilityZones')
  final List<String> availabilityZones;

  /// The unique id of the multiplex.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Configuration for a multiplex event.
  @_s.JsonKey(name: 'multiplexSettings')
  final MultiplexSettingsSummary multiplexSettings;

  /// The name of the multiplex.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The number of programs in the multiplex.
  @_s.JsonKey(name: 'programCount')
  final int programCount;

  /// The current state of the multiplex.
  @_s.JsonKey(name: 'state')
  final MultiplexState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  MultiplexSummary({
    this.arn,
    this.availabilityZones,
    this.id,
    this.multiplexSettings,
    this.name,
    this.pipelinesRunningCount,
    this.programCount,
    this.state,
    this.tags,
  });
  factory MultiplexSummary.fromJson(Map<String, dynamic> json) =>
      _$MultiplexSummaryFromJson(json);
}

/// The video configuration for each program in a multiplex.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MultiplexVideoSettings {
  /// The constant bitrate configuration for the video encode.
  /// When this field is defined, StatmuxSettings must be undefined.
  @_s.JsonKey(name: 'constantBitrate')
  final int constantBitrate;

  /// Statmux rate control settings.
  /// When this field is defined, ConstantBitrate must be undefined.
  @_s.JsonKey(name: 'statmuxSettings')
  final MultiplexStatmuxVideoSettings statmuxSettings;

  MultiplexVideoSettings({
    this.constantBitrate,
    this.statmuxSettings,
  });
  factory MultiplexVideoSettings.fromJson(Map<String, dynamic> json) =>
      _$MultiplexVideoSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$MultiplexVideoSettingsToJson(this);
}

/// Network Input Server Validation
enum NetworkInputServerValidation {
  @_s.JsonValue('CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME')
  checkCryptographyAndValidateName,
  @_s.JsonValue('CHECK_CRYPTOGRAPHY_ONLY')
  checkCryptographyOnly,
}

/// Network source to transcode. Must be accessible to the Elemental Live node
/// that is running the live event through a network connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NetworkInputSettings {
  /// Specifies HLS input settings when the uri is for a HLS manifest.
  @_s.JsonKey(name: 'hlsInputSettings')
  final HlsInputSettings hlsInputSettings;

  /// Check HTTPS server certificates. When set to checkCryptographyOnly,
  /// cryptography in the certificate will be checked, but not the server's name.
  /// Certain subdomains (notably S3 buckets that use dots in the bucket name) do
  /// not strictly match the corresponding certificate's wildcard pattern and
  /// would otherwise cause the event to error. This setting is ignored for
  /// protocols that do not use https.
  @_s.JsonKey(name: 'serverValidation')
  final NetworkInputServerValidation serverValidation;

  NetworkInputSettings({
    this.hlsInputSettings,
    this.serverValidation,
  });
  factory NetworkInputSettings.fromJson(Map<String, dynamic> json) =>
      _$NetworkInputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkInputSettingsToJson(this);
}

/// Nielsen Configuration
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NielsenConfiguration {
  /// Enter the Distributor ID assigned to your organization by Nielsen.
  @_s.JsonKey(name: 'distributorId')
  final String distributorId;

  /// Enables Nielsen PCM to ID3 tagging
  @_s.JsonKey(name: 'nielsenPcmToId3Tagging')
  final NielsenPcmToId3TaggingState nielsenPcmToId3Tagging;

  NielsenConfiguration({
    this.distributorId,
    this.nielsenPcmToId3Tagging,
  });
  factory NielsenConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NielsenConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$NielsenConfigurationToJson(this);
}

/// State of Nielsen PCM to ID3 tagging
enum NielsenPcmToId3TaggingState {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Reserved resources available for purchase
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Offering {
  /// Unique offering ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  @_s.JsonKey(name: 'currencyCode')
  final String currencyCode;

  /// Lease duration, e.g. '12'
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  @_s.JsonKey(name: 'durationUnits')
  final OfferingDurationUnits durationUnits;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  @_s.JsonKey(name: 'fixedPrice')
  final double fixedPrice;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  @_s.JsonKey(name: 'offeringDescription')
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  @_s.JsonKey(name: 'offeringType')
  final OfferingType offeringType;

  /// AWS region, e.g. 'us-west-2'
  @_s.JsonKey(name: 'region')
  final String region;

  /// Resource configuration details
  @_s.JsonKey(name: 'resourceSpecification')
  final ReservationResourceSpecification resourceSpecification;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  @_s.JsonKey(name: 'usagePrice')
  final double usagePrice;

  Offering({
    this.arn,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.fixedPrice,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.resourceSpecification,
    this.usagePrice,
  });
  factory Offering.fromJson(Map<String, dynamic> json) =>
      _$OfferingFromJson(json);
}

/// Units for duration, e.g. 'MONTHS'
enum OfferingDurationUnits {
  @_s.JsonValue('MONTHS')
  months,
}

/// Offering type, e.g. 'NO_UPFRONT'
enum OfferingType {
  @_s.JsonValue('NO_UPFRONT')
  noUpfront,
}

/// Output settings. There can be multiple outputs within a group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Output {
  /// Output type-specific settings.
  @_s.JsonKey(name: 'outputSettings')
  final OutputSettings outputSettings;

  /// The names of the AudioDescriptions used as audio sources for this output.
  @_s.JsonKey(name: 'audioDescriptionNames')
  final List<String> audioDescriptionNames;

  /// The names of the CaptionDescriptions used as caption sources for this
  /// output.
  @_s.JsonKey(name: 'captionDescriptionNames')
  final List<String> captionDescriptionNames;

  /// The name used to identify an output.
  @_s.JsonKey(name: 'outputName')
  final String outputName;

  /// The name of the VideoDescription used as the source for this output.
  @_s.JsonKey(name: 'videoDescriptionName')
  final String videoDescriptionName;

  Output({
    @_s.required this.outputSettings,
    this.audioDescriptionNames,
    this.captionDescriptionNames,
    this.outputName,
    this.videoDescriptionName,
  });
  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);

  Map<String, dynamic> toJson() => _$OutputToJson(this);
}

/// Placeholder documentation for OutputDestination
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputDestination {
  /// User-specified id. This is used in an output group or an output.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Destination settings for a MediaPackage output; one destination for both
  /// encoders.
  @_s.JsonKey(name: 'mediaPackageSettings')
  final List<MediaPackageOutputDestinationSettings> mediaPackageSettings;

  /// Destination settings for a Multiplex output; one destination for both
  /// encoders.
  @_s.JsonKey(name: 'multiplexSettings')
  final MultiplexProgramChannelDestinationSettings multiplexSettings;

  /// Destination settings for a standard output; one destination for each
  /// redundant encoder.
  @_s.JsonKey(name: 'settings')
  final List<OutputDestinationSettings> settings;

  OutputDestination({
    this.id,
    this.mediaPackageSettings,
    this.multiplexSettings,
    this.settings,
  });
  factory OutputDestination.fromJson(Map<String, dynamic> json) =>
      _$OutputDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$OutputDestinationToJson(this);
}

/// Placeholder documentation for OutputDestinationSettings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputDestinationSettings {
  /// key used to extract the password from EC2 Parameter store
  @_s.JsonKey(name: 'passwordParam')
  final String passwordParam;

  /// Stream name for RTMP destinations (URLs of type rtmp://)
  @_s.JsonKey(name: 'streamName')
  final String streamName;

  /// A URL specifying a destination
  @_s.JsonKey(name: 'url')
  final String url;

  /// username for destination
  @_s.JsonKey(name: 'username')
  final String username;

  OutputDestinationSettings({
    this.passwordParam,
    this.streamName,
    this.url,
    this.username,
  });
  factory OutputDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$OutputDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OutputDestinationSettingsToJson(this);
}

/// Output groups for this Live Event. Output groups contain information about
/// where streams should be distributed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputGroup {
  /// Settings associated with the output group.
  @_s.JsonKey(name: 'outputGroupSettings')
  final OutputGroupSettings outputGroupSettings;
  @_s.JsonKey(name: 'outputs')
  final List<Output> outputs;

  /// Custom output group name optionally defined by the user.  Only letters,
  /// numbers, and the underscore character allowed; only 32 characters allowed.
  @_s.JsonKey(name: 'name')
  final String name;

  OutputGroup({
    @_s.required this.outputGroupSettings,
    @_s.required this.outputs,
    this.name,
  });
  factory OutputGroup.fromJson(Map<String, dynamic> json) =>
      _$OutputGroupFromJson(json);

  Map<String, dynamic> toJson() => _$OutputGroupToJson(this);
}

/// Output Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputGroupSettings {
  @_s.JsonKey(name: 'archiveGroupSettings')
  final ArchiveGroupSettings archiveGroupSettings;
  @_s.JsonKey(name: 'frameCaptureGroupSettings')
  final FrameCaptureGroupSettings frameCaptureGroupSettings;
  @_s.JsonKey(name: 'hlsGroupSettings')
  final HlsGroupSettings hlsGroupSettings;
  @_s.JsonKey(name: 'mediaPackageGroupSettings')
  final MediaPackageGroupSettings mediaPackageGroupSettings;
  @_s.JsonKey(name: 'msSmoothGroupSettings')
  final MsSmoothGroupSettings msSmoothGroupSettings;
  @_s.JsonKey(name: 'multiplexGroupSettings')
  final MultiplexGroupSettings multiplexGroupSettings;
  @_s.JsonKey(name: 'rtmpGroupSettings')
  final RtmpGroupSettings rtmpGroupSettings;
  @_s.JsonKey(name: 'udpGroupSettings')
  final UdpGroupSettings udpGroupSettings;

  OutputGroupSettings({
    this.archiveGroupSettings,
    this.frameCaptureGroupSettings,
    this.hlsGroupSettings,
    this.mediaPackageGroupSettings,
    this.msSmoothGroupSettings,
    this.multiplexGroupSettings,
    this.rtmpGroupSettings,
    this.udpGroupSettings,
  });
  factory OutputGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$OutputGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OutputGroupSettingsToJson(this);
}

/// Reference to an OutputDestination ID defined in the channel
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputLocationRef {
  @_s.JsonKey(name: 'destinationRefId')
  final String destinationRefId;

  OutputLocationRef({
    this.destinationRefId,
  });
  factory OutputLocationRef.fromJson(Map<String, dynamic> json) =>
      _$OutputLocationRefFromJson(json);

  Map<String, dynamic> toJson() => _$OutputLocationRefToJson(this);
}

/// Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputSettings {
  @_s.JsonKey(name: 'archiveOutputSettings')
  final ArchiveOutputSettings archiveOutputSettings;
  @_s.JsonKey(name: 'frameCaptureOutputSettings')
  final FrameCaptureOutputSettings frameCaptureOutputSettings;
  @_s.JsonKey(name: 'hlsOutputSettings')
  final HlsOutputSettings hlsOutputSettings;
  @_s.JsonKey(name: 'mediaPackageOutputSettings')
  final MediaPackageOutputSettings mediaPackageOutputSettings;
  @_s.JsonKey(name: 'msSmoothOutputSettings')
  final MsSmoothOutputSettings msSmoothOutputSettings;
  @_s.JsonKey(name: 'multiplexOutputSettings')
  final MultiplexOutputSettings multiplexOutputSettings;
  @_s.JsonKey(name: 'rtmpOutputSettings')
  final RtmpOutputSettings rtmpOutputSettings;
  @_s.JsonKey(name: 'udpOutputSettings')
  final UdpOutputSettings udpOutputSettings;

  OutputSettings({
    this.archiveOutputSettings,
    this.frameCaptureOutputSettings,
    this.hlsOutputSettings,
    this.mediaPackageOutputSettings,
    this.msSmoothOutputSettings,
    this.multiplexOutputSettings,
    this.rtmpOutputSettings,
    this.udpOutputSettings,
  });
  factory OutputSettings.fromJson(Map<String, dynamic> json) =>
      _$OutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$OutputSettingsToJson(this);
}

/// Pass Through Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PassThroughSettings {
  PassThroughSettings();
  factory PassThroughSettings.fromJson(Map<String, dynamic> json) =>
      _$PassThroughSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PassThroughSettingsToJson(this);
}

/// Settings for the action to set pause state of a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PauseStateScheduleActionSettings {
  @_s.JsonKey(name: 'pipelines')
  final List<PipelinePauseStateSettings> pipelines;

  PauseStateScheduleActionSettings({
    this.pipelines,
  });
  factory PauseStateScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$PauseStateScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PauseStateScheduleActionSettingsToJson(this);
}

/// Runtime details of a pipeline when a channel is running.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PipelineDetail {
  /// The name of the active input attachment currently being ingested by this
  /// pipeline.
  @_s.JsonKey(name: 'activeInputAttachmentName')
  final String activeInputAttachmentName;

  /// The name of the input switch schedule action that occurred most recently and
  /// that resulted in the switch to the current input attachment for this
  /// pipeline.
  @_s.JsonKey(name: 'activeInputSwitchActionName')
  final String activeInputSwitchActionName;

  /// Pipeline ID
  @_s.JsonKey(name: 'pipelineId')
  final String pipelineId;

  PipelineDetail({
    this.activeInputAttachmentName,
    this.activeInputSwitchActionName,
    this.pipelineId,
  });
  factory PipelineDetail.fromJson(Map<String, dynamic> json) =>
      _$PipelineDetailFromJson(json);
}

/// Pipeline ID
enum PipelineId {
  @_s.JsonValue('PIPELINE_0')
  pipeline_0,
  @_s.JsonValue('PIPELINE_1')
  pipeline_1,
}

/// Settings for pausing a pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PipelinePauseStateSettings {
  /// Pipeline ID to pause ("PIPELINE_0" or "PIPELINE_1").
  @_s.JsonKey(name: 'pipelineId')
  final PipelineId pipelineId;

  PipelinePauseStateSettings({
    @_s.required this.pipelineId,
  });
  factory PipelinePauseStateSettings.fromJson(Map<String, dynamic> json) =>
      _$PipelinePauseStateSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$PipelinePauseStateSettingsToJson(this);
}

/// Indicates which pipeline is preferred by the multiplex for program ingest.
/// If set to \"PIPELINE_0\" or \"PIPELINE_1\" and an unhealthy ingest causes
/// the multiplex to switch to the non-preferred pipeline,
/// it will switch back once that ingest is healthy again. If set to
/// \"CURRENTLY_ACTIVE\",
/// it will not switch back to the other pipeline based on it recovering to a
/// healthy state,
/// it will only switch if the active pipeline becomes unhealthy.
enum PreferredChannelPipeline {
  @_s.JsonValue('CURRENTLY_ACTIVE')
  currentlyActive,
  @_s.JsonValue('PIPELINE_0')
  pipeline_0,
  @_s.JsonValue('PIPELINE_1')
  pipeline_1,
}

/// Placeholder documentation for PurchaseOfferingResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PurchaseOfferingResponse {
  @_s.JsonKey(name: 'reservation')
  final Reservation reservation;

  PurchaseOfferingResponse({
    this.reservation,
  });
  factory PurchaseOfferingResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOfferingResponseFromJson(json);
}

/// Raw Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RawSettings {
  RawSettings();
  factory RawSettings.fromJson(Map<String, dynamic> json) =>
      _$RawSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RawSettingsToJson(this);
}

/// Rec601 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Rec601Settings {
  Rec601Settings();
  factory Rec601Settings.fromJson(Map<String, dynamic> json) =>
      _$Rec601SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Rec601SettingsToJson(this);
}

/// Rec709 Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Rec709Settings {
  Rec709Settings();
  factory Rec709Settings.fromJson(Map<String, dynamic> json) =>
      _$Rec709SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Rec709SettingsToJson(this);
}

/// Placeholder documentation for RejectInputDeviceTransferResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectInputDeviceTransferResponse {
  RejectInputDeviceTransferResponse();
  factory RejectInputDeviceTransferResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RejectInputDeviceTransferResponseFromJson(json);
}

/// Remix Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RemixSettings {
  /// Mapping of input channels to output channels, with appropriate gain
  /// adjustments.
  @_s.JsonKey(name: 'channelMappings')
  final List<AudioChannelMapping> channelMappings;

  /// Number of input channels to be used.
  @_s.JsonKey(name: 'channelsIn')
  final int channelsIn;

  /// Number of output channels to be produced.
  /// Valid values: 1, 2, 4, 6, 8
  @_s.JsonKey(name: 'channelsOut')
  final int channelsOut;

  RemixSettings({
    @_s.required this.channelMappings,
    this.channelsIn,
    this.channelsOut,
  });
  factory RemixSettings.fromJson(Map<String, dynamic> json) =>
      _$RemixSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RemixSettingsToJson(this);
}

/// Reserved resources available to use
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Reservation {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Number of reserved resources
  @_s.JsonKey(name: 'count')
  final int count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  @_s.JsonKey(name: 'currencyCode')
  final String currencyCode;

  /// Lease duration, e.g. '12'
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// Units for duration, e.g. 'MONTHS'
  @_s.JsonKey(name: 'durationUnits')
  final OfferingDurationUnits durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  @_s.JsonKey(name: 'end')
  final String end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  @_s.JsonKey(name: 'fixedPrice')
  final double fixedPrice;

  /// User specified reservation name
  @_s.JsonKey(name: 'name')
  final String name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  @_s.JsonKey(name: 'offeringDescription')
  final String offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  @_s.JsonKey(name: 'offeringId')
  final String offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  @_s.JsonKey(name: 'offeringType')
  final OfferingType offeringType;

  /// AWS region, e.g. 'us-west-2'
  @_s.JsonKey(name: 'region')
  final String region;

  /// Unique reservation ID, e.g. '1234567'
  @_s.JsonKey(name: 'reservationId')
  final String reservationId;

  /// Resource configuration details
  @_s.JsonKey(name: 'resourceSpecification')
  final ReservationResourceSpecification resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  @_s.JsonKey(name: 'start')
  final String start;

  /// Current state of reservation, e.g. 'ACTIVE'
  @_s.JsonKey(name: 'state')
  final ReservationState state;

  /// A collection of key-value pairs
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  @_s.JsonKey(name: 'usagePrice')
  final double usagePrice;

  Reservation({
    this.arn,
    this.count,
    this.currencyCode,
    this.duration,
    this.durationUnits,
    this.end,
    this.fixedPrice,
    this.name,
    this.offeringDescription,
    this.offeringId,
    this.offeringType,
    this.region,
    this.reservationId,
    this.resourceSpecification,
    this.start,
    this.state,
    this.tags,
    this.usagePrice,
  });
  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}

/// Codec, 'MPEG2', 'AVC', 'HEVC', or 'AUDIO'
enum ReservationCodec {
  @_s.JsonValue('MPEG2')
  mpeg2,
  @_s.JsonValue('AVC')
  avc,
  @_s.JsonValue('HEVC')
  hevc,
  @_s.JsonValue('AUDIO')
  audio,
  @_s.JsonValue('LINK')
  link,
}

/// Maximum bitrate in megabits per second
enum ReservationMaximumBitrate {
  @_s.JsonValue('MAX_10_MBPS')
  max_10Mbps,
  @_s.JsonValue('MAX_20_MBPS')
  max_20Mbps,
  @_s.JsonValue('MAX_50_MBPS')
  max_50Mbps,
}

/// Maximum framerate in frames per second (Outputs only)
enum ReservationMaximumFramerate {
  @_s.JsonValue('MAX_30_FPS')
  max_30Fps,
  @_s.JsonValue('MAX_60_FPS')
  max_60Fps,
}

/// Resolution based on lines of vertical resolution; SD is less than 720 lines,
/// HD is 720 to 1080 lines, FHD is 1080 lines, UHD is greater than 1080 lines
enum ReservationResolution {
  @_s.JsonValue('SD')
  sd,
  @_s.JsonValue('HD')
  hd,
  @_s.JsonValue('FHD')
  fhd,
  @_s.JsonValue('UHD')
  uhd,
}

/// Resource configuration (codec, resolution, bitrate, ...)
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReservationResourceSpecification {
  /// Channel class, e.g. 'STANDARD'
  @_s.JsonKey(name: 'channelClass')
  final ChannelClass channelClass;

  /// Codec, e.g. 'AVC'
  @_s.JsonKey(name: 'codec')
  final ReservationCodec codec;

  /// Maximum bitrate, e.g. 'MAX_20_MBPS'
  @_s.JsonKey(name: 'maximumBitrate')
  final ReservationMaximumBitrate maximumBitrate;

  /// Maximum framerate, e.g. 'MAX_30_FPS' (Outputs only)
  @_s.JsonKey(name: 'maximumFramerate')
  final ReservationMaximumFramerate maximumFramerate;

  /// Resolution, e.g. 'HD'
  @_s.JsonKey(name: 'resolution')
  final ReservationResolution resolution;

  /// Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
  @_s.JsonKey(name: 'resourceType')
  final ReservationResourceType resourceType;

  /// Special feature, e.g. 'AUDIO_NORMALIZATION' (Channels only)
  @_s.JsonKey(name: 'specialFeature')
  final ReservationSpecialFeature specialFeature;

  /// Video quality, e.g. 'STANDARD' (Outputs only)
  @_s.JsonKey(name: 'videoQuality')
  final ReservationVideoQuality videoQuality;

  ReservationResourceSpecification({
    this.channelClass,
    this.codec,
    this.maximumBitrate,
    this.maximumFramerate,
    this.resolution,
    this.resourceType,
    this.specialFeature,
    this.videoQuality,
  });
  factory ReservationResourceSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$ReservationResourceSpecificationFromJson(json);
}

/// Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
enum ReservationResourceType {
  @_s.JsonValue('INPUT')
  input,
  @_s.JsonValue('OUTPUT')
  output,
  @_s.JsonValue('MULTIPLEX')
  multiplex,
  @_s.JsonValue('CHANNEL')
  channel,
}

/// Special features, 'ADVANCED_AUDIO' or 'AUDIO_NORMALIZATION'
enum ReservationSpecialFeature {
  @_s.JsonValue('ADVANCED_AUDIO')
  advancedAudio,
  @_s.JsonValue('AUDIO_NORMALIZATION')
  audioNormalization,
}

/// Current reservation state
enum ReservationState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('CANCELED')
  canceled,
  @_s.JsonValue('DELETED')
  deleted,
}

/// Video quality, e.g. 'STANDARD' (Outputs only)
enum ReservationVideoQuality {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('ENHANCED')
  enhanced,
  @_s.JsonValue('PREMIUM')
  premium,
}

/// Rtmp Ad Markers
enum RtmpAdMarkers {
  @_s.JsonValue('ON_CUE_POINT_SCTE35')
  onCuePointScte35,
}

/// Rtmp Cache Full Behavior
enum RtmpCacheFullBehavior {
  @_s.JsonValue('DISCONNECT_IMMEDIATELY')
  disconnectImmediately,
  @_s.JsonValue('WAIT_FOR_SERVER')
  waitForServer,
}

/// Rtmp Caption Data
enum RtmpCaptionData {
  @_s.JsonValue('ALL')
  all,
  @_s.JsonValue('FIELD1_608')
  field1_608,
  @_s.JsonValue('FIELD1_AND_FIELD2_608')
  field1AndField2_608,
}

/// Rtmp Caption Info Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RtmpCaptionInfoDestinationSettings {
  RtmpCaptionInfoDestinationSettings();
  factory RtmpCaptionInfoDestinationSettings.fromJson(
          Map<String, dynamic> json) =>
      _$RtmpCaptionInfoDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RtmpCaptionInfoDestinationSettingsToJson(this);
}

/// Rtmp Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RtmpGroupSettings {
  /// Choose the ad marker type for this output group. MediaLive will create a
  /// message based on the content of each SCTE-35 message, format it for that
  /// marker type, and insert it in the datastream.
  @_s.JsonKey(name: 'adMarkers')
  final List<RtmpAdMarkers> adMarkers;

  /// Authentication scheme to use when connecting with CDN
  @_s.JsonKey(name: 'authenticationScheme')
  final AuthenticationScheme authenticationScheme;

  /// Controls behavior when content cache fills up. If remote origin server
  /// stalls the RTMP connection and does not accept content fast enough the
  /// 'Media Cache' will fill up. When the cache reaches the duration specified by
  /// cacheLength the cache will stop accepting new content. If set to
  /// disconnectImmediately, the RTMP output will force a disconnect. Clear the
  /// media cache, and reconnect after restartDelay seconds. If set to
  /// waitForServer, the RTMP output will wait up to 5 minutes to allow the origin
  /// server to begin accepting data again.
  @_s.JsonKey(name: 'cacheFullBehavior')
  final RtmpCacheFullBehavior cacheFullBehavior;

  /// Cache length, in seconds, is used to calculate buffer size.
  @_s.JsonKey(name: 'cacheLength')
  final int cacheLength;

  /// Controls the types of data that passes to onCaptionInfo outputs.  If set to
  /// 'all' then 608 and 708 carried DTVCC data will be passed.  If set to
  /// 'field1AndField2608' then DTVCC data will be stripped out, but 608 data from
  /// both fields will be passed. If set to 'field1608' then only the data carried
  /// in 608 from field 1 video will be passed.
  @_s.JsonKey(name: 'captionData')
  final RtmpCaptionData captionData;

  /// Controls the behavior of this RTMP group if input becomes unavailable.
  ///
  /// - emitOutput: Emit a slate until input returns.
  /// - pauseOutput: Stop transmitting data until input returns. This does not
  /// close the underlying RTMP connection.
  @_s.JsonKey(name: 'inputLossAction')
  final InputLossActionForRtmpOut inputLossAction;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  @_s.JsonKey(name: 'restartDelay')
  final int restartDelay;

  RtmpGroupSettings({
    this.adMarkers,
    this.authenticationScheme,
    this.cacheFullBehavior,
    this.cacheLength,
    this.captionData,
    this.inputLossAction,
    this.restartDelay,
  });
  factory RtmpGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$RtmpGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RtmpGroupSettingsToJson(this);
}

/// Rtmp Output Certificate Mode
enum RtmpOutputCertificateMode {
  @_s.JsonValue('SELF_SIGNED')
  selfSigned,
  @_s.JsonValue('VERIFY_AUTHENTICITY')
  verifyAuthenticity,
}

/// Rtmp Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RtmpOutputSettings {
  /// The RTMP endpoint excluding the stream name (eg. rtmp://host/appname). For
  /// connection to Akamai, a username and password must be supplied. URI fields
  /// accept format identifiers.
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  /// If set to verifyAuthenticity, verify the tls certificate chain to a trusted
  /// Certificate Authority (CA).  This will cause rtmps outputs with self-signed
  /// certificates to fail.
  @_s.JsonKey(name: 'certificateMode')
  final RtmpOutputCertificateMode certificateMode;

  /// Number of seconds to wait before retrying a connection to the Flash Media
  /// server if the connection is lost.
  @_s.JsonKey(name: 'connectionRetryInterval')
  final int connectionRetryInterval;

  /// Number of retry attempts.
  @_s.JsonKey(name: 'numRetries')
  final int numRetries;

  RtmpOutputSettings({
    @_s.required this.destination,
    this.certificateMode,
    this.connectionRetryInterval,
    this.numRetries,
  });
  factory RtmpOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$RtmpOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RtmpOutputSettingsToJson(this);
}

/// Contains information on a single schedule action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScheduleAction {
  /// The name of the action, must be unique within the schedule. This name
  /// provides the main reference to an action once it is added to the schedule. A
  /// name is unique if it is no longer in the schedule. The schedule is
  /// automatically cleaned up to remove actions with a start time of more than 1
  /// hour ago (approximately) so at that point a name can be reused.
  @_s.JsonKey(name: 'actionName')
  final String actionName;

  /// Settings for this schedule action.
  @_s.JsonKey(name: 'scheduleActionSettings')
  final ScheduleActionSettings scheduleActionSettings;

  /// The time for the action to start in the channel.
  @_s.JsonKey(name: 'scheduleActionStartSettings')
  final ScheduleActionStartSettings scheduleActionStartSettings;

  ScheduleAction({
    @_s.required this.actionName,
    @_s.required this.scheduleActionSettings,
    @_s.required this.scheduleActionStartSettings,
  });
  factory ScheduleAction.fromJson(Map<String, dynamic> json) =>
      _$ScheduleActionFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleActionToJson(this);
}

/// Holds the settings for a single schedule action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScheduleActionSettings {
  /// Action to insert HLS ID3 segment tagging
  @_s.JsonKey(name: 'hlsId3SegmentTaggingSettings')
  final HlsId3SegmentTaggingScheduleActionSettings hlsId3SegmentTaggingSettings;

  /// Action to insert HLS metadata
  @_s.JsonKey(name: 'hlsTimedMetadataSettings')
  final HlsTimedMetadataScheduleActionSettings hlsTimedMetadataSettings;

  /// Action to prepare an input for a future immediate input switch
  @_s.JsonKey(name: 'inputPrepareSettings')
  final InputPrepareScheduleActionSettings inputPrepareSettings;

  /// Action to switch the input
  @_s.JsonKey(name: 'inputSwitchSettings')
  final InputSwitchScheduleActionSettings inputSwitchSettings;

  /// Action to pause or unpause one or both channel pipelines
  @_s.JsonKey(name: 'pauseStateSettings')
  final PauseStateScheduleActionSettings pauseStateSettings;

  /// Action to insert SCTE-35 return_to_network message
  @_s.JsonKey(name: 'scte35ReturnToNetworkSettings')
  final Scte35ReturnToNetworkScheduleActionSettings
      scte35ReturnToNetworkSettings;

  /// Action to insert SCTE-35 splice_insert message
  @_s.JsonKey(name: 'scte35SpliceInsertSettings')
  final Scte35SpliceInsertScheduleActionSettings scte35SpliceInsertSettings;

  /// Action to insert SCTE-35 time_signal message
  @_s.JsonKey(name: 'scte35TimeSignalSettings')
  final Scte35TimeSignalScheduleActionSettings scte35TimeSignalSettings;

  /// Action to activate a static image overlay
  @_s.JsonKey(name: 'staticImageActivateSettings')
  final StaticImageActivateScheduleActionSettings staticImageActivateSettings;

  /// Action to deactivate a static image overlay
  @_s.JsonKey(name: 'staticImageDeactivateSettings')
  final StaticImageDeactivateScheduleActionSettings
      staticImageDeactivateSettings;

  ScheduleActionSettings({
    this.hlsId3SegmentTaggingSettings,
    this.hlsTimedMetadataSettings,
    this.inputPrepareSettings,
    this.inputSwitchSettings,
    this.pauseStateSettings,
    this.scte35ReturnToNetworkSettings,
    this.scte35SpliceInsertSettings,
    this.scte35TimeSignalSettings,
    this.staticImageActivateSettings,
    this.staticImageDeactivateSettings,
  });
  factory ScheduleActionSettings.fromJson(Map<String, dynamic> json) =>
      _$ScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleActionSettingsToJson(this);
}

/// Settings to specify when an action should occur. Only one of the options
/// must be selected.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScheduleActionStartSettings {
  /// Option for specifying the start time for an action.
  @_s.JsonKey(name: 'fixedModeScheduleActionStartSettings')
  final FixedModeScheduleActionStartSettings
      fixedModeScheduleActionStartSettings;

  /// Option for specifying an action as relative to another action.
  @_s.JsonKey(name: 'followModeScheduleActionStartSettings')
  final FollowModeScheduleActionStartSettings
      followModeScheduleActionStartSettings;

  /// Option for specifying an action that should be applied immediately.
  @_s.JsonKey(name: 'immediateModeScheduleActionStartSettings')
  final ImmediateModeScheduleActionStartSettings
      immediateModeScheduleActionStartSettings;

  ScheduleActionStartSettings({
    this.fixedModeScheduleActionStartSettings,
    this.followModeScheduleActionStartSettings,
    this.immediateModeScheduleActionStartSettings,
  });
  factory ScheduleActionStartSettings.fromJson(Map<String, dynamic> json) =>
      _$ScheduleActionStartSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleActionStartSettingsToJson(this);
}

/// Scte20 Convert608 To708
enum Scte20Convert608To708 {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('UPCONVERT')
  upconvert,
}

/// Scte20 Plus Embedded Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte20PlusEmbeddedDestinationSettings {
  Scte20PlusEmbeddedDestinationSettings();
  factory Scte20PlusEmbeddedDestinationSettings.fromJson(
          Map<String, dynamic> json) =>
      _$Scte20PlusEmbeddedDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$Scte20PlusEmbeddedDestinationSettingsToJson(this);
}

/// Scte20 Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte20SourceSettings {
  /// If upconvert, 608 data is both passed through via the "608 compatibility
  /// bytes" fields of the 708 wrapper as well as translated into 708. 708 data
  /// present in the source content will be discarded.
  @_s.JsonKey(name: 'convert608To708')
  final Scte20Convert608To708 convert608To708;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  @_s.JsonKey(name: 'source608ChannelNumber')
  final int source608ChannelNumber;

  Scte20SourceSettings({
    this.convert608To708,
    this.source608ChannelNumber,
  });
  factory Scte20SourceSettings.fromJson(Map<String, dynamic> json) =>
      _$Scte20SourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Scte20SourceSettingsToJson(this);
}

/// Scte27 Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte27DestinationSettings {
  Scte27DestinationSettings();
  factory Scte27DestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$Scte27DestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Scte27DestinationSettingsToJson(this);
}

/// Scte27 Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte27SourceSettings {
  /// The pid field is used in conjunction with the caption selector languageCode
  /// field as follows:
  /// - Specify PID and Language: Extracts captions from that PID; the language is
  /// "informational".
  /// - Specify PID and omit Language: Extracts the specified PID.
  /// - Omit PID and specify Language: Extracts the specified language, whichever
  /// PID that happens to be.
  /// - Omit PID and omit Language: Valid only if source is DVB-Sub that is being
  /// passed through; all languages will be passed through.
  @_s.JsonKey(name: 'pid')
  final int pid;

  Scte27SourceSettings({
    this.pid,
  });
  factory Scte27SourceSettings.fromJson(Map<String, dynamic> json) =>
      _$Scte27SourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Scte27SourceSettingsToJson(this);
}

/// Scte35 Apos No Regional Blackout Behavior
enum Scte35AposNoRegionalBlackoutBehavior {
  @_s.JsonValue('FOLLOW')
  follow,
  @_s.JsonValue('IGNORE')
  ignore,
}

/// Scte35 Apos Web Delivery Allowed Behavior
enum Scte35AposWebDeliveryAllowedBehavior {
  @_s.JsonValue('FOLLOW')
  follow,
  @_s.JsonValue('IGNORE')
  ignore,
}

/// Corresponds to the archive_allowed parameter. A value of ARCHIVE_NOT_ALLOWED
/// corresponds to 0 (false) in the SCTE-35 specification. If you include one of
/// the "restriction" flags then you must include all four of them.
enum Scte35ArchiveAllowedFlag {
  @_s.JsonValue('ARCHIVE_NOT_ALLOWED')
  archiveNotAllowed,
  @_s.JsonValue('ARCHIVE_ALLOWED')
  archiveAllowed,
}

/// Corresponds to SCTE-35 delivery_not_restricted_flag parameter. To declare
/// delivery restrictions, include this element and its four "restriction"
/// flags. To declare that there are no restrictions, omit this element.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35DeliveryRestrictions {
  /// Corresponds to SCTE-35 archive_allowed_flag.
  @_s.JsonKey(name: 'archiveAllowedFlag')
  final Scte35ArchiveAllowedFlag archiveAllowedFlag;

  /// Corresponds to SCTE-35 device_restrictions parameter.
  @_s.JsonKey(name: 'deviceRestrictions')
  final Scte35DeviceRestrictions deviceRestrictions;

  /// Corresponds to SCTE-35 no_regional_blackout_flag parameter.
  @_s.JsonKey(name: 'noRegionalBlackoutFlag')
  final Scte35NoRegionalBlackoutFlag noRegionalBlackoutFlag;

  /// Corresponds to SCTE-35 web_delivery_allowed_flag parameter.
  @_s.JsonKey(name: 'webDeliveryAllowedFlag')
  final Scte35WebDeliveryAllowedFlag webDeliveryAllowedFlag;

  Scte35DeliveryRestrictions({
    @_s.required this.archiveAllowedFlag,
    @_s.required this.deviceRestrictions,
    @_s.required this.noRegionalBlackoutFlag,
    @_s.required this.webDeliveryAllowedFlag,
  });
  factory Scte35DeliveryRestrictions.fromJson(Map<String, dynamic> json) =>
      _$Scte35DeliveryRestrictionsFromJson(json);

  Map<String, dynamic> toJson() => _$Scte35DeliveryRestrictionsToJson(this);
}

/// Holds one set of SCTE-35 Descriptor Settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35Descriptor {
  /// SCTE-35 Descriptor Settings.
  @_s.JsonKey(name: 'scte35DescriptorSettings')
  final Scte35DescriptorSettings scte35DescriptorSettings;

  Scte35Descriptor({
    @_s.required this.scte35DescriptorSettings,
  });
  factory Scte35Descriptor.fromJson(Map<String, dynamic> json) =>
      _$Scte35DescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$Scte35DescriptorToJson(this);
}

/// SCTE-35 Descriptor settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35DescriptorSettings {
  /// SCTE-35 Segmentation Descriptor.
  @_s.JsonKey(name: 'segmentationDescriptorScte35DescriptorSettings')
  final Scte35SegmentationDescriptor
      segmentationDescriptorScte35DescriptorSettings;

  Scte35DescriptorSettings({
    @_s.required this.segmentationDescriptorScte35DescriptorSettings,
  });
  factory Scte35DescriptorSettings.fromJson(Map<String, dynamic> json) =>
      _$Scte35DescriptorSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$Scte35DescriptorSettingsToJson(this);
}

/// Corresponds to the device_restrictions parameter in a
/// segmentation_descriptor. If you include one of the "restriction" flags then
/// you must include all four of them.
enum Scte35DeviceRestrictions {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('RESTRICT_GROUP0')
  restrictGroup0,
  @_s.JsonValue('RESTRICT_GROUP1')
  restrictGroup1,
  @_s.JsonValue('RESTRICT_GROUP2')
  restrictGroup2,
}

/// Corresponds to the no_regional_blackout_flag parameter. A value of
/// REGIONAL_BLACKOUT corresponds to 0 (false) in the SCTE-35 specification. If
/// you include one of the "restriction" flags then you must include all four of
/// them.
enum Scte35NoRegionalBlackoutFlag {
  @_s.JsonValue('REGIONAL_BLACKOUT')
  regionalBlackout,
  @_s.JsonValue('NO_REGIONAL_BLACKOUT')
  noRegionalBlackout,
}

/// Settings for a SCTE-35 return_to_network message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35ReturnToNetworkScheduleActionSettings {
  /// The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
  @_s.JsonKey(name: 'spliceEventId')
  final int spliceEventId;

  Scte35ReturnToNetworkScheduleActionSettings({
    @_s.required this.spliceEventId,
  });
  factory Scte35ReturnToNetworkScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$Scte35ReturnToNetworkScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$Scte35ReturnToNetworkScheduleActionSettingsToJson(this);
}

/// Corresponds to SCTE-35 segmentation_event_cancel_indicator.
/// SEGMENTATION_EVENT_NOT_CANCELED corresponds to 0 in the SCTE-35
/// specification and indicates that this is an insertion request.
/// SEGMENTATION_EVENT_CANCELED corresponds to 1 in the SCTE-35 specification
/// and indicates that this is a cancelation request, in which case complete
/// this field and the existing event ID to cancel.
enum Scte35SegmentationCancelIndicator {
  @_s.JsonValue('SEGMENTATION_EVENT_NOT_CANCELED')
  segmentationEventNotCanceled,
  @_s.JsonValue('SEGMENTATION_EVENT_CANCELED')
  segmentationEventCanceled,
}

/// Corresponds to SCTE-35 segmentation_descriptor.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35SegmentationDescriptor {
  /// Corresponds to SCTE-35 segmentation_event_cancel_indicator.
  @_s.JsonKey(name: 'segmentationCancelIndicator')
  final Scte35SegmentationCancelIndicator segmentationCancelIndicator;

  /// Corresponds to SCTE-35 segmentation_event_id.
  @_s.JsonKey(name: 'segmentationEventId')
  final int segmentationEventId;

  /// Holds the four SCTE-35 delivery restriction parameters.
  @_s.JsonKey(name: 'deliveryRestrictions')
  final Scte35DeliveryRestrictions deliveryRestrictions;

  /// Corresponds to SCTE-35 segment_num. A value that is valid for the specified
  /// segmentation_type_id.
  @_s.JsonKey(name: 'segmentNum')
  final int segmentNum;

  /// Corresponds to SCTE-35 segmentation_duration. Optional. The duration for the
  /// time_signal, in 90 KHz ticks. To convert seconds to ticks, multiple the
  /// seconds by 90,000. Enter time in 90 KHz clock ticks. If you do not enter a
  /// duration, the time_signal will continue until you insert a cancellation
  /// message.
  @_s.JsonKey(name: 'segmentationDuration')
  final int segmentationDuration;

  /// Corresponds to SCTE-35 segmentation_type_id. One of the segmentation_type_id
  /// values listed in the SCTE-35 specification. On the console, enter the ID in
  /// decimal (for example, "52"). In the CLI, API, or an SDK, enter the ID in hex
  /// (for example, "0x34") or decimal (for example, "52").
  @_s.JsonKey(name: 'segmentationTypeId')
  final int segmentationTypeId;

  /// Corresponds to SCTE-35 segmentation_upid. Enter a string containing the
  /// hexadecimal representation of the characters that make up the SCTE-35
  /// segmentation_upid value. Must contain an even number of hex characters. Do
  /// not include spaces between each hex pair. For example, the ASCII "ADS
  /// Information" becomes hex "41445320496e666f726d6174696f6e.
  @_s.JsonKey(name: 'segmentationUpid')
  final String segmentationUpid;

  /// Corresponds to SCTE-35 segmentation_upid_type. On the console, enter one of
  /// the types listed in the SCTE-35 specification, converted to a decimal. For
  /// example, "0x0C" hex from the specification is "12" in decimal. In the CLI,
  /// API, or an SDK, enter one of the types listed in the SCTE-35 specification,
  /// in either hex (for example, "0x0C" ) or in decimal (for example, "12").
  @_s.JsonKey(name: 'segmentationUpidType')
  final int segmentationUpidType;

  /// Corresponds to SCTE-35 segments_expected. A value that is valid for the
  /// specified segmentation_type_id.
  @_s.JsonKey(name: 'segmentsExpected')
  final int segmentsExpected;

  /// Corresponds to SCTE-35 sub_segment_num. A value that is valid for the
  /// specified segmentation_type_id.
  @_s.JsonKey(name: 'subSegmentNum')
  final int subSegmentNum;

  /// Corresponds to SCTE-35 sub_segments_expected. A value that is valid for the
  /// specified segmentation_type_id.
  @_s.JsonKey(name: 'subSegmentsExpected')
  final int subSegmentsExpected;

  Scte35SegmentationDescriptor({
    @_s.required this.segmentationCancelIndicator,
    @_s.required this.segmentationEventId,
    this.deliveryRestrictions,
    this.segmentNum,
    this.segmentationDuration,
    this.segmentationTypeId,
    this.segmentationUpid,
    this.segmentationUpidType,
    this.segmentsExpected,
    this.subSegmentNum,
    this.subSegmentsExpected,
  });
  factory Scte35SegmentationDescriptor.fromJson(Map<String, dynamic> json) =>
      _$Scte35SegmentationDescriptorFromJson(json);

  Map<String, dynamic> toJson() => _$Scte35SegmentationDescriptorToJson(this);
}

/// Scte35 Splice Insert
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35SpliceInsert {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time. This only applies to embedded SCTE 104/35 messages and does not
  /// apply to OOB messages.
  @_s.JsonKey(name: 'adAvailOffset')
  final int adAvailOffset;

  /// When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  @_s.JsonKey(name: 'noRegionalBlackoutFlag')
  final Scte35SpliceInsertNoRegionalBlackoutBehavior noRegionalBlackoutFlag;

  /// When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  @_s.JsonKey(name: 'webDeliveryAllowedFlag')
  final Scte35SpliceInsertWebDeliveryAllowedBehavior webDeliveryAllowedFlag;

  Scte35SpliceInsert({
    this.adAvailOffset,
    this.noRegionalBlackoutFlag,
    this.webDeliveryAllowedFlag,
  });
  factory Scte35SpliceInsert.fromJson(Map<String, dynamic> json) =>
      _$Scte35SpliceInsertFromJson(json);

  Map<String, dynamic> toJson() => _$Scte35SpliceInsertToJson(this);
}

/// Scte35 Splice Insert No Regional Blackout Behavior
enum Scte35SpliceInsertNoRegionalBlackoutBehavior {
  @_s.JsonValue('FOLLOW')
  follow,
  @_s.JsonValue('IGNORE')
  ignore,
}

/// Settings for a SCTE-35 splice_insert message.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35SpliceInsertScheduleActionSettings {
  /// The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
  @_s.JsonKey(name: 'spliceEventId')
  final int spliceEventId;

  /// Optional, the duration for the splice_insert, in 90 KHz ticks. To convert
  /// seconds to ticks, multiple the seconds by 90,000. If you enter a duration,
  /// there is an expectation that the downstream system can read the duration and
  /// cue in at that time. If you do not enter a duration, the splice_insert will
  /// continue indefinitely and there is an expectation that you will enter a
  /// return_to_network to end the splice_insert at the appropriate time.
  @_s.JsonKey(name: 'duration')
  final int duration;

  Scte35SpliceInsertScheduleActionSettings({
    @_s.required this.spliceEventId,
    this.duration,
  });
  factory Scte35SpliceInsertScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$Scte35SpliceInsertScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$Scte35SpliceInsertScheduleActionSettingsToJson(this);
}

/// Scte35 Splice Insert Web Delivery Allowed Behavior
enum Scte35SpliceInsertWebDeliveryAllowedBehavior {
  @_s.JsonValue('FOLLOW')
  follow,
  @_s.JsonValue('IGNORE')
  ignore,
}

/// Scte35 Time Signal Apos
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35TimeSignalApos {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time. This only applies to embedded SCTE 104/35 messages and does not
  /// apply to OOB messages.
  @_s.JsonKey(name: 'adAvailOffset')
  final int adAvailOffset;

  /// When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  @_s.JsonKey(name: 'noRegionalBlackoutFlag')
  final Scte35AposNoRegionalBlackoutBehavior noRegionalBlackoutFlag;

  /// When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  @_s.JsonKey(name: 'webDeliveryAllowedFlag')
  final Scte35AposWebDeliveryAllowedBehavior webDeliveryAllowedFlag;

  Scte35TimeSignalApos({
    this.adAvailOffset,
    this.noRegionalBlackoutFlag,
    this.webDeliveryAllowedFlag,
  });
  factory Scte35TimeSignalApos.fromJson(Map<String, dynamic> json) =>
      _$Scte35TimeSignalAposFromJson(json);

  Map<String, dynamic> toJson() => _$Scte35TimeSignalAposToJson(this);
}

/// Settings for a SCTE-35 time_signal.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Scte35TimeSignalScheduleActionSettings {
  /// The list of SCTE-35 descriptors accompanying the SCTE-35 time_signal.
  @_s.JsonKey(name: 'scte35Descriptors')
  final List<Scte35Descriptor> scte35Descriptors;

  Scte35TimeSignalScheduleActionSettings({
    @_s.required this.scte35Descriptors,
  });
  factory Scte35TimeSignalScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$Scte35TimeSignalScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$Scte35TimeSignalScheduleActionSettingsToJson(this);
}

/// Corresponds to the web_delivery_allowed_flag parameter. A value of
/// WEB_DELIVERY_NOT_ALLOWED corresponds to 0 (false) in the SCTE-35
/// specification. If you include one of the "restriction" flags then you must
/// include all four of them.
enum Scte35WebDeliveryAllowedFlag {
  @_s.JsonValue('WEB_DELIVERY_NOT_ALLOWED')
  webDeliveryNotAllowed,
  @_s.JsonValue('WEB_DELIVERY_ALLOWED')
  webDeliveryAllowed,
}

/// Smooth Group Audio Only Timecode Control
enum SmoothGroupAudioOnlyTimecodeControl {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('USE_CONFIGURED_CLOCK')
  useConfiguredClock,
}

/// Smooth Group Certificate Mode
enum SmoothGroupCertificateMode {
  @_s.JsonValue('SELF_SIGNED')
  selfSigned,
  @_s.JsonValue('VERIFY_AUTHENTICITY')
  verifyAuthenticity,
}

/// Smooth Group Event Id Mode
enum SmoothGroupEventIdMode {
  @_s.JsonValue('NO_EVENT_ID')
  noEventId,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
  @_s.JsonValue('USE_TIMESTAMP')
  useTimestamp,
}

/// Smooth Group Event Stop Behavior
enum SmoothGroupEventStopBehavior {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SEND_EOS')
  sendEos,
}

/// Smooth Group Segmentation Mode
enum SmoothGroupSegmentationMode {
  @_s.JsonValue('USE_INPUT_SEGMENTATION')
  useInputSegmentation,
  @_s.JsonValue('USE_SEGMENT_DURATION')
  useSegmentDuration,
}

/// Smooth Group Sparse Track Type
enum SmoothGroupSparseTrackType {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('SCTE_35')
  scte_35,
  @_s.JsonValue('SCTE_35_WITHOUT_SEGMENTATION')
  scte_35WithoutSegmentation,
}

/// Smooth Group Stream Manifest Behavior
enum SmoothGroupStreamManifestBehavior {
  @_s.JsonValue('DO_NOT_SEND')
  doNotSend,
  @_s.JsonValue('SEND')
  send,
}

/// Smooth Group Timestamp Offset Mode
enum SmoothGroupTimestampOffsetMode {
  @_s.JsonValue('USE_CONFIGURED_OFFSET')
  useConfiguredOffset,
  @_s.JsonValue('USE_EVENT_START_DATE')
  useEventStartDate,
}

/// Smpte2038 Data Preference
enum Smpte2038DataPreference {
  @_s.JsonValue('IGNORE')
  ignore,
  @_s.JsonValue('PREFER')
  prefer,
}

/// Smpte Tt Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SmpteTtDestinationSettings {
  SmpteTtDestinationSettings();
  factory SmpteTtDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$SmpteTtDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SmpteTtDestinationSettingsToJson(this);
}

/// Standard Hls Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StandardHlsSettings {
  @_s.JsonKey(name: 'm3u8Settings')
  final M3u8Settings m3u8Settings;

  /// List all the audio groups that are used with the video output stream. Input
  /// all the audio GROUP-IDs that are associated to the video, separate by ','.
  @_s.JsonKey(name: 'audioRenditionSets')
  final String audioRenditionSets;

  StandardHlsSettings({
    @_s.required this.m3u8Settings,
    this.audioRenditionSets,
  });
  factory StandardHlsSettings.fromJson(Map<String, dynamic> json) =>
      _$StandardHlsSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$StandardHlsSettingsToJson(this);
}

/// Placeholder documentation for StartChannelResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartChannelResponse {
  /// The unique arn of the channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specification of CDI inputs for this channel
  @_s.JsonKey(name: 'cdiInputSpecification')
  final CdiInputSpecification cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  @_s.JsonKey(name: 'channelClass')
  final ChannelClass channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  @_s.JsonKey(name: 'destinations')
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  @_s.JsonKey(name: 'egressEndpoints')
  final List<ChannelEgressEndpoint> egressEndpoints;
  @_s.JsonKey(name: 'encoderSettings')
  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  @_s.JsonKey(name: 'id')
  final String id;

  /// List of input attachments for channel.
  @_s.JsonKey(name: 'inputAttachments')
  final List<InputAttachment> inputAttachments;

  /// Specification of network and file inputs for this channel
  @_s.JsonKey(name: 'inputSpecification')
  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The name of the channel. (user-mutable)
  @_s.JsonKey(name: 'name')
  final String name;

  /// Runtime details for the pipelines of a running channel.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;
  @_s.JsonKey(name: 'state')
  final ChannelState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  StartChannelResponse({
    this.arn,
    this.cdiInputSpecification,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  factory StartChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$StartChannelResponseFromJson(json);
}

/// Placeholder documentation for StartMultiplexResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartMultiplexResponse {
  /// The unique arn of the multiplex.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of availability zones for the multiplex.
  @_s.JsonKey(name: 'availabilityZones')
  final List<String> availabilityZones;

  /// A list of the multiplex output destinations.
  @_s.JsonKey(name: 'destinations')
  final List<MultiplexOutputDestination> destinations;

  /// The unique id of the multiplex.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Configuration for a multiplex event.
  @_s.JsonKey(name: 'multiplexSettings')
  final MultiplexSettings multiplexSettings;

  /// The name of the multiplex.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The number of programs in the multiplex.
  @_s.JsonKey(name: 'programCount')
  final int programCount;

  /// The current state of the multiplex.
  @_s.JsonKey(name: 'state')
  final MultiplexState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  StartMultiplexResponse({
    this.arn,
    this.availabilityZones,
    this.destinations,
    this.id,
    this.multiplexSettings,
    this.name,
    this.pipelinesRunningCount,
    this.programCount,
    this.state,
    this.tags,
  });
  factory StartMultiplexResponse.fromJson(Map<String, dynamic> json) =>
      _$StartMultiplexResponseFromJson(json);
}

/// Settings to identify the start of the clip.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StartTimecode {
  /// The timecode for the frame where you want to start the clip. Optional; if
  /// not specified, the clip starts at first frame in the file. Enter the
  /// timecode as HH:MM:SS:FF or HH:MM:SS;FF.
  @_s.JsonKey(name: 'timecode')
  final String timecode;

  StartTimecode({
    this.timecode,
  });
  factory StartTimecode.fromJson(Map<String, dynamic> json) =>
      _$StartTimecodeFromJson(json);

  Map<String, dynamic> toJson() => _$StartTimecodeToJson(this);
}

/// Settings for the action to activate a static image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StaticImageActivateScheduleActionSettings {
  /// The location and filename of the image file to overlay on the video. The
  /// file must be a 32-bit BMP, PNG, or TGA file, and must not be larger (in
  /// pixels) than the input video.
  @_s.JsonKey(name: 'image')
  final InputLocation image;

  /// The duration in milliseconds for the image to remain on the video. If
  /// omitted or set to 0 the duration is unlimited and the image will remain
  /// until it is explicitly deactivated.
  @_s.JsonKey(name: 'duration')
  final int duration;

  /// The time in milliseconds for the image to fade in. The fade-in starts at the
  /// start time of the overlay. Default is 0 (no fade-in).
  @_s.JsonKey(name: 'fadeIn')
  final int fadeIn;

  /// Applies only if a duration is specified. The time in milliseconds for the
  /// image to fade out. The fade-out starts when the duration time is hit, so it
  /// effectively extends the duration. Default is 0 (no fade-out).
  @_s.JsonKey(name: 'fadeOut')
  final int fadeOut;

  /// The height of the image when inserted into the video, in pixels. The overlay
  /// will be scaled up or down to the specified height. Leave blank to use the
  /// native height of the overlay.
  @_s.JsonKey(name: 'height')
  final int height;

  /// Placement of the left edge of the overlay relative to the left edge of the
  /// video frame, in pixels. 0 (the default) is the left edge of the frame. If
  /// the placement causes the overlay to extend beyond the right edge of the
  /// underlying video, then the overlay is cropped on the right.
  @_s.JsonKey(name: 'imageX')
  final int imageX;

  /// Placement of the top edge of the overlay relative to the top edge of the
  /// video frame, in pixels. 0 (the default) is the top edge of the frame. If the
  /// placement causes the overlay to extend beyond the bottom edge of the
  /// underlying video, then the overlay is cropped on the bottom.
  @_s.JsonKey(name: 'imageY')
  final int imageY;

  /// The number of the layer, 0 to 7. There are 8 layers that can be overlaid on
  /// the video, each layer with a different image. The layers are in Z order,
  /// which means that overlays with higher values of layer are inserted on top of
  /// overlays with lower values of layer. Default is 0.
  @_s.JsonKey(name: 'layer')
  final int layer;

  /// Opacity of image where 0 is transparent and 100 is fully opaque. Default is
  /// 100.
  @_s.JsonKey(name: 'opacity')
  final int opacity;

  /// The width of the image when inserted into the video, in pixels. The overlay
  /// will be scaled up or down to the specified width. Leave blank to use the
  /// native width of the overlay.
  @_s.JsonKey(name: 'width')
  final int width;

  StaticImageActivateScheduleActionSettings({
    @_s.required this.image,
    this.duration,
    this.fadeIn,
    this.fadeOut,
    this.height,
    this.imageX,
    this.imageY,
    this.layer,
    this.opacity,
    this.width,
  });
  factory StaticImageActivateScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$StaticImageActivateScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StaticImageActivateScheduleActionSettingsToJson(this);
}

/// Settings for the action to deactivate the image in a specific layer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StaticImageDeactivateScheduleActionSettings {
  /// The time in milliseconds for the image to fade out. Default is 0 (no
  /// fade-out).
  @_s.JsonKey(name: 'fadeOut')
  final int fadeOut;

  /// The image overlay layer to deactivate, 0 to 7. Default is 0.
  @_s.JsonKey(name: 'layer')
  final int layer;

  StaticImageDeactivateScheduleActionSettings({
    this.fadeOut,
    this.layer,
  });
  factory StaticImageDeactivateScheduleActionSettings.fromJson(
          Map<String, dynamic> json) =>
      _$StaticImageDeactivateScheduleActionSettingsFromJson(json);

  Map<String, dynamic> toJson() =>
      _$StaticImageDeactivateScheduleActionSettingsToJson(this);
}

/// Static Key Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StaticKeySettings {
  /// Static key value as a 32 character hexadecimal string.
  @_s.JsonKey(name: 'staticKeyValue')
  final String staticKeyValue;

  /// The URL of the license server used for protecting content.
  @_s.JsonKey(name: 'keyProviderServer')
  final InputLocation keyProviderServer;

  StaticKeySettings({
    @_s.required this.staticKeyValue,
    this.keyProviderServer,
  });
  factory StaticKeySettings.fromJson(Map<String, dynamic> json) =>
      _$StaticKeySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$StaticKeySettingsToJson(this);
}

/// Placeholder documentation for StopChannelResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopChannelResponse {
  /// The unique arn of the channel.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specification of CDI inputs for this channel
  @_s.JsonKey(name: 'cdiInputSpecification')
  final CdiInputSpecification cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  @_s.JsonKey(name: 'channelClass')
  final ChannelClass channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  @_s.JsonKey(name: 'destinations')
  final List<OutputDestination> destinations;

  /// The endpoints where outgoing connections initiate from
  @_s.JsonKey(name: 'egressEndpoints')
  final List<ChannelEgressEndpoint> egressEndpoints;
  @_s.JsonKey(name: 'encoderSettings')
  final EncoderSettings encoderSettings;

  /// The unique id of the channel.
  @_s.JsonKey(name: 'id')
  final String id;

  /// List of input attachments for channel.
  @_s.JsonKey(name: 'inputAttachments')
  final List<InputAttachment> inputAttachments;

  /// Specification of network and file inputs for this channel
  @_s.JsonKey(name: 'inputSpecification')
  final InputSpecification inputSpecification;

  /// The log level being written to CloudWatch Logs.
  @_s.JsonKey(name: 'logLevel')
  final LogLevel logLevel;

  /// The name of the channel. (user-mutable)
  @_s.JsonKey(name: 'name')
  final String name;

  /// Runtime details for the pipelines of a running channel.
  @_s.JsonKey(name: 'pipelineDetails')
  final List<PipelineDetail> pipelineDetails;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  @_s.JsonKey(name: 'roleArn')
  final String roleArn;
  @_s.JsonKey(name: 'state')
  final ChannelState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  StopChannelResponse({
    this.arn,
    this.cdiInputSpecification,
    this.channelClass,
    this.destinations,
    this.egressEndpoints,
    this.encoderSettings,
    this.id,
    this.inputAttachments,
    this.inputSpecification,
    this.logLevel,
    this.name,
    this.pipelineDetails,
    this.pipelinesRunningCount,
    this.roleArn,
    this.state,
    this.tags,
  });
  factory StopChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$StopChannelResponseFromJson(json);
}

/// Placeholder documentation for StopMultiplexResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopMultiplexResponse {
  /// The unique arn of the multiplex.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A list of availability zones for the multiplex.
  @_s.JsonKey(name: 'availabilityZones')
  final List<String> availabilityZones;

  /// A list of the multiplex output destinations.
  @_s.JsonKey(name: 'destinations')
  final List<MultiplexOutputDestination> destinations;

  /// The unique id of the multiplex.
  @_s.JsonKey(name: 'id')
  final String id;

  /// Configuration for a multiplex event.
  @_s.JsonKey(name: 'multiplexSettings')
  final MultiplexSettings multiplexSettings;

  /// The name of the multiplex.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The number of currently healthy pipelines.
  @_s.JsonKey(name: 'pipelinesRunningCount')
  final int pipelinesRunningCount;

  /// The number of programs in the multiplex.
  @_s.JsonKey(name: 'programCount')
  final int programCount;

  /// The current state of the multiplex.
  @_s.JsonKey(name: 'state')
  final MultiplexState state;

  /// A collection of key-value pairs.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  StopMultiplexResponse({
    this.arn,
    this.availabilityZones,
    this.destinations,
    this.id,
    this.multiplexSettings,
    this.name,
    this.pipelinesRunningCount,
    this.programCount,
    this.state,
    this.tags,
  });
  factory StopMultiplexResponse.fromJson(Map<String, dynamic> json) =>
      _$StopMultiplexResponseFromJson(json);
}

/// Settings to identify the end of the clip.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StopTimecode {
  /// If you specify a StopTimecode in an input (in order to clip the file), you
  /// can specify if you want the clip to exclude (the default) or include the
  /// frame specified by the timecode.
  @_s.JsonKey(name: 'lastFrameClippingBehavior')
  final LastFrameClippingBehavior lastFrameClippingBehavior;

  /// The timecode for the frame where you want to stop the clip. Optional; if not
  /// specified, the clip continues to the end of the file. Enter the timecode as
  /// HH:MM:SS:FF or HH:MM:SS;FF.
  @_s.JsonKey(name: 'timecode')
  final String timecode;

  StopTimecode({
    this.lastFrameClippingBehavior,
    this.timecode,
  });
  factory StopTimecode.fromJson(Map<String, dynamic> json) =>
      _$StopTimecodeFromJson(json);

  Map<String, dynamic> toJson() => _$StopTimecodeToJson(this);
}

/// Teletext Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TeletextDestinationSettings {
  TeletextDestinationSettings();
  factory TeletextDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$TeletextDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TeletextDestinationSettingsToJson(this);
}

/// Teletext Source Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TeletextSourceSettings {
  /// Specifies the teletext page number within the data stream from which to
  /// extract captions. Range of 0x100 (256) to 0x8FF (2303). Unused for
  /// passthrough. Should be specified as a hexadecimal string with no "0x"
  /// prefix.
  @_s.JsonKey(name: 'pageNumber')
  final String pageNumber;

  TeletextSourceSettings({
    this.pageNumber,
  });
  factory TeletextSourceSettings.fromJson(Map<String, dynamic> json) =>
      _$TeletextSourceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TeletextSourceSettingsToJson(this);
}

/// Temporal Filter Post Filter Sharpening
enum TemporalFilterPostFilterSharpening {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

/// Temporal Filter Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TemporalFilterSettings {
  /// If you enable this filter, the results are the following:
  /// - If the source content is noisy (it contains excessive digital artifacts),
  /// the filter cleans up the source.
  /// - If the source content is already clean, the filter tends to decrease the
  /// bitrate, especially when the rate control mode is QVBR.
  @_s.JsonKey(name: 'postFilterSharpening')
  final TemporalFilterPostFilterSharpening postFilterSharpening;

  /// Choose a filter strength. We recommend a strength of 1 or 2. A higher
  /// strength might take out good information, resulting in an image that is
  /// overly soft.
  @_s.JsonKey(name: 'strength')
  final TemporalFilterStrength strength;

  TemporalFilterSettings({
    this.postFilterSharpening,
    this.strength,
  });
  factory TemporalFilterSettings.fromJson(Map<String, dynamic> json) =>
      _$TemporalFilterSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TemporalFilterSettingsToJson(this);
}

/// Temporal Filter Strength
enum TemporalFilterStrength {
  @_s.JsonValue('AUTO')
  auto,
  @_s.JsonValue('STRENGTH_1')
  strength_1,
  @_s.JsonValue('STRENGTH_2')
  strength_2,
  @_s.JsonValue('STRENGTH_3')
  strength_3,
  @_s.JsonValue('STRENGTH_4')
  strength_4,
  @_s.JsonValue('STRENGTH_5')
  strength_5,
  @_s.JsonValue('STRENGTH_6')
  strength_6,
  @_s.JsonValue('STRENGTH_7')
  strength_7,
  @_s.JsonValue('STRENGTH_8')
  strength_8,
  @_s.JsonValue('STRENGTH_9')
  strength_9,
  @_s.JsonValue('STRENGTH_10')
  strength_10,
  @_s.JsonValue('STRENGTH_11')
  strength_11,
  @_s.JsonValue('STRENGTH_12')
  strength_12,
  @_s.JsonValue('STRENGTH_13')
  strength_13,
  @_s.JsonValue('STRENGTH_14')
  strength_14,
  @_s.JsonValue('STRENGTH_15')
  strength_15,
  @_s.JsonValue('STRENGTH_16')
  strength_16,
}

/// Timecode Config
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimecodeConfig {
  /// Identifies the source for the timecode that will be associated with the
  /// events outputs.
  /// -Embedded (embedded): Initialize the output timecode with timecode from the
  /// the source.  If no embedded timecode is detected in the source, the system
  /// falls back to using "Start at 0" (zerobased).
  /// -System Clock (systemclock): Use the UTC time.
  /// -Start at 0 (zerobased): The time of the first frame of the event will be
  /// 00:00:00:00.
  @_s.JsonKey(name: 'source')
  final TimecodeConfigSource source;

  /// Threshold in frames beyond which output timecode is resynchronized to the
  /// input timecode. Discrepancies below this threshold are permitted to avoid
  /// unnecessary discontinuities in the output timecode. No timecode sync when
  /// this is not specified.
  @_s.JsonKey(name: 'syncThreshold')
  final int syncThreshold;

  TimecodeConfig({
    @_s.required this.source,
    this.syncThreshold,
  });
  factory TimecodeConfig.fromJson(Map<String, dynamic> json) =>
      _$TimecodeConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TimecodeConfigToJson(this);
}

/// Timecode Config Source
enum TimecodeConfigSource {
  @_s.JsonValue('EMBEDDED')
  embedded,
  @_s.JsonValue('SYSTEMCLOCK')
  systemclock,
  @_s.JsonValue('ZEROBASED')
  zerobased,
}

/// Placeholder documentation for TransferInputDeviceResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransferInputDeviceResponse {
  TransferInputDeviceResponse();
  factory TransferInputDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferInputDeviceResponseFromJson(json);
}

/// Details about the input device that is being transferred.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransferringInputDeviceSummary {
  /// The unique ID of the input device.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The optional message that the sender has attached to the transfer.
  @_s.JsonKey(name: 'message')
  final String message;

  /// The AWS account ID for the recipient of the input device transfer.
  @_s.JsonKey(name: 'targetCustomerId')
  final String targetCustomerId;

  /// The type (direction) of the input device transfer.
  @_s.JsonKey(name: 'transferType')
  final InputDeviceTransferType transferType;

  TransferringInputDeviceSummary({
    this.id,
    this.message,
    this.targetCustomerId,
    this.transferType,
  });
  factory TransferringInputDeviceSummary.fromJson(Map<String, dynamic> json) =>
      _$TransferringInputDeviceSummaryFromJson(json);
}

/// Ttml Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TtmlDestinationSettings {
  /// When set to passthrough, passes through style and position information from
  /// a TTML-like input source (TTML, SMPTE-TT, CFF-TT) to the CFF-TT output or
  /// TTML output.
  @_s.JsonKey(name: 'styleControl')
  final TtmlDestinationStyleControl styleControl;

  TtmlDestinationSettings({
    this.styleControl,
  });
  factory TtmlDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$TtmlDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TtmlDestinationSettingsToJson(this);
}

/// Ttml Destination Style Control
enum TtmlDestinationStyleControl {
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('USE_CONFIGURED')
  useConfigured,
}

/// Udp Container Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UdpContainerSettings {
  @_s.JsonKey(name: 'm2tsSettings')
  final M2tsSettings m2tsSettings;

  UdpContainerSettings({
    this.m2tsSettings,
  });
  factory UdpContainerSettings.fromJson(Map<String, dynamic> json) =>
      _$UdpContainerSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UdpContainerSettingsToJson(this);
}

/// Udp Group Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UdpGroupSettings {
  /// Specifies behavior of last resort when input video is lost, and no more
  /// backup inputs are available. When dropTs is selected the entire transport
  /// stream will stop being emitted.  When dropProgram is selected the program
  /// can be dropped from the transport stream (and replaced with null packets to
  /// meet the TS bitrate requirement).  Or, when emitProgram is chosen the
  /// transport stream will continue to be produced normally with repeat frames,
  /// black frames, or slate frames substituted for the absent input video.
  @_s.JsonKey(name: 'inputLossAction')
  final InputLossActionForUdpOut inputLossAction;

  /// Indicates ID3 frame that has the timecode.
  @_s.JsonKey(name: 'timedMetadataId3Frame')
  final UdpTimedMetadataId3Frame timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  @_s.JsonKey(name: 'timedMetadataId3Period')
  final int timedMetadataId3Period;

  UdpGroupSettings({
    this.inputLossAction,
    this.timedMetadataId3Frame,
    this.timedMetadataId3Period,
  });
  factory UdpGroupSettings.fromJson(Map<String, dynamic> json) =>
      _$UdpGroupSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UdpGroupSettingsToJson(this);
}

/// Udp Output Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UdpOutputSettings {
  @_s.JsonKey(name: 'containerSettings')
  final UdpContainerSettings containerSettings;

  /// Destination address and port number for RTP or UDP packets. Can be unicast
  /// or multicast RTP or UDP (eg. rtp://239.10.10.10:5001 or
  /// udp://10.100.100.100:5002).
  @_s.JsonKey(name: 'destination')
  final OutputLocationRef destination;

  /// UDP output buffering in milliseconds. Larger values increase latency through
  /// the transcoder but simultaneously assist the transcoder in maintaining a
  /// constant, low-jitter UDP/RTP output while accommodating clock recovery,
  /// input switching, input disruptions, picture reordering, etc.
  @_s.JsonKey(name: 'bufferMsec')
  final int bufferMsec;

  /// Settings for enabling and adjusting Forward Error Correction on UDP outputs.
  @_s.JsonKey(name: 'fecOutputSettings')
  final FecOutputSettings fecOutputSettings;

  UdpOutputSettings({
    @_s.required this.containerSettings,
    @_s.required this.destination,
    this.bufferMsec,
    this.fecOutputSettings,
  });
  factory UdpOutputSettings.fromJson(Map<String, dynamic> json) =>
      _$UdpOutputSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UdpOutputSettingsToJson(this);
}

/// Udp Timed Metadata Id3 Frame
enum UdpTimedMetadataId3Frame {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PRIV')
  priv,
  @_s.JsonValue('TDRL')
  tdrl,
}

/// Placeholder documentation for UpdateChannelClassResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChannelClassResponse {
  @_s.JsonKey(name: 'channel')
  final Channel channel;

  UpdateChannelClassResponse({
    this.channel,
  });
  factory UpdateChannelClassResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelClassResponseFromJson(json);
}

/// Placeholder documentation for UpdateChannelResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChannelResponse {
  @_s.JsonKey(name: 'channel')
  final Channel channel;

  UpdateChannelResponse({
    this.channel,
  });
  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelResponseFromJson(json);
}

/// Placeholder documentation for UpdateInputDeviceResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInputDeviceResponse {
  /// The unique ARN of the input device.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The state of the connection between the input device and AWS.
  @_s.JsonKey(name: 'connectionState')
  final InputDeviceConnectionState connectionState;

  /// The status of the action to synchronize the device configuration. If you
  /// change the configuration of the input device (for example, the maximum
  /// bitrate), MediaLive sends the new data to the device. The device might not
  /// update itself immediately. SYNCED means the device has updated its
  /// configuration. SYNCING means that it has not updated its configuration.
  @_s.JsonKey(name: 'deviceSettingsSyncState')
  final DeviceSettingsSyncState deviceSettingsSyncState;

  /// The status of software on the input device.
  @_s.JsonKey(name: 'deviceUpdateStatus')
  final DeviceUpdateStatus deviceUpdateStatus;

  /// Settings that describe an input device that is type HD.
  @_s.JsonKey(name: 'hdDeviceSettings')
  final InputDeviceHdSettings hdDeviceSettings;

  /// The unique ID of the input device.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The network MAC address of the input device.
  @_s.JsonKey(name: 'macAddress')
  final String macAddress;

  /// A name that you specify for the input device.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The network settings for the input device.
  @_s.JsonKey(name: 'networkSettings')
  final InputDeviceNetworkSettings networkSettings;

  /// The unique serial number of the input device.
  @_s.JsonKey(name: 'serialNumber')
  final String serialNumber;

  /// The type of the input device.
  @_s.JsonKey(name: 'type')
  final InputDeviceType type;

  /// Settings that describe an input device that is type UHD.
  @_s.JsonKey(name: 'uhdDeviceSettings')
  final InputDeviceUhdSettings uhdDeviceSettings;

  UpdateInputDeviceResponse({
    this.arn,
    this.connectionState,
    this.deviceSettingsSyncState,
    this.deviceUpdateStatus,
    this.hdDeviceSettings,
    this.id,
    this.macAddress,
    this.name,
    this.networkSettings,
    this.serialNumber,
    this.type,
    this.uhdDeviceSettings,
  });
  factory UpdateInputDeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInputDeviceResponseFromJson(json);
}

/// Placeholder documentation for UpdateInputResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInputResponse {
  @_s.JsonKey(name: 'input')
  final Input input;

  UpdateInputResponse({
    this.input,
  });
  factory UpdateInputResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateInputResponseFromJson(json);
}

/// Placeholder documentation for UpdateInputSecurityGroupResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInputSecurityGroupResponse {
  @_s.JsonKey(name: 'securityGroup')
  final InputSecurityGroup securityGroup;

  UpdateInputSecurityGroupResponse({
    this.securityGroup,
  });
  factory UpdateInputSecurityGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateInputSecurityGroupResponseFromJson(json);
}

/// Placeholder documentation for UpdateMultiplexProgramResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMultiplexProgramResponse {
  /// The updated multiplex program.
  @_s.JsonKey(name: 'multiplexProgram')
  final MultiplexProgram multiplexProgram;

  UpdateMultiplexProgramResponse({
    this.multiplexProgram,
  });
  factory UpdateMultiplexProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMultiplexProgramResponseFromJson(json);
}

/// Placeholder documentation for UpdateMultiplexResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMultiplexResponse {
  /// The updated multiplex.
  @_s.JsonKey(name: 'multiplex')
  final Multiplex multiplex;

  UpdateMultiplexResponse({
    this.multiplex,
  });
  factory UpdateMultiplexResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMultiplexResponseFromJson(json);
}

/// Placeholder documentation for UpdateReservationResponse
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateReservationResponse {
  @_s.JsonKey(name: 'reservation')
  final Reservation reservation;

  UpdateReservationResponse({
    this.reservation,
  });
  factory UpdateReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateReservationResponseFromJson(json);
}

/// Placeholder documentation for VideoBlackFailoverSettings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoBlackFailoverSettings {
  /// A value used in calculating the threshold below which MediaLive considers a
  /// pixel to be 'black'. For the input to be considered black, every pixel in a
  /// frame must be below this threshold. The threshold is calculated as a
  /// percentage (expressed as a decimal) of white. Therefore .1 means 10% white
  /// (or 90% black). Note how the formula works for any color depth. For example,
  /// if you set this field to 0.1 in 10-bit color depth: (1023*0.1=102.3), which
  /// means a pixel value of 102 or less is 'black'. If you set this field to .1
  /// in an 8-bit color depth: (255*0.1=25.5), which means a pixel value of 25 or
  /// less is 'black'. The range is 0.0 to 1.0, with any number of decimal places.
  @_s.JsonKey(name: 'blackDetectThreshold')
  final double blackDetectThreshold;

  /// The amount of time (in milliseconds) that the active input must be black
  /// before automatic input failover occurs.
  @_s.JsonKey(name: 'videoBlackThresholdMsec')
  final int videoBlackThresholdMsec;

  VideoBlackFailoverSettings({
    this.blackDetectThreshold,
    this.videoBlackThresholdMsec,
  });
  factory VideoBlackFailoverSettings.fromJson(Map<String, dynamic> json) =>
      _$VideoBlackFailoverSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoBlackFailoverSettingsToJson(this);
}

/// Video Codec Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoCodecSettings {
  @_s.JsonKey(name: 'frameCaptureSettings')
  final FrameCaptureSettings frameCaptureSettings;
  @_s.JsonKey(name: 'h264Settings')
  final H264Settings h264Settings;
  @_s.JsonKey(name: 'h265Settings')
  final H265Settings h265Settings;
  @_s.JsonKey(name: 'mpeg2Settings')
  final Mpeg2Settings mpeg2Settings;

  VideoCodecSettings({
    this.frameCaptureSettings,
    this.h264Settings,
    this.h265Settings,
    this.mpeg2Settings,
  });
  factory VideoCodecSettings.fromJson(Map<String, dynamic> json) =>
      _$VideoCodecSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCodecSettingsToJson(this);
}

/// Video settings for this stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoDescription {
  /// The name of this VideoDescription. Outputs will use this name to uniquely
  /// identify this Description.  Description names should be unique within this
  /// Live Event.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Video codec settings.
  @_s.JsonKey(name: 'codecSettings')
  final VideoCodecSettings codecSettings;

  /// Output video height, in pixels. Must be an even number. For most codecs, you
  /// can leave this field and width blank in order to use the height and width
  /// (resolution) from the source. Note, however, that leaving blank is not
  /// recommended. For the Frame Capture codec, height and width are required.
  @_s.JsonKey(name: 'height')
  final int height;

  /// Indicates how MediaLive will respond to the AFD values that might be in the
  /// input video. If you do not know what AFD signaling is, or if your downstream
  /// system has not given you guidance, choose PASSTHROUGH.
  /// RESPOND: MediaLive clips the input video using a formula that uses the AFD
  /// values (configured in afdSignaling ), the input display aspect ratio, and
  /// the output display aspect ratio. MediaLive also includes the AFD values in
  /// the output, unless the codec for this encode is FRAME_CAPTURE.
  /// PASSTHROUGH: MediaLive ignores the AFD values and does not clip the video.
  /// But MediaLive does include the values in the output.
  /// NONE: MediaLive does not clip the input video and does not include the AFD
  /// values in the output
  @_s.JsonKey(name: 'respondToAfd')
  final VideoDescriptionRespondToAfd respondToAfd;

  /// STRETCH_TO_OUTPUT configures the output position to stretch the video to the
  /// specified output resolution (height and width). This option will override
  /// any position value. DEFAULT may insert black boxes (pillar boxes or letter
  /// boxes) around the video to provide the specified output resolution.
  @_s.JsonKey(name: 'scalingBehavior')
  final VideoDescriptionScalingBehavior scalingBehavior;

  /// Changes the strength of the anti-alias filter used for scaling. 0 is the
  /// softest setting, 100 is the sharpest. A setting of 50 is recommended for
  /// most content.
  @_s.JsonKey(name: 'sharpness')
  final int sharpness;

  /// Output video width, in pixels. Must be an even number. For most codecs, you
  /// can leave this field and height blank in order to use the height and width
  /// (resolution) from the source. Note, however, that leaving blank is not
  /// recommended. For the Frame Capture codec, height and width are required.
  @_s.JsonKey(name: 'width')
  final int width;

  VideoDescription({
    @_s.required this.name,
    this.codecSettings,
    this.height,
    this.respondToAfd,
    this.scalingBehavior,
    this.sharpness,
    this.width,
  });
  factory VideoDescription.fromJson(Map<String, dynamic> json) =>
      _$VideoDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$VideoDescriptionToJson(this);
}

/// Video Description Respond To Afd
enum VideoDescriptionRespondToAfd {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('PASSTHROUGH')
  passthrough,
  @_s.JsonValue('RESPOND')
  respond,
}

/// Video Description Scaling Behavior
enum VideoDescriptionScalingBehavior {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('STRETCH_TO_OUTPUT')
  stretchToOutput,
}

/// Specifies a particular video stream within an input source. An input may
/// have only a single video selector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoSelector {
  /// Specifies the color space of an input. This setting works in tandem with
  /// colorSpaceUsage and a video description's colorSpaceSettingsChoice to
  /// determine if any conversion will be performed.
  @_s.JsonKey(name: 'colorSpace')
  final VideoSelectorColorSpace colorSpace;

  /// Applies only if colorSpace is a value other than follow. This field controls
  /// how the value in the colorSpace field will be used. fallback means that when
  /// the input does include color space data, that data will be used, but when
  /// the input has no color space data, the value in colorSpace will be used.
  /// Choose fallback if your input is sometimes missing color space data, but
  /// when it does have color space data, that data is correct. force means to
  /// always use the value in colorSpace. Choose force if your input usually has
  /// no color space data or might have unreliable color space data.
  @_s.JsonKey(name: 'colorSpaceUsage')
  final VideoSelectorColorSpaceUsage colorSpaceUsage;

  /// The video selector settings.
  @_s.JsonKey(name: 'selectorSettings')
  final VideoSelectorSettings selectorSettings;

  VideoSelector({
    this.colorSpace,
    this.colorSpaceUsage,
    this.selectorSettings,
  });
  factory VideoSelector.fromJson(Map<String, dynamic> json) =>
      _$VideoSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSelectorToJson(this);
}

/// Video Selector Color Space
enum VideoSelectorColorSpace {
  @_s.JsonValue('FOLLOW')
  follow,
  @_s.JsonValue('REC_601')
  rec_601,
  @_s.JsonValue('REC_709')
  rec_709,
}

/// Video Selector Color Space Usage
enum VideoSelectorColorSpaceUsage {
  @_s.JsonValue('FALLBACK')
  fallback,
  @_s.JsonValue('FORCE')
  force,
}

/// Video Selector Pid
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoSelectorPid {
  /// Selects a specific PID from within a video source.
  @_s.JsonKey(name: 'pid')
  final int pid;

  VideoSelectorPid({
    this.pid,
  });
  factory VideoSelectorPid.fromJson(Map<String, dynamic> json) =>
      _$VideoSelectorPidFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSelectorPidToJson(this);
}

/// Video Selector Program Id
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoSelectorProgramId {
  /// Selects a specific program from within a multi-program transport stream. If
  /// the program doesn't exist, the first program within the transport stream
  /// will be selected by default.
  @_s.JsonKey(name: 'programId')
  final int programId;

  VideoSelectorProgramId({
    this.programId,
  });
  factory VideoSelectorProgramId.fromJson(Map<String, dynamic> json) =>
      _$VideoSelectorProgramIdFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSelectorProgramIdToJson(this);
}

/// Video Selector Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VideoSelectorSettings {
  @_s.JsonKey(name: 'videoSelectorPid')
  final VideoSelectorPid videoSelectorPid;
  @_s.JsonKey(name: 'videoSelectorProgramId')
  final VideoSelectorProgramId videoSelectorProgramId;

  VideoSelectorSettings({
    this.videoSelectorPid,
    this.videoSelectorProgramId,
  });
  factory VideoSelectorSettings.fromJson(Map<String, dynamic> json) =>
      _$VideoSelectorSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$VideoSelectorSettingsToJson(this);
}

/// Wav Coding Mode
enum WavCodingMode {
  @_s.JsonValue('CODING_MODE_1_0')
  codingMode_1_0,
  @_s.JsonValue('CODING_MODE_2_0')
  codingMode_2_0,
  @_s.JsonValue('CODING_MODE_4_0')
  codingMode_4_0,
  @_s.JsonValue('CODING_MODE_8_0')
  codingMode_8_0,
}

/// Wav Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WavSettings {
  /// Bits per sample.
  @_s.JsonKey(name: 'bitDepth')
  final double bitDepth;

  /// The audio coding mode for the WAV audio. The mode determines the number of
  /// channels in the audio.
  @_s.JsonKey(name: 'codingMode')
  final WavCodingMode codingMode;

  /// Sample rate in Hz.
  @_s.JsonKey(name: 'sampleRate')
  final double sampleRate;

  WavSettings({
    this.bitDepth,
    this.codingMode,
    this.sampleRate,
  });
  factory WavSettings.fromJson(Map<String, dynamic> json) =>
      _$WavSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$WavSettingsToJson(this);
}

/// Webvtt Destination Settings
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WebvttDestinationSettings {
  WebvttDestinationSettings();
  factory WebvttDestinationSettings.fromJson(Map<String, dynamic> json) =>
      _$WebvttDestinationSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$WebvttDestinationSettingsToJson(this);
}

/// The HTTP Accept header. Indicates the requested type fothe thumbnail.
enum AcceptHeader {
  @_s.JsonValue('image/jpeg')
  imageJpeg,
}

extension on AcceptHeader {
  String toValue() {
    switch (this) {
      case AcceptHeader.imageJpeg:
        return 'image/jpeg';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Specifies the media type of the thumbnail.
enum ContentType {
  @_s.JsonValue('image/jpeg')
  imageJpeg,
}

extension on String {
  ContentType toContentType() {
    switch (this) {
      case 'image/jpeg':
        return ContentType.imageJpeg;
    }
    throw Exception('Unknown enum value: $this');
  }
}

class BadGatewayException extends _s.GenericAwsException {
  BadGatewayException({String type, String message})
      : super(type: type, code: 'BadGatewayException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GatewayTimeoutException extends _s.GenericAwsException {
  GatewayTimeoutException({String type, String message})
      : super(type: type, code: 'GatewayTimeoutException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String type, String message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String type, String message})
      : super(
            type: type, code: 'UnprocessableEntityException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadGatewayException': (type, message) =>
      BadGatewayException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'GatewayTimeoutException': (type, message) =>
      GatewayTimeoutException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
};
