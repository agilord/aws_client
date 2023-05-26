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

/// Pinpoint SMS and Voice Messaging public facing APIs
class PinpointSmsVoice {
  final _s.RestJsonProtocol _protocol;
  PinpointSmsVoice({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sms-voice.pinpoint',
            signingName: 'sms-voice',
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
    String? configurationSetName,
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
    required String configurationSetName,
    EventDestinationDefinition? eventDestination,
    String? eventDestinationName,
  }) async {
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
    required String configurationSetName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/sms-voice/configuration-sets/${Uri.encodeComponent(configurationSetName)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String configurationSetName,
    required String eventDestinationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/v1/sms-voice/configuration-sets/${Uri.encodeComponent(configurationSetName)}/event-destinations/${Uri.encodeComponent(eventDestinationName)}',
      exceptionFnMap: _exceptionFns,
    );
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
    required String configurationSetName,
  }) async {
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
    String? nextToken,
    String? pageSize,
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
    String? callerId,
    String? configurationSetName,
    VoiceMessageContent? content,
    String? destinationPhoneNumber,
    String? originationPhoneNumber,
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
    required String configurationSetName,
    required String eventDestinationName,
    EventDestinationDefinition? eventDestination,
  }) async {
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
  }
}

/// An object that defines a message that contains text formatted using Amazon
/// Pinpoint Voice Instructions markup.
class CallInstructionsMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  final String? text;

  CallInstructionsMessageType({
    this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'Text': text,
    };
  }
}

/// An object that contains information about an event destination that sends
/// data to Amazon CloudWatch Logs.
class CloudWatchLogsDestination {
  /// The Amazon Resource Name (ARN) of an Amazon Identity and Access Management
  /// (IAM) role that is able to write event data to an Amazon CloudWatch
  /// destination.
  final String? iamRoleArn;

  /// The name of the Amazon CloudWatch Log Group that you want to record events
  /// in.
  final String? logGroupArn;

  CloudWatchLogsDestination({
    this.iamRoleArn,
    this.logGroupArn,
  });

  factory CloudWatchLogsDestination.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsDestination(
      iamRoleArn: json['IamRoleArn'] as String?,
      logGroupArn: json['LogGroupArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final iamRoleArn = this.iamRoleArn;
    final logGroupArn = this.logGroupArn;
    return {
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
      if (logGroupArn != null) 'LogGroupArn': logGroupArn,
    };
  }
}

/// An empty object that indicates that the event destination was created
/// successfully.
class CreateConfigurationSetEventDestinationResponse {
  CreateConfigurationSetEventDestinationResponse();

  factory CreateConfigurationSetEventDestinationResponse.fromJson(
      Map<String, dynamic> _) {
    return CreateConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty object that indicates that the configuration set was successfully
/// created.
class CreateConfigurationSetResponse {
  CreateConfigurationSetResponse();

  factory CreateConfigurationSetResponse.fromJson(Map<String, dynamic> _) {
    return CreateConfigurationSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty object that indicates that the event destination was deleted
/// successfully.
class DeleteConfigurationSetEventDestinationResponse {
  DeleteConfigurationSetEventDestinationResponse();

  factory DeleteConfigurationSetEventDestinationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An empty object that indicates that the configuration set was deleted
/// successfully.
class DeleteConfigurationSetResponse {
  DeleteConfigurationSetResponse();

  factory DeleteConfigurationSetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteConfigurationSetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that defines an event destination.
class EventDestination {
  final CloudWatchLogsDestination? cloudWatchLogsDestination;

  /// Indicates whether or not the event destination is enabled. If the event
  /// destination is enabled, then Amazon Pinpoint sends response data to the
  /// specified event destination.
  final bool? enabled;
  final KinesisFirehoseDestination? kinesisFirehoseDestination;
  final List<EventType>? matchingEventTypes;

  /// A name that identifies the event destination configuration.
  final String? name;
  final SnsDestination? snsDestination;

  EventDestination({
    this.cloudWatchLogsDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.name,
    this.snsDestination,
  });

  factory EventDestination.fromJson(Map<String, dynamic> json) {
    return EventDestination(
      cloudWatchLogsDestination: json['CloudWatchLogsDestination'] != null
          ? CloudWatchLogsDestination.fromJson(
              json['CloudWatchLogsDestination'] as Map<String, dynamic>)
          : null,
      enabled: json['Enabled'] as bool?,
      kinesisFirehoseDestination: json['KinesisFirehoseDestination'] != null
          ? KinesisFirehoseDestination.fromJson(
              json['KinesisFirehoseDestination'] as Map<String, dynamic>)
          : null,
      matchingEventTypes: (json['MatchingEventTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEventType())
          .toList(),
      name: json['Name'] as String?,
      snsDestination: json['SnsDestination'] != null
          ? SnsDestination.fromJson(
              json['SnsDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogsDestination = this.cloudWatchLogsDestination;
    final enabled = this.enabled;
    final kinesisFirehoseDestination = this.kinesisFirehoseDestination;
    final matchingEventTypes = this.matchingEventTypes;
    final name = this.name;
    final snsDestination = this.snsDestination;
    return {
      if (cloudWatchLogsDestination != null)
        'CloudWatchLogsDestination': cloudWatchLogsDestination,
      if (enabled != null) 'Enabled': enabled,
      if (kinesisFirehoseDestination != null)
        'KinesisFirehoseDestination': kinesisFirehoseDestination,
      if (matchingEventTypes != null)
        'MatchingEventTypes':
            matchingEventTypes.map((e) => e.toValue()).toList(),
      if (name != null) 'Name': name,
      if (snsDestination != null) 'SnsDestination': snsDestination,
    };
  }
}

/// An object that defines a single event destination.
class EventDestinationDefinition {
  final CloudWatchLogsDestination? cloudWatchLogsDestination;

  /// Indicates whether or not the event destination is enabled. If the event
  /// destination is enabled, then Amazon Pinpoint sends response data to the
  /// specified event destination.
  final bool? enabled;
  final KinesisFirehoseDestination? kinesisFirehoseDestination;
  final List<EventType>? matchingEventTypes;
  final SnsDestination? snsDestination;

  EventDestinationDefinition({
    this.cloudWatchLogsDestination,
    this.enabled,
    this.kinesisFirehoseDestination,
    this.matchingEventTypes,
    this.snsDestination,
  });

  Map<String, dynamic> toJson() {
    final cloudWatchLogsDestination = this.cloudWatchLogsDestination;
    final enabled = this.enabled;
    final kinesisFirehoseDestination = this.kinesisFirehoseDestination;
    final matchingEventTypes = this.matchingEventTypes;
    final snsDestination = this.snsDestination;
    return {
      if (cloudWatchLogsDestination != null)
        'CloudWatchLogsDestination': cloudWatchLogsDestination,
      if (enabled != null) 'Enabled': enabled,
      if (kinesisFirehoseDestination != null)
        'KinesisFirehoseDestination': kinesisFirehoseDestination,
      if (matchingEventTypes != null)
        'MatchingEventTypes':
            matchingEventTypes.map((e) => e.toValue()).toList(),
      if (snsDestination != null) 'SnsDestination': snsDestination,
    };
  }
}

/// The types of events that are sent to the event destination.
enum EventType {
  initiatedCall,
  ringing,
  answered,
  completedCall,
  busy,
  failed,
  noAnswer,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.initiatedCall:
        return 'INITIATED_CALL';
      case EventType.ringing:
        return 'RINGING';
      case EventType.answered:
        return 'ANSWERED';
      case EventType.completedCall:
        return 'COMPLETED_CALL';
      case EventType.busy:
        return 'BUSY';
      case EventType.failed:
        return 'FAILED';
      case EventType.noAnswer:
        return 'NO_ANSWER';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'INITIATED_CALL':
        return EventType.initiatedCall;
      case 'RINGING':
        return EventType.ringing;
      case 'ANSWERED':
        return EventType.answered;
      case 'COMPLETED_CALL':
        return EventType.completedCall;
      case 'BUSY':
        return EventType.busy;
      case 'FAILED':
        return EventType.failed;
      case 'NO_ANSWER':
        return EventType.noAnswer;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

/// An object that contains information about an event destination.
class GetConfigurationSetEventDestinationsResponse {
  final List<EventDestination>? eventDestinations;

  GetConfigurationSetEventDestinationsResponse({
    this.eventDestinations,
  });

  factory GetConfigurationSetEventDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetConfigurationSetEventDestinationsResponse(
      eventDestinations: (json['EventDestinations'] as List?)
          ?.whereNotNull()
          .map((e) => EventDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eventDestinations = this.eventDestinations;
    return {
      if (eventDestinations != null) 'EventDestinations': eventDestinations,
    };
  }
}

/// An object that contains information about an event destination that sends
/// data to Amazon Kinesis Data Firehose.
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of an IAM role that can write data to an
  /// Amazon Kinesis Data Firehose stream.
  final String? deliveryStreamArn;

  /// The Amazon Resource Name (ARN) of the Amazon Kinesis Data Firehose
  /// destination that you want to use in the event destination.
  final String? iamRoleArn;

  KinesisFirehoseDestination({
    this.deliveryStreamArn,
    this.iamRoleArn,
  });

  factory KinesisFirehoseDestination.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseDestination(
      deliveryStreamArn: json['DeliveryStreamArn'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamArn = this.deliveryStreamArn;
    final iamRoleArn = this.iamRoleArn;
    return {
      if (deliveryStreamArn != null) 'DeliveryStreamArn': deliveryStreamArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
    };
  }
}

/// An object that contains information about the configuration sets for your
/// account in the current region.
class ListConfigurationSetsResponse {
  /// An object that contains a list of configuration sets for your account in the
  /// current region.
  final List<String>? configurationSets;

  /// A token returned from a previous call to ListConfigurationSets to indicate
  /// the position in the list of configuration sets.
  final String? nextToken;

  ListConfigurationSetsResponse({
    this.configurationSets,
    this.nextToken,
  });

  factory ListConfigurationSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListConfigurationSetsResponse(
      configurationSets: (json['ConfigurationSets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSets = this.configurationSets;
    final nextToken = this.nextToken;
    return {
      if (configurationSets != null) 'ConfigurationSets': configurationSets,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// An object that defines a message that contains unformatted text.
class PlainTextMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  final String? languageCode;

  /// The plain (not SSML-formatted) text to deliver to the recipient.
  final String? text;

  /// The name of the voice that you want to use to deliver the message. For a
  /// complete list of supported voices, see the Amazon Polly Developer Guide.
  final String? voiceId;

  PlainTextMessageType({
    this.languageCode,
    this.text,
    this.voiceId,
  });

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final text = this.text;
    final voiceId = this.voiceId;
    return {
      if (languageCode != null) 'LanguageCode': languageCode,
      if (text != null) 'Text': text,
      if (voiceId != null) 'VoiceId': voiceId,
    };
  }
}

/// An object that defines a message that contains SSML-formatted text.
class SSMLMessageType {
  /// The language to use when delivering the message. For a complete list of
  /// supported languages, see the Amazon Polly Developer Guide.
  final String? languageCode;

  /// The SSML-formatted text to deliver to the recipient.
  final String? text;

  /// The name of the voice that you want to use to deliver the message. For a
  /// complete list of supported voices, see the Amazon Polly Developer Guide.
  final String? voiceId;

  SSMLMessageType({
    this.languageCode,
    this.text,
    this.voiceId,
  });

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final text = this.text;
    final voiceId = this.voiceId;
    return {
      if (languageCode != null) 'LanguageCode': languageCode,
      if (text != null) 'Text': text,
      if (voiceId != null) 'VoiceId': voiceId,
    };
  }
}

/// An object that that contains the Message ID of a Voice message that was sent
/// successfully.
class SendVoiceMessageResponse {
  /// A unique identifier for the voice message.
  final String? messageId;

  SendVoiceMessageResponse({
    this.messageId,
  });

  factory SendVoiceMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendVoiceMessageResponse(
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    return {
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

/// An object that contains information about an event destination that sends
/// data to Amazon SNS.
class SnsDestination {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to
  /// publish events to.
  final String? topicArn;

  SnsDestination({
    this.topicArn,
  });

  factory SnsDestination.fromJson(Map<String, dynamic> json) {
    return SnsDestination(
      topicArn: json['TopicArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      if (topicArn != null) 'TopicArn': topicArn,
    };
  }
}

/// An empty object that indicates that the event destination was updated
/// successfully.
class UpdateConfigurationSetEventDestinationResponse {
  UpdateConfigurationSetEventDestinationResponse();

  factory UpdateConfigurationSetEventDestinationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateConfigurationSetEventDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An object that contains a voice message and information about the recipient
/// that you want to send it to.
class VoiceMessageContent {
  final CallInstructionsMessageType? callInstructionsMessage;
  final PlainTextMessageType? plainTextMessage;
  final SSMLMessageType? sSMLMessage;

  VoiceMessageContent({
    this.callInstructionsMessage,
    this.plainTextMessage,
    this.sSMLMessage,
  });

  Map<String, dynamic> toJson() {
    final callInstructionsMessage = this.callInstructionsMessage;
    final plainTextMessage = this.plainTextMessage;
    final sSMLMessage = this.sSMLMessage;
    return {
      if (callInstructionsMessage != null)
        'CallInstructionsMessage': callInstructionsMessage,
      if (plainTextMessage != null) 'PlainTextMessage': plainTextMessage,
      if (sSMLMessage != null) 'SSMLMessage': sSMLMessage,
    };
  }
}

class AlreadyExistsException extends _s.GenericAwsException {
  AlreadyExistsException({String? type, String? message})
      : super(type: type, code: 'AlreadyExistsException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
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
