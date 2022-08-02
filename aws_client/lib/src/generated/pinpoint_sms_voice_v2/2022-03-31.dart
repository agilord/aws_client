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

/// Welcome to the <i>Amazon Pinpoint SMS and Voice, version 2 API
/// Reference</i>. This guide provides information about Amazon Pinpoint SMS and
/// Voice, version 2 API resources, including supported HTTP methods,
/// parameters, and schemas.
///
/// Amazon Pinpoint is an Amazon Web Services service that you can use to engage
/// with your recipients across multiple messaging channels. The Amazon Pinpoint
/// SMS and Voice, version 2 API provides programmatic access to options that
/// are unique to the SMS and voice channels and supplements the resources
/// provided by the Amazon Pinpoint API.
///
/// If you're new to Amazon Pinpoint, it's also helpful to review the <a
/// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/welcome.html">
/// Amazon Pinpoint Developer Guide</a>. The <i>Amazon Pinpoint Developer
/// Guide</i> provides tutorials, code samples, and procedures that demonstrate
/// how to use Amazon Pinpoint features programmatically and how to integrate
/// Amazon Pinpoint functionality into mobile apps and other types of
/// applications. The guide also provides key information, such as Amazon
/// Pinpoint integration with other Amazon Web Services services, and the quotas
/// that apply to use of the service.
class PinpointSmsVoiceV2 {
  final _s.JsonProtocol _protocol;
  PinpointSmsVoiceV2({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sms-voice',
            signingName: 'sms-voice',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Associates the specified origination identity with a pool.
  ///
  /// If the origination identity is a phone number and is already associated
  /// with another pool, an Error is returned. A sender ID can be associated
  /// with multiple pools.
  ///
  /// If the origination identity configuration doesn't match the pool's
  /// configuration, an Error is returned.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [isoCountryCode] :
  /// The new two-character code, in ISO 3166-1 alpha-2 format, for the country
  /// or region of the origination identity.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use, such as PhoneNumberId, PhoneNumberArn,
  /// SenderId, or SenderIdArn. You can use <a>DescribePhoneNumbers</a> to find
  /// the values for PhoneNumberId and PhoneNumberArn, while
  /// <a>DescribeSenderIds</a> can be used to get the values for SenderId and
  /// SenderIdArn.
  ///
  /// Parameter [poolId] :
  /// The pool to update with the new Identity. This value can be either the
  /// PoolId or PoolArn, and you can find these values using
  /// <a>DescribePools</a>.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  Future<AssociateOriginationIdentityResult> associateOriginationIdentity({
    required String isoCountryCode,
    required String originationIdentity,
    required String poolId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(isoCountryCode, 'isoCountryCode');
    ArgumentError.checkNotNull(originationIdentity, 'originationIdentity');
    ArgumentError.checkNotNull(poolId, 'poolId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.AssociateOriginationIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IsoCountryCode': isoCountryCode,
        'OriginationIdentity': originationIdentity,
        'PoolId': poolId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return AssociateOriginationIdentityResult.fromJson(jsonResponse.body);
  }

  /// Creates a new configuration set. After you create the configuration set,
  /// you can add one or more event destinations to it.
  ///
  /// A configuration set is a set of rules that you apply to the SMS and voice
  /// messages that you send.
  ///
  /// When you send a message, you can optionally specify a single configuration
  /// set.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The name to use for the new configuration set.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [tags] :
  /// An array of key and value pair tags that's associated with the new
  /// configuration set.
  Future<CreateConfigurationSetResult> createConfigurationSet({
    required String configurationSetName,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateConfigurationSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateConfigurationSetResult.fromJson(jsonResponse.body);
  }

  /// Creates a new event destination in a configuration set.
  ///
  /// An event destination is a location where you send message events. The
  /// event options are Amazon CloudWatch, Amazon Kinesis Data Firehose, or
  /// Amazon SNS. For example, when a message is delivered successfully, you can
  /// send information about that event to an event destination, or send
  /// notifications to endpoints that are subscribed to an Amazon SNS topic.
  ///
  /// Each configuration set can contain between 0 and 5 event destinations.
  /// Each event destination can contain a reference to a single destination,
  /// such as a CloudWatch or Kinesis Data Firehose destination.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// Either the name of the configuration set or the configuration set ARN to
  /// apply event logging to. The ConfigurateSetName and ConfigurationSetArn can
  /// be found using the <a>DescribeConfigurationSets</a> action.
  ///
  /// Parameter [eventDestinationName] :
  /// The name that identifies the event destination.
  ///
  /// Parameter [matchingEventTypes] :
  /// An array of event types that determine which events to log. If "ALL" is
  /// used, then Amazon Pinpoint logs every event type.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [cloudWatchLogsDestination] :
  /// An object that contains information about an event destination for logging
  /// to Amazon CloudWatch logs.
  ///
  /// Parameter [kinesisFirehoseDestination] :
  /// An object that contains information about an event destination for logging
  /// to Amazon Kinesis Data Firehose.
  ///
  /// Parameter [snsDestination] :
  /// An object that contains information about an event destination for logging
  /// to Amazon SNS.
  Future<CreateEventDestinationResult> createEventDestination({
    required String configurationSetName,
    required String eventDestinationName,
    required List<EventType> matchingEventTypes,
    String? clientToken,
    CloudWatchLogsDestination? cloudWatchLogsDestination,
    KinesisFirehoseDestination? kinesisFirehoseDestination,
    SnsDestination? snsDestination,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
    ArgumentError.checkNotNull(matchingEventTypes, 'matchingEventTypes');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateEventDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'EventDestinationName': eventDestinationName,
        'MatchingEventTypes':
            matchingEventTypes.map((e) => e.toValue()).toList(),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (cloudWatchLogsDestination != null)
          'CloudWatchLogsDestination': cloudWatchLogsDestination,
        if (kinesisFirehoseDestination != null)
          'KinesisFirehoseDestination': kinesisFirehoseDestination,
        if (snsDestination != null) 'SnsDestination': snsDestination,
      },
    );

    return CreateEventDestinationResult.fromJson(jsonResponse.body);
  }

  /// Creates a new opt-out list.
  ///
  /// If the opt-out list name already exists, an Error is returned.
  ///
  /// An opt-out list is a list of phone numbers that are opted out, meaning you
  /// can't send SMS or voice messages to them. If end user replies with the
  /// keyword "STOP," an entry for the phone number is added to the opt-out
  /// list. In addition to STOP, your recipients can use any supported opt-out
  /// keyword, such as CANCEL or OPTOUT. For a list of supported opt-out
  /// keywords, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-manage.html#channels-sms-manage-optout">
  /// SMS opt out </a> in the <i>Amazon Pinpoint User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [optOutListName] :
  /// The name of the new OptOutList.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) to associate with the new
  /// OptOutList.
  Future<CreateOptOutListResult> createOptOutList({
    required String optOutListName,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(optOutListName, 'optOutListName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreateOptOutList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OptOutListName': optOutListName,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateOptOutListResult.fromJson(jsonResponse.body);
  }

  /// Creates a new pool and associates the specified origination identity to
  /// the pool. A pool can include one or more phone numbers and SenderIds that
  /// are associated with your Amazon Web Services account.
  ///
  /// The new pool inherits its configuration from the specified origination
  /// identity. This includes keywords, message type, opt-out list, two-way
  /// configuration, and self-managed opt-out configuration. Deletion protection
  /// isn't inherited from the origination identity and defaults to false.
  ///
  /// If the origination identity is a phone number and is already associated
  /// with another pool, an Error is returned. A sender ID can be associated
  /// with multiple pools.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [isoCountryCode] :
  /// The new two-character code, in ISO 3166-1 alpha-2 format, for the country
  /// or region of the new pool.
  ///
  /// Parameter [messageType] :
  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't
  /// critical or time-sensitive.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> to find
  /// the values for PhoneNumberId and PhoneNumberArn while
  /// <a>DescribeSenderIds</a> can be used to get the values for SenderId and
  /// SenderIdArn.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the pool can't be
  /// deleted. You can change this value using the <a>UpdatePool</a> action.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) associated with the pool.
  Future<CreatePoolResult> createPool({
    required String isoCountryCode,
    required MessageType messageType,
    required String originationIdentity,
    String? clientToken,
    bool? deletionProtectionEnabled,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(isoCountryCode, 'isoCountryCode');
    ArgumentError.checkNotNull(messageType, 'messageType');
    ArgumentError.checkNotNull(originationIdentity, 'originationIdentity');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.CreatePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IsoCountryCode': isoCountryCode,
        'MessageType': messageType.toValue(),
        'OriginationIdentity': originationIdentity,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreatePoolResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing configuration set.
  ///
  /// A configuration set is a set of rules that you apply to voice and SMS
  /// messages that you send. In a configuration set, you can specify a
  /// destination for specific types of events related to voice and SMS
  /// messages.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set or the configuration set ARN that you
  /// want to delete. The ConfigurationSetName and ConfigurationSetArn can be
  /// found using the <a>DescribeConfigurationSets</a> action.
  Future<DeleteConfigurationSetResult> deleteConfigurationSet({
    required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteConfigurationSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
      },
    );

    return DeleteConfigurationSetResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing default message type on a configuration set.
  ///
  /// A message type is a type of messages that you plan to send. If you send
  /// account-related messages or time-sensitive messages such as one-time
  /// passcodes, choose <b>Transactional</b>. If you plan to send messages that
  /// contain marketing material or other promotional content, choose
  /// <b>Promotional</b>. This setting applies to your entire Amazon Web
  /// Services account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set or the configuration set Amazon Resource
  /// Name (ARN) to delete the default message type from. The
  /// ConfigurationSetName and ConfigurationSetArn can be found using the
  /// <a>DescribeConfigurationSets</a> action.
  Future<DeleteDefaultMessageTypeResult> deleteDefaultMessageType({
    required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteDefaultMessageType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
      },
    );

    return DeleteDefaultMessageTypeResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing default sender ID on a configuration set.
  ///
  /// A default sender ID is the identity that appears on recipients' devices
  /// when they receive SMS messages. Support for sender ID capabilities varies
  /// by country or region.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set or the configuration set Amazon Resource
  /// Name (ARN) to delete the default sender ID from. The ConfigurationSetName
  /// and ConfigurationSetArn can be found using the
  /// <a>DescribeConfigurationSets</a> action.
  Future<DeleteDefaultSenderIdResult> deleteDefaultSenderId({
    required String configurationSetName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteDefaultSenderId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
      },
    );

    return DeleteDefaultSenderIdResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing event destination.
  ///
  /// An event destination is a location where you send response information
  /// about the messages that you send. For example, when a message is delivered
  /// successfully, you can send information about that event to an Amazon
  /// CloudWatch destination, or send notifications to endpoints that are
  /// subscribed to an Amazon SNS topic.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set or the configuration set's Amazon
  /// Resource Name (ARN) to remove the event destination from. The
  /// ConfigurateSetName and ConfigurationSetArn can be found using the
  /// <a>DescribeConfigurationSets</a> action.
  ///
  /// Parameter [eventDestinationName] :
  /// The name of the event destination to delete.
  Future<DeleteEventDestinationResult> deleteEventDestination({
    required String configurationSetName,
    required String eventDestinationName,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteEventDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'EventDestinationName': eventDestinationName,
      },
    );

    return DeleteEventDestinationResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing keyword from an origination phone number or pool.
  ///
  /// A keyword is a word that you can search for on a particular phone number
  /// or pool. It is also a specific word or phrase that an end user can send to
  /// your number to elicit a response, such as an informational message or a
  /// special offer. When your number receives a message that begins with a
  /// keyword, Amazon Pinpoint responds with a customizable message.
  ///
  /// Keywords "HELP" and "STOP" can't be deleted or modified.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [keyword] :
  /// The keyword to delete.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// PoolId or PoolArn. You can use <a>DescribePhoneNumbers</a> to find the
  /// values for PhoneNumberId and PhoneNumberArn and <a>DescribePools</a> to
  /// find the values of PoolId and PoolArn.
  Future<DeleteKeywordResult> deleteKeyword({
    required String keyword,
    required String originationIdentity,
  }) async {
    ArgumentError.checkNotNull(keyword, 'keyword');
    ArgumentError.checkNotNull(originationIdentity, 'originationIdentity');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteKeyword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Keyword': keyword,
        'OriginationIdentity': originationIdentity,
      },
    );

    return DeleteKeywordResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing opt-out list. All opted out phone numbers in the
  /// opt-out list are deleted.
  ///
  /// If the specified opt-out list name doesn't exist or is in-use by an
  /// origination phone number or pool, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn of the OptOutList to delete. You can
  /// use <a>DescribeOptOutLists</a> to find the values for OptOutListName and
  /// OptOutListArn.
  Future<DeleteOptOutListResult> deleteOptOutList({
    required String optOutListName,
  }) async {
    ArgumentError.checkNotNull(optOutListName, 'optOutListName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteOptOutList'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OptOutListName': optOutListName,
      },
    );

    return DeleteOptOutListResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing opted out destination phone number from the specified
  /// opt-out list.
  ///
  /// Each destination phone number can only be deleted once every 30 days.
  ///
  /// If the specified destination phone number doesn't exist or if the opt-out
  /// list doesn't exist, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn to remove the phone number from.
  ///
  /// Parameter [optedOutNumber] :
  /// The phone number, in E.164 format, to remove from the OptOutList.
  Future<DeleteOptedOutNumberResult> deleteOptedOutNumber({
    required String optOutListName,
    required String optedOutNumber,
  }) async {
    ArgumentError.checkNotNull(optOutListName, 'optOutListName');
    ArgumentError.checkNotNull(optedOutNumber, 'optedOutNumber');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteOptedOutNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OptOutListName': optOutListName,
        'OptedOutNumber': optedOutNumber,
      },
    );

    return DeleteOptedOutNumberResult.fromJson(jsonResponse.body);
  }

  /// Deletes an existing pool. Deleting a pool disassociates all origination
  /// identities from that pool.
  ///
  /// If the pool status isn't active or if deletion protection is enabled, an
  /// Error is returned.
  ///
  /// A pool is a collection of phone numbers and SenderIds. A pool can include
  /// one or more phone numbers and SenderIds that are associated with your
  /// Amazon Web Services account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [poolId] :
  /// The PoolId or PoolArn of the pool to delete. You can use
  /// <a>DescribePools</a> to find the values for PoolId and PoolArn .
  Future<DeletePoolResult> deletePool({
    required String poolId,
  }) async {
    ArgumentError.checkNotNull(poolId, 'poolId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeletePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PoolId': poolId,
      },
    );

    return DeletePoolResult.fromJson(jsonResponse.body);
  }

  /// Deletes an account-level monthly spending limit override for sending text
  /// messages. Deleting a spend limit override will set the
  /// <code>EnforcedLimit</code> to equal the <code>MaxLimit</code>, which is
  /// controlled by Amazon Web Services. For more information on spend limits
  /// (quotas) see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/quotas.html">Amazon
  /// Pinpoint quotas </a> in the <i>Amazon Pinpoint Developer Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  Future<DeleteTextMessageSpendLimitOverrideResult>
      deleteTextMessageSpendLimitOverride() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteTextMessageSpendLimitOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteTextMessageSpendLimitOverrideResult.fromJson(
        jsonResponse.body);
  }

  /// Deletes an account level monthly spend limit override for sending voice
  /// messages. Deleting a spend limit override sets the
  /// <code>EnforcedLimit</code> equal to the <code>MaxLimit</code>, which is
  /// controlled by Amazon Web Services. For more information on spending limits
  /// (quotas) see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/quotas.html">Amazon
  /// Pinpoint quotas</a> in the <i>Amazon Pinpoint Developer Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  Future<DeleteVoiceMessageSpendLimitOverrideResult>
      deleteVoiceMessageSpendLimitOverride() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DeleteVoiceMessageSpendLimitOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteVoiceMessageSpendLimitOverrideResult.fromJson(
        jsonResponse.body);
  }

  /// Describes attributes of your Amazon Web Services account. The supported
  /// account attributes include account tier, which indicates whether your
  /// account is in the sandbox or production environment. When you're ready to
  /// move your account out of the sandbox, create an Amazon Web Services
  /// Support case for a service limit increase request.
  ///
  /// New Amazon Pinpoint accounts are placed into an SMS or voice sandbox. The
  /// sandbox protects both Amazon Web Services end recipients and SMS or voice
  /// recipients from fraud and abuse.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<DescribeAccountAttributesResult> describeAccountAttributes({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeAccountAttributes'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAccountAttributesResult.fromJson(jsonResponse.body);
  }

  /// Describes the current Amazon Pinpoint SMS Voice V2 resource quotas for
  /// your account. The description for a quota includes the quota name, current
  /// usage toward that quota, and the quota's maximum value.
  ///
  /// When you establish an Amazon Web Services account, the account has initial
  /// quotas on the maximum number of configuration sets, opt-out lists, phone
  /// numbers, and pools that you can create in a given Region. For more
  /// information see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/quotas.html">
  /// Amazon Pinpoint quotas </a> in the <i>Amazon Pinpoint Developer Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<DescribeAccountLimitsResult> describeAccountLimits({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeAccountLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeAccountLimitsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified configuration sets or all in your account.
  ///
  /// If you specify configuration set names, the output includes information
  /// for only the specified configuration sets. If you specify filters, the
  /// output includes information for only those configuration sets that meet
  /// the filter criteria. If you don't specify configuration set names or
  /// filters, the output includes information for all configuration sets.
  ///
  /// If you specify a configuration set name that isn't valid, an error is
  /// returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetNames] :
  /// An array of strings. Each element can be either a ConfigurationSetName or
  /// ConfigurationSetArn.
  ///
  /// Parameter [filters] :
  /// An array of filters to apply to the results that are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<DescribeConfigurationSetsResult> describeConfigurationSets({
    List<String>? configurationSetNames,
    List<ConfigurationSetFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeConfigurationSets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (configurationSetNames != null)
          'ConfigurationSetNames': configurationSetNames,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeConfigurationSetsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified keywords or all keywords on your origination phone
  /// number or pool.
  ///
  /// A keyword is a word that you can search for on a particular phone number
  /// or pool. It is also a specific word or phrase that an end user can send to
  /// your number to elicit a response, such as an informational message or a
  /// special offer. When your number receives a message that begins with a
  /// keyword, Amazon Pinpoint responds with a customizable message.
  ///
  /// If you specify a keyword that isn't valid, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> to find
  /// the values for PhoneNumberId and PhoneNumberArn while
  /// <a>DescribeSenderIds</a> can be used to get the values for SenderId and
  /// SenderIdArn.
  ///
  /// Parameter [filters] :
  /// An array of keyword filters to filter the results.
  ///
  /// Parameter [keywords] :
  /// An array of keywords to search for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<DescribeKeywordsResult> describeKeywords({
    required String originationIdentity,
    List<KeywordFilter>? filters,
    List<String>? keywords,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(originationIdentity, 'originationIdentity');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeKeywords'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OriginationIdentity': originationIdentity,
        if (filters != null) 'Filters': filters,
        if (keywords != null) 'Keywords': keywords,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeKeywordsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified opt-out list or all opt-out lists in your account.
  ///
  /// If you specify opt-out list names, the output includes information for
  /// only the specified opt-out lists. Opt-out lists include only those that
  /// meet the filter criteria. If you don't specify opt-out list names or
  /// filters, the output includes information for all opt-out lists.
  ///
  /// If you specify an opt-out list name that isn't valid, an Error is
  /// returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [optOutListNames] :
  /// The OptOutLists to show the details of. This is an array of strings that
  /// can be either the OptOutListName or OptOutListArn.
  Future<DescribeOptOutListsResult> describeOptOutLists({
    int? maxResults,
    String? nextToken,
    List<String>? optOutListNames,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeOptOutLists'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (optOutListNames != null) 'OptOutListNames': optOutListNames,
      },
    );

    return DescribeOptOutListsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified opted out destination numbers or all opted out
  /// destination numbers in an opt-out list.
  ///
  /// If you specify opted out numbers, the output includes information for only
  /// the specified opted out numbers. If you specify filters, the output
  /// includes information for only those opted out numbers that meet the filter
  /// criteria. If you don't specify opted out numbers or filters, the output
  /// includes information for all opted out destination numbers in your opt-out
  /// list.
  ///
  /// If you specify an opted out number that isn't valid, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn of the OptOutList. You can use
  /// <a>DescribeOptOutLists</a> to find the values for OptOutListName and
  /// OptOutListArn.
  ///
  /// Parameter [filters] :
  /// An array of OptedOutFilter objects to filter the results on.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [optedOutNumbers] :
  /// An array of phone numbers to search for in the OptOutList.
  Future<DescribeOptedOutNumbersResult> describeOptedOutNumbers({
    required String optOutListName,
    List<OptedOutFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? optedOutNumbers,
  }) async {
    ArgumentError.checkNotNull(optOutListName, 'optOutListName');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeOptedOutNumbers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OptOutListName': optOutListName,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (optedOutNumbers != null) 'OptedOutNumbers': optedOutNumbers,
      },
    );

    return DescribeOptedOutNumbersResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified origination phone number, or all the phone numbers
  /// in your account.
  ///
  /// If you specify phone number IDs, the output includes information for only
  /// the specified phone numbers. If you specify filters, the output includes
  /// information for only those phone numbers that meet the filter criteria. If
  /// you don't specify phone number IDs or filters, the output includes
  /// information for all phone numbers.
  ///
  /// If you specify a phone number ID that isn't valid, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// An array of PhoneNumberFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [phoneNumberIds] :
  /// The unique identifier of phone numbers to find information about. This is
  /// an array of strings that can be either the PhoneNumberId or
  /// PhoneNumberArn.
  Future<DescribePhoneNumbersResult> describePhoneNumbers({
    List<PhoneNumberFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? phoneNumberIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribePhoneNumbers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (phoneNumberIds != null) 'PhoneNumberIds': phoneNumberIds,
      },
    );

    return DescribePhoneNumbersResult.fromJson(jsonResponse.body);
  }

  /// Retrieves the specified pools or all pools associated with your Amazon Web
  /// Services account.
  ///
  /// If you specify pool IDs, the output includes information for only the
  /// specified pools. If you specify filters, the output includes information
  /// for only those pools that meet the filter criteria. If you don't specify
  /// pool IDs or filters, the output includes information for all pools.
  ///
  /// If you specify a pool ID that isn't valid, an Error is returned.
  ///
  /// A pool is a collection of phone numbers and SenderIds. A pool can include
  /// one or more phone numbers and SenderIds that are associated with your
  /// Amazon Web Services account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// An array of PoolFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [poolIds] :
  /// The unique identifier of pools to find. This is an array of strings that
  /// can be either the PoolId or PoolArn.
  Future<DescribePoolsResult> describePools({
    List<PoolFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<String>? poolIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribePools'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (poolIds != null) 'PoolIds': poolIds,
      },
    );

    return DescribePoolsResult.fromJson(jsonResponse.body);
  }

  /// Describes the specified SenderIds or all SenderIds associated with your
  /// Amazon Web Services account.
  ///
  /// If you specify SenderIds, the output includes information for only the
  /// specified SenderIds. If you specify filters, the output includes
  /// information for only those SenderIds that meet the filter criteria. If you
  /// don't specify SenderIds or filters, the output includes information for
  /// all SenderIds.
  ///
  /// f you specify a sender ID that isn't valid, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// An array of SenderIdFilter objects to filter the results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  ///
  /// Parameter [senderIds] :
  /// An array of SenderIdAndCountry objects to search for.
  Future<DescribeSenderIdsResult> describeSenderIds({
    List<SenderIdFilter>? filters,
    int? maxResults,
    String? nextToken,
    List<SenderIdAndCountry>? senderIds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeSenderIds'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (senderIds != null) 'SenderIds': senderIds,
      },
    );

    return DescribeSenderIdsResult.fromJson(jsonResponse.body);
  }

  /// Describes the current Amazon Pinpoint monthly spend limits for sending
  /// voice and text messages.
  ///
  /// When you establish an Amazon Web Services account, the account has initial
  /// monthly spend limit in a given Region. For more information on increasing
  /// your monthly spend limit, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-awssupport-spend-threshold.html">
  /// Requesting increases to your monthly SMS spending quota for Amazon
  /// Pinpoint </a> in the <i>Amazon Pinpoint User Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<DescribeSpendLimitsResult> describeSpendLimits({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DescribeSpendLimits'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return DescribeSpendLimitsResult.fromJson(jsonResponse.body);
  }

  /// Removes the specified origination identity from an existing pool.
  ///
  /// If the origination identity isn't associated with the specified pool, an
  /// Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [isoCountryCode] :
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> find the
  /// values for PhoneNumberId and PhoneNumberArn, or use
  /// <a>DescribeSenderIds</a> to get the values for SenderId and SenderIdArn.
  ///
  /// Parameter [poolId] :
  /// The unique identifier for the pool to disassociate with the origination
  /// identity. This value can be either the PoolId or PoolArn.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request. If you don't specify a client token, a randomly generated
  /// token is used for the request to ensure idempotency.
  Future<DisassociateOriginationIdentityResult>
      disassociateOriginationIdentity({
    required String isoCountryCode,
    required String originationIdentity,
    required String poolId,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(isoCountryCode, 'isoCountryCode');
    ArgumentError.checkNotNull(originationIdentity, 'originationIdentity');
    ArgumentError.checkNotNull(poolId, 'poolId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.DisassociateOriginationIdentity'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IsoCountryCode': isoCountryCode,
        'OriginationIdentity': originationIdentity,
        'PoolId': poolId,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      },
    );

    return DisassociateOriginationIdentityResult.fromJson(jsonResponse.body);
  }

  /// Lists all associated origination identities in your pool.
  ///
  /// If you specify filters, the output includes information for only those
  /// origination identities that meet the filter criteria.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [poolId] :
  /// The unique identifier for the pool. This value can be either the PoolId or
  /// PoolArn.
  ///
  /// Parameter [filters] :
  /// An array of PoolOriginationIdentitiesFilter objects to filter the
  /// results..
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return per each request.
  ///
  /// Parameter [nextToken] :
  /// The token to be used for the next set of paginated results. You don't need
  /// to supply a value for this field in the initial request.
  Future<ListPoolOriginationIdentitiesResult> listPoolOriginationIdentities({
    required String poolId,
    List<PoolOriginationIdentitiesFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(poolId, 'poolId');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.ListPoolOriginationIdentities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PoolId': poolId,
        if (filters != null) 'Filters': filters,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListPoolOriginationIdentitiesResult.fromJson(jsonResponse.body);
  }

  /// List all tags associated with a resource.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to query for.
  Future<ListTagsForResourceResult> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResult.fromJson(jsonResponse.body);
  }

  /// Creates or updates a keyword configuration on an origination phone number
  /// or pool.
  ///
  /// A keyword is a word that you can search for on a particular phone number
  /// or pool. It is also a specific word or phrase that an end user can send to
  /// your number to elicit a response, such as an informational message or a
  /// special offer. When your number receives a message that begins with a
  /// keyword, Amazon Pinpoint responds with a customizable message.
  ///
  /// If you specify a keyword that isn't valid, an Error is returned.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [keyword] :
  /// The new keyword to add.
  ///
  /// Parameter [keywordMessage] :
  /// The message associated with the keyword.
  ///
  /// <ul>
  /// <li>
  /// AUTOMATIC_RESPONSE: A message is sent to the recipient.
  /// </li>
  /// <li>
  /// OPT_OUT: Keeps the recipient from receiving future messages.
  /// </li>
  /// <li>
  /// OPT_IN: The recipient wants to receive future messages.
  /// </li>
  /// </ul>
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use such as a PhoneNumberId, PhoneNumberArn,
  /// SenderId or SenderIdArn. You can use <a>DescribePhoneNumbers</a> get the
  /// values for PhoneNumberId and PhoneNumberArn while <a>DescribeSenderIds</a>
  /// can be used to get the values for SenderId and SenderIdArn.
  ///
  /// Parameter [keywordAction] :
  /// The action to perform for the new keyword when it is received.
  Future<PutKeywordResult> putKeyword({
    required String keyword,
    required String keywordMessage,
    required String originationIdentity,
    KeywordAction? keywordAction,
  }) async {
    ArgumentError.checkNotNull(keyword, 'keyword');
    ArgumentError.checkNotNull(keywordMessage, 'keywordMessage');
    ArgumentError.checkNotNull(originationIdentity, 'originationIdentity');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.PutKeyword'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Keyword': keyword,
        'KeywordMessage': keywordMessage,
        'OriginationIdentity': originationIdentity,
        if (keywordAction != null) 'KeywordAction': keywordAction.toValue(),
      },
    );

    return PutKeywordResult.fromJson(jsonResponse.body);
  }

  /// Creates an opted out destination phone number in the opt-out list.
  ///
  /// If the destination phone number isn't valid or if the specified opt-out
  /// list doesn't exist, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [optOutListName] :
  /// The OptOutListName or OptOutListArn to add the phone number to.
  ///
  /// Parameter [optedOutNumber] :
  /// The phone number to add to the OptOutList in E.164 format.
  Future<PutOptedOutNumberResult> putOptedOutNumber({
    required String optOutListName,
    required String optedOutNumber,
  }) async {
    ArgumentError.checkNotNull(optOutListName, 'optOutListName');
    ArgumentError.checkNotNull(optedOutNumber, 'optedOutNumber');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.PutOptedOutNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'OptOutListName': optOutListName,
        'OptedOutNumber': optedOutNumber,
      },
    );

    return PutOptedOutNumberResult.fromJson(jsonResponse.body);
  }

  /// Releases an existing origination phone number in your account. Once
  /// released, a phone number is no longer available for sending messages.
  ///
  /// If the origination phone number has deletion protection enabled or is
  /// associated with a pool, an Error is returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [phoneNumberId] :
  /// The PhoneNumberId or PhoneNumberArn of the phone number to release. You
  /// can use <a>DescribePhoneNumbers</a> to get the values for PhoneNumberId
  /// and PhoneNumberArn.
  Future<ReleasePhoneNumberResult> releasePhoneNumber({
    required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.ReleasePhoneNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PhoneNumberId': phoneNumberId,
      },
    );

    return ReleasePhoneNumberResult.fromJson(jsonResponse.body);
  }

  /// Request an origination phone number for use in your account. For more
  /// information on phone number request see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/settings-sms-request-number.html">
  /// Requesting a number </a> in the <i>Amazon Pinpoint User Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [isoCountryCode] :
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  ///
  /// Parameter [messageType] :
  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't
  /// critical or time-sensitive.
  ///
  /// Parameter [numberCapabilities] :
  /// Indicates if the phone number will be used for text messages, voice
  /// messages, or both.
  ///
  /// Parameter [numberType] :
  /// The type of phone number to request.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. If you don't specify a client token, a
  /// randomly generated token is used for the request to ensure idempotency.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the phone number can't
  /// be deleted.
  ///
  /// Parameter [optOutListName] :
  /// The name of the OptOutList to associate with the phone number. You can use
  /// the OutOutListName or OptPutListArn.
  ///
  /// Parameter [poolId] :
  /// The pool to associated with the phone number. You can use the PoolId or
  /// PoolArn.
  ///
  /// Parameter [registrationId] :
  /// Use this field to attach your phone number for an external registration
  /// process.
  ///
  /// Parameter [tags] :
  /// An array of tags (key and value pairs) associate with the requested phone
  /// number.
  Future<RequestPhoneNumberResult> requestPhoneNumber({
    required String isoCountryCode,
    required MessageType messageType,
    required List<NumberCapability> numberCapabilities,
    required RequestableNumberType numberType,
    String? clientToken,
    bool? deletionProtectionEnabled,
    String? optOutListName,
    String? poolId,
    String? registrationId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(isoCountryCode, 'isoCountryCode');
    ArgumentError.checkNotNull(messageType, 'messageType');
    ArgumentError.checkNotNull(numberCapabilities, 'numberCapabilities');
    ArgumentError.checkNotNull(numberType, 'numberType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.RequestPhoneNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IsoCountryCode': isoCountryCode,
        'MessageType': messageType.toValue(),
        'NumberCapabilities':
            numberCapabilities.map((e) => e.toValue()).toList(),
        'NumberType': numberType.toValue(),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (optOutListName != null) 'OptOutListName': optOutListName,
        if (poolId != null) 'PoolId': poolId,
        if (registrationId != null) 'RegistrationId': registrationId,
        if (tags != null) 'Tags': tags,
      },
    );

    return RequestPhoneNumberResult.fromJson(jsonResponse.body);
  }

  /// Creates a new text message and sends it to a recipient's phone number.
  ///
  /// SMS throughput limits are measured in Message Parts per Second (MPS). Your
  /// MPS limit depends on the destination country of your messages, as well as
  /// the type of phone number (origination number) that you use to send the
  /// message. For more information, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-limitations-mps.html">Message
  /// Parts per Second (MPS) limits</a> in the <i>Amazon Pinpoint User
  /// Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use. This can be either the
  /// ConfigurationSetName or ConfigurationSetArn.
  ///
  /// Parameter [context] :
  /// You can specify custom data in this field. If you do, that data is logged
  /// to the event destination.
  ///
  /// Parameter [destinationCountryParameters] :
  /// This field is used for any country-specific registration requirements.
  /// Currently, this setting is only used when you send messages to recipients
  /// in India using a sender ID. For more information see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-senderid-india.html">Special
  /// requirements for sending SMS messages to recipients in India</a>.
  ///
  /// Parameter [dryRun] :
  /// When set to true, the message is checked and validated, but isn't sent to
  /// the end recipient.
  ///
  /// Parameter [keyword] :
  /// When you register a short code in the US, you must specify a program name.
  /// If you don’t have a US short code, omit this attribute.
  ///
  /// Parameter [maxPrice] :
  /// The maximum amount that you want to spend, in US dollars, per each text
  /// message part. A text message can contain multiple parts.
  ///
  /// Parameter [messageBody] :
  /// The body of the text message.
  ///
  /// Parameter [messageType] :
  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't
  /// critical or time-sensitive.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity of the message. This can be either the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, SenderId, SenderIdArn, PoolId,
  /// or PoolArn.
  ///
  /// Parameter [timeToLive] :
  /// How long the text message is valid for. By default this is 72 hours.
  Future<SendTextMessageResult> sendTextMessage({
    required String destinationPhoneNumber,
    String? configurationSetName,
    Map<String, String>? context,
    Map<DestinationCountryParameterKey, String>? destinationCountryParameters,
    bool? dryRun,
    String? keyword,
    String? maxPrice,
    String? messageBody,
    MessageType? messageType,
    String? originationIdentity,
    int? timeToLive,
  }) async {
    ArgumentError.checkNotNull(
        destinationPhoneNumber, 'destinationPhoneNumber');
    _s.validateNumRange(
      'timeToLive',
      timeToLive,
      5,
      259200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SendTextMessage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationPhoneNumber': destinationPhoneNumber,
        if (configurationSetName != null)
          'ConfigurationSetName': configurationSetName,
        if (context != null) 'Context': context,
        if (destinationCountryParameters != null)
          'DestinationCountryParameters': destinationCountryParameters
              .map((k, e) => MapEntry(k.toValue(), e)),
        if (dryRun != null) 'DryRun': dryRun,
        if (keyword != null) 'Keyword': keyword,
        if (maxPrice != null) 'MaxPrice': maxPrice,
        if (messageBody != null) 'MessageBody': messageBody,
        if (messageType != null) 'MessageType': messageType.toValue(),
        if (originationIdentity != null)
          'OriginationIdentity': originationIdentity,
        if (timeToLive != null) 'TimeToLive': timeToLive,
      },
    );

    return SendTextMessageResult.fromJson(jsonResponse.body);
  }

  /// Allows you to send a request that sends a text message through Amazon
  /// Pinpoint. This operation uses <a
  /// href="http://aws.amazon.com/polly/">Amazon Polly</a> to convert a text
  /// script into a voice message.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [destinationPhoneNumber] :
  /// The destination phone number in E.164 format.
  ///
  /// Parameter [originationIdentity] :
  /// The origination identity to use for the voice call. This can be the
  /// PhoneNumber, PhoneNumberId, PhoneNumberArn, PoolId, or PoolArn.
  ///
  /// Parameter [configurationSetName] :
  /// The name of the configuration set to use. This can be either the
  /// ConfigurationSetName or ConfigurationSetArn.
  ///
  /// Parameter [context] :
  /// You can specify custom data in this field. If you do, that data is logged
  /// to the event destination.
  ///
  /// Parameter [dryRun] :
  /// When set to true, the message is checked and validated, but isn't sent to
  /// the end recipient.
  ///
  /// Parameter [maxPricePerMinute] :
  /// The maximum amount to spend per voice message, in US dollars.
  ///
  /// Parameter [messageBody] :
  /// The text to convert to a voice message.
  ///
  /// Parameter [messageBodyTextType] :
  /// Specifies if the MessageBody field contains text or <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">speech
  /// synthesis markup language (SSML)</a>.
  ///
  /// <ul>
  /// <li>
  /// TEXT: This is the default value. When used the maximum character limit is
  /// 3000.
  /// </li>
  /// <li>
  /// SSML: When used the maximum character limit is 6000 including SSML
  /// tagging.
  /// </li>
  /// </ul>
  ///
  /// Parameter [timeToLive] :
  /// How long the voice message is valid for. By default this is 72 hours.
  ///
  /// Parameter [voiceId] :
  /// The voice for the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/what-is.html">Amazon
  /// Polly</a> service to use. By default this is set to "MATTHEW".
  Future<SendVoiceMessageResult> sendVoiceMessage({
    required String destinationPhoneNumber,
    required String originationIdentity,
    String? configurationSetName,
    Map<String, String>? context,
    bool? dryRun,
    String? maxPricePerMinute,
    String? messageBody,
    VoiceMessageBodyTextType? messageBodyTextType,
    int? timeToLive,
    VoiceId? voiceId,
  }) async {
    ArgumentError.checkNotNull(
        destinationPhoneNumber, 'destinationPhoneNumber');
    ArgumentError.checkNotNull(originationIdentity, 'originationIdentity');
    _s.validateNumRange(
      'timeToLive',
      timeToLive,
      5,
      259200,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SendVoiceMessage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DestinationPhoneNumber': destinationPhoneNumber,
        'OriginationIdentity': originationIdentity,
        if (configurationSetName != null)
          'ConfigurationSetName': configurationSetName,
        if (context != null) 'Context': context,
        if (dryRun != null) 'DryRun': dryRun,
        if (maxPricePerMinute != null) 'MaxPricePerMinute': maxPricePerMinute,
        if (messageBody != null) 'MessageBody': messageBody,
        if (messageBodyTextType != null)
          'MessageBodyTextType': messageBodyTextType.toValue(),
        if (timeToLive != null) 'TimeToLive': timeToLive,
        if (voiceId != null) 'VoiceId': voiceId.toValue(),
      },
    );

    return SendVoiceMessageResult.fromJson(jsonResponse.body);
  }

  /// Sets the default message type on a configuration set.
  ///
  /// Choose the category of SMS messages that you plan to send from this
  /// account. If you send account-related messages or time-sensitive messages
  /// such as one-time passcodes, choose <b>Transactional</b>. If you plan to
  /// send messages that contain marketing material or other promotional
  /// content, choose <b>Promotional</b>. This setting applies to your entire
  /// Amazon Web Services account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The configuration set to update with a new default message type. This
  /// field can be the ConsigurationSetName or ConfigurationSetArn.
  ///
  /// Parameter [messageType] :
  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't
  /// critical or time-sensitive.
  Future<SetDefaultMessageTypeResult> setDefaultMessageType({
    required String configurationSetName,
    required MessageType messageType,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(messageType, 'messageType');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetDefaultMessageType'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'MessageType': messageType.toValue(),
      },
    );

    return SetDefaultMessageTypeResult.fromJson(jsonResponse.body);
  }

  /// Sets default sender ID on a configuration set.
  ///
  /// When sending a text message to a destination country that supports sender
  /// IDs, the default sender ID on the configuration set specified will be used
  /// if no dedicated origination phone numbers or registered sender IDs are
  /// available in your account.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The configuration set to updated with a new default SenderId. This field
  /// can be the ConsigurationSetName or ConfigurationSetArn.
  ///
  /// Parameter [senderId] :
  /// The current sender ID for the configuration set. When sending a text
  /// message to a destination country which supports SenderIds, the default
  /// sender ID on the configuration set specified on <a>SendTextMessage</a>
  /// will be used if no dedicated origination phone numbers or registered
  /// SenderIds are available in your account, instead of a generic sender ID,
  /// such as 'NOTICE'.
  Future<SetDefaultSenderIdResult> setDefaultSenderId({
    required String configurationSetName,
    required String senderId,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(senderId, 'senderId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetDefaultSenderId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'SenderId': senderId,
      },
    );

    return SetDefaultSenderIdResult.fromJson(jsonResponse.body);
  }

  /// Sets an account level monthly spend limit override for sending text
  /// messages. The requested spend limit must be less than or equal to the
  /// <code>MaxLimit</code>, which is set by Amazon Web Services.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [monthlyLimit] :
  /// The new monthly limit to enforce on text messages.
  Future<SetTextMessageSpendLimitOverrideResult>
      setTextMessageSpendLimitOverride({
    required int monthlyLimit,
  }) async {
    ArgumentError.checkNotNull(monthlyLimit, 'monthlyLimit');
    _s.validateNumRange(
      'monthlyLimit',
      monthlyLimit,
      0,
      1000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetTextMessageSpendLimitOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonthlyLimit': monthlyLimit,
      },
    );

    return SetTextMessageSpendLimitOverrideResult.fromJson(jsonResponse.body);
  }

  /// Sets an account level monthly spend limit override for sending voice
  /// messages. The requested spend limit must be less than or equal to the
  /// <code>MaxLimit</code>, which is set by Amazon Web Services.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [monthlyLimit] :
  /// The new monthly limit to enforce on voice messages.
  Future<SetVoiceMessageSpendLimitOverrideResult>
      setVoiceMessageSpendLimitOverride({
    required int monthlyLimit,
  }) async {
    ArgumentError.checkNotNull(monthlyLimit, 'monthlyLimit');
    _s.validateNumRange(
      'monthlyLimit',
      monthlyLimit,
      0,
      1000000000,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.SetVoiceMessageSpendLimitOverride'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonthlyLimit': monthlyLimit,
      },
    );

    return SetVoiceMessageSpendLimitOverrideResult.fromJson(jsonResponse.body);
  }

  /// Adds or overwrites only the specified tags for the specified Amazon
  /// Pinpoint SMS Voice, version 2 resource. When you specify an existing tag
  /// key, the value is overwritten with the new value. Each resource can have a
  /// maximum of 50 tags. Each tag consists of a key and an optional value. Tag
  /// keys must be unique per resource. For more information about tags, see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/tagging-resources.html">
  /// Tagging Amazon Pinpoint resources</a> in the <i>Amazon Pinpoint Developer
  /// Guide</i>.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// An array of key and value pair tags that are associated with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Removes the association of the specified tags from an Amazon Pinpoint SMS
  /// Voice V2 resource. For more information on tags see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/developerguide/tagging-resources.html">
  /// Tagging Amazon Pinpoint resources</a> in the <i>Amazon Pinpoint Developer
  /// Guide</i>.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// An array of tag key values to unassociate with the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates an existing event destination in a configuration set. You can
  /// update the IAM role ARN for CloudWatch Logs and Kinesis Data Firehose. You
  /// can also enable or disable the event destination.
  ///
  /// You may want to update an event destination to change its matching event
  /// types or updating the destination resource ARN. You can't change an event
  /// destination's type between CloudWatch Logs, Kinesis Data Firehose, and
  /// Amazon SNS.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configurationSetName] :
  /// The configuration set to update with the new event destination. Valid
  /// values for this can be the ConfigurationSetName or ConfigurationSetArn.
  ///
  /// Parameter [eventDestinationName] :
  /// The name to use for the event destination.
  ///
  /// Parameter [cloudWatchLogsDestination] :
  /// An object that contains information about an event destination that sends
  /// data to CloudWatch Logs.
  ///
  /// Parameter [enabled] :
  /// When set to true logging is enabled.
  ///
  /// Parameter [kinesisFirehoseDestination] :
  /// An object that contains information about an event destination for logging
  /// to Kinesis Data Firehose.
  ///
  /// Parameter [matchingEventTypes] :
  /// An array of event types that determine which events to log.
  ///
  /// Parameter [snsDestination] :
  /// An object that contains information about an event destination that sends
  /// data to Amazon SNS.
  Future<UpdateEventDestinationResult> updateEventDestination({
    required String configurationSetName,
    required String eventDestinationName,
    CloudWatchLogsDestination? cloudWatchLogsDestination,
    bool? enabled,
    KinesisFirehoseDestination? kinesisFirehoseDestination,
    List<EventType>? matchingEventTypes,
    SnsDestination? snsDestination,
  }) async {
    ArgumentError.checkNotNull(configurationSetName, 'configurationSetName');
    ArgumentError.checkNotNull(eventDestinationName, 'eventDestinationName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UpdateEventDestination'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ConfigurationSetName': configurationSetName,
        'EventDestinationName': eventDestinationName,
        if (cloudWatchLogsDestination != null)
          'CloudWatchLogsDestination': cloudWatchLogsDestination,
        if (enabled != null) 'Enabled': enabled,
        if (kinesisFirehoseDestination != null)
          'KinesisFirehoseDestination': kinesisFirehoseDestination,
        if (matchingEventTypes != null)
          'MatchingEventTypes':
              matchingEventTypes.map((e) => e.toValue()).toList(),
        if (snsDestination != null) 'SnsDestination': snsDestination,
      },
    );

    return UpdateEventDestinationResult.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of an existing origination phone number. You can
  /// update the opt-out list, enable or disable two-way messaging, change the
  /// TwoWayChannelArn, enable or disable self-managed opt-outs, and enable or
  /// disable deletion protection.
  ///
  /// If the origination phone number is associated with a pool, an Error is
  /// returned.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [phoneNumberId] :
  /// The unique identifier of the phone number. Valid values for this field can
  /// be either the PhoneNumberId or PhoneNumberArn.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// By default this is set to false. When set to true the phone number can't
  /// be deleted.
  ///
  /// Parameter [optOutListName] :
  /// The OptOutList to add the phone number to. Valid values for this field can
  /// be either the OutOutListName or OutOutListArn.
  ///
  /// Parameter [selfManagedOptOutsEnabled] :
  /// By default this is set to false. When an end recipient sends a message
  /// that begins with HELP or STOP to one of your dedicated numbers, Amazon
  /// Pinpoint automatically replies with a customizable message and adds the
  /// end recipient to the OptOutList. When set to true you're responsible for
  /// responding to HELP and STOP requests. You're also responsible for tracking
  /// and honoring opt-out requests.
  ///
  /// Parameter [twoWayChannelArn] :
  /// The Amazon Resource Name (ARN) of the two way channel.
  ///
  /// Parameter [twoWayEnabled] :
  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  Future<UpdatePhoneNumberResult> updatePhoneNumber({
    required String phoneNumberId,
    bool? deletionProtectionEnabled,
    String? optOutListName,
    bool? selfManagedOptOutsEnabled,
    String? twoWayChannelArn,
    bool? twoWayEnabled,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UpdatePhoneNumber'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PhoneNumberId': phoneNumberId,
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (optOutListName != null) 'OptOutListName': optOutListName,
        if (selfManagedOptOutsEnabled != null)
          'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
        if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
        if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
      },
    );

    return UpdatePhoneNumberResult.fromJson(jsonResponse.body);
  }

  /// Updates the configuration of an existing pool. You can update the opt-out
  /// list, enable or disable two-way messaging, change the
  /// <code>TwoWayChannelArn</code>, enable or disable self-managed opt-outs,
  /// enable or disable deletion protection, and enable or disable shared
  /// routes.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [poolId] :
  /// The unique identifier of the pool to update. Valid values are either the
  /// PoolId or PoolArn.
  ///
  /// Parameter [deletionProtectionEnabled] :
  /// When set to true the pool can't be deleted.
  ///
  /// Parameter [optOutListName] :
  /// The OptOutList to associate with the pool. Valid values are either
  /// OptOutListName or OptOutListArn.
  ///
  /// Parameter [selfManagedOptOutsEnabled] :
  /// By default this is set to false. When an end recipient sends a message
  /// that begins with HELP or STOP to one of your dedicated numbers, Amazon
  /// Pinpoint automatically replies with a customizable message and adds the
  /// end recipient to the OptOutList. When set to true you're responsible for
  /// responding to HELP and STOP requests. You're also responsible for tracking
  /// and honoring opt-out requests.
  ///
  /// Parameter [sharedRoutesEnabled] :
  /// Indicates whether shared routes are enabled for the pool.
  ///
  /// Parameter [twoWayChannelArn] :
  /// The Amazon Resource Name (ARN) of the two way channel.
  ///
  /// Parameter [twoWayEnabled] :
  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  Future<UpdatePoolResult> updatePool({
    required String poolId,
    bool? deletionProtectionEnabled,
    String? optOutListName,
    bool? selfManagedOptOutsEnabled,
    bool? sharedRoutesEnabled,
    String? twoWayChannelArn,
    bool? twoWayEnabled,
  }) async {
    ArgumentError.checkNotNull(poolId, 'poolId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'PinpointSMSVoiceV2.UpdatePool'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PoolId': poolId,
        if (deletionProtectionEnabled != null)
          'DeletionProtectionEnabled': deletionProtectionEnabled,
        if (optOutListName != null) 'OptOutListName': optOutListName,
        if (selfManagedOptOutsEnabled != null)
          'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
        if (sharedRoutesEnabled != null)
          'SharedRoutesEnabled': sharedRoutesEnabled,
        if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
        if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
      },
    );

    return UpdatePoolResult.fromJson(jsonResponse.body);
  }
}

/// Displays the attributes associated with a single Amazon Web Services
/// account.
class AccountAttribute {
  /// The name of the account attribute.
  final AccountAttributeName name;

  /// The value associated with the account attribute name.
  final String value;

  AccountAttribute({
    required this.name,
    required this.value,
  });

  factory AccountAttribute.fromJson(Map<String, dynamic> json) {
    return AccountAttribute(
      name: (json['Name'] as String).toAccountAttributeName(),
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name.toValue(),
      'Value': value,
    };
  }
}

enum AccountAttributeName {
  accountTier,
}

extension on AccountAttributeName {
  String toValue() {
    switch (this) {
      case AccountAttributeName.accountTier:
        return 'ACCOUNT_TIER';
    }
  }
}

extension on String {
  AccountAttributeName toAccountAttributeName() {
    switch (this) {
      case 'ACCOUNT_TIER':
        return AccountAttributeName.accountTier;
    }
    throw Exception('$this is not known in enum AccountAttributeName');
  }
}

/// The current resource quotas associated with an Amazon Web Services account.
class AccountLimit {
  /// The Amazon Web Services set limit for that resource type, in US dollars.
  final int max;

  /// The name of the attribute to apply the account limit to.
  final AccountLimitName name;

  /// The current amount that has been spent, in US dollars.
  final int used;

  AccountLimit({
    required this.max,
    required this.name,
    required this.used,
  });

  factory AccountLimit.fromJson(Map<String, dynamic> json) {
    return AccountLimit(
      max: json['Max'] as int,
      name: (json['Name'] as String).toAccountLimitName(),
      used: json['Used'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final max = this.max;
    final name = this.name;
    final used = this.used;
    return {
      'Max': max,
      'Name': name.toValue(),
      'Used': used,
    };
  }
}

enum AccountLimitName {
  phoneNumbers,
  pools,
  configurationSets,
  optOutLists,
}

extension on AccountLimitName {
  String toValue() {
    switch (this) {
      case AccountLimitName.phoneNumbers:
        return 'PHONE_NUMBERS';
      case AccountLimitName.pools:
        return 'POOLS';
      case AccountLimitName.configurationSets:
        return 'CONFIGURATION_SETS';
      case AccountLimitName.optOutLists:
        return 'OPT_OUT_LISTS';
    }
  }
}

extension on String {
  AccountLimitName toAccountLimitName() {
    switch (this) {
      case 'PHONE_NUMBERS':
        return AccountLimitName.phoneNumbers;
      case 'POOLS':
        return AccountLimitName.pools;
      case 'CONFIGURATION_SETS':
        return AccountLimitName.configurationSets;
      case 'OPT_OUT_LISTS':
        return AccountLimitName.optOutLists;
    }
    throw Exception('$this is not known in enum AccountLimitName');
  }
}

class AssociateOriginationIdentityResult {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  /// The PhoneNumberId or SenderId of the origination identity.
  final String? originationIdentity;

  /// The PhoneNumberArn or SenderIdArn of the origination identity.
  final String? originationIdentityArn;

  /// The Amazon Resource Name (ARN) of the pool that is now associated with the
  /// origination identity.
  final String? poolArn;

  /// The PoolId of the pool that is now associated with the origination identity.
  final String? poolId;

  AssociateOriginationIdentityResult({
    this.isoCountryCode,
    this.originationIdentity,
    this.originationIdentityArn,
    this.poolArn,
    this.poolId,
  });

  factory AssociateOriginationIdentityResult.fromJson(
      Map<String, dynamic> json) {
    return AssociateOriginationIdentityResult(
      isoCountryCode: json['IsoCountryCode'] as String?,
      originationIdentity: json['OriginationIdentity'] as String?,
      originationIdentityArn: json['OriginationIdentityArn'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final originationIdentity = this.originationIdentity;
    final originationIdentityArn = this.originationIdentityArn;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    return {
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (originationIdentity != null)
        'OriginationIdentity': originationIdentity,
      if (originationIdentityArn != null)
        'OriginationIdentityArn': originationIdentityArn,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
    };
  }
}

/// Contains the destination configuration to use when publishing message
/// sending events.
class CloudWatchLogsDestination {
  /// The Amazon Resource Name (ARN) of an Amazon Identity and Access Management
  /// (IAM) role that is able to write event data to an Amazon CloudWatch
  /// destination.
  final String iamRoleArn;

  /// The name of the Amazon CloudWatch log group that you want to record events
  /// in.
  final String logGroupArn;

  CloudWatchLogsDestination({
    required this.iamRoleArn,
    required this.logGroupArn,
  });

  factory CloudWatchLogsDestination.fromJson(Map<String, dynamic> json) {
    return CloudWatchLogsDestination(
      iamRoleArn: json['IamRoleArn'] as String,
      logGroupArn: json['LogGroupArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final iamRoleArn = this.iamRoleArn;
    final logGroupArn = this.logGroupArn;
    return {
      'IamRoleArn': iamRoleArn,
      'LogGroupArn': logGroupArn,
    };
  }
}

/// The information for configuration sets that meet a specified criteria.
class ConfigurationSetFilter {
  /// The name of the attribute to filter on.
  final ConfigurationSetFilterName name;

  /// An array values to filter for.
  final List<String> values;

  ConfigurationSetFilter({
    required this.name,
    required this.values,
  });

  factory ConfigurationSetFilter.fromJson(Map<String, dynamic> json) {
    return ConfigurationSetFilter(
      name: (json['Name'] as String).toConfigurationSetFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum ConfigurationSetFilterName {
  eventDestinationName,
  matchingEventTypes,
  defaultMessageType,
  defaultSenderId,
}

extension on ConfigurationSetFilterName {
  String toValue() {
    switch (this) {
      case ConfigurationSetFilterName.eventDestinationName:
        return 'event-destination-name';
      case ConfigurationSetFilterName.matchingEventTypes:
        return 'matching-event-types';
      case ConfigurationSetFilterName.defaultMessageType:
        return 'default-message-type';
      case ConfigurationSetFilterName.defaultSenderId:
        return 'default-sender-id';
    }
  }
}

extension on String {
  ConfigurationSetFilterName toConfigurationSetFilterName() {
    switch (this) {
      case 'event-destination-name':
        return ConfigurationSetFilterName.eventDestinationName;
      case 'matching-event-types':
        return ConfigurationSetFilterName.matchingEventTypes;
      case 'default-message-type':
        return ConfigurationSetFilterName.defaultMessageType;
      case 'default-sender-id':
        return ConfigurationSetFilterName.defaultSenderId;
    }
    throw Exception('$this is not known in enum ConfigurationSetFilterName');
  }
}

/// Information related to a given configuration set in your Amazon Web Services
/// account.
class ConfigurationSetInformation {
  /// The Resource Name (ARN) of the ConfigurationSet.
  final String configurationSetArn;

  /// The name of the ConfigurationSet.
  final String configurationSetName;

  /// The time when the ConfigurationSet was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// An array of EventDestination objects that describe any events to log and
  /// where to log them.
  final List<EventDestination> eventDestinations;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final MessageType? defaultMessageType;

  /// The default sender ID used by the ConfigurationSet.
  final String? defaultSenderId;

  ConfigurationSetInformation({
    required this.configurationSetArn,
    required this.configurationSetName,
    required this.createdTimestamp,
    required this.eventDestinations,
    this.defaultMessageType,
    this.defaultSenderId,
  });

  factory ConfigurationSetInformation.fromJson(Map<String, dynamic> json) {
    return ConfigurationSetInformation(
      configurationSetArn: json['ConfigurationSetArn'] as String,
      configurationSetName: json['ConfigurationSetName'] as String,
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      eventDestinations: (json['EventDestinations'] as List)
          .whereNotNull()
          .map((e) => EventDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultMessageType:
          (json['DefaultMessageType'] as String?)?.toMessageType(),
      defaultSenderId: json['DefaultSenderId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final createdTimestamp = this.createdTimestamp;
    final eventDestinations = this.eventDestinations;
    final defaultMessageType = this.defaultMessageType;
    final defaultSenderId = this.defaultSenderId;
    return {
      'ConfigurationSetArn': configurationSetArn,
      'ConfigurationSetName': configurationSetName,
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'EventDestinations': eventDestinations,
      if (defaultMessageType != null)
        'DefaultMessageType': defaultMessageType.toValue(),
      if (defaultSenderId != null) 'DefaultSenderId': defaultSenderId,
    };
  }
}

class CreateConfigurationSetResult {
  /// The Amazon Resource Name (ARN) of the newly created configuration set.
  final String? configurationSetArn;

  /// The name of the new configuration set.
  final String? configurationSetName;

  /// The time when the configuration set was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// An array of key and value pair tags that's associated with the configuration
  /// set.
  final List<Tag>? tags;

  CreateConfigurationSetResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.createdTimestamp,
    this.tags,
  });

  factory CreateConfigurationSetResult.fromJson(Map<String, dynamic> json) {
    return CreateConfigurationSetResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final createdTimestamp = this.createdTimestamp;
    final tags = this.tags;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateEventDestinationResult {
  /// The ARN of the configuration set.
  final String? configurationSetArn;

  /// The name of the configuration set.
  final String? configurationSetName;

  /// The details of the destination where events are logged.
  final EventDestination? eventDestination;

  CreateEventDestinationResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.eventDestination,
  });

  factory CreateEventDestinationResult.fromJson(Map<String, dynamic> json) {
    return CreateEventDestinationResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      eventDestination: json['EventDestination'] != null
          ? EventDestination.fromJson(
              json['EventDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final eventDestination = this.eventDestination;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (eventDestination != null) 'EventDestination': eventDestination,
    };
  }
}

class CreateOptOutListResult {
  /// The time when the pool was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The Amazon Resource Name (ARN) for the OptOutList.
  final String? optOutListArn;

  /// The name of the new OptOutList.
  final String? optOutListName;

  /// An array of tags (key and value pairs) associated with the new OptOutList.
  final List<Tag>? tags;

  CreateOptOutListResult({
    this.createdTimestamp,
    this.optOutListArn,
    this.optOutListName,
    this.tags,
  });

  factory CreateOptOutListResult.fromJson(Map<String, dynamic> json) {
    return CreateOptOutListResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      optOutListArn: json['OptOutListArn'] as String?,
      optOutListName: json['OptOutListName'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final optOutListArn = this.optOutListArn;
    final optOutListName = this.optOutListName;
    final tags = this.tags;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (optOutListArn != null) 'OptOutListArn': optOutListArn,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreatePoolResult {
  /// The time when the pool was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// When set to true deletion protection is enabled. By default this is set to
  /// false.
  final bool? deletionProtectionEnabled;

  /// The type of message for the pool to use.
  final MessageType? messageType;

  /// The name of the OptOutList associated with the pool.
  final String? optOutListName;

  /// The Amazon Resource Name (ARN) for the pool.
  final String? poolArn;

  /// The unique identifier for the pool.
  final String? poolId;

  /// By default this is set to false. When an end recipient sends a message that
  /// begins with HELP or STOP to one of your dedicated numbers, Amazon Pinpoint
  /// automatically replies with a customizable message and adds the end recipient
  /// to the OptOutList. When set to true you're responsible for responding to
  /// HELP and STOP requests. You're also responsible for tracking and honoring
  /// opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// Indicates whether shared routes are enabled for the pool.
  final bool? sharedRoutesEnabled;

  /// The current status of the pool.
  ///
  /// <ul>
  /// <li>
  /// CREATING: The pool is currently being created and isn't yet available for
  /// use.
  /// </li>
  /// <li>
  /// ACTIVE: The pool is active and available for use.
  /// </li>
  /// <li>
  /// DELETING: The pool is being deleted.
  /// </li>
  /// </ul>
  final PoolStatus? status;

  /// An array of tags (key and value pairs) associated with the pool.
  final List<Tag>? tags;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  CreatePoolResult({
    this.createdTimestamp,
    this.deletionProtectionEnabled,
    this.messageType,
    this.optOutListName,
    this.poolArn,
    this.poolId,
    this.selfManagedOptOutsEnabled,
    this.sharedRoutesEnabled,
    this.status,
    this.tags,
    this.twoWayChannelArn,
    this.twoWayEnabled,
  });

  factory CreatePoolResult.fromJson(Map<String, dynamic> json) {
    return CreatePoolResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      optOutListName: json['OptOutListName'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool?,
      status: (json['Status'] as String?)?.toPoolStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final messageType = this.messageType;
    final optOutListName = this.optOutListName;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final sharedRoutesEnabled = this.sharedRoutesEnabled;
    final status = this.status;
    final tags = this.tags;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (sharedRoutesEnabled != null)
        'SharedRoutesEnabled': sharedRoutesEnabled,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class DeleteConfigurationSetResult {
  /// The Amazon Resource Name (ARN) of the deleted configuration set.
  final String? configurationSetArn;

  /// The name of the deleted configuration set.
  final String? configurationSetName;

  /// The time that the deleted configuration set was created in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The default message type of the configuration set that was deleted.
  final MessageType? defaultMessageType;

  /// The default Sender ID of the configuration set that was deleted.
  final String? defaultSenderId;

  /// An array of any EventDestination objects that were associated with the
  /// deleted configuration set.
  final List<EventDestination>? eventDestinations;

  DeleteConfigurationSetResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.createdTimestamp,
    this.defaultMessageType,
    this.defaultSenderId,
    this.eventDestinations,
  });

  factory DeleteConfigurationSetResult.fromJson(Map<String, dynamic> json) {
    return DeleteConfigurationSetResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      defaultMessageType:
          (json['DefaultMessageType'] as String?)?.toMessageType(),
      defaultSenderId: json['DefaultSenderId'] as String?,
      eventDestinations: (json['EventDestinations'] as List?)
          ?.whereNotNull()
          .map((e) => EventDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final createdTimestamp = this.createdTimestamp;
    final defaultMessageType = this.defaultMessageType;
    final defaultSenderId = this.defaultSenderId;
    final eventDestinations = this.eventDestinations;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (defaultMessageType != null)
        'DefaultMessageType': defaultMessageType.toValue(),
      if (defaultSenderId != null) 'DefaultSenderId': defaultSenderId,
      if (eventDestinations != null) 'EventDestinations': eventDestinations,
    };
  }
}

class DeleteDefaultMessageTypeResult {
  /// The Amazon Resource Name (ARN) of the configuration set.
  final String? configurationSetArn;

  /// The name of the configuration set.
  final String? configurationSetName;

  /// The current message type for the configuration set.
  final MessageType? messageType;

  DeleteDefaultMessageTypeResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.messageType,
  });

  factory DeleteDefaultMessageTypeResult.fromJson(Map<String, dynamic> json) {
    return DeleteDefaultMessageTypeResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final messageType = this.messageType;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (messageType != null) 'MessageType': messageType.toValue(),
    };
  }
}

class DeleteDefaultSenderIdResult {
  /// The Amazon Resource Name (ARN) of the configuration set.
  final String? configurationSetArn;

  /// The name of the configuration set.
  final String? configurationSetName;

  /// The current sender ID for the configuration set.
  final String? senderId;

  DeleteDefaultSenderIdResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.senderId,
  });

  factory DeleteDefaultSenderIdResult.fromJson(Map<String, dynamic> json) {
    return DeleteDefaultSenderIdResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      senderId: json['SenderId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final senderId = this.senderId;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (senderId != null) 'SenderId': senderId,
    };
  }
}

class DeleteEventDestinationResult {
  /// The Amazon Resource Name (ARN) of the configuration set.
  final String? configurationSetArn;

  /// The name of the configuration set the event destination was deleted from.
  final String? configurationSetName;

  /// The event destination object that was deleted.
  final EventDestination? eventDestination;

  DeleteEventDestinationResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.eventDestination,
  });

  factory DeleteEventDestinationResult.fromJson(Map<String, dynamic> json) {
    return DeleteEventDestinationResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      eventDestination: json['EventDestination'] != null
          ? EventDestination.fromJson(
              json['EventDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final eventDestination = this.eventDestination;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (eventDestination != null) 'EventDestination': eventDestination,
    };
  }
}

class DeleteKeywordResult {
  /// The keyword that was deleted.
  final String? keyword;

  /// The action that was associated with the deleted keyword.
  final KeywordAction? keywordAction;

  /// The message that was associated with the deleted keyword.
  final String? keywordMessage;

  /// The PhoneNumberId or PoolId that the keyword was associated with.
  final String? originationIdentity;

  /// The PhoneNumberArn or PoolArn that the keyword was associated with.
  final String? originationIdentityArn;

  DeleteKeywordResult({
    this.keyword,
    this.keywordAction,
    this.keywordMessage,
    this.originationIdentity,
    this.originationIdentityArn,
  });

  factory DeleteKeywordResult.fromJson(Map<String, dynamic> json) {
    return DeleteKeywordResult(
      keyword: json['Keyword'] as String?,
      keywordAction: (json['KeywordAction'] as String?)?.toKeywordAction(),
      keywordMessage: json['KeywordMessage'] as String?,
      originationIdentity: json['OriginationIdentity'] as String?,
      originationIdentityArn: json['OriginationIdentityArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyword = this.keyword;
    final keywordAction = this.keywordAction;
    final keywordMessage = this.keywordMessage;
    final originationIdentity = this.originationIdentity;
    final originationIdentityArn = this.originationIdentityArn;
    return {
      if (keyword != null) 'Keyword': keyword,
      if (keywordAction != null) 'KeywordAction': keywordAction.toValue(),
      if (keywordMessage != null) 'KeywordMessage': keywordMessage,
      if (originationIdentity != null)
        'OriginationIdentity': originationIdentity,
      if (originationIdentityArn != null)
        'OriginationIdentityArn': originationIdentityArn,
    };
  }
}

class DeleteOptOutListResult {
  /// The time when the OptOutList was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The Amazon Resource Name (ARN) of the OptOutList that was removed.
  final String? optOutListArn;

  /// The name of the OptOutList that was removed.
  final String? optOutListName;

  DeleteOptOutListResult({
    this.createdTimestamp,
    this.optOutListArn,
    this.optOutListName,
  });

  factory DeleteOptOutListResult.fromJson(Map<String, dynamic> json) {
    return DeleteOptOutListResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      optOutListArn: json['OptOutListArn'] as String?,
      optOutListName: json['OptOutListName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final optOutListArn = this.optOutListArn;
    final optOutListName = this.optOutListName;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (optOutListArn != null) 'OptOutListArn': optOutListArn,
      if (optOutListName != null) 'OptOutListName': optOutListName,
    };
  }
}

class DeleteOptedOutNumberResult {
  /// This is true if it was the end user who requested their phone number be
  /// removed.
  final bool? endUserOptedOut;

  /// The OptOutListArn that the phone number was removed from.
  final String? optOutListArn;

  /// The OptOutListName that the phone number was removed from.
  final String? optOutListName;

  /// The phone number that was removed from the OptOutList.
  final String? optedOutNumber;

  /// The time that the number was removed at, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? optedOutTimestamp;

  DeleteOptedOutNumberResult({
    this.endUserOptedOut,
    this.optOutListArn,
    this.optOutListName,
    this.optedOutNumber,
    this.optedOutTimestamp,
  });

  factory DeleteOptedOutNumberResult.fromJson(Map<String, dynamic> json) {
    return DeleteOptedOutNumberResult(
      endUserOptedOut: json['EndUserOptedOut'] as bool?,
      optOutListArn: json['OptOutListArn'] as String?,
      optOutListName: json['OptOutListName'] as String?,
      optedOutNumber: json['OptedOutNumber'] as String?,
      optedOutTimestamp: timeStampFromJson(json['OptedOutTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final endUserOptedOut = this.endUserOptedOut;
    final optOutListArn = this.optOutListArn;
    final optOutListName = this.optOutListName;
    final optedOutNumber = this.optedOutNumber;
    final optedOutTimestamp = this.optedOutTimestamp;
    return {
      if (endUserOptedOut != null) 'EndUserOptedOut': endUserOptedOut,
      if (optOutListArn != null) 'OptOutListArn': optOutListArn,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (optedOutNumber != null) 'OptedOutNumber': optedOutNumber,
      if (optedOutTimestamp != null)
        'OptedOutTimestamp': unixTimestampToJson(optedOutTimestamp),
    };
  }
}

class DeletePoolResult {
  /// The time when the pool was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The message type that was associated with the deleted pool.
  final MessageType? messageType;

  /// The name of the OptOutList that was associated with the deleted pool.
  final String? optOutListName;

  /// The Amazon Resource Name (ARN) of the pool that was deleted.
  final String? poolArn;

  /// The PoolId of the pool that was deleted.
  final String? poolId;

  /// By default this is set to false. When an end recipient sends a message that
  /// begins with HELP or STOP to one of your dedicated numbers, Amazon Pinpoint
  /// automatically replies with a customizable message and adds the end recipient
  /// to the OptOutList. When set to true you're responsible for responding to
  /// HELP and STOP requests. You're also responsible for tracking and honoring
  /// opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// Indicates whether shared routes are enabled for the pool.
  final bool? sharedRoutesEnabled;

  /// The current status of the pool.
  ///
  /// <ul>
  /// <li>
  /// CREATING: The pool is currently being created and isn't yet available for
  /// use.
  /// </li>
  /// <li>
  /// ACTIVE: The pool is active and available for use.
  /// </li>
  /// <li>
  /// DELETING: The pool is being deleted.
  /// </li>
  /// </ul>
  final PoolStatus? status;

  /// The Amazon Resource Name (ARN) of the TwoWayChannel.
  final String? twoWayChannelArn;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  DeletePoolResult({
    this.createdTimestamp,
    this.messageType,
    this.optOutListName,
    this.poolArn,
    this.poolId,
    this.selfManagedOptOutsEnabled,
    this.sharedRoutesEnabled,
    this.status,
    this.twoWayChannelArn,
    this.twoWayEnabled,
  });

  factory DeletePoolResult.fromJson(Map<String, dynamic> json) {
    return DeletePoolResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      optOutListName: json['OptOutListName'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool?,
      status: (json['Status'] as String?)?.toPoolStatus(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final messageType = this.messageType;
    final optOutListName = this.optOutListName;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final sharedRoutesEnabled = this.sharedRoutesEnabled;
    final status = this.status;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (sharedRoutesEnabled != null)
        'SharedRoutesEnabled': sharedRoutesEnabled,
      if (status != null) 'Status': status.toValue(),
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class DeleteTextMessageSpendLimitOverrideResult {
  /// The current monthly limit, in US dollars.
  final int? monthlyLimit;

  DeleteTextMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory DeleteTextMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteTextMessageSpendLimitOverrideResult(
      monthlyLimit: json['MonthlyLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final monthlyLimit = this.monthlyLimit;
    return {
      if (monthlyLimit != null) 'MonthlyLimit': monthlyLimit,
    };
  }
}

class DeleteVoiceMessageSpendLimitOverrideResult {
  /// The current monthly limit, in US dollars.
  final int? monthlyLimit;

  DeleteVoiceMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory DeleteVoiceMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return DeleteVoiceMessageSpendLimitOverrideResult(
      monthlyLimit: json['MonthlyLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final monthlyLimit = this.monthlyLimit;
    return {
      if (monthlyLimit != null) 'MonthlyLimit': monthlyLimit,
    };
  }
}

class DescribeAccountAttributesResult {
  /// An array of AccountAttributes objects.
  final List<AccountAttribute>? accountAttributes;

  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  DescribeAccountAttributesResult({
    this.accountAttributes,
    this.nextToken,
  });

  factory DescribeAccountAttributesResult.fromJson(Map<String, dynamic> json) {
    return DescribeAccountAttributesResult(
      accountAttributes: (json['AccountAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => AccountAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAttributes = this.accountAttributes;
    final nextToken = this.nextToken;
    return {
      if (accountAttributes != null) 'AccountAttributes': accountAttributes,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAccountLimitsResult {
  /// An array of AccountLimit objects that show the current spend limits.
  final List<AccountLimit>? accountLimits;

  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  DescribeAccountLimitsResult({
    this.accountLimits,
    this.nextToken,
  });

  factory DescribeAccountLimitsResult.fromJson(Map<String, dynamic> json) {
    return DescribeAccountLimitsResult(
      accountLimits: (json['AccountLimits'] as List?)
          ?.whereNotNull()
          .map((e) => AccountLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLimits = this.accountLimits;
    final nextToken = this.nextToken;
    return {
      if (accountLimits != null) 'AccountLimits': accountLimits,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeConfigurationSetsResult {
  /// An array of ConfigurationSets objects.
  final List<ConfigurationSetInformation>? configurationSets;

  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  DescribeConfigurationSetsResult({
    this.configurationSets,
    this.nextToken,
  });

  factory DescribeConfigurationSetsResult.fromJson(Map<String, dynamic> json) {
    return DescribeConfigurationSetsResult(
      configurationSets: (json['ConfigurationSets'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ConfigurationSetInformation.fromJson(e as Map<String, dynamic>))
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

class DescribeKeywordsResult {
  /// An array of KeywordInformation objects that contain the results.
  final List<KeywordInformation>? keywords;

  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// The PhoneNumberId or PoolId that is associated with the OriginationIdentity.
  final String? originationIdentity;

  /// The PhoneNumberArn or PoolArn that is associated with the
  /// OriginationIdentity.
  final String? originationIdentityArn;

  DescribeKeywordsResult({
    this.keywords,
    this.nextToken,
    this.originationIdentity,
    this.originationIdentityArn,
  });

  factory DescribeKeywordsResult.fromJson(Map<String, dynamic> json) {
    return DescribeKeywordsResult(
      keywords: (json['Keywords'] as List?)
          ?.whereNotNull()
          .map((e) => KeywordInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      originationIdentity: json['OriginationIdentity'] as String?,
      originationIdentityArn: json['OriginationIdentityArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keywords = this.keywords;
    final nextToken = this.nextToken;
    final originationIdentity = this.originationIdentity;
    final originationIdentityArn = this.originationIdentityArn;
    return {
      if (keywords != null) 'Keywords': keywords,
      if (nextToken != null) 'NextToken': nextToken,
      if (originationIdentity != null)
        'OriginationIdentity': originationIdentity,
      if (originationIdentityArn != null)
        'OriginationIdentityArn': originationIdentityArn,
    };
  }
}

class DescribeOptOutListsResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of OptOutListInformation objects that contain the details for the
  /// requested OptOutLists.
  final List<OptOutListInformation>? optOutLists;

  DescribeOptOutListsResult({
    this.nextToken,
    this.optOutLists,
  });

  factory DescribeOptOutListsResult.fromJson(Map<String, dynamic> json) {
    return DescribeOptOutListsResult(
      nextToken: json['NextToken'] as String?,
      optOutLists: (json['OptOutLists'] as List?)
          ?.whereNotNull()
          .map((e) => OptOutListInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final optOutLists = this.optOutLists;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (optOutLists != null) 'OptOutLists': optOutLists,
    };
  }
}

class DescribeOptedOutNumbersResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// The Amazon Resource Name (ARN) of the OptOutList.
  final String? optOutListArn;

  /// The name of the OptOutList.
  final String? optOutListName;

  /// An array of OptedOutNumbersInformation objects that provide information
  /// about the requested OptedOutNumbers.
  final List<OptedOutNumberInformation>? optedOutNumbers;

  DescribeOptedOutNumbersResult({
    this.nextToken,
    this.optOutListArn,
    this.optOutListName,
    this.optedOutNumbers,
  });

  factory DescribeOptedOutNumbersResult.fromJson(Map<String, dynamic> json) {
    return DescribeOptedOutNumbersResult(
      nextToken: json['NextToken'] as String?,
      optOutListArn: json['OptOutListArn'] as String?,
      optOutListName: json['OptOutListName'] as String?,
      optedOutNumbers: (json['OptedOutNumbers'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OptedOutNumberInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final optOutListArn = this.optOutListArn;
    final optOutListName = this.optOutListName;
    final optedOutNumbers = this.optedOutNumbers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (optOutListArn != null) 'OptOutListArn': optOutListArn,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (optedOutNumbers != null) 'OptedOutNumbers': optedOutNumbers,
    };
  }
}

class DescribePhoneNumbersResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of PhoneNumberInformation objects that contain the details for the
  /// requested phone numbers.
  final List<PhoneNumberInformation>? phoneNumbers;

  DescribePhoneNumbersResult({
    this.nextToken,
    this.phoneNumbers,
  });

  factory DescribePhoneNumbersResult.fromJson(Map<String, dynamic> json) {
    return DescribePhoneNumbersResult(
      nextToken: json['NextToken'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map(
              (e) => PhoneNumberInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final phoneNumbers = this.phoneNumbers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
    };
  }
}

class DescribePoolsResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of PoolInformation objects that contain the details for the
  /// requested pools.
  final List<PoolInformation>? pools;

  DescribePoolsResult({
    this.nextToken,
    this.pools,
  });

  factory DescribePoolsResult.fromJson(Map<String, dynamic> json) {
    return DescribePoolsResult(
      nextToken: json['NextToken'] as String?,
      pools: (json['Pools'] as List?)
          ?.whereNotNull()
          .map((e) => PoolInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pools = this.pools;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (pools != null) 'Pools': pools,
    };
  }
}

class DescribeSenderIdsResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of SernderIdInformation objects that contain the details for the
  /// requested SenderIds.
  final List<SenderIdInformation>? senderIds;

  DescribeSenderIdsResult({
    this.nextToken,
    this.senderIds,
  });

  factory DescribeSenderIdsResult.fromJson(Map<String, dynamic> json) {
    return DescribeSenderIdsResult(
      nextToken: json['NextToken'] as String?,
      senderIds: (json['SenderIds'] as List?)
          ?.whereNotNull()
          .map((e) => SenderIdInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final senderIds = this.senderIds;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (senderIds != null) 'SenderIds': senderIds,
    };
  }
}

class DescribeSpendLimitsResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of SpendLimit objects that contain the details for the requested
  /// spend limits.
  final List<SpendLimit>? spendLimits;

  DescribeSpendLimitsResult({
    this.nextToken,
    this.spendLimits,
  });

  factory DescribeSpendLimitsResult.fromJson(Map<String, dynamic> json) {
    return DescribeSpendLimitsResult(
      nextToken: json['NextToken'] as String?,
      spendLimits: (json['SpendLimits'] as List?)
          ?.whereNotNull()
          .map((e) => SpendLimit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final spendLimits = this.spendLimits;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (spendLimits != null) 'SpendLimits': spendLimits,
    };
  }
}

enum DestinationCountryParameterKey {
  inTemplateId,
  inEntityId,
}

extension on DestinationCountryParameterKey {
  String toValue() {
    switch (this) {
      case DestinationCountryParameterKey.inTemplateId:
        return 'IN_TEMPLATE_ID';
      case DestinationCountryParameterKey.inEntityId:
        return 'IN_ENTITY_ID';
    }
  }
}

extension on String {
  DestinationCountryParameterKey toDestinationCountryParameterKey() {
    switch (this) {
      case 'IN_TEMPLATE_ID':
        return DestinationCountryParameterKey.inTemplateId;
      case 'IN_ENTITY_ID':
        return DestinationCountryParameterKey.inEntityId;
    }
    throw Exception(
        '$this is not known in enum DestinationCountryParameterKey');
  }
}

class DisassociateOriginationIdentityResult {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  /// The PhoneNumberId or SenderId of the origination identity.
  final String? originationIdentity;

  /// The PhoneNumberArn or SenderIdArn of the origination identity.
  final String? originationIdentityArn;

  /// The Amazon Resource Name (ARN) of the pool.
  final String? poolArn;

  /// The PoolId of the pool no longer associated with the origination identity.
  final String? poolId;

  DisassociateOriginationIdentityResult({
    this.isoCountryCode,
    this.originationIdentity,
    this.originationIdentityArn,
    this.poolArn,
    this.poolId,
  });

  factory DisassociateOriginationIdentityResult.fromJson(
      Map<String, dynamic> json) {
    return DisassociateOriginationIdentityResult(
      isoCountryCode: json['IsoCountryCode'] as String?,
      originationIdentity: json['OriginationIdentity'] as String?,
      originationIdentityArn: json['OriginationIdentityArn'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final originationIdentity = this.originationIdentity;
    final originationIdentityArn = this.originationIdentityArn;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    return {
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (originationIdentity != null)
        'OriginationIdentity': originationIdentity,
      if (originationIdentityArn != null)
        'OriginationIdentityArn': originationIdentityArn,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
    };
  }
}

/// Contains information about an event destination.
///
/// Event destinations are associated with configuration sets, which enable you
/// to publish message sending events to Amazon CloudWatch, Amazon Kinesis Data
/// Firehose, or Amazon SNS.
class EventDestination {
  /// When set to true events will be logged.
  final bool enabled;

  /// The name of the EventDestination.
  final String eventDestinationName;

  /// An array of event types that determine which events to log.
  final List<EventType> matchingEventTypes;

  /// An object that contains information about an event destination that sends
  /// logging events to Amazon CloudWatch logs.
  final CloudWatchLogsDestination? cloudWatchLogsDestination;

  /// An object that contains information about an event destination for logging
  /// to Amazon Kinesis Data Firehose.
  final KinesisFirehoseDestination? kinesisFirehoseDestination;

  /// An object that contains information about an event destination that sends
  /// logging events to Amazon SNS.
  final SnsDestination? snsDestination;

  EventDestination({
    required this.enabled,
    required this.eventDestinationName,
    required this.matchingEventTypes,
    this.cloudWatchLogsDestination,
    this.kinesisFirehoseDestination,
    this.snsDestination,
  });

  factory EventDestination.fromJson(Map<String, dynamic> json) {
    return EventDestination(
      enabled: json['Enabled'] as bool,
      eventDestinationName: json['EventDestinationName'] as String,
      matchingEventTypes: (json['MatchingEventTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toEventType())
          .toList(),
      cloudWatchLogsDestination: json['CloudWatchLogsDestination'] != null
          ? CloudWatchLogsDestination.fromJson(
              json['CloudWatchLogsDestination'] as Map<String, dynamic>)
          : null,
      kinesisFirehoseDestination: json['KinesisFirehoseDestination'] != null
          ? KinesisFirehoseDestination.fromJson(
              json['KinesisFirehoseDestination'] as Map<String, dynamic>)
          : null,
      snsDestination: json['SnsDestination'] != null
          ? SnsDestination.fromJson(
              json['SnsDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final eventDestinationName = this.eventDestinationName;
    final matchingEventTypes = this.matchingEventTypes;
    final cloudWatchLogsDestination = this.cloudWatchLogsDestination;
    final kinesisFirehoseDestination = this.kinesisFirehoseDestination;
    final snsDestination = this.snsDestination;
    return {
      'Enabled': enabled,
      'EventDestinationName': eventDestinationName,
      'MatchingEventTypes': matchingEventTypes.map((e) => e.toValue()).toList(),
      if (cloudWatchLogsDestination != null)
        'CloudWatchLogsDestination': cloudWatchLogsDestination,
      if (kinesisFirehoseDestination != null)
        'KinesisFirehoseDestination': kinesisFirehoseDestination,
      if (snsDestination != null) 'SnsDestination': snsDestination,
    };
  }
}

enum EventType {
  all,
  textAll,
  textSent,
  textPending,
  textQueued,
  textSuccessful,
  textDelivered,
  textInvalid,
  textInvalidMessage,
  textUnreachable,
  textCarrierUnreachable,
  textBlocked,
  textCarrierBlocked,
  textSpam,
  textUnknown,
  textTtlExpired,
  voiceAll,
  voiceInitiated,
  voiceRinging,
  voiceAnswered,
  voiceCompleted,
  voiceBusy,
  voiceNoAnswer,
  voiceFailed,
  voiceTtlExpired,
}

extension on EventType {
  String toValue() {
    switch (this) {
      case EventType.all:
        return 'ALL';
      case EventType.textAll:
        return 'TEXT_ALL';
      case EventType.textSent:
        return 'TEXT_SENT';
      case EventType.textPending:
        return 'TEXT_PENDING';
      case EventType.textQueued:
        return 'TEXT_QUEUED';
      case EventType.textSuccessful:
        return 'TEXT_SUCCESSFUL';
      case EventType.textDelivered:
        return 'TEXT_DELIVERED';
      case EventType.textInvalid:
        return 'TEXT_INVALID';
      case EventType.textInvalidMessage:
        return 'TEXT_INVALID_MESSAGE';
      case EventType.textUnreachable:
        return 'TEXT_UNREACHABLE';
      case EventType.textCarrierUnreachable:
        return 'TEXT_CARRIER_UNREACHABLE';
      case EventType.textBlocked:
        return 'TEXT_BLOCKED';
      case EventType.textCarrierBlocked:
        return 'TEXT_CARRIER_BLOCKED';
      case EventType.textSpam:
        return 'TEXT_SPAM';
      case EventType.textUnknown:
        return 'TEXT_UNKNOWN';
      case EventType.textTtlExpired:
        return 'TEXT_TTL_EXPIRED';
      case EventType.voiceAll:
        return 'VOICE_ALL';
      case EventType.voiceInitiated:
        return 'VOICE_INITIATED';
      case EventType.voiceRinging:
        return 'VOICE_RINGING';
      case EventType.voiceAnswered:
        return 'VOICE_ANSWERED';
      case EventType.voiceCompleted:
        return 'VOICE_COMPLETED';
      case EventType.voiceBusy:
        return 'VOICE_BUSY';
      case EventType.voiceNoAnswer:
        return 'VOICE_NO_ANSWER';
      case EventType.voiceFailed:
        return 'VOICE_FAILED';
      case EventType.voiceTtlExpired:
        return 'VOICE_TTL_EXPIRED';
    }
  }
}

extension on String {
  EventType toEventType() {
    switch (this) {
      case 'ALL':
        return EventType.all;
      case 'TEXT_ALL':
        return EventType.textAll;
      case 'TEXT_SENT':
        return EventType.textSent;
      case 'TEXT_PENDING':
        return EventType.textPending;
      case 'TEXT_QUEUED':
        return EventType.textQueued;
      case 'TEXT_SUCCESSFUL':
        return EventType.textSuccessful;
      case 'TEXT_DELIVERED':
        return EventType.textDelivered;
      case 'TEXT_INVALID':
        return EventType.textInvalid;
      case 'TEXT_INVALID_MESSAGE':
        return EventType.textInvalidMessage;
      case 'TEXT_UNREACHABLE':
        return EventType.textUnreachable;
      case 'TEXT_CARRIER_UNREACHABLE':
        return EventType.textCarrierUnreachable;
      case 'TEXT_BLOCKED':
        return EventType.textBlocked;
      case 'TEXT_CARRIER_BLOCKED':
        return EventType.textCarrierBlocked;
      case 'TEXT_SPAM':
        return EventType.textSpam;
      case 'TEXT_UNKNOWN':
        return EventType.textUnknown;
      case 'TEXT_TTL_EXPIRED':
        return EventType.textTtlExpired;
      case 'VOICE_ALL':
        return EventType.voiceAll;
      case 'VOICE_INITIATED':
        return EventType.voiceInitiated;
      case 'VOICE_RINGING':
        return EventType.voiceRinging;
      case 'VOICE_ANSWERED':
        return EventType.voiceAnswered;
      case 'VOICE_COMPLETED':
        return EventType.voiceCompleted;
      case 'VOICE_BUSY':
        return EventType.voiceBusy;
      case 'VOICE_NO_ANSWER':
        return EventType.voiceNoAnswer;
      case 'VOICE_FAILED':
        return EventType.voiceFailed;
      case 'VOICE_TTL_EXPIRED':
        return EventType.voiceTtlExpired;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

enum KeywordAction {
  automaticResponse,
  optOut,
  optIn,
}

extension on KeywordAction {
  String toValue() {
    switch (this) {
      case KeywordAction.automaticResponse:
        return 'AUTOMATIC_RESPONSE';
      case KeywordAction.optOut:
        return 'OPT_OUT';
      case KeywordAction.optIn:
        return 'OPT_IN';
    }
  }
}

extension on String {
  KeywordAction toKeywordAction() {
    switch (this) {
      case 'AUTOMATIC_RESPONSE':
        return KeywordAction.automaticResponse;
      case 'OPT_OUT':
        return KeywordAction.optOut;
      case 'OPT_IN':
        return KeywordAction.optIn;
    }
    throw Exception('$this is not known in enum KeywordAction');
  }
}

/// The information for keywords that meet a specified criteria.
class KeywordFilter {
  /// The name of the attribute to filter on.
  final KeywordFilterName name;

  /// An array values to filter for.
  final List<String> values;

  KeywordFilter({
    required this.name,
    required this.values,
  });

  factory KeywordFilter.fromJson(Map<String, dynamic> json) {
    return KeywordFilter(
      name: (json['Name'] as String).toKeywordFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum KeywordFilterName {
  keywordAction,
}

extension on KeywordFilterName {
  String toValue() {
    switch (this) {
      case KeywordFilterName.keywordAction:
        return 'keyword-action';
    }
  }
}

extension on String {
  KeywordFilterName toKeywordFilterName() {
    switch (this) {
      case 'keyword-action':
        return KeywordFilterName.keywordAction;
    }
    throw Exception('$this is not known in enum KeywordFilterName');
  }
}

/// The information for all keywords in a pool.
class KeywordInformation {
  /// The keyword as a string.
  final String keyword;

  /// The action to perform for the keyword.
  final KeywordAction keywordAction;

  /// A custom message that can be used with the keyword.
  final String keywordMessage;

  KeywordInformation({
    required this.keyword,
    required this.keywordAction,
    required this.keywordMessage,
  });

  factory KeywordInformation.fromJson(Map<String, dynamic> json) {
    return KeywordInformation(
      keyword: json['Keyword'] as String,
      keywordAction: (json['KeywordAction'] as String).toKeywordAction(),
      keywordMessage: json['KeywordMessage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final keyword = this.keyword;
    final keywordAction = this.keywordAction;
    final keywordMessage = this.keywordMessage;
    return {
      'Keyword': keyword,
      'KeywordAction': keywordAction.toValue(),
      'KeywordMessage': keywordMessage,
    };
  }
}

/// Contains the delivery stream Amazon Resource Name (ARN), and the ARN of the
/// Identity and Access Management (IAM) role associated with an Kinesis Data
/// Firehose event destination.
///
/// Event destinations, such as Kinesis Data Firehose, are associated with
/// configuration sets, which enable you to publish message sending events.
class KinesisFirehoseDestination {
  /// The Amazon Resource Name (ARN) of the delivery stream.
  final String deliveryStreamArn;

  /// The ARN of an Amazon Identity and Access Management (IAM) role that is able
  /// to write event data to an Amazon Firehose destination.
  final String iamRoleArn;

  KinesisFirehoseDestination({
    required this.deliveryStreamArn,
    required this.iamRoleArn,
  });

  factory KinesisFirehoseDestination.fromJson(Map<String, dynamic> json) {
    return KinesisFirehoseDestination(
      deliveryStreamArn: json['DeliveryStreamArn'] as String,
      iamRoleArn: json['IamRoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deliveryStreamArn = this.deliveryStreamArn;
    final iamRoleArn = this.iamRoleArn;
    return {
      'DeliveryStreamArn': deliveryStreamArn,
      'IamRoleArn': iamRoleArn,
    };
  }
}

class ListPoolOriginationIdentitiesResult {
  /// The token to be used for the next set of paginated results. If this field is
  /// empty then there are no more results.
  final String? nextToken;

  /// An array of any OriginationIdentityMetadata objects.
  final List<OriginationIdentityMetadata>? originationIdentities;

  /// The Amazon Resource Name (ARN) for the pool.
  final String? poolArn;

  /// The unique PoolId of the pool.
  final String? poolId;

  ListPoolOriginationIdentitiesResult({
    this.nextToken,
    this.originationIdentities,
    this.poolArn,
    this.poolId,
  });

  factory ListPoolOriginationIdentitiesResult.fromJson(
      Map<String, dynamic> json) {
    return ListPoolOriginationIdentitiesResult(
      nextToken: json['NextToken'] as String?,
      originationIdentities: (json['OriginationIdentities'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OriginationIdentityMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final originationIdentities = this.originationIdentities;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (originationIdentities != null)
        'OriginationIdentities': originationIdentities,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
    };
  }
}

class ListTagsForResourceResult {
  /// The ARN of the resource.
  final String? resourceArn;

  /// An array of key and value pair tags that are associated with the resource.
  final List<Tag>? tags;

  ListTagsForResourceResult({
    this.resourceArn,
    this.tags,
  });

  factory ListTagsForResourceResult.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResult(
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

enum MessageType {
  transactional,
  promotional,
}

extension on MessageType {
  String toValue() {
    switch (this) {
      case MessageType.transactional:
        return 'TRANSACTIONAL';
      case MessageType.promotional:
        return 'PROMOTIONAL';
    }
  }
}

extension on String {
  MessageType toMessageType() {
    switch (this) {
      case 'TRANSACTIONAL':
        return MessageType.transactional;
      case 'PROMOTIONAL':
        return MessageType.promotional;
    }
    throw Exception('$this is not known in enum MessageType');
  }
}

enum NumberCapability {
  sms,
  voice,
}

extension on NumberCapability {
  String toValue() {
    switch (this) {
      case NumberCapability.sms:
        return 'SMS';
      case NumberCapability.voice:
        return 'VOICE';
    }
  }
}

extension on String {
  NumberCapability toNumberCapability() {
    switch (this) {
      case 'SMS':
        return NumberCapability.sms;
      case 'VOICE':
        return NumberCapability.voice;
    }
    throw Exception('$this is not known in enum NumberCapability');
  }
}

enum NumberStatus {
  pending,
  active,
  associating,
  disassociating,
  deleted,
}

extension on NumberStatus {
  String toValue() {
    switch (this) {
      case NumberStatus.pending:
        return 'PENDING';
      case NumberStatus.active:
        return 'ACTIVE';
      case NumberStatus.associating:
        return 'ASSOCIATING';
      case NumberStatus.disassociating:
        return 'DISASSOCIATING';
      case NumberStatus.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  NumberStatus toNumberStatus() {
    switch (this) {
      case 'PENDING':
        return NumberStatus.pending;
      case 'ACTIVE':
        return NumberStatus.active;
      case 'ASSOCIATING':
        return NumberStatus.associating;
      case 'DISASSOCIATING':
        return NumberStatus.disassociating;
      case 'DELETED':
        return NumberStatus.deleted;
    }
    throw Exception('$this is not known in enum NumberStatus');
  }
}

enum NumberType {
  shortCode,
  longCode,
  tollFree,
  tenDlc,
}

extension on NumberType {
  String toValue() {
    switch (this) {
      case NumberType.shortCode:
        return 'SHORT_CODE';
      case NumberType.longCode:
        return 'LONG_CODE';
      case NumberType.tollFree:
        return 'TOLL_FREE';
      case NumberType.tenDlc:
        return 'TEN_DLC';
    }
  }
}

extension on String {
  NumberType toNumberType() {
    switch (this) {
      case 'SHORT_CODE':
        return NumberType.shortCode;
      case 'LONG_CODE':
        return NumberType.longCode;
      case 'TOLL_FREE':
        return NumberType.tollFree;
      case 'TEN_DLC':
        return NumberType.tenDlc;
    }
    throw Exception('$this is not known in enum NumberType');
  }
}

/// The information for all OptOutList in an Amazon Web Services account.
class OptOutListInformation {
  /// The time when the OutOutList was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// The Amazon Resource Name (ARN) of the OptOutList.
  final String optOutListArn;

  /// The name of the OptOutList.
  final String optOutListName;

  OptOutListInformation({
    required this.createdTimestamp,
    required this.optOutListArn,
    required this.optOutListName,
  });

  factory OptOutListInformation.fromJson(Map<String, dynamic> json) {
    return OptOutListInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      optOutListArn: json['OptOutListArn'] as String,
      optOutListName: json['OptOutListName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final optOutListArn = this.optOutListArn;
    final optOutListName = this.optOutListName;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'OptOutListArn': optOutListArn,
      'OptOutListName': optOutListName,
    };
  }
}

/// The information for opted out numbers that meet a specified criteria.
class OptedOutFilter {
  /// The name of the attribute to filter on.
  final OptedOutFilterName name;

  /// An array of values to filter for.
  final List<String> values;

  OptedOutFilter({
    required this.name,
    required this.values,
  });

  factory OptedOutFilter.fromJson(Map<String, dynamic> json) {
    return OptedOutFilter(
      name: (json['Name'] as String).toOptedOutFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum OptedOutFilterName {
  endUserOptedOut,
}

extension on OptedOutFilterName {
  String toValue() {
    switch (this) {
      case OptedOutFilterName.endUserOptedOut:
        return 'end-user-opted-out';
    }
  }
}

extension on String {
  OptedOutFilterName toOptedOutFilterName() {
    switch (this) {
      case 'end-user-opted-out':
        return OptedOutFilterName.endUserOptedOut;
    }
    throw Exception('$this is not known in enum OptedOutFilterName');
  }
}

/// The information for an opted out number in an Amazon Web Services account.
class OptedOutNumberInformation {
  /// This is set to true if it was the end recipient that opted out.
  final bool endUserOptedOut;

  /// The phone number that is opted out.
  final String optedOutNumber;

  /// The time that the op tout occurred, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime optedOutTimestamp;

  OptedOutNumberInformation({
    required this.endUserOptedOut,
    required this.optedOutNumber,
    required this.optedOutTimestamp,
  });

  factory OptedOutNumberInformation.fromJson(Map<String, dynamic> json) {
    return OptedOutNumberInformation(
      endUserOptedOut: json['EndUserOptedOut'] as bool,
      optedOutNumber: json['OptedOutNumber'] as String,
      optedOutTimestamp:
          nonNullableTimeStampFromJson(json['OptedOutTimestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endUserOptedOut = this.endUserOptedOut;
    final optedOutNumber = this.optedOutNumber;
    final optedOutTimestamp = this.optedOutTimestamp;
    return {
      'EndUserOptedOut': endUserOptedOut,
      'OptedOutNumber': optedOutNumber,
      'OptedOutTimestamp': unixTimestampToJson(optedOutTimestamp),
    };
  }
}

/// The metadata for an origination identity associated with a pool.
class OriginationIdentityMetadata {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// Describes if the origination identity can be used for text messages, voice
  /// calls or both.
  final List<NumberCapability> numberCapabilities;

  /// The unique identifier of the origination identity.
  final String originationIdentity;

  /// The Amazon Resource Name (ARN) associated with the origination identity.
  final String originationIdentityArn;

  OriginationIdentityMetadata({
    required this.isoCountryCode,
    required this.numberCapabilities,
    required this.originationIdentity,
    required this.originationIdentityArn,
  });

  factory OriginationIdentityMetadata.fromJson(Map<String, dynamic> json) {
    return OriginationIdentityMetadata(
      isoCountryCode: json['IsoCountryCode'] as String,
      numberCapabilities: (json['NumberCapabilities'] as List)
          .whereNotNull()
          .map((e) => (e as String).toNumberCapability())
          .toList(),
      originationIdentity: json['OriginationIdentity'] as String,
      originationIdentityArn: json['OriginationIdentityArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final numberCapabilities = this.numberCapabilities;
    final originationIdentity = this.originationIdentity;
    final originationIdentityArn = this.originationIdentityArn;
    return {
      'IsoCountryCode': isoCountryCode,
      'NumberCapabilities': numberCapabilities.map((e) => e.toValue()).toList(),
      'OriginationIdentity': originationIdentity,
      'OriginationIdentityArn': originationIdentityArn,
    };
  }
}

/// The information for a phone number that meets a specified criteria.
class PhoneNumberFilter {
  /// The name of the attribute to filter on.
  final PhoneNumberFilterName name;

  /// An array values to filter for.
  final List<String> values;

  PhoneNumberFilter({
    required this.name,
    required this.values,
  });

  factory PhoneNumberFilter.fromJson(Map<String, dynamic> json) {
    return PhoneNumberFilter(
      name: (json['Name'] as String).toPhoneNumberFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum PhoneNumberFilterName {
  status,
  isoCountryCode,
  messageType,
  numberCapability,
  numberType,
  twoWayEnabled,
  selfManagedOptOutsEnabled,
  optOutListName,
  deletionProtectionEnabled,
}

extension on PhoneNumberFilterName {
  String toValue() {
    switch (this) {
      case PhoneNumberFilterName.status:
        return 'status';
      case PhoneNumberFilterName.isoCountryCode:
        return 'iso-country-code';
      case PhoneNumberFilterName.messageType:
        return 'message-type';
      case PhoneNumberFilterName.numberCapability:
        return 'number-capability';
      case PhoneNumberFilterName.numberType:
        return 'number-type';
      case PhoneNumberFilterName.twoWayEnabled:
        return 'two-way-enabled';
      case PhoneNumberFilterName.selfManagedOptOutsEnabled:
        return 'self-managed-opt-outs-enabled';
      case PhoneNumberFilterName.optOutListName:
        return 'opt-out-list-name';
      case PhoneNumberFilterName.deletionProtectionEnabled:
        return 'deletion-protection-enabled';
    }
  }
}

extension on String {
  PhoneNumberFilterName toPhoneNumberFilterName() {
    switch (this) {
      case 'status':
        return PhoneNumberFilterName.status;
      case 'iso-country-code':
        return PhoneNumberFilterName.isoCountryCode;
      case 'message-type':
        return PhoneNumberFilterName.messageType;
      case 'number-capability':
        return PhoneNumberFilterName.numberCapability;
      case 'number-type':
        return PhoneNumberFilterName.numberType;
      case 'two-way-enabled':
        return PhoneNumberFilterName.twoWayEnabled;
      case 'self-managed-opt-outs-enabled':
        return PhoneNumberFilterName.selfManagedOptOutsEnabled;
      case 'opt-out-list-name':
        return PhoneNumberFilterName.optOutListName;
      case 'deletion-protection-enabled':
        return PhoneNumberFilterName.deletionProtectionEnabled;
    }
    throw Exception('$this is not known in enum PhoneNumberFilterName');
  }
}

/// The information for a phone number in an Amazon Web Services account.
class PhoneNumberInformation {
  /// The time when the phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true the phone number can't be deleted.
  final bool deletionProtectionEnabled;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final MessageType messageType;

  /// The price, in US dollars, to lease the phone number.
  final String monthlyLeasingPrice;

  /// Describes if the origination identity can be used for text messages, voice
  /// calls or both.
  final List<NumberCapability> numberCapabilities;

  /// The type of phone number.
  final NumberType numberType;

  /// The name of the OptOutList associated with the phone number.
  final String optOutListName;

  /// The phone number in E.164 format.
  final String phoneNumber;

  /// The Amazon Resource Name (ARN) associated with the phone number.
  final String phoneNumberArn;

  /// When set to false an end recipient sends a message that begins with HELP or
  /// STOP to one of your dedicated numbers, Amazon Pinpoint automatically replies
  /// with a customizable message and adds the end recipient to the OptOutList.
  /// When set to true you're responsible for responding to HELP and STOP
  /// requests. You're also responsible for tracking and honoring opt-out request.
  /// For more information see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/settings-sms-managing.html#settings-account-sms-self-managed-opt-out">Self-managed
  /// opt-outs</a>
  final bool selfManagedOptOutsEnabled;

  /// The current status of the phone number.
  final NumberStatus status;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients using the TwoWayChannelArn.
  final bool twoWayEnabled;

  /// The unique identifier for the phone number.
  final String? phoneNumberId;

  /// The unique identifier of the pool associated with the phone number.
  final String? poolId;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  PhoneNumberInformation({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.isoCountryCode,
    required this.messageType,
    required this.monthlyLeasingPrice,
    required this.numberCapabilities,
    required this.numberType,
    required this.optOutListName,
    required this.phoneNumber,
    required this.phoneNumberArn,
    required this.selfManagedOptOutsEnabled,
    required this.status,
    required this.twoWayEnabled,
    this.phoneNumberId,
    this.poolId,
    this.twoWayChannelArn,
  });

  factory PhoneNumberInformation.fromJson(Map<String, dynamic> json) {
    return PhoneNumberInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      isoCountryCode: json['IsoCountryCode'] as String,
      messageType: (json['MessageType'] as String).toMessageType(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String,
      numberCapabilities: (json['NumberCapabilities'] as List)
          .whereNotNull()
          .map((e) => (e as String).toNumberCapability())
          .toList(),
      numberType: (json['NumberType'] as String).toNumberType(),
      optOutListName: json['OptOutListName'] as String,
      phoneNumber: json['PhoneNumber'] as String,
      phoneNumberArn: json['PhoneNumberArn'] as String,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool,
      status: (json['Status'] as String).toNumberStatus(),
      twoWayEnabled: json['TwoWayEnabled'] as bool,
      phoneNumberId: json['PhoneNumberId'] as String?,
      poolId: json['PoolId'] as String?,
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final isoCountryCode = this.isoCountryCode;
    final messageType = this.messageType;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final numberCapabilities = this.numberCapabilities;
    final numberType = this.numberType;
    final optOutListName = this.optOutListName;
    final phoneNumber = this.phoneNumber;
    final phoneNumberArn = this.phoneNumberArn;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayEnabled = this.twoWayEnabled;
    final phoneNumberId = this.phoneNumberId;
    final poolId = this.poolId;
    final twoWayChannelArn = this.twoWayChannelArn;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'IsoCountryCode': isoCountryCode,
      'MessageType': messageType.toValue(),
      'MonthlyLeasingPrice': monthlyLeasingPrice,
      'NumberCapabilities': numberCapabilities.map((e) => e.toValue()).toList(),
      'NumberType': numberType.toValue(),
      'OptOutListName': optOutListName,
      'PhoneNumber': phoneNumber,
      'PhoneNumberArn': phoneNumberArn,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'Status': status.toValue(),
      'TwoWayEnabled': twoWayEnabled,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (poolId != null) 'PoolId': poolId,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
    };
  }
}

/// The information for a pool that meets a specified criteria.
class PoolFilter {
  /// The name of the attribute to filter on.
  final PoolFilterName name;

  /// An array values to filter for.
  final List<String> values;

  PoolFilter({
    required this.name,
    required this.values,
  });

  factory PoolFilter.fromJson(Map<String, dynamic> json) {
    return PoolFilter(
      name: (json['Name'] as String).toPoolFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum PoolFilterName {
  status,
  messageType,
  twoWayEnabled,
  selfManagedOptOutsEnabled,
  optOutListName,
  sharedRoutesEnabled,
  deletionProtectionEnabled,
}

extension on PoolFilterName {
  String toValue() {
    switch (this) {
      case PoolFilterName.status:
        return 'status';
      case PoolFilterName.messageType:
        return 'message-type';
      case PoolFilterName.twoWayEnabled:
        return 'two-way-enabled';
      case PoolFilterName.selfManagedOptOutsEnabled:
        return 'self-managed-opt-outs-enabled';
      case PoolFilterName.optOutListName:
        return 'opt-out-list-name';
      case PoolFilterName.sharedRoutesEnabled:
        return 'shared-routes-enabled';
      case PoolFilterName.deletionProtectionEnabled:
        return 'deletion-protection-enabled';
    }
  }
}

extension on String {
  PoolFilterName toPoolFilterName() {
    switch (this) {
      case 'status':
        return PoolFilterName.status;
      case 'message-type':
        return PoolFilterName.messageType;
      case 'two-way-enabled':
        return PoolFilterName.twoWayEnabled;
      case 'self-managed-opt-outs-enabled':
        return PoolFilterName.selfManagedOptOutsEnabled;
      case 'opt-out-list-name':
        return PoolFilterName.optOutListName;
      case 'shared-routes-enabled':
        return PoolFilterName.sharedRoutesEnabled;
      case 'deletion-protection-enabled':
        return PoolFilterName.deletionProtectionEnabled;
    }
    throw Exception('$this is not known in enum PoolFilterName');
  }
}

/// The information for a pool in an Amazon Web Services account.
class PoolInformation {
  /// The time when the pool was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime createdTimestamp;

  /// When set to true the pool can't be deleted.
  final bool deletionProtectionEnabled;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final MessageType messageType;

  /// The name of the OptOutList associated with the pool.
  final String optOutListName;

  /// The Amazon Resource Name (ARN) for the pool.
  final String poolArn;

  /// The unique identifier for the pool.
  final String poolId;

  /// When set to false, an end recipient sends a message that begins with HELP or
  /// STOP to one of your dedicated numbers, Amazon Pinpoint automatically replies
  /// with a customizable message and adds the end recipient to the OptOutList.
  /// When set to true you're responsible for responding to HELP and STOP
  /// requests. You're also responsible for tracking and honoring opt-out
  /// requests. For more information see <a
  /// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/settings-sms-managing.html#settings-account-sms-self-managed-opt-out">Self-managed
  /// opt-outs</a>
  final bool selfManagedOptOutsEnabled;

  /// Allows you to enable shared routes on your pool.
  ///
  /// By default, this is set to <code>False</code>. If you set this value to
  /// <code>True</code>, your messages are sent using phone numbers or sender IDs
  /// (depending on the country) that are shared with other Amazon Pinpoint users.
  /// In some countries, such as the United States, senders aren't allowed to use
  /// shared routes and must use a dedicated phone number or short code.
  final bool sharedRoutesEnabled;

  /// The current status of the pool.
  final PoolStatus status;

  /// When set to true you can receive incoming text messages from your end
  /// recipients using the TwoWayChannelArn.
  final bool twoWayEnabled;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  PoolInformation({
    required this.createdTimestamp,
    required this.deletionProtectionEnabled,
    required this.messageType,
    required this.optOutListName,
    required this.poolArn,
    required this.poolId,
    required this.selfManagedOptOutsEnabled,
    required this.sharedRoutesEnabled,
    required this.status,
    required this.twoWayEnabled,
    this.twoWayChannelArn,
  });

  factory PoolInformation.fromJson(Map<String, dynamic> json) {
    return PoolInformation(
      createdTimestamp:
          nonNullableTimeStampFromJson(json['CreatedTimestamp'] as Object),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool,
      messageType: (json['MessageType'] as String).toMessageType(),
      optOutListName: json['OptOutListName'] as String,
      poolArn: json['PoolArn'] as String,
      poolId: json['PoolId'] as String,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool,
      status: (json['Status'] as String).toPoolStatus(),
      twoWayEnabled: json['TwoWayEnabled'] as bool,
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final messageType = this.messageType;
    final optOutListName = this.optOutListName;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final sharedRoutesEnabled = this.sharedRoutesEnabled;
    final status = this.status;
    final twoWayEnabled = this.twoWayEnabled;
    final twoWayChannelArn = this.twoWayChannelArn;
    return {
      'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      'DeletionProtectionEnabled': deletionProtectionEnabled,
      'MessageType': messageType.toValue(),
      'OptOutListName': optOutListName,
      'PoolArn': poolArn,
      'PoolId': poolId,
      'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      'SharedRoutesEnabled': sharedRoutesEnabled,
      'Status': status.toValue(),
      'TwoWayEnabled': twoWayEnabled,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
    };
  }
}

/// Information about origination identities associated with a pool that meets a
/// specified criteria.
class PoolOriginationIdentitiesFilter {
  /// The name of the attribute to filter on.
  final PoolOriginationIdentitiesFilterName name;

  /// An array values to filter for.
  final List<String> values;

  PoolOriginationIdentitiesFilter({
    required this.name,
    required this.values,
  });

  factory PoolOriginationIdentitiesFilter.fromJson(Map<String, dynamic> json) {
    return PoolOriginationIdentitiesFilter(
      name: (json['Name'] as String).toPoolOriginationIdentitiesFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum PoolOriginationIdentitiesFilterName {
  isoCountryCode,
  numberCapability,
}

extension on PoolOriginationIdentitiesFilterName {
  String toValue() {
    switch (this) {
      case PoolOriginationIdentitiesFilterName.isoCountryCode:
        return 'iso-country-code';
      case PoolOriginationIdentitiesFilterName.numberCapability:
        return 'number-capability';
    }
  }
}

extension on String {
  PoolOriginationIdentitiesFilterName toPoolOriginationIdentitiesFilterName() {
    switch (this) {
      case 'iso-country-code':
        return PoolOriginationIdentitiesFilterName.isoCountryCode;
      case 'number-capability':
        return PoolOriginationIdentitiesFilterName.numberCapability;
    }
    throw Exception(
        '$this is not known in enum PoolOriginationIdentitiesFilterName');
  }
}

enum PoolStatus {
  creating,
  active,
  deleting,
}

extension on PoolStatus {
  String toValue() {
    switch (this) {
      case PoolStatus.creating:
        return 'CREATING';
      case PoolStatus.active:
        return 'ACTIVE';
      case PoolStatus.deleting:
        return 'DELETING';
    }
  }
}

extension on String {
  PoolStatus toPoolStatus() {
    switch (this) {
      case 'CREATING':
        return PoolStatus.creating;
      case 'ACTIVE':
        return PoolStatus.active;
      case 'DELETING':
        return PoolStatus.deleting;
    }
    throw Exception('$this is not known in enum PoolStatus');
  }
}

class PutKeywordResult {
  /// The keyword that was added.
  final String? keyword;

  /// The action to perform when the keyword is used.
  final KeywordAction? keywordAction;

  /// The message associated with the keyword.
  final String? keywordMessage;

  /// The PhoneNumberId or PoolId that the keyword was associated with.
  final String? originationIdentity;

  /// The PhoneNumberArn or PoolArn that the keyword was associated with.
  final String? originationIdentityArn;

  PutKeywordResult({
    this.keyword,
    this.keywordAction,
    this.keywordMessage,
    this.originationIdentity,
    this.originationIdentityArn,
  });

  factory PutKeywordResult.fromJson(Map<String, dynamic> json) {
    return PutKeywordResult(
      keyword: json['Keyword'] as String?,
      keywordAction: (json['KeywordAction'] as String?)?.toKeywordAction(),
      keywordMessage: json['KeywordMessage'] as String?,
      originationIdentity: json['OriginationIdentity'] as String?,
      originationIdentityArn: json['OriginationIdentityArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyword = this.keyword;
    final keywordAction = this.keywordAction;
    final keywordMessage = this.keywordMessage;
    final originationIdentity = this.originationIdentity;
    final originationIdentityArn = this.originationIdentityArn;
    return {
      if (keyword != null) 'Keyword': keyword,
      if (keywordAction != null) 'KeywordAction': keywordAction.toValue(),
      if (keywordMessage != null) 'KeywordMessage': keywordMessage,
      if (originationIdentity != null)
        'OriginationIdentity': originationIdentity,
      if (originationIdentityArn != null)
        'OriginationIdentityArn': originationIdentityArn,
    };
  }
}

class PutOptedOutNumberResult {
  /// This is true if it was the end user who requested their phone number be
  /// removed.
  final bool? endUserOptedOut;

  /// The OptOutListArn that the phone number was removed from.
  final String? optOutListArn;

  /// The OptOutListName that the phone number was removed from.
  final String? optOutListName;

  /// The phone number that was added to the OptOutList.
  final String? optedOutNumber;

  /// The time that the phone number was added to the OptOutList, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? optedOutTimestamp;

  PutOptedOutNumberResult({
    this.endUserOptedOut,
    this.optOutListArn,
    this.optOutListName,
    this.optedOutNumber,
    this.optedOutTimestamp,
  });

  factory PutOptedOutNumberResult.fromJson(Map<String, dynamic> json) {
    return PutOptedOutNumberResult(
      endUserOptedOut: json['EndUserOptedOut'] as bool?,
      optOutListArn: json['OptOutListArn'] as String?,
      optOutListName: json['OptOutListName'] as String?,
      optedOutNumber: json['OptedOutNumber'] as String?,
      optedOutTimestamp: timeStampFromJson(json['OptedOutTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final endUserOptedOut = this.endUserOptedOut;
    final optOutListArn = this.optOutListArn;
    final optOutListName = this.optOutListName;
    final optedOutNumber = this.optedOutNumber;
    final optedOutTimestamp = this.optedOutTimestamp;
    return {
      if (endUserOptedOut != null) 'EndUserOptedOut': endUserOptedOut,
      if (optOutListArn != null) 'OptOutListArn': optOutListArn,
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (optedOutNumber != null) 'OptedOutNumber': optedOutNumber,
      if (optedOutTimestamp != null)
        'OptedOutTimestamp': unixTimestampToJson(optedOutTimestamp),
    };
  }
}

class ReleasePhoneNumberResult {
  /// The time when the phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  /// The message type that was associated with the phone number.
  final MessageType? messageType;

  /// The monthly price of the phone number, in US dollars.
  final String? monthlyLeasingPrice;

  /// Specifies if the number could be used for text messages, voice, or both.
  final List<NumberCapability>? numberCapabilities;

  /// The type of number that was released.
  final NumberType? numberType;

  /// The name of the OptOutList that was associated with the phone number.
  final String? optOutListName;

  /// The phone number that was released.
  final String? phoneNumber;

  /// The PhoneNumberArn of the phone number that was released.
  final String? phoneNumberArn;

  /// The PhoneNumberId of the phone number that was released.
  final String? phoneNumberId;

  /// By default this is set to false. When an end recipient sends a message that
  /// begins with HELP or STOP to one of your dedicated numbers, Amazon Pinpoint
  /// automatically replies with a customizable message and adds the end recipient
  /// to the OptOutList. When set to true you're responsible for responding to
  /// HELP and STOP requests. You're also responsible for tracking and honoring
  /// opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// The current status of the request.
  final NumberStatus? status;

  /// The Amazon Resource Name (ARN) of the TwoWayChannel.
  final String? twoWayChannelArn;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  ReleasePhoneNumberResult({
    this.createdTimestamp,
    this.isoCountryCode,
    this.messageType,
    this.monthlyLeasingPrice,
    this.numberCapabilities,
    this.numberType,
    this.optOutListName,
    this.phoneNumber,
    this.phoneNumberArn,
    this.phoneNumberId,
    this.selfManagedOptOutsEnabled,
    this.status,
    this.twoWayChannelArn,
    this.twoWayEnabled,
  });

  factory ReleasePhoneNumberResult.fromJson(Map<String, dynamic> json) {
    return ReleasePhoneNumberResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      isoCountryCode: json['IsoCountryCode'] as String?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String?,
      numberCapabilities: (json['NumberCapabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toNumberCapability())
          .toList(),
      numberType: (json['NumberType'] as String?)?.toNumberType(),
      optOutListName: json['OptOutListName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      status: (json['Status'] as String?)?.toNumberStatus(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final isoCountryCode = this.isoCountryCode;
    final messageType = this.messageType;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final numberCapabilities = this.numberCapabilities;
    final numberType = this.numberType;
    final optOutListName = this.optOutListName;
    final phoneNumber = this.phoneNumber;
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberId = this.phoneNumberId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (monthlyLeasingPrice != null)
        'MonthlyLeasingPrice': monthlyLeasingPrice,
      if (numberCapabilities != null)
        'NumberCapabilities':
            numberCapabilities.map((e) => e.toValue()).toList(),
      if (numberType != null) 'NumberType': numberType.toValue(),
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (status != null) 'Status': status.toValue(),
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class RequestPhoneNumberResult {
  /// The time when the phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// By default this is set to false. When set to true the phone number can't be
  /// deleted.
  final bool? deletionProtectionEnabled;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final MessageType? messageType;

  /// The monthly price, in US dollars, to lease the phone number.
  final String? monthlyLeasingPrice;

  /// Indicates if the phone number will be used for text messages, voice messages
  /// or both.
  final List<NumberCapability>? numberCapabilities;

  /// The type of number that was released.
  final RequestableNumberType? numberType;

  /// The name of the OptOutList that is associated with the requested phone
  /// number.
  final String? optOutListName;

  /// The new phone number that was requested.
  final String? phoneNumber;

  /// The Amazon Resource Name (ARN) of the requested phone number.
  final String? phoneNumberArn;

  /// The unique identifier of the new phone number.
  final String? phoneNumberId;

  /// The unique identifier of the pool associated with the phone number
  final String? poolId;

  /// By default this is set to false. When an end recipient sends a message that
  /// begins with HELP or STOP to one of your dedicated numbers, Amazon Pinpoint
  /// automatically replies with a customizable message and adds the end recipient
  /// to the OptOutList. When set to true you're responsible for responding to
  /// HELP and STOP requests. You're also responsible for tracking and honoring
  /// opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// The current status of the request.
  final NumberStatus? status;

  /// An array of key and value pair tags that are associated with the phone
  /// number.
  final List<Tag>? tags;

  /// The ARN used to identify the two way channel.
  final String? twoWayChannelArn;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  RequestPhoneNumberResult({
    this.createdTimestamp,
    this.deletionProtectionEnabled,
    this.isoCountryCode,
    this.messageType,
    this.monthlyLeasingPrice,
    this.numberCapabilities,
    this.numberType,
    this.optOutListName,
    this.phoneNumber,
    this.phoneNumberArn,
    this.phoneNumberId,
    this.poolId,
    this.selfManagedOptOutsEnabled,
    this.status,
    this.tags,
    this.twoWayChannelArn,
    this.twoWayEnabled,
  });

  factory RequestPhoneNumberResult.fromJson(Map<String, dynamic> json) {
    return RequestPhoneNumberResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      isoCountryCode: json['IsoCountryCode'] as String?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String?,
      numberCapabilities: (json['NumberCapabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toNumberCapability())
          .toList(),
      numberType: (json['NumberType'] as String?)?.toRequestableNumberType(),
      optOutListName: json['OptOutListName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      poolId: json['PoolId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      status: (json['Status'] as String?)?.toNumberStatus(),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final isoCountryCode = this.isoCountryCode;
    final messageType = this.messageType;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final numberCapabilities = this.numberCapabilities;
    final numberType = this.numberType;
    final optOutListName = this.optOutListName;
    final phoneNumber = this.phoneNumber;
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberId = this.phoneNumberId;
    final poolId = this.poolId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final tags = this.tags;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (monthlyLeasingPrice != null)
        'MonthlyLeasingPrice': monthlyLeasingPrice,
      if (numberCapabilities != null)
        'NumberCapabilities':
            numberCapabilities.map((e) => e.toValue()).toList(),
      if (numberType != null) 'NumberType': numberType.toValue(),
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (poolId != null) 'PoolId': poolId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

enum RequestableNumberType {
  longCode,
  tollFree,
  tenDlc,
}

extension on RequestableNumberType {
  String toValue() {
    switch (this) {
      case RequestableNumberType.longCode:
        return 'LONG_CODE';
      case RequestableNumberType.tollFree:
        return 'TOLL_FREE';
      case RequestableNumberType.tenDlc:
        return 'TEN_DLC';
    }
  }
}

extension on String {
  RequestableNumberType toRequestableNumberType() {
    switch (this) {
      case 'LONG_CODE':
        return RequestableNumberType.longCode;
      case 'TOLL_FREE':
        return RequestableNumberType.tollFree;
      case 'TEN_DLC':
        return RequestableNumberType.tenDlc;
    }
    throw Exception('$this is not known in enum RequestableNumberType');
  }
}

class SendTextMessageResult {
  /// The unique identifier for the message.
  final String? messageId;

  SendTextMessageResult({
    this.messageId,
  });

  factory SendTextMessageResult.fromJson(Map<String, dynamic> json) {
    return SendTextMessageResult(
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

class SendVoiceMessageResult {
  /// The unique identifier for the message.
  final String? messageId;

  SendVoiceMessageResult({
    this.messageId,
  });

  factory SendVoiceMessageResult.fromJson(Map<String, dynamic> json) {
    return SendVoiceMessageResult(
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

/// The alphanumeric sender ID in a specific country that you want to describe.
/// For more information on sender IDs see <a
/// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-awssupport-sender-id.html">Requesting
/// sender IDs for SMS messaging with Amazon Pinpoint </a> in the <i>Amazon
/// Pinpoint User Guide</i>.
class SenderIdAndCountry {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The unique identifier of the sender.
  final String senderId;

  SenderIdAndCountry({
    required this.isoCountryCode,
    required this.senderId,
  });

  factory SenderIdAndCountry.fromJson(Map<String, dynamic> json) {
    return SenderIdAndCountry(
      isoCountryCode: json['IsoCountryCode'] as String,
      senderId: json['SenderId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final senderId = this.senderId;
    return {
      'IsoCountryCode': isoCountryCode,
      'SenderId': senderId,
    };
  }
}

/// The information for a sender ID that meets a specified criteria.
class SenderIdFilter {
  /// The name of the attribute to filter on.
  final SenderIdFilterName name;

  /// An array of values to filter for.
  final List<String> values;

  SenderIdFilter({
    required this.name,
    required this.values,
  });

  factory SenderIdFilter.fromJson(Map<String, dynamic> json) {
    return SenderIdFilter(
      name: (json['Name'] as String).toSenderIdFilterName(),
      values: (json['Values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'Name': name.toValue(),
      'Values': values,
    };
  }
}

enum SenderIdFilterName {
  senderId,
  isoCountryCode,
  messageType,
}

extension on SenderIdFilterName {
  String toValue() {
    switch (this) {
      case SenderIdFilterName.senderId:
        return 'sender-id';
      case SenderIdFilterName.isoCountryCode:
        return 'iso-country-code';
      case SenderIdFilterName.messageType:
        return 'message-type';
    }
  }
}

extension on String {
  SenderIdFilterName toSenderIdFilterName() {
    switch (this) {
      case 'sender-id':
        return SenderIdFilterName.senderId;
      case 'iso-country-code':
        return SenderIdFilterName.isoCountryCode;
      case 'message-type':
        return SenderIdFilterName.messageType;
    }
    throw Exception('$this is not known in enum SenderIdFilterName');
  }
}

/// The information for all SenderIds in an Amazon Web Services account.
class SenderIdInformation {
  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final List<MessageType> messageTypes;

  /// The monthly leasing price, in US dollars.
  final String monthlyLeasingPrice;

  /// The alphanumeric sender ID in a specific country that you'd like to
  /// describe.
  final String senderId;

  /// The Amazon Resource Name (ARN) associated with the SenderId.
  final String senderIdArn;

  SenderIdInformation({
    required this.isoCountryCode,
    required this.messageTypes,
    required this.monthlyLeasingPrice,
    required this.senderId,
    required this.senderIdArn,
  });

  factory SenderIdInformation.fromJson(Map<String, dynamic> json) {
    return SenderIdInformation(
      isoCountryCode: json['IsoCountryCode'] as String,
      messageTypes: (json['MessageTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toMessageType())
          .toList(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String,
      senderId: json['SenderId'] as String,
      senderIdArn: json['SenderIdArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final isoCountryCode = this.isoCountryCode;
    final messageTypes = this.messageTypes;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final senderId = this.senderId;
    final senderIdArn = this.senderIdArn;
    return {
      'IsoCountryCode': isoCountryCode,
      'MessageTypes': messageTypes.map((e) => e.toValue()).toList(),
      'MonthlyLeasingPrice': monthlyLeasingPrice,
      'SenderId': senderId,
      'SenderIdArn': senderIdArn,
    };
  }
}

class SetDefaultMessageTypeResult {
  /// The Amazon Resource Name (ARN) of the updated configuration set.
  final String? configurationSetArn;

  /// The name of the configuration set that was updated.
  final String? configurationSetName;

  /// The new default message type of the configuration set.
  final MessageType? messageType;

  SetDefaultMessageTypeResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.messageType,
  });

  factory SetDefaultMessageTypeResult.fromJson(Map<String, dynamic> json) {
    return SetDefaultMessageTypeResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final messageType = this.messageType;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (messageType != null) 'MessageType': messageType.toValue(),
    };
  }
}

class SetDefaultSenderIdResult {
  /// The Amazon Resource Name (ARN) of the updated configuration set.
  final String? configurationSetArn;

  /// The name of the configuration set that was updated.
  final String? configurationSetName;

  /// The default sender ID to set for the ConfigurationSet.
  final String? senderId;

  SetDefaultSenderIdResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.senderId,
  });

  factory SetDefaultSenderIdResult.fromJson(Map<String, dynamic> json) {
    return SetDefaultSenderIdResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      senderId: json['SenderId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final senderId = this.senderId;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (senderId != null) 'SenderId': senderId,
    };
  }
}

class SetTextMessageSpendLimitOverrideResult {
  /// The current monthly limit to enforce on sending text messages.
  final int? monthlyLimit;

  SetTextMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory SetTextMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return SetTextMessageSpendLimitOverrideResult(
      monthlyLimit: json['MonthlyLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final monthlyLimit = this.monthlyLimit;
    return {
      if (monthlyLimit != null) 'MonthlyLimit': monthlyLimit,
    };
  }
}

class SetVoiceMessageSpendLimitOverrideResult {
  /// The current monthly limit to enforce on sending voice messages.
  final int? monthlyLimit;

  SetVoiceMessageSpendLimitOverrideResult({
    this.monthlyLimit,
  });

  factory SetVoiceMessageSpendLimitOverrideResult.fromJson(
      Map<String, dynamic> json) {
    return SetVoiceMessageSpendLimitOverrideResult(
      monthlyLimit: json['MonthlyLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final monthlyLimit = this.monthlyLimit;
    return {
      if (monthlyLimit != null) 'MonthlyLimit': monthlyLimit,
    };
  }
}

/// An object that defines an Amazon SNS destination for events. You can use
/// Amazon SNS to send notification when certain events occur.
class SnsDestination {
  /// The Amazon Resource Name (ARN) of the Amazon SNS topic that you want to
  /// publish events to.
  final String topicArn;

  SnsDestination({
    required this.topicArn,
  });

  factory SnsDestination.fromJson(Map<String, dynamic> json) {
    return SnsDestination(
      topicArn: json['TopicArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final topicArn = this.topicArn;
    return {
      'TopicArn': topicArn,
    };
  }
}

/// Describes the current Amazon Pinpoint monthly spend limits for sending voice
/// and text messages. For more information on increasing your monthly spend
/// limit, see <a
/// href="https://docs.aws.amazon.com/pinpoint/latest/userguide/channels-sms-awssupport-spend-threshold.html">
/// Requesting increases to your monthly SMS spending quota for Amazon Pinpoint
/// </a> in the <i>Amazon Pinpoint User Guide</i>.
class SpendLimit {
  /// The maximum amount of money, in US dollars, that you want to be able to
  /// spend sending messages each month. This value has to be less than or equal
  /// to the amount in <code>MaxLimit</code>. To use this custom limit,
  /// <code>Overridden</code> must be set to true.
  final int enforcedLimit;

  /// The maximum amount of money that you are able to spend to send messages each
  /// month, in US dollars.
  final int maxLimit;

  /// The name for the SpendLimit.
  final SpendLimitName name;

  /// When set to <code>True</code>, the value that has been specified in the
  /// <code>EnforcedLimit</code> is used to determine the maximum amount in US
  /// dollars that can be spent to send messages each month, in US dollars.
  final bool overridden;

  SpendLimit({
    required this.enforcedLimit,
    required this.maxLimit,
    required this.name,
    required this.overridden,
  });

  factory SpendLimit.fromJson(Map<String, dynamic> json) {
    return SpendLimit(
      enforcedLimit: json['EnforcedLimit'] as int,
      maxLimit: json['MaxLimit'] as int,
      name: (json['Name'] as String).toSpendLimitName(),
      overridden: json['Overridden'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final enforcedLimit = this.enforcedLimit;
    final maxLimit = this.maxLimit;
    final name = this.name;
    final overridden = this.overridden;
    return {
      'EnforcedLimit': enforcedLimit,
      'MaxLimit': maxLimit,
      'Name': name.toValue(),
      'Overridden': overridden,
    };
  }
}

enum SpendLimitName {
  textMessageMonthlySpendLimit,
  voiceMessageMonthlySpendLimit,
}

extension on SpendLimitName {
  String toValue() {
    switch (this) {
      case SpendLimitName.textMessageMonthlySpendLimit:
        return 'TEXT_MESSAGE_MONTHLY_SPEND_LIMIT';
      case SpendLimitName.voiceMessageMonthlySpendLimit:
        return 'VOICE_MESSAGE_MONTHLY_SPEND_LIMIT';
    }
  }
}

extension on String {
  SpendLimitName toSpendLimitName() {
    switch (this) {
      case 'TEXT_MESSAGE_MONTHLY_SPEND_LIMIT':
        return SpendLimitName.textMessageMonthlySpendLimit;
      case 'VOICE_MESSAGE_MONTHLY_SPEND_LIMIT':
        return SpendLimitName.voiceMessageMonthlySpendLimit;
    }
    throw Exception('$this is not known in enum SpendLimitName');
  }
}

/// The list of tags to be added to the specified topic.
class Tag {
  /// The key identifier, or name, of the tag.
  final String key;

  /// The string value associated with the key of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

class TagResourceResult {
  TagResourceResult();

  factory TagResourceResult.fromJson(Map<String, dynamic> _) {
    return TagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UntagResourceResult {
  UntagResourceResult();

  factory UntagResourceResult.fromJson(Map<String, dynamic> _) {
    return UntagResourceResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateEventDestinationResult {
  /// The Amazon Resource Name (ARN) for the ConfigurationSet that was updated.
  final String? configurationSetArn;

  /// The name of the configuration set.
  final String? configurationSetName;

  /// An EventDestination object containing the details of where events will be
  /// logged.
  final EventDestination? eventDestination;

  UpdateEventDestinationResult({
    this.configurationSetArn,
    this.configurationSetName,
    this.eventDestination,
  });

  factory UpdateEventDestinationResult.fromJson(Map<String, dynamic> json) {
    return UpdateEventDestinationResult(
      configurationSetArn: json['ConfigurationSetArn'] as String?,
      configurationSetName: json['ConfigurationSetName'] as String?,
      eventDestination: json['EventDestination'] != null
          ? EventDestination.fromJson(
              json['EventDestination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationSetArn = this.configurationSetArn;
    final configurationSetName = this.configurationSetName;
    final eventDestination = this.eventDestination;
    return {
      if (configurationSetArn != null)
        'ConfigurationSetArn': configurationSetArn,
      if (configurationSetName != null)
        'ConfigurationSetName': configurationSetName,
      if (eventDestination != null) 'EventDestination': eventDestination,
    };
  }
}

class UpdatePhoneNumberResult {
  /// The time when the phone number was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// When set to true the phone number can't be deleted.
  final bool? deletionProtectionEnabled;

  /// The two-character code, in ISO 3166-1 alpha-2 format, for the country or
  /// region.
  final String? isoCountryCode;

  /// The type of message. Valid values are TRANSACTIONAL for messages that are
  /// critical or time-sensitive and PROMOTIONAL for messages that aren't critical
  /// or time-sensitive.
  final MessageType? messageType;

  /// The monthly leasing price of the phone number, in US dollars.
  final String? monthlyLeasingPrice;

  /// Specifies if the number could be used for text messages, voice or both.
  final List<NumberCapability>? numberCapabilities;

  /// The type of number that was requested.
  final NumberType? numberType;

  /// The name of the OptOutList associated with the phone number.
  final String? optOutListName;

  /// The phone number that was updated.
  final String? phoneNumber;

  /// The Amazon Resource Name (ARN) of the updated phone number.
  final String? phoneNumberArn;

  /// The unique identifier of the phone number.
  final String? phoneNumberId;

  /// This is true if self managed opt-out are enabled.
  final bool? selfManagedOptOutsEnabled;

  /// The current status of the request.
  final NumberStatus? status;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  UpdatePhoneNumberResult({
    this.createdTimestamp,
    this.deletionProtectionEnabled,
    this.isoCountryCode,
    this.messageType,
    this.monthlyLeasingPrice,
    this.numberCapabilities,
    this.numberType,
    this.optOutListName,
    this.phoneNumber,
    this.phoneNumberArn,
    this.phoneNumberId,
    this.selfManagedOptOutsEnabled,
    this.status,
    this.twoWayChannelArn,
    this.twoWayEnabled,
  });

  factory UpdatePhoneNumberResult.fromJson(Map<String, dynamic> json) {
    return UpdatePhoneNumberResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      isoCountryCode: json['IsoCountryCode'] as String?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      monthlyLeasingPrice: json['MonthlyLeasingPrice'] as String?,
      numberCapabilities: (json['NumberCapabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toNumberCapability())
          .toList(),
      numberType: (json['NumberType'] as String?)?.toNumberType(),
      optOutListName: json['OptOutListName'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
      phoneNumberArn: json['PhoneNumberArn'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      status: (json['Status'] as String?)?.toNumberStatus(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final isoCountryCode = this.isoCountryCode;
    final messageType = this.messageType;
    final monthlyLeasingPrice = this.monthlyLeasingPrice;
    final numberCapabilities = this.numberCapabilities;
    final numberType = this.numberType;
    final optOutListName = this.optOutListName;
    final phoneNumber = this.phoneNumber;
    final phoneNumberArn = this.phoneNumberArn;
    final phoneNumberId = this.phoneNumberId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final status = this.status;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (isoCountryCode != null) 'IsoCountryCode': isoCountryCode,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (monthlyLeasingPrice != null)
        'MonthlyLeasingPrice': monthlyLeasingPrice,
      if (numberCapabilities != null)
        'NumberCapabilities':
            numberCapabilities.map((e) => e.toValue()).toList(),
      if (numberType != null) 'NumberType': numberType.toValue(),
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (phoneNumberArn != null) 'PhoneNumberArn': phoneNumberArn,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (status != null) 'Status': status.toValue(),
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

class UpdatePoolResult {
  /// The time when the pool was created, in <a
  /// href="https://www.epochconverter.com/">UNIX epoch time</a> format.
  final DateTime? createdTimestamp;

  /// When set to true the pool can't be deleted.
  final bool? deletionProtectionEnabled;

  /// The type of message for the pool to use.
  final MessageType? messageType;

  /// The name of the OptOutList associated with the pool.
  final String? optOutListName;

  /// The ARN of the pool.
  final String? poolArn;

  /// The unique identifier of the pool.
  final String? poolId;

  /// When an end recipient sends a message that begins with HELP or STOP to one
  /// of your dedicated numbers, Amazon Pinpoint automatically replies with a
  /// customizable message and adds the end recipient to the OptOutList. When set
  /// to true you're responsible for responding to HELP and STOP requests. You're
  /// also responsible for tracking and honoring opt-out requests.
  final bool? selfManagedOptOutsEnabled;

  /// Indicates whether shared routes are enabled for the pool.
  final bool? sharedRoutesEnabled;

  /// The current status of the pool update request.
  final PoolStatus? status;

  /// The Amazon Resource Name (ARN) of the two way channel.
  final String? twoWayChannelArn;

  /// By default this is set to false. When set to true you can receive incoming
  /// text messages from your end recipients.
  final bool? twoWayEnabled;

  UpdatePoolResult({
    this.createdTimestamp,
    this.deletionProtectionEnabled,
    this.messageType,
    this.optOutListName,
    this.poolArn,
    this.poolId,
    this.selfManagedOptOutsEnabled,
    this.sharedRoutesEnabled,
    this.status,
    this.twoWayChannelArn,
    this.twoWayEnabled,
  });

  factory UpdatePoolResult.fromJson(Map<String, dynamic> json) {
    return UpdatePoolResult(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionProtectionEnabled: json['DeletionProtectionEnabled'] as bool?,
      messageType: (json['MessageType'] as String?)?.toMessageType(),
      optOutListName: json['OptOutListName'] as String?,
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      selfManagedOptOutsEnabled: json['SelfManagedOptOutsEnabled'] as bool?,
      sharedRoutesEnabled: json['SharedRoutesEnabled'] as bool?,
      status: (json['Status'] as String?)?.toPoolStatus(),
      twoWayChannelArn: json['TwoWayChannelArn'] as String?,
      twoWayEnabled: json['TwoWayEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final deletionProtectionEnabled = this.deletionProtectionEnabled;
    final messageType = this.messageType;
    final optOutListName = this.optOutListName;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    final selfManagedOptOutsEnabled = this.selfManagedOptOutsEnabled;
    final sharedRoutesEnabled = this.sharedRoutesEnabled;
    final status = this.status;
    final twoWayChannelArn = this.twoWayChannelArn;
    final twoWayEnabled = this.twoWayEnabled;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (deletionProtectionEnabled != null)
        'DeletionProtectionEnabled': deletionProtectionEnabled,
      if (messageType != null) 'MessageType': messageType.toValue(),
      if (optOutListName != null) 'OptOutListName': optOutListName,
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (selfManagedOptOutsEnabled != null)
        'SelfManagedOptOutsEnabled': selfManagedOptOutsEnabled,
      if (sharedRoutesEnabled != null)
        'SharedRoutesEnabled': sharedRoutesEnabled,
      if (status != null) 'Status': status.toValue(),
      if (twoWayChannelArn != null) 'TwoWayChannelArn': twoWayChannelArn,
      if (twoWayEnabled != null) 'TwoWayEnabled': twoWayEnabled,
    };
  }
}

enum VoiceId {
  amy,
  astrid,
  bianca,
  brian,
  camila,
  carla,
  carmen,
  celine,
  chantal,
  conchita,
  cristiano,
  dora,
  emma,
  enrique,
  ewa,
  filiz,
  geraint,
  giorgio,
  gwyneth,
  hans,
  ines,
  ivy,
  jacek,
  jan,
  joanna,
  joey,
  justin,
  karl,
  kendra,
  kimberly,
  lea,
  liv,
  lotte,
  lucia,
  lupe,
  mads,
  maja,
  marlene,
  mathieu,
  matthew,
  maxim,
  mia,
  miguel,
  mizuki,
  naja,
  nicole,
  penelope,
  raveena,
  ricardo,
  ruben,
  russell,
  salli,
  seoyeon,
  takumi,
  tatyana,
  vicki,
  vitoria,
  zeina,
  zhiyu,
}

extension on VoiceId {
  String toValue() {
    switch (this) {
      case VoiceId.amy:
        return 'AMY';
      case VoiceId.astrid:
        return 'ASTRID';
      case VoiceId.bianca:
        return 'BIANCA';
      case VoiceId.brian:
        return 'BRIAN';
      case VoiceId.camila:
        return 'CAMILA';
      case VoiceId.carla:
        return 'CARLA';
      case VoiceId.carmen:
        return 'CARMEN';
      case VoiceId.celine:
        return 'CELINE';
      case VoiceId.chantal:
        return 'CHANTAL';
      case VoiceId.conchita:
        return 'CONCHITA';
      case VoiceId.cristiano:
        return 'CRISTIANO';
      case VoiceId.dora:
        return 'DORA';
      case VoiceId.emma:
        return 'EMMA';
      case VoiceId.enrique:
        return 'ENRIQUE';
      case VoiceId.ewa:
        return 'EWA';
      case VoiceId.filiz:
        return 'FILIZ';
      case VoiceId.geraint:
        return 'GERAINT';
      case VoiceId.giorgio:
        return 'GIORGIO';
      case VoiceId.gwyneth:
        return 'GWYNETH';
      case VoiceId.hans:
        return 'HANS';
      case VoiceId.ines:
        return 'INES';
      case VoiceId.ivy:
        return 'IVY';
      case VoiceId.jacek:
        return 'JACEK';
      case VoiceId.jan:
        return 'JAN';
      case VoiceId.joanna:
        return 'JOANNA';
      case VoiceId.joey:
        return 'JOEY';
      case VoiceId.justin:
        return 'JUSTIN';
      case VoiceId.karl:
        return 'KARL';
      case VoiceId.kendra:
        return 'KENDRA';
      case VoiceId.kimberly:
        return 'KIMBERLY';
      case VoiceId.lea:
        return 'LEA';
      case VoiceId.liv:
        return 'LIV';
      case VoiceId.lotte:
        return 'LOTTE';
      case VoiceId.lucia:
        return 'LUCIA';
      case VoiceId.lupe:
        return 'LUPE';
      case VoiceId.mads:
        return 'MADS';
      case VoiceId.maja:
        return 'MAJA';
      case VoiceId.marlene:
        return 'MARLENE';
      case VoiceId.mathieu:
        return 'MATHIEU';
      case VoiceId.matthew:
        return 'MATTHEW';
      case VoiceId.maxim:
        return 'MAXIM';
      case VoiceId.mia:
        return 'MIA';
      case VoiceId.miguel:
        return 'MIGUEL';
      case VoiceId.mizuki:
        return 'MIZUKI';
      case VoiceId.naja:
        return 'NAJA';
      case VoiceId.nicole:
        return 'NICOLE';
      case VoiceId.penelope:
        return 'PENELOPE';
      case VoiceId.raveena:
        return 'RAVEENA';
      case VoiceId.ricardo:
        return 'RICARDO';
      case VoiceId.ruben:
        return 'RUBEN';
      case VoiceId.russell:
        return 'RUSSELL';
      case VoiceId.salli:
        return 'SALLI';
      case VoiceId.seoyeon:
        return 'SEOYEON';
      case VoiceId.takumi:
        return 'TAKUMI';
      case VoiceId.tatyana:
        return 'TATYANA';
      case VoiceId.vicki:
        return 'VICKI';
      case VoiceId.vitoria:
        return 'VITORIA';
      case VoiceId.zeina:
        return 'ZEINA';
      case VoiceId.zhiyu:
        return 'ZHIYU';
    }
  }
}

extension on String {
  VoiceId toVoiceId() {
    switch (this) {
      case 'AMY':
        return VoiceId.amy;
      case 'ASTRID':
        return VoiceId.astrid;
      case 'BIANCA':
        return VoiceId.bianca;
      case 'BRIAN':
        return VoiceId.brian;
      case 'CAMILA':
        return VoiceId.camila;
      case 'CARLA':
        return VoiceId.carla;
      case 'CARMEN':
        return VoiceId.carmen;
      case 'CELINE':
        return VoiceId.celine;
      case 'CHANTAL':
        return VoiceId.chantal;
      case 'CONCHITA':
        return VoiceId.conchita;
      case 'CRISTIANO':
        return VoiceId.cristiano;
      case 'DORA':
        return VoiceId.dora;
      case 'EMMA':
        return VoiceId.emma;
      case 'ENRIQUE':
        return VoiceId.enrique;
      case 'EWA':
        return VoiceId.ewa;
      case 'FILIZ':
        return VoiceId.filiz;
      case 'GERAINT':
        return VoiceId.geraint;
      case 'GIORGIO':
        return VoiceId.giorgio;
      case 'GWYNETH':
        return VoiceId.gwyneth;
      case 'HANS':
        return VoiceId.hans;
      case 'INES':
        return VoiceId.ines;
      case 'IVY':
        return VoiceId.ivy;
      case 'JACEK':
        return VoiceId.jacek;
      case 'JAN':
        return VoiceId.jan;
      case 'JOANNA':
        return VoiceId.joanna;
      case 'JOEY':
        return VoiceId.joey;
      case 'JUSTIN':
        return VoiceId.justin;
      case 'KARL':
        return VoiceId.karl;
      case 'KENDRA':
        return VoiceId.kendra;
      case 'KIMBERLY':
        return VoiceId.kimberly;
      case 'LEA':
        return VoiceId.lea;
      case 'LIV':
        return VoiceId.liv;
      case 'LOTTE':
        return VoiceId.lotte;
      case 'LUCIA':
        return VoiceId.lucia;
      case 'LUPE':
        return VoiceId.lupe;
      case 'MADS':
        return VoiceId.mads;
      case 'MAJA':
        return VoiceId.maja;
      case 'MARLENE':
        return VoiceId.marlene;
      case 'MATHIEU':
        return VoiceId.mathieu;
      case 'MATTHEW':
        return VoiceId.matthew;
      case 'MAXIM':
        return VoiceId.maxim;
      case 'MIA':
        return VoiceId.mia;
      case 'MIGUEL':
        return VoiceId.miguel;
      case 'MIZUKI':
        return VoiceId.mizuki;
      case 'NAJA':
        return VoiceId.naja;
      case 'NICOLE':
        return VoiceId.nicole;
      case 'PENELOPE':
        return VoiceId.penelope;
      case 'RAVEENA':
        return VoiceId.raveena;
      case 'RICARDO':
        return VoiceId.ricardo;
      case 'RUBEN':
        return VoiceId.ruben;
      case 'RUSSELL':
        return VoiceId.russell;
      case 'SALLI':
        return VoiceId.salli;
      case 'SEOYEON':
        return VoiceId.seoyeon;
      case 'TAKUMI':
        return VoiceId.takumi;
      case 'TATYANA':
        return VoiceId.tatyana;
      case 'VICKI':
        return VoiceId.vicki;
      case 'VITORIA':
        return VoiceId.vitoria;
      case 'ZEINA':
        return VoiceId.zeina;
      case 'ZHIYU':
        return VoiceId.zhiyu;
    }
    throw Exception('$this is not known in enum VoiceId');
  }
}

enum VoiceMessageBodyTextType {
  text,
  ssml,
}

extension on VoiceMessageBodyTextType {
  String toValue() {
    switch (this) {
      case VoiceMessageBodyTextType.text:
        return 'TEXT';
      case VoiceMessageBodyTextType.ssml:
        return 'SSML';
    }
  }
}

extension on String {
  VoiceMessageBodyTextType toVoiceMessageBodyTextType() {
    switch (this) {
      case 'TEXT':
        return VoiceMessageBodyTextType.text;
      case 'SSML':
        return VoiceMessageBodyTextType.ssml;
    }
    throw Exception('$this is not known in enum VoiceMessageBodyTextType');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
