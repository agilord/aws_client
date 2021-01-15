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

part '2018-09-05.g.dart';

/// Pinpoint SMS and Voice Messaging public facing APIs
class PinpointSmsVoice {
  final _s.RestJsonProtocol _protocol;
  PinpointSmsVoice({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sms-voice.pinpoint',
            signingName: 'sms-voice',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Create a new configuration set. After you create the configuration set,
  /// you can add one or more event destinations to it.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [configurationSetName] :
  /// The name that you want to give the configuration set.
  Future<void> createConfigurationSet({
    String configurationSetName,
  }) async {
    final $payload = <String, dynamic>{
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/sms-voice/configuration-sets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfigurationSetResponse.fromJson(response);
  }

  /// Create a new event destination in a configuration set.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [AlreadyExistsException].
  ///
  /// Parameter [configurationSetName] :
  /// ConfigurationSetName
  ///
  /// Parameter [eventDestinationName] :
  /// A name that identifies the event destination.
  Future<void> createConfigurationSetEventDestination({
    @_s.required String configurationSetName,
    EventDestinationDefinition eventDestination,
    String eventDestinationName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final $payload = <String, dynamic>{
      if (eventDestination != null) 'EventDestination': eventDestination,
      if (eventDestinationName != null)
        'EventDestinationName': eventDestinationName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/v1/sms-voice/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateConfigurationSetEventDestinationResponse.fromJson(response);
  }

  /// Deletes an existing configuration set.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [configurationSetName] :
  /// ConfigurationSetName
  Future<void> deleteConfigurationSet({
    @_s.required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/sms-voice/configuration-sets/${Uri.encodeComponent(configurationSetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConfigurationSetResponse.fromJson(response);
  }

  /// Deletes an event destination in a configuration set.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [configurationSetName] :
  /// ConfigurationSetName
  ///
  /// Parameter [eventDestinationName] :
  /// EventDestinationName
  Future<void> deleteConfigurationSetEventDestination({
    @_s.required String configurationSetName,
    @_s.required String eventDestinationName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/sms-voice/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations/${Uri.encodeComponent(eventDestinationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteConfigurationSetEventDestinationResponse.fromJson(response);
  }

  /// Obtain information about an event destination, including the types of
  /// events it reports, the Amazon Resource Name (ARN) of the destination, and
  /// the name of the event destination.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [configurationSetName] :
  /// ConfigurationSetName
  Future<GetConfigurationSetEventDestinationsResponse>
      getConfigurationSetEventDestinations({
    @_s.required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/v1/sms-voice/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationSetEventDestinationsResponse.fromJson(response);
  }

  /// List all of the configuration sets associated with your Amazon Pinpoint
  /// account in the current region.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [nextToken] :
  /// A token returned from a previous call to the API that indicates the
  /// position in the list of results.
  ///
  /// Parameter [pageSize] :
  /// Used to specify the number of items that should be returned in the
  /// response.
  Future<ListConfigurationSetsResponse> listConfigurationSets({
    String nextToken,
    String pageSize,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
      if (pageSize != null) 'PageSize': [pageSize],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/sms-voice/configuration-sets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationSetsResponse.fromJson(response);
  }

  /// Create a new voice message and send it to a recipient's phone number.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [callerId] :
  /// The phone number that appears on recipients' devices when they receive the
  /// message.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set that you want to use to send the
  /// message.
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The phone number that you want to send the voice message to.
  ///
  /// Parameter [originationPhoneNumber] :
  /// The phone number that Amazon Pinpoint should use to send the voice
  /// message. This isn't necessarily the phone number that appears on
  /// recipients' devices when they receive the message, because you can specify
  /// a CallerId parameter in the request.
  Future<SendVoiceMessageResponse> sendVoiceMessage({
    String callerId,
    String configurationSetName,
    VoiceMessageContent content,
    String destinationPhoneNumber,
    String originationPhoneNumber,
  }) async {
    final $payload = <String, dynamic>{
      if (callerId != null) 'CallerId': callerId,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (content != null) 'Content': content,
      if (destinationPhoneNumber != null)
        'DestinationPhoneNumber': destinationPhoneNumber,
      if (originationPhoneNumber != null)
        'OriginationPhoneNumber': originationPhoneNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/sms-voice/voice/message',
      exceptionFnMap: _exceptionFns,
    );
    return SendVoiceMessageResponse.fromJson(response);
  }

  /// Update an event destination in a configuration set. An event destination
  /// is a location that you publish information about your voice calls to. For
  /// example, you can log an event to an Amazon CloudWatch destination when a
  /// call fails.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [configurationSetName] :
  /// ConfigurationSetName
  ///
  /// Parameter [eventDestinationName] :
  /// EventDestinationName
  Future<void> updateConfigurationSetEventDestination({
    @_s.required String configurationSetName,
    @_s.required String eventDestinationName,
    EventDestinationDefinition eventDestination,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
    final $payload = <String, dynamic>{
      if (eventDestination != null) 'EventDestination': eventDestination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/v1/sms-voice/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations/${Uri.encodeComponent(eventDestinationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateConfigurationSetEventDestinationResponse.fromJson(response);
  }
}

/// An object that defines a message that contains text formatted using Amazon
/// Pinpoint Voice Instructions markup.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CallInstructionsMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  @_s.JsonKey(name: 'Text')
  final String text;

  CallInstructionsMessageType({
    this.text,
  });
  Map<String, dynamic> toJson() => _$CallInstructionsMessageTypeToJson(this);
}

/// An object that contains information about an event destination that sends
/// data to Amazon CloudWatch Logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CloudWatchLogsDestination {
  /// The Amazon Resource Name (ARN) of an Amazon Identity and Access Management
  /// (IAM) role that is able to write event data to an Amazon CloudWatch
  /// destination.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  /// The name of the Amazon CloudWatch Log Group that you want to record events
  /// in.
  @_s.JsonKey(name: 'LogGroupArn')
  final String logGroupArn;

  CloudWatchLogsDestination({
    this.iamRoleArn,
    this.logGroupArn,
  });
  factory CloudWatchLogsDestination.fromJson(Map<String, dynamic> json) =>
      _$CloudWatchLogsDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$CloudWatchLogsDestinationToJson(this);
}

/// An empty object that indicates that the event destination was created
/// successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();
  factory CreateConfigurationSetEventDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateConfigurationSetEventDestinationResponseFromJson(json);
}

/// An empty object that indicates that the configuration set was successfully
/// created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();
  factory CreateConfigurationSetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateConfigurationSetResponseFromJson(json);
}

/// An empty object that indicates that the event destination was deleted
/// successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();
  factory DeleteConfigurationSetEventDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteConfigurationSetEventDestinationResponseFromJson(json);
}

/// An empty object that indicates that the configuration set was deleted
/// successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();
  factory DeleteConfigurationSetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteConfigurationSetResponseFromJson(json);
}

/// An object that defines an event destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventDestination {
  @_s.JsonKey(name: 'CloudWatchLogsDestination')
  final CloudWatchLogsDestination cloudWatchLogsDestination;

  /// Indicates whether or not the event destination is enabled. If the event
  /// destination is enabled, then Amazon Pinpoint sends response data to the
  /// specified event destination.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;
  @_s.JsonKey(name: 'KinesisFirehoseDestination')
  final KinesisFirehoseDestination kinesisFirehoseDestination;
  @_s.JsonKey(name: 'MatchingEventTypes')
  final List<EventType> matchingEventTypes;

  /// A name that identifies the event destination configuration.
  @_s.JsonKey(name: 'Name')
  final String name;
  @_s.JsonKey(name: 'SnsDestination')
  final SnsDestination snsDestination;

  EventDestination({
    this.cloudWatchLogsDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.name,
    this.snsDestination,
  });
  factory EventDestination.fromJson(Map<String, dynamic> json) =>
      _$EventDestinationFromJson(json);
}

/// An object that defines a single event destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class EventDestinationDefinition {
  @_s.JsonKey(name: 'CloudWatchLogsDestination')
  final CloudWatchLogsDestination cloudWatchLogsDestination;

  /// Indicates whether or not the event destination is enabled. If the event
  /// destination is enabled, then Amazon Pinpoint sends response data to the
  /// specified event destination.
  @_s.JsonKey(name: 'Enabled')
  final bool enabled;
  @_s.JsonKey(name: 'KinesisFirehoseDestination')
  final KinesisFirehoseDestination kinesisFirehoseDestination;
  @_s.JsonKey(name: 'MatchingEventTypes')
  final List<EventType> matchingEventTypes;
  @_s.JsonKey(name: 'SnsDestination')
  final SnsDestination snsDestination;

  EventDestinationDefinition({
    this.cloudWatchLogsDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.snsDestination,
  });
  Map<String, dynamic> toJson() => _$EventDestinationDefinitionToJson(this);
}

/// The types of events that are sent to the event destination.
enum EventType {
  @_s.JsonValue('INITIATED_CALL')
  initiatedCall,
  @_s.JsonValue('RINGING')
  ringing,
  @_s.JsonValue('ANSWERED')
  answered,
  @_s.JsonValue('COMPLETED_CALL')
  completedCall,
  @_s.JsonValue('BUSY')
  busy,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('NO_ANSWER')
  noAnswer,
}

/// An object that contains information about an event destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConfigurationSetEventDestinationsResponse {
  @_s.JsonKey(name: 'EventDestinations')
  final List<EventDestination> eventDestinations;

  GetConfigurationSetEventDestinationsResponse({
    this.eventDestinations,
  });
  factory GetConfigurationSetEventDestinationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetConfigurationSetEventDestinationsResponseFromJson(json);
}

/// An object that contains information about an event destination that sends
/// data to Amazon Kinesis Data Firehose.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of an IAM role that can write data to an
  /// Amazon Kinesis Data Firehose stream.
  @_s.JsonKey(name: 'DeliveryStreamArn')
  final String deliveryStreamArn;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose
  /// destination that you want to use in the event destination.
  @_s.JsonKey(name: 'IamRoleArn')
  final String iamRoleArn;

  KinesisFirehoseDestination({
    this.deliveryStreamArn,
    this.iamRoleArn,
  });
  factory KinesisFirehoseDestination.fromJson(Map<String, dynamic> json) =>
      _$KinesisFirehoseDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$KinesisFirehoseDestinationToJson(this);
}

/// An object that contains information about the configuration sets for your
/// account in the current region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListConfigurationSetsResponse {
  /// An object that contains a list of configuration sets for your account in the
  /// current region.
  @_s.JsonKey(name: 'ConfigurationSets')
  final List<String> configurationSets;

  /// A token returned from a previous call to ListConfigurationSets to indicate
  /// the position in the list of configuration sets.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });
  factory ListConfigurationSetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListConfigurationSetsResponseFromJson(json);
}

/// An object that defines a message that contains unformatted text.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PlainTextMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  @_s.JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// The plain (not SSML-formatted) text to deliver to the recipient.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// The name of the voice that you want to use to deliver the message. For a
  /// complete list of supported voices, see the Amazon Polly Developer Guide.
  @_s.JsonKey(name: 'VoiceId')
  final String voiceId;

  PlainTextMessageType({
    this.languageCode,
    this.text,
    this.voiceId,
  });
  Map<String, dynamic> toJson() => _$PlainTextMessageTypeToJson(this);
}

/// An object that defines a message that contains SSML-formatted text.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SSMLMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  @_s.JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// The SSML-formatted text to deliver to the recipient.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// The name of the voice that you want to use to deliver the message. For a
  /// complete list of supported voices, see the Amazon Polly Developer Guide.
  @_s.JsonKey(name: 'VoiceId')
  final String voiceId;

  SSMLMessageType({
    this.languageCode,
    this.text,
    this.voiceId,
  });
  Map<String, dynamic> toJson() => _$SSMLMessageTypeToJson(this);
}

/// An object that that contains the Message ID of a Voice message that was sent
/// successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendVoiceMessageResponse {
  /// A unique identifier for the voice message.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  SendVoiceMessageResponse({
    this.messageId,
  });
  factory SendVoiceMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendVoiceMessageResponseFromJson(json);
}

/// An object that contains information about an event destination that sends
/// data to Amazon SNS.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SnsDestination {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to
  /// publish events to.
  @_s.JsonKey(name: 'TopicArn')
  final String topicArn;

  SnsDestination({
    this.topicArn,
  });
  factory SnsDestination.fromJson(Map<String, dynamic> json) =>
      _$SnsDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$SnsDestinationToJson(this);
}

/// An empty object that indicates that the event destination was updated
/// successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();
  factory UpdateConfigurationSetEventDestinationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateConfigurationSetEventDestinationResponseFromJson(json);
}

/// An object that contains a voice message and information about the recipient
/// that you want to send it to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VoiceMessageContent {
  @_s.JsonKey(name: 'CallInstructionsMessage')
  final CallInstructionsMessageType callInstructionsMessage;
  @_s.JsonKey(name: 'PlainTextMessage')
  final PlainTextMessageType plainTextMessage;
  @_s.JsonKey(name: 'SSMLMessage')
  final SSMLMessageType sSMLMessage;

  VoiceMessageContent({
    this.callInstructionsMessage,
    this.plainTextMessage,
    this.sSMLMessage,
  });
  Map<String, dynamic> toJson() => _$VoiceMessageContentToJson(this);
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String type, String message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String type, String message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AlreadyExistsException': (type, message) =>
      AlreadyExistsException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
