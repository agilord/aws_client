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

/// API for AWS Elemental MediaLive
class MediaLive {
  final _s.RestJsonProtocol _protocol;
  MediaLive({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/accept',
      exceptionFnMap: _exceptionFns,
    );
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
    List<String>? channelIds,
    List<String>? inputIds,
    List<String>? inputSecurityGroupIds,
    List<String>? multiplexIds,
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
    List<String>? channelIds,
    List<String>? multiplexIds,
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
    List<String>? channelIds,
    List<String>? multiplexIds,
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
    required String channelId,
    BatchScheduleActionCreateRequest? creates,
    BatchScheduleActionDeleteRequest? deletes,
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
    required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
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
  ///
  /// Parameter [vpc] :
  /// Settings for VPC output
  Future<CreateChannelResponse> createChannel({
    CdiInputSpecification? cdiInputSpecification,
    ChannelClass? channelClass,
    List<OutputDestination>? destinations,
    EncoderSettings? encoderSettings,
    List<InputAttachment>? inputAttachments,
    InputSpecification? inputSpecification,
    LogLevel? logLevel,
    String? name,
    String? requestId,
    String? reserved,
    String? roleArn,
    Map<String, String>? tags,
    VpcOutputSettings? vpc,
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
      if (vpc != null) 'vpc': vpc,
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
    List<InputDestinationRequest>? destinations,
    List<InputDeviceSettings>? inputDevices,
    List<String>? inputSecurityGroups,
    List<MediaConnectFlowRequest>? mediaConnectFlows,
    String? name,
    String? requestId,
    String? roleArn,
    List<InputSourceRequest>? sources,
    Map<String, String>? tags,
    InputType? type,
    InputVpcRequest? vpc,
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
    Map<String, String>? tags,
    List<InputWhitelistRuleCidr>? whitelistRules,
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
    required List<String> availabilityZones,
    required MultiplexSettings multiplexSettings,
    required String name,
    String? requestId,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(availabilityZones, 'availabilityZones');
    ArgumentError.checkNotNull(multiplexSettings, 'multiplexSettings');
    ArgumentError.checkNotNull(name, 'name');
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
    required String multiplexId,
    required MultiplexProgramSettings multiplexProgramSettings,
    required String programName,
    String? requestId,
  }) async {
    ArgumentError.checkNotNull(multiplexId, 'multiplexId');
    ArgumentError.checkNotNull(
        multiplexProgramSettings, 'multiplexProgramSettings');
    ArgumentError.checkNotNull(programName, 'programName');
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

  /// Create a partner input
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [BadGatewayException].
  /// May throw [GatewayTimeoutException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [inputId] :
  /// Unique ID of the input.
  ///
  /// Parameter [requestId] :
  /// Unique identifier of the request to ensure the request is handled
  /// exactly once in case of retries.
  ///
  /// Parameter [tags] :
  /// A collection of key-value pairs.
  Future<CreatePartnerInputResponse> createPartnerInput({
    required String inputId,
    String? requestId,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(inputId, 'inputId');
    final $payload = <String, dynamic>{
      'requestId': requestId ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prod/inputs/${Uri.encodeComponent(inputId)}/partners',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePartnerInputResponse.fromJson(response);
  }

  /// Create tags for a resource
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  Future<void> createTags({
    required String resourceArn,
    Map<String, String>? tags,
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
    required String channelId,
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
    required String inputId,
  }) async {
    ArgumentError.checkNotNull(inputId, 'inputId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/inputs/${Uri.encodeComponent(inputId)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String inputSecurityGroupId,
  }) async {
    ArgumentError.checkNotNull(inputSecurityGroupId, 'inputSecurityGroupId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/prod/inputSecurityGroups/${Uri.encodeComponent(inputSecurityGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String multiplexId,
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
    required String multiplexId,
    required String programName,
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
    required String reservationId,
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
    required String channelId,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prod/channels/${Uri.encodeComponent(channelId)}/schedule',
      exceptionFnMap: _exceptionFns,
    );
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
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
    required String channelId,
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
    required String inputId,
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
    required String inputDeviceId,
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
    required AcceptHeader accept,
    required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(accept, 'accept');
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final headers = <String, String>{
      'accept': accept.toValue(),
    };
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
    required String inputSecurityGroupId,
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
    required String multiplexId,
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
    required String multiplexId,
    required String programName,
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
    required String offeringId,
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
    required String reservationId,
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
    required String channelId,
    int? maxResults,
    String? nextToken,
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
    int? maxResults,
    String? nextToken,
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
    required String transferType,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(transferType, 'transferType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'transferType': [transferType],
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
    int? maxResults,
    String? nextToken,
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
    int? maxResults,
    String? nextToken,
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
    int? maxResults,
    String? nextToken,
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
    required String multiplexId,
    int? maxResults,
    String? nextToken,
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
    int? maxResults,
    String? nextToken,
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
    String? channelClass,
    String? channelConfiguration,
    String? codec,
    String? duration,
    int? maxResults,
    String? maximumBitrate,
    String? maximumFramerate,
    String? nextToken,
    String? resolution,
    String? resourceType,
    String? specialFeature,
    String? videoQuality,
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
    String? channelClass,
    String? codec,
    int? maxResults,
    String? maximumBitrate,
    String? maximumFramerate,
    String? nextToken,
    String? resolution,
    String? resourceType,
    String? specialFeature,
    String? videoQuality,
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
    required String resourceArn,
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
    required int count,
    required String offeringId,
    String? name,
    String? requestId,
    String? start,
    Map<String, String>? tags,
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
    required String inputDeviceId,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/reject',
      exceptionFnMap: _exceptionFns,
    );
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
    required String channelId,
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
    required String multiplexId,
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
    required String channelId,
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
    required String multiplexId,
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
  /// Parameter [targetRegion] :
  /// The target AWS region to transfer the device.
  ///
  /// Parameter [transferMessage] :
  /// An optional message for the recipient. Maximum 280 characters.
  Future<void> transferInputDevice({
    required String inputDeviceId,
    String? targetCustomerId,
    String? targetRegion,
    String? transferMessage,
  }) async {
    ArgumentError.checkNotNull(inputDeviceId, 'inputDeviceId');
    final $payload = <String, dynamic>{
      if (targetCustomerId != null) 'targetCustomerId': targetCustomerId,
      if (targetRegion != null) 'targetRegion': targetRegion,
      if (transferMessage != null) 'transferMessage': transferMessage,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/prod/inputDevices/${Uri.encodeComponent(inputDeviceId)}/transfer',
      exceptionFnMap: _exceptionFns,
    );
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
    required String channelId,
    CdiInputSpecification? cdiInputSpecification,
    List<OutputDestination>? destinations,
    EncoderSettings? encoderSettings,
    List<InputAttachment>? inputAttachments,
    InputSpecification? inputSpecification,
    LogLevel? logLevel,
    String? name,
    String? roleArn,
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
    required ChannelClass channelClass,
    required String channelId,
    List<OutputDestination>? destinations,
  }) async {
    ArgumentError.checkNotNull(channelClass, 'channelClass');
    ArgumentError.checkNotNull(channelId, 'channelId');
    final $payload = <String, dynamic>{
      'channelClass': channelClass.toValue(),
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
    required String inputId,
    List<InputDestinationRequest>? destinations,
    List<InputDeviceRequest>? inputDevices,
    List<String>? inputSecurityGroups,
    List<MediaConnectFlowRequest>? mediaConnectFlows,
    String? name,
    String? roleArn,
    List<InputSourceRequest>? sources,
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
    required String inputDeviceId,
    InputDeviceConfigurableSettings? hdDeviceSettings,
    String? name,
    InputDeviceConfigurableSettings? uhdDeviceSettings,
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
    required String inputSecurityGroupId,
    Map<String, String>? tags,
    List<InputWhitelistRuleCidr>? whitelistRules,
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
    required String multiplexId,
    MultiplexSettings? multiplexSettings,
    String? name,
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
    required String multiplexId,
    required String programName,
    MultiplexProgramSettings? multiplexProgramSettings,
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
    required String reservationId,
    String? name,
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
  adReceiverMix,
  codingMode_1_0,
  codingMode_1_1,
  codingMode_2_0,
  codingMode_5_1,
}

extension on AacCodingMode {
  String toValue() {
    switch (this) {
      case AacCodingMode.adReceiverMix:
        return 'AD_RECEIVER_MIX';
      case AacCodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case AacCodingMode.codingMode_1_1:
        return 'CODING_MODE_1_1';
      case AacCodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
      case AacCodingMode.codingMode_5_1:
        return 'CODING_MODE_5_1';
    }
  }
}

extension on String {
  AacCodingMode toAacCodingMode() {
    switch (this) {
      case 'AD_RECEIVER_MIX':
        return AacCodingMode.adReceiverMix;
      case 'CODING_MODE_1_0':
        return AacCodingMode.codingMode_1_0;
      case 'CODING_MODE_1_1':
        return AacCodingMode.codingMode_1_1;
      case 'CODING_MODE_2_0':
        return AacCodingMode.codingMode_2_0;
      case 'CODING_MODE_5_1':
        return AacCodingMode.codingMode_5_1;
    }
    throw Exception('$this is not known in enum AacCodingMode');
  }
}

/// Aac Input Type
enum AacInputType {
  broadcasterMixedAd,
  normal,
}

extension on AacInputType {
  String toValue() {
    switch (this) {
      case AacInputType.broadcasterMixedAd:
        return 'BROADCASTER_MIXED_AD';
      case AacInputType.normal:
        return 'NORMAL';
    }
  }
}

extension on String {
  AacInputType toAacInputType() {
    switch (this) {
      case 'BROADCASTER_MIXED_AD':
        return AacInputType.broadcasterMixedAd;
      case 'NORMAL':
        return AacInputType.normal;
    }
    throw Exception('$this is not known in enum AacInputType');
  }
}

/// Aac Profile
enum AacProfile {
  hev1,
  hev2,
  lc,
}

extension on AacProfile {
  String toValue() {
    switch (this) {
      case AacProfile.hev1:
        return 'HEV1';
      case AacProfile.hev2:
        return 'HEV2';
      case AacProfile.lc:
        return 'LC';
    }
  }
}

extension on String {
  AacProfile toAacProfile() {
    switch (this) {
      case 'HEV1':
        return AacProfile.hev1;
      case 'HEV2':
        return AacProfile.hev2;
      case 'LC':
        return AacProfile.lc;
    }
    throw Exception('$this is not known in enum AacProfile');
  }
}

/// Aac Rate Control Mode
enum AacRateControlMode {
  cbr,
  vbr,
}

extension on AacRateControlMode {
  String toValue() {
    switch (this) {
      case AacRateControlMode.cbr:
        return 'CBR';
      case AacRateControlMode.vbr:
        return 'VBR';
    }
  }
}

extension on String {
  AacRateControlMode toAacRateControlMode() {
    switch (this) {
      case 'CBR':
        return AacRateControlMode.cbr;
      case 'VBR':
        return AacRateControlMode.vbr;
    }
    throw Exception('$this is not known in enum AacRateControlMode');
  }
}

/// Aac Raw Format
enum AacRawFormat {
  latmLoas,
  none,
}

extension on AacRawFormat {
  String toValue() {
    switch (this) {
      case AacRawFormat.latmLoas:
        return 'LATM_LOAS';
      case AacRawFormat.none:
        return 'NONE';
    }
  }
}

extension on String {
  AacRawFormat toAacRawFormat() {
    switch (this) {
      case 'LATM_LOAS':
        return AacRawFormat.latmLoas;
      case 'NONE':
        return AacRawFormat.none;
    }
    throw Exception('$this is not known in enum AacRawFormat');
  }
}

/// Aac Settings
class AacSettings {
  /// Average bitrate in bits/second. Valid values depend on rate control mode and
  /// profile.
  final double? bitrate;

  /// Mono, Stereo, or 5.1 channel layout. Valid values depend on rate control
  /// mode and profile. The adReceiverMix setting receives a stereo description
  /// plus control track and emits a mono AAC encode of the description track,
  /// with control data emitted in the PES header as per ETSI TS 101 154 Annex E.
  final AacCodingMode? codingMode;

  /// Set to "broadcasterMixedAd" when input contains pre-mixed main audio + AD
  /// (narration) as a stereo pair.  The Audio Type field (audioType) will be set
  /// to 3, which signals to downstream systems that this stream contains
  /// "broadcaster mixed AD". Note that the input received by the encoder must
  /// contain pre-mixed audio; the encoder does not perform the mixing. The values
  /// in audioTypeControl and audioType (in AudioDescription) are ignored when set
  /// to broadcasterMixedAd.
  ///
  /// Leave set to "normal" when input does not contain pre-mixed audio + AD.
  final AacInputType? inputType;

  /// AAC Profile.
  final AacProfile? profile;

  /// Rate Control Mode.
  final AacRateControlMode? rateControlMode;

  /// Sets LATM / LOAS AAC output for raw containers.
  final AacRawFormat? rawFormat;

  /// Sample rate in Hz. Valid values depend on rate control mode and profile.
  final double? sampleRate;

  /// Use MPEG-2 AAC audio instead of MPEG-4 AAC audio for raw or MPEG-2 Transport
  /// Stream containers.
  final AacSpec? spec;

  /// VBR Quality Level - Only used if rateControlMode is VBR.
  final AacVbrQuality? vbrQuality;

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

  factory AacSettings.fromJson(Map<String, dynamic> json) {
    return AacSettings(
      bitrate: json['bitrate'] as double?,
      codingMode: (json['codingMode'] as String?)?.toAacCodingMode(),
      inputType: (json['inputType'] as String?)?.toAacInputType(),
      profile: (json['profile'] as String?)?.toAacProfile(),
      rateControlMode:
          (json['rateControlMode'] as String?)?.toAacRateControlMode(),
      rawFormat: (json['rawFormat'] as String?)?.toAacRawFormat(),
      sampleRate: json['sampleRate'] as double?,
      spec: (json['spec'] as String?)?.toAacSpec(),
      vbrQuality: (json['vbrQuality'] as String?)?.toAacVbrQuality(),
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final codingMode = this.codingMode;
    final inputType = this.inputType;
    final profile = this.profile;
    final rateControlMode = this.rateControlMode;
    final rawFormat = this.rawFormat;
    final sampleRate = this.sampleRate;
    final spec = this.spec;
    final vbrQuality = this.vbrQuality;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (inputType != null) 'inputType': inputType.toValue(),
      if (profile != null) 'profile': profile.toValue(),
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (rawFormat != null) 'rawFormat': rawFormat.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (spec != null) 'spec': spec.toValue(),
      if (vbrQuality != null) 'vbrQuality': vbrQuality.toValue(),
    };
  }
}

/// Aac Spec
enum AacSpec {
  mpeg2,
  mpeg4,
}

extension on AacSpec {
  String toValue() {
    switch (this) {
      case AacSpec.mpeg2:
        return 'MPEG2';
      case AacSpec.mpeg4:
        return 'MPEG4';
    }
  }
}

extension on String {
  AacSpec toAacSpec() {
    switch (this) {
      case 'MPEG2':
        return AacSpec.mpeg2;
      case 'MPEG4':
        return AacSpec.mpeg4;
    }
    throw Exception('$this is not known in enum AacSpec');
  }
}

/// Aac Vbr Quality
enum AacVbrQuality {
  high,
  low,
  mediumHigh,
  mediumLow,
}

extension on AacVbrQuality {
  String toValue() {
    switch (this) {
      case AacVbrQuality.high:
        return 'HIGH';
      case AacVbrQuality.low:
        return 'LOW';
      case AacVbrQuality.mediumHigh:
        return 'MEDIUM_HIGH';
      case AacVbrQuality.mediumLow:
        return 'MEDIUM_LOW';
    }
  }
}

extension on String {
  AacVbrQuality toAacVbrQuality() {
    switch (this) {
      case 'HIGH':
        return AacVbrQuality.high;
      case 'LOW':
        return AacVbrQuality.low;
      case 'MEDIUM_HIGH':
        return AacVbrQuality.mediumHigh;
      case 'MEDIUM_LOW':
        return AacVbrQuality.mediumLow;
    }
    throw Exception('$this is not known in enum AacVbrQuality');
  }
}

/// Ac3 Bitstream Mode
enum Ac3BitstreamMode {
  commentary,
  completeMain,
  dialogue,
  emergency,
  hearingImpaired,
  musicAndEffects,
  visuallyImpaired,
  voiceOver,
}

extension on Ac3BitstreamMode {
  String toValue() {
    switch (this) {
      case Ac3BitstreamMode.commentary:
        return 'COMMENTARY';
      case Ac3BitstreamMode.completeMain:
        return 'COMPLETE_MAIN';
      case Ac3BitstreamMode.dialogue:
        return 'DIALOGUE';
      case Ac3BitstreamMode.emergency:
        return 'EMERGENCY';
      case Ac3BitstreamMode.hearingImpaired:
        return 'HEARING_IMPAIRED';
      case Ac3BitstreamMode.musicAndEffects:
        return 'MUSIC_AND_EFFECTS';
      case Ac3BitstreamMode.visuallyImpaired:
        return 'VISUALLY_IMPAIRED';
      case Ac3BitstreamMode.voiceOver:
        return 'VOICE_OVER';
    }
  }
}

extension on String {
  Ac3BitstreamMode toAc3BitstreamMode() {
    switch (this) {
      case 'COMMENTARY':
        return Ac3BitstreamMode.commentary;
      case 'COMPLETE_MAIN':
        return Ac3BitstreamMode.completeMain;
      case 'DIALOGUE':
        return Ac3BitstreamMode.dialogue;
      case 'EMERGENCY':
        return Ac3BitstreamMode.emergency;
      case 'HEARING_IMPAIRED':
        return Ac3BitstreamMode.hearingImpaired;
      case 'MUSIC_AND_EFFECTS':
        return Ac3BitstreamMode.musicAndEffects;
      case 'VISUALLY_IMPAIRED':
        return Ac3BitstreamMode.visuallyImpaired;
      case 'VOICE_OVER':
        return Ac3BitstreamMode.voiceOver;
    }
    throw Exception('$this is not known in enum Ac3BitstreamMode');
  }
}

/// Ac3 Coding Mode
enum Ac3CodingMode {
  codingMode_1_0,
  codingMode_1_1,
  codingMode_2_0,
  codingMode_3_2Lfe,
}

extension on Ac3CodingMode {
  String toValue() {
    switch (this) {
      case Ac3CodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case Ac3CodingMode.codingMode_1_1:
        return 'CODING_MODE_1_1';
      case Ac3CodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
      case Ac3CodingMode.codingMode_3_2Lfe:
        return 'CODING_MODE_3_2_LFE';
    }
  }
}

extension on String {
  Ac3CodingMode toAc3CodingMode() {
    switch (this) {
      case 'CODING_MODE_1_0':
        return Ac3CodingMode.codingMode_1_0;
      case 'CODING_MODE_1_1':
        return Ac3CodingMode.codingMode_1_1;
      case 'CODING_MODE_2_0':
        return Ac3CodingMode.codingMode_2_0;
      case 'CODING_MODE_3_2_LFE':
        return Ac3CodingMode.codingMode_3_2Lfe;
    }
    throw Exception('$this is not known in enum Ac3CodingMode');
  }
}

/// Ac3 Drc Profile
enum Ac3DrcProfile {
  filmStandard,
  none,
}

extension on Ac3DrcProfile {
  String toValue() {
    switch (this) {
      case Ac3DrcProfile.filmStandard:
        return 'FILM_STANDARD';
      case Ac3DrcProfile.none:
        return 'NONE';
    }
  }
}

extension on String {
  Ac3DrcProfile toAc3DrcProfile() {
    switch (this) {
      case 'FILM_STANDARD':
        return Ac3DrcProfile.filmStandard;
      case 'NONE':
        return Ac3DrcProfile.none;
    }
    throw Exception('$this is not known in enum Ac3DrcProfile');
  }
}

/// Ac3 Lfe Filter
enum Ac3LfeFilter {
  disabled,
  enabled,
}

extension on Ac3LfeFilter {
  String toValue() {
    switch (this) {
      case Ac3LfeFilter.disabled:
        return 'DISABLED';
      case Ac3LfeFilter.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Ac3LfeFilter toAc3LfeFilter() {
    switch (this) {
      case 'DISABLED':
        return Ac3LfeFilter.disabled;
      case 'ENABLED':
        return Ac3LfeFilter.enabled;
    }
    throw Exception('$this is not known in enum Ac3LfeFilter');
  }
}

/// Ac3 Metadata Control
enum Ac3MetadataControl {
  followInput,
  useConfigured,
}

extension on Ac3MetadataControl {
  String toValue() {
    switch (this) {
      case Ac3MetadataControl.followInput:
        return 'FOLLOW_INPUT';
      case Ac3MetadataControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  Ac3MetadataControl toAc3MetadataControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return Ac3MetadataControl.followInput;
      case 'USE_CONFIGURED':
        return Ac3MetadataControl.useConfigured;
    }
    throw Exception('$this is not known in enum Ac3MetadataControl');
  }
}

/// Ac3 Settings
class Ac3Settings {
  /// Average bitrate in bits/second. Valid bitrates depend on the coding mode.
  final double? bitrate;

  /// Specifies the bitstream mode (bsmod) for the emitted AC-3 stream. See ATSC
  /// A/52-2012 for background on these values.
  final Ac3BitstreamMode? bitstreamMode;

  /// Dolby Digital coding mode. Determines number of channels.
  final Ac3CodingMode? codingMode;

  /// Sets the dialnorm for the output. If excluded and input audio is Dolby
  /// Digital, dialnorm will be passed through.
  final int? dialnorm;

  /// If set to filmStandard, adds dynamic range compression signaling to the
  /// output bitstream as defined in the Dolby Digital specification.
  final Ac3DrcProfile? drcProfile;

  /// When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior
  /// to encoding. Only valid in codingMode32Lfe mode.
  final Ac3LfeFilter? lfeFilter;

  /// When set to "followInput", encoder metadata will be sourced from the DD,
  /// DD+, or DolbyE decoder that supplied this audio data. If audio was not
  /// supplied from one of these streams, then the static metadata settings will
  /// be used.
  final Ac3MetadataControl? metadataControl;

  Ac3Settings({
    this.bitrate,
    this.bitstreamMode,
    this.codingMode,
    this.dialnorm,
    this.drcProfile,
    this.lfeFilter,
    this.metadataControl,
  });

  factory Ac3Settings.fromJson(Map<String, dynamic> json) {
    return Ac3Settings(
      bitrate: json['bitrate'] as double?,
      bitstreamMode: (json['bitstreamMode'] as String?)?.toAc3BitstreamMode(),
      codingMode: (json['codingMode'] as String?)?.toAc3CodingMode(),
      dialnorm: json['dialnorm'] as int?,
      drcProfile: (json['drcProfile'] as String?)?.toAc3DrcProfile(),
      lfeFilter: (json['lfeFilter'] as String?)?.toAc3LfeFilter(),
      metadataControl:
          (json['metadataControl'] as String?)?.toAc3MetadataControl(),
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final bitstreamMode = this.bitstreamMode;
    final codingMode = this.codingMode;
    final dialnorm = this.dialnorm;
    final drcProfile = this.drcProfile;
    final lfeFilter = this.lfeFilter;
    final metadataControl = this.metadataControl;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (bitstreamMode != null) 'bitstreamMode': bitstreamMode.toValue(),
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (dialnorm != null) 'dialnorm': dialnorm,
      if (drcProfile != null) 'drcProfile': drcProfile.toValue(),
      if (lfeFilter != null) 'lfeFilter': lfeFilter.toValue(),
      if (metadataControl != null) 'metadataControl': metadataControl.toValue(),
    };
  }
}

/// Placeholder documentation for AcceptInputDeviceTransferResponse
class AcceptInputDeviceTransferResponse {
  AcceptInputDeviceTransferResponse();

  factory AcceptInputDeviceTransferResponse.fromJson(Map<String, dynamic> _) {
    return AcceptInputDeviceTransferResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Afd Signaling
enum AfdSignaling {
  auto,
  fixed,
  none,
}

extension on AfdSignaling {
  String toValue() {
    switch (this) {
      case AfdSignaling.auto:
        return 'AUTO';
      case AfdSignaling.fixed:
        return 'FIXED';
      case AfdSignaling.none:
        return 'NONE';
    }
  }
}

extension on String {
  AfdSignaling toAfdSignaling() {
    switch (this) {
      case 'AUTO':
        return AfdSignaling.auto;
      case 'FIXED':
        return AfdSignaling.fixed;
      case 'NONE':
        return AfdSignaling.none;
    }
    throw Exception('$this is not known in enum AfdSignaling');
  }
}

/// Ancillary Source Settings
class AncillarySourceSettings {
  /// Specifies the number (1 to 4) of the captions channel you want to extract
  /// from the ancillary captions. If you plan to convert the ancillary captions
  /// to another format, complete this field. If you plan to choose Embedded as
  /// the captions destination in the output (to pass through all the channels in
  /// the ancillary captions), leave this field blank because MediaLive ignores
  /// the field.
  final int? sourceAncillaryChannelNumber;

  AncillarySourceSettings({
    this.sourceAncillaryChannelNumber,
  });

  factory AncillarySourceSettings.fromJson(Map<String, dynamic> json) {
    return AncillarySourceSettings(
      sourceAncillaryChannelNumber:
          json['sourceAncillaryChannelNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceAncillaryChannelNumber = this.sourceAncillaryChannelNumber;
    return {
      if (sourceAncillaryChannelNumber != null)
        'sourceAncillaryChannelNumber': sourceAncillaryChannelNumber,
    };
  }
}

/// Archive Cdn Settings
class ArchiveCdnSettings {
  final ArchiveS3Settings? archiveS3Settings;

  ArchiveCdnSettings({
    this.archiveS3Settings,
  });

  factory ArchiveCdnSettings.fromJson(Map<String, dynamic> json) {
    return ArchiveCdnSettings(
      archiveS3Settings: json['archiveS3Settings'] != null
          ? ArchiveS3Settings.fromJson(
              json['archiveS3Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveS3Settings = this.archiveS3Settings;
    return {
      if (archiveS3Settings != null) 'archiveS3Settings': archiveS3Settings,
    };
  }
}

/// Archive Container Settings
class ArchiveContainerSettings {
  final M2tsSettings? m2tsSettings;
  final RawSettings? rawSettings;

  ArchiveContainerSettings({
    this.m2tsSettings,
    this.rawSettings,
  });

  factory ArchiveContainerSettings.fromJson(Map<String, dynamic> json) {
    return ArchiveContainerSettings(
      m2tsSettings: json['m2tsSettings'] != null
          ? M2tsSettings.fromJson(json['m2tsSettings'] as Map<String, dynamic>)
          : null,
      rawSettings: json['rawSettings'] != null
          ? RawSettings.fromJson(json['rawSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final m2tsSettings = this.m2tsSettings;
    final rawSettings = this.rawSettings;
    return {
      if (m2tsSettings != null) 'm2tsSettings': m2tsSettings,
      if (rawSettings != null) 'rawSettings': rawSettings,
    };
  }
}

/// Archive Group Settings
class ArchiveGroupSettings {
  /// A directory and base filename where archive files should be written.
  final OutputLocationRef destination;

  /// Parameters that control interactions with the CDN.
  final ArchiveCdnSettings? archiveCdnSettings;

  /// Number of seconds to write to archive file before closing and starting a new
  /// one.
  final int? rolloverInterval;

  ArchiveGroupSettings({
    required this.destination,
    this.archiveCdnSettings,
    this.rolloverInterval,
  });

  factory ArchiveGroupSettings.fromJson(Map<String, dynamic> json) {
    return ArchiveGroupSettings(
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
      archiveCdnSettings: json['archiveCdnSettings'] != null
          ? ArchiveCdnSettings.fromJson(
              json['archiveCdnSettings'] as Map<String, dynamic>)
          : null,
      rolloverInterval: json['rolloverInterval'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final archiveCdnSettings = this.archiveCdnSettings;
    final rolloverInterval = this.rolloverInterval;
    return {
      'destination': destination,
      if (archiveCdnSettings != null) 'archiveCdnSettings': archiveCdnSettings,
      if (rolloverInterval != null) 'rolloverInterval': rolloverInterval,
    };
  }
}

/// Archive Output Settings
class ArchiveOutputSettings {
  /// Settings specific to the container type of the file.
  final ArchiveContainerSettings containerSettings;

  /// Output file extension. If excluded, this will be auto-selected from the
  /// container type.
  final String? extension;

  /// String concatenated to the end of the destination filename.  Required for
  /// multiple outputs of the same type.
  final String? nameModifier;

  ArchiveOutputSettings({
    required this.containerSettings,
    this.extension,
    this.nameModifier,
  });

  factory ArchiveOutputSettings.fromJson(Map<String, dynamic> json) {
    return ArchiveOutputSettings(
      containerSettings: ArchiveContainerSettings.fromJson(
          json['containerSettings'] as Map<String, dynamic>),
      extension: json['extension'] as String?,
      nameModifier: json['nameModifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerSettings = this.containerSettings;
    final extension = this.extension;
    final nameModifier = this.nameModifier;
    return {
      'containerSettings': containerSettings,
      if (extension != null) 'extension': extension,
      if (nameModifier != null) 'nameModifier': nameModifier,
    };
  }
}

/// Archive S3 Settings
class ArchiveS3Settings {
  /// Specify the canned ACL to apply to each S3 request. Defaults to none.
  final S3CannedAcl? cannedAcl;

  ArchiveS3Settings({
    this.cannedAcl,
  });

  factory ArchiveS3Settings.fromJson(Map<String, dynamic> json) {
    return ArchiveS3Settings(
      cannedAcl: (json['cannedAcl'] as String?)?.toS3CannedAcl(),
    );
  }

  Map<String, dynamic> toJson() {
    final cannedAcl = this.cannedAcl;
    return {
      if (cannedAcl != null) 'cannedAcl': cannedAcl.toValue(),
    };
  }
}

/// Arib Destination Settings
class AribDestinationSettings {
  AribDestinationSettings();

  factory AribDestinationSettings.fromJson(Map<String, dynamic> _) {
    return AribDestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Arib Source Settings
class AribSourceSettings {
  AribSourceSettings();

  factory AribSourceSettings.fromJson(Map<String, dynamic> _) {
    return AribSourceSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Audio Channel Mapping
class AudioChannelMapping {
  /// Indices and gain values for each input channel that should be remixed into
  /// this output channel.
  final List<InputChannelLevel> inputChannelLevels;

  /// The index of the output channel being produced.
  final int outputChannel;

  AudioChannelMapping({
    required this.inputChannelLevels,
    required this.outputChannel,
  });

  factory AudioChannelMapping.fromJson(Map<String, dynamic> json) {
    return AudioChannelMapping(
      inputChannelLevels: (json['inputChannelLevels'] as List)
          .whereNotNull()
          .map((e) => InputChannelLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputChannel: json['outputChannel'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final inputChannelLevels = this.inputChannelLevels;
    final outputChannel = this.outputChannel;
    return {
      'inputChannelLevels': inputChannelLevels,
      'outputChannel': outputChannel,
    };
  }
}

/// Audio Codec Settings
class AudioCodecSettings {
  final AacSettings? aacSettings;
  final Ac3Settings? ac3Settings;
  final Eac3Settings? eac3Settings;
  final Mp2Settings? mp2Settings;
  final PassThroughSettings? passThroughSettings;
  final WavSettings? wavSettings;

  AudioCodecSettings({
    this.aacSettings,
    this.ac3Settings,
    this.eac3Settings,
    this.mp2Settings,
    this.passThroughSettings,
    this.wavSettings,
  });

  factory AudioCodecSettings.fromJson(Map<String, dynamic> json) {
    return AudioCodecSettings(
      aacSettings: json['aacSettings'] != null
          ? AacSettings.fromJson(json['aacSettings'] as Map<String, dynamic>)
          : null,
      ac3Settings: json['ac3Settings'] != null
          ? Ac3Settings.fromJson(json['ac3Settings'] as Map<String, dynamic>)
          : null,
      eac3Settings: json['eac3Settings'] != null
          ? Eac3Settings.fromJson(json['eac3Settings'] as Map<String, dynamic>)
          : null,
      mp2Settings: json['mp2Settings'] != null
          ? Mp2Settings.fromJson(json['mp2Settings'] as Map<String, dynamic>)
          : null,
      passThroughSettings: json['passThroughSettings'] != null
          ? PassThroughSettings.fromJson(
              json['passThroughSettings'] as Map<String, dynamic>)
          : null,
      wavSettings: json['wavSettings'] != null
          ? WavSettings.fromJson(json['wavSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aacSettings = this.aacSettings;
    final ac3Settings = this.ac3Settings;
    final eac3Settings = this.eac3Settings;
    final mp2Settings = this.mp2Settings;
    final passThroughSettings = this.passThroughSettings;
    final wavSettings = this.wavSettings;
    return {
      if (aacSettings != null) 'aacSettings': aacSettings,
      if (ac3Settings != null) 'ac3Settings': ac3Settings,
      if (eac3Settings != null) 'eac3Settings': eac3Settings,
      if (mp2Settings != null) 'mp2Settings': mp2Settings,
      if (passThroughSettings != null)
        'passThroughSettings': passThroughSettings,
      if (wavSettings != null) 'wavSettings': wavSettings,
    };
  }
}

/// Audio Description
class AudioDescription {
  /// The name of the AudioSelector used as the source for this AudioDescription.
  final String audioSelectorName;

  /// The name of this AudioDescription. Outputs will use this name to uniquely
  /// identify this AudioDescription.  Description names should be unique within
  /// this Live Event.
  final String name;

  /// Advanced audio normalization settings.
  final AudioNormalizationSettings? audioNormalizationSettings;

  /// Applies only if audioTypeControl is useConfigured. The values for audioType
  /// are defined in ISO-IEC 13818-1.
  final AudioType? audioType;

  /// Determines how audio type is determined.
  /// followInput: If the input contains an ISO 639 audioType, then that value is
  /// passed through to the output. If the input contains no ISO 639 audioType,
  /// the value in Audio Type is included in the output.
  /// useConfigured: The value in Audio Type is included in the output.
  /// Note that this field and audioType are both ignored if inputType is
  /// broadcasterMixedAd.
  final AudioDescriptionAudioTypeControl? audioTypeControl;

  /// Audio codec settings.
  final AudioCodecSettings? codecSettings;

  /// RFC 5646 language code representing the language of the audio output track.
  /// Only used if languageControlMode is useConfigured, or there is no ISO 639
  /// language code specified in the input.
  final String? languageCode;

  /// Choosing followInput will cause the ISO 639 language code of the output to
  /// follow the ISO 639 language code of the input. The languageCode will be used
  /// when useConfigured is set, or when followInput is selected but there is no
  /// ISO 639 language code specified by the input.
  final AudioDescriptionLanguageCodeControl? languageCodeControl;

  /// Settings that control how input audio channels are remixed into the output
  /// audio channels.
  final RemixSettings? remixSettings;

  /// Used for MS Smooth and Apple HLS outputs. Indicates the name displayed by
  /// the player (eg. English, or Director Commentary).
  final String? streamName;

  AudioDescription({
    required this.audioSelectorName,
    required this.name,
    this.audioNormalizationSettings,
    this.audioType,
    this.audioTypeControl,
    this.codecSettings,
    this.languageCode,
    this.languageCodeControl,
    this.remixSettings,
    this.streamName,
  });

  factory AudioDescription.fromJson(Map<String, dynamic> json) {
    return AudioDescription(
      audioSelectorName: json['audioSelectorName'] as String,
      name: json['name'] as String,
      audioNormalizationSettings: json['audioNormalizationSettings'] != null
          ? AudioNormalizationSettings.fromJson(
              json['audioNormalizationSettings'] as Map<String, dynamic>)
          : null,
      audioType: (json['audioType'] as String?)?.toAudioType(),
      audioTypeControl: (json['audioTypeControl'] as String?)
          ?.toAudioDescriptionAudioTypeControl(),
      codecSettings: json['codecSettings'] != null
          ? AudioCodecSettings.fromJson(
              json['codecSettings'] as Map<String, dynamic>)
          : null,
      languageCode: json['languageCode'] as String?,
      languageCodeControl: (json['languageCodeControl'] as String?)
          ?.toAudioDescriptionLanguageCodeControl(),
      remixSettings: json['remixSettings'] != null
          ? RemixSettings.fromJson(
              json['remixSettings'] as Map<String, dynamic>)
          : null,
      streamName: json['streamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioSelectorName = this.audioSelectorName;
    final name = this.name;
    final audioNormalizationSettings = this.audioNormalizationSettings;
    final audioType = this.audioType;
    final audioTypeControl = this.audioTypeControl;
    final codecSettings = this.codecSettings;
    final languageCode = this.languageCode;
    final languageCodeControl = this.languageCodeControl;
    final remixSettings = this.remixSettings;
    final streamName = this.streamName;
    return {
      'audioSelectorName': audioSelectorName,
      'name': name,
      if (audioNormalizationSettings != null)
        'audioNormalizationSettings': audioNormalizationSettings,
      if (audioType != null) 'audioType': audioType.toValue(),
      if (audioTypeControl != null)
        'audioTypeControl': audioTypeControl.toValue(),
      if (codecSettings != null) 'codecSettings': codecSettings,
      if (languageCode != null) 'languageCode': languageCode,
      if (languageCodeControl != null)
        'languageCodeControl': languageCodeControl.toValue(),
      if (remixSettings != null) 'remixSettings': remixSettings,
      if (streamName != null) 'streamName': streamName,
    };
  }
}

/// Audio Description Audio Type Control
enum AudioDescriptionAudioTypeControl {
  followInput,
  useConfigured,
}

extension on AudioDescriptionAudioTypeControl {
  String toValue() {
    switch (this) {
      case AudioDescriptionAudioTypeControl.followInput:
        return 'FOLLOW_INPUT';
      case AudioDescriptionAudioTypeControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  AudioDescriptionAudioTypeControl toAudioDescriptionAudioTypeControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return AudioDescriptionAudioTypeControl.followInput;
      case 'USE_CONFIGURED':
        return AudioDescriptionAudioTypeControl.useConfigured;
    }
    throw Exception(
        '$this is not known in enum AudioDescriptionAudioTypeControl');
  }
}

/// Audio Description Language Code Control
enum AudioDescriptionLanguageCodeControl {
  followInput,
  useConfigured,
}

extension on AudioDescriptionLanguageCodeControl {
  String toValue() {
    switch (this) {
      case AudioDescriptionLanguageCodeControl.followInput:
        return 'FOLLOW_INPUT';
      case AudioDescriptionLanguageCodeControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  AudioDescriptionLanguageCodeControl toAudioDescriptionLanguageCodeControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return AudioDescriptionLanguageCodeControl.followInput;
      case 'USE_CONFIGURED':
        return AudioDescriptionLanguageCodeControl.useConfigured;
    }
    throw Exception(
        '$this is not known in enum AudioDescriptionLanguageCodeControl');
  }
}

/// Audio Language Selection
class AudioLanguageSelection {
  /// Selects a specific three-letter language code from within an audio source.
  final String languageCode;

  /// When set to "strict", the transport stream demux strictly identifies audio
  /// streams by their language descriptor. If a PMT update occurs such that an
  /// audio stream matching the initially selected language is no longer present
  /// then mute will be encoded until the language returns. If "loose", then on a
  /// PMT update the demux will choose another audio stream in the program with
  /// the same stream type if it can't find one with the same language.
  final AudioLanguageSelectionPolicy? languageSelectionPolicy;

  AudioLanguageSelection({
    required this.languageCode,
    this.languageSelectionPolicy,
  });

  factory AudioLanguageSelection.fromJson(Map<String, dynamic> json) {
    return AudioLanguageSelection(
      languageCode: json['languageCode'] as String,
      languageSelectionPolicy: (json['languageSelectionPolicy'] as String?)
          ?.toAudioLanguageSelectionPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final languageSelectionPolicy = this.languageSelectionPolicy;
    return {
      'languageCode': languageCode,
      if (languageSelectionPolicy != null)
        'languageSelectionPolicy': languageSelectionPolicy.toValue(),
    };
  }
}

/// Audio Language Selection Policy
enum AudioLanguageSelectionPolicy {
  loose,
  strict,
}

extension on AudioLanguageSelectionPolicy {
  String toValue() {
    switch (this) {
      case AudioLanguageSelectionPolicy.loose:
        return 'LOOSE';
      case AudioLanguageSelectionPolicy.strict:
        return 'STRICT';
    }
  }
}

extension on String {
  AudioLanguageSelectionPolicy toAudioLanguageSelectionPolicy() {
    switch (this) {
      case 'LOOSE':
        return AudioLanguageSelectionPolicy.loose;
      case 'STRICT':
        return AudioLanguageSelectionPolicy.strict;
    }
    throw Exception('$this is not known in enum AudioLanguageSelectionPolicy');
  }
}

/// Audio Normalization Algorithm
enum AudioNormalizationAlgorithm {
  itu_1770_1,
  itu_1770_2,
}

extension on AudioNormalizationAlgorithm {
  String toValue() {
    switch (this) {
      case AudioNormalizationAlgorithm.itu_1770_1:
        return 'ITU_1770_1';
      case AudioNormalizationAlgorithm.itu_1770_2:
        return 'ITU_1770_2';
    }
  }
}

extension on String {
  AudioNormalizationAlgorithm toAudioNormalizationAlgorithm() {
    switch (this) {
      case 'ITU_1770_1':
        return AudioNormalizationAlgorithm.itu_1770_1;
      case 'ITU_1770_2':
        return AudioNormalizationAlgorithm.itu_1770_2;
    }
    throw Exception('$this is not known in enum AudioNormalizationAlgorithm');
  }
}

/// Audio Normalization Algorithm Control
enum AudioNormalizationAlgorithmControl {
  correctAudio,
}

extension on AudioNormalizationAlgorithmControl {
  String toValue() {
    switch (this) {
      case AudioNormalizationAlgorithmControl.correctAudio:
        return 'CORRECT_AUDIO';
    }
  }
}

extension on String {
  AudioNormalizationAlgorithmControl toAudioNormalizationAlgorithmControl() {
    switch (this) {
      case 'CORRECT_AUDIO':
        return AudioNormalizationAlgorithmControl.correctAudio;
    }
    throw Exception(
        '$this is not known in enum AudioNormalizationAlgorithmControl');
  }
}

/// Audio Normalization Settings
class AudioNormalizationSettings {
  /// Audio normalization algorithm to use. itu17701 conforms to the CALM Act
  /// specification, itu17702 conforms to the EBU R-128 specification.
  final AudioNormalizationAlgorithm? algorithm;

  /// When set to correctAudio the output audio is corrected using the chosen
  /// algorithm. If set to measureOnly, the audio will be measured but not
  /// adjusted.
  final AudioNormalizationAlgorithmControl? algorithmControl;

  /// Target LKFS(loudness) to adjust volume to. If no value is entered, a default
  /// value will be used according to the chosen algorithm.  The CALM Act (1770-1)
  /// recommends a target of -24 LKFS. The EBU R-128 specification (1770-2)
  /// recommends a target of -23 LKFS.
  final double? targetLkfs;

  AudioNormalizationSettings({
    this.algorithm,
    this.algorithmControl,
    this.targetLkfs,
  });

  factory AudioNormalizationSettings.fromJson(Map<String, dynamic> json) {
    return AudioNormalizationSettings(
      algorithm:
          (json['algorithm'] as String?)?.toAudioNormalizationAlgorithm(),
      algorithmControl: (json['algorithmControl'] as String?)
          ?.toAudioNormalizationAlgorithmControl(),
      targetLkfs: json['targetLkfs'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final algorithm = this.algorithm;
    final algorithmControl = this.algorithmControl;
    final targetLkfs = this.targetLkfs;
    return {
      if (algorithm != null) 'algorithm': algorithm.toValue(),
      if (algorithmControl != null)
        'algorithmControl': algorithmControl.toValue(),
      if (targetLkfs != null) 'targetLkfs': targetLkfs,
    };
  }
}

/// Audio Only Hls Segment Type
enum AudioOnlyHlsSegmentType {
  aac,
  fmp4,
}

extension on AudioOnlyHlsSegmentType {
  String toValue() {
    switch (this) {
      case AudioOnlyHlsSegmentType.aac:
        return 'AAC';
      case AudioOnlyHlsSegmentType.fmp4:
        return 'FMP4';
    }
  }
}

extension on String {
  AudioOnlyHlsSegmentType toAudioOnlyHlsSegmentType() {
    switch (this) {
      case 'AAC':
        return AudioOnlyHlsSegmentType.aac;
      case 'FMP4':
        return AudioOnlyHlsSegmentType.fmp4;
    }
    throw Exception('$this is not known in enum AudioOnlyHlsSegmentType');
  }
}

/// Audio Only Hls Settings
class AudioOnlyHlsSettings {
  /// Specifies the group to which the audio Rendition belongs.
  final String? audioGroupId;

  /// Optional. Specifies the .jpg or .png image to use as the cover art for an
  /// audio-only output. We recommend a low bit-size file because the image
  /// increases the output audio bandwidth.
  ///
  /// The image is attached to the audio as an ID3 tag, frame type APIC, picture
  /// type 0x10, as per the "ID3 tag version 2.4.0 - Native Frames" standard.
  final InputLocation? audioOnlyImage;

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
  final AudioOnlyHlsTrackType? audioTrackType;

  /// Specifies the segment type.
  final AudioOnlyHlsSegmentType? segmentType;

  AudioOnlyHlsSettings({
    this.audioGroupId,
    this.audioOnlyImage,
    this.audioTrackType,
    this.segmentType,
  });

  factory AudioOnlyHlsSettings.fromJson(Map<String, dynamic> json) {
    return AudioOnlyHlsSettings(
      audioGroupId: json['audioGroupId'] as String?,
      audioOnlyImage: json['audioOnlyImage'] != null
          ? InputLocation.fromJson(
              json['audioOnlyImage'] as Map<String, dynamic>)
          : null,
      audioTrackType:
          (json['audioTrackType'] as String?)?.toAudioOnlyHlsTrackType(),
      segmentType:
          (json['segmentType'] as String?)?.toAudioOnlyHlsSegmentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioGroupId = this.audioGroupId;
    final audioOnlyImage = this.audioOnlyImage;
    final audioTrackType = this.audioTrackType;
    final segmentType = this.segmentType;
    return {
      if (audioGroupId != null) 'audioGroupId': audioGroupId,
      if (audioOnlyImage != null) 'audioOnlyImage': audioOnlyImage,
      if (audioTrackType != null) 'audioTrackType': audioTrackType.toValue(),
      if (segmentType != null) 'segmentType': segmentType.toValue(),
    };
  }
}

/// Audio Only Hls Track Type
enum AudioOnlyHlsTrackType {
  alternateAudioAutoSelect,
  alternateAudioAutoSelectDefault,
  alternateAudioNotAutoSelect,
  audioOnlyVariantStream,
}

extension on AudioOnlyHlsTrackType {
  String toValue() {
    switch (this) {
      case AudioOnlyHlsTrackType.alternateAudioAutoSelect:
        return 'ALTERNATE_AUDIO_AUTO_SELECT';
      case AudioOnlyHlsTrackType.alternateAudioAutoSelectDefault:
        return 'ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT';
      case AudioOnlyHlsTrackType.alternateAudioNotAutoSelect:
        return 'ALTERNATE_AUDIO_NOT_AUTO_SELECT';
      case AudioOnlyHlsTrackType.audioOnlyVariantStream:
        return 'AUDIO_ONLY_VARIANT_STREAM';
    }
  }
}

extension on String {
  AudioOnlyHlsTrackType toAudioOnlyHlsTrackType() {
    switch (this) {
      case 'ALTERNATE_AUDIO_AUTO_SELECT':
        return AudioOnlyHlsTrackType.alternateAudioAutoSelect;
      case 'ALTERNATE_AUDIO_AUTO_SELECT_DEFAULT':
        return AudioOnlyHlsTrackType.alternateAudioAutoSelectDefault;
      case 'ALTERNATE_AUDIO_NOT_AUTO_SELECT':
        return AudioOnlyHlsTrackType.alternateAudioNotAutoSelect;
      case 'AUDIO_ONLY_VARIANT_STREAM':
        return AudioOnlyHlsTrackType.audioOnlyVariantStream;
    }
    throw Exception('$this is not known in enum AudioOnlyHlsTrackType');
  }
}

/// Audio Pid Selection
class AudioPidSelection {
  /// Selects a specific PID from within a source.
  final int pid;

  AudioPidSelection({
    required this.pid,
  });

  factory AudioPidSelection.fromJson(Map<String, dynamic> json) {
    return AudioPidSelection(
      pid: json['pid'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final pid = this.pid;
    return {
      'pid': pid,
    };
  }
}

/// Audio Selector
class AudioSelector {
  /// The name of this AudioSelector. AudioDescriptions will use this name to
  /// uniquely identify this Selector.  Selector names should be unique per input.
  final String name;

  /// The audio selector settings.
  final AudioSelectorSettings? selectorSettings;

  AudioSelector({
    required this.name,
    this.selectorSettings,
  });

  factory AudioSelector.fromJson(Map<String, dynamic> json) {
    return AudioSelector(
      name: json['name'] as String,
      selectorSettings: json['selectorSettings'] != null
          ? AudioSelectorSettings.fromJson(
              json['selectorSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final selectorSettings = this.selectorSettings;
    return {
      'name': name,
      if (selectorSettings != null) 'selectorSettings': selectorSettings,
    };
  }
}

/// Audio Selector Settings
class AudioSelectorSettings {
  final AudioLanguageSelection? audioLanguageSelection;
  final AudioPidSelection? audioPidSelection;
  final AudioTrackSelection? audioTrackSelection;

  AudioSelectorSettings({
    this.audioLanguageSelection,
    this.audioPidSelection,
    this.audioTrackSelection,
  });

  factory AudioSelectorSettings.fromJson(Map<String, dynamic> json) {
    return AudioSelectorSettings(
      audioLanguageSelection: json['audioLanguageSelection'] != null
          ? AudioLanguageSelection.fromJson(
              json['audioLanguageSelection'] as Map<String, dynamic>)
          : null,
      audioPidSelection: json['audioPidSelection'] != null
          ? AudioPidSelection.fromJson(
              json['audioPidSelection'] as Map<String, dynamic>)
          : null,
      audioTrackSelection: json['audioTrackSelection'] != null
          ? AudioTrackSelection.fromJson(
              json['audioTrackSelection'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioLanguageSelection = this.audioLanguageSelection;
    final audioPidSelection = this.audioPidSelection;
    final audioTrackSelection = this.audioTrackSelection;
    return {
      if (audioLanguageSelection != null)
        'audioLanguageSelection': audioLanguageSelection,
      if (audioPidSelection != null) 'audioPidSelection': audioPidSelection,
      if (audioTrackSelection != null)
        'audioTrackSelection': audioTrackSelection,
    };
  }
}

/// Placeholder documentation for AudioSilenceFailoverSettings
class AudioSilenceFailoverSettings {
  /// The name of the audio selector in the input that MediaLive should monitor to
  /// detect silence. Select your most important rendition. If you didn't create
  /// an audio selector in this input, leave blank.
  final String audioSelectorName;

  /// The amount of time (in milliseconds) that the active input must be silent
  /// before automatic input failover occurs. Silence is defined as audio loss or
  /// audio quieter than -50 dBFS.
  final int? audioSilenceThresholdMsec;

  AudioSilenceFailoverSettings({
    required this.audioSelectorName,
    this.audioSilenceThresholdMsec,
  });

  factory AudioSilenceFailoverSettings.fromJson(Map<String, dynamic> json) {
    return AudioSilenceFailoverSettings(
      audioSelectorName: json['audioSelectorName'] as String,
      audioSilenceThresholdMsec: json['audioSilenceThresholdMsec'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioSelectorName = this.audioSelectorName;
    final audioSilenceThresholdMsec = this.audioSilenceThresholdMsec;
    return {
      'audioSelectorName': audioSelectorName,
      if (audioSilenceThresholdMsec != null)
        'audioSilenceThresholdMsec': audioSilenceThresholdMsec,
    };
  }
}

/// Audio Track
class AudioTrack {
  /// 1-based integer value that maps to a specific audio track
  final int track;

  AudioTrack({
    required this.track,
  });

  factory AudioTrack.fromJson(Map<String, dynamic> json) {
    return AudioTrack(
      track: json['track'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final track = this.track;
    return {
      'track': track,
    };
  }
}

/// Audio Track Selection
class AudioTrackSelection {
  /// Selects one or more unique audio tracks from within a source.
  final List<AudioTrack> tracks;

  AudioTrackSelection({
    required this.tracks,
  });

  factory AudioTrackSelection.fromJson(Map<String, dynamic> json) {
    return AudioTrackSelection(
      tracks: (json['tracks'] as List)
          .whereNotNull()
          .map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tracks = this.tracks;
    return {
      'tracks': tracks,
    };
  }
}

/// Audio Type
enum AudioType {
  cleanEffects,
  hearingImpaired,
  undefined,
  visualImpairedCommentary,
}

extension on AudioType {
  String toValue() {
    switch (this) {
      case AudioType.cleanEffects:
        return 'CLEAN_EFFECTS';
      case AudioType.hearingImpaired:
        return 'HEARING_IMPAIRED';
      case AudioType.undefined:
        return 'UNDEFINED';
      case AudioType.visualImpairedCommentary:
        return 'VISUAL_IMPAIRED_COMMENTARY';
    }
  }
}

extension on String {
  AudioType toAudioType() {
    switch (this) {
      case 'CLEAN_EFFECTS':
        return AudioType.cleanEffects;
      case 'HEARING_IMPAIRED':
        return AudioType.hearingImpaired;
      case 'UNDEFINED':
        return AudioType.undefined;
      case 'VISUAL_IMPAIRED_COMMENTARY':
        return AudioType.visualImpairedCommentary;
    }
    throw Exception('$this is not known in enum AudioType');
  }
}

/// Authentication Scheme
enum AuthenticationScheme {
  akamai,
  common,
}

extension on AuthenticationScheme {
  String toValue() {
    switch (this) {
      case AuthenticationScheme.akamai:
        return 'AKAMAI';
      case AuthenticationScheme.common:
        return 'COMMON';
    }
  }
}

extension on String {
  AuthenticationScheme toAuthenticationScheme() {
    switch (this) {
      case 'AKAMAI':
        return AuthenticationScheme.akamai;
      case 'COMMON':
        return AuthenticationScheme.common;
    }
    throw Exception('$this is not known in enum AuthenticationScheme');
  }
}

/// The settings for Automatic Input Failover.
class AutomaticInputFailoverSettings {
  /// The input ID of the secondary input in the automatic input failover pair.
  final String secondaryInputId;

  /// This clear time defines the requirement a recovered input must meet to be
  /// considered healthy. The input must have no failover conditions for this
  /// length of time. Enter a time in milliseconds. This value is particularly
  /// important if the input_preference for the failover pair is set to
  /// PRIMARY_INPUT_PREFERRED, because after this time, MediaLive will switch back
  /// to the primary input.
  final int? errorClearTimeMsec;

  /// A list of failover conditions. If any of these conditions occur, MediaLive
  /// will perform a failover to the other input.
  final List<FailoverCondition>? failoverConditions;

  /// Input preference when deciding which input to make active when a previously
  /// failed input has recovered.
  final InputPreference? inputPreference;

  AutomaticInputFailoverSettings({
    required this.secondaryInputId,
    this.errorClearTimeMsec,
    this.failoverConditions,
    this.inputPreference,
  });

  factory AutomaticInputFailoverSettings.fromJson(Map<String, dynamic> json) {
    return AutomaticInputFailoverSettings(
      secondaryInputId: json['secondaryInputId'] as String,
      errorClearTimeMsec: json['errorClearTimeMsec'] as int?,
      failoverConditions: (json['failoverConditions'] as List?)
          ?.whereNotNull()
          .map((e) => FailoverCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputPreference:
          (json['inputPreference'] as String?)?.toInputPreference(),
    );
  }

  Map<String, dynamic> toJson() {
    final secondaryInputId = this.secondaryInputId;
    final errorClearTimeMsec = this.errorClearTimeMsec;
    final failoverConditions = this.failoverConditions;
    final inputPreference = this.inputPreference;
    return {
      'secondaryInputId': secondaryInputId,
      if (errorClearTimeMsec != null) 'errorClearTimeMsec': errorClearTimeMsec,
      if (failoverConditions != null) 'failoverConditions': failoverConditions,
      if (inputPreference != null) 'inputPreference': inputPreference.toValue(),
    };
  }
}

/// Avail Blanking
class AvailBlanking {
  /// Blanking image to be used. Leave empty for solid black. Only bmp and png
  /// images are supported.
  final InputLocation? availBlankingImage;

  /// When set to enabled, causes video, audio and captions to be blanked when
  /// insertion metadata is added.
  final AvailBlankingState? state;

  AvailBlanking({
    this.availBlankingImage,
    this.state,
  });

  factory AvailBlanking.fromJson(Map<String, dynamic> json) {
    return AvailBlanking(
      availBlankingImage: json['availBlankingImage'] != null
          ? InputLocation.fromJson(
              json['availBlankingImage'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toAvailBlankingState(),
    );
  }

  Map<String, dynamic> toJson() {
    final availBlankingImage = this.availBlankingImage;
    final state = this.state;
    return {
      if (availBlankingImage != null) 'availBlankingImage': availBlankingImage,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Avail Blanking State
enum AvailBlankingState {
  disabled,
  enabled,
}

extension on AvailBlankingState {
  String toValue() {
    switch (this) {
      case AvailBlankingState.disabled:
        return 'DISABLED';
      case AvailBlankingState.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  AvailBlankingState toAvailBlankingState() {
    switch (this) {
      case 'DISABLED':
        return AvailBlankingState.disabled;
      case 'ENABLED':
        return AvailBlankingState.enabled;
    }
    throw Exception('$this is not known in enum AvailBlankingState');
  }
}

/// Avail Configuration
class AvailConfiguration {
  /// Ad avail settings.
  final AvailSettings? availSettings;

  AvailConfiguration({
    this.availSettings,
  });

  factory AvailConfiguration.fromJson(Map<String, dynamic> json) {
    return AvailConfiguration(
      availSettings: json['availSettings'] != null
          ? AvailSettings.fromJson(
              json['availSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final availSettings = this.availSettings;
    return {
      if (availSettings != null) 'availSettings': availSettings,
    };
  }
}

/// Avail Settings
class AvailSettings {
  final Scte35SpliceInsert? scte35SpliceInsert;
  final Scte35TimeSignalApos? scte35TimeSignalApos;

  AvailSettings({
    this.scte35SpliceInsert,
    this.scte35TimeSignalApos,
  });

  factory AvailSettings.fromJson(Map<String, dynamic> json) {
    return AvailSettings(
      scte35SpliceInsert: json['scte35SpliceInsert'] != null
          ? Scte35SpliceInsert.fromJson(
              json['scte35SpliceInsert'] as Map<String, dynamic>)
          : null,
      scte35TimeSignalApos: json['scte35TimeSignalApos'] != null
          ? Scte35TimeSignalApos.fromJson(
              json['scte35TimeSignalApos'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scte35SpliceInsert = this.scte35SpliceInsert;
    final scte35TimeSignalApos = this.scte35TimeSignalApos;
    return {
      if (scte35SpliceInsert != null) 'scte35SpliceInsert': scte35SpliceInsert,
      if (scte35TimeSignalApos != null)
        'scte35TimeSignalApos': scte35TimeSignalApos,
    };
  }
}

/// Placeholder documentation for BatchDeleteResponse
class BatchDeleteResponse {
  /// List of failed operations
  final List<BatchFailedResultModel>? failed;

  /// List of successful operations
  final List<BatchSuccessfulResultModel>? successful;

  BatchDeleteResponse({
    this.failed,
    this.successful,
  });

  factory BatchDeleteResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteResponse(
      failed: (json['failed'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BatchFailedResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      successful: (json['successful'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchSuccessfulResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (successful != null) 'successful': successful,
    };
  }
}

/// Details from a failed operation
class BatchFailedResultModel {
  /// ARN of the resource
  final String? arn;

  /// Error code for the failed operation
  final String? code;

  /// ID of the resource
  final String? id;

  /// Error message for the failed operation
  final String? message;

  BatchFailedResultModel({
    this.arn,
    this.code,
    this.id,
    this.message,
  });

  factory BatchFailedResultModel.fromJson(Map<String, dynamic> json) {
    return BatchFailedResultModel(
      arn: json['arn'] as String?,
      code: json['code'] as String?,
      id: json['id'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final code = this.code;
    final id = this.id;
    final message = this.message;
    return {
      if (arn != null) 'arn': arn,
      if (code != null) 'code': code,
      if (id != null) 'id': id,
      if (message != null) 'message': message,
    };
  }
}

/// A list of schedule actions to create (in a request) or that have been
/// created (in a response).
class BatchScheduleActionCreateRequest {
  /// A list of schedule actions to create.
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionCreateRequest({
    required this.scheduleActions,
  });

  factory BatchScheduleActionCreateRequest.fromJson(Map<String, dynamic> json) {
    return BatchScheduleActionCreateRequest(
      scheduleActions: (json['scheduleActions'] as List)
          .whereNotNull()
          .map((e) => ScheduleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleActions = this.scheduleActions;
    return {
      'scheduleActions': scheduleActions,
    };
  }
}

/// List of actions that have been created in the schedule.
class BatchScheduleActionCreateResult {
  /// List of actions that have been created in the schedule.
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionCreateResult({
    required this.scheduleActions,
  });

  factory BatchScheduleActionCreateResult.fromJson(Map<String, dynamic> json) {
    return BatchScheduleActionCreateResult(
      scheduleActions: (json['scheduleActions'] as List)
          .whereNotNull()
          .map((e) => ScheduleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleActions = this.scheduleActions;
    return {
      'scheduleActions': scheduleActions,
    };
  }
}

/// A list of schedule actions to delete.
class BatchScheduleActionDeleteRequest {
  /// A list of schedule actions to delete.
  final List<String> actionNames;

  BatchScheduleActionDeleteRequest({
    required this.actionNames,
  });

  factory BatchScheduleActionDeleteRequest.fromJson(Map<String, dynamic> json) {
    return BatchScheduleActionDeleteRequest(
      actionNames: (json['actionNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final actionNames = this.actionNames;
    return {
      'actionNames': actionNames,
    };
  }
}

/// List of actions that have been deleted from the schedule.
class BatchScheduleActionDeleteResult {
  /// List of actions that have been deleted from the schedule.
  final List<ScheduleAction> scheduleActions;

  BatchScheduleActionDeleteResult({
    required this.scheduleActions,
  });

  factory BatchScheduleActionDeleteResult.fromJson(Map<String, dynamic> json) {
    return BatchScheduleActionDeleteResult(
      scheduleActions: (json['scheduleActions'] as List)
          .whereNotNull()
          .map((e) => ScheduleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scheduleActions = this.scheduleActions;
    return {
      'scheduleActions': scheduleActions,
    };
  }
}

/// Placeholder documentation for BatchStartResponse
class BatchStartResponse {
  /// List of failed operations
  final List<BatchFailedResultModel>? failed;

  /// List of successful operations
  final List<BatchSuccessfulResultModel>? successful;

  BatchStartResponse({
    this.failed,
    this.successful,
  });

  factory BatchStartResponse.fromJson(Map<String, dynamic> json) {
    return BatchStartResponse(
      failed: (json['failed'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BatchFailedResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      successful: (json['successful'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchSuccessfulResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (successful != null) 'successful': successful,
    };
  }
}

/// Placeholder documentation for BatchStopResponse
class BatchStopResponse {
  /// List of failed operations
  final List<BatchFailedResultModel>? failed;

  /// List of successful operations
  final List<BatchSuccessfulResultModel>? successful;

  BatchStopResponse({
    this.failed,
    this.successful,
  });

  factory BatchStopResponse.fromJson(Map<String, dynamic> json) {
    return BatchStopResponse(
      failed: (json['failed'] as List?)
          ?.whereNotNull()
          .map(
              (e) => BatchFailedResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      successful: (json['successful'] as List?)
          ?.whereNotNull()
          .map((e) =>
              BatchSuccessfulResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (successful != null) 'successful': successful,
    };
  }
}

/// Details from a successful operation
class BatchSuccessfulResultModel {
  /// ARN of the resource
  final String? arn;

  /// ID of the resource
  final String? id;

  /// Current state of the resource
  final String? state;

  BatchSuccessfulResultModel({
    this.arn,
    this.id,
    this.state,
  });

  factory BatchSuccessfulResultModel.fromJson(Map<String, dynamic> json) {
    return BatchSuccessfulResultModel(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final state = this.state;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (state != null) 'state': state,
    };
  }
}

/// Placeholder documentation for BatchUpdateScheduleResponse
class BatchUpdateScheduleResponse {
  /// Schedule actions created in the schedule.
  final BatchScheduleActionCreateResult? creates;

  /// Schedule actions deleted from the schedule.
  final BatchScheduleActionDeleteResult? deletes;

  BatchUpdateScheduleResponse({
    this.creates,
    this.deletes,
  });

  factory BatchUpdateScheduleResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateScheduleResponse(
      creates: json['creates'] != null
          ? BatchScheduleActionCreateResult.fromJson(
              json['creates'] as Map<String, dynamic>)
          : null,
      deletes: json['deletes'] != null
          ? BatchScheduleActionDeleteResult.fromJson(
              json['deletes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creates = this.creates;
    final deletes = this.deletes;
    return {
      if (creates != null) 'creates': creates,
      if (deletes != null) 'deletes': deletes,
    };
  }
}

/// Blackout Slate
class BlackoutSlate {
  /// Blackout slate image to be used. Leave empty for solid black. Only bmp and
  /// png images are supported.
  final InputLocation? blackoutSlateImage;

  /// Setting to enabled causes the encoder to blackout the video, audio, and
  /// captions, and raise the "Network Blackout Image" slate when an SCTE104/35
  /// Network End Segmentation Descriptor is encountered. The blackout will be
  /// lifted when the Network Start Segmentation Descriptor is encountered. The
  /// Network End and Network Start descriptors must contain a network ID that
  /// matches the value entered in "Network ID".
  final BlackoutSlateNetworkEndBlackout? networkEndBlackout;

  /// Path to local file to use as Network End Blackout image. Image will be
  /// scaled to fill the entire output raster.
  final InputLocation? networkEndBlackoutImage;

  /// Provides Network ID that matches EIDR ID format (e.g.,
  /// "10.XXXX/XXXX-XXXX-XXXX-XXXX-XXXX-C").
  final String? networkId;

  /// When set to enabled, causes video, audio and captions to be blanked when
  /// indicated by program metadata.
  final BlackoutSlateState? state;

  BlackoutSlate({
    this.blackoutSlateImage,
    this.networkEndBlackout,
    this.networkEndBlackoutImage,
    this.networkId,
    this.state,
  });

  factory BlackoutSlate.fromJson(Map<String, dynamic> json) {
    return BlackoutSlate(
      blackoutSlateImage: json['blackoutSlateImage'] != null
          ? InputLocation.fromJson(
              json['blackoutSlateImage'] as Map<String, dynamic>)
          : null,
      networkEndBlackout: (json['networkEndBlackout'] as String?)
          ?.toBlackoutSlateNetworkEndBlackout(),
      networkEndBlackoutImage: json['networkEndBlackoutImage'] != null
          ? InputLocation.fromJson(
              json['networkEndBlackoutImage'] as Map<String, dynamic>)
          : null,
      networkId: json['networkId'] as String?,
      state: (json['state'] as String?)?.toBlackoutSlateState(),
    );
  }

  Map<String, dynamic> toJson() {
    final blackoutSlateImage = this.blackoutSlateImage;
    final networkEndBlackout = this.networkEndBlackout;
    final networkEndBlackoutImage = this.networkEndBlackoutImage;
    final networkId = this.networkId;
    final state = this.state;
    return {
      if (blackoutSlateImage != null) 'blackoutSlateImage': blackoutSlateImage,
      if (networkEndBlackout != null)
        'networkEndBlackout': networkEndBlackout.toValue(),
      if (networkEndBlackoutImage != null)
        'networkEndBlackoutImage': networkEndBlackoutImage,
      if (networkId != null) 'networkId': networkId,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Blackout Slate Network End Blackout
enum BlackoutSlateNetworkEndBlackout {
  disabled,
  enabled,
}

extension on BlackoutSlateNetworkEndBlackout {
  String toValue() {
    switch (this) {
      case BlackoutSlateNetworkEndBlackout.disabled:
        return 'DISABLED';
      case BlackoutSlateNetworkEndBlackout.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  BlackoutSlateNetworkEndBlackout toBlackoutSlateNetworkEndBlackout() {
    switch (this) {
      case 'DISABLED':
        return BlackoutSlateNetworkEndBlackout.disabled;
      case 'ENABLED':
        return BlackoutSlateNetworkEndBlackout.enabled;
    }
    throw Exception(
        '$this is not known in enum BlackoutSlateNetworkEndBlackout');
  }
}

/// Blackout Slate State
enum BlackoutSlateState {
  disabled,
  enabled,
}

extension on BlackoutSlateState {
  String toValue() {
    switch (this) {
      case BlackoutSlateState.disabled:
        return 'DISABLED';
      case BlackoutSlateState.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  BlackoutSlateState toBlackoutSlateState() {
    switch (this) {
      case 'DISABLED':
        return BlackoutSlateState.disabled;
      case 'ENABLED':
        return BlackoutSlateState.enabled;
    }
    throw Exception('$this is not known in enum BlackoutSlateState');
  }
}

/// Burn In Alignment
enum BurnInAlignment {
  centered,
  left,
  smart,
}

extension on BurnInAlignment {
  String toValue() {
    switch (this) {
      case BurnInAlignment.centered:
        return 'CENTERED';
      case BurnInAlignment.left:
        return 'LEFT';
      case BurnInAlignment.smart:
        return 'SMART';
    }
  }
}

extension on String {
  BurnInAlignment toBurnInAlignment() {
    switch (this) {
      case 'CENTERED':
        return BurnInAlignment.centered;
      case 'LEFT':
        return BurnInAlignment.left;
      case 'SMART':
        return BurnInAlignment.smart;
    }
    throw Exception('$this is not known in enum BurnInAlignment');
  }
}

/// Burn In Background Color
enum BurnInBackgroundColor {
  black,
  none,
  white,
}

extension on BurnInBackgroundColor {
  String toValue() {
    switch (this) {
      case BurnInBackgroundColor.black:
        return 'BLACK';
      case BurnInBackgroundColor.none:
        return 'NONE';
      case BurnInBackgroundColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  BurnInBackgroundColor toBurnInBackgroundColor() {
    switch (this) {
      case 'BLACK':
        return BurnInBackgroundColor.black;
      case 'NONE':
        return BurnInBackgroundColor.none;
      case 'WHITE':
        return BurnInBackgroundColor.white;
    }
    throw Exception('$this is not known in enum BurnInBackgroundColor');
  }
}

/// Burn In Destination Settings
class BurnInDestinationSettings {
  /// If no explicit xPosition or yPosition is provided, setting alignment to
  /// centered will place the captions at the bottom center of the output.
  /// Similarly, setting a left alignment will align captions to the bottom left
  /// of the output. If x and y positions are given in conjunction with the
  /// alignment parameter, the font will be justified (either left or centered)
  /// relative to those coordinates. Selecting "smart" justification will
  /// left-justify live subtitles and center-justify pre-recorded subtitles.  All
  /// burn-in and DVB-Sub font settings must match.
  final BurnInAlignment? alignment;

  /// Specifies the color of the rectangle behind the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  final BurnInBackgroundColor? backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter out is equivalent to setting it to 0
  /// (transparent).  All burn-in and DVB-Sub font settings must match.
  final int? backgroundOpacity;

  /// External font file used for caption burn-in. File extension must be 'ttf' or
  /// 'tte'.  Although the user can select output fonts for many different types
  /// of input captions,  embedded, STL and teletext sources use a strict grid
  /// system. Using external fonts with these caption sources could cause
  /// unexpected display of proportional fonts.  All burn-in and DVB-Sub font
  /// settings must match.
  final InputLocation? font;

  /// Specifies the color of the burned-in captions.  This option is not valid for
  /// source captions that are STL, 608/embedded or teletext.  These source
  /// settings are already pre-defined by the caption stream.  All burn-in and
  /// DVB-Sub font settings must match.
  final BurnInFontColor? fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.  All burn-in and DVB-Sub font settings must match.
  final int? fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.  All burn-in and
  /// DVB-Sub font settings must match.
  final int? fontResolution;

  /// When set to 'auto' fontSize will scale depending on the size of the output.
  /// Giving a positive integer will specify the exact font size in points.  All
  /// burn-in and DVB-Sub font settings must match.
  final String? fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  final BurnInOutlineColor? outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final int? outlineSize;

  /// Specifies the color of the shadow cast by the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  final BurnInShadowColor? shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter out is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text.  All burn-in and DVB-Sub font settings must match.
  final int? shadowYOffset;

  /// Controls whether a fixed grid size will be used to generate the output
  /// subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in
  /// outputs.
  final BurnInTeletextGridControl? teletextGridControl;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit xPosition is provided,
  /// the horizontal caption position will be determined by the alignment
  /// parameter.  All burn-in and DVB-Sub font settings must match.
  final int? xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit yPosition is provided, the
  /// caption will be positioned towards the bottom of the output.  All burn-in
  /// and DVB-Sub font settings must match.
  final int? yPosition;

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

  factory BurnInDestinationSettings.fromJson(Map<String, dynamic> json) {
    return BurnInDestinationSettings(
      alignment: (json['alignment'] as String?)?.toBurnInAlignment(),
      backgroundColor:
          (json['backgroundColor'] as String?)?.toBurnInBackgroundColor(),
      backgroundOpacity: json['backgroundOpacity'] as int?,
      font: json['font'] != null
          ? InputLocation.fromJson(json['font'] as Map<String, dynamic>)
          : null,
      fontColor: (json['fontColor'] as String?)?.toBurnInFontColor(),
      fontOpacity: json['fontOpacity'] as int?,
      fontResolution: json['fontResolution'] as int?,
      fontSize: json['fontSize'] as String?,
      outlineColor: (json['outlineColor'] as String?)?.toBurnInOutlineColor(),
      outlineSize: json['outlineSize'] as int?,
      shadowColor: (json['shadowColor'] as String?)?.toBurnInShadowColor(),
      shadowOpacity: json['shadowOpacity'] as int?,
      shadowXOffset: json['shadowXOffset'] as int?,
      shadowYOffset: json['shadowYOffset'] as int?,
      teletextGridControl: (json['teletextGridControl'] as String?)
          ?.toBurnInTeletextGridControl(),
      xPosition: json['xPosition'] as int?,
      yPosition: json['yPosition'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alignment = this.alignment;
    final backgroundColor = this.backgroundColor;
    final backgroundOpacity = this.backgroundOpacity;
    final font = this.font;
    final fontColor = this.fontColor;
    final fontOpacity = this.fontOpacity;
    final fontResolution = this.fontResolution;
    final fontSize = this.fontSize;
    final outlineColor = this.outlineColor;
    final outlineSize = this.outlineSize;
    final shadowColor = this.shadowColor;
    final shadowOpacity = this.shadowOpacity;
    final shadowXOffset = this.shadowXOffset;
    final shadowYOffset = this.shadowYOffset;
    final teletextGridControl = this.teletextGridControl;
    final xPosition = this.xPosition;
    final yPosition = this.yPosition;
    return {
      if (alignment != null) 'alignment': alignment.toValue(),
      if (backgroundColor != null) 'backgroundColor': backgroundColor.toValue(),
      if (backgroundOpacity != null) 'backgroundOpacity': backgroundOpacity,
      if (font != null) 'font': font,
      if (fontColor != null) 'fontColor': fontColor.toValue(),
      if (fontOpacity != null) 'fontOpacity': fontOpacity,
      if (fontResolution != null) 'fontResolution': fontResolution,
      if (fontSize != null) 'fontSize': fontSize,
      if (outlineColor != null) 'outlineColor': outlineColor.toValue(),
      if (outlineSize != null) 'outlineSize': outlineSize,
      if (shadowColor != null) 'shadowColor': shadowColor.toValue(),
      if (shadowOpacity != null) 'shadowOpacity': shadowOpacity,
      if (shadowXOffset != null) 'shadowXOffset': shadowXOffset,
      if (shadowYOffset != null) 'shadowYOffset': shadowYOffset,
      if (teletextGridControl != null)
        'teletextGridControl': teletextGridControl.toValue(),
      if (xPosition != null) 'xPosition': xPosition,
      if (yPosition != null) 'yPosition': yPosition,
    };
  }
}

/// Burn In Font Color
enum BurnInFontColor {
  black,
  blue,
  green,
  red,
  white,
  yellow,
}

extension on BurnInFontColor {
  String toValue() {
    switch (this) {
      case BurnInFontColor.black:
        return 'BLACK';
      case BurnInFontColor.blue:
        return 'BLUE';
      case BurnInFontColor.green:
        return 'GREEN';
      case BurnInFontColor.red:
        return 'RED';
      case BurnInFontColor.white:
        return 'WHITE';
      case BurnInFontColor.yellow:
        return 'YELLOW';
    }
  }
}

extension on String {
  BurnInFontColor toBurnInFontColor() {
    switch (this) {
      case 'BLACK':
        return BurnInFontColor.black;
      case 'BLUE':
        return BurnInFontColor.blue;
      case 'GREEN':
        return BurnInFontColor.green;
      case 'RED':
        return BurnInFontColor.red;
      case 'WHITE':
        return BurnInFontColor.white;
      case 'YELLOW':
        return BurnInFontColor.yellow;
    }
    throw Exception('$this is not known in enum BurnInFontColor');
  }
}

/// Burn In Outline Color
enum BurnInOutlineColor {
  black,
  blue,
  green,
  red,
  white,
  yellow,
}

extension on BurnInOutlineColor {
  String toValue() {
    switch (this) {
      case BurnInOutlineColor.black:
        return 'BLACK';
      case BurnInOutlineColor.blue:
        return 'BLUE';
      case BurnInOutlineColor.green:
        return 'GREEN';
      case BurnInOutlineColor.red:
        return 'RED';
      case BurnInOutlineColor.white:
        return 'WHITE';
      case BurnInOutlineColor.yellow:
        return 'YELLOW';
    }
  }
}

extension on String {
  BurnInOutlineColor toBurnInOutlineColor() {
    switch (this) {
      case 'BLACK':
        return BurnInOutlineColor.black;
      case 'BLUE':
        return BurnInOutlineColor.blue;
      case 'GREEN':
        return BurnInOutlineColor.green;
      case 'RED':
        return BurnInOutlineColor.red;
      case 'WHITE':
        return BurnInOutlineColor.white;
      case 'YELLOW':
        return BurnInOutlineColor.yellow;
    }
    throw Exception('$this is not known in enum BurnInOutlineColor');
  }
}

/// Burn In Shadow Color
enum BurnInShadowColor {
  black,
  none,
  white,
}

extension on BurnInShadowColor {
  String toValue() {
    switch (this) {
      case BurnInShadowColor.black:
        return 'BLACK';
      case BurnInShadowColor.none:
        return 'NONE';
      case BurnInShadowColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  BurnInShadowColor toBurnInShadowColor() {
    switch (this) {
      case 'BLACK':
        return BurnInShadowColor.black;
      case 'NONE':
        return BurnInShadowColor.none;
      case 'WHITE':
        return BurnInShadowColor.white;
    }
    throw Exception('$this is not known in enum BurnInShadowColor');
  }
}

/// Burn In Teletext Grid Control
enum BurnInTeletextGridControl {
  fixed,
  scaled,
}

extension on BurnInTeletextGridControl {
  String toValue() {
    switch (this) {
      case BurnInTeletextGridControl.fixed:
        return 'FIXED';
      case BurnInTeletextGridControl.scaled:
        return 'SCALED';
    }
  }
}

extension on String {
  BurnInTeletextGridControl toBurnInTeletextGridControl() {
    switch (this) {
      case 'FIXED':
        return BurnInTeletextGridControl.fixed;
      case 'SCALED':
        return BurnInTeletextGridControl.scaled;
    }
    throw Exception('$this is not known in enum BurnInTeletextGridControl');
  }
}

/// Placeholder documentation for CancelInputDeviceTransferResponse
class CancelInputDeviceTransferResponse {
  CancelInputDeviceTransferResponse();

  factory CancelInputDeviceTransferResponse.fromJson(Map<String, dynamic> _) {
    return CancelInputDeviceTransferResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Caption Description
class CaptionDescription {
  /// Specifies which input caption selector to use as a caption source when
  /// generating output captions. This field should match a captionSelector name.
  final String captionSelectorName;

  /// Name of the caption description.  Used to associate a caption description
  /// with an output.  Names must be unique within an event.
  final String name;

  /// Additional settings for captions destination that depend on the destination
  /// type.
  final CaptionDestinationSettings? destinationSettings;

  /// ISO 639-2 three-digit code: http://www.loc.gov/standards/iso639-2/
  final String? languageCode;

  /// Human readable information to indicate captions available for players (eg.
  /// English, or Spanish).
  final String? languageDescription;

  CaptionDescription({
    required this.captionSelectorName,
    required this.name,
    this.destinationSettings,
    this.languageCode,
    this.languageDescription,
  });

  factory CaptionDescription.fromJson(Map<String, dynamic> json) {
    return CaptionDescription(
      captionSelectorName: json['captionSelectorName'] as String,
      name: json['name'] as String,
      destinationSettings: json['destinationSettings'] != null
          ? CaptionDestinationSettings.fromJson(
              json['destinationSettings'] as Map<String, dynamic>)
          : null,
      languageCode: json['languageCode'] as String?,
      languageDescription: json['languageDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final captionSelectorName = this.captionSelectorName;
    final name = this.name;
    final destinationSettings = this.destinationSettings;
    final languageCode = this.languageCode;
    final languageDescription = this.languageDescription;
    return {
      'captionSelectorName': captionSelectorName,
      'name': name,
      if (destinationSettings != null)
        'destinationSettings': destinationSettings,
      if (languageCode != null) 'languageCode': languageCode,
      if (languageDescription != null)
        'languageDescription': languageDescription,
    };
  }
}

/// Caption Destination Settings
class CaptionDestinationSettings {
  final AribDestinationSettings? aribDestinationSettings;
  final BurnInDestinationSettings? burnInDestinationSettings;
  final DvbSubDestinationSettings? dvbSubDestinationSettings;
  final EbuTtDDestinationSettings? ebuTtDDestinationSettings;
  final EmbeddedDestinationSettings? embeddedDestinationSettings;
  final EmbeddedPlusScte20DestinationSettings?
      embeddedPlusScte20DestinationSettings;
  final RtmpCaptionInfoDestinationSettings? rtmpCaptionInfoDestinationSettings;
  final Scte20PlusEmbeddedDestinationSettings?
      scte20PlusEmbeddedDestinationSettings;
  final Scte27DestinationSettings? scte27DestinationSettings;
  final SmpteTtDestinationSettings? smpteTtDestinationSettings;
  final TeletextDestinationSettings? teletextDestinationSettings;
  final TtmlDestinationSettings? ttmlDestinationSettings;
  final WebvttDestinationSettings? webvttDestinationSettings;

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

  factory CaptionDestinationSettings.fromJson(Map<String, dynamic> json) {
    return CaptionDestinationSettings(
      aribDestinationSettings: json['aribDestinationSettings'] != null
          ? AribDestinationSettings.fromJson(
              json['aribDestinationSettings'] as Map<String, dynamic>)
          : null,
      burnInDestinationSettings: json['burnInDestinationSettings'] != null
          ? BurnInDestinationSettings.fromJson(
              json['burnInDestinationSettings'] as Map<String, dynamic>)
          : null,
      dvbSubDestinationSettings: json['dvbSubDestinationSettings'] != null
          ? DvbSubDestinationSettings.fromJson(
              json['dvbSubDestinationSettings'] as Map<String, dynamic>)
          : null,
      ebuTtDDestinationSettings: json['ebuTtDDestinationSettings'] != null
          ? EbuTtDDestinationSettings.fromJson(
              json['ebuTtDDestinationSettings'] as Map<String, dynamic>)
          : null,
      embeddedDestinationSettings: json['embeddedDestinationSettings'] != null
          ? EmbeddedDestinationSettings.fromJson(
              json['embeddedDestinationSettings'] as Map<String, dynamic>)
          : null,
      embeddedPlusScte20DestinationSettings:
          json['embeddedPlusScte20DestinationSettings'] != null
              ? EmbeddedPlusScte20DestinationSettings.fromJson(
                  json['embeddedPlusScte20DestinationSettings']
                      as Map<String, dynamic>)
              : null,
      rtmpCaptionInfoDestinationSettings:
          json['rtmpCaptionInfoDestinationSettings'] != null
              ? RtmpCaptionInfoDestinationSettings.fromJson(
                  json['rtmpCaptionInfoDestinationSettings']
                      as Map<String, dynamic>)
              : null,
      scte20PlusEmbeddedDestinationSettings:
          json['scte20PlusEmbeddedDestinationSettings'] != null
              ? Scte20PlusEmbeddedDestinationSettings.fromJson(
                  json['scte20PlusEmbeddedDestinationSettings']
                      as Map<String, dynamic>)
              : null,
      scte27DestinationSettings: json['scte27DestinationSettings'] != null
          ? Scte27DestinationSettings.fromJson(
              json['scte27DestinationSettings'] as Map<String, dynamic>)
          : null,
      smpteTtDestinationSettings: json['smpteTtDestinationSettings'] != null
          ? SmpteTtDestinationSettings.fromJson(
              json['smpteTtDestinationSettings'] as Map<String, dynamic>)
          : null,
      teletextDestinationSettings: json['teletextDestinationSettings'] != null
          ? TeletextDestinationSettings.fromJson(
              json['teletextDestinationSettings'] as Map<String, dynamic>)
          : null,
      ttmlDestinationSettings: json['ttmlDestinationSettings'] != null
          ? TtmlDestinationSettings.fromJson(
              json['ttmlDestinationSettings'] as Map<String, dynamic>)
          : null,
      webvttDestinationSettings: json['webvttDestinationSettings'] != null
          ? WebvttDestinationSettings.fromJson(
              json['webvttDestinationSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aribDestinationSettings = this.aribDestinationSettings;
    final burnInDestinationSettings = this.burnInDestinationSettings;
    final dvbSubDestinationSettings = this.dvbSubDestinationSettings;
    final ebuTtDDestinationSettings = this.ebuTtDDestinationSettings;
    final embeddedDestinationSettings = this.embeddedDestinationSettings;
    final embeddedPlusScte20DestinationSettings =
        this.embeddedPlusScte20DestinationSettings;
    final rtmpCaptionInfoDestinationSettings =
        this.rtmpCaptionInfoDestinationSettings;
    final scte20PlusEmbeddedDestinationSettings =
        this.scte20PlusEmbeddedDestinationSettings;
    final scte27DestinationSettings = this.scte27DestinationSettings;
    final smpteTtDestinationSettings = this.smpteTtDestinationSettings;
    final teletextDestinationSettings = this.teletextDestinationSettings;
    final ttmlDestinationSettings = this.ttmlDestinationSettings;
    final webvttDestinationSettings = this.webvttDestinationSettings;
    return {
      if (aribDestinationSettings != null)
        'aribDestinationSettings': aribDestinationSettings,
      if (burnInDestinationSettings != null)
        'burnInDestinationSettings': burnInDestinationSettings,
      if (dvbSubDestinationSettings != null)
        'dvbSubDestinationSettings': dvbSubDestinationSettings,
      if (ebuTtDDestinationSettings != null)
        'ebuTtDDestinationSettings': ebuTtDDestinationSettings,
      if (embeddedDestinationSettings != null)
        'embeddedDestinationSettings': embeddedDestinationSettings,
      if (embeddedPlusScte20DestinationSettings != null)
        'embeddedPlusScte20DestinationSettings':
            embeddedPlusScte20DestinationSettings,
      if (rtmpCaptionInfoDestinationSettings != null)
        'rtmpCaptionInfoDestinationSettings':
            rtmpCaptionInfoDestinationSettings,
      if (scte20PlusEmbeddedDestinationSettings != null)
        'scte20PlusEmbeddedDestinationSettings':
            scte20PlusEmbeddedDestinationSettings,
      if (scte27DestinationSettings != null)
        'scte27DestinationSettings': scte27DestinationSettings,
      if (smpteTtDestinationSettings != null)
        'smpteTtDestinationSettings': smpteTtDestinationSettings,
      if (teletextDestinationSettings != null)
        'teletextDestinationSettings': teletextDestinationSettings,
      if (ttmlDestinationSettings != null)
        'ttmlDestinationSettings': ttmlDestinationSettings,
      if (webvttDestinationSettings != null)
        'webvttDestinationSettings': webvttDestinationSettings,
    };
  }
}

/// Maps a caption channel to an ISO 693-2 language code
/// (http://www.loc.gov/standards/iso639-2), with an optional description.
class CaptionLanguageMapping {
  /// The closed caption channel being described by this CaptionLanguageMapping.
  /// Each channel mapping must have a unique channel number (maximum of 4)
  final int captionChannel;

  /// Three character ISO 639-2 language code (see
  /// http://www.loc.gov/standards/iso639-2)
  final String languageCode;

  /// Textual description of language
  final String languageDescription;

  CaptionLanguageMapping({
    required this.captionChannel,
    required this.languageCode,
    required this.languageDescription,
  });

  factory CaptionLanguageMapping.fromJson(Map<String, dynamic> json) {
    return CaptionLanguageMapping(
      captionChannel: json['captionChannel'] as int,
      languageCode: json['languageCode'] as String,
      languageDescription: json['languageDescription'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final captionChannel = this.captionChannel;
    final languageCode = this.languageCode;
    final languageDescription = this.languageDescription;
    return {
      'captionChannel': captionChannel,
      'languageCode': languageCode,
      'languageDescription': languageDescription,
    };
  }
}

/// Caption Rectangle
class CaptionRectangle {
  /// See the description in leftOffset.
  /// For height, specify the entire height of the rectangle as a percentage of
  /// the underlying frame height. For example, \"80\" means the rectangle height
  /// is 80% of the underlying frame height. The topOffset and rectangleHeight
  /// must add up to 100% or less.
  /// This field corresponds to tts:extent - Y in the TTML standard.
  final double height;

  /// Applies only if you plan to convert these source captions to EBU-TT-D or
  /// TTML in an output. (Make sure to leave the default if you don't have either
  /// of these formats in the output.) You can define a display rectangle for the
  /// captions that is smaller than the underlying video frame. You define the
  /// rectangle by specifying the position of the left edge, top edge, bottom
  /// edge, and right edge of the rectangle, all within the underlying video
  /// frame. The units for the measurements are percentages.
  /// If you specify a value for one of these fields, you must specify a value for
  /// all of them.
  /// For leftOffset, specify the position of the left edge of the rectangle, as a
  /// percentage of the underlying frame width, and relative to the left edge of
  /// the frame. For example, \"10\" means the measurement is 10% of the
  /// underlying frame width. The rectangle left edge starts at that position from
  /// the left edge of the frame.
  /// This field corresponds to tts:origin - X in the TTML standard.
  final double leftOffset;

  /// See the description in leftOffset.
  /// For topOffset, specify the position of the top edge of the rectangle, as a
  /// percentage of the underlying frame height, and relative to the top edge of
  /// the frame. For example, \"10\" means the measurement is 10% of the
  /// underlying frame height. The rectangle top edge starts at that position from
  /// the top edge of the frame.
  /// This field corresponds to tts:origin - Y in the TTML standard.
  final double topOffset;

  /// See the description in leftOffset.
  /// For width, specify the entire width of the rectangle as a percentage of the
  /// underlying frame width. For example, \"80\" means the rectangle width is 80%
  /// of the underlying frame width. The leftOffset and rectangleWidth must add up
  /// to 100% or less.
  /// This field corresponds to tts:extent - X in the TTML standard.
  final double width;

  CaptionRectangle({
    required this.height,
    required this.leftOffset,
    required this.topOffset,
    required this.width,
  });

  factory CaptionRectangle.fromJson(Map<String, dynamic> json) {
    return CaptionRectangle(
      height: json['height'] as double,
      leftOffset: json['leftOffset'] as double,
      topOffset: json['topOffset'] as double,
      width: json['width'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final height = this.height;
    final leftOffset = this.leftOffset;
    final topOffset = this.topOffset;
    final width = this.width;
    return {
      'height': height,
      'leftOffset': leftOffset,
      'topOffset': topOffset,
      'width': width,
    };
  }
}

/// Output groups for this Live Event. Output groups contain information about
/// where streams should be distributed.
class CaptionSelector {
  /// Name identifier for a caption selector.  This name is used to associate this
  /// caption selector with one or more caption descriptions.  Names must be
  /// unique within an event.
  final String name;

  /// When specified this field indicates the three letter language code of the
  /// caption track to extract from the source.
  final String? languageCode;

  /// Caption selector settings.
  final CaptionSelectorSettings? selectorSettings;

  CaptionSelector({
    required this.name,
    this.languageCode,
    this.selectorSettings,
  });

  factory CaptionSelector.fromJson(Map<String, dynamic> json) {
    return CaptionSelector(
      name: json['name'] as String,
      languageCode: json['languageCode'] as String?,
      selectorSettings: json['selectorSettings'] != null
          ? CaptionSelectorSettings.fromJson(
              json['selectorSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final languageCode = this.languageCode;
    final selectorSettings = this.selectorSettings;
    return {
      'name': name,
      if (languageCode != null) 'languageCode': languageCode,
      if (selectorSettings != null) 'selectorSettings': selectorSettings,
    };
  }
}

/// Caption Selector Settings
class CaptionSelectorSettings {
  final AncillarySourceSettings? ancillarySourceSettings;
  final AribSourceSettings? aribSourceSettings;
  final DvbSubSourceSettings? dvbSubSourceSettings;
  final EmbeddedSourceSettings? embeddedSourceSettings;
  final Scte20SourceSettings? scte20SourceSettings;
  final Scte27SourceSettings? scte27SourceSettings;
  final TeletextSourceSettings? teletextSourceSettings;

  CaptionSelectorSettings({
    this.ancillarySourceSettings,
    this.aribSourceSettings,
    this.dvbSubSourceSettings,
    this.embeddedSourceSettings,
    this.scte20SourceSettings,
    this.scte27SourceSettings,
    this.teletextSourceSettings,
  });

  factory CaptionSelectorSettings.fromJson(Map<String, dynamic> json) {
    return CaptionSelectorSettings(
      ancillarySourceSettings: json['ancillarySourceSettings'] != null
          ? AncillarySourceSettings.fromJson(
              json['ancillarySourceSettings'] as Map<String, dynamic>)
          : null,
      aribSourceSettings: json['aribSourceSettings'] != null
          ? AribSourceSettings.fromJson(
              json['aribSourceSettings'] as Map<String, dynamic>)
          : null,
      dvbSubSourceSettings: json['dvbSubSourceSettings'] != null
          ? DvbSubSourceSettings.fromJson(
              json['dvbSubSourceSettings'] as Map<String, dynamic>)
          : null,
      embeddedSourceSettings: json['embeddedSourceSettings'] != null
          ? EmbeddedSourceSettings.fromJson(
              json['embeddedSourceSettings'] as Map<String, dynamic>)
          : null,
      scte20SourceSettings: json['scte20SourceSettings'] != null
          ? Scte20SourceSettings.fromJson(
              json['scte20SourceSettings'] as Map<String, dynamic>)
          : null,
      scte27SourceSettings: json['scte27SourceSettings'] != null
          ? Scte27SourceSettings.fromJson(
              json['scte27SourceSettings'] as Map<String, dynamic>)
          : null,
      teletextSourceSettings: json['teletextSourceSettings'] != null
          ? TeletextSourceSettings.fromJson(
              json['teletextSourceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ancillarySourceSettings = this.ancillarySourceSettings;
    final aribSourceSettings = this.aribSourceSettings;
    final dvbSubSourceSettings = this.dvbSubSourceSettings;
    final embeddedSourceSettings = this.embeddedSourceSettings;
    final scte20SourceSettings = this.scte20SourceSettings;
    final scte27SourceSettings = this.scte27SourceSettings;
    final teletextSourceSettings = this.teletextSourceSettings;
    return {
      if (ancillarySourceSettings != null)
        'ancillarySourceSettings': ancillarySourceSettings,
      if (aribSourceSettings != null) 'aribSourceSettings': aribSourceSettings,
      if (dvbSubSourceSettings != null)
        'dvbSubSourceSettings': dvbSubSourceSettings,
      if (embeddedSourceSettings != null)
        'embeddedSourceSettings': embeddedSourceSettings,
      if (scte20SourceSettings != null)
        'scte20SourceSettings': scte20SourceSettings,
      if (scte27SourceSettings != null)
        'scte27SourceSettings': scte27SourceSettings,
      if (teletextSourceSettings != null)
        'teletextSourceSettings': teletextSourceSettings,
    };
  }
}

/// Maximum CDI input resolution; SD is 480i and 576i up to 30 frames-per-second
/// (fps), HD is 720p up to 60 fps / 1080i up to 30 fps, FHD is 1080p up to 60
/// fps, UHD is 2160p up to 60 fps
enum CdiInputResolution {
  sd,
  hd,
  fhd,
  uhd,
}

extension on CdiInputResolution {
  String toValue() {
    switch (this) {
      case CdiInputResolution.sd:
        return 'SD';
      case CdiInputResolution.hd:
        return 'HD';
      case CdiInputResolution.fhd:
        return 'FHD';
      case CdiInputResolution.uhd:
        return 'UHD';
    }
  }
}

extension on String {
  CdiInputResolution toCdiInputResolution() {
    switch (this) {
      case 'SD':
        return CdiInputResolution.sd;
      case 'HD':
        return CdiInputResolution.hd;
      case 'FHD':
        return CdiInputResolution.fhd;
      case 'UHD':
        return CdiInputResolution.uhd;
    }
    throw Exception('$this is not known in enum CdiInputResolution');
  }
}

/// Placeholder documentation for CdiInputSpecification
class CdiInputSpecification {
  /// Maximum CDI input resolution
  final CdiInputResolution? resolution;

  CdiInputSpecification({
    this.resolution,
  });

  factory CdiInputSpecification.fromJson(Map<String, dynamic> json) {
    return CdiInputSpecification(
      resolution: (json['resolution'] as String?)?.toCdiInputResolution(),
    );
  }

  Map<String, dynamic> toJson() {
    final resolution = this.resolution;
    return {
      if (resolution != null) 'resolution': resolution.toValue(),
    };
  }
}

/// Placeholder documentation for Channel
class Channel {
  /// The unique arn of the channel.
  final String? arn;

  /// Specification of CDI inputs for this channel
  final CdiInputSpecification? cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final ChannelClass? channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  final List<OutputDestination>? destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint>? egressEndpoints;
  final EncoderSettings? encoderSettings;

  /// The unique id of the channel.
  final String? id;

  /// List of input attachments for channel.
  final List<InputAttachment>? inputAttachments;

  /// Specification of network and file inputs for this channel
  final InputSpecification? inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final LogLevel? logLevel;

  /// The name of the channel. (user-mutable)
  final String? name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail>? pipelineDetails;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  final String? roleArn;
  final ChannelState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Settings for VPC output
  final VpcOutputSettingsDescription? vpc;

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
    this.vpc,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      arn: json['arn'] as String?,
      cdiInputSpecification: json['cdiInputSpecification'] != null
          ? CdiInputSpecification.fromJson(
              json['cdiInputSpecification'] as Map<String, dynamic>)
          : null,
      channelClass: (json['channelClass'] as String?)?.toChannelClass(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      encoderSettings: json['encoderSettings'] != null
          ? EncoderSettings.fromJson(
              json['encoderSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      inputAttachments: (json['inputAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => InputAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSpecification: json['inputSpecification'] != null
          ? InputSpecification.fromJson(
              json['inputSpecification'] as Map<String, dynamic>)
          : null,
      logLevel: (json['logLevel'] as String?)?.toLogLevel(),
      name: json['name'] as String?,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      roleArn: json['roleArn'] as String?,
      state: (json['state'] as String?)?.toChannelState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpc: json['vpc'] != null
          ? VpcOutputSettingsDescription.fromJson(
              json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cdiInputSpecification = this.cdiInputSpecification;
    final channelClass = this.channelClass;
    final destinations = this.destinations;
    final egressEndpoints = this.egressEndpoints;
    final encoderSettings = this.encoderSettings;
    final id = this.id;
    final inputAttachments = this.inputAttachments;
    final inputSpecification = this.inputSpecification;
    final logLevel = this.logLevel;
    final name = this.name;
    final pipelineDetails = this.pipelineDetails;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final roleArn = this.roleArn;
    final state = this.state;
    final tags = this.tags;
    final vpc = this.vpc;
    return {
      if (arn != null) 'arn': arn,
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (destinations != null) 'destinations': destinations,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (encoderSettings != null) 'encoderSettings': encoderSettings,
      if (id != null) 'id': id,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (roleArn != null) 'roleArn': roleArn,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// A standard channel has two encoding pipelines and a single pipeline channel
/// only has one.
enum ChannelClass {
  standard,
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
  }
}

extension on String {
  ChannelClass toChannelClass() {
    switch (this) {
      case 'STANDARD':
        return ChannelClass.standard;
      case 'SINGLE_PIPELINE':
        return ChannelClass.singlePipeline;
    }
    throw Exception('$this is not known in enum ChannelClass');
  }
}

/// Placeholder documentation for ChannelEgressEndpoint
class ChannelEgressEndpoint {
  /// Public IP of where a channel's output comes from
  final String? sourceIp;

  ChannelEgressEndpoint({
    this.sourceIp,
  });

  factory ChannelEgressEndpoint.fromJson(Map<String, dynamic> json) {
    return ChannelEgressEndpoint(
      sourceIp: json['sourceIp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceIp = this.sourceIp;
    return {
      if (sourceIp != null) 'sourceIp': sourceIp,
    };
  }
}

/// Placeholder documentation for ChannelState
enum ChannelState {
  creating,
  createFailed,
  idle,
  starting,
  running,
  recovering,
  stopping,
  deleting,
  deleted,
  updating,
  updateFailed,
}

extension on ChannelState {
  String toValue() {
    switch (this) {
      case ChannelState.creating:
        return 'CREATING';
      case ChannelState.createFailed:
        return 'CREATE_FAILED';
      case ChannelState.idle:
        return 'IDLE';
      case ChannelState.starting:
        return 'STARTING';
      case ChannelState.running:
        return 'RUNNING';
      case ChannelState.recovering:
        return 'RECOVERING';
      case ChannelState.stopping:
        return 'STOPPING';
      case ChannelState.deleting:
        return 'DELETING';
      case ChannelState.deleted:
        return 'DELETED';
      case ChannelState.updating:
        return 'UPDATING';
      case ChannelState.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  ChannelState toChannelState() {
    switch (this) {
      case 'CREATING':
        return ChannelState.creating;
      case 'CREATE_FAILED':
        return ChannelState.createFailed;
      case 'IDLE':
        return ChannelState.idle;
      case 'STARTING':
        return ChannelState.starting;
      case 'RUNNING':
        return ChannelState.running;
      case 'RECOVERING':
        return ChannelState.recovering;
      case 'STOPPING':
        return ChannelState.stopping;
      case 'DELETING':
        return ChannelState.deleting;
      case 'DELETED':
        return ChannelState.deleted;
      case 'UPDATING':
        return ChannelState.updating;
      case 'UPDATE_FAILED':
        return ChannelState.updateFailed;
    }
    throw Exception('$this is not known in enum ChannelState');
  }
}

/// Placeholder documentation for ChannelSummary
class ChannelSummary {
  /// The unique arn of the channel.
  final String? arn;

  /// Specification of CDI inputs for this channel
  final CdiInputSpecification? cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final ChannelClass? channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  final List<OutputDestination>? destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint>? egressEndpoints;

  /// The unique id of the channel.
  final String? id;

  /// List of input attachments for channel.
  final List<InputAttachment>? inputAttachments;

  /// Specification of network and file inputs for this channel
  final InputSpecification? inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final LogLevel? logLevel;

  /// The name of the channel. (user-mutable)
  final String? name;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  final String? roleArn;
  final ChannelState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Settings for VPC output
  final VpcOutputSettingsDescription? vpc;

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
    this.vpc,
  });

  factory ChannelSummary.fromJson(Map<String, dynamic> json) {
    return ChannelSummary(
      arn: json['arn'] as String?,
      cdiInputSpecification: json['cdiInputSpecification'] != null
          ? CdiInputSpecification.fromJson(
              json['cdiInputSpecification'] as Map<String, dynamic>)
          : null,
      channelClass: (json['channelClass'] as String?)?.toChannelClass(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      inputAttachments: (json['inputAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => InputAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSpecification: json['inputSpecification'] != null
          ? InputSpecification.fromJson(
              json['inputSpecification'] as Map<String, dynamic>)
          : null,
      logLevel: (json['logLevel'] as String?)?.toLogLevel(),
      name: json['name'] as String?,
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      roleArn: json['roleArn'] as String?,
      state: (json['state'] as String?)?.toChannelState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpc: json['vpc'] != null
          ? VpcOutputSettingsDescription.fromJson(
              json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cdiInputSpecification = this.cdiInputSpecification;
    final channelClass = this.channelClass;
    final destinations = this.destinations;
    final egressEndpoints = this.egressEndpoints;
    final id = this.id;
    final inputAttachments = this.inputAttachments;
    final inputSpecification = this.inputSpecification;
    final logLevel = this.logLevel;
    final name = this.name;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final roleArn = this.roleArn;
    final state = this.state;
    final tags = this.tags;
    final vpc = this.vpc;
    return {
      if (arn != null) 'arn': arn,
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (destinations != null) 'destinations': destinations,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (id != null) 'id': id,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (roleArn != null) 'roleArn': roleArn,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Passthrough applies no color space conversion to the output
class ColorSpacePassthroughSettings {
  ColorSpacePassthroughSettings();

  factory ColorSpacePassthroughSettings.fromJson(Map<String, dynamic> _) {
    return ColorSpacePassthroughSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Placeholder documentation for CreateChannelResponse
class CreateChannelResponse {
  final Channel? channel;

  CreateChannelResponse({
    this.channel,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    return {
      if (channel != null) 'channel': channel,
    };
  }
}

/// Placeholder documentation for CreateInputResponse
class CreateInputResponse {
  final Input? input;

  CreateInputResponse({
    this.input,
  });

  factory CreateInputResponse.fromJson(Map<String, dynamic> json) {
    return CreateInputResponse(
      input: json['input'] != null
          ? Input.fromJson(json['input'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    return {
      if (input != null) 'input': input,
    };
  }
}

/// Placeholder documentation for CreateInputSecurityGroupResponse
class CreateInputSecurityGroupResponse {
  final InputSecurityGroup? securityGroup;

  CreateInputSecurityGroupResponse({
    this.securityGroup,
  });

  factory CreateInputSecurityGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateInputSecurityGroupResponse(
      securityGroup: json['securityGroup'] != null
          ? InputSecurityGroup.fromJson(
              json['securityGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroup = this.securityGroup;
    return {
      if (securityGroup != null) 'securityGroup': securityGroup,
    };
  }
}

/// Placeholder documentation for CreateMultiplexProgramResponse
class CreateMultiplexProgramResponse {
  /// The newly created multiplex program.
  final MultiplexProgram? multiplexProgram;

  CreateMultiplexProgramResponse({
    this.multiplexProgram,
  });

  factory CreateMultiplexProgramResponse.fromJson(Map<String, dynamic> json) {
    return CreateMultiplexProgramResponse(
      multiplexProgram: json['multiplexProgram'] != null
          ? MultiplexProgram.fromJson(
              json['multiplexProgram'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final multiplexProgram = this.multiplexProgram;
    return {
      if (multiplexProgram != null) 'multiplexProgram': multiplexProgram,
    };
  }
}

/// Placeholder documentation for CreateMultiplexResponse
class CreateMultiplexResponse {
  /// The newly created multiplex.
  final Multiplex? multiplex;

  CreateMultiplexResponse({
    this.multiplex,
  });

  factory CreateMultiplexResponse.fromJson(Map<String, dynamic> json) {
    return CreateMultiplexResponse(
      multiplex: json['multiplex'] != null
          ? Multiplex.fromJson(json['multiplex'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final multiplex = this.multiplex;
    return {
      if (multiplex != null) 'multiplex': multiplex,
    };
  }
}

/// Placeholder documentation for CreatePartnerInputResponse
class CreatePartnerInputResponse {
  final Input? input;

  CreatePartnerInputResponse({
    this.input,
  });

  factory CreatePartnerInputResponse.fromJson(Map<String, dynamic> json) {
    return CreatePartnerInputResponse(
      input: json['input'] != null
          ? Input.fromJson(json['input'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    return {
      if (input != null) 'input': input,
    };
  }
}

/// Placeholder documentation for DeleteChannelResponse
class DeleteChannelResponse {
  /// The unique arn of the channel.
  final String? arn;

  /// Specification of CDI inputs for this channel
  final CdiInputSpecification? cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final ChannelClass? channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  final List<OutputDestination>? destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint>? egressEndpoints;
  final EncoderSettings? encoderSettings;

  /// The unique id of the channel.
  final String? id;

  /// List of input attachments for channel.
  final List<InputAttachment>? inputAttachments;

  /// Specification of network and file inputs for this channel
  final InputSpecification? inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final LogLevel? logLevel;

  /// The name of the channel. (user-mutable)
  final String? name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail>? pipelineDetails;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  final String? roleArn;
  final ChannelState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Settings for VPC output
  final VpcOutputSettingsDescription? vpc;

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
    this.vpc,
  });

  factory DeleteChannelResponse.fromJson(Map<String, dynamic> json) {
    return DeleteChannelResponse(
      arn: json['arn'] as String?,
      cdiInputSpecification: json['cdiInputSpecification'] != null
          ? CdiInputSpecification.fromJson(
              json['cdiInputSpecification'] as Map<String, dynamic>)
          : null,
      channelClass: (json['channelClass'] as String?)?.toChannelClass(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      encoderSettings: json['encoderSettings'] != null
          ? EncoderSettings.fromJson(
              json['encoderSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      inputAttachments: (json['inputAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => InputAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSpecification: json['inputSpecification'] != null
          ? InputSpecification.fromJson(
              json['inputSpecification'] as Map<String, dynamic>)
          : null,
      logLevel: (json['logLevel'] as String?)?.toLogLevel(),
      name: json['name'] as String?,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      roleArn: json['roleArn'] as String?,
      state: (json['state'] as String?)?.toChannelState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpc: json['vpc'] != null
          ? VpcOutputSettingsDescription.fromJson(
              json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cdiInputSpecification = this.cdiInputSpecification;
    final channelClass = this.channelClass;
    final destinations = this.destinations;
    final egressEndpoints = this.egressEndpoints;
    final encoderSettings = this.encoderSettings;
    final id = this.id;
    final inputAttachments = this.inputAttachments;
    final inputSpecification = this.inputSpecification;
    final logLevel = this.logLevel;
    final name = this.name;
    final pipelineDetails = this.pipelineDetails;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final roleArn = this.roleArn;
    final state = this.state;
    final tags = this.tags;
    final vpc = this.vpc;
    return {
      if (arn != null) 'arn': arn,
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (destinations != null) 'destinations': destinations,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (encoderSettings != null) 'encoderSettings': encoderSettings,
      if (id != null) 'id': id,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (roleArn != null) 'roleArn': roleArn,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Placeholder documentation for DeleteInputResponse
class DeleteInputResponse {
  DeleteInputResponse();

  factory DeleteInputResponse.fromJson(Map<String, dynamic> _) {
    return DeleteInputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Placeholder documentation for DeleteInputSecurityGroupResponse
class DeleteInputSecurityGroupResponse {
  DeleteInputSecurityGroupResponse();

  factory DeleteInputSecurityGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteInputSecurityGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Placeholder documentation for DeleteMultiplexProgramResponse
class DeleteMultiplexProgramResponse {
  /// The MediaLive channel associated with the program.
  final String? channelId;

  /// The settings for this multiplex program.
  final MultiplexProgramSettings? multiplexProgramSettings;

  /// The packet identifier map for this multiplex program.
  final MultiplexProgramPacketIdentifiersMap? packetIdentifiersMap;

  /// Contains information about the current sources for the specified program in
  /// the specified multiplex. Keep in mind that each multiplex pipeline connects
  /// to both pipelines in a given source channel (the channel identified by the
  /// program). But only one of those channel pipelines is ever active at one
  /// time.
  final List<MultiplexProgramPipelineDetail>? pipelineDetails;

  /// The name of the multiplex program.
  final String? programName;

  DeleteMultiplexProgramResponse({
    this.channelId,
    this.multiplexProgramSettings,
    this.packetIdentifiersMap,
    this.pipelineDetails,
    this.programName,
  });

  factory DeleteMultiplexProgramResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMultiplexProgramResponse(
      channelId: json['channelId'] as String?,
      multiplexProgramSettings: json['multiplexProgramSettings'] != null
          ? MultiplexProgramSettings.fromJson(
              json['multiplexProgramSettings'] as Map<String, dynamic>)
          : null,
      packetIdentifiersMap: json['packetIdentifiersMap'] != null
          ? MultiplexProgramPacketIdentifiersMap.fromJson(
              json['packetIdentifiersMap'] as Map<String, dynamic>)
          : null,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => MultiplexProgramPipelineDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      programName: json['programName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final multiplexProgramSettings = this.multiplexProgramSettings;
    final packetIdentifiersMap = this.packetIdentifiersMap;
    final pipelineDetails = this.pipelineDetails;
    final programName = this.programName;
    return {
      if (channelId != null) 'channelId': channelId,
      if (multiplexProgramSettings != null)
        'multiplexProgramSettings': multiplexProgramSettings,
      if (packetIdentifiersMap != null)
        'packetIdentifiersMap': packetIdentifiersMap,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (programName != null) 'programName': programName,
    };
  }
}

/// Placeholder documentation for DeleteMultiplexResponse
class DeleteMultiplexResponse {
  /// The unique arn of the multiplex.
  final String? arn;

  /// A list of availability zones for the multiplex.
  final List<String>? availabilityZones;

  /// A list of the multiplex output destinations.
  final List<MultiplexOutputDestination>? destinations;

  /// The unique id of the multiplex.
  final String? id;

  /// Configuration for a multiplex event.
  final MultiplexSettings? multiplexSettings;

  /// The name of the multiplex.
  final String? name;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The number of programs in the multiplex.
  final int? programCount;

  /// The current state of the multiplex.
  final MultiplexState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

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

  factory DeleteMultiplexResponse.fromJson(Map<String, dynamic> json) {
    return DeleteMultiplexResponse(
      arn: json['arn'] as String?,
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      multiplexSettings: json['multiplexSettings'] != null
          ? MultiplexSettings.fromJson(
              json['multiplexSettings'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      programCount: json['programCount'] as int?,
      state: (json['state'] as String?)?.toMultiplexState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZones = this.availabilityZones;
    final destinations = this.destinations;
    final id = this.id;
    final multiplexSettings = this.multiplexSettings;
    final name = this.name;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final programCount = this.programCount;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (destinations != null) 'destinations': destinations,
      if (id != null) 'id': id,
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (name != null) 'name': name,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (programCount != null) 'programCount': programCount,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Placeholder documentation for DeleteReservationResponse
class DeleteReservationResponse {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  final String? arn;

  /// Number of reserved resources
  final int? count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String? currencyCode;

  /// Lease duration, e.g. '12'
  final int? duration;

  /// Units for duration, e.g. 'MONTHS'
  final OfferingDurationUnits? durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  final String? end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double? fixedPrice;

  /// User specified reservation name
  final String? name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String? offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String? offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final OfferingType? offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String? region;

  /// Unique reservation ID, e.g. '1234567'
  final String? reservationId;

  /// Resource configuration details
  final ReservationResourceSpecification? resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  final String? start;

  /// Current state of reservation, e.g. 'ACTIVE'
  final ReservationState? state;

  /// A collection of key-value pairs
  final Map<String, String>? tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double? usagePrice;

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

  factory DeleteReservationResponse.fromJson(Map<String, dynamic> json) {
    return DeleteReservationResponse(
      arn: json['arn'] as String?,
      count: json['count'] as int?,
      currencyCode: json['currencyCode'] as String?,
      duration: json['duration'] as int?,
      durationUnits:
          (json['durationUnits'] as String?)?.toOfferingDurationUnits(),
      end: json['end'] as String?,
      fixedPrice: json['fixedPrice'] as double?,
      name: json['name'] as String?,
      offeringDescription: json['offeringDescription'] as String?,
      offeringId: json['offeringId'] as String?,
      offeringType: (json['offeringType'] as String?)?.toOfferingType(),
      region: json['region'] as String?,
      reservationId: json['reservationId'] as String?,
      resourceSpecification: json['resourceSpecification'] != null
          ? ReservationResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
      start: json['start'] as String?,
      state: (json['state'] as String?)?.toReservationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      usagePrice: json['usagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final count = this.count;
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final durationUnits = this.durationUnits;
    final end = this.end;
    final fixedPrice = this.fixedPrice;
    final name = this.name;
    final offeringDescription = this.offeringDescription;
    final offeringId = this.offeringId;
    final offeringType = this.offeringType;
    final region = this.region;
    final reservationId = this.reservationId;
    final resourceSpecification = this.resourceSpecification;
    final start = this.start;
    final state = this.state;
    final tags = this.tags;
    final usagePrice = this.usagePrice;
    return {
      if (arn != null) 'arn': arn,
      if (count != null) 'count': count,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (duration != null) 'duration': duration,
      if (durationUnits != null) 'durationUnits': durationUnits.toValue(),
      if (end != null) 'end': end,
      if (fixedPrice != null) 'fixedPrice': fixedPrice,
      if (name != null) 'name': name,
      if (offeringDescription != null)
        'offeringDescription': offeringDescription,
      if (offeringId != null) 'offeringId': offeringId,
      if (offeringType != null) 'offeringType': offeringType.toValue(),
      if (region != null) 'region': region,
      if (reservationId != null) 'reservationId': reservationId,
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
      if (start != null) 'start': start,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (usagePrice != null) 'usagePrice': usagePrice,
    };
  }
}

/// Placeholder documentation for DeleteScheduleResponse
class DeleteScheduleResponse {
  DeleteScheduleResponse();

  factory DeleteScheduleResponse.fromJson(Map<String, dynamic> _) {
    return DeleteScheduleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Placeholder documentation for DescribeChannelResponse
class DescribeChannelResponse {
  /// The unique arn of the channel.
  final String? arn;

  /// Specification of CDI inputs for this channel
  final CdiInputSpecification? cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final ChannelClass? channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  final List<OutputDestination>? destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint>? egressEndpoints;
  final EncoderSettings? encoderSettings;

  /// The unique id of the channel.
  final String? id;

  /// List of input attachments for channel.
  final List<InputAttachment>? inputAttachments;

  /// Specification of network and file inputs for this channel
  final InputSpecification? inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final LogLevel? logLevel;

  /// The name of the channel. (user-mutable)
  final String? name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail>? pipelineDetails;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  final String? roleArn;
  final ChannelState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Settings for VPC output
  final VpcOutputSettingsDescription? vpc;

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
    this.vpc,
  });

  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelResponse(
      arn: json['arn'] as String?,
      cdiInputSpecification: json['cdiInputSpecification'] != null
          ? CdiInputSpecification.fromJson(
              json['cdiInputSpecification'] as Map<String, dynamic>)
          : null,
      channelClass: (json['channelClass'] as String?)?.toChannelClass(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      encoderSettings: json['encoderSettings'] != null
          ? EncoderSettings.fromJson(
              json['encoderSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      inputAttachments: (json['inputAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => InputAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSpecification: json['inputSpecification'] != null
          ? InputSpecification.fromJson(
              json['inputSpecification'] as Map<String, dynamic>)
          : null,
      logLevel: (json['logLevel'] as String?)?.toLogLevel(),
      name: json['name'] as String?,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      roleArn: json['roleArn'] as String?,
      state: (json['state'] as String?)?.toChannelState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpc: json['vpc'] != null
          ? VpcOutputSettingsDescription.fromJson(
              json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cdiInputSpecification = this.cdiInputSpecification;
    final channelClass = this.channelClass;
    final destinations = this.destinations;
    final egressEndpoints = this.egressEndpoints;
    final encoderSettings = this.encoderSettings;
    final id = this.id;
    final inputAttachments = this.inputAttachments;
    final inputSpecification = this.inputSpecification;
    final logLevel = this.logLevel;
    final name = this.name;
    final pipelineDetails = this.pipelineDetails;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final roleArn = this.roleArn;
    final state = this.state;
    final tags = this.tags;
    final vpc = this.vpc;
    return {
      if (arn != null) 'arn': arn,
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (destinations != null) 'destinations': destinations,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (encoderSettings != null) 'encoderSettings': encoderSettings,
      if (id != null) 'id': id,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (roleArn != null) 'roleArn': roleArn,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Placeholder documentation for DescribeInputDeviceResponse
class DescribeInputDeviceResponse {
  /// The unique ARN of the input device.
  final String? arn;

  /// The state of the connection between the input device and AWS.
  final InputDeviceConnectionState? connectionState;

  /// The status of the action to synchronize the device configuration. If you
  /// change the configuration of the input device (for example, the maximum
  /// bitrate), MediaLive sends the new data to the device. The device might not
  /// update itself immediately. SYNCED means the device has updated its
  /// configuration. SYNCING means that it has not updated its configuration.
  final DeviceSettingsSyncState? deviceSettingsSyncState;

  /// The status of software on the input device.
  final DeviceUpdateStatus? deviceUpdateStatus;

  /// Settings that describe an input device that is type HD.
  final InputDeviceHdSettings? hdDeviceSettings;

  /// The unique ID of the input device.
  final String? id;

  /// The network MAC address of the input device.
  final String? macAddress;

  /// A name that you specify for the input device.
  final String? name;

  /// The network settings for the input device.
  final InputDeviceNetworkSettings? networkSettings;

  /// The unique serial number of the input device.
  final String? serialNumber;

  /// The type of the input device.
  final InputDeviceType? type;

  /// Settings that describe an input device that is type UHD.
  final InputDeviceUhdSettings? uhdDeviceSettings;

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

  factory DescribeInputDeviceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInputDeviceResponse(
      arn: json['arn'] as String?,
      connectionState:
          (json['connectionState'] as String?)?.toInputDeviceConnectionState(),
      deviceSettingsSyncState: (json['deviceSettingsSyncState'] as String?)
          ?.toDeviceSettingsSyncState(),
      deviceUpdateStatus:
          (json['deviceUpdateStatus'] as String?)?.toDeviceUpdateStatus(),
      hdDeviceSettings: json['hdDeviceSettings'] != null
          ? InputDeviceHdSettings.fromJson(
              json['hdDeviceSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      macAddress: json['macAddress'] as String?,
      name: json['name'] as String?,
      networkSettings: json['networkSettings'] != null
          ? InputDeviceNetworkSettings.fromJson(
              json['networkSettings'] as Map<String, dynamic>)
          : null,
      serialNumber: json['serialNumber'] as String?,
      type: (json['type'] as String?)?.toInputDeviceType(),
      uhdDeviceSettings: json['uhdDeviceSettings'] != null
          ? InputDeviceUhdSettings.fromJson(
              json['uhdDeviceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectionState = this.connectionState;
    final deviceSettingsSyncState = this.deviceSettingsSyncState;
    final deviceUpdateStatus = this.deviceUpdateStatus;
    final hdDeviceSettings = this.hdDeviceSettings;
    final id = this.id;
    final macAddress = this.macAddress;
    final name = this.name;
    final networkSettings = this.networkSettings;
    final serialNumber = this.serialNumber;
    final type = this.type;
    final uhdDeviceSettings = this.uhdDeviceSettings;
    return {
      if (arn != null) 'arn': arn,
      if (connectionState != null) 'connectionState': connectionState.toValue(),
      if (deviceSettingsSyncState != null)
        'deviceSettingsSyncState': deviceSettingsSyncState.toValue(),
      if (deviceUpdateStatus != null)
        'deviceUpdateStatus': deviceUpdateStatus.toValue(),
      if (hdDeviceSettings != null) 'hdDeviceSettings': hdDeviceSettings,
      if (id != null) 'id': id,
      if (macAddress != null) 'macAddress': macAddress,
      if (name != null) 'name': name,
      if (networkSettings != null) 'networkSettings': networkSettings,
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (type != null) 'type': type.toValue(),
      if (uhdDeviceSettings != null) 'uhdDeviceSettings': uhdDeviceSettings,
    };
  }
}

/// Placeholder documentation for DescribeInputDeviceThumbnailResponse
class DescribeInputDeviceThumbnailResponse {
  /// The binary data for the thumbnail that the Link device has most recently
  /// sent to MediaLive.
  final Uint8List? body;

  /// The length of the content.
  final int? contentLength;

  /// Specifies the media type of the thumbnail.
  final ContentType? contentType;

  /// The unique, cacheable version of this thumbnail.
  final String? eTag;

  /// The date and time the thumbnail was last updated at the device.
  final DateTime? lastModified;

  DescribeInputDeviceThumbnailResponse({
    this.body,
    this.contentLength,
    this.contentType,
    this.eTag,
    this.lastModified,
  });

  factory DescribeInputDeviceThumbnailResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInputDeviceThumbnailResponse(
      body: _s.decodeNullableUint8List(json['body'] as String?),
      contentLength: json['Content-Length'] as int?,
      contentType: (json['Content-Type'] as String?)?.toContentType(),
      eTag: json['ETag'] as String?,
      lastModified: timeStampFromJson(json['Last-Modified']),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final contentLength = this.contentLength;
    final contentType = this.contentType;
    final eTag = this.eTag;
    final lastModified = this.lastModified;
    return {
      if (body != null) 'body': base64Encode(body),
    };
  }
}

/// Placeholder documentation for DescribeInputResponse
class DescribeInputResponse {
  /// The Unique ARN of the input (generated, immutable).
  final String? arn;

  /// A list of channel IDs that that input is attached to (currently an input can
  /// only be attached to one channel).
  final List<String>? attachedChannels;

  /// A list of the destinations of the input (PUSH-type).
  final List<InputDestination>? destinations;

  /// The generated ID of the input (unique for user account, immutable).
  final String? id;

  /// STANDARD - MediaLive expects two sources to be connected to this input. If
  /// the channel is also STANDARD, both sources will be ingested. If the channel
  /// is SINGLE_PIPELINE, only the first source will be ingested; the second
  /// source will always be ignored, even if the first source fails.
  /// SINGLE_PIPELINE - You can connect only one source to this input. If the
  /// ChannelClass is also  SINGLE_PIPELINE, this value is valid. If the
  /// ChannelClass is STANDARD, this value is not valid because the channel
  /// requires two sources in the input.
  final InputClass? inputClass;

  /// Settings for the input devices.
  final List<InputDeviceSettings>? inputDevices;

  /// A list of IDs for all Inputs which are partners of this one.
  final List<String>? inputPartnerIds;

  /// Certain pull input sources can be dynamic, meaning that they can have their
  /// URL's dynamically changes
  /// during input switch actions. Presently, this functionality only works with
  /// MP4_FILE inputs.
  final InputSourceType? inputSourceType;

  /// A list of MediaConnect Flows for this input.
  final List<MediaConnectFlow>? mediaConnectFlows;

  /// The user-assigned name (This is a mutable value).
  final String? name;

  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  final String? roleArn;

  /// A list of IDs for all the Input Security Groups attached to the input.
  final List<String>? securityGroups;

  /// A list of the sources of the input (PULL-type).
  final List<InputSource>? sources;
  final InputState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;
  final InputType? type;

  DescribeInputResponse({
    this.arn,
    this.attachedChannels,
    this.destinations,
    this.id,
    this.inputClass,
    this.inputDevices,
    this.inputPartnerIds,
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

  factory DescribeInputResponse.fromJson(Map<String, dynamic> json) {
    return DescribeInputResponse(
      arn: json['arn'] as String?,
      attachedChannels: (json['attachedChannels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => InputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      inputClass: (json['inputClass'] as String?)?.toInputClass(),
      inputDevices: (json['inputDevices'] as List?)
          ?.whereNotNull()
          .map((e) => InputDeviceSettings.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputPartnerIds: (json['inputPartnerIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inputSourceType:
          (json['inputSourceType'] as String?)?.toInputSourceType(),
      mediaConnectFlows: (json['mediaConnectFlows'] as List?)
          ?.whereNotNull()
          .map((e) => MediaConnectFlow.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      roleArn: json['roleArn'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['state'] as String?)?.toInputState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toInputType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachedChannels = this.attachedChannels;
    final destinations = this.destinations;
    final id = this.id;
    final inputClass = this.inputClass;
    final inputDevices = this.inputDevices;
    final inputPartnerIds = this.inputPartnerIds;
    final inputSourceType = this.inputSourceType;
    final mediaConnectFlows = this.mediaConnectFlows;
    final name = this.name;
    final roleArn = this.roleArn;
    final securityGroups = this.securityGroups;
    final sources = this.sources;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (attachedChannels != null) 'attachedChannels': attachedChannels,
      if (destinations != null) 'destinations': destinations,
      if (id != null) 'id': id,
      if (inputClass != null) 'inputClass': inputClass.toValue(),
      if (inputDevices != null) 'inputDevices': inputDevices,
      if (inputPartnerIds != null) 'inputPartnerIds': inputPartnerIds,
      if (inputSourceType != null) 'inputSourceType': inputSourceType.toValue(),
      if (mediaConnectFlows != null) 'mediaConnectFlows': mediaConnectFlows,
      if (name != null) 'name': name,
      if (roleArn != null) 'roleArn': roleArn,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (sources != null) 'sources': sources,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Placeholder documentation for DescribeInputSecurityGroupResponse
class DescribeInputSecurityGroupResponse {
  /// Unique ARN of Input Security Group
  final String? arn;

  /// The Id of the Input Security Group
  final String? id;

  /// The list of inputs currently using this Input Security Group.
  final List<String>? inputs;

  /// The current state of the Input Security Group.
  final InputSecurityGroupState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Whitelist rules and their sync status
  final List<InputWhitelistRule>? whitelistRules;

  DescribeInputSecurityGroupResponse({
    this.arn,
    this.id,
    this.inputs,
    this.state,
    this.tags,
    this.whitelistRules,
  });

  factory DescribeInputSecurityGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeInputSecurityGroupResponse(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      inputs: (json['inputs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      state: (json['state'] as String?)?.toInputSecurityGroupState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      whitelistRules: (json['whitelistRules'] as List?)
          ?.whereNotNull()
          .map((e) => InputWhitelistRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final inputs = this.inputs;
    final state = this.state;
    final tags = this.tags;
    final whitelistRules = this.whitelistRules;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (inputs != null) 'inputs': inputs,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (whitelistRules != null) 'whitelistRules': whitelistRules,
    };
  }
}

/// Placeholder documentation for DescribeMultiplexProgramResponse
class DescribeMultiplexProgramResponse {
  /// The MediaLive channel associated with the program.
  final String? channelId;

  /// The settings for this multiplex program.
  final MultiplexProgramSettings? multiplexProgramSettings;

  /// The packet identifier map for this multiplex program.
  final MultiplexProgramPacketIdentifiersMap? packetIdentifiersMap;

  /// Contains information about the current sources for the specified program in
  /// the specified multiplex. Keep in mind that each multiplex pipeline connects
  /// to both pipelines in a given source channel (the channel identified by the
  /// program). But only one of those channel pipelines is ever active at one
  /// time.
  final List<MultiplexProgramPipelineDetail>? pipelineDetails;

  /// The name of the multiplex program.
  final String? programName;

  DescribeMultiplexProgramResponse({
    this.channelId,
    this.multiplexProgramSettings,
    this.packetIdentifiersMap,
    this.pipelineDetails,
    this.programName,
  });

  factory DescribeMultiplexProgramResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMultiplexProgramResponse(
      channelId: json['channelId'] as String?,
      multiplexProgramSettings: json['multiplexProgramSettings'] != null
          ? MultiplexProgramSettings.fromJson(
              json['multiplexProgramSettings'] as Map<String, dynamic>)
          : null,
      packetIdentifiersMap: json['packetIdentifiersMap'] != null
          ? MultiplexProgramPacketIdentifiersMap.fromJson(
              json['packetIdentifiersMap'] as Map<String, dynamic>)
          : null,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => MultiplexProgramPipelineDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      programName: json['programName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final multiplexProgramSettings = this.multiplexProgramSettings;
    final packetIdentifiersMap = this.packetIdentifiersMap;
    final pipelineDetails = this.pipelineDetails;
    final programName = this.programName;
    return {
      if (channelId != null) 'channelId': channelId,
      if (multiplexProgramSettings != null)
        'multiplexProgramSettings': multiplexProgramSettings,
      if (packetIdentifiersMap != null)
        'packetIdentifiersMap': packetIdentifiersMap,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (programName != null) 'programName': programName,
    };
  }
}

/// Placeholder documentation for DescribeMultiplexResponse
class DescribeMultiplexResponse {
  /// The unique arn of the multiplex.
  final String? arn;

  /// A list of availability zones for the multiplex.
  final List<String>? availabilityZones;

  /// A list of the multiplex output destinations.
  final List<MultiplexOutputDestination>? destinations;

  /// The unique id of the multiplex.
  final String? id;

  /// Configuration for a multiplex event.
  final MultiplexSettings? multiplexSettings;

  /// The name of the multiplex.
  final String? name;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The number of programs in the multiplex.
  final int? programCount;

  /// The current state of the multiplex.
  final MultiplexState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

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

  factory DescribeMultiplexResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMultiplexResponse(
      arn: json['arn'] as String?,
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      multiplexSettings: json['multiplexSettings'] != null
          ? MultiplexSettings.fromJson(
              json['multiplexSettings'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      programCount: json['programCount'] as int?,
      state: (json['state'] as String?)?.toMultiplexState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZones = this.availabilityZones;
    final destinations = this.destinations;
    final id = this.id;
    final multiplexSettings = this.multiplexSettings;
    final name = this.name;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final programCount = this.programCount;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (destinations != null) 'destinations': destinations,
      if (id != null) 'id': id,
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (name != null) 'name': name,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (programCount != null) 'programCount': programCount,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Placeholder documentation for DescribeOfferingResponse
class DescribeOfferingResponse {
  /// Unique offering ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
  final String? arn;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String? currencyCode;

  /// Lease duration, e.g. '12'
  final int? duration;

  /// Units for duration, e.g. 'MONTHS'
  final OfferingDurationUnits? durationUnits;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double? fixedPrice;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String? offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String? offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final OfferingType? offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String? region;

  /// Resource configuration details
  final ReservationResourceSpecification? resourceSpecification;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double? usagePrice;

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

  factory DescribeOfferingResponse.fromJson(Map<String, dynamic> json) {
    return DescribeOfferingResponse(
      arn: json['arn'] as String?,
      currencyCode: json['currencyCode'] as String?,
      duration: json['duration'] as int?,
      durationUnits:
          (json['durationUnits'] as String?)?.toOfferingDurationUnits(),
      fixedPrice: json['fixedPrice'] as double?,
      offeringDescription: json['offeringDescription'] as String?,
      offeringId: json['offeringId'] as String?,
      offeringType: (json['offeringType'] as String?)?.toOfferingType(),
      region: json['region'] as String?,
      resourceSpecification: json['resourceSpecification'] != null
          ? ReservationResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
      usagePrice: json['usagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final durationUnits = this.durationUnits;
    final fixedPrice = this.fixedPrice;
    final offeringDescription = this.offeringDescription;
    final offeringId = this.offeringId;
    final offeringType = this.offeringType;
    final region = this.region;
    final resourceSpecification = this.resourceSpecification;
    final usagePrice = this.usagePrice;
    return {
      if (arn != null) 'arn': arn,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (duration != null) 'duration': duration,
      if (durationUnits != null) 'durationUnits': durationUnits.toValue(),
      if (fixedPrice != null) 'fixedPrice': fixedPrice,
      if (offeringDescription != null)
        'offeringDescription': offeringDescription,
      if (offeringId != null) 'offeringId': offeringId,
      if (offeringType != null) 'offeringType': offeringType.toValue(),
      if (region != null) 'region': region,
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
      if (usagePrice != null) 'usagePrice': usagePrice,
    };
  }
}

/// Placeholder documentation for DescribeReservationResponse
class DescribeReservationResponse {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  final String? arn;

  /// Number of reserved resources
  final int? count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String? currencyCode;

  /// Lease duration, e.g. '12'
  final int? duration;

  /// Units for duration, e.g. 'MONTHS'
  final OfferingDurationUnits? durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  final String? end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double? fixedPrice;

  /// User specified reservation name
  final String? name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String? offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String? offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final OfferingType? offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String? region;

  /// Unique reservation ID, e.g. '1234567'
  final String? reservationId;

  /// Resource configuration details
  final ReservationResourceSpecification? resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  final String? start;

  /// Current state of reservation, e.g. 'ACTIVE'
  final ReservationState? state;

  /// A collection of key-value pairs
  final Map<String, String>? tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double? usagePrice;

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

  factory DescribeReservationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeReservationResponse(
      arn: json['arn'] as String?,
      count: json['count'] as int?,
      currencyCode: json['currencyCode'] as String?,
      duration: json['duration'] as int?,
      durationUnits:
          (json['durationUnits'] as String?)?.toOfferingDurationUnits(),
      end: json['end'] as String?,
      fixedPrice: json['fixedPrice'] as double?,
      name: json['name'] as String?,
      offeringDescription: json['offeringDescription'] as String?,
      offeringId: json['offeringId'] as String?,
      offeringType: (json['offeringType'] as String?)?.toOfferingType(),
      region: json['region'] as String?,
      reservationId: json['reservationId'] as String?,
      resourceSpecification: json['resourceSpecification'] != null
          ? ReservationResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
      start: json['start'] as String?,
      state: (json['state'] as String?)?.toReservationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      usagePrice: json['usagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final count = this.count;
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final durationUnits = this.durationUnits;
    final end = this.end;
    final fixedPrice = this.fixedPrice;
    final name = this.name;
    final offeringDescription = this.offeringDescription;
    final offeringId = this.offeringId;
    final offeringType = this.offeringType;
    final region = this.region;
    final reservationId = this.reservationId;
    final resourceSpecification = this.resourceSpecification;
    final start = this.start;
    final state = this.state;
    final tags = this.tags;
    final usagePrice = this.usagePrice;
    return {
      if (arn != null) 'arn': arn,
      if (count != null) 'count': count,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (duration != null) 'duration': duration,
      if (durationUnits != null) 'durationUnits': durationUnits.toValue(),
      if (end != null) 'end': end,
      if (fixedPrice != null) 'fixedPrice': fixedPrice,
      if (name != null) 'name': name,
      if (offeringDescription != null)
        'offeringDescription': offeringDescription,
      if (offeringId != null) 'offeringId': offeringId,
      if (offeringType != null) 'offeringType': offeringType.toValue(),
      if (region != null) 'region': region,
      if (reservationId != null) 'reservationId': reservationId,
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
      if (start != null) 'start': start,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (usagePrice != null) 'usagePrice': usagePrice,
    };
  }
}

/// Placeholder documentation for DescribeScheduleResponse
class DescribeScheduleResponse {
  /// The next token; for use in pagination.
  final String? nextToken;

  /// The list of actions in the schedule.
  final List<ScheduleAction>? scheduleActions;

  DescribeScheduleResponse({
    this.nextToken,
    this.scheduleActions,
  });

  factory DescribeScheduleResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScheduleResponse(
      nextToken: json['nextToken'] as String?,
      scheduleActions: (json['scheduleActions'] as List?)
          ?.whereNotNull()
          .map((e) => ScheduleAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scheduleActions = this.scheduleActions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (scheduleActions != null) 'scheduleActions': scheduleActions,
    };
  }
}

/// The status of the action to synchronize the device configuration. If you
/// change the configuration of the input device (for example, the maximum
/// bitrate), MediaLive sends the new data to the device. The device might not
/// update itself immediately. SYNCED means the device has updated its
/// configuration. SYNCING means that it has not updated its configuration.
enum DeviceSettingsSyncState {
  synced,
  syncing,
}

extension on DeviceSettingsSyncState {
  String toValue() {
    switch (this) {
      case DeviceSettingsSyncState.synced:
        return 'SYNCED';
      case DeviceSettingsSyncState.syncing:
        return 'SYNCING';
    }
  }
}

extension on String {
  DeviceSettingsSyncState toDeviceSettingsSyncState() {
    switch (this) {
      case 'SYNCED':
        return DeviceSettingsSyncState.synced;
      case 'SYNCING':
        return DeviceSettingsSyncState.syncing;
    }
    throw Exception('$this is not known in enum DeviceSettingsSyncState');
  }
}

/// The status of software on the input device.
enum DeviceUpdateStatus {
  upToDate,
  notUpToDate,
}

extension on DeviceUpdateStatus {
  String toValue() {
    switch (this) {
      case DeviceUpdateStatus.upToDate:
        return 'UP_TO_DATE';
      case DeviceUpdateStatus.notUpToDate:
        return 'NOT_UP_TO_DATE';
    }
  }
}

extension on String {
  DeviceUpdateStatus toDeviceUpdateStatus() {
    switch (this) {
      case 'UP_TO_DATE':
        return DeviceUpdateStatus.upToDate;
      case 'NOT_UP_TO_DATE':
        return DeviceUpdateStatus.notUpToDate;
    }
    throw Exception('$this is not known in enum DeviceUpdateStatus');
  }
}

/// DVB Network Information Table (NIT)
class DvbNitSettings {
  /// The numeric value placed in the Network Information Table (NIT).
  final int networkId;

  /// The network name text placed in the networkNameDescriptor inside the Network
  /// Information Table. Maximum length is 256 characters.
  final String networkName;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? repInterval;

  DvbNitSettings({
    required this.networkId,
    required this.networkName,
    this.repInterval,
  });

  factory DvbNitSettings.fromJson(Map<String, dynamic> json) {
    return DvbNitSettings(
      networkId: json['networkId'] as int,
      networkName: json['networkName'] as String,
      repInterval: json['repInterval'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkId = this.networkId;
    final networkName = this.networkName;
    final repInterval = this.repInterval;
    return {
      'networkId': networkId,
      'networkName': networkName,
      if (repInterval != null) 'repInterval': repInterval,
    };
  }
}

/// Dvb Sdt Output Sdt
enum DvbSdtOutputSdt {
  sdtFollow,
  sdtFollowIfPresent,
  sdtManual,
  sdtNone,
}

extension on DvbSdtOutputSdt {
  String toValue() {
    switch (this) {
      case DvbSdtOutputSdt.sdtFollow:
        return 'SDT_FOLLOW';
      case DvbSdtOutputSdt.sdtFollowIfPresent:
        return 'SDT_FOLLOW_IF_PRESENT';
      case DvbSdtOutputSdt.sdtManual:
        return 'SDT_MANUAL';
      case DvbSdtOutputSdt.sdtNone:
        return 'SDT_NONE';
    }
  }
}

extension on String {
  DvbSdtOutputSdt toDvbSdtOutputSdt() {
    switch (this) {
      case 'SDT_FOLLOW':
        return DvbSdtOutputSdt.sdtFollow;
      case 'SDT_FOLLOW_IF_PRESENT':
        return DvbSdtOutputSdt.sdtFollowIfPresent;
      case 'SDT_MANUAL':
        return DvbSdtOutputSdt.sdtManual;
      case 'SDT_NONE':
        return DvbSdtOutputSdt.sdtNone;
    }
    throw Exception('$this is not known in enum DvbSdtOutputSdt');
  }
}

/// DVB Service Description Table (SDT)
class DvbSdtSettings {
  /// Selects method of inserting SDT information into output stream. The
  /// sdtFollow setting copies SDT information from input stream to output stream.
  /// The sdtFollowIfPresent setting copies SDT information from input stream to
  /// output stream if SDT information is present in the input, otherwise it will
  /// fall back on the user-defined values. The sdtManual setting means user will
  /// enter the SDT information. The sdtNone setting means output stream will not
  /// contain SDT information.
  final DvbSdtOutputSdt? outputSdt;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? repInterval;

  /// The service name placed in the serviceDescriptor in the Service Description
  /// Table. Maximum length is 256 characters.
  final String? serviceName;

  /// The service provider name placed in the serviceDescriptor in the Service
  /// Description Table. Maximum length is 256 characters.
  final String? serviceProviderName;

  DvbSdtSettings({
    this.outputSdt,
    this.repInterval,
    this.serviceName,
    this.serviceProviderName,
  });

  factory DvbSdtSettings.fromJson(Map<String, dynamic> json) {
    return DvbSdtSettings(
      outputSdt: (json['outputSdt'] as String?)?.toDvbSdtOutputSdt(),
      repInterval: json['repInterval'] as int?,
      serviceName: json['serviceName'] as String?,
      serviceProviderName: json['serviceProviderName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputSdt = this.outputSdt;
    final repInterval = this.repInterval;
    final serviceName = this.serviceName;
    final serviceProviderName = this.serviceProviderName;
    return {
      if (outputSdt != null) 'outputSdt': outputSdt.toValue(),
      if (repInterval != null) 'repInterval': repInterval,
      if (serviceName != null) 'serviceName': serviceName,
      if (serviceProviderName != null)
        'serviceProviderName': serviceProviderName,
    };
  }
}

/// Dvb Sub Destination Alignment
enum DvbSubDestinationAlignment {
  centered,
  left,
  smart,
}

extension on DvbSubDestinationAlignment {
  String toValue() {
    switch (this) {
      case DvbSubDestinationAlignment.centered:
        return 'CENTERED';
      case DvbSubDestinationAlignment.left:
        return 'LEFT';
      case DvbSubDestinationAlignment.smart:
        return 'SMART';
    }
  }
}

extension on String {
  DvbSubDestinationAlignment toDvbSubDestinationAlignment() {
    switch (this) {
      case 'CENTERED':
        return DvbSubDestinationAlignment.centered;
      case 'LEFT':
        return DvbSubDestinationAlignment.left;
      case 'SMART':
        return DvbSubDestinationAlignment.smart;
    }
    throw Exception('$this is not known in enum DvbSubDestinationAlignment');
  }
}

/// Dvb Sub Destination Background Color
enum DvbSubDestinationBackgroundColor {
  black,
  none,
  white,
}

extension on DvbSubDestinationBackgroundColor {
  String toValue() {
    switch (this) {
      case DvbSubDestinationBackgroundColor.black:
        return 'BLACK';
      case DvbSubDestinationBackgroundColor.none:
        return 'NONE';
      case DvbSubDestinationBackgroundColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  DvbSubDestinationBackgroundColor toDvbSubDestinationBackgroundColor() {
    switch (this) {
      case 'BLACK':
        return DvbSubDestinationBackgroundColor.black;
      case 'NONE':
        return DvbSubDestinationBackgroundColor.none;
      case 'WHITE':
        return DvbSubDestinationBackgroundColor.white;
    }
    throw Exception(
        '$this is not known in enum DvbSubDestinationBackgroundColor');
  }
}

/// Dvb Sub Destination Font Color
enum DvbSubDestinationFontColor {
  black,
  blue,
  green,
  red,
  white,
  yellow,
}

extension on DvbSubDestinationFontColor {
  String toValue() {
    switch (this) {
      case DvbSubDestinationFontColor.black:
        return 'BLACK';
      case DvbSubDestinationFontColor.blue:
        return 'BLUE';
      case DvbSubDestinationFontColor.green:
        return 'GREEN';
      case DvbSubDestinationFontColor.red:
        return 'RED';
      case DvbSubDestinationFontColor.white:
        return 'WHITE';
      case DvbSubDestinationFontColor.yellow:
        return 'YELLOW';
    }
  }
}

extension on String {
  DvbSubDestinationFontColor toDvbSubDestinationFontColor() {
    switch (this) {
      case 'BLACK':
        return DvbSubDestinationFontColor.black;
      case 'BLUE':
        return DvbSubDestinationFontColor.blue;
      case 'GREEN':
        return DvbSubDestinationFontColor.green;
      case 'RED':
        return DvbSubDestinationFontColor.red;
      case 'WHITE':
        return DvbSubDestinationFontColor.white;
      case 'YELLOW':
        return DvbSubDestinationFontColor.yellow;
    }
    throw Exception('$this is not known in enum DvbSubDestinationFontColor');
  }
}

/// Dvb Sub Destination Outline Color
enum DvbSubDestinationOutlineColor {
  black,
  blue,
  green,
  red,
  white,
  yellow,
}

extension on DvbSubDestinationOutlineColor {
  String toValue() {
    switch (this) {
      case DvbSubDestinationOutlineColor.black:
        return 'BLACK';
      case DvbSubDestinationOutlineColor.blue:
        return 'BLUE';
      case DvbSubDestinationOutlineColor.green:
        return 'GREEN';
      case DvbSubDestinationOutlineColor.red:
        return 'RED';
      case DvbSubDestinationOutlineColor.white:
        return 'WHITE';
      case DvbSubDestinationOutlineColor.yellow:
        return 'YELLOW';
    }
  }
}

extension on String {
  DvbSubDestinationOutlineColor toDvbSubDestinationOutlineColor() {
    switch (this) {
      case 'BLACK':
        return DvbSubDestinationOutlineColor.black;
      case 'BLUE':
        return DvbSubDestinationOutlineColor.blue;
      case 'GREEN':
        return DvbSubDestinationOutlineColor.green;
      case 'RED':
        return DvbSubDestinationOutlineColor.red;
      case 'WHITE':
        return DvbSubDestinationOutlineColor.white;
      case 'YELLOW':
        return DvbSubDestinationOutlineColor.yellow;
    }
    throw Exception('$this is not known in enum DvbSubDestinationOutlineColor');
  }
}

/// Dvb Sub Destination Settings
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
  final DvbSubDestinationAlignment? alignment;

  /// Specifies the color of the rectangle behind the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  final DvbSubDestinationBackgroundColor? backgroundColor;

  /// Specifies the opacity of the background rectangle. 255 is opaque; 0 is
  /// transparent. Leaving this parameter blank is equivalent to setting it to 0
  /// (transparent).  All burn-in and DVB-Sub font settings must match.
  final int? backgroundOpacity;

  /// External font file used for caption burn-in. File extension must be 'ttf' or
  /// 'tte'.  Although the user can select output fonts for many different types
  /// of input captions, embedded, STL and teletext sources use a strict grid
  /// system. Using external fonts with these caption sources could cause
  /// unexpected display of proportional fonts.  All burn-in and DVB-Sub font
  /// settings must match.
  final InputLocation? font;

  /// Specifies the color of the burned-in captions.  This option is not valid for
  /// source captions that are STL, 608/embedded or teletext.  These source
  /// settings are already pre-defined by the caption stream.  All burn-in and
  /// DVB-Sub font settings must match.
  final DvbSubDestinationFontColor? fontColor;

  /// Specifies the opacity of the burned-in captions. 255 is opaque; 0 is
  /// transparent.  All burn-in and DVB-Sub font settings must match.
  final int? fontOpacity;

  /// Font resolution in DPI (dots per inch); default is 96 dpi.  All burn-in and
  /// DVB-Sub font settings must match.
  final int? fontResolution;

  /// When set to auto fontSize will scale depending on the size of the output.
  /// Giving a positive integer will specify the exact font size in points.  All
  /// burn-in and DVB-Sub font settings must match.
  final String? fontSize;

  /// Specifies font outline color. This option is not valid for source captions
  /// that are either 608/embedded or teletext. These source settings are already
  /// pre-defined by the caption stream. All burn-in and DVB-Sub font settings
  /// must match.
  final DvbSubDestinationOutlineColor? outlineColor;

  /// Specifies font outline size in pixels. This option is not valid for source
  /// captions that are either 608/embedded or teletext. These source settings are
  /// already pre-defined by the caption stream. All burn-in and DVB-Sub font
  /// settings must match.
  final int? outlineSize;

  /// Specifies the color of the shadow cast by the captions.  All burn-in and
  /// DVB-Sub font settings must match.
  final DvbSubDestinationShadowColor? shadowColor;

  /// Specifies the opacity of the shadow. 255 is opaque; 0 is transparent.
  /// Leaving this parameter blank is equivalent to setting it to 0 (transparent).
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowOpacity;

  /// Specifies the horizontal offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels to the left.
  /// All burn-in and DVB-Sub font settings must match.
  final int? shadowXOffset;

  /// Specifies the vertical offset of the shadow relative to the captions in
  /// pixels. A value of -2 would result in a shadow offset 2 pixels above the
  /// text.  All burn-in and DVB-Sub font settings must match.
  final int? shadowYOffset;

  /// Controls whether a fixed grid size will be used to generate the output
  /// subtitles bitmap. Only applicable for Teletext inputs and DVB-Sub/Burn-in
  /// outputs.
  final DvbSubDestinationTeletextGridControl? teletextGridControl;

  /// Specifies the horizontal position of the caption relative to the left side
  /// of the output in pixels. A value of 10 would result in the captions starting
  /// 10 pixels from the left of the output. If no explicit xPosition is provided,
  /// the horizontal caption position will be determined by the alignment
  /// parameter.  This option is not valid for source captions that are STL,
  /// 608/embedded or teletext. These source settings are already pre-defined by
  /// the caption stream.  All burn-in and DVB-Sub font settings must match.
  final int? xPosition;

  /// Specifies the vertical position of the caption relative to the top of the
  /// output in pixels. A value of 10 would result in the captions starting 10
  /// pixels from the top of the output. If no explicit yPosition is provided, the
  /// caption will be positioned towards the bottom of the output.  This option is
  /// not valid for source captions that are STL, 608/embedded or teletext.  These
  /// source settings are already pre-defined by the caption stream.  All burn-in
  /// and DVB-Sub font settings must match.
  final int? yPosition;

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

  factory DvbSubDestinationSettings.fromJson(Map<String, dynamic> json) {
    return DvbSubDestinationSettings(
      alignment: (json['alignment'] as String?)?.toDvbSubDestinationAlignment(),
      backgroundColor: (json['backgroundColor'] as String?)
          ?.toDvbSubDestinationBackgroundColor(),
      backgroundOpacity: json['backgroundOpacity'] as int?,
      font: json['font'] != null
          ? InputLocation.fromJson(json['font'] as Map<String, dynamic>)
          : null,
      fontColor: (json['fontColor'] as String?)?.toDvbSubDestinationFontColor(),
      fontOpacity: json['fontOpacity'] as int?,
      fontResolution: json['fontResolution'] as int?,
      fontSize: json['fontSize'] as String?,
      outlineColor:
          (json['outlineColor'] as String?)?.toDvbSubDestinationOutlineColor(),
      outlineSize: json['outlineSize'] as int?,
      shadowColor:
          (json['shadowColor'] as String?)?.toDvbSubDestinationShadowColor(),
      shadowOpacity: json['shadowOpacity'] as int?,
      shadowXOffset: json['shadowXOffset'] as int?,
      shadowYOffset: json['shadowYOffset'] as int?,
      teletextGridControl: (json['teletextGridControl'] as String?)
          ?.toDvbSubDestinationTeletextGridControl(),
      xPosition: json['xPosition'] as int?,
      yPosition: json['yPosition'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alignment = this.alignment;
    final backgroundColor = this.backgroundColor;
    final backgroundOpacity = this.backgroundOpacity;
    final font = this.font;
    final fontColor = this.fontColor;
    final fontOpacity = this.fontOpacity;
    final fontResolution = this.fontResolution;
    final fontSize = this.fontSize;
    final outlineColor = this.outlineColor;
    final outlineSize = this.outlineSize;
    final shadowColor = this.shadowColor;
    final shadowOpacity = this.shadowOpacity;
    final shadowXOffset = this.shadowXOffset;
    final shadowYOffset = this.shadowYOffset;
    final teletextGridControl = this.teletextGridControl;
    final xPosition = this.xPosition;
    final yPosition = this.yPosition;
    return {
      if (alignment != null) 'alignment': alignment.toValue(),
      if (backgroundColor != null) 'backgroundColor': backgroundColor.toValue(),
      if (backgroundOpacity != null) 'backgroundOpacity': backgroundOpacity,
      if (font != null) 'font': font,
      if (fontColor != null) 'fontColor': fontColor.toValue(),
      if (fontOpacity != null) 'fontOpacity': fontOpacity,
      if (fontResolution != null) 'fontResolution': fontResolution,
      if (fontSize != null) 'fontSize': fontSize,
      if (outlineColor != null) 'outlineColor': outlineColor.toValue(),
      if (outlineSize != null) 'outlineSize': outlineSize,
      if (shadowColor != null) 'shadowColor': shadowColor.toValue(),
      if (shadowOpacity != null) 'shadowOpacity': shadowOpacity,
      if (shadowXOffset != null) 'shadowXOffset': shadowXOffset,
      if (shadowYOffset != null) 'shadowYOffset': shadowYOffset,
      if (teletextGridControl != null)
        'teletextGridControl': teletextGridControl.toValue(),
      if (xPosition != null) 'xPosition': xPosition,
      if (yPosition != null) 'yPosition': yPosition,
    };
  }
}

/// Dvb Sub Destination Shadow Color
enum DvbSubDestinationShadowColor {
  black,
  none,
  white,
}

extension on DvbSubDestinationShadowColor {
  String toValue() {
    switch (this) {
      case DvbSubDestinationShadowColor.black:
        return 'BLACK';
      case DvbSubDestinationShadowColor.none:
        return 'NONE';
      case DvbSubDestinationShadowColor.white:
        return 'WHITE';
    }
  }
}

extension on String {
  DvbSubDestinationShadowColor toDvbSubDestinationShadowColor() {
    switch (this) {
      case 'BLACK':
        return DvbSubDestinationShadowColor.black;
      case 'NONE':
        return DvbSubDestinationShadowColor.none;
      case 'WHITE':
        return DvbSubDestinationShadowColor.white;
    }
    throw Exception('$this is not known in enum DvbSubDestinationShadowColor');
  }
}

/// Dvb Sub Destination Teletext Grid Control
enum DvbSubDestinationTeletextGridControl {
  fixed,
  scaled,
}

extension on DvbSubDestinationTeletextGridControl {
  String toValue() {
    switch (this) {
      case DvbSubDestinationTeletextGridControl.fixed:
        return 'FIXED';
      case DvbSubDestinationTeletextGridControl.scaled:
        return 'SCALED';
    }
  }
}

extension on String {
  DvbSubDestinationTeletextGridControl
      toDvbSubDestinationTeletextGridControl() {
    switch (this) {
      case 'FIXED':
        return DvbSubDestinationTeletextGridControl.fixed;
      case 'SCALED':
        return DvbSubDestinationTeletextGridControl.scaled;
    }
    throw Exception(
        '$this is not known in enum DvbSubDestinationTeletextGridControl');
  }
}

/// Dvb Sub Ocr Language
enum DvbSubOcrLanguage {
  deu,
  eng,
  fra,
  nld,
  por,
  spa,
}

extension on DvbSubOcrLanguage {
  String toValue() {
    switch (this) {
      case DvbSubOcrLanguage.deu:
        return 'DEU';
      case DvbSubOcrLanguage.eng:
        return 'ENG';
      case DvbSubOcrLanguage.fra:
        return 'FRA';
      case DvbSubOcrLanguage.nld:
        return 'NLD';
      case DvbSubOcrLanguage.por:
        return 'POR';
      case DvbSubOcrLanguage.spa:
        return 'SPA';
    }
  }
}

extension on String {
  DvbSubOcrLanguage toDvbSubOcrLanguage() {
    switch (this) {
      case 'DEU':
        return DvbSubOcrLanguage.deu;
      case 'ENG':
        return DvbSubOcrLanguage.eng;
      case 'FRA':
        return DvbSubOcrLanguage.fra;
      case 'NLD':
        return DvbSubOcrLanguage.nld;
      case 'POR':
        return DvbSubOcrLanguage.por;
      case 'SPA':
        return DvbSubOcrLanguage.spa;
    }
    throw Exception('$this is not known in enum DvbSubOcrLanguage');
  }
}

/// Dvb Sub Source Settings
class DvbSubSourceSettings {
  /// If you will configure a WebVTT caption description that references this
  /// caption selector, use this field to
  /// provide the language to consider when translating the image-based source to
  /// text.
  final DvbSubOcrLanguage? ocrLanguage;

  /// When using DVB-Sub with Burn-In or SMPTE-TT, use this PID for the source
  /// content. Unused for DVB-Sub passthrough. All DVB-Sub content is passed
  /// through, regardless of selectors.
  final int? pid;

  DvbSubSourceSettings({
    this.ocrLanguage,
    this.pid,
  });

  factory DvbSubSourceSettings.fromJson(Map<String, dynamic> json) {
    return DvbSubSourceSettings(
      ocrLanguage: (json['ocrLanguage'] as String?)?.toDvbSubOcrLanguage(),
      pid: json['pid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ocrLanguage = this.ocrLanguage;
    final pid = this.pid;
    return {
      if (ocrLanguage != null) 'ocrLanguage': ocrLanguage.toValue(),
      if (pid != null) 'pid': pid,
    };
  }
}

/// DVB Time and Date Table (SDT)
class DvbTdtSettings {
  /// The number of milliseconds between instances of this table in the output
  /// transport stream.
  final int? repInterval;

  DvbTdtSettings({
    this.repInterval,
  });

  factory DvbTdtSettings.fromJson(Map<String, dynamic> json) {
    return DvbTdtSettings(
      repInterval: json['repInterval'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final repInterval = this.repInterval;
    return {
      if (repInterval != null) 'repInterval': repInterval,
    };
  }
}

/// Eac3 Attenuation Control
enum Eac3AttenuationControl {
  attenuate_3Db,
  none,
}

extension on Eac3AttenuationControl {
  String toValue() {
    switch (this) {
      case Eac3AttenuationControl.attenuate_3Db:
        return 'ATTENUATE_3_DB';
      case Eac3AttenuationControl.none:
        return 'NONE';
    }
  }
}

extension on String {
  Eac3AttenuationControl toEac3AttenuationControl() {
    switch (this) {
      case 'ATTENUATE_3_DB':
        return Eac3AttenuationControl.attenuate_3Db;
      case 'NONE':
        return Eac3AttenuationControl.none;
    }
    throw Exception('$this is not known in enum Eac3AttenuationControl');
  }
}

/// Eac3 Bitstream Mode
enum Eac3BitstreamMode {
  commentary,
  completeMain,
  emergency,
  hearingImpaired,
  visuallyImpaired,
}

extension on Eac3BitstreamMode {
  String toValue() {
    switch (this) {
      case Eac3BitstreamMode.commentary:
        return 'COMMENTARY';
      case Eac3BitstreamMode.completeMain:
        return 'COMPLETE_MAIN';
      case Eac3BitstreamMode.emergency:
        return 'EMERGENCY';
      case Eac3BitstreamMode.hearingImpaired:
        return 'HEARING_IMPAIRED';
      case Eac3BitstreamMode.visuallyImpaired:
        return 'VISUALLY_IMPAIRED';
    }
  }
}

extension on String {
  Eac3BitstreamMode toEac3BitstreamMode() {
    switch (this) {
      case 'COMMENTARY':
        return Eac3BitstreamMode.commentary;
      case 'COMPLETE_MAIN':
        return Eac3BitstreamMode.completeMain;
      case 'EMERGENCY':
        return Eac3BitstreamMode.emergency;
      case 'HEARING_IMPAIRED':
        return Eac3BitstreamMode.hearingImpaired;
      case 'VISUALLY_IMPAIRED':
        return Eac3BitstreamMode.visuallyImpaired;
    }
    throw Exception('$this is not known in enum Eac3BitstreamMode');
  }
}

/// Eac3 Coding Mode
enum Eac3CodingMode {
  codingMode_1_0,
  codingMode_2_0,
  codingMode_3_2,
}

extension on Eac3CodingMode {
  String toValue() {
    switch (this) {
      case Eac3CodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case Eac3CodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
      case Eac3CodingMode.codingMode_3_2:
        return 'CODING_MODE_3_2';
    }
  }
}

extension on String {
  Eac3CodingMode toEac3CodingMode() {
    switch (this) {
      case 'CODING_MODE_1_0':
        return Eac3CodingMode.codingMode_1_0;
      case 'CODING_MODE_2_0':
        return Eac3CodingMode.codingMode_2_0;
      case 'CODING_MODE_3_2':
        return Eac3CodingMode.codingMode_3_2;
    }
    throw Exception('$this is not known in enum Eac3CodingMode');
  }
}

/// Eac3 Dc Filter
enum Eac3DcFilter {
  disabled,
  enabled,
}

extension on Eac3DcFilter {
  String toValue() {
    switch (this) {
      case Eac3DcFilter.disabled:
        return 'DISABLED';
      case Eac3DcFilter.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Eac3DcFilter toEac3DcFilter() {
    switch (this) {
      case 'DISABLED':
        return Eac3DcFilter.disabled;
      case 'ENABLED':
        return Eac3DcFilter.enabled;
    }
    throw Exception('$this is not known in enum Eac3DcFilter');
  }
}

/// Eac3 Drc Line
enum Eac3DrcLine {
  filmLight,
  filmStandard,
  musicLight,
  musicStandard,
  none,
  speech,
}

extension on Eac3DrcLine {
  String toValue() {
    switch (this) {
      case Eac3DrcLine.filmLight:
        return 'FILM_LIGHT';
      case Eac3DrcLine.filmStandard:
        return 'FILM_STANDARD';
      case Eac3DrcLine.musicLight:
        return 'MUSIC_LIGHT';
      case Eac3DrcLine.musicStandard:
        return 'MUSIC_STANDARD';
      case Eac3DrcLine.none:
        return 'NONE';
      case Eac3DrcLine.speech:
        return 'SPEECH';
    }
  }
}

extension on String {
  Eac3DrcLine toEac3DrcLine() {
    switch (this) {
      case 'FILM_LIGHT':
        return Eac3DrcLine.filmLight;
      case 'FILM_STANDARD':
        return Eac3DrcLine.filmStandard;
      case 'MUSIC_LIGHT':
        return Eac3DrcLine.musicLight;
      case 'MUSIC_STANDARD':
        return Eac3DrcLine.musicStandard;
      case 'NONE':
        return Eac3DrcLine.none;
      case 'SPEECH':
        return Eac3DrcLine.speech;
    }
    throw Exception('$this is not known in enum Eac3DrcLine');
  }
}

/// Eac3 Drc Rf
enum Eac3DrcRf {
  filmLight,
  filmStandard,
  musicLight,
  musicStandard,
  none,
  speech,
}

extension on Eac3DrcRf {
  String toValue() {
    switch (this) {
      case Eac3DrcRf.filmLight:
        return 'FILM_LIGHT';
      case Eac3DrcRf.filmStandard:
        return 'FILM_STANDARD';
      case Eac3DrcRf.musicLight:
        return 'MUSIC_LIGHT';
      case Eac3DrcRf.musicStandard:
        return 'MUSIC_STANDARD';
      case Eac3DrcRf.none:
        return 'NONE';
      case Eac3DrcRf.speech:
        return 'SPEECH';
    }
  }
}

extension on String {
  Eac3DrcRf toEac3DrcRf() {
    switch (this) {
      case 'FILM_LIGHT':
        return Eac3DrcRf.filmLight;
      case 'FILM_STANDARD':
        return Eac3DrcRf.filmStandard;
      case 'MUSIC_LIGHT':
        return Eac3DrcRf.musicLight;
      case 'MUSIC_STANDARD':
        return Eac3DrcRf.musicStandard;
      case 'NONE':
        return Eac3DrcRf.none;
      case 'SPEECH':
        return Eac3DrcRf.speech;
    }
    throw Exception('$this is not known in enum Eac3DrcRf');
  }
}

/// Eac3 Lfe Control
enum Eac3LfeControl {
  lfe,
  noLfe,
}

extension on Eac3LfeControl {
  String toValue() {
    switch (this) {
      case Eac3LfeControl.lfe:
        return 'LFE';
      case Eac3LfeControl.noLfe:
        return 'NO_LFE';
    }
  }
}

extension on String {
  Eac3LfeControl toEac3LfeControl() {
    switch (this) {
      case 'LFE':
        return Eac3LfeControl.lfe;
      case 'NO_LFE':
        return Eac3LfeControl.noLfe;
    }
    throw Exception('$this is not known in enum Eac3LfeControl');
  }
}

/// Eac3 Lfe Filter
enum Eac3LfeFilter {
  disabled,
  enabled,
}

extension on Eac3LfeFilter {
  String toValue() {
    switch (this) {
      case Eac3LfeFilter.disabled:
        return 'DISABLED';
      case Eac3LfeFilter.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  Eac3LfeFilter toEac3LfeFilter() {
    switch (this) {
      case 'DISABLED':
        return Eac3LfeFilter.disabled;
      case 'ENABLED':
        return Eac3LfeFilter.enabled;
    }
    throw Exception('$this is not known in enum Eac3LfeFilter');
  }
}

/// Eac3 Metadata Control
enum Eac3MetadataControl {
  followInput,
  useConfigured,
}

extension on Eac3MetadataControl {
  String toValue() {
    switch (this) {
      case Eac3MetadataControl.followInput:
        return 'FOLLOW_INPUT';
      case Eac3MetadataControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  Eac3MetadataControl toEac3MetadataControl() {
    switch (this) {
      case 'FOLLOW_INPUT':
        return Eac3MetadataControl.followInput;
      case 'USE_CONFIGURED':
        return Eac3MetadataControl.useConfigured;
    }
    throw Exception('$this is not known in enum Eac3MetadataControl');
  }
}

/// Eac3 Passthrough Control
enum Eac3PassthroughControl {
  noPassthrough,
  whenPossible,
}

extension on Eac3PassthroughControl {
  String toValue() {
    switch (this) {
      case Eac3PassthroughControl.noPassthrough:
        return 'NO_PASSTHROUGH';
      case Eac3PassthroughControl.whenPossible:
        return 'WHEN_POSSIBLE';
    }
  }
}

extension on String {
  Eac3PassthroughControl toEac3PassthroughControl() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return Eac3PassthroughControl.noPassthrough;
      case 'WHEN_POSSIBLE':
        return Eac3PassthroughControl.whenPossible;
    }
    throw Exception('$this is not known in enum Eac3PassthroughControl');
  }
}

/// Eac3 Phase Control
enum Eac3PhaseControl {
  noShift,
  shift_90Degrees,
}

extension on Eac3PhaseControl {
  String toValue() {
    switch (this) {
      case Eac3PhaseControl.noShift:
        return 'NO_SHIFT';
      case Eac3PhaseControl.shift_90Degrees:
        return 'SHIFT_90_DEGREES';
    }
  }
}

extension on String {
  Eac3PhaseControl toEac3PhaseControl() {
    switch (this) {
      case 'NO_SHIFT':
        return Eac3PhaseControl.noShift;
      case 'SHIFT_90_DEGREES':
        return Eac3PhaseControl.shift_90Degrees;
    }
    throw Exception('$this is not known in enum Eac3PhaseControl');
  }
}

/// Eac3 Settings
class Eac3Settings {
  /// When set to attenuate3Db, applies a 3 dB attenuation to the surround
  /// channels. Only used for 3/2 coding mode.
  final Eac3AttenuationControl? attenuationControl;

  /// Average bitrate in bits/second. Valid bitrates depend on the coding mode.
  final double? bitrate;

  /// Specifies the bitstream mode (bsmod) for the emitted E-AC-3 stream. See ATSC
  /// A/52-2012 (Annex E) for background on these values.
  final Eac3BitstreamMode? bitstreamMode;

  /// Dolby Digital Plus coding mode. Determines number of channels.
  final Eac3CodingMode? codingMode;

  /// When set to enabled, activates a DC highpass filter for all input channels.
  final Eac3DcFilter? dcFilter;

  /// Sets the dialnorm for the output. If blank and input audio is Dolby Digital
  /// Plus, dialnorm will be passed through.
  final int? dialnorm;

  /// Sets the Dolby dynamic range compression profile.
  final Eac3DrcLine? drcLine;

  /// Sets the profile for heavy Dolby dynamic range compression, ensures that the
  /// instantaneous signal peaks do not exceed specified levels.
  final Eac3DrcRf? drcRf;

  /// When encoding 3/2 audio, setting to lfe enables the LFE channel
  final Eac3LfeControl? lfeControl;

  /// When set to enabled, applies a 120Hz lowpass filter to the LFE channel prior
  /// to encoding. Only valid with codingMode32 coding mode.
  final Eac3LfeFilter? lfeFilter;

  /// Left only/Right only center mix level. Only used for 3/2 coding mode.
  final double? loRoCenterMixLevel;

  /// Left only/Right only surround mix level. Only used for 3/2 coding mode.
  final double? loRoSurroundMixLevel;

  /// Left total/Right total center mix level. Only used for 3/2 coding mode.
  final double? ltRtCenterMixLevel;

  /// Left total/Right total surround mix level. Only used for 3/2 coding mode.
  final double? ltRtSurroundMixLevel;

  /// When set to followInput, encoder metadata will be sourced from the DD, DD+,
  /// or DolbyE decoder that supplied this audio data. If audio was not supplied
  /// from one of these streams, then the static metadata settings will be used.
  final Eac3MetadataControl? metadataControl;

  /// When set to whenPossible, input DD+ audio will be passed through if it is
  /// present on the input. This detection is dynamic over the life of the
  /// transcode. Inputs that alternate between DD+ and non-DD+ content will have a
  /// consistent DD+ output as the system alternates between passthrough and
  /// encoding.
  final Eac3PassthroughControl? passthroughControl;

  /// When set to shift90Degrees, applies a 90-degree phase shift to the surround
  /// channels. Only used for 3/2 coding mode.
  final Eac3PhaseControl? phaseControl;

  /// Stereo downmix preference. Only used for 3/2 coding mode.
  final Eac3StereoDownmix? stereoDownmix;

  /// When encoding 3/2 audio, sets whether an extra center back surround channel
  /// is matrix encoded into the left and right surround channels.
  final Eac3SurroundExMode? surroundExMode;

  /// When encoding 2/0 audio, sets whether Dolby Surround is matrix encoded into
  /// the two channels.
  final Eac3SurroundMode? surroundMode;

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

  factory Eac3Settings.fromJson(Map<String, dynamic> json) {
    return Eac3Settings(
      attenuationControl:
          (json['attenuationControl'] as String?)?.toEac3AttenuationControl(),
      bitrate: json['bitrate'] as double?,
      bitstreamMode: (json['bitstreamMode'] as String?)?.toEac3BitstreamMode(),
      codingMode: (json['codingMode'] as String?)?.toEac3CodingMode(),
      dcFilter: (json['dcFilter'] as String?)?.toEac3DcFilter(),
      dialnorm: json['dialnorm'] as int?,
      drcLine: (json['drcLine'] as String?)?.toEac3DrcLine(),
      drcRf: (json['drcRf'] as String?)?.toEac3DrcRf(),
      lfeControl: (json['lfeControl'] as String?)?.toEac3LfeControl(),
      lfeFilter: (json['lfeFilter'] as String?)?.toEac3LfeFilter(),
      loRoCenterMixLevel: json['loRoCenterMixLevel'] as double?,
      loRoSurroundMixLevel: json['loRoSurroundMixLevel'] as double?,
      ltRtCenterMixLevel: json['ltRtCenterMixLevel'] as double?,
      ltRtSurroundMixLevel: json['ltRtSurroundMixLevel'] as double?,
      metadataControl:
          (json['metadataControl'] as String?)?.toEac3MetadataControl(),
      passthroughControl:
          (json['passthroughControl'] as String?)?.toEac3PassthroughControl(),
      phaseControl: (json['phaseControl'] as String?)?.toEac3PhaseControl(),
      stereoDownmix: (json['stereoDownmix'] as String?)?.toEac3StereoDownmix(),
      surroundExMode:
          (json['surroundExMode'] as String?)?.toEac3SurroundExMode(),
      surroundMode: (json['surroundMode'] as String?)?.toEac3SurroundMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final attenuationControl = this.attenuationControl;
    final bitrate = this.bitrate;
    final bitstreamMode = this.bitstreamMode;
    final codingMode = this.codingMode;
    final dcFilter = this.dcFilter;
    final dialnorm = this.dialnorm;
    final drcLine = this.drcLine;
    final drcRf = this.drcRf;
    final lfeControl = this.lfeControl;
    final lfeFilter = this.lfeFilter;
    final loRoCenterMixLevel = this.loRoCenterMixLevel;
    final loRoSurroundMixLevel = this.loRoSurroundMixLevel;
    final ltRtCenterMixLevel = this.ltRtCenterMixLevel;
    final ltRtSurroundMixLevel = this.ltRtSurroundMixLevel;
    final metadataControl = this.metadataControl;
    final passthroughControl = this.passthroughControl;
    final phaseControl = this.phaseControl;
    final stereoDownmix = this.stereoDownmix;
    final surroundExMode = this.surroundExMode;
    final surroundMode = this.surroundMode;
    return {
      if (attenuationControl != null)
        'attenuationControl': attenuationControl.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (bitstreamMode != null) 'bitstreamMode': bitstreamMode.toValue(),
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (dcFilter != null) 'dcFilter': dcFilter.toValue(),
      if (dialnorm != null) 'dialnorm': dialnorm,
      if (drcLine != null) 'drcLine': drcLine.toValue(),
      if (drcRf != null) 'drcRf': drcRf.toValue(),
      if (lfeControl != null) 'lfeControl': lfeControl.toValue(),
      if (lfeFilter != null) 'lfeFilter': lfeFilter.toValue(),
      if (loRoCenterMixLevel != null) 'loRoCenterMixLevel': loRoCenterMixLevel,
      if (loRoSurroundMixLevel != null)
        'loRoSurroundMixLevel': loRoSurroundMixLevel,
      if (ltRtCenterMixLevel != null) 'ltRtCenterMixLevel': ltRtCenterMixLevel,
      if (ltRtSurroundMixLevel != null)
        'ltRtSurroundMixLevel': ltRtSurroundMixLevel,
      if (metadataControl != null) 'metadataControl': metadataControl.toValue(),
      if (passthroughControl != null)
        'passthroughControl': passthroughControl.toValue(),
      if (phaseControl != null) 'phaseControl': phaseControl.toValue(),
      if (stereoDownmix != null) 'stereoDownmix': stereoDownmix.toValue(),
      if (surroundExMode != null) 'surroundExMode': surroundExMode.toValue(),
      if (surroundMode != null) 'surroundMode': surroundMode.toValue(),
    };
  }
}

/// Eac3 Stereo Downmix
enum Eac3StereoDownmix {
  dpl2,
  loRo,
  ltRt,
  notIndicated,
}

extension on Eac3StereoDownmix {
  String toValue() {
    switch (this) {
      case Eac3StereoDownmix.dpl2:
        return 'DPL2';
      case Eac3StereoDownmix.loRo:
        return 'LO_RO';
      case Eac3StereoDownmix.ltRt:
        return 'LT_RT';
      case Eac3StereoDownmix.notIndicated:
        return 'NOT_INDICATED';
    }
  }
}

extension on String {
  Eac3StereoDownmix toEac3StereoDownmix() {
    switch (this) {
      case 'DPL2':
        return Eac3StereoDownmix.dpl2;
      case 'LO_RO':
        return Eac3StereoDownmix.loRo;
      case 'LT_RT':
        return Eac3StereoDownmix.ltRt;
      case 'NOT_INDICATED':
        return Eac3StereoDownmix.notIndicated;
    }
    throw Exception('$this is not known in enum Eac3StereoDownmix');
  }
}

/// Eac3 Surround Ex Mode
enum Eac3SurroundExMode {
  disabled,
  enabled,
  notIndicated,
}

extension on Eac3SurroundExMode {
  String toValue() {
    switch (this) {
      case Eac3SurroundExMode.disabled:
        return 'DISABLED';
      case Eac3SurroundExMode.enabled:
        return 'ENABLED';
      case Eac3SurroundExMode.notIndicated:
        return 'NOT_INDICATED';
    }
  }
}

extension on String {
  Eac3SurroundExMode toEac3SurroundExMode() {
    switch (this) {
      case 'DISABLED':
        return Eac3SurroundExMode.disabled;
      case 'ENABLED':
        return Eac3SurroundExMode.enabled;
      case 'NOT_INDICATED':
        return Eac3SurroundExMode.notIndicated;
    }
    throw Exception('$this is not known in enum Eac3SurroundExMode');
  }
}

/// Eac3 Surround Mode
enum Eac3SurroundMode {
  disabled,
  enabled,
  notIndicated,
}

extension on Eac3SurroundMode {
  String toValue() {
    switch (this) {
      case Eac3SurroundMode.disabled:
        return 'DISABLED';
      case Eac3SurroundMode.enabled:
        return 'ENABLED';
      case Eac3SurroundMode.notIndicated:
        return 'NOT_INDICATED';
    }
  }
}

extension on String {
  Eac3SurroundMode toEac3SurroundMode() {
    switch (this) {
      case 'DISABLED':
        return Eac3SurroundMode.disabled;
      case 'ENABLED':
        return Eac3SurroundMode.enabled;
      case 'NOT_INDICATED':
        return Eac3SurroundMode.notIndicated;
    }
    throw Exception('$this is not known in enum Eac3SurroundMode');
  }
}

/// Ebu Tt DDestination Settings
class EbuTtDDestinationSettings {
  /// Applies only if you plan to convert these source captions to EBU-TT-D or
  /// TTML in an output. Complete this field if you want to include the name of
  /// the copyright holder in the copyright metadata tag in the TTML
  final String? copyrightHolder;

  /// Specifies how to handle the gap between the lines (in multi-line captions).
  ///
  /// - enabled: Fill with the captions background color (as specified in the
  /// input captions).
  /// - disabled: Leave the gap unfilled.
  final EbuTtDFillLineGapControl? fillLineGap;

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
  final String? fontFamily;

  /// Specifies the style information (font color, font position, and so on) to
  /// include in the font data that is attached to the EBU-TT captions.
  ///
  /// - include: Take the style information (font color, font position, and so on)
  /// from the source captions and include that information in the font data
  /// attached to the EBU-TT captions. This option is valid only if the source
  /// captions are Embedded or Teletext.
  /// - exclude: In the font data attached to the EBU-TT captions, set the font
  /// family to "monospaced". Do not include any other style information.
  final EbuTtDDestinationStyleControl? styleControl;

  EbuTtDDestinationSettings({
    this.copyrightHolder,
    this.fillLineGap,
    this.fontFamily,
    this.styleControl,
  });

  factory EbuTtDDestinationSettings.fromJson(Map<String, dynamic> json) {
    return EbuTtDDestinationSettings(
      copyrightHolder: json['copyrightHolder'] as String?,
      fillLineGap:
          (json['fillLineGap'] as String?)?.toEbuTtDFillLineGapControl(),
      fontFamily: json['fontFamily'] as String?,
      styleControl:
          (json['styleControl'] as String?)?.toEbuTtDDestinationStyleControl(),
    );
  }

  Map<String, dynamic> toJson() {
    final copyrightHolder = this.copyrightHolder;
    final fillLineGap = this.fillLineGap;
    final fontFamily = this.fontFamily;
    final styleControl = this.styleControl;
    return {
      if (copyrightHolder != null) 'copyrightHolder': copyrightHolder,
      if (fillLineGap != null) 'fillLineGap': fillLineGap.toValue(),
      if (fontFamily != null) 'fontFamily': fontFamily,
      if (styleControl != null) 'styleControl': styleControl.toValue(),
    };
  }
}

/// Ebu Tt DDestination Style Control
enum EbuTtDDestinationStyleControl {
  exclude,
  include,
}

extension on EbuTtDDestinationStyleControl {
  String toValue() {
    switch (this) {
      case EbuTtDDestinationStyleControl.exclude:
        return 'EXCLUDE';
      case EbuTtDDestinationStyleControl.include:
        return 'INCLUDE';
    }
  }
}

extension on String {
  EbuTtDDestinationStyleControl toEbuTtDDestinationStyleControl() {
    switch (this) {
      case 'EXCLUDE':
        return EbuTtDDestinationStyleControl.exclude;
      case 'INCLUDE':
        return EbuTtDDestinationStyleControl.include;
    }
    throw Exception('$this is not known in enum EbuTtDDestinationStyleControl');
  }
}

/// Ebu Tt DFill Line Gap Control
enum EbuTtDFillLineGapControl {
  disabled,
  enabled,
}

extension on EbuTtDFillLineGapControl {
  String toValue() {
    switch (this) {
      case EbuTtDFillLineGapControl.disabled:
        return 'DISABLED';
      case EbuTtDFillLineGapControl.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  EbuTtDFillLineGapControl toEbuTtDFillLineGapControl() {
    switch (this) {
      case 'DISABLED':
        return EbuTtDFillLineGapControl.disabled;
      case 'ENABLED':
        return EbuTtDFillLineGapControl.enabled;
    }
    throw Exception('$this is not known in enum EbuTtDFillLineGapControl');
  }
}

/// Embedded Convert608 To708
enum EmbeddedConvert608To708 {
  disabled,
  upconvert,
}

extension on EmbeddedConvert608To708 {
  String toValue() {
    switch (this) {
      case EmbeddedConvert608To708.disabled:
        return 'DISABLED';
      case EmbeddedConvert608To708.upconvert:
        return 'UPCONVERT';
    }
  }
}

extension on String {
  EmbeddedConvert608To708 toEmbeddedConvert608To708() {
    switch (this) {
      case 'DISABLED':
        return EmbeddedConvert608To708.disabled;
      case 'UPCONVERT':
        return EmbeddedConvert608To708.upconvert;
    }
    throw Exception('$this is not known in enum EmbeddedConvert608To708');
  }
}

/// Embedded Destination Settings
class EmbeddedDestinationSettings {
  EmbeddedDestinationSettings();

  factory EmbeddedDestinationSettings.fromJson(Map<String, dynamic> _) {
    return EmbeddedDestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Embedded Plus Scte20 Destination Settings
class EmbeddedPlusScte20DestinationSettings {
  EmbeddedPlusScte20DestinationSettings();

  factory EmbeddedPlusScte20DestinationSettings.fromJson(
      Map<String, dynamic> _) {
    return EmbeddedPlusScte20DestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Embedded Scte20 Detection
enum EmbeddedScte20Detection {
  auto,
  off,
}

extension on EmbeddedScte20Detection {
  String toValue() {
    switch (this) {
      case EmbeddedScte20Detection.auto:
        return 'AUTO';
      case EmbeddedScte20Detection.off:
        return 'OFF';
    }
  }
}

extension on String {
  EmbeddedScte20Detection toEmbeddedScte20Detection() {
    switch (this) {
      case 'AUTO':
        return EmbeddedScte20Detection.auto;
      case 'OFF':
        return EmbeddedScte20Detection.off;
    }
    throw Exception('$this is not known in enum EmbeddedScte20Detection');
  }
}

/// Embedded Source Settings
class EmbeddedSourceSettings {
  /// If upconvert, 608 data is both passed through via the "608 compatibility
  /// bytes" fields of the 708 wrapper as well as translated into 708. 708 data
  /// present in the source content will be discarded.
  final EmbeddedConvert608To708? convert608To708;

  /// Set to "auto" to handle streams with intermittent and/or non-aligned SCTE-20
  /// and Embedded captions.
  final EmbeddedScte20Detection? scte20Detection;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  final int? source608ChannelNumber;

  /// This field is unused and deprecated.
  final int? source608TrackNumber;

  EmbeddedSourceSettings({
    this.convert608To708,
    this.scte20Detection,
    this.source608ChannelNumber,
    this.source608TrackNumber,
  });

  factory EmbeddedSourceSettings.fromJson(Map<String, dynamic> json) {
    return EmbeddedSourceSettings(
      convert608To708:
          (json['convert608To708'] as String?)?.toEmbeddedConvert608To708(),
      scte20Detection:
          (json['scte20Detection'] as String?)?.toEmbeddedScte20Detection(),
      source608ChannelNumber: json['source608ChannelNumber'] as int?,
      source608TrackNumber: json['source608TrackNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final convert608To708 = this.convert608To708;
    final scte20Detection = this.scte20Detection;
    final source608ChannelNumber = this.source608ChannelNumber;
    final source608TrackNumber = this.source608TrackNumber;
    return {
      if (convert608To708 != null) 'convert608To708': convert608To708.toValue(),
      if (scte20Detection != null) 'scte20Detection': scte20Detection.toValue(),
      if (source608ChannelNumber != null)
        'source608ChannelNumber': source608ChannelNumber,
      if (source608TrackNumber != null)
        'source608TrackNumber': source608TrackNumber,
    };
  }
}

/// Encoder Settings
class EncoderSettings {
  final List<AudioDescription> audioDescriptions;
  final List<OutputGroup> outputGroups;

  /// Contains settings used to acquire and adjust timecode information from
  /// inputs.
  final TimecodeConfig timecodeConfig;
  final List<VideoDescription> videoDescriptions;

  /// Settings for ad avail blanking.
  final AvailBlanking? availBlanking;

  /// Event-wide configuration settings for ad avail insertion.
  final AvailConfiguration? availConfiguration;

  /// Settings for blackout slate.
  final BlackoutSlate? blackoutSlate;

  /// Settings for caption decriptions
  final List<CaptionDescription>? captionDescriptions;

  /// Feature Activations
  final FeatureActivations? featureActivations;

  /// Configuration settings that apply to the event as a whole.
  final GlobalConfiguration? globalConfiguration;

  /// Settings for motion graphics.
  final MotionGraphicsConfiguration? motionGraphicsConfiguration;

  /// Nielsen configuration settings.
  final NielsenConfiguration? nielsenConfiguration;

  EncoderSettings({
    required this.audioDescriptions,
    required this.outputGroups,
    required this.timecodeConfig,
    required this.videoDescriptions,
    this.availBlanking,
    this.availConfiguration,
    this.blackoutSlate,
    this.captionDescriptions,
    this.featureActivations,
    this.globalConfiguration,
    this.motionGraphicsConfiguration,
    this.nielsenConfiguration,
  });

  factory EncoderSettings.fromJson(Map<String, dynamic> json) {
    return EncoderSettings(
      audioDescriptions: (json['audioDescriptions'] as List)
          .whereNotNull()
          .map((e) => AudioDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputGroups: (json['outputGroups'] as List)
          .whereNotNull()
          .map((e) => OutputGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      timecodeConfig: TimecodeConfig.fromJson(
          json['timecodeConfig'] as Map<String, dynamic>),
      videoDescriptions: (json['videoDescriptions'] as List)
          .whereNotNull()
          .map((e) => VideoDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      availBlanking: json['availBlanking'] != null
          ? AvailBlanking.fromJson(
              json['availBlanking'] as Map<String, dynamic>)
          : null,
      availConfiguration: json['availConfiguration'] != null
          ? AvailConfiguration.fromJson(
              json['availConfiguration'] as Map<String, dynamic>)
          : null,
      blackoutSlate: json['blackoutSlate'] != null
          ? BlackoutSlate.fromJson(
              json['blackoutSlate'] as Map<String, dynamic>)
          : null,
      captionDescriptions: (json['captionDescriptions'] as List?)
          ?.whereNotNull()
          .map((e) => CaptionDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      featureActivations: json['featureActivations'] != null
          ? FeatureActivations.fromJson(
              json['featureActivations'] as Map<String, dynamic>)
          : null,
      globalConfiguration: json['globalConfiguration'] != null
          ? GlobalConfiguration.fromJson(
              json['globalConfiguration'] as Map<String, dynamic>)
          : null,
      motionGraphicsConfiguration: json['motionGraphicsConfiguration'] != null
          ? MotionGraphicsConfiguration.fromJson(
              json['motionGraphicsConfiguration'] as Map<String, dynamic>)
          : null,
      nielsenConfiguration: json['nielsenConfiguration'] != null
          ? NielsenConfiguration.fromJson(
              json['nielsenConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioDescriptions = this.audioDescriptions;
    final outputGroups = this.outputGroups;
    final timecodeConfig = this.timecodeConfig;
    final videoDescriptions = this.videoDescriptions;
    final availBlanking = this.availBlanking;
    final availConfiguration = this.availConfiguration;
    final blackoutSlate = this.blackoutSlate;
    final captionDescriptions = this.captionDescriptions;
    final featureActivations = this.featureActivations;
    final globalConfiguration = this.globalConfiguration;
    final motionGraphicsConfiguration = this.motionGraphicsConfiguration;
    final nielsenConfiguration = this.nielsenConfiguration;
    return {
      'audioDescriptions': audioDescriptions,
      'outputGroups': outputGroups,
      'timecodeConfig': timecodeConfig,
      'videoDescriptions': videoDescriptions,
      if (availBlanking != null) 'availBlanking': availBlanking,
      if (availConfiguration != null) 'availConfiguration': availConfiguration,
      if (blackoutSlate != null) 'blackoutSlate': blackoutSlate,
      if (captionDescriptions != null)
        'captionDescriptions': captionDescriptions,
      if (featureActivations != null) 'featureActivations': featureActivations,
      if (globalConfiguration != null)
        'globalConfiguration': globalConfiguration,
      if (motionGraphicsConfiguration != null)
        'motionGraphicsConfiguration': motionGraphicsConfiguration,
      if (nielsenConfiguration != null)
        'nielsenConfiguration': nielsenConfiguration,
    };
  }
}

/// Failover Condition settings. There can be multiple failover conditions
/// inside AutomaticInputFailoverSettings.
class FailoverCondition {
  /// Failover condition type-specific settings.
  final FailoverConditionSettings? failoverConditionSettings;

  FailoverCondition({
    this.failoverConditionSettings,
  });

  factory FailoverCondition.fromJson(Map<String, dynamic> json) {
    return FailoverCondition(
      failoverConditionSettings: json['failoverConditionSettings'] != null
          ? FailoverConditionSettings.fromJson(
              json['failoverConditionSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failoverConditionSettings = this.failoverConditionSettings;
    return {
      if (failoverConditionSettings != null)
        'failoverConditionSettings': failoverConditionSettings,
    };
  }
}

/// Settings for one failover condition.
class FailoverConditionSettings {
  /// MediaLive will perform a failover if the specified audio selector is silent
  /// for the specified period.
  final AudioSilenceFailoverSettings? audioSilenceSettings;

  /// MediaLive will perform a failover if content is not detected in this input
  /// for the specified period.
  final InputLossFailoverSettings? inputLossSettings;

  /// MediaLive will perform a failover if content is considered black for the
  /// specified period.
  final VideoBlackFailoverSettings? videoBlackSettings;

  FailoverConditionSettings({
    this.audioSilenceSettings,
    this.inputLossSettings,
    this.videoBlackSettings,
  });

  factory FailoverConditionSettings.fromJson(Map<String, dynamic> json) {
    return FailoverConditionSettings(
      audioSilenceSettings: json['audioSilenceSettings'] != null
          ? AudioSilenceFailoverSettings.fromJson(
              json['audioSilenceSettings'] as Map<String, dynamic>)
          : null,
      inputLossSettings: json['inputLossSettings'] != null
          ? InputLossFailoverSettings.fromJson(
              json['inputLossSettings'] as Map<String, dynamic>)
          : null,
      videoBlackSettings: json['videoBlackSettings'] != null
          ? VideoBlackFailoverSettings.fromJson(
              json['videoBlackSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioSilenceSettings = this.audioSilenceSettings;
    final inputLossSettings = this.inputLossSettings;
    final videoBlackSettings = this.videoBlackSettings;
    return {
      if (audioSilenceSettings != null)
        'audioSilenceSettings': audioSilenceSettings,
      if (inputLossSettings != null) 'inputLossSettings': inputLossSettings,
      if (videoBlackSettings != null) 'videoBlackSettings': videoBlackSettings,
    };
  }
}

/// Feature Activations
class FeatureActivations {
  /// Enables the Input Prepare feature. You can create Input Prepare actions in
  /// the schedule only if this feature is enabled.
  /// If you disable the feature on an existing schedule, make sure that you first
  /// delete all input prepare actions from the schedule.
  final FeatureActivationsInputPrepareScheduleActions?
      inputPrepareScheduleActions;

  FeatureActivations({
    this.inputPrepareScheduleActions,
  });

  factory FeatureActivations.fromJson(Map<String, dynamic> json) {
    return FeatureActivations(
      inputPrepareScheduleActions:
          (json['inputPrepareScheduleActions'] as String?)
              ?.toFeatureActivationsInputPrepareScheduleActions(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputPrepareScheduleActions = this.inputPrepareScheduleActions;
    return {
      if (inputPrepareScheduleActions != null)
        'inputPrepareScheduleActions': inputPrepareScheduleActions.toValue(),
    };
  }
}

/// Feature Activations Input Prepare Schedule Actions
enum FeatureActivationsInputPrepareScheduleActions {
  disabled,
  enabled,
}

extension on FeatureActivationsInputPrepareScheduleActions {
  String toValue() {
    switch (this) {
      case FeatureActivationsInputPrepareScheduleActions.disabled:
        return 'DISABLED';
      case FeatureActivationsInputPrepareScheduleActions.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  FeatureActivationsInputPrepareScheduleActions
      toFeatureActivationsInputPrepareScheduleActions() {
    switch (this) {
      case 'DISABLED':
        return FeatureActivationsInputPrepareScheduleActions.disabled;
      case 'ENABLED':
        return FeatureActivationsInputPrepareScheduleActions.enabled;
    }
    throw Exception(
        '$this is not known in enum FeatureActivationsInputPrepareScheduleActions');
  }
}

/// Fec Output Include Fec
enum FecOutputIncludeFec {
  column,
  columnAndRow,
}

extension on FecOutputIncludeFec {
  String toValue() {
    switch (this) {
      case FecOutputIncludeFec.column:
        return 'COLUMN';
      case FecOutputIncludeFec.columnAndRow:
        return 'COLUMN_AND_ROW';
    }
  }
}

extension on String {
  FecOutputIncludeFec toFecOutputIncludeFec() {
    switch (this) {
      case 'COLUMN':
        return FecOutputIncludeFec.column;
      case 'COLUMN_AND_ROW':
        return FecOutputIncludeFec.columnAndRow;
    }
    throw Exception('$this is not known in enum FecOutputIncludeFec');
  }
}

/// Fec Output Settings
class FecOutputSettings {
  /// Parameter D from SMPTE 2022-1. The height of the FEC protection matrix.  The
  /// number of transport stream packets per column error correction packet. Must
  /// be between 4 and 20, inclusive.
  final int? columnDepth;

  /// Enables column only or column and row based FEC
  final FecOutputIncludeFec? includeFec;

  /// Parameter L from SMPTE 2022-1. The width of the FEC protection matrix.  Must
  /// be between 1 and 20, inclusive. If only Column FEC is used, then larger
  /// values increase robustness.  If Row FEC is used, then this is the number of
  /// transport stream packets per row error correction packet, and the value must
  /// be between 4 and 20, inclusive, if includeFec is columnAndRow. If includeFec
  /// is column, this value must be 1 to 20, inclusive.
  final int? rowLength;

  FecOutputSettings({
    this.columnDepth,
    this.includeFec,
    this.rowLength,
  });

  factory FecOutputSettings.fromJson(Map<String, dynamic> json) {
    return FecOutputSettings(
      columnDepth: json['columnDepth'] as int?,
      includeFec: (json['includeFec'] as String?)?.toFecOutputIncludeFec(),
      rowLength: json['rowLength'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnDepth = this.columnDepth;
    final includeFec = this.includeFec;
    final rowLength = this.rowLength;
    return {
      if (columnDepth != null) 'columnDepth': columnDepth,
      if (includeFec != null) 'includeFec': includeFec.toValue(),
      if (rowLength != null) 'rowLength': rowLength,
    };
  }
}

/// Fixed Afd
enum FixedAfd {
  afd_0000,
  afd_0010,
  afd_0011,
  afd_0100,
  afd_1000,
  afd_1001,
  afd_1010,
  afd_1011,
  afd_1101,
  afd_1110,
  afd_1111,
}

extension on FixedAfd {
  String toValue() {
    switch (this) {
      case FixedAfd.afd_0000:
        return 'AFD_0000';
      case FixedAfd.afd_0010:
        return 'AFD_0010';
      case FixedAfd.afd_0011:
        return 'AFD_0011';
      case FixedAfd.afd_0100:
        return 'AFD_0100';
      case FixedAfd.afd_1000:
        return 'AFD_1000';
      case FixedAfd.afd_1001:
        return 'AFD_1001';
      case FixedAfd.afd_1010:
        return 'AFD_1010';
      case FixedAfd.afd_1011:
        return 'AFD_1011';
      case FixedAfd.afd_1101:
        return 'AFD_1101';
      case FixedAfd.afd_1110:
        return 'AFD_1110';
      case FixedAfd.afd_1111:
        return 'AFD_1111';
    }
  }
}

extension on String {
  FixedAfd toFixedAfd() {
    switch (this) {
      case 'AFD_0000':
        return FixedAfd.afd_0000;
      case 'AFD_0010':
        return FixedAfd.afd_0010;
      case 'AFD_0011':
        return FixedAfd.afd_0011;
      case 'AFD_0100':
        return FixedAfd.afd_0100;
      case 'AFD_1000':
        return FixedAfd.afd_1000;
      case 'AFD_1001':
        return FixedAfd.afd_1001;
      case 'AFD_1010':
        return FixedAfd.afd_1010;
      case 'AFD_1011':
        return FixedAfd.afd_1011;
      case 'AFD_1101':
        return FixedAfd.afd_1101;
      case 'AFD_1110':
        return FixedAfd.afd_1110;
      case 'AFD_1111':
        return FixedAfd.afd_1111;
    }
    throw Exception('$this is not known in enum FixedAfd');
  }
}

/// Start time for the action.
class FixedModeScheduleActionStartSettings {
  /// Start time for the action to start in the channel. (Not the time for the
  /// action to be added to the schedule: actions are always added to the schedule
  /// immediately.) UTC format: yyyy-mm-ddThh:mm:ss.nnnZ. All the letters are
  /// digits (for example, mm might be 01) except for the two constants "T" for
  /// time and "Z" for "UTC format".
  final String time;

  FixedModeScheduleActionStartSettings({
    required this.time,
  });

  factory FixedModeScheduleActionStartSettings.fromJson(
      Map<String, dynamic> json) {
    return FixedModeScheduleActionStartSettings(
      time: json['time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final time = this.time;
    return {
      'time': time,
    };
  }
}

/// Fmp4 Hls Settings
class Fmp4HlsSettings {
  /// List all the audio groups that are used with the video output stream. Input
  /// all the audio GROUP-IDs that are associated to the video, separate by ','.
  final String? audioRenditionSets;

  /// If set to passthrough, Nielsen inaudible tones for media tracking will be
  /// detected in the input audio and an equivalent ID3 tag will be inserted in
  /// the output.
  final Fmp4NielsenId3Behavior? nielsenId3Behavior;

  /// When set to passthrough, timed metadata is passed through from input to
  /// output.
  final Fmp4TimedMetadataBehavior? timedMetadataBehavior;

  Fmp4HlsSettings({
    this.audioRenditionSets,
    this.nielsenId3Behavior,
    this.timedMetadataBehavior,
  });

  factory Fmp4HlsSettings.fromJson(Map<String, dynamic> json) {
    return Fmp4HlsSettings(
      audioRenditionSets: json['audioRenditionSets'] as String?,
      nielsenId3Behavior:
          (json['nielsenId3Behavior'] as String?)?.toFmp4NielsenId3Behavior(),
      timedMetadataBehavior: (json['timedMetadataBehavior'] as String?)
          ?.toFmp4TimedMetadataBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioRenditionSets = this.audioRenditionSets;
    final nielsenId3Behavior = this.nielsenId3Behavior;
    final timedMetadataBehavior = this.timedMetadataBehavior;
    return {
      if (audioRenditionSets != null) 'audioRenditionSets': audioRenditionSets,
      if (nielsenId3Behavior != null)
        'nielsenId3Behavior': nielsenId3Behavior.toValue(),
      if (timedMetadataBehavior != null)
        'timedMetadataBehavior': timedMetadataBehavior.toValue(),
    };
  }
}

/// Fmp4 Nielsen Id3 Behavior
enum Fmp4NielsenId3Behavior {
  noPassthrough,
  passthrough,
}

extension on Fmp4NielsenId3Behavior {
  String toValue() {
    switch (this) {
      case Fmp4NielsenId3Behavior.noPassthrough:
        return 'NO_PASSTHROUGH';
      case Fmp4NielsenId3Behavior.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  Fmp4NielsenId3Behavior toFmp4NielsenId3Behavior() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return Fmp4NielsenId3Behavior.noPassthrough;
      case 'PASSTHROUGH':
        return Fmp4NielsenId3Behavior.passthrough;
    }
    throw Exception('$this is not known in enum Fmp4NielsenId3Behavior');
  }
}

/// Fmp4 Timed Metadata Behavior
enum Fmp4TimedMetadataBehavior {
  noPassthrough,
  passthrough,
}

extension on Fmp4TimedMetadataBehavior {
  String toValue() {
    switch (this) {
      case Fmp4TimedMetadataBehavior.noPassthrough:
        return 'NO_PASSTHROUGH';
      case Fmp4TimedMetadataBehavior.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  Fmp4TimedMetadataBehavior toFmp4TimedMetadataBehavior() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return Fmp4TimedMetadataBehavior.noPassthrough;
      case 'PASSTHROUGH':
        return Fmp4TimedMetadataBehavior.passthrough;
    }
    throw Exception('$this is not known in enum Fmp4TimedMetadataBehavior');
  }
}

/// Settings to specify if an action follows another.
class FollowModeScheduleActionStartSettings {
  /// Identifies whether this action starts relative to the start or relative to
  /// the end of the reference action.
  final FollowPoint followPoint;

  /// The action name of another action that this one refers to.
  final String referenceActionName;

  FollowModeScheduleActionStartSettings({
    required this.followPoint,
    required this.referenceActionName,
  });

  factory FollowModeScheduleActionStartSettings.fromJson(
      Map<String, dynamic> json) {
    return FollowModeScheduleActionStartSettings(
      followPoint: (json['followPoint'] as String).toFollowPoint(),
      referenceActionName: json['referenceActionName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final followPoint = this.followPoint;
    final referenceActionName = this.referenceActionName;
    return {
      'followPoint': followPoint.toValue(),
      'referenceActionName': referenceActionName,
    };
  }
}

/// Follow reference point.
enum FollowPoint {
  end,
  start,
}

extension on FollowPoint {
  String toValue() {
    switch (this) {
      case FollowPoint.end:
        return 'END';
      case FollowPoint.start:
        return 'START';
    }
  }
}

extension on String {
  FollowPoint toFollowPoint() {
    switch (this) {
      case 'END':
        return FollowPoint.end;
      case 'START':
        return FollowPoint.start;
    }
    throw Exception('$this is not known in enum FollowPoint');
  }
}

/// Frame Capture Cdn Settings
class FrameCaptureCdnSettings {
  final FrameCaptureS3Settings? frameCaptureS3Settings;

  FrameCaptureCdnSettings({
    this.frameCaptureS3Settings,
  });

  factory FrameCaptureCdnSettings.fromJson(Map<String, dynamic> json) {
    return FrameCaptureCdnSettings(
      frameCaptureS3Settings: json['frameCaptureS3Settings'] != null
          ? FrameCaptureS3Settings.fromJson(
              json['frameCaptureS3Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final frameCaptureS3Settings = this.frameCaptureS3Settings;
    return {
      if (frameCaptureS3Settings != null)
        'frameCaptureS3Settings': frameCaptureS3Settings,
    };
  }
}

/// Frame Capture Group Settings
class FrameCaptureGroupSettings {
  /// The destination for the frame capture files. Either the URI for an Amazon S3
  /// bucket and object, plus a file name prefix (for example,
  /// s3ssl://sportsDelivery/highlights/20180820/curling-) or the URI for a
  /// MediaStore container, plus a file name prefix (for example,
  /// mediastoressl://sportsDelivery/20180820/curling-). The final file names
  /// consist of the prefix from the destination field (for example, "curling-") +
  /// name modifier + the counter (5 digits, starting from 00001) + extension
  /// (which is always .jpg).  For example, curling-low.00001.jpg
  final OutputLocationRef destination;

  /// Parameters that control interactions with the CDN.
  final FrameCaptureCdnSettings? frameCaptureCdnSettings;

  FrameCaptureGroupSettings({
    required this.destination,
    this.frameCaptureCdnSettings,
  });

  factory FrameCaptureGroupSettings.fromJson(Map<String, dynamic> json) {
    return FrameCaptureGroupSettings(
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
      frameCaptureCdnSettings: json['frameCaptureCdnSettings'] != null
          ? FrameCaptureCdnSettings.fromJson(
              json['frameCaptureCdnSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final frameCaptureCdnSettings = this.frameCaptureCdnSettings;
    return {
      'destination': destination,
      if (frameCaptureCdnSettings != null)
        'frameCaptureCdnSettings': frameCaptureCdnSettings,
    };
  }
}

/// Frame Capture Hls Settings
class FrameCaptureHlsSettings {
  FrameCaptureHlsSettings();

  factory FrameCaptureHlsSettings.fromJson(Map<String, dynamic> _) {
    return FrameCaptureHlsSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Frame Capture Interval Unit
enum FrameCaptureIntervalUnit {
  milliseconds,
  seconds,
}

extension on FrameCaptureIntervalUnit {
  String toValue() {
    switch (this) {
      case FrameCaptureIntervalUnit.milliseconds:
        return 'MILLISECONDS';
      case FrameCaptureIntervalUnit.seconds:
        return 'SECONDS';
    }
  }
}

extension on String {
  FrameCaptureIntervalUnit toFrameCaptureIntervalUnit() {
    switch (this) {
      case 'MILLISECONDS':
        return FrameCaptureIntervalUnit.milliseconds;
      case 'SECONDS':
        return FrameCaptureIntervalUnit.seconds;
    }
    throw Exception('$this is not known in enum FrameCaptureIntervalUnit');
  }
}

/// Frame Capture Output Settings
class FrameCaptureOutputSettings {
  /// Required if the output group contains more than one output. This modifier
  /// forms part of the output file name.
  final String? nameModifier;

  FrameCaptureOutputSettings({
    this.nameModifier,
  });

  factory FrameCaptureOutputSettings.fromJson(Map<String, dynamic> json) {
    return FrameCaptureOutputSettings(
      nameModifier: json['nameModifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nameModifier = this.nameModifier;
    return {
      if (nameModifier != null) 'nameModifier': nameModifier,
    };
  }
}

/// Frame Capture S3 Settings
class FrameCaptureS3Settings {
  /// Specify the canned ACL to apply to each S3 request. Defaults to none.
  final S3CannedAcl? cannedAcl;

  FrameCaptureS3Settings({
    this.cannedAcl,
  });

  factory FrameCaptureS3Settings.fromJson(Map<String, dynamic> json) {
    return FrameCaptureS3Settings(
      cannedAcl: (json['cannedAcl'] as String?)?.toS3CannedAcl(),
    );
  }

  Map<String, dynamic> toJson() {
    final cannedAcl = this.cannedAcl;
    return {
      if (cannedAcl != null) 'cannedAcl': cannedAcl.toValue(),
    };
  }
}

/// Frame Capture Settings
class FrameCaptureSettings {
  /// The frequency at which to capture frames for inclusion in the output. May be
  /// specified in either seconds or milliseconds, as specified by
  /// captureIntervalUnits.
  final int? captureInterval;

  /// Unit for the frame capture interval.
  final FrameCaptureIntervalUnit? captureIntervalUnits;

  FrameCaptureSettings({
    this.captureInterval,
    this.captureIntervalUnits,
  });

  factory FrameCaptureSettings.fromJson(Map<String, dynamic> json) {
    return FrameCaptureSettings(
      captureInterval: json['captureInterval'] as int?,
      captureIntervalUnits: (json['captureIntervalUnits'] as String?)
          ?.toFrameCaptureIntervalUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final captureInterval = this.captureInterval;
    final captureIntervalUnits = this.captureIntervalUnits;
    return {
      if (captureInterval != null) 'captureInterval': captureInterval,
      if (captureIntervalUnits != null)
        'captureIntervalUnits': captureIntervalUnits.toValue(),
    };
  }
}

/// Global Configuration
class GlobalConfiguration {
  /// Value to set the initial audio gain for the Live Event.
  final int? initialAudioGain;

  /// Indicates the action to take when the current input completes (e.g.
  /// end-of-file). When switchAndLoopInputs is configured the encoder will
  /// restart at the beginning of the first input.  When "none" is configured the
  /// encoder will transcode either black, a solid color, or a user specified
  /// slate images per the "Input Loss Behavior" configuration until the next
  /// input switch occurs (which is controlled through the Channel Schedule API).
  final GlobalConfigurationInputEndAction? inputEndAction;

  /// Settings for system actions when input is lost.
  final InputLossBehavior? inputLossBehavior;

  /// Indicates how MediaLive pipelines are synchronized.
  ///
  /// PIPELINE_LOCKING - MediaLive will attempt to synchronize the output of each
  /// pipeline to the other.
  /// EPOCH_LOCKING - MediaLive will attempt to synchronize the output of each
  /// pipeline to the Unix epoch.
  final GlobalConfigurationOutputLockingMode? outputLockingMode;

  /// Indicates whether the rate of frames emitted by the Live encoder should be
  /// paced by its system clock (which optionally may be locked to another source
  /// via NTP) or should be locked to the clock of the source that is providing
  /// the input stream.
  final GlobalConfigurationOutputTimingSource? outputTimingSource;

  /// Adjusts video input buffer for streams with very low video framerates. This
  /// is commonly set to enabled for music channels with less than one video frame
  /// per second.
  final GlobalConfigurationLowFramerateInputs? supportLowFramerateInputs;

  GlobalConfiguration({
    this.initialAudioGain,
    this.inputEndAction,
    this.inputLossBehavior,
    this.outputLockingMode,
    this.outputTimingSource,
    this.supportLowFramerateInputs,
  });

  factory GlobalConfiguration.fromJson(Map<String, dynamic> json) {
    return GlobalConfiguration(
      initialAudioGain: json['initialAudioGain'] as int?,
      inputEndAction: (json['inputEndAction'] as String?)
          ?.toGlobalConfigurationInputEndAction(),
      inputLossBehavior: json['inputLossBehavior'] != null
          ? InputLossBehavior.fromJson(
              json['inputLossBehavior'] as Map<String, dynamic>)
          : null,
      outputLockingMode: (json['outputLockingMode'] as String?)
          ?.toGlobalConfigurationOutputLockingMode(),
      outputTimingSource: (json['outputTimingSource'] as String?)
          ?.toGlobalConfigurationOutputTimingSource(),
      supportLowFramerateInputs: (json['supportLowFramerateInputs'] as String?)
          ?.toGlobalConfigurationLowFramerateInputs(),
    );
  }

  Map<String, dynamic> toJson() {
    final initialAudioGain = this.initialAudioGain;
    final inputEndAction = this.inputEndAction;
    final inputLossBehavior = this.inputLossBehavior;
    final outputLockingMode = this.outputLockingMode;
    final outputTimingSource = this.outputTimingSource;
    final supportLowFramerateInputs = this.supportLowFramerateInputs;
    return {
      if (initialAudioGain != null) 'initialAudioGain': initialAudioGain,
      if (inputEndAction != null) 'inputEndAction': inputEndAction.toValue(),
      if (inputLossBehavior != null) 'inputLossBehavior': inputLossBehavior,
      if (outputLockingMode != null)
        'outputLockingMode': outputLockingMode.toValue(),
      if (outputTimingSource != null)
        'outputTimingSource': outputTimingSource.toValue(),
      if (supportLowFramerateInputs != null)
        'supportLowFramerateInputs': supportLowFramerateInputs.toValue(),
    };
  }
}

/// Global Configuration Input End Action
enum GlobalConfigurationInputEndAction {
  none,
  switchAndLoopInputs,
}

extension on GlobalConfigurationInputEndAction {
  String toValue() {
    switch (this) {
      case GlobalConfigurationInputEndAction.none:
        return 'NONE';
      case GlobalConfigurationInputEndAction.switchAndLoopInputs:
        return 'SWITCH_AND_LOOP_INPUTS';
    }
  }
}

extension on String {
  GlobalConfigurationInputEndAction toGlobalConfigurationInputEndAction() {
    switch (this) {
      case 'NONE':
        return GlobalConfigurationInputEndAction.none;
      case 'SWITCH_AND_LOOP_INPUTS':
        return GlobalConfigurationInputEndAction.switchAndLoopInputs;
    }
    throw Exception(
        '$this is not known in enum GlobalConfigurationInputEndAction');
  }
}

/// Global Configuration Low Framerate Inputs
enum GlobalConfigurationLowFramerateInputs {
  disabled,
  enabled,
}

extension on GlobalConfigurationLowFramerateInputs {
  String toValue() {
    switch (this) {
      case GlobalConfigurationLowFramerateInputs.disabled:
        return 'DISABLED';
      case GlobalConfigurationLowFramerateInputs.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  GlobalConfigurationLowFramerateInputs
      toGlobalConfigurationLowFramerateInputs() {
    switch (this) {
      case 'DISABLED':
        return GlobalConfigurationLowFramerateInputs.disabled;
      case 'ENABLED':
        return GlobalConfigurationLowFramerateInputs.enabled;
    }
    throw Exception(
        '$this is not known in enum GlobalConfigurationLowFramerateInputs');
  }
}

/// Global Configuration Output Locking Mode
enum GlobalConfigurationOutputLockingMode {
  epochLocking,
  pipelineLocking,
}

extension on GlobalConfigurationOutputLockingMode {
  String toValue() {
    switch (this) {
      case GlobalConfigurationOutputLockingMode.epochLocking:
        return 'EPOCH_LOCKING';
      case GlobalConfigurationOutputLockingMode.pipelineLocking:
        return 'PIPELINE_LOCKING';
    }
  }
}

extension on String {
  GlobalConfigurationOutputLockingMode
      toGlobalConfigurationOutputLockingMode() {
    switch (this) {
      case 'EPOCH_LOCKING':
        return GlobalConfigurationOutputLockingMode.epochLocking;
      case 'PIPELINE_LOCKING':
        return GlobalConfigurationOutputLockingMode.pipelineLocking;
    }
    throw Exception(
        '$this is not known in enum GlobalConfigurationOutputLockingMode');
  }
}

/// Global Configuration Output Timing Source
enum GlobalConfigurationOutputTimingSource {
  inputClock,
  systemClock,
}

extension on GlobalConfigurationOutputTimingSource {
  String toValue() {
    switch (this) {
      case GlobalConfigurationOutputTimingSource.inputClock:
        return 'INPUT_CLOCK';
      case GlobalConfigurationOutputTimingSource.systemClock:
        return 'SYSTEM_CLOCK';
    }
  }
}

extension on String {
  GlobalConfigurationOutputTimingSource
      toGlobalConfigurationOutputTimingSource() {
    switch (this) {
      case 'INPUT_CLOCK':
        return GlobalConfigurationOutputTimingSource.inputClock;
      case 'SYSTEM_CLOCK':
        return GlobalConfigurationOutputTimingSource.systemClock;
    }
    throw Exception(
        '$this is not known in enum GlobalConfigurationOutputTimingSource');
  }
}

/// H264 Adaptive Quantization
enum H264AdaptiveQuantization {
  auto,
  high,
  higher,
  low,
  max,
  medium,
  off,
}

extension on H264AdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H264AdaptiveQuantization.auto:
        return 'AUTO';
      case H264AdaptiveQuantization.high:
        return 'HIGH';
      case H264AdaptiveQuantization.higher:
        return 'HIGHER';
      case H264AdaptiveQuantization.low:
        return 'LOW';
      case H264AdaptiveQuantization.max:
        return 'MAX';
      case H264AdaptiveQuantization.medium:
        return 'MEDIUM';
      case H264AdaptiveQuantization.off:
        return 'OFF';
    }
  }
}

extension on String {
  H264AdaptiveQuantization toH264AdaptiveQuantization() {
    switch (this) {
      case 'AUTO':
        return H264AdaptiveQuantization.auto;
      case 'HIGH':
        return H264AdaptiveQuantization.high;
      case 'HIGHER':
        return H264AdaptiveQuantization.higher;
      case 'LOW':
        return H264AdaptiveQuantization.low;
      case 'MAX':
        return H264AdaptiveQuantization.max;
      case 'MEDIUM':
        return H264AdaptiveQuantization.medium;
      case 'OFF':
        return H264AdaptiveQuantization.off;
    }
    throw Exception('$this is not known in enum H264AdaptiveQuantization');
  }
}

/// H264 Color Metadata
enum H264ColorMetadata {
  ignore,
  insert,
}

extension on H264ColorMetadata {
  String toValue() {
    switch (this) {
      case H264ColorMetadata.ignore:
        return 'IGNORE';
      case H264ColorMetadata.insert:
        return 'INSERT';
    }
  }
}

extension on String {
  H264ColorMetadata toH264ColorMetadata() {
    switch (this) {
      case 'IGNORE':
        return H264ColorMetadata.ignore;
      case 'INSERT':
        return H264ColorMetadata.insert;
    }
    throw Exception('$this is not known in enum H264ColorMetadata');
  }
}

/// H264 Color Space Settings
class H264ColorSpaceSettings {
  final ColorSpacePassthroughSettings? colorSpacePassthroughSettings;
  final Rec601Settings? rec601Settings;
  final Rec709Settings? rec709Settings;

  H264ColorSpaceSettings({
    this.colorSpacePassthroughSettings,
    this.rec601Settings,
    this.rec709Settings,
  });

  factory H264ColorSpaceSettings.fromJson(Map<String, dynamic> json) {
    return H264ColorSpaceSettings(
      colorSpacePassthroughSettings:
          json['colorSpacePassthroughSettings'] != null
              ? ColorSpacePassthroughSettings.fromJson(
                  json['colorSpacePassthroughSettings'] as Map<String, dynamic>)
              : null,
      rec601Settings: json['rec601Settings'] != null
          ? Rec601Settings.fromJson(
              json['rec601Settings'] as Map<String, dynamic>)
          : null,
      rec709Settings: json['rec709Settings'] != null
          ? Rec709Settings.fromJson(
              json['rec709Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final colorSpacePassthroughSettings = this.colorSpacePassthroughSettings;
    final rec601Settings = this.rec601Settings;
    final rec709Settings = this.rec709Settings;
    return {
      if (colorSpacePassthroughSettings != null)
        'colorSpacePassthroughSettings': colorSpacePassthroughSettings,
      if (rec601Settings != null) 'rec601Settings': rec601Settings,
      if (rec709Settings != null) 'rec709Settings': rec709Settings,
    };
  }
}

/// H264 Entropy Encoding
enum H264EntropyEncoding {
  cabac,
  cavlc,
}

extension on H264EntropyEncoding {
  String toValue() {
    switch (this) {
      case H264EntropyEncoding.cabac:
        return 'CABAC';
      case H264EntropyEncoding.cavlc:
        return 'CAVLC';
    }
  }
}

extension on String {
  H264EntropyEncoding toH264EntropyEncoding() {
    switch (this) {
      case 'CABAC':
        return H264EntropyEncoding.cabac;
      case 'CAVLC':
        return H264EntropyEncoding.cavlc;
    }
    throw Exception('$this is not known in enum H264EntropyEncoding');
  }
}

/// H264 Filter Settings
class H264FilterSettings {
  final TemporalFilterSettings? temporalFilterSettings;

  H264FilterSettings({
    this.temporalFilterSettings,
  });

  factory H264FilterSettings.fromJson(Map<String, dynamic> json) {
    return H264FilterSettings(
      temporalFilterSettings: json['temporalFilterSettings'] != null
          ? TemporalFilterSettings.fromJson(
              json['temporalFilterSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final temporalFilterSettings = this.temporalFilterSettings;
    return {
      if (temporalFilterSettings != null)
        'temporalFilterSettings': temporalFilterSettings,
    };
  }
}

/// H264 Flicker Aq
enum H264FlickerAq {
  disabled,
  enabled,
}

extension on H264FlickerAq {
  String toValue() {
    switch (this) {
      case H264FlickerAq.disabled:
        return 'DISABLED';
      case H264FlickerAq.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264FlickerAq toH264FlickerAq() {
    switch (this) {
      case 'DISABLED':
        return H264FlickerAq.disabled;
      case 'ENABLED':
        return H264FlickerAq.enabled;
    }
    throw Exception('$this is not known in enum H264FlickerAq');
  }
}

/// H264 Force Field Pictures
enum H264ForceFieldPictures {
  disabled,
  enabled,
}

extension on H264ForceFieldPictures {
  String toValue() {
    switch (this) {
      case H264ForceFieldPictures.disabled:
        return 'DISABLED';
      case H264ForceFieldPictures.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264ForceFieldPictures toH264ForceFieldPictures() {
    switch (this) {
      case 'DISABLED':
        return H264ForceFieldPictures.disabled;
      case 'ENABLED':
        return H264ForceFieldPictures.enabled;
    }
    throw Exception('$this is not known in enum H264ForceFieldPictures');
  }
}

/// H264 Framerate Control
enum H264FramerateControl {
  initializeFromSource,
  specified,
}

extension on H264FramerateControl {
  String toValue() {
    switch (this) {
      case H264FramerateControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case H264FramerateControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  H264FramerateControl toH264FramerateControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return H264FramerateControl.initializeFromSource;
      case 'SPECIFIED':
        return H264FramerateControl.specified;
    }
    throw Exception('$this is not known in enum H264FramerateControl');
  }
}

/// H264 Gop BReference
enum H264GopBReference {
  disabled,
  enabled,
}

extension on H264GopBReference {
  String toValue() {
    switch (this) {
      case H264GopBReference.disabled:
        return 'DISABLED';
      case H264GopBReference.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264GopBReference toH264GopBReference() {
    switch (this) {
      case 'DISABLED':
        return H264GopBReference.disabled;
      case 'ENABLED':
        return H264GopBReference.enabled;
    }
    throw Exception('$this is not known in enum H264GopBReference');
  }
}

/// H264 Gop Size Units
enum H264GopSizeUnits {
  frames,
  seconds,
}

extension on H264GopSizeUnits {
  String toValue() {
    switch (this) {
      case H264GopSizeUnits.frames:
        return 'FRAMES';
      case H264GopSizeUnits.seconds:
        return 'SECONDS';
    }
  }
}

extension on String {
  H264GopSizeUnits toH264GopSizeUnits() {
    switch (this) {
      case 'FRAMES':
        return H264GopSizeUnits.frames;
      case 'SECONDS':
        return H264GopSizeUnits.seconds;
    }
    throw Exception('$this is not known in enum H264GopSizeUnits');
  }
}

/// H264 Level
enum H264Level {
  h264Level_1,
  h264Level_1_1,
  h264Level_1_2,
  h264Level_1_3,
  h264Level_2,
  h264Level_2_1,
  h264Level_2_2,
  h264Level_3,
  h264Level_3_1,
  h264Level_3_2,
  h264Level_4,
  h264Level_4_1,
  h264Level_4_2,
  h264Level_5,
  h264Level_5_1,
  h264Level_5_2,
  h264LevelAuto,
}

extension on H264Level {
  String toValue() {
    switch (this) {
      case H264Level.h264Level_1:
        return 'H264_LEVEL_1';
      case H264Level.h264Level_1_1:
        return 'H264_LEVEL_1_1';
      case H264Level.h264Level_1_2:
        return 'H264_LEVEL_1_2';
      case H264Level.h264Level_1_3:
        return 'H264_LEVEL_1_3';
      case H264Level.h264Level_2:
        return 'H264_LEVEL_2';
      case H264Level.h264Level_2_1:
        return 'H264_LEVEL_2_1';
      case H264Level.h264Level_2_2:
        return 'H264_LEVEL_2_2';
      case H264Level.h264Level_3:
        return 'H264_LEVEL_3';
      case H264Level.h264Level_3_1:
        return 'H264_LEVEL_3_1';
      case H264Level.h264Level_3_2:
        return 'H264_LEVEL_3_2';
      case H264Level.h264Level_4:
        return 'H264_LEVEL_4';
      case H264Level.h264Level_4_1:
        return 'H264_LEVEL_4_1';
      case H264Level.h264Level_4_2:
        return 'H264_LEVEL_4_2';
      case H264Level.h264Level_5:
        return 'H264_LEVEL_5';
      case H264Level.h264Level_5_1:
        return 'H264_LEVEL_5_1';
      case H264Level.h264Level_5_2:
        return 'H264_LEVEL_5_2';
      case H264Level.h264LevelAuto:
        return 'H264_LEVEL_AUTO';
    }
  }
}

extension on String {
  H264Level toH264Level() {
    switch (this) {
      case 'H264_LEVEL_1':
        return H264Level.h264Level_1;
      case 'H264_LEVEL_1_1':
        return H264Level.h264Level_1_1;
      case 'H264_LEVEL_1_2':
        return H264Level.h264Level_1_2;
      case 'H264_LEVEL_1_3':
        return H264Level.h264Level_1_3;
      case 'H264_LEVEL_2':
        return H264Level.h264Level_2;
      case 'H264_LEVEL_2_1':
        return H264Level.h264Level_2_1;
      case 'H264_LEVEL_2_2':
        return H264Level.h264Level_2_2;
      case 'H264_LEVEL_3':
        return H264Level.h264Level_3;
      case 'H264_LEVEL_3_1':
        return H264Level.h264Level_3_1;
      case 'H264_LEVEL_3_2':
        return H264Level.h264Level_3_2;
      case 'H264_LEVEL_4':
        return H264Level.h264Level_4;
      case 'H264_LEVEL_4_1':
        return H264Level.h264Level_4_1;
      case 'H264_LEVEL_4_2':
        return H264Level.h264Level_4_2;
      case 'H264_LEVEL_5':
        return H264Level.h264Level_5;
      case 'H264_LEVEL_5_1':
        return H264Level.h264Level_5_1;
      case 'H264_LEVEL_5_2':
        return H264Level.h264Level_5_2;
      case 'H264_LEVEL_AUTO':
        return H264Level.h264LevelAuto;
    }
    throw Exception('$this is not known in enum H264Level');
  }
}

/// H264 Look Ahead Rate Control
enum H264LookAheadRateControl {
  high,
  low,
  medium,
}

extension on H264LookAheadRateControl {
  String toValue() {
    switch (this) {
      case H264LookAheadRateControl.high:
        return 'HIGH';
      case H264LookAheadRateControl.low:
        return 'LOW';
      case H264LookAheadRateControl.medium:
        return 'MEDIUM';
    }
  }
}

extension on String {
  H264LookAheadRateControl toH264LookAheadRateControl() {
    switch (this) {
      case 'HIGH':
        return H264LookAheadRateControl.high;
      case 'LOW':
        return H264LookAheadRateControl.low;
      case 'MEDIUM':
        return H264LookAheadRateControl.medium;
    }
    throw Exception('$this is not known in enum H264LookAheadRateControl');
  }
}

/// H264 Par Control
enum H264ParControl {
  initializeFromSource,
  specified,
}

extension on H264ParControl {
  String toValue() {
    switch (this) {
      case H264ParControl.initializeFromSource:
        return 'INITIALIZE_FROM_SOURCE';
      case H264ParControl.specified:
        return 'SPECIFIED';
    }
  }
}

extension on String {
  H264ParControl toH264ParControl() {
    switch (this) {
      case 'INITIALIZE_FROM_SOURCE':
        return H264ParControl.initializeFromSource;
      case 'SPECIFIED':
        return H264ParControl.specified;
    }
    throw Exception('$this is not known in enum H264ParControl');
  }
}

/// H264 Profile
enum H264Profile {
  baseline,
  high,
  high_10bit,
  high_422,
  high_422_10bit,
  main,
}

extension on H264Profile {
  String toValue() {
    switch (this) {
      case H264Profile.baseline:
        return 'BASELINE';
      case H264Profile.high:
        return 'HIGH';
      case H264Profile.high_10bit:
        return 'HIGH_10BIT';
      case H264Profile.high_422:
        return 'HIGH_422';
      case H264Profile.high_422_10bit:
        return 'HIGH_422_10BIT';
      case H264Profile.main:
        return 'MAIN';
    }
  }
}

extension on String {
  H264Profile toH264Profile() {
    switch (this) {
      case 'BASELINE':
        return H264Profile.baseline;
      case 'HIGH':
        return H264Profile.high;
      case 'HIGH_10BIT':
        return H264Profile.high_10bit;
      case 'HIGH_422':
        return H264Profile.high_422;
      case 'HIGH_422_10BIT':
        return H264Profile.high_422_10bit;
      case 'MAIN':
        return H264Profile.main;
    }
    throw Exception('$this is not known in enum H264Profile');
  }
}

/// H264 Quality Level
enum H264QualityLevel {
  enhancedQuality,
  standardQuality,
}

extension on H264QualityLevel {
  String toValue() {
    switch (this) {
      case H264QualityLevel.enhancedQuality:
        return 'ENHANCED_QUALITY';
      case H264QualityLevel.standardQuality:
        return 'STANDARD_QUALITY';
    }
  }
}

extension on String {
  H264QualityLevel toH264QualityLevel() {
    switch (this) {
      case 'ENHANCED_QUALITY':
        return H264QualityLevel.enhancedQuality;
      case 'STANDARD_QUALITY':
        return H264QualityLevel.standardQuality;
    }
    throw Exception('$this is not known in enum H264QualityLevel');
  }
}

/// H264 Rate Control Mode
enum H264RateControlMode {
  cbr,
  multiplex,
  qvbr,
  vbr,
}

extension on H264RateControlMode {
  String toValue() {
    switch (this) {
      case H264RateControlMode.cbr:
        return 'CBR';
      case H264RateControlMode.multiplex:
        return 'MULTIPLEX';
      case H264RateControlMode.qvbr:
        return 'QVBR';
      case H264RateControlMode.vbr:
        return 'VBR';
    }
  }
}

extension on String {
  H264RateControlMode toH264RateControlMode() {
    switch (this) {
      case 'CBR':
        return H264RateControlMode.cbr;
      case 'MULTIPLEX':
        return H264RateControlMode.multiplex;
      case 'QVBR':
        return H264RateControlMode.qvbr;
      case 'VBR':
        return H264RateControlMode.vbr;
    }
    throw Exception('$this is not known in enum H264RateControlMode');
  }
}

/// H264 Scan Type
enum H264ScanType {
  interlaced,
  progressive,
}

extension on H264ScanType {
  String toValue() {
    switch (this) {
      case H264ScanType.interlaced:
        return 'INTERLACED';
      case H264ScanType.progressive:
        return 'PROGRESSIVE';
    }
  }
}

extension on String {
  H264ScanType toH264ScanType() {
    switch (this) {
      case 'INTERLACED':
        return H264ScanType.interlaced;
      case 'PROGRESSIVE':
        return H264ScanType.progressive;
    }
    throw Exception('$this is not known in enum H264ScanType');
  }
}

/// H264 Scene Change Detect
enum H264SceneChangeDetect {
  disabled,
  enabled,
}

extension on H264SceneChangeDetect {
  String toValue() {
    switch (this) {
      case H264SceneChangeDetect.disabled:
        return 'DISABLED';
      case H264SceneChangeDetect.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264SceneChangeDetect toH264SceneChangeDetect() {
    switch (this) {
      case 'DISABLED':
        return H264SceneChangeDetect.disabled;
      case 'ENABLED':
        return H264SceneChangeDetect.enabled;
    }
    throw Exception('$this is not known in enum H264SceneChangeDetect');
  }
}

/// H264 Settings
class H264Settings {
  /// Enables or disables adaptive quantization, which is a technique MediaLive
  /// can apply to video on a frame-by-frame basis to produce more compression
  /// without losing quality. There are three types of adaptive quantization:
  /// flicker, spatial, and temporal. Set the field in one of these ways: Set to
  /// Auto. Recommended. For each type of AQ, MediaLive will determine if AQ is
  /// needed, and if so, the appropriate strength. Set a strength (a value other
  /// than Auto or Disable). This strength will apply to any of the AQ fields that
  /// you choose to enable. Set to Disabled to disable all types of adaptive
  /// quantization.
  final H264AdaptiveQuantization? adaptiveQuantization;

  /// Indicates that AFD values will be written into the output stream.  If
  /// afdSignaling is "auto", the system will try to preserve the input AFD value
  /// (in cases where multiple AFD values are valid). If set to "fixed", the AFD
  /// value will be the value configured in the fixedAfd parameter.
  final AfdSignaling? afdSignaling;

  /// Average bitrate in bits/second. Required when the rate control mode is VBR
  /// or CBR. Not used for QVBR. In an MS Smooth output group, each output must
  /// have a unique value when its bitrate is rounded down to the nearest multiple
  /// of 1000.
  final int? bitrate;

  /// Percentage of the buffer that should initially be filled (HRD buffer model).
  final int? bufFillPct;

  /// Size of buffer (HRD buffer model) in bits.
  final int? bufSize;

  /// Includes colorspace metadata in the output.
  final H264ColorMetadata? colorMetadata;

  /// Color Space settings
  final H264ColorSpaceSettings? colorSpaceSettings;

  /// Entropy encoding mode.  Use cabac (must be in Main or High profile) or
  /// cavlc.
  final H264EntropyEncoding? entropyEncoding;

  /// Optional filters that you can apply to an encode.
  final H264FilterSettings? filterSettings;

  /// Four bit AFD value to write on all frames of video in the output stream.
  /// Only valid when afdSignaling is set to 'Fixed'.
  final FixedAfd? fixedAfd;

  /// Flicker AQ makes adjustments within each frame to reduce flicker or 'pop' on
  /// I-frames. The value to enter in this field depends on the value in the
  /// Adaptive quantization field: If you have set the Adaptive quantization field
  /// to Auto, MediaLive ignores any value in this field. MediaLive will determine
  /// if flicker AQ is appropriate and will apply the appropriate strength. If you
  /// have set the Adaptive quantization field to a strength, you can set this
  /// field to Enabled or Disabled. Enabled: MediaLive will apply flicker AQ using
  /// the specified strength. Disabled: MediaLive won't apply flicker AQ. If you
  /// have set the Adaptive quantization to Disabled, MediaLive ignores any value
  /// in this field and doesn't apply flicker AQ.
  final H264FlickerAq? flickerAq;

  /// This setting applies only when scan type is "interlaced." It controls
  /// whether coding is performed on a field basis or on a frame basis. (When the
  /// video is progressive, the coding is always performed on a frame basis.)
  /// enabled: Force MediaLive to code on a field basis, so that odd and even sets
  /// of fields are coded separately.
  /// disabled: Code the two sets of fields separately (on a field basis) or
  /// together (on a frame basis using PAFF), depending on what is most
  /// appropriate for the content.
  final H264ForceFieldPictures? forceFieldPictures;

  /// This field indicates how the output video frame rate is specified.  If
  /// "specified" is selected then the output video frame rate is determined by
  /// framerateNumerator and framerateDenominator, else if "initializeFromSource"
  /// is selected then the output video frame rate will be set equal to the input
  /// video frame rate of the first input.
  final H264FramerateControl? framerateControl;

  /// Framerate denominator.
  final int? framerateDenominator;

  /// Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976
  /// fps.
  final int? framerateNumerator;

  /// Documentation update needed
  final H264GopBReference? gopBReference;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int? gopClosedCadence;

  /// Number of B-frames between reference frames.
  final int? gopNumBFrames;

  /// GOP size (keyframe interval) in units of either frames or seconds per
  /// gopSizeUnits.
  /// If gopSizeUnits is frames, gopSize must be an integer and must be greater
  /// than or equal to 1.
  /// If gopSizeUnits is seconds, gopSize must be greater than 0, but need not be
  /// an integer.
  final double? gopSize;

  /// Indicates if the gopSize is specified in frames or seconds. If seconds the
  /// system will convert the gopSize into a frame count at run time.
  final H264GopSizeUnits? gopSizeUnits;

  /// H.264 Level.
  final H264Level? level;

  /// Amount of lookahead. A value of low can decrease latency and memory usage,
  /// while high can produce better quality for certain content.
  final H264LookAheadRateControl? lookAheadRateControl;

  /// For QVBR: See the tooltip for Quality level
  ///
  /// For VBR: Set the maximum bitrate in order to accommodate expected spikes in
  /// the complexity of the video.
  final int? maxBitrate;

  /// Only meaningful if sceneChangeDetect is set to enabled.  Defaults to 5 if
  /// multiplex rate control is used.  Enforces separation between repeated
  /// (cadence) I-frames and I-frames inserted by Scene Change Detection. If a
  /// scene change I-frame is within I-interval frames of a cadence I-frame, the
  /// GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch
  /// requires enabling lookahead as well as setting I-interval. The normal
  /// cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size +
  /// Min-I-interval - 1
  final int? minIInterval;

  /// Number of reference frames to use. The encoder may use more than requested
  /// if using B-frames and/or interlaced encoding.
  final int? numRefFrames;

  /// This field indicates how the output pixel aspect ratio is specified.  If
  /// "specified" is selected then the output video pixel aspect ratio is
  /// determined by parNumerator and parDenominator, else if
  /// "initializeFromSource" is selected then the output pixsel aspect ratio will
  /// be set equal to the input video pixel aspect ratio of the first input.
  final H264ParControl? parControl;

  /// Pixel Aspect Ratio denominator.
  final int? parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int? parNumerator;

  /// H.264 Profile.
  final H264Profile? profile;

  /// Leave as STANDARD_QUALITY or choose a different value (which might result in
  /// additional costs to run the channel).
  /// - ENHANCED_QUALITY: Produces a slightly better video quality without an
  /// increase in the bitrate. Has an effect only when the Rate control mode is
  /// QVBR or CBR. If this channel is in a MediaLive multiplex, the value must be
  /// ENHANCED_QUALITY.
  /// - STANDARD_QUALITY: Valid for any Rate control mode.
  final H264QualityLevel? qualityLevel;

  /// Controls the target quality for the video encode. Applies only when the rate
  /// control mode is QVBR. You can set a target quality or you can let MediaLive
  /// determine the best quality. To set a target quality, enter values in the
  /// QVBR quality level field and the Max bitrate field. Enter values that suit
  /// your most important viewing devices. Recommended values are:
  /// - Primary screen: Quality level: 8 to 10. Max bitrate: 4M
  /// - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M
  /// - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
  /// To let MediaLive decide, leave the QVBR quality level field empty, and in
  /// Max bitrate enter the maximum rate you want in the video. For more
  /// information, see the section called "Video - rate control mode" in the
  /// MediaLive user guide
  final int? qvbrQualityLevel;

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
  final H264RateControlMode? rateControlMode;

  /// Sets the scan type of the output to progressive or top-field-first
  /// interlaced.
  final H264ScanType? scanType;

  /// Scene change detection.
  ///
  /// - On: inserts I-frames when scene change is detected.
  /// - Off: does not force an I-frame when scene change is detected.
  final H264SceneChangeDetect? sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  /// This field is optional; when no value is specified the encoder will choose
  /// the number of slices based on encode resolution.
  final int? slices;

  /// Softness. Selects quantizer matrix, larger values reduce high-frequency
  /// content in the encoded image.  If not set to zero, must be greater than 15.
  final int? softness;

  /// Spatial AQ makes adjustments within each frame based on spatial variation of
  /// content complexity. The value to enter in this field depends on the value in
  /// the Adaptive quantization field: If you have set the Adaptive quantization
  /// field to Auto, MediaLive ignores any value in this field. MediaLive will
  /// determine if spatial AQ is appropriate and will apply the appropriate
  /// strength. If you have set the Adaptive quantization field to a strength, you
  /// can set this field to Enabled or Disabled. Enabled: MediaLive will apply
  /// spatial AQ using the specified strength. Disabled: MediaLive won't apply
  /// spatial AQ. If you have set the Adaptive quantization to Disabled, MediaLive
  /// ignores any value in this field and doesn't apply spatial AQ.
  final H264SpatialAq? spatialAq;

  /// If set to fixed, use gopNumBFrames B-frames per sub-GOP. If set to dynamic,
  /// optimize the number of B-frames used for each sub-GOP to improve visual
  /// quality.
  final H264SubGopLength? subgopLength;

  /// Produces a bitstream compliant with SMPTE RP-2027.
  final H264Syntax? syntax;

  /// Temporal makes adjustments within each frame based on temporal variation of
  /// content complexity. The value to enter in this field depends on the value in
  /// the Adaptive quantization field: If you have set the Adaptive quantization
  /// field to Auto, MediaLive ignores any value in this field. MediaLive will
  /// determine if temporal AQ is appropriate and will apply the appropriate
  /// strength. If you have set the Adaptive quantization field to a strength, you
  /// can set this field to Enabled or Disabled. Enabled: MediaLive will apply
  /// temporal AQ using the specified strength. Disabled: MediaLive won't apply
  /// temporal AQ. If you have set the Adaptive quantization to Disabled,
  /// MediaLive ignores any value in this field and doesn't apply temporal AQ.
  final H264TemporalAq? temporalAq;

  /// Determines how timecodes should be inserted into the video elementary
  /// stream.
  /// - 'disabled': Do not include timecodes
  /// - 'picTimingSei': Pass through picture timing SEI messages from the source
  /// specified in Timecode Config
  final H264TimecodeInsertionBehavior? timecodeInsertion;

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

  factory H264Settings.fromJson(Map<String, dynamic> json) {
    return H264Settings(
      adaptiveQuantization: (json['adaptiveQuantization'] as String?)
          ?.toH264AdaptiveQuantization(),
      afdSignaling: (json['afdSignaling'] as String?)?.toAfdSignaling(),
      bitrate: json['bitrate'] as int?,
      bufFillPct: json['bufFillPct'] as int?,
      bufSize: json['bufSize'] as int?,
      colorMetadata: (json['colorMetadata'] as String?)?.toH264ColorMetadata(),
      colorSpaceSettings: json['colorSpaceSettings'] != null
          ? H264ColorSpaceSettings.fromJson(
              json['colorSpaceSettings'] as Map<String, dynamic>)
          : null,
      entropyEncoding:
          (json['entropyEncoding'] as String?)?.toH264EntropyEncoding(),
      filterSettings: json['filterSettings'] != null
          ? H264FilterSettings.fromJson(
              json['filterSettings'] as Map<String, dynamic>)
          : null,
      fixedAfd: (json['fixedAfd'] as String?)?.toFixedAfd(),
      flickerAq: (json['flickerAq'] as String?)?.toH264FlickerAq(),
      forceFieldPictures:
          (json['forceFieldPictures'] as String?)?.toH264ForceFieldPictures(),
      framerateControl:
          (json['framerateControl'] as String?)?.toH264FramerateControl(),
      framerateDenominator: json['framerateDenominator'] as int?,
      framerateNumerator: json['framerateNumerator'] as int?,
      gopBReference: (json['gopBReference'] as String?)?.toH264GopBReference(),
      gopClosedCadence: json['gopClosedCadence'] as int?,
      gopNumBFrames: json['gopNumBFrames'] as int?,
      gopSize: json['gopSize'] as double?,
      gopSizeUnits: (json['gopSizeUnits'] as String?)?.toH264GopSizeUnits(),
      level: (json['level'] as String?)?.toH264Level(),
      lookAheadRateControl: (json['lookAheadRateControl'] as String?)
          ?.toH264LookAheadRateControl(),
      maxBitrate: json['maxBitrate'] as int?,
      minIInterval: json['minIInterval'] as int?,
      numRefFrames: json['numRefFrames'] as int?,
      parControl: (json['parControl'] as String?)?.toH264ParControl(),
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      profile: (json['profile'] as String?)?.toH264Profile(),
      qualityLevel: (json['qualityLevel'] as String?)?.toH264QualityLevel(),
      qvbrQualityLevel: json['qvbrQualityLevel'] as int?,
      rateControlMode:
          (json['rateControlMode'] as String?)?.toH264RateControlMode(),
      scanType: (json['scanType'] as String?)?.toH264ScanType(),
      sceneChangeDetect:
          (json['sceneChangeDetect'] as String?)?.toH264SceneChangeDetect(),
      slices: json['slices'] as int?,
      softness: json['softness'] as int?,
      spatialAq: (json['spatialAq'] as String?)?.toH264SpatialAq(),
      subgopLength: (json['subgopLength'] as String?)?.toH264SubGopLength(),
      syntax: (json['syntax'] as String?)?.toH264Syntax(),
      temporalAq: (json['temporalAq'] as String?)?.toH264TemporalAq(),
      timecodeInsertion: (json['timecodeInsertion'] as String?)
          ?.toH264TimecodeInsertionBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final adaptiveQuantization = this.adaptiveQuantization;
    final afdSignaling = this.afdSignaling;
    final bitrate = this.bitrate;
    final bufFillPct = this.bufFillPct;
    final bufSize = this.bufSize;
    final colorMetadata = this.colorMetadata;
    final colorSpaceSettings = this.colorSpaceSettings;
    final entropyEncoding = this.entropyEncoding;
    final filterSettings = this.filterSettings;
    final fixedAfd = this.fixedAfd;
    final flickerAq = this.flickerAq;
    final forceFieldPictures = this.forceFieldPictures;
    final framerateControl = this.framerateControl;
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final gopBReference = this.gopBReference;
    final gopClosedCadence = this.gopClosedCadence;
    final gopNumBFrames = this.gopNumBFrames;
    final gopSize = this.gopSize;
    final gopSizeUnits = this.gopSizeUnits;
    final level = this.level;
    final lookAheadRateControl = this.lookAheadRateControl;
    final maxBitrate = this.maxBitrate;
    final minIInterval = this.minIInterval;
    final numRefFrames = this.numRefFrames;
    final parControl = this.parControl;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final profile = this.profile;
    final qualityLevel = this.qualityLevel;
    final qvbrQualityLevel = this.qvbrQualityLevel;
    final rateControlMode = this.rateControlMode;
    final scanType = this.scanType;
    final sceneChangeDetect = this.sceneChangeDetect;
    final slices = this.slices;
    final softness = this.softness;
    final spatialAq = this.spatialAq;
    final subgopLength = this.subgopLength;
    final syntax = this.syntax;
    final temporalAq = this.temporalAq;
    final timecodeInsertion = this.timecodeInsertion;
    return {
      if (adaptiveQuantization != null)
        'adaptiveQuantization': adaptiveQuantization.toValue(),
      if (afdSignaling != null) 'afdSignaling': afdSignaling.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (bufFillPct != null) 'bufFillPct': bufFillPct,
      if (bufSize != null) 'bufSize': bufSize,
      if (colorMetadata != null) 'colorMetadata': colorMetadata.toValue(),
      if (colorSpaceSettings != null) 'colorSpaceSettings': colorSpaceSettings,
      if (entropyEncoding != null) 'entropyEncoding': entropyEncoding.toValue(),
      if (filterSettings != null) 'filterSettings': filterSettings,
      if (fixedAfd != null) 'fixedAfd': fixedAfd.toValue(),
      if (flickerAq != null) 'flickerAq': flickerAq.toValue(),
      if (forceFieldPictures != null)
        'forceFieldPictures': forceFieldPictures.toValue(),
      if (framerateControl != null)
        'framerateControl': framerateControl.toValue(),
      if (framerateDenominator != null)
        'framerateDenominator': framerateDenominator,
      if (framerateNumerator != null) 'framerateNumerator': framerateNumerator,
      if (gopBReference != null) 'gopBReference': gopBReference.toValue(),
      if (gopClosedCadence != null) 'gopClosedCadence': gopClosedCadence,
      if (gopNumBFrames != null) 'gopNumBFrames': gopNumBFrames,
      if (gopSize != null) 'gopSize': gopSize,
      if (gopSizeUnits != null) 'gopSizeUnits': gopSizeUnits.toValue(),
      if (level != null) 'level': level.toValue(),
      if (lookAheadRateControl != null)
        'lookAheadRateControl': lookAheadRateControl.toValue(),
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (minIInterval != null) 'minIInterval': minIInterval,
      if (numRefFrames != null) 'numRefFrames': numRefFrames,
      if (parControl != null) 'parControl': parControl.toValue(),
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (profile != null) 'profile': profile.toValue(),
      if (qualityLevel != null) 'qualityLevel': qualityLevel.toValue(),
      if (qvbrQualityLevel != null) 'qvbrQualityLevel': qvbrQualityLevel,
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (scanType != null) 'scanType': scanType.toValue(),
      if (sceneChangeDetect != null)
        'sceneChangeDetect': sceneChangeDetect.toValue(),
      if (slices != null) 'slices': slices,
      if (softness != null) 'softness': softness,
      if (spatialAq != null) 'spatialAq': spatialAq.toValue(),
      if (subgopLength != null) 'subgopLength': subgopLength.toValue(),
      if (syntax != null) 'syntax': syntax.toValue(),
      if (temporalAq != null) 'temporalAq': temporalAq.toValue(),
      if (timecodeInsertion != null)
        'timecodeInsertion': timecodeInsertion.toValue(),
    };
  }
}

/// H264 Spatial Aq
enum H264SpatialAq {
  disabled,
  enabled,
}

extension on H264SpatialAq {
  String toValue() {
    switch (this) {
      case H264SpatialAq.disabled:
        return 'DISABLED';
      case H264SpatialAq.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264SpatialAq toH264SpatialAq() {
    switch (this) {
      case 'DISABLED':
        return H264SpatialAq.disabled;
      case 'ENABLED':
        return H264SpatialAq.enabled;
    }
    throw Exception('$this is not known in enum H264SpatialAq');
  }
}

/// H264 Sub Gop Length
enum H264SubGopLength {
  dynamic,
  fixed,
}

extension on H264SubGopLength {
  String toValue() {
    switch (this) {
      case H264SubGopLength.dynamic:
        return 'DYNAMIC';
      case H264SubGopLength.fixed:
        return 'FIXED';
    }
  }
}

extension on String {
  H264SubGopLength toH264SubGopLength() {
    switch (this) {
      case 'DYNAMIC':
        return H264SubGopLength.dynamic;
      case 'FIXED':
        return H264SubGopLength.fixed;
    }
    throw Exception('$this is not known in enum H264SubGopLength');
  }
}

/// H264 Syntax
enum H264Syntax {
  $default,
  rp2027,
}

extension on H264Syntax {
  String toValue() {
    switch (this) {
      case H264Syntax.$default:
        return 'DEFAULT';
      case H264Syntax.rp2027:
        return 'RP2027';
    }
  }
}

extension on String {
  H264Syntax toH264Syntax() {
    switch (this) {
      case 'DEFAULT':
        return H264Syntax.$default;
      case 'RP2027':
        return H264Syntax.rp2027;
    }
    throw Exception('$this is not known in enum H264Syntax');
  }
}

/// H264 Temporal Aq
enum H264TemporalAq {
  disabled,
  enabled,
}

extension on H264TemporalAq {
  String toValue() {
    switch (this) {
      case H264TemporalAq.disabled:
        return 'DISABLED';
      case H264TemporalAq.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H264TemporalAq toH264TemporalAq() {
    switch (this) {
      case 'DISABLED':
        return H264TemporalAq.disabled;
      case 'ENABLED':
        return H264TemporalAq.enabled;
    }
    throw Exception('$this is not known in enum H264TemporalAq');
  }
}

/// H264 Timecode Insertion Behavior
enum H264TimecodeInsertionBehavior {
  disabled,
  picTimingSei,
}

extension on H264TimecodeInsertionBehavior {
  String toValue() {
    switch (this) {
      case H264TimecodeInsertionBehavior.disabled:
        return 'DISABLED';
      case H264TimecodeInsertionBehavior.picTimingSei:
        return 'PIC_TIMING_SEI';
    }
  }
}

extension on String {
  H264TimecodeInsertionBehavior toH264TimecodeInsertionBehavior() {
    switch (this) {
      case 'DISABLED':
        return H264TimecodeInsertionBehavior.disabled;
      case 'PIC_TIMING_SEI':
        return H264TimecodeInsertionBehavior.picTimingSei;
    }
    throw Exception('$this is not known in enum H264TimecodeInsertionBehavior');
  }
}

/// H265 Adaptive Quantization
enum H265AdaptiveQuantization {
  auto,
  high,
  higher,
  low,
  max,
  medium,
  off,
}

extension on H265AdaptiveQuantization {
  String toValue() {
    switch (this) {
      case H265AdaptiveQuantization.auto:
        return 'AUTO';
      case H265AdaptiveQuantization.high:
        return 'HIGH';
      case H265AdaptiveQuantization.higher:
        return 'HIGHER';
      case H265AdaptiveQuantization.low:
        return 'LOW';
      case H265AdaptiveQuantization.max:
        return 'MAX';
      case H265AdaptiveQuantization.medium:
        return 'MEDIUM';
      case H265AdaptiveQuantization.off:
        return 'OFF';
    }
  }
}

extension on String {
  H265AdaptiveQuantization toH265AdaptiveQuantization() {
    switch (this) {
      case 'AUTO':
        return H265AdaptiveQuantization.auto;
      case 'HIGH':
        return H265AdaptiveQuantization.high;
      case 'HIGHER':
        return H265AdaptiveQuantization.higher;
      case 'LOW':
        return H265AdaptiveQuantization.low;
      case 'MAX':
        return H265AdaptiveQuantization.max;
      case 'MEDIUM':
        return H265AdaptiveQuantization.medium;
      case 'OFF':
        return H265AdaptiveQuantization.off;
    }
    throw Exception('$this is not known in enum H265AdaptiveQuantization');
  }
}

/// H265 Alternative Transfer Function
enum H265AlternativeTransferFunction {
  insert,
  omit,
}

extension on H265AlternativeTransferFunction {
  String toValue() {
    switch (this) {
      case H265AlternativeTransferFunction.insert:
        return 'INSERT';
      case H265AlternativeTransferFunction.omit:
        return 'OMIT';
    }
  }
}

extension on String {
  H265AlternativeTransferFunction toH265AlternativeTransferFunction() {
    switch (this) {
      case 'INSERT':
        return H265AlternativeTransferFunction.insert;
      case 'OMIT':
        return H265AlternativeTransferFunction.omit;
    }
    throw Exception(
        '$this is not known in enum H265AlternativeTransferFunction');
  }
}

/// H265 Color Metadata
enum H265ColorMetadata {
  ignore,
  insert,
}

extension on H265ColorMetadata {
  String toValue() {
    switch (this) {
      case H265ColorMetadata.ignore:
        return 'IGNORE';
      case H265ColorMetadata.insert:
        return 'INSERT';
    }
  }
}

extension on String {
  H265ColorMetadata toH265ColorMetadata() {
    switch (this) {
      case 'IGNORE':
        return H265ColorMetadata.ignore;
      case 'INSERT':
        return H265ColorMetadata.insert;
    }
    throw Exception('$this is not known in enum H265ColorMetadata');
  }
}

/// H265 Color Space Settings
class H265ColorSpaceSettings {
  final ColorSpacePassthroughSettings? colorSpacePassthroughSettings;
  final Hdr10Settings? hdr10Settings;
  final Rec601Settings? rec601Settings;
  final Rec709Settings? rec709Settings;

  H265ColorSpaceSettings({
    this.colorSpacePassthroughSettings,
    this.hdr10Settings,
    this.rec601Settings,
    this.rec709Settings,
  });

  factory H265ColorSpaceSettings.fromJson(Map<String, dynamic> json) {
    return H265ColorSpaceSettings(
      colorSpacePassthroughSettings:
          json['colorSpacePassthroughSettings'] != null
              ? ColorSpacePassthroughSettings.fromJson(
                  json['colorSpacePassthroughSettings'] as Map<String, dynamic>)
              : null,
      hdr10Settings: json['hdr10Settings'] != null
          ? Hdr10Settings.fromJson(
              json['hdr10Settings'] as Map<String, dynamic>)
          : null,
      rec601Settings: json['rec601Settings'] != null
          ? Rec601Settings.fromJson(
              json['rec601Settings'] as Map<String, dynamic>)
          : null,
      rec709Settings: json['rec709Settings'] != null
          ? Rec709Settings.fromJson(
              json['rec709Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final colorSpacePassthroughSettings = this.colorSpacePassthroughSettings;
    final hdr10Settings = this.hdr10Settings;
    final rec601Settings = this.rec601Settings;
    final rec709Settings = this.rec709Settings;
    return {
      if (colorSpacePassthroughSettings != null)
        'colorSpacePassthroughSettings': colorSpacePassthroughSettings,
      if (hdr10Settings != null) 'hdr10Settings': hdr10Settings,
      if (rec601Settings != null) 'rec601Settings': rec601Settings,
      if (rec709Settings != null) 'rec709Settings': rec709Settings,
    };
  }
}

/// H265 Filter Settings
class H265FilterSettings {
  final TemporalFilterSettings? temporalFilterSettings;

  H265FilterSettings({
    this.temporalFilterSettings,
  });

  factory H265FilterSettings.fromJson(Map<String, dynamic> json) {
    return H265FilterSettings(
      temporalFilterSettings: json['temporalFilterSettings'] != null
          ? TemporalFilterSettings.fromJson(
              json['temporalFilterSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final temporalFilterSettings = this.temporalFilterSettings;
    return {
      if (temporalFilterSettings != null)
        'temporalFilterSettings': temporalFilterSettings,
    };
  }
}

/// H265 Flicker Aq
enum H265FlickerAq {
  disabled,
  enabled,
}

extension on H265FlickerAq {
  String toValue() {
    switch (this) {
      case H265FlickerAq.disabled:
        return 'DISABLED';
      case H265FlickerAq.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265FlickerAq toH265FlickerAq() {
    switch (this) {
      case 'DISABLED':
        return H265FlickerAq.disabled;
      case 'ENABLED':
        return H265FlickerAq.enabled;
    }
    throw Exception('$this is not known in enum H265FlickerAq');
  }
}

/// H265 Gop Size Units
enum H265GopSizeUnits {
  frames,
  seconds,
}

extension on H265GopSizeUnits {
  String toValue() {
    switch (this) {
      case H265GopSizeUnits.frames:
        return 'FRAMES';
      case H265GopSizeUnits.seconds:
        return 'SECONDS';
    }
  }
}

extension on String {
  H265GopSizeUnits toH265GopSizeUnits() {
    switch (this) {
      case 'FRAMES':
        return H265GopSizeUnits.frames;
      case 'SECONDS':
        return H265GopSizeUnits.seconds;
    }
    throw Exception('$this is not known in enum H265GopSizeUnits');
  }
}

/// H265 Level
enum H265Level {
  h265Level_1,
  h265Level_2,
  h265Level_2_1,
  h265Level_3,
  h265Level_3_1,
  h265Level_4,
  h265Level_4_1,
  h265Level_5,
  h265Level_5_1,
  h265Level_5_2,
  h265Level_6,
  h265Level_6_1,
  h265Level_6_2,
  h265LevelAuto,
}

extension on H265Level {
  String toValue() {
    switch (this) {
      case H265Level.h265Level_1:
        return 'H265_LEVEL_1';
      case H265Level.h265Level_2:
        return 'H265_LEVEL_2';
      case H265Level.h265Level_2_1:
        return 'H265_LEVEL_2_1';
      case H265Level.h265Level_3:
        return 'H265_LEVEL_3';
      case H265Level.h265Level_3_1:
        return 'H265_LEVEL_3_1';
      case H265Level.h265Level_4:
        return 'H265_LEVEL_4';
      case H265Level.h265Level_4_1:
        return 'H265_LEVEL_4_1';
      case H265Level.h265Level_5:
        return 'H265_LEVEL_5';
      case H265Level.h265Level_5_1:
        return 'H265_LEVEL_5_1';
      case H265Level.h265Level_5_2:
        return 'H265_LEVEL_5_2';
      case H265Level.h265Level_6:
        return 'H265_LEVEL_6';
      case H265Level.h265Level_6_1:
        return 'H265_LEVEL_6_1';
      case H265Level.h265Level_6_2:
        return 'H265_LEVEL_6_2';
      case H265Level.h265LevelAuto:
        return 'H265_LEVEL_AUTO';
    }
  }
}

extension on String {
  H265Level toH265Level() {
    switch (this) {
      case 'H265_LEVEL_1':
        return H265Level.h265Level_1;
      case 'H265_LEVEL_2':
        return H265Level.h265Level_2;
      case 'H265_LEVEL_2_1':
        return H265Level.h265Level_2_1;
      case 'H265_LEVEL_3':
        return H265Level.h265Level_3;
      case 'H265_LEVEL_3_1':
        return H265Level.h265Level_3_1;
      case 'H265_LEVEL_4':
        return H265Level.h265Level_4;
      case 'H265_LEVEL_4_1':
        return H265Level.h265Level_4_1;
      case 'H265_LEVEL_5':
        return H265Level.h265Level_5;
      case 'H265_LEVEL_5_1':
        return H265Level.h265Level_5_1;
      case 'H265_LEVEL_5_2':
        return H265Level.h265Level_5_2;
      case 'H265_LEVEL_6':
        return H265Level.h265Level_6;
      case 'H265_LEVEL_6_1':
        return H265Level.h265Level_6_1;
      case 'H265_LEVEL_6_2':
        return H265Level.h265Level_6_2;
      case 'H265_LEVEL_AUTO':
        return H265Level.h265LevelAuto;
    }
    throw Exception('$this is not known in enum H265Level');
  }
}

/// H265 Look Ahead Rate Control
enum H265LookAheadRateControl {
  high,
  low,
  medium,
}

extension on H265LookAheadRateControl {
  String toValue() {
    switch (this) {
      case H265LookAheadRateControl.high:
        return 'HIGH';
      case H265LookAheadRateControl.low:
        return 'LOW';
      case H265LookAheadRateControl.medium:
        return 'MEDIUM';
    }
  }
}

extension on String {
  H265LookAheadRateControl toH265LookAheadRateControl() {
    switch (this) {
      case 'HIGH':
        return H265LookAheadRateControl.high;
      case 'LOW':
        return H265LookAheadRateControl.low;
      case 'MEDIUM':
        return H265LookAheadRateControl.medium;
    }
    throw Exception('$this is not known in enum H265LookAheadRateControl');
  }
}

/// H265 Profile
enum H265Profile {
  main,
  main_10bit,
}

extension on H265Profile {
  String toValue() {
    switch (this) {
      case H265Profile.main:
        return 'MAIN';
      case H265Profile.main_10bit:
        return 'MAIN_10BIT';
    }
  }
}

extension on String {
  H265Profile toH265Profile() {
    switch (this) {
      case 'MAIN':
        return H265Profile.main;
      case 'MAIN_10BIT':
        return H265Profile.main_10bit;
    }
    throw Exception('$this is not known in enum H265Profile');
  }
}

/// H265 Rate Control Mode
enum H265RateControlMode {
  cbr,
  multiplex,
  qvbr,
}

extension on H265RateControlMode {
  String toValue() {
    switch (this) {
      case H265RateControlMode.cbr:
        return 'CBR';
      case H265RateControlMode.multiplex:
        return 'MULTIPLEX';
      case H265RateControlMode.qvbr:
        return 'QVBR';
    }
  }
}

extension on String {
  H265RateControlMode toH265RateControlMode() {
    switch (this) {
      case 'CBR':
        return H265RateControlMode.cbr;
      case 'MULTIPLEX':
        return H265RateControlMode.multiplex;
      case 'QVBR':
        return H265RateControlMode.qvbr;
    }
    throw Exception('$this is not known in enum H265RateControlMode');
  }
}

/// H265 Scan Type
enum H265ScanType {
  interlaced,
  progressive,
}

extension on H265ScanType {
  String toValue() {
    switch (this) {
      case H265ScanType.interlaced:
        return 'INTERLACED';
      case H265ScanType.progressive:
        return 'PROGRESSIVE';
    }
  }
}

extension on String {
  H265ScanType toH265ScanType() {
    switch (this) {
      case 'INTERLACED':
        return H265ScanType.interlaced;
      case 'PROGRESSIVE':
        return H265ScanType.progressive;
    }
    throw Exception('$this is not known in enum H265ScanType');
  }
}

/// H265 Scene Change Detect
enum H265SceneChangeDetect {
  disabled,
  enabled,
}

extension on H265SceneChangeDetect {
  String toValue() {
    switch (this) {
      case H265SceneChangeDetect.disabled:
        return 'DISABLED';
      case H265SceneChangeDetect.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  H265SceneChangeDetect toH265SceneChangeDetect() {
    switch (this) {
      case 'DISABLED':
        return H265SceneChangeDetect.disabled;
      case 'ENABLED':
        return H265SceneChangeDetect.enabled;
    }
    throw Exception('$this is not known in enum H265SceneChangeDetect');
  }
}

/// H265 Settings
class H265Settings {
  /// Framerate denominator.
  final int framerateDenominator;

  /// Framerate numerator - framerate is a fraction, e.g. 24000 / 1001 = 23.976
  /// fps.
  final int framerateNumerator;

  /// Adaptive quantization. Allows intra-frame quantizers to vary to improve
  /// visual quality.
  final H265AdaptiveQuantization? adaptiveQuantization;

  /// Indicates that AFD values will be written into the output stream.  If
  /// afdSignaling is "auto", the system will try to preserve the input AFD value
  /// (in cases where multiple AFD values are valid). If set to "fixed", the AFD
  /// value will be the value configured in the fixedAfd parameter.
  final AfdSignaling? afdSignaling;

  /// Whether or not EML should insert an Alternative Transfer Function SEI
  /// message to support backwards compatibility with non-HDR decoders and
  /// displays.
  final H265AlternativeTransferFunction? alternativeTransferFunction;

  /// Average bitrate in bits/second. Required when the rate control mode is VBR
  /// or CBR. Not used for QVBR. In an MS Smooth output group, each output must
  /// have a unique value when its bitrate is rounded down to the nearest multiple
  /// of 1000.
  final int? bitrate;

  /// Size of buffer (HRD buffer model) in bits.
  final int? bufSize;

  /// Includes colorspace metadata in the output.
  final H265ColorMetadata? colorMetadata;

  /// Color Space settings
  final H265ColorSpaceSettings? colorSpaceSettings;

  /// Optional filters that you can apply to an encode.
  final H265FilterSettings? filterSettings;

  /// Four bit AFD value to write on all frames of video in the output stream.
  /// Only valid when afdSignaling is set to 'Fixed'.
  final FixedAfd? fixedAfd;

  /// If set to enabled, adjust quantization within each frame to reduce flicker
  /// or 'pop' on I-frames.
  final H265FlickerAq? flickerAq;

  /// Frequency of closed GOPs. In streaming applications, it is recommended that
  /// this be set to 1 so a decoder joining mid-stream will receive an IDR frame
  /// as quickly as possible. Setting this value to 0 will break output
  /// segmenting.
  final int? gopClosedCadence;

  /// GOP size (keyframe interval) in units of either frames or seconds per
  /// gopSizeUnits.
  /// If gopSizeUnits is frames, gopSize must be an integer and must be greater
  /// than or equal to 1.
  /// If gopSizeUnits is seconds, gopSize must be greater than 0, but need not be
  /// an integer.
  final double? gopSize;

  /// Indicates if the gopSize is specified in frames or seconds. If seconds the
  /// system will convert the gopSize into a frame count at run time.
  final H265GopSizeUnits? gopSizeUnits;

  /// H.265 Level.
  final H265Level? level;

  /// Amount of lookahead. A value of low can decrease latency and memory usage,
  /// while high can produce better quality for certain content.
  final H265LookAheadRateControl? lookAheadRateControl;

  /// For QVBR: See the tooltip for Quality level
  final int? maxBitrate;

  /// Only meaningful if sceneChangeDetect is set to enabled.  Defaults to 5 if
  /// multiplex rate control is used.  Enforces separation between repeated
  /// (cadence) I-frames and I-frames inserted by Scene Change Detection. If a
  /// scene change I-frame is within I-interval frames of a cadence I-frame, the
  /// GOP is shrunk and/or stretched to the scene change I-frame. GOP stretch
  /// requires enabling lookahead as well as setting I-interval. The normal
  /// cadence resumes for the next GOP. Note: Maximum GOP stretch = GOP size +
  /// Min-I-interval - 1
  final int? minIInterval;

  /// Pixel Aspect Ratio denominator.
  final int? parDenominator;

  /// Pixel Aspect Ratio numerator.
  final int? parNumerator;

  /// H.265 Profile.
  final H265Profile? profile;

  /// Controls the target quality for the video encode. Applies only when the rate
  /// control mode is QVBR. Set values for the QVBR quality level field and Max
  /// bitrate field that suit your most important viewing devices. Recommended
  /// values are:
  /// - Primary screen: Quality level: 8 to 10. Max bitrate: 4M
  /// - PC or tablet: Quality level: 7. Max bitrate: 1.5M to 3M
  /// - Smartphone: Quality level: 6. Max bitrate: 1M to 1.5M
  final int? qvbrQualityLevel;

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
  final H265RateControlMode? rateControlMode;

  /// Sets the scan type of the output to progressive or top-field-first
  /// interlaced.
  final H265ScanType? scanType;

  /// Scene change detection.
  final H265SceneChangeDetect? sceneChangeDetect;

  /// Number of slices per picture. Must be less than or equal to the number of
  /// macroblock rows for progressive pictures, and less than or equal to half the
  /// number of macroblock rows for interlaced pictures.
  /// This field is optional; when no value is specified the encoder will choose
  /// the number of slices based on encode resolution.
  final int? slices;

  /// H.265 Tier.
  final H265Tier? tier;

  /// Determines how timecodes should be inserted into the video elementary
  /// stream.
  /// - 'disabled': Do not include timecodes
  /// - 'picTimingSei': Pass through picture timing SEI messages from the source
  /// specified in Timecode Config
  final H265TimecodeInsertionBehavior? timecodeInsertion;

  H265Settings({
    required this.framerateDenominator,
    required this.framerateNumerator,
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

  factory H265Settings.fromJson(Map<String, dynamic> json) {
    return H265Settings(
      framerateDenominator: json['framerateDenominator'] as int,
      framerateNumerator: json['framerateNumerator'] as int,
      adaptiveQuantization: (json['adaptiveQuantization'] as String?)
          ?.toH265AdaptiveQuantization(),
      afdSignaling: (json['afdSignaling'] as String?)?.toAfdSignaling(),
      alternativeTransferFunction:
          (json['alternativeTransferFunction'] as String?)
              ?.toH265AlternativeTransferFunction(),
      bitrate: json['bitrate'] as int?,
      bufSize: json['bufSize'] as int?,
      colorMetadata: (json['colorMetadata'] as String?)?.toH265ColorMetadata(),
      colorSpaceSettings: json['colorSpaceSettings'] != null
          ? H265ColorSpaceSettings.fromJson(
              json['colorSpaceSettings'] as Map<String, dynamic>)
          : null,
      filterSettings: json['filterSettings'] != null
          ? H265FilterSettings.fromJson(
              json['filterSettings'] as Map<String, dynamic>)
          : null,
      fixedAfd: (json['fixedAfd'] as String?)?.toFixedAfd(),
      flickerAq: (json['flickerAq'] as String?)?.toH265FlickerAq(),
      gopClosedCadence: json['gopClosedCadence'] as int?,
      gopSize: json['gopSize'] as double?,
      gopSizeUnits: (json['gopSizeUnits'] as String?)?.toH265GopSizeUnits(),
      level: (json['level'] as String?)?.toH265Level(),
      lookAheadRateControl: (json['lookAheadRateControl'] as String?)
          ?.toH265LookAheadRateControl(),
      maxBitrate: json['maxBitrate'] as int?,
      minIInterval: json['minIInterval'] as int?,
      parDenominator: json['parDenominator'] as int?,
      parNumerator: json['parNumerator'] as int?,
      profile: (json['profile'] as String?)?.toH265Profile(),
      qvbrQualityLevel: json['qvbrQualityLevel'] as int?,
      rateControlMode:
          (json['rateControlMode'] as String?)?.toH265RateControlMode(),
      scanType: (json['scanType'] as String?)?.toH265ScanType(),
      sceneChangeDetect:
          (json['sceneChangeDetect'] as String?)?.toH265SceneChangeDetect(),
      slices: json['slices'] as int?,
      tier: (json['tier'] as String?)?.toH265Tier(),
      timecodeInsertion: (json['timecodeInsertion'] as String?)
          ?.toH265TimecodeInsertionBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final adaptiveQuantization = this.adaptiveQuantization;
    final afdSignaling = this.afdSignaling;
    final alternativeTransferFunction = this.alternativeTransferFunction;
    final bitrate = this.bitrate;
    final bufSize = this.bufSize;
    final colorMetadata = this.colorMetadata;
    final colorSpaceSettings = this.colorSpaceSettings;
    final filterSettings = this.filterSettings;
    final fixedAfd = this.fixedAfd;
    final flickerAq = this.flickerAq;
    final gopClosedCadence = this.gopClosedCadence;
    final gopSize = this.gopSize;
    final gopSizeUnits = this.gopSizeUnits;
    final level = this.level;
    final lookAheadRateControl = this.lookAheadRateControl;
    final maxBitrate = this.maxBitrate;
    final minIInterval = this.minIInterval;
    final parDenominator = this.parDenominator;
    final parNumerator = this.parNumerator;
    final profile = this.profile;
    final qvbrQualityLevel = this.qvbrQualityLevel;
    final rateControlMode = this.rateControlMode;
    final scanType = this.scanType;
    final sceneChangeDetect = this.sceneChangeDetect;
    final slices = this.slices;
    final tier = this.tier;
    final timecodeInsertion = this.timecodeInsertion;
    return {
      'framerateDenominator': framerateDenominator,
      'framerateNumerator': framerateNumerator,
      if (adaptiveQuantization != null)
        'adaptiveQuantization': adaptiveQuantization.toValue(),
      if (afdSignaling != null) 'afdSignaling': afdSignaling.toValue(),
      if (alternativeTransferFunction != null)
        'alternativeTransferFunction': alternativeTransferFunction.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (bufSize != null) 'bufSize': bufSize,
      if (colorMetadata != null) 'colorMetadata': colorMetadata.toValue(),
      if (colorSpaceSettings != null) 'colorSpaceSettings': colorSpaceSettings,
      if (filterSettings != null) 'filterSettings': filterSettings,
      if (fixedAfd != null) 'fixedAfd': fixedAfd.toValue(),
      if (flickerAq != null) 'flickerAq': flickerAq.toValue(),
      if (gopClosedCadence != null) 'gopClosedCadence': gopClosedCadence,
      if (gopSize != null) 'gopSize': gopSize,
      if (gopSizeUnits != null) 'gopSizeUnits': gopSizeUnits.toValue(),
      if (level != null) 'level': level.toValue(),
      if (lookAheadRateControl != null)
        'lookAheadRateControl': lookAheadRateControl.toValue(),
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (minIInterval != null) 'minIInterval': minIInterval,
      if (parDenominator != null) 'parDenominator': parDenominator,
      if (parNumerator != null) 'parNumerator': parNumerator,
      if (profile != null) 'profile': profile.toValue(),
      if (qvbrQualityLevel != null) 'qvbrQualityLevel': qvbrQualityLevel,
      if (rateControlMode != null) 'rateControlMode': rateControlMode.toValue(),
      if (scanType != null) 'scanType': scanType.toValue(),
      if (sceneChangeDetect != null)
        'sceneChangeDetect': sceneChangeDetect.toValue(),
      if (slices != null) 'slices': slices,
      if (tier != null) 'tier': tier.toValue(),
      if (timecodeInsertion != null)
        'timecodeInsertion': timecodeInsertion.toValue(),
    };
  }
}

/// H265 Tier
enum H265Tier {
  high,
  main,
}

extension on H265Tier {
  String toValue() {
    switch (this) {
      case H265Tier.high:
        return 'HIGH';
      case H265Tier.main:
        return 'MAIN';
    }
  }
}

extension on String {
  H265Tier toH265Tier() {
    switch (this) {
      case 'HIGH':
        return H265Tier.high;
      case 'MAIN':
        return H265Tier.main;
    }
    throw Exception('$this is not known in enum H265Tier');
  }
}

/// H265 Timecode Insertion Behavior
enum H265TimecodeInsertionBehavior {
  disabled,
  picTimingSei,
}

extension on H265TimecodeInsertionBehavior {
  String toValue() {
    switch (this) {
      case H265TimecodeInsertionBehavior.disabled:
        return 'DISABLED';
      case H265TimecodeInsertionBehavior.picTimingSei:
        return 'PIC_TIMING_SEI';
    }
  }
}

extension on String {
  H265TimecodeInsertionBehavior toH265TimecodeInsertionBehavior() {
    switch (this) {
      case 'DISABLED':
        return H265TimecodeInsertionBehavior.disabled;
      case 'PIC_TIMING_SEI':
        return H265TimecodeInsertionBehavior.picTimingSei;
    }
    throw Exception('$this is not known in enum H265TimecodeInsertionBehavior');
  }
}

/// Hdr10 Settings
class Hdr10Settings {
  /// Maximum Content Light Level
  /// An integer metadata value defining the maximum light level, in nits,
  /// of any single pixel within an encoded HDR video stream or file.
  final int? maxCll;

  /// Maximum Frame Average Light Level
  /// An integer metadata value defining the maximum average light level, in nits,
  /// for any single frame within an encoded HDR video stream or file.
  final int? maxFall;

  Hdr10Settings({
    this.maxCll,
    this.maxFall,
  });

  factory Hdr10Settings.fromJson(Map<String, dynamic> json) {
    return Hdr10Settings(
      maxCll: json['maxCll'] as int?,
      maxFall: json['maxFall'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxCll = this.maxCll;
    final maxFall = this.maxFall;
    return {
      if (maxCll != null) 'maxCll': maxCll,
      if (maxFall != null) 'maxFall': maxFall,
    };
  }
}

/// Hls Ad Markers
enum HlsAdMarkers {
  adobe,
  elemental,
  elementalScte35,
}

extension on HlsAdMarkers {
  String toValue() {
    switch (this) {
      case HlsAdMarkers.adobe:
        return 'ADOBE';
      case HlsAdMarkers.elemental:
        return 'ELEMENTAL';
      case HlsAdMarkers.elementalScte35:
        return 'ELEMENTAL_SCTE35';
    }
  }
}

extension on String {
  HlsAdMarkers toHlsAdMarkers() {
    switch (this) {
      case 'ADOBE':
        return HlsAdMarkers.adobe;
      case 'ELEMENTAL':
        return HlsAdMarkers.elemental;
      case 'ELEMENTAL_SCTE35':
        return HlsAdMarkers.elementalScte35;
    }
    throw Exception('$this is not known in enum HlsAdMarkers');
  }
}

/// Hls Akamai Http Transfer Mode
enum HlsAkamaiHttpTransferMode {
  chunked,
  nonChunked,
}

extension on HlsAkamaiHttpTransferMode {
  String toValue() {
    switch (this) {
      case HlsAkamaiHttpTransferMode.chunked:
        return 'CHUNKED';
      case HlsAkamaiHttpTransferMode.nonChunked:
        return 'NON_CHUNKED';
    }
  }
}

extension on String {
  HlsAkamaiHttpTransferMode toHlsAkamaiHttpTransferMode() {
    switch (this) {
      case 'CHUNKED':
        return HlsAkamaiHttpTransferMode.chunked;
      case 'NON_CHUNKED':
        return HlsAkamaiHttpTransferMode.nonChunked;
    }
    throw Exception('$this is not known in enum HlsAkamaiHttpTransferMode');
  }
}

/// Hls Akamai Settings
class HlsAkamaiSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int? connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int? filecacheDuration;

  /// Specify whether or not to use chunked transfer encoding to Akamai. User
  /// should contact Akamai to enable this feature.
  final HlsAkamaiHttpTransferMode? httpTransferMode;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  final int? numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int? restartDelay;

  /// Salt for authenticated Akamai.
  final String? salt;

  /// Token parameter for authenticated akamai. If not specified, _gda_ is used.
  final String? token;

  HlsAkamaiSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.httpTransferMode,
    this.numRetries,
    this.restartDelay,
    this.salt,
    this.token,
  });

  factory HlsAkamaiSettings.fromJson(Map<String, dynamic> json) {
    return HlsAkamaiSettings(
      connectionRetryInterval: json['connectionRetryInterval'] as int?,
      filecacheDuration: json['filecacheDuration'] as int?,
      httpTransferMode:
          (json['httpTransferMode'] as String?)?.toHlsAkamaiHttpTransferMode(),
      numRetries: json['numRetries'] as int?,
      restartDelay: json['restartDelay'] as int?,
      salt: json['salt'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionRetryInterval = this.connectionRetryInterval;
    final filecacheDuration = this.filecacheDuration;
    final httpTransferMode = this.httpTransferMode;
    final numRetries = this.numRetries;
    final restartDelay = this.restartDelay;
    final salt = this.salt;
    final token = this.token;
    return {
      if (connectionRetryInterval != null)
        'connectionRetryInterval': connectionRetryInterval,
      if (filecacheDuration != null) 'filecacheDuration': filecacheDuration,
      if (httpTransferMode != null)
        'httpTransferMode': httpTransferMode.toValue(),
      if (numRetries != null) 'numRetries': numRetries,
      if (restartDelay != null) 'restartDelay': restartDelay,
      if (salt != null) 'salt': salt,
      if (token != null) 'token': token,
    };
  }
}

/// Hls Basic Put Settings
class HlsBasicPutSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int? connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int? filecacheDuration;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  final int? numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int? restartDelay;

  HlsBasicPutSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.numRetries,
    this.restartDelay,
  });

  factory HlsBasicPutSettings.fromJson(Map<String, dynamic> json) {
    return HlsBasicPutSettings(
      connectionRetryInterval: json['connectionRetryInterval'] as int?,
      filecacheDuration: json['filecacheDuration'] as int?,
      numRetries: json['numRetries'] as int?,
      restartDelay: json['restartDelay'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionRetryInterval = this.connectionRetryInterval;
    final filecacheDuration = this.filecacheDuration;
    final numRetries = this.numRetries;
    final restartDelay = this.restartDelay;
    return {
      if (connectionRetryInterval != null)
        'connectionRetryInterval': connectionRetryInterval,
      if (filecacheDuration != null) 'filecacheDuration': filecacheDuration,
      if (numRetries != null) 'numRetries': numRetries,
      if (restartDelay != null) 'restartDelay': restartDelay,
    };
  }
}

/// Hls Caption Language Setting
enum HlsCaptionLanguageSetting {
  insert,
  none,
  omit,
}

extension on HlsCaptionLanguageSetting {
  String toValue() {
    switch (this) {
      case HlsCaptionLanguageSetting.insert:
        return 'INSERT';
      case HlsCaptionLanguageSetting.none:
        return 'NONE';
      case HlsCaptionLanguageSetting.omit:
        return 'OMIT';
    }
  }
}

extension on String {
  HlsCaptionLanguageSetting toHlsCaptionLanguageSetting() {
    switch (this) {
      case 'INSERT':
        return HlsCaptionLanguageSetting.insert;
      case 'NONE':
        return HlsCaptionLanguageSetting.none;
      case 'OMIT':
        return HlsCaptionLanguageSetting.omit;
    }
    throw Exception('$this is not known in enum HlsCaptionLanguageSetting');
  }
}

/// Hls Cdn Settings
class HlsCdnSettings {
  final HlsAkamaiSettings? hlsAkamaiSettings;
  final HlsBasicPutSettings? hlsBasicPutSettings;
  final HlsMediaStoreSettings? hlsMediaStoreSettings;
  final HlsS3Settings? hlsS3Settings;
  final HlsWebdavSettings? hlsWebdavSettings;

  HlsCdnSettings({
    this.hlsAkamaiSettings,
    this.hlsBasicPutSettings,
    this.hlsMediaStoreSettings,
    this.hlsS3Settings,
    this.hlsWebdavSettings,
  });

  factory HlsCdnSettings.fromJson(Map<String, dynamic> json) {
    return HlsCdnSettings(
      hlsAkamaiSettings: json['hlsAkamaiSettings'] != null
          ? HlsAkamaiSettings.fromJson(
              json['hlsAkamaiSettings'] as Map<String, dynamic>)
          : null,
      hlsBasicPutSettings: json['hlsBasicPutSettings'] != null
          ? HlsBasicPutSettings.fromJson(
              json['hlsBasicPutSettings'] as Map<String, dynamic>)
          : null,
      hlsMediaStoreSettings: json['hlsMediaStoreSettings'] != null
          ? HlsMediaStoreSettings.fromJson(
              json['hlsMediaStoreSettings'] as Map<String, dynamic>)
          : null,
      hlsS3Settings: json['hlsS3Settings'] != null
          ? HlsS3Settings.fromJson(
              json['hlsS3Settings'] as Map<String, dynamic>)
          : null,
      hlsWebdavSettings: json['hlsWebdavSettings'] != null
          ? HlsWebdavSettings.fromJson(
              json['hlsWebdavSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hlsAkamaiSettings = this.hlsAkamaiSettings;
    final hlsBasicPutSettings = this.hlsBasicPutSettings;
    final hlsMediaStoreSettings = this.hlsMediaStoreSettings;
    final hlsS3Settings = this.hlsS3Settings;
    final hlsWebdavSettings = this.hlsWebdavSettings;
    return {
      if (hlsAkamaiSettings != null) 'hlsAkamaiSettings': hlsAkamaiSettings,
      if (hlsBasicPutSettings != null)
        'hlsBasicPutSettings': hlsBasicPutSettings,
      if (hlsMediaStoreSettings != null)
        'hlsMediaStoreSettings': hlsMediaStoreSettings,
      if (hlsS3Settings != null) 'hlsS3Settings': hlsS3Settings,
      if (hlsWebdavSettings != null) 'hlsWebdavSettings': hlsWebdavSettings,
    };
  }
}

/// Hls Client Cache
enum HlsClientCache {
  disabled,
  enabled,
}

extension on HlsClientCache {
  String toValue() {
    switch (this) {
      case HlsClientCache.disabled:
        return 'DISABLED';
      case HlsClientCache.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  HlsClientCache toHlsClientCache() {
    switch (this) {
      case 'DISABLED':
        return HlsClientCache.disabled;
      case 'ENABLED':
        return HlsClientCache.enabled;
    }
    throw Exception('$this is not known in enum HlsClientCache');
  }
}

/// Hls Codec Specification
enum HlsCodecSpecification {
  rfc_4281,
  rfc_6381,
}

extension on HlsCodecSpecification {
  String toValue() {
    switch (this) {
      case HlsCodecSpecification.rfc_4281:
        return 'RFC_4281';
      case HlsCodecSpecification.rfc_6381:
        return 'RFC_6381';
    }
  }
}

extension on String {
  HlsCodecSpecification toHlsCodecSpecification() {
    switch (this) {
      case 'RFC_4281':
        return HlsCodecSpecification.rfc_4281;
      case 'RFC_6381':
        return HlsCodecSpecification.rfc_6381;
    }
    throw Exception('$this is not known in enum HlsCodecSpecification');
  }
}

/// Hls Directory Structure
enum HlsDirectoryStructure {
  singleDirectory,
  subdirectoryPerStream,
}

extension on HlsDirectoryStructure {
  String toValue() {
    switch (this) {
      case HlsDirectoryStructure.singleDirectory:
        return 'SINGLE_DIRECTORY';
      case HlsDirectoryStructure.subdirectoryPerStream:
        return 'SUBDIRECTORY_PER_STREAM';
    }
  }
}

extension on String {
  HlsDirectoryStructure toHlsDirectoryStructure() {
    switch (this) {
      case 'SINGLE_DIRECTORY':
        return HlsDirectoryStructure.singleDirectory;
      case 'SUBDIRECTORY_PER_STREAM':
        return HlsDirectoryStructure.subdirectoryPerStream;
    }
    throw Exception('$this is not known in enum HlsDirectoryStructure');
  }
}

/// Hls Discontinuity Tags
enum HlsDiscontinuityTags {
  insert,
  neverInsert,
}

extension on HlsDiscontinuityTags {
  String toValue() {
    switch (this) {
      case HlsDiscontinuityTags.insert:
        return 'INSERT';
      case HlsDiscontinuityTags.neverInsert:
        return 'NEVER_INSERT';
    }
  }
}

extension on String {
  HlsDiscontinuityTags toHlsDiscontinuityTags() {
    switch (this) {
      case 'INSERT':
        return HlsDiscontinuityTags.insert;
      case 'NEVER_INSERT':
        return HlsDiscontinuityTags.neverInsert;
    }
    throw Exception('$this is not known in enum HlsDiscontinuityTags');
  }
}

/// Hls Encryption Type
enum HlsEncryptionType {
  aes128,
  sampleAes,
}

extension on HlsEncryptionType {
  String toValue() {
    switch (this) {
      case HlsEncryptionType.aes128:
        return 'AES128';
      case HlsEncryptionType.sampleAes:
        return 'SAMPLE_AES';
    }
  }
}

extension on String {
  HlsEncryptionType toHlsEncryptionType() {
    switch (this) {
      case 'AES128':
        return HlsEncryptionType.aes128;
      case 'SAMPLE_AES':
        return HlsEncryptionType.sampleAes;
    }
    throw Exception('$this is not known in enum HlsEncryptionType');
  }
}

/// Hls Group Settings
class HlsGroupSettings {
  /// A directory or HTTP destination for the HLS segments, manifest files, and
  /// encryption keys (if enabled).
  final OutputLocationRef destination;

  /// Choose one or more ad marker types to pass SCTE35 signals through to this
  /// group of Apple HLS outputs.
  final List<HlsAdMarkers>? adMarkers;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  final String? baseUrlContent;

  /// Optional. One value per output group.
  ///
  /// This field is required only if you are completing Base URL content A, and
  /// the downstream system has notified you that the media files for pipeline 1
  /// of all outputs are in a location different from the media files for pipeline
  /// 0.
  final String? baseUrlContent1;

  /// A partial URI prefix that will be prepended to each output in the media
  /// .m3u8 file. Can be used if base manifest is delivered from a different URL
  /// than the main .m3u8 file.
  final String? baseUrlManifest;

  /// Optional. One value per output group.
  ///
  /// Complete this field only if you are completing Base URL manifest A, and the
  /// downstream system has notified you that the child manifest files for
  /// pipeline 1 of all outputs are in a location different from the child
  /// manifest files for pipeline 0.
  final String? baseUrlManifest1;

  /// Mapping of up to 4 caption channels to caption languages.  Is only
  /// meaningful if captionLanguageSetting is set to "insert".
  final List<CaptionLanguageMapping>? captionLanguageMappings;

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
  final HlsCaptionLanguageSetting? captionLanguageSetting;

  /// When set to "disabled", sets the #EXT-X-ALLOW-CACHE:no tag in the manifest,
  /// which prevents clients from saving media segments for later replay.
  final HlsClientCache? clientCache;

  /// Specification to use (RFC-6381 or the default RFC-4281) during m3u8 playlist
  /// generation.
  final HlsCodecSpecification? codecSpecification;

  /// For use with encryptionType. This is a 128-bit, 16-byte hex value
  /// represented by a 32-character text string. If ivSource is set to "explicit"
  /// then this parameter is required and is used as the IV for encryption.
  final String? constantIv;

  /// Place segments in subdirectories.
  final HlsDirectoryStructure? directoryStructure;

  /// Specifies whether to insert EXT-X-DISCONTINUITY tags in the HLS child
  /// manifests for this output group.
  /// Typically, choose Insert because these tags are required in the manifest
  /// (according to the HLS specification) and serve an important purpose.
  /// Choose Never Insert only if the downstream system is doing real-time
  /// failover (without using the MediaLive automatic failover feature) and only
  /// if that downstream system has advised you to exclude the tags.
  final HlsDiscontinuityTags? discontinuityTags;

  /// Encrypts the segments with the given encryption scheme.  Exclude this
  /// parameter if no encryption is desired.
  final HlsEncryptionType? encryptionType;

  /// Parameters that control interactions with the CDN.
  final HlsCdnSettings? hlsCdnSettings;

  /// State of HLS ID3 Segment Tagging
  final HlsId3SegmentTaggingState? hlsId3SegmentTagging;

  /// DISABLED: Do not create an I-frame-only manifest, but do create the master
  /// and media manifests (according to the Output Selection field).
  ///
  /// STANDARD: Create an I-frame-only manifest for each output that contains
  /// video, as well as the other manifests (according to the Output Selection
  /// field). The I-frame manifest contains a #EXT-X-I-FRAMES-ONLY tag to indicate
  /// it is I-frame only, and one or more #EXT-X-BYTERANGE entries identifying the
  /// I-frame position. For example, #EXT-X-BYTERANGE:160364@1461888"
  final IFrameOnlyPlaylistType? iFrameOnlyPlaylists;

  /// Specifies whether to include the final (incomplete) segment in the media
  /// output when the pipeline stops producing output because of a channel stop, a
  /// channel pause or a loss of input to the pipeline.
  /// Auto means that MediaLive decides whether to include the final segment,
  /// depending on the channel class and the types of output groups.
  /// Suppress means to never include the incomplete segment. We recommend you
  /// choose Auto and let MediaLive control the behavior.
  final HlsIncompleteSegmentBehavior? incompleteSegmentBehavior;

  /// Applies only if Mode field is LIVE.
  ///
  /// Specifies the maximum number of segments in the media manifest file. After
  /// this maximum, older segments are removed from the media manifest. This
  /// number must be smaller than the number in the Keep Segments field.
  final int? indexNSegments;

  /// Parameter that control output group behavior on input loss.
  final InputLossActionForHlsOut? inputLossAction;

  /// For use with encryptionType. The IV (Initialization Vector) is a 128-bit
  /// number used in conjunction with the key for encrypting blocks. If set to
  /// "include", IV is listed in the manifest, otherwise the IV is not in the
  /// manifest.
  final HlsIvInManifest? ivInManifest;

  /// For use with encryptionType. The IV (Initialization Vector) is a 128-bit
  /// number used in conjunction with the key for encrypting blocks. If this
  /// setting is "followsSegmentNumber", it will cause the IV to change every
  /// segment (to match the segment number). If this is set to "explicit", you
  /// must enter a constantIv value.
  final HlsIvSource? ivSource;

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
  final int? keepSegments;

  /// The value specifies how the key is represented in the resource identified by
  /// the URI.  If parameter is absent, an implicit value of "identity" is used.
  /// A reverse DNS string can also be given.
  final String? keyFormat;

  /// Either a single positive integer version value or a slash delimited list of
  /// version values (1/2/3).
  final String? keyFormatVersions;

  /// The key provider settings.
  final KeyProviderSettings? keyProviderSettings;

  /// When set to gzip, compresses HLS playlist.
  final HlsManifestCompression? manifestCompression;

  /// Indicates whether the output manifest should use floating point or integer
  /// values for segment duration.
  final HlsManifestDurationFormat? manifestDurationFormat;

  /// When set, minimumSegmentLength is enforced by looking ahead and back within
  /// the specified range for a nearby avail and extending the segment size if
  /// needed.
  final int? minSegmentLength;

  /// If "vod", all segments are indexed and kept permanently in the destination
  /// and manifest. If "live", only the number segments specified in keepSegments
  /// and indexNSegments are kept; newer segments replace older segments, which
  /// may prevent players from rewinding all the way to the beginning of the
  /// event.
  ///
  /// VOD mode uses HLS EXT-X-PLAYLIST-TYPE of EVENT while the channel is running,
  /// converting it to a "VOD" type manifest on completion of the stream.
  final HlsMode? mode;

  /// MANIFESTS_AND_SEGMENTS: Generates manifests (master manifest, if applicable,
  /// and media manifests) for this output group.
  ///
  /// VARIANT_MANIFESTS_AND_SEGMENTS: Generates media manifests for this output
  /// group, but not a master manifest.
  ///
  /// SEGMENTS_ONLY: Does not generate any manifests for this output group.
  final HlsOutputSelection? outputSelection;

  /// Includes or excludes EXT-X-PROGRAM-DATE-TIME tag in .m3u8 manifest files.
  /// The value is calculated as follows: either the program date and time are
  /// initialized using the input timecode source, or the time is initialized
  /// using the input timecode source and the date is initialized using the
  /// timestampOffset.
  final HlsProgramDateTime? programDateTime;

  /// Period of insertion of EXT-X-PROGRAM-DATE-TIME entry, in seconds.
  final int? programDateTimePeriod;

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
  final HlsRedundantManifest? redundantManifest;

  /// Length of MPEG-2 Transport Stream segments to create (in seconds). Note that
  /// segments will end on the next keyframe after this number of seconds, so
  /// actual segment length may be longer.
  final int? segmentLength;

  /// useInputSegmentation has been deprecated. The configured segment size is
  /// always used.
  final HlsSegmentationMode? segmentationMode;

  /// Number of segments to write to a subdirectory before starting a new one.
  /// directoryStructure must be subdirectoryPerStream for this setting to have an
  /// effect.
  final int? segmentsPerSubdirectory;

  /// Include or exclude RESOLUTION attribute for video in EXT-X-STREAM-INF tag of
  /// variant manifest.
  final HlsStreamInfResolution? streamInfResolution;

  /// Indicates ID3 frame that has the timecode.
  final HlsTimedMetadataId3Frame? timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  final int? timedMetadataId3Period;

  /// Provides an extra millisecond delta offset to fine tune the timestamps.
  final int? timestampDeltaMilliseconds;

  /// SEGMENTED_FILES: Emit the program as segments - multiple .ts media files.
  ///
  /// SINGLE_FILE: Applies only if Mode field is VOD. Emit the program as a single
  /// .ts media file. The media manifest includes #EXT-X-BYTERANGE tags to index
  /// segments for playback. A typical use for this value is when sending the
  /// output to AWS Elemental MediaConvert, which can accept only a single media
  /// file. Playback while the channel is running is not guaranteed due to HTTP
  /// server caching.
  final HlsTsFileMode? tsFileMode;

  HlsGroupSettings({
    required this.destination,
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

  factory HlsGroupSettings.fromJson(Map<String, dynamic> json) {
    return HlsGroupSettings(
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
      adMarkers: (json['adMarkers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toHlsAdMarkers())
          .toList(),
      baseUrlContent: json['baseUrlContent'] as String?,
      baseUrlContent1: json['baseUrlContent1'] as String?,
      baseUrlManifest: json['baseUrlManifest'] as String?,
      baseUrlManifest1: json['baseUrlManifest1'] as String?,
      captionLanguageMappings: (json['captionLanguageMappings'] as List?)
          ?.whereNotNull()
          .map(
              (e) => CaptionLanguageMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      captionLanguageSetting: (json['captionLanguageSetting'] as String?)
          ?.toHlsCaptionLanguageSetting(),
      clientCache: (json['clientCache'] as String?)?.toHlsClientCache(),
      codecSpecification:
          (json['codecSpecification'] as String?)?.toHlsCodecSpecification(),
      constantIv: json['constantIv'] as String?,
      directoryStructure:
          (json['directoryStructure'] as String?)?.toHlsDirectoryStructure(),
      discontinuityTags:
          (json['discontinuityTags'] as String?)?.toHlsDiscontinuityTags(),
      encryptionType:
          (json['encryptionType'] as String?)?.toHlsEncryptionType(),
      hlsCdnSettings: json['hlsCdnSettings'] != null
          ? HlsCdnSettings.fromJson(
              json['hlsCdnSettings'] as Map<String, dynamic>)
          : null,
      hlsId3SegmentTagging: (json['hlsId3SegmentTagging'] as String?)
          ?.toHlsId3SegmentTaggingState(),
      iFrameOnlyPlaylists:
          (json['iFrameOnlyPlaylists'] as String?)?.toIFrameOnlyPlaylistType(),
      incompleteSegmentBehavior: (json['incompleteSegmentBehavior'] as String?)
          ?.toHlsIncompleteSegmentBehavior(),
      indexNSegments: json['indexNSegments'] as int?,
      inputLossAction:
          (json['inputLossAction'] as String?)?.toInputLossActionForHlsOut(),
      ivInManifest: (json['ivInManifest'] as String?)?.toHlsIvInManifest(),
      ivSource: (json['ivSource'] as String?)?.toHlsIvSource(),
      keepSegments: json['keepSegments'] as int?,
      keyFormat: json['keyFormat'] as String?,
      keyFormatVersions: json['keyFormatVersions'] as String?,
      keyProviderSettings: json['keyProviderSettings'] != null
          ? KeyProviderSettings.fromJson(
              json['keyProviderSettings'] as Map<String, dynamic>)
          : null,
      manifestCompression:
          (json['manifestCompression'] as String?)?.toHlsManifestCompression(),
      manifestDurationFormat: (json['manifestDurationFormat'] as String?)
          ?.toHlsManifestDurationFormat(),
      minSegmentLength: json['minSegmentLength'] as int?,
      mode: (json['mode'] as String?)?.toHlsMode(),
      outputSelection:
          (json['outputSelection'] as String?)?.toHlsOutputSelection(),
      programDateTime:
          (json['programDateTime'] as String?)?.toHlsProgramDateTime(),
      programDateTimePeriod: json['programDateTimePeriod'] as int?,
      redundantManifest:
          (json['redundantManifest'] as String?)?.toHlsRedundantManifest(),
      segmentLength: json['segmentLength'] as int?,
      segmentationMode:
          (json['segmentationMode'] as String?)?.toHlsSegmentationMode(),
      segmentsPerSubdirectory: json['segmentsPerSubdirectory'] as int?,
      streamInfResolution:
          (json['streamInfResolution'] as String?)?.toHlsStreamInfResolution(),
      timedMetadataId3Frame: (json['timedMetadataId3Frame'] as String?)
          ?.toHlsTimedMetadataId3Frame(),
      timedMetadataId3Period: json['timedMetadataId3Period'] as int?,
      timestampDeltaMilliseconds: json['timestampDeltaMilliseconds'] as int?,
      tsFileMode: (json['tsFileMode'] as String?)?.toHlsTsFileMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final adMarkers = this.adMarkers;
    final baseUrlContent = this.baseUrlContent;
    final baseUrlContent1 = this.baseUrlContent1;
    final baseUrlManifest = this.baseUrlManifest;
    final baseUrlManifest1 = this.baseUrlManifest1;
    final captionLanguageMappings = this.captionLanguageMappings;
    final captionLanguageSetting = this.captionLanguageSetting;
    final clientCache = this.clientCache;
    final codecSpecification = this.codecSpecification;
    final constantIv = this.constantIv;
    final directoryStructure = this.directoryStructure;
    final discontinuityTags = this.discontinuityTags;
    final encryptionType = this.encryptionType;
    final hlsCdnSettings = this.hlsCdnSettings;
    final hlsId3SegmentTagging = this.hlsId3SegmentTagging;
    final iFrameOnlyPlaylists = this.iFrameOnlyPlaylists;
    final incompleteSegmentBehavior = this.incompleteSegmentBehavior;
    final indexNSegments = this.indexNSegments;
    final inputLossAction = this.inputLossAction;
    final ivInManifest = this.ivInManifest;
    final ivSource = this.ivSource;
    final keepSegments = this.keepSegments;
    final keyFormat = this.keyFormat;
    final keyFormatVersions = this.keyFormatVersions;
    final keyProviderSettings = this.keyProviderSettings;
    final manifestCompression = this.manifestCompression;
    final manifestDurationFormat = this.manifestDurationFormat;
    final minSegmentLength = this.minSegmentLength;
    final mode = this.mode;
    final outputSelection = this.outputSelection;
    final programDateTime = this.programDateTime;
    final programDateTimePeriod = this.programDateTimePeriod;
    final redundantManifest = this.redundantManifest;
    final segmentLength = this.segmentLength;
    final segmentationMode = this.segmentationMode;
    final segmentsPerSubdirectory = this.segmentsPerSubdirectory;
    final streamInfResolution = this.streamInfResolution;
    final timedMetadataId3Frame = this.timedMetadataId3Frame;
    final timedMetadataId3Period = this.timedMetadataId3Period;
    final timestampDeltaMilliseconds = this.timestampDeltaMilliseconds;
    final tsFileMode = this.tsFileMode;
    return {
      'destination': destination,
      if (adMarkers != null)
        'adMarkers': adMarkers.map((e) => e.toValue()).toList(),
      if (baseUrlContent != null) 'baseUrlContent': baseUrlContent,
      if (baseUrlContent1 != null) 'baseUrlContent1': baseUrlContent1,
      if (baseUrlManifest != null) 'baseUrlManifest': baseUrlManifest,
      if (baseUrlManifest1 != null) 'baseUrlManifest1': baseUrlManifest1,
      if (captionLanguageMappings != null)
        'captionLanguageMappings': captionLanguageMappings,
      if (captionLanguageSetting != null)
        'captionLanguageSetting': captionLanguageSetting.toValue(),
      if (clientCache != null) 'clientCache': clientCache.toValue(),
      if (codecSpecification != null)
        'codecSpecification': codecSpecification.toValue(),
      if (constantIv != null) 'constantIv': constantIv,
      if (directoryStructure != null)
        'directoryStructure': directoryStructure.toValue(),
      if (discontinuityTags != null)
        'discontinuityTags': discontinuityTags.toValue(),
      if (encryptionType != null) 'encryptionType': encryptionType.toValue(),
      if (hlsCdnSettings != null) 'hlsCdnSettings': hlsCdnSettings,
      if (hlsId3SegmentTagging != null)
        'hlsId3SegmentTagging': hlsId3SegmentTagging.toValue(),
      if (iFrameOnlyPlaylists != null)
        'iFrameOnlyPlaylists': iFrameOnlyPlaylists.toValue(),
      if (incompleteSegmentBehavior != null)
        'incompleteSegmentBehavior': incompleteSegmentBehavior.toValue(),
      if (indexNSegments != null) 'indexNSegments': indexNSegments,
      if (inputLossAction != null) 'inputLossAction': inputLossAction.toValue(),
      if (ivInManifest != null) 'ivInManifest': ivInManifest.toValue(),
      if (ivSource != null) 'ivSource': ivSource.toValue(),
      if (keepSegments != null) 'keepSegments': keepSegments,
      if (keyFormat != null) 'keyFormat': keyFormat,
      if (keyFormatVersions != null) 'keyFormatVersions': keyFormatVersions,
      if (keyProviderSettings != null)
        'keyProviderSettings': keyProviderSettings,
      if (manifestCompression != null)
        'manifestCompression': manifestCompression.toValue(),
      if (manifestDurationFormat != null)
        'manifestDurationFormat': manifestDurationFormat.toValue(),
      if (minSegmentLength != null) 'minSegmentLength': minSegmentLength,
      if (mode != null) 'mode': mode.toValue(),
      if (outputSelection != null) 'outputSelection': outputSelection.toValue(),
      if (programDateTime != null) 'programDateTime': programDateTime.toValue(),
      if (programDateTimePeriod != null)
        'programDateTimePeriod': programDateTimePeriod,
      if (redundantManifest != null)
        'redundantManifest': redundantManifest.toValue(),
      if (segmentLength != null) 'segmentLength': segmentLength,
      if (segmentationMode != null)
        'segmentationMode': segmentationMode.toValue(),
      if (segmentsPerSubdirectory != null)
        'segmentsPerSubdirectory': segmentsPerSubdirectory,
      if (streamInfResolution != null)
        'streamInfResolution': streamInfResolution.toValue(),
      if (timedMetadataId3Frame != null)
        'timedMetadataId3Frame': timedMetadataId3Frame.toValue(),
      if (timedMetadataId3Period != null)
        'timedMetadataId3Period': timedMetadataId3Period,
      if (timestampDeltaMilliseconds != null)
        'timestampDeltaMilliseconds': timestampDeltaMilliseconds,
      if (tsFileMode != null) 'tsFileMode': tsFileMode.toValue(),
    };
  }
}

/// Hls H265 Packaging Type
enum HlsH265PackagingType {
  hev1,
  hvc1,
}

extension on HlsH265PackagingType {
  String toValue() {
    switch (this) {
      case HlsH265PackagingType.hev1:
        return 'HEV1';
      case HlsH265PackagingType.hvc1:
        return 'HVC1';
    }
  }
}

extension on String {
  HlsH265PackagingType toHlsH265PackagingType() {
    switch (this) {
      case 'HEV1':
        return HlsH265PackagingType.hev1;
      case 'HVC1':
        return HlsH265PackagingType.hvc1;
    }
    throw Exception('$this is not known in enum HlsH265PackagingType');
  }
}

/// Settings for the action to insert a user-defined ID3 tag in each HLS segment
class HlsId3SegmentTaggingScheduleActionSettings {
  /// ID3 tag to insert into each segment. Supports special keyword identifiers to
  /// substitute in segment-related values.\nSupported keyword identifiers:
  /// https://docs.aws.amazon.com/medialive/latest/ug/variable-data-identifiers.html
  final String tag;

  HlsId3SegmentTaggingScheduleActionSettings({
    required this.tag,
  });

  factory HlsId3SegmentTaggingScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return HlsId3SegmentTaggingScheduleActionSettings(
      tag: json['tag'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final tag = this.tag;
    return {
      'tag': tag,
    };
  }
}

/// State of HLS ID3 Segment Tagging
enum HlsId3SegmentTaggingState {
  disabled,
  enabled,
}

extension on HlsId3SegmentTaggingState {
  String toValue() {
    switch (this) {
      case HlsId3SegmentTaggingState.disabled:
        return 'DISABLED';
      case HlsId3SegmentTaggingState.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  HlsId3SegmentTaggingState toHlsId3SegmentTaggingState() {
    switch (this) {
      case 'DISABLED':
        return HlsId3SegmentTaggingState.disabled;
      case 'ENABLED':
        return HlsId3SegmentTaggingState.enabled;
    }
    throw Exception('$this is not known in enum HlsId3SegmentTaggingState');
  }
}

/// Hls Incomplete Segment Behavior
enum HlsIncompleteSegmentBehavior {
  auto,
  suppress,
}

extension on HlsIncompleteSegmentBehavior {
  String toValue() {
    switch (this) {
      case HlsIncompleteSegmentBehavior.auto:
        return 'AUTO';
      case HlsIncompleteSegmentBehavior.suppress:
        return 'SUPPRESS';
    }
  }
}

extension on String {
  HlsIncompleteSegmentBehavior toHlsIncompleteSegmentBehavior() {
    switch (this) {
      case 'AUTO':
        return HlsIncompleteSegmentBehavior.auto;
      case 'SUPPRESS':
        return HlsIncompleteSegmentBehavior.suppress;
    }
    throw Exception('$this is not known in enum HlsIncompleteSegmentBehavior');
  }
}

/// Hls Input Settings
class HlsInputSettings {
  /// When specified the HLS stream with the m3u8 BANDWIDTH that most closely
  /// matches this value will be chosen, otherwise the highest bandwidth stream in
  /// the m3u8 will be chosen.  The bitrate is specified in bits per second, as in
  /// an HLS manifest.
  final int? bandwidth;

  /// When specified, reading of the HLS input will begin this many buffer
  /// segments from the end (most recently written segment).  When not specified,
  /// the HLS input will begin with the first segment specified in the m3u8.
  final int? bufferSegments;

  /// The number of consecutive times that attempts to read a manifest or segment
  /// must fail before the input is considered unavailable.
  final int? retries;

  /// The number of seconds between retries when an attempt to read a manifest or
  /// segment fails.
  final int? retryInterval;

  /// Identifies the source for the SCTE-35 messages that MediaLive will ingest.
  /// Messages can be ingested from the content segments (in the stream) or from
  /// tags in the playlist (the HLS manifest). MediaLive ignores SCTE-35
  /// information in the source that is not selected.
  final HlsScte35SourceType? scte35Source;

  HlsInputSettings({
    this.bandwidth,
    this.bufferSegments,
    this.retries,
    this.retryInterval,
    this.scte35Source,
  });

  factory HlsInputSettings.fromJson(Map<String, dynamic> json) {
    return HlsInputSettings(
      bandwidth: json['bandwidth'] as int?,
      bufferSegments: json['bufferSegments'] as int?,
      retries: json['retries'] as int?,
      retryInterval: json['retryInterval'] as int?,
      scte35Source: (json['scte35Source'] as String?)?.toHlsScte35SourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final bandwidth = this.bandwidth;
    final bufferSegments = this.bufferSegments;
    final retries = this.retries;
    final retryInterval = this.retryInterval;
    final scte35Source = this.scte35Source;
    return {
      if (bandwidth != null) 'bandwidth': bandwidth,
      if (bufferSegments != null) 'bufferSegments': bufferSegments,
      if (retries != null) 'retries': retries,
      if (retryInterval != null) 'retryInterval': retryInterval,
      if (scte35Source != null) 'scte35Source': scte35Source.toValue(),
    };
  }
}

/// Hls Iv In Manifest
enum HlsIvInManifest {
  exclude,
  include,
}

extension on HlsIvInManifest {
  String toValue() {
    switch (this) {
      case HlsIvInManifest.exclude:
        return 'EXCLUDE';
      case HlsIvInManifest.include:
        return 'INCLUDE';
    }
  }
}

extension on String {
  HlsIvInManifest toHlsIvInManifest() {
    switch (this) {
      case 'EXCLUDE':
        return HlsIvInManifest.exclude;
      case 'INCLUDE':
        return HlsIvInManifest.include;
    }
    throw Exception('$this is not known in enum HlsIvInManifest');
  }
}

/// Hls Iv Source
enum HlsIvSource {
  explicit,
  followsSegmentNumber,
}

extension on HlsIvSource {
  String toValue() {
    switch (this) {
      case HlsIvSource.explicit:
        return 'EXPLICIT';
      case HlsIvSource.followsSegmentNumber:
        return 'FOLLOWS_SEGMENT_NUMBER';
    }
  }
}

extension on String {
  HlsIvSource toHlsIvSource() {
    switch (this) {
      case 'EXPLICIT':
        return HlsIvSource.explicit;
      case 'FOLLOWS_SEGMENT_NUMBER':
        return HlsIvSource.followsSegmentNumber;
    }
    throw Exception('$this is not known in enum HlsIvSource');
  }
}

/// Hls Manifest Compression
enum HlsManifestCompression {
  gzip,
  none,
}

extension on HlsManifestCompression {
  String toValue() {
    switch (this) {
      case HlsManifestCompression.gzip:
        return 'GZIP';
      case HlsManifestCompression.none:
        return 'NONE';
    }
  }
}

extension on String {
  HlsManifestCompression toHlsManifestCompression() {
    switch (this) {
      case 'GZIP':
        return HlsManifestCompression.gzip;
      case 'NONE':
        return HlsManifestCompression.none;
    }
    throw Exception('$this is not known in enum HlsManifestCompression');
  }
}

/// Hls Manifest Duration Format
enum HlsManifestDurationFormat {
  floatingPoint,
  integer,
}

extension on HlsManifestDurationFormat {
  String toValue() {
    switch (this) {
      case HlsManifestDurationFormat.floatingPoint:
        return 'FLOATING_POINT';
      case HlsManifestDurationFormat.integer:
        return 'INTEGER';
    }
  }
}

extension on String {
  HlsManifestDurationFormat toHlsManifestDurationFormat() {
    switch (this) {
      case 'FLOATING_POINT':
        return HlsManifestDurationFormat.floatingPoint;
      case 'INTEGER':
        return HlsManifestDurationFormat.integer;
    }
    throw Exception('$this is not known in enum HlsManifestDurationFormat');
  }
}

/// Hls Media Store Settings
class HlsMediaStoreSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int? connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int? filecacheDuration;

  /// When set to temporal, output files are stored in non-persistent memory for
  /// faster reading and writing.
  final HlsMediaStoreStorageClass? mediaStoreStorageClass;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  final int? numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int? restartDelay;

  HlsMediaStoreSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.mediaStoreStorageClass,
    this.numRetries,
    this.restartDelay,
  });

  factory HlsMediaStoreSettings.fromJson(Map<String, dynamic> json) {
    return HlsMediaStoreSettings(
      connectionRetryInterval: json['connectionRetryInterval'] as int?,
      filecacheDuration: json['filecacheDuration'] as int?,
      mediaStoreStorageClass: (json['mediaStoreStorageClass'] as String?)
          ?.toHlsMediaStoreStorageClass(),
      numRetries: json['numRetries'] as int?,
      restartDelay: json['restartDelay'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionRetryInterval = this.connectionRetryInterval;
    final filecacheDuration = this.filecacheDuration;
    final mediaStoreStorageClass = this.mediaStoreStorageClass;
    final numRetries = this.numRetries;
    final restartDelay = this.restartDelay;
    return {
      if (connectionRetryInterval != null)
        'connectionRetryInterval': connectionRetryInterval,
      if (filecacheDuration != null) 'filecacheDuration': filecacheDuration,
      if (mediaStoreStorageClass != null)
        'mediaStoreStorageClass': mediaStoreStorageClass.toValue(),
      if (numRetries != null) 'numRetries': numRetries,
      if (restartDelay != null) 'restartDelay': restartDelay,
    };
  }
}

/// Hls Media Store Storage Class
enum HlsMediaStoreStorageClass {
  temporal,
}

extension on HlsMediaStoreStorageClass {
  String toValue() {
    switch (this) {
      case HlsMediaStoreStorageClass.temporal:
        return 'TEMPORAL';
    }
  }
}

extension on String {
  HlsMediaStoreStorageClass toHlsMediaStoreStorageClass() {
    switch (this) {
      case 'TEMPORAL':
        return HlsMediaStoreStorageClass.temporal;
    }
    throw Exception('$this is not known in enum HlsMediaStoreStorageClass');
  }
}

/// Hls Mode
enum HlsMode {
  live,
  vod,
}

extension on HlsMode {
  String toValue() {
    switch (this) {
      case HlsMode.live:
        return 'LIVE';
      case HlsMode.vod:
        return 'VOD';
    }
  }
}

extension on String {
  HlsMode toHlsMode() {
    switch (this) {
      case 'LIVE':
        return HlsMode.live;
      case 'VOD':
        return HlsMode.vod;
    }
    throw Exception('$this is not known in enum HlsMode');
  }
}

/// Hls Output Selection
enum HlsOutputSelection {
  manifestsAndSegments,
  segmentsOnly,
  variantManifestsAndSegments,
}

extension on HlsOutputSelection {
  String toValue() {
    switch (this) {
      case HlsOutputSelection.manifestsAndSegments:
        return 'MANIFESTS_AND_SEGMENTS';
      case HlsOutputSelection.segmentsOnly:
        return 'SEGMENTS_ONLY';
      case HlsOutputSelection.variantManifestsAndSegments:
        return 'VARIANT_MANIFESTS_AND_SEGMENTS';
    }
  }
}

extension on String {
  HlsOutputSelection toHlsOutputSelection() {
    switch (this) {
      case 'MANIFESTS_AND_SEGMENTS':
        return HlsOutputSelection.manifestsAndSegments;
      case 'SEGMENTS_ONLY':
        return HlsOutputSelection.segmentsOnly;
      case 'VARIANT_MANIFESTS_AND_SEGMENTS':
        return HlsOutputSelection.variantManifestsAndSegments;
    }
    throw Exception('$this is not known in enum HlsOutputSelection');
  }
}

/// Hls Output Settings
class HlsOutputSettings {
  /// Settings regarding the underlying stream. These settings are different for
  /// audio-only outputs.
  final HlsSettings hlsSettings;

  /// Only applicable when this output is referencing an H.265 video description.
  /// Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
  final HlsH265PackagingType? h265PackagingType;

  /// String concatenated to the end of the destination filename. Accepts \"Format
  /// Identifiers\":#formatIdentifierParameters.
  final String? nameModifier;

  /// String concatenated to end of segment filenames.
  final String? segmentModifier;

  HlsOutputSettings({
    required this.hlsSettings,
    this.h265PackagingType,
    this.nameModifier,
    this.segmentModifier,
  });

  factory HlsOutputSettings.fromJson(Map<String, dynamic> json) {
    return HlsOutputSettings(
      hlsSettings:
          HlsSettings.fromJson(json['hlsSettings'] as Map<String, dynamic>),
      h265PackagingType:
          (json['h265PackagingType'] as String?)?.toHlsH265PackagingType(),
      nameModifier: json['nameModifier'] as String?,
      segmentModifier: json['segmentModifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hlsSettings = this.hlsSettings;
    final h265PackagingType = this.h265PackagingType;
    final nameModifier = this.nameModifier;
    final segmentModifier = this.segmentModifier;
    return {
      'hlsSettings': hlsSettings,
      if (h265PackagingType != null)
        'h265PackagingType': h265PackagingType.toValue(),
      if (nameModifier != null) 'nameModifier': nameModifier,
      if (segmentModifier != null) 'segmentModifier': segmentModifier,
    };
  }
}

/// Hls Program Date Time
enum HlsProgramDateTime {
  exclude,
  include,
}

extension on HlsProgramDateTime {
  String toValue() {
    switch (this) {
      case HlsProgramDateTime.exclude:
        return 'EXCLUDE';
      case HlsProgramDateTime.include:
        return 'INCLUDE';
    }
  }
}

extension on String {
  HlsProgramDateTime toHlsProgramDateTime() {
    switch (this) {
      case 'EXCLUDE':
        return HlsProgramDateTime.exclude;
      case 'INCLUDE':
        return HlsProgramDateTime.include;
    }
    throw Exception('$this is not known in enum HlsProgramDateTime');
  }
}

/// Hls Redundant Manifest
enum HlsRedundantManifest {
  disabled,
  enabled,
}

extension on HlsRedundantManifest {
  String toValue() {
    switch (this) {
      case HlsRedundantManifest.disabled:
        return 'DISABLED';
      case HlsRedundantManifest.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  HlsRedundantManifest toHlsRedundantManifest() {
    switch (this) {
      case 'DISABLED':
        return HlsRedundantManifest.disabled;
      case 'ENABLED':
        return HlsRedundantManifest.enabled;
    }
    throw Exception('$this is not known in enum HlsRedundantManifest');
  }
}

/// Hls S3 Settings
class HlsS3Settings {
  /// Specify the canned ACL to apply to each S3 request. Defaults to none.
  final S3CannedAcl? cannedAcl;

  HlsS3Settings({
    this.cannedAcl,
  });

  factory HlsS3Settings.fromJson(Map<String, dynamic> json) {
    return HlsS3Settings(
      cannedAcl: (json['cannedAcl'] as String?)?.toS3CannedAcl(),
    );
  }

  Map<String, dynamic> toJson() {
    final cannedAcl = this.cannedAcl;
    return {
      if (cannedAcl != null) 'cannedAcl': cannedAcl.toValue(),
    };
  }
}

/// Hls Scte35 Source Type
enum HlsScte35SourceType {
  manifest,
  segments,
}

extension on HlsScte35SourceType {
  String toValue() {
    switch (this) {
      case HlsScte35SourceType.manifest:
        return 'MANIFEST';
      case HlsScte35SourceType.segments:
        return 'SEGMENTS';
    }
  }
}

extension on String {
  HlsScte35SourceType toHlsScte35SourceType() {
    switch (this) {
      case 'MANIFEST':
        return HlsScte35SourceType.manifest;
      case 'SEGMENTS':
        return HlsScte35SourceType.segments;
    }
    throw Exception('$this is not known in enum HlsScte35SourceType');
  }
}

/// Hls Segmentation Mode
enum HlsSegmentationMode {
  useInputSegmentation,
  useSegmentDuration,
}

extension on HlsSegmentationMode {
  String toValue() {
    switch (this) {
      case HlsSegmentationMode.useInputSegmentation:
        return 'USE_INPUT_SEGMENTATION';
      case HlsSegmentationMode.useSegmentDuration:
        return 'USE_SEGMENT_DURATION';
    }
  }
}

extension on String {
  HlsSegmentationMode toHlsSegmentationMode() {
    switch (this) {
      case 'USE_INPUT_SEGMENTATION':
        return HlsSegmentationMode.useInputSegmentation;
      case 'USE_SEGMENT_DURATION':
        return HlsSegmentationMode.useSegmentDuration;
    }
    throw Exception('$this is not known in enum HlsSegmentationMode');
  }
}

/// Hls Settings
class HlsSettings {
  final AudioOnlyHlsSettings? audioOnlyHlsSettings;
  final Fmp4HlsSettings? fmp4HlsSettings;
  final FrameCaptureHlsSettings? frameCaptureHlsSettings;
  final StandardHlsSettings? standardHlsSettings;

  HlsSettings({
    this.audioOnlyHlsSettings,
    this.fmp4HlsSettings,
    this.frameCaptureHlsSettings,
    this.standardHlsSettings,
  });

  factory HlsSettings.fromJson(Map<String, dynamic> json) {
    return HlsSettings(
      audioOnlyHlsSettings: json['audioOnlyHlsSettings'] != null
          ? AudioOnlyHlsSettings.fromJson(
              json['audioOnlyHlsSettings'] as Map<String, dynamic>)
          : null,
      fmp4HlsSettings: json['fmp4HlsSettings'] != null
          ? Fmp4HlsSettings.fromJson(
              json['fmp4HlsSettings'] as Map<String, dynamic>)
          : null,
      frameCaptureHlsSettings: json['frameCaptureHlsSettings'] != null
          ? FrameCaptureHlsSettings.fromJson(
              json['frameCaptureHlsSettings'] as Map<String, dynamic>)
          : null,
      standardHlsSettings: json['standardHlsSettings'] != null
          ? StandardHlsSettings.fromJson(
              json['standardHlsSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioOnlyHlsSettings = this.audioOnlyHlsSettings;
    final fmp4HlsSettings = this.fmp4HlsSettings;
    final frameCaptureHlsSettings = this.frameCaptureHlsSettings;
    final standardHlsSettings = this.standardHlsSettings;
    return {
      if (audioOnlyHlsSettings != null)
        'audioOnlyHlsSettings': audioOnlyHlsSettings,
      if (fmp4HlsSettings != null) 'fmp4HlsSettings': fmp4HlsSettings,
      if (frameCaptureHlsSettings != null)
        'frameCaptureHlsSettings': frameCaptureHlsSettings,
      if (standardHlsSettings != null)
        'standardHlsSettings': standardHlsSettings,
    };
  }
}

/// Hls Stream Inf Resolution
enum HlsStreamInfResolution {
  exclude,
  include,
}

extension on HlsStreamInfResolution {
  String toValue() {
    switch (this) {
      case HlsStreamInfResolution.exclude:
        return 'EXCLUDE';
      case HlsStreamInfResolution.include:
        return 'INCLUDE';
    }
  }
}

extension on String {
  HlsStreamInfResolution toHlsStreamInfResolution() {
    switch (this) {
      case 'EXCLUDE':
        return HlsStreamInfResolution.exclude;
      case 'INCLUDE':
        return HlsStreamInfResolution.include;
    }
    throw Exception('$this is not known in enum HlsStreamInfResolution');
  }
}

/// Hls Timed Metadata Id3 Frame
enum HlsTimedMetadataId3Frame {
  none,
  priv,
  tdrl,
}

extension on HlsTimedMetadataId3Frame {
  String toValue() {
    switch (this) {
      case HlsTimedMetadataId3Frame.none:
        return 'NONE';
      case HlsTimedMetadataId3Frame.priv:
        return 'PRIV';
      case HlsTimedMetadataId3Frame.tdrl:
        return 'TDRL';
    }
  }
}

extension on String {
  HlsTimedMetadataId3Frame toHlsTimedMetadataId3Frame() {
    switch (this) {
      case 'NONE':
        return HlsTimedMetadataId3Frame.none;
      case 'PRIV':
        return HlsTimedMetadataId3Frame.priv;
      case 'TDRL':
        return HlsTimedMetadataId3Frame.tdrl;
    }
    throw Exception('$this is not known in enum HlsTimedMetadataId3Frame');
  }
}

/// Settings for the action to emit HLS metadata
class HlsTimedMetadataScheduleActionSettings {
  /// Base64 string formatted according to the ID3 specification:
  /// http://id3.org/id3v2.4.0-structure
  final String id3;

  HlsTimedMetadataScheduleActionSettings({
    required this.id3,
  });

  factory HlsTimedMetadataScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return HlsTimedMetadataScheduleActionSettings(
      id3: json['id3'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id3 = this.id3;
    return {
      'id3': id3,
    };
  }
}

/// Hls Ts File Mode
enum HlsTsFileMode {
  segmentedFiles,
  singleFile,
}

extension on HlsTsFileMode {
  String toValue() {
    switch (this) {
      case HlsTsFileMode.segmentedFiles:
        return 'SEGMENTED_FILES';
      case HlsTsFileMode.singleFile:
        return 'SINGLE_FILE';
    }
  }
}

extension on String {
  HlsTsFileMode toHlsTsFileMode() {
    switch (this) {
      case 'SEGMENTED_FILES':
        return HlsTsFileMode.segmentedFiles;
      case 'SINGLE_FILE':
        return HlsTsFileMode.singleFile;
    }
    throw Exception('$this is not known in enum HlsTsFileMode');
  }
}

/// Hls Webdav Http Transfer Mode
enum HlsWebdavHttpTransferMode {
  chunked,
  nonChunked,
}

extension on HlsWebdavHttpTransferMode {
  String toValue() {
    switch (this) {
      case HlsWebdavHttpTransferMode.chunked:
        return 'CHUNKED';
      case HlsWebdavHttpTransferMode.nonChunked:
        return 'NON_CHUNKED';
    }
  }
}

extension on String {
  HlsWebdavHttpTransferMode toHlsWebdavHttpTransferMode() {
    switch (this) {
      case 'CHUNKED':
        return HlsWebdavHttpTransferMode.chunked;
      case 'NON_CHUNKED':
        return HlsWebdavHttpTransferMode.nonChunked;
    }
    throw Exception('$this is not known in enum HlsWebdavHttpTransferMode');
  }
}

/// Hls Webdav Settings
class HlsWebdavSettings {
  /// Number of seconds to wait before retrying connection to the CDN if the
  /// connection is lost.
  final int? connectionRetryInterval;

  /// Size in seconds of file cache for streaming outputs.
  final int? filecacheDuration;

  /// Specify whether or not to use chunked transfer encoding to WebDAV.
  final HlsWebdavHttpTransferMode? httpTransferMode;

  /// Number of retry attempts that will be made before the Live Event is put into
  /// an error state.
  final int? numRetries;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int? restartDelay;

  HlsWebdavSettings({
    this.connectionRetryInterval,
    this.filecacheDuration,
    this.httpTransferMode,
    this.numRetries,
    this.restartDelay,
  });

  factory HlsWebdavSettings.fromJson(Map<String, dynamic> json) {
    return HlsWebdavSettings(
      connectionRetryInterval: json['connectionRetryInterval'] as int?,
      filecacheDuration: json['filecacheDuration'] as int?,
      httpTransferMode:
          (json['httpTransferMode'] as String?)?.toHlsWebdavHttpTransferMode(),
      numRetries: json['numRetries'] as int?,
      restartDelay: json['restartDelay'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectionRetryInterval = this.connectionRetryInterval;
    final filecacheDuration = this.filecacheDuration;
    final httpTransferMode = this.httpTransferMode;
    final numRetries = this.numRetries;
    final restartDelay = this.restartDelay;
    return {
      if (connectionRetryInterval != null)
        'connectionRetryInterval': connectionRetryInterval,
      if (filecacheDuration != null) 'filecacheDuration': filecacheDuration,
      if (httpTransferMode != null)
        'httpTransferMode': httpTransferMode.toValue(),
      if (numRetries != null) 'numRetries': numRetries,
      if (restartDelay != null) 'restartDelay': restartDelay,
    };
  }
}

/// Html Motion Graphics Settings
class HtmlMotionGraphicsSettings {
  HtmlMotionGraphicsSettings();

  factory HtmlMotionGraphicsSettings.fromJson(Map<String, dynamic> _) {
    return HtmlMotionGraphicsSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// When set to "standard", an I-Frame only playlist will be written out for
/// each video output in the output group. This I-Frame only playlist will
/// contain byte range offsets pointing to the I-frame(s) in each segment.
enum IFrameOnlyPlaylistType {
  disabled,
  standard,
}

extension on IFrameOnlyPlaylistType {
  String toValue() {
    switch (this) {
      case IFrameOnlyPlaylistType.disabled:
        return 'DISABLED';
      case IFrameOnlyPlaylistType.standard:
        return 'STANDARD';
    }
  }
}

extension on String {
  IFrameOnlyPlaylistType toIFrameOnlyPlaylistType() {
    switch (this) {
      case 'DISABLED':
        return IFrameOnlyPlaylistType.disabled;
      case 'STANDARD':
        return IFrameOnlyPlaylistType.standard;
    }
    throw Exception('$this is not known in enum IFrameOnlyPlaylistType');
  }
}

/// Settings to configure an action so that it occurs as soon as possible.
class ImmediateModeScheduleActionStartSettings {
  ImmediateModeScheduleActionStartSettings();

  factory ImmediateModeScheduleActionStartSettings.fromJson(
      Map<String, dynamic> _) {
    return ImmediateModeScheduleActionStartSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Placeholder documentation for Input
class Input {
  /// The Unique ARN of the input (generated, immutable).
  final String? arn;

  /// A list of channel IDs that that input is attached to (currently an input can
  /// only be attached to one channel).
  final List<String>? attachedChannels;

  /// A list of the destinations of the input (PUSH-type).
  final List<InputDestination>? destinations;

  /// The generated ID of the input (unique for user account, immutable).
  final String? id;

  /// STANDARD - MediaLive expects two sources to be connected to this input. If
  /// the channel is also STANDARD, both sources will be ingested. If the channel
  /// is SINGLE_PIPELINE, only the first source will be ingested; the second
  /// source will always be ignored, even if the first source fails.
  /// SINGLE_PIPELINE - You can connect only one source to this input. If the
  /// ChannelClass is also  SINGLE_PIPELINE, this value is valid. If the
  /// ChannelClass is STANDARD, this value is not valid because the channel
  /// requires two sources in the input.
  final InputClass? inputClass;

  /// Settings for the input devices.
  final List<InputDeviceSettings>? inputDevices;

  /// A list of IDs for all Inputs which are partners of this one.
  final List<String>? inputPartnerIds;

  /// Certain pull input sources can be dynamic, meaning that they can have their
  /// URL's dynamically changes
  /// during input switch actions. Presently, this functionality only works with
  /// MP4_FILE inputs.
  final InputSourceType? inputSourceType;

  /// A list of MediaConnect Flows for this input.
  final List<MediaConnectFlow>? mediaConnectFlows;

  /// The user-assigned name (This is a mutable value).
  final String? name;

  /// The Amazon Resource Name (ARN) of the role this input assumes during and
  /// after creation.
  final String? roleArn;

  /// A list of IDs for all the Input Security Groups attached to the input.
  final List<String>? securityGroups;

  /// A list of the sources of the input (PULL-type).
  final List<InputSource>? sources;
  final InputState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;
  final InputType? type;

  Input({
    this.arn,
    this.attachedChannels,
    this.destinations,
    this.id,
    this.inputClass,
    this.inputDevices,
    this.inputPartnerIds,
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

  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
      arn: json['arn'] as String?,
      attachedChannels: (json['attachedChannels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => InputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      inputClass: (json['inputClass'] as String?)?.toInputClass(),
      inputDevices: (json['inputDevices'] as List?)
          ?.whereNotNull()
          .map((e) => InputDeviceSettings.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputPartnerIds: (json['inputPartnerIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inputSourceType:
          (json['inputSourceType'] as String?)?.toInputSourceType(),
      mediaConnectFlows: (json['mediaConnectFlows'] as List?)
          ?.whereNotNull()
          .map((e) => MediaConnectFlow.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      roleArn: json['roleArn'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => InputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: (json['state'] as String?)?.toInputState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toInputType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final attachedChannels = this.attachedChannels;
    final destinations = this.destinations;
    final id = this.id;
    final inputClass = this.inputClass;
    final inputDevices = this.inputDevices;
    final inputPartnerIds = this.inputPartnerIds;
    final inputSourceType = this.inputSourceType;
    final mediaConnectFlows = this.mediaConnectFlows;
    final name = this.name;
    final roleArn = this.roleArn;
    final securityGroups = this.securityGroups;
    final sources = this.sources;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (attachedChannels != null) 'attachedChannels': attachedChannels,
      if (destinations != null) 'destinations': destinations,
      if (id != null) 'id': id,
      if (inputClass != null) 'inputClass': inputClass.toValue(),
      if (inputDevices != null) 'inputDevices': inputDevices,
      if (inputPartnerIds != null) 'inputPartnerIds': inputPartnerIds,
      if (inputSourceType != null) 'inputSourceType': inputSourceType.toValue(),
      if (mediaConnectFlows != null) 'mediaConnectFlows': mediaConnectFlows,
      if (name != null) 'name': name,
      if (roleArn != null) 'roleArn': roleArn,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (sources != null) 'sources': sources,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Placeholder documentation for InputAttachment
class InputAttachment {
  /// User-specified settings for defining what the conditions are for declaring
  /// the input unhealthy and failing over to a different input.
  final AutomaticInputFailoverSettings? automaticInputFailoverSettings;

  /// User-specified name for the attachment. This is required if the user wants
  /// to use this input in an input switch action.
  final String? inputAttachmentName;

  /// The ID of the input
  final String? inputId;

  /// Settings of an input (caption selector, etc.)
  final InputSettings? inputSettings;

  InputAttachment({
    this.automaticInputFailoverSettings,
    this.inputAttachmentName,
    this.inputId,
    this.inputSettings,
  });

  factory InputAttachment.fromJson(Map<String, dynamic> json) {
    return InputAttachment(
      automaticInputFailoverSettings: json['automaticInputFailoverSettings'] !=
              null
          ? AutomaticInputFailoverSettings.fromJson(
              json['automaticInputFailoverSettings'] as Map<String, dynamic>)
          : null,
      inputAttachmentName: json['inputAttachmentName'] as String?,
      inputId: json['inputId'] as String?,
      inputSettings: json['inputSettings'] != null
          ? InputSettings.fromJson(
              json['inputSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final automaticInputFailoverSettings = this.automaticInputFailoverSettings;
    final inputAttachmentName = this.inputAttachmentName;
    final inputId = this.inputId;
    final inputSettings = this.inputSettings;
    return {
      if (automaticInputFailoverSettings != null)
        'automaticInputFailoverSettings': automaticInputFailoverSettings,
      if (inputAttachmentName != null)
        'inputAttachmentName': inputAttachmentName,
      if (inputId != null) 'inputId': inputId,
      if (inputSettings != null) 'inputSettings': inputSettings,
    };
  }
}

/// Input Channel Level
class InputChannelLevel {
  /// Remixing value. Units are in dB and acceptable values are within the range
  /// from -60 (mute) and 6 dB.
  final int gain;

  /// The index of the input channel used as a source.
  final int inputChannel;

  InputChannelLevel({
    required this.gain,
    required this.inputChannel,
  });

  factory InputChannelLevel.fromJson(Map<String, dynamic> json) {
    return InputChannelLevel(
      gain: json['gain'] as int,
      inputChannel: json['inputChannel'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final gain = this.gain;
    final inputChannel = this.inputChannel;
    return {
      'gain': gain,
      'inputChannel': inputChannel,
    };
  }
}

/// A standard input has two sources and a single pipeline input only has one.
enum InputClass {
  standard,
  singlePipeline,
}

extension on InputClass {
  String toValue() {
    switch (this) {
      case InputClass.standard:
        return 'STANDARD';
      case InputClass.singlePipeline:
        return 'SINGLE_PIPELINE';
    }
  }
}

extension on String {
  InputClass toInputClass() {
    switch (this) {
      case 'STANDARD':
        return InputClass.standard;
      case 'SINGLE_PIPELINE':
        return InputClass.singlePipeline;
    }
    throw Exception('$this is not known in enum InputClass');
  }
}

/// Settings to let you create a clip of the file input, in order to set up the
/// input to ingest only a portion of the file.
class InputClippingSettings {
  /// The source of the timecodes in the source being clipped.
  final InputTimecodeSource inputTimecodeSource;

  /// Settings to identify the start of the clip.
  final StartTimecode? startTimecode;

  /// Settings to identify the end of the clip.
  final StopTimecode? stopTimecode;

  InputClippingSettings({
    required this.inputTimecodeSource,
    this.startTimecode,
    this.stopTimecode,
  });

  factory InputClippingSettings.fromJson(Map<String, dynamic> json) {
    return InputClippingSettings(
      inputTimecodeSource:
          (json['inputTimecodeSource'] as String).toInputTimecodeSource(),
      startTimecode: json['startTimecode'] != null
          ? StartTimecode.fromJson(
              json['startTimecode'] as Map<String, dynamic>)
          : null,
      stopTimecode: json['stopTimecode'] != null
          ? StopTimecode.fromJson(json['stopTimecode'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputTimecodeSource = this.inputTimecodeSource;
    final startTimecode = this.startTimecode;
    final stopTimecode = this.stopTimecode;
    return {
      'inputTimecodeSource': inputTimecodeSource.toValue(),
      if (startTimecode != null) 'startTimecode': startTimecode,
      if (stopTimecode != null) 'stopTimecode': stopTimecode,
    };
  }
}

/// codec in increasing order of complexity
enum InputCodec {
  mpeg2,
  avc,
  hevc,
}

extension on InputCodec {
  String toValue() {
    switch (this) {
      case InputCodec.mpeg2:
        return 'MPEG2';
      case InputCodec.avc:
        return 'AVC';
      case InputCodec.hevc:
        return 'HEVC';
    }
  }
}

extension on String {
  InputCodec toInputCodec() {
    switch (this) {
      case 'MPEG2':
        return InputCodec.mpeg2;
      case 'AVC':
        return InputCodec.avc;
      case 'HEVC':
        return InputCodec.hevc;
    }
    throw Exception('$this is not known in enum InputCodec');
  }
}

/// Input Deblock Filter
enum InputDeblockFilter {
  disabled,
  enabled,
}

extension on InputDeblockFilter {
  String toValue() {
    switch (this) {
      case InputDeblockFilter.disabled:
        return 'DISABLED';
      case InputDeblockFilter.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  InputDeblockFilter toInputDeblockFilter() {
    switch (this) {
      case 'DISABLED':
        return InputDeblockFilter.disabled;
      case 'ENABLED':
        return InputDeblockFilter.enabled;
    }
    throw Exception('$this is not known in enum InputDeblockFilter');
  }
}

/// Input Denoise Filter
enum InputDenoiseFilter {
  disabled,
  enabled,
}

extension on InputDenoiseFilter {
  String toValue() {
    switch (this) {
      case InputDenoiseFilter.disabled:
        return 'DISABLED';
      case InputDenoiseFilter.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  InputDenoiseFilter toInputDenoiseFilter() {
    switch (this) {
      case 'DISABLED':
        return InputDenoiseFilter.disabled;
      case 'ENABLED':
        return InputDenoiseFilter.enabled;
    }
    throw Exception('$this is not known in enum InputDenoiseFilter');
  }
}

/// The settings for a PUSH type input.
class InputDestination {
  /// The system-generated static IP address of endpoint.
  /// It remains fixed for the lifetime of the input.
  final String? ip;

  /// The port number for the input.
  final String? port;

  /// This represents the endpoint that the customer stream will be
  /// pushed to.
  final String? url;
  final InputDestinationVpc? vpc;

  InputDestination({
    this.ip,
    this.port,
    this.url,
    this.vpc,
  });

  factory InputDestination.fromJson(Map<String, dynamic> json) {
    return InputDestination(
      ip: json['ip'] as String?,
      port: json['port'] as String?,
      url: json['url'] as String?,
      vpc: json['vpc'] != null
          ? InputDestinationVpc.fromJson(json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ip = this.ip;
    final port = this.port;
    final url = this.url;
    final vpc = this.vpc;
    return {
      if (ip != null) 'ip': ip,
      if (port != null) 'port': port,
      if (url != null) 'url': url,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Endpoint settings for a PUSH type input.
class InputDestinationRequest {
  /// A unique name for the location the RTMP stream is being pushed
  /// to.
  final String? streamName;

  InputDestinationRequest({
    this.streamName,
  });

  factory InputDestinationRequest.fromJson(Map<String, dynamic> json) {
    return InputDestinationRequest(
      streamName: json['streamName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamName = this.streamName;
    return {
      if (streamName != null) 'streamName': streamName,
    };
  }
}

/// The properties for a VPC type input destination.
class InputDestinationVpc {
  /// The availability zone of the Input destination.
  final String? availabilityZone;

  /// The network interface ID of the Input destination in the VPC.
  final String? networkInterfaceId;

  InputDestinationVpc({
    this.availabilityZone,
    this.networkInterfaceId,
  });

  factory InputDestinationVpc.fromJson(Map<String, dynamic> json) {
    return InputDestinationVpc(
      availabilityZone: json['availabilityZone'] as String?,
      networkInterfaceId: json['networkInterfaceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZone = this.availabilityZone;
    final networkInterfaceId = this.networkInterfaceId;
    return {
      if (availabilityZone != null) 'availabilityZone': availabilityZone,
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
    };
  }
}

/// The source at the input device that is currently active.
enum InputDeviceActiveInput {
  hdmi,
  sdi,
}

extension on InputDeviceActiveInput {
  String toValue() {
    switch (this) {
      case InputDeviceActiveInput.hdmi:
        return 'HDMI';
      case InputDeviceActiveInput.sdi:
        return 'SDI';
    }
  }
}

extension on String {
  InputDeviceActiveInput toInputDeviceActiveInput() {
    switch (this) {
      case 'HDMI':
        return InputDeviceActiveInput.hdmi;
      case 'SDI':
        return InputDeviceActiveInput.sdi;
    }
    throw Exception('$this is not known in enum InputDeviceActiveInput');
  }
}

/// Configurable settings for the input device.
class InputDeviceConfigurableSettings {
  /// The input source that you want to use. If the device has a source connected
  /// to only one of its input ports, or if you don't care which source the device
  /// sends, specify Auto. If the device has sources connected to both its input
  /// ports, and you want to use a specific source, specify the source.
  final InputDeviceConfiguredInput? configuredInput;

  /// The maximum bitrate in bits per second. Set a value here to throttle the
  /// bitrate of the source video.
  final int? maxBitrate;

  InputDeviceConfigurableSettings({
    this.configuredInput,
    this.maxBitrate,
  });

  factory InputDeviceConfigurableSettings.fromJson(Map<String, dynamic> json) {
    return InputDeviceConfigurableSettings(
      configuredInput:
          (json['configuredInput'] as String?)?.toInputDeviceConfiguredInput(),
      maxBitrate: json['maxBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuredInput = this.configuredInput;
    final maxBitrate = this.maxBitrate;
    return {
      if (configuredInput != null) 'configuredInput': configuredInput.toValue(),
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
    };
  }
}

/// The source to activate (use) from the input device.
enum InputDeviceConfiguredInput {
  auto,
  hdmi,
  sdi,
}

extension on InputDeviceConfiguredInput {
  String toValue() {
    switch (this) {
      case InputDeviceConfiguredInput.auto:
        return 'AUTO';
      case InputDeviceConfiguredInput.hdmi:
        return 'HDMI';
      case InputDeviceConfiguredInput.sdi:
        return 'SDI';
    }
  }
}

extension on String {
  InputDeviceConfiguredInput toInputDeviceConfiguredInput() {
    switch (this) {
      case 'AUTO':
        return InputDeviceConfiguredInput.auto;
      case 'HDMI':
        return InputDeviceConfiguredInput.hdmi;
      case 'SDI':
        return InputDeviceConfiguredInput.sdi;
    }
    throw Exception('$this is not known in enum InputDeviceConfiguredInput');
  }
}

/// The state of the connection between the input device and AWS.
enum InputDeviceConnectionState {
  disconnected,
  connected,
}

extension on InputDeviceConnectionState {
  String toValue() {
    switch (this) {
      case InputDeviceConnectionState.disconnected:
        return 'DISCONNECTED';
      case InputDeviceConnectionState.connected:
        return 'CONNECTED';
    }
  }
}

extension on String {
  InputDeviceConnectionState toInputDeviceConnectionState() {
    switch (this) {
      case 'DISCONNECTED':
        return InputDeviceConnectionState.disconnected;
      case 'CONNECTED':
        return InputDeviceConnectionState.connected;
    }
    throw Exception('$this is not known in enum InputDeviceConnectionState');
  }
}

/// Settings that describe the active source from the input device, and the
/// video characteristics of that source.
class InputDeviceHdSettings {
  /// If you specified Auto as the configured input, specifies which of the
  /// sources is currently active (SDI or HDMI).
  final InputDeviceActiveInput? activeInput;

  /// The source at the input device that is currently active. You can specify
  /// this source.
  final InputDeviceConfiguredInput? configuredInput;

  /// The state of the input device.
  final InputDeviceState? deviceState;

  /// The frame rate of the video source.
  final double? framerate;

  /// The height of the video source, in pixels.
  final int? height;

  /// The current maximum bitrate for ingesting this source, in bits per second.
  /// You can specify this maximum.
  final int? maxBitrate;

  /// The scan type of the video source.
  final InputDeviceScanType? scanType;

  /// The width of the video source, in pixels.
  final int? width;

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

  factory InputDeviceHdSettings.fromJson(Map<String, dynamic> json) {
    return InputDeviceHdSettings(
      activeInput: (json['activeInput'] as String?)?.toInputDeviceActiveInput(),
      configuredInput:
          (json['configuredInput'] as String?)?.toInputDeviceConfiguredInput(),
      deviceState: (json['deviceState'] as String?)?.toInputDeviceState(),
      framerate: json['framerate'] as double?,
      height: json['height'] as int?,
      maxBitrate: json['maxBitrate'] as int?,
      scanType: (json['scanType'] as String?)?.toInputDeviceScanType(),
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeInput = this.activeInput;
    final configuredInput = this.configuredInput;
    final deviceState = this.deviceState;
    final framerate = this.framerate;
    final height = this.height;
    final maxBitrate = this.maxBitrate;
    final scanType = this.scanType;
    final width = this.width;
    return {
      if (activeInput != null) 'activeInput': activeInput.toValue(),
      if (configuredInput != null) 'configuredInput': configuredInput.toValue(),
      if (deviceState != null) 'deviceState': deviceState.toValue(),
      if (framerate != null) 'framerate': framerate,
      if (height != null) 'height': height,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (scanType != null) 'scanType': scanType.toValue(),
      if (width != null) 'width': width,
    };
  }
}

/// Specifies whether the input device has been configured (outside of
/// MediaLive) to use a dynamic IP address assignment (DHCP) or a static IP
/// address.
enum InputDeviceIpScheme {
  static,
  dhcp,
}

extension on InputDeviceIpScheme {
  String toValue() {
    switch (this) {
      case InputDeviceIpScheme.static:
        return 'STATIC';
      case InputDeviceIpScheme.dhcp:
        return 'DHCP';
    }
  }
}

extension on String {
  InputDeviceIpScheme toInputDeviceIpScheme() {
    switch (this) {
      case 'STATIC':
        return InputDeviceIpScheme.static;
      case 'DHCP':
        return InputDeviceIpScheme.dhcp;
    }
    throw Exception('$this is not known in enum InputDeviceIpScheme');
  }
}

/// The network settings for the input device.
class InputDeviceNetworkSettings {
  /// The DNS addresses of the input device.
  final List<String>? dnsAddresses;

  /// The network gateway IP address.
  final String? gateway;

  /// The IP address of the input device.
  final String? ipAddress;

  /// Specifies whether the input device has been configured (outside of
  /// MediaLive) to use a dynamic IP address assignment (DHCP) or a static IP
  /// address.
  final InputDeviceIpScheme? ipScheme;

  /// The subnet mask of the input device.
  final String? subnetMask;

  InputDeviceNetworkSettings({
    this.dnsAddresses,
    this.gateway,
    this.ipAddress,
    this.ipScheme,
    this.subnetMask,
  });

  factory InputDeviceNetworkSettings.fromJson(Map<String, dynamic> json) {
    return InputDeviceNetworkSettings(
      dnsAddresses: (json['dnsAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      gateway: json['gateway'] as String?,
      ipAddress: json['ipAddress'] as String?,
      ipScheme: (json['ipScheme'] as String?)?.toInputDeviceIpScheme(),
      subnetMask: json['subnetMask'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dnsAddresses = this.dnsAddresses;
    final gateway = this.gateway;
    final ipAddress = this.ipAddress;
    final ipScheme = this.ipScheme;
    final subnetMask = this.subnetMask;
    return {
      if (dnsAddresses != null) 'dnsAddresses': dnsAddresses,
      if (gateway != null) 'gateway': gateway,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (ipScheme != null) 'ipScheme': ipScheme.toValue(),
      if (subnetMask != null) 'subnetMask': subnetMask,
    };
  }
}

/// Settings for an input device.
class InputDeviceRequest {
  /// The unique ID for the device.
  final String? id;

  InputDeviceRequest({
    this.id,
  });

  factory InputDeviceRequest.fromJson(Map<String, dynamic> json) {
    return InputDeviceRequest(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

/// The scan type of the video source.
enum InputDeviceScanType {
  interlaced,
  progressive,
}

extension on InputDeviceScanType {
  String toValue() {
    switch (this) {
      case InputDeviceScanType.interlaced:
        return 'INTERLACED';
      case InputDeviceScanType.progressive:
        return 'PROGRESSIVE';
    }
  }
}

extension on String {
  InputDeviceScanType toInputDeviceScanType() {
    switch (this) {
      case 'INTERLACED':
        return InputDeviceScanType.interlaced;
      case 'PROGRESSIVE':
        return InputDeviceScanType.progressive;
    }
    throw Exception('$this is not known in enum InputDeviceScanType');
  }
}

/// Settings for an input device.
class InputDeviceSettings {
  /// The unique ID for the device.
  final String? id;

  InputDeviceSettings({
    this.id,
  });

  factory InputDeviceSettings.fromJson(Map<String, dynamic> json) {
    return InputDeviceSettings(
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'id': id,
    };
  }
}

/// The state of the input device.
enum InputDeviceState {
  idle,
  streaming,
}

extension on InputDeviceState {
  String toValue() {
    switch (this) {
      case InputDeviceState.idle:
        return 'IDLE';
      case InputDeviceState.streaming:
        return 'STREAMING';
    }
  }
}

extension on String {
  InputDeviceState toInputDeviceState() {
    switch (this) {
      case 'IDLE':
        return InputDeviceState.idle;
      case 'STREAMING':
        return InputDeviceState.streaming;
    }
    throw Exception('$this is not known in enum InputDeviceState');
  }
}

/// Details of the input device.
class InputDeviceSummary {
  /// The unique ARN of the input device.
  final String? arn;

  /// The state of the connection between the input device and AWS.
  final InputDeviceConnectionState? connectionState;

  /// The status of the action to synchronize the device configuration. If you
  /// change the configuration of the input device (for example, the maximum
  /// bitrate), MediaLive sends the new data to the device. The device might not
  /// update itself immediately. SYNCED means the device has updated its
  /// configuration. SYNCING means that it has not updated its configuration.
  final DeviceSettingsSyncState? deviceSettingsSyncState;

  /// The status of software on the input device.
  final DeviceUpdateStatus? deviceUpdateStatus;

  /// Settings that describe an input device that is type HD.
  final InputDeviceHdSettings? hdDeviceSettings;

  /// The unique ID of the input device.
  final String? id;

  /// The network MAC address of the input device.
  final String? macAddress;

  /// A name that you specify for the input device.
  final String? name;

  /// Network settings for the input device.
  final InputDeviceNetworkSettings? networkSettings;

  /// The unique serial number of the input device.
  final String? serialNumber;

  /// The type of the input device.
  final InputDeviceType? type;

  /// Settings that describe an input device that is type UHD.
  final InputDeviceUhdSettings? uhdDeviceSettings;

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

  factory InputDeviceSummary.fromJson(Map<String, dynamic> json) {
    return InputDeviceSummary(
      arn: json['arn'] as String?,
      connectionState:
          (json['connectionState'] as String?)?.toInputDeviceConnectionState(),
      deviceSettingsSyncState: (json['deviceSettingsSyncState'] as String?)
          ?.toDeviceSettingsSyncState(),
      deviceUpdateStatus:
          (json['deviceUpdateStatus'] as String?)?.toDeviceUpdateStatus(),
      hdDeviceSettings: json['hdDeviceSettings'] != null
          ? InputDeviceHdSettings.fromJson(
              json['hdDeviceSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      macAddress: json['macAddress'] as String?,
      name: json['name'] as String?,
      networkSettings: json['networkSettings'] != null
          ? InputDeviceNetworkSettings.fromJson(
              json['networkSettings'] as Map<String, dynamic>)
          : null,
      serialNumber: json['serialNumber'] as String?,
      type: (json['type'] as String?)?.toInputDeviceType(),
      uhdDeviceSettings: json['uhdDeviceSettings'] != null
          ? InputDeviceUhdSettings.fromJson(
              json['uhdDeviceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectionState = this.connectionState;
    final deviceSettingsSyncState = this.deviceSettingsSyncState;
    final deviceUpdateStatus = this.deviceUpdateStatus;
    final hdDeviceSettings = this.hdDeviceSettings;
    final id = this.id;
    final macAddress = this.macAddress;
    final name = this.name;
    final networkSettings = this.networkSettings;
    final serialNumber = this.serialNumber;
    final type = this.type;
    final uhdDeviceSettings = this.uhdDeviceSettings;
    return {
      if (arn != null) 'arn': arn,
      if (connectionState != null) 'connectionState': connectionState.toValue(),
      if (deviceSettingsSyncState != null)
        'deviceSettingsSyncState': deviceSettingsSyncState.toValue(),
      if (deviceUpdateStatus != null)
        'deviceUpdateStatus': deviceUpdateStatus.toValue(),
      if (hdDeviceSettings != null) 'hdDeviceSettings': hdDeviceSettings,
      if (id != null) 'id': id,
      if (macAddress != null) 'macAddress': macAddress,
      if (name != null) 'name': name,
      if (networkSettings != null) 'networkSettings': networkSettings,
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (type != null) 'type': type.toValue(),
      if (uhdDeviceSettings != null) 'uhdDeviceSettings': uhdDeviceSettings,
    };
  }
}

/// The type of device transfer. INCOMING for an input device that is being
/// transferred to you, OUTGOING for an input device that you are transferring
/// to another AWS account.
enum InputDeviceTransferType {
  outgoing,
  incoming,
}

extension on InputDeviceTransferType {
  String toValue() {
    switch (this) {
      case InputDeviceTransferType.outgoing:
        return 'OUTGOING';
      case InputDeviceTransferType.incoming:
        return 'INCOMING';
    }
  }
}

extension on String {
  InputDeviceTransferType toInputDeviceTransferType() {
    switch (this) {
      case 'OUTGOING':
        return InputDeviceTransferType.outgoing;
      case 'INCOMING':
        return InputDeviceTransferType.incoming;
    }
    throw Exception('$this is not known in enum InputDeviceTransferType');
  }
}

/// The type of the input device. For an AWS Elemental Link device that outputs
/// resolutions up to 1080, choose "HD".
enum InputDeviceType {
  hd,
}

extension on InputDeviceType {
  String toValue() {
    switch (this) {
      case InputDeviceType.hd:
        return 'HD';
    }
  }
}

extension on String {
  InputDeviceType toInputDeviceType() {
    switch (this) {
      case 'HD':
        return InputDeviceType.hd;
    }
    throw Exception('$this is not known in enum InputDeviceType');
  }
}

/// Settings that describe the active source from the input device, and the
/// video characteristics of that source.
class InputDeviceUhdSettings {
  /// If you specified Auto as the configured input, specifies which of the
  /// sources is currently active (SDI or HDMI).
  final InputDeviceActiveInput? activeInput;

  /// The source at the input device that is currently active. You can specify
  /// this source.
  final InputDeviceConfiguredInput? configuredInput;

  /// The state of the input device.
  final InputDeviceState? deviceState;

  /// The frame rate of the video source.
  final double? framerate;

  /// The height of the video source, in pixels.
  final int? height;

  /// The current maximum bitrate for ingesting this source, in bits per second.
  /// You can specify this maximum.
  final int? maxBitrate;

  /// The scan type of the video source.
  final InputDeviceScanType? scanType;

  /// The width of the video source, in pixels.
  final int? width;

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

  factory InputDeviceUhdSettings.fromJson(Map<String, dynamic> json) {
    return InputDeviceUhdSettings(
      activeInput: (json['activeInput'] as String?)?.toInputDeviceActiveInput(),
      configuredInput:
          (json['configuredInput'] as String?)?.toInputDeviceConfiguredInput(),
      deviceState: (json['deviceState'] as String?)?.toInputDeviceState(),
      framerate: json['framerate'] as double?,
      height: json['height'] as int?,
      maxBitrate: json['maxBitrate'] as int?,
      scanType: (json['scanType'] as String?)?.toInputDeviceScanType(),
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeInput = this.activeInput;
    final configuredInput = this.configuredInput;
    final deviceState = this.deviceState;
    final framerate = this.framerate;
    final height = this.height;
    final maxBitrate = this.maxBitrate;
    final scanType = this.scanType;
    final width = this.width;
    return {
      if (activeInput != null) 'activeInput': activeInput.toValue(),
      if (configuredInput != null) 'configuredInput': configuredInput.toValue(),
      if (deviceState != null) 'deviceState': deviceState.toValue(),
      if (framerate != null) 'framerate': framerate,
      if (height != null) 'height': height,
      if (maxBitrate != null) 'maxBitrate': maxBitrate,
      if (scanType != null) 'scanType': scanType.toValue(),
      if (width != null) 'width': width,
    };
  }
}

/// Input Filter
enum InputFilter {
  auto,
  disabled,
  forced,
}

extension on InputFilter {
  String toValue() {
    switch (this) {
      case InputFilter.auto:
        return 'AUTO';
      case InputFilter.disabled:
        return 'DISABLED';
      case InputFilter.forced:
        return 'FORCED';
    }
  }
}

extension on String {
  InputFilter toInputFilter() {
    switch (this) {
      case 'AUTO':
        return InputFilter.auto;
      case 'DISABLED':
        return InputFilter.disabled;
      case 'FORCED':
        return InputFilter.forced;
    }
    throw Exception('$this is not known in enum InputFilter');
  }
}

/// Input Location
class InputLocation {
  /// Uniform Resource Identifier - This should be a path to a file accessible to
  /// the Live system (eg. a http:// URI) depending on the output type. For
  /// example, a RTMP destination should have a uri simliar to:
  /// "rtmp://fmsserver/live".
  final String uri;

  /// key used to extract the password from EC2 Parameter store
  final String? passwordParam;

  /// Documentation update needed
  final String? username;

  InputLocation({
    required this.uri,
    this.passwordParam,
    this.username,
  });

  factory InputLocation.fromJson(Map<String, dynamic> json) {
    return InputLocation(
      uri: json['uri'] as String,
      passwordParam: json['passwordParam'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    final passwordParam = this.passwordParam;
    final username = this.username;
    return {
      'uri': uri,
      if (passwordParam != null) 'passwordParam': passwordParam,
      if (username != null) 'username': username,
    };
  }
}

/// Input Loss Action For Hls Out
enum InputLossActionForHlsOut {
  emitOutput,
  pauseOutput,
}

extension on InputLossActionForHlsOut {
  String toValue() {
    switch (this) {
      case InputLossActionForHlsOut.emitOutput:
        return 'EMIT_OUTPUT';
      case InputLossActionForHlsOut.pauseOutput:
        return 'PAUSE_OUTPUT';
    }
  }
}

extension on String {
  InputLossActionForHlsOut toInputLossActionForHlsOut() {
    switch (this) {
      case 'EMIT_OUTPUT':
        return InputLossActionForHlsOut.emitOutput;
      case 'PAUSE_OUTPUT':
        return InputLossActionForHlsOut.pauseOutput;
    }
    throw Exception('$this is not known in enum InputLossActionForHlsOut');
  }
}

/// Input Loss Action For Ms Smooth Out
enum InputLossActionForMsSmoothOut {
  emitOutput,
  pauseOutput,
}

extension on InputLossActionForMsSmoothOut {
  String toValue() {
    switch (this) {
      case InputLossActionForMsSmoothOut.emitOutput:
        return 'EMIT_OUTPUT';
      case InputLossActionForMsSmoothOut.pauseOutput:
        return 'PAUSE_OUTPUT';
    }
  }
}

extension on String {
  InputLossActionForMsSmoothOut toInputLossActionForMsSmoothOut() {
    switch (this) {
      case 'EMIT_OUTPUT':
        return InputLossActionForMsSmoothOut.emitOutput;
      case 'PAUSE_OUTPUT':
        return InputLossActionForMsSmoothOut.pauseOutput;
    }
    throw Exception('$this is not known in enum InputLossActionForMsSmoothOut');
  }
}

/// Input Loss Action For Rtmp Out
enum InputLossActionForRtmpOut {
  emitOutput,
  pauseOutput,
}

extension on InputLossActionForRtmpOut {
  String toValue() {
    switch (this) {
      case InputLossActionForRtmpOut.emitOutput:
        return 'EMIT_OUTPUT';
      case InputLossActionForRtmpOut.pauseOutput:
        return 'PAUSE_OUTPUT';
    }
  }
}

extension on String {
  InputLossActionForRtmpOut toInputLossActionForRtmpOut() {
    switch (this) {
      case 'EMIT_OUTPUT':
        return InputLossActionForRtmpOut.emitOutput;
      case 'PAUSE_OUTPUT':
        return InputLossActionForRtmpOut.pauseOutput;
    }
    throw Exception('$this is not known in enum InputLossActionForRtmpOut');
  }
}

/// Input Loss Action For Udp Out
enum InputLossActionForUdpOut {
  dropProgram,
  dropTs,
  emitProgram,
}

extension on InputLossActionForUdpOut {
  String toValue() {
    switch (this) {
      case InputLossActionForUdpOut.dropProgram:
        return 'DROP_PROGRAM';
      case InputLossActionForUdpOut.dropTs:
        return 'DROP_TS';
      case InputLossActionForUdpOut.emitProgram:
        return 'EMIT_PROGRAM';
    }
  }
}

extension on String {
  InputLossActionForUdpOut toInputLossActionForUdpOut() {
    switch (this) {
      case 'DROP_PROGRAM':
        return InputLossActionForUdpOut.dropProgram;
      case 'DROP_TS':
        return InputLossActionForUdpOut.dropTs;
      case 'EMIT_PROGRAM':
        return InputLossActionForUdpOut.emitProgram;
    }
    throw Exception('$this is not known in enum InputLossActionForUdpOut');
  }
}

/// Input Loss Behavior
class InputLossBehavior {
  /// Documentation update needed
  final int? blackFrameMsec;

  /// When input loss image type is "color" this field specifies the color to use.
  /// Value: 6 hex characters representing the values of RGB.
  final String? inputLossImageColor;

  /// When input loss image type is "slate" these fields specify the parameters
  /// for accessing the slate.
  final InputLocation? inputLossImageSlate;

  /// Indicates whether to substitute a solid color or a slate into the output
  /// after input loss exceeds blackFrameMsec.
  final InputLossImageType? inputLossImageType;

  /// Documentation update needed
  final int? repeatFrameMsec;

  InputLossBehavior({
    this.blackFrameMsec,
    this.inputLossImageColor,
    this.inputLossImageSlate,
    this.inputLossImageType,
    this.repeatFrameMsec,
  });

  factory InputLossBehavior.fromJson(Map<String, dynamic> json) {
    return InputLossBehavior(
      blackFrameMsec: json['blackFrameMsec'] as int?,
      inputLossImageColor: json['inputLossImageColor'] as String?,
      inputLossImageSlate: json['inputLossImageSlate'] != null
          ? InputLocation.fromJson(
              json['inputLossImageSlate'] as Map<String, dynamic>)
          : null,
      inputLossImageType:
          (json['inputLossImageType'] as String?)?.toInputLossImageType(),
      repeatFrameMsec: json['repeatFrameMsec'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final blackFrameMsec = this.blackFrameMsec;
    final inputLossImageColor = this.inputLossImageColor;
    final inputLossImageSlate = this.inputLossImageSlate;
    final inputLossImageType = this.inputLossImageType;
    final repeatFrameMsec = this.repeatFrameMsec;
    return {
      if (blackFrameMsec != null) 'blackFrameMsec': blackFrameMsec,
      if (inputLossImageColor != null)
        'inputLossImageColor': inputLossImageColor,
      if (inputLossImageSlate != null)
        'inputLossImageSlate': inputLossImageSlate,
      if (inputLossImageType != null)
        'inputLossImageType': inputLossImageType.toValue(),
      if (repeatFrameMsec != null) 'repeatFrameMsec': repeatFrameMsec,
    };
  }
}

/// MediaLive will perform a failover if content is not detected in this input
/// for the specified period.
class InputLossFailoverSettings {
  /// The amount of time (in milliseconds) that no input is detected. After that
  /// time, an input failover will occur.
  final int? inputLossThresholdMsec;

  InputLossFailoverSettings({
    this.inputLossThresholdMsec,
  });

  factory InputLossFailoverSettings.fromJson(Map<String, dynamic> json) {
    return InputLossFailoverSettings(
      inputLossThresholdMsec: json['inputLossThresholdMsec'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputLossThresholdMsec = this.inputLossThresholdMsec;
    return {
      if (inputLossThresholdMsec != null)
        'inputLossThresholdMsec': inputLossThresholdMsec,
    };
  }
}

/// Input Loss Image Type
enum InputLossImageType {
  color,
  slate,
}

extension on InputLossImageType {
  String toValue() {
    switch (this) {
      case InputLossImageType.color:
        return 'COLOR';
      case InputLossImageType.slate:
        return 'SLATE';
    }
  }
}

extension on String {
  InputLossImageType toInputLossImageType() {
    switch (this) {
      case 'COLOR':
        return InputLossImageType.color;
      case 'SLATE':
        return InputLossImageType.slate;
    }
    throw Exception('$this is not known in enum InputLossImageType');
  }
}

/// Maximum input bitrate in megabits per second. Bitrates up to 50 Mbps are
/// supported currently.
enum InputMaximumBitrate {
  max_10Mbps,
  max_20Mbps,
  max_50Mbps,
}

extension on InputMaximumBitrate {
  String toValue() {
    switch (this) {
      case InputMaximumBitrate.max_10Mbps:
        return 'MAX_10_MBPS';
      case InputMaximumBitrate.max_20Mbps:
        return 'MAX_20_MBPS';
      case InputMaximumBitrate.max_50Mbps:
        return 'MAX_50_MBPS';
    }
  }
}

extension on String {
  InputMaximumBitrate toInputMaximumBitrate() {
    switch (this) {
      case 'MAX_10_MBPS':
        return InputMaximumBitrate.max_10Mbps;
      case 'MAX_20_MBPS':
        return InputMaximumBitrate.max_20Mbps;
      case 'MAX_50_MBPS':
        return InputMaximumBitrate.max_50Mbps;
    }
    throw Exception('$this is not known in enum InputMaximumBitrate');
  }
}

/// Input preference when deciding which input to make active when a previously
/// failed input has recovered.
/// If \"EQUAL_INPUT_PREFERENCE\", then the active input will stay active as
/// long as it is healthy.
/// If \"PRIMARY_INPUT_PREFERRED\", then always switch back to the primary input
/// when it is healthy.
enum InputPreference {
  equalInputPreference,
  primaryInputPreferred,
}

extension on InputPreference {
  String toValue() {
    switch (this) {
      case InputPreference.equalInputPreference:
        return 'EQUAL_INPUT_PREFERENCE';
      case InputPreference.primaryInputPreferred:
        return 'PRIMARY_INPUT_PREFERRED';
    }
  }
}

extension on String {
  InputPreference toInputPreference() {
    switch (this) {
      case 'EQUAL_INPUT_PREFERENCE':
        return InputPreference.equalInputPreference;
      case 'PRIMARY_INPUT_PREFERRED':
        return InputPreference.primaryInputPreferred;
    }
    throw Exception('$this is not known in enum InputPreference');
  }
}

/// Action to prepare an input for a future immediate input switch.
class InputPrepareScheduleActionSettings {
  /// The name of the input attachment that should be prepared by this action. If
  /// no name is provided, the action will stop the most recent prepare (if any)
  /// when activated.
  final String? inputAttachmentNameReference;

  /// Settings to let you create a clip of the file input, in order to set up the
  /// input to ingest only a portion of the file.
  final InputClippingSettings? inputClippingSettings;

  /// The value for the variable portion of the URL for the dynamic input, for
  /// this instance of the input. Each time you use the same dynamic input in an
  /// input switch action, you can provide a different value, in order to connect
  /// the input to a different content source.
  final List<String>? urlPath;

  InputPrepareScheduleActionSettings({
    this.inputAttachmentNameReference,
    this.inputClippingSettings,
    this.urlPath,
  });

  factory InputPrepareScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return InputPrepareScheduleActionSettings(
      inputAttachmentNameReference:
          json['inputAttachmentNameReference'] as String?,
      inputClippingSettings: json['inputClippingSettings'] != null
          ? InputClippingSettings.fromJson(
              json['inputClippingSettings'] as Map<String, dynamic>)
          : null,
      urlPath: (json['urlPath'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputAttachmentNameReference = this.inputAttachmentNameReference;
    final inputClippingSettings = this.inputClippingSettings;
    final urlPath = this.urlPath;
    return {
      if (inputAttachmentNameReference != null)
        'inputAttachmentNameReference': inputAttachmentNameReference,
      if (inputClippingSettings != null)
        'inputClippingSettings': inputClippingSettings,
      if (urlPath != null) 'urlPath': urlPath,
    };
  }
}

/// Input resolution based on lines of vertical resolution in the input; SD is
/// less than 720 lines, HD is 720 to 1080 lines, UHD is greater than 1080 lines
enum InputResolution {
  sd,
  hd,
  uhd,
}

extension on InputResolution {
  String toValue() {
    switch (this) {
      case InputResolution.sd:
        return 'SD';
      case InputResolution.hd:
        return 'HD';
      case InputResolution.uhd:
        return 'UHD';
    }
  }
}

extension on String {
  InputResolution toInputResolution() {
    switch (this) {
      case 'SD':
        return InputResolution.sd;
      case 'HD':
        return InputResolution.hd;
      case 'UHD':
        return InputResolution.uhd;
    }
    throw Exception('$this is not known in enum InputResolution');
  }
}

/// An Input Security Group
class InputSecurityGroup {
  /// Unique ARN of Input Security Group
  final String? arn;

  /// The Id of the Input Security Group
  final String? id;

  /// The list of inputs currently using this Input Security Group.
  final List<String>? inputs;

  /// The current state of the Input Security Group.
  final InputSecurityGroupState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Whitelist rules and their sync status
  final List<InputWhitelistRule>? whitelistRules;

  InputSecurityGroup({
    this.arn,
    this.id,
    this.inputs,
    this.state,
    this.tags,
    this.whitelistRules,
  });

  factory InputSecurityGroup.fromJson(Map<String, dynamic> json) {
    return InputSecurityGroup(
      arn: json['arn'] as String?,
      id: json['id'] as String?,
      inputs: (json['inputs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      state: (json['state'] as String?)?.toInputSecurityGroupState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      whitelistRules: (json['whitelistRules'] as List?)
          ?.whereNotNull()
          .map((e) => InputWhitelistRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final inputs = this.inputs;
    final state = this.state;
    final tags = this.tags;
    final whitelistRules = this.whitelistRules;
    return {
      if (arn != null) 'arn': arn,
      if (id != null) 'id': id,
      if (inputs != null) 'inputs': inputs,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (whitelistRules != null) 'whitelistRules': whitelistRules,
    };
  }
}

/// Placeholder documentation for InputSecurityGroupState
enum InputSecurityGroupState {
  idle,
  inUse,
  updating,
  deleted,
}

extension on InputSecurityGroupState {
  String toValue() {
    switch (this) {
      case InputSecurityGroupState.idle:
        return 'IDLE';
      case InputSecurityGroupState.inUse:
        return 'IN_USE';
      case InputSecurityGroupState.updating:
        return 'UPDATING';
      case InputSecurityGroupState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  InputSecurityGroupState toInputSecurityGroupState() {
    switch (this) {
      case 'IDLE':
        return InputSecurityGroupState.idle;
      case 'IN_USE':
        return InputSecurityGroupState.inUse;
      case 'UPDATING':
        return InputSecurityGroupState.updating;
      case 'DELETED':
        return InputSecurityGroupState.deleted;
    }
    throw Exception('$this is not known in enum InputSecurityGroupState');
  }
}

/// Live Event input parameters. There can be multiple inputs in a single Live
/// Event.
class InputSettings {
  /// Used to select the audio stream to decode for inputs that have multiple
  /// available.
  final List<AudioSelector>? audioSelectors;

  /// Used to select the caption input to use for inputs that have multiple
  /// available.
  final List<CaptionSelector>? captionSelectors;

  /// Enable or disable the deblock filter when filtering.
  final InputDeblockFilter? deblockFilter;

  /// Enable or disable the denoise filter when filtering.
  final InputDenoiseFilter? denoiseFilter;

  /// Adjusts the magnitude of filtering from 1 (minimal) to 5 (strongest).
  final int? filterStrength;

  /// Turns on the filter for this input. MPEG-2 inputs have the deblocking filter
  /// enabled by default.
  /// 1) auto - filtering will be applied depending on input type/quality
  /// 2) disabled - no filtering will be applied to the input
  /// 3) forced - filtering will be applied regardless of input type
  final InputFilter? inputFilter;

  /// Input settings.
  final NetworkInputSettings? networkInputSettings;

  /// Specifies whether to extract applicable ancillary data from a SMPTE-2038
  /// source in this input. Applicable data types are captions, timecode, AFD, and
  /// SCTE-104 messages.
  /// - PREFER: Extract from SMPTE-2038 if present in this input, otherwise
  /// extract from another source (if any).
  /// - IGNORE: Never extract any ancillary data from SMPTE-2038.
  final Smpte2038DataPreference? smpte2038DataPreference;

  /// Loop input if it is a file. This allows a file input to be streamed
  /// indefinitely.
  final InputSourceEndBehavior? sourceEndBehavior;

  /// Informs which video elementary stream to decode for input types that have
  /// multiple available.
  final VideoSelector? videoSelector;

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

  factory InputSettings.fromJson(Map<String, dynamic> json) {
    return InputSettings(
      audioSelectors: (json['audioSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => AudioSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      captionSelectors: (json['captionSelectors'] as List?)
          ?.whereNotNull()
          .map((e) => CaptionSelector.fromJson(e as Map<String, dynamic>))
          .toList(),
      deblockFilter: (json['deblockFilter'] as String?)?.toInputDeblockFilter(),
      denoiseFilter: (json['denoiseFilter'] as String?)?.toInputDenoiseFilter(),
      filterStrength: json['filterStrength'] as int?,
      inputFilter: (json['inputFilter'] as String?)?.toInputFilter(),
      networkInputSettings: json['networkInputSettings'] != null
          ? NetworkInputSettings.fromJson(
              json['networkInputSettings'] as Map<String, dynamic>)
          : null,
      smpte2038DataPreference: (json['smpte2038DataPreference'] as String?)
          ?.toSmpte2038DataPreference(),
      sourceEndBehavior:
          (json['sourceEndBehavior'] as String?)?.toInputSourceEndBehavior(),
      videoSelector: json['videoSelector'] != null
          ? VideoSelector.fromJson(
              json['videoSelector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioSelectors = this.audioSelectors;
    final captionSelectors = this.captionSelectors;
    final deblockFilter = this.deblockFilter;
    final denoiseFilter = this.denoiseFilter;
    final filterStrength = this.filterStrength;
    final inputFilter = this.inputFilter;
    final networkInputSettings = this.networkInputSettings;
    final smpte2038DataPreference = this.smpte2038DataPreference;
    final sourceEndBehavior = this.sourceEndBehavior;
    final videoSelector = this.videoSelector;
    return {
      if (audioSelectors != null) 'audioSelectors': audioSelectors,
      if (captionSelectors != null) 'captionSelectors': captionSelectors,
      if (deblockFilter != null) 'deblockFilter': deblockFilter.toValue(),
      if (denoiseFilter != null) 'denoiseFilter': denoiseFilter.toValue(),
      if (filterStrength != null) 'filterStrength': filterStrength,
      if (inputFilter != null) 'inputFilter': inputFilter.toValue(),
      if (networkInputSettings != null)
        'networkInputSettings': networkInputSettings,
      if (smpte2038DataPreference != null)
        'smpte2038DataPreference': smpte2038DataPreference.toValue(),
      if (sourceEndBehavior != null)
        'sourceEndBehavior': sourceEndBehavior.toValue(),
      if (videoSelector != null) 'videoSelector': videoSelector,
    };
  }
}

/// The settings for a PULL type input.
class InputSource {
  /// The key used to extract the password from EC2 Parameter store.
  final String? passwordParam;

  /// This represents the customer's source URL where stream is
  /// pulled from.
  final String? url;

  /// The username for the input source.
  final String? username;

  InputSource({
    this.passwordParam,
    this.url,
    this.username,
  });

  factory InputSource.fromJson(Map<String, dynamic> json) {
    return InputSource(
      passwordParam: json['passwordParam'] as String?,
      url: json['url'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final passwordParam = this.passwordParam;
    final url = this.url;
    final username = this.username;
    return {
      if (passwordParam != null) 'passwordParam': passwordParam,
      if (url != null) 'url': url,
      if (username != null) 'username': username,
    };
  }
}

/// Input Source End Behavior
enum InputSourceEndBehavior {
  $continue,
  loop,
}

extension on InputSourceEndBehavior {
  String toValue() {
    switch (this) {
      case InputSourceEndBehavior.$continue:
        return 'CONTINUE';
      case InputSourceEndBehavior.loop:
        return 'LOOP';
    }
  }
}

extension on String {
  InputSourceEndBehavior toInputSourceEndBehavior() {
    switch (this) {
      case 'CONTINUE':
        return InputSourceEndBehavior.$continue;
      case 'LOOP':
        return InputSourceEndBehavior.loop;
    }
    throw Exception('$this is not known in enum InputSourceEndBehavior');
  }
}

/// Settings for for a PULL type input.
class InputSourceRequest {
  /// The key used to extract the password from EC2 Parameter store.
  final String? passwordParam;

  /// This represents the customer's source URL where stream is
  /// pulled from.
  final String? url;

  /// The username for the input source.
  final String? username;

  InputSourceRequest({
    this.passwordParam,
    this.url,
    this.username,
  });

  factory InputSourceRequest.fromJson(Map<String, dynamic> json) {
    return InputSourceRequest(
      passwordParam: json['passwordParam'] as String?,
      url: json['url'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final passwordParam = this.passwordParam;
    final url = this.url;
    final username = this.username;
    return {
      if (passwordParam != null) 'passwordParam': passwordParam,
      if (url != null) 'url': url,
      if (username != null) 'username': username,
    };
  }
}

/// There are two types of input sources, static and dynamic. If an input source
/// is dynamic you can
/// change the source url of the input dynamically using an input switch action.
/// However, the only input type
/// to support a dynamic url at this time is MP4_FILE. By default all input
/// sources are static.
enum InputSourceType {
  static,
  dynamic,
}

extension on InputSourceType {
  String toValue() {
    switch (this) {
      case InputSourceType.static:
        return 'STATIC';
      case InputSourceType.dynamic:
        return 'DYNAMIC';
    }
  }
}

extension on String {
  InputSourceType toInputSourceType() {
    switch (this) {
      case 'STATIC':
        return InputSourceType.static;
      case 'DYNAMIC':
        return InputSourceType.dynamic;
    }
    throw Exception('$this is not known in enum InputSourceType');
  }
}

/// Placeholder documentation for InputSpecification
class InputSpecification {
  /// Input codec
  final InputCodec? codec;

  /// Maximum input bitrate, categorized coarsely
  final InputMaximumBitrate? maximumBitrate;

  /// Input resolution, categorized coarsely
  final InputResolution? resolution;

  InputSpecification({
    this.codec,
    this.maximumBitrate,
    this.resolution,
  });

  factory InputSpecification.fromJson(Map<String, dynamic> json) {
    return InputSpecification(
      codec: (json['codec'] as String?)?.toInputCodec(),
      maximumBitrate:
          (json['maximumBitrate'] as String?)?.toInputMaximumBitrate(),
      resolution: (json['resolution'] as String?)?.toInputResolution(),
    );
  }

  Map<String, dynamic> toJson() {
    final codec = this.codec;
    final maximumBitrate = this.maximumBitrate;
    final resolution = this.resolution;
    return {
      if (codec != null) 'codec': codec.toValue(),
      if (maximumBitrate != null) 'maximumBitrate': maximumBitrate.toValue(),
      if (resolution != null) 'resolution': resolution.toValue(),
    };
  }
}

/// Placeholder documentation for InputState
enum InputState {
  creating,
  detached,
  attached,
  deleting,
  deleted,
}

extension on InputState {
  String toValue() {
    switch (this) {
      case InputState.creating:
        return 'CREATING';
      case InputState.detached:
        return 'DETACHED';
      case InputState.attached:
        return 'ATTACHED';
      case InputState.deleting:
        return 'DELETING';
      case InputState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  InputState toInputState() {
    switch (this) {
      case 'CREATING':
        return InputState.creating;
      case 'DETACHED':
        return InputState.detached;
      case 'ATTACHED':
        return InputState.attached;
      case 'DELETING':
        return InputState.deleting;
      case 'DELETED':
        return InputState.deleted;
    }
    throw Exception('$this is not known in enum InputState');
  }
}

/// Settings for the "switch input" action: to switch from ingesting one input
/// to ingesting another input.
class InputSwitchScheduleActionSettings {
  /// The name of the input attachment (not the name of the input!) to switch to.
  /// The name is specified in the channel configuration.
  final String inputAttachmentNameReference;

  /// Settings to let you create a clip of the file input, in order to set up the
  /// input to ingest only a portion of the file.
  final InputClippingSettings? inputClippingSettings;

  /// The value for the variable portion of the URL for the dynamic input, for
  /// this instance of the input. Each time you use the same dynamic input in an
  /// input switch action, you can provide a different value, in order to connect
  /// the input to a different content source.
  final List<String>? urlPath;

  InputSwitchScheduleActionSettings({
    required this.inputAttachmentNameReference,
    this.inputClippingSettings,
    this.urlPath,
  });

  factory InputSwitchScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return InputSwitchScheduleActionSettings(
      inputAttachmentNameReference:
          json['inputAttachmentNameReference'] as String,
      inputClippingSettings: json['inputClippingSettings'] != null
          ? InputClippingSettings.fromJson(
              json['inputClippingSettings'] as Map<String, dynamic>)
          : null,
      urlPath: (json['urlPath'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputAttachmentNameReference = this.inputAttachmentNameReference;
    final inputClippingSettings = this.inputClippingSettings;
    final urlPath = this.urlPath;
    return {
      'inputAttachmentNameReference': inputAttachmentNameReference,
      if (inputClippingSettings != null)
        'inputClippingSettings': inputClippingSettings,
      if (urlPath != null) 'urlPath': urlPath,
    };
  }
}

/// Documentation update needed
enum InputTimecodeSource {
  zerobased,
  embedded,
}

extension on InputTimecodeSource {
  String toValue() {
    switch (this) {
      case InputTimecodeSource.zerobased:
        return 'ZEROBASED';
      case InputTimecodeSource.embedded:
        return 'EMBEDDED';
    }
  }
}

extension on String {
  InputTimecodeSource toInputTimecodeSource() {
    switch (this) {
      case 'ZEROBASED':
        return InputTimecodeSource.zerobased;
      case 'EMBEDDED':
        return InputTimecodeSource.embedded;
    }
    throw Exception('$this is not known in enum InputTimecodeSource');
  }
}

/// Placeholder documentation for InputType
enum InputType {
  udpPush,
  rtpPush,
  rtmpPush,
  rtmpPull,
  urlPull,
  mp4File,
  mediaconnect,
  inputDevice,
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
  }
}

extension on String {
  InputType toInputType() {
    switch (this) {
      case 'UDP_PUSH':
        return InputType.udpPush;
      case 'RTP_PUSH':
        return InputType.rtpPush;
      case 'RTMP_PUSH':
        return InputType.rtmpPush;
      case 'RTMP_PULL':
        return InputType.rtmpPull;
      case 'URL_PULL':
        return InputType.urlPull;
      case 'MP4_FILE':
        return InputType.mp4File;
      case 'MEDIACONNECT':
        return InputType.mediaconnect;
      case 'INPUT_DEVICE':
        return InputType.inputDevice;
      case 'AWS_CDI':
        return InputType.awsCdi;
    }
    throw Exception('$this is not known in enum InputType');
  }
}

/// Settings for a private VPC Input.
/// When this property is specified, the input destination addresses will be
/// created in a VPC rather than with public Internet addresses.
/// This property requires setting the roleArn property on Input creation.
/// Not compatible with the inputSecurityGroups property.
class InputVpcRequest {
  /// A list of 2 VPC subnet IDs from the same VPC.
  /// Subnet IDs must be mapped to two unique availability zones (AZ).
  final List<String> subnetIds;

  /// A list of up to 5 EC2 VPC security group IDs to attach to the Input VPC
  /// network interfaces.
  /// Requires subnetIds. If none are specified then the VPC default security
  /// group will be used.
  final List<String>? securityGroupIds;

  InputVpcRequest({
    required this.subnetIds,
    this.securityGroupIds,
  });

  factory InputVpcRequest.fromJson(Map<String, dynamic> json) {
    return InputVpcRequest(
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final securityGroupIds = this.securityGroupIds;
    return {
      'subnetIds': subnetIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
  }
}

/// Whitelist rule
class InputWhitelistRule {
  /// The IPv4 CIDR that's whitelisted.
  final String? cidr;

  InputWhitelistRule({
    this.cidr,
  });

  factory InputWhitelistRule.fromJson(Map<String, dynamic> json) {
    return InputWhitelistRule(
      cidr: json['cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidr = this.cidr;
    return {
      if (cidr != null) 'cidr': cidr,
    };
  }
}

/// An IPv4 CIDR to whitelist.
class InputWhitelistRuleCidr {
  /// The IPv4 CIDR to whitelist.
  final String? cidr;

  InputWhitelistRuleCidr({
    this.cidr,
  });

  factory InputWhitelistRuleCidr.fromJson(Map<String, dynamic> json) {
    return InputWhitelistRuleCidr(
      cidr: json['cidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cidr = this.cidr;
    return {
      if (cidr != null) 'cidr': cidr,
    };
  }
}

/// Key Provider Settings
class KeyProviderSettings {
  final StaticKeySettings? staticKeySettings;

  KeyProviderSettings({
    this.staticKeySettings,
  });

  factory KeyProviderSettings.fromJson(Map<String, dynamic> json) {
    return KeyProviderSettings(
      staticKeySettings: json['staticKeySettings'] != null
          ? StaticKeySettings.fromJson(
              json['staticKeySettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final staticKeySettings = this.staticKeySettings;
    return {
      if (staticKeySettings != null) 'staticKeySettings': staticKeySettings,
    };
  }
}

/// If you specify a StopTimecode in an input (in order to clip the file), you
/// can specify if you want the clip to exclude (the default) or include the
/// frame specified by the timecode.
enum LastFrameClippingBehavior {
  excludeLastFrame,
  includeLastFrame,
}

extension on LastFrameClippingBehavior {
  String toValue() {
    switch (this) {
      case LastFrameClippingBehavior.excludeLastFrame:
        return 'EXCLUDE_LAST_FRAME';
      case LastFrameClippingBehavior.includeLastFrame:
        return 'INCLUDE_LAST_FRAME';
    }
  }
}

extension on String {
  LastFrameClippingBehavior toLastFrameClippingBehavior() {
    switch (this) {
      case 'EXCLUDE_LAST_FRAME':
        return LastFrameClippingBehavior.excludeLastFrame;
      case 'INCLUDE_LAST_FRAME':
        return LastFrameClippingBehavior.includeLastFrame;
    }
    throw Exception('$this is not known in enum LastFrameClippingBehavior');
  }
}

/// Placeholder documentation for ListChannelsResponse
class ListChannelsResponse {
  final List<ChannelSummary>? channels;
  final String? nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      channels: (json['channels'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'channels': channels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Placeholder documentation for ListInputDeviceTransfersResponse
class ListInputDeviceTransfersResponse {
  /// The list of devices that you are transferring or are being transferred to
  /// you.
  final List<TransferringInputDeviceSummary>? inputDeviceTransfers;

  /// A token to get additional list results.
  final String? nextToken;

  ListInputDeviceTransfersResponse({
    this.inputDeviceTransfers,
    this.nextToken,
  });

  factory ListInputDeviceTransfersResponse.fromJson(Map<String, dynamic> json) {
    return ListInputDeviceTransfersResponse(
      inputDeviceTransfers: (json['inputDeviceTransfers'] as List?)
          ?.whereNotNull()
          .map((e) => TransferringInputDeviceSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputDeviceTransfers = this.inputDeviceTransfers;
    final nextToken = this.nextToken;
    return {
      if (inputDeviceTransfers != null)
        'inputDeviceTransfers': inputDeviceTransfers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Placeholder documentation for ListInputDevicesResponse
class ListInputDevicesResponse {
  /// The list of input devices.
  final List<InputDeviceSummary>? inputDevices;

  /// A token to get additional list results.
  final String? nextToken;

  ListInputDevicesResponse({
    this.inputDevices,
    this.nextToken,
  });

  factory ListInputDevicesResponse.fromJson(Map<String, dynamic> json) {
    return ListInputDevicesResponse(
      inputDevices: (json['inputDevices'] as List?)
          ?.whereNotNull()
          .map((e) => InputDeviceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputDevices = this.inputDevices;
    final nextToken = this.nextToken;
    return {
      if (inputDevices != null) 'inputDevices': inputDevices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Placeholder documentation for ListInputSecurityGroupsResponse
class ListInputSecurityGroupsResponse {
  /// List of input security groups
  final List<InputSecurityGroup>? inputSecurityGroups;
  final String? nextToken;

  ListInputSecurityGroupsResponse({
    this.inputSecurityGroups,
    this.nextToken,
  });

  factory ListInputSecurityGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListInputSecurityGroupsResponse(
      inputSecurityGroups: (json['inputSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => InputSecurityGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputSecurityGroups = this.inputSecurityGroups;
    final nextToken = this.nextToken;
    return {
      if (inputSecurityGroups != null)
        'inputSecurityGroups': inputSecurityGroups,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Placeholder documentation for ListInputsResponse
class ListInputsResponse {
  final List<Input>? inputs;
  final String? nextToken;

  ListInputsResponse({
    this.inputs,
    this.nextToken,
  });

  factory ListInputsResponse.fromJson(Map<String, dynamic> json) {
    return ListInputsResponse(
      inputs: (json['inputs'] as List?)
          ?.whereNotNull()
          .map((e) => Input.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputs = this.inputs;
    final nextToken = this.nextToken;
    return {
      if (inputs != null) 'inputs': inputs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Placeholder documentation for ListMultiplexProgramsResponse
class ListMultiplexProgramsResponse {
  /// List of multiplex programs.
  final List<MultiplexProgramSummary>? multiplexPrograms;

  /// Token for the next ListMultiplexProgram request.
  final String? nextToken;

  ListMultiplexProgramsResponse({
    this.multiplexPrograms,
    this.nextToken,
  });

  factory ListMultiplexProgramsResponse.fromJson(Map<String, dynamic> json) {
    return ListMultiplexProgramsResponse(
      multiplexPrograms: (json['multiplexPrograms'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MultiplexProgramSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multiplexPrograms = this.multiplexPrograms;
    final nextToken = this.nextToken;
    return {
      if (multiplexPrograms != null) 'multiplexPrograms': multiplexPrograms,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Placeholder documentation for ListMultiplexesResponse
class ListMultiplexesResponse {
  /// List of multiplexes.
  final List<MultiplexSummary>? multiplexes;

  /// Token for the next ListMultiplexes request.
  final String? nextToken;

  ListMultiplexesResponse({
    this.multiplexes,
    this.nextToken,
  });

  factory ListMultiplexesResponse.fromJson(Map<String, dynamic> json) {
    return ListMultiplexesResponse(
      multiplexes: (json['multiplexes'] as List?)
          ?.whereNotNull()
          .map((e) => MultiplexSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multiplexes = this.multiplexes;
    final nextToken = this.nextToken;
    return {
      if (multiplexes != null) 'multiplexes': multiplexes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Placeholder documentation for ListOfferingsResponse
class ListOfferingsResponse {
  /// Token to retrieve the next page of results
  final String? nextToken;

  /// List of offerings
  final List<Offering>? offerings;

  ListOfferingsResponse({
    this.nextToken,
    this.offerings,
  });

  factory ListOfferingsResponse.fromJson(Map<String, dynamic> json) {
    return ListOfferingsResponse(
      nextToken: json['nextToken'] as String?,
      offerings: (json['offerings'] as List?)
          ?.whereNotNull()
          .map((e) => Offering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final offerings = this.offerings;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (offerings != null) 'offerings': offerings,
    };
  }
}

/// Placeholder documentation for ListReservationsResponse
class ListReservationsResponse {
  /// Token to retrieve the next page of results
  final String? nextToken;

  /// List of reservations
  final List<Reservation>? reservations;

  ListReservationsResponse({
    this.nextToken,
    this.reservations,
  });

  factory ListReservationsResponse.fromJson(Map<String, dynamic> json) {
    return ListReservationsResponse(
      nextToken: json['nextToken'] as String?,
      reservations: (json['reservations'] as List?)
          ?.whereNotNull()
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final reservations = this.reservations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (reservations != null) 'reservations': reservations,
    };
  }
}

/// Placeholder documentation for ListTagsForResourceResponse
class ListTagsForResourceResponse {
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// The log level the user wants for their channel.
enum LogLevel {
  error,
  warning,
  info,
  debug,
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
  }
}

extension on String {
  LogLevel toLogLevel() {
    switch (this) {
      case 'ERROR':
        return LogLevel.error;
      case 'WARNING':
        return LogLevel.warning;
      case 'INFO':
        return LogLevel.info;
      case 'DEBUG':
        return LogLevel.debug;
      case 'DISABLED':
        return LogLevel.disabled;
    }
    throw Exception('$this is not known in enum LogLevel');
  }
}

/// M2ts Absent Input Audio Behavior
enum M2tsAbsentInputAudioBehavior {
  drop,
  encodeSilence,
}

extension on M2tsAbsentInputAudioBehavior {
  String toValue() {
    switch (this) {
      case M2tsAbsentInputAudioBehavior.drop:
        return 'DROP';
      case M2tsAbsentInputAudioBehavior.encodeSilence:
        return 'ENCODE_SILENCE';
    }
  }
}

extension on String {
  M2tsAbsentInputAudioBehavior toM2tsAbsentInputAudioBehavior() {
    switch (this) {
      case 'DROP':
        return M2tsAbsentInputAudioBehavior.drop;
      case 'ENCODE_SILENCE':
        return M2tsAbsentInputAudioBehavior.encodeSilence;
    }
    throw Exception('$this is not known in enum M2tsAbsentInputAudioBehavior');
  }
}

/// M2ts Arib
enum M2tsArib {
  disabled,
  enabled,
}

extension on M2tsArib {
  String toValue() {
    switch (this) {
      case M2tsArib.disabled:
        return 'DISABLED';
      case M2tsArib.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  M2tsArib toM2tsArib() {
    switch (this) {
      case 'DISABLED':
        return M2tsArib.disabled;
      case 'ENABLED':
        return M2tsArib.enabled;
    }
    throw Exception('$this is not known in enum M2tsArib');
  }
}

/// M2ts Arib Captions Pid Control
enum M2tsAribCaptionsPidControl {
  auto,
  useConfigured,
}

extension on M2tsAribCaptionsPidControl {
  String toValue() {
    switch (this) {
      case M2tsAribCaptionsPidControl.auto:
        return 'AUTO';
      case M2tsAribCaptionsPidControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  M2tsAribCaptionsPidControl toM2tsAribCaptionsPidControl() {
    switch (this) {
      case 'AUTO':
        return M2tsAribCaptionsPidControl.auto;
      case 'USE_CONFIGURED':
        return M2tsAribCaptionsPidControl.useConfigured;
    }
    throw Exception('$this is not known in enum M2tsAribCaptionsPidControl');
  }
}

/// M2ts Audio Buffer Model
enum M2tsAudioBufferModel {
  atsc,
  dvb,
}

extension on M2tsAudioBufferModel {
  String toValue() {
    switch (this) {
      case M2tsAudioBufferModel.atsc:
        return 'ATSC';
      case M2tsAudioBufferModel.dvb:
        return 'DVB';
    }
  }
}

extension on String {
  M2tsAudioBufferModel toM2tsAudioBufferModel() {
    switch (this) {
      case 'ATSC':
        return M2tsAudioBufferModel.atsc;
      case 'DVB':
        return M2tsAudioBufferModel.dvb;
    }
    throw Exception('$this is not known in enum M2tsAudioBufferModel');
  }
}

/// M2ts Audio Interval
enum M2tsAudioInterval {
  videoAndFixedIntervals,
  videoInterval,
}

extension on M2tsAudioInterval {
  String toValue() {
    switch (this) {
      case M2tsAudioInterval.videoAndFixedIntervals:
        return 'VIDEO_AND_FIXED_INTERVALS';
      case M2tsAudioInterval.videoInterval:
        return 'VIDEO_INTERVAL';
    }
  }
}

extension on String {
  M2tsAudioInterval toM2tsAudioInterval() {
    switch (this) {
      case 'VIDEO_AND_FIXED_INTERVALS':
        return M2tsAudioInterval.videoAndFixedIntervals;
      case 'VIDEO_INTERVAL':
        return M2tsAudioInterval.videoInterval;
    }
    throw Exception('$this is not known in enum M2tsAudioInterval');
  }
}

/// M2ts Audio Stream Type
enum M2tsAudioStreamType {
  atsc,
  dvb,
}

extension on M2tsAudioStreamType {
  String toValue() {
    switch (this) {
      case M2tsAudioStreamType.atsc:
        return 'ATSC';
      case M2tsAudioStreamType.dvb:
        return 'DVB';
    }
  }
}

extension on String {
  M2tsAudioStreamType toM2tsAudioStreamType() {
    switch (this) {
      case 'ATSC':
        return M2tsAudioStreamType.atsc;
      case 'DVB':
        return M2tsAudioStreamType.dvb;
    }
    throw Exception('$this is not known in enum M2tsAudioStreamType');
  }
}

/// M2ts Buffer Model
enum M2tsBufferModel {
  multiplex,
  none,
}

extension on M2tsBufferModel {
  String toValue() {
    switch (this) {
      case M2tsBufferModel.multiplex:
        return 'MULTIPLEX';
      case M2tsBufferModel.none:
        return 'NONE';
    }
  }
}

extension on String {
  M2tsBufferModel toM2tsBufferModel() {
    switch (this) {
      case 'MULTIPLEX':
        return M2tsBufferModel.multiplex;
      case 'NONE':
        return M2tsBufferModel.none;
    }
    throw Exception('$this is not known in enum M2tsBufferModel');
  }
}

/// M2ts Cc Descriptor
enum M2tsCcDescriptor {
  disabled,
  enabled,
}

extension on M2tsCcDescriptor {
  String toValue() {
    switch (this) {
      case M2tsCcDescriptor.disabled:
        return 'DISABLED';
      case M2tsCcDescriptor.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  M2tsCcDescriptor toM2tsCcDescriptor() {
    switch (this) {
      case 'DISABLED':
        return M2tsCcDescriptor.disabled;
      case 'ENABLED':
        return M2tsCcDescriptor.enabled;
    }
    throw Exception('$this is not known in enum M2tsCcDescriptor');
  }
}

/// M2ts Ebif Control
enum M2tsEbifControl {
  none,
  passthrough,
}

extension on M2tsEbifControl {
  String toValue() {
    switch (this) {
      case M2tsEbifControl.none:
        return 'NONE';
      case M2tsEbifControl.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M2tsEbifControl toM2tsEbifControl() {
    switch (this) {
      case 'NONE':
        return M2tsEbifControl.none;
      case 'PASSTHROUGH':
        return M2tsEbifControl.passthrough;
    }
    throw Exception('$this is not known in enum M2tsEbifControl');
  }
}

/// M2ts Ebp Placement
enum M2tsEbpPlacement {
  videoAndAudioPids,
  videoPid,
}

extension on M2tsEbpPlacement {
  String toValue() {
    switch (this) {
      case M2tsEbpPlacement.videoAndAudioPids:
        return 'VIDEO_AND_AUDIO_PIDS';
      case M2tsEbpPlacement.videoPid:
        return 'VIDEO_PID';
    }
  }
}

extension on String {
  M2tsEbpPlacement toM2tsEbpPlacement() {
    switch (this) {
      case 'VIDEO_AND_AUDIO_PIDS':
        return M2tsEbpPlacement.videoAndAudioPids;
      case 'VIDEO_PID':
        return M2tsEbpPlacement.videoPid;
    }
    throw Exception('$this is not known in enum M2tsEbpPlacement');
  }
}

/// M2ts Es Rate In Pes
enum M2tsEsRateInPes {
  exclude,
  include,
}

extension on M2tsEsRateInPes {
  String toValue() {
    switch (this) {
      case M2tsEsRateInPes.exclude:
        return 'EXCLUDE';
      case M2tsEsRateInPes.include:
        return 'INCLUDE';
    }
  }
}

extension on String {
  M2tsEsRateInPes toM2tsEsRateInPes() {
    switch (this) {
      case 'EXCLUDE':
        return M2tsEsRateInPes.exclude;
      case 'INCLUDE':
        return M2tsEsRateInPes.include;
    }
    throw Exception('$this is not known in enum M2tsEsRateInPes');
  }
}

/// M2ts Klv
enum M2tsKlv {
  none,
  passthrough,
}

extension on M2tsKlv {
  String toValue() {
    switch (this) {
      case M2tsKlv.none:
        return 'NONE';
      case M2tsKlv.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M2tsKlv toM2tsKlv() {
    switch (this) {
      case 'NONE':
        return M2tsKlv.none;
      case 'PASSTHROUGH':
        return M2tsKlv.passthrough;
    }
    throw Exception('$this is not known in enum M2tsKlv');
  }
}

/// M2ts Nielsen Id3 Behavior
enum M2tsNielsenId3Behavior {
  noPassthrough,
  passthrough,
}

extension on M2tsNielsenId3Behavior {
  String toValue() {
    switch (this) {
      case M2tsNielsenId3Behavior.noPassthrough:
        return 'NO_PASSTHROUGH';
      case M2tsNielsenId3Behavior.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M2tsNielsenId3Behavior toM2tsNielsenId3Behavior() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return M2tsNielsenId3Behavior.noPassthrough;
      case 'PASSTHROUGH':
        return M2tsNielsenId3Behavior.passthrough;
    }
    throw Exception('$this is not known in enum M2tsNielsenId3Behavior');
  }
}

/// M2ts Pcr Control
enum M2tsPcrControl {
  configuredPcrPeriod,
  pcrEveryPesPacket,
}

extension on M2tsPcrControl {
  String toValue() {
    switch (this) {
      case M2tsPcrControl.configuredPcrPeriod:
        return 'CONFIGURED_PCR_PERIOD';
      case M2tsPcrControl.pcrEveryPesPacket:
        return 'PCR_EVERY_PES_PACKET';
    }
  }
}

extension on String {
  M2tsPcrControl toM2tsPcrControl() {
    switch (this) {
      case 'CONFIGURED_PCR_PERIOD':
        return M2tsPcrControl.configuredPcrPeriod;
      case 'PCR_EVERY_PES_PACKET':
        return M2tsPcrControl.pcrEveryPesPacket;
    }
    throw Exception('$this is not known in enum M2tsPcrControl');
  }
}

/// M2ts Rate Mode
enum M2tsRateMode {
  cbr,
  vbr,
}

extension on M2tsRateMode {
  String toValue() {
    switch (this) {
      case M2tsRateMode.cbr:
        return 'CBR';
      case M2tsRateMode.vbr:
        return 'VBR';
    }
  }
}

extension on String {
  M2tsRateMode toM2tsRateMode() {
    switch (this) {
      case 'CBR':
        return M2tsRateMode.cbr;
      case 'VBR':
        return M2tsRateMode.vbr;
    }
    throw Exception('$this is not known in enum M2tsRateMode');
  }
}

/// M2ts Scte35 Control
enum M2tsScte35Control {
  none,
  passthrough,
}

extension on M2tsScte35Control {
  String toValue() {
    switch (this) {
      case M2tsScte35Control.none:
        return 'NONE';
      case M2tsScte35Control.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M2tsScte35Control toM2tsScte35Control() {
    switch (this) {
      case 'NONE':
        return M2tsScte35Control.none;
      case 'PASSTHROUGH':
        return M2tsScte35Control.passthrough;
    }
    throw Exception('$this is not known in enum M2tsScte35Control');
  }
}

/// M2ts Segmentation Markers
enum M2tsSegmentationMarkers {
  ebp,
  ebpLegacy,
  none,
  psiSegstart,
  raiAdapt,
  raiSegstart,
}

extension on M2tsSegmentationMarkers {
  String toValue() {
    switch (this) {
      case M2tsSegmentationMarkers.ebp:
        return 'EBP';
      case M2tsSegmentationMarkers.ebpLegacy:
        return 'EBP_LEGACY';
      case M2tsSegmentationMarkers.none:
        return 'NONE';
      case M2tsSegmentationMarkers.psiSegstart:
        return 'PSI_SEGSTART';
      case M2tsSegmentationMarkers.raiAdapt:
        return 'RAI_ADAPT';
      case M2tsSegmentationMarkers.raiSegstart:
        return 'RAI_SEGSTART';
    }
  }
}

extension on String {
  M2tsSegmentationMarkers toM2tsSegmentationMarkers() {
    switch (this) {
      case 'EBP':
        return M2tsSegmentationMarkers.ebp;
      case 'EBP_LEGACY':
        return M2tsSegmentationMarkers.ebpLegacy;
      case 'NONE':
        return M2tsSegmentationMarkers.none;
      case 'PSI_SEGSTART':
        return M2tsSegmentationMarkers.psiSegstart;
      case 'RAI_ADAPT':
        return M2tsSegmentationMarkers.raiAdapt;
      case 'RAI_SEGSTART':
        return M2tsSegmentationMarkers.raiSegstart;
    }
    throw Exception('$this is not known in enum M2tsSegmentationMarkers');
  }
}

/// M2ts Segmentation Style
enum M2tsSegmentationStyle {
  maintainCadence,
  resetCadence,
}

extension on M2tsSegmentationStyle {
  String toValue() {
    switch (this) {
      case M2tsSegmentationStyle.maintainCadence:
        return 'MAINTAIN_CADENCE';
      case M2tsSegmentationStyle.resetCadence:
        return 'RESET_CADENCE';
    }
  }
}

extension on String {
  M2tsSegmentationStyle toM2tsSegmentationStyle() {
    switch (this) {
      case 'MAINTAIN_CADENCE':
        return M2tsSegmentationStyle.maintainCadence;
      case 'RESET_CADENCE':
        return M2tsSegmentationStyle.resetCadence;
    }
    throw Exception('$this is not known in enum M2tsSegmentationStyle');
  }
}

/// M2ts Settings
class M2tsSettings {
  /// When set to drop, output audio streams will be removed from the program if
  /// the selected input audio stream is removed from the input. This allows the
  /// output audio configuration to dynamically change based on input
  /// configuration. If this is set to encodeSilence, all output audio streams
  /// will output encoded silence when not connected to an active input stream.
  final M2tsAbsentInputAudioBehavior? absentInputAudioBehavior;

  /// When set to enabled, uses ARIB-compliant field muxing and removes video
  /// descriptor.
  final M2tsArib? arib;

  /// Packet Identifier (PID) for ARIB Captions in the transport stream. Can be
  /// entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String? aribCaptionsPid;

  /// If set to auto, pid number used for ARIB Captions will be auto-selected from
  /// unused pids.  If set to useConfigured, ARIB Captions will be on the
  /// configured pid number.
  final M2tsAribCaptionsPidControl? aribCaptionsPidControl;

  /// When set to dvb, uses DVB buffer model for Dolby Digital audio.  When set to
  /// atsc, the ATSC model is used.
  final M2tsAudioBufferModel? audioBufferModel;

  /// The number of audio frames to insert for each PES packet.
  final int? audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or by
  /// comma separation. Can be entered as decimal or hexadecimal values. Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String? audioPids;

  /// When set to atsc, uses stream type = 0x81 for AC3 and stream type = 0x87 for
  /// EAC3. When set to dvb, uses stream type = 0x06.
  final M2tsAudioStreamType? audioStreamType;

  /// The output bitrate of the transport stream in bits per second. Setting to 0
  /// lets the muxer automatically determine the appropriate bitrate.
  final int? bitrate;

  /// Controls the timing accuracy for output network traffic. Leave as MULTIPLEX
  /// to ensure accurate network packet timing. Or set to NONE, which might result
  /// in lower latency but will result in more variability in output network
  /// packet timing. This variability might cause interruptions, jitter, or bursty
  /// behavior in your playback or receiving devices.
  final M2tsBufferModel? bufferModel;

  /// When set to enabled, generates captionServiceDescriptor in PMT.
  final M2tsCcDescriptor? ccDescriptor;

  /// Inserts DVB Network Information Table (NIT) at the specified table
  /// repetition interval.
  final DvbNitSettings? dvbNitSettings;

  /// Inserts DVB Service Description Table (SDT) at the specified table
  /// repetition interval.
  final DvbSdtSettings? dvbSdtSettings;

  /// Packet Identifier (PID) for input source DVB Subtitle data to this output.
  /// Multiple values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values.  Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String? dvbSubPids;

  /// Inserts DVB Time and Date Table (TDT) at the specified table repetition
  /// interval.
  final DvbTdtSettings? dvbTdtSettings;

  /// Packet Identifier (PID) for input source DVB Teletext data to this output.
  /// Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String? dvbTeletextPid;

  /// If set to passthrough, passes any EBIF data from the input source to this
  /// output.
  final M2tsEbifControl? ebif;

  /// When videoAndFixedIntervals is selected, audio EBP markers will be added to
  /// partitions 3 and 4. The interval between these additional markers will be
  /// fixed, and will be slightly shorter than the video EBP marker interval. Only
  /// available when EBP Cablelabs segmentation markers are selected.  Partitions
  /// 1 and 2 will always follow the video interval.
  final M2tsAudioInterval? ebpAudioInterval;

  /// When set, enforces that Encoder Boundary Points do not come within the
  /// specified time interval of each other by looking ahead at input video. If
  /// another EBP is going to come in within the specified time interval, the
  /// current EBP is not emitted, and the segment is "stretched" to the next
  /// marker.  The lookahead value does not add latency to the system. The Live
  /// Event must be configured elsewhere to create sufficient latency to make the
  /// lookahead accurate.
  final int? ebpLookaheadMs;

  /// Controls placement of EBP on Audio PIDs. If set to videoAndAudioPids, EBP
  /// markers will be placed on the video PID and all audio PIDs.  If set to
  /// videoPid, EBP markers will be placed on only the video PID.
  final M2tsEbpPlacement? ebpPlacement;

  /// This field is unused and deprecated.
  final String? ecmPid;

  /// Include or exclude the ES Rate field in the PES header.
  final M2tsEsRateInPes? esRateInPes;

  /// Packet Identifier (PID) for input source ETV Platform data to this output.
  /// Can be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String? etvPlatformPid;

  /// Packet Identifier (PID) for input source ETV Signal data to this output. Can
  /// be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String? etvSignalPid;

  /// The length in seconds of each fragment. Only used with EBP markers.
  final double? fragmentTime;

  /// If set to passthrough, passes any KLV data from the input source to this
  /// output.
  final M2tsKlv? klv;

  /// Packet Identifier (PID) for input source KLV data to this output. Multiple
  /// values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values.  Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String? klvDataPids;

  /// If set to passthrough, Nielsen inaudible tones for media tracking will be
  /// detected in the input audio and an equivalent ID3 tag will be inserted in
  /// the output.
  final M2tsNielsenId3Behavior? nielsenId3Behavior;

  /// Value in bits per second of extra null packets to insert into the transport
  /// stream. This can be used if a downstream encryption system requires periodic
  /// null packets.
  final double? nullPacketBitrate;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream.  Valid values are 0, 10..1000.
  final int? patInterval;

  /// When set to pcrEveryPesPacket, a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  final M2tsPcrControl? pcrControl;

  /// Maximum time in milliseconds between Program Clock Reference (PCRs) inserted
  /// into the transport stream.
  final int? pcrPeriod;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID. Can be entered as a decimal or hexadecimal value.
  /// Valid values are 32 (or 0x20)..8182 (or 0x1ff6).
  final String? pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. Valid values are 0, 10..1000.
  final int? pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream. Can be entered as a decimal or hexadecimal value. Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String? pmtPid;

  /// The value of the program number field in the Program Map Table.
  final int? programNum;

  /// When vbr, does not insert null packets into transport stream to fill
  /// specified bitrate. The bitrate setting acts as the maximum bitrate when vbr
  /// is set.
  final M2tsRateMode? rateMode;

  /// Packet Identifier (PID) for input source SCTE-27 data to this output.
  /// Multiple values are accepted, and can be entered in ranges and/or by comma
  /// separation. Can be entered as decimal or hexadecimal values.  Each PID
  /// specified must be in the range of 32 (or 0x20)..8182 (or 0x1ff6).
  final String? scte27Pids;

  /// Optionally pass SCTE-35 signals from the input source to this output.
  final M2tsScte35Control? scte35Control;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can
  /// be entered as a decimal or hexadecimal value.  Valid values are 32 (or
  /// 0x20)..8182 (or 0x1ff6).
  final String? scte35Pid;

  /// Inserts segmentation markers at each segmentationTime period. raiSegstart
  /// sets the Random Access Indicator bit in the adaptation field. raiAdapt sets
  /// the RAI bit and adds the current timecode in the private data bytes.
  /// psiSegstart inserts PAT and PMT tables at the start of segments. ebp adds
  /// Encoder Boundary Point information to the adaptation field as per OpenCable
  /// specification OC-SP-EBP-I01-130118. ebpLegacy adds Encoder Boundary Point
  /// information to the adaptation field using a legacy proprietary format.
  final M2tsSegmentationMarkers? segmentationMarkers;

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
  final M2tsSegmentationStyle? segmentationStyle;

  /// The length in seconds of each segment. Required unless markers is set to
  /// _none_.
  final double? segmentationTime;

  /// When set to passthrough, timed metadata will be passed through from input to
  /// output.
  final M2tsTimedMetadataBehavior? timedMetadataBehavior;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.  Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String? timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  final int? transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.  Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String? videoPid;

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

  factory M2tsSettings.fromJson(Map<String, dynamic> json) {
    return M2tsSettings(
      absentInputAudioBehavior: (json['absentInputAudioBehavior'] as String?)
          ?.toM2tsAbsentInputAudioBehavior(),
      arib: (json['arib'] as String?)?.toM2tsArib(),
      aribCaptionsPid: json['aribCaptionsPid'] as String?,
      aribCaptionsPidControl: (json['aribCaptionsPidControl'] as String?)
          ?.toM2tsAribCaptionsPidControl(),
      audioBufferModel:
          (json['audioBufferModel'] as String?)?.toM2tsAudioBufferModel(),
      audioFramesPerPes: json['audioFramesPerPes'] as int?,
      audioPids: json['audioPids'] as String?,
      audioStreamType:
          (json['audioStreamType'] as String?)?.toM2tsAudioStreamType(),
      bitrate: json['bitrate'] as int?,
      bufferModel: (json['bufferModel'] as String?)?.toM2tsBufferModel(),
      ccDescriptor: (json['ccDescriptor'] as String?)?.toM2tsCcDescriptor(),
      dvbNitSettings: json['dvbNitSettings'] != null
          ? DvbNitSettings.fromJson(
              json['dvbNitSettings'] as Map<String, dynamic>)
          : null,
      dvbSdtSettings: json['dvbSdtSettings'] != null
          ? DvbSdtSettings.fromJson(
              json['dvbSdtSettings'] as Map<String, dynamic>)
          : null,
      dvbSubPids: json['dvbSubPids'] as String?,
      dvbTdtSettings: json['dvbTdtSettings'] != null
          ? DvbTdtSettings.fromJson(
              json['dvbTdtSettings'] as Map<String, dynamic>)
          : null,
      dvbTeletextPid: json['dvbTeletextPid'] as String?,
      ebif: (json['ebif'] as String?)?.toM2tsEbifControl(),
      ebpAudioInterval:
          (json['ebpAudioInterval'] as String?)?.toM2tsAudioInterval(),
      ebpLookaheadMs: json['ebpLookaheadMs'] as int?,
      ebpPlacement: (json['ebpPlacement'] as String?)?.toM2tsEbpPlacement(),
      ecmPid: json['ecmPid'] as String?,
      esRateInPes: (json['esRateInPes'] as String?)?.toM2tsEsRateInPes(),
      etvPlatformPid: json['etvPlatformPid'] as String?,
      etvSignalPid: json['etvSignalPid'] as String?,
      fragmentTime: json['fragmentTime'] as double?,
      klv: (json['klv'] as String?)?.toM2tsKlv(),
      klvDataPids: json['klvDataPids'] as String?,
      nielsenId3Behavior:
          (json['nielsenId3Behavior'] as String?)?.toM2tsNielsenId3Behavior(),
      nullPacketBitrate: json['nullPacketBitrate'] as double?,
      patInterval: json['patInterval'] as int?,
      pcrControl: (json['pcrControl'] as String?)?.toM2tsPcrControl(),
      pcrPeriod: json['pcrPeriod'] as int?,
      pcrPid: json['pcrPid'] as String?,
      pmtInterval: json['pmtInterval'] as int?,
      pmtPid: json['pmtPid'] as String?,
      programNum: json['programNum'] as int?,
      rateMode: (json['rateMode'] as String?)?.toM2tsRateMode(),
      scte27Pids: json['scte27Pids'] as String?,
      scte35Control: (json['scte35Control'] as String?)?.toM2tsScte35Control(),
      scte35Pid: json['scte35Pid'] as String?,
      segmentationMarkers:
          (json['segmentationMarkers'] as String?)?.toM2tsSegmentationMarkers(),
      segmentationStyle:
          (json['segmentationStyle'] as String?)?.toM2tsSegmentationStyle(),
      segmentationTime: json['segmentationTime'] as double?,
      timedMetadataBehavior: (json['timedMetadataBehavior'] as String?)
          ?.toM2tsTimedMetadataBehavior(),
      timedMetadataPid: json['timedMetadataPid'] as String?,
      transportStreamId: json['transportStreamId'] as int?,
      videoPid: json['videoPid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final absentInputAudioBehavior = this.absentInputAudioBehavior;
    final arib = this.arib;
    final aribCaptionsPid = this.aribCaptionsPid;
    final aribCaptionsPidControl = this.aribCaptionsPidControl;
    final audioBufferModel = this.audioBufferModel;
    final audioFramesPerPes = this.audioFramesPerPes;
    final audioPids = this.audioPids;
    final audioStreamType = this.audioStreamType;
    final bitrate = this.bitrate;
    final bufferModel = this.bufferModel;
    final ccDescriptor = this.ccDescriptor;
    final dvbNitSettings = this.dvbNitSettings;
    final dvbSdtSettings = this.dvbSdtSettings;
    final dvbSubPids = this.dvbSubPids;
    final dvbTdtSettings = this.dvbTdtSettings;
    final dvbTeletextPid = this.dvbTeletextPid;
    final ebif = this.ebif;
    final ebpAudioInterval = this.ebpAudioInterval;
    final ebpLookaheadMs = this.ebpLookaheadMs;
    final ebpPlacement = this.ebpPlacement;
    final ecmPid = this.ecmPid;
    final esRateInPes = this.esRateInPes;
    final etvPlatformPid = this.etvPlatformPid;
    final etvSignalPid = this.etvSignalPid;
    final fragmentTime = this.fragmentTime;
    final klv = this.klv;
    final klvDataPids = this.klvDataPids;
    final nielsenId3Behavior = this.nielsenId3Behavior;
    final nullPacketBitrate = this.nullPacketBitrate;
    final patInterval = this.patInterval;
    final pcrControl = this.pcrControl;
    final pcrPeriod = this.pcrPeriod;
    final pcrPid = this.pcrPid;
    final pmtInterval = this.pmtInterval;
    final pmtPid = this.pmtPid;
    final programNum = this.programNum;
    final rateMode = this.rateMode;
    final scte27Pids = this.scte27Pids;
    final scte35Control = this.scte35Control;
    final scte35Pid = this.scte35Pid;
    final segmentationMarkers = this.segmentationMarkers;
    final segmentationStyle = this.segmentationStyle;
    final segmentationTime = this.segmentationTime;
    final timedMetadataBehavior = this.timedMetadataBehavior;
    final timedMetadataPid = this.timedMetadataPid;
    final transportStreamId = this.transportStreamId;
    final videoPid = this.videoPid;
    return {
      if (absentInputAudioBehavior != null)
        'absentInputAudioBehavior': absentInputAudioBehavior.toValue(),
      if (arib != null) 'arib': arib.toValue(),
      if (aribCaptionsPid != null) 'aribCaptionsPid': aribCaptionsPid,
      if (aribCaptionsPidControl != null)
        'aribCaptionsPidControl': aribCaptionsPidControl.toValue(),
      if (audioBufferModel != null)
        'audioBufferModel': audioBufferModel.toValue(),
      if (audioFramesPerPes != null) 'audioFramesPerPes': audioFramesPerPes,
      if (audioPids != null) 'audioPids': audioPids,
      if (audioStreamType != null) 'audioStreamType': audioStreamType.toValue(),
      if (bitrate != null) 'bitrate': bitrate,
      if (bufferModel != null) 'bufferModel': bufferModel.toValue(),
      if (ccDescriptor != null) 'ccDescriptor': ccDescriptor.toValue(),
      if (dvbNitSettings != null) 'dvbNitSettings': dvbNitSettings,
      if (dvbSdtSettings != null) 'dvbSdtSettings': dvbSdtSettings,
      if (dvbSubPids != null) 'dvbSubPids': dvbSubPids,
      if (dvbTdtSettings != null) 'dvbTdtSettings': dvbTdtSettings,
      if (dvbTeletextPid != null) 'dvbTeletextPid': dvbTeletextPid,
      if (ebif != null) 'ebif': ebif.toValue(),
      if (ebpAudioInterval != null)
        'ebpAudioInterval': ebpAudioInterval.toValue(),
      if (ebpLookaheadMs != null) 'ebpLookaheadMs': ebpLookaheadMs,
      if (ebpPlacement != null) 'ebpPlacement': ebpPlacement.toValue(),
      if (ecmPid != null) 'ecmPid': ecmPid,
      if (esRateInPes != null) 'esRateInPes': esRateInPes.toValue(),
      if (etvPlatformPid != null) 'etvPlatformPid': etvPlatformPid,
      if (etvSignalPid != null) 'etvSignalPid': etvSignalPid,
      if (fragmentTime != null) 'fragmentTime': fragmentTime,
      if (klv != null) 'klv': klv.toValue(),
      if (klvDataPids != null) 'klvDataPids': klvDataPids,
      if (nielsenId3Behavior != null)
        'nielsenId3Behavior': nielsenId3Behavior.toValue(),
      if (nullPacketBitrate != null) 'nullPacketBitrate': nullPacketBitrate,
      if (patInterval != null) 'patInterval': patInterval,
      if (pcrControl != null) 'pcrControl': pcrControl.toValue(),
      if (pcrPeriod != null) 'pcrPeriod': pcrPeriod,
      if (pcrPid != null) 'pcrPid': pcrPid,
      if (pmtInterval != null) 'pmtInterval': pmtInterval,
      if (pmtPid != null) 'pmtPid': pmtPid,
      if (programNum != null) 'programNum': programNum,
      if (rateMode != null) 'rateMode': rateMode.toValue(),
      if (scte27Pids != null) 'scte27Pids': scte27Pids,
      if (scte35Control != null) 'scte35Control': scte35Control.toValue(),
      if (scte35Pid != null) 'scte35Pid': scte35Pid,
      if (segmentationMarkers != null)
        'segmentationMarkers': segmentationMarkers.toValue(),
      if (segmentationStyle != null)
        'segmentationStyle': segmentationStyle.toValue(),
      if (segmentationTime != null) 'segmentationTime': segmentationTime,
      if (timedMetadataBehavior != null)
        'timedMetadataBehavior': timedMetadataBehavior.toValue(),
      if (timedMetadataPid != null) 'timedMetadataPid': timedMetadataPid,
      if (transportStreamId != null) 'transportStreamId': transportStreamId,
      if (videoPid != null) 'videoPid': videoPid,
    };
  }
}

/// M2ts Timed Metadata Behavior
enum M2tsTimedMetadataBehavior {
  noPassthrough,
  passthrough,
}

extension on M2tsTimedMetadataBehavior {
  String toValue() {
    switch (this) {
      case M2tsTimedMetadataBehavior.noPassthrough:
        return 'NO_PASSTHROUGH';
      case M2tsTimedMetadataBehavior.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M2tsTimedMetadataBehavior toM2tsTimedMetadataBehavior() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return M2tsTimedMetadataBehavior.noPassthrough;
      case 'PASSTHROUGH':
        return M2tsTimedMetadataBehavior.passthrough;
    }
    throw Exception('$this is not known in enum M2tsTimedMetadataBehavior');
  }
}

/// M3u8 Nielsen Id3 Behavior
enum M3u8NielsenId3Behavior {
  noPassthrough,
  passthrough,
}

extension on M3u8NielsenId3Behavior {
  String toValue() {
    switch (this) {
      case M3u8NielsenId3Behavior.noPassthrough:
        return 'NO_PASSTHROUGH';
      case M3u8NielsenId3Behavior.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M3u8NielsenId3Behavior toM3u8NielsenId3Behavior() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return M3u8NielsenId3Behavior.noPassthrough;
      case 'PASSTHROUGH':
        return M3u8NielsenId3Behavior.passthrough;
    }
    throw Exception('$this is not known in enum M3u8NielsenId3Behavior');
  }
}

/// M3u8 Pcr Control
enum M3u8PcrControl {
  configuredPcrPeriod,
  pcrEveryPesPacket,
}

extension on M3u8PcrControl {
  String toValue() {
    switch (this) {
      case M3u8PcrControl.configuredPcrPeriod:
        return 'CONFIGURED_PCR_PERIOD';
      case M3u8PcrControl.pcrEveryPesPacket:
        return 'PCR_EVERY_PES_PACKET';
    }
  }
}

extension on String {
  M3u8PcrControl toM3u8PcrControl() {
    switch (this) {
      case 'CONFIGURED_PCR_PERIOD':
        return M3u8PcrControl.configuredPcrPeriod;
      case 'PCR_EVERY_PES_PACKET':
        return M3u8PcrControl.pcrEveryPesPacket;
    }
    throw Exception('$this is not known in enum M3u8PcrControl');
  }
}

/// M3u8 Scte35 Behavior
enum M3u8Scte35Behavior {
  noPassthrough,
  passthrough,
}

extension on M3u8Scte35Behavior {
  String toValue() {
    switch (this) {
      case M3u8Scte35Behavior.noPassthrough:
        return 'NO_PASSTHROUGH';
      case M3u8Scte35Behavior.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M3u8Scte35Behavior toM3u8Scte35Behavior() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return M3u8Scte35Behavior.noPassthrough;
      case 'PASSTHROUGH':
        return M3u8Scte35Behavior.passthrough;
    }
    throw Exception('$this is not known in enum M3u8Scte35Behavior');
  }
}

/// Settings information for the .m3u8 container
class M3u8Settings {
  /// The number of audio frames to insert for each PES packet.
  final int? audioFramesPerPes;

  /// Packet Identifier (PID) of the elementary audio stream(s) in the transport
  /// stream. Multiple values are accepted, and can be entered in ranges and/or by
  /// comma separation. Can be entered as decimal or hexadecimal values.
  final String? audioPids;

  /// This parameter is unused and deprecated.
  final String? ecmPid;

  /// If set to passthrough, Nielsen inaudible tones for media tracking will be
  /// detected in the input audio and an equivalent ID3 tag will be inserted in
  /// the output.
  final M3u8NielsenId3Behavior? nielsenId3Behavior;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. A value of \"0\" writes out the PMT once per segment file.
  final int? patInterval;

  /// When set to pcrEveryPesPacket, a Program Clock Reference value is inserted
  /// for every Packetized Elementary Stream (PES) header. This parameter is
  /// effective only when the PCR PID is the same as the video or audio elementary
  /// stream.
  final M3u8PcrControl? pcrControl;

  /// Maximum time in milliseconds between Program Clock References (PCRs)
  /// inserted into the transport stream.
  final int? pcrPeriod;

  /// Packet Identifier (PID) of the Program Clock Reference (PCR) in the
  /// transport stream. When no value is given, the encoder will assign the same
  /// value as the Video PID. Can be entered as a decimal or hexadecimal value.
  final String? pcrPid;

  /// The number of milliseconds between instances of this table in the output
  /// transport stream. A value of \"0\" writes out the PMT once per segment file.
  final int? pmtInterval;

  /// Packet Identifier (PID) for the Program Map Table (PMT) in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.
  final String? pmtPid;

  /// The value of the program number field in the Program Map Table.
  final int? programNum;

  /// If set to passthrough, passes any SCTE-35 signals from the input source to
  /// this output.
  final M3u8Scte35Behavior? scte35Behavior;

  /// Packet Identifier (PID) of the SCTE-35 stream in the transport stream. Can
  /// be entered as a decimal or hexadecimal value.
  final String? scte35Pid;

  /// When set to passthrough, timed metadata is passed through from input to
  /// output.
  final M3u8TimedMetadataBehavior? timedMetadataBehavior;

  /// Packet Identifier (PID) of the timed metadata stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.  Valid values are
  /// 32 (or 0x20)..8182 (or 0x1ff6).
  final String? timedMetadataPid;

  /// The value of the transport stream ID field in the Program Map Table.
  final int? transportStreamId;

  /// Packet Identifier (PID) of the elementary video stream in the transport
  /// stream. Can be entered as a decimal or hexadecimal value.
  final String? videoPid;

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

  factory M3u8Settings.fromJson(Map<String, dynamic> json) {
    return M3u8Settings(
      audioFramesPerPes: json['audioFramesPerPes'] as int?,
      audioPids: json['audioPids'] as String?,
      ecmPid: json['ecmPid'] as String?,
      nielsenId3Behavior:
          (json['nielsenId3Behavior'] as String?)?.toM3u8NielsenId3Behavior(),
      patInterval: json['patInterval'] as int?,
      pcrControl: (json['pcrControl'] as String?)?.toM3u8PcrControl(),
      pcrPeriod: json['pcrPeriod'] as int?,
      pcrPid: json['pcrPid'] as String?,
      pmtInterval: json['pmtInterval'] as int?,
      pmtPid: json['pmtPid'] as String?,
      programNum: json['programNum'] as int?,
      scte35Behavior:
          (json['scte35Behavior'] as String?)?.toM3u8Scte35Behavior(),
      scte35Pid: json['scte35Pid'] as String?,
      timedMetadataBehavior: (json['timedMetadataBehavior'] as String?)
          ?.toM3u8TimedMetadataBehavior(),
      timedMetadataPid: json['timedMetadataPid'] as String?,
      transportStreamId: json['transportStreamId'] as int?,
      videoPid: json['videoPid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioFramesPerPes = this.audioFramesPerPes;
    final audioPids = this.audioPids;
    final ecmPid = this.ecmPid;
    final nielsenId3Behavior = this.nielsenId3Behavior;
    final patInterval = this.patInterval;
    final pcrControl = this.pcrControl;
    final pcrPeriod = this.pcrPeriod;
    final pcrPid = this.pcrPid;
    final pmtInterval = this.pmtInterval;
    final pmtPid = this.pmtPid;
    final programNum = this.programNum;
    final scte35Behavior = this.scte35Behavior;
    final scte35Pid = this.scte35Pid;
    final timedMetadataBehavior = this.timedMetadataBehavior;
    final timedMetadataPid = this.timedMetadataPid;
    final transportStreamId = this.transportStreamId;
    final videoPid = this.videoPid;
    return {
      if (audioFramesPerPes != null) 'audioFramesPerPes': audioFramesPerPes,
      if (audioPids != null) 'audioPids': audioPids,
      if (ecmPid != null) 'ecmPid': ecmPid,
      if (nielsenId3Behavior != null)
        'nielsenId3Behavior': nielsenId3Behavior.toValue(),
      if (patInterval != null) 'patInterval': patInterval,
      if (pcrControl != null) 'pcrControl': pcrControl.toValue(),
      if (pcrPeriod != null) 'pcrPeriod': pcrPeriod,
      if (pcrPid != null) 'pcrPid': pcrPid,
      if (pmtInterval != null) 'pmtInterval': pmtInterval,
      if (pmtPid != null) 'pmtPid': pmtPid,
      if (programNum != null) 'programNum': programNum,
      if (scte35Behavior != null) 'scte35Behavior': scte35Behavior.toValue(),
      if (scte35Pid != null) 'scte35Pid': scte35Pid,
      if (timedMetadataBehavior != null)
        'timedMetadataBehavior': timedMetadataBehavior.toValue(),
      if (timedMetadataPid != null) 'timedMetadataPid': timedMetadataPid,
      if (transportStreamId != null) 'transportStreamId': transportStreamId,
      if (videoPid != null) 'videoPid': videoPid,
    };
  }
}

/// M3u8 Timed Metadata Behavior
enum M3u8TimedMetadataBehavior {
  noPassthrough,
  passthrough,
}

extension on M3u8TimedMetadataBehavior {
  String toValue() {
    switch (this) {
      case M3u8TimedMetadataBehavior.noPassthrough:
        return 'NO_PASSTHROUGH';
      case M3u8TimedMetadataBehavior.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  M3u8TimedMetadataBehavior toM3u8TimedMetadataBehavior() {
    switch (this) {
      case 'NO_PASSTHROUGH':
        return M3u8TimedMetadataBehavior.noPassthrough;
      case 'PASSTHROUGH':
        return M3u8TimedMetadataBehavior.passthrough;
    }
    throw Exception('$this is not known in enum M3u8TimedMetadataBehavior');
  }
}

/// The settings for a MediaConnect Flow.
class MediaConnectFlow {
  /// The unique ARN of the MediaConnect Flow being used as a source.
  final String? flowArn;

  MediaConnectFlow({
    this.flowArn,
  });

  factory MediaConnectFlow.fromJson(Map<String, dynamic> json) {
    return MediaConnectFlow(
      flowArn: json['flowArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    return {
      if (flowArn != null) 'flowArn': flowArn,
    };
  }
}

/// The settings for a MediaConnect Flow.
class MediaConnectFlowRequest {
  /// The ARN of the MediaConnect Flow that you want to use as a source.
  final String? flowArn;

  MediaConnectFlowRequest({
    this.flowArn,
  });

  factory MediaConnectFlowRequest.fromJson(Map<String, dynamic> json) {
    return MediaConnectFlowRequest(
      flowArn: json['flowArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowArn = this.flowArn;
    return {
      if (flowArn != null) 'flowArn': flowArn,
    };
  }
}

/// Media Package Group Settings
class MediaPackageGroupSettings {
  /// MediaPackage channel destination.
  final OutputLocationRef destination;

  MediaPackageGroupSettings({
    required this.destination,
  });

  factory MediaPackageGroupSettings.fromJson(Map<String, dynamic> json) {
    return MediaPackageGroupSettings(
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      'destination': destination,
    };
  }
}

/// MediaPackage Output Destination Settings
class MediaPackageOutputDestinationSettings {
  /// ID of the channel in MediaPackage that is the destination for this output
  /// group. You do not need to specify the individual inputs in MediaPackage;
  /// MediaLive will handle the connection of the two MediaLive pipelines to the
  /// two MediaPackage inputs. The MediaPackage channel and MediaLive channel must
  /// be in the same region.
  final String? channelId;

  MediaPackageOutputDestinationSettings({
    this.channelId,
  });

  factory MediaPackageOutputDestinationSettings.fromJson(
      Map<String, dynamic> json) {
    return MediaPackageOutputDestinationSettings(
      channelId: json['channelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    return {
      if (channelId != null) 'channelId': channelId,
    };
  }
}

/// Media Package Output Settings
class MediaPackageOutputSettings {
  MediaPackageOutputSettings();

  factory MediaPackageOutputSettings.fromJson(Map<String, dynamic> _) {
    return MediaPackageOutputSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Settings to specify the rendering of motion graphics into the video stream.
class MotionGraphicsActivateScheduleActionSettings {
  /// Duration (in milliseconds) that motion graphics should render on to the
  /// video stream. Leaving out this property or setting to 0 will result in
  /// rendering continuing until a deactivate action is processed.
  final int? duration;

  /// Key used to extract the password from EC2 Parameter store
  final String? passwordParam;

  /// URI of the HTML5 content to be rendered into the live stream.
  final String? url;

  /// Documentation update needed
  final String? username;

  MotionGraphicsActivateScheduleActionSettings({
    this.duration,
    this.passwordParam,
    this.url,
    this.username,
  });

  factory MotionGraphicsActivateScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return MotionGraphicsActivateScheduleActionSettings(
      duration: json['duration'] as int?,
      passwordParam: json['passwordParam'] as String?,
      url: json['url'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final passwordParam = this.passwordParam;
    final url = this.url;
    final username = this.username;
    return {
      if (duration != null) 'duration': duration,
      if (passwordParam != null) 'passwordParam': passwordParam,
      if (url != null) 'url': url,
      if (username != null) 'username': username,
    };
  }
}

/// Motion Graphics Configuration
class MotionGraphicsConfiguration {
  /// Motion Graphics Settings
  final MotionGraphicsSettings motionGraphicsSettings;
  final MotionGraphicsInsertion? motionGraphicsInsertion;

  MotionGraphicsConfiguration({
    required this.motionGraphicsSettings,
    this.motionGraphicsInsertion,
  });

  factory MotionGraphicsConfiguration.fromJson(Map<String, dynamic> json) {
    return MotionGraphicsConfiguration(
      motionGraphicsSettings: MotionGraphicsSettings.fromJson(
          json['motionGraphicsSettings'] as Map<String, dynamic>),
      motionGraphicsInsertion: (json['motionGraphicsInsertion'] as String?)
          ?.toMotionGraphicsInsertion(),
    );
  }

  Map<String, dynamic> toJson() {
    final motionGraphicsSettings = this.motionGraphicsSettings;
    final motionGraphicsInsertion = this.motionGraphicsInsertion;
    return {
      'motionGraphicsSettings': motionGraphicsSettings,
      if (motionGraphicsInsertion != null)
        'motionGraphicsInsertion': motionGraphicsInsertion.toValue(),
    };
  }
}

/// Settings to specify the ending of rendering motion graphics into the video
/// stream.
class MotionGraphicsDeactivateScheduleActionSettings {
  MotionGraphicsDeactivateScheduleActionSettings();

  factory MotionGraphicsDeactivateScheduleActionSettings.fromJson(
      Map<String, dynamic> _) {
    return MotionGraphicsDeactivateScheduleActionSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Motion Graphics Insertion
enum MotionGraphicsInsertion {
  disabled,
  enabled,
}

extension on MotionGraphicsInsertion {
  String toValue() {
    switch (this) {
      case MotionGraphicsInsertion.disabled:
        return 'DISABLED';
      case MotionGraphicsInsertion.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  MotionGraphicsInsertion toMotionGraphicsInsertion() {
    switch (this) {
      case 'DISABLED':
        return MotionGraphicsInsertion.disabled;
      case 'ENABLED':
        return MotionGraphicsInsertion.enabled;
    }
    throw Exception('$this is not known in enum MotionGraphicsInsertion');
  }
}

/// Motion Graphics Settings
class MotionGraphicsSettings {
  final HtmlMotionGraphicsSettings? htmlMotionGraphicsSettings;

  MotionGraphicsSettings({
    this.htmlMotionGraphicsSettings,
  });

  factory MotionGraphicsSettings.fromJson(Map<String, dynamic> json) {
    return MotionGraphicsSettings(
      htmlMotionGraphicsSettings: json['htmlMotionGraphicsSettings'] != null
          ? HtmlMotionGraphicsSettings.fromJson(
              json['htmlMotionGraphicsSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final htmlMotionGraphicsSettings = this.htmlMotionGraphicsSettings;
    return {
      if (htmlMotionGraphicsSettings != null)
        'htmlMotionGraphicsSettings': htmlMotionGraphicsSettings,
    };
  }
}

/// Mp2 Coding Mode
enum Mp2CodingMode {
  codingMode_1_0,
  codingMode_2_0,
}

extension on Mp2CodingMode {
  String toValue() {
    switch (this) {
      case Mp2CodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case Mp2CodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
    }
  }
}

extension on String {
  Mp2CodingMode toMp2CodingMode() {
    switch (this) {
      case 'CODING_MODE_1_0':
        return Mp2CodingMode.codingMode_1_0;
      case 'CODING_MODE_2_0':
        return Mp2CodingMode.codingMode_2_0;
    }
    throw Exception('$this is not known in enum Mp2CodingMode');
  }
}

/// Mp2 Settings
class Mp2Settings {
  /// Average bitrate in bits/second.
  final double? bitrate;

  /// The MPEG2 Audio coding mode.  Valid values are codingMode10 (for mono) or
  /// codingMode20 (for stereo).
  final Mp2CodingMode? codingMode;

  /// Sample rate in Hz.
  final double? sampleRate;

  Mp2Settings({
    this.bitrate,
    this.codingMode,
    this.sampleRate,
  });

  factory Mp2Settings.fromJson(Map<String, dynamic> json) {
    return Mp2Settings(
      bitrate: json['bitrate'] as double?,
      codingMode: (json['codingMode'] as String?)?.toMp2CodingMode(),
      sampleRate: json['sampleRate'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final codingMode = this.codingMode;
    final sampleRate = this.sampleRate;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
    };
  }
}

/// Mpeg2 Adaptive Quantization
enum Mpeg2AdaptiveQuantization {
  auto,
  high,
  low,
  medium,
  off,
}

extension on Mpeg2AdaptiveQuantization {
  String toValue() {
    switch (this) {
      case Mpeg2AdaptiveQuantization.auto:
        return 'AUTO';
      case Mpeg2AdaptiveQuantization.high:
        return 'HIGH';
      case Mpeg2AdaptiveQuantization.low:
        return 'LOW';
      case Mpeg2AdaptiveQuantization.medium:
        return 'MEDIUM';
      case Mpeg2AdaptiveQuantization.off:
        return 'OFF';
    }
  }
}

extension on String {
  Mpeg2AdaptiveQuantization toMpeg2AdaptiveQuantization() {
    switch (this) {
      case 'AUTO':
        return Mpeg2AdaptiveQuantization.auto;
      case 'HIGH':
        return Mpeg2AdaptiveQuantization.high;
      case 'LOW':
        return Mpeg2AdaptiveQuantization.low;
      case 'MEDIUM':
        return Mpeg2AdaptiveQuantization.medium;
      case 'OFF':
        return Mpeg2AdaptiveQuantization.off;
    }
    throw Exception('$this is not known in enum Mpeg2AdaptiveQuantization');
  }
}

/// Mpeg2 Color Metadata
enum Mpeg2ColorMetadata {
  ignore,
  insert,
}

extension on Mpeg2ColorMetadata {
  String toValue() {
    switch (this) {
      case Mpeg2ColorMetadata.ignore:
        return 'IGNORE';
      case Mpeg2ColorMetadata.insert:
        return 'INSERT';
    }
  }
}

extension on String {
  Mpeg2ColorMetadata toMpeg2ColorMetadata() {
    switch (this) {
      case 'IGNORE':
        return Mpeg2ColorMetadata.ignore;
      case 'INSERT':
        return Mpeg2ColorMetadata.insert;
    }
    throw Exception('$this is not known in enum Mpeg2ColorMetadata');
  }
}

/// Mpeg2 Color Space
enum Mpeg2ColorSpace {
  auto,
  passthrough,
}

extension on Mpeg2ColorSpace {
  String toValue() {
    switch (this) {
      case Mpeg2ColorSpace.auto:
        return 'AUTO';
      case Mpeg2ColorSpace.passthrough:
        return 'PASSTHROUGH';
    }
  }
}

extension on String {
  Mpeg2ColorSpace toMpeg2ColorSpace() {
    switch (this) {
      case 'AUTO':
        return Mpeg2ColorSpace.auto;
      case 'PASSTHROUGH':
        return Mpeg2ColorSpace.passthrough;
    }
    throw Exception('$this is not known in enum Mpeg2ColorSpace');
  }
}

/// Mpeg2 Display Ratio
enum Mpeg2DisplayRatio {
  displayratio16x9,
  displayratio4x3,
}

extension on Mpeg2DisplayRatio {
  String toValue() {
    switch (this) {
      case Mpeg2DisplayRatio.displayratio16x9:
        return 'DISPLAYRATIO16X9';
      case Mpeg2DisplayRatio.displayratio4x3:
        return 'DISPLAYRATIO4X3';
    }
  }
}

extension on String {
  Mpeg2DisplayRatio toMpeg2DisplayRatio() {
    switch (this) {
      case 'DISPLAYRATIO16X9':
        return Mpeg2DisplayRatio.displayratio16x9;
      case 'DISPLAYRATIO4X3':
        return Mpeg2DisplayRatio.displayratio4x3;
    }
    throw Exception('$this is not known in enum Mpeg2DisplayRatio');
  }
}

/// Mpeg2 Filter Settings
class Mpeg2FilterSettings {
  final TemporalFilterSettings? temporalFilterSettings;

  Mpeg2FilterSettings({
    this.temporalFilterSettings,
  });

  factory Mpeg2FilterSettings.fromJson(Map<String, dynamic> json) {
    return Mpeg2FilterSettings(
      temporalFilterSettings: json['temporalFilterSettings'] != null
          ? TemporalFilterSettings.fromJson(
              json['temporalFilterSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final temporalFilterSettings = this.temporalFilterSettings;
    return {
      if (temporalFilterSettings != null)
        'temporalFilterSettings': temporalFilterSettings,
    };
  }
}

/// Mpeg2 Gop Size Units
enum Mpeg2GopSizeUnits {
  frames,
  seconds,
}

extension on Mpeg2GopSizeUnits {
  String toValue() {
    switch (this) {
      case Mpeg2GopSizeUnits.frames:
        return 'FRAMES';
      case Mpeg2GopSizeUnits.seconds:
        return 'SECONDS';
    }
  }
}

extension on String {
  Mpeg2GopSizeUnits toMpeg2GopSizeUnits() {
    switch (this) {
      case 'FRAMES':
        return Mpeg2GopSizeUnits.frames;
      case 'SECONDS':
        return Mpeg2GopSizeUnits.seconds;
    }
    throw Exception('$this is not known in enum Mpeg2GopSizeUnits');
  }
}

/// Mpeg2 Scan Type
enum Mpeg2ScanType {
  interlaced,
  progressive,
}

extension on Mpeg2ScanType {
  String toValue() {
    switch (this) {
      case Mpeg2ScanType.interlaced:
        return 'INTERLACED';
      case Mpeg2ScanType.progressive:
        return 'PROGRESSIVE';
    }
  }
}

extension on String {
  Mpeg2ScanType toMpeg2ScanType() {
    switch (this) {
      case 'INTERLACED':
        return Mpeg2ScanType.interlaced;
      case 'PROGRESSIVE':
        return Mpeg2ScanType.progressive;
    }
    throw Exception('$this is not known in enum Mpeg2ScanType');
  }
}

/// Mpeg2 Settings
class Mpeg2Settings {
  /// description": "The framerate denominator. For example, 1001. The framerate
  /// is the numerator divided by the denominator. For example, 24000 / 1001 =
  /// 23.976 FPS.
  final int framerateDenominator;

  /// The framerate numerator. For example, 24000. The framerate is the numerator
  /// divided by the denominator. For example, 24000 / 1001 = 23.976 FPS.
  final int framerateNumerator;

  /// Choose Off to disable adaptive quantization. Or choose another value to
  /// enable the quantizer and set its strength. The strengths are: Auto, Off,
  /// Low, Medium, High. When you enable this field, MediaLive allows intra-frame
  /// quantizers to vary, which might improve visual quality.
  final Mpeg2AdaptiveQuantization? adaptiveQuantization;

  /// Indicates the AFD values that MediaLive will write into the video encode. If
  /// you do not know what AFD signaling is, or if your downstream system has not
  /// given you guidance, choose AUTO.
  /// AUTO: MediaLive will try to preserve the input AFD value (in cases where
  /// multiple AFD values are valid).
  /// FIXED: MediaLive will use the value you specify in fixedAFD.
  final AfdSignaling? afdSignaling;

  /// Specifies whether to include the color space metadata. The metadata
  /// describes the color space that applies to the video (the colorSpace field).
  /// We recommend that you insert the metadata.
  final Mpeg2ColorMetadata? colorMetadata;

  /// Choose the type of color space conversion to apply to the output. For
  /// detailed information on setting up both the input and the output to obtain
  /// the desired color space in the output, see the section on \"MediaLive
  /// Features - Video - color space\" in the MediaLive User Guide.
  /// PASSTHROUGH: Keep the color space of the input content - do not convert it.
  /// AUTO:Convert all content that is SD to rec 601, and convert all content that
  /// is HD to rec 709.
  final Mpeg2ColorSpace? colorSpace;

  /// Sets the pixel aspect ratio for the encode.
  final Mpeg2DisplayRatio? displayAspectRatio;

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
  final Mpeg2FilterSettings? filterSettings;

  /// Complete this field only when afdSignaling is set to FIXED. Enter the AFD
  /// value (4 bits) to write on all frames of the video encode.
  final FixedAfd? fixedAfd;

  /// MPEG2: default is open GOP.
  final int? gopClosedCadence;

  /// Relates to the GOP structure. The number of B-frames between reference
  /// frames. If you do not know what a B-frame is, use the default.
  final int? gopNumBFrames;

  /// Relates to the GOP structure. The GOP size (keyframe interval) in the units
  /// specified in gopSizeUnits. If you do not know what GOP is, use the default.
  /// If gopSizeUnits is frames, then the gopSize must be an integer and must be
  /// greater than or equal to 1.
  /// If gopSizeUnits is seconds, the gopSize must be greater than 0, but does not
  /// need to be an integer.
  final double? gopSize;

  /// Relates to the GOP structure. Specifies whether the gopSize is specified in
  /// frames or seconds. If you do not plan to change the default gopSize, leave
  /// the default. If you specify SECONDS, MediaLive will internally convert the
  /// gop size to a frame count.
  final Mpeg2GopSizeUnits? gopSizeUnits;

  /// Set the scan type of the output to PROGRESSIVE or INTERLACED (top field
  /// first).
  final Mpeg2ScanType? scanType;

  /// Relates to the GOP structure. If you do not know what GOP is, use the
  /// default.
  /// FIXED: Set the number of B-frames in each sub-GOP to the value in
  /// gopNumBFrames.
  /// DYNAMIC: Let MediaLive optimize the number of B-frames in each sub-GOP, to
  /// improve visual quality.
  final Mpeg2SubGopLength? subgopLength;

  /// Determines how MediaLive inserts timecodes in the output video. For detailed
  /// information about setting up the input and the output for a timecode, see
  /// the section on \"MediaLive Features - Timecode configuration\" in the
  /// MediaLive User Guide.
  /// DISABLED: do not include timecodes.
  /// GOP_TIMECODE: Include timecode metadata in the GOP header.
  final Mpeg2TimecodeInsertionBehavior? timecodeInsertion;

  Mpeg2Settings({
    required this.framerateDenominator,
    required this.framerateNumerator,
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

  factory Mpeg2Settings.fromJson(Map<String, dynamic> json) {
    return Mpeg2Settings(
      framerateDenominator: json['framerateDenominator'] as int,
      framerateNumerator: json['framerateNumerator'] as int,
      adaptiveQuantization: (json['adaptiveQuantization'] as String?)
          ?.toMpeg2AdaptiveQuantization(),
      afdSignaling: (json['afdSignaling'] as String?)?.toAfdSignaling(),
      colorMetadata: (json['colorMetadata'] as String?)?.toMpeg2ColorMetadata(),
      colorSpace: (json['colorSpace'] as String?)?.toMpeg2ColorSpace(),
      displayAspectRatio:
          (json['displayAspectRatio'] as String?)?.toMpeg2DisplayRatio(),
      filterSettings: json['filterSettings'] != null
          ? Mpeg2FilterSettings.fromJson(
              json['filterSettings'] as Map<String, dynamic>)
          : null,
      fixedAfd: (json['fixedAfd'] as String?)?.toFixedAfd(),
      gopClosedCadence: json['gopClosedCadence'] as int?,
      gopNumBFrames: json['gopNumBFrames'] as int?,
      gopSize: json['gopSize'] as double?,
      gopSizeUnits: (json['gopSizeUnits'] as String?)?.toMpeg2GopSizeUnits(),
      scanType: (json['scanType'] as String?)?.toMpeg2ScanType(),
      subgopLength: (json['subgopLength'] as String?)?.toMpeg2SubGopLength(),
      timecodeInsertion: (json['timecodeInsertion'] as String?)
          ?.toMpeg2TimecodeInsertionBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final framerateDenominator = this.framerateDenominator;
    final framerateNumerator = this.framerateNumerator;
    final adaptiveQuantization = this.adaptiveQuantization;
    final afdSignaling = this.afdSignaling;
    final colorMetadata = this.colorMetadata;
    final colorSpace = this.colorSpace;
    final displayAspectRatio = this.displayAspectRatio;
    final filterSettings = this.filterSettings;
    final fixedAfd = this.fixedAfd;
    final gopClosedCadence = this.gopClosedCadence;
    final gopNumBFrames = this.gopNumBFrames;
    final gopSize = this.gopSize;
    final gopSizeUnits = this.gopSizeUnits;
    final scanType = this.scanType;
    final subgopLength = this.subgopLength;
    final timecodeInsertion = this.timecodeInsertion;
    return {
      'framerateDenominator': framerateDenominator,
      'framerateNumerator': framerateNumerator,
      if (adaptiveQuantization != null)
        'adaptiveQuantization': adaptiveQuantization.toValue(),
      if (afdSignaling != null) 'afdSignaling': afdSignaling.toValue(),
      if (colorMetadata != null) 'colorMetadata': colorMetadata.toValue(),
      if (colorSpace != null) 'colorSpace': colorSpace.toValue(),
      if (displayAspectRatio != null)
        'displayAspectRatio': displayAspectRatio.toValue(),
      if (filterSettings != null) 'filterSettings': filterSettings,
      if (fixedAfd != null) 'fixedAfd': fixedAfd.toValue(),
      if (gopClosedCadence != null) 'gopClosedCadence': gopClosedCadence,
      if (gopNumBFrames != null) 'gopNumBFrames': gopNumBFrames,
      if (gopSize != null) 'gopSize': gopSize,
      if (gopSizeUnits != null) 'gopSizeUnits': gopSizeUnits.toValue(),
      if (scanType != null) 'scanType': scanType.toValue(),
      if (subgopLength != null) 'subgopLength': subgopLength.toValue(),
      if (timecodeInsertion != null)
        'timecodeInsertion': timecodeInsertion.toValue(),
    };
  }
}

/// Mpeg2 Sub Gop Length
enum Mpeg2SubGopLength {
  dynamic,
  fixed,
}

extension on Mpeg2SubGopLength {
  String toValue() {
    switch (this) {
      case Mpeg2SubGopLength.dynamic:
        return 'DYNAMIC';
      case Mpeg2SubGopLength.fixed:
        return 'FIXED';
    }
  }
}

extension on String {
  Mpeg2SubGopLength toMpeg2SubGopLength() {
    switch (this) {
      case 'DYNAMIC':
        return Mpeg2SubGopLength.dynamic;
      case 'FIXED':
        return Mpeg2SubGopLength.fixed;
    }
    throw Exception('$this is not known in enum Mpeg2SubGopLength');
  }
}

/// Mpeg2 Timecode Insertion Behavior
enum Mpeg2TimecodeInsertionBehavior {
  disabled,
  gopTimecode,
}

extension on Mpeg2TimecodeInsertionBehavior {
  String toValue() {
    switch (this) {
      case Mpeg2TimecodeInsertionBehavior.disabled:
        return 'DISABLED';
      case Mpeg2TimecodeInsertionBehavior.gopTimecode:
        return 'GOP_TIMECODE';
    }
  }
}

extension on String {
  Mpeg2TimecodeInsertionBehavior toMpeg2TimecodeInsertionBehavior() {
    switch (this) {
      case 'DISABLED':
        return Mpeg2TimecodeInsertionBehavior.disabled;
      case 'GOP_TIMECODE':
        return Mpeg2TimecodeInsertionBehavior.gopTimecode;
    }
    throw Exception(
        '$this is not known in enum Mpeg2TimecodeInsertionBehavior');
  }
}

/// Ms Smooth Group Settings
class MsSmoothGroupSettings {
  /// Smooth Streaming publish point on an IIS server. Elemental Live acts as a
  /// "Push" encoder to IIS.
  final OutputLocationRef destination;

  /// The ID to include in each message in the sparse track. Ignored if
  /// sparseTrackType is NONE.
  final String? acquisitionPointId;

  /// If set to passthrough for an audio-only MS Smooth output, the fragment
  /// absolute time will be set to the current timecode. This option does not
  /// write timecodes to the audio elementary stream.
  final SmoothGroupAudioOnlyTimecodeControl? audioOnlyTimecodeControl;

  /// If set to verifyAuthenticity, verify the https certificate chain to a
  /// trusted Certificate Authority (CA).  This will cause https outputs to
  /// self-signed certificates to fail.
  final SmoothGroupCertificateMode? certificateMode;

  /// Number of seconds to wait before retrying connection to the IIS server if
  /// the connection is lost. Content will be cached during this time and the
  /// cache will be be delivered to the IIS server once the connection is
  /// re-established.
  final int? connectionRetryInterval;

  /// MS Smooth event ID to be sent to the IIS server.
  ///
  /// Should only be specified if eventIdMode is set to useConfigured.
  final String? eventId;

  /// Specifies whether or not to send an event ID to the IIS server. If no event
  /// ID is sent and the same Live Event is used without changing the publishing
  /// point, clients might see cached video from the previous run.
  ///
  /// Options:
  /// - "useConfigured" - use the value provided in eventId
  /// - "useTimestamp" - generate and send an event ID based on the current
  /// timestamp
  /// - "noEventId" - do not send an event ID to the IIS server.
  final SmoothGroupEventIdMode? eventIdMode;

  /// When set to sendEos, send EOS signal to IIS server when stopping the event
  final SmoothGroupEventStopBehavior? eventStopBehavior;

  /// Size in seconds of file cache for streaming outputs.
  final int? filecacheDuration;

  /// Length of mp4 fragments to generate (in seconds). Fragment length must be
  /// compatible with GOP size and framerate.
  final int? fragmentLength;

  /// Parameter that control output group behavior on input loss.
  final InputLossActionForMsSmoothOut? inputLossAction;

  /// Number of retry attempts.
  final int? numRetries;

  /// Number of seconds before initiating a restart due to output failure, due to
  /// exhausting the numRetries on one segment, or exceeding filecacheDuration.
  final int? restartDelay;

  /// useInputSegmentation has been deprecated. The configured segment size is
  /// always used.
  final SmoothGroupSegmentationMode? segmentationMode;

  /// Number of milliseconds to delay the output from the second pipeline.
  final int? sendDelayMs;

  /// Identifies the type of data to place in the sparse track:
  /// - SCTE35: Insert SCTE-35 messages from the source content. With each
  /// message, insert an IDR frame to start a new segment.
  /// - SCTE35_WITHOUT_SEGMENTATION: Insert SCTE-35 messages from the source
  /// content. With each message, insert an IDR frame but don't start a new
  /// segment.
  /// - NONE: Don't generate a sparse track for any outputs in this output group.
  final SmoothGroupSparseTrackType? sparseTrackType;

  /// When set to send, send stream manifest so publishing point doesn't start
  /// until all streams start.
  final SmoothGroupStreamManifestBehavior? streamManifestBehavior;

  /// Timestamp offset for the event.  Only used if timestampOffsetMode is set to
  /// useConfiguredOffset.
  final String? timestampOffset;

  /// Type of timestamp date offset to use.
  /// - useEventStartDate: Use the date the event was started as the offset
  /// - useConfiguredOffset: Use an explicitly configured date as the offset
  final SmoothGroupTimestampOffsetMode? timestampOffsetMode;

  MsSmoothGroupSettings({
    required this.destination,
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

  factory MsSmoothGroupSettings.fromJson(Map<String, dynamic> json) {
    return MsSmoothGroupSettings(
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
      acquisitionPointId: json['acquisitionPointId'] as String?,
      audioOnlyTimecodeControl: (json['audioOnlyTimecodeControl'] as String?)
          ?.toSmoothGroupAudioOnlyTimecodeControl(),
      certificateMode:
          (json['certificateMode'] as String?)?.toSmoothGroupCertificateMode(),
      connectionRetryInterval: json['connectionRetryInterval'] as int?,
      eventId: json['eventId'] as String?,
      eventIdMode: (json['eventIdMode'] as String?)?.toSmoothGroupEventIdMode(),
      eventStopBehavior: (json['eventStopBehavior'] as String?)
          ?.toSmoothGroupEventStopBehavior(),
      filecacheDuration: json['filecacheDuration'] as int?,
      fragmentLength: json['fragmentLength'] as int?,
      inputLossAction: (json['inputLossAction'] as String?)
          ?.toInputLossActionForMsSmoothOut(),
      numRetries: json['numRetries'] as int?,
      restartDelay: json['restartDelay'] as int?,
      segmentationMode: (json['segmentationMode'] as String?)
          ?.toSmoothGroupSegmentationMode(),
      sendDelayMs: json['sendDelayMs'] as int?,
      sparseTrackType:
          (json['sparseTrackType'] as String?)?.toSmoothGroupSparseTrackType(),
      streamManifestBehavior: (json['streamManifestBehavior'] as String?)
          ?.toSmoothGroupStreamManifestBehavior(),
      timestampOffset: json['timestampOffset'] as String?,
      timestampOffsetMode: (json['timestampOffsetMode'] as String?)
          ?.toSmoothGroupTimestampOffsetMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final acquisitionPointId = this.acquisitionPointId;
    final audioOnlyTimecodeControl = this.audioOnlyTimecodeControl;
    final certificateMode = this.certificateMode;
    final connectionRetryInterval = this.connectionRetryInterval;
    final eventId = this.eventId;
    final eventIdMode = this.eventIdMode;
    final eventStopBehavior = this.eventStopBehavior;
    final filecacheDuration = this.filecacheDuration;
    final fragmentLength = this.fragmentLength;
    final inputLossAction = this.inputLossAction;
    final numRetries = this.numRetries;
    final restartDelay = this.restartDelay;
    final segmentationMode = this.segmentationMode;
    final sendDelayMs = this.sendDelayMs;
    final sparseTrackType = this.sparseTrackType;
    final streamManifestBehavior = this.streamManifestBehavior;
    final timestampOffset = this.timestampOffset;
    final timestampOffsetMode = this.timestampOffsetMode;
    return {
      'destination': destination,
      if (acquisitionPointId != null) 'acquisitionPointId': acquisitionPointId,
      if (audioOnlyTimecodeControl != null)
        'audioOnlyTimecodeControl': audioOnlyTimecodeControl.toValue(),
      if (certificateMode != null) 'certificateMode': certificateMode.toValue(),
      if (connectionRetryInterval != null)
        'connectionRetryInterval': connectionRetryInterval,
      if (eventId != null) 'eventId': eventId,
      if (eventIdMode != null) 'eventIdMode': eventIdMode.toValue(),
      if (eventStopBehavior != null)
        'eventStopBehavior': eventStopBehavior.toValue(),
      if (filecacheDuration != null) 'filecacheDuration': filecacheDuration,
      if (fragmentLength != null) 'fragmentLength': fragmentLength,
      if (inputLossAction != null) 'inputLossAction': inputLossAction.toValue(),
      if (numRetries != null) 'numRetries': numRetries,
      if (restartDelay != null) 'restartDelay': restartDelay,
      if (segmentationMode != null)
        'segmentationMode': segmentationMode.toValue(),
      if (sendDelayMs != null) 'sendDelayMs': sendDelayMs,
      if (sparseTrackType != null) 'sparseTrackType': sparseTrackType.toValue(),
      if (streamManifestBehavior != null)
        'streamManifestBehavior': streamManifestBehavior.toValue(),
      if (timestampOffset != null) 'timestampOffset': timestampOffset,
      if (timestampOffsetMode != null)
        'timestampOffsetMode': timestampOffsetMode.toValue(),
    };
  }
}

/// Ms Smooth H265 Packaging Type
enum MsSmoothH265PackagingType {
  hev1,
  hvc1,
}

extension on MsSmoothH265PackagingType {
  String toValue() {
    switch (this) {
      case MsSmoothH265PackagingType.hev1:
        return 'HEV1';
      case MsSmoothH265PackagingType.hvc1:
        return 'HVC1';
    }
  }
}

extension on String {
  MsSmoothH265PackagingType toMsSmoothH265PackagingType() {
    switch (this) {
      case 'HEV1':
        return MsSmoothH265PackagingType.hev1;
      case 'HVC1':
        return MsSmoothH265PackagingType.hvc1;
    }
    throw Exception('$this is not known in enum MsSmoothH265PackagingType');
  }
}

/// Ms Smooth Output Settings
class MsSmoothOutputSettings {
  /// Only applicable when this output is referencing an H.265 video description.
  /// Specifies whether MP4 segments should be packaged as HEV1 or HVC1.
  final MsSmoothH265PackagingType? h265PackagingType;

  /// String concatenated to the end of the destination filename.  Required for
  /// multiple outputs of the same type.
  final String? nameModifier;

  MsSmoothOutputSettings({
    this.h265PackagingType,
    this.nameModifier,
  });

  factory MsSmoothOutputSettings.fromJson(Map<String, dynamic> json) {
    return MsSmoothOutputSettings(
      h265PackagingType:
          (json['h265PackagingType'] as String?)?.toMsSmoothH265PackagingType(),
      nameModifier: json['nameModifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final h265PackagingType = this.h265PackagingType;
    final nameModifier = this.nameModifier;
    return {
      if (h265PackagingType != null)
        'h265PackagingType': h265PackagingType.toValue(),
      if (nameModifier != null) 'nameModifier': nameModifier,
    };
  }
}

/// The multiplex object.
class Multiplex {
  /// The unique arn of the multiplex.
  final String? arn;

  /// A list of availability zones for the multiplex.
  final List<String>? availabilityZones;

  /// A list of the multiplex output destinations.
  final List<MultiplexOutputDestination>? destinations;

  /// The unique id of the multiplex.
  final String? id;

  /// Configuration for a multiplex event.
  final MultiplexSettings? multiplexSettings;

  /// The name of the multiplex.
  final String? name;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The number of programs in the multiplex.
  final int? programCount;

  /// The current state of the multiplex.
  final MultiplexState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

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

  factory Multiplex.fromJson(Map<String, dynamic> json) {
    return Multiplex(
      arn: json['arn'] as String?,
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      multiplexSettings: json['multiplexSettings'] != null
          ? MultiplexSettings.fromJson(
              json['multiplexSettings'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      programCount: json['programCount'] as int?,
      state: (json['state'] as String?)?.toMultiplexState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZones = this.availabilityZones;
    final destinations = this.destinations;
    final id = this.id;
    final multiplexSettings = this.multiplexSettings;
    final name = this.name;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final programCount = this.programCount;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (destinations != null) 'destinations': destinations,
      if (id != null) 'id': id,
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (name != null) 'name': name,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (programCount != null) 'programCount': programCount,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Multiplex Group Settings
class MultiplexGroupSettings {
  MultiplexGroupSettings();

  factory MultiplexGroupSettings.fromJson(Map<String, dynamic> _) {
    return MultiplexGroupSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Multiplex MediaConnect output destination settings.
class MultiplexMediaConnectOutputDestinationSettings {
  /// The MediaConnect entitlement ARN available as a Flow source.
  final String? entitlementArn;

  MultiplexMediaConnectOutputDestinationSettings({
    this.entitlementArn,
  });

  factory MultiplexMediaConnectOutputDestinationSettings.fromJson(
      Map<String, dynamic> json) {
    return MultiplexMediaConnectOutputDestinationSettings(
      entitlementArn: json['entitlementArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlementArn = this.entitlementArn;
    return {
      if (entitlementArn != null) 'entitlementArn': entitlementArn,
    };
  }
}

/// Multiplex output destination settings
class MultiplexOutputDestination {
  /// Multiplex MediaConnect output destination settings.
  final MultiplexMediaConnectOutputDestinationSettings? mediaConnectSettings;

  MultiplexOutputDestination({
    this.mediaConnectSettings,
  });

  factory MultiplexOutputDestination.fromJson(Map<String, dynamic> json) {
    return MultiplexOutputDestination(
      mediaConnectSettings: json['mediaConnectSettings'] != null
          ? MultiplexMediaConnectOutputDestinationSettings.fromJson(
              json['mediaConnectSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaConnectSettings = this.mediaConnectSettings;
    return {
      if (mediaConnectSettings != null)
        'mediaConnectSettings': mediaConnectSettings,
    };
  }
}

/// Multiplex Output Settings
class MultiplexOutputSettings {
  /// Destination is a Multiplex.
  final OutputLocationRef destination;

  MultiplexOutputSettings({
    required this.destination,
  });

  factory MultiplexOutputSettings.fromJson(Map<String, dynamic> json) {
    return MultiplexOutputSettings(
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      'destination': destination,
    };
  }
}

/// The multiplex program object.
class MultiplexProgram {
  /// The MediaLive channel associated with the program.
  final String? channelId;

  /// The settings for this multiplex program.
  final MultiplexProgramSettings? multiplexProgramSettings;

  /// The packet identifier map for this multiplex program.
  final MultiplexProgramPacketIdentifiersMap? packetIdentifiersMap;

  /// Contains information about the current sources for the specified program in
  /// the specified multiplex. Keep in mind that each multiplex pipeline connects
  /// to both pipelines in a given source channel (the channel identified by the
  /// program). But only one of those channel pipelines is ever active at one
  /// time.
  final List<MultiplexProgramPipelineDetail>? pipelineDetails;

  /// The name of the multiplex program.
  final String? programName;

  MultiplexProgram({
    this.channelId,
    this.multiplexProgramSettings,
    this.packetIdentifiersMap,
    this.pipelineDetails,
    this.programName,
  });

  factory MultiplexProgram.fromJson(Map<String, dynamic> json) {
    return MultiplexProgram(
      channelId: json['channelId'] as String?,
      multiplexProgramSettings: json['multiplexProgramSettings'] != null
          ? MultiplexProgramSettings.fromJson(
              json['multiplexProgramSettings'] as Map<String, dynamic>)
          : null,
      packetIdentifiersMap: json['packetIdentifiersMap'] != null
          ? MultiplexProgramPacketIdentifiersMap.fromJson(
              json['packetIdentifiersMap'] as Map<String, dynamic>)
          : null,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => MultiplexProgramPipelineDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      programName: json['programName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final multiplexProgramSettings = this.multiplexProgramSettings;
    final packetIdentifiersMap = this.packetIdentifiersMap;
    final pipelineDetails = this.pipelineDetails;
    final programName = this.programName;
    return {
      if (channelId != null) 'channelId': channelId,
      if (multiplexProgramSettings != null)
        'multiplexProgramSettings': multiplexProgramSettings,
      if (packetIdentifiersMap != null)
        'packetIdentifiersMap': packetIdentifiersMap,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (programName != null) 'programName': programName,
    };
  }
}

/// Multiplex Program Input Destination Settings for outputting a Channel to a
/// Multiplex
class MultiplexProgramChannelDestinationSettings {
  /// The ID of the Multiplex that the encoder is providing output to. You do not
  /// need to specify the individual inputs to the Multiplex; MediaLive will
  /// handle the connection of the two MediaLive pipelines to the two Multiplex
  /// instances.
  /// The Multiplex must be in the same region as the Channel.
  final String? multiplexId;

  /// The program name of the Multiplex program that the encoder is providing
  /// output to.
  final String? programName;

  MultiplexProgramChannelDestinationSettings({
    this.multiplexId,
    this.programName,
  });

  factory MultiplexProgramChannelDestinationSettings.fromJson(
      Map<String, dynamic> json) {
    return MultiplexProgramChannelDestinationSettings(
      multiplexId: json['multiplexId'] as String?,
      programName: json['programName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final multiplexId = this.multiplexId;
    final programName = this.programName;
    return {
      if (multiplexId != null) 'multiplexId': multiplexId,
      if (programName != null) 'programName': programName,
    };
  }
}

/// Packet identifiers map for a given Multiplex program.
class MultiplexProgramPacketIdentifiersMap {
  final List<int>? audioPids;
  final List<int>? dvbSubPids;
  final int? dvbTeletextPid;
  final int? etvPlatformPid;
  final int? etvSignalPid;
  final List<int>? klvDataPids;
  final int? pcrPid;
  final int? pmtPid;
  final int? privateMetadataPid;
  final List<int>? scte27Pids;
  final int? scte35Pid;
  final int? timedMetadataPid;
  final int? videoPid;

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
      Map<String, dynamic> json) {
    return MultiplexProgramPacketIdentifiersMap(
      audioPids: (json['audioPids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      dvbSubPids: (json['dvbSubPids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      dvbTeletextPid: json['dvbTeletextPid'] as int?,
      etvPlatformPid: json['etvPlatformPid'] as int?,
      etvSignalPid: json['etvSignalPid'] as int?,
      klvDataPids: (json['klvDataPids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      pcrPid: json['pcrPid'] as int?,
      pmtPid: json['pmtPid'] as int?,
      privateMetadataPid: json['privateMetadataPid'] as int?,
      scte27Pids: (json['scte27Pids'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      scte35Pid: json['scte35Pid'] as int?,
      timedMetadataPid: json['timedMetadataPid'] as int?,
      videoPid: json['videoPid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioPids = this.audioPids;
    final dvbSubPids = this.dvbSubPids;
    final dvbTeletextPid = this.dvbTeletextPid;
    final etvPlatformPid = this.etvPlatformPid;
    final etvSignalPid = this.etvSignalPid;
    final klvDataPids = this.klvDataPids;
    final pcrPid = this.pcrPid;
    final pmtPid = this.pmtPid;
    final privateMetadataPid = this.privateMetadataPid;
    final scte27Pids = this.scte27Pids;
    final scte35Pid = this.scte35Pid;
    final timedMetadataPid = this.timedMetadataPid;
    final videoPid = this.videoPid;
    return {
      if (audioPids != null) 'audioPids': audioPids,
      if (dvbSubPids != null) 'dvbSubPids': dvbSubPids,
      if (dvbTeletextPid != null) 'dvbTeletextPid': dvbTeletextPid,
      if (etvPlatformPid != null) 'etvPlatformPid': etvPlatformPid,
      if (etvSignalPid != null) 'etvSignalPid': etvSignalPid,
      if (klvDataPids != null) 'klvDataPids': klvDataPids,
      if (pcrPid != null) 'pcrPid': pcrPid,
      if (pmtPid != null) 'pmtPid': pmtPid,
      if (privateMetadataPid != null) 'privateMetadataPid': privateMetadataPid,
      if (scte27Pids != null) 'scte27Pids': scte27Pids,
      if (scte35Pid != null) 'scte35Pid': scte35Pid,
      if (timedMetadataPid != null) 'timedMetadataPid': timedMetadataPid,
      if (videoPid != null) 'videoPid': videoPid,
    };
  }
}

/// The current source for one of the pipelines in the multiplex.
class MultiplexProgramPipelineDetail {
  /// Identifies the channel pipeline that is currently active for the pipeline
  /// (identified by PipelineId) in the multiplex.
  final String? activeChannelPipeline;

  /// Identifies a specific pipeline in the multiplex.
  final String? pipelineId;

  MultiplexProgramPipelineDetail({
    this.activeChannelPipeline,
    this.pipelineId,
  });

  factory MultiplexProgramPipelineDetail.fromJson(Map<String, dynamic> json) {
    return MultiplexProgramPipelineDetail(
      activeChannelPipeline: json['activeChannelPipeline'] as String?,
      pipelineId: json['pipelineId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeChannelPipeline = this.activeChannelPipeline;
    final pipelineId = this.pipelineId;
    return {
      if (activeChannelPipeline != null)
        'activeChannelPipeline': activeChannelPipeline,
      if (pipelineId != null) 'pipelineId': pipelineId,
    };
  }
}

/// Transport stream service descriptor configuration for the Multiplex program.
class MultiplexProgramServiceDescriptor {
  /// Name of the provider.
  final String providerName;

  /// Name of the service.
  final String serviceName;

  MultiplexProgramServiceDescriptor({
    required this.providerName,
    required this.serviceName,
  });

  factory MultiplexProgramServiceDescriptor.fromJson(
      Map<String, dynamic> json) {
    return MultiplexProgramServiceDescriptor(
      providerName: json['providerName'] as String,
      serviceName: json['serviceName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final providerName = this.providerName;
    final serviceName = this.serviceName;
    return {
      'providerName': providerName,
      'serviceName': serviceName,
    };
  }
}

/// Multiplex Program settings configuration.
class MultiplexProgramSettings {
  /// Unique program number.
  final int programNumber;

  /// Indicates which pipeline is preferred by the multiplex for program ingest.
  final PreferredChannelPipeline? preferredChannelPipeline;

  /// Transport stream service descriptor configuration for the Multiplex program.
  final MultiplexProgramServiceDescriptor? serviceDescriptor;

  /// Program video settings configuration.
  final MultiplexVideoSettings? videoSettings;

  MultiplexProgramSettings({
    required this.programNumber,
    this.preferredChannelPipeline,
    this.serviceDescriptor,
    this.videoSettings,
  });

  factory MultiplexProgramSettings.fromJson(Map<String, dynamic> json) {
    return MultiplexProgramSettings(
      programNumber: json['programNumber'] as int,
      preferredChannelPipeline: (json['preferredChannelPipeline'] as String?)
          ?.toPreferredChannelPipeline(),
      serviceDescriptor: json['serviceDescriptor'] != null
          ? MultiplexProgramServiceDescriptor.fromJson(
              json['serviceDescriptor'] as Map<String, dynamic>)
          : null,
      videoSettings: json['videoSettings'] != null
          ? MultiplexVideoSettings.fromJson(
              json['videoSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final programNumber = this.programNumber;
    final preferredChannelPipeline = this.preferredChannelPipeline;
    final serviceDescriptor = this.serviceDescriptor;
    final videoSettings = this.videoSettings;
    return {
      'programNumber': programNumber,
      if (preferredChannelPipeline != null)
        'preferredChannelPipeline': preferredChannelPipeline.toValue(),
      if (serviceDescriptor != null) 'serviceDescriptor': serviceDescriptor,
      if (videoSettings != null) 'videoSettings': videoSettings,
    };
  }
}

/// Placeholder documentation for MultiplexProgramSummary
class MultiplexProgramSummary {
  /// The MediaLive Channel associated with the program.
  final String? channelId;

  /// The name of the multiplex program.
  final String? programName;

  MultiplexProgramSummary({
    this.channelId,
    this.programName,
  });

  factory MultiplexProgramSummary.fromJson(Map<String, dynamic> json) {
    return MultiplexProgramSummary(
      channelId: json['channelId'] as String?,
      programName: json['programName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final programName = this.programName;
    return {
      if (channelId != null) 'channelId': channelId,
      if (programName != null) 'programName': programName,
    };
  }
}

/// Contains configuration for a Multiplex event
class MultiplexSettings {
  /// Transport stream bit rate.
  final int transportStreamBitrate;

  /// Transport stream ID.
  final int transportStreamId;

  /// Maximum video buffer delay in milliseconds.
  final int? maximumVideoBufferDelayMilliseconds;

  /// Transport stream reserved bit rate.
  final int? transportStreamReservedBitrate;

  MultiplexSettings({
    required this.transportStreamBitrate,
    required this.transportStreamId,
    this.maximumVideoBufferDelayMilliseconds,
    this.transportStreamReservedBitrate,
  });

  factory MultiplexSettings.fromJson(Map<String, dynamic> json) {
    return MultiplexSettings(
      transportStreamBitrate: json['transportStreamBitrate'] as int,
      transportStreamId: json['transportStreamId'] as int,
      maximumVideoBufferDelayMilliseconds:
          json['maximumVideoBufferDelayMilliseconds'] as int?,
      transportStreamReservedBitrate:
          json['transportStreamReservedBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final transportStreamBitrate = this.transportStreamBitrate;
    final transportStreamId = this.transportStreamId;
    final maximumVideoBufferDelayMilliseconds =
        this.maximumVideoBufferDelayMilliseconds;
    final transportStreamReservedBitrate = this.transportStreamReservedBitrate;
    return {
      'transportStreamBitrate': transportStreamBitrate,
      'transportStreamId': transportStreamId,
      if (maximumVideoBufferDelayMilliseconds != null)
        'maximumVideoBufferDelayMilliseconds':
            maximumVideoBufferDelayMilliseconds,
      if (transportStreamReservedBitrate != null)
        'transportStreamReservedBitrate': transportStreamReservedBitrate,
    };
  }
}

/// Contains summary configuration for a Multiplex event.
class MultiplexSettingsSummary {
  /// Transport stream bit rate.
  final int? transportStreamBitrate;

  MultiplexSettingsSummary({
    this.transportStreamBitrate,
  });

  factory MultiplexSettingsSummary.fromJson(Map<String, dynamic> json) {
    return MultiplexSettingsSummary(
      transportStreamBitrate: json['transportStreamBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final transportStreamBitrate = this.transportStreamBitrate;
    return {
      if (transportStreamBitrate != null)
        'transportStreamBitrate': transportStreamBitrate,
    };
  }
}

/// The current state of the multiplex.
enum MultiplexState {
  creating,
  createFailed,
  idle,
  starting,
  running,
  recovering,
  stopping,
  deleting,
  deleted,
}

extension on MultiplexState {
  String toValue() {
    switch (this) {
      case MultiplexState.creating:
        return 'CREATING';
      case MultiplexState.createFailed:
        return 'CREATE_FAILED';
      case MultiplexState.idle:
        return 'IDLE';
      case MultiplexState.starting:
        return 'STARTING';
      case MultiplexState.running:
        return 'RUNNING';
      case MultiplexState.recovering:
        return 'RECOVERING';
      case MultiplexState.stopping:
        return 'STOPPING';
      case MultiplexState.deleting:
        return 'DELETING';
      case MultiplexState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  MultiplexState toMultiplexState() {
    switch (this) {
      case 'CREATING':
        return MultiplexState.creating;
      case 'CREATE_FAILED':
        return MultiplexState.createFailed;
      case 'IDLE':
        return MultiplexState.idle;
      case 'STARTING':
        return MultiplexState.starting;
      case 'RUNNING':
        return MultiplexState.running;
      case 'RECOVERING':
        return MultiplexState.recovering;
      case 'STOPPING':
        return MultiplexState.stopping;
      case 'DELETING':
        return MultiplexState.deleting;
      case 'DELETED':
        return MultiplexState.deleted;
    }
    throw Exception('$this is not known in enum MultiplexState');
  }
}

/// Statmux rate control settings
class MultiplexStatmuxVideoSettings {
  /// Maximum statmux bitrate.
  final int? maximumBitrate;

  /// Minimum statmux bitrate.
  final int? minimumBitrate;

  /// The purpose of the priority is to use a combination of the\nmultiplex rate
  /// control algorithm and the QVBR capability of the\nencoder to prioritize the
  /// video quality of some channels in a\nmultiplex over others.  Channels that
  /// have a higher priority will\nget higher video quality at the expense of the
  /// video quality of\nother channels in the multiplex with lower priority.
  final int? priority;

  MultiplexStatmuxVideoSettings({
    this.maximumBitrate,
    this.minimumBitrate,
    this.priority,
  });

  factory MultiplexStatmuxVideoSettings.fromJson(Map<String, dynamic> json) {
    return MultiplexStatmuxVideoSettings(
      maximumBitrate: json['maximumBitrate'] as int?,
      minimumBitrate: json['minimumBitrate'] as int?,
      priority: json['priority'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumBitrate = this.maximumBitrate;
    final minimumBitrate = this.minimumBitrate;
    final priority = this.priority;
    return {
      if (maximumBitrate != null) 'maximumBitrate': maximumBitrate,
      if (minimumBitrate != null) 'minimumBitrate': minimumBitrate,
      if (priority != null) 'priority': priority,
    };
  }
}

/// Placeholder documentation for MultiplexSummary
class MultiplexSummary {
  /// The unique arn of the multiplex.
  final String? arn;

  /// A list of availability zones for the multiplex.
  final List<String>? availabilityZones;

  /// The unique id of the multiplex.
  final String? id;

  /// Configuration for a multiplex event.
  final MultiplexSettingsSummary? multiplexSettings;

  /// The name of the multiplex.
  final String? name;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The number of programs in the multiplex.
  final int? programCount;

  /// The current state of the multiplex.
  final MultiplexState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

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

  factory MultiplexSummary.fromJson(Map<String, dynamic> json) {
    return MultiplexSummary(
      arn: json['arn'] as String?,
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      multiplexSettings: json['multiplexSettings'] != null
          ? MultiplexSettingsSummary.fromJson(
              json['multiplexSettings'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      programCount: json['programCount'] as int?,
      state: (json['state'] as String?)?.toMultiplexState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZones = this.availabilityZones;
    final id = this.id;
    final multiplexSettings = this.multiplexSettings;
    final name = this.name;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final programCount = this.programCount;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (id != null) 'id': id,
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (name != null) 'name': name,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (programCount != null) 'programCount': programCount,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The video configuration for each program in a multiplex.
class MultiplexVideoSettings {
  /// The constant bitrate configuration for the video encode.
  /// When this field is defined, StatmuxSettings must be undefined.
  final int? constantBitrate;

  /// Statmux rate control settings.
  /// When this field is defined, ConstantBitrate must be undefined.
  final MultiplexStatmuxVideoSettings? statmuxSettings;

  MultiplexVideoSettings({
    this.constantBitrate,
    this.statmuxSettings,
  });

  factory MultiplexVideoSettings.fromJson(Map<String, dynamic> json) {
    return MultiplexVideoSettings(
      constantBitrate: json['constantBitrate'] as int?,
      statmuxSettings: json['statmuxSettings'] != null
          ? MultiplexStatmuxVideoSettings.fromJson(
              json['statmuxSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final constantBitrate = this.constantBitrate;
    final statmuxSettings = this.statmuxSettings;
    return {
      if (constantBitrate != null) 'constantBitrate': constantBitrate,
      if (statmuxSettings != null) 'statmuxSettings': statmuxSettings,
    };
  }
}

/// Network Input Server Validation
enum NetworkInputServerValidation {
  checkCryptographyAndValidateName,
  checkCryptographyOnly,
}

extension on NetworkInputServerValidation {
  String toValue() {
    switch (this) {
      case NetworkInputServerValidation.checkCryptographyAndValidateName:
        return 'CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME';
      case NetworkInputServerValidation.checkCryptographyOnly:
        return 'CHECK_CRYPTOGRAPHY_ONLY';
    }
  }
}

extension on String {
  NetworkInputServerValidation toNetworkInputServerValidation() {
    switch (this) {
      case 'CHECK_CRYPTOGRAPHY_AND_VALIDATE_NAME':
        return NetworkInputServerValidation.checkCryptographyAndValidateName;
      case 'CHECK_CRYPTOGRAPHY_ONLY':
        return NetworkInputServerValidation.checkCryptographyOnly;
    }
    throw Exception('$this is not known in enum NetworkInputServerValidation');
  }
}

/// Network source to transcode. Must be accessible to the Elemental Live node
/// that is running the live event through a network connection.
class NetworkInputSettings {
  /// Specifies HLS input settings when the uri is for a HLS manifest.
  final HlsInputSettings? hlsInputSettings;

  /// Check HTTPS server certificates. When set to checkCryptographyOnly,
  /// cryptography in the certificate will be checked, but not the server's name.
  /// Certain subdomains (notably S3 buckets that use dots in the bucket name) do
  /// not strictly match the corresponding certificate's wildcard pattern and
  /// would otherwise cause the event to error. This setting is ignored for
  /// protocols that do not use https.
  final NetworkInputServerValidation? serverValidation;

  NetworkInputSettings({
    this.hlsInputSettings,
    this.serverValidation,
  });

  factory NetworkInputSettings.fromJson(Map<String, dynamic> json) {
    return NetworkInputSettings(
      hlsInputSettings: json['hlsInputSettings'] != null
          ? HlsInputSettings.fromJson(
              json['hlsInputSettings'] as Map<String, dynamic>)
          : null,
      serverValidation: (json['serverValidation'] as String?)
          ?.toNetworkInputServerValidation(),
    );
  }

  Map<String, dynamic> toJson() {
    final hlsInputSettings = this.hlsInputSettings;
    final serverValidation = this.serverValidation;
    return {
      if (hlsInputSettings != null) 'hlsInputSettings': hlsInputSettings,
      if (serverValidation != null)
        'serverValidation': serverValidation.toValue(),
    };
  }
}

/// Nielsen Configuration
class NielsenConfiguration {
  /// Enter the Distributor ID assigned to your organization by Nielsen.
  final String? distributorId;

  /// Enables Nielsen PCM to ID3 tagging
  final NielsenPcmToId3TaggingState? nielsenPcmToId3Tagging;

  NielsenConfiguration({
    this.distributorId,
    this.nielsenPcmToId3Tagging,
  });

  factory NielsenConfiguration.fromJson(Map<String, dynamic> json) {
    return NielsenConfiguration(
      distributorId: json['distributorId'] as String?,
      nielsenPcmToId3Tagging: (json['nielsenPcmToId3Tagging'] as String?)
          ?.toNielsenPcmToId3TaggingState(),
    );
  }

  Map<String, dynamic> toJson() {
    final distributorId = this.distributorId;
    final nielsenPcmToId3Tagging = this.nielsenPcmToId3Tagging;
    return {
      if (distributorId != null) 'distributorId': distributorId,
      if (nielsenPcmToId3Tagging != null)
        'nielsenPcmToId3Tagging': nielsenPcmToId3Tagging.toValue(),
    };
  }
}

/// State of Nielsen PCM to ID3 tagging
enum NielsenPcmToId3TaggingState {
  disabled,
  enabled,
}

extension on NielsenPcmToId3TaggingState {
  String toValue() {
    switch (this) {
      case NielsenPcmToId3TaggingState.disabled:
        return 'DISABLED';
      case NielsenPcmToId3TaggingState.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  NielsenPcmToId3TaggingState toNielsenPcmToId3TaggingState() {
    switch (this) {
      case 'DISABLED':
        return NielsenPcmToId3TaggingState.disabled;
      case 'ENABLED':
        return NielsenPcmToId3TaggingState.enabled;
    }
    throw Exception('$this is not known in enum NielsenPcmToId3TaggingState');
  }
}

/// Reserved resources available for purchase
class Offering {
  /// Unique offering ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:offering:87654321'
  final String? arn;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String? currencyCode;

  /// Lease duration, e.g. '12'
  final int? duration;

  /// Units for duration, e.g. 'MONTHS'
  final OfferingDurationUnits? durationUnits;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double? fixedPrice;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String? offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String? offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final OfferingType? offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String? region;

  /// Resource configuration details
  final ReservationResourceSpecification? resourceSpecification;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double? usagePrice;

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

  factory Offering.fromJson(Map<String, dynamic> json) {
    return Offering(
      arn: json['arn'] as String?,
      currencyCode: json['currencyCode'] as String?,
      duration: json['duration'] as int?,
      durationUnits:
          (json['durationUnits'] as String?)?.toOfferingDurationUnits(),
      fixedPrice: json['fixedPrice'] as double?,
      offeringDescription: json['offeringDescription'] as String?,
      offeringId: json['offeringId'] as String?,
      offeringType: (json['offeringType'] as String?)?.toOfferingType(),
      region: json['region'] as String?,
      resourceSpecification: json['resourceSpecification'] != null
          ? ReservationResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
      usagePrice: json['usagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final durationUnits = this.durationUnits;
    final fixedPrice = this.fixedPrice;
    final offeringDescription = this.offeringDescription;
    final offeringId = this.offeringId;
    final offeringType = this.offeringType;
    final region = this.region;
    final resourceSpecification = this.resourceSpecification;
    final usagePrice = this.usagePrice;
    return {
      if (arn != null) 'arn': arn,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (duration != null) 'duration': duration,
      if (durationUnits != null) 'durationUnits': durationUnits.toValue(),
      if (fixedPrice != null) 'fixedPrice': fixedPrice,
      if (offeringDescription != null)
        'offeringDescription': offeringDescription,
      if (offeringId != null) 'offeringId': offeringId,
      if (offeringType != null) 'offeringType': offeringType.toValue(),
      if (region != null) 'region': region,
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
      if (usagePrice != null) 'usagePrice': usagePrice,
    };
  }
}

/// Units for duration, e.g. 'MONTHS'
enum OfferingDurationUnits {
  months,
}

extension on OfferingDurationUnits {
  String toValue() {
    switch (this) {
      case OfferingDurationUnits.months:
        return 'MONTHS';
    }
  }
}

extension on String {
  OfferingDurationUnits toOfferingDurationUnits() {
    switch (this) {
      case 'MONTHS':
        return OfferingDurationUnits.months;
    }
    throw Exception('$this is not known in enum OfferingDurationUnits');
  }
}

/// Offering type, e.g. 'NO_UPFRONT'
enum OfferingType {
  noUpfront,
}

extension on OfferingType {
  String toValue() {
    switch (this) {
      case OfferingType.noUpfront:
        return 'NO_UPFRONT';
    }
  }
}

extension on String {
  OfferingType toOfferingType() {
    switch (this) {
      case 'NO_UPFRONT':
        return OfferingType.noUpfront;
    }
    throw Exception('$this is not known in enum OfferingType');
  }
}

/// Output settings. There can be multiple outputs within a group.
class Output {
  /// Output type-specific settings.
  final OutputSettings outputSettings;

  /// The names of the AudioDescriptions used as audio sources for this output.
  final List<String>? audioDescriptionNames;

  /// The names of the CaptionDescriptions used as caption sources for this
  /// output.
  final List<String>? captionDescriptionNames;

  /// The name used to identify an output.
  final String? outputName;

  /// The name of the VideoDescription used as the source for this output.
  final String? videoDescriptionName;

  Output({
    required this.outputSettings,
    this.audioDescriptionNames,
    this.captionDescriptionNames,
    this.outputName,
    this.videoDescriptionName,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      outputSettings: OutputSettings.fromJson(
          json['outputSettings'] as Map<String, dynamic>),
      audioDescriptionNames: (json['audioDescriptionNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      captionDescriptionNames: (json['captionDescriptionNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      outputName: json['outputName'] as String?,
      videoDescriptionName: json['videoDescriptionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputSettings = this.outputSettings;
    final audioDescriptionNames = this.audioDescriptionNames;
    final captionDescriptionNames = this.captionDescriptionNames;
    final outputName = this.outputName;
    final videoDescriptionName = this.videoDescriptionName;
    return {
      'outputSettings': outputSettings,
      if (audioDescriptionNames != null)
        'audioDescriptionNames': audioDescriptionNames,
      if (captionDescriptionNames != null)
        'captionDescriptionNames': captionDescriptionNames,
      if (outputName != null) 'outputName': outputName,
      if (videoDescriptionName != null)
        'videoDescriptionName': videoDescriptionName,
    };
  }
}

/// Placeholder documentation for OutputDestination
class OutputDestination {
  /// User-specified id. This is used in an output group or an output.
  final String? id;

  /// Destination settings for a MediaPackage output; one destination for both
  /// encoders.
  final List<MediaPackageOutputDestinationSettings>? mediaPackageSettings;

  /// Destination settings for a Multiplex output; one destination for both
  /// encoders.
  final MultiplexProgramChannelDestinationSettings? multiplexSettings;

  /// Destination settings for a standard output; one destination for each
  /// redundant encoder.
  final List<OutputDestinationSettings>? settings;

  OutputDestination({
    this.id,
    this.mediaPackageSettings,
    this.multiplexSettings,
    this.settings,
  });

  factory OutputDestination.fromJson(Map<String, dynamic> json) {
    return OutputDestination(
      id: json['id'] as String?,
      mediaPackageSettings: (json['mediaPackageSettings'] as List?)
          ?.whereNotNull()
          .map((e) => MediaPackageOutputDestinationSettings.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      multiplexSettings: json['multiplexSettings'] != null
          ? MultiplexProgramChannelDestinationSettings.fromJson(
              json['multiplexSettings'] as Map<String, dynamic>)
          : null,
      settings: (json['settings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OutputDestinationSettings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final mediaPackageSettings = this.mediaPackageSettings;
    final multiplexSettings = this.multiplexSettings;
    final settings = this.settings;
    return {
      if (id != null) 'id': id,
      if (mediaPackageSettings != null)
        'mediaPackageSettings': mediaPackageSettings,
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (settings != null) 'settings': settings,
    };
  }
}

/// Placeholder documentation for OutputDestinationSettings
class OutputDestinationSettings {
  /// key used to extract the password from EC2 Parameter store
  final String? passwordParam;

  /// Stream name for RTMP destinations (URLs of type rtmp://)
  final String? streamName;

  /// A URL specifying a destination
  final String? url;

  /// username for destination
  final String? username;

  OutputDestinationSettings({
    this.passwordParam,
    this.streamName,
    this.url,
    this.username,
  });

  factory OutputDestinationSettings.fromJson(Map<String, dynamic> json) {
    return OutputDestinationSettings(
      passwordParam: json['passwordParam'] as String?,
      streamName: json['streamName'] as String?,
      url: json['url'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final passwordParam = this.passwordParam;
    final streamName = this.streamName;
    final url = this.url;
    final username = this.username;
    return {
      if (passwordParam != null) 'passwordParam': passwordParam,
      if (streamName != null) 'streamName': streamName,
      if (url != null) 'url': url,
      if (username != null) 'username': username,
    };
  }
}

/// Output groups for this Live Event. Output groups contain information about
/// where streams should be distributed.
class OutputGroup {
  /// Settings associated with the output group.
  final OutputGroupSettings outputGroupSettings;
  final List<Output> outputs;

  /// Custom output group name optionally defined by the user.  Only letters,
  /// numbers, and the underscore character allowed; only 32 characters allowed.
  final String? name;

  OutputGroup({
    required this.outputGroupSettings,
    required this.outputs,
    this.name,
  });

  factory OutputGroup.fromJson(Map<String, dynamic> json) {
    return OutputGroup(
      outputGroupSettings: OutputGroupSettings.fromJson(
          json['outputGroupSettings'] as Map<String, dynamic>),
      outputs: (json['outputs'] as List)
          .whereNotNull()
          .map((e) => Output.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputGroupSettings = this.outputGroupSettings;
    final outputs = this.outputs;
    final name = this.name;
    return {
      'outputGroupSettings': outputGroupSettings,
      'outputs': outputs,
      if (name != null) 'name': name,
    };
  }
}

/// Output Group Settings
class OutputGroupSettings {
  final ArchiveGroupSettings? archiveGroupSettings;
  final FrameCaptureGroupSettings? frameCaptureGroupSettings;
  final HlsGroupSettings? hlsGroupSettings;
  final MediaPackageGroupSettings? mediaPackageGroupSettings;
  final MsSmoothGroupSettings? msSmoothGroupSettings;
  final MultiplexGroupSettings? multiplexGroupSettings;
  final RtmpGroupSettings? rtmpGroupSettings;
  final UdpGroupSettings? udpGroupSettings;

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

  factory OutputGroupSettings.fromJson(Map<String, dynamic> json) {
    return OutputGroupSettings(
      archiveGroupSettings: json['archiveGroupSettings'] != null
          ? ArchiveGroupSettings.fromJson(
              json['archiveGroupSettings'] as Map<String, dynamic>)
          : null,
      frameCaptureGroupSettings: json['frameCaptureGroupSettings'] != null
          ? FrameCaptureGroupSettings.fromJson(
              json['frameCaptureGroupSettings'] as Map<String, dynamic>)
          : null,
      hlsGroupSettings: json['hlsGroupSettings'] != null
          ? HlsGroupSettings.fromJson(
              json['hlsGroupSettings'] as Map<String, dynamic>)
          : null,
      mediaPackageGroupSettings: json['mediaPackageGroupSettings'] != null
          ? MediaPackageGroupSettings.fromJson(
              json['mediaPackageGroupSettings'] as Map<String, dynamic>)
          : null,
      msSmoothGroupSettings: json['msSmoothGroupSettings'] != null
          ? MsSmoothGroupSettings.fromJson(
              json['msSmoothGroupSettings'] as Map<String, dynamic>)
          : null,
      multiplexGroupSettings: json['multiplexGroupSettings'] != null
          ? MultiplexGroupSettings.fromJson(
              json['multiplexGroupSettings'] as Map<String, dynamic>)
          : null,
      rtmpGroupSettings: json['rtmpGroupSettings'] != null
          ? RtmpGroupSettings.fromJson(
              json['rtmpGroupSettings'] as Map<String, dynamic>)
          : null,
      udpGroupSettings: json['udpGroupSettings'] != null
          ? UdpGroupSettings.fromJson(
              json['udpGroupSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveGroupSettings = this.archiveGroupSettings;
    final frameCaptureGroupSettings = this.frameCaptureGroupSettings;
    final hlsGroupSettings = this.hlsGroupSettings;
    final mediaPackageGroupSettings = this.mediaPackageGroupSettings;
    final msSmoothGroupSettings = this.msSmoothGroupSettings;
    final multiplexGroupSettings = this.multiplexGroupSettings;
    final rtmpGroupSettings = this.rtmpGroupSettings;
    final udpGroupSettings = this.udpGroupSettings;
    return {
      if (archiveGroupSettings != null)
        'archiveGroupSettings': archiveGroupSettings,
      if (frameCaptureGroupSettings != null)
        'frameCaptureGroupSettings': frameCaptureGroupSettings,
      if (hlsGroupSettings != null) 'hlsGroupSettings': hlsGroupSettings,
      if (mediaPackageGroupSettings != null)
        'mediaPackageGroupSettings': mediaPackageGroupSettings,
      if (msSmoothGroupSettings != null)
        'msSmoothGroupSettings': msSmoothGroupSettings,
      if (multiplexGroupSettings != null)
        'multiplexGroupSettings': multiplexGroupSettings,
      if (rtmpGroupSettings != null) 'rtmpGroupSettings': rtmpGroupSettings,
      if (udpGroupSettings != null) 'udpGroupSettings': udpGroupSettings,
    };
  }
}

/// Reference to an OutputDestination ID defined in the channel
class OutputLocationRef {
  final String? destinationRefId;

  OutputLocationRef({
    this.destinationRefId,
  });

  factory OutputLocationRef.fromJson(Map<String, dynamic> json) {
    return OutputLocationRef(
      destinationRefId: json['destinationRefId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationRefId = this.destinationRefId;
    return {
      if (destinationRefId != null) 'destinationRefId': destinationRefId,
    };
  }
}

/// Output Settings
class OutputSettings {
  final ArchiveOutputSettings? archiveOutputSettings;
  final FrameCaptureOutputSettings? frameCaptureOutputSettings;
  final HlsOutputSettings? hlsOutputSettings;
  final MediaPackageOutputSettings? mediaPackageOutputSettings;
  final MsSmoothOutputSettings? msSmoothOutputSettings;
  final MultiplexOutputSettings? multiplexOutputSettings;
  final RtmpOutputSettings? rtmpOutputSettings;
  final UdpOutputSettings? udpOutputSettings;

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

  factory OutputSettings.fromJson(Map<String, dynamic> json) {
    return OutputSettings(
      archiveOutputSettings: json['archiveOutputSettings'] != null
          ? ArchiveOutputSettings.fromJson(
              json['archiveOutputSettings'] as Map<String, dynamic>)
          : null,
      frameCaptureOutputSettings: json['frameCaptureOutputSettings'] != null
          ? FrameCaptureOutputSettings.fromJson(
              json['frameCaptureOutputSettings'] as Map<String, dynamic>)
          : null,
      hlsOutputSettings: json['hlsOutputSettings'] != null
          ? HlsOutputSettings.fromJson(
              json['hlsOutputSettings'] as Map<String, dynamic>)
          : null,
      mediaPackageOutputSettings: json['mediaPackageOutputSettings'] != null
          ? MediaPackageOutputSettings.fromJson(
              json['mediaPackageOutputSettings'] as Map<String, dynamic>)
          : null,
      msSmoothOutputSettings: json['msSmoothOutputSettings'] != null
          ? MsSmoothOutputSettings.fromJson(
              json['msSmoothOutputSettings'] as Map<String, dynamic>)
          : null,
      multiplexOutputSettings: json['multiplexOutputSettings'] != null
          ? MultiplexOutputSettings.fromJson(
              json['multiplexOutputSettings'] as Map<String, dynamic>)
          : null,
      rtmpOutputSettings: json['rtmpOutputSettings'] != null
          ? RtmpOutputSettings.fromJson(
              json['rtmpOutputSettings'] as Map<String, dynamic>)
          : null,
      udpOutputSettings: json['udpOutputSettings'] != null
          ? UdpOutputSettings.fromJson(
              json['udpOutputSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final archiveOutputSettings = this.archiveOutputSettings;
    final frameCaptureOutputSettings = this.frameCaptureOutputSettings;
    final hlsOutputSettings = this.hlsOutputSettings;
    final mediaPackageOutputSettings = this.mediaPackageOutputSettings;
    final msSmoothOutputSettings = this.msSmoothOutputSettings;
    final multiplexOutputSettings = this.multiplexOutputSettings;
    final rtmpOutputSettings = this.rtmpOutputSettings;
    final udpOutputSettings = this.udpOutputSettings;
    return {
      if (archiveOutputSettings != null)
        'archiveOutputSettings': archiveOutputSettings,
      if (frameCaptureOutputSettings != null)
        'frameCaptureOutputSettings': frameCaptureOutputSettings,
      if (hlsOutputSettings != null) 'hlsOutputSettings': hlsOutputSettings,
      if (mediaPackageOutputSettings != null)
        'mediaPackageOutputSettings': mediaPackageOutputSettings,
      if (msSmoothOutputSettings != null)
        'msSmoothOutputSettings': msSmoothOutputSettings,
      if (multiplexOutputSettings != null)
        'multiplexOutputSettings': multiplexOutputSettings,
      if (rtmpOutputSettings != null) 'rtmpOutputSettings': rtmpOutputSettings,
      if (udpOutputSettings != null) 'udpOutputSettings': udpOutputSettings,
    };
  }
}

/// Pass Through Settings
class PassThroughSettings {
  PassThroughSettings();

  factory PassThroughSettings.fromJson(Map<String, dynamic> _) {
    return PassThroughSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Settings for the action to set pause state of a channel.
class PauseStateScheduleActionSettings {
  final List<PipelinePauseStateSettings>? pipelines;

  PauseStateScheduleActionSettings({
    this.pipelines,
  });

  factory PauseStateScheduleActionSettings.fromJson(Map<String, dynamic> json) {
    return PauseStateScheduleActionSettings(
      pipelines: (json['pipelines'] as List?)
          ?.whereNotNull()
          .map((e) =>
              PipelinePauseStateSettings.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelines = this.pipelines;
    return {
      if (pipelines != null) 'pipelines': pipelines,
    };
  }
}

/// Runtime details of a pipeline when a channel is running.
class PipelineDetail {
  /// The name of the active input attachment currently being ingested by this
  /// pipeline.
  final String? activeInputAttachmentName;

  /// The name of the input switch schedule action that occurred most recently and
  /// that resulted in the switch to the current input attachment for this
  /// pipeline.
  final String? activeInputSwitchActionName;

  /// The name of the motion graphics activate action that occurred most recently
  /// and that resulted in the current graphics URI for this pipeline.
  final String? activeMotionGraphicsActionName;

  /// The current URI being used for HTML5 motion graphics for this pipeline.
  final String? activeMotionGraphicsUri;

  /// Pipeline ID
  final String? pipelineId;

  PipelineDetail({
    this.activeInputAttachmentName,
    this.activeInputSwitchActionName,
    this.activeMotionGraphicsActionName,
    this.activeMotionGraphicsUri,
    this.pipelineId,
  });

  factory PipelineDetail.fromJson(Map<String, dynamic> json) {
    return PipelineDetail(
      activeInputAttachmentName: json['activeInputAttachmentName'] as String?,
      activeInputSwitchActionName:
          json['activeInputSwitchActionName'] as String?,
      activeMotionGraphicsActionName:
          json['activeMotionGraphicsActionName'] as String?,
      activeMotionGraphicsUri: json['activeMotionGraphicsUri'] as String?,
      pipelineId: json['pipelineId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeInputAttachmentName = this.activeInputAttachmentName;
    final activeInputSwitchActionName = this.activeInputSwitchActionName;
    final activeMotionGraphicsActionName = this.activeMotionGraphicsActionName;
    final activeMotionGraphicsUri = this.activeMotionGraphicsUri;
    final pipelineId = this.pipelineId;
    return {
      if (activeInputAttachmentName != null)
        'activeInputAttachmentName': activeInputAttachmentName,
      if (activeInputSwitchActionName != null)
        'activeInputSwitchActionName': activeInputSwitchActionName,
      if (activeMotionGraphicsActionName != null)
        'activeMotionGraphicsActionName': activeMotionGraphicsActionName,
      if (activeMotionGraphicsUri != null)
        'activeMotionGraphicsUri': activeMotionGraphicsUri,
      if (pipelineId != null) 'pipelineId': pipelineId,
    };
  }
}

/// Pipeline ID
enum PipelineId {
  pipeline_0,
  pipeline_1,
}

extension on PipelineId {
  String toValue() {
    switch (this) {
      case PipelineId.pipeline_0:
        return 'PIPELINE_0';
      case PipelineId.pipeline_1:
        return 'PIPELINE_1';
    }
  }
}

extension on String {
  PipelineId toPipelineId() {
    switch (this) {
      case 'PIPELINE_0':
        return PipelineId.pipeline_0;
      case 'PIPELINE_1':
        return PipelineId.pipeline_1;
    }
    throw Exception('$this is not known in enum PipelineId');
  }
}

/// Settings for pausing a pipeline.
class PipelinePauseStateSettings {
  /// Pipeline ID to pause ("PIPELINE_0" or "PIPELINE_1").
  final PipelineId pipelineId;

  PipelinePauseStateSettings({
    required this.pipelineId,
  });

  factory PipelinePauseStateSettings.fromJson(Map<String, dynamic> json) {
    return PipelinePauseStateSettings(
      pipelineId: (json['pipelineId'] as String).toPipelineId(),
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineId = this.pipelineId;
    return {
      'pipelineId': pipelineId.toValue(),
    };
  }
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
  currentlyActive,
  pipeline_0,
  pipeline_1,
}

extension on PreferredChannelPipeline {
  String toValue() {
    switch (this) {
      case PreferredChannelPipeline.currentlyActive:
        return 'CURRENTLY_ACTIVE';
      case PreferredChannelPipeline.pipeline_0:
        return 'PIPELINE_0';
      case PreferredChannelPipeline.pipeline_1:
        return 'PIPELINE_1';
    }
  }
}

extension on String {
  PreferredChannelPipeline toPreferredChannelPipeline() {
    switch (this) {
      case 'CURRENTLY_ACTIVE':
        return PreferredChannelPipeline.currentlyActive;
      case 'PIPELINE_0':
        return PreferredChannelPipeline.pipeline_0;
      case 'PIPELINE_1':
        return PreferredChannelPipeline.pipeline_1;
    }
    throw Exception('$this is not known in enum PreferredChannelPipeline');
  }
}

/// Placeholder documentation for PurchaseOfferingResponse
class PurchaseOfferingResponse {
  final Reservation? reservation;

  PurchaseOfferingResponse({
    this.reservation,
  });

  factory PurchaseOfferingResponse.fromJson(Map<String, dynamic> json) {
    return PurchaseOfferingResponse(
      reservation: json['reservation'] != null
          ? Reservation.fromJson(json['reservation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reservation = this.reservation;
    return {
      if (reservation != null) 'reservation': reservation,
    };
  }
}

/// Raw Settings
class RawSettings {
  RawSettings();

  factory RawSettings.fromJson(Map<String, dynamic> _) {
    return RawSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Rec601 Settings
class Rec601Settings {
  Rec601Settings();

  factory Rec601Settings.fromJson(Map<String, dynamic> _) {
    return Rec601Settings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Rec709 Settings
class Rec709Settings {
  Rec709Settings();

  factory Rec709Settings.fromJson(Map<String, dynamic> _) {
    return Rec709Settings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Placeholder documentation for RejectInputDeviceTransferResponse
class RejectInputDeviceTransferResponse {
  RejectInputDeviceTransferResponse();

  factory RejectInputDeviceTransferResponse.fromJson(Map<String, dynamic> _) {
    return RejectInputDeviceTransferResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Remix Settings
class RemixSettings {
  /// Mapping of input channels to output channels, with appropriate gain
  /// adjustments.
  final List<AudioChannelMapping> channelMappings;

  /// Number of input channels to be used.
  final int? channelsIn;

  /// Number of output channels to be produced.
  /// Valid values: 1, 2, 4, 6, 8
  final int? channelsOut;

  RemixSettings({
    required this.channelMappings,
    this.channelsIn,
    this.channelsOut,
  });

  factory RemixSettings.fromJson(Map<String, dynamic> json) {
    return RemixSettings(
      channelMappings: (json['channelMappings'] as List)
          .whereNotNull()
          .map((e) => AudioChannelMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelsIn: json['channelsIn'] as int?,
      channelsOut: json['channelsOut'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelMappings = this.channelMappings;
    final channelsIn = this.channelsIn;
    final channelsOut = this.channelsOut;
    return {
      'channelMappings': channelMappings,
      if (channelsIn != null) 'channelsIn': channelsIn,
      if (channelsOut != null) 'channelsOut': channelsOut,
    };
  }
}

/// Reserved resources available to use
class Reservation {
  /// Unique reservation ARN, e.g.
  /// 'arn:aws:medialive:us-west-2:123456789012:reservation:1234567'
  final String? arn;

  /// Number of reserved resources
  final int? count;

  /// Currency code for usagePrice and fixedPrice in ISO-4217 format, e.g. 'USD'
  final String? currencyCode;

  /// Lease duration, e.g. '12'
  final int? duration;

  /// Units for duration, e.g. 'MONTHS'
  final OfferingDurationUnits? durationUnits;

  /// Reservation UTC end date and time in ISO-8601 format, e.g.
  /// '2019-03-01T00:00:00'
  final String? end;

  /// One-time charge for each reserved resource, e.g. '0.0' for a NO_UPFRONT
  /// offering
  final double? fixedPrice;

  /// User specified reservation name
  final String? name;

  /// Offering description, e.g. 'HD AVC output at 10-20 Mbps, 30 fps, and
  /// standard VQ in US West (Oregon)'
  final String? offeringDescription;

  /// Unique offering ID, e.g. '87654321'
  final String? offeringId;

  /// Offering type, e.g. 'NO_UPFRONT'
  final OfferingType? offeringType;

  /// AWS region, e.g. 'us-west-2'
  final String? region;

  /// Unique reservation ID, e.g. '1234567'
  final String? reservationId;

  /// Resource configuration details
  final ReservationResourceSpecification? resourceSpecification;

  /// Reservation UTC start date and time in ISO-8601 format, e.g.
  /// '2018-03-01T00:00:00'
  final String? start;

  /// Current state of reservation, e.g. 'ACTIVE'
  final ReservationState? state;

  /// A collection of key-value pairs
  final Map<String, String>? tags;

  /// Recurring usage charge for each reserved resource, e.g. '157.0'
  final double? usagePrice;

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

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      arn: json['arn'] as String?,
      count: json['count'] as int?,
      currencyCode: json['currencyCode'] as String?,
      duration: json['duration'] as int?,
      durationUnits:
          (json['durationUnits'] as String?)?.toOfferingDurationUnits(),
      end: json['end'] as String?,
      fixedPrice: json['fixedPrice'] as double?,
      name: json['name'] as String?,
      offeringDescription: json['offeringDescription'] as String?,
      offeringId: json['offeringId'] as String?,
      offeringType: (json['offeringType'] as String?)?.toOfferingType(),
      region: json['region'] as String?,
      reservationId: json['reservationId'] as String?,
      resourceSpecification: json['resourceSpecification'] != null
          ? ReservationResourceSpecification.fromJson(
              json['resourceSpecification'] as Map<String, dynamic>)
          : null,
      start: json['start'] as String?,
      state: (json['state'] as String?)?.toReservationState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      usagePrice: json['usagePrice'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final count = this.count;
    final currencyCode = this.currencyCode;
    final duration = this.duration;
    final durationUnits = this.durationUnits;
    final end = this.end;
    final fixedPrice = this.fixedPrice;
    final name = this.name;
    final offeringDescription = this.offeringDescription;
    final offeringId = this.offeringId;
    final offeringType = this.offeringType;
    final region = this.region;
    final reservationId = this.reservationId;
    final resourceSpecification = this.resourceSpecification;
    final start = this.start;
    final state = this.state;
    final tags = this.tags;
    final usagePrice = this.usagePrice;
    return {
      if (arn != null) 'arn': arn,
      if (count != null) 'count': count,
      if (currencyCode != null) 'currencyCode': currencyCode,
      if (duration != null) 'duration': duration,
      if (durationUnits != null) 'durationUnits': durationUnits.toValue(),
      if (end != null) 'end': end,
      if (fixedPrice != null) 'fixedPrice': fixedPrice,
      if (name != null) 'name': name,
      if (offeringDescription != null)
        'offeringDescription': offeringDescription,
      if (offeringId != null) 'offeringId': offeringId,
      if (offeringType != null) 'offeringType': offeringType.toValue(),
      if (region != null) 'region': region,
      if (reservationId != null) 'reservationId': reservationId,
      if (resourceSpecification != null)
        'resourceSpecification': resourceSpecification,
      if (start != null) 'start': start,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (usagePrice != null) 'usagePrice': usagePrice,
    };
  }
}

/// Codec, 'MPEG2', 'AVC', 'HEVC', or 'AUDIO'
enum ReservationCodec {
  mpeg2,
  avc,
  hevc,
  audio,
  link,
}

extension on ReservationCodec {
  String toValue() {
    switch (this) {
      case ReservationCodec.mpeg2:
        return 'MPEG2';
      case ReservationCodec.avc:
        return 'AVC';
      case ReservationCodec.hevc:
        return 'HEVC';
      case ReservationCodec.audio:
        return 'AUDIO';
      case ReservationCodec.link:
        return 'LINK';
    }
  }
}

extension on String {
  ReservationCodec toReservationCodec() {
    switch (this) {
      case 'MPEG2':
        return ReservationCodec.mpeg2;
      case 'AVC':
        return ReservationCodec.avc;
      case 'HEVC':
        return ReservationCodec.hevc;
      case 'AUDIO':
        return ReservationCodec.audio;
      case 'LINK':
        return ReservationCodec.link;
    }
    throw Exception('$this is not known in enum ReservationCodec');
  }
}

/// Maximum bitrate in megabits per second
enum ReservationMaximumBitrate {
  max_10Mbps,
  max_20Mbps,
  max_50Mbps,
}

extension on ReservationMaximumBitrate {
  String toValue() {
    switch (this) {
      case ReservationMaximumBitrate.max_10Mbps:
        return 'MAX_10_MBPS';
      case ReservationMaximumBitrate.max_20Mbps:
        return 'MAX_20_MBPS';
      case ReservationMaximumBitrate.max_50Mbps:
        return 'MAX_50_MBPS';
    }
  }
}

extension on String {
  ReservationMaximumBitrate toReservationMaximumBitrate() {
    switch (this) {
      case 'MAX_10_MBPS':
        return ReservationMaximumBitrate.max_10Mbps;
      case 'MAX_20_MBPS':
        return ReservationMaximumBitrate.max_20Mbps;
      case 'MAX_50_MBPS':
        return ReservationMaximumBitrate.max_50Mbps;
    }
    throw Exception('$this is not known in enum ReservationMaximumBitrate');
  }
}

/// Maximum framerate in frames per second (Outputs only)
enum ReservationMaximumFramerate {
  max_30Fps,
  max_60Fps,
}

extension on ReservationMaximumFramerate {
  String toValue() {
    switch (this) {
      case ReservationMaximumFramerate.max_30Fps:
        return 'MAX_30_FPS';
      case ReservationMaximumFramerate.max_60Fps:
        return 'MAX_60_FPS';
    }
  }
}

extension on String {
  ReservationMaximumFramerate toReservationMaximumFramerate() {
    switch (this) {
      case 'MAX_30_FPS':
        return ReservationMaximumFramerate.max_30Fps;
      case 'MAX_60_FPS':
        return ReservationMaximumFramerate.max_60Fps;
    }
    throw Exception('$this is not known in enum ReservationMaximumFramerate');
  }
}

/// Resolution based on lines of vertical resolution; SD is less than 720 lines,
/// HD is 720 to 1080 lines, FHD is 1080 lines, UHD is greater than 1080 lines
enum ReservationResolution {
  sd,
  hd,
  fhd,
  uhd,
}

extension on ReservationResolution {
  String toValue() {
    switch (this) {
      case ReservationResolution.sd:
        return 'SD';
      case ReservationResolution.hd:
        return 'HD';
      case ReservationResolution.fhd:
        return 'FHD';
      case ReservationResolution.uhd:
        return 'UHD';
    }
  }
}

extension on String {
  ReservationResolution toReservationResolution() {
    switch (this) {
      case 'SD':
        return ReservationResolution.sd;
      case 'HD':
        return ReservationResolution.hd;
      case 'FHD':
        return ReservationResolution.fhd;
      case 'UHD':
        return ReservationResolution.uhd;
    }
    throw Exception('$this is not known in enum ReservationResolution');
  }
}

/// Resource configuration (codec, resolution, bitrate, ...)
class ReservationResourceSpecification {
  /// Channel class, e.g. 'STANDARD'
  final ChannelClass? channelClass;

  /// Codec, e.g. 'AVC'
  final ReservationCodec? codec;

  /// Maximum bitrate, e.g. 'MAX_20_MBPS'
  final ReservationMaximumBitrate? maximumBitrate;

  /// Maximum framerate, e.g. 'MAX_30_FPS' (Outputs only)
  final ReservationMaximumFramerate? maximumFramerate;

  /// Resolution, e.g. 'HD'
  final ReservationResolution? resolution;

  /// Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
  final ReservationResourceType? resourceType;

  /// Special feature, e.g. 'AUDIO_NORMALIZATION' (Channels only)
  final ReservationSpecialFeature? specialFeature;

  /// Video quality, e.g. 'STANDARD' (Outputs only)
  final ReservationVideoQuality? videoQuality;

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

  factory ReservationResourceSpecification.fromJson(Map<String, dynamic> json) {
    return ReservationResourceSpecification(
      channelClass: (json['channelClass'] as String?)?.toChannelClass(),
      codec: (json['codec'] as String?)?.toReservationCodec(),
      maximumBitrate:
          (json['maximumBitrate'] as String?)?.toReservationMaximumBitrate(),
      maximumFramerate: (json['maximumFramerate'] as String?)
          ?.toReservationMaximumFramerate(),
      resolution: (json['resolution'] as String?)?.toReservationResolution(),
      resourceType:
          (json['resourceType'] as String?)?.toReservationResourceType(),
      specialFeature:
          (json['specialFeature'] as String?)?.toReservationSpecialFeature(),
      videoQuality:
          (json['videoQuality'] as String?)?.toReservationVideoQuality(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelClass = this.channelClass;
    final codec = this.codec;
    final maximumBitrate = this.maximumBitrate;
    final maximumFramerate = this.maximumFramerate;
    final resolution = this.resolution;
    final resourceType = this.resourceType;
    final specialFeature = this.specialFeature;
    final videoQuality = this.videoQuality;
    return {
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (codec != null) 'codec': codec.toValue(),
      if (maximumBitrate != null) 'maximumBitrate': maximumBitrate.toValue(),
      if (maximumFramerate != null)
        'maximumFramerate': maximumFramerate.toValue(),
      if (resolution != null) 'resolution': resolution.toValue(),
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (specialFeature != null) 'specialFeature': specialFeature.toValue(),
      if (videoQuality != null) 'videoQuality': videoQuality.toValue(),
    };
  }
}

/// Resource type, 'INPUT', 'OUTPUT', 'MULTIPLEX', or 'CHANNEL'
enum ReservationResourceType {
  input,
  output,
  multiplex,
  channel,
}

extension on ReservationResourceType {
  String toValue() {
    switch (this) {
      case ReservationResourceType.input:
        return 'INPUT';
      case ReservationResourceType.output:
        return 'OUTPUT';
      case ReservationResourceType.multiplex:
        return 'MULTIPLEX';
      case ReservationResourceType.channel:
        return 'CHANNEL';
    }
  }
}

extension on String {
  ReservationResourceType toReservationResourceType() {
    switch (this) {
      case 'INPUT':
        return ReservationResourceType.input;
      case 'OUTPUT':
        return ReservationResourceType.output;
      case 'MULTIPLEX':
        return ReservationResourceType.multiplex;
      case 'CHANNEL':
        return ReservationResourceType.channel;
    }
    throw Exception('$this is not known in enum ReservationResourceType');
  }
}

/// Special features, 'ADVANCED_AUDIO' 'AUDIO_NORMALIZATION' 'MGHD' or 'MGUHD'
enum ReservationSpecialFeature {
  advancedAudio,
  audioNormalization,
  mghd,
  mguhd,
}

extension on ReservationSpecialFeature {
  String toValue() {
    switch (this) {
      case ReservationSpecialFeature.advancedAudio:
        return 'ADVANCED_AUDIO';
      case ReservationSpecialFeature.audioNormalization:
        return 'AUDIO_NORMALIZATION';
      case ReservationSpecialFeature.mghd:
        return 'MGHD';
      case ReservationSpecialFeature.mguhd:
        return 'MGUHD';
    }
  }
}

extension on String {
  ReservationSpecialFeature toReservationSpecialFeature() {
    switch (this) {
      case 'ADVANCED_AUDIO':
        return ReservationSpecialFeature.advancedAudio;
      case 'AUDIO_NORMALIZATION':
        return ReservationSpecialFeature.audioNormalization;
      case 'MGHD':
        return ReservationSpecialFeature.mghd;
      case 'MGUHD':
        return ReservationSpecialFeature.mguhd;
    }
    throw Exception('$this is not known in enum ReservationSpecialFeature');
  }
}

/// Current reservation state
enum ReservationState {
  active,
  expired,
  canceled,
  deleted,
}

extension on ReservationState {
  String toValue() {
    switch (this) {
      case ReservationState.active:
        return 'ACTIVE';
      case ReservationState.expired:
        return 'EXPIRED';
      case ReservationState.canceled:
        return 'CANCELED';
      case ReservationState.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  ReservationState toReservationState() {
    switch (this) {
      case 'ACTIVE':
        return ReservationState.active;
      case 'EXPIRED':
        return ReservationState.expired;
      case 'CANCELED':
        return ReservationState.canceled;
      case 'DELETED':
        return ReservationState.deleted;
    }
    throw Exception('$this is not known in enum ReservationState');
  }
}

/// Video quality, e.g. 'STANDARD' (Outputs only)
enum ReservationVideoQuality {
  standard,
  enhanced,
  premium,
}

extension on ReservationVideoQuality {
  String toValue() {
    switch (this) {
      case ReservationVideoQuality.standard:
        return 'STANDARD';
      case ReservationVideoQuality.enhanced:
        return 'ENHANCED';
      case ReservationVideoQuality.premium:
        return 'PREMIUM';
    }
  }
}

extension on String {
  ReservationVideoQuality toReservationVideoQuality() {
    switch (this) {
      case 'STANDARD':
        return ReservationVideoQuality.standard;
      case 'ENHANCED':
        return ReservationVideoQuality.enhanced;
      case 'PREMIUM':
        return ReservationVideoQuality.premium;
    }
    throw Exception('$this is not known in enum ReservationVideoQuality');
  }
}

/// Rtmp Ad Markers
enum RtmpAdMarkers {
  onCuePointScte35,
}

extension on RtmpAdMarkers {
  String toValue() {
    switch (this) {
      case RtmpAdMarkers.onCuePointScte35:
        return 'ON_CUE_POINT_SCTE35';
    }
  }
}

extension on String {
  RtmpAdMarkers toRtmpAdMarkers() {
    switch (this) {
      case 'ON_CUE_POINT_SCTE35':
        return RtmpAdMarkers.onCuePointScte35;
    }
    throw Exception('$this is not known in enum RtmpAdMarkers');
  }
}

/// Rtmp Cache Full Behavior
enum RtmpCacheFullBehavior {
  disconnectImmediately,
  waitForServer,
}

extension on RtmpCacheFullBehavior {
  String toValue() {
    switch (this) {
      case RtmpCacheFullBehavior.disconnectImmediately:
        return 'DISCONNECT_IMMEDIATELY';
      case RtmpCacheFullBehavior.waitForServer:
        return 'WAIT_FOR_SERVER';
    }
  }
}

extension on String {
  RtmpCacheFullBehavior toRtmpCacheFullBehavior() {
    switch (this) {
      case 'DISCONNECT_IMMEDIATELY':
        return RtmpCacheFullBehavior.disconnectImmediately;
      case 'WAIT_FOR_SERVER':
        return RtmpCacheFullBehavior.waitForServer;
    }
    throw Exception('$this is not known in enum RtmpCacheFullBehavior');
  }
}

/// Rtmp Caption Data
enum RtmpCaptionData {
  all,
  field1_608,
  field1AndField2_608,
}

extension on RtmpCaptionData {
  String toValue() {
    switch (this) {
      case RtmpCaptionData.all:
        return 'ALL';
      case RtmpCaptionData.field1_608:
        return 'FIELD1_608';
      case RtmpCaptionData.field1AndField2_608:
        return 'FIELD1_AND_FIELD2_608';
    }
  }
}

extension on String {
  RtmpCaptionData toRtmpCaptionData() {
    switch (this) {
      case 'ALL':
        return RtmpCaptionData.all;
      case 'FIELD1_608':
        return RtmpCaptionData.field1_608;
      case 'FIELD1_AND_FIELD2_608':
        return RtmpCaptionData.field1AndField2_608;
    }
    throw Exception('$this is not known in enum RtmpCaptionData');
  }
}

/// Rtmp Caption Info Destination Settings
class RtmpCaptionInfoDestinationSettings {
  RtmpCaptionInfoDestinationSettings();

  factory RtmpCaptionInfoDestinationSettings.fromJson(Map<String, dynamic> _) {
    return RtmpCaptionInfoDestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Rtmp Group Settings
class RtmpGroupSettings {
  /// Choose the ad marker type for this output group. MediaLive will create a
  /// message based on the content of each SCTE-35 message, format it for that
  /// marker type, and insert it in the datastream.
  final List<RtmpAdMarkers>? adMarkers;

  /// Authentication scheme to use when connecting with CDN
  final AuthenticationScheme? authenticationScheme;

  /// Controls behavior when content cache fills up. If remote origin server
  /// stalls the RTMP connection and does not accept content fast enough the
  /// 'Media Cache' will fill up. When the cache reaches the duration specified by
  /// cacheLength the cache will stop accepting new content. If set to
  /// disconnectImmediately, the RTMP output will force a disconnect. Clear the
  /// media cache, and reconnect after restartDelay seconds. If set to
  /// waitForServer, the RTMP output will wait up to 5 minutes to allow the origin
  /// server to begin accepting data again.
  final RtmpCacheFullBehavior? cacheFullBehavior;

  /// Cache length, in seconds, is used to calculate buffer size.
  final int? cacheLength;

  /// Controls the types of data that passes to onCaptionInfo outputs.  If set to
  /// 'all' then 608 and 708 carried DTVCC data will be passed.  If set to
  /// 'field1AndField2608' then DTVCC data will be stripped out, but 608 data from
  /// both fields will be passed. If set to 'field1608' then only the data carried
  /// in 608 from field 1 video will be passed.
  final RtmpCaptionData? captionData;

  /// Controls the behavior of this RTMP group if input becomes unavailable.
  ///
  /// - emitOutput: Emit a slate until input returns.
  /// - pauseOutput: Stop transmitting data until input returns. This does not
  /// close the underlying RTMP connection.
  final InputLossActionForRtmpOut? inputLossAction;

  /// If a streaming output fails, number of seconds to wait until a restart is
  /// initiated. A value of 0 means never restart.
  final int? restartDelay;

  RtmpGroupSettings({
    this.adMarkers,
    this.authenticationScheme,
    this.cacheFullBehavior,
    this.cacheLength,
    this.captionData,
    this.inputLossAction,
    this.restartDelay,
  });

  factory RtmpGroupSettings.fromJson(Map<String, dynamic> json) {
    return RtmpGroupSettings(
      adMarkers: (json['adMarkers'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRtmpAdMarkers())
          .toList(),
      authenticationScheme:
          (json['authenticationScheme'] as String?)?.toAuthenticationScheme(),
      cacheFullBehavior:
          (json['cacheFullBehavior'] as String?)?.toRtmpCacheFullBehavior(),
      cacheLength: json['cacheLength'] as int?,
      captionData: (json['captionData'] as String?)?.toRtmpCaptionData(),
      inputLossAction:
          (json['inputLossAction'] as String?)?.toInputLossActionForRtmpOut(),
      restartDelay: json['restartDelay'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkers = this.adMarkers;
    final authenticationScheme = this.authenticationScheme;
    final cacheFullBehavior = this.cacheFullBehavior;
    final cacheLength = this.cacheLength;
    final captionData = this.captionData;
    final inputLossAction = this.inputLossAction;
    final restartDelay = this.restartDelay;
    return {
      if (adMarkers != null)
        'adMarkers': adMarkers.map((e) => e.toValue()).toList(),
      if (authenticationScheme != null)
        'authenticationScheme': authenticationScheme.toValue(),
      if (cacheFullBehavior != null)
        'cacheFullBehavior': cacheFullBehavior.toValue(),
      if (cacheLength != null) 'cacheLength': cacheLength,
      if (captionData != null) 'captionData': captionData.toValue(),
      if (inputLossAction != null) 'inputLossAction': inputLossAction.toValue(),
      if (restartDelay != null) 'restartDelay': restartDelay,
    };
  }
}

/// Rtmp Output Certificate Mode
enum RtmpOutputCertificateMode {
  selfSigned,
  verifyAuthenticity,
}

extension on RtmpOutputCertificateMode {
  String toValue() {
    switch (this) {
      case RtmpOutputCertificateMode.selfSigned:
        return 'SELF_SIGNED';
      case RtmpOutputCertificateMode.verifyAuthenticity:
        return 'VERIFY_AUTHENTICITY';
    }
  }
}

extension on String {
  RtmpOutputCertificateMode toRtmpOutputCertificateMode() {
    switch (this) {
      case 'SELF_SIGNED':
        return RtmpOutputCertificateMode.selfSigned;
      case 'VERIFY_AUTHENTICITY':
        return RtmpOutputCertificateMode.verifyAuthenticity;
    }
    throw Exception('$this is not known in enum RtmpOutputCertificateMode');
  }
}

/// Rtmp Output Settings
class RtmpOutputSettings {
  /// The RTMP endpoint excluding the stream name (eg. rtmp://host/appname). For
  /// connection to Akamai, a username and password must be supplied. URI fields
  /// accept format identifiers.
  final OutputLocationRef destination;

  /// If set to verifyAuthenticity, verify the tls certificate chain to a trusted
  /// Certificate Authority (CA).  This will cause rtmps outputs with self-signed
  /// certificates to fail.
  final RtmpOutputCertificateMode? certificateMode;

  /// Number of seconds to wait before retrying a connection to the Flash Media
  /// server if the connection is lost.
  final int? connectionRetryInterval;

  /// Number of retry attempts.
  final int? numRetries;

  RtmpOutputSettings({
    required this.destination,
    this.certificateMode,
    this.connectionRetryInterval,
    this.numRetries,
  });

  factory RtmpOutputSettings.fromJson(Map<String, dynamic> json) {
    return RtmpOutputSettings(
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
      certificateMode:
          (json['certificateMode'] as String?)?.toRtmpOutputCertificateMode(),
      connectionRetryInterval: json['connectionRetryInterval'] as int?,
      numRetries: json['numRetries'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final certificateMode = this.certificateMode;
    final connectionRetryInterval = this.connectionRetryInterval;
    final numRetries = this.numRetries;
    return {
      'destination': destination,
      if (certificateMode != null) 'certificateMode': certificateMode.toValue(),
      if (connectionRetryInterval != null)
        'connectionRetryInterval': connectionRetryInterval,
      if (numRetries != null) 'numRetries': numRetries,
    };
  }
}

/// S3 Canned Acl
enum S3CannedAcl {
  authenticatedRead,
  bucketOwnerFullControl,
  bucketOwnerRead,
  publicRead,
}

extension on S3CannedAcl {
  String toValue() {
    switch (this) {
      case S3CannedAcl.authenticatedRead:
        return 'AUTHENTICATED_READ';
      case S3CannedAcl.bucketOwnerFullControl:
        return 'BUCKET_OWNER_FULL_CONTROL';
      case S3CannedAcl.bucketOwnerRead:
        return 'BUCKET_OWNER_READ';
      case S3CannedAcl.publicRead:
        return 'PUBLIC_READ';
    }
  }
}

extension on String {
  S3CannedAcl toS3CannedAcl() {
    switch (this) {
      case 'AUTHENTICATED_READ':
        return S3CannedAcl.authenticatedRead;
      case 'BUCKET_OWNER_FULL_CONTROL':
        return S3CannedAcl.bucketOwnerFullControl;
      case 'BUCKET_OWNER_READ':
        return S3CannedAcl.bucketOwnerRead;
      case 'PUBLIC_READ':
        return S3CannedAcl.publicRead;
    }
    throw Exception('$this is not known in enum S3CannedAcl');
  }
}

/// Contains information on a single schedule action.
class ScheduleAction {
  /// The name of the action, must be unique within the schedule. This name
  /// provides the main reference to an action once it is added to the schedule. A
  /// name is unique if it is no longer in the schedule. The schedule is
  /// automatically cleaned up to remove actions with a start time of more than 1
  /// hour ago (approximately) so at that point a name can be reused.
  final String actionName;

  /// Settings for this schedule action.
  final ScheduleActionSettings scheduleActionSettings;

  /// The time for the action to start in the channel.
  final ScheduleActionStartSettings scheduleActionStartSettings;

  ScheduleAction({
    required this.actionName,
    required this.scheduleActionSettings,
    required this.scheduleActionStartSettings,
  });

  factory ScheduleAction.fromJson(Map<String, dynamic> json) {
    return ScheduleAction(
      actionName: json['actionName'] as String,
      scheduleActionSettings: ScheduleActionSettings.fromJson(
          json['scheduleActionSettings'] as Map<String, dynamic>),
      scheduleActionStartSettings: ScheduleActionStartSettings.fromJson(
          json['scheduleActionStartSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final scheduleActionSettings = this.scheduleActionSettings;
    final scheduleActionStartSettings = this.scheduleActionStartSettings;
    return {
      'actionName': actionName,
      'scheduleActionSettings': scheduleActionSettings,
      'scheduleActionStartSettings': scheduleActionStartSettings,
    };
  }
}

/// Holds the settings for a single schedule action.
class ScheduleActionSettings {
  /// Action to insert HLS ID3 segment tagging
  final HlsId3SegmentTaggingScheduleActionSettings?
      hlsId3SegmentTaggingSettings;

  /// Action to insert HLS metadata
  final HlsTimedMetadataScheduleActionSettings? hlsTimedMetadataSettings;

  /// Action to prepare an input for a future immediate input switch
  final InputPrepareScheduleActionSettings? inputPrepareSettings;

  /// Action to switch the input
  final InputSwitchScheduleActionSettings? inputSwitchSettings;

  /// Action to activate a motion graphics image overlay
  final MotionGraphicsActivateScheduleActionSettings?
      motionGraphicsImageActivateSettings;

  /// Action to deactivate a motion graphics image overlay
  final MotionGraphicsDeactivateScheduleActionSettings?
      motionGraphicsImageDeactivateSettings;

  /// Action to pause or unpause one or both channel pipelines
  final PauseStateScheduleActionSettings? pauseStateSettings;

  /// Action to insert SCTE-35 return_to_network message
  final Scte35ReturnToNetworkScheduleActionSettings?
      scte35ReturnToNetworkSettings;

  /// Action to insert SCTE-35 splice_insert message
  final Scte35SpliceInsertScheduleActionSettings? scte35SpliceInsertSettings;

  /// Action to insert SCTE-35 time_signal message
  final Scte35TimeSignalScheduleActionSettings? scte35TimeSignalSettings;

  /// Action to activate a static image overlay
  final StaticImageActivateScheduleActionSettings? staticImageActivateSettings;

  /// Action to deactivate a static image overlay
  final StaticImageDeactivateScheduleActionSettings?
      staticImageDeactivateSettings;

  ScheduleActionSettings({
    this.hlsId3SegmentTaggingSettings,
    this.hlsTimedMetadataSettings,
    this.inputPrepareSettings,
    this.inputSwitchSettings,
    this.motionGraphicsImageActivateSettings,
    this.motionGraphicsImageDeactivateSettings,
    this.pauseStateSettings,
    this.scte35ReturnToNetworkSettings,
    this.scte35SpliceInsertSettings,
    this.scte35TimeSignalSettings,
    this.staticImageActivateSettings,
    this.staticImageDeactivateSettings,
  });

  factory ScheduleActionSettings.fromJson(Map<String, dynamic> json) {
    return ScheduleActionSettings(
      hlsId3SegmentTaggingSettings: json['hlsId3SegmentTaggingSettings'] != null
          ? HlsId3SegmentTaggingScheduleActionSettings.fromJson(
              json['hlsId3SegmentTaggingSettings'] as Map<String, dynamic>)
          : null,
      hlsTimedMetadataSettings: json['hlsTimedMetadataSettings'] != null
          ? HlsTimedMetadataScheduleActionSettings.fromJson(
              json['hlsTimedMetadataSettings'] as Map<String, dynamic>)
          : null,
      inputPrepareSettings: json['inputPrepareSettings'] != null
          ? InputPrepareScheduleActionSettings.fromJson(
              json['inputPrepareSettings'] as Map<String, dynamic>)
          : null,
      inputSwitchSettings: json['inputSwitchSettings'] != null
          ? InputSwitchScheduleActionSettings.fromJson(
              json['inputSwitchSettings'] as Map<String, dynamic>)
          : null,
      motionGraphicsImageActivateSettings:
          json['motionGraphicsImageActivateSettings'] != null
              ? MotionGraphicsActivateScheduleActionSettings.fromJson(
                  json['motionGraphicsImageActivateSettings']
                      as Map<String, dynamic>)
              : null,
      motionGraphicsImageDeactivateSettings:
          json['motionGraphicsImageDeactivateSettings'] != null
              ? MotionGraphicsDeactivateScheduleActionSettings.fromJson(
                  json['motionGraphicsImageDeactivateSettings']
                      as Map<String, dynamic>)
              : null,
      pauseStateSettings: json['pauseStateSettings'] != null
          ? PauseStateScheduleActionSettings.fromJson(
              json['pauseStateSettings'] as Map<String, dynamic>)
          : null,
      scte35ReturnToNetworkSettings:
          json['scte35ReturnToNetworkSettings'] != null
              ? Scte35ReturnToNetworkScheduleActionSettings.fromJson(
                  json['scte35ReturnToNetworkSettings'] as Map<String, dynamic>)
              : null,
      scte35SpliceInsertSettings: json['scte35SpliceInsertSettings'] != null
          ? Scte35SpliceInsertScheduleActionSettings.fromJson(
              json['scte35SpliceInsertSettings'] as Map<String, dynamic>)
          : null,
      scte35TimeSignalSettings: json['scte35TimeSignalSettings'] != null
          ? Scte35TimeSignalScheduleActionSettings.fromJson(
              json['scte35TimeSignalSettings'] as Map<String, dynamic>)
          : null,
      staticImageActivateSettings: json['staticImageActivateSettings'] != null
          ? StaticImageActivateScheduleActionSettings.fromJson(
              json['staticImageActivateSettings'] as Map<String, dynamic>)
          : null,
      staticImageDeactivateSettings:
          json['staticImageDeactivateSettings'] != null
              ? StaticImageDeactivateScheduleActionSettings.fromJson(
                  json['staticImageDeactivateSettings'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hlsId3SegmentTaggingSettings = this.hlsId3SegmentTaggingSettings;
    final hlsTimedMetadataSettings = this.hlsTimedMetadataSettings;
    final inputPrepareSettings = this.inputPrepareSettings;
    final inputSwitchSettings = this.inputSwitchSettings;
    final motionGraphicsImageActivateSettings =
        this.motionGraphicsImageActivateSettings;
    final motionGraphicsImageDeactivateSettings =
        this.motionGraphicsImageDeactivateSettings;
    final pauseStateSettings = this.pauseStateSettings;
    final scte35ReturnToNetworkSettings = this.scte35ReturnToNetworkSettings;
    final scte35SpliceInsertSettings = this.scte35SpliceInsertSettings;
    final scte35TimeSignalSettings = this.scte35TimeSignalSettings;
    final staticImageActivateSettings = this.staticImageActivateSettings;
    final staticImageDeactivateSettings = this.staticImageDeactivateSettings;
    return {
      if (hlsId3SegmentTaggingSettings != null)
        'hlsId3SegmentTaggingSettings': hlsId3SegmentTaggingSettings,
      if (hlsTimedMetadataSettings != null)
        'hlsTimedMetadataSettings': hlsTimedMetadataSettings,
      if (inputPrepareSettings != null)
        'inputPrepareSettings': inputPrepareSettings,
      if (inputSwitchSettings != null)
        'inputSwitchSettings': inputSwitchSettings,
      if (motionGraphicsImageActivateSettings != null)
        'motionGraphicsImageActivateSettings':
            motionGraphicsImageActivateSettings,
      if (motionGraphicsImageDeactivateSettings != null)
        'motionGraphicsImageDeactivateSettings':
            motionGraphicsImageDeactivateSettings,
      if (pauseStateSettings != null) 'pauseStateSettings': pauseStateSettings,
      if (scte35ReturnToNetworkSettings != null)
        'scte35ReturnToNetworkSettings': scte35ReturnToNetworkSettings,
      if (scte35SpliceInsertSettings != null)
        'scte35SpliceInsertSettings': scte35SpliceInsertSettings,
      if (scte35TimeSignalSettings != null)
        'scte35TimeSignalSettings': scte35TimeSignalSettings,
      if (staticImageActivateSettings != null)
        'staticImageActivateSettings': staticImageActivateSettings,
      if (staticImageDeactivateSettings != null)
        'staticImageDeactivateSettings': staticImageDeactivateSettings,
    };
  }
}

/// Settings to specify when an action should occur. Only one of the options
/// must be selected.
class ScheduleActionStartSettings {
  /// Option for specifying the start time for an action.
  final FixedModeScheduleActionStartSettings?
      fixedModeScheduleActionStartSettings;

  /// Option for specifying an action as relative to another action.
  final FollowModeScheduleActionStartSettings?
      followModeScheduleActionStartSettings;

  /// Option for specifying an action that should be applied immediately.
  final ImmediateModeScheduleActionStartSettings?
      immediateModeScheduleActionStartSettings;

  ScheduleActionStartSettings({
    this.fixedModeScheduleActionStartSettings,
    this.followModeScheduleActionStartSettings,
    this.immediateModeScheduleActionStartSettings,
  });

  factory ScheduleActionStartSettings.fromJson(Map<String, dynamic> json) {
    return ScheduleActionStartSettings(
      fixedModeScheduleActionStartSettings:
          json['fixedModeScheduleActionStartSettings'] != null
              ? FixedModeScheduleActionStartSettings.fromJson(
                  json['fixedModeScheduleActionStartSettings']
                      as Map<String, dynamic>)
              : null,
      followModeScheduleActionStartSettings:
          json['followModeScheduleActionStartSettings'] != null
              ? FollowModeScheduleActionStartSettings.fromJson(
                  json['followModeScheduleActionStartSettings']
                      as Map<String, dynamic>)
              : null,
      immediateModeScheduleActionStartSettings:
          json['immediateModeScheduleActionStartSettings'] != null
              ? ImmediateModeScheduleActionStartSettings.fromJson(
                  json['immediateModeScheduleActionStartSettings']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fixedModeScheduleActionStartSettings =
        this.fixedModeScheduleActionStartSettings;
    final followModeScheduleActionStartSettings =
        this.followModeScheduleActionStartSettings;
    final immediateModeScheduleActionStartSettings =
        this.immediateModeScheduleActionStartSettings;
    return {
      if (fixedModeScheduleActionStartSettings != null)
        'fixedModeScheduleActionStartSettings':
            fixedModeScheduleActionStartSettings,
      if (followModeScheduleActionStartSettings != null)
        'followModeScheduleActionStartSettings':
            followModeScheduleActionStartSettings,
      if (immediateModeScheduleActionStartSettings != null)
        'immediateModeScheduleActionStartSettings':
            immediateModeScheduleActionStartSettings,
    };
  }
}

/// Scte20 Convert608 To708
enum Scte20Convert608To708 {
  disabled,
  upconvert,
}

extension on Scte20Convert608To708 {
  String toValue() {
    switch (this) {
      case Scte20Convert608To708.disabled:
        return 'DISABLED';
      case Scte20Convert608To708.upconvert:
        return 'UPCONVERT';
    }
  }
}

extension on String {
  Scte20Convert608To708 toScte20Convert608To708() {
    switch (this) {
      case 'DISABLED':
        return Scte20Convert608To708.disabled;
      case 'UPCONVERT':
        return Scte20Convert608To708.upconvert;
    }
    throw Exception('$this is not known in enum Scte20Convert608To708');
  }
}

/// Scte20 Plus Embedded Destination Settings
class Scte20PlusEmbeddedDestinationSettings {
  Scte20PlusEmbeddedDestinationSettings();

  factory Scte20PlusEmbeddedDestinationSettings.fromJson(
      Map<String, dynamic> _) {
    return Scte20PlusEmbeddedDestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Scte20 Source Settings
class Scte20SourceSettings {
  /// If upconvert, 608 data is both passed through via the "608 compatibility
  /// bytes" fields of the 708 wrapper as well as translated into 708. 708 data
  /// present in the source content will be discarded.
  final Scte20Convert608To708? convert608To708;

  /// Specifies the 608/708 channel number within the video track from which to
  /// extract captions. Unused for passthrough.
  final int? source608ChannelNumber;

  Scte20SourceSettings({
    this.convert608To708,
    this.source608ChannelNumber,
  });

  factory Scte20SourceSettings.fromJson(Map<String, dynamic> json) {
    return Scte20SourceSettings(
      convert608To708:
          (json['convert608To708'] as String?)?.toScte20Convert608To708(),
      source608ChannelNumber: json['source608ChannelNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final convert608To708 = this.convert608To708;
    final source608ChannelNumber = this.source608ChannelNumber;
    return {
      if (convert608To708 != null) 'convert608To708': convert608To708.toValue(),
      if (source608ChannelNumber != null)
        'source608ChannelNumber': source608ChannelNumber,
    };
  }
}

/// Scte27 Destination Settings
class Scte27DestinationSettings {
  Scte27DestinationSettings();

  factory Scte27DestinationSettings.fromJson(Map<String, dynamic> _) {
    return Scte27DestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Scte27 Ocr Language
enum Scte27OcrLanguage {
  deu,
  eng,
  fra,
  nld,
  por,
  spa,
}

extension on Scte27OcrLanguage {
  String toValue() {
    switch (this) {
      case Scte27OcrLanguage.deu:
        return 'DEU';
      case Scte27OcrLanguage.eng:
        return 'ENG';
      case Scte27OcrLanguage.fra:
        return 'FRA';
      case Scte27OcrLanguage.nld:
        return 'NLD';
      case Scte27OcrLanguage.por:
        return 'POR';
      case Scte27OcrLanguage.spa:
        return 'SPA';
    }
  }
}

extension on String {
  Scte27OcrLanguage toScte27OcrLanguage() {
    switch (this) {
      case 'DEU':
        return Scte27OcrLanguage.deu;
      case 'ENG':
        return Scte27OcrLanguage.eng;
      case 'FRA':
        return Scte27OcrLanguage.fra;
      case 'NLD':
        return Scte27OcrLanguage.nld;
      case 'POR':
        return Scte27OcrLanguage.por;
      case 'SPA':
        return Scte27OcrLanguage.spa;
    }
    throw Exception('$this is not known in enum Scte27OcrLanguage');
  }
}

/// Scte27 Source Settings
class Scte27SourceSettings {
  /// If you will configure a WebVTT caption description that references this
  /// caption selector, use this field to
  /// provide the language to consider when translating the image-based source to
  /// text.
  final Scte27OcrLanguage? ocrLanguage;

  /// The pid field is used in conjunction with the caption selector languageCode
  /// field as follows:
  /// - Specify PID and Language: Extracts captions from that PID; the language is
  /// "informational".
  /// - Specify PID and omit Language: Extracts the specified PID.
  /// - Omit PID and specify Language: Extracts the specified language, whichever
  /// PID that happens to be.
  /// - Omit PID and omit Language: Valid only if source is DVB-Sub that is being
  /// passed through; all languages will be passed through.
  final int? pid;

  Scte27SourceSettings({
    this.ocrLanguage,
    this.pid,
  });

  factory Scte27SourceSettings.fromJson(Map<String, dynamic> json) {
    return Scte27SourceSettings(
      ocrLanguage: (json['ocrLanguage'] as String?)?.toScte27OcrLanguage(),
      pid: json['pid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final ocrLanguage = this.ocrLanguage;
    final pid = this.pid;
    return {
      if (ocrLanguage != null) 'ocrLanguage': ocrLanguage.toValue(),
      if (pid != null) 'pid': pid,
    };
  }
}

/// Scte35 Apos No Regional Blackout Behavior
enum Scte35AposNoRegionalBlackoutBehavior {
  follow,
  ignore,
}

extension on Scte35AposNoRegionalBlackoutBehavior {
  String toValue() {
    switch (this) {
      case Scte35AposNoRegionalBlackoutBehavior.follow:
        return 'FOLLOW';
      case Scte35AposNoRegionalBlackoutBehavior.ignore:
        return 'IGNORE';
    }
  }
}

extension on String {
  Scte35AposNoRegionalBlackoutBehavior
      toScte35AposNoRegionalBlackoutBehavior() {
    switch (this) {
      case 'FOLLOW':
        return Scte35AposNoRegionalBlackoutBehavior.follow;
      case 'IGNORE':
        return Scte35AposNoRegionalBlackoutBehavior.ignore;
    }
    throw Exception(
        '$this is not known in enum Scte35AposNoRegionalBlackoutBehavior');
  }
}

/// Scte35 Apos Web Delivery Allowed Behavior
enum Scte35AposWebDeliveryAllowedBehavior {
  follow,
  ignore,
}

extension on Scte35AposWebDeliveryAllowedBehavior {
  String toValue() {
    switch (this) {
      case Scte35AposWebDeliveryAllowedBehavior.follow:
        return 'FOLLOW';
      case Scte35AposWebDeliveryAllowedBehavior.ignore:
        return 'IGNORE';
    }
  }
}

extension on String {
  Scte35AposWebDeliveryAllowedBehavior
      toScte35AposWebDeliveryAllowedBehavior() {
    switch (this) {
      case 'FOLLOW':
        return Scte35AposWebDeliveryAllowedBehavior.follow;
      case 'IGNORE':
        return Scte35AposWebDeliveryAllowedBehavior.ignore;
    }
    throw Exception(
        '$this is not known in enum Scte35AposWebDeliveryAllowedBehavior');
  }
}

/// Corresponds to the archive_allowed parameter. A value of ARCHIVE_NOT_ALLOWED
/// corresponds to 0 (false) in the SCTE-35 specification. If you include one of
/// the "restriction" flags then you must include all four of them.
enum Scte35ArchiveAllowedFlag {
  archiveNotAllowed,
  archiveAllowed,
}

extension on Scte35ArchiveAllowedFlag {
  String toValue() {
    switch (this) {
      case Scte35ArchiveAllowedFlag.archiveNotAllowed:
        return 'ARCHIVE_NOT_ALLOWED';
      case Scte35ArchiveAllowedFlag.archiveAllowed:
        return 'ARCHIVE_ALLOWED';
    }
  }
}

extension on String {
  Scte35ArchiveAllowedFlag toScte35ArchiveAllowedFlag() {
    switch (this) {
      case 'ARCHIVE_NOT_ALLOWED':
        return Scte35ArchiveAllowedFlag.archiveNotAllowed;
      case 'ARCHIVE_ALLOWED':
        return Scte35ArchiveAllowedFlag.archiveAllowed;
    }
    throw Exception('$this is not known in enum Scte35ArchiveAllowedFlag');
  }
}

/// Corresponds to SCTE-35 delivery_not_restricted_flag parameter. To declare
/// delivery restrictions, include this element and its four "restriction"
/// flags. To declare that there are no restrictions, omit this element.
class Scte35DeliveryRestrictions {
  /// Corresponds to SCTE-35 archive_allowed_flag.
  final Scte35ArchiveAllowedFlag archiveAllowedFlag;

  /// Corresponds to SCTE-35 device_restrictions parameter.
  final Scte35DeviceRestrictions deviceRestrictions;

  /// Corresponds to SCTE-35 no_regional_blackout_flag parameter.
  final Scte35NoRegionalBlackoutFlag noRegionalBlackoutFlag;

  /// Corresponds to SCTE-35 web_delivery_allowed_flag parameter.
  final Scte35WebDeliveryAllowedFlag webDeliveryAllowedFlag;

  Scte35DeliveryRestrictions({
    required this.archiveAllowedFlag,
    required this.deviceRestrictions,
    required this.noRegionalBlackoutFlag,
    required this.webDeliveryAllowedFlag,
  });

  factory Scte35DeliveryRestrictions.fromJson(Map<String, dynamic> json) {
    return Scte35DeliveryRestrictions(
      archiveAllowedFlag:
          (json['archiveAllowedFlag'] as String).toScte35ArchiveAllowedFlag(),
      deviceRestrictions:
          (json['deviceRestrictions'] as String).toScte35DeviceRestrictions(),
      noRegionalBlackoutFlag: (json['noRegionalBlackoutFlag'] as String)
          .toScte35NoRegionalBlackoutFlag(),
      webDeliveryAllowedFlag: (json['webDeliveryAllowedFlag'] as String)
          .toScte35WebDeliveryAllowedFlag(),
    );
  }

  Map<String, dynamic> toJson() {
    final archiveAllowedFlag = this.archiveAllowedFlag;
    final deviceRestrictions = this.deviceRestrictions;
    final noRegionalBlackoutFlag = this.noRegionalBlackoutFlag;
    final webDeliveryAllowedFlag = this.webDeliveryAllowedFlag;
    return {
      'archiveAllowedFlag': archiveAllowedFlag.toValue(),
      'deviceRestrictions': deviceRestrictions.toValue(),
      'noRegionalBlackoutFlag': noRegionalBlackoutFlag.toValue(),
      'webDeliveryAllowedFlag': webDeliveryAllowedFlag.toValue(),
    };
  }
}

/// Holds one set of SCTE-35 Descriptor Settings.
class Scte35Descriptor {
  /// SCTE-35 Descriptor Settings.
  final Scte35DescriptorSettings scte35DescriptorSettings;

  Scte35Descriptor({
    required this.scte35DescriptorSettings,
  });

  factory Scte35Descriptor.fromJson(Map<String, dynamic> json) {
    return Scte35Descriptor(
      scte35DescriptorSettings: Scte35DescriptorSettings.fromJson(
          json['scte35DescriptorSettings'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final scte35DescriptorSettings = this.scte35DescriptorSettings;
    return {
      'scte35DescriptorSettings': scte35DescriptorSettings,
    };
  }
}

/// SCTE-35 Descriptor settings.
class Scte35DescriptorSettings {
  /// SCTE-35 Segmentation Descriptor.
  final Scte35SegmentationDescriptor
      segmentationDescriptorScte35DescriptorSettings;

  Scte35DescriptorSettings({
    required this.segmentationDescriptorScte35DescriptorSettings,
  });

  factory Scte35DescriptorSettings.fromJson(Map<String, dynamic> json) {
    return Scte35DescriptorSettings(
      segmentationDescriptorScte35DescriptorSettings:
          Scte35SegmentationDescriptor.fromJson(
              json['segmentationDescriptorScte35DescriptorSettings']
                  as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final segmentationDescriptorScte35DescriptorSettings =
        this.segmentationDescriptorScte35DescriptorSettings;
    return {
      'segmentationDescriptorScte35DescriptorSettings':
          segmentationDescriptorScte35DescriptorSettings,
    };
  }
}

/// Corresponds to the device_restrictions parameter in a
/// segmentation_descriptor. If you include one of the "restriction" flags then
/// you must include all four of them.
enum Scte35DeviceRestrictions {
  none,
  restrictGroup0,
  restrictGroup1,
  restrictGroup2,
}

extension on Scte35DeviceRestrictions {
  String toValue() {
    switch (this) {
      case Scte35DeviceRestrictions.none:
        return 'NONE';
      case Scte35DeviceRestrictions.restrictGroup0:
        return 'RESTRICT_GROUP0';
      case Scte35DeviceRestrictions.restrictGroup1:
        return 'RESTRICT_GROUP1';
      case Scte35DeviceRestrictions.restrictGroup2:
        return 'RESTRICT_GROUP2';
    }
  }
}

extension on String {
  Scte35DeviceRestrictions toScte35DeviceRestrictions() {
    switch (this) {
      case 'NONE':
        return Scte35DeviceRestrictions.none;
      case 'RESTRICT_GROUP0':
        return Scte35DeviceRestrictions.restrictGroup0;
      case 'RESTRICT_GROUP1':
        return Scte35DeviceRestrictions.restrictGroup1;
      case 'RESTRICT_GROUP2':
        return Scte35DeviceRestrictions.restrictGroup2;
    }
    throw Exception('$this is not known in enum Scte35DeviceRestrictions');
  }
}

/// Corresponds to the no_regional_blackout_flag parameter. A value of
/// REGIONAL_BLACKOUT corresponds to 0 (false) in the SCTE-35 specification. If
/// you include one of the "restriction" flags then you must include all four of
/// them.
enum Scte35NoRegionalBlackoutFlag {
  regionalBlackout,
  noRegionalBlackout,
}

extension on Scte35NoRegionalBlackoutFlag {
  String toValue() {
    switch (this) {
      case Scte35NoRegionalBlackoutFlag.regionalBlackout:
        return 'REGIONAL_BLACKOUT';
      case Scte35NoRegionalBlackoutFlag.noRegionalBlackout:
        return 'NO_REGIONAL_BLACKOUT';
    }
  }
}

extension on String {
  Scte35NoRegionalBlackoutFlag toScte35NoRegionalBlackoutFlag() {
    switch (this) {
      case 'REGIONAL_BLACKOUT':
        return Scte35NoRegionalBlackoutFlag.regionalBlackout;
      case 'NO_REGIONAL_BLACKOUT':
        return Scte35NoRegionalBlackoutFlag.noRegionalBlackout;
    }
    throw Exception('$this is not known in enum Scte35NoRegionalBlackoutFlag');
  }
}

/// Settings for a SCTE-35 return_to_network message.
class Scte35ReturnToNetworkScheduleActionSettings {
  /// The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
  final int spliceEventId;

  Scte35ReturnToNetworkScheduleActionSettings({
    required this.spliceEventId,
  });

  factory Scte35ReturnToNetworkScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return Scte35ReturnToNetworkScheduleActionSettings(
      spliceEventId: json['spliceEventId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final spliceEventId = this.spliceEventId;
    return {
      'spliceEventId': spliceEventId,
    };
  }
}

/// Corresponds to SCTE-35 segmentation_event_cancel_indicator.
/// SEGMENTATION_EVENT_NOT_CANCELED corresponds to 0 in the SCTE-35
/// specification and indicates that this is an insertion request.
/// SEGMENTATION_EVENT_CANCELED corresponds to 1 in the SCTE-35 specification
/// and indicates that this is a cancelation request, in which case complete
/// this field and the existing event ID to cancel.
enum Scte35SegmentationCancelIndicator {
  segmentationEventNotCanceled,
  segmentationEventCanceled,
}

extension on Scte35SegmentationCancelIndicator {
  String toValue() {
    switch (this) {
      case Scte35SegmentationCancelIndicator.segmentationEventNotCanceled:
        return 'SEGMENTATION_EVENT_NOT_CANCELED';
      case Scte35SegmentationCancelIndicator.segmentationEventCanceled:
        return 'SEGMENTATION_EVENT_CANCELED';
    }
  }
}

extension on String {
  Scte35SegmentationCancelIndicator toScte35SegmentationCancelIndicator() {
    switch (this) {
      case 'SEGMENTATION_EVENT_NOT_CANCELED':
        return Scte35SegmentationCancelIndicator.segmentationEventNotCanceled;
      case 'SEGMENTATION_EVENT_CANCELED':
        return Scte35SegmentationCancelIndicator.segmentationEventCanceled;
    }
    throw Exception(
        '$this is not known in enum Scte35SegmentationCancelIndicator');
  }
}

/// Corresponds to SCTE-35 segmentation_descriptor.
class Scte35SegmentationDescriptor {
  /// Corresponds to SCTE-35 segmentation_event_cancel_indicator.
  final Scte35SegmentationCancelIndicator segmentationCancelIndicator;

  /// Corresponds to SCTE-35 segmentation_event_id.
  final int segmentationEventId;

  /// Holds the four SCTE-35 delivery restriction parameters.
  final Scte35DeliveryRestrictions? deliveryRestrictions;

  /// Corresponds to SCTE-35 segment_num. A value that is valid for the specified
  /// segmentation_type_id.
  final int? segmentNum;

  /// Corresponds to SCTE-35 segmentation_duration. Optional. The duration for the
  /// time_signal, in 90 KHz ticks. To convert seconds to ticks, multiple the
  /// seconds by 90,000. Enter time in 90 KHz clock ticks. If you do not enter a
  /// duration, the time_signal will continue until you insert a cancellation
  /// message.
  final int? segmentationDuration;

  /// Corresponds to SCTE-35 segmentation_type_id. One of the segmentation_type_id
  /// values listed in the SCTE-35 specification. On the console, enter the ID in
  /// decimal (for example, "52"). In the CLI, API, or an SDK, enter the ID in hex
  /// (for example, "0x34") or decimal (for example, "52").
  final int? segmentationTypeId;

  /// Corresponds to SCTE-35 segmentation_upid. Enter a string containing the
  /// hexadecimal representation of the characters that make up the SCTE-35
  /// segmentation_upid value. Must contain an even number of hex characters. Do
  /// not include spaces between each hex pair. For example, the ASCII "ADS
  /// Information" becomes hex "41445320496e666f726d6174696f6e.
  final String? segmentationUpid;

  /// Corresponds to SCTE-35 segmentation_upid_type. On the console, enter one of
  /// the types listed in the SCTE-35 specification, converted to a decimal. For
  /// example, "0x0C" hex from the specification is "12" in decimal. In the CLI,
  /// API, or an SDK, enter one of the types listed in the SCTE-35 specification,
  /// in either hex (for example, "0x0C" ) or in decimal (for example, "12").
  final int? segmentationUpidType;

  /// Corresponds to SCTE-35 segments_expected. A value that is valid for the
  /// specified segmentation_type_id.
  final int? segmentsExpected;

  /// Corresponds to SCTE-35 sub_segment_num. A value that is valid for the
  /// specified segmentation_type_id.
  final int? subSegmentNum;

  /// Corresponds to SCTE-35 sub_segments_expected. A value that is valid for the
  /// specified segmentation_type_id.
  final int? subSegmentsExpected;

  Scte35SegmentationDescriptor({
    required this.segmentationCancelIndicator,
    required this.segmentationEventId,
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

  factory Scte35SegmentationDescriptor.fromJson(Map<String, dynamic> json) {
    return Scte35SegmentationDescriptor(
      segmentationCancelIndicator:
          (json['segmentationCancelIndicator'] as String)
              .toScte35SegmentationCancelIndicator(),
      segmentationEventId: json['segmentationEventId'] as int,
      deliveryRestrictions: json['deliveryRestrictions'] != null
          ? Scte35DeliveryRestrictions.fromJson(
              json['deliveryRestrictions'] as Map<String, dynamic>)
          : null,
      segmentNum: json['segmentNum'] as int?,
      segmentationDuration: json['segmentationDuration'] as int?,
      segmentationTypeId: json['segmentationTypeId'] as int?,
      segmentationUpid: json['segmentationUpid'] as String?,
      segmentationUpidType: json['segmentationUpidType'] as int?,
      segmentsExpected: json['segmentsExpected'] as int?,
      subSegmentNum: json['subSegmentNum'] as int?,
      subSegmentsExpected: json['subSegmentsExpected'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final segmentationCancelIndicator = this.segmentationCancelIndicator;
    final segmentationEventId = this.segmentationEventId;
    final deliveryRestrictions = this.deliveryRestrictions;
    final segmentNum = this.segmentNum;
    final segmentationDuration = this.segmentationDuration;
    final segmentationTypeId = this.segmentationTypeId;
    final segmentationUpid = this.segmentationUpid;
    final segmentationUpidType = this.segmentationUpidType;
    final segmentsExpected = this.segmentsExpected;
    final subSegmentNum = this.subSegmentNum;
    final subSegmentsExpected = this.subSegmentsExpected;
    return {
      'segmentationCancelIndicator': segmentationCancelIndicator.toValue(),
      'segmentationEventId': segmentationEventId,
      if (deliveryRestrictions != null)
        'deliveryRestrictions': deliveryRestrictions,
      if (segmentNum != null) 'segmentNum': segmentNum,
      if (segmentationDuration != null)
        'segmentationDuration': segmentationDuration,
      if (segmentationTypeId != null) 'segmentationTypeId': segmentationTypeId,
      if (segmentationUpid != null) 'segmentationUpid': segmentationUpid,
      if (segmentationUpidType != null)
        'segmentationUpidType': segmentationUpidType,
      if (segmentsExpected != null) 'segmentsExpected': segmentsExpected,
      if (subSegmentNum != null) 'subSegmentNum': subSegmentNum,
      if (subSegmentsExpected != null)
        'subSegmentsExpected': subSegmentsExpected,
    };
  }
}

/// Scte35 Splice Insert
class Scte35SpliceInsert {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time. This only applies to embedded SCTE 104/35 messages and does not
  /// apply to OOB messages.
  final int? adAvailOffset;

  /// When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  final Scte35SpliceInsertNoRegionalBlackoutBehavior? noRegionalBlackoutFlag;

  /// When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  final Scte35SpliceInsertWebDeliveryAllowedBehavior? webDeliveryAllowedFlag;

  Scte35SpliceInsert({
    this.adAvailOffset,
    this.noRegionalBlackoutFlag,
    this.webDeliveryAllowedFlag,
  });

  factory Scte35SpliceInsert.fromJson(Map<String, dynamic> json) {
    return Scte35SpliceInsert(
      adAvailOffset: json['adAvailOffset'] as int?,
      noRegionalBlackoutFlag: (json['noRegionalBlackoutFlag'] as String?)
          ?.toScte35SpliceInsertNoRegionalBlackoutBehavior(),
      webDeliveryAllowedFlag: (json['webDeliveryAllowedFlag'] as String?)
          ?.toScte35SpliceInsertWebDeliveryAllowedBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final adAvailOffset = this.adAvailOffset;
    final noRegionalBlackoutFlag = this.noRegionalBlackoutFlag;
    final webDeliveryAllowedFlag = this.webDeliveryAllowedFlag;
    return {
      if (adAvailOffset != null) 'adAvailOffset': adAvailOffset,
      if (noRegionalBlackoutFlag != null)
        'noRegionalBlackoutFlag': noRegionalBlackoutFlag.toValue(),
      if (webDeliveryAllowedFlag != null)
        'webDeliveryAllowedFlag': webDeliveryAllowedFlag.toValue(),
    };
  }
}

/// Scte35 Splice Insert No Regional Blackout Behavior
enum Scte35SpliceInsertNoRegionalBlackoutBehavior {
  follow,
  ignore,
}

extension on Scte35SpliceInsertNoRegionalBlackoutBehavior {
  String toValue() {
    switch (this) {
      case Scte35SpliceInsertNoRegionalBlackoutBehavior.follow:
        return 'FOLLOW';
      case Scte35SpliceInsertNoRegionalBlackoutBehavior.ignore:
        return 'IGNORE';
    }
  }
}

extension on String {
  Scte35SpliceInsertNoRegionalBlackoutBehavior
      toScte35SpliceInsertNoRegionalBlackoutBehavior() {
    switch (this) {
      case 'FOLLOW':
        return Scte35SpliceInsertNoRegionalBlackoutBehavior.follow;
      case 'IGNORE':
        return Scte35SpliceInsertNoRegionalBlackoutBehavior.ignore;
    }
    throw Exception(
        '$this is not known in enum Scte35SpliceInsertNoRegionalBlackoutBehavior');
  }
}

/// Settings for a SCTE-35 splice_insert message.
class Scte35SpliceInsertScheduleActionSettings {
  /// The splice_event_id for the SCTE-35 splice_insert, as defined in SCTE-35.
  final int spliceEventId;

  /// Optional, the duration for the splice_insert, in 90 KHz ticks. To convert
  /// seconds to ticks, multiple the seconds by 90,000. If you enter a duration,
  /// there is an expectation that the downstream system can read the duration and
  /// cue in at that time. If you do not enter a duration, the splice_insert will
  /// continue indefinitely and there is an expectation that you will enter a
  /// return_to_network to end the splice_insert at the appropriate time.
  final int? duration;

  Scte35SpliceInsertScheduleActionSettings({
    required this.spliceEventId,
    this.duration,
  });

  factory Scte35SpliceInsertScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return Scte35SpliceInsertScheduleActionSettings(
      spliceEventId: json['spliceEventId'] as int,
      duration: json['duration'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final spliceEventId = this.spliceEventId;
    final duration = this.duration;
    return {
      'spliceEventId': spliceEventId,
      if (duration != null) 'duration': duration,
    };
  }
}

/// Scte35 Splice Insert Web Delivery Allowed Behavior
enum Scte35SpliceInsertWebDeliveryAllowedBehavior {
  follow,
  ignore,
}

extension on Scte35SpliceInsertWebDeliveryAllowedBehavior {
  String toValue() {
    switch (this) {
      case Scte35SpliceInsertWebDeliveryAllowedBehavior.follow:
        return 'FOLLOW';
      case Scte35SpliceInsertWebDeliveryAllowedBehavior.ignore:
        return 'IGNORE';
    }
  }
}

extension on String {
  Scte35SpliceInsertWebDeliveryAllowedBehavior
      toScte35SpliceInsertWebDeliveryAllowedBehavior() {
    switch (this) {
      case 'FOLLOW':
        return Scte35SpliceInsertWebDeliveryAllowedBehavior.follow;
      case 'IGNORE':
        return Scte35SpliceInsertWebDeliveryAllowedBehavior.ignore;
    }
    throw Exception(
        '$this is not known in enum Scte35SpliceInsertWebDeliveryAllowedBehavior');
  }
}

/// Scte35 Time Signal Apos
class Scte35TimeSignalApos {
  /// When specified, this offset (in milliseconds) is added to the input Ad Avail
  /// PTS time. This only applies to embedded SCTE 104/35 messages and does not
  /// apply to OOB messages.
  final int? adAvailOffset;

  /// When set to ignore, Segment Descriptors with noRegionalBlackoutFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  final Scte35AposNoRegionalBlackoutBehavior? noRegionalBlackoutFlag;

  /// When set to ignore, Segment Descriptors with webDeliveryAllowedFlag set to 0
  /// will no longer trigger blackouts or Ad Avail slates
  final Scte35AposWebDeliveryAllowedBehavior? webDeliveryAllowedFlag;

  Scte35TimeSignalApos({
    this.adAvailOffset,
    this.noRegionalBlackoutFlag,
    this.webDeliveryAllowedFlag,
  });

  factory Scte35TimeSignalApos.fromJson(Map<String, dynamic> json) {
    return Scte35TimeSignalApos(
      adAvailOffset: json['adAvailOffset'] as int?,
      noRegionalBlackoutFlag: (json['noRegionalBlackoutFlag'] as String?)
          ?.toScte35AposNoRegionalBlackoutBehavior(),
      webDeliveryAllowedFlag: (json['webDeliveryAllowedFlag'] as String?)
          ?.toScte35AposWebDeliveryAllowedBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final adAvailOffset = this.adAvailOffset;
    final noRegionalBlackoutFlag = this.noRegionalBlackoutFlag;
    final webDeliveryAllowedFlag = this.webDeliveryAllowedFlag;
    return {
      if (adAvailOffset != null) 'adAvailOffset': adAvailOffset,
      if (noRegionalBlackoutFlag != null)
        'noRegionalBlackoutFlag': noRegionalBlackoutFlag.toValue(),
      if (webDeliveryAllowedFlag != null)
        'webDeliveryAllowedFlag': webDeliveryAllowedFlag.toValue(),
    };
  }
}

/// Settings for a SCTE-35 time_signal.
class Scte35TimeSignalScheduleActionSettings {
  /// The list of SCTE-35 descriptors accompanying the SCTE-35 time_signal.
  final List<Scte35Descriptor> scte35Descriptors;

  Scte35TimeSignalScheduleActionSettings({
    required this.scte35Descriptors,
  });

  factory Scte35TimeSignalScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return Scte35TimeSignalScheduleActionSettings(
      scte35Descriptors: (json['scte35Descriptors'] as List)
          .whereNotNull()
          .map((e) => Scte35Descriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scte35Descriptors = this.scte35Descriptors;
    return {
      'scte35Descriptors': scte35Descriptors,
    };
  }
}

/// Corresponds to the web_delivery_allowed_flag parameter. A value of
/// WEB_DELIVERY_NOT_ALLOWED corresponds to 0 (false) in the SCTE-35
/// specification. If you include one of the "restriction" flags then you must
/// include all four of them.
enum Scte35WebDeliveryAllowedFlag {
  webDeliveryNotAllowed,
  webDeliveryAllowed,
}

extension on Scte35WebDeliveryAllowedFlag {
  String toValue() {
    switch (this) {
      case Scte35WebDeliveryAllowedFlag.webDeliveryNotAllowed:
        return 'WEB_DELIVERY_NOT_ALLOWED';
      case Scte35WebDeliveryAllowedFlag.webDeliveryAllowed:
        return 'WEB_DELIVERY_ALLOWED';
    }
  }
}

extension on String {
  Scte35WebDeliveryAllowedFlag toScte35WebDeliveryAllowedFlag() {
    switch (this) {
      case 'WEB_DELIVERY_NOT_ALLOWED':
        return Scte35WebDeliveryAllowedFlag.webDeliveryNotAllowed;
      case 'WEB_DELIVERY_ALLOWED':
        return Scte35WebDeliveryAllowedFlag.webDeliveryAllowed;
    }
    throw Exception('$this is not known in enum Scte35WebDeliveryAllowedFlag');
  }
}

/// Smooth Group Audio Only Timecode Control
enum SmoothGroupAudioOnlyTimecodeControl {
  passthrough,
  useConfiguredClock,
}

extension on SmoothGroupAudioOnlyTimecodeControl {
  String toValue() {
    switch (this) {
      case SmoothGroupAudioOnlyTimecodeControl.passthrough:
        return 'PASSTHROUGH';
      case SmoothGroupAudioOnlyTimecodeControl.useConfiguredClock:
        return 'USE_CONFIGURED_CLOCK';
    }
  }
}

extension on String {
  SmoothGroupAudioOnlyTimecodeControl toSmoothGroupAudioOnlyTimecodeControl() {
    switch (this) {
      case 'PASSTHROUGH':
        return SmoothGroupAudioOnlyTimecodeControl.passthrough;
      case 'USE_CONFIGURED_CLOCK':
        return SmoothGroupAudioOnlyTimecodeControl.useConfiguredClock;
    }
    throw Exception(
        '$this is not known in enum SmoothGroupAudioOnlyTimecodeControl');
  }
}

/// Smooth Group Certificate Mode
enum SmoothGroupCertificateMode {
  selfSigned,
  verifyAuthenticity,
}

extension on SmoothGroupCertificateMode {
  String toValue() {
    switch (this) {
      case SmoothGroupCertificateMode.selfSigned:
        return 'SELF_SIGNED';
      case SmoothGroupCertificateMode.verifyAuthenticity:
        return 'VERIFY_AUTHENTICITY';
    }
  }
}

extension on String {
  SmoothGroupCertificateMode toSmoothGroupCertificateMode() {
    switch (this) {
      case 'SELF_SIGNED':
        return SmoothGroupCertificateMode.selfSigned;
      case 'VERIFY_AUTHENTICITY':
        return SmoothGroupCertificateMode.verifyAuthenticity;
    }
    throw Exception('$this is not known in enum SmoothGroupCertificateMode');
  }
}

/// Smooth Group Event Id Mode
enum SmoothGroupEventIdMode {
  noEventId,
  useConfigured,
  useTimestamp,
}

extension on SmoothGroupEventIdMode {
  String toValue() {
    switch (this) {
      case SmoothGroupEventIdMode.noEventId:
        return 'NO_EVENT_ID';
      case SmoothGroupEventIdMode.useConfigured:
        return 'USE_CONFIGURED';
      case SmoothGroupEventIdMode.useTimestamp:
        return 'USE_TIMESTAMP';
    }
  }
}

extension on String {
  SmoothGroupEventIdMode toSmoothGroupEventIdMode() {
    switch (this) {
      case 'NO_EVENT_ID':
        return SmoothGroupEventIdMode.noEventId;
      case 'USE_CONFIGURED':
        return SmoothGroupEventIdMode.useConfigured;
      case 'USE_TIMESTAMP':
        return SmoothGroupEventIdMode.useTimestamp;
    }
    throw Exception('$this is not known in enum SmoothGroupEventIdMode');
  }
}

/// Smooth Group Event Stop Behavior
enum SmoothGroupEventStopBehavior {
  none,
  sendEos,
}

extension on SmoothGroupEventStopBehavior {
  String toValue() {
    switch (this) {
      case SmoothGroupEventStopBehavior.none:
        return 'NONE';
      case SmoothGroupEventStopBehavior.sendEos:
        return 'SEND_EOS';
    }
  }
}

extension on String {
  SmoothGroupEventStopBehavior toSmoothGroupEventStopBehavior() {
    switch (this) {
      case 'NONE':
        return SmoothGroupEventStopBehavior.none;
      case 'SEND_EOS':
        return SmoothGroupEventStopBehavior.sendEos;
    }
    throw Exception('$this is not known in enum SmoothGroupEventStopBehavior');
  }
}

/// Smooth Group Segmentation Mode
enum SmoothGroupSegmentationMode {
  useInputSegmentation,
  useSegmentDuration,
}

extension on SmoothGroupSegmentationMode {
  String toValue() {
    switch (this) {
      case SmoothGroupSegmentationMode.useInputSegmentation:
        return 'USE_INPUT_SEGMENTATION';
      case SmoothGroupSegmentationMode.useSegmentDuration:
        return 'USE_SEGMENT_DURATION';
    }
  }
}

extension on String {
  SmoothGroupSegmentationMode toSmoothGroupSegmentationMode() {
    switch (this) {
      case 'USE_INPUT_SEGMENTATION':
        return SmoothGroupSegmentationMode.useInputSegmentation;
      case 'USE_SEGMENT_DURATION':
        return SmoothGroupSegmentationMode.useSegmentDuration;
    }
    throw Exception('$this is not known in enum SmoothGroupSegmentationMode');
  }
}

/// Smooth Group Sparse Track Type
enum SmoothGroupSparseTrackType {
  none,
  scte_35,
  scte_35WithoutSegmentation,
}

extension on SmoothGroupSparseTrackType {
  String toValue() {
    switch (this) {
      case SmoothGroupSparseTrackType.none:
        return 'NONE';
      case SmoothGroupSparseTrackType.scte_35:
        return 'SCTE_35';
      case SmoothGroupSparseTrackType.scte_35WithoutSegmentation:
        return 'SCTE_35_WITHOUT_SEGMENTATION';
    }
  }
}

extension on String {
  SmoothGroupSparseTrackType toSmoothGroupSparseTrackType() {
    switch (this) {
      case 'NONE':
        return SmoothGroupSparseTrackType.none;
      case 'SCTE_35':
        return SmoothGroupSparseTrackType.scte_35;
      case 'SCTE_35_WITHOUT_SEGMENTATION':
        return SmoothGroupSparseTrackType.scte_35WithoutSegmentation;
    }
    throw Exception('$this is not known in enum SmoothGroupSparseTrackType');
  }
}

/// Smooth Group Stream Manifest Behavior
enum SmoothGroupStreamManifestBehavior {
  doNotSend,
  send,
}

extension on SmoothGroupStreamManifestBehavior {
  String toValue() {
    switch (this) {
      case SmoothGroupStreamManifestBehavior.doNotSend:
        return 'DO_NOT_SEND';
      case SmoothGroupStreamManifestBehavior.send:
        return 'SEND';
    }
  }
}

extension on String {
  SmoothGroupStreamManifestBehavior toSmoothGroupStreamManifestBehavior() {
    switch (this) {
      case 'DO_NOT_SEND':
        return SmoothGroupStreamManifestBehavior.doNotSend;
      case 'SEND':
        return SmoothGroupStreamManifestBehavior.send;
    }
    throw Exception(
        '$this is not known in enum SmoothGroupStreamManifestBehavior');
  }
}

/// Smooth Group Timestamp Offset Mode
enum SmoothGroupTimestampOffsetMode {
  useConfiguredOffset,
  useEventStartDate,
}

extension on SmoothGroupTimestampOffsetMode {
  String toValue() {
    switch (this) {
      case SmoothGroupTimestampOffsetMode.useConfiguredOffset:
        return 'USE_CONFIGURED_OFFSET';
      case SmoothGroupTimestampOffsetMode.useEventStartDate:
        return 'USE_EVENT_START_DATE';
    }
  }
}

extension on String {
  SmoothGroupTimestampOffsetMode toSmoothGroupTimestampOffsetMode() {
    switch (this) {
      case 'USE_CONFIGURED_OFFSET':
        return SmoothGroupTimestampOffsetMode.useConfiguredOffset;
      case 'USE_EVENT_START_DATE':
        return SmoothGroupTimestampOffsetMode.useEventStartDate;
    }
    throw Exception(
        '$this is not known in enum SmoothGroupTimestampOffsetMode');
  }
}

/// Smpte2038 Data Preference
enum Smpte2038DataPreference {
  ignore,
  prefer,
}

extension on Smpte2038DataPreference {
  String toValue() {
    switch (this) {
      case Smpte2038DataPreference.ignore:
        return 'IGNORE';
      case Smpte2038DataPreference.prefer:
        return 'PREFER';
    }
  }
}

extension on String {
  Smpte2038DataPreference toSmpte2038DataPreference() {
    switch (this) {
      case 'IGNORE':
        return Smpte2038DataPreference.ignore;
      case 'PREFER':
        return Smpte2038DataPreference.prefer;
    }
    throw Exception('$this is not known in enum Smpte2038DataPreference');
  }
}

/// Smpte Tt Destination Settings
class SmpteTtDestinationSettings {
  SmpteTtDestinationSettings();

  factory SmpteTtDestinationSettings.fromJson(Map<String, dynamic> _) {
    return SmpteTtDestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Standard Hls Settings
class StandardHlsSettings {
  final M3u8Settings m3u8Settings;

  /// List all the audio groups that are used with the video output stream. Input
  /// all the audio GROUP-IDs that are associated to the video, separate by ','.
  final String? audioRenditionSets;

  StandardHlsSettings({
    required this.m3u8Settings,
    this.audioRenditionSets,
  });

  factory StandardHlsSettings.fromJson(Map<String, dynamic> json) {
    return StandardHlsSettings(
      m3u8Settings:
          M3u8Settings.fromJson(json['m3u8Settings'] as Map<String, dynamic>),
      audioRenditionSets: json['audioRenditionSets'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final m3u8Settings = this.m3u8Settings;
    final audioRenditionSets = this.audioRenditionSets;
    return {
      'm3u8Settings': m3u8Settings,
      if (audioRenditionSets != null) 'audioRenditionSets': audioRenditionSets,
    };
  }
}

/// Placeholder documentation for StartChannelResponse
class StartChannelResponse {
  /// The unique arn of the channel.
  final String? arn;

  /// Specification of CDI inputs for this channel
  final CdiInputSpecification? cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final ChannelClass? channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  final List<OutputDestination>? destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint>? egressEndpoints;
  final EncoderSettings? encoderSettings;

  /// The unique id of the channel.
  final String? id;

  /// List of input attachments for channel.
  final List<InputAttachment>? inputAttachments;

  /// Specification of network and file inputs for this channel
  final InputSpecification? inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final LogLevel? logLevel;

  /// The name of the channel. (user-mutable)
  final String? name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail>? pipelineDetails;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  final String? roleArn;
  final ChannelState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Settings for VPC output
  final VpcOutputSettingsDescription? vpc;

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
    this.vpc,
  });

  factory StartChannelResponse.fromJson(Map<String, dynamic> json) {
    return StartChannelResponse(
      arn: json['arn'] as String?,
      cdiInputSpecification: json['cdiInputSpecification'] != null
          ? CdiInputSpecification.fromJson(
              json['cdiInputSpecification'] as Map<String, dynamic>)
          : null,
      channelClass: (json['channelClass'] as String?)?.toChannelClass(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      encoderSettings: json['encoderSettings'] != null
          ? EncoderSettings.fromJson(
              json['encoderSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      inputAttachments: (json['inputAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => InputAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSpecification: json['inputSpecification'] != null
          ? InputSpecification.fromJson(
              json['inputSpecification'] as Map<String, dynamic>)
          : null,
      logLevel: (json['logLevel'] as String?)?.toLogLevel(),
      name: json['name'] as String?,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      roleArn: json['roleArn'] as String?,
      state: (json['state'] as String?)?.toChannelState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpc: json['vpc'] != null
          ? VpcOutputSettingsDescription.fromJson(
              json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cdiInputSpecification = this.cdiInputSpecification;
    final channelClass = this.channelClass;
    final destinations = this.destinations;
    final egressEndpoints = this.egressEndpoints;
    final encoderSettings = this.encoderSettings;
    final id = this.id;
    final inputAttachments = this.inputAttachments;
    final inputSpecification = this.inputSpecification;
    final logLevel = this.logLevel;
    final name = this.name;
    final pipelineDetails = this.pipelineDetails;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final roleArn = this.roleArn;
    final state = this.state;
    final tags = this.tags;
    final vpc = this.vpc;
    return {
      if (arn != null) 'arn': arn,
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (destinations != null) 'destinations': destinations,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (encoderSettings != null) 'encoderSettings': encoderSettings,
      if (id != null) 'id': id,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (roleArn != null) 'roleArn': roleArn,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Placeholder documentation for StartMultiplexResponse
class StartMultiplexResponse {
  /// The unique arn of the multiplex.
  final String? arn;

  /// A list of availability zones for the multiplex.
  final List<String>? availabilityZones;

  /// A list of the multiplex output destinations.
  final List<MultiplexOutputDestination>? destinations;

  /// The unique id of the multiplex.
  final String? id;

  /// Configuration for a multiplex event.
  final MultiplexSettings? multiplexSettings;

  /// The name of the multiplex.
  final String? name;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The number of programs in the multiplex.
  final int? programCount;

  /// The current state of the multiplex.
  final MultiplexState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

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

  factory StartMultiplexResponse.fromJson(Map<String, dynamic> json) {
    return StartMultiplexResponse(
      arn: json['arn'] as String?,
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      multiplexSettings: json['multiplexSettings'] != null
          ? MultiplexSettings.fromJson(
              json['multiplexSettings'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      programCount: json['programCount'] as int?,
      state: (json['state'] as String?)?.toMultiplexState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZones = this.availabilityZones;
    final destinations = this.destinations;
    final id = this.id;
    final multiplexSettings = this.multiplexSettings;
    final name = this.name;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final programCount = this.programCount;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (destinations != null) 'destinations': destinations,
      if (id != null) 'id': id,
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (name != null) 'name': name,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (programCount != null) 'programCount': programCount,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Settings to identify the start of the clip.
class StartTimecode {
  /// The timecode for the frame where you want to start the clip. Optional; if
  /// not specified, the clip starts at first frame in the file. Enter the
  /// timecode as HH:MM:SS:FF or HH:MM:SS;FF.
  final String? timecode;

  StartTimecode({
    this.timecode,
  });

  factory StartTimecode.fromJson(Map<String, dynamic> json) {
    return StartTimecode(
      timecode: json['timecode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final timecode = this.timecode;
    return {
      if (timecode != null) 'timecode': timecode,
    };
  }
}

/// Settings for the action to activate a static image.
class StaticImageActivateScheduleActionSettings {
  /// The location and filename of the image file to overlay on the video. The
  /// file must be a 32-bit BMP, PNG, or TGA file, and must not be larger (in
  /// pixels) than the input video.
  final InputLocation image;

  /// The duration in milliseconds for the image to remain on the video. If
  /// omitted or set to 0 the duration is unlimited and the image will remain
  /// until it is explicitly deactivated.
  final int? duration;

  /// The time in milliseconds for the image to fade in. The fade-in starts at the
  /// start time of the overlay. Default is 0 (no fade-in).
  final int? fadeIn;

  /// Applies only if a duration is specified. The time in milliseconds for the
  /// image to fade out. The fade-out starts when the duration time is hit, so it
  /// effectively extends the duration. Default is 0 (no fade-out).
  final int? fadeOut;

  /// The height of the image when inserted into the video, in pixels. The overlay
  /// will be scaled up or down to the specified height. Leave blank to use the
  /// native height of the overlay.
  final int? height;

  /// Placement of the left edge of the overlay relative to the left edge of the
  /// video frame, in pixels. 0 (the default) is the left edge of the frame. If
  /// the placement causes the overlay to extend beyond the right edge of the
  /// underlying video, then the overlay is cropped on the right.
  final int? imageX;

  /// Placement of the top edge of the overlay relative to the top edge of the
  /// video frame, in pixels. 0 (the default) is the top edge of the frame. If the
  /// placement causes the overlay to extend beyond the bottom edge of the
  /// underlying video, then the overlay is cropped on the bottom.
  final int? imageY;

  /// The number of the layer, 0 to 7. There are 8 layers that can be overlaid on
  /// the video, each layer with a different image. The layers are in Z order,
  /// which means that overlays with higher values of layer are inserted on top of
  /// overlays with lower values of layer. Default is 0.
  final int? layer;

  /// Opacity of image where 0 is transparent and 100 is fully opaque. Default is
  /// 100.
  final int? opacity;

  /// The width of the image when inserted into the video, in pixels. The overlay
  /// will be scaled up or down to the specified width. Leave blank to use the
  /// native width of the overlay.
  final int? width;

  StaticImageActivateScheduleActionSettings({
    required this.image,
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
      Map<String, dynamic> json) {
    return StaticImageActivateScheduleActionSettings(
      image: InputLocation.fromJson(json['image'] as Map<String, dynamic>),
      duration: json['duration'] as int?,
      fadeIn: json['fadeIn'] as int?,
      fadeOut: json['fadeOut'] as int?,
      height: json['height'] as int?,
      imageX: json['imageX'] as int?,
      imageY: json['imageY'] as int?,
      layer: json['layer'] as int?,
      opacity: json['opacity'] as int?,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final duration = this.duration;
    final fadeIn = this.fadeIn;
    final fadeOut = this.fadeOut;
    final height = this.height;
    final imageX = this.imageX;
    final imageY = this.imageY;
    final layer = this.layer;
    final opacity = this.opacity;
    final width = this.width;
    return {
      'image': image,
      if (duration != null) 'duration': duration,
      if (fadeIn != null) 'fadeIn': fadeIn,
      if (fadeOut != null) 'fadeOut': fadeOut,
      if (height != null) 'height': height,
      if (imageX != null) 'imageX': imageX,
      if (imageY != null) 'imageY': imageY,
      if (layer != null) 'layer': layer,
      if (opacity != null) 'opacity': opacity,
      if (width != null) 'width': width,
    };
  }
}

/// Settings for the action to deactivate the image in a specific layer.
class StaticImageDeactivateScheduleActionSettings {
  /// The time in milliseconds for the image to fade out. Default is 0 (no
  /// fade-out).
  final int? fadeOut;

  /// The image overlay layer to deactivate, 0 to 7. Default is 0.
  final int? layer;

  StaticImageDeactivateScheduleActionSettings({
    this.fadeOut,
    this.layer,
  });

  factory StaticImageDeactivateScheduleActionSettings.fromJson(
      Map<String, dynamic> json) {
    return StaticImageDeactivateScheduleActionSettings(
      fadeOut: json['fadeOut'] as int?,
      layer: json['layer'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final fadeOut = this.fadeOut;
    final layer = this.layer;
    return {
      if (fadeOut != null) 'fadeOut': fadeOut,
      if (layer != null) 'layer': layer,
    };
  }
}

/// Static Key Settings
class StaticKeySettings {
  /// Static key value as a 32 character hexadecimal string.
  final String staticKeyValue;

  /// The URL of the license server used for protecting content.
  final InputLocation? keyProviderServer;

  StaticKeySettings({
    required this.staticKeyValue,
    this.keyProviderServer,
  });

  factory StaticKeySettings.fromJson(Map<String, dynamic> json) {
    return StaticKeySettings(
      staticKeyValue: json['staticKeyValue'] as String,
      keyProviderServer: json['keyProviderServer'] != null
          ? InputLocation.fromJson(
              json['keyProviderServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final staticKeyValue = this.staticKeyValue;
    final keyProviderServer = this.keyProviderServer;
    return {
      'staticKeyValue': staticKeyValue,
      if (keyProviderServer != null) 'keyProviderServer': keyProviderServer,
    };
  }
}

/// Placeholder documentation for StopChannelResponse
class StopChannelResponse {
  /// The unique arn of the channel.
  final String? arn;

  /// Specification of CDI inputs for this channel
  final CdiInputSpecification? cdiInputSpecification;

  /// The class for this channel. STANDARD for a channel with two pipelines or
  /// SINGLE_PIPELINE for a channel with one pipeline.
  final ChannelClass? channelClass;

  /// A list of destinations of the channel. For UDP outputs, there is one
  /// destination per output. For other types (HLS, for example), there is
  /// one destination per packager.
  final List<OutputDestination>? destinations;

  /// The endpoints where outgoing connections initiate from
  final List<ChannelEgressEndpoint>? egressEndpoints;
  final EncoderSettings? encoderSettings;

  /// The unique id of the channel.
  final String? id;

  /// List of input attachments for channel.
  final List<InputAttachment>? inputAttachments;

  /// Specification of network and file inputs for this channel
  final InputSpecification? inputSpecification;

  /// The log level being written to CloudWatch Logs.
  final LogLevel? logLevel;

  /// The name of the channel. (user-mutable)
  final String? name;

  /// Runtime details for the pipelines of a running channel.
  final List<PipelineDetail>? pipelineDetails;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The Amazon Resource Name (ARN) of the role assumed when running the Channel.
  final String? roleArn;
  final ChannelState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

  /// Settings for VPC output
  final VpcOutputSettingsDescription? vpc;

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
    this.vpc,
  });

  factory StopChannelResponse.fromJson(Map<String, dynamic> json) {
    return StopChannelResponse(
      arn: json['arn'] as String?,
      cdiInputSpecification: json['cdiInputSpecification'] != null
          ? CdiInputSpecification.fromJson(
              json['cdiInputSpecification'] as Map<String, dynamic>)
          : null,
      channelClass: (json['channelClass'] as String?)?.toChannelClass(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) => OutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      egressEndpoints: (json['egressEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelEgressEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      encoderSettings: json['encoderSettings'] != null
          ? EncoderSettings.fromJson(
              json['encoderSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      inputAttachments: (json['inputAttachments'] as List?)
          ?.whereNotNull()
          .map((e) => InputAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      inputSpecification: json['inputSpecification'] != null
          ? InputSpecification.fromJson(
              json['inputSpecification'] as Map<String, dynamic>)
          : null,
      logLevel: (json['logLevel'] as String?)?.toLogLevel(),
      name: json['name'] as String?,
      pipelineDetails: (json['pipelineDetails'] as List?)
          ?.whereNotNull()
          .map((e) => PipelineDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      roleArn: json['roleArn'] as String?,
      state: (json['state'] as String?)?.toChannelState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpc: json['vpc'] != null
          ? VpcOutputSettingsDescription.fromJson(
              json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final cdiInputSpecification = this.cdiInputSpecification;
    final channelClass = this.channelClass;
    final destinations = this.destinations;
    final egressEndpoints = this.egressEndpoints;
    final encoderSettings = this.encoderSettings;
    final id = this.id;
    final inputAttachments = this.inputAttachments;
    final inputSpecification = this.inputSpecification;
    final logLevel = this.logLevel;
    final name = this.name;
    final pipelineDetails = this.pipelineDetails;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final roleArn = this.roleArn;
    final state = this.state;
    final tags = this.tags;
    final vpc = this.vpc;
    return {
      if (arn != null) 'arn': arn,
      if (cdiInputSpecification != null)
        'cdiInputSpecification': cdiInputSpecification,
      if (channelClass != null) 'channelClass': channelClass.toValue(),
      if (destinations != null) 'destinations': destinations,
      if (egressEndpoints != null) 'egressEndpoints': egressEndpoints,
      if (encoderSettings != null) 'encoderSettings': encoderSettings,
      if (id != null) 'id': id,
      if (inputAttachments != null) 'inputAttachments': inputAttachments,
      if (inputSpecification != null) 'inputSpecification': inputSpecification,
      if (logLevel != null) 'logLevel': logLevel.toValue(),
      if (name != null) 'name': name,
      if (pipelineDetails != null) 'pipelineDetails': pipelineDetails,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (roleArn != null) 'roleArn': roleArn,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Placeholder documentation for StopMultiplexResponse
class StopMultiplexResponse {
  /// The unique arn of the multiplex.
  final String? arn;

  /// A list of availability zones for the multiplex.
  final List<String>? availabilityZones;

  /// A list of the multiplex output destinations.
  final List<MultiplexOutputDestination>? destinations;

  /// The unique id of the multiplex.
  final String? id;

  /// Configuration for a multiplex event.
  final MultiplexSettings? multiplexSettings;

  /// The name of the multiplex.
  final String? name;

  /// The number of currently healthy pipelines.
  final int? pipelinesRunningCount;

  /// The number of programs in the multiplex.
  final int? programCount;

  /// The current state of the multiplex.
  final MultiplexState? state;

  /// A collection of key-value pairs.
  final Map<String, String>? tags;

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

  factory StopMultiplexResponse.fromJson(Map<String, dynamic> json) {
    return StopMultiplexResponse(
      arn: json['arn'] as String?,
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      destinations: (json['destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MultiplexOutputDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String?,
      multiplexSettings: json['multiplexSettings'] != null
          ? MultiplexSettings.fromJson(
              json['multiplexSettings'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      pipelinesRunningCount: json['pipelinesRunningCount'] as int?,
      programCount: json['programCount'] as int?,
      state: (json['state'] as String?)?.toMultiplexState(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final availabilityZones = this.availabilityZones;
    final destinations = this.destinations;
    final id = this.id;
    final multiplexSettings = this.multiplexSettings;
    final name = this.name;
    final pipelinesRunningCount = this.pipelinesRunningCount;
    final programCount = this.programCount;
    final state = this.state;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (destinations != null) 'destinations': destinations,
      if (id != null) 'id': id,
      if (multiplexSettings != null) 'multiplexSettings': multiplexSettings,
      if (name != null) 'name': name,
      if (pipelinesRunningCount != null)
        'pipelinesRunningCount': pipelinesRunningCount,
      if (programCount != null) 'programCount': programCount,
      if (state != null) 'state': state.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Settings to identify the end of the clip.
class StopTimecode {
  /// If you specify a StopTimecode in an input (in order to clip the file), you
  /// can specify if you want the clip to exclude (the default) or include the
  /// frame specified by the timecode.
  final LastFrameClippingBehavior? lastFrameClippingBehavior;

  /// The timecode for the frame where you want to stop the clip. Optional; if not
  /// specified, the clip continues to the end of the file. Enter the timecode as
  /// HH:MM:SS:FF or HH:MM:SS;FF.
  final String? timecode;

  StopTimecode({
    this.lastFrameClippingBehavior,
    this.timecode,
  });

  factory StopTimecode.fromJson(Map<String, dynamic> json) {
    return StopTimecode(
      lastFrameClippingBehavior: (json['lastFrameClippingBehavior'] as String?)
          ?.toLastFrameClippingBehavior(),
      timecode: json['timecode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastFrameClippingBehavior = this.lastFrameClippingBehavior;
    final timecode = this.timecode;
    return {
      if (lastFrameClippingBehavior != null)
        'lastFrameClippingBehavior': lastFrameClippingBehavior.toValue(),
      if (timecode != null) 'timecode': timecode,
    };
  }
}

/// Teletext Destination Settings
class TeletextDestinationSettings {
  TeletextDestinationSettings();

  factory TeletextDestinationSettings.fromJson(Map<String, dynamic> _) {
    return TeletextDestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Teletext Source Settings
class TeletextSourceSettings {
  /// Optionally defines a region where TTML style captions will be displayed
  final CaptionRectangle? outputRectangle;

  /// Specifies the teletext page number within the data stream from which to
  /// extract captions. Range of 0x100 (256) to 0x8FF (2303). Unused for
  /// passthrough. Should be specified as a hexadecimal string with no "0x"
  /// prefix.
  final String? pageNumber;

  TeletextSourceSettings({
    this.outputRectangle,
    this.pageNumber,
  });

  factory TeletextSourceSettings.fromJson(Map<String, dynamic> json) {
    return TeletextSourceSettings(
      outputRectangle: json['outputRectangle'] != null
          ? CaptionRectangle.fromJson(
              json['outputRectangle'] as Map<String, dynamic>)
          : null,
      pageNumber: json['pageNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final outputRectangle = this.outputRectangle;
    final pageNumber = this.pageNumber;
    return {
      if (outputRectangle != null) 'outputRectangle': outputRectangle,
      if (pageNumber != null) 'pageNumber': pageNumber,
    };
  }
}

/// Temporal Filter Post Filter Sharpening
enum TemporalFilterPostFilterSharpening {
  auto,
  disabled,
  enabled,
}

extension on TemporalFilterPostFilterSharpening {
  String toValue() {
    switch (this) {
      case TemporalFilterPostFilterSharpening.auto:
        return 'AUTO';
      case TemporalFilterPostFilterSharpening.disabled:
        return 'DISABLED';
      case TemporalFilterPostFilterSharpening.enabled:
        return 'ENABLED';
    }
  }
}

extension on String {
  TemporalFilterPostFilterSharpening toTemporalFilterPostFilterSharpening() {
    switch (this) {
      case 'AUTO':
        return TemporalFilterPostFilterSharpening.auto;
      case 'DISABLED':
        return TemporalFilterPostFilterSharpening.disabled;
      case 'ENABLED':
        return TemporalFilterPostFilterSharpening.enabled;
    }
    throw Exception(
        '$this is not known in enum TemporalFilterPostFilterSharpening');
  }
}

/// Temporal Filter Settings
class TemporalFilterSettings {
  /// If you enable this filter, the results are the following:
  /// - If the source content is noisy (it contains excessive digital artifacts),
  /// the filter cleans up the source.
  /// - If the source content is already clean, the filter tends to decrease the
  /// bitrate, especially when the rate control mode is QVBR.
  final TemporalFilterPostFilterSharpening? postFilterSharpening;

  /// Choose a filter strength. We recommend a strength of 1 or 2. A higher
  /// strength might take out good information, resulting in an image that is
  /// overly soft.
  final TemporalFilterStrength? strength;

  TemporalFilterSettings({
    this.postFilterSharpening,
    this.strength,
  });

  factory TemporalFilterSettings.fromJson(Map<String, dynamic> json) {
    return TemporalFilterSettings(
      postFilterSharpening: (json['postFilterSharpening'] as String?)
          ?.toTemporalFilterPostFilterSharpening(),
      strength: (json['strength'] as String?)?.toTemporalFilterStrength(),
    );
  }

  Map<String, dynamic> toJson() {
    final postFilterSharpening = this.postFilterSharpening;
    final strength = this.strength;
    return {
      if (postFilterSharpening != null)
        'postFilterSharpening': postFilterSharpening.toValue(),
      if (strength != null) 'strength': strength.toValue(),
    };
  }
}

/// Temporal Filter Strength
enum TemporalFilterStrength {
  auto,
  strength_1,
  strength_2,
  strength_3,
  strength_4,
  strength_5,
  strength_6,
  strength_7,
  strength_8,
  strength_9,
  strength_10,
  strength_11,
  strength_12,
  strength_13,
  strength_14,
  strength_15,
  strength_16,
}

extension on TemporalFilterStrength {
  String toValue() {
    switch (this) {
      case TemporalFilterStrength.auto:
        return 'AUTO';
      case TemporalFilterStrength.strength_1:
        return 'STRENGTH_1';
      case TemporalFilterStrength.strength_2:
        return 'STRENGTH_2';
      case TemporalFilterStrength.strength_3:
        return 'STRENGTH_3';
      case TemporalFilterStrength.strength_4:
        return 'STRENGTH_4';
      case TemporalFilterStrength.strength_5:
        return 'STRENGTH_5';
      case TemporalFilterStrength.strength_6:
        return 'STRENGTH_6';
      case TemporalFilterStrength.strength_7:
        return 'STRENGTH_7';
      case TemporalFilterStrength.strength_8:
        return 'STRENGTH_8';
      case TemporalFilterStrength.strength_9:
        return 'STRENGTH_9';
      case TemporalFilterStrength.strength_10:
        return 'STRENGTH_10';
      case TemporalFilterStrength.strength_11:
        return 'STRENGTH_11';
      case TemporalFilterStrength.strength_12:
        return 'STRENGTH_12';
      case TemporalFilterStrength.strength_13:
        return 'STRENGTH_13';
      case TemporalFilterStrength.strength_14:
        return 'STRENGTH_14';
      case TemporalFilterStrength.strength_15:
        return 'STRENGTH_15';
      case TemporalFilterStrength.strength_16:
        return 'STRENGTH_16';
    }
  }
}

extension on String {
  TemporalFilterStrength toTemporalFilterStrength() {
    switch (this) {
      case 'AUTO':
        return TemporalFilterStrength.auto;
      case 'STRENGTH_1':
        return TemporalFilterStrength.strength_1;
      case 'STRENGTH_2':
        return TemporalFilterStrength.strength_2;
      case 'STRENGTH_3':
        return TemporalFilterStrength.strength_3;
      case 'STRENGTH_4':
        return TemporalFilterStrength.strength_4;
      case 'STRENGTH_5':
        return TemporalFilterStrength.strength_5;
      case 'STRENGTH_6':
        return TemporalFilterStrength.strength_6;
      case 'STRENGTH_7':
        return TemporalFilterStrength.strength_7;
      case 'STRENGTH_8':
        return TemporalFilterStrength.strength_8;
      case 'STRENGTH_9':
        return TemporalFilterStrength.strength_9;
      case 'STRENGTH_10':
        return TemporalFilterStrength.strength_10;
      case 'STRENGTH_11':
        return TemporalFilterStrength.strength_11;
      case 'STRENGTH_12':
        return TemporalFilterStrength.strength_12;
      case 'STRENGTH_13':
        return TemporalFilterStrength.strength_13;
      case 'STRENGTH_14':
        return TemporalFilterStrength.strength_14;
      case 'STRENGTH_15':
        return TemporalFilterStrength.strength_15;
      case 'STRENGTH_16':
        return TemporalFilterStrength.strength_16;
    }
    throw Exception('$this is not known in enum TemporalFilterStrength');
  }
}

/// Timecode Config
class TimecodeConfig {
  /// Identifies the source for the timecode that will be associated with the
  /// events outputs.
  /// -Embedded (embedded): Initialize the output timecode with timecode from the
  /// the source.  If no embedded timecode is detected in the source, the system
  /// falls back to using "Start at 0" (zerobased).
  /// -System Clock (systemclock): Use the UTC time.
  /// -Start at 0 (zerobased): The time of the first frame of the event will be
  /// 00:00:00:00.
  final TimecodeConfigSource source;

  /// Threshold in frames beyond which output timecode is resynchronized to the
  /// input timecode. Discrepancies below this threshold are permitted to avoid
  /// unnecessary discontinuities in the output timecode. No timecode sync when
  /// this is not specified.
  final int? syncThreshold;

  TimecodeConfig({
    required this.source,
    this.syncThreshold,
  });

  factory TimecodeConfig.fromJson(Map<String, dynamic> json) {
    return TimecodeConfig(
      source: (json['source'] as String).toTimecodeConfigSource(),
      syncThreshold: json['syncThreshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final syncThreshold = this.syncThreshold;
    return {
      'source': source.toValue(),
      if (syncThreshold != null) 'syncThreshold': syncThreshold,
    };
  }
}

/// Timecode Config Source
enum TimecodeConfigSource {
  embedded,
  systemclock,
  zerobased,
}

extension on TimecodeConfigSource {
  String toValue() {
    switch (this) {
      case TimecodeConfigSource.embedded:
        return 'EMBEDDED';
      case TimecodeConfigSource.systemclock:
        return 'SYSTEMCLOCK';
      case TimecodeConfigSource.zerobased:
        return 'ZEROBASED';
    }
  }
}

extension on String {
  TimecodeConfigSource toTimecodeConfigSource() {
    switch (this) {
      case 'EMBEDDED':
        return TimecodeConfigSource.embedded;
      case 'SYSTEMCLOCK':
        return TimecodeConfigSource.systemclock;
      case 'ZEROBASED':
        return TimecodeConfigSource.zerobased;
    }
    throw Exception('$this is not known in enum TimecodeConfigSource');
  }
}

/// Placeholder documentation for TransferInputDeviceResponse
class TransferInputDeviceResponse {
  TransferInputDeviceResponse();

  factory TransferInputDeviceResponse.fromJson(Map<String, dynamic> _) {
    return TransferInputDeviceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about the input device that is being transferred.
class TransferringInputDeviceSummary {
  /// The unique ID of the input device.
  final String? id;

  /// The optional message that the sender has attached to the transfer.
  final String? message;

  /// The AWS account ID for the recipient of the input device transfer.
  final String? targetCustomerId;

  /// The type (direction) of the input device transfer.
  final InputDeviceTransferType? transferType;

  TransferringInputDeviceSummary({
    this.id,
    this.message,
    this.targetCustomerId,
    this.transferType,
  });

  factory TransferringInputDeviceSummary.fromJson(Map<String, dynamic> json) {
    return TransferringInputDeviceSummary(
      id: json['id'] as String?,
      message: json['message'] as String?,
      targetCustomerId: json['targetCustomerId'] as String?,
      transferType:
          (json['transferType'] as String?)?.toInputDeviceTransferType(),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final message = this.message;
    final targetCustomerId = this.targetCustomerId;
    final transferType = this.transferType;
    return {
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (targetCustomerId != null) 'targetCustomerId': targetCustomerId,
      if (transferType != null) 'transferType': transferType.toValue(),
    };
  }
}

/// Ttml Destination Settings
class TtmlDestinationSettings {
  /// When set to passthrough, passes through style and position information from
  /// a TTML-like input source (TTML, SMPTE-TT, CFF-TT) to the CFF-TT output or
  /// TTML output.
  final TtmlDestinationStyleControl? styleControl;

  TtmlDestinationSettings({
    this.styleControl,
  });

  factory TtmlDestinationSettings.fromJson(Map<String, dynamic> json) {
    return TtmlDestinationSettings(
      styleControl:
          (json['styleControl'] as String?)?.toTtmlDestinationStyleControl(),
    );
  }

  Map<String, dynamic> toJson() {
    final styleControl = this.styleControl;
    return {
      if (styleControl != null) 'styleControl': styleControl.toValue(),
    };
  }
}

/// Ttml Destination Style Control
enum TtmlDestinationStyleControl {
  passthrough,
  useConfigured,
}

extension on TtmlDestinationStyleControl {
  String toValue() {
    switch (this) {
      case TtmlDestinationStyleControl.passthrough:
        return 'PASSTHROUGH';
      case TtmlDestinationStyleControl.useConfigured:
        return 'USE_CONFIGURED';
    }
  }
}

extension on String {
  TtmlDestinationStyleControl toTtmlDestinationStyleControl() {
    switch (this) {
      case 'PASSTHROUGH':
        return TtmlDestinationStyleControl.passthrough;
      case 'USE_CONFIGURED':
        return TtmlDestinationStyleControl.useConfigured;
    }
    throw Exception('$this is not known in enum TtmlDestinationStyleControl');
  }
}

/// Udp Container Settings
class UdpContainerSettings {
  final M2tsSettings? m2tsSettings;

  UdpContainerSettings({
    this.m2tsSettings,
  });

  factory UdpContainerSettings.fromJson(Map<String, dynamic> json) {
    return UdpContainerSettings(
      m2tsSettings: json['m2tsSettings'] != null
          ? M2tsSettings.fromJson(json['m2tsSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final m2tsSettings = this.m2tsSettings;
    return {
      if (m2tsSettings != null) 'm2tsSettings': m2tsSettings,
    };
  }
}

/// Udp Group Settings
class UdpGroupSettings {
  /// Specifies behavior of last resort when input video is lost, and no more
  /// backup inputs are available. When dropTs is selected the entire transport
  /// stream will stop being emitted.  When dropProgram is selected the program
  /// can be dropped from the transport stream (and replaced with null packets to
  /// meet the TS bitrate requirement).  Or, when emitProgram is chosen the
  /// transport stream will continue to be produced normally with repeat frames,
  /// black frames, or slate frames substituted for the absent input video.
  final InputLossActionForUdpOut? inputLossAction;

  /// Indicates ID3 frame that has the timecode.
  final UdpTimedMetadataId3Frame? timedMetadataId3Frame;

  /// Timed Metadata interval in seconds.
  final int? timedMetadataId3Period;

  UdpGroupSettings({
    this.inputLossAction,
    this.timedMetadataId3Frame,
    this.timedMetadataId3Period,
  });

  factory UdpGroupSettings.fromJson(Map<String, dynamic> json) {
    return UdpGroupSettings(
      inputLossAction:
          (json['inputLossAction'] as String?)?.toInputLossActionForUdpOut(),
      timedMetadataId3Frame: (json['timedMetadataId3Frame'] as String?)
          ?.toUdpTimedMetadataId3Frame(),
      timedMetadataId3Period: json['timedMetadataId3Period'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final inputLossAction = this.inputLossAction;
    final timedMetadataId3Frame = this.timedMetadataId3Frame;
    final timedMetadataId3Period = this.timedMetadataId3Period;
    return {
      if (inputLossAction != null) 'inputLossAction': inputLossAction.toValue(),
      if (timedMetadataId3Frame != null)
        'timedMetadataId3Frame': timedMetadataId3Frame.toValue(),
      if (timedMetadataId3Period != null)
        'timedMetadataId3Period': timedMetadataId3Period,
    };
  }
}

/// Udp Output Settings
class UdpOutputSettings {
  final UdpContainerSettings containerSettings;

  /// Destination address and port number for RTP or UDP packets. Can be unicast
  /// or multicast RTP or UDP (eg. rtp://239.10.10.10:5001 or
  /// udp://10.100.100.100:5002).
  final OutputLocationRef destination;

  /// UDP output buffering in milliseconds. Larger values increase latency through
  /// the transcoder but simultaneously assist the transcoder in maintaining a
  /// constant, low-jitter UDP/RTP output while accommodating clock recovery,
  /// input switching, input disruptions, picture reordering, etc.
  final int? bufferMsec;

  /// Settings for enabling and adjusting Forward Error Correction on UDP outputs.
  final FecOutputSettings? fecOutputSettings;

  UdpOutputSettings({
    required this.containerSettings,
    required this.destination,
    this.bufferMsec,
    this.fecOutputSettings,
  });

  factory UdpOutputSettings.fromJson(Map<String, dynamic> json) {
    return UdpOutputSettings(
      containerSettings: UdpContainerSettings.fromJson(
          json['containerSettings'] as Map<String, dynamic>),
      destination: OutputLocationRef.fromJson(
          json['destination'] as Map<String, dynamic>),
      bufferMsec: json['bufferMsec'] as int?,
      fecOutputSettings: json['fecOutputSettings'] != null
          ? FecOutputSettings.fromJson(
              json['fecOutputSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final containerSettings = this.containerSettings;
    final destination = this.destination;
    final bufferMsec = this.bufferMsec;
    final fecOutputSettings = this.fecOutputSettings;
    return {
      'containerSettings': containerSettings,
      'destination': destination,
      if (bufferMsec != null) 'bufferMsec': bufferMsec,
      if (fecOutputSettings != null) 'fecOutputSettings': fecOutputSettings,
    };
  }
}

/// Udp Timed Metadata Id3 Frame
enum UdpTimedMetadataId3Frame {
  none,
  priv,
  tdrl,
}

extension on UdpTimedMetadataId3Frame {
  String toValue() {
    switch (this) {
      case UdpTimedMetadataId3Frame.none:
        return 'NONE';
      case UdpTimedMetadataId3Frame.priv:
        return 'PRIV';
      case UdpTimedMetadataId3Frame.tdrl:
        return 'TDRL';
    }
  }
}

extension on String {
  UdpTimedMetadataId3Frame toUdpTimedMetadataId3Frame() {
    switch (this) {
      case 'NONE':
        return UdpTimedMetadataId3Frame.none;
      case 'PRIV':
        return UdpTimedMetadataId3Frame.priv;
      case 'TDRL':
        return UdpTimedMetadataId3Frame.tdrl;
    }
    throw Exception('$this is not known in enum UdpTimedMetadataId3Frame');
  }
}

/// Placeholder documentation for UpdateChannelClassResponse
class UpdateChannelClassResponse {
  final Channel? channel;

  UpdateChannelClassResponse({
    this.channel,
  });

  factory UpdateChannelClassResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelClassResponse(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    return {
      if (channel != null) 'channel': channel,
    };
  }
}

/// Placeholder documentation for UpdateChannelResponse
class UpdateChannelResponse {
  final Channel? channel;

  UpdateChannelResponse({
    this.channel,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    return {
      if (channel != null) 'channel': channel,
    };
  }
}

/// Placeholder documentation for UpdateInputDeviceResponse
class UpdateInputDeviceResponse {
  /// The unique ARN of the input device.
  final String? arn;

  /// The state of the connection between the input device and AWS.
  final InputDeviceConnectionState? connectionState;

  /// The status of the action to synchronize the device configuration. If you
  /// change the configuration of the input device (for example, the maximum
  /// bitrate), MediaLive sends the new data to the device. The device might not
  /// update itself immediately. SYNCED means the device has updated its
  /// configuration. SYNCING means that it has not updated its configuration.
  final DeviceSettingsSyncState? deviceSettingsSyncState;

  /// The status of software on the input device.
  final DeviceUpdateStatus? deviceUpdateStatus;

  /// Settings that describe an input device that is type HD.
  final InputDeviceHdSettings? hdDeviceSettings;

  /// The unique ID of the input device.
  final String? id;

  /// The network MAC address of the input device.
  final String? macAddress;

  /// A name that you specify for the input device.
  final String? name;

  /// The network settings for the input device.
  final InputDeviceNetworkSettings? networkSettings;

  /// The unique serial number of the input device.
  final String? serialNumber;

  /// The type of the input device.
  final InputDeviceType? type;

  /// Settings that describe an input device that is type UHD.
  final InputDeviceUhdSettings? uhdDeviceSettings;

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

  factory UpdateInputDeviceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInputDeviceResponse(
      arn: json['arn'] as String?,
      connectionState:
          (json['connectionState'] as String?)?.toInputDeviceConnectionState(),
      deviceSettingsSyncState: (json['deviceSettingsSyncState'] as String?)
          ?.toDeviceSettingsSyncState(),
      deviceUpdateStatus:
          (json['deviceUpdateStatus'] as String?)?.toDeviceUpdateStatus(),
      hdDeviceSettings: json['hdDeviceSettings'] != null
          ? InputDeviceHdSettings.fromJson(
              json['hdDeviceSettings'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      macAddress: json['macAddress'] as String?,
      name: json['name'] as String?,
      networkSettings: json['networkSettings'] != null
          ? InputDeviceNetworkSettings.fromJson(
              json['networkSettings'] as Map<String, dynamic>)
          : null,
      serialNumber: json['serialNumber'] as String?,
      type: (json['type'] as String?)?.toInputDeviceType(),
      uhdDeviceSettings: json['uhdDeviceSettings'] != null
          ? InputDeviceUhdSettings.fromJson(
              json['uhdDeviceSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectionState = this.connectionState;
    final deviceSettingsSyncState = this.deviceSettingsSyncState;
    final deviceUpdateStatus = this.deviceUpdateStatus;
    final hdDeviceSettings = this.hdDeviceSettings;
    final id = this.id;
    final macAddress = this.macAddress;
    final name = this.name;
    final networkSettings = this.networkSettings;
    final serialNumber = this.serialNumber;
    final type = this.type;
    final uhdDeviceSettings = this.uhdDeviceSettings;
    return {
      if (arn != null) 'arn': arn,
      if (connectionState != null) 'connectionState': connectionState.toValue(),
      if (deviceSettingsSyncState != null)
        'deviceSettingsSyncState': deviceSettingsSyncState.toValue(),
      if (deviceUpdateStatus != null)
        'deviceUpdateStatus': deviceUpdateStatus.toValue(),
      if (hdDeviceSettings != null) 'hdDeviceSettings': hdDeviceSettings,
      if (id != null) 'id': id,
      if (macAddress != null) 'macAddress': macAddress,
      if (name != null) 'name': name,
      if (networkSettings != null) 'networkSettings': networkSettings,
      if (serialNumber != null) 'serialNumber': serialNumber,
      if (type != null) 'type': type.toValue(),
      if (uhdDeviceSettings != null) 'uhdDeviceSettings': uhdDeviceSettings,
    };
  }
}

/// Placeholder documentation for UpdateInputResponse
class UpdateInputResponse {
  final Input? input;

  UpdateInputResponse({
    this.input,
  });

  factory UpdateInputResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInputResponse(
      input: json['input'] != null
          ? Input.fromJson(json['input'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final input = this.input;
    return {
      if (input != null) 'input': input,
    };
  }
}

/// Placeholder documentation for UpdateInputSecurityGroupResponse
class UpdateInputSecurityGroupResponse {
  final InputSecurityGroup? securityGroup;

  UpdateInputSecurityGroupResponse({
    this.securityGroup,
  });

  factory UpdateInputSecurityGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateInputSecurityGroupResponse(
      securityGroup: json['securityGroup'] != null
          ? InputSecurityGroup.fromJson(
              json['securityGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroup = this.securityGroup;
    return {
      if (securityGroup != null) 'securityGroup': securityGroup,
    };
  }
}

/// Placeholder documentation for UpdateMultiplexProgramResponse
class UpdateMultiplexProgramResponse {
  /// The updated multiplex program.
  final MultiplexProgram? multiplexProgram;

  UpdateMultiplexProgramResponse({
    this.multiplexProgram,
  });

  factory UpdateMultiplexProgramResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMultiplexProgramResponse(
      multiplexProgram: json['multiplexProgram'] != null
          ? MultiplexProgram.fromJson(
              json['multiplexProgram'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final multiplexProgram = this.multiplexProgram;
    return {
      if (multiplexProgram != null) 'multiplexProgram': multiplexProgram,
    };
  }
}

/// Placeholder documentation for UpdateMultiplexResponse
class UpdateMultiplexResponse {
  /// The updated multiplex.
  final Multiplex? multiplex;

  UpdateMultiplexResponse({
    this.multiplex,
  });

  factory UpdateMultiplexResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMultiplexResponse(
      multiplex: json['multiplex'] != null
          ? Multiplex.fromJson(json['multiplex'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final multiplex = this.multiplex;
    return {
      if (multiplex != null) 'multiplex': multiplex,
    };
  }
}

/// Placeholder documentation for UpdateReservationResponse
class UpdateReservationResponse {
  final Reservation? reservation;

  UpdateReservationResponse({
    this.reservation,
  });

  factory UpdateReservationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateReservationResponse(
      reservation: json['reservation'] != null
          ? Reservation.fromJson(json['reservation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final reservation = this.reservation;
    return {
      if (reservation != null) 'reservation': reservation,
    };
  }
}

/// Placeholder documentation for VideoBlackFailoverSettings
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
  final double? blackDetectThreshold;

  /// The amount of time (in milliseconds) that the active input must be black
  /// before automatic input failover occurs.
  final int? videoBlackThresholdMsec;

  VideoBlackFailoverSettings({
    this.blackDetectThreshold,
    this.videoBlackThresholdMsec,
  });

  factory VideoBlackFailoverSettings.fromJson(Map<String, dynamic> json) {
    return VideoBlackFailoverSettings(
      blackDetectThreshold: json['blackDetectThreshold'] as double?,
      videoBlackThresholdMsec: json['videoBlackThresholdMsec'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final blackDetectThreshold = this.blackDetectThreshold;
    final videoBlackThresholdMsec = this.videoBlackThresholdMsec;
    return {
      if (blackDetectThreshold != null)
        'blackDetectThreshold': blackDetectThreshold,
      if (videoBlackThresholdMsec != null)
        'videoBlackThresholdMsec': videoBlackThresholdMsec,
    };
  }
}

/// Video Codec Settings
class VideoCodecSettings {
  final FrameCaptureSettings? frameCaptureSettings;
  final H264Settings? h264Settings;
  final H265Settings? h265Settings;
  final Mpeg2Settings? mpeg2Settings;

  VideoCodecSettings({
    this.frameCaptureSettings,
    this.h264Settings,
    this.h265Settings,
    this.mpeg2Settings,
  });

  factory VideoCodecSettings.fromJson(Map<String, dynamic> json) {
    return VideoCodecSettings(
      frameCaptureSettings: json['frameCaptureSettings'] != null
          ? FrameCaptureSettings.fromJson(
              json['frameCaptureSettings'] as Map<String, dynamic>)
          : null,
      h264Settings: json['h264Settings'] != null
          ? H264Settings.fromJson(json['h264Settings'] as Map<String, dynamic>)
          : null,
      h265Settings: json['h265Settings'] != null
          ? H265Settings.fromJson(json['h265Settings'] as Map<String, dynamic>)
          : null,
      mpeg2Settings: json['mpeg2Settings'] != null
          ? Mpeg2Settings.fromJson(
              json['mpeg2Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final frameCaptureSettings = this.frameCaptureSettings;
    final h264Settings = this.h264Settings;
    final h265Settings = this.h265Settings;
    final mpeg2Settings = this.mpeg2Settings;
    return {
      if (frameCaptureSettings != null)
        'frameCaptureSettings': frameCaptureSettings,
      if (h264Settings != null) 'h264Settings': h264Settings,
      if (h265Settings != null) 'h265Settings': h265Settings,
      if (mpeg2Settings != null) 'mpeg2Settings': mpeg2Settings,
    };
  }
}

/// Video settings for this stream.
class VideoDescription {
  /// The name of this VideoDescription. Outputs will use this name to uniquely
  /// identify this Description.  Description names should be unique within this
  /// Live Event.
  final String name;

  /// Video codec settings.
  final VideoCodecSettings? codecSettings;

  /// Output video height, in pixels. Must be an even number. For most codecs, you
  /// can leave this field and width blank in order to use the height and width
  /// (resolution) from the source. Note, however, that leaving blank is not
  /// recommended. For the Frame Capture codec, height and width are required.
  final int? height;

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
  final VideoDescriptionRespondToAfd? respondToAfd;

  /// STRETCH_TO_OUTPUT configures the output position to stretch the video to the
  /// specified output resolution (height and width). This option will override
  /// any position value. DEFAULT may insert black boxes (pillar boxes or letter
  /// boxes) around the video to provide the specified output resolution.
  final VideoDescriptionScalingBehavior? scalingBehavior;

  /// Changes the strength of the anti-alias filter used for scaling. 0 is the
  /// softest setting, 100 is the sharpest. A setting of 50 is recommended for
  /// most content.
  final int? sharpness;

  /// Output video width, in pixels. Must be an even number. For most codecs, you
  /// can leave this field and height blank in order to use the height and width
  /// (resolution) from the source. Note, however, that leaving blank is not
  /// recommended. For the Frame Capture codec, height and width are required.
  final int? width;

  VideoDescription({
    required this.name,
    this.codecSettings,
    this.height,
    this.respondToAfd,
    this.scalingBehavior,
    this.sharpness,
    this.width,
  });

  factory VideoDescription.fromJson(Map<String, dynamic> json) {
    return VideoDescription(
      name: json['name'] as String,
      codecSettings: json['codecSettings'] != null
          ? VideoCodecSettings.fromJson(
              json['codecSettings'] as Map<String, dynamic>)
          : null,
      height: json['height'] as int?,
      respondToAfd:
          (json['respondToAfd'] as String?)?.toVideoDescriptionRespondToAfd(),
      scalingBehavior: (json['scalingBehavior'] as String?)
          ?.toVideoDescriptionScalingBehavior(),
      sharpness: json['sharpness'] as int?,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final codecSettings = this.codecSettings;
    final height = this.height;
    final respondToAfd = this.respondToAfd;
    final scalingBehavior = this.scalingBehavior;
    final sharpness = this.sharpness;
    final width = this.width;
    return {
      'name': name,
      if (codecSettings != null) 'codecSettings': codecSettings,
      if (height != null) 'height': height,
      if (respondToAfd != null) 'respondToAfd': respondToAfd.toValue(),
      if (scalingBehavior != null) 'scalingBehavior': scalingBehavior.toValue(),
      if (sharpness != null) 'sharpness': sharpness,
      if (width != null) 'width': width,
    };
  }
}

/// Video Description Respond To Afd
enum VideoDescriptionRespondToAfd {
  none,
  passthrough,
  respond,
}

extension on VideoDescriptionRespondToAfd {
  String toValue() {
    switch (this) {
      case VideoDescriptionRespondToAfd.none:
        return 'NONE';
      case VideoDescriptionRespondToAfd.passthrough:
        return 'PASSTHROUGH';
      case VideoDescriptionRespondToAfd.respond:
        return 'RESPOND';
    }
  }
}

extension on String {
  VideoDescriptionRespondToAfd toVideoDescriptionRespondToAfd() {
    switch (this) {
      case 'NONE':
        return VideoDescriptionRespondToAfd.none;
      case 'PASSTHROUGH':
        return VideoDescriptionRespondToAfd.passthrough;
      case 'RESPOND':
        return VideoDescriptionRespondToAfd.respond;
    }
    throw Exception('$this is not known in enum VideoDescriptionRespondToAfd');
  }
}

/// Video Description Scaling Behavior
enum VideoDescriptionScalingBehavior {
  $default,
  stretchToOutput,
}

extension on VideoDescriptionScalingBehavior {
  String toValue() {
    switch (this) {
      case VideoDescriptionScalingBehavior.$default:
        return 'DEFAULT';
      case VideoDescriptionScalingBehavior.stretchToOutput:
        return 'STRETCH_TO_OUTPUT';
    }
  }
}

extension on String {
  VideoDescriptionScalingBehavior toVideoDescriptionScalingBehavior() {
    switch (this) {
      case 'DEFAULT':
        return VideoDescriptionScalingBehavior.$default;
      case 'STRETCH_TO_OUTPUT':
        return VideoDescriptionScalingBehavior.stretchToOutput;
    }
    throw Exception(
        '$this is not known in enum VideoDescriptionScalingBehavior');
  }
}

/// Specifies a particular video stream within an input source. An input may
/// have only a single video selector.
class VideoSelector {
  /// Specifies the color space of an input. This setting works in tandem with
  /// colorSpaceUsage and a video description's colorSpaceSettingsChoice to
  /// determine if any conversion will be performed.
  final VideoSelectorColorSpace? colorSpace;

  /// Color space settings
  final VideoSelectorColorSpaceSettings? colorSpaceSettings;

  /// Applies only if colorSpace is a value other than follow. This field controls
  /// how the value in the colorSpace field will be used. fallback means that when
  /// the input does include color space data, that data will be used, but when
  /// the input has no color space data, the value in colorSpace will be used.
  /// Choose fallback if your input is sometimes missing color space data, but
  /// when it does have color space data, that data is correct. force means to
  /// always use the value in colorSpace. Choose force if your input usually has
  /// no color space data or might have unreliable color space data.
  final VideoSelectorColorSpaceUsage? colorSpaceUsage;

  /// The video selector settings.
  final VideoSelectorSettings? selectorSettings;

  VideoSelector({
    this.colorSpace,
    this.colorSpaceSettings,
    this.colorSpaceUsage,
    this.selectorSettings,
  });

  factory VideoSelector.fromJson(Map<String, dynamic> json) {
    return VideoSelector(
      colorSpace: (json['colorSpace'] as String?)?.toVideoSelectorColorSpace(),
      colorSpaceSettings: json['colorSpaceSettings'] != null
          ? VideoSelectorColorSpaceSettings.fromJson(
              json['colorSpaceSettings'] as Map<String, dynamic>)
          : null,
      colorSpaceUsage: (json['colorSpaceUsage'] as String?)
          ?.toVideoSelectorColorSpaceUsage(),
      selectorSettings: json['selectorSettings'] != null
          ? VideoSelectorSettings.fromJson(
              json['selectorSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final colorSpace = this.colorSpace;
    final colorSpaceSettings = this.colorSpaceSettings;
    final colorSpaceUsage = this.colorSpaceUsage;
    final selectorSettings = this.selectorSettings;
    return {
      if (colorSpace != null) 'colorSpace': colorSpace.toValue(),
      if (colorSpaceSettings != null) 'colorSpaceSettings': colorSpaceSettings,
      if (colorSpaceUsage != null) 'colorSpaceUsage': colorSpaceUsage.toValue(),
      if (selectorSettings != null) 'selectorSettings': selectorSettings,
    };
  }
}

/// Video Selector Color Space
enum VideoSelectorColorSpace {
  follow,
  hdr10,
  hlg_2020,
  rec_601,
  rec_709,
}

extension on VideoSelectorColorSpace {
  String toValue() {
    switch (this) {
      case VideoSelectorColorSpace.follow:
        return 'FOLLOW';
      case VideoSelectorColorSpace.hdr10:
        return 'HDR10';
      case VideoSelectorColorSpace.hlg_2020:
        return 'HLG_2020';
      case VideoSelectorColorSpace.rec_601:
        return 'REC_601';
      case VideoSelectorColorSpace.rec_709:
        return 'REC_709';
    }
  }
}

extension on String {
  VideoSelectorColorSpace toVideoSelectorColorSpace() {
    switch (this) {
      case 'FOLLOW':
        return VideoSelectorColorSpace.follow;
      case 'HDR10':
        return VideoSelectorColorSpace.hdr10;
      case 'HLG_2020':
        return VideoSelectorColorSpace.hlg_2020;
      case 'REC_601':
        return VideoSelectorColorSpace.rec_601;
      case 'REC_709':
        return VideoSelectorColorSpace.rec_709;
    }
    throw Exception('$this is not known in enum VideoSelectorColorSpace');
  }
}

/// Video Selector Color Space Settings
class VideoSelectorColorSpaceSettings {
  final Hdr10Settings? hdr10Settings;

  VideoSelectorColorSpaceSettings({
    this.hdr10Settings,
  });

  factory VideoSelectorColorSpaceSettings.fromJson(Map<String, dynamic> json) {
    return VideoSelectorColorSpaceSettings(
      hdr10Settings: json['hdr10Settings'] != null
          ? Hdr10Settings.fromJson(
              json['hdr10Settings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hdr10Settings = this.hdr10Settings;
    return {
      if (hdr10Settings != null) 'hdr10Settings': hdr10Settings,
    };
  }
}

/// Video Selector Color Space Usage
enum VideoSelectorColorSpaceUsage {
  fallback,
  force,
}

extension on VideoSelectorColorSpaceUsage {
  String toValue() {
    switch (this) {
      case VideoSelectorColorSpaceUsage.fallback:
        return 'FALLBACK';
      case VideoSelectorColorSpaceUsage.force:
        return 'FORCE';
    }
  }
}

extension on String {
  VideoSelectorColorSpaceUsage toVideoSelectorColorSpaceUsage() {
    switch (this) {
      case 'FALLBACK':
        return VideoSelectorColorSpaceUsage.fallback;
      case 'FORCE':
        return VideoSelectorColorSpaceUsage.force;
    }
    throw Exception('$this is not known in enum VideoSelectorColorSpaceUsage');
  }
}

/// Video Selector Pid
class VideoSelectorPid {
  /// Selects a specific PID from within a video source.
  final int? pid;

  VideoSelectorPid({
    this.pid,
  });

  factory VideoSelectorPid.fromJson(Map<String, dynamic> json) {
    return VideoSelectorPid(
      pid: json['pid'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final pid = this.pid;
    return {
      if (pid != null) 'pid': pid,
    };
  }
}

/// Video Selector Program Id
class VideoSelectorProgramId {
  /// Selects a specific program from within a multi-program transport stream. If
  /// the program doesn't exist, the first program within the transport stream
  /// will be selected by default.
  final int? programId;

  VideoSelectorProgramId({
    this.programId,
  });

  factory VideoSelectorProgramId.fromJson(Map<String, dynamic> json) {
    return VideoSelectorProgramId(
      programId: json['programId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final programId = this.programId;
    return {
      if (programId != null) 'programId': programId,
    };
  }
}

/// Video Selector Settings
class VideoSelectorSettings {
  final VideoSelectorPid? videoSelectorPid;
  final VideoSelectorProgramId? videoSelectorProgramId;

  VideoSelectorSettings({
    this.videoSelectorPid,
    this.videoSelectorProgramId,
  });

  factory VideoSelectorSettings.fromJson(Map<String, dynamic> json) {
    return VideoSelectorSettings(
      videoSelectorPid: json['videoSelectorPid'] != null
          ? VideoSelectorPid.fromJson(
              json['videoSelectorPid'] as Map<String, dynamic>)
          : null,
      videoSelectorProgramId: json['videoSelectorProgramId'] != null
          ? VideoSelectorProgramId.fromJson(
              json['videoSelectorProgramId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final videoSelectorPid = this.videoSelectorPid;
    final videoSelectorProgramId = this.videoSelectorProgramId;
    return {
      if (videoSelectorPid != null) 'videoSelectorPid': videoSelectorPid,
      if (videoSelectorProgramId != null)
        'videoSelectorProgramId': videoSelectorProgramId,
    };
  }
}

/// The properties for a private VPC Output
/// When this property is specified, the output egress addresses will be created
/// in a user specified VPC
class VpcOutputSettings {
  /// A list of VPC subnet IDs from the same VPC.
  /// If STANDARD channel, subnet IDs must be mapped to two unique availability
  /// zones (AZ).
  final List<String> subnetIds;

  /// List of public address allocation ids to associate with ENIs that will be
  /// created in Output VPC.
  /// Must specify one for SINGLE_PIPELINE, two for STANDARD channels
  final List<String>? publicAddressAllocationIds;

  /// A list of up to 5 EC2 VPC security group IDs to attach to the Output VPC
  /// network interfaces.
  /// If none are specified then the VPC default security group will be used
  final List<String>? securityGroupIds;

  VpcOutputSettings({
    required this.subnetIds,
    this.publicAddressAllocationIds,
    this.securityGroupIds,
  });

  factory VpcOutputSettings.fromJson(Map<String, dynamic> json) {
    return VpcOutputSettings(
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      publicAddressAllocationIds: (json['publicAddressAllocationIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetIds = this.subnetIds;
    final publicAddressAllocationIds = this.publicAddressAllocationIds;
    final securityGroupIds = this.securityGroupIds;
    return {
      'subnetIds': subnetIds,
      if (publicAddressAllocationIds != null)
        'publicAddressAllocationIds': publicAddressAllocationIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
    };
  }
}

/// The properties for a private VPC Output
class VpcOutputSettingsDescription {
  /// The Availability Zones where the vpc subnets are located.
  /// The first Availability Zone applies to the first subnet in the list of
  /// subnets.
  /// The second Availability Zone applies to the second subnet.
  final List<String>? availabilityZones;

  /// A list of Elastic Network Interfaces created by MediaLive in the customer's
  /// VPC
  final List<String>? networkInterfaceIds;

  /// A list of up EC2 VPC security group IDs attached to the Output VPC network
  /// interfaces.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs from the same VPC.
  /// If STANDARD channel, subnet IDs must be mapped to two unique availability
  /// zones (AZ).
  final List<String>? subnetIds;

  VpcOutputSettingsDescription({
    this.availabilityZones,
    this.networkInterfaceIds,
    this.securityGroupIds,
    this.subnetIds,
  });

  factory VpcOutputSettingsDescription.fromJson(Map<String, dynamic> json) {
    return VpcOutputSettingsDescription(
      availabilityZones: (json['availabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      networkInterfaceIds: (json['networkInterfaceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final networkInterfaceIds = this.networkInterfaceIds;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (availabilityZones != null) 'availabilityZones': availabilityZones,
      if (networkInterfaceIds != null)
        'networkInterfaceIds': networkInterfaceIds,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

/// Wav Coding Mode
enum WavCodingMode {
  codingMode_1_0,
  codingMode_2_0,
  codingMode_4_0,
  codingMode_8_0,
}

extension on WavCodingMode {
  String toValue() {
    switch (this) {
      case WavCodingMode.codingMode_1_0:
        return 'CODING_MODE_1_0';
      case WavCodingMode.codingMode_2_0:
        return 'CODING_MODE_2_0';
      case WavCodingMode.codingMode_4_0:
        return 'CODING_MODE_4_0';
      case WavCodingMode.codingMode_8_0:
        return 'CODING_MODE_8_0';
    }
  }
}

extension on String {
  WavCodingMode toWavCodingMode() {
    switch (this) {
      case 'CODING_MODE_1_0':
        return WavCodingMode.codingMode_1_0;
      case 'CODING_MODE_2_0':
        return WavCodingMode.codingMode_2_0;
      case 'CODING_MODE_4_0':
        return WavCodingMode.codingMode_4_0;
      case 'CODING_MODE_8_0':
        return WavCodingMode.codingMode_8_0;
    }
    throw Exception('$this is not known in enum WavCodingMode');
  }
}

/// Wav Settings
class WavSettings {
  /// Bits per sample.
  final double? bitDepth;

  /// The audio coding mode for the WAV audio. The mode determines the number of
  /// channels in the audio.
  final WavCodingMode? codingMode;

  /// Sample rate in Hz.
  final double? sampleRate;

  WavSettings({
    this.bitDepth,
    this.codingMode,
    this.sampleRate,
  });

  factory WavSettings.fromJson(Map<String, dynamic> json) {
    return WavSettings(
      bitDepth: json['bitDepth'] as double?,
      codingMode: (json['codingMode'] as String?)?.toWavCodingMode(),
      sampleRate: json['sampleRate'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitDepth = this.bitDepth;
    final codingMode = this.codingMode;
    final sampleRate = this.sampleRate;
    return {
      if (bitDepth != null) 'bitDepth': bitDepth,
      if (codingMode != null) 'codingMode': codingMode.toValue(),
      if (sampleRate != null) 'sampleRate': sampleRate,
    };
  }
}

/// Webvtt Destination Settings
class WebvttDestinationSettings {
  WebvttDestinationSettings();

  factory WebvttDestinationSettings.fromJson(Map<String, dynamic> _) {
    return WebvttDestinationSettings();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The HTTP Accept header. Indicates the requested type fothe thumbnail.
enum AcceptHeader {
  imageJpeg,
}

extension on AcceptHeader {
  String toValue() {
    switch (this) {
      case AcceptHeader.imageJpeg:
        return 'image/jpeg';
    }
  }
}

extension on String {
  AcceptHeader toAcceptHeader() {
    switch (this) {
      case 'image/jpeg':
        return AcceptHeader.imageJpeg;
    }
    throw Exception('$this is not known in enum AcceptHeader');
  }
}

/// Specifies the media type of the thumbnail.
enum ContentType {
  imageJpeg,
}

extension on ContentType {
  String toValue() {
    switch (this) {
      case ContentType.imageJpeg:
        return 'image/jpeg';
    }
  }
}

extension on String {
  ContentType toContentType() {
    switch (this) {
      case 'image/jpeg':
        return ContentType.imageJpeg;
    }
    throw Exception('$this is not known in enum ContentType');
  }
}

class BadGatewayException extends _s.GenericAwsException {
  BadGatewayException({String? type, String? message})
      : super(type: type, code: 'BadGatewayException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class GatewayTimeoutException extends _s.GenericAwsException {
  GatewayTimeoutException({String? type, String? message})
      : super(type: type, code: 'GatewayTimeoutException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String? type, String? message})
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
